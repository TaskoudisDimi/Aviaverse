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

type dashboardStats struct {
	TotalStudyHours    float64         `json:"total_study_hours"`
	CompletionPercent  float64         `json:"completion_percent"`
	ExamReadinessScore float64         `json:"exam_readiness_score"`
	TotalExams         int             `json:"total_exams"`
	PassedExams        int             `json:"passed_exams"`
	AverageScore       float64         `json:"average_score"`
	StrongSubjects     []subjectScore  `json:"strong_subjects"`
	WeakSubjects       []subjectScore  `json:"weak_subjects"`
	RecentExams        []recentExam    `json:"recent_exams"`
	NextGoals          []string        `json:"next_goals"`
}

type subjectScore struct {
	SubjectID    int     `json:"subject_id"`
	SubjectCode  string  `json:"subject_code"`
	SubjectTitle string  `json:"subject_title"`
	ModuleCode   string  `json:"module_code"`
	Percentage   float64 `json:"percentage"`
	TotalAnswers int     `json:"total_answers"`
}

type recentExam struct {
	ID          string  `json:"id"`
	ModuleCode  string  `json:"module_code"`
	ModuleTitle string  `json:"module_title"`
	Percentage  float64 `json:"percentage"`
	PassFail    string  `json:"pass_fail"`
	StartedAt   string  `json:"started_at"`
}

// GetDashboard returns aggregated progress stats for the user.
func (h *Handler) GetDashboard(c *gin.Context) {
	userID := c.GetString("user_id")
	ctx := c.Request.Context()

	stats := dashboardStats{
		StrongSubjects: []subjectScore{},
		WeakSubjects:   []subjectScore{},
		RecentExams:    []recentExam{},
		NextGoals:      []string{},
	}

	// Exam stats
	h.db.QueryRowContext(ctx,
		`SELECT COUNT(*), COUNT(*) FILTER (WHERE pass_fail='PASS'), COALESCE(AVG(percentage), 0)
		 FROM exams WHERE user_id=$1 AND completed_at IS NOT NULL`,
		userID,
	).Scan(&stats.TotalExams, &stats.PassedExams, &stats.AverageScore)

	// Study hours approximation: 1 question attempt ≈ 2 minutes
	h.db.QueryRowContext(ctx,
		`SELECT COALESCE(SUM(total_answers) * 2.0 / 60.0, 0) FROM user_subject_progress WHERE user_id=$1`,
		userID,
	).Scan(&stats.TotalStudyHours)

	// Total subjects in system and how many user has attempted
	var totalSubjects, attemptedSubjects int
	h.db.QueryRowContext(ctx, `SELECT COUNT(*) FROM easa_subjects`).Scan(&totalSubjects)
	h.db.QueryRowContext(ctx,
		`SELECT COUNT(*) FROM user_subject_progress WHERE user_id=$1`, userID,
	).Scan(&attemptedSubjects)

	if totalSubjects > 0 {
		stats.CompletionPercent = float64(attemptedSubjects) / float64(totalSubjects) * 100
	}

	// Exam readiness: weighted average of last exam avg and subject mastery
	var subjectMastery float64
	h.db.QueryRowContext(ctx,
		`SELECT COALESCE(AVG(correct_answers::float / NULLIF(total_answers, 0) * 100), 0)
		 FROM user_subject_progress WHERE user_id=$1`, userID,
	).Scan(&subjectMastery)
	stats.ExamReadinessScore = (stats.AverageScore*0.6 + subjectMastery*0.4)

	// Strong subjects (>= 80%)
	strongRows, err := h.db.QueryContext(ctx,
		`SELECT sp.subject_id, s.code, s.title, m.code,
		        ROUND(sp.correct_answers::numeric / NULLIF(sp.total_answers, 0) * 100, 1),
		        sp.total_answers
		 FROM user_subject_progress sp
		 JOIN easa_subjects s ON s.id = sp.subject_id
		 JOIN easa_modules m ON m.id = s.module_id
		 WHERE sp.user_id=$1
		   AND sp.total_answers > 0
		   AND (sp.correct_answers::float / sp.total_answers) >= 0.8
		 ORDER BY (sp.correct_answers::float / sp.total_answers) DESC
		 LIMIT 5`,
		userID,
	)
	if err == nil {
		defer strongRows.Close()
		for strongRows.Next() {
			var ss subjectScore
			strongRows.Scan(&ss.SubjectID, &ss.SubjectCode, &ss.SubjectTitle, &ss.ModuleCode, &ss.Percentage, &ss.TotalAnswers)
			stats.StrongSubjects = append(stats.StrongSubjects, ss)
		}
	}

	// Weak subjects (< 60%)
	weakRows, err := h.db.QueryContext(ctx,
		`SELECT sp.subject_id, s.code, s.title, m.code,
		        ROUND(sp.correct_answers::numeric / NULLIF(sp.total_answers, 0) * 100, 1),
		        sp.total_answers
		 FROM user_subject_progress sp
		 JOIN easa_subjects s ON s.id = sp.subject_id
		 JOIN easa_modules m ON m.id = s.module_id
		 WHERE sp.user_id=$1
		   AND sp.total_answers > 0
		   AND (sp.correct_answers::float / sp.total_answers) < 0.6
		 ORDER BY (sp.correct_answers::float / sp.total_answers) ASC
		 LIMIT 5`,
		userID,
	)
	if err == nil {
		defer weakRows.Close()
		for weakRows.Next() {
			var ss subjectScore
			weakRows.Scan(&ss.SubjectID, &ss.SubjectCode, &ss.SubjectTitle, &ss.ModuleCode, &ss.Percentage, &ss.TotalAnswers)
			stats.WeakSubjects = append(stats.WeakSubjects, ss)
		}
	}

	// Recent exams
	recentRows, err := h.db.QueryContext(ctx,
		`SELECT e.id, m.code, m.title, e.percentage, e.pass_fail, e.started_at
		 FROM exams e
		 JOIN easa_modules m ON m.id = e.module_id
		 WHERE e.user_id=$1 AND e.completed_at IS NOT NULL
		 ORDER BY e.started_at DESC LIMIT 5`,
		userID,
	)
	if err == nil {
		defer recentRows.Close()
		for recentRows.Next() {
			var re recentExam
			recentRows.Scan(&re.ID, &re.ModuleCode, &re.ModuleTitle, &re.Percentage, &re.PassFail, &re.StartedAt)
			stats.RecentExams = append(stats.RecentExams, re)
		}
	}

	// Generate next goal suggestions based on weak subjects
	if len(stats.WeakSubjects) > 0 {
		stats.NextGoals = append(stats.NextGoals,
			"Review "+stats.WeakSubjects[0].ModuleCode+" – "+stats.WeakSubjects[0].SubjectTitle)
	}
	if stats.CompletionPercent < 100 {
		stats.NextGoals = append(stats.NextGoals, "Explore new modules to increase coverage")
	}
	if stats.ExamReadinessScore < 75 {
		stats.NextGoals = append(stats.NextGoals, "Practice more exams to improve readiness score")
	}

	c.JSON(http.StatusOK, stats)
}

