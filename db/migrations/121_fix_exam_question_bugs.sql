-- Fixes two Exam Simulator bugs reported by the client:
--
-- 1) M16 (Piston Engine) questions were tagged licence_types {"B1.2"} instead
--    of {"B1"} — same bug class as migration 069, but on the question rows
--    this time (introduced outside any tracked migration, likely a manual
--    edit). StartExam filters with `$2 = ANY(q.licence_types)` where $2 is
--    literally 'B1' or 'B2' (the only values the frontend ever sends), so
--    these 129 questions never matched any real request: M16 exams returned
--    zero questions.
--
-- 2) M03 and M08 had the same question text duplicated dozens of times from
--    a non-idempotent seed re-run (M03: 3554 rows / 517 distinct texts, M08:
--    6735 rows / 529 distinct texts). With ORDER BY RANDOM() LIMIT N drawing
--    from a pool that's mostly near-duplicates of a small distinct set, the
--    same question was very likely to be drawn more than once per exam —
--    the "same question 5 times in a 10-question test" the client saw.

-- Fix 1: correct the licence tag on M16 questions.
UPDATE questions q
SET licence_types = '{"B1"}'
FROM easa_subjects s, easa_modules m
WHERE q.subject_id = s.id AND s.module_id = m.id AND m.code = 'M16'
  AND q.licence_types = '{"B1.2"}';

-- Fix 2: de-duplicate questions, keeping one canonical row per (subject_id, text).
-- Rows already referenced by a historical exam_answers entry are kept
-- regardless of duplication, since exam_answers.question_id has no
-- ON DELETE CASCADE and deleting them would break past exam results.
-- (questions.id is uuid, which has no MIN()/MAX() aggregate in Postgres,
-- hence ROW_NUMBER() instead of a GROUP BY MIN(id) approach.)
DELETE FROM questions q
USING (
    SELECT id, ROW_NUMBER() OVER (PARTITION BY subject_id, text ORDER BY id) AS rn
    FROM questions
) ranked
WHERE q.id = ranked.id
  AND ranked.rn > 1
  AND q.id NOT IN (SELECT DISTINCT question_id FROM exam_answers);
