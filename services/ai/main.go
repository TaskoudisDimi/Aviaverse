package main

import (
	"database/sql"
	"log"
	"os"
	"strconv"

	"github.com/gin-gonic/gin"
	"github.com/go-redis/redis/v8"
	_ "github.com/lib/pq"
	"github.com/vyron/ai/gemini"
	"github.com/vyron/ai/handlers"
	"github.com/vyron/ai/middleware"
)

func main() {
	db, err := sql.Open("postgres", os.Getenv("DATABASE_URL"))
	if err != nil {
		log.Fatalf("db open: %v", err)
	}
	if err := db.Ping(); err != nil {
		log.Fatalf("db ping: %v", err)
	}
	defer db.Close()

	rdb := redis.NewClient(&redis.Options{
		Addr: os.Getenv("REDIS_URL"),
	})

	messageLimit := 100
	if v := os.Getenv("AI_MONTHLY_MESSAGE_LIMIT"); v != "" {
		if n, err := strconv.Atoi(v); err == nil && n > 0 {
			messageLimit = n
		}
	}

	geminiClient := gemini.NewClient(db)

	r := gin.Default()
	r.Use(middleware.CORS())

	h := handlers.New(geminiClient, rdb, messageLimit)

	v1 := r.Group("/api/v1/ai")
	v1.Use(middleware.Auth())
	{
		v1.POST("/chat", h.Chat)
	}

	port := os.Getenv("PORT")
	if port == "" {
		port = "8083"
	}
	log.Printf("AI instructor service listening on :%s (monthly message limit: %d)", port, messageLimit)
	r.Run(":" + port)
}
