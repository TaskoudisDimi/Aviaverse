package handlers

import (
	"database/sql"
	"encoding/csv"
	"encoding/json"
	"net/http"
	"strconv"
	"strings"
	"time"

	"github.com/gin-gonic/gin"
)

// questionOption mirrors the shape already stored in questions.options
// (see exam service's rawOption/cachedOption) — {id, text, correct}, where
// id is a short per-question letter ("a", "b", "c", ...) assigned here on
// write rather than by the admin, since nothing downstream needs it to be
// meaningful beyond "the exam/content JSON blob's own primary key".
type questionOption struct {
	ID      string `json:"id"`
	Text    string `json:"text"`
	Correct bool   `json:"correct"`
}

type adminQuestionResp struct {
	ID           string           `json:"id"`
	SubjectID    int              `json:"subject_id"`
	SubjectCode  string           `json:"subject_code"`
	ModuleCode   string           `json:"module_code"`
	Text         string           `json:"text"`
	Options      []questionOption `json:"options"`
	Explanation  *string          `json:"explanation"`
	LicenceTypes []string         `json:"licence_types"`
	CreatedAt    time.Time        `json:"created_at"`
}

func scanAdminQuestion(rows *sql.Rows) (adminQuestionResp, error) {
	var q adminQuestionResp
	var optionsJSON []byte
	err := rows.Scan(&q.ID, &q.SubjectID, &q.SubjectCode, &q.ModuleCode, &q.Text, &optionsJSON,
		&q.Explanation, (*stringArray)(&q.LicenceTypes), &q.CreatedAt)
	if err != nil {
		return q, err
	}
	if err := json.Unmarshal(optionsJSON, &q.Options); err != nil {
		return q, err
	}
	return q, nil
}

const adminQuestionSelect = `
	SELECT q.id, q.subject_id, s.code, m.code, q.text, q.options, q.explanation, q.licence_types, q.created_at
	FROM questions q
	JOIN easa_subjects s ON s.id = q.subject_id
	JOIN easa_modules m ON m.id = s.module_id`

// AdminListQuestions returns every question in one subject, so an admin
// can review/edit the bank without opening the source PDF again.
func (h *Handler) AdminListQuestions(c *gin.Context) {
	subjectID := c.Param("id")

	rows, err := h.db.QueryContext(c.Request.Context(),
		adminQuestionSelect+` WHERE q.subject_id = $1 ORDER BY q.created_at`, subjectID)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "internal error"})
		return
	}
	defer rows.Close()

	questions := []adminQuestionResp{}
	for rows.Next() {
		q, err := scanAdminQuestion(rows)
		if err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": "internal error"})
			return
		}
		questions = append(questions, q)
	}
	c.JSON(http.StatusOK, questions)
}

// AdminSearchQuestions finds questions by a text fragment across every
// module — built for the case a student sends a screenshot of one
// question and the admin needs to find it without knowing which module or
// subject it lives in. Capped at 30 matches; a longer/more specific phrase
// narrows it down rather than needing pagination.
func (h *Handler) AdminSearchQuestions(c *gin.Context) {
	q := strings.TrimSpace(c.Query("q"))
	if len(q) < 3 {
		c.JSON(http.StatusBadRequest, gin.H{"error": "search text must be at least 3 characters"})
		return
	}

	rows, err := h.db.QueryContext(c.Request.Context(),
		adminQuestionSelect+` WHERE q.text ILIKE $1 ORDER BY q.created_at LIMIT 30`, "%"+q+"%")
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "internal error"})
		return
	}
	defer rows.Close()

	questions := []adminQuestionResp{}
	for rows.Next() {
		qr, err := scanAdminQuestion(rows)
		if err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": "internal error"})
			return
		}
		questions = append(questions, qr)
	}
	c.JSON(http.StatusOK, questions)
}

type questionOptionReq struct {
	Text    string `json:"text" binding:"required"`
	Correct bool   `json:"correct"`
}

type questionWriteReq struct {
	Text         string              `json:"text" binding:"required"`
	Options      []questionOptionReq `json:"options" binding:"required,min=2,dive"`
	Explanation  string              `json:"explanation"`
	LicenceTypes []string            `json:"licence_types" binding:"required,min=1"`
}

