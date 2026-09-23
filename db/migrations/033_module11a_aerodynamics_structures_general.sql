-- Module 11A: Aeroplane Structures and Systems (B1-only) — Aeroplane Aerodynamics and Flight
-- Controls, Airframe Structures - General Concepts
-- Source: EASA Part-66 Module 11A official textbook (IKAROS Aviation Training Centre, Turbine
-- Aeroplane, Issue 1 - May 2012). Source title page: "Part 66 Module 11A for B1" — this module
-- is B1-only content, not common to B2.

DO $$
DECLARE
    m11_id INT;
    s1_id  INT;
    s2_id  INT;
BEGIN
    SELECT id INTO m11_id FROM easa_modules WHERE code = 'M11';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M11A.1') THEN
        RAISE NOTICE 'M11A.1-M11A.2 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 11A.1: Aeroplane Aerodynamics and Flight Controls
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m11_id, 'M11A.1', 'Aeroplane Aerodynamics and Flight Controls',
        $cnt$
# Aeroplane Aerodynamics and Flight Controls

## Introduction

An aircraft is equipped with fixed and moveable surfaces, or aerofoils, which provide stability and control. Each item is designed for a specific function during the operation of the aircraft.

## Fixed Aerofoils

The fixed aerofoils are the wings or mainplanes, the horizontal stabiliser or tailplane, and the vertical stabiliser or fin. The function of the wings is to provide enough lift to support the complete aircraft. The tail section of a conventional aircraft, including the stabilisers, elevators and rudder, is occasionally known as the **empennage**.

### Horizontal Stabiliser

The horizontal stabiliser provides longitudinal pitch stability and is usually attached to the aft portion of the fuselage. It may be mounted on top of the vertical stabiliser, at some mid-point, or below it. Conventional horizontal stabilisers are placed aft of the wing and normally set at a slightly smaller or negative angle of incidence relative to the wing chord line, giving a small downward force on the tail whose value depends on the size of the stabiliser and its distance from the Centre of Gravity (CG).

### T-Tail Arrangement

The T-Tail arrangement places the complete stabiliser/tailplane and elevator assembly on top of the vertical stabiliser. This ensures pitch control is not affected by turbulent air from the wing, and also makes the vertical stabiliser and rudder more effective due to the **"end plate effect"**.

A T-Tail (and rear engine) configuration would be dangerous if the aircraft entered a **"deep stall"**: at a very high angle of attack, airflow could make pitch control non-effective (and may cause the engines to flame out). To prevent this, T-Tailed aircraft have a **"stick push"** system to automatically recover them from excessive angles of attack.

The T-Tail's empennage structure is heavier than normal, due to strengthening required against greater bending loads. However, since the pitch moment arm is increased, the stabiliser and elevators can be made smaller and lighter than conventional designs. Often, the complete stabiliser can be moved to provide longitudinal trim, avoiding the need for trim tabs.

### Vertical Stabiliser

The vertical stabiliser is the aerofoil forward of the rudder, used to provide directional stability. On single-engined propeller aircraft, the propeller causes the airflow to rotate as it travels rearward, striking one side of the vertical stabiliser more than the other and producing a yawing moment. Such aircraft may have the leading edge of the stabiliser offset slightly to counter this yaw.

## Moveable Control Surfaces

Moveable control surfaces are normally divided into **Primary** and **Secondary** controls.

- **Primary controls**: elevators, rudder, ailerons and roll spoilers.
- **Secondary controls**: trim controls (tabs), high lift devices (flaps and slats), speed brakes and lift dumpers (additional spoilers).

Note: Traditionally spoilers have not been included as primary controls, but those which operate in conjunction with the ailerons during roll are considered primary in the JAR 66 syllabus.

Primary control surfaces make the aircraft follow the correct flight path and execute manoeuvres. Secondary controls change the lift and drag characteristics of the aircraft or assist the primary controls.

### Roll Control — Ailerons

Primary controls providing lateral (roll) control about the longitudinal axis. Normally hinged at the trailing edge of the wing near the wingtip, ailerons move in opposite directions: the up-going aileron reduces lift on its side (wing goes down), while the down-going aileron increases lift on the opposite side (wing goes up).

Large aircraft often use two sets of ailerons per wing — one near the wingtip and another at mid-span or outboard of the flaps. The inboard set is called **"high speed ailerons"**. The outboard surfaces (or both sets) work at low speed for maximum control during take-off and landing. At high cruising speed, the outer ailerons are isolated and only the inboard set operates. If outer ailerons operated at high speed, the stress at the wingtips could twist the wing and produce **"aileron reversal"** — particularly likely with modern flexible thin wings.

Ailerons are operated by a control wheel, control column, or side-stick, and are usually operated with the rudder and/or elevator during a turn. A **co-ordinated turn** occurs without slip or skid: too little bank causes the aircraft to skid outwards, too much bank causes it to slip downwards.

### Roll Control — Spoilers

Used as a primary control, spoilers operate asymmetrically in conjunction with aileron movement and are called **Roll Spoilers**, mounted on top of the wing just inboard of the outboard ailerons. Aileron control wheel movement deploys each spoiler progressively upwards with the up-going aileron, via a spoiler/aileron mixer unit — spoiling lift on the down-going wing and augmenting the up-going aileron's effect. On some aircraft, spoilers replace ailerons completely as the sole means of roll control.

### Pitch Control — Elevators

Control surfaces governing movement in pitch about the lateral axis, normally attached to hinges on the rear spar of the horizontal stabiliser. Pushing the control column forward moves the elevators down; the resultant upward lift force raises the tail and lowers the nose. The reverse happens when the control is pulled back.

### Pitch Control — Stabilators

A **stabilator** (also called a slab or all-flying tailplane) combines the functions of the elevator and horizontal stabiliser — a complete all-moving horizontal stabiliser that changes its angle of attack when the control column is moved, altering the total lift generated by the tail.

### Pitch Control — Variable Incidence Stabilisers

Used with a conventional elevator control system, often for pitch trim. A powerful electric motor varies the stabiliser's angle of attack when flight deck trim switches are operated.

### Canards

Some early powered aircraft, such as the Wright Flyer, had horizontal surfaces located ahead of the wings — a configuration with the forward surface referred to as a **canard** or foreplane. Conventional aircraft have the tailplane at the rear providing a small stabilising down force, meaning the wing must produce slightly more lift (and thus more drag) to balance it. With the tailplane at the front, the stabilising force is directed upwards, contributing to total lift and reducing drag.

A fundamental feature of canard design is that the angle of attack of the foreplane (ahead of the CG) is set greater than the main wing, ensuring the foreplane reaches its stalling angle first — a predictable nose drop and certain recovery. Stall sensing systems can also be triggered just before the foreplane reaches its critical angle of attack.

### Yaw Control — Rudder

A vertical control surface hinged at the rear of the fin, designed to apply yawing moments about the vertical axis, controlled by rudder pedals. Pushing the right pedal moves the rudder right, generating a sideways 'lifting' force to the left, turning the nose right. Rudder systems, particularly assisted systems, may have their range reduced at high speed by a speed-sensitive range limiting system. On large transport aircraft the rudder may comprise two or more operational segments moved by different operating systems for redundancy.

### Combined-Function Controls — Elevons and Ruddervators

On delta-wing aircraft, pitch and roll control surfaces must be fitted on the wing trailing edge. **Elevons** combine elevator and aileron functions, moving symmetrically for pitch or asymmetrically for roll via a mixer unit. **Ruddervators** are used on aircraft with a 'V' or Butterfly tail, serving the purposes of both rudder and elevator.

