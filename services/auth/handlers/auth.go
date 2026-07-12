package handlers

import (
	"database/sql"
	"net/http"
	"os"
	"time"

	"github.com/gin-gonic/gin"
	"github.com/golang-jwt/jwt/v5"
	"github.com/google/uuid"
	"golang.org/x/crypto/bcrypt"
)

type Handler struct {
	db        *sql.DB
	jwtSecret string
}

func New(db *sql.DB, jwtSecret string) *Handler {
	return &Handler{db: db, jwtSecret: jwtSecret}
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
