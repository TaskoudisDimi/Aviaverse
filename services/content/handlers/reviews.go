package handlers

import (
	"database/sql"
	"net/http"

	"github.com/gin-gonic/gin"
)

type reviewResp struct {
	ID        int     `json:"id"`
	UserName  string  `json:"user_name"`
	ModuleID  *int    `json:"module_id"`
	Rating    int     `json:"rating"`
	Comment   *string `json:"comment"`
	CreatedAt string  `json:"created_at"`
}

type reviewSummary struct {
	Reviews []reviewResp `json:"reviews"`
	Average float64      `json:"average"`
	Count   int          `json:"count"`
}

// ListReviews returns reviews for a module (?module_id=X) or, with no
// module_id, the overall platform reviews — newest first, with the average
// rating and total count so the UI can show a summary badge without a
// second round trip.
func (h *Handler) ListReviews(c *gin.Context) {
	moduleIDParam := c.Query("module_id")

	var rows *sql.Rows
	var err error
	if moduleIDParam != "" {
		rows, err = h.db.QueryContext(c.Request.Context(), `
			SELECT r.id, u.full_name, r.module_id, r.rating, r.comment, r.created_at
			FROM reviews r JOIN users u ON u.id = r.user_id
			WHERE r.module_id = $1
			ORDER BY r.created_at DESC`, moduleIDParam)
	} else {
		rows, err = h.db.QueryContext(c.Request.Context(), `
			SELECT r.id, u.full_name, r.module_id, r.rating, r.comment, r.created_at
			FROM reviews r JOIN users u ON u.id = r.user_id
			WHERE r.module_id IS NULL
			ORDER BY r.created_at DESC`)
	}
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}
	defer rows.Close()

	summary := reviewSummary{Reviews: []reviewResp{}}
	var ratingSum int
	for rows.Next() {
		var r reviewResp
		if err := rows.Scan(&r.ID, &r.UserName, &r.ModuleID, &r.Rating, &r.Comment, &r.CreatedAt); err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
			return
		}
		summary.Reviews = append(summary.Reviews, r)
		ratingSum += r.Rating
	}
	summary.Count = len(summary.Reviews)
	if summary.Count > 0 {
		summary.Average = float64(ratingSum) / float64(summary.Count)
	}

	c.JSON(http.StatusOK, summary)
}

type upsertReviewReq struct {
	ModuleID *int   `json:"module_id"`
	Rating   int    `json:"rating" binding:"required,min=1,max=5"`
	Comment  string `json:"comment"`
}

// UpsertReview creates or updates the caller's own review — one per module,
// plus one overall platform review (module_id omitted/null). Re-submitting
// just updates the existing row rather than erroring, so the form can
// double as an "edit my review" action.
func (h *Handler) UpsertReview(c *gin.Context) {
	var req upsertReviewReq
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	userID := c.GetString("user_id")
	comment := sql.NullString{String: req.Comment, Valid: req.Comment != ""}

	var conflictTarget string
	var args []interface{}
	if req.ModuleID != nil {
		conflictTarget = "(user_id, module_id) WHERE module_id IS NOT NULL"
		args = []interface{}{userID, *req.ModuleID, req.Rating, comment}
	} else {
		conflictTarget = "(user_id) WHERE module_id IS NULL"
		args = []interface{}{userID, nil, req.Rating, comment}
	}

	var resp reviewResp
	query := `
		INSERT INTO reviews (user_id, module_id, rating, comment)
		VALUES ($1, $2, $3, $4)
		ON CONFLICT ` + conflictTarget + `
		DO UPDATE SET rating = EXCLUDED.rating, comment = EXCLUDED.comment, updated_at = now()
		RETURNING id, module_id, rating, comment, created_at`

	err := h.db.QueryRowContext(c.Request.Context(), query, args...).
		Scan(&resp.ID, &resp.ModuleID, &resp.Rating, &resp.Comment, &resp.CreatedAt)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	userName := ""
	h.db.QueryRowContext(c.Request.Context(), `SELECT full_name FROM users WHERE id = $1`, userID).Scan(&userName)
	resp.UserName = userName

	c.JSON(http.StatusOK, resp)
}

// MyReview returns the caller's existing review for a module (or the
// overall platform review, with no module_id) so the frontend can
// pre-fill the form with their current rating/comment instead of always
// starting blank.
func (h *Handler) MyReview(c *gin.Context) {
	userID := c.GetString("user_id")
	moduleIDParam := c.Query("module_id")

	var resp reviewResp
	var err error
	if moduleIDParam != "" {
		err = h.db.QueryRowContext(c.Request.Context(), `
			SELECT id, module_id, rating, comment, created_at FROM reviews
			WHERE user_id = $1 AND module_id = $2`, userID, moduleIDParam,
		).Scan(&resp.ID, &resp.ModuleID, &resp.Rating, &resp.Comment, &resp.CreatedAt)
	} else {
		err = h.db.QueryRowContext(c.Request.Context(), `
			SELECT id, module_id, rating, comment, created_at FROM reviews
			WHERE user_id = $1 AND module_id IS NULL`, userID,
		).Scan(&resp.ID, &resp.ModuleID, &resp.Rating, &resp.Comment, &resp.CreatedAt)
	}
	if err == sql.ErrNoRows {
		c.JSON(http.StatusOK, nil)
		return
	}
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}
	c.JSON(http.StatusOK, resp)
}
