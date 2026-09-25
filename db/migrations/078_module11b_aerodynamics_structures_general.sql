-- Module 11B: Piston Aeroplane Aerodynamics, Structures and Systems (B1) —
-- Aeroplane Aerodynamics and Flight Controls; Airframe Structures — General Concepts
-- Source: EASA Part-66 Module 11B official textbook (IKAROS Aviation Training Centre, IK M11B, Issue IK01 – OCT 2012)

DO $$
DECLARE
    m11_id INT;
    s1_id  INT;
    s2_id  INT;
BEGIN
    SELECT id INTO m11_id FROM easa_modules WHERE code = 'M11';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M11B.1') THEN
        RAISE NOTICE 'M11B.1-M11B.2 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module M11B.1: Aeroplane Aerodynamics and Flight Controls
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m11_id, 'M11B.1', 'Aeroplane Aerodynamics and Flight Controls',
        $cnt$
# Aeroplane Aerodynamics and Flight Controls

## Introduction

An aircraft is equipped with fixed and moveable surfaces, or aerofoils, which provide stability and control. Each item is designed for a specific function during the operation of the aircraft.

## Fixed Aerofoils

The fixed aerofoils are the wings or mainplanes, the horizontal stabiliser (tailplane) and the vertical stabiliser (fin). The function of the wings is to provide enough lift to support the complete aircraft. The tail section of a conventional aircraft, including the stabilisers, elevators and rudder, is occasionally known as the **empennage**.

### Horizontal Stabiliser

The horizontal stabiliser provides longitudinal pitch stability and is usually attached to the aft portion of the fuselage — it may be mounted on top of the vertical stabiliser, at some mid-point, or below it. Conventional horizontal stabilisers are placed aft of the wing and normally set at a slightly smaller or negative angle of incidence relative to the wing chord line, giving a small downward force on the tail, its value dependent on stabiliser size and its distance from the Centre of Gravity (CG).

### T-Tail Arrangement

The T-Tail places the complete stabiliser/elevator assembly on top of the vertical stabiliser. This ensures pitch control is not affected by turbulent air from the wing, and makes the vertical stabiliser and rudder control more effective due to the so-called **'end plate effect'**.

A T-Tail (and rear-engine) configuration would be dangerous if the aircraft entered a **'deep stall'**: at a very high angle of attack, airflow could make pitch control non-effective (and may cause the engines to flame out). To prevent this, T-Tailed aircraft have a **'stick push'** system to automatically recover them from excessive angles of attack. A further disadvantage is that the empennage structure is heavier than normal, due to strengthening needed to combat greater bending loads — however, since the pitch moment arm is increased, the stabiliser and elevators can be made smaller and lighter than conventional designs. Often, the complete stabiliser can be moved to provide longitudinal trim, negating the use of trim tabs.

### Vertical Stabiliser

The vertical stabiliser is the aerofoil forward of the rudder and provides directional stability. On single-engined propeller aircraft, the propeller causes the airflow to rotate rearward, striking one side of the vertical stabiliser more than the other and producing a yawing moment. These aircraft may have the leading edge of the stabiliser offset slightly, causing the airflow to pass around it in a manner that counters the yaw.

## Moveable Control Surfaces

Moveable control surfaces are normally divided into **primary** and **secondary** controls.

- **Primary controls**: elevators, rudder, ailerons and roll spoilers — used to make the aircraft follow the correct flight path and execute manoeuvres.
- **Secondary controls**: trim controls (tabs), high lift devices (flaps and slats), and speed brakes/lift dumpers (additional spoilers) — used to change lift and drag characteristics or assist the primary controls.

*Note: traditionally spoilers were not classed as primary controls, but those operating in conjunction with the ailerons during roll are considered primary.*

### Roll Control — Ailerons

Ailerons provide lateral (roll) control about the longitudinal axis. They are normally hinged at the trailing edge of the wing near the wing tip and move in opposite directions: the up-going aileron reduces lift on that side (wing goes down), the down-going aileron increases lift on the opposite side (wing rises).

Large aircraft often use two sets of ailerons per wing: a conventional set near the wing tip and another at mid-span or outboard of the flaps. The inboard set is referred to as **'high speed ailerons'**. The outboard surfaces work at low speed for maximum control during take-off and landing; at high cruising speed the outer ailerons are isolated and only the inboard set operates. If the outer ailerons were permitted to operate at high speed, the stress produced at the wing tips could twist the wing and produce **'aileron reversal'** — particularly likely on modern, highly flexible thin wings.

Ailerons are usually operated in conjunction with the rudder and/or elevator during a turn, rarely alone. A co-ordinated turn occurs without slip or skid: too little bank causes the aircraft to skid outwards, too much bank causes it to slip downwards.

### Roll Control — Spoilers

Used as a primary control, spoilers operate asymmetrically in conjunction with aileron movement and are called **roll spoilers**. They are mounted on top of the wing, just inboard of the outboard set of ailerons. Movement of the aileron control wheel deploys each spoiler progressively upwards with the up-going aileron, while on the down-going side the spoiler stays flush with the upper wing camber (via a spoiler/aileron mixer unit). The up-going spoiler spoils lift on the down-going wing, augmenting the up-going aileron's effect. On some aircraft, spoilers replace the ailerons completely as the sole means of roll control.

### Pitch Control — Elevators

Elevators govern aircraft movement in pitch about the lateral axis, normally attached to hinges on the rear spar of the horizontal stabiliser. Pushing the control column forward moves the elevators down; the resultant upward lift force raises the tail and lowers the nose. The reverse happens when the control is pulled back.

### Pitch Control — Stabilators

A stabilator (also called a **slab** or **all-flying tailplane**) combines the functions of the elevator and the horizontal stabiliser. It is a complete all-moving horizontal stabiliser that changes its angle of attack when the control column is moved, altering the total lift generated by the tail.

### Pitch Control — Variable Incidence Stabilisers

Incorporating a conventional elevator system, the variable incidence horizontal stabiliser is often used for pitch trim. A powerful electric motor varies its angle of attack when trim switches on the flight deck are operated.

### Canards

Some of the earliest powered aircraft (e.g. the Wright Flyer) had horizontal surfaces ahead of the wings — the **canard** or fore-plane configuration. A conventional tailplane at the rear provides a small, stabilising down force, meaning the wing must produce slightly more lift (and therefore more drag) to balance it. With the tailplane at the front, the stabilising force is directed upwards, contributing to total lift and reducing drag from the lift-producing wing.

