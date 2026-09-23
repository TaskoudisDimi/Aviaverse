-- Module 13: Aircraft Aerodynamics (B2) — Aerodynamics and Flight Controls, Airframe Structures General Concepts
-- Source: EASA Part-66 Module 13 official textbook (IKAROS Aviation Training Centre, IK01, Issue Oct.2012)

DO $$
DECLARE
    m13_id INT;
    s1_id  INT;
    s2_id  INT;
BEGIN
    SELECT id INTO m13_id FROM easa_modules WHERE code = 'M13';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M13.1') THEN
        RAISE NOTICE 'M13.1-M13.2 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 13.1: Aerodynamics and Flight Controls
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m13_id, 'M13.1', 'Aerodynamics and Flight Controls',
        $cnt$
# Aerodynamics and Flight Controls

## Operation and Effect of Flight Controls

The development of the aeroplane was delayed by two problems: how to achieve stability and how to achieve control. Before the Wright brothers' successful flight in 1903, others had flown, but none had succeeded in controlling their aircraft.

**Stability** relates to maintaining the desired flight attitude with a minimum of pilot effort. **Control** involves rotating the aeroplane about one or more of its three axes.

Balanced aerodynamic forces cause a properly designed and trimmed aeroplane to fly straight and level with hands and feet off the controls, with equal lift produced by the wings.

### Longitudinal Control (Rotation about the Lateral Axis)

The aeroplane can be rotated nose upward about its lateral axis (**pitch up**) by increasing the downward tail load, or nose downward (**pitch down**) by decreasing the tail load.

The most generally used pitch control is the **fixed horizontal stabilizer with a movable elevator** hinged to its trailing edge. When the control wheel or stick is pulled back, the trailing edge of the elevator moves up, increasing the down load on the horizontal tail surface. The tail moves down and rotates the aeroplane nose-up about its lateral axis.

Some aeroplanes use a **stabilator** for pitch control instead. This is a single-piece horizontal surface that pivots about a point approximately **one third of the way back from the leading edge**. When the control wheel is pulled back, the leading edge of the stabilator moves down, increasing the downward force produced by the tail, and the nose rotates up. When the wheel is pushed in, the nose of the stabilator moves up, decreasing the tail load, and the aeroplane rotates nose down.

Any aeroplane that has the equivalent of two lifting surfaces, instead of the conventional horizontal stabiliser that provides a down load, can be classified as a **canard**. The canard is the forward surface, and frequently is also a control surface.

### Lateral Control (Rotation about the Longitudinal Axis)

To roll the aeroplane to the left, the control wheel is turned to the left. The **aileron on the left wing moves up**, decreasing the camber (curvature) of the left wing and decreasing the lift it produces. At the same time, the **aileron on the right wing moves down**, increasing the camber of the right wing and increasing the lift it produces. The difference in lift produced by the two wings rolls the aeroplane to the left.

### Directional Control (Rotation about the Vertical Axis)

The **rudder** is used on an aeroplane only to rotate it about its vertical axis. An aeroplane is turned by **tilting the lift vector with the ailerons**, not by using the rudder. The rudder is used only at the beginning of the turn, to overcome **adverse yaw** and start the nose moving in the correct direction, and for flight conditions such as crosswind landings and one-engine-inoperative operation.

The rudder is moved by rudder pedals operated by the pilot's feet. When the right pedal is pressed, the rudder swings to the right, creating an aerodynamic force that pulls the tail to the left.

## Trim Systems

In aviation, **trimming** means maintaining the equilibrium of an aircraft during flight without having to continuously apply steering force. For this reason, the following are installed in the aircraft:

- An **adjustable horizontal stabilizer** for trimming the pitch axis (pitch trim)
- **Adjustable trim surfaces** in rudders and ailerons
- **Electrical actuators** included in the cable system

The adjustable trim surfaces and actuators give trim possibilities for the longitudinal axis and the yaw axis.

## High Lift Devices

An aeroplane is a series of engineering compromises — between stability and manoeuvrability, between high cruising speed and low landing speed, and between high utility and low cost. Lift-modifying devices give good compromises between high cruising speed and low landing speed, because they can be extended only when needed and tucked away into the structure when no longer needed.

### Slots

Slots are nozzle-shaped passages through a wing, designed to improve airflow conditions at **high angles of attack and slow speeds**. They are normally placed very near the leading edge and built into the wing. As the wing's angle of attack increases, more air is deflected through the slot, maintaining streamline flow around the wing.

