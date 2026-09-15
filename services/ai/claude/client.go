package claude

import (
	"context"
	"database/sql"
	"fmt"
	"log"
	"os"

	"google.golang.org/genai"
)

type Client struct {
	gc    *genai.Client
	model string
	db    *sql.DB
}

func NewClient(db *sql.DB) *Client {
	apiKey := os.Getenv("GEMINI_API_KEY")
	if apiKey == "" {
		panic("GEMINI_API_KEY not set")
	}
	gc, err := genai.NewClient(context.Background(), &genai.ClientConfig{
		APIKey:  apiKey,
		Backend: genai.BackendGeminiAPI,
	})
	if err != nil {
		panic(fmt.Sprintf("gemini client: %v", err))
	}
	return &Client{gc: gc, model: "gemini-3.6-flash", db: db}
}

// subjectContent looks up the stored lesson markdown for a subject code
// (eg. "M03.1") so the AI Instructor can ground its answers in the actual
// course material instead of relying only on the model's general knowledge.
// Returns "" (no error surfaced to the caller) if the subject code doesn't
// match anything or the lookup fails — the chat should still work using just
// the subject label in that case.
func (c *Client) subjectContent(ctx context.Context, code string) string {
	if c.db == nil || code == "" {
		return ""
	}
	var content string
	err := c.db.QueryRowContext(ctx, `SELECT content FROM easa_subjects WHERE code = $1`, code).Scan(&content)
	if err != nil {
		if err != sql.ErrNoRows {
			log.Printf("subjectContent lookup failed for %q: %v", code, err)
		}
		return ""
	}
	return content
}

type Message struct {
	Role    string `json:"role"`
	Content string `json:"content"`
}

type InstructorRequest struct {
	Mode    string    `json:"mode"`
	Subject string    `json:"subject"`
	Message string    `json:"message"`
	History []Message `json:"history"`
}

func systemPromptForMode(mode, subject, courseContent string) string {
	base := `You are an expert AI Instructor specializing in EASA (European Union Aviation Safety Agency) regulations and aircraft maintenance training. Your knowledge covers all EASA Part-66 modules for B1.1 (turbine aircraft), B1.3 (helicopter turbine), and B2 (avionics) licences.

Output rules (always follow these, in every mode):
- Answer the student's actual question directly and in detail. Stay strictly on topic — do not wander into unrelated territory.
- Never invent hypothetical personal anecdotes, fictional stories, or made-up scenarios to illustrate a point (e.g. imagined situations about cars, people, or events that have nothing to do with the question). If you give an example, it must be a real, concrete, technically accurate aviation maintenance example that directly supports the answer — not a tangent, and never one you contradict or retract later in the same answer.
- Never use LaTeX or math markup of any kind — no $...$, no $$...$$, no backslash commands like \times, \frac, \sqrt. Write every formula and calculation in plain text using ordinary keyboard characters and Unicode symbols only (e.g. V = I × R, R = ρl/a, X = 2πfL, √, Ω, °, ², ³, ±, Δ). The chat display renders plain markdown, not math notation, so LaTeX syntax shows up as broken symbols to the student.`

	subjectCtx := ""
	if subject != "" {
		subjectCtx = fmt.Sprintf(" The current topic is: %s.", subject)
	}

	if courseContent != "" {
		subjectCtx += fmt.Sprintf(`

Below is the official course material for this subject, from this platform's own curriculum. Ground your answer in it: prefer its terminology, figures, and explanations over general knowledge whenever it covers the student's question. Only fall back to your broader EASA knowledge for things this material doesn't address. Do not mention that you were given this material — just teach from it naturally.

--- COURSE MATERIAL START ---
%s
--- COURSE MATERIAL END ---`, courseContent)
	}

	modeInstructions := map[string]string{
		"beginner":        `You are explaining concepts to a complete beginner. Use simple language, avoid jargon, use real-world analogies, and build from the ground up. Break complex ideas into small digestible steps.`,
		"technical":       `You are giving a rigorous technical explanation to an experienced engineer. Use precise EASA terminology, reference relevant regulations (Part-66, AMC, CS-23/25), include specifications, tolerances, and technical depth.`,
		"practical":       `You give practical, hands-on examples. Describe real maintenance scenarios, how procedures are actually performed on the hangar floor, what tools are used, and what to watch out for in practice.`,
		"compare":         `You compare and contrast two related systems or concepts. Present a structured comparison with similarities, differences, advantages, and disadvantages of each. Use tables where helpful.`,
		"oral":            `You are conducting an oral examination similar to an EASA Part-66 oral exam. Ask probing follow-up questions, challenge the student's answers, and guide them to a complete understanding. Do not simply give the answer—make the student reason through it.`,
		"explain_mistake": `The student made a mistake. Carefully analyze what went wrong, explain the correct concept, and help them understand WHY the correct answer is right and why their answer was wrong. Be encouraging but precise.`,
		"weak_points":     `Focus only on the areas where the student has shown weakness. Review the specific topics they struggle with, reinforce the key concepts, and provide targeted practice.`,
	}

	instruction, ok := modeInstructions[mode]
	if !ok {
		instruction = modeInstructions["technical"]
	}

	return fmt.Sprintf("%s%s\n\n%s", base, subjectCtx, instruction)
}

func (c *Client) Chat(ctx context.Context, req InstructorRequest, tokenCh chan<- string) error {
	defer close(tokenCh)

	courseContent := c.subjectContent(ctx, req.Subject)

	config := &genai.GenerateContentConfig{
		SystemInstruction: genai.NewContentFromText(
			systemPromptForMode(req.Mode, req.Subject, courseContent), genai.RoleUser),
	}

	var history []*genai.Content
	for _, h := range req.History {
		role := genai.Role(h.Role)
		if role == "assistant" {
			role = genai.RoleModel
		}
		history = append(history, genai.NewContentFromText(h.Content, role))
	}

	chat, err := c.gc.Chats.Create(ctx, c.model, config, history)
	if err != nil {
		return err
	}

	for resp, err := range chat.SendMessageStream(ctx, genai.Part{Text: req.Message}) {
		if err != nil {
			return err
		}
		if t := resp.Text(); t != "" {
			tokenCh <- t
		}
	}
	return nil
}
