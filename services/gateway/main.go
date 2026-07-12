package main

import (
	"log"
	"net/http"
	"net/http/httputil"
	"net/url"
	"os"
	"strings"

	"github.com/gin-gonic/gin"
)

type route struct {
	prefix  string
	target  string
}

func corsMiddleware() gin.HandlerFunc {
	return func(c *gin.Context) {
		c.Header("Access-Control-Allow-Origin", "*")
		c.Header("Access-Control-Allow-Methods", "GET,POST,PUT,DELETE,OPTIONS")
		c.Header("Access-Control-Allow-Headers", "Origin,Content-Type,Authorization")
		if c.Request.Method == "OPTIONS" {
			c.AbortWithStatus(204)
			return
		}
		c.Next()
	}
}

func proxyHandler(target string) gin.HandlerFunc {
	targetURL, err := url.Parse(target)
	if err != nil {
		log.Fatalf("invalid proxy target %q: %v", target, err)
	}
	proxy := httputil.NewSingleHostReverseProxy(targetURL)
	proxy.ErrorHandler = func(w http.ResponseWriter, r *http.Request, err error) {
		log.Printf("proxy error for %s: %v", r.URL, err)
		w.Header().Set("Content-Type", "application/json")
		w.WriteHeader(http.StatusBadGateway)
		w.Write([]byte(`{"error":"upstream unavailable"}`))
	}
	return func(c *gin.Context) {
		proxy.ServeHTTP(c.Writer, c.Request)
	}
}

func getEnv(key, fallback string) string {
	if v := os.Getenv(key); v != "" {
		return v
	}
	return fallback
}

func main() {
	authURL     := getEnv("AUTH_SERVICE_URL",     "http://auth:8081")
	contentURL  := getEnv("CONTENT_SERVICE_URL",  "http://content:8082")
	aiURL       := getEnv("AI_SERVICE_URL",        "http://ai:8083")
	examURL     := getEnv("EXAM_SERVICE_URL",      "http://exam:8084")
	progressURL := getEnv("PROGRESS_SERVICE_URL",  "http://progress:8085")

	routes := []route{
		{prefix: "/api/v1/auth",     target: authURL},
		{prefix: "/api/v1/content",  target: contentURL},
		{prefix: "/api/v1/ai",       target: aiURL},
		{prefix: "/api/v1/exam",     target: examURL},
		{prefix: "/api/v1/progress", target: progressURL},
	}

	r := gin.Default()
	r.Use(corsMiddleware())

	r.GET("/health", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{"status": "ok"})
	})

	// Register a catch-all for each prefix
	for _, rt := range routes {
		prefix := rt.prefix
		handler := proxyHandler(rt.target)
		// Match /<prefix> and /<prefix>/*path
		r.Any(prefix, handler)
		r.Any(prefix+"/*path", func(c *gin.Context) {
			// Gin strips the wildcard; restore the original path
			c.Request.URL.Path = c.FullPath()
			// Replace the named route pattern with the actual path
			c.Request.URL.Path = strings.Replace(c.Request.URL.Path, "/*path", c.Param("path"), 1)
			handler(c)
		})
	}

	port := os.Getenv("PORT")
	if port == "" {
		port = "8080"
	}
	log.Printf("Gateway listening on :%s", port)
	r.Run(":" + port)
}
