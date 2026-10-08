-- A durable ledger of every successful Stripe payment (initial checkout AND
-- recurring renewals), independent of user_subscriptions which only tracks
-- the CURRENT plan state. Needed so the admin Transactions tab — and the
-- monthly export handed to the accountant for myDATA — has a full history,
-- not just a snapshot.

CREATE TABLE IF NOT EXISTS payment_transactions (
    id               SERIAL PRIMARY KEY,
    user_id          UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    plan_id          INT REFERENCES subscription_plans(id),
    amount_cents     INT NOT NULL,
    currency         TEXT NOT NULL,
    description      TEXT NOT NULL,
    stripe_reference TEXT NOT NULL UNIQUE, -- Checkout Session id or Invoice id — also the idempotency key for webhook retries
    created_at       TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS payment_transactions_user_id_idx ON payment_transactions (user_id);
CREATE INDEX IF NOT EXISTS payment_transactions_created_at_idx ON payment_transactions (created_at);