## High Lift Devices

Aerodynamic lift is determined by the shape and size of the main lifting surfaces. A large modern swept-wing airliner (e.g. Boeing 777) has its wing designed for optimum lift in cruise (typically Mach 0.87). To control and land a ~200-tonne aircraft on runways of reasonable length, landing speed must be slower than the clean stalling speed — achieved using **high lift devices**.

High lift devices divide into:
- **Leading edge devices**: slots, slats and Krueger flaps
- **Trailing edge devices**: plain, slotted and Fowler flaps

They increase lift and reduce stalling speed; landing speed (about **1.3 times the stalling speed**) is also reduced, since drag also increases with large trailing-edge flap angles.

Some aircraft use ailerons that move downwards together when trailing edge flaps extend to the landing position, acting as additional plain flaps to provide extra drag (and lift) while still providing roll control if needed. These are called **"Droop Ailerons"** or **"Flaperons"**.

## Drag Inducing Devices

Light aircraft can slow down simply by closing the throttle, allowing airframe drag and the idling propeller to slow the aircraft to gliding speed. A modern airliner, being an extremely smooth low-drag design, will continue in level flight for many miles if only throttles are retarded, and will accelerate again if the nose is lowered more than a degree or so. To overcome this, designers use drag inducing devices: spoilers, lift dumpers, speed brakes, and — in unusual circumstances — lowering the landing gear and operating in-flight thrust reversers.

### Spoilers and Lift Dumpers

Usually hinged panels located about mid-chord on the upper wing surface, hydraulically operated, producing turbulence and drag when deployed, reducing lift. Uses include: primary roll control; symmetrical part-deployment to slow down in cruise or descend steeply without accelerating (deployment angle can be varied via the flight deck control lever). **Lift dumpers** are spoiler panels deployed after landing to destroy wing lift and produce high drag, helping wheel brakes operate more effectively.

### Speed Brakes

The term more accurately describes devices solely for producing drag without any change of trim — e.g. the rear-fuselage-mounted 'clamshell-type' doors on the BAe 146 and Fokker 70/100. Unlike wing-mounted spoilers (which can cause cabin vibration/rumble), aft-mounted speed brakes produce high drag at any airspeed virtually vibration-free, and lift is completely unaffected — permitting deployment on approach and making a go-around safer.

## Airflow Control Devices

### Wing Fences

Usually fitted to swept-wing aircraft. Airflow over a swept wing splits into a chordwise component and a spanwise component towards the wingtip. Fences are fitted about mid-span on the leading edge, extending rearwards, to control the spanwise flow of boundary layer air over the top of the wing, straighten airflow over the ailerons (improving effectiveness), and reduce 'spillage' of air from beneath to above the wing near the tip, reducing drag.

### Saw Tooth Leading Edges

More common on military than commercial aircraft: a small increase in wing chord on the outer wing forms a step, creating an invisible 'wall' of high velocity air that straightens spanwise flow — functioning like a wing fence but without the extra drag and weight penalty.

### Winglets

Seen on later-generation airliners and business jets: the outboard wing is upswept to an extreme dihedral angle. Winglets work best at higher speeds, using up-flow from below the wing to produce forward thrust (like a yacht sail), improving airflow control and reducing drag. They add weight and parasitic drag, but the large reduction in induced drag at the wingtip results in significant fuel saving.

## Boundary Layer Control

The boundary layer is the layer of air adjacent to the aerofoil surface, where velocity varies from zero at the surface to the free stream velocity at its outer extremity. At the leading edge the boundary layer is normally **laminar** (smooth thin sheets close to the surface); moving towards the trailing edge it becomes thicker and **turbulent**. The region where flow changes from laminar to turbulent is the **transition point**. As airspeed increases, the transition point tends to move forward.

### Vortex Generators

Small plates or wedges projecting about **25 mm** (about 3 times the typical boundary layer thickness) from the aerofoil surface into the free stream air. They shed small vortices that mix high-energy free stream air into the sluggish boundary layer air, pushing the transition point back towards the trailing edge. The small drag they create is more than compensated by the boundary layer drag they save; they also weaken shock waves at high speed, reducing shock drag.

### Stall Wedges

Small, wedge-shaped strips mounted on the leading edge of the wings at about one-third span, designed to disrupt boundary layer airflow at large angles of attack approaching the stall, ensuring the wing stalls at the root end first (working with washout, which permits the wing root to stall first, so the pilot retains roll control during the stall). At smaller angles of attack they also produce an effect similar to a wing fence, smoothing airflow over the ailerons.

### Leading Edge Devices

Leading edge droop flaps and Krueger flaps prevent laminar separation at the low speed end of the range, controlling boundary layer air. They may be a droop snoot or permanent droop type, or adjustable during flight.

## Trim Tabs

During flight an aircraft develops a tendency to deviate from a straight-and-level 'hands-off' attitude, due to changes in fuel state, speed, load position or flap/landing gear selection. Continuously applying a correcting force would be fatiguing for the crew, so **trim tabs** are used instead. Trim tabs move the primary control surface aerodynamically in the opposite direction to the tab's own movement. To correct a 'nose down' condition, the elevator tab is moved down, causing the elevator to move up, the tail to move down, and the nose to come up.

| Tab type | Description |
|----------|-------------|
| **Fixed Trim Tab** | A simple sheet metal section on the trailing edge, adjusted on the ground by bending, or via a ground-adjustable connecting rod; correct position found by trial and error, aiming for zero control forces in cruise. |
| **Controllable Trim Tab** | Adjusted from the flight deck, position shown on a flight deck indicator (trim units left/right of neutral); actuated mechanically, electrically or hydraulically. Trim is normally provided on all three axes. Note: aircraft with fully powered (irreversible) hydraulic controls do not have trim tabs — trimming is achieved by moving the primary control surface to a new neutral datum. |
| **Servo Tab** | Positioned on the trailing edge, connected directly to flight deck control inputs. Acts as a 'power booster' — pilot effort deflects the small tab, and the aerodynamic force on the tab moves the primary control until the aerodynamic load on the control surface balances that on the tab. Moving the tab down moves the primary control up, and vice versa. |
| **Balance Tab** | Assists the pilot in moving the primary control surface. Flight deck controls connect to the primary control surface; the balance tab (hinged to the trailing edge) connects to the fixed aerofoil, tending to maintain the same relative angle to the fixed surface as the pilot moves the control — aerodynamically moving opposite to the control surface and assisting its movement. Adjusting the connecting rod length alters the tab's effective range. Tabs with more than one attachment point are "geared balance tabs". Combining balance-tab and trim-tab function (via a linear actuator in the rod) creates a trim/balance tab. |
| **Anti-Balance Tab** | Operates similarly to a balance tab aerodynamically but with reverse effect — routed so the tab moves in the same direction as the primary control surface, adding to pilot effort loading and providing 'feel' to prevent over-stressing the airframe. |
| **Spring Tab** | Provides progressively increasing aerodynamic assistance as forward speed increases. Flight deck controls connect via a torque rod assembly (spring box) on the primary control surface. At low airspeed, airloads are minimal and the tab moves with the primary control, providing no extra assistance. As speed increases, airflow force opposing control deflection causes the torque tube to twist (or spring to compress), deflecting the spring tab and providing increasing aerodynamic assistance. |

## Mass Balance

All aircraft structures distort under load and, being elastic, spring back when the load is removed or its point of application changes. Since a control surface is hinged near its leading edge, its centre of gravity is behind the hinge, meaning more weight is aft of the hinge than in front.

