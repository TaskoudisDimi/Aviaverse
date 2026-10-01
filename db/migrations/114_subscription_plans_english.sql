-- The rest of the app's UI is English-only; the plan names seeded in
-- 113_subscription_plans.sql were Greek. Correct them. Plain UPDATEs are
-- naturally idempotent, so this is safe to run more than once.

UPDATE subscription_plans SET name = 'Free'              WHERE code = 'free';
UPDATE subscription_plans SET name = 'Pro Monthly'       WHERE code = 'pro_monthly';
UPDATE subscription_plans SET name = '3-Month Exam Pass' WHERE code = 'exam_3month';
