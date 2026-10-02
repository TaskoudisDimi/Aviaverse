package middleware

import (
	"database/sql"
	"net/http"

	"github.com/gin-gonic/gin"
)

// AdminOnly must run after Auth(), which sets "user_id" in the context.
// Looks up is_admin fresh from the DB on every request rather than trusting
// a JWT claim, so revoking admin access takes effect immediately instead of
// waiting for tokens to expire.
func AdminOnly(db *sql.DB) gin.HandlerFunc {
	return func(c *gin.Context) {
		userID := c.GetString("user_id")
		var isAdmin bool
		err := db.QueryRow(`SELECT is_admin FROM users WHERE id = $1`, userID).Scan(&isAdmin)
		if err != nil || !isAdmin {
			c.AbortWithStatusJSON(http.StatusForbidden, gin.H{"error": "admin access required"})
			return
		}
		c.Next()
	}
}
