package handlers

import (
	"context"
	"database/sql"
	"encoding/json"
	"net/http"
	"time"

	"github.com/gin-gonic/gin"
	"github.com/go-redis/redis/v8"
	"github.com/google/uuid"
)

type Handler struct {
	db    *sql.DB
	redis *redis.Client
}

func New(db *sql.DB, rdb *redis.Client) *Handler {
	return &Handler{db: db, redis: rdb}
}

type startExamReq struct {
	ModuleID    int    `json:"module_id" binding:"required"`
	LicenceType string `json:"licence_type" binding:"required"`
	NumQuestions int   `json:"num_questions"`
	TimeLimitMin int   `json:"time_limit_min"`
}

type questionOut struct {
	ID       string         `json:"id"`
	Text     string         `json:"text"`
	Options  []optionOut    `json:"options"`
	ModuleID int            `json:"module_id"`
}

type optionOut struct {
	ID   string `json:"id"`
	Text string `json:"text"`
}

type examSession struct {
	ExamID      string      `json:"exam_id"`
	Questions   []questionOut `json:"questions"`
	StartedAt   time.Time   `json:"started_at"`
	EndsAt      time.Time   `json:"ends_at"`
}

// StartExam creates a new exam session and returns questions (without correct answers).
func (h *Handler) StartExam(c *gin.Context) {
	userID := c.GetString("user_id")

	var req startExamReq
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	limit := req.NumQuestions
	if limit <= 0 {
		limit = 20
	}
	timeLimitMin := req.TimeLimitMin
	if timeLimitMin <= 0 {
		timeLimitMin = 30
	}

	rows, err := h.db.QueryContext(c.Request.Context(),
		`SELECT q.id, q.text, q.options
		 FROM questions q
		 JOIN easa_subjects s ON s.id = q.subject_id
		 WHERE s.module_id = $1 AND $2 = ANY(q.licence_types)
		 ORDER BY RANDOM()
		 LIMIT $3`,
		req.ModuleID, req.LicenceType, limit,
	)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}
	defer rows.Close()

	questions := []questionOut{}
	for rows.Next() {
		var q questionOut
		var optionsJSON []byte
		if err := rows.Scan(&q.ID, &q.Text, &optionsJSON); err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
			return
		}
		type rawOption struct {
			ID      string `json:"id"`
			Text    string `json:"text"`
			Correct bool   `json:"correct"`
		}
		var raw []rawOption
		if err := json.Unmarshal(optionsJSON, &raw); err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
			return
		}
		for _, o := range raw {
			q.Options = append(q.Options, optionOut{ID: o.ID, Text: o.Text})
		}
		questions = append(questions, q)
	}

	if len(questions) == 0 {
		c.JSON(http.StatusNotFound, gin.H{"error": "no questions found for this module/licence combination"})
		return
	}

	examID := uuid.New().String()
	now := time.Now().UTC()
	endsAt := now.Add(time.Duration(timeLimitMin) * time.Minute)

	// Persist exam record
	_, err = h.db.ExecContext(c.Request.Context(),
		`INSERT INTO exams (id, user_id, module_id, licence_type, num_questions, time_limit_min, started_at, ends_at)
		 VALUES ($1, $2, $3, $4, $5, $6, $7, $8)`,
		examID, userID, req.ModuleID, req.LicenceType, len(questions), timeLimitMin, now, endsAt,
	)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	// Cache question correct answers in Redis for submission validation
	type cachedQuestion struct {
		CorrectID string `json:"correct_id"`
		SubjectID int    `json:"subject_id"`
	}
	cache := map[string]cachedQuestion{}
	for _, q := range questions {
		// Re-query to get correct answer (not sent to client)
		var optionsJSON []byte
		var subjectID int
		h.db.QueryRowContext(c.Request.Context(),
			`SELECT options, subject_id FROM questions WHERE id=$1`, q.ID,
		).Scan(&optionsJSON, &subjectID)

		type rawOpt struct {
			ID      string `json:"id"`
			Correct bool   `json:"correct"`
		}
		var raw []rawOpt
		json.Unmarshal(optionsJSON, &raw)
		correctID := ""
		for _, o := range raw {
			if o.Correct {
				correctID = o.ID
				break
			}
		}
		cache[q.ID] = cachedQuestion{CorrectID: correctID, SubjectID: subjectID}
	}
	cacheBytes, _ := json.Marshal(cache)
	h.redis.Set(context.Background(), "exam:"+examID, cacheBytes, time.Duration(timeLimitMin+5)*time.Minute)

	c.JSON(http.StatusOK, examSession{
		ExamID:    examID,
		Questions: questions,
		StartedAt: now,
		EndsAt:    endsAt,
	})
}

