-- Distinguishes "pick any N modules from this list, but only ever lock to
-- the first one you touch" (the free plan) from "these exact modules are
-- all allowed, no further locking" (e.g. the B2 avionics trial, M13+M14
-- both). Both show up as a restricted (non-null) allowed_module_codes
-- array, which is why a single flag is needed here rather than inferring
-- intent from the array itself.
ALTER TABLE subscription_plans ADD COLUMN IF NOT EXISTS lock_to_first_module BOOLEAN NOT NULL DEFAULT false;
UPDATE subscription_plans SET lock_to_first_module = true WHERE code = 'free';
