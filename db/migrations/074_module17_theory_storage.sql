-- Module 17: Propeller (B1/B2) — Propeller Theory and Construction, Propeller Storage and Preservation
-- Source: EASA Part-66 Module 17 official textbook (IKAROS Aviation Training Centre, IK M17, Issue Oct.2012)

DO $$
DECLARE
    m17_id INT;
    s1_id  INT;
    s6_id  INT;
BEGIN
    SELECT id INTO m17_id FROM easa_modules WHERE code = 'M17';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M17.1') THEN
        RAISE NOTICE 'M17.1 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 17.1: Propeller Theory and Construction
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m17_id, 'M17.1', 'Propeller Theory and Construction',
        $cnt$
# Propeller Theory and Construction

## Section 1: Basic Principles

### The Propeller Blade as an Aerofoil

Each part of a propeller blade is a cross-section (element) similar to that of an aerofoil. The thrust of the propeller is obtained because the chord at each part of the blade is inclined at a smaller angle towards its direction of rotation as distance from the root increases — i.e. **the blade angle is reduced from root to tip**. This is called **washout**.

When the propeller is operating in the flight range it is both rotating and advancing forward. The airflow meeting the blade — the **relative airflow** — is the resultant of two components:

- The **propeller rotational speed**
- The **aircraft forward speed**

This produces lift and drag on the blade element, as it does on an aerofoil. In the propeller, however, the emphasis is not on the forces perpendicular and parallel to the airflow (lift and drag), but on the force acting along the axis of the aircraft (**thrust**) and the force acting at right angles to the rotation (**torque**). The total reaction on the blade is therefore resolved into thrust and torque forces.

| Term | Description |
|------|-------------|
| **Thrust** | The component acting at right angles to the plane of rotation — the propulsive force |
| **Torque** | The component acting in the plane of rotation, opposing engine torque — the resistance offered by the propeller to being rotated |
| **Negative Torque** | Occurs when the angle of attack becomes negative, which tends to drive the propeller (windmilling) |

### Factors Affecting Thrust and Torque

| Factor | Effect |
|--------|--------|
| **Air Density** | Increased air density produces increased thrust, but denser air also offers greater resistance to the propeller, i.e. increased torque |
| **Angle of Attack** | An increase in angle of attack produces more thrust and torque up to the stalling angle. The optimum angle of attack gives the best thrust/torque ratio |
| **Propeller Speed (RPM)** | Thrust and torque alter directly with the speed of rotation |

When the propeller is revolving at a steady RPM, propeller torque and engine torque are exactly equal and opposite.

### The Helical Path and Angle of Advance

The direction of motion of the propeller is a helix rather than a straight line — every section of the blade travels on a different helical path, made up of a combination of rotational velocity (RPM) and aircraft forward speed.

The angle between the resultant direction of the airflow and the plane of rotation is called the **angle of advance**, or **helix angle**, and it differs at each blade section. Sections near the tip move on a helix of much greater diameter, and at a much greater velocity, than sections near the root.

### Blade Twist (Washout)

All sections of the blade are set at a small extra angle to give the angle of attack — the angle between the relative airflow and the blade chord. For maximum efficiency this extra angle must be approximately the same at all parts of the blade. Because rotational speed increases from root to tip while forward speed is the same along the whole blade, the relative airflow — and hence the angle of attack — would vary along a blade of constant angle. To keep the angle of attack roughly constant along the blade, the blade angle is reduced from root to tip. This gradual decrease in blade angle from hub to tip is called **blade twist** (washout).

### Key Definitions

| Term | Definition |
|------|------------|
| **Blade Angle** | The angle, normally acute, between the pressure face of a blade element and the plane of rotation. When the pressure face is curved, blade angle is measured with reference to the blade chord. (An "element" is a particular section of the blade.) |
| **Plane of Rotation** | The plane at right angles to the centre line of the propeller axis |
| **Relative Airflow** | The resultant of propeller rotational speed (RPM) and aircraft speed, which together produce the speed and direction at which the airflow meets the propeller blade |
| **Angle of Attack** | The angle between the blade face (chord) and the relative airflow; it varies with changes in RPM and forward speed |
| **Tip Losses** | Caused by tip vortices and induced drag. At high tip speed further losses occur due to compressibility effects; slight improvement is achieved with a thin tip of laminar-flow section |

### Variations of Forces Along the Blade

The propeller blade is shaped to make the most use of each blade element, but only a proportion of the blade is truly effective because of losses at the root and tip. **The blade is most effective between two-thirds and three-quarters of the distance from the blade root.**

