-- Migration 102: Supplement M03.9 (Magnetism), M03.10 (Inductance / Inductors),
-- M03.11 (DC Motor/Generator Theory & DC Generators) and M03.12 (DC Motors)
-- with additional questions from the M03 study-notes book and the 728-question bank.
--
-- Sources:
--   - M03_Electrics_Study_Notes.txt, Sub-Module 10 Magnetism, lines 1350-1562
--   - M03_Electrics_Study_Notes.txt, Sub-Module 11 Inductance / Inductor, lines 1563-1766
--   - M03_Electrics_Study_Notes.txt, Sub-Module 12 DC Motor / Generator Theory, lines 1767-2027
--   - m3_questions_parsed.txt, [CORRECT]-marked questions in the Q301-Q461 range
--     (magnetism, inductance, DC generator and DC motor topics)
--
-- This migration only INSERTs additional question rows against the four existing
-- M03.9 / M03.10 / M03.11 / M03.12 subject rows; it does not touch easa_subjects.

DO $$
DECLARE
    s9_id INT; s10_id INT; s11_id INT; s12_id INT;
BEGIN
    SELECT id INTO s9_id FROM easa_subjects WHERE code = 'M03.9';
    SELECT id INTO s10_id FROM easa_subjects WHERE code = 'M03.10';
    SELECT id INTO s11_id FROM easa_subjects WHERE code = 'M03.11';
    SELECT id INTO s12_id FROM easa_subjects WHERE code = 'M03.12';

    IF s9_id IS NULL OR s10_id IS NULL OR s11_id IS NULL OR s12_id IS NULL THEN
        RAISE NOTICE 'One or more of M03.9/M03.10/M03.11/M03.12 not found, skipping.';
        RETURN;
    END IF;

    -- Idempotency guard: skip if this supplement was already applied.
    IF EXISTS (
        SELECT 1 FROM questions WHERE subject_id = s9_id
        AND text LIKE '%Cut a bar magnet exactly in half%'
    ) THEN
        RAISE NOTICE 'M03 part 3 supplement already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M03.9 Magnetism (supplement)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s9_id, 'Cut a bar magnet exactly in half. What do you get?',
     '[{"id":"a","text":"Two complete magnets, each with its own North and South pole","correct":true},{"id":"b","text":"One piece that is a pure North pole and one piece that is a pure South pole","correct":false},{"id":"c","text":"One magnet and one piece of unmagnetised, ordinary iron","correct":false}]',
     '{"B1","B2"}'),

    (s9_id, 'Inside a bar magnet, in which direction do the lines of magnetic flux run?',
     '[{"id":"a","text":"From North to South","correct":false},{"id":"b","text":"From South to North, so that every line forms a closed loop","correct":true},{"id":"c","text":"They do not exist inside the magnet, only outside it","correct":false}]',
     '{"B1","B2"}'),

    (s9_id, 'Inside a ferromagnetic material, according to domain theory, a piece of material is described as "saturated" when:',
     '[{"id":"a","text":"All of its magnetic domains are aligned, so no more flux can be produced however much current is increased","correct":true},{"id":"b","text":"All of its domains are pointing in random directions and cancel out","correct":false},{"id":"c","text":"The material has just been heated above its Curie point","correct":false}]',
     '{"B1","B2"}'),

    (s9_id, 'A freely suspended bar magnet has its North-seeking pole pointing towards geographic north. What does this tell us about the Earth''s magnetic pole located there?',
     '[{"id":"a","text":"It is physically a North pole, since like poles point towards each other","correct":false},{"id":"b","text":"It is physically a South pole, since unlike poles attract","correct":true},{"id":"c","text":"It has no fixed polarity and changes with the seasons","correct":false}]',
     '{"B1","B2"}'),

    (s9_id, 'Which of the following is a practical, controllable method of magnetising a piece of material?',
     '[{"id":"a","text":"Placing it in the field of a coil carrying DC","correct":true},{"id":"b","text":"Heating it above its Curie point","correct":false},{"id":"c","text":"Hammering or vibrating it","correct":false}]',
     '{"B1","B2"}'),

    (s9_id, 'Which of the following methods will demagnetise a magnetised piece of material?',
     '[{"id":"a","text":"Stroking it with an existing magnet, always in the same direction","correct":false},{"id":"b","text":"Placing it in an AC field and slowly withdrawing it (or gradually reducing the current)","correct":true},{"id":"c","text":"Holding it near a strong magnet without touching it","correct":false}]',
     '{"B1","B2"}'),

    (s9_id, 'Of the following groups of metals, which are ferromagnetic (strongly attracted by a magnet)?',
     '[{"id":"a","text":"Iron, nickel and cobalt, and their alloys","correct":true},{"id":"b","text":"Copper, silver and gold","correct":false},{"id":"c","text":"Aluminium, tin and zinc","correct":false}]',
     '{"B1","B2"}'),

    (s9_id, 'A soft magnetic material such as soft iron or silicon steel, used for transformer and motor cores, is characterised by:',
     '[{"id":"a","text":"Being hard to magnetise and hard to demagnetise, with high retentivity","correct":false},{"id":"b","text":"Being easy to magnetise and easy to demagnetise, with low retentivity","correct":true},{"id":"c","text":"Having no measurable permeability at all","correct":false}]',
     '{"B1","B2"}'),

    (s9_id, 'A sensitive compass is to be shielded from a nearby magnetic field. How is this normally achieved?',
     '[{"id":"a","text":"By surrounding it with a shell of soft iron or mu-metal, which diverts the flux around it via a low-reluctance path","correct":true},{"id":"b","text":"By surrounding it with a thick copper shield, which blocks the magnetic field entirely","correct":false},{"id":"c","text":"By placing a permanent magnet next to it to cancel the field mathematically","correct":false}]',
     '{"B1","B2"}'),

    (s9_id, 'What are the two stated advantages of an electromagnet over a permanent magnet?',
     '[{"id":"a","text":"It is always physically smaller and always cheaper to manufacture","correct":false},{"id":"b","text":"It can be switched off and its strength can be varied (and its polarity reversed)","correct":true},{"id":"c","text":"It never suffers from saturation and never overheats","correct":false}]',
     '{"B1","B2"}'),

    (s9_id, 'Using the coil (solenoid) hand rule written for electron flow, grasp the coil with the left hand, fingers curling in the direction of electron flow in the windings. What does the thumb indicate?',
     '[{"id":"a","text":"The direction of the field lines cutting the windings","correct":false},{"id":"b","text":"The North pole of the solenoid","correct":true},{"id":"c","text":"The direction of the eddy currents in the core","correct":false}]',
     '{"B1","B2"}'),

    (s9_id, 'On the hysteresis loop of a magnetic sample, the height at which the curve crosses the B axis at H = 0 represents:',
     '[{"id":"a","text":"The coercive force","correct":false},{"id":"b","text":"The retentivity","correct":true},{"id":"c","text":"The saturation point","correct":false}]',
     '{"B1","B2"}'),

    (s9_id, 'What does the area enclosed inside a hysteresis loop represent?',
     '[{"id":"a","text":"The energy lost as heat during every magnetising cycle","correct":true},{"id":"b","text":"The total flux density at saturation","correct":false},{"id":"c","text":"The reluctance of the material at zero magnetising force","correct":false}]',
     '{"B1","B2"}'),

    (s9_id, 'A "fat, wide" hysteresis loop indicates a material with high retentivity and high coercivity. What is this type of material best suited for?',
     '[{"id":"a","text":"Permanent magnets","correct":true},{"id":"b","text":"Transformer cores operating at 400 Hz","correct":false},{"id":"c","text":"Motor cores where the field reverses hundreds of times a second","correct":false}]',
     '{"B1","B2"}'),

    (s9_id, 'How are eddy currents induced in a solid iron core, and what is the standard cure for the resulting loss?',
     '[{"id":"a","text":"A changing field induces swirling currents in the core, which produce heat; the cure is to laminate the core into thin, insulated sheets","correct":true},{"id":"b","text":"Eddy currents are caused by dirty brushes and are cured by cleaning the commutator","correct":false},{"id":"c","text":"Eddy currents are caused by an air gap and are cured by increasing the air gap","correct":false}]',
     '{"B1","B2"}'),

    (s9_id, 'When magnets are put into storage, why should horseshoe magnets be kept in pairs with soft iron keepers across the poles?',
     '[{"id":"a","text":"To complete the magnetic circuit north to south and keep the flux inside, preserving the magnet''s strength","correct":true},{"id":"b","text":"To insulate the poles electrically from each other","correct":false},{"id":"c","text":"To increase the reluctance of the magnetic circuit as much as possible","correct":false}]',
     '{"B1","B2"}'),

    (s9_id, 'After welding, hammering, or magnetic particle inspection has been carried out near a compass installation, what maintenance action is required?',
     '[{"id":"a","text":"No action is needed, since compasses are unaffected by nearby magnetic disturbances","correct":false},{"id":"b","text":"A compass swing must be carried out and a fresh deviation card completed","correct":true},{"id":"c","text":"The compass must be demagnetised and left uncompensated","correct":false}]',
     '{"B1","B2"}'),

    (s9_id, 'Ferromagnetic materials such as iron and steel can be magnetised:',
     '[{"id":"a","text":"Only above a certain temperature","correct":false},{"id":"b","text":"Below a certain temperature (the Curie point)","correct":true},{"id":"c","text":"Only within a narrow band of temperatures","correct":false}]',
     '{"B1","B2"}'),

    (s9_id, 'What effect does vibration have on a permanent magnet?',
     '[{"id":"a","text":"It causes the flux to increase","correct":false},{"id":"b","text":"It causes the flux to decrease, since mechanical shock jars the domains out of alignment","correct":true},{"id":"c","text":"It has no effect on the magnet''s flux","correct":false}]',
     '{"B1","B2"}'),

    (s9_id, 'How is the permeability of a magnetic material related to its flux density (B) and field strength (H)?',
     '[{"id":"a","text":"Permeability = B / H","correct":true},{"id":"b","text":"Permeability = H / B","correct":false},{"id":"c","text":"Permeability = B × H","correct":false}]',
     '{"B1","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M03.10 Inductance / Inductors (supplement)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s10_id, 'According to Faraday''s Law, what is required for a voltage to be induced in a conductor sitting near a magnetic field?',
     '[{"id":"a","text":"Relative motion or change between the conductor and the field — a steady field with no motion induces nothing","correct":true},{"id":"b","text":"A permanent magnet must physically touch the conductor","correct":false},{"id":"c","text":"The conductor must already be carrying a current before any voltage can be induced","correct":false}]',
     '{"B1","B2"}'),

    (s10_id, 'Which of the following is one of the four factors that controls the size of an induced voltage?',
     '[{"id":"a","text":"The colour of the insulation on the conductor","correct":false},{"id":"b","text":"The angle at which the conductor cuts the flux, with maximum induced voltage at 90 degrees","correct":true},{"id":"c","text":"The ambient air temperature at the coil","correct":false}]',
     '{"B1","B2"}'),

    (s10_id, 'A magnet is pushed into a coil. According to Lenz''s Law, what happens?',
     '[{"id":"a","text":"The coil generates a field that pushes back against the magnet, opposing the change","correct":true},{"id":"b","text":"The coil generates a field that pulls the magnet in faster, aiding the change","correct":false},{"id":"c","text":"No current is induced unless the magnet is withdrawn again","correct":false}]',
     '{"B1","B2"}'),

    (s10_id, 'Why is the voltage induced by self-inductance called "back EMF"?',
     '[{"id":"a","text":"Because, by Lenz''s Law, it opposes the change in current that caused it","correct":true},{"id":"b","text":"Because it always flows in the same direction as the applied EMF, reinforcing it","correct":false},{"id":"c","text":"Because it is only present when the coil is switched off permanently","correct":false}]',
     '{"B1","B2"}'),

    (s10_id, 'When a relay coil is switched off, why can the resulting back EMF spike be hundreds of times the supply voltage?',
     '[{"id":"a","text":"Because the field collapses very fast, so the rate of change of current is enormous","correct":true},{"id":"b","text":"Because the coil resistance suddenly increases to a very high value","correct":false},{"id":"c","text":"Because the supply voltage itself briefly increases at switch-off","correct":false}]',
     '{"B1","B2"}'),

    (s10_id, 'Which of the following physical changes to a coil will increase its inductance?',
     '[{"id":"a","text":"Replacing an iron core with an air core","correct":false},{"id":"b","text":"Increasing the number of turns on the coil","correct":true},{"id":"c","text":"Spreading the same turns out over a greater coil length","correct":false}]',
     '{"B1","B2"}'),

    (s10_id, 'In an RL circuit, after how many time constants is the current considered to be fully established?',
     '[{"id":"a","text":"One time constant","correct":false},{"id":"b","text":"Two time constants","correct":false},{"id":"c","text":"Five time constants","correct":true}]',
     '{"B1","B2"}'),

    (s10_id, 'In mutual induction between two coils, what does the coefficient of coupling (k) describe?',
     '[{"id":"a","text":"The ratio of the number of turns on the primary to the number of turns on the secondary","correct":false},{"id":"b","text":"How much of the flux from the primary coil links the secondary coil — k = 1 means tight coupling, k near 0 means the coils barely see each other","correct":true},{"id":"c","text":"The resistance of the wire used to wind each coil","correct":false}]',
     '{"B1","B2"}'),

    (s10_id, 'Why is sensitive signal wiring often routed at right angles to a power cable rather than parallel to it?',
     '[{"id":"a","text":"Coils (or wires) at right angles to each other have almost no magnetic coupling","correct":true},{"id":"b","text":"Right-angle routing reduces the total resistance of the signal wiring","correct":false},{"id":"c","text":"It is only done to save space, and has no electrical benefit","correct":false}]',
     '{"B1","B2"}'),

    (s10_id, 'Which type of inductor core is chosen at higher frequencies because it has high permeability but, being non-conducting, produces almost no eddy currents?',
     '[{"id":"a","text":"Laminated iron core","correct":false},{"id":"b","text":"Ferrite core","correct":true},{"id":"c","text":"Air core","correct":false}]',
     '{"B1","B2"}'),

    (s10_id, 'Why does a toroidal (powdered iron ring) inductor neither radiate interference nor pick it up?',
     '[{"id":"a","text":"Because it has no core material at all","correct":false},{"id":"b","text":"Because the ring shape keeps the flux contained inside the core","correct":true},{"id":"c","text":"Because it always operates well below saturation","correct":false}]',
     '{"B1","B2"}'),

    (s10_id, 'Inductive reactance (XL) is calculated using the formula:',
     '[{"id":"a","text":"XL = 2πfL","correct":true},{"id":"b","text":"XL = f / (2πL)","correct":false},{"id":"c","text":"XL = L / (2πf)","correct":false}]',
     '{"B1","B2"}'),

    (s10_id, 'How does inductive reactance change as frequency increases, and what is the reactance of an inductor at DC (f = 0)?',
     '[{"id":"a","text":"Reactance increases with frequency; at DC the reactance is zero and the coil is just its winding resistance","correct":true},{"id":"b","text":"Reactance decreases with frequency; at DC the reactance is infinite","correct":false},{"id":"c","text":"Reactance is independent of frequency; at DC it equals the reactance at 400 Hz","correct":false}]',
     '{"B1","B2"}'),

    (s10_id, 'A coil is on an aircraft 400 Hz AC supply instead of a 50 Hz ground supply. What is the practical benefit for the transformer or choke using that coil?',
     '[{"id":"a","text":"The inductive reactance is higher at 400 Hz, allowing a much smaller, lighter transformer or choke to be used","correct":true},{"id":"b","text":"The inductive reactance is lower at 400 Hz, allowing a much smaller, lighter transformer or choke to be used","correct":false},{"id":"c","text":"Frequency has no effect on transformer or choke size","correct":false}]',
     '{"B1","B2"}'),

    (s10_id, 'What happens to an inductor''s behaviour once its core reaches saturation?',
     '[{"id":"a","text":"Its inductance collapses and the current through it shoots up","correct":true},{"id":"b","text":"Its inductance increases without limit","correct":false},{"id":"c","text":"It stops conducting current entirely","correct":false}]',
     '{"B1","B2"}'),

    (s10_id, 'Why must a suppression diode be fitted, reverse-biased, across a relay or solenoid coil driven by a transistor?',
     '[{"id":"a","text":"So the collapsing field''s back EMF can circulate its current harmlessly instead of spiking and destroying the driver","correct":true},{"id":"b","text":"So the coil draws less current while energised, saving power","correct":false},{"id":"c","text":"So the relay switches on faster when energised","correct":false}]',
     '{"B1","B2"}'),

    (s10_id, 'What happens if a relay suppression diode is fitted the wrong way round (forward-biased) across the coil?',
     '[{"id":"a","text":"It has no effect, since diode polarity does not matter for suppression","correct":false},{"id":"b","text":"It will short the supply and take out the driver","correct":true},{"id":"c","text":"It will simply reduce the strength of the relay''s magnetic field","correct":false}]',
     '{"B1","B2"}'),

    (s10_id, 'What is the correct formula for the total inductance of several inductors connected in parallel, far enough apart that they do not couple?',
     '[{"id":"a","text":"Ltotal = L1 + L2 + L3","correct":false},{"id":"b","text":"1 / Ltotal = 1/L1 + 1/L2 + 1/L3","correct":true},{"id":"c","text":"Ltotal = L1 × L2 × L3","correct":false}]',
     '{"B1","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M03.11 DC Motor/Generator Theory & DC Generators (supplement)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s11_id, 'Why are a DC motor and a DC generator physically almost identical machines?',
     '[{"id":"a","text":"A generator turns mechanical energy into electrical energy and a motor turns electrical energy into mechanical energy, using the same basic conductor-in-a-field arrangement — this is why the starter generator exists","correct":true},{"id":"b","text":"Because both machines always use AC internally before being converted","correct":false},{"id":"c","text":"Because both machines have no moving parts","correct":false}]',
     '{"B1","B2"}'),

    (s11_id, 'In an elementary generator consisting of a single loop rotating between two magnetic poles, when is the induced voltage zero?',
     '[{"id":"a","text":"When the loop is moving at right angles to the flux","correct":false},{"id":"b","text":"As the loop passes through the plane of the poles, moving momentarily parallel to the lines of flux","correct":true},{"id":"c","text":"The voltage is never zero during a full revolution","correct":false}]',
     '{"B1","B2"}'),

    (s11_id, 'How does a commutator differ from slip rings, and what does this achieve in a DC generator?',
     '[{"id":"a","text":"It is a split ring whose gap passes the brushes exactly as the loop voltage reverses, so the external circuit sees one polarity — this is mechanical rectification","correct":true},{"id":"b","text":"It is a continuous ring that keeps both ends of the loop permanently connected to the same brush","correct":false},{"id":"c","text":"It converts the AC output into a higher voltage before rectification","correct":false}]',
     '{"B1","B2"}'),

    (s11_id, 'Why do real DC generators use many loops on many commutator segments rather than a single loop?',
     '[{"id":"a","text":"So the individual voltage pulses overlap and the output smooths out to nearly steady DC","correct":true},{"id":"b","text":"So the generator can be run at a much lower speed for the same output voltage","correct":false},{"id":"c","text":"So only one brush is needed regardless of the number of poles","correct":false}]',
     '{"B1","B2"}'),

    (s11_id, 'Of the two historical types of generator armature, why is the Gramme-ring type considered inefficient compared to the drum type?',
     '[{"id":"a","text":"In a Gramme-ring armature, only half the winding actually cuts flux, whereas all conductors on a drum-type armature are on the outer surface","correct":true},{"id":"b","text":"The Gramme-ring armature requires twice as many commutator segments as a drum type","correct":false},{"id":"c","text":"The Gramme-ring armature cannot be used with a commutator at all","correct":false}]',
     '{"B1","B2"}'),

    (s11_id, 'Of the three factors affecting DC generator output, which one is normally used to control output voltage in service, since it can be adjusted electrically without touching engine speed?',
     '[{"id":"a","text":"Field strength","correct":true},{"id":"b","text":"Number of armature conductors","correct":false},{"id":"c","text":"Speed of rotation","correct":false}]',
     '{"B1","B2"}'),

    (s11_id, 'How is the direction of a DC generator''s output current reversed?',
     '[{"id":"a","text":"By reversing either the direction of rotation or the field polarity (but not both together)","correct":true},{"id":"b","text":"By reversing both the direction of rotation and the field polarity at the same time","correct":false},{"id":"c","text":"The direction of output current in a DC generator cannot be reversed","correct":false}]',
     '{"B1","B2"}'),

    (s11_id, 'What causes armature reaction in a DC generator, and what is its visible effect?',
     '[{"id":"a","text":"Current flowing in the armature creates its own magnetic field that twists the neutral plane round in the direction of rotation, causing brush sparking and commutator burning","correct":true},{"id":"b","text":"Worn brushes reduce the field strength, causing the output voltage to fall","correct":false},{"id":"c","text":"The commutator segments becoming demagnetised over time","correct":false}]',
     '{"B1","B2"}'),

    (s11_id, 'Interpoles (commutating poles) are described as the standard fix for armature reaction because:',
     '[{"id":"a","text":"They are wound in series with the armature, so their corrective effect automatically tracks the load current","correct":true},{"id":"b","text":"They are wound in parallel with the field, giving a fixed correction regardless of load","correct":false},{"id":"c","text":"They physically move the brushes to the new neutral plane as load changes","correct":false}]',
     '{"B1","B2"}'),

    (s11_id, 'Compensating windings, used on heavy-duty DC generators to counter armature reaction, are:',
     '[{"id":"a","text":"Small poles fitted between the main poles","correct":false},{"id":"b","text":"Conductors let into the pole face itself, connected in series with the armature","correct":true},{"id":"c","text":"A resistor connected across the brushes","correct":false}]',
     '{"B1","B2"}'),

    (s11_id, 'Why is a series-wound DC generator, whose output voltage rises with load current, not used for aircraft power supply?',
     '[{"id":"a","text":"It has very poor voltage regulation","correct":true},{"id":"b","text":"It cannot generate more than a few volts under any load","correct":false},{"id":"c","text":"It requires an external AC supply to operate its field winding","correct":false}]',
     '{"B1","B2"}'),

    (s11_id, 'In a compound-wound DC generator, what is the purpose of adding a series field alongside the shunt field?',
     '[{"id":"a","text":"The series field props the voltage up as load increases, giving much better regulation than a shunt generator alone","correct":true},{"id":"b","text":"The series field replaces the need for a commutator entirely","correct":false},{"id":"c","text":"The series field is only used to reverse the direction of rotation","correct":false}]',
     '{"B1","B2"}'),

    (s11_id, 'When bedding new brushes to a generator commutator, why must emery paper never be used?',
     '[{"id":"a","text":"Emery is too coarse and will scratch the commutator surface","correct":false},{"id":"b","text":"Emery grit is conductive and can lodge in the mica insulation between segments","correct":true},{"id":"c","text":"Emery paper reacts chemically with the copper commutator segments","correct":false}]',
     '{"B1","B2"}'),

    (s11_id, 'On a healthy DC generator commutator, the mica insulation between segments should be:',
     '[{"id":"a","text":"Level with the copper segments","correct":false},{"id":"b","text":"Standing proud of the copper segments to protect the brushes","correct":false},{"id":"c","text":"Undercut below the copper, so that as the copper wears the mica does not stand proud and lift the brushes","correct":true}]',
     '{"B1","B2"}'),

    (s11_id, 'In a starter generator, which field winding is used during the starting phase, and why?',
     '[{"id":"a","text":"A series field, because series characteristics give enormous starting torque","correct":true},{"id":"b","text":"A shunt field, because it gives the most stable current during cranking","correct":false},{"id":"c","text":"Both windings are always energised together during starting and generating","correct":false}]',
     '{"B1","B2"}'),

    (s11_id, 'When troubleshooting a starter-generator system with slow cranking, what should be checked first, since it is very often the actual cause?',
     '[{"id":"a","text":"The generator control unit software","correct":false},{"id":"b","text":"Battery/ground power unit capacity and volt drop","correct":true},{"id":"c","text":"The field winding insulation resistance","correct":false}]',
     '{"B1","B2"}'),

    (s11_id, 'A DC generator is rated at 28 V, 200 A. What primarily limits this rating?',
     '[{"id":"a","text":"Heating of the machine","correct":true},{"id":"b","text":"The number of commutator segments fitted","correct":false},{"id":"c","text":"The type of bearings used","correct":false}]',
     '{"B1","B2"}'),

    (s11_id, 'A generator armature has 6 poles and is lap wound. What is the minimum number of brushes required?',
     '[{"id":"a","text":"2, regardless of the number of poles","correct":false},{"id":"b","text":"6, as many as there are poles","correct":true},{"id":"c","text":"3, half the number of poles","correct":false}]',
     '{"B1","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M03.12 DC Motors (supplement)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s12_id, 'When a current-carrying conductor is placed in a magnetic field, what happens to the conductor?',
     '[{"id":"a","text":"The flux is strengthened on one side and weakened on the other, and the conductor is pushed towards the weak side","correct":true},{"id":"b","text":"The conductor is pushed towards the strong side of the field","correct":false},{"id":"c","text":"The conductor experiences no force unless it is also part of a closed loop","correct":false}]',
     '{"B1","B2"}'),

    (s12_id, 'What three factors does the torque produced by a DC motor depend on?',
     '[{"id":"a","text":"Field strength, armature current, and the number of armature conductors and their radius","correct":true},{"id":"b","text":"Supply voltage only, regardless of current or field","correct":false},{"id":"c","text":"Commutator segment count and brush material only","correct":false}]',
     '{"B1","B2"}'),

    (s12_id, 'What is the formula relating armature current, applied voltage, back EMF and armature resistance in a DC motor?',
     '[{"id":"a","text":"Armature current = (Applied voltage − Back EMF) / Armature resistance","correct":true},{"id":"b","text":"Armature current = (Applied voltage + Back EMF) × Armature resistance","correct":false},{"id":"c","text":"Armature current = Applied voltage / (Back EMF × Armature resistance)","correct":false}]',
     '{"B1","B2"}'),

    (s12_id, 'Why does a DC motor draw a very large surge of current at the instant of starting?',
     '[{"id":"a","text":"Because at zero speed the back EMF is zero, so the full applied voltage drives current limited only by armature resistance","correct":true},{"id":"b","text":"Because the field winding is short-circuited briefly at start-up","correct":false},{"id":"c","text":"Because the commutator segments have not yet made contact with the brushes","correct":false}]',
     '{"B1","B2"}'),

    (s12_id, 'A DC motor is described as "self-regulating" because, when heavily loaded:',
     '[{"id":"a","text":"It slows down, back EMF falls, so it draws more current and produces more torque","correct":true},{"id":"b","text":"It speeds up, back EMF rises, so it draws less current and produces less torque","correct":false},{"id":"c","text":"Its speed and current both remain completely constant regardless of load","correct":false}]',
     '{"B1","B2"}'),

    (s12_id, 'Why must a series-wound DC motor never be run unloaded?',
     '[{"id":"a","text":"With no load it will accelerate until it destroys itself (runaway)","correct":true},{"id":"b","text":"It will simply stall and fail to turn at all","correct":false},{"id":"c","text":"It will reverse direction spontaneously","correct":false}]',
     '{"B1","B2"}'),

    (s12_id, 'Why is a shunt-wound DC motor, with its essentially constant field strength, well suited to fans, blowers and pumps?',
     '[{"id":"a","text":"It gives nearly constant speed over its load range, though with only modest starting torque","correct":true},{"id":"b","text":"It gives the highest possible starting torque of any DC motor type","correct":false},{"id":"c","text":"Its speed varies enormously with load, matching the demands of a fan","correct":false}]',
     '{"B1","B2"}'),

    (s12_id, 'What combination of characteristics makes a compound-wound DC motor a good compromise for driving cowl flaps, landing gear or flap actuation?',
     '[{"id":"a","text":"Good starting torque combined with reasonable speed regulation","correct":true},{"id":"b","text":"Constant speed regardless of load, but very poor starting torque","correct":false},{"id":"c","text":"Maximum possible speed with no regard for starting torque","correct":false}]',
     '{"B1","B2"}'),

    (s12_id, 'How is the speed of a DC motor controlled?',
     '[{"id":"a","text":"Reduce armature voltage to slow it; weaken the field to speed it up","correct":true},{"id":"b","text":"Reduce armature voltage to speed it up; weaken the field to slow it down","correct":false},{"id":"c","text":"Speed can only be changed by physically altering the number of armature conductors","correct":false}]',
     '{"B1","B2"}'),

    (s12_id, 'How is the direction of rotation of a DC motor reversed?',
     '[{"id":"a","text":"Reverse the current through either the field or the armature, but not both","correct":true},{"id":"b","text":"Reverse the current through both the field and the armature together","correct":false},{"id":"c","text":"Increase the supply voltage beyond its rated value","correct":false}]',
     '{"B1","B2"}'),

    (s12_id, 'How does a split-field reversible actuator motor achieve reversal of direction?',
     '[{"id":"a","text":"It has two field windings, wound in opposition, energised one at a time","correct":true},{"id":"b","text":"It has a single field winding whose current is briefly reversed by a relay","correct":false},{"id":"c","text":"It physically swaps the brush positions on the commutator","correct":false}]',
     '{"B1","B2"}'),

    (s12_id, 'A motor operated continuously, such as a fuel pump, fan, or gyro motor, is an example of which duty type?',
     '[{"id":"a","text":"Intermittent duty","correct":false},{"id":"b","text":"Continuous duty","correct":true},{"id":"c","text":"Momentary duty only","correct":false}]',
     '{"B1","B2"}'),

    (s12_id, 'A starter motor, operated for short periods with cooling breaks such as "3 starts then 30 minutes cooling", is an example of which duty type, and how should its duty cycle limit be treated?',
     '[{"id":"a","text":"Continuous duty; the limit is only a rough guideline","correct":false},{"id":"b","text":"Intermittent duty; the duty cycle limits in the manual must be observed, not treated as a suggestion","correct":true},{"id":"c","text":"Continuous duty; there is no fixed cooling requirement","correct":false}]',
     '{"B1","B2"}'),

    (s12_id, 'Which of the following is classified as an iron loss in a DC machine, rather than a copper, brush, or mechanical loss?',
     '[{"id":"a","text":"Hysteresis and eddy current losses in the core","correct":true},{"id":"b","text":"I²R heating in the windings","correct":false},{"id":"c","text":"Bearing friction and windage","correct":false}]',
     '{"B1","B2"}'),

    (s12_id, 'A machine has been left in service with worn brushes, resulting in a carbon-coated interior that tracks and flashes over. What is the correct remedy?',
     '[{"id":"a","text":"Fitting new brushes alone will clear the fault","correct":false},{"id":"b","text":"Fitting new brushes alone will not clear the fault — the carbon-coated interior must also be addressed","correct":true},{"id":"c","text":"The fault will clear itself once the machine reaches operating temperature","correct":false}]',
     '{"B1","B2"}'),

    (s12_id, 'What is the consequence of running a starter motor beyond its duty cycle to attempt "just one more start"?',
     '[{"id":"a","text":"The winding insulation fails, and it fails permanently","correct":true},{"id":"b","text":"The motor simply runs slightly hotter with no lasting effect","correct":false},{"id":"c","text":"The commutator automatically disconnects to protect the windings","correct":false}]',
     '{"B1","B2"}');
END $$;
