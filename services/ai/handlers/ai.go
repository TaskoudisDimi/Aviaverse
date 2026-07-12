package handlers

import (
	"encoding/json"
	"fmt"
	"net/http"

	"github.com/gin-gonic/gin"
	"github.com/vyron/ai/claude"
)

type Handler struct {
	claude *claude.Client
}

func New(c *claude.Client) *Handler {
	return &Handler{claude: c}
}

type chatReq struct {
	Mode    string          `json:"mode" binding:"required"`
	Subject string          `json:"subject"`
	Message string          `json:"message" binding:"required"`
	History []claude.Message `json:"history"`
}

// Chat handles SSE streaming responses from the AI Instructor.
func (h *Handler) Chat(c *gin.Context) {
	var req chatReq
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	// Set SSE headers
	c.Header("Content-Type", "text/event-stream")
	c.Header("Cache-Control", "no-cache")
	c.Header("Connection", "keep-alive")
	c.Header("Access-Control-Allow-Origin", "*")

	tokenCh := make(chan string, 64)

	go func() {
		if err := h.claude.Chat(c.Request.Context(), claude.InstructorRequest{
			Mode:    req.Mode,
			Subject: req.Subject,
			Message: req.Message,
			History: req.History,
		}, tokenCh); err != nil {
			// Send error event
			data, _ := json.Marshal(gin.H{"error": err.Error()})
			fmt.Fprintf(c.Writer, "event: error\ndata: %s\n\n", data)
			c.Writer.Flush()
		}
	}()

	w := c.Writer
	for token := range tokenCh {
		data, _ := json.Marshal(gin.H{"token": token})
		fmt.Fprintf(w, "data: %s\n\n", data)
		w.Flush()
	}

	// Signal done
	fmt.Fprintf(w, "event: done\ndata: {}\n\n")
	w.Flush()
}
