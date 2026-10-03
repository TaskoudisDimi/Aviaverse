-- Official EASA Part-66 exam question counts and time limits per module per
-- licence category (MCQ portion only — this platform has no essay-question
-- support, so the essay component of M07/M09/M10's real exams is dropped).
-- DB-driven like subscription_plans, so counts can be corrected with a
-- plain UPDATE if the source table was mistranscribed, no redeploy needed.

CREATE TABLE IF NOT EXISTS exam_formats (
    id             SERIAL PRIMARY KEY,
    module_code    TEXT NOT NULL,
    licence_type   TEXT NOT NULL,
    question_count INT NOT NULL,
    time_limit_min INT NOT NULL,
    UNIQUE (module_code, licence_type)
);

INSERT INTO exam_formats (module_code, licence_type, question_count, time_limit_min) VALUES
('M01', 'B1', 32, 40),
('M01', 'B2', 32, 40),
('M02', 'B1', 52, 65),
('M02', 'B2', 52, 65),
('M03', 'B1', 52, 65),
('M03', 'B2', 52, 65),
('M04', 'B1', 20, 25),
('M04', 'B2', 40, 50),
('M05', 'B1', 40, 50),
('M05', 'B2', 72, 90),
('M06', 'B1', 72, 90),
('M06', 'B2', 60, 75),
('M07', 'B1', 80, 140),
('M07', 'B2', 60, 115),
('M08', 'B1', 20, 25),
('M08', 'B2', 20, 25),
('M09', 'B1', 20, 25),
('M09', 'B2', 20, 25),
('M10', 'B1', 40, 50),
('M10', 'B2', 40, 50),
('M11', 'B1', 140, 175),
('M13', 'B2', 180, 225),
('M14', 'B2', 24, 30),
('M15', 'B1', 92, 115),
('M16', 'B1', 72, 90),
('M17', 'B1', 32, 40)
ON CONFLICT (module_code, licence_type) DO NOTHING;
