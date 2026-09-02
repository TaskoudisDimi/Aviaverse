-- Migration 004: Add M02.5 Wave Motion and Sound (split from M02.4 in original seed)
-- Source: IKAROS M02 Physics – Chapter 8 Wave Motion and Sound
-- Idempotent: skips if M02.5 already exists

DO $$
DECLARE
    m02_id INT;
    s5_id  INT;
BEGIN
    SELECT id INTO m02_id FROM easa_modules WHERE code = 'M02';

    IF m02_id IS NULL THEN
        RAISE NOTICE 'M02 module not found – run 001_init.sql and 003_module02_seed.sql first.';
        RETURN;
    END IF;

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M02.5') THEN
        RAISE NOTICE 'M02.5 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 02.5: Wave Motion and Sound
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m02_id, 'M02.5', 'Wave Motion and Sound',
        $cnt$
# Wave Motion and Sound

## Wave Types

**Mechanical waves** require a medium (solid, liquid, gas) to propagate. They are disturbances that transfer energy without transferring matter.

| Wave type | Particle motion | Examples |
|-----------|----------------|---------|
| **Transverse** | Perpendicular to wave direction | Water surface waves, S-seismic waves |
| **Longitudinal** | Parallel to wave direction (compressions & rarefactions) | Sound, P-seismic waves |

## Wave Parameters

| Symbol | Quantity | SI unit |
|--------|----------|---------|
| **λ** (lambda) | Wavelength — distance between two consecutive identical points | m |
| **f** | Frequency — number of complete cycles per second | Hz |
| **T** | Period — time for one complete cycle | s |
| **A** | Amplitude — maximum displacement from equilibrium | m |
| **v** | Wave speed | m/s |

Key relationships:
- **v = fλ** — wave speed = frequency × wavelength
- **T = 1/f** — period and frequency are reciprocals

## Sound Waves

Sound is a **longitudinal mechanical wave**. It needs a medium; it cannot travel in a vacuum.

Speed of sound depends on the medium (approximate values):

| Medium | Speed (m/s) |
|--------|-------------|
| Air at 0°C | 331 |
| Air at 20°C | 343 |
| Water (20°C) | 1480 |
| Steel | 5100 |

Sound travels **faster in denser/stiffer** media (faster in solids > liquids > gases).

**Frequency ranges:**
- Infrasound: < 20 Hz
- Audible sound: 20 Hz – 20 kHz
- Ultrasound: > 20 kHz

## Intensity and Decibels

Sound intensity level is measured in **decibels (dB)**. Each 10 dB increase = 10× intensity. Each 3 dB increase ≈ 2× intensity.

## Resonance

**Resonance** occurs when a driving frequency matches the **natural (resonant) frequency** of an object. At resonance, amplitude becomes maximum. Energy transfer is most efficient.

**Standing waves** form when two identical waves travel in opposite directions. They have:
- **Nodes** — points of zero displacement
- **Antinodes** — points of maximum displacement

For a **closed pipe** (one end closed): harmonics are odd multiples of the fundamental. First harmonic: λ = 4L.
For an **open pipe** (both ends open): all harmonics present. First harmonic: λ = 2L.

## Interference

When two waves meet in the same medium:
- **Constructive interference**: waves in phase → amplitudes add (louder)
- **Destructive interference**: waves out of phase (180°) → amplitudes cancel (silence)

## Doppler Effect

When a source of sound moves **towards** an observer, the observed frequency is **higher** than the emitted frequency (pitch sounds higher).

When the source moves **away**, the observed frequency is **lower** (pitch sounds lower).

Formula: **f_observed = f_source × (v ± v_observer) / (v ∓ v_source)**

Aviation application: Doppler radar and altimeters use the Doppler effect to measure speed and altitude.

## Acoustics in Aviation

