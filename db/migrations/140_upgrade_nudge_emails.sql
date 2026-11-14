-- Tracks the free-plan upgrade nudge emails: first one 3 days after
-- signup, then every 14 days, capped at 3 total so free users who never
-- convert aren't emailed forever.
ALTER TABLE users ADD COLUMN IF NOT EXISTS upgrade_email_count INT NOT NULL DEFAULT 0;
ALTER TABLE users ADD COLUMN IF NOT EXISTS last_upgrade_email_at TIMESTAMPTZ;
