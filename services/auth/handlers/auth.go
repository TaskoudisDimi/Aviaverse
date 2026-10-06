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
	"strings"
	"time"

	"github.com/gin-gonic/gin"
	"github.com/go-redis/redis/v8"
	"github.com/golang-jwt/jwt/v5"
	"github.com/google/uuid"
	"github.com/lib/pq"
	"golang.org/x/crypto/bcrypt"

	"github.com/vyron/auth/billing"
	"github.com/vyron/auth/mailer"
)

type Handler struct {
	db          *sql.DB
	jwtSecret   string
	mail        *mailer.Client
	frontendURL string
	redis       *redis.Client
	billing     *billing.Client
}

func New(db *sql.DB, jwtSecret string, mail *mailer.Client, rdb *redis.Client, bc *billing.Client) *Handler {
	frontendURL := os.Getenv("FRONTEND_URL")
	if frontendURL == "" {
		frontendURL = "http://localhost:3000"
	}
	return &Handler{db: db, jwtSecret: jwtSecret, mail: mail, frontendURL: frontendURL, redis: rdb, billing: bc}
}

const (
	maxLoginAttempts = 8
	loginLockWindow  = 15 * time.Minute
)

// loginKey normalizes the email so "Foo@Example.com" and "foo@example.com"
// share the same lockout counter — the users table itself isn't
// case-normalized on email lookup, but an attacker shouldn't get extra
// free attempts just by varying case.
func loginKey(email string) string {
	return "login:fail:" + strings.ToLower(strings.TrimSpace(email))
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

	// Every new account starts on the free plan. Not fatal if this fails —
	// log it rather than rolling back the whole registration over a billing
	// bookkeeping row.
	if _, err := h.db.Exec(
		`INSERT INTO user_subscriptions (user_id, plan_id, status)
		 SELECT $1, id, 'active' FROM subscription_plans WHERE code = 'free'`,
		user.ID,
	); err != nil {
		log.Printf("failed to assign free plan to new user %s: %v", user.ID, err)
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

	key := loginKey(req.Email)
	ctx := c.Request.Context()

	if h.redis != nil {
		attempts, err := h.redis.Get(ctx, key).Int()
		if err == nil && attempts >= maxLoginAttempts {
			ttl, _ := h.redis.TTL(ctx, key).Result()
			c.JSON(http.StatusTooManyRequests, gin.H{
				"error":            "too_many_attempts",
				"message":          "Too many failed login attempts. Please try again later.",
				"retry_after_secs": int(ttl.Seconds()),
			})
			return
		}
	}

	fail := func() {
		c.JSON(http.StatusUnauthorized, gin.H{"error": "invalid credentials"})
		if h.redis == nil {
			return
		}
		// Best-effort: a Redis hiccup here shouldn't change the auth
		// response, so errors from these calls are intentionally ignored.
		count, err := h.redis.Incr(ctx, key).Result()
		if err == nil && count == 1 {
			h.redis.Expire(ctx, key, loginLockWindow)
		}
	}

	var user userResp
	var hash string
	err := h.db.QueryRow(
		`SELECT id, email, password_hash, full_name, licence_type, created_at
		 FROM users WHERE email=$1`, req.Email,
	).Scan(&user.ID, &user.Email, &hash, &user.FullName, &user.LicenceType, &user.CreatedAt)
	if err != nil {
		fail()
		return
	}

	if err = bcrypt.CompareHashAndPassword([]byte(hash), []byte(req.Password)); err != nil {
		fail()
		return
	}

	token, err := h.generateToken(user.ID, user.Email)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "token error"})
		return
	}

	if h.redis != nil {
		h.redis.Del(ctx, key)
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

type planResp struct {
	Code            string     `json:"code"`
	Name            string     `json:"name"`
	PriceCents      int        `json:"price_cents"`
	Currency        string     `json:"currency"`
	AIMessageCap    int        `json:"ai_message_cap"`
	AllowedModules  []string   `json:"allowed_module_codes"`
	ExpiresAt       *time.Time `json:"expires_at"`
	BillingMode     string     `json:"billing_mode"`
	PaymentProvider *string    `json:"payment_provider"`
}

func (h *Handler) Me(c *gin.Context) {
	userID := c.GetString("user_id")
	var user userResp
	var isAdmin bool
	err := h.db.QueryRow(
		`SELECT id, email, full_name, licence_type, created_at, is_admin FROM users WHERE id=$1`, userID,
	).Scan(&user.ID, &user.Email, &user.FullName, &user.LicenceType, &user.CreatedAt, &isAdmin)
	if err != nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "user not found"})
		return
	}

	var plan planResp
	err = h.db.QueryRow(`
		SELECT sp.code, sp.name, sp.price_cents, sp.currency, sp.ai_message_cap, sp.allowed_module_codes,
		       us.expires_at, sp.billing_mode, us.payment_provider
		FROM user_subscriptions us
		JOIN subscription_plans sp ON sp.id = us.plan_id
		WHERE us.user_id = $1
		  AND us.status = 'active'
		  AND (us.expires_at IS NULL OR us.expires_at > now())
		ORDER BY us.started_at DESC
		LIMIT 1`, userID,
	).Scan(&plan.Code, &plan.Name, &plan.PriceCents, &plan.Currency, &plan.AIMessageCap, pq.Array(&plan.AllowedModules),
		&plan.ExpiresAt, &plan.BillingMode, &plan.PaymentProvider)

	resp := gin.H{
		"id":           user.ID,
		"email":        user.Email,
		"full_name":    user.FullName,
		"licence_type": user.LicenceType,
		"created_at":   user.CreatedAt,
		"is_admin":     isAdmin,
	}
	if err == nil {
		resp["plan"] = plan
	} else if err != sql.ErrNoRows {
		log.Printf("plan lookup failed for user %s: %v", userID, err)
	}

	c.JSON(http.StatusOK, resp)
}

