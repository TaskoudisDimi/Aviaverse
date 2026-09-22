-- Migration 017: Clean up M07 ahead of a proper rebuild from real source material.
-- Context: a content-grounding audit (session 2026-09-20) found M07.1, M07.3, and
-- M07.4 were substantially fabricated from general knowledge rather than the thin
-- EWIS presentation originally used as a source (36 of 64 questions ungrounded,
-- M07.4 100% fabricated). The client has since provided the actual official EASA
-- Module 7 "Maintenance Practices" course material (IK MOD 7A, section 7.7
-- "Electrical Cables and Connectors"), which is used to properly rebuild these
-- three subjects in migrations 018/019. M07.2 (ATSRAC history) and M07.5 (STA
-- findings) were confirmed well-grounded in the original EWIS presentation and
-- are kept — M07.2 has 3 ungrounded questions trimmed, M07.5 is renumbered to
-- M07.8 to make room for new subjects in the 7.7-sourced numbering.

DO $$
DECLARE
    m07_1_id INT;
    m07_3_id INT;
    m07_4_id INT;
BEGIN
    SELECT id INTO m07_1_id FROM easa_subjects WHERE code = 'M07.1';
    SELECT id INTO m07_3_id FROM easa_subjects WHERE code = 'M07.3';
    SELECT id INTO m07_4_id FROM easa_subjects WHERE code = 'M07.4';

    IF m07_1_id IS NULL THEN
        RAISE NOTICE 'M07.1 not found — cleanup already applied, skipping.';
        RETURN;
    END IF;

    -- Delete the 3 fabricated subjects and their questions
    DELETE FROM questions WHERE subject_id IN (m07_1_id, m07_3_id, m07_4_id);
    DELETE FROM easa_subjects WHERE id IN (m07_1_id, m07_3_id, m07_4_id);

    -- Trim the 3 ungrounded questions from M07.2 (dates/programme name not stated
    -- in the source presentation — well-known public facts, but not traceable to
    -- what the client actually provided, so removed per the stricter standard)
    DELETE FROM questions WHERE id IN (
        '43cd4ba9-6025-487d-86ba-0674ae5e6f10', -- EAPAS programme name
        '6b8aafbe-1a49-4909-b3a1-fae56c3b30c4', -- TWA 800 date (1996)
        '8a85a93f-3e3a-40fd-9bb8-c692c9c07269'  -- ATSRAC founding year (1998)
    );

    -- Renumber M07.5 (STA findings, fully grounded, unchanged) to M07.8 to free
    -- up M07.1/M07.3-M07.7 for the new 7.7-sourced subjects. sort_order is
    -- updated too so it displays last, after the new subjects.
    UPDATE easa_subjects SET code = 'M07.8', sort_order = 8 WHERE code = 'M07.5';

    RAISE NOTICE 'M07 cleanup complete: removed 3 fabricated subjects, trimmed M07.2, renumbered M07.5->M07.8.';
END $$;
