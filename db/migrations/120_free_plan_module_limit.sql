-- The free plan's allowed_module_codes was seeded as just {M01}, which was
-- never actually enforced anywhere in code (see 113_subscription_plans.sql).
-- Now that content/exam access is gated by this column, widen it to the
-- intended free tier: modules 1-10, keeping the higher-value modules
-- (M11, M13, M14, M15, M16, M17) as paid-only.
UPDATE subscription_plans
SET allowed_module_codes = ARRAY['M01','M02','M03','M04','M05','M06','M07','M08','M09','M10'],
    updated_at = now()
WHERE code = 'free';
