-- Stripe billing support: a stable customer id per user (so repeat
-- checkouts reuse the same Stripe Customer instead of creating a new one
-- every time), and an explicit billing mode per plan so the checkout
-- handler doesn't have to infer "recurring vs one-time" from period_days.

ALTER TABLE users ADD COLUMN IF NOT EXISTS stripe_customer_id TEXT;

ALTER TABLE subscription_plans ADD COLUMN IF NOT EXISTS billing_mode TEXT NOT NULL DEFAULT 'recurring';
-- billing_mode: 'free' (no checkout), 'recurring' (Stripe subscription,
-- auto-renews until canceled), 'one_time' (single Stripe payment, access
-- expires after period_days with no further charge).

UPDATE subscription_plans SET billing_mode = 'free' WHERE code = 'free';
UPDATE subscription_plans SET billing_mode = 'one_time' WHERE code = 'exam_3month';
-- pro_monthly keeps the 'recurring' default.
