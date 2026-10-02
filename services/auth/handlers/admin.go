package handlers

import (
	"database/sql"
	"net/http"
	"time"

	"github.com/gin-gonic/gin"
)

type adminUserResp struct {
	ID            string     `json:"id"`
	Email         string     `json:"email"`
	FullName      string     `json:"full_name"`
	LicenceType   string     `json:"licence_type"`
	IsAdmin       bool       `json:"is_admin"`
	CreatedAt     time.Time  `json:"created_at"`
	PlanCode      *string    `json:"plan_code"`
	PlanName      *string    `json:"plan_name"`
	PlanExpiresAt *time.Time `json:"plan_expires_at"`
}

// ListUsers returns every account with its current plan, for the admin page.
func (h *Handler) ListUsers(c *gin.Context) {
	rows, err := h.db.Query(`
		SELECT u.id, u.email, u.full_name, u.licence_type, u.is_admin, u.created_at,
		       sp.code, sp.name, us.expires_at
		FROM users u
		LEFT JOIN user_subscriptions us ON us.user_id = u.id AND us.status = 'active'
		LEFT JOIN subscription_plans sp ON sp.id = us.plan_id
		ORDER BY u.created_at DESC`)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "internal error"})
		return
	}
	defer rows.Close()

	users := []adminUserResp{}
	for rows.Next() {
		var u adminUserResp
		if err := rows.Scan(&u.ID, &u.Email, &u.FullName, &u.LicenceType, &u.IsAdmin, &u.CreatedAt,
			&u.PlanCode, &u.PlanName, &u.PlanExpiresAt); err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": "internal error"})
			return
		}
		users = append(users, u)
	}
	c.JSON(http.StatusOK, users)
}

type adminUpdateUserReq struct {
	FullName    string `json:"full_name" binding:"required"`
	LicenceType string `json:"licence_type" binding:"required,oneof=B1.1 B1.3 B2 all"`
	IsAdmin     bool   `json:"is_admin"`
}

// AdminUpdateUser lets an admin edit any user's profile, including the
// is_admin flag itself (so admins can promote/demote one another).
func (h *Handler) AdminUpdateUser(c *gin.Context) {
	targetID := c.Param("id")
	var req adminUpdateUserReq
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	// Refuse to let the last admin demote themselves — that would lock
	// everyone out of the admin page with no way back in short of a
	// direct DB edit.
	if !req.IsAdmin && targetID == c.GetString("user_id") {
		var adminCount int
		if err := h.db.QueryRow(`SELECT count(*) FROM users WHERE is_admin = true`).Scan(&adminCount); err == nil && adminCount <= 1 {
			c.JSON(http.StatusConflict, gin.H{"error": "can't remove the last admin — promote someone else first"})
			return
		}
	}

	_, err := h.db.Exec(
		`UPDATE users SET full_name = $1, licence_type = $2, is_admin = $3, updated_at = now() WHERE id = $4`,
		req.FullName, req.LicenceType, req.IsAdmin, targetID,
	)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "internal error"})
		return
	}
	c.JSON(http.StatusOK, gin.H{"ok": true})
}

type adminChangePlanReq struct {
	PlanCode string `json:"plan_code" binding:"required"`
}

// AdminChangePlan lets an admin set any user's plan directly — same
// no-payment-collected mechanics as the self-service version, just not
// restricted to the caller's own account.
func (h *Handler) AdminChangePlan(c *gin.Context) {
	targetID := c.Param("id")
	var req adminChangePlanReq
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	var planID int
	var periodDays sql.NullInt32
	err := h.db.QueryRow(
		`SELECT id, period_days FROM subscription_plans WHERE code = $1 AND active = true`, req.PlanCode,
	).Scan(&planID, &periodDays)
	if err == sql.ErrNoRows {
		c.JSON(http.StatusNotFound, gin.H{"error": "unknown plan"})
		return
	}
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "internal error"})
		return
	}

	res, err := h.db.Exec(`
		UPDATE user_subscriptions
		SET plan_id = $1,
		    started_at = now(),
		    expires_at = CASE WHEN $2::int IS NULL THEN NULL ELSE now() + ($2::int || ' days')::interval END,
		    payment_provider = 'manual',
		    status = 'active',
		    updated_at = now()
		WHERE user_id = $3 AND status = 'active'`,
		planID, periodDays, targetID,
	)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "internal error"})
		return
	}
	if n, _ := res.RowsAffected(); n == 0 {
		if _, err := h.db.Exec(
			`INSERT INTO user_subscriptions (user_id, plan_id, status, payment_provider)
			 VALUES ($1, $2, 'active', 'manual')`,
			targetID, planID,
		); err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": "internal error"})
			return
		}
	}
	c.JSON(http.StatusOK, gin.H{"ok": true})
}

// AdminDeleteUser permanently removes an account. Cascades to their
// subscriptions, progress, and AI session history via FK constraints.
func (h *Handler) AdminDeleteUser(c *gin.Context) {
	targetID := c.Param("id")
	if targetID == c.GetString("user_id") {
		c.JSON(http.StatusConflict, gin.H{"error": "can't delete your own account from the admin page"})
		return
	}
	if _, err := h.db.Exec(`DELETE FROM users WHERE id = $1`, targetID); err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "internal error"})
		return
	}
	c.JSON(http.StatusOK, gin.H{"ok": true})
}