The angle of attack of a propeller blade is formed by the blade chord line and the relative airflow, and is determined by aircraft forward speed and propeller rotational speed. On a stationary aircraft with the propeller rotating, the relative airflow is directly opposite the rotational movement of the blade, so angle of attack equals blade angle. Once the aircraft moves forward, the resultant relative airflow is no longer directly opposite the blade movement, so **the angle of attack is always less than the blade angle** in this condition.

- For a given propeller speed, the faster the aircraft moves through the air, the **smaller** the angle of attack.
- For a given airspeed, an increase in propeller speed makes the relative airflow strike the blade at a greater angle, so angle of attack **increases**.

The most effective angle of attack for a propeller blade is between **2° and 4°**. Any angle of attack exceeding **15°** is ineffective, because of the possibility of a propeller stall. Fixed blade angle propellers are typically designed to produce an angle of attack of 2°–4° at climb or cruise airspeed and a specific RPM setting; the optimum angle varies with blade design but is usually around 4°.

### Vibration and Resonance

When a propeller produces thrust, aerodynamic and mechanical forces cause the blades to vibrate. Vibration also produces resonance — the echoing "beat" of the out-of-balance propeller. Although propellers, spinners and power-train dynamic components are manufactured to strict tolerances, centrifugal force, aerodynamic loading and individual component tolerances can leave some residual out-of-balance moment, increasing vibration. Tracking and balancing may be required:

- After major component replacement
- As a fault diagnosis / troubleshooting aid
- Whenever required by the maintenance manual or maintenance procedures

Vibration is felt at a certain force, known as **displacement (amplitude)**, and at a certain rate — **frequency** — generally expressed as cycles per second and measured in **Hertz (Hz)**; one hertz equals one complete cycle per second. If not compensated for in design, vibration may cause excessive flexing, work-hardening of the metal, and blade sections breaking off in operation.

Aerodynamic forces have their greatest vibration effect at the blade tip, where transonic speed effects cause buffeting and vibration — reduced by proper aerofoil shape and tip design. **Mechanical vibrations, generated by power pulses in a piston engine, are considered more destructive than aerodynamic vibration.** These power pulses set up standing wave patterns causing metal fatigue and failure; the most critical location for these stress concentrations is about six inches in from the blade tip.

Some airframe-engine-propeller combinations are sensitive to certain RPM ranges — a **critical range**, indicated on the tachometer by a red arc — and should not be operated there except transiently, to avoid possible structural failure. **Propellers driven by a gas-turbine turboprop are not affected by a critical range**, because a gas turbine has no power pulses and continuous (not reciprocating) operation, giving a smoother-running engine with lower vibration frequencies, lower resonance, and less fatigue/operational stress transmitted to the propeller — meaning a turboprop propeller should remain in service longer, with a greater time between overhaul (TBO).

### Operating Principle of the Propeller

As the propeller rotates through the air, a low pressure area is created in front of the blade, due to the camber of the blade back. Combined with the higher pressure area behind the blade, this produces thrust, which causes tension in the propeller shaft and pulls the aircraft through the air. The amount of thrust produced depends on:

- The angle of attack
- The speed the blades move through the air
- The shape of the aerofoil

### Root Losses

The thickened root withstands high stresses but loses aerodynamic efficiency, and airflow at the root is affected by proximity of the engine. Some large turboprop blades are fitted with **blade cuffs** to improve airflow around the blade roots.

### Variations in Angle of Attack

**Forward Speed** — With a fixed pitch propeller, any change in airspeed changes the direction of the relative airflow and so the angle of attack. An increase in airspeed decreases the angle of attack; as angle of attack decreases, torque load on the propeller is reduced, which allows engine RPM to increase until propeller and engine torque match again. So, with a fixed pitch propeller, an increase in airspeed results in increased engine RPM without any change to the throttle setting — this has a limiting effect on aircraft performance (e.g. it limits maximum aircraft speed, to prevent an engine overspeed).

**Engine Speed** — Changes in engine speed also vary the relative airflow and so affect angle of attack on a fixed pitch propeller. An increase in engine speed increases the angle of attack; because increased engine speed means more power available, the aircraft accelerates and the angle of attack is restored towards its original value.

### Geometric Pitch, Effective Pitch and Slip

**Geometric pitch** is the theoretical distance the propeller would move forward in one revolution without slip, calculated from the blade angle and propeller radius at a particular blade section, and can be compared with a screw thread's lead. Fixed pitch propellers are classified by diameter and pitch.