type submitReq struct {
	ExamID  string            `json:"exam_id" binding:"required"`
	Answers map[string]string `json:"answers" binding:"required"` // question_id -> option_id
}

type examResult struct {
	ExamID        string          `json:"exam_id"`
	Score         int             `json:"score"`
	TotalQuestions int            `json:"total_questions"`
	Percentage    float64         `json:"percentage"`
	PassFail      string          `json:"pass_fail"`
	Details       []answerDetail  `json:"details"`
}

type answerDetail struct {
	QuestionID string `json:"question_id"`
	SelectedID string `json:"selected_id"`
	CorrectID  string `json:"correct_id"`
	IsCorrect  bool   `json:"is_correct"`
}

// SubmitExam grades the submitted answers and stores results.
func (h *Handler) SubmitExam(c *gin.Context) {
	userID := c.GetString("user_id")

	var req submitReq
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	// Check exam belongs to user and is not already completed
	var dbUserID string
	var completedAt sql.NullTime
	err := h.db.QueryRowContext(c.Request.Context(),
		`SELECT user_id, completed_at FROM exams WHERE id=$1`, req.ExamID,
	).Scan(&dbUserID, &completedAt)
	if err == sql.ErrNoRows {
		c.JSON(http.StatusNotFound, gin.H{"error": "exam not found"})
		return
	}
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}
	if dbUserID != userID {
		c.JSON(http.StatusForbidden, gin.H{"error": "forbidden"})
		return
	}
	if completedAt.Valid {
		c.JSON(http.StatusConflict, gin.H{"error": "exam already submitted"})
		return
	}

	// Load correct answers from Redis
	cacheBytes, err := h.redis.Get(context.Background(), "exam:"+req.ExamID).Bytes()
	if err != nil {
		c.JSON(http.StatusGone, gin.H{"error": "exam session expired"})
		return
	}
	type cachedQuestion struct {
		CorrectID string `json:"correct_id"`
		SubjectID int    `json:"subject_id"`
	}
	cache := map[string]cachedQuestion{}
	json.Unmarshal(cacheBytes, &cache)

	score := 0
	details := []answerDetail{}
	subjectScores := map[int][2]int{} // subject_id -> [correct, total]

	for qID, cached := range cache {
		selectedID := req.Answers[qID]
		isCorrect := selectedID == cached.CorrectID
		if isCorrect {
			score++
		}
		details = append(details, answerDetail{
			QuestionID: qID,
			SelectedID: selectedID,
			CorrectID:  cached.CorrectID,
			IsCorrect:  isCorrect,
		})
		prev := subjectScores[cached.SubjectID]
		correct := prev[0]
		total := prev[1] + 1
		if isCorrect {
			correct++
		}
		subjectScores[cached.SubjectID] = [2]int{correct, total}
	}

	total := len(cache)
	pct := 0.0
	if total > 0 {
		pct = float64(score) / float64(total) * 100
	}
	passFail := "FAIL"
	if pct >= 75 {
		passFail = "PASS"
	}

	now := time.Now().UTC()

	// Store answers and mark exam complete in a transaction
	tx, err := h.db.BeginTx(c.Request.Context(), nil)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}
	defer tx.Rollback()

	for _, d := range details {
		tx.ExecContext(c.Request.Context(),
			`INSERT INTO exam_answers (exam_id, question_id, selected_option_id, is_correct)
			 VALUES ($1, $2, $3, $4)`,
			req.ExamID, d.QuestionID, d.SelectedID, d.IsCorrect,
		)
	}

	tx.ExecContext(c.Request.Context(),
		`UPDATE exams SET score=$1, total_questions=$2, percentage=$3, pass_fail=$4, completed_at=$5
		 WHERE id=$6`,
		score, total, pct, passFail, now, req.ExamID,
	)

	// Upsert subject progress
	for subjectID, scores := range subjectScores {
		tx.ExecContext(c.Request.Context(),
			`INSERT INTO user_subject_progress (user_id, subject_id, correct_answers, total_answers, last_studied_at)
			 VALUES ($1, $2, $3, $4, $5)
			 ON CONFLICT (user_id, subject_id) DO UPDATE SET
			   correct_answers = user_subject_progress.correct_answers + EXCLUDED.correct_answers,
			   total_answers   = user_subject_progress.total_answers + EXCLUDED.total_answers,
			   last_studied_at = EXCLUDED.last_studied_at`,
			userID, subjectID, scores[0], scores[1], now,
		)
	}

	if err := tx.Commit(); err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	h.redis.Del(context.Background(), "exam:"+req.ExamID)

	c.JSON(http.StatusOK, examResult{
		ExamID:         req.ExamID,
		Score:          score,
		TotalQuestions: total,
		Percentage:     pct,
		PassFail:       passFail,
		Details:        details,
	})
}