If air load distorts the wing upwards, the aileron may 'lag' behind and distort downwards, producing an extra upward aerodynamic force pushing the wing up further. As the wing springs back, the aileron lags upwards, forcing the wing down further than elastic recoil alone — the cycle repeats, producing a high speed oscillation known as **flutter**.

Flutter is prevented by moving the control surface's centre of gravity in line with, or slightly in front of, the hinge line — normally by adding high density weights (typically lead or depleted uranium), either within the leading edge itself or externally ahead of the hinge line. This procedure is called **mass balancing** of the controls.

## Control Surface Bias

When a control surface is set so it is not in the true neutral position, it is said to have a **bias**. For example, a single-propeller aircraft may tend to roll opposite to engine torque; to counteract this, the ailerons could be offset (one slightly up, one down). Once the aircraft flies level with the bias set, the cabin trim gauge is then set to read zero.

## Aerodynamic Balance

To overcome high stick forces on larger aircraft at higher speeds, the control surfaces themselves are used to lighten the forces — **Aerodynamic Balancing**. The three principal methods are: **horn balance**, **inset hinge**, and **pressure (balance panel) balancing**.

### Horn Balance

A small part of the primary control surface ahead of the hinge projects into the airflow when the control is deflected. Airflow on this side assists movement of the control in the desired direction, attempting to move it further from neutral, while air loads aft of the hinge try to push the surface back towards neutral (the force that would normally make controls heavy). With the correct proportion of balance area forward and control area aft of the hinge, the pilot feels more manageable control loads.

### Inset Hinge

Has the same effect as horn balance, but instead of a forward projection at one or both ends, the hinges are set back so the area forward of the hinge line — which projects into the airflow when the surface moves from neutral — is spread evenly along its whole length.

### Balance Panels

Fitted between the leading edge of the aileron (ahead of the hinge) and the rear face of the wing. When the aileron deflects, high velocity, low pressure air over the lower (or upper) gap decreases pressure under (or above) the balance panel and pulls it down (or up). The force on the panel is proportional to airspeed and control surface deflection, assisting the pilot.

## Rudder Travel Limiters

Large aeroplanes are fitted with a rudder travel limiter to protect the empennage from overload if excessive rudder is inadvertently applied at high speed. In older aeroplanes, the limiter operates by ram air pressure from its own pitot tube, usually installed in the leading edge of the vertical stabiliser — the higher the airspeed, the more ram pressure, proportionally restricting rudder movement. Modern aeroplanes use a computer-controlled rudder travel limiter that receives airspeed electrical signals from the air data system. The rudder's travel is inversely proportional to the aircraft's airspeed.

## High Speed Flight

Modern large airliners can cruise at 87% of the speed of sound — typically at about 11,000 m (approximately 36,000 ft), an airspeed of about 575 mph.

### Speed of Sound

**Mach number**, named after the Austrian physicist Ernst Mach (1838–1916), is the ratio of the true airspeed of an aircraft to the local speed of sound at that altitude. Sound waves radiate outward equally in all directions from a source, like ripples on a pond. The actual speed depends on the type and density of the medium — sound travels about **4 times faster in water than in air**, since water is denser. Speed also varies with temperature: as temperature increases, the speed of sound increases.

- Standard day, sea level (15°C approx.): sound travels at **761 mph (661.7 knots)**
- At 11,000 m altitude (−56°C): speed of sound falls to about **661 mph**
- Above 11,000 m and up to about 27,000 m, temperature (and hence speed of sound) remains constant

### Subsonic Flight

At subsonic speeds (less than pressure wave propagation speed), pressure waves still travel ahead of the aircraft — "a message sent ahead" — detectable perhaps **100 metres** in front of the aircraft. Air streams begin to divide to make way for the aircraft with very little change in air density. This change in pressure wave character as the aircraft passes is often referred to as the **Doppler shift (Doppler effect)**.

### Transonic Flight

At subsonic speeds, air passing over a wing experiences only small pressure and density changes, and the airflow is termed **incompressible**. At higher speeds, changes in pressure and density become significant — the **compressibility effect**. When air enters a venturi at supersonic speed, it slows down and must compress, increasing both pressure and density.

The transonic range encompasses sound wave velocity and is the most difficult realm of flight, since some airflow over the aircraft (particularly the wings) is subsonic and some is supersonic. As the aircraft approaches the speed of sound, pressure waves ahead travel at the same speed as the aircraft and become relatively stationary, accumulating into a continuous pressure wave and removing any advance warning of the aircraft's approach. Shock waves form wherever the airflow reaches the speed of sound, upsetting the aerodynamic balance of the wing.

### Supersonic Flight

Once an aircraft is fully supersonic, all parts of it travel faster than the pressure waves can propagate. An infinite number of pressure waves form a cone (the **Mach cone**), whose inclination changes with aircraft speed.

### Mach Number

An aircraft travelling at exactly the speed of sound is at **Mach 1**; at twice the speed of sound, **Mach 2**; at half, **Mach 0.5**.

| Flow regime | Mach number range |
|-------------|--------------------|
| Subsonic Flow | below Mach 0.75 |
| Transonic Flow | Mach 0.75 to Mach 1.2 |
| Supersonic Flow | Mach 1.2 to Mach 5.0 |
| Hypersonic Flow | above Mach 5.0 |

### Critical Mach Number

As air flows over the camber of the upper wing surface, its speed increases rearward from the leading edge, reaching a maximum at the thickest part of the wing chord. This means the airflow over the thickest part of the chord may reach Mach 1 even though the aircraft itself is well below Mach 1. The unique maximum aircraft forward speed corresponding to a wing speed of Mach 1 is called the **Critical Mach Number (M.crit)** — always less than Mach 1.

A thick wing causes airflow to speed up over the camber and reach Mach 1 more quickly than a thin wing of similar chord, so a thinner wing has a **higher** Critical Mach Number, allowing faster flight in the transonic range before unwanted effects occur. A thin wing produces less lift than a thick wing of similar chord, but this can be overcome with a **Supercritical wing** design — the lift lost by shallower camber is restored by making the chord longer, ideal for transonic cruise, though extensive high lift devices are needed at low airspeed.

### Adverse Transonic Effects

As the Critical Mach Number is approached, unwanted effects occur: buffeting, shock waves, increase in drag, decrease in lift, and movement of the centre of pressure. If uncontrolled, these can make the aircraft behave similarly to a low speed high incidence stall, even at high speed and low angle of incidence.

### Compressibility Buffet

As the wing region (and flying control aerofoils) reach Mach 1, smoothness of airflow is severely affected, causing violent vibration — compressibility buffeting. If allowed to continue, control loss or structural damage can occur.

### Shock Wave

Below the critical Mach number, all airflow is subsonic and pressure distribution is predictable, with airflow separation from the aerofoil surface causing increased drag and reduced lift as speed increases. As flight speed reaches and exceeds the critical Mach number, airflow over the top of the wing speeds up to supersonic velocity and a **shock wave** starts to form (a **normal/perpendicular shock wave**, forming a boundary between supersonic and subsonic flow). If the aerofoil is symmetrical and set at zero angle of attack, the incipient shock wave forms equally on both surfaces; however, since a wing is usually set to about **3 degrees** angle of incidence, even a symmetrical aerofoil produces the wave on the top surface first.

