-- Migration 016: Fix M02 content flagged by a source-material audit
-- (client reported exam questions not traceable to the provided course PDFs;
-- audit compared all M02/M03/M07 questions against the actual source PDFs/text).
--
-- M02 findings (4 questions, all in M02.3/M02.5):
--   - 2 questions test material with no basis in any provided M02 source
--     (aircraft refrigeration systems; NDT/ultrasonic inspection — the latter
--     is also the wrong module, NDT belongs to M06 Materials & Hardware).
--   - 1 question (ANR headsets) is not grounded in any provided source.
--   - 1 question directly CONTRADICTS the primary source: the DB's answer
--     claims the audible range is 20 Hz–20 kHz, but the "IK M2" course PDF
--     explicitly states the average person hears 100 Hz–20 kHz. Fixed to
--     match the source rather than removed, since the topic itself is valid.
-- The matching lesson-content passages (not just the questions) are cleaned
-- up too, since they contained the same unsourced claims.
--
-- Idempotent: DELETEs/UPDATEs target fixed row IDs, safe to re-run.

DO $$
BEGIN
    -- Remove the 2 fully unsourced questions + the unsourced ANR question
    DELETE FROM questions WHERE id IN (
        '83a0ebb8-fdb0-4035-81b6-21c54414d1eb', -- M02.3: aircraft refrigeration systems
        '1e05bf5f-1586-4771-b07b-172545931d21', -- M02.5: NDT/ultrasonic inspection (wrong module too)
        'e6616154-0dfd-425e-a1c6-207c25a4f662'  -- M02.5: ANR headsets
    );

    -- Fix the contradicted answer: source says 100 Hz-20 kHz, not 20 Hz-20 kHz
    UPDATE questions
    SET options = '[{"id":"a","text":"0 – 20 Hz","correct":false},{"id":"b","text":"100 Hz – 20 kHz","correct":true},{"id":"c","text":"20 kHz – 200 kHz","correct":false},{"id":"d","text":"1 Hz – 1 kHz","correct":false}]'::jsonb
    WHERE id = '8107c1b2-6899-44b2-a905-81b8f57d7d39';

    -- Clean the matching lesson content: M02.3 (Thermodynamics)
    UPDATE easa_subjects
    SET content = replace(
        content,
        E'In aircraft air-conditioning and refrigeration systems, refrigerants absorb latent heat on evaporation, providing cooling.\n\n',
        ''
    )
    WHERE code = 'M02.3';

    -- Clean the matching lesson content: M02.5 (Wave Motion and Sound)
    UPDATE easa_subjects
    SET content = replace(
        replace(
            replace(
                content,
                E'- **Ultrasonic inspection (NDT)** uses high-frequency sound waves to detect internal cracks without dismantling components\n',
                ''
            ),
            E'- **Cockpit noise** levels are regulated; pilots use ANR (Active Noise Reduction) headsets which produce destructive interference to cancel engine noise\n',
            ''
        ),
        E'- Audible sound: 20 Hz – 20 kHz',
        E'- Audible sound: 100 Hz – 20 kHz (average person; commonly cited as 20 Hz–20 kHz in general references)'
    )
    WHERE code = 'M02.5';
END $$;
