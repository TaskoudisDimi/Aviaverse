-- 007: Simplify licence categories to B1/B2 scheme + remove M12
-- Safe to re-run: UPDATEs are idempotent, DELETE on non-existent row is a no-op

-- 1. Set all modules to B1/B2
UPDATE easa_modules SET licence_types = '{"B1","B2"}';

-- 2. Module-specific overrides
UPDATE easa_modules SET licence_types = '{"B2"}'   WHERE code = 'M13';
UPDATE easa_modules SET licence_types = '{"B2"}'   WHERE code = 'M14';
UPDATE easa_modules SET licence_types = '{"B1"}'   WHERE code = 'M15';
UPDATE easa_modules SET licence_types = '{"B1.2"}' WHERE code = 'M16';

-- 3. Update all questions to B1/B2
UPDATE questions SET licence_types = '{"B1","B2"}';

-- 4. Propagate module overrides to questions
UPDATE questions SET licence_types = '{"B2"}'
  WHERE subject_id IN (
    SELECT es.id FROM easa_subjects es
    JOIN easa_modules em ON es.module_id = em.id
    WHERE em.code IN ('M13','M14')
  );

UPDATE questions SET licence_types = '{"B1"}'
  WHERE subject_id IN (
    SELECT es.id FROM easa_subjects es
    JOIN easa_modules em ON es.module_id = em.id
    WHERE em.code = 'M15'
  );

UPDATE questions SET licence_types = '{"B1.2"}'
  WHERE subject_id IN (
    SELECT es.id FROM easa_subjects es
    JOIN easa_modules em ON es.module_id = em.id
    WHERE em.code = 'M16'
  );

-- 5. Remove Module 12 (CASCADE deletes easa_subjects + questions)
DELETE FROM easa_modules WHERE code = 'M12';
