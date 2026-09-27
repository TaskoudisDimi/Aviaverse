-- Migration 104: Supplement Module 08 (Basic Aerodynamics) with additional questions for
-- M08.1 The Atmosphere, M08.2 Airspeed, M08.3 Airflow and Lift, M08.4 Basic Aerodynamic Theory.
--
-- Source: Module 8 Basic Aerodynamics Study Notes, sections 8.1 (Physics of the Atmosphere),
-- 8.2.1 (static/dynamic pressure) + 8.2.4 (Airspeed), 8.2.2 (streamlines/continuity/venturi) +
-- 8.2.3 (Bernoulli's theorem), and 8.2.5 (aerofoil geometry vocabulary) + 8.2.6 (wing geometry
-- and planform), cross-checked against the companion 620-question bank (topic-matched questions
-- in the Q1-Q192 range; flagged/ambiguous bank questions excluded).
--
-- This migration only adds question rows to the four already-existing subjects above — it does
-- not INSERT or UPDATE easa_subjects.

DO $$
DECLARE
    s1_id INT;
    s2_id INT;
    s3_id INT;
    s4_id INT;
BEGIN
    SELECT id INTO s1_id FROM easa_subjects WHERE code = 'M08.1';
    SELECT id INTO s2_id FROM easa_subjects WHERE code = 'M08.2';
    SELECT id INTO s3_id FROM easa_subjects WHERE code = 'M08.3';
    SELECT id INTO s4_id FROM easa_subjects WHERE code = 'M08.4';

    IF s1_id IS NULL OR s2_id IS NULL OR s3_id IS NULL OR s4_id IS NULL THEN
        RAISE NOTICE 'One or more of M08.1-M08.4 not found, skipping.';
        RETURN;
    END IF;

    -- Idempotency guard: skip if this backfill was already applied.
    IF EXISTS (
        SELECT 1 FROM questions
        WHERE subject_id = s1_id
          AND text LIKE '%the same proportion as at sea level%'
    ) THEN
        RAISE NOTICE 'M08 part 1 supplement already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- M08.1 The Atmosphere (18 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s1_id, 'Air at 40,000 ft is still approximately 21% oxygen, the same proportion as at sea level. What actually changes with altitude, making hypoxia a problem there?',
     '[{"id":"a","text":"There are far fewer molecules of everything in a given volume, so it is a problem of partial pressure, not of the gas mixture changing","correct":true},{"id":"b","text":"The proportion of oxygen itself falls steadily with altitude","correct":false},{"id":"c","text":"Nitrogen is gradually replaced by oxygen at high altitude, upsetting the normal mixture","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'According to the tropopause height table, the tropopause over the equator is found at approximately what height and temperature?',
     '[{"id":"a","text":"16-17 km (53,000-57,000 ft), about -80°C","correct":true},{"id":"b","text":"7.5-9 km (25,000-29,000 ft), about -45°C","correct":false},{"id":"c","text":"10-12 km (33,000-39,000 ft), about -56.5°C","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'At ground level the equator is the warmest place and the poles the coldest. At the tropopause this is completely reversed - the equator is coldest and the poles are warmest. Why?',
     '[{"id":"a","text":"Because the lapse rate has had about 17 km to act on over the equator, but only about 8 km over the poles","correct":true},{"id":"b","text":"Because incoming solar radiation is weaker over the equator than over the poles","correct":false},{"id":"c","text":"Because the tropopause is lower over the equator than over the poles","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'Which formula correctly converts a Celsius temperature to Fahrenheit?',
     '[{"id":"a","text":"F = (9/5)C + 32","correct":true},{"id":"b","text":"F = (5/9)C + 32","correct":false},{"id":"c","text":"F = (9/5)(C - 32)","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'What is the dry adiabatic lapse rate, i.e. the rate of cooling of unsaturated air being lifted?',
     '[{"id":"a","text":"3°C per 1000 ft","correct":true},{"id":"b","text":"1.98°C per 1000 ft","correct":false},{"id":"c","text":"1.5°C per 1000 ft","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'Why is the saturated adiabatic lapse rate (about 1.5°C per 1000 ft) lower than the dry adiabatic lapse rate?',
     '[{"id":"a","text":"Condensation of water vapour releases latent heat, which partly offsets the cooling","correct":true},{"id":"b","text":"Saturated air contains less oxygen, which absorbs less heat","correct":false},{"id":"c","text":"Saturated air is heavier, so it rises more slowly and has more time to warm up","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'At a given pressure, raising the air temperature lowers its density. What is the effect on take-off run and cruising TAS as a result?',
     '[{"id":"a","text":"A longer take-off run is needed, and a higher cruising TAS is needed to generate the same lift","correct":true},{"id":"b","text":"The take-off run shortens and cruising TAS falls, since drag also falls with density","correct":false},{"id":"c","text":"Neither is affected, since lift depends only on airspeed, not on air density","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'On a hot day at constant pressure, why does a piston engine''s power output fall?',
     '[{"id":"a","text":"There is less mass of charge in the cylinder, so less fuel can be burnt","correct":true},{"id":"b","text":"The spark plugs run cooler and produce a weaker spark","correct":false},{"id":"c","text":"The propeller becomes less efficient in less dense air, though the engine''s own power is unaffected","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'At sea level, atmospheric pressure is about 14.7 lb on every square inch. Roughly how much air pressure rests on a flat outstretched hand (about 25 square inches)?',
     '[{"id":"a","text":"About 370 lb","correct":true},{"id":"b","text":"About 37 lb","correct":false},{"id":"c","text":"About 3,700 lb","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'As a handy conversion, about how many millibars are equal to 1 inch of mercury?',
     '[{"id":"a","text":"About 34 mb","correct":true},{"id":"b","text":"About 4 mb","correct":false},{"id":"c","text":"About 340 mb","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'How does the rate of pressure fall with height compare between the first 10,000 ft and the region between 30,000 and 40,000 ft?',
     '[{"id":"a","text":"In the first 10,000 ft, pressure falls about 1 mb per 30 ft; between 30,000 and 40,000 ft, it takes nearly 88 ft to lose the same 1 mb","correct":true},{"id":"b","text":"Pressure falls at the same constant, linear rate all the way from sea level to 40,000 ft","correct":false},{"id":"c","text":"Pressure falls faster between 30,000 and 40,000 ft than it does in the first 10,000 ft","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'Pressure is half its sea level value at 18,000 ft, but density is not half its sea level value until 22,000 ft. Why are these two heights different?',
     '[{"id":"a","text":"Temperature is falling at the same time as pressure, and falling temperature pulls density the other way","correct":true},{"id":"b","text":"The gas constant R changes significantly between 18,000 ft and 22,000 ft","correct":false},{"id":"c","text":"Pressure and density are unrelated quantities that only happen to coincide at sea level","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'Flying at a constant indicated altitude out of warm air into cold air, without adjusting the altimeter subscale, what happens to the aircraft''s true height?',
     '[{"id":"a","text":"True height decreases, even though the altimeter reading has not changed","correct":true},{"id":"b","text":"True height increases, since cold air is denser and lifts the pressure surface","correct":false},{"id":"c","text":"True height is unaffected, since the altimeter always reads true height directly","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'At sea level, air density typically runs between about 1.20 and 1.55 kg/m³. When are the higher values within that range found?',
     '[{"id":"a","text":"In cold, high-latitude air","correct":true},{"id":"b","text":"In hot, humid, low-latitude air","correct":false},{"id":"c","text":"The range does not vary with location; it is always exactly 1.225 kg/m³","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'An airfield is 2,000 ft above sea level, but on a very hot day it can perform like an airfield at 5,000 ft. Which altitude explains this effect, and what is it?',
     '[{"id":"a","text":"Density altitude - the altitude in the ISA at which the current density would be found; aircraft performance follows it","correct":true},{"id":"b","text":"Pressure altitude - the altitude in the ISA at which the current pressure would be found","correct":false},{"id":"c","text":"Absolute altitude - the aircraft''s height above the ground directly beneath it","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'From what altitude does night vision begin to suffer, and from what altitude is hypoxia (poor judgement, then drowsiness, then collapse) a concern?',
     '[{"id":"a","text":"Night vision from about 4,000 ft; hypoxia from about 10,000 ft","correct":true},{"id":"b","text":"Night vision from about 10,000 ft; hypoxia from about 4,000 ft","correct":false},{"id":"c","text":"Both effects begin at the same altitude, about 8,000 ft","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'What distinguishes the service ceiling from the absolute ceiling?',
     '[{"id":"a","text":"Service ceiling is where rate of climb falls to a stated small value (usually 100 ft/min); absolute ceiling is where it falls to zero","correct":true},{"id":"b","text":"Service ceiling is where rate of climb falls to zero; absolute ceiling is where it falls to 100 ft/min","correct":false},{"id":"c","text":"The two terms describe the same altitude, just expressed in different units","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'Best-ceiling conditions split at about 26,000 ft. Below that height, which conditions give a piston aircraft its best ceiling, and above it, which conditions suit a jet best?',
     '[{"id":"a","text":"Below 26,000 ft, cold winter air at high latitude suits the piston aircraft (density matters); above it, a jet wants high pressure and low temperature, found in summer at low latitudes","correct":true},{"id":"b","text":"Below 26,000 ft, hot summer air at low latitude suits the piston aircraft; above it, a jet wants low pressure and high temperature","correct":false},{"id":"c","text":"Density has no effect on either the piston or the jet ceiling, above or below 26,000 ft","correct":false}]',
     '{"B1","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- M08.2 Airspeed (16 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s2_id, 'Still air presses on everything equally in all directions. What is this called?',
     '[{"id":"a","text":"Static pressure","correct":true},{"id":"b","text":"Dynamic pressure","correct":false},{"id":"c","text":"Total head pressure","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'Dynamic pressure (q = ½ρV²) appears in the lift equation, the drag equation, the stall and the flight envelope. How can q best be read, in plain terms?',
     '[{"id":"a","text":"As how hard the air is hitting","correct":true},{"id":"b","text":"As how far the air has travelled since leaving the ground","correct":false},{"id":"c","text":"As the total weight of the air column above the aircraft","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'If an aircraft''s speed doubles, with air density unchanged, what happens to dynamic pressure q?',
     '[{"id":"a","text":"It increases four times","correct":true},{"id":"b","text":"It doubles","correct":false},{"id":"c","text":"It stays the same, since q depends only on density","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'Roughly what fraction of static pressure does dynamic pressure q represent at 100 kt at sea level, compared with at 450 kt?',
     '[{"id":"a","text":"Under about 2% at 100 kt, rising to about 30% at 450 kt","correct":true},{"id":"b","text":"About 30% at 100 kt, falling to under 2% at 450 kt","correct":false},{"id":"c","text":"About 50% at both speeds, since the ratio is constant","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'Below about what speed can air reasonably be treated as incompressible for practical purposes?',
     '[{"id":"a","text":"About 300 kt","correct":true},{"id":"b","text":"About 100 kt","correct":false},{"id":"c","text":"About 600 kt","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'In the airspeed chain from IAS to CAS to EAS to TAS to GS, what correction is applied going from CAS to EAS?',
     '[{"id":"a","text":"Compressibility, which is always subtracted","correct":true},{"id":"b","text":"Instrument and position (pressure) error","correct":false},{"id":"c","text":"The wind vector","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'In the airspeed chain, what correction is applied going from EAS to TAS?',
     '[{"id":"a","text":"Density, accounting for altitude and temperature","correct":true},{"id":"b","text":"Compressibility, always subtracted","correct":false},{"id":"c","text":"Instrument and position error","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'How is Equivalent Airspeed (EAS) defined in the airspeed chain?',
     '[{"id":"a","text":"The speed that gives the same dynamic pressure at sea level in the ISA","correct":true},{"id":"b","text":"The raw reading shown directly on the airspeed indicator","correct":false},{"id":"c","text":"The aircraft''s actual speed through the air mass","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'What is the relationship between TAS and EAS?',
     '[{"id":"a","text":"TAS = EAS divided by the square root of the density ratio","correct":true},{"id":"b","text":"TAS = EAS multiplied by the square root of the density ratio","correct":false},{"id":"c","text":"TAS and EAS are always numerically identical, regardless of altitude","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'At 40,000 ft the density ratio is about 0.25. Given TAS = EAS / sqrt(density ratio), roughly what is TAS at that height compared with EAS?',
     '[{"id":"a","text":"TAS is roughly double EAS","correct":true},{"id":"b","text":"TAS is roughly half EAS","correct":false},{"id":"c","text":"TAS equals EAS, unaffected by the density ratio","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'Where does Equivalent Airspeed (EAS) appear in the cockpit?',
     '[{"id":"a","text":"Nowhere - it is a design engineer''s speed, used for example in performance charts","correct":true},{"id":"b","text":"On a dedicated EAS gauge fitted next to the ASI","correct":false},{"id":"c","text":"As the default reading shown by the Mach meter","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'At sea level in the ISA, how do EAS, CAS and TAS compare?',
     '[{"id":"a","text":"They are all equal","correct":true},{"id":"b","text":"TAS is always double EAS and CAS, even at sea level","correct":false},{"id":"c","text":"They can never be equal, even at sea level","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'Why are limiting speeds such as Vs, Vfe, Vle and Vne all expressed as indicated speeds rather than true speeds?',
     '[{"id":"a","text":"Because they are really dynamic pressure limits, and indicated speeds reflect dynamic pressure directly","correct":true},{"id":"b","text":"Because indicated speeds are always numerically larger, giving an extra safety margin","correct":false},{"id":"c","text":"Because true airspeed cannot be measured directly by any cockpit instrument","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'What is the formula for the local speed of sound in knots, given the absolute temperature in Kelvin?',
     '[{"id":"a","text":"LSS (kt) = 39 x sqrt(absolute temperature in K)","correct":true},{"id":"b","text":"LSS (kt) = 39 x absolute temperature in K","correct":false},{"id":"c","text":"LSS (kt) = absolute temperature in K divided by 39","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'Approximately what is the local speed of sound at mean sea level in the ISA, and at 30,000 ft?',
     '[{"id":"a","text":"About 661 kt at MSL, falling to about 589 kt at 30,000 ft","correct":true},{"id":"b","text":"About 589 kt at MSL, rising to about 661 kt at 30,000 ft","correct":false},{"id":"c","text":"About 661 kt at both altitudes, since the speed of sound does not vary with height","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'During a climb at a constant IAS, why does Mach number climb steadily?',
     '[{"id":"a","text":"Because the local speed of sound falls with height while TAS is rising for a fixed IAS","correct":true},{"id":"b","text":"Because IAS itself automatically increases with altitude","correct":false},{"id":"c","text":"Because dynamic pressure automatically increases with altitude at a constant IAS","correct":false}]',
     '{"B1","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- M08.3 Airflow and Lift (15 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s3_id, 'What is a streamline?',
     '[{"id":"a","text":"The path of one particle of air, drawn so that it never crosses another","correct":true},{"id":"b","text":"The boundary between laminar and turbulent flow","correct":false},{"id":"c","text":"The line joining the leading edge to the trailing edge of an aerofoil","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'Where streamlines crowd together on a diagram, what does this indicate about the flow?',
     '[{"id":"a","text":"The flow is faster there","correct":true},{"id":"b","text":"The flow is slower there","correct":false},{"id":"c","text":"The flow has separated from the surface there","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'What does the continuity equation state about flow through any duct?',
     '[{"id":"a","text":"Mass flow (m = ρ x A x V) is the same at every station, since air cannot pile up or vanish","correct":true},{"id":"b","text":"Velocity alone is constant at every station, regardless of duct area","correct":false},{"id":"c","text":"Density alone is constant at every station, regardless of duct area","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'Treating air as incompressible, what happens to flow velocity if the cross-sectional area of a duct falls, as in a venturi?',
     '[{"id":"a","text":"Velocity must rise","correct":true},{"id":"b","text":"Velocity must fall","correct":false},{"id":"c","text":"Velocity is unaffected by a change in area","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'Bernoulli''s theorem states that in a fluid, provided no work is done on it or by it, what stays constant?',
     '[{"id":"a","text":"The total pressure - static plus dynamic pressure","correct":true},{"id":"b","text":"The static pressure alone, independent of speed","correct":false},{"id":"c","text":"The density alone, independent of speed","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'According to Bernoulli''s "see-saw" between static and dynamic pressure, if the flow speeds up so that dynamic pressure rises, what must happen to static pressure to keep the total constant?',
     '[{"id":"a","text":"Static pressure must fall","correct":true},{"id":"b","text":"Static pressure must also rise","correct":false},{"id":"c","text":"Static pressure is unaffected","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'How does the curvature of a wing''s upper surface generate lift, according to the venturi/Bernoulli explanation?',
     '[{"id":"a","text":"It forms a venturi with the undisturbed air above, accelerating the flow over the top and dropping the static pressure there","correct":true},{"id":"b","text":"It forms a venturi that slows the flow over the top, raising the static pressure there","correct":false},{"id":"c","text":"It has no effect on flow speed; lift comes entirely from the pressure underneath","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'Underneath the wing, how disturbed is the airflow, and what happens to the pressure there, compared with the top surface?',
     '[{"id":"a","text":"The flow underneath is barely disturbed and the pressure stays high","correct":true},{"id":"b","text":"The flow underneath accelerates even more than over the top, and pressure drops further","correct":false},{"id":"c","text":"The flow underneath separates completely from the surface","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'According to the 2/3 rule, roughly what proportion of a wing''s lift comes from reduced pressure on the upper surface, versus increased pressure underneath?',
     '[{"id":"a","text":"About two thirds from the upper surface, about one third from underneath","correct":true},{"id":"b","text":"About one third from the upper surface, about two thirds from underneath","correct":false},{"id":"c","text":"Exactly half from each surface","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'Why does contamination such as ice or frost on the upper surface of a wing matter more than the same contamination underneath?',
     '[{"id":"a","text":"Because roughly two thirds of the lift comes from the reduced pressure on the upper surface","correct":true},{"id":"b","text":"Because the upper surface is structurally thinner and more easily damaged","correct":false},{"id":"c","text":"Because ice only ever forms on the upper surface in practice","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'What is the stagnation point on an aerofoil?',
     '[{"id":"a","text":"The point at the leading edge where air is brought completely to rest and divides, some going over and some going under","correct":true},{"id":"b","text":"The point where the boundary layer changes from laminar to turbulent","correct":false},{"id":"c","text":"The point of maximum velocity over the upper surface","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'What pressure does the stagnation point feel?',
     '[{"id":"a","text":"The full dynamic pressure plus the static pressure","correct":true},{"id":"b","text":"Dynamic pressure only, with static pressure cancelled out","correct":false},{"id":"c","text":"Static pressure only, with no dynamic pressure component","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'As angle of attack increases, in which direction does the stagnation point move?',
     '[{"id":"a","text":"Down and aft, onto the lower surface","correct":true},{"id":"b","text":"Up and forward, onto the upper surface","correct":false},{"id":"c","text":"It stays fixed regardless of angle of attack","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'What is the continuity equation''s mass flow formula?',
     '[{"id":"a","text":"m = ρ x A x V","correct":true},{"id":"b","text":"m = ρ / (A x V)","correct":false},{"id":"c","text":"m = A / (ρ x V)","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'Which everyday example illustrates the venturi effect described by the continuity principle?',
     '[{"id":"a","text":"A river speeding up as it passes through the arch of a bridge, where the channel area is reduced","correct":true},{"id":"b","text":"A river slowing down as it widens out into an estuary","correct":false},{"id":"c","text":"Smoke rising steadily from a chimney on a still day","correct":false}]',
     '{"B1","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- M08.4 Basic Aerodynamic Theory (18 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s4_id, 'What is the chord line of an aerofoil, and what is it used for?',
     '[{"id":"a","text":"The straight line from the leading edge to the trailing edge; it is the datum for measuring angles","correct":true},{"id":"b","text":"The line running halfway between the upper and lower surfaces, used to define camber","correct":false},{"id":"c","text":"The outline of the wing as seen from above, used to define planform","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'What distinguishes a cambered aerofoil from a symmetrical one, in terms of the mean camber line?',
     '[{"id":"a","text":"In a cambered aerofoil the mean camber line is curved; in a symmetrical aerofoil it lies on the chord line","correct":true},{"id":"b","text":"In a cambered aerofoil the mean camber line lies on the chord line; in a symmetrical aerofoil it is curved","correct":false},{"id":"c","text":"The mean camber line is always identical to the chord line in both cases","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'How does leading edge radius affect an aerofoil''s stalling and speed characteristics?',
     '[{"id":"a","text":"A blunt (larger radius) nose stalls more gently; a sharp nose is better suited to speed","correct":true},{"id":"b","text":"A sharp nose stalls more gently; a blunt nose is better suited to speed","correct":false},{"id":"c","text":"Leading edge radius has no effect on stalling behaviour, only on skin friction","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'Fineness ratio is defined as chord divided by thickness. What is it a measure of?',
     '[{"id":"a","text":"Streamlining - it is the inverse of the thickness/chord ratio","correct":true},{"id":"b","text":"Wing span relative to wing area","correct":false},{"id":"c","text":"The rigging angle between the chord line and the fuselage datum","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'What is the angle of attack (alpha) of an aerofoil?',
     '[{"id":"a","text":"The angle between the chord line and the relative airflow","correct":true},{"id":"b","text":"The angle between the chord line and the horizon","correct":false},{"id":"c","text":"The fixed rigging angle between the chord line and the fuselage datum","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'What is the angle of incidence of a wing, and does it change in flight?',
     '[{"id":"a","text":"The fixed rigging angle between the chord line and the fuselage datum; it does not change in flight","correct":true},{"id":"b","text":"The angle between the chord line and the relative airflow; it changes continuously in flight","correct":false},{"id":"c","text":"The angle between the wing and the horizon; it changes with aircraft attitude","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'Does a symmetrical aerofoil section produce lift at zero angle of attack?',
     '[{"id":"a","text":"No - it gives no lift at zero alpha, though it still produces drag","correct":true},{"id":"b","text":"Yes - it gives significant lift at zero alpha, more than a cambered section","correct":false},{"id":"c","text":"Yes, but only at negative angles of attack, never at zero","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'At what angle(s) of attack does a cambered aerofoil section produce lift?',
     '[{"id":"a","text":"At zero angle of attack, and even at small negative angles","correct":true},{"id":"b","text":"Only above a minimum positive angle of attack of several degrees","correct":false},{"id":"c","text":"Only exactly at zero angle of attack, and nowhere else","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'Why do symmetrical aerofoil sections suit helicopter rotor blades particularly well?',
     '[{"id":"a","text":"They have almost no centre of pressure travel","correct":true},{"id":"b","text":"They produce far more lift than cambered sections at every angle of attack","correct":false},{"id":"c","text":"They are cheaper to manufacture than cambered sections","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'How is wing area (S) defined?',
     '[{"id":"a","text":"The plan area of the wing, taken through the fuselage to the centreline","correct":true},{"id":"b","text":"The frontal (cross-sectional) area of the wing as seen head-on","correct":false},{"id":"c","text":"The combined wetted surface area of the upper and lower wing surfaces","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'How is mean chord calculated?',
     '[{"id":"a","text":"Wing area divided by span","correct":true},{"id":"b","text":"Span divided by wing area","correct":false},{"id":"c","text":"Root chord divided by tip chord","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'How is aspect ratio defined?',
     '[{"id":"a","text":"Span divided by mean chord (equivalently, span squared divided by wing area)","correct":true},{"id":"b","text":"Root chord divided by tip chord","correct":false},{"id":"c","text":"Wing area divided by span","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'How is taper ratio defined?',
     '[{"id":"a","text":"Root chord divided by tip chord","correct":true},{"id":"b","text":"Tip chord divided by root chord","correct":false},{"id":"c","text":"Span divided by mean chord","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'How is wing loading calculated?',
     '[{"id":"a","text":"Aircraft weight divided by wing area","correct":true},{"id":"b","text":"Wing area divided by aircraft weight","correct":false},{"id":"c","text":"Aircraft weight divided by wingspan","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'Sweep angle is measured between the lateral axis and a chosen chord line. Which chord line is usually chosen?',
     '[{"id":"a","text":"The quarter chord","correct":true},{"id":"b","text":"The root chord","correct":false},{"id":"c","text":"The tip chord","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'What is wash-out, and what is it used for?',
     '[{"id":"a","text":"A built-in twist reducing incidence from root to tip, used to improve stall behaviour and stability; it is common","correct":true},{"id":"b","text":"A built-in twist increasing incidence towards the tip, used because it improves stability; it is common","correct":false},{"id":"c","text":"The upward inclination of the wings, also called dihedral","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'What is wash-in, and why is it rare?',
     '[{"id":"a","text":"Incidence increasing towards the tip; it is rare because it reduces stability","correct":true},{"id":"b","text":"Incidence decreasing towards the tip; it is rare because it is expensive to build","correct":false},{"id":"c","text":"Another name for wash-out, rarely used in modern terminology","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'Which wing planform is described as aerodynamically the best - giving even lift distribution and the least induced drag - but expensive to build, as famously used on the Spitfire?',
     '[{"id":"a","text":"Elliptical","correct":true},{"id":"b","text":"Constant chord","correct":false},{"id":"c","text":"Trapezoidal","correct":false}]',
     '{"B1","B2"}');

END $$;
