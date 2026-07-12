-- ============================================================
-- Vyron / Aviaverse Academy — initial schema
-- ============================================================

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS "pg_trgm";

-- ─── USERS ────────────────────────────────────────────────
CREATE TABLE users (
    id            UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    email         TEXT UNIQUE NOT NULL,
    password_hash TEXT NOT NULL,
    full_name     TEXT NOT NULL,
    licence_type  TEXT NOT NULL DEFAULT 'B1.1',   -- B1.1 | B1.3 | B2 | all
    created_at    TIMESTAMPTZ DEFAULT NOW(),
    updated_at    TIMESTAMPTZ DEFAULT NOW()
);

-- ─── EASA MODULES ─────────────────────────────────────────
CREATE TABLE easa_modules (
    id            SERIAL PRIMARY KEY,
    code          TEXT UNIQUE NOT NULL,            -- e.g. "M01"
    title         TEXT NOT NULL,
    description   TEXT,
    licence_types TEXT[] NOT NULL DEFAULT '{"B1.1","B1.3","B2"}',
    sort_order    INT NOT NULL DEFAULT 0
);

CREATE TABLE easa_subjects (
    id        SERIAL PRIMARY KEY,
    module_id INT NOT NULL REFERENCES easa_modules(id) ON DELETE CASCADE,
    code      TEXT UNIQUE NOT NULL,                -- e.g. "M01.1"
    title     TEXT NOT NULL,
    content   TEXT NOT NULL DEFAULT '',            -- markdown theory
    sort_order INT NOT NULL DEFAULT 0
);

CREATE INDEX ON easa_subjects(module_id);

-- ─── QUESTIONS ────────────────────────────────────────────
-- options format: [{"id":"uuid","text":"...","correct":true/false}, ...]
CREATE TABLE questions (
    id            UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    subject_id    INT NOT NULL REFERENCES easa_subjects(id) ON DELETE CASCADE,
    text          TEXT NOT NULL,
    options       JSONB NOT NULL,
    licence_types TEXT[] NOT NULL DEFAULT '{"B1.1","B1.3","B2"}',
    created_at    TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX ON questions(subject_id);

-- ─── EXAMS ────────────────────────────────────────────────
CREATE TABLE exams (
    id              UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id         UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    module_id       INT REFERENCES easa_modules(id),
    licence_type    TEXT NOT NULL,
    num_questions   INT NOT NULL DEFAULT 20,
    time_limit_min  INT NOT NULL DEFAULT 30,
    score           INT NOT NULL DEFAULT 0,
    total_questions INT NOT NULL DEFAULT 0,
    percentage      NUMERIC(5,2) NOT NULL DEFAULT 0,
    pass_fail       TEXT NOT NULL DEFAULT '',
    started_at      TIMESTAMPTZ DEFAULT NOW(),
    ends_at         TIMESTAMPTZ,
    completed_at    TIMESTAMPTZ,
    created_at      TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX ON exams(user_id);

CREATE TABLE exam_answers (
    id                 UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    exam_id            UUID NOT NULL REFERENCES exams(id) ON DELETE CASCADE,
    question_id        UUID NOT NULL REFERENCES questions(id),
    selected_option_id TEXT,
    is_correct         BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE INDEX ON exam_answers(exam_id);

-- ─── USER PROGRESS ────────────────────────────────────────
CREATE TABLE user_subject_progress (
    id              UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id         UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    subject_id      INT NOT NULL REFERENCES easa_subjects(id) ON DELETE CASCADE,
    correct_answers INT NOT NULL DEFAULT 0,
    total_answers   INT NOT NULL DEFAULT 0,
    last_studied_at TIMESTAMPTZ DEFAULT NOW(),
    UNIQUE(user_id, subject_id)
);

CREATE INDEX ON user_subject_progress(user_id);

-- ─── AI SESSIONS ──────────────────────────────────────────
CREATE TABLE ai_sessions (
    id         UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id    UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    mode       TEXT NOT NULL,
    subject_id INT REFERENCES easa_subjects(id),
    messages   JSONB NOT NULL DEFAULT '[]',
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX ON ai_sessions(user_id);

-- ─── SEED: EASA MODULES ───────────────────────────────────
INSERT INTO easa_modules (code, title, description, licence_types, sort_order) VALUES
('M01', 'Mathematics',                    'Arithmetic, algebra, geometry',                  '{"B1.1","B1.3","B2"}', 1),
('M02', 'Physics',                        'Matter, mechanics, thermodynamics',               '{"B1.1","B1.3","B2"}', 2),
('M03', 'Electrical Fundamentals',        'DC/AC circuits, resistance, capacitance',         '{"B1.1","B1.3","B2"}', 3),
('M04', 'Electronic Fundamentals',        'Semiconductors, logic circuits',                  '{"B2"}',               4),
('M05', 'Digital Techniques',             'Number systems, data buses, software',            '{"B1.1","B1.3","B2"}', 5),
('M06', 'Materials and Hardware',         'Aircraft materials, fasteners, tools',            '{"B1.1","B1.3"}',      6),
('M07', 'Maintenance Practices',          'Safety, tools, workshop practices',               '{"B1.1","B1.3","B2"}', 7),
('M08', 'Basic Aerodynamics',             'Principles of flight',                            '{"B1.1","B1.3","B2"}', 8),
('M09', 'Human Factors',                  'CRM, human performance, safety culture',          '{"B1.1","B1.3","B2"}', 9),
('M10', 'Aviation Legislation',           'EASA regulations, ICAO, national regulations',   '{"B1.1","B1.3","B2"}', 10),
('M11', 'Aeroplane Aerodynamics',         'Airframe structures, flight controls, icing',     '{"B1.1"}',             11),
('M12', 'Helicopter Aerodynamics',        'Rotor systems, autorotation, vibration',          '{"B1.3"}',             12),
('M13', 'Aircraft Aerodynamic Structures','Airframe structures and systems (avionics)',       '{"B2"}',               13),
('M14', 'Propulsion',                     'Gas turbines, piston engines',                    '{"B1.1","B1.3"}',      14),
('M15', 'Gas Turbine Engine',             'Engine systems, performance, fuel systems',       '{"B1.1","B1.3"}',      15),
('M16', 'Piston Engine',                  'Engine types, fuel systems, ignition',            '{"B1.1"}',             16),
('M17', 'Propeller',                      'Propeller theory, pitch control',                 '{"B1.1"}',             17);