A fundamental feature of canard design is that the fore-plane's angle of attack (ahead of the CG) is set greater than the main wing's, ensuring the fore-plane reaches its stalling angle first — producing a predictable nose drop and a certain recovery, while the main wing stays safely below the stalling angle and keeps producing lift. Stall sensing systems can also be triggered just before the fore-plane reaches its critical angle of attack.

### Yaw Control — Rudder

The rudder is a vertical control surface hinged at the rear of the fin, applying yawing moments about the vertical axis, controlled by rudder pedals. Pushing the right pedal moves the rudder right, generating a sideways 'lifting' force to the left which turns the nose to the right. Because of the power of some (particularly assisted) rudder systems, their range may be reduced at high speed by a speed-sensitive range limiting system. On large transport aircraft the rudder may comprise two or more operational segments moved by different operating systems, for redundancy.

### Combined-Function Controls — Elevons and Ruddervators

On delta-wing aircraft, pitch and roll control surfaces must both be fitted on the trailing edge of the wing — controls combining elevator and aileron function are called **elevons**, moving symmetrically for pitch or asymmetrically (via a mixer unit) for roll. **Ruddervators**, used on aircraft with a 'V' or butterfly tail, serve the combined purposes of both rudder and elevator.

## High Lift Devices

Aerodynamic lift is determined by the shape and size of the main lifting surfaces. To land a large, modern swept-wing airliner (designed for optimum cruise lift) on runways of reasonable length, the landing speed needs to be slower than the aircraft's 'clean' stalling speed — achieved with **high lift devices**.

These are divided into:
- **Leading edge devices**: slots, slats and Krueger flaps
- **Trailing edge devices**: plain, slotted and Fowler flaps

They increase lift, reducing the stalling speed and therefore the landing speed, which is typically **about 1.3 times the stalling speed** — drag also increases with large angles of trailing-edge flap deployment.

Some aircraft incorporate ailerons designed to move downwards together whenever the trailing-edge flaps are extended to the landing position, acting as additional plain flaps and providing extra drag (and lift) while still giving roll control if needed. These surfaces are referred to as **'Droop Ailerons'** or **'Flaperons'**.

## Drag Inducing Devices

Slower, high-drag light aircraft can simply close the throttle to slow to gliding speed before landing approach. Smooth, low-drag modern airliners need dedicated drag inducing devices, including spoilers, lift dumpers, speed brakes and, in unusual circumstances, lowering the landing gear and operating in-flight thrust reversers.

### Spoilers and Lift Dumpers

Spoilers and lift dumpers are usually hinged panels located about the mid-chord position on the upper wing surface, hydraulically operated, producing turbulence and drag and reducing lift when deployed. Spoiler uses include: primary roll control (as above); symmetrical part-deployment to slow the aircraft in cruise or descend steeply without accelerating (deployment angle may be variable via a flight compartment lever). **Lift dumpers** are spoiler panels incorporated solely to dump lift, normally deployed after landing to destroy wing lift and produce high drag, helping the wheel brakes stop the aircraft efficiently.

### Speed Brakes

The in-flight use of spoilers may be referred to as 'speed brakes', but the term more accurately describes devices solely for drag production without any change of trim. Rear-fuselage-mounted 'clamshell-type' doors, such as on the BAe 146 and Fokker 70/100, are **true speed brakes (air brakes)**. Their major advantage over spoilers: wing-mounted spoiler deployment often causes vibration/rumble felt in the cabin, whereas aft-mounted speed brakes produce high drag at any airspeed virtually vibration-free, with lift completely unaffected — permitting deployment on approach and making a go-around much safer.

## Airflow Control Devices

### Wing Fences

Usually fitted to swept-wing aircraft. Total airflow over a swept wing splits into a chordwise component and a spanwise component flowing towards the wing tip. Fences are fitted about mid-span, on the leading edge, extending rearwards, to control the spanwise flow of boundary layer air over the top of the wing. They also straighten the airflow over the ailerons (improving effectiveness) and straighten air nearer the wing tip, reducing 'spillage' of air from beneath the wing to the top and thereby reducing drag.

### Saw Tooth Leading Edges

More common on military aircraft than modern airliners. The saw tooth/notch is a small increase in wing chord on the outer wing. The step where the change occurs forms an invisible 'wall' of high-velocity air which straightens the spanwise flow — functioning like a wing fence but without the extra drag and weight penalty.

### Winglets

Seen on later-generation airliners and business jets: the outboard wing is upswept to an extreme dihedral angle. Winglets work best at higher speeds, giving better airflow control and reducing wing drag by using the up-flow from below the wing to produce forward thrust (rather like a yacht sail). Winglets add weight and increase parasitic drag, but the large reduction in induced drag at the wingtip results in a significant fuel saving.

## Boundary Layer Control

The boundary layer is the layer of air adjacent to the aerofoil surface, where air velocity varies from zero at the surface to the free-stream velocity at the outer extremity. At the leading edge the boundary layer is normally **laminar** (smooth thin sheets close to the surface), becoming thicker and **turbulent** towards the trailing edge; the region where flow changes from laminar to turbulent is the **transition point**. As airspeed increases, the transition point tends to move forward, so designers try to maintain laminar flow over the top of the wing as far back as possible.

### Vortex Generators

Small plates or wedges projecting up from the aerofoil surface about **25 mm** (about 3 times the typical boundary layer thickness) into the free-stream air. They shed small, lively vortices from their tips which act as scavengers, mixing high-energy free-stream air into the sluggish boundary layer air and invigorating it — pushing the transition point backwards towards the trailing edge. The small drag created by the vortices is far outweighed by the boundary layer drag they save; they also weaken the shock wave (and reduce shock drag) at high speed.

### Stall Wedges

Small, wedge-shaped strips (also called stall strips) mounted on the leading edge of the wing at about **one-third span**, designed to disrupt boundary layer airflow at large angles of attack near the stall, ensuring the airflow breaks away (stalls) at the wing root first. At smaller angles of attack they produce a similar effect to a wing fence, giving smoother airflow over the ailerons and retaining optimum roll control.

### Leading Edge Devices

Leading edge droop flaps and Krueger flaps prevent laminar separation at the low-speed end of the range, controlling boundary layer air. They can be a droop snoot, a permanent droop type, or adjustable in flight.

## Trim Tabs

During flight an aircraft tends to deviate from a straight-and-level 'hands-off' attitude (due to fuel state, speed, load position, flap/gear selection, etc.). Continuously correcting this manually would fatigue the crew, so **trim tabs** are used instead. Trim tabs move the primary control surface aerodynamically in the opposite direction to the movement of the tab. For example, to correct a 'nose down' condition, the elevator tab moves down, causing the elevator to move up, the tail to move down, and the nose to come up.

