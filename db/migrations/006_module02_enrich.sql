-- Migration 006: Enrich M02 subjects with extra questions from source PDFs
-- Sources: Basics of Fiber Optics (M02.4) + NAR Gyroscopic Principles (M02.2)
-- Idempotent: counts existing questions per subject; adds only if count < threshold

DO $$
DECLARE
    s_optics   INT;
    s_mech     INT;
    optics_cnt INT;
    mech_cnt   INT;
BEGIN
    SELECT id INTO s_optics FROM easa_subjects WHERE code = 'M02.4';
    SELECT id INTO s_mech   FROM easa_subjects WHERE code = 'M02.2';

    IF s_optics IS NULL OR s_mech IS NULL THEN
        RAISE NOTICE 'M02.4 or M02.2 not found – run 003_module02_seed.sql first.';
        RETURN;
    END IF;

    SELECT COUNT(*) INTO optics_cnt FROM questions WHERE subject_id = s_optics;
    SELECT COUNT(*) INTO mech_cnt   FROM questions WHERE subject_id = s_mech;

    -- ──────────────────────────────────────────────────────────────
    -- M02.4 Optics — Fiber Optics extra questions (add if < 20)
    -- ──────────────────────────────────────────────────────────────
    IF optics_cnt < 20 THEN

        -- FO-Q1
        INSERT INTO questions (subject_id, text, options, licence_types)
        VALUES (s_optics,
            'What physical principle allows light to be guided along a fiber optic cable?',
            '[{"id":"a","text":"Reflection from a metallic coating","correct":false},
              {"id":"b","text":"Total Internal Reflection (TIR)","correct":true},
              {"id":"c","text":"Diffraction at the fiber surface","correct":false},
              {"id":"d","text":"Refraction through the cladding","correct":false}]'::jsonb,
            '{"B1.1","B1.3","B2"}');

        -- FO-Q2
        INSERT INTO questions (subject_id, text, options, licence_types)
        VALUES (s_optics,
            'In a fiber optic cable, which part has the HIGHER refractive index?',
            '[{"id":"a","text":"Cladding","correct":false},
              {"id":"b","text":"Buffer coating","correct":false},
              {"id":"c","text":"Core","correct":true},
              {"id":"d","text":"Jacket","correct":false}]'::jsonb,
            '{"B1.1","B1.3","B2"}');

        -- FO-Q3
        INSERT INTO questions (subject_id, text, options, licence_types)
        VALUES (s_optics,
            'What is the standard core/cladding diameter (µm) of a single-mode fiber?',
            '[{"id":"a","text":"50/125","correct":false},
              {"id":"b","text":"62.5/125","correct":false},
              {"id":"c","text":"9/125","correct":true},
              {"id":"d","text":"100/140","correct":false}]'::jsonb,
            '{"B1.1","B1.3","B2"}');

        -- FO-Q4
        INSERT INTO questions (subject_id, text, options, licence_types)
        VALUES (s_optics,
            'Which type of fiber optic cable is used for LONG-DISTANCE, high-bandwidth communication?',
            '[{"id":"a","text":"Step-index multimode (50/125 µm)","correct":false},
              {"id":"b","text":"Graded-index multimode (62.5/125 µm)","correct":false},
              {"id":"c","text":"Single-mode (9/125 µm)","correct":true},
              {"id":"d","text":"Plastic optical fiber","correct":false}]'::jsonb,
            '{"B1.1","B1.3","B2"}');

        -- FO-Q5
        INSERT INTO questions (subject_id, text, options, licence_types)
        VALUES (s_optics,
            'Modal dispersion in multimode fiber is REDUCED by using:',
            '[{"id":"a","text":"Step-index construction","correct":false},
              {"id":"b","text":"Graded-index construction","correct":true},
              {"id":"c","text":"A larger core diameter","correct":false},
              {"id":"d","text":"A metallic cladding","correct":false}]'::jsonb,
            '{"B1.1","B1.3","B2"}');

        -- FO-Q6
        INSERT INTO questions (subject_id, text, options, licence_types)
        VALUES (s_optics,
            'In a graded-index multimode fiber, the refractive index of the core:',
            '[{"id":"a","text":"Is uniform throughout","correct":false},
              {"id":"b","text":"Decreases gradually from center to edge","correct":true},
              {"id":"c","text":"Increases from center to edge","correct":false},
              {"id":"d","text":"Is the same as the cladding","correct":false}]'::jsonb,
            '{"B1.1","B1.3","B2"}');

        -- FO-Q7
        INSERT INTO questions (subject_id, text, options, licence_types)
        VALUES (s_optics,
            'Which wavelengths are commonly used for fiber optic data transmission? (select best answer)',
            '[{"id":"a","text":"400 nm, 600 nm, 800 nm","correct":false},
              {"id":"b","text":"850 nm, 1300 nm, 1550 nm","correct":true},
              {"id":"c","text":"1000 nm, 2000 nm, 3000 nm","correct":false},
              {"id":"d","text":"200 nm, 400 nm, 700 nm","correct":false}]'::jsonb,
            '{"B1.1","B1.3","B2"}');

        -- FO-Q8
        INSERT INTO questions (subject_id, text, options, licence_types)
        VALUES (s_optics,
            'A fiber optic link has an attenuation of 3 dB. What percentage of the optical power reaches the far end?',
            '[{"id":"a","text":"25%","correct":false},
              {"id":"b","text":"50%","correct":true},
              {"id":"c","text":"70%","correct":false},
              {"id":"d","text":"90%","correct":false}]'::jsonb,
            '{"B1.1","B1.3","B2"}');

        -- FO-Q9
        INSERT INTO questions (subject_id, text, options, licence_types)
        VALUES (s_optics,
            'Which light sources are used to inject light into fiber optic cables?',
            '[{"id":"a","text":"Incandescent lamps and neon tubes","correct":false},
              {"id":"b","text":"LEDs, VCSELs, and laser diodes","correct":true},
              {"id":"c","text":"Arc lamps and sodium vapour lamps","correct":false},
              {"id":"d","text":"Fluorescent tubes and halogen lamps","correct":false}]'::jsonb,
            '{"B1.1","B1.3","B2"}');

        -- FO-Q10
        INSERT INTO questions (subject_id, text, options, licence_types)
        VALUES (s_optics,
            'What is the main advantage of fiber optic cables over copper wire for avionics data buses?',
            '[{"id":"a","text":"Lower cost per metre","correct":false},
              {"id":"b","text":"Immunity to electromagnetic interference (EMI)","correct":true},
              {"id":"c","text":"Easier to splice and repair","correct":false},
              {"id":"d","text":"Higher electrical conductivity","correct":false}]'::jsonb,
            '{"B1.1","B1.3","B2"}');

        RAISE NOTICE 'M02.4 fiber optics questions added (was %).', optics_cnt;
    ELSE
        RAISE NOTICE 'M02.4 already has % questions, skipping fiber optics enrichment.', optics_cnt;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- M02.2 Mechanics — Gyroscope extra questions (add if < 20)
    -- ──────────────────────────────────────────────────────────────
    IF mech_cnt < 20 THEN

        -- GY-Q1
        INSERT INTO questions (subject_id, text, options, licence_types)
        VALUES (s_mech,
            'The two fundamental properties of a gyroscope are:',
            '[{"id":"a","text":"Rigidity and precession","correct":true},
              {"id":"b","text":"Rigidity and friction","correct":false},
              {"id":"c","text":"Precession and torque","correct":false},
              {"id":"d","text":"Angular momentum and centrifugal force","correct":false}]'::jsonb,
            '{"B1.1","B1.3","B2"}');

        -- GY-Q2
        INSERT INTO questions (subject_id, text, options, licence_types)
        VALUES (s_mech,
            'The rigidity (gyroscopic inertia) of a spinning gyroscope is INCREASED by:',
            '[{"id":"a","text":"Reducing the rotor mass and increasing speed","correct":false},
              {"id":"b","text":"Increasing the rotor mass and reducing speed","correct":false},
              {"id":"c","text":"Concentrating mass at the rotor rim and increasing rotational speed","correct":true},
              {"id":"d","text":"Reducing rotor diameter","correct":false}]'::jsonb,
            '{"B1.1","B1.3","B2"}');

        -- GY-Q3
        INSERT INTO questions (subject_id, text, options, licence_types)
        VALUES (s_mech,
            'Gyroscopic precession occurs in a direction that is:',
            '[{"id":"a","text":"In the same plane as the applied torque","correct":false},
              {"id":"b","text":"90° ahead of the applied force, in the direction of rotor rotation","correct":true},
              {"id":"c","text":"Opposite to the applied force","correct":false},
              {"id":"d","text":"90° behind the applied force, against rotor rotation","correct":false}]'::jsonb,
            '{"B1.1","B1.3","B2"}');

        -- GY-Q4
        INSERT INTO questions (subject_id, text, options, licence_types)
        VALUES (s_mech,
            'What is the rate of apparent wander (drift) of a space gyroscope due to the Earth''s rotation?',
            '[{"id":"a","text":"15° per hour","correct":true},
              {"id":"b","text":"15° per minute","correct":false},
              {"id":"c","text":"360° per hour","correct":false},
              {"id":"d","text":"1° per hour","correct":false}]'::jsonb,
            '{"B1.1","B1.3","B2"}');

        -- GY-Q5
        INSERT INTO questions (subject_id, text, options, licence_types)
        VALUES (s_mech,
            'The real drift rate of an Earth gyroscope is given by 15 × sin(latitude) °/hr. At the North Pole (latitude 90°), real drift is:',
            '[{"id":"a","text":"0°/hr","correct":false},
              {"id":"b","text":"7.5°/hr","correct":false},
              {"id":"c","text":"15°/hr","correct":true},
              {"id":"d","text":"30°/hr","correct":false}]'::jsonb,
            '{"B1.1","B1.3","B2"}');

        -- GY-Q6
        INSERT INTO questions (subject_id, text, options, licence_types)
        VALUES (s_mech,
            'The real topple rate of an Earth gyroscope is given by 15 × cos(latitude) °/hr. At the equator (latitude 0°), real topple is:',
            '[{"id":"a","text":"0°/hr","correct":false},
              {"id":"b","text":"7.5°/hr","correct":false},
              {"id":"c","text":"15°/hr","correct":true},
              {"id":"d","text":"10.6°/hr","correct":false}]'::jsonb,
            '{"B1.1","B1.3","B2"}');

        -- GY-Q7
        INSERT INTO questions (subject_id, text, options, licence_types)
        VALUES (s_mech,
            'Transport wander of a gyroscope is caused by:',
            '[{"id":"a","text":"Bearing friction in the gimbal rings","correct":false},
              {"id":"b","text":"The aircraft moving over the curved surface of the Earth","correct":true},
              {"id":"c","text":"The gyro spin motor wearing out","correct":false},
              {"id":"d","text":"Changes in ambient temperature","correct":false}]'::jsonb,
            '{"B1.1","B1.3","B2"}');

        -- GY-Q8
        INSERT INTO questions (subject_id, text, options, licence_types)
        VALUES (s_mech,
            'The formula for transport wander rate is GS × tan(lat) / 60 (°/hr). At latitude 45°N with groundspeed 480 kt, transport wander is approximately:',
            '[{"id":"a","text":"4°/hr","correct":false},
              {"id":"b","text":"8°/hr","correct":true},
              {"id":"c","text":"16°/hr","correct":false},
              {"id":"d","text":"1°/hr","correct":false}]'::jsonb,
            '{"B1.1","B1.3","B2"}');

        -- GY-Q9
        INSERT INTO questions (subject_id, text, options, licence_types)
        VALUES (s_mech,
            'Which type of gyroscope has ALL three degrees of freedom (three gimbal rings) and is used as a reference in inertial navigation?',
            '[{"id":"a","text":"Rate gyroscope","correct":false},
              {"id":"b","text":"Rate-integrating gyroscope","correct":false},
              {"id":"c","text":"Space (free) gyroscope","correct":true},
              {"id":"d","text":"Tied gyroscope","correct":false}]'::jsonb,
            '{"B1.1","B1.3","B2"}');

        -- GY-Q10
        INSERT INTO questions (subject_id, text, options, licence_types)
        VALUES (s_mech,
            'A rate gyroscope measures:',
            '[{"id":"a","text":"Attitude (bank and pitch angles)","correct":false},
              {"id":"b","text":"Heading","correct":false},
              {"id":"c","text":"Rate of turn (angular velocity)","correct":true},
              {"id":"d","text":"Ground speed","correct":false}]'::jsonb,
            '{"B1.1","B1.3","B2"}');

        RAISE NOTICE 'M02.2 gyroscope questions added (was %).', mech_cnt;
    ELSE
        RAISE NOTICE 'M02.2 already has % questions, skipping gyroscope enrichment.', mech_cnt;
    END IF;

END;
$$;
