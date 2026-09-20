// Package mailer sends transactional email via the Resend API
// (https://resend.com/docs/api-reference/emails/send-email).
package mailer

import (
	"bytes"
	"encoding/json"
	"fmt"
	"net/http"
	"os"
)

type Client struct {
	apiKey string
	from   string
	http   *http.Client
}

func NewClient() *Client {
	return &Client{
		apiKey: os.Getenv("RESEND_API_KEY"),
		from:   os.Getenv("EMAIL_FROM"),
		http:   &http.Client{},
	}
}

// Enabled reports whether the mailer has the credentials it needs to send.
// Callers should check this and log/skip rather than fail hard, so a missing
// key doesn't take down registration/login — only the reset-email step.
func (c *Client) Enabled() bool {
	return c.apiKey != "" && c.from != ""
}

type sendReq struct {
	From    string   `json:"from"`
	To      []string `json:"to"`
	Subject string   `json:"subject"`
	HTML    string   `json:"html"`
}

func (c *Client) Send(to, subject, html string) error {
	if !c.Enabled() {
		return fmt.Errorf("mailer not configured: RESEND_API_KEY / EMAIL_FROM missing")
	}

	body, err := json.Marshal(sendReq{From: c.from, To: []string{to}, Subject: subject, HTML: html})
	if err != nil {
		return err
	}

	req, err := http.NewRequest(http.MethodPost, "https://api.resend.com/emails", bytes.NewReader(body))
	if err != nil {
		return err
	}
	req.Header.Set("Authorization", "Bearer "+c.apiKey)
	req.Header.Set("Content-Type", "application/json")

	resp, err := c.http.Do(req)
	if err != nil {
		return err
	}
	defer resp.Body.Close()

	if resp.StatusCode >= 300 {
		return fmt.Errorf("resend: unexpected status %d", resp.StatusCode)
	}
	return nil
}
