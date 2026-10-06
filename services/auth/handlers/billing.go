package handlers

import (
	"database/sql"
	"encoding/json"
	"fmt"
	"io"
	"log"
	"net/http"

	"github.com/gin-gonic/gin"
	"github.com/stripe/stripe-go/v81"
	"github.com/stripe/stripe-go/v81/checkout/session"
	"github.com/stripe/stripe-go/v81/customer"
	"github.com/stripe/stripe-go/v81/subscription"
	"github.com/stripe/stripe-go/v81/webhook"
)

type checkoutReq struct {
	PlanCode string `json:"plan_code" binding:"required"`
}

// CreateCheckoutSession starts a real Stripe payment for a paid plan — a
// recurring Stripe Subscription for 'recurring' plans, or a single Stripe
// Payment for 'one_time' plans. The price is read from subscription_plans
// at request time (via price_data) rather than a pre-created Stripe Price,
// so changing price_cents with a plain UPDATE still works with no Stripe
// Dashboard changes needed.
func (h *Handler) CreateCheckoutSession(c *gin.Context) {
	if h.billing == nil || !h.billing.Enabled() {
		c.JSON(http.StatusServiceUnavailable, gin.H{"error": "billing is not configured"})
		return
	}

	userID := c.GetString("user_id")
	var req checkoutReq
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	var planName, currency, billingMode string
	var priceCents int
	err := h.db.QueryRow(
		`SELECT name, price_cents, currency, billing_mode FROM subscription_plans WHERE code = $1 AND active = true`,
		req.PlanCode,
	).Scan(&planName, &priceCents, &currency, &billingMode)
	if err == sql.ErrNoRows {
		c.JSON(http.StatusNotFound, gin.H{"error": "unknown plan"})
		return
	}
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "internal error"})
		return
	}
	if billingMode == "free" {
		c.JSON(http.StatusBadRequest, gin.H{"error": "the free plan doesn't need checkout — use /me/plan"})
		return
	}

	var email, fullName string
	var stripeCustomerID sql.NullString
	if err := h.db.QueryRow(
		`SELECT email, full_name, stripe_customer_id FROM users WHERE id = $1`, userID,
	).Scan(&email, &fullName, &stripeCustomerID); err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "internal error"})
		return
	}

	custID := stripeCustomerID.String
	if custID == "" {
		cust, err := customer.New(&stripe.CustomerParams{Email: stripe.String(email), Name: stripe.String(fullName)})
		if err != nil {
			log.Printf("stripe: create customer failed for user %s: %v", userID, err)
			c.JSON(http.StatusBadGateway, gin.H{"error": "could not start checkout"})
			return
		}
		custID = cust.ID
		if _, err := h.db.Exec(`UPDATE users SET stripe_customer_id = $1 WHERE id = $2`, custID, userID); err != nil {
			log.Printf("stripe: failed saving customer id for user %s: %v", userID, err)
		}
	}

	metadata := map[string]string{"user_id": userID, "plan_code": req.PlanCode}

	mode := stripe.CheckoutSessionModePayment
	priceData := &stripe.CheckoutSessionLineItemPriceDataParams{
		Currency: stripe.String(currency),
		ProductData: &stripe.CheckoutSessionLineItemPriceDataProductDataParams{
			Name: stripe.String(fmt.Sprintf("VJet-Academy — %s", planName)),
		},
		UnitAmount: stripe.Int64(int64(priceCents)),
	}

	params := &stripe.CheckoutSessionParams{
		Customer:   stripe.String(custID),
		SuccessURL: stripe.String(h.frontendURL + "/settings?checkout=success"),
		CancelURL:  stripe.String(h.frontendURL + "/pricing?checkout=canceled"),
		Metadata:   metadata,
		LineItems: []*stripe.CheckoutSessionLineItemParams{
			{PriceData: priceData, Quantity: stripe.Int64(1)},
		},
	}

	if billingMode == "recurring" {
		mode = stripe.CheckoutSessionModeSubscription
		priceData.Recurring = &stripe.CheckoutSessionLineItemPriceDataRecurringParams{
			Interval: stripe.String("month"),
		}
		params.SubscriptionData = &stripe.CheckoutSessionSubscriptionDataParams{Metadata: metadata}
	}
	params.Mode = stripe.String(string(mode))

	sess, err := session.New(params)
	if err != nil {
		log.Printf("stripe: create checkout session failed for user %s: %v", userID, err)
		c.JSON(http.StatusBadGateway, gin.H{"error": "could not start checkout"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"url": sess.URL})
}

