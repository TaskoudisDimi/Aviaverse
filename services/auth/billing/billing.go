// Package billing wires up the Stripe Go SDK. The SDK is used via its
// package-level functions (checkout/session, customer, subscription), which
// read the API key from the process-wide stripe.Key — Enabled() just tells
// callers whether that key was actually set, so a missing key degrades the
// billing endpoints instead of panicking.
package billing

import (
	"os"

	"github.com/stripe/stripe-go/v81"
)

type Client struct {
	enabled       bool
	WebhookSecret string
}

func NewClient() *Client {
	key := os.Getenv("STRIPE_SECRET_KEY")
	if key == "" {
		return &Client{}
	}
	stripe.Key = key
	return &Client{enabled: true, WebhookSecret: os.Getenv("STRIPE_WEBHOOK_SECRET")}
}

func (c *Client) Enabled() bool {
	return c.enabled
}
