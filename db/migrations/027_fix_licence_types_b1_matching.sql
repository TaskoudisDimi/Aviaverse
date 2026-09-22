-- Fix: questions seeded with {"B1.1","B1.3","B2"} never match a B1 exam request.
-- The exam service filters with `$2 = ANY(q.licence_types)` where $2 is the literal
-- string 'B1' or 'B2' (see services/exam/handlers/exam.go) — the frontend only ever
-- sends those two values (ExamSetupView.vue). "B1.1"/"B1.3" are not "B1", so every
-- B1-license user was getting zero questions from M03/M07/M08/M09. Safe to re-run:
-- the WHERE clause is a no-op once already fixed.

UPDATE questions
SET licence_types = '{"B1","B2"}'
WHERE licence_types = '{"B1.1","B1.3","B2"}';