// CancelSubscription cancels the caller's recurring Stripe subscription at
// the end of the current billing period — they keep access until then, and
// the subscription downgrades to the free plan via the
// customer.subscription.deleted webhook once Stripe actually ends it.
func (h *Handler) CancelSubscription(c *gin.Context) {
	if h.billing == nil || !h.billing.Enabled() {
		c.JSON(http.StatusServiceUnavailable, gin.H{"error": "billing is not configured"})
		return
	}

	userID := c.GetString("user_id")
	var paymentProvider sql.NullString
	var externalID sql.NullString
	var billingMode string
	err := h.db.QueryRow(`
		SELECT s.payment_provider, s.external_subscription_id, p.billing_mode
		FROM user_subscriptions s JOIN subscription_plans p ON p.id = s.plan_id
		WHERE s.user_id = $1 AND s.status = 'active'`, userID,
	).Scan(&paymentProvider, &externalID, &billingMode)
	if err == sql.ErrNoRows {
		c.JSON(http.StatusNotFound, gin.H{"error": "no active subscription"})
		return
	}
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "internal error"})
		return
	}
	if paymentProvider.String != "stripe" || billingMode != "recurring" || externalID.String == "" {
		c.JSON(http.StatusBadRequest, gin.H{"error": "no cancelable subscription — this plan isn't a recurring Stripe subscription"})
		return
	}

	if _, err := subscription.Update(externalID.String, &stripe.SubscriptionParams{
		CancelAtPeriodEnd: stripe.Bool(true),
	}); err != nil {
		log.Printf("stripe: cancel subscription failed for user %s: %v", userID, err)
		c.JSON(http.StatusBadGateway, gin.H{"error": "could not cancel subscription"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"message": "Your subscription will not renew and ends at the close of the current billing period."})
}

// StripeWebhook keeps user_subscriptions in sync with what actually happened
// in Stripe. It's the only place a subscription is ever marked as paid —
// CreateCheckoutSession only starts the payment, this confirms it.
func (h *Handler) StripeWebhook(c *gin.Context) {
	if h.billing == nil || h.billing.WebhookSecret == "" {
		c.JSON(http.StatusServiceUnavailable, gin.H{"error": "webhook not configured"})
		return
	}

	payload, err := io.ReadAll(c.Request.Body)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "could not read body"})
		return
	}

	// IgnoreAPIVersionMismatch: the Stripe account's API version advances on
	// its own and will often be ahead of whatever stripe-go happens to be
	// pinned to — fine here since this handler only reads a handful of
	// long-stable fields (id, metadata, mode, customer, subscription).
	event, err := webhook.ConstructEventWithOptions(
		payload, c.GetHeader("Stripe-Signature"), h.billing.WebhookSecret,
		webhook.ConstructEventOptions{IgnoreAPIVersionMismatch: true},
	)
	if err != nil {
		log.Printf("stripe webhook: signature verification failed: %v", err)
		c.JSON(http.StatusBadRequest, gin.H{"error": "invalid signature"})
		return
	}

	switch event.Type {
	case "checkout.session.completed":
		var sess stripe.CheckoutSession
		if err := json.Unmarshal(event.Data.Raw, &sess); err != nil {
			log.Printf("stripe webhook: bad checkout.session payload: %v", err)
			c.JSON(http.StatusOK, gin.H{}) // ack anyway — retrying won't fix a parse error
			return
		}
		h.activateSubscriptionFromCheckout(&sess)

	case "customer.subscription.deleted":
		var sub stripe.Subscription
		if err := json.Unmarshal(event.Data.Raw, &sub); err != nil {
			log.Printf("stripe webhook: bad subscription payload: %v", err)
			c.JSON(http.StatusOK, gin.H{})
			return
		}
		h.downgradeToFree(sub.ID)
	}

	c.JSON(http.StatusOK, gin.H{"received": true})
}

