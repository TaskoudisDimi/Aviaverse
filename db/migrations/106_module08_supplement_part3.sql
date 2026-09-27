-- Migration 106: Supplement M08.9 (Stalling), M08.10 (Flight Forces),
-- M08.11 (Climbing & Gliding) and M08.15 (Lift Augmentation) with additional
-- question rows. Does not touch easa_subjects (rows already exist).
-- Source: Module 8 Basic Aerodynamics Study Notes, sections 8.2.12-8.2.13
-- (lines 1713-1957), 8.3.1-8.3.2 (lines 1968-2065), 8.3.3 (lines 2066-2187),
-- and 8.3.6-8.3.7 (lines 2386-2489); cross-checked against the Module 8
-- 620 Questions Answered bank (roughly Q125-Q340) for flap/slat/stall
-- terminology.

DO $$
DECLARE
    s9_id INT;
    s10_id INT;
    s11_id INT;
    s15_id INT;
BEGIN
    SELECT id INTO s9_id FROM easa_subjects WHERE code = 'M08.9';
    SELECT id INTO s10_id FROM easa_subjects WHERE code = 'M08.10';
    SELECT id INTO s11_id FROM easa_subjects WHERE code = 'M08.11';
    SELECT id INTO s15_id FROM easa_subjects WHERE code = 'M08.15';

    IF s9_id IS NULL OR s10_id IS NULL OR s11_id IS NULL OR s15_id IS NULL THEN
        RAISE NOTICE 'One or more M08 subjects (M08.9/M08.10/M08.11/M08.15) not found, skipping.';
        RETURN;
    END IF;

    -- Idempotency guard: skip if this backfill was already applied.
    IF EXISTS (
        SELECT 1 FROM questions
        WHERE subject_id = s9_id
          AND text LIKE '%layer of frost no thicker than coarse sandpaper%'
    ) THEN
        RAISE NOTICE 'M08 part 3 supplement already seeded, skipping.';
        RETURN;
    END IF;

    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    -- ===================== M08.9 Stalling =====================

    (s9_id, 'A wing always stalls at the same:',
     '[{"id":"a","text":"Angle of attack, typically about 15 to 16 degrees","correct":true},{"id":"b","text":"Indicated airspeed, regardless of weight","correct":false},{"id":"c","text":"True airspeed, regardless of altitude","correct":false}]',
     '{"B1","B2"}'),

    (s9_id, 'What is the underlying aerodynamic cause of the stall?',
     '[{"id":"a","text":"The adverse pressure gradient behind the suction peak overcomes the kinetic energy left in the boundary layer, so the flow separates and breaks up into a turbulent wake","correct":true},{"id":"b","text":"The airflow becomes supersonic over the upper surface, forming a shock wave that separates the flow","correct":false},{"id":"c","text":"The centre of pressure moves so far aft that the wing can no longer generate a pressure difference","correct":false}]',
     '{"B1","B2"}'),

    (s9_id, 'Because a wing stalls at a fixed CLmax, for a given weight, in level flight an aircraft will:',
     '[{"id":"a","text":"Stall at the same indicated airspeed at any altitude, even though the true airspeed at the stall is higher at altitude","correct":true},{"id":"b","text":"Stall at the same true airspeed at any altitude, even though the indicated airspeed at the stall is higher at altitude","correct":false},{"id":"c","text":"Stall at a lower indicated airspeed at higher altitude, because air density is lower","correct":false}]',
     '{"B1","B2"}'),

    (s9_id, 'As a rule of thumb, if an aircraft''s weight increases by 10%, approximately how much does its stalling speed increase?',
     '[{"id":"a","text":"About 5%, since the percentage increase in stall speed is roughly half the percentage increase in weight","correct":true},{"id":"b","text":"About 10%, since stall speed increases in direct proportion to weight","correct":false},{"id":"c","text":"About 20%, since stall speed increases with the square of the weight increase","correct":false}]',
     '{"B1","B2"}'),

    (s9_id, 'Using the rule of thumb that new Vs = old Vs x sqrt(load factor), what happens to the stall speed of an aircraft normally stalling at 100 kt when it is pulled into a 4g manoeuvre?',
     '[{"id":"a","text":"It doubles, to about 200 kt","correct":true},{"id":"b","text":"It increases by about 41%, to about 141 kt","correct":false},{"id":"c","text":"It is unaffected by load factor, since stall is governed by angle of attack only","correct":false}]',
     '{"B1","B2"}'),

    (s9_id, 'In a steady 2g turn, an aircraft that normally stalls at 100 kt in level flight will now stall at approximately:',
     '[{"id":"a","text":"141 kt","correct":true},{"id":"b","text":"120 kt","correct":false},{"id":"c","text":"200 kt","correct":false}]',
     '{"B1","B2"}'),

    (s9_id, 'Which of the following correctly pairs a factor with its effect on stalling speed?',
     '[{"id":"a","text":"Extending flaps or slats lowers the stalling speed, because CLmax is increased","correct":true},{"id":"b","text":"Extending flaps or slats raises the stalling speed, because wing area is reduced","correct":false},{"id":"c","text":"Power on raises the stalling speed, because the nose-up pitching moment increases the effective weight","correct":false}]',
     '{"B1","B2"}'),

    (s9_id, 'Why does a forward centre of gravity raise an aircraft''s stalling speed?',
     '[{"id":"a","text":"A forward CG needs more tail download to trim, which acts like extra weight that the wing must support","correct":true},{"id":"b","text":"A forward CG reduces the critical angle of attack of the wing","correct":false},{"id":"c","text":"A forward CG increases the wing''s effective aspect ratio","correct":false}]',
     '{"B1","B2"}'),

    (s9_id, 'Why must a wing be designed so that it never stalls from the tip first?',
     '[{"id":"a","text":"A tip stall would cause loss of aileron authority and a violent wing drop exactly when control is most needed","correct":true},{"id":"b","text":"A tip stall always produces a spin from which recovery is aerodynamically impossible","correct":false},{"id":"c","text":"A tip stall increases induced drag more than a root stall does, reducing range","correct":false}]',
     '{"B1","B2"}'),

    (s9_id, 'What is "wash-out", used to encourage a wing to stall at the root before the tip?',
     '[{"id":"a","text":"Twisting the wing so the tip sits at a lower angle of incidence than the root","correct":true},{"id":"b","text":"Giving the tip a lower camber, and therefore a lower CL, than the root","correct":false},{"id":"c","text":"Fitting a small spoiler at the tip that reduces the effective camber there","correct":false}]',
     '{"B1","B2"}'),

    (s9_id, 'How do stall strips (stall inducers), typically fitted near the wing root, promote root-first stalling?',
     '[{"id":"a","text":"They are small spoilers that reduce the effective camber at the root, causing the flow to separate there earlier","correct":true},{"id":"b","text":"They increase the local wing area at the root, delaying the stall there relative to the tip","correct":false},{"id":"c","text":"They duct high-energy air from below the wing onto the root''s upper surface","correct":false}]',
     '{"B1","B2"}'),

    (s9_id, 'Boundary layer fences, leading edge notches and sawtooth extensions on a wing all serve to:',
     '[{"id":"a","text":"Restrict the spanwise outflow of the boundary layer towards the tip","correct":true},{"id":"b","text":"Increase the local angle of attack at the wing root to force it to stall first","correct":false},{"id":"c","text":"Reduce skin friction drag over the outer wing panels","correct":false}]',
     '{"B1","B2"}'),

    (s9_id, 'Of the following wing planforms, which has the best natural stalling behaviour, stalling at the root first?',
     '[{"id":"a","text":"A rectangular wing","correct":true},{"id":"b","text":"A tapered wing","correct":false},{"id":"c","text":"A swept wing","correct":false}]',
     '{"B1","B2"}'),

    (s9_id, 'A swept wing has a strong tendency to stall at the tip. What is the resulting effect on pitch?',
     '[{"id":"a","text":"The centre of pressure moves forward as the tips stall, giving a nose-up pitch-up","correct":true},{"id":"b","text":"The centre of pressure moves aft as the tips stall, giving a nose-down pitch that aids recovery","correct":false},{"id":"c","text":"There is no pitch effect, since tip stall only affects roll control","correct":false}]',
     '{"B1","B2"}'),

    (s9_id, 'Why do low aspect ratio wings stall at a higher geometric angle of attack than high aspect ratio wings?',
     '[{"id":"a","text":"Their strong tip vortices and heavy downwash reduce the effective angle of attack for a given geometric angle","correct":true},{"id":"b","text":"Their lower CLmax means the critical angle of attack is never actually reached","correct":false},{"id":"c","text":"Their thicker boundary layer delays flow separation until a much higher angle","correct":false}]',
     '{"B1","B2"}'),

    (s9_id, 'Lowering trailing edge flap makes a wing stall at a much flatter aircraft attitude. Why does this happen, given that the critical angle of attack of the aerofoil section is essentially unchanged?',
     '[{"id":"a","text":"Lowering the flap swings the chord line down, so the same critical angle of attack is reached at a flatter aircraft attitude","correct":true},{"id":"b","text":"Lowering the flap reduces the critical angle of attack of the section from about 15 degrees to nearly zero","correct":false},{"id":"c","text":"Lowering the flap increases the wing''s aspect ratio, which lowers the critical angle of attack","correct":false}]',
     '{"B1","B2"}'),

    (s9_id, 'On a T-tail aircraft, what is a "deep stall" and why is it dangerous?',
     '[{"id":"a","text":"The wing wake at the stall can blanket the tailplane, removing the elevator authority needed to lower the nose and recover","correct":true},{"id":"b","text":"The aircraft descends vertically with the nose pointing straight down, exceeding the never-exceed speed","correct":false},{"id":"c","text":"Both wingtips stall simultaneously, removing all aileron authority at once","correct":false}]',
     '{"B1","B2"}'),

    (s9_id, 'Aerofoil contamination such as ice, frost or snow reduces CLmax through which two effects acting together?',
     '[{"id":"a","text":"It changes the aerofoil shape, corrupting the designed camber and leading edge radius, and it roughens the surface, tripping and thickening the boundary layer early","correct":true},{"id":"b","text":"It reduces the wing''s structural stiffness and increases the aircraft''s empty weight","correct":false},{"id":"c","text":"It reduces the critical Mach number and increases the aspect ratio of the wing","correct":false}]',
     '{"B1","B2"}'),

    (s9_id, 'By roughly how much can a layer of frost no thicker than coarse sandpaper reduce a wing''s CLmax?',
     '[{"id":"a","text":"30% or more","correct":true},{"id":"b","text":"About 5%","correct":false},{"id":"c","text":"Less than 1%, since frost is too thin to affect the airflow","correct":false}]',
     '{"B1","B2"}'),

    (s9_id, 'Why can frost or ice contamination make an aircraft''s normal stall warning system misleading?',
     '[{"id":"a","text":"Contamination reduces the stalling angle as well as CLmax, so the usual attitude cues and warning system may no longer correspond to the actual stall","correct":true},{"id":"b","text":"Contamination disconnects the alpha-sensing vane electrically, so no warning is given at all","correct":false},{"id":"c","text":"Contamination only affects the lower surface, which the stall warning system does not monitor","correct":false}]',
     '{"B1","B2"}'),

    (s9_id, 'Why is the upper surface of the wing the critical one when it comes to ice, frost or snow contamination?',
     '[{"id":"a","text":"It is the surface referred to by the \"2/3 rule\" and the one whose contamination most severely degrades CLmax","correct":true},{"id":"b","text":"It is the only surface on which ice can physically accumulate in flight","correct":false},{"id":"c","text":"It is the surface where the boundary layer is normally turbulent rather than laminar","correct":false}]',
     '{"B1","B2"}'),

    (s9_id, 'What is the accepted operating rule regarding wing contamination before flight?',
     '[{"id":"a","text":"There is no acceptable amount of contamination - the wing is de-iced completely before flight, or the aircraft does not go","correct":true},{"id":"b","text":"A light, even layer of frost across the whole wing is acceptable provided the stall warning system is functioning","correct":false},{"id":"c","text":"Contamination is acceptable on the lower surface only, since the upper surface is aerodynamically critical","correct":false}]',
     '{"B1","B2"}'),

    -- ===================== M08.10 Flight Forces =====================

    (s10_id, 'In steady, straight and level flight, why can the four forces not simply be summarised as L = W and T = D?',
     '[{"id":"a","text":"Because the lines of action of lift, weight, thrust and drag do not all pass through one point","correct":true},{"id":"b","text":"Because lift and weight act along the same line but in opposite directions, cancelling any moment","correct":false},{"id":"c","text":"Because thrust and drag act perpendicular to the flight path rather than parallel to it","correct":false}]',
     '{"B1","B2"}'),

    (s10_id, 'Through which point does lift act, and why does its location change in flight?',
     '[{"id":"a","text":"Through the centre of pressure, which moves with angle of attack","correct":true},{"id":"b","text":"Through the centre of gravity, which moves as the aircraft manoeuvres","correct":false},{"id":"c","text":"Through the aerodynamic centre, which is fixed regardless of angle of attack","correct":false}]',
     '{"B1","B2"}'),

    (s10_id, 'Why does the centre of gravity move during a flight?',
     '[{"id":"a","text":"As fuel is burnt off and as the load shifts","correct":true},{"id":"b","text":"As the centre of pressure moves with changing angle of attack","correct":false},{"id":"c","text":"As dynamic pressure changes with airspeed","correct":false}]',
     '{"B1","B2"}'),

    (s10_id, 'Because the centre of pressure and centre of gravity are not coincident, lift and weight form a couple. How are the lift/weight (L/W) couple and thrust/drag (T/D) couple deliberately arranged relative to each other?',
     '[{"id":"a","text":"They are arranged to oppose each other, with the CG placed ahead of the CP to give a nose-down L/W couple, balanced by a nose-up T/D couple","correct":true},{"id":"b","text":"They are arranged to reinforce each other, both giving a nose-down pitching moment for stability","correct":false},{"id":"c","text":"They are arranged so that the CP is always placed ahead of the CG, giving a nose-up L/W couple","correct":false}]',
     '{"B1","B2"}'),

    (s10_id, 'Why is the thrust line typically placed below the drag line, giving a nose-up T/D couple?',
     '[{"id":"a","text":"So that throttling back weakens the T/D couple and the nose-down L/W couple takes over, putting the aircraft into a glide rather than a stall after an engine failure","correct":true},{"id":"b","text":"So that increasing power always produces a steep nose-down pitch, making the aircraft easier to control at high speed","correct":false},{"id":"c","text":"So that the two couples always cancel exactly, regardless of throttle setting","correct":false}]',
     '{"B1","B2"}'),

    (s10_id, 'What happens to the residual (leftover) moment from the lift/weight and thrust/drag couples once they have been balanced against each other?',
     '[{"id":"a","text":"It is balanced by a load from the tailplane and elevator, usually a download on a conventional aircraft","correct":true},{"id":"b","text":"It is always exactly zero by design, so no tailplane load is required","correct":false},{"id":"c","text":"It is balanced entirely by moving the centre of pressure forward","correct":false}]',
     '{"B1","B2"}'),

    (s10_id, 'What is "trim drag" and why does it arise?',
     '[{"id":"a","text":"The tailplane download acts like extra weight, so the wing must produce more lift and fly at a higher angle of attack, which increases drag","correct":true},{"id":"b","text":"The extra drag produced whenever the trim tab is deflected away from the neutral position","correct":false},{"id":"c","text":"The drag produced by the undercarriage while the aircraft is trimmed for the approach","correct":false}]',
     '{"B1","B2"}'),

    (s10_id, 'In level flight, W = CL x 1/2 rho V^2 x S. If weight and wing area are fixed, what must CL and dynamic pressure do?',
     '[{"id":"a","text":"Trade off against each other","correct":true},{"id":"b","text":"Both increase together in direct proportion","correct":false},{"id":"c","text":"Remain completely independent of one another","correct":false}]',
     '{"B1","B2"}'),

    (s10_id, 'At a constant weight and constant indicated airspeed, how does the angle of attack change with altitude?',
     '[{"id":"a","text":"It is the same at every altitude, since IAS is essentially a measure of dynamic pressure","correct":true},{"id":"b","text":"It increases with altitude, because air density falls","correct":false},{"id":"c","text":"It decreases with altitude, because true airspeed rises for a given IAS","correct":false}]',
     '{"B1","B2"}'),

    (s10_id, 'At a constant weight, what happens to angle of attack as indicated airspeed is increased?',
     '[{"id":"a","text":"Angle of attack must decrease","correct":true},{"id":"b","text":"Angle of attack must increase","correct":false},{"id":"c","text":"Angle of attack is unaffected by IAS changes","correct":false}]',
     '{"B1","B2"}'),

    (s10_id, 'Best L/D occurs at a fixed angle of attack of about 4 degrees. What does this mean for the indicated airspeed at which best L/D occurs, for a given weight?',
     '[{"id":"a","text":"It occurs at a fixed IAS for that weight","correct":true},{"id":"b","text":"It occurs at a fixed true airspeed regardless of weight","correct":false},{"id":"c","text":"It cannot be tied to any particular airspeed, since it depends only on altitude","correct":false}]',
     '{"B1","B2"}'),

    (s10_id, 'As fuel burns off during a flight and weight falls, what happens to the indicated airspeed for best L/D?',
     '[{"id":"a","text":"It falls as well, since best L/D always occurs at the same angle of attack for the current weight","correct":true},{"id":"b","text":"It rises, since a lighter aircraft needs more dynamic pressure to balance a smaller weight","correct":false},{"id":"c","text":"It stays exactly the same, since best L/D IAS is fixed for the airframe regardless of weight","correct":false}]',
     '{"B1","B2"}'),

    (s10_id, 'Thrust and drag act along lines roughly parallel to the longitudinal axis. How are they normally positioned relative to each other?',
     '[{"id":"a","text":"Usually offset from each other, which is what creates the thrust/drag couple","correct":true},{"id":"b","text":"Always coincident, acting along exactly the same line","correct":false},{"id":"c","text":"Always perpendicular to each other","correct":false}]',
     '{"B1","B2"}'),

    (s10_id, 'On a conventional aircraft, the tailplane load balancing the residual pitching moment is usually a download. What does this mean the wing must do?',
     '[{"id":"a","text":"Produce lift equal to weight plus that download","correct":true},{"id":"b","text":"Produce lift equal to weight minus that download","correct":false},{"id":"c","text":"Produce no additional lift, since the download is balanced by thrust alone","correct":false}]',
     '{"B1","B2"}'),

    -- ===================== M08.11 Climbing & Gliding =====================

    (s11_id, 'In a steady climb, how does lift compare with weight?',
     '[{"id":"a","text":"Lift is less than weight, since L = W cos(gamma)","correct":true},{"id":"b","text":"Lift is greater than weight, to accelerate the aircraft upward","correct":false},{"id":"c","text":"Lift always equals weight exactly, regardless of climb angle","correct":false}]',
     '{"B1","B2"}'),

    (s11_id, 'In the climb force equation T = D + W sin(gamma), what must the thrust additionally overcome compared with level flight?',
     '[{"id":"a","text":"It must overcome drag and also drag the weight up the slope of the climb","correct":true},{"id":"b","text":"It must overcome only the weight component, since drag is negligible in a climb","correct":false},{"id":"c","text":"It must overcome only drag, since weight acts entirely perpendicular to the flight path","correct":false}]',
     '{"B1","B2"}'),

    (s11_id, 'Up to about what climb angle is the error in simply assuming L = W considered small enough (under about 2%) to be often ignored?',
     '[{"id":"a","text":"About 15 degrees","correct":true},{"id":"b","text":"About 45 degrees","correct":false},{"id":"c","text":"About 5 degrees","correct":false}]',
     '{"B1","B2"}'),

    (s11_id, 'What does the best angle of climb speed (Vx) depend on, and what is it used for?',
     '[{"id":"a","text":"It occurs where excess thrust (thrust minus drag) is greatest, and is used to clear an obstacle","correct":true},{"id":"b","text":"It occurs where excess power is greatest, and is used to gain height quickly","correct":false},{"id":"c","text":"It occurs at the stalling speed, and is used only during an emergency descent","correct":false}]',
     '{"B1","B2"}'),

    (s11_id, 'What does the best rate of climb speed (Vy) depend on, and what is it used for?',
     '[{"id":"a","text":"It occurs where excess power (power available minus power required) is greatest, and is used to gain height quickly","correct":true},{"id":"b","text":"It occurs where excess thrust is greatest, and is used to clear an obstacle","correct":false},{"id":"c","text":"It occurs at maximum L/D, and is used to achieve the flattest glide","correct":false}]',
     '{"B1","B2"}'),

    (s11_id, 'According to sin(gamma) = (T - D) / W, what effect does increasing aircraft weight have on the angle of climb, and why?',
     '[{"id":"a","text":"It reduces the angle of climb, because the thrust/drag excess is divided by a larger weight, and drag has also increased","correct":true},{"id":"b","text":"It increases the angle of climb, because a heavier aircraft needs a steeper flight path to maintain lift","correct":false},{"id":"c","text":"It has no effect on the angle of climb, since angle of climb depends only on excess power","correct":false}]',
     '{"B1","B2"}'),

    (s11_id, 'As altitude increases, what happens to Vx and Vy, and what defines the absolute ceiling?',
     '[{"id":"a","text":"Both climb performances reduce and the two speeds converge; the absolute ceiling is where they meet and the excess is zero","correct":true},{"id":"b","text":"Both climb performances improve, since true airspeed for a given IAS increases with altitude","correct":false},{"id":"c","text":"Vx improves while Vy worsens, and the absolute ceiling is defined by Vy alone","correct":false}]',
     '{"B1","B2"}'),

    (s11_id, 'Why does a jet aircraft''s best angle of climb tend to occur near Vmd, while a propeller aircraft''s best angle of climb occurs at a slower speed?',
     '[{"id":"a","text":"A jet''s thrust is roughly constant with speed, whereas a propeller aircraft loses efficiency at both ends of its speed range, shaping the thrust/power curves differently","correct":true},{"id":"b","text":"A jet''s drag is roughly constant with speed, whereas a propeller aircraft''s drag rises sharply at low speed","correct":false},{"id":"c","text":"A propeller aircraft has no excess thrust available at any speed above the stall","correct":false}]',
     '{"B1","B2"}'),

    (s11_id, 'With no thrust available, what balances the weight of a gliding aircraft?',
     '[{"id":"a","text":"The resultant of lift and drag","correct":true},{"id":"b","text":"Lift alone, since drag is negligible without engine thrust","correct":false},{"id":"c","text":"The aircraft''s momentum, since no aerodynamic force is needed","correct":false}]',
     '{"B1","B2"}'),

    (s11_id, 'During a glide, where does the energy needed to overcome drag come from, and what is the consequence?',
     '[{"id":"a","text":"From the aircraft''s potential energy, which is why the aircraft descends","correct":true},{"id":"b","text":"From residual engine idle thrust, which is why some engine power is always required to glide","correct":false},{"id":"c","text":"From kinetic energy alone, which is why glides are always flown at decreasing airspeed","correct":false}]',
     '{"B1","B2"}'),

    (s11_id, 'What determines the glide angle of an aircraft, given that glide ratio = L/D and tan(gamma) = D/L?',
     '[{"id":"a","text":"The glide angle depends only on L/D; flying at the best L/D angle of attack gives the flattest glide","correct":true},{"id":"b","text":"The glide angle depends primarily on aircraft weight, with heavier aircraft gliding at a flatter angle","correct":false},{"id":"c","text":"The glide angle depends on indicated airspeed alone, regardless of angle of attack","correct":false}]',
     '{"B1","B2"}'),

    (s11_id, 'An aircraft with a glide ratio (L/D) of 15:1 can glide approximately how far from 1 nautical mile of height?',
     '[{"id":"a","text":"15 nm","correct":true},{"id":"b","text":"1 nm","correct":false},{"id":"c","text":"30 nm","correct":false}]',
     '{"B1","B2"}'),

    (s11_id, 'Why does increasing an aircraft''s weight not change its glide angle, but does change its glide speed?',
     '[{"id":"a","text":"All the forces scale together with weight, so the glide angle is unaffected, but a heavier aircraft must fly faster along the same flight path","correct":true},{"id":"b","text":"Increasing weight steepens the glide angle because more lift is needed at the same speed","correct":false},{"id":"c","text":"Increasing weight flattens the glide angle because L/D improves with weight","correct":false}]',
     '{"B1","B2"}'),

    (s11_id, 'As a rule of thumb, if an aircraft''s weight increases, by roughly what proportion should the glide EAS be adjusted?',
     '[{"id":"a","text":"By about half the percentage weight change","correct":true},{"id":"b","text":"By the same percentage as the weight change","correct":false},{"id":"c","text":"By double the percentage weight change","correct":false}]',
     '{"B1","B2"}'),

    (s11_id, 'How does minimum rate of descent (best glide endurance) differ from best glide range in terms of the speed and condition at which it occurs?',
     '[{"id":"a","text":"Minimum rate of descent is slower than best glide range speed and occurs at minimum power required, not minimum drag","correct":true},{"id":"b","text":"Minimum rate of descent is faster than best glide range speed and occurs at minimum drag","correct":false},{"id":"c","text":"Minimum rate of descent and best glide range always occur at exactly the same speed","correct":false}]',
     '{"B1","B2"}'),

    (s11_id, 'When gliding towards a landing point in a headwind, what is the recommended technique regarding airspeed, and why?',
     '[{"id":"a","text":"Increase the speed slightly, to the penetration speed, to reduce the time the wind acts on the aircraft","correct":true},{"id":"b","text":"Decrease the speed slightly, to extend the time spent in the air and cover more ground","correct":false},{"id":"c","text":"Airspeed should not be adjusted for wind, since wind never affects glide performance","correct":false}]',
     '{"B1","B2"}'),

    (s11_id, 'Why does wind not affect the best glide speed chosen for maximum endurance (time aloft) rather than range?',
     '[{"id":"a","text":"Because the landing point does not matter for an endurance glide, so ground speed made good is irrelevant","correct":true},{"id":"b","text":"Because wind speed is always negligible compared with glide speed at typical glide altitudes","correct":false},{"id":"c","text":"Because endurance glides are always flown directly into wind, cancelling its effect","correct":false}]',
     '{"B1","B2"}'),

    (s11_id, 'What effect does lowering flap or landing gear have during a glide?',
     '[{"id":"a","text":"It spoils L/D and steepens the glide","correct":true},{"id":"b","text":"It improves L/D and flattens the glide","correct":false},{"id":"c","text":"It has no effect on glide angle, only on glide speed","correct":false}]',
     '{"B1","B2"}'),

    -- ===================== M08.15 Lift Augmentation =====================

    (s15_id, 'Why does every high-lift device exist, in terms of its fundamental purpose?',
     '[{"id":"a","text":"To raise CLmax, so the aircraft can be flown more slowly and safely for take-off and landing","correct":true},{"id":"b","text":"To reduce induced drag at cruise speed, improving fuel efficiency","correct":false},{"id":"c","text":"To increase the critical Mach number of the wing","correct":false}]',
     '{"B1","B2"}'),

    (s15_id, 'What is the simplest type of trailing edge flap, and what is its main drawback?',
     '[{"id":"a","text":"The plain flap, which simply hinges the trailing edge down; it is the least effective and adds a lot of drag for the lift gained","correct":true},{"id":"b","text":"The Fowler flap, which moves aft on tracks; it is mechanically complex and rarely used","correct":false},{"id":"c","text":"The slotted flap, which opens a gap to the upper surface; it produces very little extra lift","correct":false}]',
     '{"B1","B2"}'),

    (s15_id, 'How does a split flap differ from a plain flap, and what is it best suited for?',
     '[{"id":"a","text":"Only the lower surface hinges down, giving more drag than a plain flap for a similar lift increase - useful for landing, poor for take-off","correct":true},{"id":"b","text":"Both upper and lower surfaces hinge down together, giving less drag than a plain flap for the same lift - good for take-off","correct":false},{"id":"c","text":"It moves aft on tracks as well as down, increasing wing area - ideal for take-off","correct":false}]',
     '{"B1","B2"}'),

    (s15_id, 'How does a slotted flap delay flow separation and allow a larger flap deflection to be used?',
     '[{"id":"a","text":"A gap opens between wing and flap, ducting high-energy air from below onto the flap''s upper surface, re-energising the boundary layer","correct":true},{"id":"b","text":"It reduces the flap''s camber so the adverse pressure gradient is smaller","correct":false},{"id":"c","text":"It increases the flap''s surface roughness, which trips the boundary layer into a more resistant turbulent state","correct":false}]',
     '{"B1","B2"}'),

    (s15_id, 'Why does the Fowler flap give the biggest CL increase of the common trailing edge flap types?',
     '[{"id":"a","text":"It moves aft on tracks as well as down, increasing both camber and wing area","correct":true},{"id":"b","text":"It is always fitted with vortex generators on its upper surface","correct":false},{"id":"c","text":"It is the only flap type that also raises the stalling angle of attack","correct":false}]',
     '{"B1","B2"}'),

    (s15_id, 'What is the effect of lowering trailing edge flap on the wing''s CL curve?',
     '[{"id":"a","text":"CLmax is raised, but the stalling angle of attack is lowered","correct":true},{"id":"b","text":"CLmax is raised, and the stalling angle of attack is also raised","correct":false},{"id":"c","text":"CLmax is unaffected, but the stalling angle of attack is lowered","correct":false}]',
     '{"B1","B2"}'),

    (s15_id, 'What is a Krueger flap, and where is it commonly found?',
     '[{"id":"a","text":"A leading edge device that hinges out and forward from under the leading edge, increasing camber and thickness; common on the inboard sections of swept-wing airliners","correct":true},{"id":"b","text":"A trailing edge device that hinges down and increases camber only; common on light aircraft","correct":false},{"id":"c","text":"A small auxiliary aerofoil that moves forward and down to form a slot ahead of the wing; common on gliders","correct":false}]',
     '{"B1","B2"}'),

    (s15_id, 'Why is leading edge droop, where the whole leading edge is mechanically lowered, relatively uncommon compared with other leading edge devices?',
     '[{"id":"a","text":"Although effective, it is mechanically complicated","correct":true},{"id":"b","text":"It provides almost no increase in CLmax compared with a fixed leading edge","correct":false},{"id":"c","text":"It cannot be retracted once deployed, making it unsuitable for cruise flight","correct":false}]',
     '{"B1","B2"}'),

    (s15_id, 'What is a leading edge slot, as distinct from a slat?',
     '[{"id":"a","text":"A fixed or opening gap just behind the leading edge which ducts high-pressure air from below onto the upper surface","correct":true},{"id":"b","text":"A small auxiliary aerofoil that physically moves forward and down to form a slot behind it","correct":false},{"id":"c","text":"A hinged panel on the underside of the wing that increases camber only","correct":false}]',
     '{"B1","B2"}'),

    (s15_id, 'A leading edge slat typically raises CLmax and the stalling angle by roughly how much?',
     '[{"id":"a","text":"CLmax by about 70%, and stalling angle by about 10 degrees","correct":true},{"id":"b","text":"CLmax by about 10%, and stalling angle by about 70 degrees","correct":false},{"id":"c","text":"CLmax by about 70%, but the stalling angle is unaffected","correct":false}]',
     '{"B1","B2"}'),

    (s15_id, 'What is the key distinction between the effect of trailing edge flaps and the effect of leading edge slats/slots on the CL curve?',
     '[{"id":"a","text":"Trailing edge flaps raise CLmax but lower the stalling angle, while leading edge slats and slots raise both CLmax and the stalling angle","correct":true},{"id":"b","text":"Trailing edge flaps raise both CLmax and stalling angle, while slats and slots raise CLmax but lower the stalling angle","correct":false},{"id":"c","text":"Both raise CLmax by the same amount, but only slats and slots have any effect on stalling angle","correct":false}]',
     '{"B1","B2"}'),

    (s15_id, 'In a combination of a slat and a slotted flap, how is the flap''s nose-down pitching moment managed?',
     '[{"id":"a","text":"It can be neutralised by the slat''s nose-up pitching moment","correct":true},{"id":"b","text":"It cannot be neutralised and must always be trimmed out using the tailplane","correct":false},{"id":"c","text":"It is neutralised by reducing wing area with the slat retracted","correct":false}]',
     '{"B1","B2"}'),

    (s15_id, 'What do boundary layer suction and boundary layer blowing have in common as forms of boundary layer control?',
     '[{"id":"a","text":"Both work by putting energy back into the boundary layer so it can survive the adverse pressure gradient","correct":true},{"id":"b","text":"Both work by physically deflecting the boundary layer away from the wing surface entirely","correct":false},{"id":"c","text":"Both work only at supersonic speeds, where the boundary layer would otherwise separate immediately","correct":false}]',
     '{"B1","B2"}'),

    (s15_id, 'How does boundary layer suction, as a form of boundary layer control, work?',
     '[{"id":"a","text":"It draws the tired boundary layer away through perforations in the surface so a fresh layer forms","correct":true},{"id":"b","text":"It injects high velocity air, often bled from the engine, into the boundary layer","correct":false},{"id":"c","text":"It mixes free-stream energy into the boundary layer using small vanes ahead of control surfaces","correct":false}]',
     '{"B1","B2"}'),

    (s15_id, 'What are vortex generators, and where are they usually mounted?',
     '[{"id":"a","text":"Small vanes that mix free-stream energy into the boundary layer, usually mounted ahead of control surfaces to keep them effective","correct":true},{"id":"b","text":"Perforated panels that draw the boundary layer away through suction, usually mounted at the wing root","correct":false},{"id":"c","text":"Ducts that inject engine bleed air into the boundary layer, usually mounted at the wingtip","correct":false}]',
     '{"B1","B2"}'),

    (s15_id, 'What job do boundary layer fences perform on a swept wing, and what alternative achieves the same aerodynamic effect without a physical fence?',
     '[{"id":"a","text":"They stop the boundary layer draining outboard along the wing; a leading edge notch or sawtooth extension does the same job aerodynamically","correct":true},{"id":"b","text":"They re-energise the boundary layer using engine bleed air; a slotted flap does the same job without a physical fence","correct":false},{"id":"c","text":"They increase CLmax at the wing root; a Krueger flap does the same job without a physical fence","correct":false}]',
     '{"B1","B2"}');

END $$;