| Tab type | How it works |
|---|---|
| **Fixed** | Simple sheet-metal tab bent by trial and error on the ground, or connected by a ground-adjustable rod, for zero control force in cruise |
| **Controllable** | Adjusted from the flight deck (wheel, lever, switch) by mechanical, electrical or hydraulic means; position shown on a flight deck indicator |
| **Servo (flight tabs)** | Connected directly to flight deck inputs; act as a 'power booster' — pilot effort deflects only the small tab, and the aerodynamic force on the tab moves the primary control |
| **Balance** | Hinged to the primary surface but connected (via adjustable rod) to the fixed aerofoil; moves opposite to the control surface and assists its movement; 'geared balance tabs' allow the range of deflection to be altered |
| **Anti-balance** | Moves in the same direction as the primary control surface, adding to pilot effort ('feel') to prevent over-stressing the airframe |
| **Spring** | Provides progressively increasing aerodynamic assistance with increasing airspeed, via a torque rod assembly (spring box); at low speed the tab stays in the same relative position (no assistance); at higher speed the torque tube twists (or spring compresses), deflecting the tab and assisting the pilot |

*Note: aircraft with hydraulic fully-powered (irreversible) flying controls do not have trim tabs, since trim tabs would be aerodynamically ineffective on an irreversible system — trimming instead moves the primary control surface to a new neutral datum.*

## Mass Balance

All aircraft structures distort when loads are applied and, being elastic, spring back when the load is removed or its point of application changes. Because a control surface is hinged near its leading edge, its centre of gravity lies aft of the hinge — more weight aft of the hinge than forward of it.

If, for example, an aileron's wing distorts upwards under air load, the aileron may 'lag' behind and distort downwards, producing an extra upward aerodynamic force that pushes the wing up further. The wing then springs back, the aileron lags upwards this time, forcing the wing down further than elastic recoil alone would cause — the cycle repeats, producing a high-speed oscillation called **flutter**.

Flutter can be prevented by moving the control surface's centre of gravity in line with, or slightly ahead of, the hinge line — normally achieved by adding high-density weights (usually lead or depleted uranium) within the leading edge or externally ahead of the hinge line. This procedure is called **mass balancing** of the controls.

## Control Surface Bias

When a control surface is set so it is not in the true neutral position, it is said to have a **bias** — often used to compensate for design features. For example, a single-propeller aircraft that tends to roll opposite to the engine's torque may have its ailerons offset (one slightly up, the other down) to counteract this moment; once the aircraft flies level with the bias set, the cabin trim gauge is set to read zero.

## Aerodynamic Balance

To overcome high stick forces on larger aircraft at higher speeds, the control surfaces themselves are used to lighten the pilot's forces — this is **aerodynamic balancing**, achieved principally by three methods: **horn balance**, **inset hinge**, and **pressure (balance panel) balancing**.

### Horn Balance

A small part of the primary control surface ahead of the hinge projects into the airflow when the control is deflected from neutral. The airflow on this side assists the movement of the control in the desired direction, opposing the air loads aft of the hinge that would otherwise try to push the surface back towards neutral (making the controls feel heavy). With the correct proportion of balance area forward of the hinge to control area aft of it, control loads become more manageable.

### Inset Hinge

Similar in effect to the horn balance, but instead of a forward projection at one or both ends of the control surface, the hinge itself is set back so the area forward of the hinge line is spread evenly along the whole length of the surface.

### Balance Panels

Fitted between the leading edge of the aileron (ahead of the hinge) and the rear face of the wing on a few aircraft. When the aileron deflects, high-velocity, low-pressure air passing over the gap decreases pressure under (or above) the balance panel and pulls it down (or up). The force on the panel is proportional to airspeed and control surface deflection, assisting the pilot in moving the controls.
        $cnt$,
        1
    ) RETURNING id INTO s1_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module M11B.2: Airframe Structures — General Concepts
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m11_id, 'M11B.2', 'Airframe Structures — General Concepts',
        $cnt2$
# Airframe Structures — General Concepts

## Airworthiness Requirements for Structural Strength

Airworthiness requirements exist so that established standards of strength, control and maintainability ensure all aircraft are built to the safest possible standard. Requirements for aircraft above **5700 kg MTWA** (maximum total weight authorised) are listed in **EASA-25**; for aircraft below 5700 kg MTWA, in **EASA-23**. These cover not only basic requirements like maximum and minimum 'g' loading, but a wide range of others, including: control loads, door operation, effect of tabs, factor of safety, fatigue, high lift devices, stability and stalling, ventilation, and weights.

## Structural Classification

For assessing damage and the type of repair required, aircraft structure is divided into three categories: **primary**, **secondary** and **tertiary** structure. Manufacturers prepare diagrams showing which members fall into each category. In the manuals of older aircraft, colour was used to identify the categories: **Primary Structure in Red, Secondary in Yellow, Tertiary in Green** (this system has been discontinued for many years, but may still be found on aircraft with a life of 30+ years).

### Primary Structure

Includes all portions of the aircraft whose failure, in flight or on the ground, would be likely to cause: catastrophic structural collapse, inability to operate a service, injury to occupants, loss of control, unintentional operation of a service, or power unit failure. Examples: engine mountings, fuselage frames, main floor members, main spars.

### Secondary Structure

Includes portions that would normally be regarded as primary structure but which unavoidably have such a reserve of strength over design requirements that appreciable weakening may be permitted without risk of failure; also structure whose damage would not impair aircraft safety. Examples: ribs and parts of skin in the wings; skin and stringers in the fuselage.

### Tertiary Structure

Includes portions where stresses are low but which cannot be omitted from the aircraft for various reasons. Typical examples: fairings, fillets and brackets supporting items in the fuselage and adjacent areas.

## Fail Safe, Safe Life and Damage Tolerant Concepts

### Fail Safe

A fail-safe structure retains, after the initiation of a fracture or crack, sufficient strength for aircraft operation with an acceptable standard of safety, until the failure is detected at a normal scheduled inspection. This is achieved by part- and full-scale airframe testing, fatigue analysis (usually by the manufacturer), and subsequent in-service experience.

### Safe Life

Safe life structures and components are granted a period of time during which failure is considered extremely unlikely, taking into account the effects of wear, fatigue and corrosion. For example, if tests show fatigue will cause failure at **12,000 flying hours**, **one sixth of this** might be quoted as the safe life — i.e. **2,000 hours**, after which the component is scrapped. If wear or corrosion would cause failure sooner, that becomes the deciding factor. Safe life may be expressed in flying hours, elapsed time, number of flights, or number of load applications (e.g. pressurisation cycles).

