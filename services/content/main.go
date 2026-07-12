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

	v1 := r.Group("/api/v1/content")
	v1.Use(middleware.Auth())
	{
		v1.GET("/modules", h.ListModules)
		v1.GET("/modules/:id", h.GetModule)
		v1.GET("/subjects/:id", h.GetSubject)
	}

	port := os.Getenv("PORT")
	if port == "" {
		port = "8082"
	}
	log.Printf("Content service listening on :%s", port)
	r.Run(":" + port)
}
