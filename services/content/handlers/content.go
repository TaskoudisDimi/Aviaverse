package handlers

import (
	"database/sql"
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
	err := h.db.QueryRowContext(c.Request.Context(),
		`SELECT id, module_id, code, title, content, sort_order FROM easa_subjects WHERE id=$1`, id,
	).Scan(&s.ID, &s.ModuleID, &s.Code, &s.Title, &s.Content, &s.SortOrder)
	if err == sql.ErrNoRows {
		c.JSON(http.StatusNotFound, gin.H{"error": "subject not found"})
		return
	}
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}
	c.JSON(http.StatusOK, s)
}
