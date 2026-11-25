package handlers

import (
	"context"
	"database/sql"
	"net/http"
	"strings"
	"time"

	"github.com/gin-gonic/gin"
)

// trialPlanCode is the plan granted to org-invited users for the trial
// window — full module access, same as a real paid subscription. Trial
// length itself comes from the organisation, not this plan's period_days.
const trialPlanCode = "pro_monthly"

type organisationResp struct {
	ID            int       `json:"id"`
	Name          string    `json:"name"`
	ContactName   *string   `json:"contact_name"`
	ContactEmail  *string   `json:"contact_email"`
	TrialDays     int       `json:"trial_days"`
	Notes         *string   `json:"notes"`
	CreatedAt     time.Time `json:"created_at"`
	InvitedCount  int       `json:"invited_count"`
	AcceptedCount int       `json:"accepted_count"`
}

// ListOrganisations returns every organisation with invite counts, for the
// admin Organisations tab.
func (h *Handler) ListOrganisations(c *gin.Context) {
	rows, err := h.db.Query(`
		SELECT o.id, o.name, o.contact_name, o.contact_email, o.trial_days, o.notes, o.created_at,
		       count(oi.id) AS invited_count,
		       count(oi.id) FILTER (WHERE oi.status = 'accepted') AS accepted_count
		FROM organisations o
		LEFT JOIN organisation_invites oi ON oi.organisation_id = o.id
		GROUP BY o.id
		ORDER BY o.created_at DESC`)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "internal error"})
		return
	}
	defer rows.Close()

	orgs := []organisationResp{}
	for rows.Next() {
		var o organisationResp
		if err := rows.Scan(&o.ID, &o.Name, &o.ContactName, &o.ContactEmail, &o.TrialDays, &o.Notes, &o.CreatedAt,
			&o.InvitedCount, &o.AcceptedCount); err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": "internal error"})
			return
		}
		orgs = append(orgs, o)
	}
	c.JSON(http.StatusOK, orgs)
}

type createOrganisationReq struct {
	Name         string `json:"name" binding:"required"`
	ContactName  string `json:"contact_name"`
	ContactEmail string `json:"contact_email"`
	TrialDays    int    `json:"trial_days"`
	Notes        string `json:"notes"`
}

// CreateOrganisation adds a new school/organisation. TrialDays defaults to
// 14 if left at 0.
func (h *Handler) CreateOrganisation(c *gin.Context) {
	var req createOrganisationReq
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}
	if req.TrialDays <= 0 {
		req.TrialDays = 14
	}

	var id int
	err := h.db.QueryRow(
		`INSERT INTO organisations (name, contact_name, contact_email, trial_days, notes)
		 VALUES ($1, $2, $3, $4, $5) RETURNING id`,
		req.Name, nullIfEmpty(req.ContactName), nullIfEmpty(req.ContactEmail), req.TrialDays, nullIfEmpty(req.Notes),
	).Scan(&id)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "internal error"})
		return
	}
	c.JSON(http.StatusCreated, gin.H{"id": id})
}

type updateOrganisationReq struct {
	Name         string `json:"name" binding:"required"`
	ContactName  string `json:"contact_name"`
	ContactEmail string `json:"contact_email"`
	TrialDays    int    `json:"trial_days"`
	Notes        string `json:"notes"`
}

// AdminUpdateOrganisation edits a school's details. Only affects future
// invites' trial length — invites already accepted keep the expires_at
// they were granted with.
func (h *Handler) AdminUpdateOrganisation(c *gin.Context) {
	id := c.Param("id")
	var req updateOrganisationReq
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}
	if req.TrialDays <= 0 {
		req.TrialDays = 14
	}

	res, err := h.db.Exec(
		`UPDATE organisations SET name = $1, contact_name = $2, contact_email = $3, trial_days = $4, notes = $5
		 WHERE id = $6`,
		req.Name, nullIfEmpty(req.ContactName), nullIfEmpty(req.ContactEmail), req.TrialDays, nullIfEmpty(req.Notes), id,
	)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "internal error"})
		return
	}
	if n, _ := res.RowsAffected(); n == 0 {
		c.JSON(http.StatusNotFound, gin.H{"error": "organisation not found"})
		return
	}
	c.JSON(http.StatusOK, gin.H{"ok": true})
}

