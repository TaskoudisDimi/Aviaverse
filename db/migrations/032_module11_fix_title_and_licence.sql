-- Fix Module 11 metadata before seeding content:
-- 1. Title was wrongly "Aeroplane Aerodynamics" (that's Module 8) — actual content per
--    source (Library/Module 11 A&B) is Aeroplane Structures and Systems (11A Turbine, 11B Piston).
-- 2. licence_types defaulted to {B1,B2} (migration 007's blanket default), but the M11A
--    source textbook's own title page reads "Part 66 Module 11A for B1" — this module is
--    B1-only content, not common to B2.

UPDATE easa_modules SET title = 'Aeroplane Structures and Systems' WHERE code = 'M11';
UPDATE easa_modules SET licence_types = '{"B1"}' WHERE code = 'M11';
