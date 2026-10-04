package main

import (
	"database/sql"
	"log"
	"os"

	"github.com/gin-gonic/gin"
	"github.com/go-redis/redis/v8"
	_ "github.com/lib/pq"
	"github.com/vyron/auth/handlers"
	"github.com/vyron/auth/mailer"
	"github.com/vyron/auth/middleware"
)

func main() {
	db, err := sql.Open("postgres", os.Getenv("DATABASE_URL"))
	if err != nil {
		log.Fatalf("db connect: %v", err)
	}
	defer db.Close()

	if err = db.Ping(); err != nil {
		log.Fatalf("db ping: %v", err)
	}

	jwtSecret := os.Getenv("JWT_SECRET")
	if jwtSecret == "" {
		log.Fatal("JWT_SECRET not set")
	}

	r := gin.Default()
	r.Use(middleware.CORS())

	mail := mailer.NewClient()
	if !mail.Enabled() {
		log.Println("WARNING: RESEND_API_KEY / EMAIL_FROM not set — password reset emails will not be sent")
	}

	var rdb *redis.Client
	if redisURL := os.Getenv("REDIS_URL"); redisURL != "" {
		rdb = redis.NewClient(&redis.Options{Addr: redisURL})
	} else {
		log.Println("WARNING: REDIS_URL not set — login brute-force protection is disabled")
	}

	h := handlers.New(db, jwtSecret, mail, rdb)

	v1 := r.Group("/api/v1/auth")
	{
		v1.POST("/register", h.Register)
		v1.POST("/login", h.Login)
		v1.POST("/forgot-password", h.ForgotPassword)
		v1.POST("/reset-password", h.ResetPassword)
		v1.GET("/me", middleware.Auth(jwtSecret), h.Me)
		v1.PATCH("/me", middleware.Auth(jwtSecret), h.UpdateProfile)
		v1.POST("/me/plan", middleware.Auth(jwtSecret), h.ChangePlan)
		v1.GET("/plans", h.Plans)

		admin := v1.Group("/admin")
		admin.Use(middleware.Auth(jwtSecret), middleware.AdminOnly(db))
		{
			admin.GET("/users", h.ListUsers)
			admin.PATCH("/users/:id", h.AdminUpdateUser)
			admin.POST("/users/:id/plan", h.AdminChangePlan)
			admin.DELETE("/users/:id", h.AdminDeleteUser)
		}
	}

	port := os.Getenv("PORT")
	if port == "" {
		port = "8081"
	}
	log.Printf("auth service listening on :%s", port)
	r.Run(":" + port)
}
