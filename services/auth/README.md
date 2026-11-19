# auth

Accounts, authentication, and billing. Port 8081.

- Register/login (email+password and Google Sign-In), JWT issuance
  (`handlers/auth.go`, `handlers/oauth.go`).
- Subscription plans and Stripe checkout/webhooks (`billing/`).
- Transactional email — password reset, upgrade-nudge reminders
  (`mailer/`, `handlers/upgrade_nudge.go`).
- Admin endpoints: user/transaction management (`handlers/admin.go`).

See [docs/architecture.md](../../docs/architecture.md) for how this fits
with the other services.