**Effective pitch (advance per revolution)** is the actual distance the propeller moves forward in one revolution, affected by actual flight conditions. It may vary from zero (aircraft stationary on the ground) to approximately **85% of geometric pitch** during the most efficient flight conditions; it depends on aircraft speed and propeller RPM, and is not a fixed quantity.

**Slip** is the difference between geometric pitch and effective pitch (advance per revolution), expressed as a percentage — in effect, a volume of air:

**Slip (%) = [(Geometric Pitch − Advance/Rev) / Geometric Pitch] × 100**

*Worked example:* A propeller has a geometric pitch of 50 inches but actually moves forward only 40 inches in one revolution.

**Slip = (50 − 40) / 50 × 100 = 10/50 × 100 = 20%**

The propeller in this example is therefore 80% efficient.

### Power Absorption

Propeller design (diameter, number of blades, blade shape) is governed by how much engine power must be absorbed. Propeller tip speed must not approach the speed of sound, or efficiency is lost, which limits diameter; aircraft installation (low-slung or close-mounted engines requiring small-diameter propellers, or large-diameter propellers requiring a long undercarriage) is also limiting. Each method of absorbing power has limitations, requiring a design compromise.

| Power Absorbed By | Limitation |
|--------------------|------------|
| Increasing blade angle | Reduces thrust/torque ratio; blades "stall" at low engine speeds |
| Increasing blade length | High tip speeds, increased compressibility problems; ground/structure clearance |
| Higher propeller speed | Increased tip speeds, reduced efficiency |
| Altering blade camber | Reduces aerodynamic efficiency |
| Increasing blade chord | Increased weight, increased turning-moment loading |
| Increasing number of blades | Increased weight, structural difficulties at the hub |
| Contra-rotating propellers | Complicated pitch-change mechanism, expense and maintenance |

Blade length, chord and number of blades all affect the propeller's **solidity**.

### Contra-Rotating Propellers

Contra-rotating propellers are two propellers mounted in line, driven by a single engine, and made to rotate in opposite directions by a gearbox mounted at the front of the engine. **It is not possible to feather just one element of a twin in-line (contra-rotating) propeller.**

### Solidity

Solidity is the ratio of total blade area to propeller disc area. In practice, the width of each blade at 0.7 of the radius (the **master station**) multiplied by the number of blades is divided into the circumference of the propeller disc at the master station.

*Worked example:* Calculate the solidity of a four-bladed propeller with a 10 ft diameter and a blade chord width at the master station of 1 ft.

- Propeller radius = 5 ft; master station radius (0.7 × radius) = 3.5 ft
- Circumference at master station = 2π × 3.5 ≈ 22 ft (rounded)
- Number of blades × chord width = 4 × 1 = 4
- Solidity = 22 / 4 = **5.5 : 1**

### Blade Stations and Master Station

**Blade stations** are designated distances along the blade, measured from the centre of the hub (or a reference line near the tip), typically at fixed intervals (e.g. 6 in / 15.2 cm). Dividing the blade into stations provides a convenient means of discussing blade performance, locating blade markings, finding the correct point to measure blade angle, and locating anti-glare areas.

The **master station** (reference point) is measured in inches from the centre of the hub, with the exact distance stated in the propeller Maintenance Manual; on some blades it is marked by a yellow line on the blade face. If the blade angle at the master station is correct, then — provided the blade has been carefully designed and accurately manufactured — all blade angles along the blade should be correct.

## Section 2: Fixed Pitch Propellers

A **fixed pitch propeller** is rigidly connected, so that blade angle cannot be altered without bending or reworking the blade.

With a fixed pitch propeller, an increase in engine power increases rotational speed and so thrust; this also increases aerofoil drag, forcing the propeller to absorb the additional engine power. A decrease in engine power similarly decreases rotational speed and thrust.

When an aircraft with a fixed pitch propeller dives, forward speed increases, the relative airflow changes, and both thrust and drag reduce with a corresponding increase in rotational speed. The opposite occurs during a climb: angle of attack increases, thrust increases, and rotational speed decreases. Because a fixed pitch propeller can only absorb a limited amount of excess power by changing rotational speed, exceeding these limits causes engine damage — this led to the development of controllable pitch propellers.

### Disadvantages of a Fixed Pitch Propeller

A fixed blade angle is only efficient at one combination of airspeed and RPM.

- During take-off, angle of attack is large (low airspeed, high RPM); with the blades nearly stalled, acceleration is poor and a long take-off run is required.
- At cruise, angle of attack is small and forward speed is limited to prevent engine overspeed.
- The fixed pitch propeller must compromise, improving take-off performance at the expense of cruise performance (or vice versa).

