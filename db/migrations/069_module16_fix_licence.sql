-- Module 16 (Piston Engine) was set to licence_types {"B1.2"} at the module level.
-- Same class of bug as migration 027: the exam backend filters with
-- `$2 = ANY(q.licence_types)` where $2 is literally the string 'B1' or 'B2' (the
-- only two values the frontend ever sends), and the module list endpoint
-- (services/content/handlers/content.go) also does `$1 = ANY(licence_types)` when
-- a licence_type filter is passed. "B1.2" matches neither, so this module (and any
-- questions seeded under it) would be invisible to B1 users in either code path.
-- No questions exist yet for M16, so only the module-level fix is needed here;
-- new M16 content will be seeded with licence_types {"B1"} directly.

UPDATE easa_modules SET licence_types = '{"B1"}' WHERE code = 'M16';
