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

	// Canceling at period end doesn't change status/plan_id — Stripe only
	// ends it later via customer.subscription.deleted — so without this the
	// UI has no way to show "cancels on X" or know not to offer Cancel again.
	if _, err := h.db.Exec(
		`UPDATE user_subscriptions SET cancel_at_period_end = true WHERE user_id = $1 AND status = 'active'`,
		userID,
	); err != nil {
		log.Printf("stripe: failed flagging cancel_at_period_end for user %s: %v", userID, err)
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

	case "invoice.paid":
		// Fires on every recurring renewal charge (the initial charge is
		// logged separately by activateSubscriptionFromCheckout). This is
		// what makes a monthly Pro subscription show up more than once in
		// the transactions ledger.
		var inv stripe.Invoice
		if err := json.Unmarshal(event.Data.Raw, &inv); err != nil {
			log.Printf("stripe webhook: bad invoice payload: %v", err)
			c.JSON(http.StatusOK, gin.H{})
			return
		}
		h.logRenewalPayment(&inv)
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
	var planName string
	var periodDays sql.NullInt32
	var billingMode string
	if err := h.db.QueryRow(
		`SELECT id, name, period_days, billing_mode FROM subscription_plans WHERE code = $1`, planCode,
	).Scan(&planID, &planName, &periodDays, &billingMode); err != nil {
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
		    status = 'active', cancel_at_period_end = false, updated_at = now()
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

	h.logTransaction(userID, planID, int(sess.AmountTotal), string(sess.Currency),
		fmt.Sprintf("%s - initial payment", planName), sess.ID)
}

// logRenewalPayment records a recurring subscription's monthly charge. The
// user is looked up by the Stripe subscription id rather than metadata,
// since renewal invoices don't carry the Checkout Session's metadata.
func (h *Handler) logRenewalPayment(inv *stripe.Invoice) {
	if inv.Subscription == nil {
		return // one-time payments don't produce renewal invoices
	}
	var userID string
	var planID int
	var planName string
	err := h.db.QueryRow(`
		SELECT s.user_id, s.plan_id, sp.name
		FROM user_subscriptions s JOIN subscription_plans sp ON sp.id = s.plan_id
		WHERE s.external_subscription_id = $1`, inv.Subscription.ID,
	).Scan(&userID, &planID, &planName)
	if err != nil {
		log.Printf("stripe webhook: no local subscription for invoice %s (sub %s): %v", inv.ID, inv.Subscription.ID, err)
		return
	}
	h.logTransaction(userID, planID, int(inv.AmountPaid), string(inv.Currency),
		fmt.Sprintf("%s - renewal", planName), inv.ID)
}

// logTransaction appends one row to the payment ledger. stripeReference is
// the idempotency key — Stripe may redeliver the same webhook event, and
// ON CONFLICT DO NOTHING keeps a retry from double-counting revenue.
func (h *Handler) logTransaction(userID string, planID, amountCents int, currency, description, stripeReference string) {
	if _, err := h.db.Exec(`
		INSERT INTO payment_transactions (user_id, plan_id, amount_cents, currency, description, stripe_reference)
		VALUES ($1, $2, $3, $4, $5, $6)
		ON CONFLICT (stripe_reference) DO NOTHING`,
		userID, planID, amountCents, currency, description, stripeReference,
	); err != nil {
		log.Printf("stripe webhook: failed logging transaction %s for user %s: %v", stripeReference, userID, err)
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
