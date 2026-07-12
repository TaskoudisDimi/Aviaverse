package types

import "time"

// ─── API Responses ────────────────────────────────────────

type APIResponse struct {
	Success bool        `json:"success"`
	Data    interface{} `json:"data,omitempty"`
	Error   string      `json:"error,omitempty"`
}

// ─── Auth ─────────────────────────────────────────────────

type RegisterRequest struct {
	Email       string `json:"email" binding:"required,email"`
	Password    string `json:"password" binding:"required,min=8"`
	FullName    string `json:"full_name" binding:"required"`
	LicenceType string `json:"licence_type" binding:"required,oneof=B1.1 B1.3 B2 all"`
}

type LoginRequest struct {
	Email    string `json:"email" binding:"required,email"`
	Password string `json:"password" binding:"required"`
}

type AuthResponse struct {
	Token string `json:"token"`
	User  User   `json:"user"`
}

type User struct {
	ID          string    `json:"id"`
	Email       string    `json:"email"`
	FullName    string    `json:"full_name"`
	LicenceType string    `json:"licence_type"`
	CreatedAt   time.Time `json:"created_at"`
}

// ─── EASA Content ─────────────────────────────────────────

type Module struct {
	ID           int      `json:"id"`
	Code         string   `json:"code"`
	Title        string   `json:"title"`
	Description  string   `json:"description"`
	LicenceTypes []string `json:"licence_types"`
	SortOrder    int      `json:"sort_order"`
	Subjects     []Subject `json:"subjects,omitempty"`
}

type Subject struct {
	ID        int    `json:"id"`
	ModuleID  int    `json:"module_id"`
	Code      string `json:"code"`
	Title     string `json:"title"`
	Content   string `json:"content,omitempty"`
	SortOrder int    `json:"sort_order"`
}

// ─── Questions ────────────────────────────────────────────

type Option struct {
	Key  string `json:"key"`
	Text string `json:"text"`
}

type Question struct {
	ID          string   `json:"id"`
	SubjectID   int      `json:"subject_id"`
	Stem        string   `json:"stem"`
	Options     []Option `json:"options"`
	CorrectKey  string   `json:"correct_key,omitempty"` // omitted during exam
	Explanation string   `json:"explanation,omitempty"`
	Difficulty  string   `json:"difficulty"`
}

// ─── Exam ─────────────────────────────────────────────────

type StartExamRequest struct {
	ModuleID    *int  `json:"module_id"`
	SubjectIDs  []int `json:"subject_ids"`
	QuestionNum int   `json:"question_num" binding:"required,min=10,max=100"`
	DurationSec int   `json:"duration_sec" binding:"required"`
}

type ExamSession struct {
	ID           string     `json:"id"`
	Questions    []Question `json:"questions"`
	DurationSec  int        `json:"duration_sec"`
	StartedAt    time.Time  `json:"started_at"`
}

type SubmitExamRequest struct {
	ExamID  string            `json:"exam_id" binding:"required"`
	Answers map[string]string `json:"answers"` // questionID → chosenKey
}

type ExamResult struct {
	ExamID       string          `json:"exam_id"`
	Score        float64         `json:"score"`
	Passed       bool            `json:"passed"`
	TotalQ       int             `json:"total_questions"`
	CorrectQ     int             `json:"correct_questions"`
	SubjectBreakdown []SubjectScore `json:"subject_breakdown"`
	WeakSubjects []Subject       `json:"weak_subjects"`
	AnswerDetails []AnswerDetail `json:"answer_details"`
}

type SubjectScore struct {
	Subject Subject `json:"subject"`
	Score   float64 `json:"score"`
	Total   int     `json:"total"`
	Correct int     `json:"correct"`
}

type AnswerDetail struct {
	Question   Question `json:"question"`
	ChosenKey  string   `json:"chosen_key"`
	IsCorrect  bool     `json:"is_correct"`
}

// ─── Progress ─────────────────────────────────────────────

type DashboardStats struct {
	TotalStudyMinutes  int             `json:"total_study_minutes"`
	CompletionPercent  float64         `json:"completion_percent"`
	ReadinessScore     float64         `json:"readiness_score"`
	SubjectProgress    []SubjectProgress `json:"subject_progress"`
	RecentExams        []ExamSummary   `json:"recent_exams"`
	WeakSubjects       []Subject       `json:"weak_subjects"`
	StrongSubjects     []Subject       `json:"strong_subjects"`
	NextGoals          []string        `json:"next_goals"`
}

type SubjectProgress struct {
	Subject      Subject `json:"subject"`
	MasteryScore float64 `json:"mastery_score"`
	StudyMinutes int     `json:"study_minutes"`
	ReadAt       *time.Time `json:"read_at"`
}

type ExamSummary struct {
	ID          string    `json:"id"`
	ModuleCode  string    `json:"module_code"`
	Score       float64   `json:"score"`
	Passed      bool      `json:"passed"`
	SubmittedAt time.Time `json:"submitted_at"`
}

// ─── AI Instructor ────────────────────────────────────────

type AIMode string

const (
	AIModeBeginnerExplain  AIMode = "beginner"
	AIModeTechnical        AIMode = "technical"
	AIModePractical        AIMode = "practical"
	AIModeCompare          AIMode = "compare"
	AIModeOralExam         AIMode = "oral"
	AIModeExplainMistake   AIMode = "explain_mistake"
	AIModeWeakPoints       AIMode = "weak_points"
)

type AIMessage struct {
	Role    string `json:"role"` // "user" | "assistant"
	Content string `json:"content"`
}

type AIRequest struct {
	SessionID *string    `json:"session_id"`
	Mode      AIMode     `json:"mode" binding:"required"`
	SubjectID *int       `json:"subject_id"`
	Message   string     `json:"message" binding:"required"`
	History   []AIMessage `json:"history"`
}

type AIResponse struct {
	SessionID string    `json:"session_id"`
	Message   AIMessage `json:"message"`
}
