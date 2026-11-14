-- Widens the free-tier module lock: it used to apply only to the exam
-- simulator (study access stayed open to all of the plan's modules). The
-- client now wants a single lock that covers both study content and the
-- exam simulator — whichever module a free user opens first (to study OR
-- to test) becomes their one module, permanently, until they upgrade.
ALTER TABLE users RENAME COLUMN locked_exam_module_code TO locked_module_code;
