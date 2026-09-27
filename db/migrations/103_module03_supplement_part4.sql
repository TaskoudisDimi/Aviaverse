-- Migration 103: Module 03 (Electrical Fundamentals) supplement, part 4 (FINAL batch)
-- Adds supplementary questions to four EXISTING M03 subjects from newly-provided sources:
--   - M03_Electrics_Study_Notes.txt, Sub-Modules 13-18 (AC Theory; R/L/C Circuits; Transformers;
--     Filters; AC Generators; AC Motors), lines 2028-3259
--   - m3_questions_parsed.txt (728-question bank), approx. Q460-Q700 (AC theory, resonance,
--     transformers, filters, AC generators, AC motors section)
-- Does NOT touch easa_subjects or create new subject rows — only appends rows to `questions`
-- for the four subjects listed below (M03.16 combines three source sub-modules: Filters,
-- AC Generators, AC Motors).

DO $$
DECLARE
    s13_id INT; -- M03.13 Alternating Current Fundamentals: Sine Wave, Phase & 3-Phase Systems
    s14_id INT; -- M03.14 Resistive, Capacitive & Inductive AC Circuits, Resonance
    s15_id INT; -- M03.15 Transformers
    s16_id INT; -- M03.16 Filters, AC Generators, AC Motors & Starter/Generator