## Controllable-Pitch, Ground-Adjustable and Constant-Speed Propellers

### Controllable-Pitch Propellers

A controllable-pitch propeller lets the pilot change blade angle at will, to obtain the best engine performance. At take-off the propeller is set to a low blade angle so the engine can reach maximum allowable RPM and power; shortly after take-off the angle is increased slightly to prevent engine overspeed and give the best climb conditions of RPM and airspeed. At cruising altitude the propeller can be adjusted to a comparatively high pitch for low cruising RPM, or a lower pitch for higher cruising RPM.

A **two-position propeller** is a simpler type that does not have all the advantages of a full controllable-pitch propeller, but does permit selecting the blade angle for best take-off/climb (low pitch, high RPM) and for best cruise (high pitch, low RPM).

### Ground Adjustable Propellers

A ground adjustable propeller permits a change in blade angle only while the aircraft is on the ground, to suit different flight conditions — e.g. a low blade angle for maximum climb rate (engine at maximum speed/power), or an increased blade angle for efficient cruise at high altitude. In any case the blade angle must not permit the engine to overspeed. Such propellers may have wood or metal blades; the hub is usually a two-piece steel construction with clamps or a large nut holding the blades, which are rotated to the desired angle (checked with a propeller protractor) once loosened.

### Constant Speed Propellers

A constant speed propeller is controlled by a speed governor that automatically adjusts propeller pitch to maintain a selected engine speed. If propeller RPM tends to increase, the governor senses this and increases blade angle; if RPM tends to decrease, the governor decreases blade angle. An increased blade angle causes a decrease in RPM, and a decreased blade angle causes an increase in RPM.

Pitch-change devices for constant speed propellers include electric motors, hydraulic cylinders, springs, and centrifugal force acting on counterweights, or a combination of these. The propeller control unit (PCU) or constant speed unit (CSU) maintains selected RPM through all flight condition changes without pilot assistance, selecting the optimum angle of attack at all times. Blade angle can be changed by a large amount, enabling the propeller to be feathered and also used as a power brake for landing.

- **PCU** — used with turboprop engines
- **CSU** — used with piston engines

## Propeller Blade Positions

| Position | Description |
|----------|-------------|
| **Flight Fine Pitch** | The minimum working blade angle used in flight |
| **Ground Fine Pitch (Superfine)** | The minimum blade angle, used to reduce torque for easier starting on turboprop aircraft, and also for disc braking on landing |
| **Coarse Pitch** | The maximum blade angle, used in the cruising position |
| **Feathered Position** | Blade chord in line with the airflow |
| **Reverse Pitch** | Blade angle moved below ground fine into a negative angle, for braking on landing and reverse manoeuvring on the ground |
| **Flight Range** | When RPM has been selected to a constant speed |
| **Transition Range** | The change from ground operation to flight operation |
| **Beta Range** | Ground operating range, only available with the aircraft on the ground |
| **Fine Pitch** | Used for take-off and high-power climb |

## Windmilling and Feathering

The purpose of **feathering** is that, when an engine stops in flight, the propeller would otherwise continue turning due to the aircraft's forward speed (**windmilling**), which would: (1) increase drag on the aircraft, and (2) potentially damage the engine.

When an engine stops or fails in flight, the propeller control unit maintains selected RPM by reducing blade angle ("fines off"). The combination of small blade angle and forward speed produces a small **negative** angle of attack on the blades. This reverses the resultant force, and with it the thrust and torque: negative thrust increases drag, making the aircraft harder to handle and requiring extra power from the remaining engines to maintain control and altitude; negative torque causes the propeller to keep turning, but now the propeller is driving the engine, which can cause or worsen engine damage. **Windmilling only occurs if there is forward speed**, and is stopped by feathering the propeller.

A **windmilling brake** allows a non-reversing propeller to windmill on landing as an effective air brake: on touchdown, blades are moved to ground fine pitch as the engine throttles back, producing a small negative angle of attack that gives negative thrust and torque to slow the aircraft. Braking effectiveness reduces as speed drops, due to lessening windmilling forces. Safety devices in the propeller control system prevent windmilling occurring in flight.

## Reverse Pitch

Reverse pitch is used to provide effective braking and limited ground manoeuvring. On selecting reverse, propeller blades move to a negative blade angle, producing a negative angle of attack and negative thrust; **torque remains positive**, to oppose the engine driving the propeller. The transition from forward to reverse pitch must be achieved rapidly, to prevent an overspeed as the blades pass through very fine pitch angles, where propeller torque would be negative and would assist (rather than oppose) engine torque.