### Slats

A fixed slot is of use only at high angles of attack; at normal angles its presence only increases drag. This disadvantage is overcome by making the slot movable — a **slat** — which lies flush against the leading edge of the wing when not in use. The slat is hinged on supporting arms so that it moves automatically between its flush (retracted) position and its extended (operating) position. This type of slat is **fully automatic**, needing no separate control.

### Wing Flaps

A wing flap is defined by NACA as a hinged, pivoted or sliding aerofoil, usually near the trailing edge of the wing, designed to increase lift and drag when deflected. Flaps are used for both take-off and landing:

- **For take-off**, an intermediate setting is used, giving an increase of lift with little increase in parasite drag — allowing a shorter take-off run and lower take-off speed.
- **For landing**, the flaps are lowered fully. The increase in camber (and in some cases surface area) gives an increase of lift for any given speed, allowing a lower approach speed. Parasite drag is also increased significantly, allowing a steep approach without an increase in speed. This lets obstacles on the approach be cleared more easily, and the landing run is shorter with less wear on the landing gear.

**Types of flaps** — the trailing-edge flap has many variations, all serving to increase CL max. More efficient flaps are usually more mechanically complex, and their use is reserved for cases where the lowest possible stalling speed is essential.

- **Fowler Flap** — constructed so that the lower part of the trailing edge of the wing rolls back on a track, increasing the effective area of the wing while lowering the trailing edge.
- **Slotted Flap** — when extended (partially or completely), one or more slots form near the trailing edge. The slots allow high-energy air from the bottom of the wing to flow over the upper portion of the flap and downward at the trailing edge, helping prevent the airflow from breaking away into turbulence. This gives increased lift for similar angles of attack, and the maximum lift coefficient is greatly increased.
- **Kruger Flap** — a leading-edge flap that ordinarily fits smoothly into the lower part of the leading edge. When required, the surface extends forward and downward.

## Drag Inducing Devices

Aerodynamic brakes are devices which, when deployed, disturb the patterns of smooth airflow. This produces an increase in drag and, depending on the type of device, a decrease in lift. There are two kinds of device in main use:

- **Wing-installed** — increases drag and decreases lift
- **Fuselage-installed** — increases drag

### Spoilers

A **spoiler** is a control device that destroys lift over part of the wing. Spoilers are most commonly used on sailplanes. They are "popped up" to allow a rapid rate of descent while retaining full control — this function is normally called the **speed-brake**. They can be retracted to regain full lift when the desired altitude is reached.

On the ground, spoilers can be raised to the maximum to help increase braking efficiency, by increasing contact pressure of the tyres with the ground and providing additional drag — this is called the **ground spoiler** function.

For aileron assistance, spoilers act on the "down" wing through a mixer system, moving in proportion to the aileron. The spoiler system can also act as a backup aileron system should the primary system fail — this function is called **roll spoilers**.

## Boundary Layer Control

Separation of the boundary layer is the cause of wing stall. Before this happens, the boundary layer turns turbulent, causing an unwanted increase in drag. Not only high angle of attack causes turbulent boundary layers — shock waves along the wing upper surface, flying near the speed of sound, also cause turbulent boundary layers.

- To retard separation during high-angle-of-attack flying, **slots and slats** are used.
- A **swept wing** is the most used method to retard shock waves from forming.
- **Vortex generators** are low-aspect-ratio aerofoils arranged in pairs. The tip vortices of these pull high-energy air down into the boundary layer and prevent separation.
- **Fences** and other devices such as saw-cuts or dog-teeth are also used to prevent air from flowing spanwise toward the wing tip.

## Control Aids / Tabs

Even on small, light aeroplanes, aerodynamic assistance in control movement is used. The simplest form is the **balanced control surface**. In the case of the rudder, the balance portion (overhang) deflects to the opposite side of the fuselage from the main rudder surface, producing an aerodynamic force that aids the pilot in moving the surface.

### Control (Servo) Tabs

Large aircraft are usually equipped with a power-operated, irreversible flight control system, in which control surfaces are moved by hydraulic actuators controlled by valves connected to the control yoke and rudder pedals. An artificial feel system gives the pilot resistance proportional to the flight loads on the surfaces — the control forces are too great for the pilot to move the surfaces manually. In the event of a hydraulic system failure, the surfaces are controlled with **control tabs**: in manual mode, the flight control column moves the tab on the control surface, and the aerodynamic force caused by the deflected tab moves the main control surface.

