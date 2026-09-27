-- Migration 101: Supplement Module 03 (Electrical Fundamentals) subjects M03.5, M03.6, M03.7, M03.8
-- Source: M03_Electrics_Study_Notes.txt, Sub-Modules 06-09 (DC Circuits, Resistance/Resistor,
-- Power, Capacitance/Capacitor), cross-checked against the 728-question bank (m3_questions_parsed.txt).
-- Adds new question rows only; does not touch easa_subjects.

DO $$
DECLARE
    s5_id INT; s6_id INT; s7_id INT; s8_id INT;
BEGIN
    SELECT id INTO s5_id FROM easa_subjects WHERE code = 'M03.5';
    SELECT id INTO s6_id FROM easa_subjects WHERE code = 'M03.6';
    SELECT id INTO s7_id FROM easa_subjects WHERE code = 'M03.7';
    SELECT id INTO s8_id FROM easa_subjects WHERE code = 'M03.8';

    IF s5_id IS NULL OR s6_id IS NULL OR s7_id IS NULL OR s8_id IS NULL THEN
        RAISE NOTICE 'One or more of M03.5/M03.6/M03.7/M03.8 not found, skipping.';
        RETURN;
    END IF;

    -- Idempotency guard: skip if this supplement was already applied.
    IF EXISTS (
        SELECT 1 FROM questions WHERE subject_id = s5_id
        AND text LIKE '%Three branches carry currents of 3 A, 4 A and 5 A into a junction%'
    ) THEN
        RAISE NOTICE 'M03 part 2 supplement already seeded, skipping.';
        RETURN;
    END IF;

    -- ===================== M03.5 DC Circuits (15) =====================
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s5_id, 'According to Ohm''s Law, which formula correctly relates voltage (E), current (I) and resistance (R)?',
     '[{"id":"a","text":"E = I x R","correct":true},{"id":"b","text":"I = E x R","correct":false},{"id":"c","text":"R = E x I","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'In a series circuit, which quantity is the same at every point in the circuit?',
     '[{"id":"a","text":"Voltage","correct":false},{"id":"b","text":"Current","correct":true},{"id":"c","text":"Power","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'Resistors of 2 ohm, 4 ohm and 6 ohm are connected in series across a 24 V supply. What is the total circuit resistance?',
     '[{"id":"a","text":"12 ohm","correct":true},{"id":"b","text":"3 ohm","correct":false},{"id":"c","text":"48 ohm","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'Using the same 24 V supply across 2 ohm, 4 ohm and 6 ohm resistors in series (total resistance 12 ohm), what is the circuit current?',
     '[{"id":"a","text":"2 A","correct":true},{"id":"b","text":"12 A","correct":false},{"id":"c","text":"0.5 A","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'In a series circuit, the voltage dropped across an individual resistor is proportional to:',
     '[{"id":"a","text":"Its resistance value","correct":true},{"id":"b","text":"The supply frequency","correct":false},{"id":"c","text":"The total number of resistors only","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'Kirchhoff''s Voltage Law states that, around any closed loop:',
     '[{"id":"a","text":"The sum of the EMFs equals the sum of the voltage drops","correct":true},{"id":"b","text":"The current is the same at every point","correct":false},{"id":"c","text":"Total resistance is the sum of all the resistances","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'In a parallel circuit, which quantity is the same across every branch?',
     '[{"id":"a","text":"Current","correct":false},{"id":"b","text":"Voltage","correct":true},{"id":"c","text":"Resistance","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'Three branches carry currents of 3 A, 4 A and 5 A into a junction, while a fourth branch carries 10 A away from it. What must the current be in a fifth branch?',
     '[{"id":"a","text":"2 A, leaving the junction","correct":true},{"id":"b","text":"22 A, leaving the junction","correct":false},{"id":"c","text":"12 A, entering the junction","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'For resistors connected in parallel, the total resistance is always:',
     '[{"id":"a","text":"Equal to the largest branch resistance","correct":false},{"id":"b","text":"Less than the smallest branch resistance","correct":true},{"id":"c","text":"Equal to the sum of all the branch resistances","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'A 6 ohm resistor and a 12 ohm resistor are connected in parallel. What is the total resistance?',
     '[{"id":"a","text":"4 ohm","correct":true},{"id":"b","text":"18 ohm","correct":false},{"id":"c","text":"9 ohm","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'A 24 V supply is applied across the 6 ohm and 12 ohm resistors of the previous question (total resistance 4 ohm). What is the total circuit current?',
     '[{"id":"a","text":"6 A","correct":true},{"id":"b","text":"2 A","correct":false},{"id":"c","text":"4 A","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'Four resistors of 12 ohm each are connected in parallel. What is the total resistance?',
     '[{"id":"a","text":"48 ohm","correct":false},{"id":"b","text":"3 ohm","correct":true},{"id":"c","text":"12 ohm","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'As the load current drawn from a battery increases, the terminal voltage of the battery:',
     '[{"id":"a","text":"Increases","correct":false},{"id":"b","text":"Stays exactly the same","correct":false},{"id":"c","text":"Decreases, because of the internal resistance","correct":true}]',
     '{"B1","B2"}'),

    (s5_id, 'A loose, corroded connector in a circuit behaves as an unwanted extra resistance, causing the load to run weak. This kind of fault is best located by:',
     '[{"id":"a","text":"A static, off-load resistance check only","correct":false},{"id":"b","text":"Volt-drop testing across the joint under load","correct":true},{"id":"c","text":"Measuring the supply voltage at the battery terminals only","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'In a series string with an open-circuit fault, a voltmeter placed across each component in turn will read full supply voltage across:',
     '[{"id":"a","text":"Every component equally","correct":false},{"id":"b","text":"The open (broken) component","correct":true},{"id":"c","text":"None of the components","correct":false}]',
     '{"B1","B2"}');

    -- ===================== M03.6 Resistance & Resistors (16) =====================
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s6_id, 'For a given conductor material, resistance is directly proportional to:',
     '[{"id":"a","text":"Its length","correct":true},{"id":"b","text":"Its cross-sectional area","correct":false},{"id":"c","text":"Its colour code","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'Doubling the cross-sectional area of a conductor, with everything else unchanged, will:',
     '[{"id":"a","text":"Double its resistance","correct":false},{"id":"b","text":"Halve its resistance","correct":true},{"id":"c","text":"Have no effect on resistance","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'In the formula R = (rho x L) / A for the resistance of a conductor, rho represents:',
     '[{"id":"a","text":"The resistivity of the material","correct":true},{"id":"b","text":"The applied voltage","correct":false},{"id":"c","text":"The temperature coefficient","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'A material whose resistance rises as its temperature increases, such as copper, is said to have a:',
     '[{"id":"a","text":"Negative temperature coefficient","correct":false},{"id":"b","text":"Positive temperature coefficient","correct":true},{"id":"c","text":"Zero temperature coefficient","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'Which of these materials has a negative temperature coefficient of resistance (resistance falls as temperature rises)?',
     '[{"id":"a","text":"Copper","correct":false},{"id":"b","text":"Aluminium","correct":false},{"id":"c","text":"Carbon","correct":true}]',
     '{"B1","B2"}'),

    (s6_id, 'A resistor is marked with the bands brown, black, orange, gold. What is its value and tolerance?',
     '[{"id":"a","text":"10 kilohm +/- 5%","correct":true},{"id":"b","text":"1 kilohm +/- 10%","correct":false},{"id":"c","text":"100 ohm +/- 5%","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'A resistor has four bands coloured blue, yellow, yellow, gold. What is its value?',
     '[{"id":"a","text":"640 kilohm +/- 5%","correct":true},{"id":"b","text":"64 kilohm +/- 10%","correct":false},{"id":"c","text":"4.6 megohm +/- 5%","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'Ignoring the tolerance band, what four-band colour code represents a nominal 300 ohm resistor?',
     '[{"id":"a","text":"Orange, black, brown","correct":true},{"id":"b","text":"Orange, orange, brown","correct":false},{"id":"c","text":"Orange, brown, black","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'Resistors are manufactured in standard E-series preferred values so that:',
     '[{"id":"a","text":"Every possible resistance value is available","correct":false},{"id":"b","text":"The tolerance band of each value just meets the next, covering the range with no gaps","correct":true},{"id":"c","text":"Only round numbers such as 10, 100 and 1000 ohm are produced","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'When replacing a resistor, the new component should be rated at:',
     '[{"id":"a","text":"Exactly the calculated power dissipation","correct":false},{"id":"b","text":"At least twice the calculated power dissipation","correct":true},{"id":"c","text":"Half the calculated power dissipation","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'A wire-wound resistor is generally unsuitable for high-frequency circuits because:',
     '[{"id":"a","text":"It has significant inductance, being a coil of wire","correct":true},{"id":"b","text":"Its tolerance is always too poor","correct":false},{"id":"c","text":"It cannot dissipate enough power","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'Compared with carbon composition resistors, carbon film and metal film resistors offer:',
     '[{"id":"a","text":"Worse tolerance and worse stability","correct":false},{"id":"b","text":"Better tolerance, better stability and lower noise","correct":true},{"id":"c","text":"Higher inductance","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'A rheostat differs from a potentiometer in that a rheostat:',
     '[{"id":"a","text":"Has three terminals and is used to control voltage","correct":false},{"id":"b","text":"Has two terminals and is wired in series with the load to control current","correct":true},{"id":"c","text":"Cannot be used to control current at all","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'How many terminals does a potentiometer have?',
     '[{"id":"a","text":"Two","correct":false},{"id":"b","text":"Three","correct":true},{"id":"c","text":"Four","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'At balance, a Wheatstone bridge satisfies which relationship between its four arms R1, R2, R3 and R4?',
     '[{"id":"a","text":"R1 / R2 = R3 / R4","correct":true},{"id":"b","text":"R1 x R2 = R3 x R4","correct":false},{"id":"c","text":"R1 + R2 = R3 + R4","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'In a balanced Wheatstone bridge, the galvanometer connected across the bridge reads:',
     '[{"id":"a","text":"Zero current","correct":true},{"id":"b","text":"Maximum current","correct":false},{"id":"c","text":"Half the supply current","correct":false}]',
     '{"B1","B2"}');

    -- ===================== M03.7 Electrical Power & Maximum Power Transfer (16) =====================
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s7_id, 'The basic formula for electrical power in a DC circuit is:',
     '[{"id":"a","text":"P = E x I","correct":true},{"id":"b","text":"P = E / I","correct":false},{"id":"c","text":"P = E + I","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, 'Which form of the power formula should be used when current and resistance are known, but not voltage?',
     '[{"id":"a","text":"P = E squared / R","correct":false},{"id":"b","text":"P = I squared x R","correct":true},{"id":"c","text":"P = E x I","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, 'Which form of the power formula should be used when voltage and resistance are known, but not current?',
     '[{"id":"a","text":"P = E squared / R","correct":true},{"id":"b","text":"P = I squared x R","correct":false},{"id":"c","text":"P = E / I","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, 'A 28 V supply is applied across a 14 ohm heating element. What power is dissipated?',
     '[{"id":"a","text":"2 W","correct":false},{"id":"b","text":"56 W","correct":true},{"id":"c","text":"392 W","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, 'What power is dissipated in a 5 ohm resistor carrying a current of 3 A?',
     '[{"id":"a","text":"15 W","correct":false},{"id":"b","text":"45 W","correct":true},{"id":"c","text":"25 W","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, 'If the current through a fixed resistor is doubled, the power it dissipates:',
     '[{"id":"a","text":"Doubles","correct":false},{"id":"b","text":"Quadruples","correct":true},{"id":"c","text":"Stays the same","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, 'In a series circuit, since the same current flows through every resistor, which resistor dissipates the most power?',
     '[{"id":"a","text":"The smallest resistor","correct":false},{"id":"b","text":"The largest resistor","correct":true},{"id":"c","text":"All dissipate equal power","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, 'In a parallel circuit, since the same voltage is applied to every branch, which resistor dissipates the most power?',
     '[{"id":"a","text":"The largest resistor","correct":false},{"id":"b","text":"The smallest resistor","correct":true},{"id":"c","text":"All dissipate equal power","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, 'For resistors connected together, whether in series or in parallel, the total power dissipated is:',
     '[{"id":"a","text":"Always the sum of the individual powers","correct":true},{"id":"b","text":"Always less than the sum of the individual powers","correct":false},{"id":"c","text":"Dependent on which type of circuit is used","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, 'Electrical energy in a circuit is calculated as:',
     '[{"id":"a","text":"Power x time","correct":true},{"id":"b","text":"Power / time","correct":false},{"id":"c","text":"Power x resistance","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, 'A 100 W lamp is left switched on for 5 hours. How much energy, in kilowatt-hours, has it consumed?',
     '[{"id":"a","text":"0.5 kWh","correct":true},{"id":"b","text":"5 kWh","correct":false},{"id":"c","text":"50 kWh","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, '1 horsepower is equivalent to approximately:',
     '[{"id":"a","text":"550 watts","correct":false},{"id":"b","text":"746 watts","correct":true},{"id":"c","text":"1000 watts","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, 'A battery capacity quoted in ampere-hours (Ah) is actually a measure of:',
     '[{"id":"a","text":"Energy","correct":false},{"id":"b","text":"Charge","correct":true},{"id":"c","text":"Power","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, 'A 24 V, 40 Ah battery holds approximately how much energy?',
     '[{"id":"a","text":"960 Wh","correct":true},{"id":"b","text":"40 Wh","correct":false},{"id":"c","text":"24 Wh","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, 'Maximum power transfer from a source to a load occurs when the load resistance equals the source''s internal resistance. At this point, the efficiency of the transfer is:',
     '[{"id":"a","text":"100%","correct":false},{"id":"b","text":"50%","correct":true},{"id":"c","text":"0%","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, 'When sizing a fuse or circuit breaker for a circuit, the rating chosen is based primarily on:',
     '[{"id":"a","text":"Protecting the connected equipment directly","correct":false},{"id":"b","text":"What the cable can carry without overheating","correct":true},{"id":"c","text":"The generator''s total output rating","correct":false}]',
     '{"B1","B2"}');

    -- ===================== M03.8 Capacitors & Capacitance (18) =====================
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s8_id, 'A capacitor stores electrical charge by:',
     '[{"id":"a","text":"Allowing current to flow continuously through the dielectric","correct":false},{"id":"b","text":"Building up an electrostatic charge on two plates separated by a dielectric","correct":true},{"id":"c","text":"Generating an EMF internally","correct":false}]',
     '{"B1","B2"}'),

    (s8_id, 'Capacitance is defined by the formula:',
     '[{"id":"a","text":"C = Q / E","correct":true},{"id":"b","text":"C = Q x E","correct":false},{"id":"c","text":"C = E / Q","correct":false}]',
     '{"B1","B2"}'),

    (s8_id, 'One microfarad is equal to:',
     '[{"id":"a","text":"10 to the power of -12 farads","correct":false},{"id":"b","text":"10 to the power of -6 farads","correct":true},{"id":"c","text":"10 to the power of 6 farads","correct":false}]',
     '{"B1","B2"}'),

    (s8_id, 'Once fully charged, a capacitor connected to a DC supply:',
     '[{"id":"a","text":"Continues to draw significant current","correct":false},{"id":"b","text":"Blocks further current flow","correct":true},{"id":"c","text":"Discharges itself through the dielectric","correct":false}]',
     '{"B1","B2"}'),

    (s8_id, 'The time constant of a resistor-capacitor (RC) circuit is given by the formula:',
     '[{"id":"a","text":"T = R / C","correct":false},{"id":"b","text":"T = R x C","correct":true},{"id":"c","text":"T = R + C","correct":false}]',
     '{"B1","B2"}'),

    (s8_id, 'After one time constant, a charging capacitor has reached what percentage of the applied voltage?',
     '[{"id":"a","text":"36.8%","correct":false},{"id":"b","text":"63.2%","correct":true},{"id":"c","text":"99.3%","correct":false}]',
     '{"B1","B2"}'),

    (s8_id, 'A capacitor charging through a resistor is generally considered to be fully charged after:',
     '[{"id":"a","text":"One time constant","correct":false},{"id":"b","text":"Five time constants","correct":true},{"id":"c","text":"Ten time constants","correct":false}]',
     '{"B1","B2"}'),

    (s8_id, 'A 100 kilohm resistor is connected in series with a 10 microfarad capacitor. What is the time constant of this circuit?',
     '[{"id":"a","text":"0.1 second","correct":false},{"id":"b","text":"1 second","correct":true},{"id":"c","text":"10 seconds","correct":false}]',
     '{"B1","B2"}'),

    (s8_id, 'When a fully charged capacitor is discharged through a resistor, after one time constant its voltage has fallen to:',
     '[{"id":"a","text":"63.2% of its starting value","correct":false},{"id":"b","text":"36.8% of its starting value","correct":true},{"id":"c","text":"Zero","correct":false}]',
     '{"B1","B2"}'),

    (s8_id, 'Increasing the plate area of a capacitor, with all else unchanged, will:',
     '[{"id":"a","text":"Increase its capacitance","correct":true},{"id":"b","text":"Decrease its capacitance","correct":false},{"id":"c","text":"Have no effect on capacitance","correct":false}]',
     '{"B1","B2"}'),

    (s8_id, 'Increasing the distance between the plates of a capacitor, with all else unchanged, will:',
     '[{"id":"a","text":"Increase its capacitance","correct":false},{"id":"b","text":"Decrease its capacitance","correct":true},{"id":"c","text":"Have no effect on capacitance","correct":false}]',
     '{"B1","B2"}'),

    (s8_id, 'For calculation purposes, capacitors connected in series behave like:',
     '[{"id":"a","text":"Resistors connected in series","correct":false},{"id":"b","text":"Resistors connected in parallel","correct":true},{"id":"c","text":"A Wheatstone bridge","correct":false}]',
     '{"B1","B2"}'),

    (s8_id, 'A 6 microfarad capacitor and a 3 microfarad capacitor are connected in series. What is the total capacitance?',
     '[{"id":"a","text":"9 microfarad","correct":false},{"id":"b","text":"2 microfarad","correct":true},{"id":"c","text":"18 microfarad","correct":false}]',
     '{"B1","B2"}'),

    (s8_id, 'A 6 microfarad capacitor and a 3 microfarad capacitor are connected in parallel. What is the total capacitance?',
     '[{"id":"a","text":"2 microfarad","correct":false},{"id":"b","text":"9 microfarad","correct":true},{"id":"c","text":"18 microfarad","correct":false}]',
     '{"B1","B2"}'),

    (s8_id, 'When capacitors are connected in series, the combined arrangement''s ability to withstand voltage:',
     '[{"id":"a","text":"Is limited to that of the lowest-rated capacitor","correct":false},{"id":"b","text":"Adds up across the string","correct":true},{"id":"c","text":"Is unaffected by the number of capacitors used","correct":false}]',
     '{"B1","B2"}'),

    (s8_id, 'When capacitors are connected in parallel, the working voltage of the combination is:',
     '[{"id":"a","text":"The sum of all the individual working voltages","correct":false},{"id":"b","text":"That of the lowest-rated capacitor in the group","correct":true},{"id":"c","text":"Always doubled","correct":false}]',
     '{"B1","B2"}'),

    (s8_id, 'An electrolytic capacitor:',
     '[{"id":"a","text":"Is non-polarised and can be fitted either way round","correct":false},{"id":"b","text":"Is polarised and must be fitted with correct polarity, or it may overheat and burst","correct":true},{"id":"c","text":"Has no working-voltage limit","correct":false}]',
     '{"B1","B2"}'),

    (s8_id, 'Capacitive reactance is given by the formula:',
     '[{"id":"a","text":"Xc = 2 x pi x f x C","correct":false},{"id":"b","text":"Xc = 1 / (2 x pi x f x C)","correct":true},{"id":"c","text":"Xc = 2 x pi x f / C","correct":false}]',
     '{"B1","B2"}');

END $$;
