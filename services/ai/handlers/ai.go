package handlers

import (
	"context"
	"database/sql"
	"encoding/json"
	"fmt"
	"log"
	"net/http"
	"time"

	"github.com/gin-gonic/gin"
	"github.com/go-redis/redis/v8"
	gemini "github.com/vyron/ai/gemini"
)

type Handler struct {
	gemini              *gemini.Client
	db                  *sql.DB
	redis               *redis.Client
	defaultMessageLimit int
}

func New(c *gemini.Client, db *sql.DB, rdb *redis.Client, defaultMessageLimit int) *Handler {
	return &Handler{gemini: c, db: db, redis: rdb, defaultMessageLimit: defaultMessageLimit}
}

// planMessageCap looks up the monthly AI message cap from the user's
// currently active subscription plan. Falls back to defaultMessageLimit if
// the user has no subscription row (shouldn't happen — every account gets
// one on registration) or the lookup fails, so a DB hiccup degrades to a
// safe default instead of blocking chat entirely.
func (h *Handler) planMessageCap(ctx context.Context, userID string) int {
	var messageCap int
	err := h.db.QueryRowContext(ctx, `
		SELECT sp.ai_message_cap
		FROM user_subscriptions us
		JOIN subscription_plans sp ON sp.id = us.plan_id
		WHERE us.user_id = $1
		  AND us.status = 'active'
		  AND (us.expires_at IS NULL OR us.expires_at > now())
		ORDER BY us.started_at DESC
		LIMIT 1`, userID).Scan(&messageCap)
	if err != nil {
		if err != sql.ErrNoRows {
			log.Printf("planMessageCap lookup failed for user %s: %v", userID, err)
		}
		return h.defaultMessageLimit
	}
	return messageCap
}

type chatReq struct {
	Mode    string           `json:"mode" binding:"required"`
	Subject string           `json:"subject"`
	Message string           `json:"message" binding:"required"`
	History []gemini.Message `json:"history"`
}

// checkAndIncrementUsage atomically increments this user's message count for
// the current calendar month and reports whether they're still under their
// plan's cap. The counter key expires automatically after ~32 days so it
// never needs manual cleanup, and a fresh key naturally starts each month.
func (h *Handler) checkAndIncrementUsage(ctx context.Context, userID string, messageCap int) (count int64, limited bool, err error) {
	key := fmt.Sprintf("ai:msgs:%s:%s", userID, time.Now().Format("2006-01"))
	count, err = h.redis.Incr(ctx, key).Result()
	if err != nil {
		return 0, false, err
	}
	if count == 1 {
		h.redis.Expire(ctx, key, 32*24*time.Hour)
	}
	return count, count > int64(messageCap), nil
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

	messageCap := h.planMessageCap(c.Request.Context(), userIDStr)
	_, limited, err := h.checkAndIncrementUsage(c.Request.Context(), userIDStr, messageCap)
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
			"limit":   messageCap,
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