### Balance Tabs

Where control forces are excessively high, a manufacturer may use a **balance tab**. It is located in the same place as a trim tab, and in many installations one tab serves both functions. The difference is that the control rod for the balance tab is connected to the fixed surface on the same side as the horn on the tab.

### Anti-Balance Tabs

Stabilator surfaces have no fixed stabilizer in front of them, and the location of their pivot point makes them extremely sensitive. To reduce this sensitivity, a full-length **anti-balance (anti-servo) tab** may be installed on the trailing edge. It works like the balance tab, except that it moves in the **opposite direction**.

### Trim Tabs

**Trim tabs** are small movable portions of the trailing edge of a control surface, controlled from the cockpit to alter the camber of the surface and create an aerodynamic force that holds the control surface deflected. They may be installed on any of the primary control surfaces. Movement of the tab in one direction causes a deflection of the control surface in the opposite direction.

### Spring Tab

The **spring tab** aids pilots of high-speed aircraft. The control horn is free to pivot on the hinge axis of the surface but is restrained by a spring. At normal control forces the spring is not compressed and the horn acts as though rigidly attached to the surface. At high airspeeds, when the required control force becomes too high for the pilot, the spring compresses and the control horn deflects the tab, producing an aerodynamic force that aids the pilot in moving the surface.

### Control Surface Mass Balancing

Most control surfaces are **mass balanced**. The purpose is to prevent **control surface flutter** — an oscillation of the control surface that can occur due to bending and twisting of the structure under load. Flutter is prevented by adding weight to the control surface **in front of the hinge line**, bringing the centre of gravity closer to the hinge. Control surface balance must be checked whenever any operation is performed on a control surface that could change its static balance.

## The Speed of Sound

When air is disturbed, longitudinal waves are created that cause air pressure to increase and decrease. The **speed of sound** is the speed at which these small pressure disturbances move through the air. The pressure changes are caused by movement of the air molecules, and as temperature changes, so does molecular movement — so the speed of sound varies with temperature.

### Mach Number

High-speed flight is measured in terms of **Mach number** — the ratio of the speed of the aircraft to the speed of sound. An aeroplane flying at Mach 1 at sea level is flying at the speed of sound, which is **1224 km/h**. An aeroplane flying at Mach 0.75 is flying at 75% of the speed of sound at the existing air temperature.

### Critical Mach Number

The **critical Mach number** of an aeroplane is the flight Mach number at which there is the first indication of local sonic flow — i.e. when a normal shock wave first forms somewhere on the wing. Aeroplanes that fly at these speeds have Mach meters in the cockpit that automatically compensate airspeed for air temperature and show the pilot the Mach number at which the aeroplane is flying.

## Flight Speed Ranges

High-speed flight can be divided into four speed ranges:

| Range | Mach Number | Airflow Condition |
|-------|-------------|--------------------|
| **Subsonic** | Below Mach 0.75 | All airflow is below the speed of sound |
| **Transonic** | Mach 0.75 to Mach 1.20 | Most airflow is subsonic, but some areas are supersonic |
| **Supersonic** | Mach 1.20 to Mach 5.00 | All airflow is faster than the speed of sound |
| **Hypersonic** | Greater than Mach 5.00 | — |

### Subsonic Flight

In low-speed flight, air is considered incompressible and behaves much like a liquid — it can undergo changes in pressure without appreciable change in density. In high-speed flight, air acts as a compressible fluid and its density changes with changes in pressure and velocity.

An aeroplane passing through the air creates pressure disturbances that surround it. When flying **below** the speed of sound, these disturbances spread out in all directions and the air immediately ahead of the aeroplane is affected — its direction changes before the air reaches the aeroplane's surface. At speeds **greater than** the speed of sound, the disturbances do not spread out ahead of the aeroplane, and there is no change in flow direction ahead of the leading edge.

### Transonic Flight

When an aeroplane flies in the transonic range, some of the air flowing over the aerofoil accelerates until it is supersonic, and a **normal shock wave** forms. Air passing through this shock wave slows to a subsonic speed without changing direction. The shock wave can cause the air passing through it to become turbulent and to separate from the wing surface — **shock-induced separation**, which can create serious drag and control problems.

### Supersonic Airflow

When air flows over a surface at supersonic speed, pressure waves form. There are three types:

