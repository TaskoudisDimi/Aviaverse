-- Subscription plans and per-user subscriptions.
-- Prices/caps live in subscription_plans so they can be changed with a
-- plain UPDATE, no code change or redeploy required, e.g.:
--   UPDATE subscription_plans SET price_cents = 2500 WHERE code = 'pro_monthly';

CREATE TABLE IF NOT EXISTS subscription_plans (
    id                   SERIAL PRIMARY KEY,
    code                 TEXT NOT NULL UNIQUE,          -- 'free', 'pro_monthly', 'exam_3month'
    name                 TEXT NOT NULL,                  -- display name
    price_cents          INT NOT NULL,                   -- 2400 = €24.00; 0 = free
    currency             TEXT NOT NULL DEFAULT 'EUR',
    period_days          INT,                            -- NULL = never expires (free tier)
    ai_message_cap       INT NOT NULL,                   -- monthly AI Instructor message cap
    allowed_module_codes TEXT[],                         -- NULL = all modules; else just these
    active               BOOLEAN NOT NULL DEFAULT true,   -- inactive plans are hidden from new signups
    sort_order           INT NOT NULL DEFAULT 0,
    created_at           TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at           TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS user_subscriptions (
    id                       SERIAL PRIMARY KEY,
    user_id                  UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    plan_id                  INT NOT NULL REFERENCES subscription_plans(id),
    status                   TEXT NOT NULL DEFAULT 'active',  -- active, expired, canceled
    started_at               TIMESTAMPTZ NOT NULL DEFAULT now(),
    expires_at               TIMESTAMPTZ,                      -- NULL for the free tier
    payment_provider         TEXT,                             -- 'stripe', 'paddle', 'manual', NULL for free
    external_subscription_id TEXT,                             -- the provider's subscription/order id
    created_at               TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at               TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS user_subscriptions_user_id_idx ON user_subscriptions (user_id);
CREATE UNIQUE INDEX IF NOT EXISTS user_subscriptions_one_active_per_user
    ON user_subscriptions (user_id) WHERE status = 'active';

DO $$
BEGIN
    IF EXISTS (SELECT 1 FROM subscription_plans WHERE code = 'free') THEN
        RAISE NOTICE 'subscription_plans already seeded, skipping.';
        RETURN;
    END IF;

    INSERT INTO subscription_plans (code, name, price_cents, period_days, ai_message_cap, allowed_module_codes, sort_order) VALUES
    ('free',        'Δωρεάν',                    0,    NULL, 20,  '{M01}', 0),
    ('pro_monthly', 'Pro Μηνιαία Συνδρομή',       2400, 30,   100, NULL,    1),
    ('exam_3month', 'Πακέτο Εξέτασης 3 Μηνών',    5400, 90,   100, NULL,    2);

    -- Payments aren't wired up yet, so module-access gating is not enforced
    -- anywhere yet either (that's a deliberate follow-up step). Backfill
    -- every existing account onto Pro with no expiry and no payment
    -- provider, so nobody who already has an account loses access before
    -- there's any way for them to pay. New signups still default to 'free'
    -- going forward (see the auth service's registration handler).
    INSERT INTO user_subscriptions (user_id, plan_id, status, expires_at, payment_provider)
    SELECT u.id, (SELECT id FROM subscription_plans WHERE code = 'pro_monthly'), 'active', NULL, 'manual'
    FROM users u
    WHERE NOT EXISTS (SELECT 1 FROM user_subscriptions s WHERE s.user_id = u.id);
END $$;