type updateProfileReq struct {
	FullName    string `json:"full_name" binding:"required"`
	LicenceType string `json:"licence_type" binding:"required,oneof=B1.1 B1.3 B2 all"`
}

// UpdateProfile lets a user change their own name and licence type.
func (h *Handler) UpdateProfile(c *gin.Context) {
	userID := c.GetString("user_id")
	var req updateProfileReq
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	_, err := h.db.Exec(
		`UPDATE users SET full_name = $1, licence_type = $2, updated_at = now() WHERE id = $3`,
		req.FullName, req.LicenceType, userID,
	)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "internal error"})
		return
	}
	c.JSON(http.StatusOK, gin.H{"full_name": req.FullName, "licence_type": req.LicenceType})
}

type changePlanReq struct {
	PlanCode string `json:"plan_code" binding:"required"`
}

// ChangePlan switches the caller onto the free plan — the only switch that
// doesn't require payment. Paid plans go through CreateCheckoutSession
// instead, which is the only path that can mark a subscription as paid.
func (h *Handler) ChangePlan(c *gin.Context) {
	userID := c.GetString("user_id")
	var req changePlanReq
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}
	if req.PlanCode != "free" {
		c.JSON(http.StatusBadRequest, gin.H{"error": "paid plans require checkout — use /billing/checkout"})
		return
	}

	var planID int
	var periodDays sql.NullInt32
	err := h.db.QueryRow(
		`SELECT id, period_days FROM subscription_plans WHERE code = $1 AND active = true`, req.PlanCode,
	).Scan(&planID, &periodDays)
	if err == sql.ErrNoRows {
		c.JSON(http.StatusNotFound, gin.H{"error": "unknown plan"})
		return
	}
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "internal error"})
		return
	}

	res, err := h.db.Exec(`
		UPDATE user_subscriptions
		SET plan_id = $1,
		    started_at = now(),
		    expires_at = CASE WHEN $2::int IS NULL THEN NULL ELSE now() + ($2::int || ' days')::interval END,
		    payment_provider = 'manual',
		    status = 'active',
		    updated_at = now()
		WHERE user_id = $3 AND status = 'active'`,
		planID, periodDays, userID,
	)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "internal error"})
		return
	}
	if n, _ := res.RowsAffected(); n == 0 {
		// No active subscription row somehow — create one rather than fail.
		if _, err := h.db.Exec(
			`INSERT INTO user_subscriptions (user_id, plan_id, status, payment_provider)
			 VALUES ($1, $2, 'active', 'manual')`,
			userID, planID,
		); err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": "internal error"})
			return
		}
	}

	c.JSON(http.StatusOK, gin.H{"plan_code": req.PlanCode})
}

// Plans lists all active subscription plans, for display on the settings /
// pricing page. Public (no auth) since it's shown on the pricing-comparison
// view even to visitors deciding whether to sign up.
func (h *Handler) Plans(c *gin.Context) {
	rows, err := h.db.Query(`
		SELECT code, name, price_cents, currency, period_days, ai_message_cap, allowed_module_codes, billing_mode
		FROM subscription_plans
		WHERE active = true
		ORDER BY sort_order`)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "internal error"})
		return
	}
	defer rows.Close()

	type plan struct {
		Code           string   `json:"code"`
		Name           string   `json:"name"`
		PriceCents     int      `json:"price_cents"`
		Currency       string   `json:"currency"`
		PeriodDays     *int     `json:"period_days"`
		AIMessageCap   int      `json:"ai_message_cap"`
		AllowedModules []string `json:"allowed_module_codes"`
		BillingMode    string   `json:"billing_mode"`
	}

	plans := []plan{}
	for rows.Next() {
		var p plan
		if err := rows.Scan(&p.Code, &p.Name, &p.PriceCents, &p.Currency, &p.PeriodDays, &p.AIMessageCap, pq.Array(&p.AllowedModules), &p.BillingMode); err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": "internal error"})
			return
		}
		plans = append(plans, p)
	}
	c.JSON(http.StatusOK, plans)
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
