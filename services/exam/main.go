package main

import (
	"database/sql"
	"log"
	"os"

	"github.com/gin-gonic/gin"
	"github.com/go-redis/redis/v8"
	"github.com/vyron/exam/handlers"
	"github.com/vyron/exam/middleware"
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

	rdb := redis.NewClient(&redis.Options{
		Addr: os.Getenv("REDIS_URL"),
	})

	r := gin.Default()
	r.Use(middleware.CORS())

	h := handlers.New(db, rdb)

	v1 := r.Group("/api/v1/exam")
	v1.Use(middleware.Auth())
	{
		v1.POST("/start", h.StartExam)
		v1.POST("/submit", h.SubmitExam)
		v1.GET("/results/:id", h.GetExamResult)
		v1.GET("/history", h.ListExams)
	}

	port := os.Getenv("PORT")
	if port == "" {
		port = "8084"
	}
	log.Printf("Exam service listening on :%s", port)
	r.Run(":" + port)
}
