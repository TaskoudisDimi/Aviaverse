-- Google Sign-In: links an account to its Google subject id. Nullable —
-- most existing accounts registered with email/password and have no
-- Google link. Unique so one Google account can't attach to two users.
ALTER TABLE users ADD COLUMN IF NOT EXISTS google_id TEXT UNIQUE;

-- Reviews: a user can leave one review per module, plus one overall
-- platform review (module_id NULL). Enforced via two partial unique
-- indexes below since a plain UNIQUE(user_id, module_id) wouldn't stop a
-- user from leaving multiple NULL-module (overall) reviews.
CREATE TABLE IF NOT EXISTS reviews (
    id         SERIAL PRIMARY KEY,
    user_id    UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    module_id  INT REFERENCES easa_modules(id) ON DELETE CASCADE,
    rating     SMALLINT NOT NULL CHECK (rating BETWEEN 1 AND 5),
    comment    TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE UNIQUE INDEX IF NOT EXISTS reviews_user_module_uniq
    ON reviews(user_id, module_id) WHERE module_id IS NOT NULL;
CREATE UNIQUE INDEX IF NOT EXISTS reviews_user_app_uniq
    ON reviews(user_id) WHERE module_id IS NULL;
CREATE INDEX IF NOT EXISTS reviews_module_id_idx ON reviews(module_id);