The shock wave causes decelerating airflow to become subsonic again, with a rapid rise in pressure. Separation and turbulent wake start from this point, causing a sudden and considerable increase in drag (about **10 times**) and large loss of lift; severe buffeting and possible shock stall follow, and the centre of pressure shifts, affecting the pitching moment. This extra drag, **Shock Drag**, comprises **Wave Drag** (resistance from the wave itself) and **Boundary Layer Drag** (increased turbulent region). Some airstream energy is dissipated as heat.

As speed increases further, the shock wave moves aft towards the trailing edge, and a second shock wave forms on the lower surface. At the upper end of the transonic range both waves move aft, strengthen, and attach to the trailing edge. Further speed increase forms a normal shock wave ahead of the aerofoil — a continuous **Bow wave** — which moves towards and attaches to the leading edge; once attached, all airflow over the wing is supersonic and many unwanted transonic effects are eliminated.

Lift and drag both rise with increasing Mach number until about **Mach 0.81**, when shock-induced separation drastically reduces the lift coefficient. As speed approaches **Mach 0.99**, the forming bow wave slows airflow over the wing to subsonic, resulting in increased lift coefficient and reduced drag.

### Aerodynamic Heating

One of the biggest problems of sustained supersonic flight is aerodynamic heating of the structure. Concorde was probably the only airliner where this presented a significant problem: at Mach 2, friction heats the skin considerably even above **17,000 metres**, with maximum heating on the nose (temperature rise up to **175°C**). A nose probe monitored temperature in flight; at a reading of **127°C** the flight deck was directed to reduce speed to about **Mach 1.8** to bring temperature back within limits. Concorde used conventional aluminium alloys; higher Mach numbers within the atmosphere would require materials such as titanium alloy or stainless steel.

### Area Rule

An aerodynamic technique for high-speed aircraft design: to keep drag to a minimum at transonic speeds, the wings, fuselage, empennage and other appendages must be considered together, so the cross-sectional area of successive 'slices' of the aircraft from nose to tail conforms to that of a simple streamlined body.

**Definition**: For minimum drag at the connections (wing/fuselage), the variation of the aircraft's total cross-sectional area along its length should approximate that of an ideal shape having minimum wave drag. Without area rule, the greatest frontal cross-sectional area would occur where the wings attach to the fuselage; area rule is achieved by reducing fuselage cross-section there (cancelling the wings' increase) or by enlarging the fuselage cross-section before and after the wings to eliminate sudden area changes.

### Effects of Sweepback on Critical Mach Number

To raise the Critical Mach Number without the structural limitations of very thin wings, **swept wings** are used. Sweepback delays shock wave production and reduces the severity of shock stall should it occur — only the velocity component over the wing chord is responsible for the pressure distribution causing shock wave development; the spanwise component causes only frictional drag with no effect on shock wave production. When it appears, the shock wave lies parallel to the wing span, so only the velocity component perpendicular to the shock wave (across the chord) is reduced to subsonic by the wave. The greater the sweepback, the smaller the affected velocity component, giving a higher Critical Mach Number and reduced drag at all transonic speeds. Sweepback also results in a thinner mean aerodynamic chord, raising the Critical Mach Number further.
        $cnt$,
        1
    ) RETURNING id INTO s1_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 11A.2: Airframe Structures — General Concepts
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m11_id, 'M11A.2', 'Airframe Structures — General Concepts',
        $cnt2$
# Airframe Structures — General Concepts

## Airworthiness Requirements for Structural Strength

Airworthiness requirements are necessary with respect to aircraft structures, because established standards of strength, control, maintainability, etc. ensure all aircraft are constructed to the safest possible standard.

Requirements for aircraft above **5,700 kg MTWA** (maximum total weight authorised) are listed in Joint Airworthiness Requirement 25 (EASA-25), and for aircraft below 5,700 kg MTWA, in EASA-23. These cover the basic requirements — such as maximum and minimum 'g' loading — plus a wide range of other structural requirements, including:

- Control Loads
- Door Operation
- Effect of Tabs
- Factor of Safety
- Fatigue
- High Lift Devices
- Stability & Stalling
- Ventilation
- Weights

## Structural Classification

For assessing damage and the type of repairs to be carried out, the structure of all aircraft is divided into three categories: **Primary**, **Secondary** and **Tertiary** structure. Diagrams are prepared by each manufacturer to denote how the various structural members fall into these categories. In older aircraft manuals, colour may identify the categories: **Primary Structure in Red, Secondary in Yellow, Tertiary in Green** (this system has been discontinued for many years, but may still be found on older aircraft with 30+ years of service).

### Primary Structure

Includes all portions of the aircraft whose failure in flight or on the ground would be likely to cause:

- Catastrophic structural collapse
- Inability to operate a service
- Injury to occupants
- Loss of control
- Unintentional operation of a service
- Power unit failure

Examples: engine mountings, fuselage frames, main floor members, main spars.

### Secondary Structure

Includes portions of the aircraft that would normally be regarded as primary structure, but which unavoidably have such a reserve of strength over design requirements that appreciable weakening may be permitted without risk of failure. Also includes structure that, if damaged, would not impair the safety of the aircraft. Examples: ribs and parts of skin in the wings; skin and stringers in the fuselage.

### Tertiary Structure

Includes all portions of the structure where stresses are low, but which cannot be omitted from the aircraft for various reasons. Typical examples: fairings, fillets and brackets which support items in the fuselage and adjacent areas.

## Fail Safe, Safe Life and Damage Tolerant Concepts

### Fail Safe

A fail safe structure is one which retains, after initiation of a fracture or crack, sufficient strength for the operation of the aircraft with an acceptable standard of safety, until such failure is detected at a normal scheduled inspection. This is achieved by part- and full-scale airframe testing and fatigue analysis, usually by the aircraft manufacturer, and by subsequent in-service experience.

### Safe Life

Safe life structure and components are granted a period of time during which failure is considered extremely unlikely. Deciding this duration must consider the effects of wear, fatigue and corrosion. For example, if tests show fatigue will cause failure in **12,000 flying hours**, one sixth of this might be quoted as the safe life (i.e. 2,000 hours, then scrapped). If wear or corrosion are likely to cause failure sooner, one of these becomes the deciding factor. Safe life may be expressed in flying hours, elapsed time, number of flights, or number of applications of load (e.g. pressurisation cycles).

### Damage Tolerance

The fail safe method proved somewhat unreliable following accidents that showed the concept was not 100% guaranteed, and adding extra structural members to protect structural integrity considerably increased aircraft weight. The **damage tolerant** concept eliminates much of this extra weight by distributing loads over a larger area, requiring an evaluation of the structure to provide **multiple load paths**. Even with a crack present, the structure retains its integrity, and during scheduled maintenance the crack will be found before it becomes critical.

Example: a wing attachment to the fuselage, which in the past used one or two large pintle bolts (requiring heavy reinforcement to take wing loading, adding weight), now uses a larger number of smaller bolts in the fitting — the multiple load path construction is lighter while maintaining strength.

## Zonal and Station Identification System

### Zonal System

During maintenance operations (component changes, structural repairs, trouble shooting), it is necessary to indicate to the engineer the correct location within the structure. Some manufacturers use a **zonal system** and a **frame/station method**.

The zonal system divides the airframe into a number of zones (usually fewer than 10), giving engineers a rough idea of where to look, and may also be used for component labelling and work card area identification. For example, a work card numbered 500376 indicates Job 376 located on the left wing (Zone 500).

### Station Identification System

Most manufacturers use a system of station marking where, for example, the aircraft nose is designated **Station 0**, with other stations located at measured distances aft of this point. Wings, tailplane, fin and nacelles have separate dedicated station zeros.

