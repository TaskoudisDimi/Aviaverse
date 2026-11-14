package handlers

import (
	"context"
	"fmt"
	"log"
	"time"
)

// StartUpgradeNudgeScheduler runs a daily background check for free-plan
// users due an upgrade-reminder email and sends them — first one 3 days
// after signup, then every 14 days, capped at 3 total so long-term free
// users aren't emailed forever. Safe to call once at service startup; it
// never returns.
func (h *Handler) StartUpgradeNudgeScheduler(ctx context.Context) {
	go func() {
		time.Sleep(1 * time.Minute) // let the service finish starting up first
		for {
			h.sendDueUpgradeNudges(ctx)
			time.Sleep(24 * time.Hour)
		}
	}()
}

type upgradeNudgeCandidate struct {
	id       string
	email    string
	fullName string
}

func (h *Handler) sendDueUpgradeNudges(ctx context.Context) {
	rows, err := h.db.QueryContext(ctx, `
		SELECT u.id, u.email, u.full_name
		FROM users u
		JOIN user_subscriptions us ON us.user_id = u.id
		JOIN subscription_plans sp ON sp.id = us.plan_id
		WHERE sp.code = 'free' AND us.status = 'active'
		  AND u.upgrade_email_count < 3
		  AND (
		    (u.upgrade_email_count = 0 AND u.created_at <= now() - interval '3 days')
		    OR (u.upgrade_email_count > 0 AND u.last_upgrade_email_at <= now() - interval '14 days')
		  )`)
	if err != nil {
		log.Printf("upgrade nudge query failed: %v", err)
		return
	}

	var due []upgradeNudgeCandidate
	for rows.Next() {
		var c upgradeNudgeCandidate
		if err := rows.Scan(&c.id, &c.email, &c.fullName); err != nil {
			log.Printf("upgrade nudge scan failed: %v", err)
			continue
		}
		due = append(due, c)
	}
	rows.Close()

	for _, c := range due {
		if err := h.mail.Send(c.email, "Unlock full access to VJet-Academy", upgradeNudgeEmailHTML(c.fullName, h.frontendURL)); err != nil {
			log.Printf("upgrade nudge email failed for %s: %v", c.email, err)
			continue // leave uncounted — we'll retry tomorrow
		}
		if _, err := h.db.ExecContext(ctx, `
			UPDATE users SET upgrade_email_count = upgrade_email_count + 1, last_upgrade_email_at = now()
			WHERE id = $1`, c.id,
		); err != nil {
			log.Printf("upgrade nudge DB update failed for user %s: %v", c.id, err)
		}
	}
}

func upgradeNudgeEmailHTML(fullName, frontendURL string) string {
	return fmt.Sprintf(`<p>Hi %s,</p>
<p>You're currently on VJet-Academy's free plan, which gives you one EASA Part-66 module and 20 AI Instructor messages a month.</p>
<p>Upgrade to Pro to unlock all 17 modules and 100 AI Instructor messages a month — full access to keep moving through your training without limits.</p>
<p><a href="%s/pricing">See plans and upgrade</a></p>`, fullName, frontendURL)
}