- **Normal shock waves** — form ahead of a relatively blunt-nosed aerofoil at supersonic speed, wasting energy.
- **Oblique shock waves** — form when a supersonic airstream strikes a sharp-edged aerofoil and is forced to turn.
- **Expansion waves** — form when air flows at supersonic speed over a double-wedge aerofoil and turns to follow the surface.

### Effect of Sweepback

One of the most common ways to prevent drag rise and control problems in the transonic range is to **sweep the wings back**. This increases the critical Mach number by effectively decreasing the thickness ratio of the wing: air flowing across a swept wing in the line of flight travels farther than the distance measured perpendicular to the leading edge. This longer travel for the same thickness has the same effect on critical Mach number as making the wing thinner — yet it allows a thicker (structurally stronger) wing to be used.

## Rotary Wings

### Aerodynamics

Like fixed-wing aircraft, the helicopter flies because of its aerofoils. The primary aerofoil of the helicopter is the **main rotor**, which is why the helicopter is often called a rotary wing aircraft. The **span** of a rotor blade is the distance from the root to the tip, measured along the centre line. Rotor blade aerofoils are usually **symmetrical**, though some successful designs use unsymmetrical aerofoils.

### Relative Wind

As the rotor blade moves it is subjected to relative wind, which is always **opposite the flight path of the blade**. Relative wind is considered in relation to the nose of the helicopter: the forward-moving blade is the **advancing blade**, and the backward-moving blade is the **retreating blade**. Relative wind may be affected by rotor blade movement, horizontal movement of the helicopter, flapping of the blade, and wind speed and direction.

### Pitch Angle and Angle of Attack

**Pitch angle** is the acute angle between the rotor blade chord and a reference plane (determined by the main rotor hub). It is varied by movement of the **collective control**, which rotates the blade about the hub axis, increasing or decreasing pitch.

The **angle of attack** is the acute angle between the aerofoil's chord line and the relative wind. When pitch angle is increased, angle of attack increases; when pitch angle is decreased, angle of attack decreases.

### Centre of Pressure

The **centre of pressure** is the imaginary point where the resultant of all the aerofoil's aerodynamic forces is considered to be concentrated; it can move as forces change. On helicopters, because rotor blades pivot about a fixed axis (the hub), large centre-of-pressure movement could lead to rotor instability, with blades constantly changing pitch. For this reason a **symmetrical aerofoil** is preferred, since its centre of pressure has very little movement.

### Effects on Lift and Thrust

Lift developed by the helicopter must be sufficient to overcome weight — the heavier the aircraft, the greater the pitch angle and power required. **Thrust** is the force moving the helicopter in the desired direction; **drag** resists thrust. Thrust must overcome drag before any movement can take place.

Thrust is obtained by movement of the tip path plane (rotor disc). At a hover or in a vertical climb, lift and thrust act in the same (vertical) direction. For forward, backward or sideward flight, the rotor disc is tilted in the direction of the desired movement, so that lift and thrust are perpendicular to each other.

### Collective and Cyclic Pitch

Changing the pitch angle of the blades changes the lift created. The **collective** control raises or lowers the pitch angle of all blades by the same amount throughout the tip path plane, raising or lowering the helicopter. The **cyclic** control moves each blade a predetermined amount so that lift is increased at one point and decreased at a point 180° apart, causing the blades to climb and dive and tilting the disc.

### Gyroscopic Precession

The rotor disc has the same properties as any other rotating mass, including **gyroscopic precession**: the effect of an applied force is displaced in the direction of rotation, so that maximum blade deflection occurs at a point **90° later than the input**. A device called a swash plate (or star assembly) is used to place the cyclic input to the main rotor at the location required to produce the desired movement.

### Torque

By Newton's third law, when power is applied to the rotor system, the fuselage tends to move in the opposite direction to the rotor — this is **torque**. Designs tried to eliminate torque have included coaxial rotors (two main rotors, one above the other, rotating in opposite directions), side-by-side rotors, intermeshing rotors, and tip-powered rotors (ramjets or hot-air nozzles). Most helicopters instead use a **single main rotor with an auxiliary tail rotor** to counteract torque; the tail rotor's pitch is increased (via foot pedals) to counteract torque as power increases. Some conventional helicopters also use an **offset vertical fin** to help keep the fuselage straight in forward flight, unloading the tail rotor.
        $cnt$,
        1
    ) RETURNING id INTO s1_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 13.2: Airframe Structures — General Concepts
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m13_id, 'M13.2', 'Airframe Structures — General Concepts',
        $cnt2$