### Damage Tolerance

The fail-safe method proved somewhat unreliable following accidents that showed the concept was not 100% guaranteed, and adding extra structural members to protect structural integrity considerably increased aircraft weight. The **damage tolerant** concept eliminates much of this extra weight by distributing loads over a larger area, requiring an evaluation of the structure to provide **multiple load paths**. Even with a crack present, the structure retains its integrity, and the crack is found during scheduled maintenance before it becomes critical. For example, a wing-to-fuselage attachment that in the past used one or two large pintle bolts (heavily reinforced, adding weight) now uses a larger number of smaller bolts in the fitting — a lighter, multiple-load-path construction that still maintains strength.

## Zonal and Station Identification System

### Zonal System

During maintenance operations (component changes, structural repairs, trouble-shooting), engineers need to be directed to the correct location within the structure. The **zonal system** divides the airframe into a number of zones (usually fewer than 10), giving a rough idea of where to look, and may also be used in component labelling and work card area identification. For example, work card number **500376** indicates Job 376 located on the left wing (**Zone 500**).

### Station Identification System

Most manufacturers use a system of station marking where, for example, the aircraft nose is designated **Station 0**, with other stations located at measured distances aft of this point. Components within the wings, tailplane, fin and nacelles are established from separate, dedicated station zeros.

- **Fuselage locations**: a fuselage station (or frame), e.g. Station 5050, means the frame is located 5.05 metres (5050 mm) aft of station zero (metric system).
- **Lateral locations**: many manufacturers use the fuselage centreline as station zero, with wing or tailplane ribs identified by a distance to the right or left of the centreline.
- **Vertical locations**: usually measured above or below a **'water line'** — a predetermined reference line along the side of the fuselage, usually somewhere between floor level and window line.

## Loads Found Within the Structure — Stress and Strain

Aircraft structural members are designed to carry a load or resist stress, and a single member may be subjected to a combination of stresses during flight. When an external force acts on a body, it is opposed by a force within the body, called **stress**. If the body is distorted by the stress, it is said to be subject to **strain**.

- **Stress** = Load or Force ÷ Cross Sectional Area
- **Strain** = Distortion ÷ Original Length

There are five major stresses found within an aircraft structure, and the structure is designed with a reserve of strength for safety:

| Stress | Description |
|---|---|
| **Compression** | Primary stress; resistance to an external force tending to push the body together (e.g. rivet shanks expanding as they are driven) |
| **Tension** | Primary stress that tends to pull an object apart (e.g. a flexible steel control cable, which has little resistance to compression, torsion or shear but an exceptional strength/weight ratio in tension) |
| **Bending** | A combination of compression and tension — one side of a beam is pulled apart while the other is squeezed together (e.g. a wing spar: in flight the top is compressed and the bottom is in tension; on the ground the reverse occurs) |
| **Torsion** | Twisting stress — a tensile stress acts diagonally across the member, and a compressive stress acts at right angles to it (e.g. an aircraft piston engine crankshaft driving the propeller) |
| **Shear** | Resists the tendency to slice a body apart (e.g. a clevis bolt securing flexible control cables to a control surface — a high-strength steel bolt with a thin head and fat shank, designed to take shear loads only) |

### Hoop Stress

On a pressurised fuselage, the circumferential load about the fuselage is known as **hoop stress**, resisted by the fuselage frames and tension in the stressed skin. The longitudinal (axial) load along the fuselage is resisted by tension in the skin and by the longerons and stringers.

### Metal Fatigue

Metal fatigue is the loss of strength, or resistance to load, experienced by a component as the number of load cycles or reversals increases. It is relatively easy to design a structure for a steady load, but aircraft experience widely varying loads and load reversals in flight (e.g. wings, where aerodynamic forces during manoeuvres alternate tension and compression). Any metal part subjected to a wide variation or reversal of even a relatively small load is gradually and progressively weakened.

The subject was vividly highlighted in **1954**, when pressurisation-cycle load reversals caused fatal accidents to the **De Havilland Comet** airliner: small fatigue cracks accumulated around the corners of the square-shaped windows and hatches, leading to explosive decompression of the cabin. This led to the most extensive research into the problem to that date, and fatigue loading being included in future design considerations.

Provided the elastic limit is not exceeded, load reversals should leave a material unaffected; in reality minute cracks form, enlarge and join with other cracks over many cycles, eventually compromising strength and potentially causing catastrophic failure. Fatigue strength can be found by experimentation on full-scale fatigue rigs, run continuously to accumulate a fatigue life ahead of the oldest aircraft of that type in service. How an in-service aircraft consumes this fatigue index depends on its operating pattern (e.g. number of pressurisation cycles, take-off/landing profile). Stress amplitude plotted against endurance for a given mean stress produces an **'S/N Curve'**, from which the point (in cycles) at which the metal reaches its minimum acceptable strength — the **ultimate fatigue life**, normally allotted a fatigue index of **100** — can be determined. Designers can extend the index beyond 100 by examining how fatigue was consumed and recommending specific inspection, strengthening or replacement.

## Drainage and Ventilation Provisions

The aircraft structure requires drain holes and paths to prevent water and other fluids (fuel, hydraulic oil, etc.) collecting within the structure, which could become a corrosion and fire hazard. Drainage divides into two areas:

### External Drains

Located on exterior surfaces of the fuselage, wing and empennage, to dump fluids overboard. In small unpressurised aircraft (and unpressurised areas of larger airliners) drains may be permanently open; in pressurised aircraft, drain valves are needed to prevent cabin pressure loss. Common types rely on cabin air pressure to keep the valve closed (rubber flapper seal, spring-loaded valve seal, or a plunger type) — normally on the fuselage keel, open on the ground (unpressurised) to allow drainage, closed in flight by increased cabin pressure. A levelling compound (rubberised sealant) is used in areas that might become fluid traps, bringing the level up to the lip of the drain hole.

Fluids from galleys and wash basins need more than simple drain holes, since the temperature at cruising altitude can fall to **−60 °C** and draining water could freeze and block the drain. **Drain masts** — small aerofoil-shaped projections from the bottom of the aircraft skin, on the centreline — are used instead; they are heated to prevent icing and discharge liquids well away from the aircraft's skin.

### Internal Drains

