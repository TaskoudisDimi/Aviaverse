-- Part-147 Organisation Access: lets the client grant a flight school a
-- batch of time-boxed trial accounts (bulk-invite up to N emails -> each
-- gets full-access on signup/login for a set number of days), and keeps
-- track of which user profiles belong to which school for the later
-- paid-conversion conversation.
CREATE TABLE IF NOT EXISTS organisations (
    id           SERIAL PRIMARY KEY,
    name         TEXT NOT NULL,
    contact_name TEXT,
    contact_email TEXT,
    trial_days   INT NOT NULL DEFAULT 14,
    notes        TEXT,
    created_at   TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- One row per invited email. Granting happens lazily, the first time that
-- email registers or logs in (see grantPendingOrgInvite) — not at invite
-- time — since the email may not have an account yet.
CREATE TABLE IF NOT EXISTS organisation_invites (
    id              SERIAL PRIMARY KEY,
    organisation_id INT NOT NULL REFERENCES organisations(id) ON DELETE CASCADE,
    email           TEXT NOT NULL,
    status          TEXT NOT NULL DEFAULT 'pending' CHECK (status IN ('pending', 'accepted', 'revoked')),
    invited_at      TIMESTAMPTZ NOT NULL DEFAULT now(),
    accepted_at     TIMESTAMPTZ,
    user_id         UUID REFERENCES users(id) ON DELETE SET NULL,
    UNIQUE (organisation_id, email)
);

CREATE INDEX IF NOT EXISTS organisation_invites_email_idx ON organisation_invites (lower(email));

-- Tags the subscription row granted via an org trial, so admins can see
-- which school a user's access came from (and so a later real conversion
-- just updates this same row, same as AdminChangePlan already does).
ALTER TABLE user_subscriptions ADD COLUMN IF NOT EXISTS organisation_id INT REFERENCES organisations(id) ON DELETE SET NULL;
