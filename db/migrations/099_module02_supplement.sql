-- Migration 099: Supplementary questions for Module 02 (Physics) — M02.1 through M02.5
-- Sources:
--   1. EASA_Module_02_-_Physics_-_Study_Notes.txt (primary; full text read, all 5 sub-modules)
--   2. m2_questions_parsed.txt — a 489-question bank (secondary; only [CORRECT]-marked
--      questions used, routed to the matching existing subject by topic)
-- This migration is append-only: it looks up the five EXISTING M02 subject rows and inserts
-- additional question rows. It does not touch easa_subjects in any way.

DO $$
DECLARE
    s1_id INT; s2_id INT; s3_id INT; s4_id INT; s5_id INT;
BEGIN
    SELECT id INTO s1_id FROM easa_subjects WHERE code = 'M02.1';
    SELECT id INTO s2_id FROM easa_subjects WHERE code = 'M02.2';
    SELECT id INTO s3_id FROM easa_subjects WHERE code = 'M02.3';
    SELECT id INTO s4_id FROM easa_subjects WHERE code = 'M02.4';
    SELECT id INTO s5_id FROM easa_subjects WHERE code = 'M02.5';

    IF s1_id IS NULL OR s2_id IS NULL OR s3_id IS NULL OR s4_id IS NULL OR s5_id IS NULL THEN
        RAISE NOTICE 'One or more M02 subjects not found, skipping.';
        RETURN;
    END IF;

    -- Idempotency guard: skip if this supplement was already applied.
    IF EXISTS (
        SELECT 1 FROM questions
        WHERE subject_id = s2_id
          AND text LIKE '%first class lever lifts a 500 lb weight%'
    ) THEN
        RAISE NOTICE 'M02 supplement already seeded, skipping.';
        RETURN;
    END IF;

    -- ══════════════════════════════════════════════════════════════
    -- M02.1 — Matter (23 questions)
    -- ══════════════════════════════════════════════════════════════
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s1_id, 'What charge does a proton carry, and where in the atom is it located?',
     '[{"id":"a","text":"Positive charge, in the nucleus","correct":true},{"id":"b","text":"Negative charge, in the nucleus","correct":false},{"id":"c","text":"Positive charge, orbiting in a shell","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'How does the mass of a neutron compare with the mass of a proton?',
     '[{"id":"a","text":"A neutron has roughly the same mass as a proton","correct":true},{"id":"b","text":"A neutron has about 1/1836 the mass of a proton","correct":false},{"id":"c","text":"A neutron has no mass at all","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'Approximately how does the mass of an electron compare with the mass of a proton?',
     '[{"id":"a","text":"About 1/1836 of a proton''s mass","correct":true},{"id":"b","text":"About the same as a proton''s mass","correct":false},{"id":"c","text":"About twice a proton''s mass","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'A neutral atom has equal numbers of which two particles?',
     '[{"id":"a","text":"Protons and electrons","correct":true},{"id":"b","text":"Protons and neutrons","correct":false},{"id":"c","text":"Neutrons and electrons","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'How many electrons can the first (innermost) shell hold, and how many can the second shell hold?',
     '[{"id":"a","text":"First shell: 2; second shell: 8","correct":true},{"id":"b","text":"First shell: 8; second shell: 2","correct":false},{"id":"c","text":"First shell: 2; second shell: 18","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'The third electron shell has a true maximum capacity of 18 electrons, but there is a quirk in how it fills. What is it?',
     '[{"id":"a","text":"The third shell fills to 8, then a fourth shell begins filling to 8, before the third shell resumes to reach 18","correct":true},{"id":"b","text":"The third shell fills straight to 18 before any electrons enter the fourth shell","correct":false},{"id":"c","text":"The third shell can never exceed 8 electrons under any circumstances","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'Why is copper (29 electrons) an excellent electrical conductor, in terms of its valence shell?',
     '[{"id":"a","text":"Copper ends up with a single, loosely-held electron in its outermost shell, due to the third-shell filling quirk","correct":true},{"id":"b","text":"Copper has a completely full outer shell, making its electrons easy to remove","correct":false},{"id":"c","text":"Copper has no valence shell at all","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'Why are the noble gases (helium, neon, argon, krypton) good electrical insulators?',
     '[{"id":"a","text":"Their valence shell is full, so their electrons are gripped tightly and will not move easily","correct":true},{"id":"b","text":"Their valence shell is empty, so there are no electrons available to move at all","correct":false},{"id":"c","text":"They contain no protons, so there is nothing to attract electrons","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'A material whose valence shell holds just one or three electrons, loosely held and able to drift from atom to atom, is best described as what?',
     '[{"id":"a","text":"A conductor, full of free electrons","correct":true},{"id":"b","text":"An insulator, resistant to current flow","correct":false},{"id":"c","text":"A catalyst for chemical reactions","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'What is the connection between a metal''s electrical conductivity and its susceptibility to corrosion?',
     '[{"id":"a","text":"Both are consequences of the same loosely-held valence electrons — a good conductor is also chemically willing to react","correct":true},{"id":"b","text":"There is no relationship; conductivity and corrosion resistance are entirely unrelated properties","correct":false},{"id":"c","text":"Good conductors are always the most corrosion-resistant metals","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'A covalent bond is formed when two atoms bond by which mechanism?',
     '[{"id":"a","text":"They share electrons so that both valence shells read as full","correct":true},{"id":"b","text":"One atom transfers all of its electrons to the other atom","correct":false},{"id":"c","text":"Their nuclei fuse together, releasing energy","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'Salt water is a mixture, while salt (sodium chloride) itself is a compound. What is the discriminating test between the two?',
     '[{"id":"a","text":"Whether the constituents are held together by a chemical bond","correct":true},{"id":"b","text":"Whether the substance is a liquid or a solid at room temperature","correct":false},{"id":"c","text":"Whether the substance conducts electricity","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'Protium, deuterium and tritium are all isotopes of hydrogen. What do they have in common, and what differs between them?',
     '[{"id":"a","text":"They share the same number of protons and electrons; they differ in their number of neutrons","correct":true},{"id":"b","text":"They share the same number of neutrons; they differ in their number of protons","correct":false},{"id":"c","text":"They are entirely different elements with different chemical behaviour","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'Why do isotopes of the same element react identically in chemical reactions, despite having different masses?',
     '[{"id":"a","text":"Chemical behaviour is set by electron structure, and isotopes have identical electron structures","correct":true},{"id":"b","text":"Isotopes always have identical numbers of neutrons, which controls chemical behaviour","correct":false},{"id":"c","text":"Chemical behaviour depends only on atomic mass, which is coincidentally similar across isotopes","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'Plasma, the fourth state of matter, is best described as what?',
     '[{"id":"a","text":"An ionised gas containing free electrons and positive ions, which conducts electricity","correct":true},{"id":"b","text":"A liquid heated until it becomes perfectly transparent","correct":false},{"id":"c","text":"A solid compressed until its molecules stop vibrating entirely","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'Why are liquids treated as incompressible while gases are treated as compressible?',
     '[{"id":"a","text":"Liquid molecules already sit close together so squeezing barely changes their volume, while gas molecules are far apart and can be pushed closer","correct":true},{"id":"b","text":"Liquids have no mass, so pressure cannot act on them, while gases have mass and pressure can compress them","correct":false},{"id":"c","text":"Both liquids and gases are equally compressible; the distinction is only a convention","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'Why do gases have no surface tension, while liquids do?',
     '[{"id":"a","text":"In a liquid the molecules are close enough to attract one another; in a gas the molecules are too far apart for this attraction to matter","correct":true},{"id":"b","text":"Gases are always hotter than liquids, and heat destroys surface tension","correct":false},{"id":"c","text":"Surface tension only exists in substances that are electrically charged","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'While a substance is changing state (e.g. boiling), what happens to its temperature as heat continues to be added?',
     '[{"id":"a","text":"The temperature stays constant; the heat energy goes into the change of state as latent heat","correct":true},{"id":"b","text":"The temperature rises steadily in direct proportion to the heat added","correct":false},{"id":"c","text":"The temperature falls, because energy is being consumed by the change of state","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'As the pressure on water is increased from 10 psi to 14.7 psi to 20 psi, what happens to its boiling point?',
     '[{"id":"a","text":"It rises, from 194 °F, to 212 °F, to 226.4 °F","correct":true},{"id":"b","text":"It falls steadily as pressure increases","correct":false},{"id":"c","text":"It stays fixed at 212 °F regardless of pressure","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'A volatile substance is one that develops a high vapour pressure at standard day temperature because of what property?',
     '[{"id":"a","text":"It has a low boiling point","correct":true},{"id":"b","text":"It has a high boiling point","correct":false},{"id":"c","text":"It has a high specific gravity","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'What is a catalyst, using the two-part epoxy hardener as the everyday example?',
     '[{"id":"a","text":"A substance that speeds up a reaction without itself being consumed or altered by it","correct":true},{"id":"b","text":"A substance that is consumed in the reaction to provide the energy needed","correct":false},{"id":"c","text":"A substance that always slows a chemical reaction down","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'What is an inhibitor, as used in fuel and primer coatings to fight corrosion?',
     '[{"id":"a","text":"A substance that slows a chemical reaction down — the opposite of a catalyst","correct":true},{"id":"b","text":"A substance that speeds a chemical reaction up, like a catalyst","correct":false},{"id":"c","text":"A substance that changes the colour of a reaction without affecting its rate","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'The Law of Conservation of Matter states that matter can be neither created nor destroyed. When a gallon of Avgas is burned, what happens to it according to this law?',
     '[{"id":"a","text":"It changes form into carbon dioxide, water vapour and other products, but none of the matter is lost","correct":true},{"id":"b","text":"It is genuinely destroyed and ceases to exist as matter","correct":false},{"id":"c","text":"Its mass converts entirely into heat energy with no remaining matter","correct":false}]',
     '{"B1","B2"}');

    -- ══════════════════════════════════════════════════════════════
    -- M02.2 — Mechanics (36 questions)
    -- ══════════════════════════════════════════════════════════════
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s2_id, 'One pound of force is equal to how many newtons?',
     '[{"id":"a","text":"4.448 N","correct":true},{"id":"b","text":"2.205 N","correct":false},{"id":"c","text":"9.81 N","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'Two equal forces act at the same point in exactly opposite directions. What is the effect on the body?',
     '[{"id":"a","text":"They cancel completely; the body behaves as though no force were applied","correct":true},{"id":"b","text":"They produce pure rotation, since the forces are equal and opposite","correct":false},{"id":"c","text":"They double the effective force on the body","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'Two equal forces act in opposite directions, but are parallel and offset rather than acting through the same point. What is this arrangement called, and what does it produce?',
     '[{"id":"a","text":"A couple; it produces pure rotation with no resultant translating force","correct":true},{"id":"b","text":"A moment; it produces both translation and rotation","correct":false},{"id":"c","text":"A resultant; the two forces simply cancel to zero","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'Why is the torque produced by a couple described as a "free vector"?',
     '[{"id":"a","text":"Its value is the same no matter which point it is measured about","correct":true},{"id":"b","text":"It has no magnitude, only a direction","correct":false},{"id":"c","text":"It only exists when the body is moving freely with no supports","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'A beam 100 in long carries 200 lb at 20 in from the datum and 300 lb at 80 in from the datum. Where is the centre of gravity?',
     '[{"id":"a","text":"56 in aft of the datum","correct":true},{"id":"b","text":"50 in aft of the datum","correct":false},{"id":"c","text":"62 in aft of the datum","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'Which of the five stresses acting on an aircraft structure is illustrated by the engine pulling the aircraft forward while drag holds it back?',
     '[{"id":"a","text":"Tension","correct":true},{"id":"b","text":"Compression","correct":false},{"id":"c","text":"Torsion","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'Bending stress in a wing spar is a combination of which two other stresses?',
     '[{"id":"a","text":"Tension and compression","correct":true},{"id":"b","text":"Torsion and shear","correct":false},{"id":"c","text":"Tension and torsion","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'While an aircraft is in flight, lift bends the wing upward. Which skin surface is in compression, and which is in tension?',
     '[{"id":"a","text":"Upper skin in compression, lower skin in tension","correct":true},{"id":"b","text":"Upper skin in tension, lower skin in compression","correct":false},{"id":"c","text":"Both skins are in tension in flight","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'On the ground, gravity bends an aircraft''s wing downward under its own weight. Which skin surface is now in tension?',
     '[{"id":"a","text":"The upper skin","correct":true},{"id":"b","text":"The lower skin","correct":false},{"id":"c","text":"Neither skin experiences tension on the ground","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'Why are fasteners (rivets, bolts, screws) typically the first parts of a structure to fail under excessive load?',
     '[{"id":"a","text":"Shearing strength is usually equal to or less than a material''s tensile or compressive strength","correct":true},{"id":"b","text":"Fasteners are always made from weaker materials than the surrounding structure","correct":false},{"id":"c","text":"Fasteners carry no load at all under normal operation","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'What does Young''s Modulus of Elasticity represent, and what does a high value indicate about a material?',
     '[{"id":"a","text":"E = stress ÷ strain; a high E means a stiff material that strains very little under load","correct":true},{"id":"b","text":"E = strain ÷ stress; a high E means a very compliant, flexible material","correct":false},{"id":"c","text":"E = load ÷ area; a high E means a material with high tensile strength only","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'A 10 ft³ object weighing 700 lb is placed in pure water (density 62.4 lb/ft³). Does it float or sink, and what is its apparent weight while submerged?',
     '[{"id":"a","text":"It sinks; apparent weight is 76 lb","correct":true},{"id":"b","text":"It floats; apparent weight is 0 lb","correct":false},{"id":"c","text":"It sinks; apparent weight is 624 lb","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'Three vessels of wildly different shapes are all filled with liquid to the same height. What determines the pressure reading at the bottom of each vessel?',
     '[{"id":"a","text":"Only the height of the liquid column — shape and total volume make no difference","correct":true},{"id":"b","text":"The shape of the vessel, since a wider vessel produces higher pressure","correct":false},{"id":"c","text":"The total volume of liquid in the vessel","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'On a standard day, what mercury column height balances atmospheric pressure, and what is the equivalent pressure in psi?',
     '[{"id":"a","text":"29.92 inHg, equal to 14.7 psi","correct":true},{"id":"b","text":"14.7 inHg, equal to 29.92 psi","correct":false},{"id":"c","text":"760 inHg, equal to 1013.2 psi","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'An F-15 cruising at 400 mph selects full afterburner and reaches 1,200 mph in 20 seconds. What is the average acceleration in mph/s?',
     '[{"id":"a","text":"40 mph/s","correct":true},{"id":"b","text":"60 mph/s","correct":false},{"id":"c","text":"20 mph/s","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'A turbojet passes 150 lb of air per second, which enters at 100 ft/s and leaves at 1,200 ft/s. Using F = W(Vf − Vi) ÷ (g × t), how much thrust is produced?',
     '[{"id":"a","text":"5,124 lb","correct":true},{"id":"b","text":"3,417 lb","correct":false},{"id":"c","text":"41,000 lb","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'Newton''s First Law describes inertia. Which everyday demonstration illustrates it, according to the study material?',
     '[{"id":"a","text":"Whipping a tablecloth out from under a full dinner service without disturbing the crockery","correct":true},{"id":"b","text":"A propeller pushing air backward to move an aircraft forward","correct":false},{"id":"c","text":"A turbine disc failing under centripetal load","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'A 10 lb weight moves in a 3 ft radius circle at 500 ft/s. Using F = (mass × velocity²) ÷ radius, what is the centripetal force?',
     '[{"id":"a","text":"25,880 lb","correct":true},{"id":"b","text":"2,588 lb","correct":false},{"id":"c","text":"8,333 lb","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'If the velocity of an object in circular motion is doubled while mass and radius stay the same, what happens to the required centripetal force?',
     '[{"id":"a","text":"It quadruples, since force is proportional to velocity squared","correct":true},{"id":"b","text":"It doubles, in direct proportion to velocity","correct":false},{"id":"c","text":"It stays the same, since velocity does not affect centripetal force","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'As a pendulum runs down, each swing becomes shorter than the last. What happens to its period?',
     '[{"id":"a","text":"It stays exactly the same","correct":true},{"id":"b","text":"It becomes shorter along with the swing","correct":false},{"id":"c","text":"It becomes longer as the swing decays","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'What causes some piston-engined aircraft to be placarded against continuous operation in a particular rpm band?',
     '[{"id":"a","text":"Resonance — that rpm matches the propeller metal''s natural frequency, building stress cycle on cycle","correct":true},{"id":"b","text":"That rpm band always causes excessive fuel consumption","correct":false},{"id":"c","text":"That rpm band exceeds the maximum torque rating of the crankshaft","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'What is the fundamental rule that governs every simple machine, regarding force and speed?',
     '[{"id":"a","text":"A machine can multiply force, or multiply speed and distance, but never both at once","correct":true},{"id":"b","text":"A machine can multiply both force and speed simultaneously, if well designed","correct":false},{"id":"c","text":"A machine always multiplies force and always reduces speed by the same fixed ratio","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'A first class lever lifts a 500 lb weight. The weight is 12 in from the fulcrum; the effort is applied 60 in from the fulcrum. What effort force is needed?',
     '[{"id":"a","text":"100 lb","correct":true},{"id":"b","text":"50 lb","correct":false},{"id":"c","text":"250 lb","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'For a block and tackle, how do you count the mechanical advantage from the rope sections?',
     '[{"id":"a","text":"Count only the rope sections supporting the load, not the section being pulled on","correct":true},{"id":"b","text":"Count every rope section including the one being pulled on","correct":false},{"id":"c","text":"Count only the pulling rope, since it determines the effort applied","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'A worm gear drives a 25-tooth spur gear. What mechanical advantage does this arrangement give, and why is it self-locking?',
     '[{"id":"a","text":"MA of 25, because one full turn of the worm advances the spur gear by only one tooth","correct":true},{"id":"b","text":"MA of 1, because a worm gear always produces a 1:1 ratio","correct":false},{"id":"c","text":"MA of 25 only if the spur gear is driven at high rpm","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'In a planetary reduction gearbox with a 28-tooth sun gear and an 82-tooth ring gear, what is the reduction ratio, and what role do the planet gears play in the calculation?',
     '[{"id":"a","text":"Reduction = ring teeth ÷ sun teeth = 2.93; the planet gears are idlers and do not appear in the calculation","correct":true},{"id":"b","text":"Reduction = planet teeth ÷ sun teeth; the planet gear count is the key variable","correct":false},{"id":"c","text":"Reduction = sun teeth ÷ ring teeth = 0.34; the ring gear is an idler","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'Astronauts appear weightless in orbit. What is actually happening, according to the study material?',
     '[{"id":"a","text":"The spacecraft and everything in it are in free fall together, so nothing presses on anything, even though gravity is still present","correct":true},{"id":"b","text":"Gravity genuinely disappears at orbital altitude","correct":false},{"id":"c","text":"The astronauts'' mass is converted entirely to energy while in orbit","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'A Boeing 777 weighing 600,000 lb is rolling at 200 ft/s. Using KE = (1/2) × (weight ÷ g) × velocity², roughly how much kinetic energy does it possess?',
     '[{"id":"a","text":"About 372,670,000 ft-lb","correct":true},{"id":"b","text":"About 186,335,000 ft-lb","correct":false},{"id":"c","text":"About 12,000,000,000 ft-lb","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'Why does contact area not appear in the friction equation F = μN?',
     '[{"id":"a","text":"Doubling the contact area halves the pressure at each point, and the two effects cancel exactly","correct":true},{"id":"b","text":"Friction only depends on the weight of the object, never on the surfaces in contact","correct":false},{"id":"c","text":"Contact area is already included inside the coefficient of friction, μ","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'Push a 10 in wrench with 10 lb of force on a bolt that is already tight and does not turn. How much work has been done, and how much torque exists?',
     '[{"id":"a","text":"No work has been done, but 100 lb-in of torque exists","correct":true},{"id":"b","text":"100 in-lb of work has been done, and no torque exists","correct":false},{"id":"c","text":"Both work and torque are zero, since nothing moved","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'Read F × t = m × (change in velocity) — the impulse-momentum relationship — the other way round. What design principle does this explain?',
     '[{"id":"a","text":"For a given change in momentum, extending the time over which it occurs reduces the force — the basis of crumple zones and oleo struts","correct":true},{"id":"b","text":"A shorter stopping time always reduces the peak force experienced","correct":false},{"id":"c","text":"Momentum can be eliminated entirely by choosing the right materials","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'A free gyro''s rotor continues pointing in the same direction regardless of how its base is moved. What is this property called, and which four factors govern its strength?',
     '[{"id":"a","text":"Rigidity in space; governed by weight, angular velocity, radius of the mass, and bearing friction","correct":true},{"id":"b","text":"Precession; governed only by the applied torque","correct":false},{"id":"c","text":"Inertia; governed only by the total mass of the rotor","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'A force is applied to the axis of a spinning gyro. In which direction does the gyro actually respond?',
     '[{"id":"a","text":"As though the force had been applied 90° further around the rotor, in the direction of rotation","correct":true},{"id":"b","text":"Directly in the same direction the force was applied","correct":false},{"id":"c","text":"Directly opposite to the direction the force was applied","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'Input piston area is 1/4 in² and output piston area is 15 in² in a hydraulic system. An input force of 50 lb is applied. What is the system pressure and the resulting output force?',
     '[{"id":"a","text":"200 psi system pressure, producing 3,000 lb of output force","correct":true},{"id":"b","text":"50 psi system pressure, producing 750 lb of output force","correct":false},{"id":"c","text":"200 psi system pressure, producing 200 lb of output force","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'According to Bernoulli''s Principle, what happens to a fluid''s static pressure at points where its velocity increases (assuming no energy is added or removed)?',
     '[{"id":"a","text":"Static pressure decreases","correct":true},{"id":"b","text":"Static pressure increases","correct":false},{"id":"c","text":"Static pressure is unaffected by velocity changes","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'What happens to a fluid''s viscosity as its temperature falls, and what problem can result from oil that is too thick?',
     '[{"id":"a","text":"Viscosity increases; oil that is too thick resists flow, causing power loss and excessive wear","correct":true},{"id":"b","text":"Viscosity decreases; oil that is too thick fails to seal at pumps and valves","correct":false},{"id":"c","text":"Viscosity stays constant with temperature; thickness is unrelated to temperature","correct":false}]',
     '{"B1","B2"}');

    -- ══════════════════════════════════════════════════════════════
    -- M02.3 — Thermodynamics (22 questions)
    -- ══════════════════════════════════════════════════════════════
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s3_id, 'One pound of aviation gasoline contains 18,900 BTU of heat energy. Given that 1 BTU = 778 ft-lb of work, roughly how much mechanical work does that represent?',
     '[{"id":"a","text":"About 14,704,200 ft-lb","correct":true},{"id":"b","text":"About 18,900 ft-lb","correct":false},{"id":"c","text":"About 778,000 ft-lb","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'Why must every gas law calculation use absolute temperature (Kelvin or Rankine) rather than Celsius or Fahrenheit?',
     '[{"id":"a","text":"Feeding a non-absolute temperature into a gas law gives a wrong answer that still looks plausible — the most common arithmetic failure in this sub-module","correct":true},{"id":"b","text":"Gas laws only work with negative temperature values","correct":false},{"id":"c","text":"Absolute temperature scales are simply more convenient to write, with no calculation impact","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'A steel rod measures exactly 9 ft at 21 °C, with a linear expansion coefficient of 0.000011 per °C. What is its approximate length at 55 °C?',
     '[{"id":"a","text":"About 9.0034 ft","correct":true},{"id":"b","text":"About 9.034 ft","correct":false},{"id":"c","text":"About 9.34 ft","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'Aluminium expands more than twice as much as steel per degree of temperature rise. What design consequence does this have for a joint that mixes the two metals?',
     '[{"id":"a","text":"The joint must be designed to accommodate differential expansion between the two materials","correct":true},{"id":"b","text":"No special design is needed, since both metals expand by the same fixed amount regardless of coefficient","correct":false},{"id":"c","text":"Aluminium and steel should never physically touch, under any circumstances","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'What is the operating principle of a bimetallic thermometer, such as a direct-reading OAT gauge?',
     '[{"id":"a","text":"Two dissimilar metal strips bonded together expand at different rates, so heating unwinds the coiled end and cooling tightens it","correct":true},{"id":"b","text":"A sealed capsule filled with volatile liquid changes vapour pressure directly with temperature","correct":false},{"id":"c","text":"Electrical resistance of a wound alloy element changes as temperature changes","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'In a Bourdon tube (vapour pressure) temperature gauge, why is the capillary tube connecting the sensing bulb to the instrument made deliberately narrow?',
     '[{"id":"a","text":"So the volatile liquid stays predominantly in the bulb rather than spreading through the capillary","correct":true},{"id":"b","text":"So the vapour pressure reading is amplified for greater accuracy","correct":false},{"id":"c","text":"So the capillary tube itself can be calibrated in degrees directly","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'What is the operating principle behind an electrical resistance thermometer?',
     '[{"id":"a","text":"For most metals, electrical resistance changes — typically rising — as the temperature of the metal changes","correct":true},{"id":"b","text":"Two unlike metals joined at two junctions produce an EMF proportional to their temperature difference","correct":false},{"id":"c","text":"A sealed capsule filled with volatile liquid changes vapour pressure directly with temperature","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'Why is a ratiometer indicator generally preferred over a Wheatstone bridge indicator for temperature measurement?',
     '[{"id":"a","text":"It measures a ratio of currents rather than an absolute value, so it is not affected by line voltage fluctuation","correct":true},{"id":"b","text":"It requires no sensing bulb at all, simplifying installation","correct":false},{"id":"c","text":"It is cheaper to manufacture, though less accurate","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'What is the fundamental operating principle of a thermocouple?',
     '[{"id":"a","text":"Two unlike metals joined at two separate junctions produce an EMF proportional to the temperature difference between the junctions","correct":true},{"id":"b","text":"A single metal wire changes its electrical resistance in proportion to temperature","correct":false},{"id":"c","text":"A bimetallic strip bends in proportion to the temperature difference between two ends","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'Which metal pairs are used for cylinder head temperature (CHT) and turbine exhaust gas temperature (EGT) thermocouples, respectively?',
     '[{"id":"a","text":"CHT: iron and constantan (or copper and constantan); EGT: chromel and alumel","correct":true},{"id":"b","text":"CHT: chromel and alumel; EGT: iron and constantan","correct":false},{"id":"c","text":"Both CHT and EGT use the same platinum and rhodium pair","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'Why can a thermocouple lead not simply be replaced with a longer length of the same-looking wire during a repair?',
     '[{"id":"a","text":"The leads are designed to contribute a specific, very small resistance to the circuit, so changing their length is a calibration error","correct":true},{"id":"b","text":"Thermocouple leads carry mains voltage and a longer lead would be a safety hazard","correct":false},{"id":"c","text":"Longer leads always read low regardless of their resistance, with no way to compensate","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'What does cold junction compensation correct for in a thermocouple indicator, and how is it typically achieved?',
     '[{"id":"a","text":"It corrects for changes in cockpit temperature at the cold junction, typically using a bimetallic spring in the indicator mechanism","correct":true},{"id":"b","text":"It corrects for changes in fuel flow at the hot junction, using a flow-compensated resistor","correct":false},{"id":"c","text":"It corrects for altitude changes only, using a sealed aneroid capsule","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'Ranked from best to worst among common metals, which conducts heat best: silver, copper or aluminium?',
     '[{"id":"a","text":"Silver conducts best, then copper, then aluminium","correct":true},{"id":"b","text":"Copper conducts best, then silver, then aluminium","correct":false},{"id":"c","text":"Aluminium conducts best, then copper, then silver","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'In an air-cooled piston engine such as a Continental IO-520, how does heat actually get from inside the cylinder to the cooling airflow?',
     '[{"id":"a","text":"By conduction through the cylinder metal to the fins, then by forced convection carrying it away from the fins","correct":true},{"id":"b","text":"Entirely by radiation from the cylinder head directly into the airstream","correct":false},{"id":"c","text":"Entirely by natural convection, with no assistance from the propeller or baffling","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'Why can radiant heat from the sun cross 93 million miles of vacuum to reach the earth, when conduction and convection cannot?',
     '[{"id":"a","text":"Radiation needs no medium at all and travels through vacuum, unlike conduction and convection which require physical contact or fluid movement","correct":true},{"id":"b","text":"Radiation travels through vacuum only because sunlight is much hotter than any other heat source","correct":false},{"id":"c","text":"Conduction and convection can also cross a vacuum, just much more slowly","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'Why do large bodies of water buffer the surrounding air and land temperatures against violent swings?',
     '[{"id":"a","text":"Water has an unusually high specific heat capacity, so it requires enormous heat to change temperature and thus absorbs and releases heat slowly","correct":true},{"id":"b","text":"Water has a very low specific heat capacity, so it changes temperature instantly and evens out swings immediately","correct":false},{"id":"c","text":"Water reflects almost all incoming solar radiation, preventing temperature change entirely","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, '10 ft³ of nitrogen at 500 psia is compressed at constant temperature to 7 ft³. Using Boyle''s Law (V1P1 = V2P2), what is the new pressure?',
     '[{"id":"a","text":"About 714.3 psia","correct":true},{"id":"b","text":"About 350 psia","correct":false},{"id":"c","text":"About 500 psia","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'A 15 ft³ oxygen cylinder sits at 70 °F and 750 psig. Left in the sun, the oxygen reaches 140 °F, with volume held constant. Applying Charles'' Law correctly (converting to absolute temperature and pressure), what happens to the gauge pressure?',
     '[{"id":"a","text":"It rises to about 851 psig","correct":true},{"id":"b","text":"It rises to about 1,500 psig, exactly doubling","correct":false},{"id":"c","text":"It stays at 750 psig, since volume did not change","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'Dalton''s Law of Partial Pressures states that a mixture of non-reacting gases exerts what total pressure?',
     '[{"id":"a","text":"The sum of the pressures each gas would exert separately if it alone occupied the entire volume at the given temperature","correct":true},{"id":"b","text":"The average of the pressures each gas would exert separately","correct":false},{"id":"c","text":"Only the pressure of whichever gas has the highest concentration","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'The reciprocating engine runs on the Otto cycle, described as "constant volume," even though the piston''s swept volume clearly changes throughout the cycle. What does "constant volume" actually refer to?',
     '[{"id":"a","text":"Volume is held constant only during the combustion event, while the fuel-air charge burns","correct":true},{"id":"b","text":"The total cylinder volume never changes throughout the entire four-stroke cycle","correct":false},{"id":"c","text":"The volume of fuel injected is held constant regardless of engine speed","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'The gas turbine runs on the Brayton cycle, described as "constant pressure," even though the compressor''s entire job is to raise pressure. What does "constant pressure" actually refer to?',
     '[{"id":"a","text":"Pressure is held relatively constant only during the combustion (expansion) event","correct":true},{"id":"b","text":"Pressure never changes anywhere at all in a gas turbine engine","correct":false},{"id":"c","text":"Only the exhaust pressure is held constant throughout the cycle","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'A typical reciprocating engine is only about 34% thermally efficient at best. According to the study material, roughly what proportion of the heat produced is lost through the exhaust alone?',
     '[{"id":"a","text":"About 40–45%","correct":true},{"id":"b","text":"About 5–10%","correct":false},{"id":"c","text":"About 90%","correct":false}]',
     '{"B1","B2"}');

    -- ══════════════════════════════════════════════════════════════
    -- M02.4 — Optics and Wave Motion (20 questions)
    -- ══════════════════════════════════════════════════════════════
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s4_id, 'What is the refractive index of a material, and what does a higher value indicate?',
     '[{"id":"a","text":"n = speed of light in a vacuum ÷ speed of light in the material; a higher n means light travels slower through it","correct":true},{"id":"b","text":"n = speed of light in the material ÷ speed of light in a vacuum; a higher n means light travels faster through it","correct":false},{"id":"c","text":"n = wavelength ÷ frequency; a higher n means a longer wavelength","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'Comparing water (refractive index 1.33) and glass (refractive index ≈1.6), through which medium does light travel faster?',
     '[{"id":"a","text":"Water, since it has the lower refractive index","correct":true},{"id":"b","text":"Glass, since it has the higher refractive index","correct":false},{"id":"c","text":"They are identical, since both are transparent","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'Since frequency × wavelength = speed of light (fλ = c), and violet light has a shorter wavelength than red light, what can be said about violet light''s frequency?',
     '[{"id":"a","text":"Violet has a higher frequency than red","correct":true},{"id":"b","text":"Violet has a lower frequency than red","correct":false},{"id":"c","text":"Violet and red have identical frequencies","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'State the three laws of reflection.',
     '[{"id":"a","text":"Angle of incidence equals angle of reflection; incident ray, reflected ray and normal lie in the same plane; the two rays lie on opposite sides of the normal","correct":true},{"id":"b","text":"Angle of incidence is always double the angle of reflection; both rays lie on the same side of the normal","correct":false},{"id":"c","text":"Reflection only obeys these laws for curved mirrors, not flat ones","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'A convex mirror, used for a passenger-side rear-view mirror, has what typical effect on the reflected image?',
     '[{"id":"a","text":"It demagnifies the image and gives a wider field of view","correct":true},{"id":"b","text":"It magnifies the image and narrows the field of view","correct":false},{"id":"c","text":"It has no effect on image size, only on brightness","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'When light enters a slower medium at an angle, in which direction does it bend, and does its frequency change?',
     '[{"id":"a","text":"It bends toward the normal; frequency stays the same, fixed at the source","correct":true},{"id":"b","text":"It bends away from the normal; frequency increases as speed decreases","correct":false},{"id":"c","text":"It does not bend at all unless the angle of incidence exceeds 90°","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'What happens to light travelling from a slow medium (glass) into a faster medium (air) once the angle of incidence exceeds the critical angle?',
     '[{"id":"a","text":"Total internal reflection occurs — no light escapes, and it is completely reflected back inside","correct":true},{"id":"b","text":"The light is completely absorbed by the boundary","correct":false},{"id":"c","text":"The light passes straight through with no bending at all","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'What physical principle allows a fibre optic cable to carry light around a bend without letting it escape?',
     '[{"id":"a","text":"Total internal reflection at the core-cladding boundary","correct":true},{"id":"b","text":"Diffraction of the light wave at the fibre surface","correct":false},{"id":"c","text":"Reflection off a metallic coating applied to the outside of the fibre","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'Of the two basic lens shapes — biconvex and biconcave — which converges light to a focal point, and which diverges it?',
     '[{"id":"a","text":"Biconvex converges light; biconcave diverges it","correct":true},{"id":"b","text":"Biconvex diverges light; biconcave converges it","correct":false},{"id":"c","text":"Both shapes converge light, but to different focal points","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'What is an optical aberration?',
     '[{"id":"a","text":"The failure of light rays to converge at a single focus, caused by limitations or defects of the lens","correct":true},{"id":"b","text":"The deliberate scattering of light to diffuse a beam","correct":false},{"id":"c","text":"The complete absorption of light by an opaque lens material","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'Working outward from the centre of a fibre optic cable, in what order are the core, cladding, coating/buffer, strength member and outer jacket arranged, and which of these layers has no optical function?',
     '[{"id":"a","text":"Core, then cladding, then buffer, then strength member, then jacket; only the core and cladding are optically active","correct":true},{"id":"b","text":"Jacket, then strength member, then buffer, then cladding, then core; all five layers are optically active","correct":false},{"id":"c","text":"Cladding, then core, then jacket, then buffer, then strength member; only the jacket is optically active","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'What happens to optical loss in a fibre optic cable bent to a radius smaller than about 30 mm?',
     '[{"id":"a","text":"It increases greatly","correct":true},{"id":"b","text":"It decreases, since a tighter bend concentrates the light more","correct":false},{"id":"c","text":"It is unaffected by bend radius, only by cable length","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'In multi-mode fibre, what happens to light rays that strike the core-cladding boundary at an angle lower than the critical angle?',
     '[{"id":"a","text":"They are refracted into the cladding and lost — they carry neither light nor information onward","correct":true},{"id":"b","text":"They are reflected back down the fibre core along with all the other rays","correct":false},{"id":"c","text":"They travel faster than rays that meet the boundary at a higher angle","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'What is attenuation in a fibre optic system, and what causes it?',
     '[{"id":"a","text":"The reduction in light intensity as it travels through the fibre, caused by scattering and absorption within the fibre medium","correct":true},{"id":"b","text":"The gradual widening of the fibre core over its length due to mechanical stress","correct":false},{"id":"c","text":"The conversion of optical signal back into an electrical signal partway along the cable","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'Comparing fusion splicing and mechanical splicing of two optical fibres, which produces the lower optical loss and the stronger joint?',
     '[{"id":"a","text":"Fusion splicing — the fibre ends are melted together into one continuous waveguide","correct":true},{"id":"b","text":"Mechanical splicing — the fibres are held in alignment by a sleeve and gel","correct":false},{"id":"c","text":"Both methods produce identical optical loss and joint strength","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'Where in a fibre optic system do the greatest optical losses typically occur?',
     '[{"id":"a","text":"At splice joints and connection terminals, not along the length of the fibre itself","correct":true},{"id":"b","text":"Along the straight middle sections of the fibre run, away from any joints","correct":false},{"id":"c","text":"Only inside the transmitter''s drive circuit, before the light even enters the fibre","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'In a fibre optic data link, in what order does the signal travel from data in to data out?',
     '[{"id":"a","text":"Data in » Transmitter » Connector » Optical cable » Splice » Connector » Receiver » Data out","correct":true},{"id":"b","text":"Data in » Receiver » Optical cable » Connector » Transmitter » Data out","correct":false},{"id":"c","text":"Data in » Splice » Transmitter » Connector » Receiver » Data out","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'Name two advantages of fibre optic data transmission over conventional copper wiring, as discussed in the study material.',
     '[{"id":"a","text":"Immunity to electromagnetic interference, and no common ground required for electrical isolation","correct":true},{"id":"b","text":"Lower manufacturing cost, and simpler field-repairable connectors","correct":false},{"id":"c","text":"Higher weight for the same bandwidth, and full compatibility with existing copper connectors","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'For single-mode fibre connectors, what is achieved by polishing a slight curvature onto the fibre end (a physical contact, or PC, polish)?',
     '[{"id":"a","text":"The mated fibre cores touch only at their centres, achieving the lowest possible attenuation","correct":true},{"id":"b","text":"It widens the core to accept more light from a multi-mode source","correct":false},{"id":"c","text":"It converts the single-mode fibre into a graded-index fibre","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'What is the key structural difference in core diameter between single-mode and multi-mode fibre?',
     '[{"id":"a","text":"Single-mode core diameter is less than about ten times the wavelength of the light used; multi-mode core diameter is greater than about 10 micrometres","correct":true},{"id":"b","text":"Single-mode and multi-mode fibre always share the exact same core diameter, differing only in cladding","correct":false},{"id":"c","text":"Single-mode fibre has a larger core than multi-mode fibre, to allow only one ray of light","correct":false}]',
     '{"B1","B2"}');

    -- ══════════════════════════════════════════════════════════════
    -- M02.5 — Wave Motion and Sound (18 questions)
    -- ══════════════════════════════════════════════════════════════
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s5_id, 'Three elements are required for sound to be produced and heard. What are they?',
     '[{"id":"a","text":"A source, a medium to carry the sound, and a detector","correct":true},{"id":"b","text":"A vacuum, a light source, and an observer","correct":false},{"id":"c","text":"A vibrating source and a detector only — no medium is required","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'Are sound waves transverse or longitudinal, and what about water waves?',
     '[{"id":"a","text":"Sound waves are longitudinal; water waves are transverse","correct":true},{"id":"b","text":"Sound waves are transverse; water waves are longitudinal","correct":false},{"id":"c","text":"Both sound waves and water waves are purely transverse","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'As a tuning fork''s tine moves outward and then returns inward, what two pressure disturbances does it create in the surrounding air, in order?',
     '[{"id":"a","text":"A compression as it moves outward, followed by a rarefaction as it returns inward","correct":true},{"id":"b","text":"A rarefaction as it moves outward, followed by a compression as it returns inward","correct":false},{"id":"c","text":"Two compressions, one for each direction of tine motion","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'When two sound waves arrive out of phase and partially cancel each other, what is this phenomenon called, and what everyday device exploits it?',
     '[{"id":"a","text":"Destructive interference; exploited by noise-cancelling headsets","correct":true},{"id":"b","text":"Constructive interference; exploited by public address speaker arrays","correct":false},{"id":"c","text":"Resonance; exploited by tuning forks","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'How does a standing wave form in a medium with boundaries, such as a pipe?',
     '[{"id":"a","text":"The wave reverses at the boundary and travels back, combining with the original wave","correct":true},{"id":"b","text":"Two waves of different frequencies from separate sources happen to meet","correct":false},{"id":"c","text":"The medium itself begins vibrating spontaneously with no external source","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'What two basic physical properties of a medium govern the velocity of sound through it?',
     '[{"id":"a","text":"Density and elasticity","correct":true},{"id":"b","text":"Temperature and colour","correct":false},{"id":"c","text":"Density and electrical conductivity","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'At 20 °C, sound travels faster in aluminium (16,700 ft/s) than in the much denser lead (4,030 ft/s). What explains this apparent contradiction?',
     '[{"id":"a","text":"Aluminium is far more elastic than lead, and velocity depends on elasticity as well as density","correct":true},{"id":"b","text":"The figures are reversed — sound actually travels faster in lead, not aluminium","correct":false},{"id":"c","text":"Sound speed depends only on density, and the aluminium figure is an anomaly","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'What is the speed of sound in air at 0 °C, and how does it change as temperature rises?',
     '[{"id":"a","text":"1,087 ft/s at 0 °C, increasing by about 2 ft/s per °C rise","correct":true},{"id":"b","text":"1,087 ft/s at 0 °C, decreasing by about 2 ft/s per °C rise","correct":false},{"id":"c","text":"331 ft/s at 0 °C, unaffected by temperature","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'As an aircraft climbs into colder air, what happens to the local speed of sound, and what does this mean for its Mach number at a constant true airspeed?',
     '[{"id":"a","text":"The speed of sound falls, so a given true airspeed represents a higher Mach number at altitude than at sea level","correct":true},{"id":"b","text":"The speed of sound rises, so a given true airspeed represents a lower Mach number at altitude","correct":false},{"id":"c","text":"The speed of sound is unaffected by temperature, so Mach number does not change with altitude","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'What determines the pitch of a sound, and what determines its loudness?',
     '[{"id":"a","text":"Pitch is determined by frequency; loudness is determined by amplitude","correct":true},{"id":"b","text":"Pitch is determined by amplitude; loudness is determined by frequency","correct":false},{"id":"c","text":"Both pitch and loudness are determined by frequency alone","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'As a sound wave''s pressure variation increases, how does its intensity change?',
     '[{"id":"a","text":"Intensity is proportional to the square of the pressure variation","correct":true},{"id":"b","text":"Intensity is directly proportional to the pressure variation, with no exponent","correct":false},{"id":"c","text":"Intensity is inversely proportional to the pressure variation","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'The decibel scale is described as logarithmic rather than linear. What does this mean in practice when comparing 90 dB to 110 dB?',
     '[{"id":"a","text":"110 dB sounds about twice as loud as 90 dB, not merely 22% louder — twenty decibels is a very large increase in actual intensity","correct":true},{"id":"b","text":"110 dB sounds exactly 22% louder than 90 dB, matching the numerical difference","correct":false},{"id":"c","text":"There is no perceptible loudness difference between 90 dB and 110 dB","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'What is the Doppler effect, as illustrated by an aircraft''s changing sound as it flies overhead?',
     '[{"id":"a","text":"The object''s forward motion adds to the frequency sensed ahead of it and subtracts from the frequency sensed behind it","correct":true},{"id":"b","text":"The object''s speed changes the loudness of the sound but never its pitch","correct":false},{"id":"c","text":"The frequency heard is always identical whether the source approaches or recedes","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'Why can an observer on the ground not hear a supersonic aircraft until after it has passed overhead?',
     '[{"id":"a","text":"The sound energy cannot travel out ahead of an aircraft moving at or above the speed of sound — it trails behind and arrives only once the aircraft has passed","correct":true},{"id":"b","text":"Supersonic aircraft produce no sound energy at all while flying above Mach 1","correct":false},{"id":"c","text":"The observer''s ears cannot physically detect frequencies produced above Mach 1","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'How is frequency related to period for a repeating vibration, and what is the unit of frequency?',
     '[{"id":"a","text":"Frequency is the reciprocal of period (f = 1/T), measured in hertz (Hz), where 1 Hz = 1 cycle per second","correct":true},{"id":"b","text":"Frequency equals period multiplied by two, measured in seconds","correct":false},{"id":"c","text":"Frequency and period are unrelated quantities measured in different systems entirely","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'Left alone, a vibrating object loses amplitude steadily as its energy dissipates. What happens to its frequency during this decay?',
     '[{"id":"a","text":"The frequency does not change — on a dying guitar note, the pitch stays the same even as it gets quieter","correct":true},{"id":"b","text":"The frequency decreases in proportion to the lost amplitude","correct":false},{"id":"c","text":"The frequency increases as amplitude decreases","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'A tuning fork mounted correctly represents which type of periodic motion, and what other everyday example shares this behaviour?',
     '[{"id":"a","text":"Harmonic (vibratory) motion, also seen in a clock pendulum and the balance wheel of a watch","correct":true},{"id":"b","text":"Circular motion only, also seen in a spinning gyroscope","correct":false},{"id":"c","text":"Uniform straight-line motion, also seen in a falling object","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'A turbofan engine produces both high-frequency and low-frequency sound at the same time. What produces each, according to the study material?',
     '[{"id":"a","text":"The high tip speeds of the front fan produce high frequency sound, while the hot exhaust produces low frequency sound","correct":true},{"id":"b","text":"The compressor produces low frequency sound, while the exhaust nozzle alone produces high frequency sound","correct":false},{"id":"c","text":"All turbofan noise is produced at a single, constant frequency regardless of source","correct":false}]',
     '{"B1","B2"}');

END $$;