Tubes, channels, dams and drain holes within the internal structure direct fluid flow towards the external drain points. Structural members are designed so they do not trap fluids — for example, lightening holes and ribs face downwards so fluids can run off them.

### Ventilation

Internal cavities must be properly vented to prevent the build-up of flammable vapour from drain lines and to allow moisture residue to evaporate — sumps, tanks and cavities are provided with vent pipes, and in some cases (e.g. engine cowlings) ram air inlets and outlets ensure adequate ventilation.

Modern aircraft normally provide dedicated compartments (e.g. avionics bays, hydraulic bays, air conditioning bays) for the majority of system components, allowing easier access for maintenance and replacement of line replaceable units (LRUs); older aircraft have components scattered throughout the airframe with more difficult access.

## Lightning Strike Provision

A lightning strike on an aircraft can have a peak current of up to **100,000 amperes**, so precautions are taken to minimise damage. Most important is **electrical bonding** of all major airframe components — connecting them together so they are at the same electrical potential, providing a return path through the airframe (modern aircraft use an earth return system). This ensures current from a strike cannot build up on one part of the structure and jump, at high voltage, to an electrically separated part such as a flying control surface. Bonding also protects equipment from static electricity build-up as the aircraft collects ions from the atmosphere. Bonding cables are referred to as **secondary conductors**.

Dedicated lightning protection systems for high current are known as **primary conductors** — connecting system earth returns, connecting power-plants to the airframe, and ensuring major structural items (often manufactured in different factories/countries) are properly connected after final assembly. Aircraft occupants are protected from electrical shock by the surrounding structure acting as a **'Faraday Cage'**.

## Construction Methods

### Stressed Skin Fuselage

In early aircraft, all loads were taken by the framework, with fabric or thin wood covering contributing little or nothing to strength. As design evolved, aluminium alloy sheet replaced fabric/wood — because of its extra strength, a large part of the load can be borne by the skin, reducing the weight of underlying structure. This is called **stressed skin** construction, also giving a smooth surface (the skin is stiff enough not to distort under airflow) and is particularly useful for carrying pressurisation loads.

- **Pure monocoque**: skin carries all the loads without supporting structure (example: a chicken's egg — the shell alone carries the load). In practice this is difficult to achieve, as the skin would need to be so thick that the weight penalty would severely impair flight.
- **Semi-monocoque**: about half the loads are carried by the skin and half by the supporting structure — the type used in stressed skin fuselage construction. Its advantage is that the space within the structure is unobstructed, available for passengers and freight.

### Frames and Formers

Provide the basic fuselage shape; frames (more robust) provide strong points for attaching other fittings such as wings and tailplane.

### Bulkheads

Provide extra support for mounting components such as wings and landing gear, transferring loads to the fuselage structure without producing stress-raising points. Bulkheads may be a complete or partial circular frame, often reinforcing a fuselage frame — solid pressurisation bulkheads are typically found at the front of the fuselage ahead of the flight deck and at the rear of the pressure cabin, or as an engine firewall on nacelles.

### Longerons and Stringers

**Longerons** are used where an aperture (door/window) requires greater support, or where high-load points (floors, landing gear attachments, etc.) need interconnecting — usually of heavier construction than stringers, solid extrusions or fabricated multi-part construction. **Stringers** provide longitudinal shape and support to the fuselage skin, and are also the spanwise members of the mainplanes, stabilisers and flying control surfaces — often attached to frames with fillets or gussets.

### Doublers and Reinforcement

Where skin needs extra strengthening (at plate junctions or around small apertures), a second layer of skin — a **doubler** or **doubler plate** — is attached over the original. Where loads are concentrated, the structure can be strengthened with thicker material or added layers, the amount of reinforcement dictated by the stress carried in each area.

### Struts and Ties

Any structural item designed solely to take a **compressive** load is a **strut**; an item that only takes a **tensile** load is a **tie**. A high-performance biplane is a good example: the struts separating the pairs of wings are in compression, and the interconnecting flying wires are in tension, taking all the loads produced by the wing.

### Beams and Floor Structures

Beams support the flight deck and passenger cabin floors laterally and longitudinally, and provide strong-point attachments for crew and passenger seats, constituting primary structure. Modern cabin flooring is usually made from removable composite honeycomb core panels, whereas the flight deck is often metal panels supported on beams.

### Methods of Skinning

Light aircraft skins are usually simple, thin aluminium alloy sheets riveted to the internal structure. Larger aircraft (developed since the 1950s) use heavier material with thicker sections where extra strength is needed. To avoid the weight penalty of uniformly thick skins, sheets were later rolled individually to varying thickness across each sheet. The latest methods **machine or mill** each skin panel individually from a solid billet, including all stringers and risers, providing exactly the right thickness at each location with no excess material — termed **milled** or **machined skin**, giving maximum strength and rigidity with minimum weight. Panels of varying thickness can also be produced by **chemical etching**, which removes treated areas to about half their thickness without introducing stress raisers — producing so-called **'waffle plates'**.

### Anti-Corrosive Protection

Materials are selected primarily for strength but may readily suffer corrosion damage unless effectively protected. During manufacture, surface treatments are applied: heat treatment to refine grain structure, sacrificial coatings (plating/cladding) to retard corrosion onset, epoxy primers, special paint finishes, wet-assembly techniques, and barrier sealants against dirt and moisture ingress. Corrosive attack may extend over an entire surface, penetrate locally to form pits, or follow grain boundaries, and may be aggravated by external or internal (manufacturing) stresses. Good maintenance practice (keeping coatings free of scratches/dents, keeping drains clear, keeping the aircraft clean, removing galley/toilet spills and corrosive engine exhaust deposits) helps prevent or contain in-service corrosion.

### Construction Methods — Wing

Cantilever wings require a spanwise member of great strength, usually a spar, in **monospar**, **two-spar** or **multispar** designs. Most modern airliner wings comprise top and bottom skins with spanwise stringers, front and rear spars, and chordwise wing ribs between the spars, forming a robust box-like shape — nose ribs and trailing edge fittings complete the aerofoil shape. Wing structures carry some of the heaviest loads in the aircraft, so fittings and joints must be carefully proportioned to pick up and redistribute loads gradually, minimising stress concentrations.

### Construction Methods — Empennage

The vertical and horizontal stabilisers, elevators and rudder are constructed similarly to the wings but on a smaller scale — spars as the main structural members, with stringers, ribs and stressed skin completing the design.

### Construction Methods — Engine Attachments

Engine mountings transmit propeller or turbojet thrust to the airframe, constructed from welded alloy steel tubing, formed sheet metal, forged alloy fittings, or a combination. All engine mounts must absorb the forward thrust during normal flight, the reduced force of reverse thrust, and engine/propeller vibrations.

## Structural Assembly Techniques

The most common attachment method is rivets or more sophisticated fasteners; where high strength is required, nuts and bolts are used; other assembly uses adhesive bonding.

### Solid Shank Rivets

The majority of aircraft structure is held together with solid rivets. Rivets are manufactured in five main materials:
- **'A' rivets** — pure aluminium, for non-structural applications
- **'AD' rivets** — aluminium with copper and magnesium added, heat treated to be strong yet formable; a very popular rivet
- **'D' rivets** (2017 alloy) and **'DD' rivets** (2024 alloy) — stronger than AD, requiring heat treatment to soften before forming (usable within one hour for 'D' and ten minutes for 'DD', or refrigerated to remain useable for about 10 days)
- **'B' rivets** (5056 alloy, magnesium with a little manganese and chromium, no copper) — used for riveting magnesium alloy sheets, since copper in contact with magnesium causes dissimilar-metal corrosion

A rivet's full identification includes head style, material, diameter (in 1/32 inch units) and length (in 1/16 inch units) — e.g. MS20470AD4-4 has a universal head, is made from AD (2117) alloy, is 1/8" diameter (4 × 1/32") and 1/4" long (4 × 1/16").

### Special and Blind Fasteners

Used where solid shank rivets are impractical. **Special fasteners** (e.g. High Shear rivets) provide extra strength such as high shear strength, installed with special tools. **Blind fasteners** can be installed from one side of the work, and include **Chobert** (closed by pulling a mandrel through the bore, sealed with a separate sealing pin), **Tucker/'Pop'** (break-head or break-stem types; long break-stem types leave the stem in place for greater shear strength), **Cherry** (stem positively locked by a collar forced into a groove — Cherry Lock and Cherry Max types), and **Avdel** (each fitted with its own stem, which breaks off proud of the head at a predetermined load, sealing the rivet — shear strength similar to a solid rivet). Other special fasteners include Hi-Shear, Avdelock, Jo-Bolts and **Rivnuts** (which leave a fixed nut behind after closing, for attaching items such as de-icing boots and floor coverings).

### Bolts and Nuts

A **bolt** holds two or more parts together and may be loaded in shear, tension, or both, with an unthreaded portion of the shank called the grip. General purpose structural bolts (AN3 to AN20) have hexagonal heads, are made from alloy steel with UNF threads, and their diameter is given by the AN number in 1/16 inch units (e.g. AN3 = 3/16" diameter, AN11 = 11/16" diameter); bolt length increases in 1/8" increments shown by a dash number (e.g. AN3-7 = 7/8" long).

