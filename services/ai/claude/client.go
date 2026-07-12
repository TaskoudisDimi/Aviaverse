package claude

import (
	"context"
	"fmt"
	"os"

	"github.com/google/generative-ai-go/genai"
	"google.golang.org/api/iterator"
	"google.golang.org/api/option"
)

type Client struct {
	gc    *genai.Client
	model string
}

func NewClient() *Client {
	apiKey := os.Getenv("GEMINI_API_KEY")
	if apiKey == "" {
		panic("GEMINI_API_KEY not set")
	}
	gc, err := genai.NewClient(context.Background(), option.WithAPIKey(apiKey))
	if err != nil {
		panic(fmt.Sprintf("gemini client: %v", err))
	}
	return &Client{gc: gc, model: "gemini-2.5-flash"}
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

func systemPromptForMode(mode, subject string) string {
	base := `You are an expert AI Instructor specializing in EASA (European Union Aviation Safety Agency) regulations and aircraft maintenance training. Your knowledge covers all EASA Part-66 modules for B1.1 (turbine aircraft), B1.3 (helicopter turbine), and B2 (avionics) licences.`

	subjectCtx := ""
	if subject != "" {
		subjectCtx = fmt.Sprintf(" The current topic is: %s.", subject)
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

	m := c.gc.GenerativeModel(c.model)
	m.SystemInstruction = &genai.Content{
		Parts: []genai.Part{genai.Text(systemPromptForMode(req.Mode, req.Subject))},
	}

	session := m.StartChat()
	for _, h := range req.History {
		role := h.Role
		if role == "assistant" {
			role = "model"
		}
		session.History = append(session.History, &genai.Content{
			Role:  role,
			Parts: []genai.Part{genai.Text(h.Content)},
		})
	}

	iter := session.SendMessageStream(ctx, genai.Text(req.Message))
	for {
		resp, err := iter.Next()
		if err == iterator.Done {
			return nil
		}
		if err != nil {
			return err
		}
		for _, cand := range resp.Candidates {
			if cand.Content == nil {
				continue
			}
			for _, part := range cand.Content.Parts {
				if t, ok := part.(genai.Text); ok {
					tokenCh <- string(t)
				}
			}
		}
	}
}