# Airframe Structures — General Concepts

## Structural Classification

When designing aeroplanes, the loads to which the various parts are exposed must be taken into consideration; these loads differ for each part of the construction. A distinction is made between **primary** and **secondary** construction, which must be taken into account when choosing materials for maintenance work.

- **Primary construction** — the parts of the aeroplane that bear the loads.
- **Secondary construction** — generally gives the aeroplane its aerodynamic shape.

A wing section, for example, consists of a primary part and a secondary part.

## Dimensions and Locations

### Station Identification Systems

To determine a particular location in an aeroplane, it is divided by three imaginary planes at 90° to each other:

- **Water lines** — the plane that cuts the aeroplane horizontally, based on a cross section.
- **Buttock lines** — the plane that cuts the aeroplane vertically, based on a cross section. The zero point of the buttock line is the aeroplane's centre line. Looking in the direction of flight, left-hand buttock lines are indicated by a **minus** sign and right-hand buttock lines by a **plus** sign.
- **Body stations (Sta.)** — the plane that cuts the aeroplane vertically, based on a side view. By means of these three planes, any point in the aeroplane can be given a coordinate.

There is a number behind these abbreviations indicating the distance of the part from the zero point. For aeroplanes built by **Boeing**, these distances are given in **inches**; for aeroplanes built by **Airbus**, in **centimetres**.

The zero point of the body station (Sta.) is in front of, behind, or on the point of the fuselage nose. Where station 0 is behind the nose point, station numbers in front of the zero point carry a minus sign (for instance, Sta. −60.4).

The zero point of the water line (W.L.) depends on the type of aeroplane — every aeroplane has a different zero point. On a Boeing 747, for example, the zero point of the water line is **91 inches below the lowest point of the fuselage**.

The wings, horizontal and vertical stabilizers, and power plants of most aeroplane types have their own location identification system.

### Zone Identification Systems

The zone identification system is used to pinpoint the various locations in an aeroplane, making it possible to indicate the location of the centre of gravity, the distribution of load, and the location of compartments and parts. To localise parts and work more easily, the aeroplane is divided into **major zones**, **major sub-zones**, and **unit zones**.

Major zones are identified by hundreds:

| Zone | Area |
|------|------|
| **100** | Fuselage lower sections |
| **200** | Fuselage top sections |
| **300** | Stabilizers |
| **400** | Nacelles |
| **500** | Left wing |
| **600** | Right wing |
| **700** | Landing gear |
| **800** | Doors |

Major sub-zones are identified by the tens within a major zone. Unit zones are identified by a three-digit number — for example, zone 212 breaks down as: **200** (upper half of body — major zone), **10** (cockpit — major sub-zone), **2** (zone number on the right-hand side — unit zone).

Where necessary, an **odd** zone number refers to the left-hand zone and an **even** zone number to the right-hand zone. Large construction sections, including doors and control surfaces, have their own zone numbers.

## Lightning Strike Protection

Aircraft require electrical contact between all metallic and composite parts, in order to prevent arcing or fibre damage. **Aluminium** is used to provide a conductive path for the dissipation of electrical energy. Whether an aircraft is aluminium or composite, when lightning hits it needs a path for the electricity to flow through: on an aluminium skin, electricity flows through the skin and discharges out through the **static wicks**. Since composites do not conduct electricity, lightning protection must be **built into the component**.

If a composite component has no lightning protection and lightning exits through it, the resins in the composite will evaporate, leaving bare cloth. Carbon/graphite composite was at first believed to conduct enough electricity to dissipate the charge, but this was later found not to be true. Aluminium lightning protection may still be found in carbon/graphite parts; a barrier, such as a layer of fibreglass, should be used to prevent a **galvanic potential** between the carbon/graphite and the aluminium.

### Electrical Bonding

Normally the structure of an aircraft consists of metallic assemblies that ensure excellent electrical conductivity; however, certain insulating intermediate parts stop the continuity in large zones. Continuity is restored by means of **strips, screws or grounding lugs** fitted between metallic assemblies. Hinged parts (control surfaces, doors, hatches) and removable parts (unhinged inspection doors) are provided with bonding means to shunt across each part where conductivity may be interrupted. For zones such as fuel tanks, engines and the APU, bonding provides efficient circulation of static potential via bonding strips and screws connected to the main structure. External protruding parts, metallic or not, are provided with an electrical lead connected to the main structure. Antennas and other equipment are not bonded, since a lightning strike there could damage only the element struck without endangering the rest of the aircraft.

