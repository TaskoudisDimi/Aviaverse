-- Migration 015: Password reset tokens
-- Supports the "forgot password" flow — a token is emailed to the user,
-- and the raw token is only ever stored as a SHA-256 hash (single-use,
-- short-lived, high-entropy random value — hashing protects against a
-- DB leak the same way password hashing does).

CREATE TABLE IF NOT EXISTS password_reset_tokens (
    id         UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id    UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    token_hash TEXT NOT NULL UNIQUE,
    expires_at TIMESTAMPTZ NOT NULL,
    used_at    TIMESTAMPTZ,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_password_reset_tokens_user_id ON password_reset_tokens(user_id);
