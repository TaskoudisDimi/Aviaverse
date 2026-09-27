-- Migration 105: Supplementary questions for Module 08 (Basic Aerodynamics) - part 2
-- Adds question rows to four EXISTING subjects (no changes to easa_subjects):
--   M08.5 Reynolds' Number   (source: study notes 8.2.7, lines 1294-1392)
--   M08.6 Lift                (source: study notes 8.2.11, lines 1592-1712)
--   M08.7 Aerofoils           (source: study notes 8.2.5/8.2.6, lines 1129-1293)
--   M08.8 Drag                (source: study notes 8.2.8/8.2.9/8.2.10, lines 1393-1591)
-- Source: Module_8_Basic_Aerodynamics_Study_Notes.txt (as line-ranged above), cross-checked
-- against Module_8_620_Questions_Answered.txt for topic coverage only (no flagged questions used).

DO $$
DECLARE
    s5_id INT; s6_id INT; s7_id INT; s8_id INT;
BEGIN
    SELECT id INTO s5_id FROM easa_subjects WHERE code = 'M08.5';
    SELECT id INTO s6_id FROM easa_subjects WHERE code = 'M08.6';
    SELECT id INTO s7_id FROM easa_subjects WHERE code = 'M08.7';
    SELECT id INTO s8_id FROM easa_subjects WHERE code = 'M08.8';

    IF EXISTS (
        SELECT 1 FROM questions
        WHERE subject_id = s5_id
        AND text LIKE '%region where the flow is below 99% of free stream velocity%'
    ) THEN
        RAISE NOTICE 'M08 part 2 supplement already seeded, skipping.';
        RETURN;
    END IF;

    -- ============================================================
    -- M08.5 Reynolds' Number (boundary layer, laminar/turbulent, transition, Re formula)
    -- ============================================================
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES
    (s5_id, 'How is the boundary layer defined?',
     '[{"id":"a","text":"The region close to the surface where the flow is below 99% of free stream velocity","correct":true},{"id":"b","text":"The region where the flow is turbulent rather than laminar","correct":false},{"id":"c","text":"The region between the transition point and the trailing edge","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'Which of the following correctly describes laminar flow within the boundary layer?',
     '[{"id":"a","text":"Smooth and layered, with no mixing between layers","correct":true},{"id":"b","text":"Mixed and eddying, with continuous exchange between layers","correct":false},{"id":"c","text":"Present only above the transition point, never ahead of it","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'Comparing typical boundary layer depths, which statement is correct?',
     '[{"id":"a","text":"A turbulent boundary layer is typically about ten times deeper than a laminar one (around 0.70 in versus 0.07 in)","correct":true},{"id":"b","text":"A laminar boundary layer is typically deeper than a turbulent one","correct":false},{"id":"c","text":"Laminar and turbulent boundary layers are typically the same depth","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'How does the velocity gradient at the skin compare between a laminar and a turbulent boundary layer?',
     '[{"id":"a","text":"Gentle for laminar flow, steep for turbulent flow","correct":true},{"id":"b","text":"Steep for laminar flow, gentle for turbulent flow","correct":false},{"id":"c","text":"The velocity gradient at the skin is the same for both","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'Which type of boundary layer flow produces lower skin friction drag?',
     '[{"id":"a","text":"Laminar flow","correct":true},{"id":"b","text":"Turbulent flow","correct":false},{"id":"c","text":"Skin friction drag does not depend on whether the flow is laminar or turbulent","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'Why does a turbulent boundary layer resist flow separation better than a laminar one, despite causing more skin friction drag?',
     '[{"id":"a","text":"It carries more energy near the surface than a laminar boundary layer","correct":true},{"id":"b","text":"It is thinner than a laminar boundary layer, so it separates less easily","correct":false},{"id":"c","text":"It has zero velocity gradient at the skin, so it cannot separate","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'What is the "transition point" on an aerofoil surface?',
     '[{"id":"a","text":"The point where the boundary layer changes from laminar to turbulent","correct":true},{"id":"b","text":"The point where the boundary layer separates from the surface","correct":false},{"id":"c","text":"The point of minimum pressure on the lower surface","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'What tends to move the transition point on an aerofoil forward?',
     '[{"id":"a","text":"An increase in speed, size, or surface roughness","correct":true},{"id":"b","text":"A decrease in speed, size, or surface roughness","correct":false},{"id":"c","text":"The transition point is fixed and does not move with speed, size, or roughness","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'Why are vortex generators deliberately used to trip the boundary layer turbulent ahead of control surfaces?',
     '[{"id":"a","text":"The resulting turbulent layer carries more energy near the surface, so a little extra drag is accepted in exchange for keeping the flow attached","correct":true},{"id":"b","text":"Turbulent flow always produces less skin friction drag than laminar flow, so it is preferred everywhere","correct":false},{"id":"c","text":"They move the transition point aft, extending the area of laminar flow","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'How does a laminar flow wing design reduce skin friction drag compared to a conventional wing?',
     '[{"id":"a","text":"By moving the point of maximum thickness aft, which moves the transition point aft as well, so more of the wing runs laminar","correct":true},{"id":"b","text":"By moving the point of maximum thickness forward, so the boundary layer transitions to turbulent sooner","correct":false},{"id":"c","text":"By increasing surface roughness to delay transition","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'What is the main operational drawback of laminar flow wing sections?',
     '[{"id":"a","text":"They are very sensitive to surface finish, insects and damage, and tend to stall more sharply","correct":true},{"id":"b","text":"They always produce more induced drag than conventional sections","correct":false},{"id":"c","text":"They cannot be used on aircraft that fly above the transonic region","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'According to Reynolds, what determines whether flow changes from streamlined to turbulent?',
     '[{"id":"a","text":"Not speed alone, but the combination of density, velocity, size and viscosity","correct":true},{"id":"b","text":"Speed alone, independent of the size of the body or the fluid''s viscosity","correct":false},{"id":"c","text":"Surface temperature alone","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'How is Reynolds number (Re) calculated?',
     '[{"id":"a","text":"Re = (density x velocity x size) / viscosity","correct":true},{"id":"b","text":"Re = (viscosity x size) / (density x velocity)","correct":false},{"id":"c","text":"Re = density x viscosity x velocity x size","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'For a scale model in a wind tunnel to behave aerodynamically like the full-size aircraft, what condition must be met?',
     '[{"id":"a","text":"The Reynolds number of the model test must match that of the full-size aircraft","correct":true},{"id":"b","text":"The model must be tested at exactly the same airspeed as the full-size aircraft","correct":false},{"id":"c","text":"The model must be built from the same material as the full-size aircraft","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'A 1/10 scale wind tunnel model would need about ten times the airspeed of the full-size aircraft to match Reynolds number directly. How do wind tunnels avoid this impractical speed requirement?',
     '[{"id":"a","text":"By pressurising the tunnel, which raises density and so raises Re without needing to raise speed or change viscosity","correct":true},{"id":"b","text":"By heating the tunnel air, which lowers viscosity enough to match Re at low speed","correct":false},{"id":"c","text":"By using a larger model instead, which removes the need to match Reynolds number at all","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'In the Reynolds number formula, what effect does raising the density of the air have on Re, all else being equal?',
     '[{"id":"a","text":"It raises Re","correct":true},{"id":"b","text":"It lowers Re","correct":false},{"id":"c","text":"It has no effect on Re, since Re depends only on velocity and size","correct":false}]',
     '{"B1","B2"}');

    -- ============================================================
    -- M08.6 Lift (pressure distribution, lift equation, CL/CD/L-D, centre of pressure)
    -- ============================================================
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES
    (s6_id, 'Following the upper surface of an aerofoil at a small angle of attack from the leading edge, what is found at the leading edge itself?',
     '[{"id":"a","text":"The stagnation point, with full pressure","correct":true},{"id":"b","text":"The suction peak, with minimum pressure","correct":false},{"id":"c","text":"The point of maximum camber","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'Moving aft from the leading edge along the upper surface at a small angle of attack, where does pressure typically reach a minimum?',
     '[{"id":"a","text":"Somewhere around a third of the chord back from the leading edge","correct":true},{"id":"b","text":"Exactly at the trailing edge","correct":false},{"id":"c","text":"Exactly at the leading edge, at the stagnation point","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'What is meant by the "adverse pressure gradient" on the aft part of an aerofoil''s upper surface?',
     '[{"id":"a","text":"The flow moving from a region of low pressure back up towards higher pressure near the trailing edge, using only its own kinetic energy","correct":true},{"id":"b","text":"The pressure rising sharply at the leading edge stagnation point","correct":false},{"id":"c","text":"The pressure gradient that forms on the lower surface only, never on the upper surface","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'Why is the lower surface of an aerofoil normally given much less curvature than the upper surface?',
     '[{"id":"a","text":"Because even the slight curvature on the lower surface forms a small venturi that drops pressure a little; more curvature would reduce the pressure difference the aerofoil relies on for lift","correct":true},{"id":"b","text":"Because the lower surface must remain perfectly flat to prevent boundary layer separation","correct":false},{"id":"c","text":"Because curvature on the lower surface would eliminate the stagnation point","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'What happens to the suction peak on the upper surface as angle of attack is increased?',
     '[{"id":"a","text":"It grows taller and moves forward","correct":true},{"id":"b","text":"It shrinks and moves aft","correct":false},{"id":"c","text":"It remains unchanged in height and position","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'As angle of attack increases and the suction peak grows and moves forward, what happens to the adverse pressure gradient behind it?',
     '[{"id":"a","text":"It becomes both longer and steeper","correct":true},{"id":"b","text":"It becomes shorter and shallower","correct":false},{"id":"c","text":"It disappears entirely","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'What does the lift equation state?',
     '[{"id":"a","text":"L = CL x 1/2 rho V^2 x S","correct":true},{"id":"b","text":"L = CD x 1/2 rho V^2 x S","correct":false},{"id":"c","text":"L = CL x rho x V x S","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'In the lift equation, what does the lift coefficient CL represent?',
     '[{"id":"a","text":"The shape of the aerofoil and its angle of attack, with everything else in the equation being dynamic pressure and wing area","correct":true},{"id":"b","text":"The dynamic pressure acting on the wing","correct":false},{"id":"c","text":"The wing area alone","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'How does CL vary with angle of attack (alpha) up to about 15 degrees, and what happens beyond that?',
     '[{"id":"a","text":"CL rises almost linearly with alpha up to about 15 degrees, then falls away sharply at the stall","correct":true},{"id":"b","text":"CL falls linearly with alpha up to 15 degrees, then rises sharply at the stall","correct":false},{"id":"c","text":"CL remains constant with alpha until the stall, then rises sharply","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'How does the CL at zero angle of attack differ between a cambered aerofoil section and a symmetrical one?',
     '[{"id":"a","text":"A cambered section gives a positive CL at zero alpha, while a symmetrical one gives zero","correct":true},{"id":"b","text":"Both give zero CL at zero alpha","correct":false},{"id":"c","text":"A symmetrical section gives a positive CL at zero alpha, while a cambered one gives zero","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'What effect does increasing an aerofoil''s camber have on its CL curve?',
     '[{"id":"a","text":"It gives a higher CL curve overall","correct":true},{"id":"b","text":"It gives a lower CL curve overall","correct":false},{"id":"c","text":"Camber has no effect on the CL curve, only on CD","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'At approximately what angle of attack does the lift-to-drag (L/D) ratio typically peak, and what is this angle called?',
     '[{"id":"a","text":"About 4 degrees, known as the optimum angle of attack","correct":true},{"id":"b","text":"About 15 degrees, known as the critical angle of attack","correct":false},{"id":"c","text":"0 degrees, known as the zero-lift angle","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'At the optimum angle of attack where L/D peaks, roughly how many times greater is lift than drag, and how does this compare with the ratio at the stalling angle?',
     '[{"id":"a","text":"Roughly 24 times at the optimum angle of attack, falling to about 10-12 times at the stalling angle","correct":true},{"id":"b","text":"Roughly 4 times at the optimum angle of attack, rising to about 24 times at the stalling angle","correct":false},{"id":"c","text":"The L/D ratio is the same at both the optimum angle of attack and the stalling angle","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'What is the centre of pressure of an aerofoil?',
     '[{"id":"a","text":"The point on the chord through which the total lift can be considered to act; it sits under the suction peak","correct":true},{"id":"b","text":"The point on the chord where the boundary layer transitions from laminar to turbulent","correct":false},{"id":"c","text":"A fixed point near quarter chord that never moves with angle of attack","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'How does the centre of pressure move as angle of attack is increased towards the stall?',
     '[{"id":"a","text":"It moves forward, reaching its most forward point just below the stalling angle","correct":true},{"id":"b","text":"It moves aft, reaching its most aft point just below the stalling angle","correct":false},{"id":"c","text":"It remains stationary until the stalling angle is reached","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'What happens to the centre of pressure at the stall, and why is this significant?',
     '[{"id":"a","text":"It moves sharply rearward, which is one reason a stall gives a nose-down pitch","correct":true},{"id":"b","text":"It moves sharply forward, which is one reason a stall gives a nose-up pitch","correct":false},{"id":"c","text":"It stays fixed at the stall, so pitch is unaffected","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'Why do engineers prefer to use the aerodynamic centre rather than the centre of pressure for calculations?',
     '[{"id":"a","text":"The aerodynamic centre is a point, usually near quarter chord, about which the pitching moment does not change with angle of attack","correct":true},{"id":"b","text":"The aerodynamic centre always coincides exactly with the centre of pressure at every angle of attack","correct":false},{"id":"c","text":"The aerodynamic centre is located at the trailing edge, making it easier to measure","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'As angle of attack increases, what happens to the stagnation point on the aerofoil?',
     '[{"id":"a","text":"It moves down and aft","correct":true},{"id":"b","text":"It moves up and forward","correct":false},{"id":"c","text":"It remains fixed at the leading edge","correct":false}]',
     '{"B1","B2"}');

    -- ============================================================
    -- M08.7 Aerofoils (geometry vocabulary + wing geometry/planform/sweep)
    -- ============================================================
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES
    (s7_id, 'What is the "chord line" of an aerofoil, and what is it used for?',
     '[{"id":"a","text":"The straight line from the leading edge to the trailing edge; it is the datum for measuring angles","correct":true},{"id":"b","text":"The line running halfway between the upper and lower surfaces","correct":false},{"id":"c","text":"The line joining the points of maximum thickness on the upper and lower surfaces","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, 'What distinguishes a cambered aerofoil from a symmetrical one?',
     '[{"id":"a","text":"A cambered aerofoil has a curved mean camber line; a symmetrical aerofoil has a mean camber line that lies on the chord line","correct":true},{"id":"b","text":"A cambered aerofoil has a straight chord line; a symmetrical aerofoil has a curved chord line","correct":false},{"id":"c","text":"Camber refers only to wing planform shape, not to the aerofoil cross-section","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, 'How are an aerofoil''s maximum camber and maximum thickness, and their chordwise positions, normally quoted?',
     '[{"id":"a","text":"As percentages of chord","correct":true},{"id":"b","text":"As absolute lengths in inches only","correct":false},{"id":"c","text":"As angles measured from the chord line","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, 'How does leading edge radius affect an aerofoil''s stalling and speed characteristics?',
     '[{"id":"a","text":"A blunt (larger radius) leading edge stalls more gently, while a sharp leading edge is better suited to high speed","correct":true},{"id":"b","text":"A blunt leading edge stalls more sharply, while a sharp leading edge stalls more gently","correct":false},{"id":"c","text":"Leading edge radius affects only camber, not stalling behaviour or speed suitability","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, 'What is "fineness ratio", and what does it indicate?',
     '[{"id":"a","text":"The inverse of thickness/chord ratio (chord divided by thickness); it is a measure of streamlining","correct":true},{"id":"b","text":"Maximum thickness expressed as a percentage of chord; it indicates structural strength","correct":false},{"id":"c","text":"The ratio of span to chord; it indicates induced drag","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, 'How is angle of attack (alpha) defined?',
     '[{"id":"a","text":"The angle between the chord line and the relative airflow","correct":true},{"id":"b","text":"The angle between the chord line and the horizon","correct":false},{"id":"c","text":"The fixed rigging angle between the chord line and the fuselage datum","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, 'How does angle of incidence differ from angle of attack?',
     '[{"id":"a","text":"Angle of incidence is the fixed rigging angle between the chord line and the fuselage datum, and it does not change in flight, unlike angle of attack","correct":true},{"id":"b","text":"Angle of incidence is the angle between the chord line and the relative airflow, and it changes constantly in flight","correct":false},{"id":"c","text":"Angle of incidence and angle of attack are simply two names for the same angle","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, 'How does a cambered aerofoil section behave at zero and small negative angles of attack, compared with a symmetrical section?',
     '[{"id":"a","text":"A cambered section still produces lift at zero alpha and even at small negative angles, while a symmetrical section produces no lift at zero alpha","correct":true},{"id":"b","text":"Neither a cambered nor a symmetrical section produces any lift at zero angle of attack","correct":false},{"id":"c","text":"A symmetrical section produces lift at zero alpha, while a cambered section does not","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, 'Why do symmetrical aerofoil sections suit helicopter rotor blades particularly well?',
     '[{"id":"a","text":"Symmetrical sections have almost no centre of pressure travel with changing angle of attack","correct":true},{"id":"b","text":"Symmetrical sections always produce more lift than cambered sections at every angle of attack","correct":false},{"id":"c","text":"Symmetrical sections eliminate profile drag entirely","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, 'How is a wing''s mean chord calculated?',
     '[{"id":"a","text":"Wing area divided by span","correct":true},{"id":"b","text":"Span divided by wing area","correct":false},{"id":"c","text":"Root chord plus tip chord, divided by two","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, 'How is a wing''s aspect ratio calculated?',
     '[{"id":"a","text":"Span divided by mean chord (equivalently, span squared divided by wing area)","correct":true},{"id":"b","text":"Wing area divided by span","correct":false},{"id":"c","text":"Root chord divided by tip chord","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, 'How is a wing''s taper ratio defined?',
     '[{"id":"a","text":"Root chord divided by tip chord","correct":true},{"id":"b","text":"Tip chord divided by root chord","correct":false},{"id":"c","text":"Span divided by root chord","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, 'What is "wash-out" in wing design, and what benefit does it provide?',
     '[{"id":"a","text":"A built-in twist that reduces incidence from root to tip; it improves stall behaviour and stability, and is common","correct":true},{"id":"b","text":"A built-in twist that increases incidence towards the tip; it improves stall behaviour and is common","correct":false},{"id":"c","text":"A reduction in wing thickness from root to tip, used to save structural weight","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, 'Why is "wash-in" (incidence increasing towards the tip) rarely used on wings?',
     '[{"id":"a","text":"It reduces stability","correct":true},{"id":"b","text":"It increases induced drag beyond acceptable limits at every speed","correct":false},{"id":"c","text":"It is structurally impossible to build into a wing","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, 'What is the key aerodynamic advantage of an elliptical wing planform, and what is its main practical drawback?',
     '[{"id":"a","text":"It gives even lift distribution and the least induced drag, but is expensive to build","correct":true},{"id":"b","text":"It is the cheapest and simplest planform to build, but produces the most induced drag","correct":false},{"id":"c","text":"It has the highest aspect ratio of any planform, but is structurally the weakest","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, 'What was reverse-tapered (widening towards the tip) planform experimentally tried to cure, despite being structurally poor?',
     '[{"id":"a","text":"Swept-wing tip stall","correct":true},{"id":"b","text":"Excessive induced drag on constant-chord wings","correct":false},{"id":"c","text":"Aeroelastic divergence on forward-swept wings","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, 'Why do swept-back wings give lower drag at transonic speeds?',
     '[{"id":"a","text":"Because only the component of flow perpendicular to the leading edge matters aerodynamically","correct":true},{"id":"b","text":"Because sweep increases the effective aspect ratio of the wing","correct":false},{"id":"c","text":"Because sweep eliminates the tip vortex entirely","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, 'Why are forward-swept wings rare, despite sharing the transonic drag benefit of swept-back wings and avoiding tip stall?',
     '[{"id":"a","text":"They are far more prone to aeroelastic divergence, requiring much greater structural stiffness","correct":true},{"id":"b","text":"They cannot be built with any dihedral or anhedral","correct":false},{"id":"c","text":"They always produce more induced drag than an equivalent swept-back wing","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, 'What does a variable-sweep ("swing wing") design allow an aircraft to change in flight?',
     '[{"id":"a","text":"Its aspect ratio, by sweeping both wings together","correct":true},{"id":"b","text":"Its wing area only, with sweep angle remaining fixed","correct":false},{"id":"c","text":"Its dihedral angle only","correct":false}]',
     '{"B1","B2"}');

    -- ============================================================
    -- M08.8 Drag (profile drag group, drag equation, induced drag, total drag curve, wave drag)
    -- ============================================================
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES
    (s8_id, 'How do profile drag and induced drag behave differently as speed changes?',
     '[{"id":"a","text":"Profile drag grows with the square of speed, while induced drag falls with the square of speed","correct":true},{"id":"b","text":"Profile drag falls with the square of speed, while induced drag grows with the square of speed","correct":false},{"id":"c","text":"Both profile drag and induced drag grow with the square of speed","correct":false}]',
     '{"B1","B2"}'),

    (s8_id, 'What is "profile drag" (called parasite drag in the USA)?',
     '[{"id":"a","text":"The drag the aircraft would have with no lift at all","correct":true},{"id":"b","text":"The drag produced only as a by-product of generating lift","correct":false},{"id":"c","text":"The drag produced solely by the tip vortices","correct":false}]',
     '{"B1","B2"}'),

    (s8_id, 'What does skin friction drag depend on?',
     '[{"id":"a","text":"The wetted area, the surface finish, and how much of the surface is running laminar rather than turbulent","correct":true},{"id":"b","text":"The angle of attack alone","correct":false},{"id":"c","text":"The aspect ratio of the wing alone","correct":false}]',
     '{"B1","B2"}'),

    (s8_id, 'Using a flat plate held square-on to the flow as the extreme example, what causes form (pressure) drag?',
     '[{"id":"a","text":"High pressure where air is brought to rest at the front, and low pressure in the vortices behind, dragging the plate downstream","correct":true},{"id":"b","text":"Friction between the plate surface and the adjacent air layer only","correct":false},{"id":"c","text":"Interference between the plate''s boundary layer and that of an adjoining surface","correct":false}]',
     '{"B1","B2"}'),

    (s8_id, 'How does streamlining reduce form (pressure) drag?',
     '[{"id":"a","text":"It lets the air close in gently behind the body instead of tearing away, so fewer vortices form and the pressure difference collapses","correct":true},{"id":"b","text":"It increases the wetted area so that skin friction cancels out pressure drag","correct":false},{"id":"c","text":"It moves the transition point aft to keep the flow laminar over the whole body","correct":false}]',
     '{"B1","B2"}'),

    (s8_id, 'According to the typical drag coefficients given, which body shape has the lowest drag coefficient?',
     '[{"id":"a","text":"A well-streamlined section, at about 0.04","correct":true},{"id":"b","text":"A cylinder, at about 0.47","correct":false},{"id":"c","text":"A flat plate square-on to the flow, at about 0.6 to 1.2","correct":false}]',
     '{"B1","B2"}'),

    (s8_id, 'What is the practical limit on how far streamlining can be taken to reduce form drag?',
     '[{"id":"a","text":"A very high fineness ratio gives a section too thin to build","correct":true},{"id":"b","text":"Streamlining below a drag coefficient of 0.47 is aerodynamically impossible","correct":false},{"id":"c","text":"Streamlining always increases skin friction drag beyond an acceptable level","correct":false}]',
     '{"B1","B2"}'),

    (s8_id, 'What causes interference drag, and how is it reduced?',
     '[{"id":"a","text":"Boundary layers from two surfaces meeting, such as at a wing/fuselage or nacelle/pylon junction, interfere and generate more drag than either surface alone; fairings and fillets are the cure","correct":true},{"id":"b","text":"The boundary layer changing from laminar to turbulent; it is reduced by roughening the surface","correct":false},{"id":"c","text":"The formation of the wingtip vortex; it is reduced by fitting winglets","correct":false}]',
     '{"B1","B2"}'),

    (s8_id, 'What does the drag equation state, and what does the drag coefficient CD represent?',
     '[{"id":"a","text":"D = CD x 1/2 rho V^2 x S; CD is the experimental number carrying all the information about shape and its vortex system","correct":true},{"id":"b","text":"D = CL x 1/2 rho V^2 x S; CD is simply another name for wing area","correct":false},{"id":"c","text":"D = CD x rho x V x S; CD represents dynamic pressure alone","correct":false}]',
     '{"B1","B2"}'),

    (s8_id, 'What causes the wingtip vortex?',
     '[{"id":"a","text":"Air spilling round the wingtip from the high-pressure region below to the low-pressure region above, taking up a rotary motion","correct":true},{"id":"b","text":"Interference between the boundary layer and a nearby fuselage panel","correct":false},{"id":"c","text":"The transition of the boundary layer from laminar to turbulent near the tip","correct":false}]',
     '{"B1","B2"}'),

    (s8_id, 'How does downwash lead to induced drag?',
     '[{"id":"a","text":"The wing''s total aerodynamic reaction is perpendicular to the average of the flow before and after the wing; more downwash tilts that reaction further rearward, and the rearward component is induced drag","correct":true},{"id":"b","text":"Downwash increases skin friction drag directly, which is classified as induced drag","correct":false},{"id":"c","text":"Downwash has no aerodynamic effect on drag, only on tailplane loading","correct":false}]',
     '{"B1","B2"}'),

    (s8_id, 'How is induced drag related to lift and to speed?',
     '[{"id":"a","text":"Induced drag is proportional to lift squared and inversely proportional to speed squared","correct":true},{"id":"b","text":"Induced drag is proportional to speed squared and inversely proportional to lift squared","correct":false},{"id":"c","text":"Induced drag is independent of both lift and speed","correct":false}]',
     '{"B1","B2"}'),

    (s8_id, 'How does induced drag change as aspect ratio increases, and why?',
     '[{"id":"a","text":"It falls, because a long span with a short tip chord makes a weaker tip vortex","correct":true},{"id":"b","text":"It rises, because a longer span sheds a stronger tip vortex","correct":false},{"id":"c","text":"It is unaffected by aspect ratio, since induced drag depends only on lift and speed","correct":false}]',
     '{"B1","B2"}'),

    (s8_id, 'How do winglets reduce induced drag?',
     '[{"id":"a","text":"By weakening the tip vortex","correct":true},{"id":"b","text":"By increasing the wing''s wetted area to reduce skin friction","correct":false},{"id":"c","text":"By delaying the transition point on the upper surface","correct":false}]',
     '{"B1","B2"}'),

    (s8_id, 'At the minimum drag speed (Vmd), what is true of induced drag and profile drag?',
     '[{"id":"a","text":"They are exactly equal, and total drag is twice either one","correct":true},{"id":"b","text":"Induced drag is zero and all drag is profile drag","correct":false},{"id":"c","text":"Profile drag is zero and all drag is induced drag","correct":false}]',
     '{"B1","B2"}'),

    (s8_id, 'For a given aircraft weight, how does Vmd vary with altitude?',
     '[{"id":"a","text":"Vmd is a constant indicated airspeed at all altitudes","correct":true},{"id":"b","text":"Vmd (IAS) increases steadily with altitude","correct":false},{"id":"c","text":"Vmd (IAS) decreases steadily with altitude","correct":false}]',
     '{"B1","B2"}'),

    (s8_id, 'What happens to Vmd, and to the whole drag curve, when aircraft weight is increased?',
     '[{"id":"a","text":"Vmd increases and the whole drag curve is raised","correct":true},{"id":"b","text":"Vmd decreases and the whole drag curve is lowered","correct":false},{"id":"c","text":"Vmd and the drag curve are unaffected by weight, since Vmd depends only on aspect ratio","correct":false}]',
     '{"B1","B2"}'),

    (s8_id, 'Why does flying below Vmd, "on the back of the drag curve", create a handling problem, particularly for a heavy jet on approach?',
     '[{"id":"a","text":"A small speed loss increases drag further, causing more speed loss and more drag, a problem worsened by slow engine spool-up","correct":true},{"id":"b","text":"Below Vmd the aircraft automatically becomes speed-stable, which pilots find counter-intuitive","correct":false},{"id":"c","text":"Below Vmd, induced drag drops to zero, removing the pilot''s ability to control speed with pitch","correct":false}]',
     '{"B1","B2"}'),

    (s8_id, 'What is "wave drag", and where does it appear on the total drag curve?',
     '[{"id":"a","text":"A new drag added by compressibility past a certain Mach number, which pushes the right-hand side of the total drag curve sharply upwards","correct":true},{"id":"b","text":"The drag caused by the wingtip vortex, which appears at the bottom of the total drag curve","correct":false},{"id":"c","text":"Another name for induced drag, appearing on the left-hand side of the total drag curve at low speed","correct":false}]',
     '{"B1","B2"}');

END $$;