// GetExamResult returns a previously completed exam result.
func (h *Handler) GetExamResult(c *gin.Context) {
	userID := c.GetString("user_id")
	examID := c.Param("id")

	type dbExam struct {
		Score          int
		TotalQuestions int
		Percentage     float64
		PassFail       string
		CompletedAt    sql.NullTime
	}
	var e dbExam
	err := h.db.QueryRowContext(c.Request.Context(),
		`SELECT score, total_questions, percentage, pass_fail, completed_at
		 FROM exams WHERE id=$1 AND user_id=$2`,
		examID, userID,
	).Scan(&e.Score, &e.TotalQuestions, &e.Percentage, &e.PassFail, &e.CompletedAt)
	if err == sql.ErrNoRows {
		c.JSON(http.StatusNotFound, gin.H{"error": "exam not found"})
		return
	}
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}
	if !e.CompletedAt.Valid {
		c.JSON(http.StatusConflict, gin.H{"error": "exam not yet completed"})
		return
	}

	rows, err := h.db.QueryContext(c.Request.Context(),
		`SELECT question_id, selected_option_id, is_correct FROM exam_answers WHERE exam_id=$1`, examID)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}
	defer rows.Close()

	details := []answerDetail{}
	for rows.Next() {
		var d answerDetail
		rows.Scan(&d.QuestionID, &d.SelectedID, &d.IsCorrect)
		details = append(details, d)
	}

	c.JSON(http.StatusOK, examResult{
		ExamID:         examID,
		Score:          e.Score,
		TotalQuestions: e.TotalQuestions,
		Percentage:     e.Percentage,
		PassFail:       e.PassFail,
		Details:        details,
	})
}

// ListExams returns the exam history for the authenticated user.
func (h *Handler) ListExams(c *gin.Context) {
	userID := c.GetString("user_id")

	rows, err := h.db.QueryContext(c.Request.Context(),
		`SELECT e.id, m.code, m.title, e.licence_type, e.score, e.total_questions,
		        e.percentage, e.pass_fail, e.started_at, e.completed_at
		 FROM exams e
		 JOIN easa_modules m ON m.id = e.module_id
		 WHERE e.user_id = $1
		 ORDER BY e.started_at DESC
		 LIMIT 50`,
		userID,
	)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}
	defer rows.Close()

	type examSummary struct {
		ID             string       `json:"id"`
		ModuleCode     string       `json:"module_code"`
		ModuleTitle    string       `json:"module_title"`
		LicenceType    string       `json:"licence_type"`
		Score          int          `json:"score"`
		TotalQuestions int          `json:"total_questions"`
		Percentage     float64      `json:"percentage"`
		PassFail       string       `json:"pass_fail"`
		StartedAt      time.Time    `json:"started_at"`
		CompletedAt    *time.Time   `json:"completed_at"`
	}

	exams := []examSummary{}
	for rows.Next() {
		var ex examSummary
		var completedAt sql.NullTime
		if err := rows.Scan(
			&ex.ID, &ex.ModuleCode, &ex.ModuleTitle, &ex.LicenceType,
			&ex.Score, &ex.TotalQuestions, &ex.Percentage, &ex.PassFail,
			&ex.StartedAt, &completedAt,
		); err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
			return
		}
		if completedAt.Valid {
			t := completedAt.Time
			ex.CompletedAt = &t
		}
		exams = append(exams, ex)
	}
	c.JSON(http.StatusOK, exams)
}