Different manufacturers use different methods to dissipate electrical charge on composite structures, including:

- Aluminium wires woven into the top layer of composite fabric (usually fibreglass or Kevlar, not carbon/graphite)
- A fine aluminium screen laminated under the top layer of fabric — on carbon/graphite components, usually sandwiched between two layers of fibreglass to prevent galvanic potential
- A thin aluminium foil sheet bonded to the outer layer of composite during manufacture
- Aluminium flame-sprayed onto the component (molten aluminium sprayed on like paint)
- Aluminized paint applied to the component
- A piece of metal bonded to the composite, to allow dissipation of the electrical charge to another metal component or a static wick

## Construction Methods of Aeroplanes

Maintenance and repairs to aeroplanes must be done well, fast and at the right location, so the maintenance mechanic must know where the part to be repaired or replaced is located. When constructing an aeroplane, a distinction is made between the main sections and the subsections. The main sections of the aeroplane construction are:

- The **fuselage**
- The **wings**
- The **landing gear**
- The **empennage** (consisting of the vertical and horizontal stabilizers, rudder and elevator)
- The **propulsion systems** (power plants / engines)

### Stressed Skin Construction Method

To take maximum advantage of metal, most aircraft structure is of **stressed skin** construction — a type of structure in which all or most of the stresses are carried in the outside skin, with a minimum of internal structure. There are two types of metal stressed skin construction: **monocoque** and **semi-monocoque**.

#### Monocoque Structure

The name monocoque means "single shell." In a true monocoque structure, all the strength of the structure is carried in the outside skin. The formers give the structure its shape, but the thin metal skin riveted to them carries all the flight loads.

#### Semi-Monocoque Structure

