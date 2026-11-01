-- Lets a module be temporarily hidden from students without deleting its
-- content — used right now for M16 (Piston Engine), whose question bank was
-- authored from a textbook citation rather than a file the client actually
-- supplied (same ungrounded-content risk flagged in the M07 audit). Hidden
-- until a real source PDF is provided and the content is re-verified against
-- it, same as every other module in this batch.

ALTER TABLE easa_modules ADD COLUMN IF NOT EXISTS active BOOLEAN NOT NULL DEFAULT true;

UPDATE easa_modules SET active = false WHERE code = 'M16';
