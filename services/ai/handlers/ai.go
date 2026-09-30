package handlers

import (
	"context"
	"encoding/json"
	"fmt"
	"net/http"
	"time"

	"github.com/gin-gonic/gin"
	"github.com/go-redis/redis/v8"
	gemini "github.com/vyron/ai/gemini"
)

type Handler struct {
	gemini       *gemini.Client
	redis        *redis.Client
	messageLimit int
}

func New(c *gemini.Client, rdb *redis.Client, messageLimit int) *Handler {
	return &Handler{gemini: c, redis: rdb, messageLimit: messageLimit}
}

type chatReq struct {
	Mode    string           `json:"mode" binding:"required"`
	Subject string           `json:"subject"`
	Message string           `json:"message" binding:"required"`
	History []gemini.Message `json:"history"`
}

// checkAndIncrementUsage atomically increments this user's message count for
// the current calendar month and reports whether they're still under the
// cap. The counter key expires automatically after ~32 days so it never
// needs manual cleanup, and a fresh key naturally starts each new month.
func (h *Handler) checkAndIncrementUsage(ctx context.Context, userID string) (count int64, limited bool, err error) {
	key := fmt.Sprintf("ai:msgs:%s:%s", userID, time.Now().Format("2006-01"))
	count, err = h.redis.Incr(ctx, key).Result()
	if err != nil {
		return 0, false, err
	}
	if count == 1 {
		h.redis.Expire(ctx, key, 32*24*time.Hour)
	}
	return count, count > int64(h.messageLimit), nil
}

// Chat handles SSE streaming responses from the AI Instructor.
func (h *Handler) Chat(c *gin.Context) {
	var req chatReq
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	userID, _ := c.Get("user_id")
	userIDStr, _ := userID.(string)

	_, limited, err := h.checkAndIncrementUsage(c.Request.Context(), userIDStr)
	if err != nil {
		// Redis being unavailable shouldn't take down the chat feature —
		// fail open, same tolerance the rest of this handler has toward
		// best-effort infrastructure.
		limited = false
	}
	if limited {
		c.JSON(http.StatusTooManyRequests, gin.H{
			"error":   "monthly_limit_reached",
			"message": "You've reached this month's AI Instructor message limit. It resets at the start of next month.",
			"limit":   h.messageLimit,
		})
		return
	}

	// Set SSE headers
	c.Header("Content-Type", "text/event-stream")
	c.Header("Cache-Control", "no-cache")
	c.Header("Connection", "keep-alive")
	c.Header("Access-Control-Allow-Origin", "*")

	tokenCh := make(chan string, 64)

	go func() {
		if err := h.gemini.Chat(c.Request.Context(), gemini.InstructorRequest{
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
