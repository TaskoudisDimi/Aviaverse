package main

import (
	"database/sql"
	"log"
	"os"

	"github.com/gin-gonic/gin"
	"github.com/vyron/progress/handlers"
	"github.com/vyron/progress/middleware"
	_ "github.com/lib/pq"
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

	r := gin.Default()
	r.Use(middleware.CORS())

	h := handlers.New(db)

	v1 := r.Group("/api/v1/progress")
	v1.Use(middleware.Auth())
	{
		v1.GET("/dashboard", h.GetDashboard)
		v1.GET("/modules/:module_id", h.GetSubjectProgress)
	}

	port := os.Getenv("PORT")
	if port == "" {
		port = "8085"
	}
	log.Printf("Progress service listening on :%s", port)
	r.Run(":" + port)
}