// buildOptions assigns a, b, c, ... ids in order and checks exactly one
// option is marked correct — a question with zero or multiple correct
// answers can't be scored, so this is rejected outright rather than
// silently stored broken.
func buildOptions(req []questionOptionReq) ([]questionOption, error) {
	opts := make([]questionOption, len(req))
	correctCount := 0
	for i, r := range req {
		opts[i] = questionOption{ID: string(rune('a' + i)), Text: r.Text, Correct: r.Correct}
		if r.Correct {
			correctCount++
		}
	}
	if correctCount != 1 {
		return nil, errExactlyOneCorrect
	}
	return opts, nil
}

var errExactlyOneCorrect = &questionValidationError{"exactly one option must be marked correct"}

type questionValidationError struct{ msg string }

func (e *questionValidationError) Error() string { return e.msg }

// AdminCreateQuestion adds a new question to a subject's bank.
func (h *Handler) AdminCreateQuestion(c *gin.Context) {
	subjectID := c.Param("id")
	var req questionWriteReq
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	opts, err := buildOptions(req.Options)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}
	optionsJSON, err := json.Marshal(opts)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "internal error"})
		return
	}

	var id string
	err = h.db.QueryRowContext(c.Request.Context(), `
		INSERT INTO questions (subject_id, text, options, explanation, licence_types)
		VALUES ($1, $2, $3, $4, $5) RETURNING id`,
		subjectID, req.Text, optionsJSON, nullIfEmptyStr(req.Explanation), stringArray(req.LicenceTypes),
	).Scan(&id)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "internal error"})
		return
	}
	c.JSON(http.StatusCreated, gin.H{"id": id})
}

// AdminUpdateQuestion replaces a question's text/options/explanation/
// licence_types in one go — the admin UI always sends the full question
// back, so there's no partial-update ambiguity to worry about.
func (h *Handler) AdminUpdateQuestion(c *gin.Context) {
	questionID := c.Param("id")
	var req questionWriteReq
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	opts, err := buildOptions(req.Options)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}
	optionsJSON, err := json.Marshal(opts)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "internal error"})
		return
	}

	res, err := h.db.ExecContext(c.Request.Context(), `
		UPDATE questions SET text = $1, options = $2, explanation = $3, licence_types = $4 WHERE id = $5`,
		req.Text, optionsJSON, nullIfEmptyStr(req.Explanation), stringArray(req.LicenceTypes), questionID,
	)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "internal error"})
		return
	}
	if n, _ := res.RowsAffected(); n == 0 {
		c.JSON(http.StatusNotFound, gin.H{"error": "question not found"})
		return
	}
	c.JSON(http.StatusOK, gin.H{"ok": true})
}

// AdminDeleteQuestion removes a question outright. Past exam attempts that
// used it keep their exam_answers row (question_id has no ON DELETE
// CASCADE), so historical results aren't rewritten by a later edit — this
// means a question with past attempts can't be deleted; the error says so.
func (h *Handler) AdminDeleteQuestion(c *gin.Context) {
	questionID := c.Param("id")
	res, err := h.db.ExecContext(c.Request.Context(), `DELETE FROM questions WHERE id = $1`, questionID)
	if err != nil {
		if isForeignKeyViolation(err) {
			c.JSON(http.StatusConflict, gin.H{"error": "can't delete — this question has past exam answers on record"})
			return
		}
		c.JSON(http.StatusInternalServerError, gin.H{"error": "internal error"})
		return
	}
	if n, _ := res.RowsAffected(); n == 0 {
		c.JSON(http.StatusNotFound, gin.H{"error": "question not found"})
		return
	}
	c.JSON(http.StatusOK, gin.H{"ok": true})
}

func isForeignKeyViolation(err error) bool {
	type sqlStater interface{ SQLState() string }
	if pe, ok := err.(sqlStater); ok {
		return pe.SQLState() == "23503"
	}
	return false
}

func nullIfEmptyStr(s string) *string {
	if strings.TrimSpace(s) == "" {
		return nil
	}
	return &s
}

// csvHeader must stay in this exact order — AdminImportQuestions parses
// rows positionally against it, and this is also what AdminExportQuestions
// writes, so a round-trip (export, edit in a spreadsheet, re-import) works.
var csvHeader = []string{
	"id", "module_code", "subject_code", "licence_types",
	"question", "option_a", "option_b", "option_c", "option_d", "correct", "explanation",
}