// AdminDeleteOrganisation removes a school and its invite list. Students
// who already accepted keep whatever access/expiry they were granted —
// their user_subscriptions row just loses the organisation tag
// (ON DELETE SET NULL), since deleting the school record shouldn't revoke
// access already given to a real person.
func (h *Handler) AdminDeleteOrganisation(c *gin.Context) {
	id := c.Param("id")
	res, err := h.db.Exec(`DELETE FROM organisations WHERE id = $1`, id)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "internal error"})
		return
	}
	if n, _ := res.RowsAffected(); n == 0 {
		c.JSON(http.StatusNotFound, gin.H{"error": "organisation not found"})
		return
	}
	c.JSON(http.StatusOK, gin.H{"ok": true})
}

type inviteResp struct {
	ID         int        `json:"id"`
	Email      string     `json:"email"`
	Status     string     `json:"status"`
	InvitedAt  time.Time  `json:"invited_at"`
	AcceptedAt *time.Time `json:"accepted_at"`
	UserID     *string    `json:"user_id"`
	UserName   *string    `json:"user_name"`
	ExpiresAt  *time.Time `json:"trial_expires_at"`
}

// GetOrganisation returns one organisation's details plus its full invite
// roster (joined to the linked user's name and current plan expiry, once
// accepted), for the admin detail panel.
func (h *Handler) GetOrganisation(c *gin.Context) {
	id := c.Param("id")

	var o organisationResp
	err := h.db.QueryRow(`
		SELECT o.id, o.name, o.contact_name, o.contact_email, o.trial_days, o.notes, o.created_at
		FROM organisations o WHERE o.id = $1`, id,
	).Scan(&o.ID, &o.Name, &o.ContactName, &o.ContactEmail, &o.TrialDays, &o.Notes, &o.CreatedAt)
	if err == sql.ErrNoRows {
		c.JSON(http.StatusNotFound, gin.H{"error": "organisation not found"})
		return
	}
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "internal error"})
		return
	}

	rows, err := h.db.Query(`
		SELECT oi.id, oi.email, oi.status, oi.invited_at, oi.accepted_at, oi.user_id, u.full_name, us.expires_at
		FROM organisation_invites oi
		LEFT JOIN users u ON u.id = oi.user_id
		LEFT JOIN user_subscriptions us ON us.user_id = oi.user_id AND us.status = 'active'
		WHERE oi.organisation_id = $1
		ORDER BY oi.invited_at DESC`, id)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "internal error"})
		return
	}
	defer rows.Close()

	invites := []inviteResp{}
	for rows.Next() {
		var inv inviteResp
		if err := rows.Scan(&inv.ID, &inv.Email, &inv.Status, &inv.InvitedAt, &inv.AcceptedAt, &inv.UserID, &inv.UserName, &inv.ExpiresAt); err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": "internal error"})
			return
		}
		invites = append(invites, inv)
		o.InvitedCount++
		if inv.Status == "accepted" {
			o.AcceptedCount++
		}
	}

	c.JSON(http.StatusOK, gin.H{"organisation": o, "invites": invites})
}

type inviteReq struct {
	Emails []string `json:"emails" binding:"required"`
}