- **Fuselage locations**: a particular fuselage station (or frame) may be identified as, for example, Station 5050 — meaning the frame is located 5.05 metres (5,050 mm) aft of station zero.
- **Lateral locations**: the fuselage centre line is often used as station zero, with wing or tailplane ribs identified as a number of millimetres (or inches) to the right or left of the centre line.
- **Vertical locations**: usually measured above or below a 'water line' — a predetermined reference line along the fuselage side, usually somewhere between floor level and window line.

## Loads Found Within the Structure — Stress and Strain

Aircraft structural members are designed to carry a load or resist stress, and a single member may be subjected to a combination of stresses during flight. When an external force acts on a body, it is opposed by a force within the body, called **Stress**. If the body is distorted by the stress, it is said to be subject to **Strain**.

| Quantity | Definition |
|----------|------------|
| **Stress** | Load or force per unit area acting on a body: Stress = Load (or Force) / Cross Sectional Area |
| **Strain** | The distortion per unit length of a body: Strain = Distortion / Original Length |

There are **five major stresses**, all found somewhere within an aircraft structure. In the design stage, the designer assesses these stresses and makes the structure strong enough to carry them, with a reserve of strength included for safety:

1. Compression
2. Tension
3. Bending (a combination of compression and tension)
4. Twisting/Torsion
5. Shear

### Compression

A primary stress — the resistance to any external force which tends to push the body together. Example: compressive stresses applied to rivets expand the shank as they are driven in, completely filling the hole and forming the head to hold sheet metal skins together.

### Tension

A primary stress that tends to pull an object apart. Example: a flexible steel cable used in flying control systems, designed to withstand tension loads only — easily bent, with little opposition to compression, torsion or shear, but an exceptional strength/weight ratio under pure tension.

### Bending

Tends to pull one side of a beam apart while squeezing the other side together (e.g. a person standing on a diving board — the top is under tension, the bottom under compression). Wing spars of cantilever wings are subject to bending: in flight, the top of the spar is compressed and the bottom is under tension; on the ground, the reverse occurs. If the wing is strut-supported, the strut is in tension in flight and compression on the ground.

### Torsion

A torsional stress is put into a material when it is twisted — a tensile stress acts diagonally across the member, and a compressive stress acts at right angles to the tension. Example: the crankshaft of an aircraft piston engine, under torsional load when driving the propeller.

### Shear

A shear stress resists the tendency to slice a body apart. Example: a clevis bolt in a flying control system, designed to take shear loads only — a high strength steel bolt with a thin head and fat shank, securing flexible steel cables to control surfaces and allowing the cable to move with the control surface without bending; the airload on the control surface attempts to slice (shear) the bolt.

### Hoop Stress

An aircraft with a pressurised fuselage has additional stresses acting on the fuselage skin. The circumferential load about the fuselage is known as **hoop stress**, resisted by the fuselage frames and tension in the stressed skin. The longitudinal (axial) load along the fuselage is resisted by tension in the skin and by the longerons and stringers.

### Metal Fatigue

Aircraft are subjected to widely varying loads in flight, and many components experience load reversals — e.g. wings, where aerodynamic forces during manoeuvres cause tension and compression loads to alternate continually. Any metal part subjected to a wide variation or reversal of even a relatively small load is gradually and progressively weakened.

The subject was vividly highlighted in **1954**, when pressurisation cycle load reversals resulted in disastrous accidents with the **De Havilland Comet** airliner: small fatigue cracks accumulated around the corners of the square-shaped windows and hatches, leading to fatal explosive decompression. This led to extensive research and fatigue loading being included in future design considerations.

**Metal fatigue** refers to the loss of strength, or resistance to load, experienced by a component or structure as the number of load cycles or reversals increases. As long as the elastic limit is not exceeded, a material should be unaffected and return to its original state; however, load application may result in minute cracks which, over cycles, get larger and join with other cracks — eventually compromising the metal's strength and potentially causing catastrophic failure.

Fatigue strength is found by experimentation on full-scale fatigue rigs, subjected to load reversal programmes 24 hours a day, 365 days a year, accumulating a fatigue life years ahead of the oldest aircraft of that type in the fleet. How an in-service aircraft consumes this fatigue index depends on its operating theatre (e.g. number of pressurisation cycles on long/short haul flights, steep or conventional take-off/landing).

Stress amplitude can be plotted against endurance for one value of mean stress — the **S/N Curve** — determining at what point (in cycles) the metal reaches its minimum acceptable strength: the ultimate fatigue life, normally allotted a **fatigue index of 100**. Designers can extend this beyond 100 by examining how fatigue was consumed and recommending specific structural inspection, strengthening or replacement of fittings and components.

Fatigue is a natural phenomenon and cannot be prevented. Different metals have different fatigue characteristics, and part design also affects fatigue life — fastener holes, sharp changes in thickness and small cracks can directly affect a part's fatigue life. Fatigue cracking can also accelerate corrosion by exposing unprotected metal to the elements, causing serious structural problems over a relatively short period.

## Drainage and Ventilation Provisions

### Drainage

The aircraft structure requires many types of drain holes and paths to prevent water and other fluids (fuel, hydraulic oil, etc.) collecting within the structure, which could become both a corrosion and fire hazard. Drainage divides into two areas: **external drains** and **internal drains**.

#### External Drains

Located on exterior surfaces of the fuselage, wing and empennage, to ensure fluids are dumped overboard. In small unpressurised aircraft and unpressurised areas of larger airliners, these drains may be permanently open. In pressurised aircraft, cabin air would otherwise leak uncontrollably through the drains, so **drain valves** are used to prevent loss of cabin pressure.

There are several basic types of drain valve:
- Two similar types rely on pressurised cabin air to keep the valve closed — one has a rubber flapper seal, the other a spring loaded valve seal. Normally located on the fuselage keel, both are open when the aircraft is unpressurised on the ground (allowing fluids to drain) and close during flight as cabin pressure increases.
- Another type also uses cabin air pressure to close the drain path, this time by moving a plunger down to seal the drain; it is also open when cabin pressure is removed.

A levelling compound (a rubberised sealant) is used in areas that might become fluid traps, filling the cavity up to the lip of the drain hole.

Fluids from places like galleys and wash basins require more than simple drain holes, since temperature at cruising altitude can fall to **−60°C** and water draining overboard could freeze and cause blockages. **Drain masts** — small aerofoils projecting from the bottom of the aircraft skin, on the centre line — are used in these cases; they are heated to prevent icing and discharge liquids well away from the aircraft's skin.

#### Internal Drains

To enable external drains to function, internal drain paths must direct fluids from all locations within the airframe and powerplant installation towards the external drain points. This is achieved with tubes, channels, dams and drain holes. Structural members are designed so they do not trap fluids — for example, all lightening holes and ribs face downwards, allowing fluids to run off them.

### Ventilation

Internal cavities must be properly vented to prevent build-up of flammable vapour from the drain lines and to allow moisture residue to evaporate. Sumps, tanks and cavities are provided with vent pipes; in some cases (e.g. engine cowlings), ram air inlets and outlets ensure zones containing fluids are adequately ventilated.

**System installation provisions**: installing systems such as air conditioning/pressurisation, hydraulic, pneumatic, electrical and avionics requires facilities in the design for component location, lines and cables. Many components must be serviceable 'in-situ' or are line replaceable units (LRUs), requiring easy access. Modern aircraft normally have dedicated compartments (e.g. avionics bays, hydraulic bays, air conditioning bays) allowing easier replacement of 'black boxes' (LRUs) and mechanical components (control units, valves, filters). Older aircraft have components scattered throughout the airframe with more difficult access.