// GetSubjectProgress returns per-subject progress for a specific module.
func (h *Handler) GetSubjectProgress(c *gin.Context) {
	userID := c.GetString("user_id")
	moduleID := c.Param("module_id")

	rows, err := h.db.QueryContext(c.Request.Context(),
		`SELECT s.id, s.code, s.title, s.sort_order,
		        COALESCE(sp.correct_answers, 0),
		        COALESCE(sp.total_answers, 0),
		        COALESCE(sp.last_studied_at::text, '')
		 FROM easa_subjects s
		 LEFT JOIN user_subject_progress sp ON sp.subject_id = s.id AND sp.user_id = $1
		 WHERE s.module_id = $2
		 ORDER BY s.sort_order`,
		userID, moduleID,
	)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}
	defer rows.Close()

	type subjectProgressOut struct {
		SubjectID      int     `json:"subject_id"`
		Code           string  `json:"code"`
		Title          string  `json:"title"`
		SortOrder      int     `json:"sort_order"`
		CorrectAnswers int     `json:"correct_answers"`
		TotalAnswers   int     `json:"total_answers"`
		Percentage     float64 `json:"percentage"`
		LastStudiedAt  string  `json:"last_studied_at"`
	}

	subjects := []subjectProgressOut{}
	for rows.Next() {
		var s subjectProgressOut
		rows.Scan(&s.SubjectID, &s.Code, &s.Title, &s.SortOrder,
			&s.CorrectAnswers, &s.TotalAnswers, &s.LastStudiedAt)
		if s.TotalAnswers > 0 {
			s.Percentage = float64(s.CorrectAnswers) / float64(s.TotalAnswers) * 100
		}
		subjects = append(subjects, s)
	}
	c.JSON(http.StatusOK, subjects)
}
