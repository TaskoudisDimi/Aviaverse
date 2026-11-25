-- Per-subscription override of which modules are allowed, so an admin can
-- grant one specific user access to an arbitrary set of modules (e.g. "M13
-- and M14 for a month") without creating a one-off subscription_plans row
-- for every such request. NULL (the common case) means "use the plan's
-- own allowed_module_codes" — see COALESCE usage at every call site.
ALTER TABLE user_subscriptions ADD COLUMN IF NOT EXISTS custom_allowed_module_codes TEXT[];