- **Noise** caused by turbulent airflow over fuselage and engines
- **Vibration monitoring** uses resonance characteristics to detect component wear
- **Ultrasonic inspection (NDT)** uses high-frequency sound waves to detect internal cracks without dismantling components
- **Cockpit noise** levels are regulated; pilots use ANR (Active Noise Reduction) headsets which produce destructive interference to cancel engine noise
        $cnt$,
        5
    ) RETURNING id INTO s5_id;

    -- ── Questions for M02.5 ───────────────────────────────────────

    -- Q1
    INSERT INTO easa_questions (module_id, subject_id, question_text, options, licence_types)
    VALUES (m02_id, s5_id,
        'What type of wave is sound?',
        '[{"id":"a","text":"Transverse mechanical wave","correct":false},
          {"id":"b","text":"Longitudinal mechanical wave","correct":true},
          {"id":"c","text":"Electromagnetic wave","correct":false},
          {"id":"d","text":"Torsional wave","correct":false}]'::jsonb,
        '{"B1.1","B1.3","B2"}');

    -- Q2
    INSERT INTO easa_questions (module_id, subject_id, question_text, options, licence_types)
    VALUES (m02_id, s5_id,
        'What is the approximate speed of sound in air at 20°C?',
        '[{"id":"a","text":"200 m/s","correct":false},
          {"id":"b","text":"343 m/s","correct":true},
          {"id":"c","text":"500 m/s","correct":false},
          {"id":"d","text":"1480 m/s","correct":false}]'::jsonb,
        '{"B1.1","B1.3","B2"}');

    -- Q3
    INSERT INTO easa_questions (module_id, subject_id, question_text, options, licence_types)
    VALUES (m02_id, s5_id,
        'A wave has a frequency of 200 Hz and a wavelength of 1.5 m. What is its speed?',
        '[{"id":"a","text":"133 m/s","correct":false},
          {"id":"b","text":"200 m/s","correct":false},
          {"id":"c","text":"300 m/s","correct":true},
          {"id":"d","text":"400 m/s","correct":false}]'::jsonb,
        '{"B1.1","B1.3","B2"}');

    -- Q4
    INSERT INTO easa_questions (module_id, subject_id, question_text, options, licence_types)
    VALUES (m02_id, s5_id,
        'A sound wave has a frequency of 50 Hz. What is its period?',
        '[{"id":"a","text":"50 s","correct":false},
          {"id":"b","text":"5 s","correct":false},
          {"id":"c","text":"0.02 s","correct":true},
          {"id":"d","text":"0.2 s","correct":false}]'::jsonb,
        '{"B1.1","B1.3","B2"}');

    -- Q5
    INSERT INTO easa_questions (module_id, subject_id, question_text, options, licence_types)
    VALUES (m02_id, s5_id,
        'In which medium does sound travel fastest?',
        '[{"id":"a","text":"Air","correct":false},
          {"id":"b","text":"Water","correct":false},
          {"id":"c","text":"Steel","correct":true},
          {"id":"d","text":"Vacuum","correct":false}]'::jsonb,
        '{"B1.1","B1.3","B2"}');

    -- Q6
    INSERT INTO easa_questions (module_id, subject_id, question_text, options, licence_types)
    VALUES (m02_id, s5_id,
        'What is resonance?',
        '[{"id":"a","text":"When sound bounces off a hard surface","correct":false},
          {"id":"b","text":"When two sound waves cancel each other out","correct":false},
          {"id":"c","text":"When a driving frequency matches the natural frequency, producing maximum amplitude","correct":true},
          {"id":"d","text":"When sound travels through a vacuum","correct":false}]'::jsonb,
        '{"B1.1","B1.3","B2"}');

    -- Q7
    INSERT INTO easa_questions (module_id, subject_id, question_text, options, licence_types)
    VALUES (m02_id, s5_id,
        'In a standing wave, what are the points of zero displacement called?',
        '[{"id":"a","text":"Antinodes","correct":false},
          {"id":"b","text":"Nodes","correct":true},
          {"id":"c","text":"Troughs","correct":false},
          {"id":"d","text":"Crests","correct":false}]'::jsonb,
        '{"B1.1","B1.3","B2"}');

    -- Q8
    INSERT INTO easa_questions (module_id, subject_id, question_text, options, licence_types)
    VALUES (m02_id, s5_id,
        'An ambulance siren is approaching you. Compared to the emitted frequency, the frequency you hear is:',
        '[{"id":"a","text":"Lower","correct":false},
          {"id":"b","text":"The same","correct":false},
          {"id":"c","text":"Higher","correct":true},
          {"id":"d","text":"Zero","correct":false}]'::jsonb,
        '{"B1.1","B1.3","B2"}');

    -- Q9
    INSERT INTO easa_questions (module_id, subject_id, question_text, options, licence_types)
    VALUES (m02_id, s5_id,
        'What is the frequency range of audible sound for humans?',
        '[{"id":"a","text":"0 – 20 Hz","correct":false},
          {"id":"b","text":"20 Hz – 20 kHz","correct":true},
          {"id":"c","text":"20 kHz – 200 kHz","correct":false},
          {"id":"d","text":"1 Hz – 1 kHz","correct":false}]'::jsonb,
        '{"B1.1","B1.3","B2"}');

    -- Q10
    INSERT INTO easa_questions (module_id, subject_id, question_text, options, licence_types)
    VALUES (m02_id, s5_id,
        'In a transverse wave, the motion of the particles is:',
        '[{"id":"a","text":"Parallel to the direction of wave propagation","correct":false},
          {"id":"b","text":"Perpendicular to the direction of wave propagation","correct":true},
          {"id":"c","text":"Circular","correct":false},
          {"id":"d","text":"Stationary","correct":false}]'::jsonb,
        '{"B1.1","B1.3","B2"}');

    -- Q11
    INSERT INTO easa_questions (module_id, subject_id, question_text, options, licence_types)
    VALUES (m02_id, s5_id,
        'When two sound waves of equal amplitude arrive 180° out of phase, the result is:',
        '[{"id":"a","text":"Constructive interference — double amplitude","correct":false},
          {"id":"b","text":"Resonance","correct":false},
          {"id":"c","text":"Destructive interference — silence","correct":true},
          {"id":"d","text":"A standing wave","correct":false}]'::jsonb,
        '{"B1.1","B1.3","B2"}');

    -- Q12
    INSERT INTO easa_questions (module_id, subject_id, question_text, options, licence_types)
    VALUES (m02_id, s5_id,
        'What NDT technique uses high-frequency sound waves to detect internal cracks?',
        '[{"id":"a","text":"Magnetic particle inspection","correct":false},
          {"id":"b","text":"Dye penetrant inspection","correct":false},
          {"id":"c","text":"Ultrasonic inspection","correct":true},
          {"id":"d","text":"Eddy current inspection","correct":false}]'::jsonb,
        '{"B1.1","B1.3","B2"}');

    -- Q13
    INSERT INTO easa_questions (module_id, subject_id, question_text, options, licence_types)
    VALUES (m02_id, s5_id,
        'If the frequency of a wave is doubled while the wave speed remains constant, the wavelength will:',
        '[{"id":"a","text":"Double","correct":false},
          {"id":"b","text":"Remain the same","correct":false},
          {"id":"c","text":"Halve","correct":true},
          {"id":"d","text":"Quadruple","correct":false}]'::jsonb,
        '{"B1.1","B1.3","B2"}');

    -- Q14
    INSERT INTO easa_questions (module_id, subject_id, question_text, options, licence_types)
    VALUES (m02_id, s5_id,
        'Sound cannot travel through:',
        '[{"id":"a","text":"Air","correct":false},
          {"id":"b","text":"Water","correct":false},
          {"id":"c","text":"A vacuum","correct":true},
          {"id":"d","text":"Steel","correct":false}]'::jsonb,
        '{"B1.1","B1.3","B2"}');

    -- Q15
    INSERT INTO easa_questions (module_id, subject_id, question_text, options, licence_types)
    VALUES (m02_id, s5_id,
        'Active Noise Reduction (ANR) headsets work on the principle of:',
        '[{"id":"a","text":"Resonance","correct":false},
          {"id":"b","text":"Destructive interference","correct":true},
          {"id":"c","text":"Constructive interference","correct":false},
          {"id":"d","text":"The Doppler effect","correct":false}]'::jsonb,
        '{"B1.1","B1.3","B2"}');

    RAISE NOTICE 'M02.5 Wave Motion and Sound seeded successfully.';
END;
$$;
