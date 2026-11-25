package main

import (
	"database/sql"
	"log"
	"os"

	"github.com/gin-gonic/gin"
	"github.com/vyron/content/handlers"
	"github.com/vyron/content/middleware"
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

	// Module/subject structure and exam formats are catalog metadata (titles,
	// descriptions, question counts) with no lesson content — safe to browse
	// without an account, so prospective students can see what's covered.
	public := r.Group("/api/v1/content")
	{
		public.GET("/modules", h.ListModules)
		public.GET("/modules/:id", h.GetModule)
		public.GET("/exam-formats", h.ListExamFormats)
		public.GET("/reviews", h.ListReviews)
	}

	// Full lesson content is gated — this is the paid material itself.
	authed := r.Group("/api/v1/content")
	authed.Use(middleware.Auth())
	{
		authed.GET("/subjects/:id", h.GetSubject)
		authed.POST("/reviews", h.UpsertReview)
		authed.GET("/reviews/me", h.MyReview)
	}

	admin := r.Group("/api/v1/content/admin")
	admin.Use(middleware.Auth(), middleware.AdminOnly(db))
	{
		admin.GET("/questions/search", h.AdminSearchQuestions)
		admin.GET("/questions/export", h.AdminExportQuestions)
		admin.POST("/questions/import", h.AdminImportQuestions)
		admin.GET("/subjects/:id/questions", h.AdminListQuestions)
		admin.POST("/subjects/:id/questions", h.AdminCreateQuestion)
		admin.PATCH("/questions/:id", h.AdminUpdateQuestion)
		admin.DELETE("/questions/:id", h.AdminDeleteQuestion)
	}

	port := os.Getenv("PORT")
	if port == "" {
		port = "8082"
	}
	log.Printf("Content service listening on :%s", port)
	r.Run(":" + port)
}