// AdminExportQuestions downloads the question bank as CSV, optionally
// scoped to one module, so the client can review/edit a whole module's
// questions in a spreadsheet and re-upload via AdminImportQuestions.
func (h *Handler) AdminExportQuestions(c *gin.Context) {
	query := adminQuestionSelect
	args := []interface{}{}
	if moduleID := c.Query("module_id"); moduleID != "" {
		query += ` WHERE m.id = $1`
		args = append(args, moduleID)
	}
	query += ` ORDER BY m.sort_order, s.sort_order, q.created_at`

	rows, err := h.db.QueryContext(c.Request.Context(), query, args...)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "internal error"})
		return
	}
	defer rows.Close()

	c.Header("Content-Type", "text/csv")
	c.Header("Content-Disposition", `attachment; filename="questions.csv"`)
	w := csv.NewWriter(c.Writer)
	if err := w.Write(csvHeader); err != nil {
		return
	}

	for rows.Next() {
		q, err := scanAdminQuestion(rows)
		if err != nil {
			continue
		}
		record := questionToCSVRecord(q)
		if err := w.Write(record); err != nil {
			return
		}
	}
	w.Flush()
}

func questionToCSVRecord(q adminQuestionResp) []string {
	byLetter := map[string]string{}
	correct := ""
	for _, o := range q.Options {
		byLetter[o.ID] = o.Text
		if o.Correct {
			correct = o.ID
		}
	}
	explanation := ""
	if q.Explanation != nil {
		explanation = *q.Explanation
	}
	return []string{
		q.ID, q.ModuleCode, q.SubjectCode, strings.Join(q.LicenceTypes, ";"),
		q.Text, byLetter["a"], byLetter["b"], byLetter["c"], byLetter["d"], correct, explanation,
	}
}

type importPreviewRow struct {
	Row    int    `json:"row"`
	ID     string `json:"id,omitempty"`
	Action string `json:"action"` // "create" or "update"
	Text   string `json:"text"`
}

type importResult struct {
	DryRun  bool               `json:"dry_run"`
	Created int                `json:"created"`
	Updated int                `json:"updated"`
	Errors  []string           `json:"errors"`
	Preview []importPreviewRow `json:"preview"`
}

func truncate(s string, n int) string {
	r := []rune(s)
	if len(r) <= n {
		return s
	}
	return string(r[:n]) + "…"
}

