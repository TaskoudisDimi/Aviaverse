package handlers

import (
	"crypto/rand"
	"crypto/sha256"
	"database/sql"
	"encoding/hex"
	"fmt"
	"log"
	"net/http"
	"os"
	"time"

	"github.com/gin-gonic/gin"
	"github.com/golang-jwt/jwt/v5"
	"github.com/google/uuid"
	"golang.org/x/crypto/bcrypt"

	"github.com/vyron/auth/mailer"
)

type Handler struct {
	db          *sql.DB
	jwtSecret   string
	mail        *mailer.Client
	frontendURL string
}

func New(db *sql.DB, jwtSecret string, mail *mailer.Client) *Handler {
	frontendURL := os.Getenv("FRONTEND_URL")
	if frontendURL == "" {
		frontendURL = "http://localhost:3000"
	}
	return &Handler{db: db, jwtSecret: jwtSecret, mail: mail, frontendURL: frontendURL}
}

type registerReq struct {
	Email       string `json:"email" binding:"required,email"`
	Password    string `json:"password" binding:"required,min=8"`
	FullName    string `json:"full_name" binding:"required"`
	LicenceType string `json:"licence_type" binding:"required,oneof=B1.1 B1.3 B2 all"`
}

type loginReq struct {
	Email    string `json:"email" binding:"required,email"`
	Password string `json:"password" binding:"required"`
}

type userResp struct {
	ID          string    `json:"id"`
	Email       string    `json:"email"`
	FullName    string    `json:"full_name"`
	LicenceType string    `json:"licence_type"`
	CreatedAt   time.Time `json:"created_at"`
}

func (h *Handler) Register(c *gin.Context) {
	var req registerReq
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	hash, err := bcrypt.GenerateFromPassword([]byte(req.Password), bcrypt.DefaultCost)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "internal error"})
		return
	}

	var user userResp
	err = h.db.QueryRow(
		`INSERT INTO users (id, email, password_hash, full_name, licence_type)
		 VALUES ($1,$2,$3,$4,$5)
		 RETURNING id, email, full_name, licence_type, created_at`,
		uuid.New().String(), req.Email, string(hash), req.FullName, req.LicenceType,
	).Scan(&user.ID, &user.Email, &user.FullName, &user.LicenceType, &user.CreatedAt)
	if err != nil {
		c.JSON(http.StatusConflict, gin.H{"error": "email already exists"})
		return
	}

	token, err := h.generateToken(user.ID, user.Email)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "token error"})
		return
	}

	c.JSON(http.StatusCreated, gin.H{"token": token, "user": user})
}

func (h *Handler) Login(c *gin.Context) {
	var req loginReq
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	var user userResp
	var hash string
	err := h.db.QueryRow(
		`SELECT id, email, password_hash, full_name, licence_type, created_at
		 FROM users WHERE email=$1`, req.Email,
	).Scan(&user.ID, &user.Email, &hash, &user.FullName, &user.LicenceType, &user.CreatedAt)
	if err != nil {
		c.JSON(http.StatusUnauthorized, gin.H{"error": "invalid credentials"})
		return
	}

	if err = bcrypt.CompareHashAndPassword([]byte(hash), []byte(req.Password)); err != nil {
		c.JSON(http.StatusUnauthorized, gin.H{"error": "invalid credentials"})
		return
	}

	token, err := h.generateToken(user.ID, user.Email)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "token error"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"token": token, "user": user})
}

type forgotPasswordReq struct {
	Email string `json:"email" binding:"required,email"`
}

