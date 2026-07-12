package main

import (
	"log"
	"os"

	"github.com/gin-gonic/gin"
	"github.com/vyron/ai/claude"
	"github.com/vyron/ai/handlers"
	"github.com/vyron/ai/middleware"
)

func main() {
	claudeClient := claude.NewClient()

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