BEGIN
    SELECT id INTO s13_id FROM easa_subjects WHERE code = 'M03.13';
    SELECT id INTO s14_id FROM easa_subjects WHERE code = 'M03.14';
    SELECT id INTO s15_id FROM easa_subjects WHERE code = 'M03.15';
    SELECT id INTO s16_id FROM easa_subjects WHERE code = 'M03.16';

    IF s13_id IS NULL OR s14_id IS NULL OR s15_id IS NULL OR s16_id IS NULL THEN
        RAISE NOTICE 'One or more of M03.13/14/15/16 not found, skipping.';
        RETURN;
    END IF;

    -- Idempotency guard: skip if this supplement batch was already applied.
    IF EXISTS (
        SELECT 1 FROM questions
        WHERE subject_id = s13_id
          AND text LIKE '%why is that frequency chosen%'
    ) THEN
        RAISE NOTICE 'M03 supplement part 4 already seeded, skipping.';
        RETURN;
    END IF;

    -- =========================================================================================
    -- M03.13 — AC Theory: sine wave, phase, values, single/three phase (18 questions)
    -- =========================================================================================
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES
    (s13_id, 'On aircraft electrical systems, what standard voltage and frequency does the AC bus normally operate at, and why is that frequency chosen?',
     '[{"id":"a","text":"115 V AC, 400 Hz — the higher frequency allows transformers, chokes and motors to be made far smaller and lighter for the same power","correct":true},{"id":"b","text":"28 V AC, 60 Hz — matching the DC bus voltage for simplicity","correct":false},{"id":"c","text":"230 V AC, 50 Hz — matching mains supply frequency for ground power compatibility","correct":false}]',
     '{"B1","B2"}'),

    (s13_id, 'A conductor rotates at constant speed in a uniform magnetic field, generating a sine wave. At what point in the rotation is the induced voltage zero, and why?',
     '[{"id":"a","text":"At 0°, because the conductor is moving along the lines of flux and cutting nothing","correct":true},{"id":"b","text":"At 90°, because the conductor is moving across the flux at right angles","correct":false},{"id":"c","text":"At 45°, halfway through the first quarter of rotation","correct":false}]',
     '{"B1","B2"}'),

    (s13_id, 'What is the difference between a cycle and an alternation of an AC waveform?',
     '[{"id":"a","text":"A cycle is a complete set of positive and negative values (360 electrical degrees); an alternation is half a cycle (one positive or one negative loop)","correct":true},{"id":"b","text":"A cycle is one positive loop only; an alternation is the full 360° waveform","correct":false},{"id":"c","text":"There is no difference — the two terms describe the same portion of the waveform","correct":false}]',
     '{"B1","B2"}'),

    (s13_id, 'An aircraft AC system operates at 400 Hz. Using T = 1/f, what is the period (T) of one cycle?',
     '[{"id":"a","text":"2.5 milliseconds","correct":true},{"id":"b","text":"0.4 milliseconds","correct":false},{"id":"c","text":"25 milliseconds","correct":false}]',
     '{"B1","B2"}'),

    (s13_id, 'Two AC waves of the same frequency are described as out of phase. What must be stated to fully describe this relationship?',
     '[{"id":"a","text":"Only that they are out of phase — no further detail is needed","correct":false},{"id":"b","text":"By how many degrees, and in which direction, one wave leads or lags the other","correct":true},{"id":"c","text":"Only their peak amplitudes, since phase difference is determined by amplitude","correct":false}]',
     '{"B1","B2"}'),

    (s13_id, 'Two AC waves of equal amplitude are exactly 180° out of phase. What is the result if they are combined?',
     '[{"id":"a","text":"They add to twice the amplitude of either wave","correct":false},{"id":"b","text":"They cancel completely, since they are exact mirror images","correct":true},{"id":"c","text":"They combine to form a wave at double the frequency","correct":false}]',
     '{"B1","B2"}'),

    (s13_id, 'A sine wave has a peak value of 100 V. Using e = Emax × sin θ, what is the instantaneous value at 30°?',
     '[{"id":"a","text":"100 V","correct":false},{"id":"b","text":"70.7 V","correct":false},{"id":"c","text":"50 V","correct":true}]',
     '{"B1","B2"}'),

    (s13_id, 'What is the peak-to-peak value of an AC waveform, and how does it relate to the peak value?',
     '[{"id":"a","text":"The value from the positive peak down to the negative peak, equal to twice the peak value","correct":true},{"id":"b","text":"The value from zero to the positive peak, equal to the peak value","correct":false},{"id":"c","text":"The average of the positive and negative peaks, equal to zero","correct":false}]',
     '{"B1","B2"}'),

    (s13_id, 'Why is the average value of a sine wave taken over one half cycle rather than a full cycle?',
     '[{"id":"a","text":"Because averaging over a full cycle always doubles the result","correct":false},{"id":"b","text":"Because averaging over a full cycle gives zero, which tells you nothing useful","correct":true},{"id":"c","text":"Because a full cycle contains no negative values to average","correct":false}]',
     '{"B1","B2"}'),

    (s13_id, 'What does the RMS (root mean square), or effective, value of an AC waveform represent?',
     '[{"id":"a","text":"The value of AC that produces the same heating effect as an equal value of DC","correct":true},{"id":"b","text":"The highest instantaneous value reached during the cycle","correct":false},{"id":"c","text":"The value read directly off an oscilloscope trace without any calculation","correct":false}]',
     '{"B1","B2"}'),

    (s13_id, 'An aircraft AC bus is rated at 115 V. Unless marked otherwise, what does this figure represent?',
     '[{"id":"a","text":"The peak value of the waveform","correct":false},{"id":"b","text":"The RMS (effective) value of the waveform","correct":true},{"id":"c","text":"The average value of the waveform","correct":false}]',
     '{"B1","B2"}'),

    (s13_id, 'For a 115 V RMS aircraft AC bus, what is the approximate peak voltage?',
     '[{"id":"a","text":"81.3 V","correct":false},{"id":"b","text":"115 V","correct":false},{"id":"c","text":"162.6 V","correct":true}]',
     '{"B1","B2"}'),

    (s13_id, 'Why must components in an AC circuit be rated for the peak voltage rather than the RMS voltage?',
     '[{"id":"a","text":"Because the peak voltage never actually occurs across real components","correct":false},{"id":"b","text":"Because the insulation would break down if only rated for the lower RMS value","correct":true},{"id":"c","text":"Because RMS voltage is always higher than peak voltage","correct":false}]',
     '{"B1","B2"}'),

    (s13_id, 'For a purely resistive AC load, how is power calculated using RMS values?',
     '[{"id":"a","text":"P = E × I, exactly as in a DC circuit","correct":true},{"id":"b","text":"P = E × I × 0.637, applying the average-value factor","correct":false},{"id":"c","text":"Power cannot be calculated for AC without first finding the reactance","correct":false}]',
     '{"B1","B2"}'),

    (s13_id, 'Why is a square-wave (or "modified sine") inverter output generally unsuitable for sensitive avionics?',
     '[{"id":"a","text":"Because a square wave contains only the fundamental frequency and no others","correct":false},{"id":"b","text":"Because a square wave contains the fundamental frequency plus a long series of odd harmonics","correct":true},{"id":"c","text":"Because a square wave has a lower RMS value than a true sine wave of the same peak","correct":false}]',
     '{"B1","B2"}'),

    (s13_id, 'What is one key advantage of a three-phase AC system over single phase, in terms of the magnetic field it produces?',
     '[{"id":"a","text":"Three phases spaced 120° apart naturally produce a rotating magnetic field, allowing motors to self-start","correct":true},{"id":"b","text":"Three phases eliminate the need for any neutral conductor in every installation","correct":false},{"id":"c","text":"Three phases always operate at a lower frequency than single phase, reducing core losses","correct":false}]',
     '{"B1","B2"}'),

    (s13_id, 'A typical aircraft main AC system is described as "115/200 V, 400 Hz, three phase." How are the windings normally connected?',
     '[{"id":"a","text":"Delta-connected, with no neutral available","correct":false},{"id":"b","text":"Star-connected, with the neutral connected to the airframe","correct":true},{"id":"c","text":"Series-connected, with a single shared phase wire","correct":false}]',
     '{"B1","B2"}'),

    (s13_id, 'Why can a cheap "average responding, RMS calibrated" meter give a false reading on the chopped output of a static inverter or variable-speed drive?',
     '[{"id":"a","text":"Such meters read correctly only on a clean sine wave, and will lie on non-sinusoidal waveforms; a true RMS meter should be used instead","correct":true},{"id":"b","text":"Such meters can only be used on DC circuits and will always read zero on AC","correct":false},{"id":"c","text":"Such meters are only accurate above 1000 Hz and under-read at 400 Hz","correct":false}]',
     '{"B1","B2"}');

    -- =========================================================================================
    -- M03.14 — Resistive, Capacitive & Inductive AC Circuits, Resonance, Power (18 questions)
    -- =========================================================================================
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES
    (s14_id, 'Of the three oppositions to current in an AC circuit — resistance, inductive reactance, and capacitive reactance — which one dissipates energy as heat and causes no phase shift?',
     '[{"id":"a","text":"Resistance (R)","correct":true},{"id":"b","text":"Inductive reactance (XL)","correct":false},{"id":"c","text":"Capacitive reactance (XC)","correct":false}]',
     '{"B1","B2"}'),

    (s14_id, 'In a purely inductive AC circuit, what is the phase relationship between voltage and current?',
     '[{"id":"a","text":"Current leads voltage by 90°","correct":false},{"id":"b","text":"Current lags voltage by 90°","correct":true},{"id":"c","text":"Current and voltage are in phase","correct":false}]',
     '{"B1","B2"}'),

    (s14_id, 'In a purely capacitive AC circuit, what is the phase relationship between voltage and current?',
     '[{"id":"a","text":"Current leads voltage by 90°","correct":true},{"id":"b","text":"Current lags voltage by 90°","correct":false},{"id":"c","text":"Current and voltage are in phase","correct":false}]',
     '{"B1","B2"}'),

    (s14_id, 'Using the mnemonic ELI the ICE man, what does the ICE portion describe?',
     '[{"id":"a","text":"In an inductive circuit, voltage (E) comes before current (I)","correct":false},{"id":"b","text":"In a capacitive circuit, current (I) comes before voltage (E) — current leads, voltage lags","correct":true},{"id":"c","text":"In a capacitive circuit, current and voltage always remain exactly in phase","correct":false}]',
     '{"B1","B2"}'),

    (s14_id, 'Why can resistance and reactance not simply be added arithmetically to find the total impedance of an AC circuit?',
     '[{"id":"a","text":"Because reactance is always negligible compared to resistance","correct":false},{"id":"b","text":"Because resistance and reactance are 90° apart and must be combined vectorially","correct":true},{"id":"c","text":"Because impedance only applies to purely resistive circuits","correct":false}]',
     '{"B1","B2"}'),

    (s14_id, 'In a series RLC circuit, why is impedance found from Z = √(R² + (XL − XC)²) rather than Z = √(R² + XL² + XC²)?',
     '[{"id":"a","text":"Because XL and XC are 180° opposed to each other and must be subtracted before combining with R","correct":true},{"id":"b","text":"Because capacitive reactance never affects total impedance in a series circuit","correct":false},{"id":"c","text":"Because resistance is subtracted from the combined reactance, not the reactances from each other","correct":false}]',
     '{"B1","B2"}'),

    (s14_id, 'A series RL circuit has R = 30 Ω and XL = 40 Ω. What is the total impedance?',
     '[{"id":"a","text":"70 Ω","correct":false},{"id":"b","text":"50 Ω","correct":true},{"id":"c","text":"35 Ω","correct":false}]',
     '{"B1","B2"}'),

    (s14_id, 'In a series RL circuit supplied at 115 V, the voltage drop across R measures 69 V and across L measures 92 V. Why does the arithmetic sum (161 V) not equal the 115 V supply?',
     '[{"id":"a","text":"Because one of the two measurements must be a wiring error","correct":false},{"id":"b","text":"Because AC voltage drops in a series circuit must be added vectorially, not arithmetically, since VR and VL are 90° apart","correct":true},{"id":"c","text":"Because the supply voltage always includes an additional 46 V of core loss","correct":false}]',
     '{"B1","B2"}'),

    (s14_id, 'In a series AC circuit, what does the phase angle θ (where tan θ = X / R) represent?',
     '[{"id":"a","text":"The angle between the applied voltage and the circuit current","correct":true},{"id":"b","text":"The angle between the resistance and the impedance only","correct":false},{"id":"c","text":"The number of degrees the frequency has shifted from 400 Hz","correct":false}]',
     '{"B1","B2"}'),

    (s14_id, 'In a parallel R-L-C circuit, how is the total line current found from the branch currents IR, IL and IC?',
     '[{"id":"a","text":"By simple arithmetic addition of all three currents","correct":false},{"id":"b","text":"As the vector sum IT = √(IR² + (IC − IL)²), since IL and IC are 90° out of phase with IR in opposite directions","correct":true},{"id":"c","text":"By taking whichever branch current is largest","correct":false}]',
     '{"B1","B2"}'),

    (s14_id, 'What condition defines resonance in an AC circuit containing both inductance and capacitance?',
     '[{"id":"a","text":"When XL and XC are equal and cancel each other exactly","correct":true},{"id":"b","text":"When resistance drops to zero","correct":false},{"id":"c","text":"When the supply frequency exceeds 400 Hz","correct":false}]',
     '{"B1","B2"}'),

    (s14_id, 'At series resonance, what happens to the circuit''s impedance and current, and why is a series resonant circuit called an acceptor?',
     '[{"id":"a","text":"Impedance is at maximum and current is minimum; it blocks its resonant frequency","correct":false},{"id":"b","text":"Impedance is at minimum (equal to R alone) and current is maximum; it passes its resonant frequency","correct":true},{"id":"c","text":"Impedance and current are both unaffected by resonance in a series circuit","correct":false}]',
     '{"B1","B2"}'),

    (s14_id, 'At parallel resonance, what happens to the line current drawn from the supply, even though circulating current inside the L-C loop can be large?',
     '[{"id":"a","text":"Line current is at its minimum, since the parallel resonant circuit presents maximum impedance","correct":true},{"id":"b","text":"Line current is at its maximum, matching the circulating current","correct":false},{"id":"c","text":"Line current becomes zero at all frequencies, not only at resonance","correct":false}]',
     '{"B1","B2"}'),

    (s14_id, 'In an AC circuit, what is true power (P), and in what unit is it measured?',
     '[{"id":"a","text":"The power that sloshes back and forth into the reactance and returns, measured in VAR","correct":false},{"id":"b","text":"The power actually consumed and turned into heat or work, measured in watts (W)","correct":true},{"id":"c","text":"Voltage times current with no regard to phase, measured in VA","correct":false}]',
     '{"B1","B2"}'),

    (s14_id, 'How is power factor defined, and what is its alternative expression in a series AC circuit?',
     '[{"id":"a","text":"Power factor = apparent power / true power = Z / R","correct":false},{"id":"b","text":"Power factor = true power / apparent power = cos θ, or R / Z in a series circuit","correct":true},{"id":"c","text":"Power factor = reactive power / true power = X / Z","correct":false}]',
     '{"B1","B2"}'),

    (s14_id, 'A motor draws 10 A at 115 V with a power factor of 0.8 lagging. What is the apparent power?',
     '[{"id":"a","text":"920 VA","correct":false},{"id":"b","text":"1150 VA","correct":true},{"id":"c","text":"690 VA","correct":false}]',
     '{"B1","B2"}'),

    (s14_id, 'Why are aircraft generators and transformers rated in kVA rather than kW?',
     '[{"id":"a","text":"Because their operating limit is heating, which depends on current regardless of phase angle","correct":true},{"id":"b","text":"Because kW ratings are only used for DC machines, never for AC machines","correct":false},{"id":"c","text":"Because kVA is always numerically smaller than kW for the same machine","correct":false}]',
     '{"B1","B2"}'),

    (s14_id, 'How is the lagging power factor of an inductive load typically corrected?',
     '[{"id":"a","text":"By adding resistors in series with the load to reduce current","correct":false},{"id":"b","text":"By connecting capacitors across the load, whose reactive power cancels part of the inductive reactive power","correct":true},{"id":"c","text":"By increasing the supply frequency until the phase angle reaches zero","correct":false}]',
     '{"B1","B2"}');

    -- =========================================================================================
    -- M03.15 — Transformers (18 questions)
    -- =========================================================================================
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES
    (s15_id, 'What is the basic operating principle of a transformer?',
     '[{"id":"a","text":"Two coils on a common magnetic core, linked by mutual induction, with no electrical connection between them","correct":true},{"id":"b","text":"A single coil whose resistance changes with applied frequency","correct":false},{"id":"c","text":"Two coils connected directly in series to divide the supply voltage","correct":false}]',
     '{"B1","B2"}'),

    (s15_id, 'Why does a transformer not work on DC, and what happens if DC is applied to the primary?',
     '[{"id":"a","text":"DC produces no changing flux once past the initial switch-on surge, so nothing is induced in the secondary, and the primary — limited only by its winding resistance — burns out","correct":true},{"id":"b","text":"DC is automatically rectified by the core material before reaching the secondary","correct":false},{"id":"c","text":"DC produces double the normal secondary voltage, which is dangerous to the load","correct":false}]',
     '{"B1","B2"}'),

    (s15_id, 'Why are transformer cores built from insulated laminations rather than a solid block of steel?',
     '[{"id":"a","text":"To reduce weight only, since laminations have no effect on losses","correct":false},{"id":"b","text":"To break up and reduce eddy currents circulating in the core","correct":true},{"id":"c","text":"To increase the hysteresis loss for better voltage regulation","correct":false}]',
     '{"B1","B2"}'),

    (s15_id, 'Which transformer core type is a closed ring shape that contains the flux almost entirely?',
     '[{"id":"a","text":"Core type","correct":false},{"id":"b","text":"Shell type","correct":false},{"id":"c","text":"Toroidal type","correct":true}]',
     '{"B1","B2"}'),

    (s15_id, 'A transformer has 400 turns on the primary and 80 turns on the secondary, with 115 V applied to the primary. What is the secondary voltage, and is this a step-up or step-down transformer?',
     '[{"id":"a","text":"23 V — step-down","correct":true},{"id":"b","text":"575 V — step-up","correct":false},{"id":"c","text":"115 V — turns ratio has no effect on voltage","correct":false}]',
     '{"B1","B2"}'),

    (s15_id, 'In the same 400/80-turn transformer, if the secondary load draws 5 A, what is the approximate primary current?',
     '[{"id":"a","text":"5 A","correct":false},{"id":"b","text":"1 A","correct":true},{"id":"c","text":"25 A","correct":false}]',
     '{"B1","B2"}'),

    (s15_id, 'At no load (secondary open circuit), what current does the primary draw, and what is its phase relationship to the applied voltage?',
     '[{"id":"a","text":"A small magnetising current that lags the applied voltage by nearly 90°, giving a poor no-load power factor","correct":true},{"id":"b","text":"The full rated current, in phase with the applied voltage","correct":false},{"id":"c","text":"Zero current, since no load means no current can flow at all","correct":false}]',
     '{"B1","B2"}'),

    (s15_id, 'When load is applied to the secondary of a transformer, how does the primary current respond, and why?',
     '[{"id":"a","text":"It stays exactly the same, since the primary and secondary are not linked once load is applied","correct":false},{"id":"b","text":"It automatically increases, because the secondary current''s own flux (opposing the main flux by Lenz''s Law) reduces the primary back EMF, drawing more primary current to restore balance","correct":true},{"id":"c","text":"It automatically decreases, to compensate for the extra secondary current","correct":false}]',
     '{"B1","B2"}'),

    (s15_id, 'What are copper losses in a transformer, and how do they vary with load?',
     '[{"id":"a","text":"Heat losses in the winding resistance (I²R), which vary with load and are zero at no load","correct":true},{"id":"b","text":"Losses due to magnetising the core, present at all times regardless of load","correct":false},{"id":"c","text":"Losses caused only by flux leakage between primary and secondary","correct":false}]',
     '{"B1","B2"}'),

    (s15_id, 'What two components make up core losses in a transformer, and how is each reduced?',
     '[{"id":"a","text":"Copper loss (reduced by laminating) and flux leakage (reduced by thicker wire)","correct":false},{"id":"b","text":"Hysteresis loss (reduced by a soft magnetic material with a narrow hysteresis loop) and eddy current loss (reduced by laminating the core)","correct":true},{"id":"c","text":"Insulation loss (reduced by cooling) and winding loss (reduced by fewer turns)","correct":false}]',
     '{"B1","B2"}'),

    (s15_id, 'A transformer delivers 500 W of output for 525 W of input. What is its efficiency?',
     '[{"id":"a","text":"95.2%","correct":true},{"id":"b","text":"84.0%","correct":false},{"id":"c","text":"100%, since transformers have no moving parts","correct":false}]',
     '{"B1","B2"}'),

    (s15_id, 'Why must polarity markings (dots, or H1/H2 and X1/X2) be observed when connecting transformers in parallel or in a three-phase bank?',
     '[{"id":"a","text":"Getting the polarity wrong causes the secondaries to fight each other — effectively a dead short","correct":true},{"id":"b","text":"Polarity markings only matter for DC transformers, never for AC","correct":false},{"id":"c","text":"Polarity markings indicate which winding is the primary, with no other effect","correct":false}]',
     '{"B1","B2"}'),

    (s15_id, 'What is the key structural difference between an autotransformer and a conventional (two-winding) transformer?',
     '[{"id":"a","text":"An autotransformer uses a single winding with a tapping point, so the primary and secondary circuits are electrically connected, not just magnetically","correct":true},{"id":"b","text":"An autotransformer has no magnetic core at all","correct":false},{"id":"c","text":"An autotransformer always has more turns on the secondary than any conventional transformer","correct":false}]',
     '{"B1","B2"}'),

    (s15_id, 'What is the main disadvantage of an autotransformer, and why is it never used where isolation is a safety requirement?',
     '[{"id":"a","text":"It has no disadvantage compared to a conventional transformer","correct":false},{"id":"b","text":"It provides no isolation between input and output, so a fault in the common part of the winding puts the full input voltage on the output","correct":true},{"id":"c","text":"It is far less efficient than a conventional transformer of the same rating","correct":false}]',
     '{"B1","B2"}'),

    (s15_id, 'Why must the secondary of a current transformer never be open-circuited while primary current is flowing?',
     '[{"id":"a","text":"The secondary voltage will simply drop to zero, with no other effect","correct":false},{"id":"b","text":"With no secondary current to oppose the flux, the core saturates and a dangerously high voltage appears across the open terminals","correct":true},{"id":"c","text":"The primary current will automatically reduce to a safe level","correct":false}]',
     '{"B1","B2"}'),

    (s15_id, 'An aircraft generator has a star-connected phase voltage of 115 V. What is the resulting line voltage?',
     '[{"id":"a","text":"115 V","correct":false},{"id":"b","text":"200 V","correct":true},{"id":"c","text":"66 V","correct":false}]',
     '{"B1","B2"}'),

    (s15_id, 'What is one operational advantage of a delta-connected winding over a star-connected winding, despite having no neutral?',
     '[{"id":"a","text":"It can continue running in open delta on two windings if one fails, and it handles unbalanced loads well","correct":true},{"id":"b","text":"It automatically doubles the available line voltage","correct":false},{"id":"c","text":"It eliminates the need for any current-carrying conductors","correct":false}]',
     '{"B1","B2"}'),

    (s15_id, 'What does a transformer-rectifier unit (TRU) do on an AC-primary aircraft, and where should a fault be checked first if the DC bus reads low?',
     '[{"id":"a","text":"It converts DC to AC; the fault should first be checked at the DC output side","correct":false},{"id":"b","text":"It steps down and rectifies the 115 V AC bus to give the 28 V DC bus; the fault should first be checked at the TRU''s AC input, since no AC in means no DC out","correct":true},{"id":"c","text":"It boosts AC voltage for de-icing loads; the fault should first be checked at the generator field","correct":false}]',
     '{"B1","B2"}');

    -- =========================================================================================
    -- M03.16 — Filters (7), AC Generators (8), AC Motors (7) — 22 questions
    -- =========================================================================================
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES
    (s16_id, 'What physical property allows a filter to pass some frequencies and block others?',
     '[{"id":"a","text":"The fact that resistance changes with frequency","correct":false},{"id":"b","text":"The fact that reactance changes with frequency","correct":true},{"id":"c","text":"The fact that voltage changes with frequency","correct":false}]',
     '{"B1","B2"}'),

    (s16_id, 'How does a capacitor''s reactance behave as frequency increases, and what does this mean for the frequencies it passes?',
     '[{"id":"a","text":"Reactance falls as frequency rises, so a capacitor passes high frequencies and blocks DC and low frequencies","correct":true},{"id":"b","text":"Reactance rises as frequency rises, so a capacitor passes only DC","correct":false},{"id":"c","text":"Reactance is unaffected by frequency in a capacitor","correct":false}]',
     '{"B1","B2"}'),

    (s16_id, 'How does an inductor''s reactance behave as frequency increases, and what does this mean for the frequencies it passes?',
     '[{"id":"a","text":"Reactance falls as frequency rises, so an inductor passes high frequencies","correct":false},{"id":"b","text":"Reactance rises as frequency rises, so an inductor passes DC and low frequencies but blocks high frequencies","correct":true},{"id":"c","text":"Reactance is unaffected by frequency in an inductor","correct":false}]',
     '{"B1","B2"}'),

    (s16_id, 'How is a filter''s cut-off frequency defined?',
     '[{"id":"a","text":"The frequency at which the output has fallen to 0.707 of the passband value — the half-power or -3 dB point","correct":true},{"id":"b","text":"The frequency at which the output first reaches its peak value","correct":false},{"id":"c","text":"The frequency at which the filter component values change physically","correct":false}]',
     '{"B1","B2"}'),

    (s16_id, 'A low-pass filter can be built with an inductor in series with the load and a capacitor in parallel with the load. Why does this combination pass low frequencies but block high ones?',
     '[{"id":"a","text":"The series inductor blocks the highs on their way through, and the parallel capacitor shunts the highs to earth before they reach the load","correct":true},{"id":"b","text":"The series inductor blocks the lows, and the parallel capacitor shunts the highs directly to the load","correct":false},{"id":"c","text":"Both components equally attenuate all frequencies, regardless of value","correct":false}]',
     '{"B1","B2"}'),

    (s16_id, 'A band-pass filter can be built from a series resonant circuit placed in series with the load. Why does this pass the resonant band while attenuating other frequencies?',
     '[{"id":"a","text":"At resonance the series circuit has maximum impedance, blocking the resonant band","correct":false},{"id":"b","text":"At resonance the series circuit has minimum impedance, so the resonant band passes through with little attenuation","correct":true},{"id":"c","text":"The series resonant circuit has no effect at any frequency","correct":false}]',
     '{"B1","B2"}'),

    (s16_id, 'On an aircraft, what is the main purpose of most of the filters found in LRUs and cable installations, such as feed-through capacitors and ferrite beads?',
     '[{"id":"a","text":"Signal processing to shape audio tone","correct":false},{"id":"b","text":"EMI suppression — keeping switching noise out of the radios","correct":true},{"id":"c","text":"Reducing the DC resistance of long cable runs","correct":false}]',
     '{"B1","B2"}'),

    (s16_id, 'Why does an AC generator (alternator) have no commutator, unlike a DC generator?',
     '[{"id":"a","text":"Because the output is wanted as AC, not a rectified version of it","correct":true},{"id":"b","text":"Because alternators never rotate at high enough speed to need one","correct":false},{"id":"c","text":"Because a commutator would prevent the machine from producing any voltage at all","correct":false}]',
     '{"B1","B2"}'),

    (s16_id, 'In a "revolving field" type AC generator — the standard for aircraft — what rotates, and what is the key benefit?',
     '[{"id":"a","text":"The output (armature/stator) winding rotates while the field is fixed; this reduces core losses","correct":false},{"id":"b","text":"The field rotates while the heavy output winding stays fixed on the stator, so only the small field excitation current has to pass through slip rings","correct":true},{"id":"c","text":"Both the field and the output winding rotate together, eliminating the need for a stator entirely","correct":false}]',
     '{"B1","B2"}'),

    (s16_id, 'In a star (wye) connected aircraft generator, what two useful voltages are available, and why?',
     '[{"id":"a","text":"Only a single voltage is available, since star connection has no neutral","correct":false},{"id":"b","text":"115 V phase-to-neutral and 200 V phase-to-phase, because the neutral point allows both to be tapped","correct":true},{"id":"c","text":"400 V and 800 V, doubled by the star connection","correct":false}]',
     '{"B1","B2"}'),

    (s16_id, 'What are the three machines mounted on a common shaft in a brushless aircraft AC generator, in the order the excitation signal flows?',
     '[{"id":"a","text":"Main stator, then rotating rectifier, then exciter","correct":false},{"id":"b","text":"Permanent Magnet Generator (PMG), then exciter, then rotating rectifier, feeding the main rotating field","correct":true},{"id":"c","text":"GCU, then CSD, then IDG","correct":false}]',
     '{"B1","B2"}'),

    (s16_id, 'Using f = (P × N) / 120, what output frequency does a 4-pole alternator produce when driven at 12,000 rpm?',
     '[{"id":"a","text":"200 Hz","correct":false},{"id":"b","text":"400 Hz","correct":true},{"id":"c","text":"800 Hz","correct":false}]',
     '{"B1","B2"}'),

    (s16_id, 'Why are aircraft alternators rated in kVA rather than kW?',
     '[{"id":"a","text":"Because their limiting factor is winding heating, which depends on current regardless of power factor","correct":true},{"id":"b","text":"Because kVA and kW are always numerically identical for AC machines","correct":false},{"id":"c","text":"Because kW ratings only apply to generators driven below 400 Hz","correct":false}]',
     '{"B1","B2"}'),

    (s16_id, 'What is the role of the Constant Speed Drive (CSD) in a typical aircraft AC generation system?',
     '[{"id":"a","text":"It converts the generator''s AC output into DC for the battery bus","correct":false},{"id":"b","text":"It is a hydro-mechanical variable-ratio transmission that holds the generator at constant speed, so the output frequency stays at 400 Hz despite engine speed changes","correct":true},{"id":"c","text":"It regulates output voltage by adjusting the exciter field current","correct":false}]',
     '{"B1","B2"}'),

    (s16_id, 'If an aircraft generator has the correct output voltage but the wrong frequency, where should the fault most likely be found?',
     '[{"id":"a","text":"In the field excitation circuit, such as the PMG or rotating rectifier","correct":false},{"id":"b","text":"In the drive system — the CSD or IDG — rather than in the generator itself","correct":true},{"id":"c","text":"In the GCU''s overvoltage protection circuit","correct":false}]',
     '{"B1","B2"}'),

    (s16_id, 'What is the main reason AC induction motors are widely used for fans, pumps and blowers on aircraft?',
     '[{"id":"a","text":"They have no commutator or brushes in the main types, so almost nothing wears out","correct":true},{"id":"b","text":"They always run at a fixed, unchangeable speed regardless of load","correct":false},{"id":"c","text":"They require no maintenance of any kind for the life of the aircraft","correct":false}]',
     '{"B1","B2"}'),

    (s16_id, 'In a three-phase induction motor, how does the rotor develop torque with no electrical connection to it at all?',
     '[{"id":"a","text":"The rotating stator field sweeps past the shorted rotor bars, inducing current in them, and that current in the rotating field produces a force","correct":true},{"id":"b","text":"The rotor contains its own small battery to supply current to the bars","correct":false},{"id":"c","text":"Static electricity builds up on the rotor surface during operation","correct":false}]',
     '{"B1","B2"}'),

    (s16_id, 'Why must the rotor of an induction motor always run slightly slower than synchronous speed (i.e., always have some slip)?',
     '[{"id":"a","text":"If the rotor caught up to the field exactly, there would be no relative motion, no flux cutting, no induced current, and therefore no torque","correct":true},{"id":"b","text":"Slip is simply a manufacturing tolerance with no functional purpose","correct":false},{"id":"c","text":"The rotor is deliberately geared down to reduce noise","correct":false}]',
     '{"B1","B2"}'),

    (s16_id, 'How is the direction of rotation of a three-phase induction motor reversed?',
     '[{"id":"a","text":"By reducing the supply voltage until the motor slows and reverses","correct":false},{"id":"b","text":"By swapping any two of the three supply leads, which reverses the sequence of the rotating field","correct":true},{"id":"c","text":"By reversing the DC field excitation current","correct":false}]',
     '{"B1","B2"}'),

    (s16_id, 'Why does a single-phase induction motor need a special starting arrangement (such as shaded pole, split-phase, or capacitor start) to begin turning?',
     '[{"id":"a","text":"A single-phase supply produces a field that pulses but does not rotate, so the rotor feels equal pull in both directions and will not start on its own","correct":true},{"id":"b","text":"Single-phase motors have no rotor at all until a capacitor is added","correct":false},{"id":"c","text":"Single-phase supplies are always DC, so no rotating field can ever exist","correct":false}]',
     '{"B1","B2"}'),

    (s16_id, 'In a capacitor-start single-phase motor, what does the capacitor do, and why does this give a stronger starting torque than a plain split-phase motor?',
     '[{"id":"a","text":"It filters DC ripple from the starting winding, which has no effect on torque","correct":false},{"id":"b","text":"It makes the starting winding''s current lead the voltage by close to the ideal 90°, giving a much bigger phase difference and a stronger rotating field than split-phase starting","correct":true},{"id":"c","text":"It shorts out the starting winding completely once the motor reaches speed","correct":false}]',
     '{"B1","B2"}'),

    (s16_id, 'If one phase of the three-phase supply to a running induction motor is lost ("single-phasing"), what happens?',
     '[{"id":"a","text":"The motor stops immediately and cannot be damaged","correct":false},{"id":"b","text":"The motor keeps running on two phases but with badly reduced torque, heavy vibration, a distinctive growl, and rapidly rising winding temperature","correct":true},{"id":"c","text":"The motor automatically switches to synchronous operation at full torque","correct":false}]',
     '{"B1","B2"}');
END $$;
