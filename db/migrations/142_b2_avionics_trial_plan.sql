-- One-off trial plan: full access to M13 (Aircraft Aerodynamic Structures)
-- and M14 (Propulsion) only — the two B2/avionics-specific modules. Used
-- to give a specific person a time-boxed preview of that content without
-- giving them the rest of the platform. Inactive (not shown on the public
-- pricing page or the self-service plan switcher) — granted by an admin
-- directly on a user's subscription row, not something anyone can pick.
INSERT INTO subscription_plans (code, name, price_cents, currency, period_days, ai_message_cap, allowed_module_codes, active, billing_mode)
VALUES ('b2_avionics_trial', 'B2 Avionics Trial (M13-M14)', 0, 'EUR', 30, 20, '{M13,M14}', false, 'free')
ON CONFLICT (code) DO NOTHING;