**Clevis bolts** (AN21 to AN36) are designed for pure shear load applications such as control cables — a slotted domed head, with only a short portion of the shank threaded, allowing the bolt to rotate freely in its hole.

All aircraft nuts require a locking device to prevent loosening — a split pin through a castellated nut, a locking insert gripping the thread, a spring-type lock-washer, or locking wire. There are two basic types: **self-locking** nuts (lock onto the bolt with no external help) and **non-self-locking** nuts (rely on a split pin, lock-nut, locking washer or locking wire). **Anchor nuts** are permanently mounted on nut plates, allowing inspection panels and access doors to be removed and installed without access to the reverse side of the work (often mounted 'floating' to allow small positional differences). **Tinnerman nuts**, made from sheet steel, are used mainly on light aircraft for fitting instruments and inspection panels.

### Adhesive Bonded Structures

Adhesive bonding joins materials using special adhesives — historically, the **'Redux'** epoxy resin system was a common metal-to-metal bonding adhesive, a hot-melt, hot-cure adhesive supplied in partly cured strips or sheets. In metal-to-metal bonding, adhesive strips are placed between components, the joint clamped, and the assembly cured in an **autoclave** (typically not above 100–150 °C, under constant clamping/vacuum force), producing bonded joints as strong as, or stronger than, equivalent riveted joints. Aircraft such as the **Fokker 50/70/100** and **BAe 146/RJ** use adhesive bonding extensively for primary metal structure, with very few rivets — British Aerospace claims over 10,000 rivets are avoided on the BAe 146/RJ, saving weight, riveting work, and the risk of in-service cracks emanating from rivet holes. Adhesive bonding also improves the sealing of integral fuel tanks compared to riveted assemblies.

## Methods of Surface Protection

- **Anodising** — an electrolytic treatment protecting aluminium-based alloys, coating the metal with a hard, waterproof, air-tight oxide film that can accept a coloured dye for identification and provides an excellent base for organic finishes and bonding adhesives; it also acts as an insulator, so the surface must be removed before attaching bonding leads.
- **Organic finishes**: **Synthetic Enamel** (older, cures by oxidation, good finish but poor chemical/wear resistance), **Acrylic Lacquer** (popular, easy to apply, fairly good chemical/weather resistance), **Polyurethane** (one of the most durable, high wear/fading/chemical resistance, 'wet look').
- **Chromating** — chromate coatings protect magnesium-based alloys, zinc and its alloys; components are immersed in a bath containing potassium bichromate, producing a yellowish coating that can be locally restored with Alocrom 1200.
- **Cladding** — copper and zinc, the two metals most commonly alloyed with aluminium for high-strength skins, suffer extensively from corrosion; **'Alclad'**, a soft, highly corrosion-resistant pure aluminium skin, is rolled onto the face of each base alloy sheet as protection.

### Surface Cleaning and Corrosion Control

Dirt can cover cracked or damaged components and trap moisture and solvents that lead to corrosion. Pitot tubes, static vents, wheels, tyres and brakes must be protected during exterior cleaning; only manufacturer-approved cleaning agents are used. One unseen effect of non-approved cleaning agents is **hydrogen embrittlement** — hydrogen from the agent is absorbed into the metal, causing minute cracks and leading to stress corrosion failure.

## Alignment and Symmetry

