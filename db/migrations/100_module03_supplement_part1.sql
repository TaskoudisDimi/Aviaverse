-- Migration 100: Supplement M03.1-M03.4 with additional questions
-- Source: M03_Electrics_Study_Notes.txt (Sub-Modules 01-05, lines 90-664) and
--         m3_questions_parsed.txt (question bank, approx. Q1-Q200, [CORRECT]-marked only)
-- This migration ADDS questions to four existing M03 subjects. It does not touch easa_subjects.
--   M03.1 Electron Theory & Structure of Matter           <- Sub-Module 01 (lines 90-191)
--   M03.2 Static Electricity, Conduction & Terminology     <- Sub-Modules 02+03 (lines 192-385)
--   M03.3 Generation of Electricity & DC Sources: Batteries <- Sub-Module 04 (lines 386-455) +
--                                                              battery-specific part of Sub-Module 05
--   M03.4 EMF, Internal Resistance, Thermocouples & Photocells <- EMF/internal-resistance/
--                                                              thermocouple/photocell part of Sub-Module 05

DO $$
DECLARE
    s1_id INT; s2_id INT; s3_id INT; s4_id INT;
BEGIN
    SELECT id INTO s1_id FROM easa_subjects WHERE code = 'M03.1';
    SELECT id INTO s2_id FROM easa_subjects WHERE code = 'M03.2';
    SELECT id INTO s3_id FROM easa_subjects WHERE code = 'M03.3';
    SELECT id INTO s4_id FROM easa_subjects WHERE code = 'M03.4';

    IF s1_id IS NULL OR s2_id IS NULL OR s3_id IS NULL OR s4_id IS NULL THEN
        RAISE NOTICE 'One or more of M03.1-M03.4 not found, skipping.';
        RETURN;
    END IF;

    IF EXISTS (
        SELECT 1 FROM questions WHERE subject_id = s1_id
        AND text LIKE '%loosely held, easily knocked free%'
    ) THEN
        RAISE NOTICE 'M03 part 1 supplement already seeded, skipping.';
        RETURN;
    END IF;

    INSERT INTO questions (subject_id, text, options, licence_types) VALUES
    -- ===================== M03.1 Electron Theory & Structure of Matter =====================
    (s1_id, 'Which of the following is defined as a substance that cannot be broken down any further by chemical means, such as copper or oxygen?',
     '[{"id":"a","text":"An element","correct":true},{"id":"b","text":"A compound","correct":false},{"id":"c","text":"A molecule","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'Water is formed from hydrogen and oxygen chemically joined together. In terms of matter, water is classed as:',
     '[{"id":"a","text":"An element","correct":false},{"id":"b","text":"A compound","correct":true},{"id":"c","text":"An ion","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'If a molecule of water is split into its constituent parts, what results?',
     '[{"id":"a","text":"Two smaller water molecules","correct":false},{"id":"b","text":"Two gases, which are no longer water","correct":true},{"id":"c","text":"A single hydrogen atom with no oxygen remaining","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'Which atomic particle is positively charged, resides in the nucleus, and is relatively heavy?',
     '[{"id":"a","text":"Electron","correct":false},{"id":"b","text":"Neutron","correct":false},{"id":"c","text":"Proton","correct":true}]',
     '{"B1","B2"}'),

    (s1_id, 'Which atomic particle carries no electrical charge, resides in the nucleus, and is relatively heavy?',
     '[{"id":"a","text":"Neutron","correct":true},{"id":"b","text":"Electron","correct":false},{"id":"c","text":"Proton","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'Which atomic particle is negatively charged, orbits the nucleus in shells, and is very light compared with the other two particles?',
     '[{"id":"a","text":"Proton","correct":false},{"id":"b","text":"Neutron","correct":false},{"id":"c","text":"Electron","correct":true}]',
     '{"B1","B2"}'),

    (s1_id, 'An atom in which the number of protons equals the number of electrons is described as:',
     '[{"id":"a","text":"An ion","correct":false},{"id":"b","text":"Electrically neutral","correct":true},{"id":"c","text":"A compound","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'Using the formula 2n squared for the maximum number of electrons a shell can hold, what is the maximum number of electrons in the fourth shell (N shell) of an atom?',
     '[{"id":"a","text":"18","correct":false},{"id":"b","text":"32","correct":true},{"id":"c","text":"8","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'The electrons in an atom''s outermost shell, which determine whether a material is a conductor, insulator or semiconductor, are called:',
     '[{"id":"a","text":"Free neutrons","correct":false},{"id":"b","text":"Valence electrons","correct":true},{"id":"c","text":"Ionised electrons","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'A material whose atoms have between 1 and 3 electrons in the valence shell, loosely held and easily knocked free, is classed as:',
     '[{"id":"a","text":"An insulator","correct":false},{"id":"b","text":"A semiconductor","correct":false},{"id":"c","text":"A conductor","correct":true}]',
     '{"B1","B2"}'),

    (s1_id, 'A material whose atoms have between 5 and 8 electrons in the valence shell, tightly held, such as rubber or glass, is classed as:',
     '[{"id":"a","text":"A conductor","correct":false},{"id":"b","text":"An insulator","correct":true},{"id":"c","text":"A semiconductor","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'Silicon and germanium each have exactly 4 electrons in their valence shell. This places them in which category of material?',
     '[{"id":"a","text":"Conductor","correct":false},{"id":"b","text":"Insulator","correct":false},{"id":"c","text":"Semiconductor","correct":true}]',
     '{"B1","B2"}'),

    (s1_id, 'Copper is used as the standard aircraft wiring conductor mainly because:',
     '[{"id":"a","text":"It has 8 valence electrons, making it a stable insulator","correct":false},{"id":"b","text":"It has only 1 valence electron, loosely held and easily freed to carry current","correct":true},{"id":"c","text":"It has exactly 4 valence electrons, the same as silicon","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'An atom that gains an extra electron, so that it has more electrons than protons, becomes:',
     '[{"id":"a","text":"A positive ion","correct":false},{"id":"b","text":"A neutral atom","correct":false},{"id":"c","text":"A negative ion","correct":true}]',
     '{"B1","B2"}'),

    (s1_id, 'In the energy-band model of a material, the band that an electron must reach before it can move freely and carry current is called the:',
     '[{"id":"a","text":"Valence band","correct":false},{"id":"b","text":"Conduction band","correct":true},{"id":"c","text":"Forbidden gap","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'Why do conductors allow current to flow so much more readily than insulators, in terms of the energy-band model?',
     '[{"id":"a","text":"In a conductor the valence and conduction bands overlap, so there is no gap for electrons to cross; in an insulator the forbidden gap is wide","correct":true},{"id":"b","text":"In a conductor the forbidden gap is wider than in an insulator, giving electrons more room to move","correct":false},{"id":"c","text":"Conductors have no valence band at all, only a conduction band","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'Aluminium is used on aircraft for some heavy feeder cables instead of copper mainly because:',
     '[{"id":"a","text":"Aluminium has lower resistance than copper for the same diameter","correct":false},{"id":"b","text":"Aluminium is far lighter than copper for the same current-carrying capacity, though it needs a larger cross-section","correct":true},{"id":"c","text":"Aluminium never requires bimetallic hardware when joined to copper terminals","correct":false}]',
     '{"B1","B2"}'),

    -- ===================== M03.2 Static Electricity, Conduction & Electrical Terminology =====================
    (s2_id, 'Static electricity is best described as:',
     '[{"id":"a","text":"Charge that is flowing continuously around a circuit","correct":false},{"id":"b","text":"Charge that has been separated and is sitting still, not flowing anywhere","correct":true},{"id":"c","text":"The current produced by a battery on open circuit","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'Rubbing two dissimilar materials together, so that electrons transfer and one material becomes positively charged while the other becomes negatively charged, is which method of producing static electricity?',
     '[{"id":"a","text":"Induction","correct":false},{"id":"b","text":"Contact","correct":false},{"id":"c","text":"Friction","correct":true}]',
     '{"B1","B2"}'),

    (s2_id, 'Bringing a charged body close to a neutral body, without touching it, so that the charges inside the neutral body rearrange, is which method of charging?',
     '[{"id":"a","text":"Induction","correct":true},{"id":"b","text":"Friction","correct":false},{"id":"c","text":"Contact","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'Two like electrostatic charges brought close together will:',
     '[{"id":"a","text":"Attract each other","correct":false},{"id":"b","text":"Repel each other","correct":true},{"id":"c","text":"Have no effect on each other","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'According to Coulomb''s Law, if the distance between two charged bodies is doubled, the force between them will:',
     '[{"id":"a","text":"Double","correct":false},{"id":"b","text":"Halve","correct":false},{"id":"c","text":"Fall to a quarter of its original value","correct":true}]',
     '{"B1","B2"}'),

    (s2_id, 'Pure water is a poor conductor, but adding a salt, acid or alkali turns it into an electrolyte. Conduction through this electrolyte occurs by:',
     '[{"id":"a","text":"Free electrons drifting through a lattice, exactly as in a metal","correct":false},{"id":"b","text":"Positive and negative ions moving simultaneously in opposite directions","correct":true},{"id":"c","text":"A single stream of electrons moving from the negative electrode only","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'A gas at normal atmospheric pressure is normally an insulator. If the applied voltage is raised enough, or the pressure lowered enough, the gas will:',
     '[{"id":"a","text":"Freeze and stop conducting entirely","correct":false},{"id":"b","text":"Ionise, with free electrons knocking more electrons loose in an avalanche, allowing conduction","correct":true},{"id":"c","text":"Convert entirely into a liquid electrolyte","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'In a vacuum, which has no atoms to ionise, current can still flow if a cathode is heated so that it "boils off" electrons. This process is called:',
     '[{"id":"a","text":"Thermionic emission","correct":true},{"id":"b","text":"Photoelectric emission","correct":false},{"id":"c","text":"Piezoelectric emission","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'Static charge that builds on an airframe from rain, snow, dust and ice crystals, and discharges off the trailing edges as corona, interfering with HF and VHF reception, is known as:',
     '[{"id":"a","text":"Bonding static","correct":false},{"id":"b","text":"Precipitation static","correct":true},{"id":"c","text":"Induction static","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'What is the difference between "bonding" and "earthing/grounding" on an aircraft?',
     '[{"id":"a","text":"Bonding ties every metal part of the airframe to the same potential; earthing/grounding ties the airframe to the ground","correct":true},{"id":"b","text":"Bonding and earthing are two names for exactly the same procedure","correct":false},{"id":"c","text":"Bonding connects the airframe to the ground; earthing connects components to each other","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'Electromotive force (EMF) is best defined as:',
     '[{"id":"a","text":"The difference in electrical pressure measured between two points in a circuit","correct":false},{"id":"b","text":"The open-circuit push that a source, such as a battery or generator, produces to drive electrons around a circuit","correct":true},{"id":"c","text":"The energy dissipated as heat in a resistor","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'Potential difference (PD) differs from EMF in that:',
     '[{"id":"a","text":"PD is measured across two points in a circuit and, on load, is less than the EMF because the source drops some voltage across its own internal resistance","correct":true},{"id":"b","text":"PD is always exactly equal to EMF, whether the circuit is on load or off load","correct":false},{"id":"c","text":"PD is measured in amperes, while EMF is measured in volts","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'Using the relationship I = Q / t, one ampere is defined as:',
     '[{"id":"a","text":"One coulomb of charge per second","correct":true},{"id":"b","text":"One volt per ohm","correct":false},{"id":"c","text":"One joule per coulomb","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'One ohm of resistance is defined as the resistance that allows:',
     '[{"id":"a","text":"One ampere to flow with one volt applied","correct":true},{"id":"b","text":"One coulomb to flow in one second, regardless of voltage","correct":false},{"id":"c","text":"One watt of power to be dissipated at any applied voltage","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'Conductance, the reciprocal of resistance (G = 1/R), is measured in:',
     '[{"id":"a","text":"Ohms","correct":false},{"id":"b","text":"Siemens","correct":true},{"id":"c","text":"Coulombs","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'Conventional current flow and electron flow give the same mathematical results but differ in that:',
     '[{"id":"a","text":"Conventional flow is taken from negative to positive, electron flow from positive to negative","correct":false},{"id":"b","text":"Conventional flow is taken from positive to negative; electron flow, what actually happens, is from negative to positive","correct":true},{"id":"c","text":"Conventional flow only applies to AC circuits, electron flow only to DC circuits","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'The resistance of a conductor is affected by:',
     '[{"id":"a","text":"Only the applied voltage","correct":false},{"id":"b","text":"The material, its length, its cross-sectional area and its temperature","correct":true},{"id":"c","text":"Only the current flowing through it","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'When measuring resistance with an ohmmeter, why must the circuit power be switched off and the component isolated at one end?',
     '[{"id":"a","text":"An ohmmeter can only be connected to AC circuits, not DC","correct":false},{"id":"b","text":"With power on, the meter will read every parallel path in the loom, giving a nonsense figure, and measuring resistance on a live circuit can destroy the meter","correct":true},{"id":"c","text":"Resistance can only be measured in series with the component carrying full load current","correct":false}]',
     '{"B1","B2"}'),

    -- ===================== M03.3 Generation of Electricity & DC Sources: Batteries =====================
    (s3_id, 'Of the six basic methods of producing electricity, which one is described as the oldest known method but the least useful on aircraft, being a nuisance (precipitation static) rather than a supply?',
     '[{"id":"a","text":"Friction","correct":true},{"id":"b","text":"Chemical action","correct":false},{"id":"c","text":"Magnetism and motion","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'Squeezing certain crystals, such as quartz, Rochelle salt or tourmaline, so that a voltage appears across their faces and reverses when the pressure is released, describes:',
     '[{"id":"a","text":"The piezoelectric effect","correct":true},{"id":"b","text":"The photoelectric effect","correct":false},{"id":"c","text":"The thermoelectric effect","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'Joining two dissimilar metals and heating the junction, so that a small voltage appears, is called the Seebeck effect. The device that uses this effect is a:',
     '[{"id":"a","text":"Photocell","correct":false},{"id":"b","text":"Thermocouple","correct":true},{"id":"c","text":"Piezoelectric crystal","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'Which of the following is a typical aircraft use of the thermoelectric (Seebeck) effect?',
     '[{"id":"a","text":"Exhaust gas temperature measurement","correct":true},{"id":"b","text":"Static discharge from the airframe","correct":false},{"id":"c","text":"Crystal oscillator frequency control","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'Light falling on certain materials frees electrons and can produce a voltage directly or change the material''s resistance. A photoelectric device that generates its own voltage when illuminated, such as a solar cell, is described as:',
     '[{"id":"a","text":"Photoconductive","correct":false},{"id":"b","text":"Photovoltaic","correct":true},{"id":"c","text":"Photoemissive","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'In the chemical-action method of producing electricity, a cell consists of two dissimilar plates in an electrolyte. What causes the potential difference between the plates?',
     '[{"id":"a","text":"A chemical reaction that strips electrons from one plate and deposits them on the other","correct":true},{"id":"b","text":"An external voltage applied across the plates before use","correct":false},{"id":"c","text":"Friction between the plates and the electrolyte as it is poured in","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'Which method of producing electricity is described as the most important, being the one used by every practical aircraft generator and alternator?',
     '[{"id":"a","text":"Chemical action","correct":false},{"id":"b","text":"Piezoelectric effect","correct":false},{"id":"c","text":"Magnetism and motion (electromagnetic induction)","correct":true}]',
     '{"B1","B2"}'),

    (s3_id, 'A primary cell, such as a carbon-zinc or lithium cell, differs from a secondary cell in that:',
     '[{"id":"a","text":"Its chemical reaction is not reversible; attempting to recharge it risks gassing, overheating and rupture","correct":true},{"id":"b","text":"It can be fully recharged an unlimited number of times","correct":false},{"id":"c","text":"It undergoes no chemical reaction at all, only a physical one","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'In a lead acid cell, what are the positive and negative plates made of?',
     '[{"id":"a","text":"Positive: nickel hydroxide; Negative: cadmium hydroxide","correct":false},{"id":"b","text":"Positive: lead dioxide (PbO2); Negative: spongy lead (Pb)","correct":true},{"id":"c","text":"Positive: cadmium hydroxide; Negative: lead dioxide","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'A lead acid cell has a nominal voltage of about 2 volts. How many cells in series are needed to make a 24 V aircraft battery?',
     '[{"id":"a","text":"6","correct":false},{"id":"b","text":"12","correct":true},{"id":"c","text":"20","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'Using a hydrometer to check a lead acid cell, a specific gravity reading in the range 1.275 to 1.300 indicates the cell is:',
     '[{"id":"a","text":"Discharged and needs recharging","correct":false},{"id":"b","text":"About half charged","correct":false},{"id":"c","text":"Fully charged","correct":true}]',
     '{"B1","B2"}'),

    (s3_id, 'A lead acid cell electrolyte specific gravity reading of 1.150 or below indicates the cell is:',
     '[{"id":"a","text":"Fully charged","correct":false},{"id":"b","text":"Discharged and should be recharged now","correct":true},{"id":"c","text":"Gassing normally and does not need attention","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'When topping up the electrolyte level of a lead acid cell, what should be added, and when?',
     '[{"id":"a","text":"Dilute sulphuric acid, added at any time","correct":false},{"id":"b","text":"Distilled or demineralised water, and only after charging","correct":true},{"id":"c","text":"Bicarbonate of soda solution, added before charging","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'In a nickel-cadmium (NiCd) cell, the electrolyte is potassium hydroxide, an alkali. What are the positive and negative plates made of?',
     '[{"id":"a","text":"Positive: lead dioxide; Negative: spongy lead","correct":false},{"id":"b","text":"Positive: nickel hydroxide/oxyhydroxide; Negative: cadmium hydroxide","correct":true},{"id":"c","text":"Positive: cadmium hydroxide; Negative: nickel hydroxide","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'A NiCd cell has a nominal voltage of 1.2 volts. Approximately how many cells in series are needed for a nominal 24 V battery?',
     '[{"id":"a","text":"12 cells","correct":false},{"id":"b","text":"19 or 20 cells","correct":true},{"id":"c","text":"24 cells","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'Why can a hydrometer not be used to check the state of charge of a NiCd cell, unlike a lead acid cell?',
     '[{"id":"a","text":"The NiCd electrolyte takes no significant part in the chemical reaction, so its specific gravity barely changes between charged and discharged","correct":true},{"id":"b","text":"NiCd cells do not contain any liquid electrolyte at all","correct":false},{"id":"c","text":"NiCd electrolyte specific gravity is always exactly 1.000 regardless of charge state","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'When two cells of equal voltage are connected in series, what happens to the combined voltage and capacity?',
     '[{"id":"a","text":"Voltage adds; capacity (in ampere-hours) stays the same as a single cell","correct":true},{"id":"b","text":"Voltage stays the same as a single cell; capacity adds","correct":false},{"id":"c","text":"Both voltage and capacity add together","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'When two cells of equal voltage are connected in parallel, what happens to the combined voltage and capacity, and what condition should the cells satisfy?',
     '[{"id":"a","text":"Voltage adds and capacity stays the same; the cells must have different states of charge","correct":false},{"id":"b","text":"Voltage stays the same as a single cell and capacity adds; the cells should be of the same voltage and, ideally, the same state of charge","correct":true},{"id":"c","text":"Both voltage and capacity add; the cells must be of different chemistries","correct":false}]',
     '{"B1","B2"}'),

    -- ===================== M03.4 EMF, Internal Resistance, Thermocouples & Photocells =====================
    (s4_id, 'Every electrical source has some resistance inside it, from its plates, electrolyte and connections. This is known as:',
     '[{"id":"a","text":"Conductance","correct":false},{"id":"b","text":"Internal resistance","correct":true},{"id":"c","text":"Reactance","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'The relationship between terminal voltage (V), EMF (E), current drawn (I) and internal resistance (r) of a source is given by:',
     '[{"id":"a","text":"V = E + (I x r)","correct":false},{"id":"b","text":"V = E - (I x r)","correct":true},{"id":"c","text":"V = E / (I x r)","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'A 24 V battery has an internal resistance of 0.05 ohms. What is its terminal voltage while cranking the engine at 200 A?',
     '[{"id":"a","text":"24 V","correct":false},{"id":"b","text":"19 V","correct":false},{"id":"c","text":"14 V","correct":true}]',
     '{"B1","B2"}'),

    (s4_id, 'A battery reads a healthy 24 V with no load connected, but fails to turn the engine when cranking is attempted. What does this most likely indicate?',
     '[{"id":"a","text":"The battery is fine; off-load voltage always confirms a battery can deliver full cranking current","correct":false},{"id":"b","text":"The battery''s internal resistance may have risen; off-load voltage tells you very little, and only a load test or capacity test tells the truth","correct":true},{"id":"c","text":"The starter motor must be at fault, since the battery voltage reads normal","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'Battery capacity is quoted in ampere-hours (Ah) at a stated discharge rate. What is the only proper measure of a battery''s actual health?',
     '[{"id":"a","text":"A single off-load voltage reading","correct":false},{"id":"b","text":"A capacity check carried out to the maintenance manual","correct":true},{"id":"c","text":"Visual inspection of the case and terminals alone","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'A thermocouple consists of two dissimilar metals joined at a hot (measuring) junction, with the other ends forming a cold (reference) junction at the instrument. What does it produce?',
     '[{"id":"a","text":"A large AC voltage proportional to current","correct":false},{"id":"b","text":"A small DC voltage, in millivolts, proportional to the temperature difference between the two junctions","correct":true},{"id":"c","text":"A resistance change proportional to absolute temperature","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'Which pair of dissimilar metals is described as the high-temperature choice, used for exhaust gas temperature (EGT) and turbine gas temperature (TGT) measurement?',
     '[{"id":"a","text":"Iron / constantan","correct":false},{"id":"b","text":"Copper / constantan","correct":false},{"id":"c","text":"Chromel / alumel","correct":true}]',
     '{"B1","B2"}'),

    (s4_id, 'Why must a thermocouple''s leads never be shortened, lengthened or substituted without reference to the maintenance manual?',
     '[{"id":"a","text":"The system is designed around a specific total loop resistance that the calibration depends on","correct":true},{"id":"b","text":"Thermocouple leads have no effect on the reading, so this is only a cosmetic concern","correct":false},{"id":"c","text":"Longer leads always increase the indicated temperature reading by a fixed amount","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'On a turbine engine, several thermocouples are wired together around the turbine. How are they connected, and why?',
     '[{"id":"a","text":"In series, so their individual millivolt readings add together","correct":false},{"id":"b","text":"In parallel, to give an average turbine gas temperature reading","correct":true},{"id":"c","text":"In a bridge circuit, to cancel out the temperature reading entirely","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'A photocell that generates its own voltage directly when light falls on it, requiring no external power supply, such as a solar cell, is called:',
     '[{"id":"a","text":"Photoconductive","correct":false},{"id":"b","text":"Photoemissive","correct":false},{"id":"c","text":"Photovoltaic","correct":true}]',
     '{"B1","B2"}'),

    (s4_id, 'A photocell whose resistance falls as the light falling on it increases, and which needs an external power supply, such as a light-dependent resistor, is called:',
     '[{"id":"a","text":"Photoconductive","correct":true},{"id":"b","text":"Photovoltaic","correct":false},{"id":"c","text":"Photoemissive","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'A photocell in which light ejects electrons from a cathode in a vacuum, to be collected by an anode, giving a very sensitive device used in detection equipment, is called:',
     '[{"id":"a","text":"Photovoltaic","correct":false},{"id":"b","text":"Photoconductive","correct":false},{"id":"c","text":"Photoemissive","correct":true}]',
     '{"B1","B2"}'),

    (s4_id, 'When disconnecting a battery for maintenance, which lead should be disconnected first, and which reconnected last?',
     '[{"id":"a","text":"The positive/live lead, in both cases","correct":false},{"id":"b","text":"The negative/earth lead, in both cases","correct":true},{"id":"c","text":"It does not matter, as long as both leads are removed together","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'Battery terminal hardware should be torqued to the figure given in the maintenance manual because:',
     '[{"id":"a","text":"A loose connection causes a hot joint, and an overtight connection can crack the terminal post","correct":true},{"id":"b","text":"Torque has no effect on a battery terminal, only cleanliness matters","correct":false},{"id":"c","text":"Overtightening always improves conductivity with no downside","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'A 24 V battery with an internal resistance of 1 ohm is connected to a load, and 12 A flows in the circuit. What is the resistance of the load alone?',
     '[{"id":"a","text":"2 ohms","correct":false},{"id":"b","text":"1 ohm","correct":true},{"id":"c","text":"12 ohms","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'Because the cold (reference) junction of a thermocouple is at the instrument, where is the thermocouple''s output voltage effectively measured?',
     '[{"id":"a","text":"At the hot (measuring) junction","correct":false},{"id":"b","text":"At the cold (reference) junction","correct":true},{"id":"c","text":"Voltage cannot be measured in a thermocouple circuit","correct":false}]',
     '{"B1","B2"}');
END $$;