## Centrifugal and Aerodynamic Turning Moments (CTM / ATM)

**Centrifugal Turning Moment (CTM)** is a powerful moment on the propeller blades that tries to turn the blades to zero blade angle (fine pitch). Its magnitude depends on blade chord, weight and RPM — any increase in these increases CTM. It arises because the centrifugal force acting through the centre of gravity of the blade mass forward of the blade centre line, and the centrifugal force acting through the centre of gravity of the blade mass aft of the centre line, produce a couple trying to align the blade chord with the plane of rotation, regardless of blade angle. CTM must be overcome to prevent a propeller overspeeding.

**Aerodynamic Turning Moment (ATM)** is a weaker force than CTM, normally acting in opposition and trying to turn the blade to coarse pitch. It arises because the blade's centre of pressure is forward of the **pitch change axis** (the axis about which the blade turns when blade angle changes), and the resultant force's moment turns the blade to coarse pitch. In reverse pitch, ATM turns the blade to a coarser negative blade angle. **ATM acts together with CTM to fine off the blades only when the propeller is windmilling.**

## Forces Acting on the Propeller

| Force | Description |
|-------|-------------|
| **Centrifugal Force** | The largest force acting on the propeller; tries to pull the blades out of the hub, and is directly proportional to propeller weight and RPM |
| **Thrust Bending Force** | Tends to bend the blades in the direction of flight |
| **Torque Bending Force** | Tends to bend the blades against the direction of rotation |

Resulting stress types in the propeller:

| Stress | Cause |
|--------|-------|
| **Bending** | Due to thrust and torque forces on the blade |
| **Centrifugal** | Caused by the propeller blade mass rotating at high speed |
| **Torsion** | Due to the effects of CTM and ATM, and pitch-change loads |
        $cnt$,
        1
    ) RETURNING id INTO s1_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 17.6: Propeller Storage and Preservation
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m17_id, 'M17.6', 'Propeller Storage and Preservation',
        $cnt2$
# Propeller Storage and Preservation

There are many types of propellers; this sub-module deals with a split-hub, lightly pre-loaded bearing design as a representative example. To ensure best airworthiness practice and optimum operational performance, the manufacturer's procedure should always be followed.

## Definitions

| Term | Meaning |
|------|---------|
| **In Service** | In current operational use |
| **Out of Service** | Withdrawn from operational use |
| **Inhibit** | The introduction into the propeller hydraulic system of a sufficient amount of system oil to provide a protective film on internal surfaces |
| **Off Wing** | Not installed on the aircraft, i.e. held in stores |
| **On Wing** | Installed on the aircraft |
| **Short Term Storage** | Storage up to 3 months |
| **Long Term Storage** | Storage for more than 3 months |
| **Marine Environment** | Coastal locations subject to salt spray, seaborne winds or salt spray from the runway |

## Introduction

All transportation covers should be kept in position during all periods of "off wing" storage and transportation. The synthetic oil used in the propeller system provides adequate protection against internal corrosion, but the propeller must be exercised and re-inhibited periodically to maintain this thin film — the blade bearings are exercised whenever the propeller is exercised.

In general, an assembled propeller entering store need **not** be exercised or inhibited if any of the following three dates is less than 3 months before the storage date:

- The date of manufacture
- The date of most recent overhaul or full test
- The date last operated or exercised (on wing)

## Short Term Storage 'Off Wing' — Procedure

- Examine the propeller for damage/corrosion before it enters store, paying close attention to the blades, spinner and backplate. Defects must be remedied before acceptance into store.
- Wash the blades by hand using a clean, lint-free cloth and low-alkaline soap or detergent.
- If necessary, clean metallic surfaces at the blade roots with a clean, lint-free cloth and cleaning fluid.
- Treat all steel surfaces at the blade root with corrosion-preventative compound.
- **Caution:** Do not use a hose pipe; avoid excessive washing at blade roots.
- **Note:** Preservation compounds such as jellies, oils, greases or aerosol sprays must **not** be applied to the blade surface of **composite** propeller blades.
- Ensure blade tip protectors are fitted; wrap the blades in polythene and secure with tape.
- Clean the hub and associated parts with a clean, lint-free cloth and cleaning fluid, without letting cleaning agent enter the blade root joint.
- Coat all metal surfaces on the hub with clean propeller system oil (but not the de-icing slip ring surfaces).
- Protect the de-icing slip ring with its plastic slipping cover — no special preservation is required.
- Wrap the hub in polythene.
- Clean the spinner with a clean, lint-free cloth and low-alkaline soap or detergent, then wrap it in grease-resisting paper and secure with tape.