// AdminImportQuestions bulk-upserts questions from a CSV in the exact
// shape AdminExportQuestions produces. A row with a non-empty "id" column
// updates that question (it must already exist); an empty "id" inserts a
// new one under the given module_code/subject_code. Every row is
// validated independently — one bad row is reported and skipped rather
// than failing the whole upload.
//
// With ?dry_run=true, every row is validated (including checking the id
// or module_code/subject_code actually resolves) but nothing is written —
// used by the admin UI to show "this will create N, update M, and here's
// what's wrong with the rest" before the admin confirms the real upload.
func (h *Handler) AdminImportQuestions(c *gin.Context) {
	dryRun := c.Query("dry_run") == "true"

	file, _, err := c.Request.FormFile("file")
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "no file uploaded (expected multipart field \"file\")"})
		return
	}
	defer file.Close()

	r := csv.NewReader(file)
	r.FieldsPerRecord = -1
	header, err := r.Read()
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "could not read CSV header"})
		return
	}
	col := map[string]int{}
	for i, name := range header {
		col[strings.TrimSpace(strings.ToLower(name))] = i
	}
	for _, required := range csvHeader {
		if _, ok := col[required]; !ok {
			c.JSON(http.StatusBadRequest, gin.H{"error": "missing column: " + required})
			return
		}
	}

	get := func(record []string, name string) string {
		i := col[name]
		if i >= len(record) {
			return ""
		}
		return strings.TrimSpace(record[i])
	}

	result := importResult{DryRun: dryRun, Errors: []string{}, Preview: []importPreviewRow{}}
	rowNum := 1
	for {
		record, err := r.Read()
		if err != nil {
			break
		}
		rowNum++

		id := get(record, "id")
		moduleCode := get(record, "module_code")
		subjectCode := get(record, "subject_code")
		questionText := get(record, "question")
		correctLetter := strings.ToLower(get(record, "correct"))
		explanation := get(record, "explanation")
		licenceTypes := splitNonEmpty(get(record, "licence_types"), ";")

		if questionText == "" || correctLetter == "" {
			result.Errors = append(result.Errors, rowRef(rowNum, id)+": missing question text or correct answer")
			continue
		}

		var opts []questionOption
		for _, letter := range []string{"a", "b", "c", "d"} {
			text := get(record, "option_"+letter)
			if text == "" {
				continue
			}
			opts = append(opts, questionOption{ID: letter, Text: text, Correct: letter == correctLetter})
		}
		if len(opts) < 2 {
			result.Errors = append(result.Errors, rowRef(rowNum, id)+": needs at least 2 non-empty options")
			continue
		}
		hasCorrect := false
		for _, o := range opts {
			if o.Correct {
				hasCorrect = true
			}
		}
		if !hasCorrect {
			result.Errors = append(result.Errors, rowRef(rowNum, id)+": \"correct\" column doesn't match any filled-in option")
			continue
		}
		optionsJSON, _ := json.Marshal(opts)

		if id != "" {
			if dryRun {
				var exists bool
				if err := h.db.QueryRowContext(c.Request.Context(),
					`SELECT true FROM questions WHERE id=$1`, id,
				).Scan(&exists); err != nil {
					result.Errors = append(result.Errors, rowRef(rowNum, id)+": no question with this id")
					continue
				}
			} else {
				res, err := h.db.ExecContext(c.Request.Context(),
					`UPDATE questions SET text=$1, options=$2, explanation=$3, licence_types=$4 WHERE id=$5`,
					questionText, optionsJSON, nullIfEmptyStr(explanation), stringArray(licenceTypes), id,
				)
				if err != nil {
					result.Errors = append(result.Errors, rowRef(rowNum, id)+": "+err.Error())
					continue
				}
				if n, _ := res.RowsAffected(); n == 0 {
					result.Errors = append(result.Errors, rowRef(rowNum, id)+": no question with this id")
					continue
				}
			}
			result.Updated++
			result.Preview = append(result.Preview, importPreviewRow{Row: rowNum, ID: id, Action: "update", Text: truncate(questionText, 90)})
			continue
		}

		if moduleCode == "" || subjectCode == "" {
			result.Errors = append(result.Errors, rowRef(rowNum, id)+": new question needs module_code and subject_code")
			continue
		}
		var subjectID int
		err = h.db.QueryRowContext(c.Request.Context(), `
			SELECT s.id FROM easa_subjects s JOIN easa_modules m ON m.id = s.module_id
			WHERE m.code = $1 AND s.code = $2`, moduleCode, subjectCode,
		).Scan(&subjectID)
		if err != nil {
			result.Errors = append(result.Errors, rowRef(rowNum, id)+": unknown module_code/subject_code combination")
			continue
		}
		if !dryRun {
			if _, err := h.db.ExecContext(c.Request.Context(), `
				INSERT INTO questions (subject_id, text, options, explanation, licence_types)
				VALUES ($1, $2, $3, $4, $5)`,
				subjectID, questionText, optionsJSON, nullIfEmptyStr(explanation), stringArray(licenceTypes),
			); err != nil {
				result.Errors = append(result.Errors, rowRef(rowNum, id)+": "+err.Error())
				continue
			}
		}
		result.Created++
		result.Preview = append(result.Preview, importPreviewRow{Row: rowNum, Action: "create", Text: truncate(questionText, 90)})
	}

	c.JSON(http.StatusOK, result)
}

func rowRef(rowNum int, id string) string {
	if id != "" {
		return "row " + strconv.Itoa(rowNum) + " (id " + id + ")"
	}
	return "row " + strconv.Itoa(rowNum)
}

func splitNonEmpty(s, sep string) []string {
	if strings.TrimSpace(s) == "" {
		return nil
	}
	parts := strings.Split(s, sep)
	out := make([]string, 0, len(parts))
	for _, p := range parts {
		p = strings.TrimSpace(p)
		if p != "" {
			out = append(out, p)
		}
	}
	return out
}
