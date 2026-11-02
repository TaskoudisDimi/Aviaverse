-- Free-tier users can study any of their allowed modules (M01-M10), but the
-- exam simulator itself is capped to a single module per the client's
-- request: whichever module a free user first starts an exam on becomes
-- permanently locked in until they upgrade to a paid plan.
ALTER TABLE users ADD COLUMN IF NOT EXISTS locked_exam_module_code TEXT;
