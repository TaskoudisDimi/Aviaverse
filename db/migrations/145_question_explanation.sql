-- Lets the client write a rationale for a specific question directly (e.g.
-- when a student sends a screenshot disputing an answer), instead of
-- waiting on a code change. NULL = not written yet.
ALTER TABLE questions ADD COLUMN IF NOT EXISTS explanation TEXT;