Heavy landings, accidental damage, or major component replacement can require special checks to confirm the aircraft is symmetrical and aligned before its next flight, measured from datum points (wing tips, nose, horizontal stabiliser, top of vertical stabiliser) — on light aircraft using a surveyor's tape measure, on larger aircraft using optical theodolite methods, sighting rods, or laser ranging. Deeper checks on wing, tail and control surface angles are known as **'rigging checks'**, carried out using purpose-built levelling boards and an accurate measuring device known as a **Clinometer**.
        $cnt2$,
        2
    ) RETURNING id INTO s2_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M11B.1 Aeroplane Aerodynamics and Flight Controls (16 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s1_id, 'The T-Tail arrangement makes the vertical stabiliser and rudder control more effective, due to the so-called:',
     '[{"id":"a","text":"''End plate effect''","correct":true},{"id":"b","text":"''Venturi effect''","correct":false},{"id":"c","text":"''Ground effect''","correct":false}]',
     '{"B1"}'),

    (s1_id, 'On single-engined propeller aircraft, the leading edge of the vertical stabiliser may be offset slightly in order to:',
     '[{"id":"a","text":"Reduce structural weight","correct":false},{"id":"b","text":"Counter the yawing moment caused by the rotating propeller slipstream striking one side of the stabiliser more than the other","correct":true},{"id":"c","text":"Improve fuel efficiency at cruise speed","correct":false}]',
     '{"B1"}'),

    (s1_id, 'If outer (outboard) ailerons were permitted to operate at high speed, the resulting wing-tip stress could twist the wing and produce a phenomenon known as:',
     '[{"id":"a","text":"Aileron reversal","correct":true},{"id":"b","text":"Aileron droop","correct":false},{"id":"c","text":"Aileron flutter lock","correct":false}]',
     '{"B1"}'),

    (s1_id, 'Roll spoilers, used as a primary control in conjunction with the ailerons, are mounted:',
     '[{"id":"a","text":"On top of the wing, just inboard of the outboard set of ailerons","correct":true},{"id":"b","text":"Underneath the wing, near the wing root","correct":false},{"id":"c","text":"On the leading edge of the fin","correct":false}]',
     '{"B1"}'),

    (s1_id, 'A stabilator (all-flying or ''slab'' tailplane) is a control surface that:',
     '[{"id":"a","text":"Combines the functions of the elevator and the horizontal stabiliser in one all-moving surface","correct":true},{"id":"b","text":"Is only found on delta-wing aircraft, replacing the rudder","correct":false},{"id":"c","text":"Provides yaw damping only, with no effect on pitch","correct":false}]',
     '{"B1"}'),

    (s1_id, 'On a canard-configured aircraft, the fore-plane''s angle of attack is set:',
     '[{"id":"a","text":"Lower than the main wing, so the main wing always stalls first","correct":false},{"id":"b","text":"Greater than the main wing, so the fore-plane reaches the stalling angle first","correct":true},{"id":"c","text":"Identical to the main wing, so both surfaces stall simultaneously","correct":false}]',
     '{"B1"}'),

    (s1_id, 'On a delta-wing aircraft, control surfaces on the trailing edge that provide combined pitch and roll control by moving symmetrically or asymmetrically are called:',
     '[{"id":"a","text":"Ruddervators","correct":false},{"id":"b","text":"Elevons","correct":true},{"id":"c","text":"Flaperons","correct":false}]',
     '{"B1"}'),

    (s1_id, 'On an aircraft fitted with a ''V'' or butterfly tail, the surfaces that serve the combined purposes of rudder and elevator are called:',
     '[{"id":"a","text":"Elevons","correct":false},{"id":"b","text":"Ruddervators","correct":true},{"id":"c","text":"Spoilerons","correct":false}]',
     '{"B1"}'),

    (s1_id, 'High lift devices are divided generally into leading edge devices (slots, slats and Krueger flaps) and trailing edge devices (plain, slotted and Fowler flaps); the resulting landing speed is typically:',
     '[{"id":"a","text":"About 1.3 times the stalling speed","correct":true},{"id":"b","text":"Exactly equal to the stalling speed","correct":false},{"id":"c","text":"About twice the stalling speed","correct":false}]',
     '{"B1"}'),

    (s1_id, 'Compared with wing-mounted spoilers used as speed brakes, true speed brakes such as the rear-fuselage clamshell doors on the BAe 146 and Fokker 70/100 have the major advantage that:',
     '[{"id":"a","text":"They produce high drag with virtually no cabin vibration, and lift remains completely unaffected","correct":true},{"id":"b","text":"They can only be used on the ground","correct":false},{"id":"c","text":"They increase lift as well as drag","correct":false}]',
     '{"B1"}'),

    (s1_id, 'Wing fences, fitted about mid-span on the leading edge of swept wings, are designed primarily to:',
     '[{"id":"a","text":"Control the spanwise flow of boundary layer air over the top of the wing","correct":true},{"id":"b","text":"Increase the aircraft''s maximum permissible Mach number","correct":false},{"id":"c","text":"Provide additional fuel tank capacity","correct":false}]',
     '{"B1"}'),

    (s1_id, 'Winglets, fitted to the upswept outboard part of a wing, reduce drag mainly by:',
     '[{"id":"a","text":"Using the up-flow from below the wing to produce a forward thrust, reducing induced drag at the wingtip","correct":true},{"id":"b","text":"Eliminating the wing''s boundary layer entirely","correct":false},{"id":"c","text":"Reducing the wing''s angle of incidence","correct":false}]',
     '{"B1"}'),

    (s1_id, 'Vortex generators, small plates or wedges projecting about 25 mm from the aerofoil surface, work by:',
     '[{"id":"a","text":"Shedding vortices that mix high-energy free-stream air into the sluggish boundary layer, pushing the transition point back towards the trailing edge","correct":true},{"id":"b","text":"Blocking airflow completely over the outer wing at high angles of attack","correct":false},{"id":"c","text":"Reducing the wing''s structural weight","correct":false}]',
     '{"B1"}'),

    (s1_id, 'Stall wedges (stall strips), mounted on the leading edge of the wing at about one-third span, are designed to ensure that:',
     '[{"id":"a","text":"The wing root stalls first, so roll control is retained during the stall","correct":true},{"id":"b","text":"The wing tip stalls first, to reduce landing distance","correct":false},{"id":"c","text":"The ailerons stall before the rest of the wing","correct":false}]',
     '{"B1"}'),

    (s1_id, 'The three principal methods used to achieve aerodynamic balance of a primary flight control are:',
     '[{"id":"a","text":"Horn balance, inset hinge, and pressure (balance panel) balancing","correct":true},{"id":"b","text":"Mass balance, control surface bias, and trim tabs","correct":false},{"id":"c","text":"Vortex generators, wing fences, and stall wedges","correct":false}]',
     '{"B1"}'),

    (s1_id, 'Mass balancing of a control surface — adding high-density weights ahead of the hinge line — is carried out primarily to prevent:',
     '[{"id":"a","text":"Flutter, caused by the control surface lagging behind the elastic distortion of the aerofoil","correct":true},{"id":"b","text":"Control surface bias","correct":false},{"id":"c","text":"Aerodynamic stall of the control surface","correct":false}]',
     '{"B1"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M11B.2 Airframe Structures — General Concepts (17 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s2_id, 'Structural strength requirements for aircraft above 5700 kg maximum total weight authorised (MTWA) are listed in:',
     '[{"id":"a","text":"EASA-23","correct":false},{"id":"b","text":"EASA-25","correct":true},{"id":"c","text":"EASA-66","correct":false}]',
     '{"B1"}'),

    (s2_id, 'For the purpose of assessing damage and the type of repair to be carried out, aircraft structure is divided into three categories:',
     '[{"id":"a","text":"Primary, Secondary and Tertiary structure","correct":true},{"id":"b","text":"Fixed, Moveable and Auxiliary structure","correct":false},{"id":"c","text":"Internal, External and Composite structure","correct":false}]',
     '{"B1"}'),

    (s2_id, 'A fail-safe structure is one which, after the initiation of a fracture or crack:',
     '[{"id":"a","text":"Retains sufficient strength for continued safe operation until the failure is detected at a normal scheduled inspection","correct":true},{"id":"b","text":"Must be replaced immediately regardless of remaining strength","correct":false},{"id":"c","text":"Automatically self-repairs the crack in flight","correct":false}]',
     '{"B1"}'),

    (s2_id, 'If fatigue testing shows that a component will fail after 12,000 flying hours, and the safe life is quoted as one sixth of this figure, the component''s safe life would be:',
     '[{"id":"a","text":"2,000 hours","correct":true},{"id":"b","text":"6,000 hours","correct":false},{"id":"c","text":"12,000 hours","correct":false}]',
     '{"B1"}'),

    (s2_id, 'The damage tolerant design concept reduces structural weight, compared with the fail-safe approach, mainly by:',
     '[{"id":"a","text":"Distributing loads over a larger area via multiple load paths, so a single crack does not compromise the whole structure","correct":true},{"id":"b","text":"Using thicker skins throughout the airframe","correct":false},{"id":"c","text":"Eliminating fatigue analysis and testing requirements","correct":false}]',
     '{"B1"}'),

    (s2_id, 'A work card numbered 500376, where 500 indicates the left wing, is an example of using which identification system?',
     '[{"id":"a","text":"The zonal system","correct":true},{"id":"b","text":"The station identification system","correct":false},{"id":"c","text":"The water line system","correct":false}]',
     '{"B1"}'),

    (s2_id, 'In the station identification system, the aircraft nose is normally designated:',
     '[{"id":"a","text":"Station 100","correct":false},{"id":"b","text":"Station 0","correct":true},{"id":"c","text":"Station 1000","correct":false}]',
     '{"B1"}'),

    (s2_id, 'Bending stress, as applied to a structural member such as a wing spar, is best described as:',
     '[{"id":"a","text":"A combination of compression and tension acting on opposite sides of the member","correct":true},{"id":"b","text":"A pure shear load only","correct":false},{"id":"c","text":"A pure torsional twisting load only","correct":false}]',
     '{"B1"}'),

    (s2_id, 'On a pressurised fuselage, the circumferential load acting on the fuselage skin, resisted by the frames and tension in the skin, is known as:',
     '[{"id":"a","text":"Hoop stress","correct":true},{"id":"b","text":"Torsional stress","correct":false},{"id":"c","text":"Shear stress","correct":false}]',
     '{"B1"}'),

    (s2_id, 'The De Havilland Comet accidents of 1954, which highlighted the dangers of metal fatigue, resulted from small fatigue cracks that developed:',
     '[{"id":"a","text":"Around the corners of the square-shaped cabin windows and hatches, due to pressurisation cycles","correct":true},{"id":"b","text":"In the main wing spars, due to gust loading only","correct":false},{"id":"c","text":"In the engine mountings, due to vibration","correct":false}]',
     '{"B1"}'),

    (s2_id, 'Drain masts, used at locations such as galleys and wash basins where cruise-altitude temperatures can fall to around −60°C, are:',
     '[{"id":"a","text":"Heated, to prevent the discharged fluid from freezing and blocking the drain","correct":true},{"id":"b","text":"Only fitted to unpressurised light aircraft","correct":false},{"id":"c","text":"Designed to be permanently closed in flight","correct":false}]',
     '{"B1"}'),

    (s2_id, 'A lightning strike on an aircraft can have a peak current of up to approximately:',
     '[{"id":"a","text":"1,000 amperes","correct":false},{"id":"b","text":"100,000 amperes","correct":true},{"id":"c","text":"10,000,000 amperes","correct":false}]',
     '{"B1"}'),

    (s2_id, 'Occupants of an aircraft are protected from electrical shock during a lightning strike because the surrounding, electrically bonded structure acts as a:',
     '[{"id":"a","text":"Faraday Cage","correct":true},{"id":"b","text":"Pressure vessel","correct":false},{"id":"c","text":"Resonant cavity","correct":false}]',
     '{"B1"}'),

    (s2_id, 'In a stressed-skin, semi-monocoque fuselage construction, the proportion of load carried by the skin compared with the supporting structure is approximately:',
     '[{"id":"a","text":"All of the load is carried by the skin, with no supporting structure","correct":false},{"id":"b","text":"About half by the skin and half by the supporting structure","correct":true},{"id":"c","text":"All of the load is carried by the supporting structure, with the skin carrying none","correct":false}]',
     '{"B1"}'),

    (s2_id, 'A structural item designed solely to take a compressive load is called a strut, while an item designed to take only a tensile load is called a:',
     '[{"id":"a","text":"Tie","correct":true},{"id":"b","text":"Longeron","correct":false},{"id":"c","text":"Doubler","correct":false}]',
     '{"B1"}'),

    (s2_id, 'Clevis bolts (AN21 to AN36), which secure flexible steel control cables to control surfaces, are designed for:',
     '[{"id":"a","text":"Pure shear load applications only","correct":true},{"id":"b","text":"Pure tension load applications only","correct":false},{"id":"c","text":"Combined torsion and bending loads","correct":false}]',
     '{"B1"}'),

    (s2_id, 'Anchor nuts are permanently mounted on nut plates so that inspection panels and access doors can be:',
     '[{"id":"a","text":"Removed and installed without requiring access to the reverse side of the work","correct":true},{"id":"b","text":"Bonded rather than fastened mechanically","correct":false},{"id":"c","text":"Permanently welded in place","correct":false}]',
     '{"B1"}');

END $$;
