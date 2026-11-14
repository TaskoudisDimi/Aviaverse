package handlers

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"
	"net/url"
	"os"

	"github.com/gin-gonic/gin"
	"github.com/google/uuid"
	"golang.org/x/crypto/bcrypt"
)

type googleLoginReq struct {
	IDToken string `json:"id_token" binding:"required"`
}

// googleTokenInfo mirrors the fields we need from Google's tokeninfo
// response. Verifying via this endpoint (rather than checking the JWT
// signature ourselves against Google's JWKS) keeps this dependency-free —
// fine at this app's volume; Google documents tokeninfo as suitable for
// low/moderate-traffic server-side verification.
type googleTokenInfo struct {
	Aud           string `json:"aud"`
	Sub           string `json:"sub"`
	Email         string `json:"email"`
	EmailVerified string `json:"email_verified"`
	Name          string `json:"name"`
}

func verifyGoogleIDToken(idToken string) (*googleTokenInfo, error) {
	resp, err := http.Get("https://oauth2.googleapis.com/tokeninfo?id_token=" + url.QueryEscape(idToken))
	if err != nil {
		return nil, err
	}
	defer resp.Body.Close()

	if resp.StatusCode != http.StatusOK {
		return nil, fmt.Errorf("google tokeninfo returned %d", resp.StatusCode)
	}

	var info googleTokenInfo
	if err := json.NewDecoder(resp.Body).Decode(&info); err != nil {
		return nil, err
	}

	clientID := os.Getenv("GOOGLE_CLIENT_ID")
	if clientID == "" {
		return nil, fmt.Errorf("GOOGLE_CLIENT_ID not configured")
	}
	if info.Aud != clientID {
		return nil, fmt.Errorf("token audience mismatch")
	}
	if info.EmailVerified != "true" || info.Email == "" {
		return nil, fmt.Errorf("google account email not verified")
	}
	return &info, nil
}

// GoogleLogin signs a user in (or registers them, if this is the first time
// this Google account has been seen) from a Google Identity Services ID
// token minted client-side. On first sign-in via Google we don't have a
// licence type from a form, so new accounts default to B1.1 — same as
// everything else here, it's just a starting point the user can change in
// Settings afterwards.
func (h *Handler) GoogleLogin(c *gin.Context) {
	var req googleLoginReq
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	info, err := verifyGoogleIDToken(req.IDToken)
	if err != nil {
		c.JSON(http.StatusUnauthorized, gin.H{"error": "invalid google token"})
		return
	}

	var user userResp
	err = h.db.QueryRow(
		`SELECT id, email, full_name, licence_type, created_at, locked_module_code
		 FROM users WHERE google_id=$1`, info.Sub,
	).Scan(&user.ID, &user.Email, &user.FullName, &user.LicenceType, &user.CreatedAt, &user.LockedModule)

	if err != nil {
		// Not linked yet — if an account with this email already exists
		// (registered with a password originally), link this Google
		// account to it rather than creating a duplicate.
		err = h.db.QueryRow(
			`UPDATE users SET google_id=$1 WHERE email=$2 AND google_id IS NULL
			 RETURNING id, email, full_name, licence_type, created_at, locked_module_code`,
			info.Sub, info.Email,
		).Scan(&user.ID, &user.Email, &user.FullName, &user.LicenceType, &user.CreatedAt, &user.LockedModule)
	}

	isNewUser := false
	if err != nil {
		// No existing account by google_id or email — create one. The
		// password is unusable (random bytes, never shown to the user);
		// they can set a real one later via "forgot password" if they
		// also want email/password login.
		randomPass := uuid.New().String() + uuid.New().String()
		hash, hashErr := bcrypt.GenerateFromPassword([]byte(randomPass), bcrypt.DefaultCost)
		if hashErr != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": "internal error"})
			return
		}

		fullName := info.Name
		if fullName == "" {
			fullName = info.Email
		}

		err = h.db.QueryRow(
			`INSERT INTO users (id, email, password_hash, full_name, licence_type, google_id)
			 VALUES ($1,$2,$3,$4,'B1.1',$5)
			 RETURNING id, email, full_name, licence_type, created_at, locked_module_code`,
			uuid.New().String(), info.Email, string(hash), fullName, info.Sub,
		).Scan(&user.ID, &user.Email, &user.FullName, &user.LicenceType, &user.CreatedAt, &user.LockedModule)
		if err != nil {
			c.JSON(http.StatusConflict, gin.H{"error": "could not create account"})
			return
		}
		isNewUser = true
	}

	if isNewUser {
		if _, err := h.db.Exec(
			`INSERT INTO user_subscriptions (user_id, plan_id, status)
			 SELECT $1, id, 'active' FROM subscription_plans WHERE code = 'free'`,
			user.ID,
		); err != nil {
			log.Printf("failed to assign free plan to new google user %s: %v", user.ID, err)
		}
	}

	token, err := h.generateToken(user.ID, user.Email)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "token error"})
		return
	}

	status := http.StatusOK
	if isNewUser {
		status = http.StatusCreated
	}
	c.JSON(status, gin.H{"token": token, "user": user})
}