func (h *Handler) activateSubscriptionFromCheckout(sess *stripe.CheckoutSession) {
	userID := sess.Metadata["user_id"]
	planCode := sess.Metadata["plan_code"]
	if userID == "" || planCode == "" {
		log.Printf("stripe webhook: checkout session %s missing user_id/plan_code metadata", sess.ID)
		return
	}

	var planID int
	var periodDays sql.NullInt32
	var billingMode string
	if err := h.db.QueryRow(
		`SELECT id, period_days, billing_mode FROM subscription_plans WHERE code = $1`, planCode,
	).Scan(&planID, &periodDays, &billingMode); err != nil {
		log.Printf("stripe webhook: unknown plan_code %q on checkout session %s: %v", planCode, sess.ID, err)
		return
	}

	externalID := sess.ID
	if sess.Subscription != nil {
		externalID = sess.Subscription.ID
	}

	// Recurring subscriptions have no fixed expiry here — Stripe renews them
	// automatically until canceled. One-time plans expire after period_days.
	var expiresAtSQL string
	var args []interface{}
	if billingMode == "recurring" {
		expiresAtSQL = "NULL"
		args = []interface{}{planID, "stripe", externalID, userID}
	} else {
		expiresAtSQL = "now() + ($5::int || ' days')::interval"
		args = []interface{}{planID, "stripe", externalID, userID, periodDays}
	}

	res, err := h.db.Exec(fmt.Sprintf(`
		UPDATE user_subscriptions
		SET plan_id = $1, started_at = now(), expires_at = %s,
		    payment_provider = $2, external_subscription_id = $3,
		    status = 'active', updated_at = now()
		WHERE user_id = $4 AND status = 'active'`, expiresAtSQL), args...)
	if err != nil {
		log.Printf("stripe webhook: failed updating subscription for user %s: %v", userID, err)
		return
	}
	if n, _ := res.RowsAffected(); n == 0 {
		insertArgs := append([]interface{}{userID}, args[:3]...)
		if billingMode == "recurring" {
			h.db.Exec(`INSERT INTO user_subscriptions (user_id, plan_id, payment_provider, external_subscription_id, status)
			 VALUES ($1, $2, $3, $4, 'active')`, insertArgs...)
		} else {
			insertArgs = append(insertArgs, periodDays)
			h.db.Exec(`INSERT INTO user_subscriptions (user_id, plan_id, payment_provider, external_subscription_id, status, expires_at)
			 VALUES ($1, $2, $3, $4, 'active', now() + ($5::int || ' days')::interval)`, insertArgs...)
		}
	}

	if sess.Customer != nil {
		h.db.Exec(`UPDATE users SET stripe_customer_id = $1 WHERE id = $2 AND stripe_customer_id IS NULL`, sess.Customer.ID, userID)
	}
}

func (h *Handler) downgradeToFree(stripeSubscriptionID string) {
	var freePlanID int
	if err := h.db.QueryRow(`SELECT id FROM subscription_plans WHERE code = 'free'`).Scan(&freePlanID); err != nil {
		log.Printf("stripe webhook: could not find free plan: %v", err)
		return
	}
	if _, err := h.db.Exec(`
		UPDATE user_subscriptions
		SET plan_id = $1, status = 'active', payment_provider = NULL,
		    external_subscription_id = NULL, expires_at = NULL, updated_at = now()
		WHERE external_subscription_id = $2 AND status = 'active'`,
		freePlanID, stripeSubscriptionID,
	); err != nil {
		log.Printf("stripe webhook: failed downgrading subscription %s: %v", stripeSubscriptionID, err)
	}
}
