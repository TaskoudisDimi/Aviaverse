-- Migration 010: Re-file EWIS content from M03 to M07 (Maintenance Practices)
-- Reason: EWIS is officially EASA Part-66 Module 7 content (source doc was "IK M7A" —
-- Module 7A). M03 is reserved for Module 3 "Electrical Fundamentals" per the official
-- EASA syllabus, seeded separately in migrations 011+.
-- Idempotent: only acts if M03.1..M03.5 still exist (ie. not yet moved).

DO $$
DECLARE
    m07_id INT;
BEGIN
    SELECT id INTO m07_id FROM easa_modules WHERE code = 'M07';

    IF m07_id IS NULL THEN
        RAISE NOTICE 'M07 module not found – skipping.';
        RETURN;
    END IF;

    IF NOT EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M03.1' AND module_id = (SELECT id FROM easa_modules WHERE code = 'M03')) THEN
        RAISE NOTICE 'M03.1 (EWIS) not found under M03 – already moved or never seeded, skipping.';
        RETURN;
    END IF;

    UPDATE easa_subjects
    SET module_id = m07_id,
        code = 'M07.' || split_part(code, '.', 2)
    WHERE code IN ('M03.1', 'M03.2', 'M03.3', 'M03.4', 'M03.5')
      AND module_id = (SELECT id FROM easa_modules WHERE code = 'M03');

    RAISE NOTICE 'Moved EWIS subjects M03.1-M03.5 to M07.1-M07.5.';
END $$;