A pure monocoque structure has the serious drawback that any dent or deformation decreases its ability to carry flight loads. To overcome this limitation, **semi-monocoque** structure is widely used. In this type of structure, the formers not only provide the shape — they also carry the majority of the flight loads.
        $cnt2$,
        2
    ) RETURNING id INTO s2_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M13.1 Aerodynamics and Flight Controls (16 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s1_id, 'On an aeroplane with a fixed horizontal stabilizer and movable elevator, pulling the control wheel back:',
     '[{"id":"a","text":"Moves the elevator trailing edge up, increasing the down load on the tail, rotating the nose up","correct":true},{"id":"b","text":"Moves the elevator trailing edge down, decreasing the down load on the tail, rotating the nose down","correct":false},{"id":"c","text":"Has no effect unless the rudder pedals are also applied","correct":false}]',
     '{"B2"}'),

    (s1_id, 'A stabilator pivots about a point located approximately:',
     '[{"id":"a","text":"At its trailing edge","correct":false},{"id":"b","text":"One third of the way back from the leading edge","correct":true},{"id":"c","text":"At the very tip of the leading edge","correct":false}]',
     '{"B2"}'),

    (s1_id, 'To roll an aeroplane to the left using conventional ailerons:',
     '[{"id":"a","text":"The aileron on the left wing moves down and the right wing aileron moves up","correct":false},{"id":"b","text":"The aileron on the left wing moves up (decreasing lift) and the right wing aileron moves down (increasing lift)","correct":true},{"id":"c","text":"Both ailerons move up simultaneously","correct":false}]',
     '{"B2"}'),

    (s1_id, 'According to the text, an aeroplane is turned primarily by:',
     '[{"id":"a","text":"Tilting the lift vector with the ailerons, while the rudder is used mainly to overcome adverse yaw","correct":true},{"id":"b","text":"Applying rudder alone, with the ailerons held neutral","correct":false},{"id":"c","text":"Reducing power on the outside engine only","correct":false}]',
     '{"B2"}'),

    (s1_id, 'The purpose of trim systems on an aircraft is to:',
     '[{"id":"a","text":"Maintain equilibrium of the aircraft in flight without the pilot having to continuously apply steering force","correct":true},{"id":"b","text":"Increase the maximum speed of the aircraft","correct":false},{"id":"c","text":"Replace the need for ailerons during cruise flight","correct":false}]',
     '{"B2"}'),

    (s1_id, 'Slots, as a high-lift device, are designed to improve airflow conditions mainly:',
     '[{"id":"a","text":"At high angles of attack and slow speeds","correct":true},{"id":"b","text":"At low angles of attack and high cruise speeds","correct":false},{"id":"c","text":"Only during level cruise flight","correct":false}]',
     '{"B2"}'),

    (s1_id, 'Compared with landing (full flap), using an intermediate flap setting for take-off gives:',
     '[{"id":"a","text":"An increase in lift with little increase in parasite drag, allowing a shorter, lower-speed take-off run","correct":true},{"id":"b","text":"A large increase in parasite drag with no change in lift, to steepen the climb-out","correct":false},{"id":"c","text":"No change in either lift or drag compared with the flaps-up configuration","correct":false}]',
     '{"B2"}'),

    (s1_id, 'The Fowler flap increases wing lift capability by:',
     '[{"id":"a","text":"Rolling back on a track, which increases the effective wing area while lowering the trailing edge","correct":true},{"id":"b","text":"Extending forward and downward from the leading edge only","correct":false},{"id":"c","text":"Rotating the entire wing about its spanwise axis","correct":false}]',
     '{"B2"}'),

    (s1_id, 'On a sailplane, spoilers deployed to allow a rapid, controlled rate of descent are performing the function known as:',
     '[{"id":"a","text":"The speed-brake function","correct":true},{"id":"b","text":"The trim tab function","correct":false},{"id":"c","text":"The slat function","correct":false}]',
     '{"B2"}'),

    (s1_id, 'Vortex generators help control the boundary layer by:',
     '[{"id":"a","text":"Pulling high-energy air down into the boundary layer with their tip vortices, preventing separation","correct":true},{"id":"b","text":"Blocking airflow completely over the wing''s trailing edge","correct":false},{"id":"c","text":"Cooling the boundary layer to increase its density","correct":false}]',
     '{"B2"}'),

    (s1_id, 'A balanced control surface, such as a rudder with an overhang ahead of the hinge line, assists the pilot because:',
     '[{"id":"a","text":"The overhang deflects to the opposite side of the fuselage from the main surface, producing an aerodynamic force that aids movement of the surface","correct":true},{"id":"b","text":"It locks the control surface in a fixed neutral position","correct":false},{"id":"c","text":"It removes the need for a trim system entirely","correct":false}]',
     '{"B2"}'),

    (s1_id, 'Control surfaces are mass balanced primarily to:',
     '[{"id":"a","text":"Prevent control surface flutter, by adding weight ahead of the hinge line to bring the centre of gravity closer to the hinge","correct":true},{"id":"b","text":"Reduce the overall weight of the control surface","correct":false},{"id":"c","text":"Increase the aerodynamic camber of the surface","correct":false}]',
     '{"B2"}'),

    (s1_id, 'The critical Mach number of an aeroplane is defined as the flight Mach number at which:',
     '[{"id":"a","text":"There is the first indication of local sonic flow, i.e. a normal shock wave first forms on the wing","correct":true},{"id":"b","text":"The aircraft first exceeds the speed of sound over its entire surface","correct":false},{"id":"c","text":"All airflow around the aircraft becomes subsonic again","correct":false}]',
     '{"B2"}'),

    (s1_id, 'Sweeping a wing back helps delay drag rise in the transonic range mainly because it:',
     '[{"id":"a","text":"Effectively decreases the wing''s thickness ratio (as air travels farther along the chord than perpendicular to the leading edge), while still allowing a thicker, structurally stronger wing","correct":true},{"id":"b","text":"Physically reduces the actual thickness of the wing skin","correct":false},{"id":"c","text":"Eliminates the formation of shock waves entirely at all speeds","correct":false}]',
     '{"B2"}'),

    (s1_id, 'On a helicopter, the relative wind acting on a rotor blade is:',
     '[{"id":"a","text":"Always in the same direction as the blade''s flight path","correct":false},{"id":"b","text":"Always opposite the flight path of the blade","correct":true},{"id":"c","text":"Unrelated to the movement of the blade","correct":false}]',
     '{"B2"}'),

    (s1_id, 'The tendency of a helicopter fuselage to rotate opposite to the direction of main rotor rotation, explained by Newton''s third law, is called:',
     '[{"id":"a","text":"Torque","correct":true},{"id":"b","text":"Gyroscopic precession","correct":false},{"id":"c","text":"Retreating blade stall","correct":false}]',
     '{"B2"}'),

    (s1_id, 'On a single main rotor helicopter, torque is normally counteracted by:',
     '[{"id":"a","text":"An auxiliary tail rotor, whose pitch is increased via the foot pedals as power increases","correct":true},{"id":"b","text":"Reducing collective pitch on the main rotor only","correct":false},{"id":"c","text":"A second main rotor mounted directly above the first, turning in the same direction","correct":false}]',
     '{"B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M13.2 Airframe Structures — General Concepts (10 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s2_id, 'In aeroplane structural classification, "primary construction" refers to:',
     '[{"id":"a","text":"The parts of the aeroplane structure that bear the loads","correct":true},{"id":"b","text":"The parts that only give the aeroplane its aerodynamic shape","correct":false},{"id":"c","text":"Only the cabin interior fittings","correct":false}]',
     '{"B2"}'),

    (s2_id, 'To identify locations in an aeroplane, three imaginary planes at 90° to each other are used. The plane that cuts the aeroplane horizontally, based on a cross section, defines the:',
     '[{"id":"a","text":"Buttock lines","correct":false},{"id":"b","text":"Water lines","correct":true},{"id":"c","text":"Body stations","correct":false}]',
     '{"B2"}'),

    (s2_id, 'For buttock lines, the zero point is the aeroplane''s centre line. Looking in the direction of flight:',
     '[{"id":"a","text":"Left-hand buttock lines are indicated by a minus sign, right-hand by a plus sign","correct":true},{"id":"b","text":"Left-hand buttock lines are indicated by a plus sign, right-hand by a minus sign","correct":false},{"id":"c","text":"All buttock lines use the same sign regardless of side","correct":false}]',
     '{"B2"}'),

    (s2_id, 'Regarding station number distance units, the source text states that:',
     '[{"id":"a","text":"Boeing aeroplanes express these distances in inches, Airbus aeroplanes in centimetres","correct":true},{"id":"b","text":"All manufacturers use metres exclusively","correct":false},{"id":"c","text":"Boeing aeroplanes express these distances in centimetres, Airbus aeroplanes in inches","correct":false}]',
     '{"B2"}'),

    (s2_id, 'On a Boeing 747, the zero point of the water line (W.L.) is located:',
     '[{"id":"a","text":"91 inches below the lowest point of the fuselage","correct":true},{"id":"b","text":"At the very top of the fuselage crown","correct":false},{"id":"c","text":"On the centre line of the aeroplane, the same as the buttock line zero point","correct":false}]',
     '{"B2"}'),

    (s2_id, 'In the zone identification system, which major zone number corresponds to the left wing?',
     '[{"id":"a","text":"400","correct":false},{"id":"b","text":"500","correct":true},{"id":"c","text":"700","correct":false}]',
     '{"B2"}'),

    (s2_id, 'In the unit zone numbering convention described, an odd zone number refers to:',
     '[{"id":"a","text":"The left-hand zone","correct":true},{"id":"b","text":"The right-hand zone","correct":false},{"id":"c","text":"A zone on the aircraft centreline only","correct":false}]',
     '{"B2"}'),

    (s2_id, 'On an aluminium-skinned aircraft, an electrical charge from a lightning strike is dissipated by:',
     '[{"id":"a","text":"Flowing through the skin and discharging out through the static wicks","correct":true},{"id":"b","text":"Being absorbed entirely by the composite fairings","correct":false},{"id":"c","text":"Remaining trapped inside the fuselage until landing","correct":false}]',
     '{"B2"}'),

    (s2_id, 'The purpose of electrical bonding (strips, screws or grounding lugs) fitted between metallic assemblies is to:',
     '[{"id":"a","text":"Restore electrical continuity across insulating intermediate parts that would otherwise interrupt conductivity","correct":true},{"id":"b","text":"Increase the aerodynamic smoothness of the airframe","correct":false},{"id":"c","text":"Reduce the overall structural weight of the aircraft","correct":false}]',
     '{"B2"}'),

    (s2_id, 'What is the key structural difference between a true monocoque structure and a semi-monocoque structure?',
     '[{"id":"a","text":"In a monocoque, all strength is carried by the outer skin; in a semi-monocoque, the formers also carry the majority of the flight loads","correct":true},{"id":"b","text":"In a monocoque, only the internal formers carry load; the skin carries no load at all","correct":false},{"id":"c","text":"There is no structural difference between the two — the names are interchangeable","correct":false}]',
     '{"B2"}');

END $$;