## Lightning Strike Provision

When aircraft fly in cloud or near storms, there is always a risk of a lightning strike. Although rare, protection devices are installed to ensure a strike does as little damage as possible. A lightning strike can have a **peak current of up to 100,000 amperes**, so precautions must be taken to minimise damage to the aircraft, its systems and components.

Most important is the **electrical bonding** of all major airframe components — electrically connecting them together to ensure they are at the same electrical potential, providing a return path through the airframe (modern aircraft use an earth return system). This prevents current from the strike building up on one part of the structure and creating a voltage high enough to jump to another, electrically separated, part (such as flying control surfaces). Electrical bonding also protects equipment from static electricity build-up, produced as the aircraft collects ions from the atmosphere. Bonding cables are referred to as **secondary conductors**.

As well as electrical bonding, dedicated lightning protection systems cater for the high current and are known as **primary conductors**. They connect system earth returns, connect power-plants to the airframe, and ensure major structural items (often manufactured in different factories in different countries) are properly connected together after final assembly. Occupants are protected from electrical shock by the surrounding aircraft structure acting as a **Faraday Cage**.
        $cnt2$,
        2
    ) RETURNING id INTO s2_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M11A.1 Aeroplane Aerodynamics and Flight Controls (16 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s1_id, 'The tail section of a conventional aircraft, including the stabilisers, elevators and rudder, is occasionally known as the:',
     '[{"id":"a","text":"Empennage","correct":true},{"id":"b","text":"Fuselage","correct":false},{"id":"c","text":"Nacelle","correct":false}]',
     '{"B1"}'),

    (s1_id, 'A key advantage of the T-Tail arrangement is that:',
     '[{"id":"a","text":"Pitch control is not affected by turbulent air from the wing","correct":true},{"id":"b","text":"It removes the need for a vertical stabiliser","correct":false},{"id":"c","text":"It eliminates the risk of a deep stall entirely","correct":false}]',
     '{"B1"}'),

    (s1_id, 'T-Tailed aircraft are fitted with a ''stick push'' system in order to:',
     '[{"id":"a","text":"Automatically recover the aircraft safely from excessive angles of attack","correct":true},{"id":"b","text":"Automatically deploy the speed brakes on approach","correct":false},{"id":"c","text":"Automatically retract the high lift devices after take-off","correct":false}]',
     '{"B1"}'),

    (s1_id, 'On single-engined propeller aircraft, the vertical stabiliser leading edge may be offset slightly in order to:',
     '[{"id":"a","text":"Counter the yawing moment caused by rotating slipstream from the propeller","correct":true},{"id":"b","text":"Reduce aerodynamic heating at high speed","correct":false},{"id":"c","text":"Increase the critical Mach number of the fin","correct":false}]',
     '{"B1"}'),

    (s1_id, 'Which of the following is classed as a primary flight control surface?',
     '[{"id":"a","text":"A trim tab","correct":false},{"id":"b","text":"An aileron","correct":true},{"id":"c","text":"A slat","correct":false}]',
     '{"B1"}'),

    (s1_id, 'On large aircraft with two sets of ailerons per wing, the outboard ailerons are normally isolated at high cruising speed because:',
     '[{"id":"a","text":"They are not needed at high speed and their operation could cause aileron reversal or structural damage on flexible thin wings","correct":true},{"id":"b","text":"They are only connected electrically and fail above 250 knots","correct":false},{"id":"c","text":"They automatically become elevons at high speed","correct":false}]',
     '{"B1"}'),

    (s1_id, 'A co-ordinated turn is one in which:',
     '[{"id":"a","text":"The aircraft slips or skids continuously","correct":false},{"id":"b","text":"The turn occurs without slip or skid","correct":true},{"id":"c","text":"Only the rudder is used, with no aileron input","correct":false}]',
     '{"B1"}'),

    (s1_id, 'When used as a primary roll control, spoilers mounted just inboard of the outboard ailerons are known as:',
     '[{"id":"a","text":"Lift dumpers","correct":false},{"id":"b","text":"Roll spoilers","correct":true},{"id":"c","text":"Speed brakes","correct":false}]',
     '{"B1"}'),

    (s1_id, 'A stabilator (or all-flying tailplane) differs from a conventional elevator arrangement in that:',
     '[{"id":"a","text":"It is a complete all-moving horizontal stabiliser that changes its own angle of attack","correct":true},{"id":"b","text":"It only operates on the ground for pitch trim","correct":false},{"id":"c","text":"It replaces the rudder as well as the elevator","correct":false}]',
     '{"B1"}'),

    (s1_id, 'A fundamental feature of a canard (foreplane) design is that the foreplane''s angle of attack is set:',
     '[{"id":"a","text":"Lower than the main wing, so it never stalls","correct":false},{"id":"b","text":"Greater than the main wing, so it reaches the stalling angle first","correct":true},{"id":"c","text":"Identical to the main wing, so both stall together","correct":false}]',
     '{"B1"}'),

    (s1_id, 'High lift devices such as slots, slats, Krueger flaps and Fowler flaps are used primarily to:',
     '[{"id":"a","text":"Increase lift and reduce stalling speed so the aircraft can land at a slower, safer speed","correct":true},{"id":"b","text":"Increase the critical Mach number in cruise","correct":false},{"id":"c","text":"Provide electrical bonding for lightning protection","correct":false}]',
     '{"B1"}'),

    (s1_id, 'True speed brakes, such as the rear-fuselage clamshell-type doors on the BAe 146, have a major advantage over wing-mounted spoilers in that they:',
     '[{"id":"a","text":"Produce high drag with little cabin vibration and leave lift unaffected","correct":true},{"id":"b","text":"Generate additional lift while producing drag","correct":false},{"id":"c","text":"Can only be used on the ground","correct":false}]',
     '{"B1"}'),

    (s1_id, 'Wing fences fitted to swept-wing aircraft are designed primarily to:',
     '[{"id":"a","text":"Control the spanwise flow of boundary layer air over the top of the wing","correct":true},{"id":"b","text":"Reduce fuselage cross-sectional area under the area rule","correct":false},{"id":"c","text":"Act as a lightning strike primary conductor","correct":false}]',
     '{"B1"}'),

    (s1_id, 'Vortex generators project from the aerofoil surface into the free stream air in order to:',
     '[{"id":"a","text":"Mix high energy free stream air into the sluggish boundary layer, pushing the transition point rearwards","correct":true},{"id":"b","text":"Reduce the aircraft''s critical Mach number","correct":false},{"id":"c","text":"Replace the need for ailerons","correct":false}]',
     '{"B1"}'),

    (s1_id, 'A trim tab corrects a ''nose down'' out-of-trim condition on the elevator by:',
     '[{"id":"a","text":"Moving the tab down, causing the elevator to move up and the nose to rise","correct":true},{"id":"b","text":"Moving the tab up, causing the elevator to move up and the nose to rise","correct":false},{"id":"c","text":"Locking the elevator in its current position","correct":false}]',
     '{"B1"}'),

    (s1_id, 'Aircraft fitted with fully powered, irreversible hydraulic flying controls normally:',
     '[{"id":"a","text":"Do not have trim tabs, since trim tabs would be aerodynamically ineffective; trimming is achieved by moving the control surface to a new neutral datum","correct":true},{"id":"b","text":"Rely exclusively on servo tabs for all control movement","correct":false},{"id":"c","text":"Cannot be trimmed in flight at all","correct":false}]',
     '{"B1"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M11A.1 Aeroplane Aerodynamics and Flight Controls (continued: mass balance,
    -- aerodynamic balance, high speed flight)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s1_id, 'The high speed oscillation of a control surface known as flutter is prevented by:',
     '[{"id":"a","text":"Mass balancing — adding weights to move the control surface CG in line with, or slightly ahead of, the hinge line","correct":true},{"id":"b","text":"Fitting a horn balance to reduce stick forces","correct":false},{"id":"c","text":"Increasing the sweepback of the wing","correct":false}]',
     '{"B1"}'),

    (s1_id, 'When a control surface is deliberately set away from its true neutral position to compensate for a design feature (such as engine torque effect), it is said to have a:',
     '[{"id":"a","text":"Bias","correct":true},{"id":"b","text":"Flutter condition","correct":false},{"id":"c","text":"Servo offset","correct":false}]',
     '{"B1"}'),

    (s1_id, 'The three principal methods of aerodynamic balancing described are:',
     '[{"id":"a","text":"Horn balance, inset hinge, and balance panels","correct":true},{"id":"b","text":"Mass balance, trim tabs, and spring tabs","correct":false},{"id":"c","text":"Area rule, sweepback, and boundary layer control","correct":false}]',
     '{"B1"}'),

    (s1_id, 'A rudder travel limiter on a large aeroplane is fitted primarily to:',
     '[{"id":"a","text":"Protect the empennage from overload if excessive rudder is applied at high speed","correct":true},{"id":"b","text":"Increase the critical Mach number of the fin","correct":false},{"id":"c","text":"Prevent flutter of the ailerons","correct":false}]',
     '{"B1"}'),

    (s1_id, 'Mach number is defined as:',
     '[{"id":"a","text":"The ratio of the true airspeed of the aircraft to the local speed of sound at that altitude","correct":true},{"id":"b","text":"The ratio of indicated airspeed to calibrated airspeed","correct":false},{"id":"c","text":"The ratio of dynamic pressure to static pressure","correct":false}]',
     '{"B1"}'),

    (s1_id, 'Compared with air, sound waves travel through water:',
     '[{"id":"a","text":"About 4 times faster, because water is denser","correct":true},{"id":"b","text":"About 4 times slower, because water is denser","correct":false},{"id":"c","text":"At exactly the same speed, since speed of sound is independent of density","correct":false}]',
     '{"B1"}'),

    (s1_id, 'According to the flow regime classification given, transonic flow corresponds to Mach numbers between:',
     '[{"id":"a","text":"Mach 0.75 and Mach 1.2","correct":true},{"id":"b","text":"Mach 0.1 and Mach 0.4","correct":false},{"id":"c","text":"Mach 1.2 and Mach 5.0","correct":false}]',
     '{"B1"}'),

    (s1_id, 'The Critical Mach Number (M.crit) of an aircraft is defined as:',
     '[{"id":"a","text":"The unique aircraft forward speed, always less than Mach 1, at which the airflow over the wing first reaches Mach 1","correct":true},{"id":"b","text":"The speed at which the whole aircraft first exceeds Mach 1","correct":false},{"id":"c","text":"The maximum operating limit speed regardless of wing thickness","correct":false}]',
     '{"B1"}'),

    (s1_id, 'Compared with a thick wing of similar chord, a thin wing has:',
     '[{"id":"a","text":"A lower Critical Mach Number but produces more lift","correct":false},{"id":"b","text":"A higher Critical Mach Number but produces less lift","correct":true},{"id":"c","text":"The same Critical Mach Number and the same lift","correct":false}]',
     '{"B1"}'),

    (s1_id, 'As flight speed exceeds the critical Mach number, airflow over the top of the wing speeds up to supersonic velocity, causing:',
     '[{"id":"a","text":"A normal (perpendicular) shock wave to start forming","correct":true},{"id":"b","text":"Aerodynamic heating to cease","correct":false},{"id":"c","text":"The boundary layer to disappear entirely","correct":false}]',
     '{"B1"}'),

    (s1_id, 'Shock-induced airflow separation behind a shock wave causes drag to increase by approximately:',
     '[{"id":"a","text":"10 times","correct":true},{"id":"b","text":"Twice","correct":false},{"id":"c","text":"No measurable increase","correct":false}]',
     '{"B1"}'),

    (s1_id, 'Shock Drag is made up of two components, namely:',
     '[{"id":"a","text":"Induced drag and parasite drag","correct":false},{"id":"b","text":"Wave drag and boundary layer drag","correct":true},{"id":"c","text":"Form drag and skin friction drag","correct":false}]',
     '{"B1"}'),

    (s1_id, 'On Concorde, if the nose probe temperature reached 127°C in supersonic cruise, the flight deck was directed to:',
     '[{"id":"a","text":"Reduce speed to about Mach 1.8 to bring the temperature back within limits","correct":true},{"id":"b","text":"Climb immediately to reduce aerodynamic heating","correct":false},{"id":"c","text":"Increase speed to pass through the heating zone more quickly","correct":false}]',
     '{"B1"}'),

    (s1_id, 'The Area Rule is applied to a high-speed aircraft design in order to:',
     '[{"id":"a","text":"Ensure the variation of total cross-sectional area along the aircraft''s length approximates an ideal low-wave-drag shape","correct":true},{"id":"b","text":"Reduce the peak current from a lightning strike","correct":false},{"id":"c","text":"Balance the mass of the flying controls","correct":false}]',
     '{"B1"}'),

    (s1_id, 'Sweepback raises the Critical Mach Number of a wing because:',
     '[{"id":"a","text":"Only the velocity component across the chord (not the spanwise component) is responsible for producing the shock wave","correct":true},{"id":"b","text":"It thickens the mean aerodynamic chord","correct":false},{"id":"c","text":"It eliminates boundary layer drag entirely","correct":false}]',
     '{"B1"}'),

    (s1_id, 'Compressibility buffet, occurring as the wing approaches its critical Mach number, is caused by:',
     '[{"id":"a","text":"Violent vibration as smooth airflow over the wing and flying control surfaces is severely disrupted","correct":true},{"id":"b","text":"A build-up of static electricity on the airframe","correct":false},{"id":"c","text":"Excessive fatigue cycling of the wing spar","correct":false}]',
     '{"B1"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M11A.2 Airframe Structures — General Concepts (16 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s2_id, 'For aircraft above 5,700 kg MTWA, the structural airworthiness requirements are listed in:',
     '[{"id":"a","text":"EASA-25","correct":true},{"id":"b","text":"EASA-23","correct":false},{"id":"c","text":"ICAO Annex 8","correct":false}]',
     '{"B1"}'),

    (s2_id, 'For the purpose of assessing damage and repairs, aircraft structure is divided into three categories:',
     '[{"id":"a","text":"Primary, Secondary and Tertiary structure","correct":true},{"id":"b","text":"Fail Safe, Safe Life and Damage Tolerant structure","correct":false},{"id":"c","text":"Stressed, Semi-stressed and Unstressed structure","correct":false}]',
     '{"B1"}'),

    (s2_id, 'In the older colour-coding system referenced for structural classification, Primary Structure was shown in:',
     '[{"id":"a","text":"Green","correct":false},{"id":"b","text":"Red","correct":true},{"id":"c","text":"Yellow","correct":false}]',
     '{"B1"}'),

    (s2_id, 'Engine mountings, fuselage frames, main floor members and main spars are examples of:',
     '[{"id":"a","text":"Primary structure","correct":true},{"id":"b","text":"Tertiary structure","correct":false},{"id":"c","text":"Non-structural fairings","correct":false}]',
     '{"B1"}'),

    (s2_id, 'Fairings, fillets and brackets that support items in the fuselage, where stresses are low but the item cannot be omitted, are classed as:',
     '[{"id":"a","text":"Primary structure","correct":false},{"id":"b","text":"Secondary structure","correct":false},{"id":"c","text":"Tertiary structure","correct":true}]',
     '{"B1"}'),

    (s2_id, 'A fail safe structure is one which, after initiation of a fracture or crack:',
     '[{"id":"a","text":"Retains sufficient strength for safe operation until the failure is detected at a normal scheduled inspection","correct":true},{"id":"b","text":"Must be replaced immediately before further flight","correct":false},{"id":"c","text":"Automatically self-repairs through material elasticity","correct":false}]',
     '{"B1"}'),

    (s2_id, 'A safe life component or structure is one that is granted:',
     '[{"id":"a","text":"A period of time during which failure is considered extremely unlikely, based on wear, fatigue and corrosion","correct":true},{"id":"b","text":"An unlimited service life provided it passes daily inspection","correct":false},{"id":"c","text":"A single mandatory replacement interval set only by the engine manufacturer","correct":false}]',
     '{"B1"}'),

    (s2_id, 'The damage tolerant design concept reduces structural weight (compared with earlier fail-safe designs) mainly by:',
     '[{"id":"a","text":"Distributing loads over a larger area using multiple load paths","correct":true},{"id":"b","text":"Removing all secondary structural members","correct":false},{"id":"c","text":"Using a single large pintle bolt attachment for wing loads","correct":false}]',
     '{"B1"}'),

    (s2_id, 'A zonal system, as used by some manufacturers to help locate maintenance work, typically divides the airframe into:',
     '[{"id":"a","text":"Usually fewer than 10 zones, giving a rough idea of location","correct":true},{"id":"b","text":"Exactly 100 precisely measured zones","correct":false},{"id":"c","text":"Zones based solely on primary/secondary/tertiary classification","correct":false}]',
     '{"B1"}'),

    (s2_id, 'In a station identification system, the aircraft nose is commonly designated:',
     '[{"id":"a","text":"Station 0, with other stations at measured distances aft","correct":true},{"id":"b","text":"Station 100, counting down towards the tail","correct":false},{"id":"c","text":"Zone 500, matching the zonal system","correct":false}]',
     '{"B1"}'),

    (s2_id, 'Stress, as defined for aircraft structural members, is:',
     '[{"id":"a","text":"Load or force per unit area acting on a body","correct":true},{"id":"b","text":"Distortion per unit length of a body","correct":false},{"id":"c","text":"The number of load cycles a component has experienced","correct":false}]',
     '{"B1"}'),

    (s2_id, 'Bending, as it applies to a wing spar in flight, is best described as:',
     '[{"id":"a","text":"A combination of compression and tension, with the top of the spar compressed and the bottom in tension","correct":true},{"id":"b","text":"A pure shear stress only","correct":false},{"id":"c","text":"A pure torsional stress only","correct":false}]',
     '{"B1"}'),

    (s2_id, 'A clevis bolt securing a flying control cable to a control surface is designed primarily to take:',
     '[{"id":"a","text":"Shear loads only","correct":true},{"id":"b","text":"Compression loads only","correct":false},{"id":"c","text":"Torsional loads only","correct":false}]',
     '{"B1"}'),

    (s2_id, 'On a pressurised fuselage, the circumferential load about the fuselage, resisted by the frames and tension in the stressed skin, is known as:',
     '[{"id":"a","text":"Hoop stress","correct":true},{"id":"b","text":"Torsional stress","correct":false},{"id":"c","text":"Shear stress","correct":false}]',
     '{"B1"}'),

    (s2_id, 'The disastrous De Havilland Comet accidents of 1954, which highlighted the danger of metal fatigue, were traced to fatigue cracks accumulating around:',
     '[{"id":"a","text":"The corners of the square-shaped windows and hatches","correct":true},{"id":"b","text":"The main wing spar attachment bolts","correct":false},{"id":"c","text":"The engine mounting frames","correct":false}]',
     '{"B1"}'),

    (s2_id, 'On an S/N curve used to assess fatigue, the ultimate fatigue life of a metal is normally allotted a fatigue index of:',
     '[{"id":"a","text":"100","correct":true},{"id":"b","text":"10","correct":false},{"id":"c","text":"1,000","correct":false}]',
     '{"B1"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M11A.2 Airframe Structures — General Concepts (continued: drainage,
    -- ventilation, lightning strike protection)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s2_id, 'On pressurised aircraft, external drain ports are fitted with drain valves mainly in order to:',
     '[{"id":"a","text":"Prevent loss of cabin pressure through the drain openings during flight","correct":true},{"id":"b","text":"Increase fuel flow to the drain masts","correct":false},{"id":"c","text":"Provide an emergency lightning discharge path","correct":false}]',
     '{"B1"}'),

    (s2_id, 'Drain masts, used for fluids from galleys and wash basins, are heated mainly to prevent:',
     '[{"id":"a","text":"Icing and blockage of the drain, since cruise temperatures can fall to about −60°C","correct":true},{"id":"b","text":"Corrosion of the fuselage skin around the mast","correct":false},{"id":"c","text":"Static electricity build-up on the airframe","correct":false}]',
     '{"B1"}'),

    (s2_id, 'Internal structural members such as lightening holes and ribs are designed to face downwards mainly so that:',
     '[{"id":"a","text":"Fluids do not become trapped and can run off towards the external drain points","correct":true},{"id":"b","text":"They reduce hoop stress in the fuselage skin","correct":false},{"id":"c","text":"They act as primary lightning conductors","correct":false}]',
     '{"B1"}'),

    (s2_id, 'A lightning strike on an aircraft can produce a peak current of up to:',
     '[{"id":"a","text":"100,000 amperes","correct":true},{"id":"b","text":"1,000 amperes","correct":false},{"id":"c","text":"10 amperes","correct":false}]',
     '{"B1"}'),

    (s2_id, 'Electrical bonding of major airframe components is provided mainly to:',
     '[{"id":"a","text":"Ensure all components are at the same electrical potential, providing a return path through the airframe","correct":true},{"id":"b","text":"Reduce the metal fatigue index of the structure","correct":false},{"id":"c","text":"Increase the critical Mach number of the airframe","correct":false}]',
     '{"B1"}'),

    (s2_id, 'Cables used specifically for electrical bonding of airframe components are referred to as:',
     '[{"id":"a","text":"Secondary conductors","correct":true},{"id":"b","text":"Primary conductors","correct":false},{"id":"c","text":"Drain conductors","correct":false}]',
     '{"B1"}'),

    (s2_id, 'Dedicated lightning protection conductors that cater for the high current of a strike, connecting power-plants to the airframe and joining major structural items after final assembly, are known as:',
     '[{"id":"a","text":"Secondary conductors","correct":false},{"id":"b","text":"Primary conductors","correct":true},{"id":"c","text":"Bonding straps only","correct":false}]',
     '{"B1"}'),

    (s2_id, 'Occupants of an aircraft are protected from electrical shock during a lightning strike because the surrounding aircraft structure acts as a:',
     '[{"id":"a","text":"Faraday Cage","correct":true},{"id":"b","text":"Pitot-static system","correct":false},{"id":"c","text":"Semi-monocoque shell only","correct":false}]',
     '{"B1"}');

END $$;