// InviteToOrganisation bulk-adds pending invites for up to 10 emails at a
// time. Already-invited emails for the same org are skipped silently
// (re-inviting is a no-op, not an error) so the admin can paste the same
// list twice without it breaking.
func (h *Handler) InviteToOrganisation(c *gin.Context) {
	orgID := c.Param("id")

	var req inviteReq
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	emails := make([]string, 0, len(req.Emails))
	for _, e := range req.Emails {
		e = strings.TrimSpace(e)
		if e != "" {
			emails = append(emails, e)
		}
	}
	if len(emails) == 0 {
		c.JSON(http.StatusBadRequest, gin.H{"error": "no emails given"})
		return
	}
	if len(emails) > 10 {
		c.JSON(http.StatusBadRequest, gin.H{"error": "at most 10 emails per invite batch"})
		return
	}

	added := 0
	for _, email := range emails {
		res, err := h.db.Exec(
			`INSERT INTO organisation_invites (organisation_id, email)
			 VALUES ($1, $2) ON CONFLICT (organisation_id, email) DO NOTHING`,
			orgID, email,
		)
		if err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": "internal error"})
			return
		}
		if n, _ := res.RowsAffected(); n > 0 {
			added++
		}
	}

	// Anyone on this list who already has an account should get the trial
	// immediately, rather than waiting for their next login.
	rows, err := h.db.Query(`SELECT id, email FROM users WHERE lower(email) = ANY($1)`,
		lowerAll(emails))
	if err == nil {
		defer rows.Close()
		for rows.Next() {
			var userID, email string
			if rows.Scan(&userID, &email) == nil {
				h.grantPendingOrgInvite(c.Request.Context(), userID, email)
			}
		}
	}

	c.JSON(http.StatusOK, gin.H{"added": added, "skipped": len(emails) - added})
}

// RevokeInvite cancels a still-pending invite (e.g. a typo'd email). It
// has no effect on an invite that's already been accepted — revoking
// someone's access once they've started using it is a plan change, not an
// invite action.
func (h *Handler) RevokeInvite(c *gin.Context) {
	inviteID := c.Param("inviteId")
	res, err := h.db.Exec(
		`UPDATE organisation_invites SET status = 'revoked' WHERE id = $1 AND status = 'pending'`,
		inviteID,
	)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "internal error"})
		return
	}
	if n, _ := res.RowsAffected(); n == 0 {
		c.JSON(http.StatusConflict, gin.H{"error": "invite is not pending (already accepted or revoked)"})
		return
	}
	c.JSON(http.StatusOK, gin.H{"ok": true})
}

// grantPendingOrgInvite checks whether this email has a pending invite
// from an organisation and, if so, grants the trial: the user's existing
// active subscription row (every account has exactly one) is updated in
// place to the trial plan with an expiry set from the organisation's
// trial_days, tagged with the organisation for traceability. Called after
// every successful register/login/Google-login — idempotent, since the
// invite flips to 'accepted' the first time it fires and the WHERE clause
// below only ever matches a 'pending' one. Failures are swallowed: a
// hiccup here must never block a normal login.
func (h *Handler) grantPendingOrgInvite(ctx context.Context, userID, email string) {
	var inviteID, orgID, trialDays int
	err := h.db.QueryRowContext(ctx, `
		SELECT oi.id, o.id, o.trial_days
		FROM organisation_invites oi
		JOIN organisations o ON o.id = oi.organisation_id
		WHERE lower(oi.email) = lower($1) AND oi.status = 'pending'
		ORDER BY oi.invited_at DESC
		LIMIT 1`, email,
	).Scan(&inviteID, &orgID, &trialDays)
	if err != nil {
		return
	}

	var planID int
	if err := h.db.QueryRowContext(ctx,
		`SELECT id FROM subscription_plans WHERE code = $1 AND active = true`, trialPlanCode,
	).Scan(&planID); err != nil {
		return
	}

	tx, err := h.db.BeginTx(ctx, nil)
	if err != nil {
		return
	}
	defer tx.Rollback()

	if _, err := tx.ExecContext(ctx, `
		UPDATE user_subscriptions
		SET plan_id = $1,
		    started_at = now(),
		    expires_at = now() + ($2 || ' days')::interval,
		    payment_provider = 'organisation_trial',
		    organisation_id = $3,
		    status = 'active',
		    updated_at = now()
		WHERE user_id = $4 AND status = 'active'`,
		planID, trialDays, orgID, userID,
	); err != nil {
		return
	}
	if _, err := tx.ExecContext(ctx,
		`UPDATE organisation_invites SET status = 'accepted', accepted_at = now(), user_id = $1 WHERE id = $2`,
		userID, inviteID,
	); err != nil {
		return
	}
	tx.Commit()
}

func nullIfEmpty(s string) *string {
	if strings.TrimSpace(s) == "" {
		return nil
	}
	return &s
}

func lowerAll(ss []string) []string {
	out := make([]string, len(ss))
	for i, s := range ss {
		out[i] = strings.ToLower(s)
	}
	return out
}
