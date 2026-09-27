-- Migration 107: Supplementary questions for Module 08 (Basic Aerodynamics) - part 4 (FINAL)
-- Adds question rows to five EXISTING subjects (no changes to easa_subjects):
--   M08.12 Turning & Manoeuvres   (source: study notes 8.3.8, lines 2490-2550)
--   M08.13 Stalling Speed         (source: study notes 8.2.12 stall-speed factors table,
--                                  lines 1734-1946, focused narrowly on Vs and what moves it)
--   M08.14 Performance             (source: study notes 8.3.9 V-n diagram + 8.3.11 high speed
--                                  flight, lines 2551-2604 and 2682-2828)
--   M08.16 Static Stability        (source: study notes 8.4.1-8.4.4, lines 2841-3159)
--   M08.17 Dynamic Stability       (source: study notes 8.4.5-8.4.6, lines 3160-3382)
-- Source: Module_8_Basic_Aerodynamics_Study_Notes.txt (as line-ranged above), cross-checked
-- against Module_8_620_Questions_Answered.txt (Q340-Q620 range) for topic coverage only
-- (no flagged questions used).

DO $$
DECLARE
    s12_id INT; s13_id INT; s14_id INT; s16_id INT; s17_id INT;
BEGIN
    SELECT id INTO s12_id FROM easa_subjects WHERE code = 'M08.12';
    SELECT id INTO s13_id FROM easa_subjects WHERE code = 'M08.13';
    SELECT id INTO s14_id FROM easa_subjects WHERE code = 'M08.14';
    SELECT id INTO s16_id FROM easa_subjects WHERE code = 'M08.16';
    SELECT id INTO s17_id FROM easa_subjects WHERE code = 'M08.17';

    IF EXISTS (
        SELECT 1 FROM questions
        WHERE subject_id = s12_id
        AND text LIKE '%lift now has to do two jobs%'
    ) THEN
        RAISE NOTICE 'M08 part 4 supplement already seeded, skipping.';
        RETURN;
    END IF;

    -- ============================================================
    -- M08.12 Turning & Manoeuvres (centripetal force, load factor, turn performance)
    -- ============================================================
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES
    (s12_id, 'When an aircraft turns, a force pulls it towards the centre of the turn. What does this do to the job the lift vector has to do?',
     '[{"id":"a","text":"The lift vector is tilted so the lift now has to do two jobs: hold up the weight and pull the aircraft round","correct":true},{"id":"b","text":"Lift stops holding up the weight entirely, and the rudder alone provides the centripetal force","correct":false},{"id":"c","text":"Lift is unaffected by the turn; the fuselage alone supplies the centripetal force","correct":false}]',
     '{"B1","B2"}'),

    (s12_id, 'What is the formula for the centripetal force required to turn an aircraft of mass m at speed V on a radius r?',
     '[{"id":"a","text":"Centripetal force = m V^2 / r","correct":true},{"id":"b","text":"Centripetal force = m V / r^2","correct":false},{"id":"c","text":"Centripetal force = m g / r","correct":false}]',
     '{"B1","B2"}'),

    (s12_id, 'In a level turn, how is load factor n related to bank angle?',
     '[{"id":"a","text":"n = L / W = 1 / cos(bank angle)","correct":true},{"id":"b","text":"n = L / W = cos(bank angle)","correct":false},{"id":"c","text":"n = L / W = sin(bank angle)","correct":false}]',
     '{"B1","B2"}'),

    (s12_id, 'To hold altitude while banking into a turn, the angle of attack must be increased. What follows from this?',
     '[{"id":"a","text":"More induced drag is produced, so more thrust is needed to maintain speed","correct":true},{"id":"b","text":"Induced drag falls, so less thrust is needed to maintain speed","correct":false},{"id":"c","text":"Angle of attack has no bearing on the thrust required in a turn","correct":false}]',
     '{"B1","B2"}'),

    (s12_id, 'Why does the stall speed rise in a level turn, and how is the new stall speed found from the level-flight value?',
     '[{"id":"a","text":"The wing is closer to the stalling angle because of the increased load factor; Vs(turn) = Vs x sqrt(n)","correct":true},{"id":"b","text":"The wing is further from the stalling angle in a turn; Vs(turn) = Vs / sqrt(n)","correct":false},{"id":"c","text":"Stall speed does not change in a turn, since load factor only affects structural loads","correct":false}]',
     '{"B1","B2"}'),

    (s12_id, 'What is the load factor in a level turn at 30 degrees of bank?',
     '[{"id":"a","text":"n = 1.15","correct":true},{"id":"b","text":"n = 1.41","correct":false},{"id":"c","text":"n = 2.0","correct":false}]',
     '{"B1","B2"}'),

    (s12_id, 'What is the load factor in a level turn at 60 degrees of bank, and by what factor does the stall speed rise above the level-flight figure?',
     '[{"id":"a","text":"n = 2, and the stall speed is 1.41 times the level figure","correct":true},{"id":"b","text":"n = 1.41, and the stall speed is 2 times the level figure","correct":false},{"id":"c","text":"n = 2, and the stall speed is unchanged from the level figure","correct":false}]',
     '{"B1","B2"}'),

    (s12_id, 'What does load factor in a level turn actually depend on?',
     '[{"id":"a","text":"Bank angle only - not weight, speed or aircraft type","correct":true},{"id":"b","text":"Aircraft weight primarily, with bank angle a secondary factor","correct":false},{"id":"c","text":"True airspeed primarily, with bank angle a secondary factor","correct":false}]',
     '{"B1","B2"}'),

    (s12_id, 'For the same TAS and bank angle, how does the radius of a level turn vary with aircraft weight and type?',
     '[{"id":"a","text":"It is independent of both weight and type","correct":true},{"id":"b","text":"A heavier aircraft always turns on a larger radius at the same TAS and bank angle","correct":false},{"id":"c","text":"It depends on aircraft type but not on weight","correct":false}]',
     '{"B1","B2"}'),

    (s12_id, 'What combination gives the minimum turn radius and maximum rate of turn?',
     '[{"id":"a","text":"Low wing loading, dense air (sea level), and the largest usable combination of CL and bank angle","correct":true},{"id":"b","text":"High wing loading, low density air, and the smallest usable bank angle","correct":false},{"id":"c","text":"High wing loading and the highest available airspeed, regardless of bank angle","correct":false}]',
     '{"B1","B2"}'),

    (s12_id, 'How does increasing altitude affect turn performance for a given EAS and bank angle?',
     '[{"id":"a","text":"Radius grows and rate falls, because the same EAS means a higher TAS, and reduced thrust and a lower CLmax through Mach effects make it worse still","correct":true},{"id":"b","text":"Radius shrinks and rate rises, because TAS falls with altitude at the same EAS","correct":false},{"id":"c","text":"Turn performance is unaffected by altitude, since load factor depends only on bank angle","correct":false}]',
     '{"B1","B2"}'),

    (s12_id, 'How can deploying flap reduce the radius of a turn, and what limits this?',
     '[{"id":"a","text":"Flap increases CLmax, which can reduce the radius, provided the flap limiting speed and the extra drag can be accommodated","correct":true},{"id":"b","text":"Flap always increases turn radius, because it lowers CLmax","correct":false},{"id":"c","text":"Flap has no effect on turn radius, since CLmax is unrelated to turning performance","correct":false}]',
     '{"B1","B2"}');

    -- ============================================================
    -- M08.13 Stalling Speed (Vs formula and the factors that move it)
    -- ============================================================
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES
    (s13_id, 'In level flight, what determines the stalling speed Vs of a wing?',
     '[{"id":"a","text":"Vs = sqrt( Weight / (CLmax x 1/2 rho x S) )","correct":true},{"id":"b","text":"Vs = Weight x CLmax x 1/2 rho x S","correct":false},{"id":"c","text":"Vs = sqrt( CLmax / (Weight x 1/2 rho x S) )","correct":false}]',
     '{"B1","B2"}'),

    (s13_id, 'For a given weight, why does an aircraft stall at the same indicated airspeed at any altitude, even though the true airspeed at the stall is higher up high?',
     '[{"id":"a","text":"Because 1/2 rho V^2 is what the ASI shows, and the stall occurs at a fixed dynamic pressure for a given weight","correct":true},{"id":"b","text":"Because CLmax increases with altitude to compensate for the falling air density","correct":false},{"id":"c","text":"Because the ASI reads true airspeed directly, which is unaffected by altitude","correct":false}]',
     '{"B1","B2"}'),

    (s13_id, 'What effect does an increase in aircraft weight have on stall speed, and why?',
     '[{"id":"a","text":"Stall speed increases, because more lift is needed to support the extra weight","correct":true},{"id":"b","text":"Stall speed decreases, because CLmax rises with weight","correct":false},{"id":"c","text":"Stall speed is unaffected by weight, since Vs depends only on CLmax","correct":false}]',
     '{"B1","B2"}'),

    (s13_id, 'What effect does an increase in load factor have on stall speed, and why?',
     '[{"id":"a","text":"Stall speed increases, because the effective weight is increased","correct":true},{"id":"b","text":"Stall speed decreases, because load factor raises CLmax","correct":false},{"id":"c","text":"Stall speed is unaffected by load factor, which only affects structural loads","correct":false}]',
     '{"B1","B2"}'),

    (s13_id, 'What effect does deploying flaps or slats have on stall speed, and why?',
     '[{"id":"a","text":"Stall speed decreases, because CLmax is increased","correct":true},{"id":"b","text":"Stall speed increases, because CLmax is decreased","correct":false},{"id":"c","text":"Stall speed is unaffected, since flaps and slats change drag but not CLmax","correct":false}]',
     '{"B1","B2"}'),

    (s13_id, 'Why do Fowler flaps lower the stall speed by more than a plain flap of the same CLmax increase would?',
     '[{"id":"a","text":"Because Fowler flaps increase both CLmax and wing area","correct":true},{"id":"b","text":"Because Fowler flaps increase CLmax while decreasing wing area","correct":false},{"id":"c","text":"Because Fowler flaps increase wing area only, with no effect on CLmax","correct":false}]',
     '{"B1","B2"}'),

    (s13_id, 'What effect does having power on have on stall speed, and why?',
     '[{"id":"a","text":"Stall speed is lower, due to the vertical component of thrust plus the effect of slipstream over the wing","correct":true},{"id":"b","text":"Stall speed is higher, because power on increases the effective weight","correct":false},{"id":"c","text":"Power has no effect on stall speed, which depends only on CLmax and weight","correct":false}]',
     '{"B1","B2"}'),

    (s13_id, 'What effect does ice, frost or snow contamination have on stall speed, and why?',
     '[{"id":"a","text":"Stall speed increases, because CLmax is badly reduced","correct":true},{"id":"b","text":"Stall speed decreases, because contamination adds weight which lowers the stalling angle","correct":false},{"id":"c","text":"Contamination has no significant effect on stall speed, only on drag","correct":false}]',
     '{"B1","B2"}'),

    (s13_id, 'Why does a forward CG position raise the stall speed?',
     '[{"id":"a","text":"A forward CG needs more tail download to trim, which acts like extra effective weight","correct":true},{"id":"b","text":"A forward CG reduces CLmax directly, independent of any change in effective weight","correct":false},{"id":"c","text":"A forward CG has no effect on stall speed, only on stability","correct":false}]',
     '{"B1","B2"}'),

    (s13_id, 'Roughly how does percentage increase in stall speed relate to percentage increase in weight? An aircraft that stalls at 100 kt at 2000 lb would stall at about what speed at 2200 lb?',
     '[{"id":"a","text":"The percentage increase in stall speed is about half the percentage increase in weight, so about 105 kt","correct":true},{"id":"b","text":"The percentage increase in stall speed equals the percentage increase in weight, so about 110 kt","correct":false},{"id":"c","text":"Stall speed is unaffected by this size of weight change, so it remains 100 kt","correct":false}]',
     '{"B1","B2"}'),

    (s13_id, 'Using the rule new Vs = old Vs x sqrt(n), what does a level-flight stall speed of 100 kt become in a 2g turn?',
     '[{"id":"a","text":"About 141 kt","correct":true},{"id":"b","text":"About 200 kt","correct":false},{"id":"c","text":"About 115 kt","correct":false}]',
     '{"B1","B2"}'),

    (s13_id, 'Using the rule new Vs = old Vs x sqrt(n), what happens to stall speed in a 4g manoeuvre?',
     '[{"id":"a","text":"It doubles","correct":true},{"id":"b","text":"It increases by 41 percent","correct":false},{"id":"c","text":"It quadruples","correct":false}]',
     '{"B1","B2"}');

    -- ============================================================
    -- M08.14 Performance (the V-n / flight envelope diagram and high speed flight)
    -- ============================================================
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES
    (s14_id, 'What is plotted on the V-n (flight envelope) diagram, and what is it used for?',
     '[{"id":"a","text":"Load factor against EAS; it is used to set design requirements, describe an aircraft''s capability, and compare types","correct":true},{"id":"b","text":"True airspeed against altitude; it is used only to plan fuel-efficient cruise levels","correct":false},{"id":"c","text":"Angle of attack against Mach number; it is used only to define the stall warning schedule","correct":false}]',
     '{"B1","B2"}'),

    (s14_id, 'What forms the curved left-hand boundary of the flight envelope, and why can the aircraft not be flown outside it?',
     '[{"id":"a","text":"The stall boundary, given by Vs = Vs1g x sqrt(n); the wing stalls first if you try to go beyond it","correct":true},{"id":"b","text":"The structural limit line; the airframe fails first if you try to go beyond it","correct":false},{"id":"c","text":"The maximum permissible speed VNE; the canopy fails first if you try to go beyond it","correct":false}]',
     '{"B1","B2"}'),

    (s14_id, 'What are the flat top and bottom boundaries of the flight envelope, and what are typical values for a trainer and for a transport aircraft?',
     '[{"id":"a","text":"The structural g limits; about +5.0/-3.5 g for a trainer and about +2.5/-1.0 g for a transport","correct":true},{"id":"b","text":"The stall boundaries; about +1.0/-1.0 g for both a trainer and a transport","correct":false},{"id":"c","text":"The maximum permissible speed limits; the same for a trainer and a transport","correct":false}]',
     '{"B1","B2"}'),

    (s14_id, 'The structural g limits on the flight envelope carry roughly a 50 percent safety margin before permanent deformation. Does this mean no damage occurs below the limit?',
     '[{"id":"a","text":"No - minor damage such as popped rivets and lost panels can occur well before structural failure","correct":true},{"id":"b","text":"Yes - no damage of any kind occurs until the structural limit is exceeded","correct":false},{"id":"c","text":"Yes - the 50 percent margin guarantees the structure is undamaged up to VNE","correct":false}]',
     '{"B1","B2"}'),

    (s14_id, 'What is the right-hand vertical boundary of the flight envelope, and what is the risk of exceeding it?',
     '[{"id":"a","text":"VD or VNE, the maximum permissible speed; exceeding it risks losing panels or failing the weakest structure, often the tailplane or canopy","correct":true},{"id":"b","text":"VA, the manoeuvre speed; exceeding it risks stalling the wing before the structure is loaded","correct":false},{"id":"c","text":"Vs1g, the 1g stall speed; exceeding it risks an immediate stall","correct":false}]',
     '{"B1","B2"}'),

    (s14_id, 'What is manoeuvre speed VA, and what happens to full control deflection above and below it?',
     '[{"id":"a","text":"The point where the stall boundary meets the positive g limit; below VA full control deflection stalls the wing before it breaks the aircraft, above VA it will not","correct":true},{"id":"b","text":"The point where the structural limit meets VNE; above VA full control deflection stalls the wing, below it will not","correct":false},{"id":"c","text":"The speed at which the aircraft always stalls regardless of control deflection","correct":false}]',
     '{"B1","B2"}'),

    (s14_id, 'Why must the structural g limits on the flight envelope be reduced as aircraft weight increases?',
     '[{"id":"a","text":"To keep the same structural safety margins at the higher weight","correct":true},{"id":"b","text":"Because heavier aircraft always have a lower CLmax","correct":false},{"id":"c","text":"Structural g limits do not change with weight, only with altitude","correct":false}]',
     '{"B1","B2"}'),

    (s14_id, 'At high Mach numbers, how does the flight envelope''s lift (stall) boundary change, and why?',
     '[{"id":"a","text":"It curves back and the available load factor is reduced, because shock waves cause early separation and CLmax falls","correct":true},{"id":"b","text":"It extends further out and the available load factor is increased, because shock waves delay separation","correct":false},{"id":"c","text":"It is unaffected by Mach number, since the stall boundary is fixed by geometry alone","correct":false}]',
     '{"B1","B2"}'),

    (s14_id, 'At roughly what Mach number do high speed (compressibility) effects begin, and what Mach range do most transports cruise at?',
     '[{"id":"a","text":"Effects begin from around Mach 0.6; most transports cruise at Mach 0.7 to 0.85","correct":true},{"id":"b","text":"Effects begin only at Mach 1.0; most transports cruise at Mach 0.4 to 0.5","correct":false},{"id":"c","text":"Effects begin from around Mach 0.2; most transports cruise at Mach 0.95 to 1.0","correct":false}]',
     '{"B1","B2"}'),

    (s14_id, 'What does the local speed of sound depend on, and what are its approximate values at mean sea level and at 30,000 ft?',
     '[{"id":"a","text":"It depends only on absolute temperature (LSS = 39 x sqrt(T in K)); about 661 kt at MSL and 589 kt at 30,000 ft","correct":true},{"id":"b","text":"It depends only on air density; about 589 kt at MSL and 661 kt at 30,000 ft","correct":false},{"id":"c","text":"It depends only on airspeed; it rises directly with TAS","correct":false}]',
     '{"B1","B2"}'),

    (s14_id, 'What is the critical Mach number (MCRIT), and how does it vary with angle of attack?',
     '[{"id":"a","text":"The lowest free-stream Mach number at which the local flow somewhere on the aerofoil first reaches Mach 1.0; it falls as angle of attack rises, since more alpha means more local acceleration","correct":true},{"id":"b","text":"The Mach number at which the whole aircraft becomes fully supersonic; it rises as angle of attack rises","correct":false},{"id":"c","text":"The free-stream Mach number at which the aircraft first exceeds the speed of sound; it is unaffected by angle of attack","correct":false}]',
     '{"B1","B2"}'),

    (s14_id, 'How does the critical drag rise Mach number relate to the critical Mach number?',
     '[{"id":"a","text":"It is typically 10 to 15 percent above MCRIT, marking where drag begins to climb appreciably","correct":true},{"id":"b","text":"It is always identical to MCRIT","correct":false},{"id":"c","text":"It is typically 10 to 15 percent below MCRIT","correct":false}]',
     '{"B1","B2"}'),

    (s14_id, 'Where does a shock wave first form on a wing as the local flow reaches Mach 1.0, and what is the flow like immediately ahead of and behind it?',
     '[{"id":"a","text":"Just aft of the point of maximum camber; supersonic ahead, subsonic behind","correct":true},{"id":"b","text":"At the leading edge stagnation point; subsonic ahead, supersonic behind","correct":false},{"id":"c","text":"At the trailing edge only; supersonic on both sides","correct":false}]',
     '{"B1","B2"}'),

    (s14_id, 'What is shock stall, and what is the resulting increase in drag called?',
     '[{"id":"a","text":"Boundary layer separation behind the shock wave, causing lift to fall and drag to rise steeply - this is wave drag","correct":true},{"id":"b","text":"A stall caused only by exceeding the stalling angle at low speed - this is induced drag","correct":false},{"id":"c","text":"A momentary loss of engine thrust at high Mach number - this is profile drag","correct":false}]',
     '{"B1","B2"}'),

    (s14_id, 'What causes Mach tuck (nose-down trim change) as an aircraft approaches its critical Mach number, and what corrects it automatically?',
     '[{"id":"a","text":"As the shock moves aft, the centre of pressure moves aft too and downwash at the tail reduces, both pushing the nose down; a Mach trimmer corrects it automatically","correct":true},{"id":"b","text":"The centre of pressure moves forward, pushing the nose up; ailerons correct it automatically","correct":false},{"id":"c","text":"Engine thrust increases sharply, pushing the nose up; the autothrottle corrects it automatically","correct":false}]',
     '{"B1","B2"}'),

    (s14_id, 'Which of the following is a recognised technique for delaying the onset of compressibility effects on a wing?',
     '[{"id":"a","text":"Sweepback, which reduces the effective flow speed over the section","correct":true},{"id":"b","text":"Increasing the thickness/chord ratio, which slows the local flow acceleration","correct":false},{"id":"c","text":"Reducing wing area to increase wing loading","correct":false}]',
     '{"B1","B2"}');

    -- ============================================================
    -- M08.16 Static Stability (directional, longitudinal and lateral static stability)
    -- ============================================================
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES
    (s16_id, 'How is positive, neutral and negative static stability distinguished, using the "ball in a bowl" idea?',
     '[{"id":"a","text":"Positive - it starts back towards where it was; neutral - it settles in the new position; negative - it keeps going","correct":true},{"id":"b","text":"Positive - it settles in the new position; neutral - it keeps going; negative - it starts back towards where it was","correct":false},{"id":"c","text":"Positive, neutral and negative all describe the same immediate return to the original position","correct":false}]',
     '{"B1","B2"}'),

    (s16_id, 'Can an aircraft be statically stable but dynamically unstable?',
     '[{"id":"a","text":"Yes - it can start to come back after a disturbance, then overshoot with growing oscillations","correct":true},{"id":"b","text":"No - static stability always guarantees dynamic stability as well","correct":false},{"id":"c","text":"No - an aircraft that is statically stable can only be dynamically stable or dynamically neutral","correct":false}]',
     '{"B1","B2"}'),

    (s16_id, 'What is the "naming trap" for stability about the three axes: what motion does lateral stability actually concern, and what does longitudinal stability concern?',
     '[{"id":"a","text":"Lateral stability is about roll (motion about the longitudinal axis); longitudinal stability is about pitch (motion about the lateral axis)","correct":true},{"id":"b","text":"Lateral stability is about yaw; longitudinal stability is about roll","correct":false},{"id":"c","text":"Lateral stability is about the lateral axis itself; longitudinal stability is about the longitudinal axis itself","correct":false}]',
     '{"B1","B2"}'),

    (s16_id, 'Using the dart analogy for directional stability, what two things are needed for a yaw displacement to be corrected?',
     '[{"id":"a","text":"The aircraft rotates about its CG, and its momentum carries it briefly along the old path, producing a sideslip that loads the fin","correct":true},{"id":"b","text":"The aircraft must slow down immediately, and the rudder must be applied by the pilot","correct":false},{"id":"c","text":"The wings must be swept, and the fin must be mounted above the centre of gravity","correct":false}]',
     '{"B1","B2"}'),

    (s16_id, 'Why is a bare fuselage usually directionally unstable, and how does adding a fin fix this?',
     '[{"id":"a","text":"Its centre of pressure lies ahead of the CG; adding a fin moves the overall CP behind the CG, since keel surface behind the CG is stabilising","correct":true},{"id":"b","text":"Its centre of pressure lies behind the CG; adding a fin moves the overall CP ahead of the CG","correct":false},{"id":"c","text":"A bare fuselage is always stable; the fin is added purely for rudder control, not stability","correct":false}]',
     '{"B1","B2"}'),

    (s16_id, 'How do designers prevent the fin from stalling at large sideslip angles?',
     '[{"id":"a","text":"By increasing sweep, reducing aspect ratio, or fitting several low aspect ratio fins","correct":true},{"id":"b","text":"By increasing the fin''s aspect ratio and reducing its sweep","correct":false},{"id":"c","text":"By removing the rudder so the fin acts as a pure symmetrical aerofoil","correct":false}]',
     '{"B1","B2"}'),

    (s16_id, 'How does moving the CG forward affect directional stability, and why?',
     '[{"id":"a","text":"It increases directional stability, because it lengthens the moment arm from the CG to the fin''s centre of pressure","correct":true},{"id":"b","text":"It decreases directional stability, because it shortens the moment arm to the fin","correct":false},{"id":"c","text":"CG position has no effect on directional stability, only on longitudinal stability","correct":false}]',
     '{"B1","B2"}'),

    (s16_id, 'Why is the wing alone usually longitudinally unstable, with its centre of pressure ahead of the CG?',
     '[{"id":"a","text":"A nose-up displacement increases angle of attack, which increases lift, which increases the nose-up moment, so the disturbance grows","correct":true},{"id":"b","text":"A nose-up displacement decreases angle of attack, which decreases lift, so the disturbance grows","correct":false},{"id":"c","text":"The wing alone is always stable regardless of where the CP sits relative to the CG","correct":false}]',
     '{"B1","B2"}'),

    (s16_id, 'What is the restoring moment in longitudinal stability, expressed in terms of the tail and wing lift?',
     '[{"id":"a","text":"Restoring moment = (Lift TAIL x tail arm) - (Lift WING x wing arm)","correct":true},{"id":"b","text":"Restoring moment = (Lift WING x wing arm) - (Lift TAIL x tail arm)","correct":false},{"id":"c","text":"Restoring moment = Lift TAIL + Lift WING, regardless of either moment arm","correct":false}]',
     '{"B1","B2"}'),

    (s16_id, 'How does a forward CG position compare with an aft CG position for longitudinal stability and stall speed?',
     '[{"id":"a","text":"Forward CG gives a longer tail arm and more stability, but is heavier in pitch and raises the stall speed through more tail download","correct":true},{"id":"b","text":"Forward CG gives less stability and lowers the stall speed compared with an aft CG","correct":false},{"id":"c","text":"CG position affects trim drag only, with no effect on stability or stall speed","correct":false}]',
     '{"B1","B2"}'),

    (s16_id, 'What is the neutral point, and how is the static margin defined?',
     '[{"id":"a","text":"The CG position at which the restoring moment becomes zero; the static margin is the distance from the actual CG to the neutral point","correct":true},{"id":"b","text":"The point where the wing stalls first; the static margin is the distance from the CG to the wingtip","correct":false},{"id":"c","text":"The point where the fin''s side force is zero; the static margin is the fin''s moment arm","correct":false}]',
     '{"B1","B2"}'),

    (s16_id, 'On the pitching moment (CM vs CL) curve, what does a negative slope mean, and how does setting the tailplane at a lower incidence than the wing create a trim point?',
     '[{"id":"a","text":"A negative slope means stability; the lower tailplane incidence produces a download that raises the curve until it crosses zero","correct":true},{"id":"b","text":"A positive slope means stability; the lower tailplane incidence produces an upload that lowers the curve until it crosses zero","correct":false},{"id":"c","text":"Slope has no bearing on stability; only the tailplane incidence determines whether a trim point exists","correct":false}]',
     '{"B1","B2"}'),

    (s16_id, 'How does stick-free longitudinal stability compare with stick-fixed, and how does manoeuvre stability compare with steady-flight stability?',
     '[{"id":"a","text":"Stick-free stability is less than stick-fixed; the aircraft is always more stable in a manoeuvre than in steady flight, because pitch rate adds damping","correct":true},{"id":"b","text":"Stick-free stability is greater than stick-fixed; the aircraft is less stable in a manoeuvre than in steady flight","correct":false},{"id":"c","text":"Stick-free and manoeuvre stability are identical to stick-fixed and steady-flight stability","correct":false}]',
     '{"B1","B2"}'),

    (s16_id, 'Why does damping-in-roll alone fail to bring the wings level after a rolling disturbance?',
     '[{"id":"a","text":"Damping-in-roll is proportional to the rate of roll, so once the roll stops the damping stops too; against a bank angle alone the aircraft is neutrally stable","correct":true},{"id":"b","text":"Damping-in-roll actively drives the aircraft further into the bank","correct":false},{"id":"c","text":"Damping-in-roll only exists on swept-wing aircraft, so most types have none at all","correct":false}]',
     '{"B1","B2"}'),

    (s16_id, 'What actually restores an aircraft to wings-level after a bank, and what is this response usually called?',
     '[{"id":"a","text":"The sideslip that follows the bank, which is why lateral static stability is usually called dihedral effect","correct":true},{"id":"b","text":"The increased drag on the down-going wing alone, called profile-drag stability","correct":false},{"id":"c","text":"The pilot''s use of rudder, called weathercock correction","correct":false}]',
     '{"B1","B2"}');

    -- ============================================================
    -- M08.17 Dynamic Stability (longitudinal and lateral/directional dynamic modes)
    -- ============================================================
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES
    (s17_id, 'How are positive, neutral and negative dynamic stability distinguished in terms of oscillation amplitude?',
     '[{"id":"a","text":"Positive - amplitude damped; neutral - amplitude constant; negative - amplitude increasing","correct":true},{"id":"b","text":"Positive - amplitude increasing; neutral - amplitude damped; negative - amplitude constant","correct":false},{"id":"c","text":"Positive, neutral and negative all describe motion that diverges without oscillating","correct":false}]',
     '{"B1","B2"}'),

    (s17_id, 'What does it mean for a dynamic response to be "dead-beat", and what does a motion that diverges without oscillating indicate?',
     '[{"id":"a","text":"Dead-beat means heavily damped with no overshoot (strongly positive); diverging without oscillating indicates negative dynamic stability","correct":true},{"id":"b","text":"Dead-beat means constant-amplitude oscillation (neutral); diverging without oscillating indicates positive dynamic stability","correct":false},{"id":"c","text":"Dead-beat and non-oscillating divergence both describe the same neutrally stable response","correct":false}]',
     '{"B1","B2"}'),

    (s17_id, 'What does the periodic time of a dynamic oscillation depend on?',
     '[{"id":"a","text":"Static stability - stronger static stability gives a shorter period","correct":true},{"id":"b","text":"Damping alone, with static stability having no effect on period","correct":false},{"id":"c","text":"Altitude alone, with static stability having no effect on period","correct":false}]',
     '{"B1","B2"}'),

    (s17_id, 'What is damping, how is it commonly quoted, and why does it fall with altitude?',
     '[{"id":"a","text":"How quickly the amplitude decays, often quoted as time or cycles to halve; it falls with altitude because it comes largely from air viscosity acting on the moving surfaces","correct":true},{"id":"b","text":"How quickly the period lengthens; it falls with altitude because temperature falls","correct":false},{"id":"c","text":"The strength of the initial disturbance; it is unaffected by altitude","correct":false}]',
     '{"B1","B2"}'),

    (s17_id, 'What are the characteristics of the phugoid: its period, its damping, and what is exchanged during the motion?',
     '[{"id":"a","text":"A long period of tens of seconds, poor damping, with kinetic and potential energy trading back and forth at almost constant angle of attack","correct":true},{"id":"b","text":"A short period of a second or two, heavy damping, with a large change in load factor","correct":false},{"id":"c","text":"A long period with heavy damping and almost no change in speed or height","correct":false}]',
     '{"B1","B2"}'),

    (s17_id, 'What are the characteristics of the short-period pitching oscillation: its period, its damping, and its load factor change?',
     '[{"id":"a","text":"A short period of a second or two, heavy damping, and a large change in load factor - a pure pitching oscillation about the CG","correct":true},{"id":"b","text":"A long period of tens of seconds, poor damping, and almost no change in load factor","correct":false},{"id":"c","text":"A short period with poor damping and a large change in height","correct":false}]',
     '{"B1","B2"}'),

    (s17_id, 'Why is the phugoid''s poor damping generally tolerable, and why have modern low-drag designs made it less well damped?',
     '[{"id":"a","text":"It is slow enough for the pilot to correct easily, and phugoid damping depends on drag, which modern designs reduce","correct":true},{"id":"b","text":"It is too fast for the pilot to correct, and phugoid damping depends on pitch inertia, which modern designs increase","correct":false},{"id":"c","text":"The phugoid has no practical effect on handling, regardless of aircraft design","correct":false}]',
     '{"B1","B2"}'),

    (s17_id, 'Why must the short-period pitching mode be heavily damped by design, and what does it depend on?',
     '[{"id":"a","text":"It is too fast for a pilot to react to; it depends on static longitudinal stability, pitch damping, moment of inertia in pitch, and pitch angle and rate","correct":true},{"id":"b","text":"It is slow enough for a pilot to correct manually; it depends only on aircraft weight","correct":false},{"id":"c","text":"It only matters at low altitude, so design damping is unnecessary at cruise levels","correct":false}]',
     '{"B1","B2"}'),

    (s17_id, 'What is roll subsidence, and is it normally a problem?',
     '[{"id":"a","text":"A pure roll, heavily damped by damping-in-roll - not a problem","correct":true},{"id":"b","text":"An oscillation combining roll, yaw and sideslip - a serious problem on swept-wing jets","correct":false},{"id":"c","text":"A slow divergence into a tightening spiral - a serious problem at high altitude","correct":false}]',
     '{"B1","B2"}'),

    (s17_id, 'What causes spiral instability, and why is it regarded as the lesser evil compared with Dutch roll?',
     '[{"id":"a","text":"Strong directional stability relative to dihedral effect causes a slow, tightening spiral dive that is slow enough for the pilot to fly out of","correct":true},{"id":"b","text":"Strong dihedral effect relative to directional stability causes a fast oscillation the pilot cannot correct","correct":false},{"id":"c","text":"It is caused by excessive damping-in-roll and develops too fast for the pilot to notice","correct":false}]',
     '{"B1","B2"}'),

    (s17_id, 'What causes Dutch roll, and what aircraft characteristics is it typically associated with?',
     '[{"id":"a","text":"Strong dihedral effect relative to directional stability; it is typical of swept wings, high wing loading and high altitude","correct":true},{"id":"b","text":"Strong directional stability relative to dihedral effect; it is typical of straight, unswept low-altitude aircraft","correct":false},{"id":"c","text":"Excessive damping-in-roll; it is typical of high aspect ratio gliders","correct":false}]',
     '{"B1","B2"}'),

    (s17_id, 'In the simplified picture of Dutch roll on a swept wing, what happens after a yaw to starboard, and why does the motion keep reversing?',
     '[{"id":"a","text":"The advancing port wing makes more lift and rolls the aircraft to starboard, but its extra drag yaws the aircraft back to port, reversing the roll and producing a wallowing motion","correct":true},{"id":"b","text":"The advancing port wing loses lift and the aircraft rolls to port, with no further yawing effect","correct":false},{"id":"c","text":"Both wings behave identically, so no rolling or further yawing motion results","correct":false}]',
     '{"B1","B2"}'),

    (s17_id, 'What is the trade-off between weathercock (directional) stability and dihedral effect, and what are the standard cures for the more serious of the two problems?',
     '[{"id":"a","text":"Too much weathercock stability relative to dihedral effect gives spiral instability; too much dihedral effect relative to weathercock stability gives Dutch roll, the more serious of the two, cured by reducing dihedral effect (anhedral) and fitting a yaw damper","correct":true},{"id":"b","text":"Too much dihedral effect gives spiral instability, the more serious problem, cured by increasing dihedral further","correct":false},{"id":"c","text":"The two effects are unrelated, so neither can be traded off against the other","correct":false}]',
     '{"B1","B2"}'),

    (s17_id, 'According to the Chapter 8.4 stability summary, how does moving the CG forward affect longitudinal, directional and lateral stability, and how does increased altitude affect damping across all three?',
     '[{"id":"a","text":"Forward CG increases both longitudinal and directional stability with little effect on lateral stability; increased altitude reduces damping in all three","correct":true},{"id":"b","text":"Forward CG decreases longitudinal and directional stability but strongly increases lateral stability; increased altitude increases damping in all three","correct":false},{"id":"c","text":"Forward CG only affects lateral stability; altitude has no effect on damping in any axis","correct":false}]',
     '{"B1","B2"}');

END $$;
