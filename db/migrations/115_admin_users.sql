-- Adds an admin flag to users, and grants it to the owner account so there's
-- always at least one admin able to use the admin page to promote others.

ALTER TABLE users ADD COLUMN IF NOT EXISTS is_admin BOOLEAN NOT NULL DEFAULT false;

UPDATE users SET is_admin = true WHERE email = 'taskoudisdimitris@gmail.com';
