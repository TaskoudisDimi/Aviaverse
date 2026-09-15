package main

import (
	"database/sql"
	"log"
	"os"

	"github.com/gin-gonic/gin"
	_ "github.com/lib/pq"
	"github.com/vyron/ai/claude"
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

	claudeClient := claude.NewClient(db)

	r := gin.Default()
	r.Use(middleware.CORS())

	h := handlers.New(claudeClient)

	v1 := r.Group("/api/v1/ai")
	{
		v1.POST("/chat", h.Chat)
	}

	port := os.Getenv("PORT")
	if port == "" {
		port = "8083"
	}
	log.Printf("AI instructor service listening on :%s", port)
	r.Run(":" + port)
}
