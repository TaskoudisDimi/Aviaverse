package handlers

import (
	"context"
	"database/sql"
	"log"
	"net/http"

	"github.com/gin-gonic/gin"
)

type Handler struct {
	db *sql.DB
}

func New(db *sql.DB) *Handler {
	return &Handler{db: db}
}

// ListModules returns all EASA modules, optionally filtered by licence_type.
func (h *Handler) ListModules(c *gin.Context) {
	licenceType := c.Query("licence_type")

	query := `SELECT id, code, title, description, licence_types, sort_order
	          FROM easa_modules`
	args := []interface{}{}
	if licenceType != "" {
		query += ` WHERE $1 = ANY(licence_types)`
		args = append(args, licenceType)
	}
	query += ` ORDER BY sort_order`

	rows, err := h.db.QueryContext(c.Request.Context(), query, args...)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}
	defer rows.Close()

	type Module struct {
		ID           int      `json:"id"`
		Code         string   `json:"code"`
		Title        string   `json:"title"`
		Description  string   `json:"description"`
		LicenceTypes []string `json:"licence_types"`
		SortOrder    int      `json:"sort_order"`
	}

	modules := []Module{}
	for rows.Next() {
		var m Module
		if err := rows.Scan(&m.ID, &m.Code, &m.Title, &m.Description,
			(*stringArray)(&m.LicenceTypes), &m.SortOrder); err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
			return
		}
		modules = append(modules, m)
	}
	c.JSON(http.StatusOK, modules)
}

// GetModule returns a single module with its subjects.
func (h *Handler) GetModule(c *gin.Context) {
	id := c.Param("id")

	type Subject struct {
		ID        int    `json:"id"`
		Code      string `json:"code"`
		Title     string `json:"title"`
		SortOrder int    `json:"sort_order"`
	}
	type Module struct {
		ID           int       `json:"id"`
		Code         string    `json:"code"`
		Title        string    `json:"title"`
		Description  string    `json:"description"`
		LicenceTypes []string  `json:"licence_types"`
		Subjects     []Subject `json:"subjects"`
	}

	var m Module
	err := h.db.QueryRowContext(c.Request.Context(),
		`SELECT id, code, title, description, licence_types FROM easa_modules WHERE id=$1`, id,
	).Scan(&m.ID, &m.Code, &m.Title, &m.Description, (*stringArray)(&m.LicenceTypes))
	if err == sql.ErrNoRows {
		c.JSON(http.StatusNotFound, gin.H{"error": "module not found"})
		return
	}
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	rows, err := h.db.QueryContext(c.Request.Context(),
		`SELECT id, code, title, sort_order FROM easa_subjects WHERE module_id=$1 ORDER BY sort_order`, id)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}
	defer rows.Close()

	m.Subjects = []Subject{}
	for rows.Next() {
		var s Subject
		if err := rows.Scan(&s.ID, &s.Code, &s.Title, &s.SortOrder); err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
			return
		}
		m.Subjects = append(m.Subjects, s)
	}
	c.JSON(http.StatusOK, m)
}

// allowedModuleCodes returns the module codes this user's plan permits
// (nil = unrestricted, all modules). Mirrors the AI service's
// planMessageCap: on error/no-rows, fail open (unrestricted) rather than
// blocking content for what's almost certainly a provisioning hiccup,
// since every account gets a subscription row on registration.
func (h *Handler) allowedModuleCodes(ctx context.Context, userID string) []string {
	var codes stringArray
	err := h.db.QueryRowContext(ctx, `
		SELECT sp.allowed_module_codes
		FROM user_subscriptions us
		JOIN subscription_plans sp ON sp.id = us.plan_id
		WHERE us.user_id = $1
		  AND us.status = 'active'
		  AND (us.expires_at IS NULL OR us.expires_at > now())
		ORDER BY us.started_at DESC
		LIMIT 1`, userID).Scan(&codes)
	if err != nil {
		if err != sql.ErrNoRows {
			log.Printf("allowedModuleCodes lookup failed for user %s: %v", userID, err)
		}
		return nil
	}
	return codes
}

func moduleAllowed(allowed []string, code string) bool {
	if allowed == nil {
		return true
	}
	for _, c := range allowed {
		if c == code {
			return true
		}
	}
	return false
}

// GetSubject returns a subject with its full theory content.
func (h *Handler) GetSubject(c *gin.Context) {
	id := c.Param("id")

	type Subject struct {
		ID        int    `json:"id"`
		ModuleID  int    `json:"module_id"`
		Code      string `json:"code"`
		Title     string `json:"title"`
		Content   string `json:"content"`
		SortOrder int    `json:"sort_order"`
	}

	var s Subject
	var moduleCode string
	err := h.db.QueryRowContext(c.Request.Context(),
		`SELECT s.id, s.module_id, s.code, s.title, s.content, s.sort_order, m.code
		 FROM easa_subjects s JOIN easa_modules m ON m.id = s.module_id
		 WHERE s.id=$1`, id,
	).Scan(&s.ID, &s.ModuleID, &s.Code, &s.Title, &s.Content, &s.SortOrder, &moduleCode)
	if err == sql.ErrNoRows {
		c.JSON(http.StatusNotFound, gin.H{"error": "subject not found"})
		return
	}
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	allowed := h.allowedModuleCodes(c.Request.Context(), c.GetString("user_id"))
	if !moduleAllowed(allowed, moduleCode) {
		c.JSON(http.StatusForbidden, gin.H{"error": "upgrade your plan to access this module", "code": "plan_restricted"})
		return
	}

	c.JSON(http.StatusOK, s)
}

// ListExamFormats returns the official question-count/time-limit for every
// module+licence combination, so the exam setup page can show the real
// exam format instead of a generic question-count picker.
func (h *Handler) ListExamFormats(c *gin.Context) {
	rows, err := h.db.QueryContext(c.Request.Context(),
		`SELECT module_code, licence_type, question_count, time_limit_min FROM exam_formats`)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}
	defer rows.Close()

	type ExamFormat struct {
		ModuleCode    string `json:"module_code"`
		LicenceType   string `json:"licence_type"`
		QuestionCount int    `json:"question_count"`
		TimeLimitMin  int    `json:"time_limit_min"`
	}

	formats := []ExamFormat{}
	for rows.Next() {
		var f ExamFormat
		if err := rows.Scan(&f.ModuleCode, &f.LicenceType, &f.QuestionCount, &f.TimeLimitMin); err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
			return
		}
		formats = append(formats, f)
	}
	c.JSON(http.StatusOK, formats)
}
