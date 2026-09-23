-- M11A.19 was seeded with a placeholder title "Airframe Systems — General Practices"
-- based on an earlier boundary guess. The source text for this subject (source line ~41752,
-- chapter heading "16 PNEUMATIC AND VACUUM") is actually about pneumatic and vacuum systems —
-- confirmed by the agent that read the full source range while authoring the content in
-- migration 043. The content/questions were already grounded correctly in pneumatic/vacuum
-- topics; only the title was wrong.

UPDATE easa_subjects SET title = 'Pneumatic and Vacuum Systems' WHERE code = 'M11A.19';
