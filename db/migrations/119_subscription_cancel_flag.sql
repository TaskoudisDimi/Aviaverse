-- Tracks whether an active recurring subscription is set to cancel at the
-- end of the current billing period. Needed so the UI can show "cancels on
-- X" and hide the Cancel button after a successful cancellation, instead of
-- silently doing nothing visible (canceling at period end doesn't change
-- status/plan_id immediately — Stripe only ends it later via
-- customer.subscription.deleted).

ALTER TABLE user_subscriptions ADD COLUMN IF NOT EXISTS cancel_at_period_end BOOLEAN NOT NULL DEFAULT false;