**Loose items** are treated as follows:

- Unused seals older than **10 years** since the date of vulcanising or manufacture must be discarded.
- Unused seals are suitably packed for storage; open or damaged packs are discarded.
- Discarded items are replaced with new, unused items.
- Treat loose bolts and washers with clean system oil as appropriate.
- Pack loose parts collectively in a rigid box and tape to the propeller hub (**not** to the beta tube or other blades).

## Long Term Storage 'Off Wing'

- Examine the propeller for damage/corrosion before it enters store, as for short term storage, giving close attention to the blades, spinner and backplate.
- Assembled propellers in long term storage (off wing) must be periodically exercised and re-inhibited, in accordance with manufacturer's instructions, **at six-monthly intervals** — the first exercising and re-inhibiting must take place before 6 months have elapsed since the propeller was placed in store.
- Prepare assembled propellers, and loose items, for long term storage the same way as for short term storage.

## Exercising and Inhibiting 'Off Wing'

**Caution:** Do not use blade bats to exercise single oil-line propellers, as this could overload the operating pins — use a spring compressor and exercise the propeller through its full range. On completion, ensure the blades are in the fully feathered position; do not allow the piston to hold on the start latches while in store.

Adequate exercising extends the storage life of the bearings and assembled seal rings, and limits adhesion of dynamic seals to working surfaces; inhibiting maintains a protective oil film on internal surfaces.

**Caution:** Do not at any time load a propeller blade or blades with the weight of the propeller.

Procedure outline:

- Mount the propeller cylinder-down on the locator and appropriate stand, via the hub assembly (spinner and beta tube removed). Remove the protective cover from the cross head.
- Make a pencil/wax-crayon line mark on the hub boss near the blade root, and a matching mark on the blade near the blade root, in line with each other.
- The preferred number of operators is one per blade; the minimum is one operator on each of two opposite blades.
- Using blade bats or a spring compressor as applicable, move all blades simultaneously towards the full reverse position, until the crosshead shaft is below the level of the slip ring outer face.
- Pour **500 to 600 cm³** of clean system oil slowly into the bore of the cross-head shaft.
- Move the blades slowly through their range, oscillating them backwards and forwards **4 or 5 times**, ensuring complete movement through the range.
- Finally, move the blades back towards (but not exactly onto) the original marked position — the marks must **not** line up; blades must be positioned at least **25 to 50 mm** away from the original marked position. On single oil-line propellers, blades must be returned to the feathered position.
- **Note:** On completion of exercising, remove the pencil/wax-crayon marks with a clean, lint-free cloth and suitable cleaning compound.

## Exercising and Inhibiting 'On Wing'

Exercising an installed propeller eliminates the need for inhibiting while on wing, since adequate exercising extends bearing and seal-ring storage life, limits dynamic seal adhesion, and maintains a protective (inhibiting) oil film on internal surfaces.

- 'On wing' storage should ideally be under cover (a hangar or enclosed building) — a propeller stored under cover need only be exercised **every 3 months**.
- Propellers stored on wing in the open air (airfield, parking lot, or open service bay) require more frequent exercising — **at least once every month**.
- A propeller out of service (on wing) for **between 6 and 12 months** without being exercised must be subjected to all normal installation and functional checks specified by the engine manufacturer before entering or re-entering service.
- A propeller out of service (on wing) for **12 months or more** without being exercised must be stripped, inspected and re-greased before entering or re-entering service.

**Caution:** Do not run the feathering pump motor for more than **2 minutes in any 30 minutes**.

Exercising 'on wing' consists of a functional operation of the propeller **3 times** through its full operational range, carried out statically in accordance with the normal installation/functional acceptance check for entering or re-entering service (as permitted by the engine manufacturer), ensuring means for replenishing the oil tank are provided as necessary. As an option to static operation, the appropriate engine may instead be run to supply electrical power and hydraulic pressure to the propeller control system, if permitted by the engine manufacturer.

**Caution:** Where possible, avoid rapid blade pitch changes when exercising a propeller that has been out of service. The propeller should be exercised from fine pitch to coarse pitch using a low rate of blade pitch change — avoiding rapid changes benefits the internal hydraulic seals.

## Quality Control Provisions