// ForgotPassword issues a single-use, 1-hour reset token and emails a reset
// link to the address if it belongs to an account. Always responds with the
// same generic message regardless of whether the email was found, so this
// endpoint can't be used to enumerate registered users.
func (h *Handler) ForgotPassword(c *gin.Context) {
	var req forgotPasswordReq
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	const genericResp = "If that email is registered, a password reset link has been sent."

	var userID string
	err := h.db.QueryRow(`SELECT id FROM users WHERE email=$1`, req.Email).Scan(&userID)
	if err == sql.ErrNoRows {
		c.JSON(http.StatusOK, gin.H{"message": genericResp})
		return
	}
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "internal error"})
		return
	}

	rawToken := make([]byte, 32)
	if _, err := rand.Read(rawToken); err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "internal error"})
		return
	}
	tokenHex := hex.EncodeToString(rawToken)
	hash := sha256.Sum256([]byte(tokenHex))
	tokenHash := hex.EncodeToString(hash[:])

	expiresAt := time.Now().UTC().Add(1 * time.Hour)
	_, err = h.db.Exec(
		`INSERT INTO password_reset_tokens (user_id, token_hash, expires_at) VALUES ($1, $2, $3)`,
		userID, tokenHash, expiresAt,
	)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "internal error"})
		return
	}

	resetLink := fmt.Sprintf("%s/auth/reset-password?token=%s", h.frontendURL, tokenHex)
	html := fmt.Sprintf(`<p>Someone requested a password reset for your VJet-Academy account.</p>
<p><a href="%s">Click here to choose a new password</a>. This link expires in 1 hour.</p>
<p>If you didn't request this, you can safely ignore this email.</p>`, resetLink)

	if err := h.mail.Send(req.Email, "Reset your VJet-Academy password", html); err != nil {
		log.Printf("failed to send password reset email to %s: %v", req.Email, err)
	}

	c.JSON(http.StatusOK, gin.H{"message": genericResp})
}

type resetPasswordReq struct {
	Token       string `json:"token" binding:"required"`
	NewPassword string `json:"new_password" binding:"required,min=8"`
}

// ResetPassword consumes a valid, unexpired reset token and sets a new password.
func (h *Handler) ResetPassword(c *gin.Context) {
	var req resetPasswordReq
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	hash := sha256.Sum256([]byte(req.Token))
	tokenHash := hex.EncodeToString(hash[:])

	var tokenID, userID string
	var expiresAt time.Time
	var usedAt sql.NullTime
	err := h.db.QueryRow(
		`SELECT id, user_id, expires_at, used_at FROM password_reset_tokens WHERE token_hash=$1`,
		tokenHash,
	).Scan(&tokenID, &userID, &expiresAt, &usedAt)
	if err == sql.ErrNoRows {
		c.JSON(http.StatusBadRequest, gin.H{"error": "invalid or expired reset link"})
		return
	}
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "internal error"})
		return
	}
	if usedAt.Valid || time.Now().UTC().After(expiresAt) {
		c.JSON(http.StatusBadRequest, gin.H{"error": "invalid or expired reset link"})
		return
	}

	newHash, err := bcrypt.GenerateFromPassword([]byte(req.NewPassword), bcrypt.DefaultCost)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "internal error"})
		return
	}

	tx, err := h.db.Begin()
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "internal error"})
		return
	}
	defer tx.Rollback()

	if _, err := tx.Exec(`UPDATE users SET password_hash=$1, updated_at=now() WHERE id=$2`, string(newHash), userID); err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "internal error"})
		return
	}
	if _, err := tx.Exec(`UPDATE password_reset_tokens SET used_at=now() WHERE id=$1`, tokenID); err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "internal error"})
		return
	}
	// Invalidate any other outstanding reset tokens for this user.
	if _, err := tx.Exec(`UPDATE password_reset_tokens SET used_at=now() WHERE user_id=$1 AND used_at IS NULL`, userID); err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "internal error"})
		return
	}

	if err := tx.Commit(); err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "internal error"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"message": "Password updated. You can now sign in."})
}

func (h *Handler) Me(c *gin.Context) {
	userID := c.GetString("user_id")
	var user userResp
	err := h.db.QueryRow(
		`SELECT id, email, full_name, licence_type, created_at FROM users WHERE id=$1`, userID,
	).Scan(&user.ID, &user.Email, &user.FullName, &user.LicenceType, &user.CreatedAt)
	if err != nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "user not found"})
		return
	}
	c.JSON(http.StatusOK, user)
}

func (h *Handler) generateToken(userID, email string) (string, error) {
	expiry := os.Getenv("JWT_EXPIRY")
	dur, _ := time.ParseDuration(expiry)
	if dur == 0 {
		dur = 24 * time.Hour
	}

	claims := jwt.MapClaims{
		"sub":   userID,
		"email": email,
		"exp":   time.Now().Add(dur).Unix(),
		"iat":   time.Now().Unix(),
	}
	token := jwt.NewWithClaims(jwt.SigningMethodHS256, claims)
	return token.SignedString([]byte(h.jwtSecret))
}