- Operators must ensure correct materials have been used and the process carried out to specification requirements.
- Defects discovered during pre-storage examination must be remedied before the equipment can be accepted into store.
- The time between overhaul and calendar life stated in the applicable manufacturer's Service Bulletin must, subject to any flying-hours limitation, be strictly observed.
- A record of exercising must be recorded in the **Propeller Log Book**.
        $cnt2$,
        6
    ) RETURNING id INTO s6_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M17.1 Propeller Theory and Construction (19 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s1_id, 'On a propeller blade, the component of the total blade reaction acting at right angles to the plane of rotation is called:',
     '[{"id":"a","text":"Torque","correct":false},{"id":"b","text":"Thrust","correct":true},{"id":"c","text":"Negative torque","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'Negative torque on a propeller blade occurs when:',
     '[{"id":"a","text":"The angle of attack becomes negative, tending to drive (windmill) the propeller","correct":true},{"id":"b","text":"RPM exceeds the critical range","correct":false},{"id":"c","text":"Air density increases at high altitude","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'An increase in air density affects propeller thrust and torque by:',
     '[{"id":"a","text":"Increasing both thrust and torque","correct":true},{"id":"b","text":"Increasing thrust but decreasing torque","correct":false},{"id":"c","text":"Decreasing both thrust and torque","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'The gradual decrease in blade angle from the hub to the tip of a propeller blade is known as:',
     '[{"id":"a","text":"Blade twist (washout)","correct":true},{"id":"b","text":"The angle of advance","correct":false},{"id":"c","text":"Feathering","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'Blade twist (washout) exists mainly in order to:',
     '[{"id":"a","text":"Reduce the weight of the propeller","correct":false},{"id":"b","text":"Keep the angle of attack approximately constant along the length of the blade","correct":true},{"id":"c","text":"Increase vibration at the blade tip","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'Blade angle is defined as the angle between the plane of rotation and:',
     '[{"id":"a","text":"The pressure face of the blade element (or the chord, if the pressure face is curved)","correct":true},{"id":"b","text":"The direction of the relative airflow","correct":false},{"id":"c","text":"The propeller shaft centre line","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'Tip losses on a propeller blade are principally caused by:',
     '[{"id":"a","text":"Tip vortices and induced drag","correct":true},{"id":"b","text":"Centrifugal turning moment","correct":false},{"id":"c","text":"Blade root proximity to the engine","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'A propeller blade is most aerodynamically effective over which portion of its length?',
     '[{"id":"a","text":"Between two-thirds and three-quarters of the distance from the root","correct":true},{"id":"b","text":"The inner third, nearest the hub","correct":false},{"id":"c","text":"The outer tenth, at the extreme tip","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'The most effective angle of attack for a propeller blade is approximately:',
     '[{"id":"a","text":"Between 2° and 4°","correct":true},{"id":"b","text":"Between 10° and 12°","correct":false},{"id":"c","text":"Between 20° and 25°","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'Mechanical vibration generated by power pulses in a piston engine, compared with aerodynamic vibration at the blade tip, is generally:',
     '[{"id":"a","text":"Less destructive","correct":false},{"id":"b","text":"Considered more destructive in its effect","correct":true},{"id":"c","text":"Only present at idle RPM","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'Why are propellers driven by a gas-turbine turboprop engine generally not affected by a vibration "critical range"?',
     '[{"id":"a","text":"Because a gas turbine has no power pulses and runs continuously, giving smoother, lower-frequency vibration","correct":true},{"id":"b","text":"Because turboprop propellers are always mounted further from the engine","correct":false},{"id":"c","text":"Because turboprop propellers do not rotate at high RPM","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'With a fixed pitch propeller, if airspeed increases with no change to the throttle setting, the immediate effect is:',
     '[{"id":"a","text":"Angle of attack decreases, torque reduces, and engine RPM increases","correct":true},{"id":"b","text":"Angle of attack increases, torque increases, and engine RPM decreases","correct":false},{"id":"c","text":"No change occurs to angle of attack, torque, or RPM","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'Effective pitch (advance per revolution) of a propeller, under the most efficient flight conditions, approaches:',
     '[{"id":"a","text":"Approximately 25% of geometric pitch","correct":false},{"id":"b","text":"Approximately 85% of geometric pitch","correct":true},{"id":"c","text":"Approximately 150% of geometric pitch","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'A propeller has a geometric pitch of 50 inches but actually advances only 40 inches per revolution. The slip, expressed as a percentage, is:',
     '[{"id":"a","text":"10%","correct":false},{"id":"b","text":"20%","correct":true},{"id":"c","text":"40%","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'On a contra-rotating (twin in-line) propeller installation:',
     '[{"id":"a","text":"It is not possible to feather just one element of the pair","correct":true},{"id":"b","text":"Each element is feathered completely independently of the other","correct":false},{"id":"c","text":"Feathering is not available on either element","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'A four-bladed propeller has a 10 ft diameter and a blade chord width at the master station (0.7 of the radius) of 1 ft. Using the method shown in the course notes, the resulting solidity ratio is approximately:',
     '[{"id":"a","text":"1.1 : 1","correct":false},{"id":"b","text":"5.5 : 1","correct":true},{"id":"c","text":"22 : 1","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'The main disadvantage of a fixed pitch propeller is that:',
     '[{"id":"a","text":"It is only efficient at one combination of airspeed and RPM, forcing a compromise between take-off and cruise performance","correct":true},{"id":"b","text":"It cannot be feathered under any circumstances","correct":false},{"id":"c","text":"It produces no thrust below the critical range","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'On a constant speed propeller, if RPM tends to increase above the selected value, the governor responds by:',
     '[{"id":"a","text":"Decreasing the blade angle","correct":false},{"id":"b","text":"Increasing the blade angle","correct":true},{"id":"c","text":"Feathering the propeller immediately","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'Centrifugal Turning Moment (CTM) on a propeller blade acts to:',
     '[{"id":"a","text":"Turn the blade towards zero blade angle (fine pitch)","correct":true},{"id":"b","text":"Turn the blade towards coarse pitch","correct":false},{"id":"c","text":"Have no effect on blade angle at all","correct":false}]',
     '{"B1","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M17.6 Propeller Storage and Preservation (9 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s6_id, 'Under the definitions used for propeller storage, "short term storage" and "long term storage" are distinguished by a period of:',
     '[{"id":"a","text":"3 months","correct":true},{"id":"b","text":"6 months","correct":false},{"id":"c","text":"12 months","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'In the context of propeller storage, "inhibiting" means:',
     '[{"id":"a","text":"Removing all oil from the propeller hydraulic system before storage","correct":false},{"id":"b","text":"Introducing sufficient system oil into the propeller hydraulic system to provide a protective film on internal surfaces","correct":true},{"id":"c","text":"Fitting blade tip protectors only","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'When preparing a propeller for short term storage, preservation compounds such as jellies, oils, greases or aerosol sprays must NOT be applied to:',
     '[{"id":"a","text":"The blade surfaces of composite propeller blades","correct":true},{"id":"b","text":"Any steel surface at the blade root","correct":false},{"id":"c","text":"Loose bolts and washers","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'An assembled propeller in long term storage "off wing" must be exercised and re-inhibited:',
     '[{"id":"a","text":"Only once, immediately before it is returned to service","correct":false},{"id":"b","text":"At six-monthly intervals, with the first exercise before 6 months have elapsed since storage began","correct":true},{"id":"c","text":"Every 3 months without exception","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'During "off wing" exercising and inhibiting, the quantity of clean system oil to be poured into the bore of the cross-head shaft is:',
     '[{"id":"a","text":"50 to 60 cm³","correct":false},{"id":"b","text":"500 to 600 cm³","correct":true},{"id":"c","text":"5 to 6 litres","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'A propeller stored "on wing" under cover (e.g. in a hangar) should be exercised:',
     '[{"id":"a","text":"Every 3 months","correct":true},{"id":"b","text":"Every 3 weeks","correct":false},{"id":"c","text":"Only once a year","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'A propeller stored "on wing" in the open air (e.g. on an airfield or open parking area) should be exercised:',
     '[{"id":"a","text":"At least once every month","correct":true},{"id":"b","text":"Only when a critical vibration range is suspected","correct":false},{"id":"c","text":"Once every 6 months, the same as under cover","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'A propeller that has been out of service "on wing", without being exercised, for 12 months or more must, before entering or re-entering service, be:',
     '[{"id":"a","text":"Given a normal installation/functional check only","correct":false},{"id":"b","text":"Stripped, inspected and re-greased","correct":true},{"id":"c","text":"Simply exercised three times and returned to service","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'When exercising a propeller "on wing", a caution states that the feathering pump motor must not be run for more than:',
     '[{"id":"a","text":"2 minutes in any 30 minutes","correct":true},{"id":"b","text":"10 minutes continuously","correct":false},{"id":"c","text":"30 seconds in any hour","correct":false}]',
     '{"B1","B2"}');

END $$;
