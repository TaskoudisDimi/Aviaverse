-- Module 08: Basic Aerodynamics (B1/B2 Common) — Flight Forces, Climbing & Gliding, Turning & Manoeuvres, Stalling Speed
-- Source: EASA Part-66 Module 8 official textbook (IK M8), Chapters 1-6 (Flight Forces, Climbing, Gliding, Turning, Manoeuvres, Stalling Speed)

DO $$
DECLARE
    m08_id INT;
    s10_id INT;
    s11_id INT;
    s12_id INT;
    s13_id INT;
BEGIN
    SELECT id INTO m08_id FROM easa_modules WHERE code = 'M08';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M08.10') THEN
        RAISE NOTICE 'M08.10-M08.13 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 08.10: Flight Forces
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m08_id, 'M08.10', 'Flight Forces',
        $cnt10$
# Flight Forces

## Level Flight Conditions

During flight four main forces act upon an aircraft: **lift, weight, thrust and drag**. When an aircraft is in steady level flight a condition of equilibrium must prevail. This unaccelerated condition is achieved when:

- The aircraft is trimmed so that **lift equals weight**
- The engine is set so that **thrust equals drag**

Each of the four forces has its own point of action:

| Force | Acts through / along |
|-------|----------------------|
| Lift | The centre of pressure (CP) |
| Weight | The centre of gravity (CG) |
| Thrust | A line through points varying with aircraft design and attitude |
| Drag | Parallel to the direction of flight |

Although each opposing pair of forces is equal in magnitude, there can be a large difference between the two pairs. For example, lift and weight might each be 50,000 kg, while thrust and drag might be only 5,000 kg — the actual values of thrust and drag depend on the speed and power being used.

## Pitching Moments

The positions of the CP and the CG are not fixed, and under most level flight conditions they do not coincide:

- The **CP** moves with changes in angle of attack
- The **CG** moves as fuel is used up

Because lift and weight act through different points, they form a couple that produces either a nose-up or a nose-down pitching moment, depending on whether lift acts in front of or behind the CG. The same applies to the thrust and drag couple.

Ideally, the two couples (lift/weight and thrust/drag) should neutralise each other so that there is no residual moment tending to rotate the aircraft. In practice, aircraft are arranged so that:

- The **thrust/drag couple** produces a **nose-up** moment
- The **lift/weight couple** produces a **nose-down** moment

The lines of action are positioned so the strength of each couple is equal. If the engine is throttled back, the thrust/drag couple weakens, the lift/weight couple pitches the nose down, and the aircraft assumes a gliding attitude. Reapplying power strengthens the thrust/drag couple again and raises the nose back towards the level-flight attitude.

## Tailplane and Elevator

The tailplane supplies whatever force is necessary to counter any residual pitching moment left over from imperfect balancing of the two main couples — it has a **stabilising function**. Because the tailplane is positioned well away from the CG, only a small force is needed to produce a large moment. This is why the tailplane's area and lift are small compared with the mainplanes.

In level flight, if a nose-up or nose-down tendency develops, the elevator is used to trim the aircraft with an upward or downward force as required. If the tailplane must produce a **down-load** to balance the aircraft, this adds to the apparent weight, and the angle of attack must be increased (raising lift) to keep the aircraft level at the same speed. The extra drag associated with this is called **trim drag**.

## Variation of Speed

For level flight, lift must equal weight. From the lift formula:

**L = CL × ½ρV²S**

it follows that, for a given aircraft at a given weight, if speed (V) is decreased, the lift coefficient (CL) — and therefore the angle of attack — must be increased to keep lift equal to weight.

## Aircraft Attitude in Level Flight

- At **low speed**, a **high** angle of attack is required
- At **high speed**, only a **small** angle of attack is needed

Since the aircraft is in level flight, these angles of attack translate directly into pilot-visible attitude: nose-up at low speed, level at high speed. This difference is most pronounced on aircraft with swept-back wings or unswept wings of low aspect ratio.

## Aircraft Performance in Level Flight — Thrust Required

A curve of **thrust required versus airspeed** is valid for one specific aerodynamic configuration, weight, and altitude. Each point on the curve defines the thrust that must be supplied by the engine to maintain equilibrium (lift = weight, constant altitude) at that airspeed.

- At the **minimum flying speed**, the aircraft operates near the point of highest thrust required, since a large fraction of that thrust is needed to overcome **induced drag**
- The **maximum level flight speed** is reached when thrust required equals the maximum thrust available from the engine
- The **minimum flight airspeed** is not usually set by thrust requirements — stall, stability, or control problems generally set the limit first

## Effect of Weight on Level Flight

If an aircraft flies level at a fixed angle of attack (for example, the angle giving the best L/D ratio) and the weight is then reduced (e.g. by dropping stores), lift must also reduce to match the new, lower weight. To keep the same angle of attack, the speed must be reduced until lift again equals weight.

- The lower the weight, the lower the EAS needed for a given angle of attack
- **EAS at a given angle of attack is proportional to the square root of the aircraft weight**

## Effect of Altitude on Level Flight

Since lift and drag both depend on the ½ρV² factor, the relationship between EAS and angle of attack is essentially unchanged with altitude, provided weight stays constant. However, **compressibility effects** at high altitude/speed tend to reduce the CL obtainable at a given angle of attack, altering this relationship.
        $cnt10$,
        10
    ) RETURNING id INTO s10_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 08.11: Climbing & Gliding
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m08_id, 'M08.11', 'Climbing & Gliding',
        $cnt11$
# Climbing & Gliding

# Part 1: Climbing

## General

During a climb, an aircraft gains **potential energy** by gaining altitude. This is achieved by one, or a combination, of two means:

- Expending **propulsive energy** above that required for level flight
- Expending **kinetic energy** — i.e. losing velocity in a zoom climb

A **zoom** climb is a transient exchange of kinetic energy for potential energy, important for aircraft that can operate at very high kinetic energy levels. For most aircraft, however, the major part of climb performance is a near-steady process converting additional propulsive energy directly into potential energy.

## Forces in the Climb

To maintain a climb at a given EAS, more power is required than in level flight, for three reasons:

1. To overcome **drag**, as in level flight (Power required = Drag × Velocity)
2. To lift the **weight** at the vertical speed known as the **rate of climb**
3. To **accelerate** the aircraft slowly as TAS increases with increasing altitude

This gives the general power-required equation for a climb:

**Power Required = (Drag × V) + (Weight × Vc) + (Weight × V × a) / g**

where Vc is the rate of climb and a is the acceleration. The acceleration term can be ignored for low-performance aircraft, but must be accounted for in jet aircraft with high rates of climb.

In a climb, **lift is less than weight**. If so, the lift-dependent drag is less than at the same speed in level flight, since:

**Lift = Weight × cos(climb angle)**

It remains sufficiently accurate to assume lift equals weight up to about a **15° climb angle**, since cos 15° = 0.9659, keeping the resulting error small.

## Rate of Climb and Angle of Climb

Two useful relationships (using the climb angle θ):

- **sin θ = (rate of climb) / V**
- **sin θ = (Thrust − Drag) / Weight**

Since θ is the same in both expressions:

**(rate of climb) / V = (Thrust − Drag) / Weight**

Therefore:

**Rate of climb = V × (Thrust − Drag) / Weight = (Power Available − Power Required) / Weight = Excess Power / Weight**

In practice, aircraft do not always fly at the exact speed for maximum rate of climb, for reasons such as engine cooling or avoidance of an exaggerated attitude. In jet aircraft this speed is quite high; in piston aircraft it is much lower, typically close to the minimum-drag speed.

## Maximum Angle of Climb

Since **sin θ = (Thrust − Drag) / Weight**, the maximum angle of climb is achieved at the speed giving the **maximum difference between thrust and drag**:

- **Piston aircraft** — thrust decreases as speed increases after take-off, so the best speed is usually as low as is safely possible above unstick speed
- **Jet aircraft** — thrust varies little with speed, so the best speed for maximum angle of climb is at the **minimum drag speed**

## Power Available and Power Required Curves

- **Thrust horsepower available** = Thrust (lb) × Speed (fps) ÷ 550
- **Thrust horsepower required** (level flight) = Drag (lb) × TAS (fps) ÷ 550

Because jet engine thrust remains virtually constant at a given altitude regardless of speed, multiplying this constant thrust by airspeed produces a **straight-line** power-available curve. Piston engines, by contrast, lose thrust horsepower at both ends of their speed range due to reduced propeller efficiency, giving a curved shape.

The power-required curve is essentially the same whether the airframe is powered by a piston engine or a jet, since airframe drag does not depend on the power unit. The speed for minimum drag is low, but it is **not** the lowest possible speed nor the speed for minimum power — power required rises again at very low speed because of rapidly increasing induced drag.

## Climbing Performance

The vertical distance between the power-available and power-required curves represents the power available for climbing at a given speed. The **best climbing speed** (highest rate of climb) is where this excess power is at a maximum.

- For a typical piston engine aircraft, best climb speed is around **180 kt**
- For a typical jet aircraft, it is around **400 kt**

Where the two curves intersect, all available power is used to overcome drag and none remains for climbing — these intersection points define the **minimum and maximum level-flight speeds** for that power setting. As power is reduced, the power-available curve drops, maximum speed and maximum rate of climb both reduce, minimum speed increases, and eventually — when the power-available curve becomes tangential to the power-required curve — the two intersection points merge and the aircraft can no longer climb.

## Effect of Altitude on Climbing

Thrust horsepower of both piston and jet engines **decreases with altitude**, even where boosting methods (e.g. supercharging) delay the decline. As altitude increases:

- The **power-available** curve is lowered
- The **power-required** curve shifts upward and to the right — because although minimum-drag EAS stays the same at all heights, thp is calculated using TAS, which increases with altitude for a given EAS

As a result, the speed for best rate of climb reduces with altitude, and the spread between maximum and minimum level-flight speeds narrows.

## Ceilings

| Ceiling | Definition |
|---------|------------|
| **Absolute ceiling** | The altitude at which the maximum power-available curve only just touches the power-required curve — a sustained rate of climb is no longer possible (though a zoom climb can briefly exceed it) |
| **Service ceiling** | The altitude at which maximum sustained rate of climb falls to **500 fpm** (or **100 fpm** for a piston aircraft) |

## Operating Data Manuals

On older, simpler aircraft, take-off and climb data was given briefly in the Flight Manual (narrative or tabular form). On modern complex aircraft, this data is far more comprehensive and provided in the **Operating Data Manual**, in graphical or detailed tabular form.

---

# Part 2: Gliding

## Forces in the Glide

In a steady glide, with the engine giving no thrust, lift, drag and weight must be in equilibrium (ignoring the small deceleration term from maintaining constant IAS). Weight is balanced by the resultant of lift and drag. Because lift always acts at right angles to the flight path, it is tilted forward in a glide, while drag continues to act parallel to the flight path. To maintain airspeed, energy must be expended to overcome drag; with the engine not working, this energy comes from the aircraft's **potential energy** (its altitude).

An aircraft can be flown for:

- The **lowest rate of descent** — achieved at the speed requiring least power
- The **shallowest glide angle** — achieved at the speed producing least drag (compare with rate of climb vs angle of climb)

## Gliding for Endurance (Minimum Rate of Descent)

It is rare for aircraft other than sailplanes to need to glide for minimum rate of sink. For minimum rate of descent, **V sin θ** must be as small as possible. Since Drag × V (power required) = Weight × V sin θ, it follows that, for a given weight, the **rate of descent is least at the speed where power required (Drag × V) is least**.

## Gliding for Range (Best Glide Angle)

The triangle formed by lift, drag and total reaction is geometrically similar to the triangle formed by distance, height and glidepath. For distance to be maximum, the gliding angle must be minimum:

**cot θ = (W sin θ)/(W cos θ) = D/L = CD/CL = 1 / (L/D ratio)**

The best angle of glide therefore depends on flying at the angle of attack that gives the **best lift/drag ratio** — i.e. for maximum range, the aircraft should be flown for minimum drag.

- For glide angles under 15°, cos θ approximates to 1, so level-flight power curves can be used directly
- For glide angles over about 15°, lift no longer approximately equals weight; the actual lift needed is less, and gliding speed reduces by a factor of cos θ
- Since drag depends on EAS, the **best gliding speed at a given weight is a constant EAS regardless of altitude**
- Rate of descent decreases at lower altitudes as TAS decreases (for the same EAS)

## Effect of Weight on the Glide

Varying the weight does **not** affect the gliding angle, provided speed is adjusted to match the new weight:

- **Best EAS varies as the square root of the weight**
- A quick estimating rule: to compensate for a weight change of up to about 20%, adjust airspeed by **half** the percentage change in weight (e.g. a 10% weight reduction requires roughly a 5% speed reduction, and vice versa)

An increase in weight is balanced by lengthening the other force vectors proportionally, restoring the geometry of the force diagram without changing the gliding angle. The higher speed needed at the higher weight is provided automatically by the larger weight component acting along the glide path. Since the glide angle is unaffected, **range in still air is unchanged** by weight.

Although range is unaffected, **endurance decreases as weight increases** (and vice versa). If two aircraft with the same L/D ratio but different weights glide from the same height, the heavier aircraft — gliding at a higher EAS — covers the distance to touchdown in less time, even though both cover the same distance in still air. The heavier aircraft therefore has **less endurance**.
        $cnt11$,
        11
    ) RETURNING id INTO s11_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 08.12: Turning & Manoeuvres
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m08_id, 'M08.12', 'Turning & Manoeuvres',
        $cnt12$
# Turning & Manoeuvres

# Part 1: Turning

## General

To turn, an aircraft needs a **centripetal force** deflecting it towards the centre of the turn. Banking the aircraft tilts the lift vector, and the horizontal component of this now-inclined lift provides the necessary centripetal force.

If the aircraft is banked while angle of attack is held constant, the vertical component of lift becomes too small to balance weight, and the aircraft starts to descend. Therefore, as bank angle increases, angle of attack must be **progressively increased** (backward movement of the control column) to generate a greater total lift, so that:

- The vertical component remains large enough to maintain level flight
- The horizontal component is large enough to produce the required centripetal force

## Effect of Weight

In a steady level turn, ignoring thrust, lift provides both the force balancing weight and the centripetal force turning the aircraft. If the same TAS and angle of bank can be achieved, the **radius of turn is basically independent of weight or aircraft type**. However, not every aircraft can reach the same angle of bank at the same TAS.

## The Minimum Radius Turn

To achieve the minimum possible radius of turn:

- **Wing loading** must be as low as possible
- The air must be as **dense** as possible (i.e. lowest safe altitude)
- The **maximum value of the product of CL and angle of bank** must be obtained

Note this is *not* simply "maximum angle of bank." To increase bank angle further at an already-critical angle of attack, speed must increase — and an increase in speed may cause maximum CL to fall. So bank angle and CL may not both peak simultaneously.

## The Maximum Rate Turn

The rate of turn is **V/r radians per second** (V = true airspeed, r = radius of turn).

To achieve the maximum rate of turn:

- **Wing loading** must be as low as possible
- The air must be as **dense** as possible (i.e. lowest safe altitude)
- The **maximum value of the product of bank angle, speed, and CL** must be obtained

Again this is not simply "maximum angle of bank" — for the same reason as above, bank, speed and CL may not all peak together. The speed for maximum rate turn is somewhat **higher** than the speed for minimum radius turn. Increasing altitude **decreases** the rate of turn.

## Maximum G Loading

The speed for maximum g loading is **higher** than the speed for maximum rate turn.

## Effect of Flap

Lowering flap produces more lift, but also more drag, at any given EAS. A **smaller radius turn** may be achieved with flap lowered, provided:

- The flap limiting speed is not exceeded, and
- There is sufficient thrust available to overcome the extra drag

---

# Part 2: Manoeuvres

## Introduction

Changes in aircraft attitude can occur about any one, or combination, of three major axes. During manoeuvres, considerable forces act on the airframe — large enough to cause damage or structural failure if the aircraft is manoeuvred outside its design limits.

## Axes of Movement

| Axis | Also called | Passes through CG... | Motion produced |
|------|-------------|----------------------|------------------|
| **Lateral (Vertical)** | Pitching axis | Parallel to a line joining the wingtips | Pitching |
| **Longitudinal** | Roll axis | From nose to tail | Rolling |
| **Normal** | Yawing axis | At right angles to both lateral and longitudinal axes | Yawing |

If a component of forward flight velocity acts parallel to the lateral axis, the resulting motion is called **sideslip** or **skid**. These three axes are fixed relative to the aircraft, irrespective of its attitude.

## Acceleration and Newton's Laws

Any aircraft in motion is subject to **Newton's three laws of motion**:

1. A body remains at rest or in uniform straight-line motion unless acted on by an external force (**inertia**)
2. To change a body's speed and/or direction, a force is required, proportional to the body's mass — for a given mass, the greater the required rate of change of speed/direction, the greater the force needed
3. **To every action there is an equal and opposite reaction**

Most manoeuvres involve a change of direction and/or speed, which necessarily involves acceleration — often felt by the pilot as an apparent change in weight. During acceleration the aircraft is not in equilibrium, since an out-of-balance force is needed to deflect it continuously from a straight line.

A body travelling a curved path constantly "tries" to obey Newton's first law and fly in a straight line. The force needed to keep it turning, directed towards the centre of the turn, is the **centripetal force**; its equal-and-opposite reaction is the **centrifugal force**. If the constraining force is removed (e.g. a string is released), the centripetal force vanishes and the body flies off in a straight line, tangential to the circle.

## Gravity and "g"

The symbol **g** denotes the acceleration of a body falling freely under gravity — about **980.665 cm/s²** at the Earth's surface, measured in a vacuum (no drag). Gravity varies slightly with distance from the Earth's centre (the Earth is not a perfect sphere), so it differs marginally by location, but for practical purposes **g is treated as constant at sea level**. As altitude increases, g decreases progressively, but this effect is negligible at normal operating altitudes.

If a total force equal to **five times** an object's own weight acts on it, it accelerates at **5g**. Although g is strictly a unit of acceleration, pilots commonly use it (somewhat loosely) to express the force accompanying a manoeuvre as a multiple of static weight — e.g. a turn requiring a centripetal force of three times aircraft weight is called a **"3g turn."**

Since this force acts uniformly throughout the aircraft and its contents, crew feel it too, as an apparent increase in weight proportional to g:

- Straight and level flight: accelerometer reads **+1g** (normal gravity)
- Inverted level flight: accelerometer reads **−1g**; the pilot's weight, acting vertically downward, is supported by the harness
        $cnt12$,
        12
    ) RETURNING id INTO s12_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 08.13: Stalling Speed
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m08_id, 'M08.13', 'Stalling Speed',
        $cnt13$
# Stalling Speed

## General

In level flight, aircraft weight is balanced by lift. From the lift formula:

**Lift = CL × ½ρV²S**

lift is reduced whenever any factor on the right-hand side is reduced. For practical purposes, at a given altitude and configuration, air density (ρ) and wing area (S) can be treated as constant. If the engine is throttled back, drag will reduce speed, and — from the formula — lift will fall. To keep lift constant (and so maintain level flight), the only readily variable factor is the **lift coefficient, CL**.

As shown elsewhere, CL can be increased by increasing the angle of attack, restoring lift to its original value at the new, lower speed. Any further reduction in speed requires a further increase in angle of attack — each successively lower IAS corresponds to a successively higher angle of attack. Eventually, at a particular IAS, the wing reaches its **stalling angle**; beyond this point, any further attempt to increase angle of attack to maintain lift will precipitate a **stall**.

## Deriving the Stalling Speed Formula

Transposing the lift formula for indicated airspeed VI:

**VI = √( L / (CL × ½ρS) )**

For the speed corresponding to the **critical angle of attack**, CL in this formula becomes CLmax:

**V (stall) = √( L / (CLmax × ½ρS) )**

Inspecting this formula for a clean aircraft, the only two variables are VI and L:

**VI (stall) ∝ √Lift**

This relationship is demonstrated by two examples:

- **Steep dive recovery** — pulling out of a dive and increasing angle of attack to the critical angle produces flow separation and buffet at a *high* airspeed (because lift, and hence the load, is high)
- **True vertical climb** — lift is zero, so no buffet or flow separation occurs even at zero IAS

## Basic Stalling Speed

The most useful stalling speed to remember is the one corresponding to the critical angle of attack **in straight and level flight**. It may be defined as: the speed below which a clean aircraft of stated weight, engines throttled back, can no longer maintain straight and level flight. This speed (VB) is listed in the Flight Manual for a range of weights.

In level flight, Lift = Weight, so:

**VB = √( W / (CLmax × ½ρS) )**   (VB = basic stalling speed)

If the conditions behind this formula are not met, actual stalling speed will differ from VB. The factors that change stalling speed away from VB are:

- Change in **weight**
- **Manoeuvre** (load factor)
- **Configuration** (change in CLmax)
- **Power and slip-stream**

## Effect of Weight Change

Comparing the basic stalling speed formula at two different weights (with CLmax and ρS unchanged), the denominators cancel, leaving:

**VB2 / VB1 = √(W2 / W1)**

so:

**VB2 = VB1 × √(W2 / W1)**

where VB1 and VB2 are the basic stalling speeds at weights W1 and W2. This relationship holds for any given angle of attack, provided CL at that angle is unaffected by speed — because maintaining a given angle of attack in level flight at a lower weight requires a lower dynamic pressure (IAS).

## Effect of Manoeuvre (Load Factor)

Comparing the general stalling-speed formula to the level-flight formula gives the stalling speed in a manoeuvre, VM:

**VM / VB = √(L / W)**

so:

**VM = VB × √(L / W)**

The ratio **L/W is the load factor, n**, shown on the accelerometer (if fitted). So:

**VM = VB × √n**

- In a **4g** manoeuvre: stalling speed is **twice** the basic stalling speed (√4 = 2)
- In a **60° banked turn**: load factor n = 1/cos 60° = 2, so stalling speed is **√2 ≈ 1.4 times** the basic stalling speed

## Effect of Configuration

From the basic stalling speed formula, stalling speed is **inversely proportional to the square root of CLmax**:

**VB ∝ 1 / √CLmax**

Any change to CLmax — from operation of high-lift devices (flaps, slats) or from compressibility effects — changes the stalling speed. In particular, **lowering flaps or extending slats increases CLmax and produces a new, lower basic stalling speed**.
        $cnt13$,
        13
    ) RETURNING id INTO s13_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M08.10 Flight Forces (12 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s10_id, 'In steady, unaccelerated level flight, which condition of equilibrium must exist?',
     '[{"id":"a","text":"Lift equals weight and thrust equals drag","correct":true},{"id":"b","text":"Lift exceeds weight and thrust equals drag","correct":false},{"id":"c","text":"Lift equals weight and thrust exceeds drag","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s10_id, 'Lift acts through which point on the aircraft?',
     '[{"id":"a","text":"The centre of gravity (CG)","correct":false},{"id":"b","text":"The centre of pressure (CP)","correct":true},{"id":"c","text":"The aerodynamic datum point","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s10_id, 'The lift/weight couple and the thrust/drag couple are normally arranged so that:',
     '[{"id":"a","text":"The lift/weight couple produces a nose-up moment and the thrust/drag couple a nose-down moment","correct":false},{"id":"b","text":"The thrust/drag couple produces a nose-up moment and the lift/weight couple a nose-down moment","correct":true},{"id":"c","text":"Both couples produce nose-up moments simultaneously","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s10_id, 'If an engine is throttled back in level flight, the reduction in the thrust/drag couple causes the aircraft to:',
     '[{"id":"a","text":"Pitch nose-down and assume a gliding attitude","correct":true},{"id":"b","text":"Pitch nose-up and climb","correct":false},{"id":"c","text":"Remain at the same attitude with no pitching moment change","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s10_id, 'What is the primary function of the tailplane in level flight?',
     '[{"id":"a","text":"To produce the majority of the aircraft''s total lift","correct":false},{"id":"b","text":"To supply a stabilising force that counters residual pitching moments","correct":true},{"id":"c","text":"To reduce induced drag at the wingtips","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s10_id, 'Why can the tailplane produce a large stabilising moment despite its relatively small area and lift?',
     '[{"id":"a","text":"Because it is positioned some distance from the CG, giving it a long moment arm","correct":true},{"id":"b","text":"Because it always operates above the wing''s stalling angle","correct":false},{"id":"c","text":"Because its aerofoil section is symmetrical","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s10_id, 'A down-load produced by the tailplane to trim the aircraft results in:',
     '[{"id":"a","text":"Reduced apparent weight and reduced angle of attack required","correct":false},{"id":"b","text":"Increased apparent weight, requiring increased angle of attack and producing trim drag","correct":true},{"id":"c","text":"No change to the required angle of attack","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s10_id, 'According to the lift formula L = CL × ½ρV²S, if speed is decreased in level flight while weight stays the same, what must happen?',
     '[{"id":"a","text":"CL (angle of attack) must decrease","correct":false},{"id":"b","text":"CL (angle of attack) must increase","correct":true},{"id":"c","text":"Wing area must increase","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s10_id, 'In level flight, aircraft attitude at low speed compared to high speed is generally:',
     '[{"id":"a","text":"Nose-up at low speed, level at high speed","correct":true},{"id":"b","text":"Level at low speed, nose-up at high speed","correct":false},{"id":"c","text":"Nose-down at both low and high speed","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s10_id, 'The maximum level flight speed of an aircraft is reached when:',
     '[{"id":"a","text":"Thrust required equals the maximum thrust available from the engine","correct":true},{"id":"b","text":"Induced drag falls to zero","correct":false},{"id":"c","text":"The angle of attack reaches its critical value","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s10_id, 'If an aircraft''s weight is reduced while flying level at a constant angle of attack, to maintain that same angle of attack the pilot must:',
     '[{"id":"a","text":"Increase speed","correct":false},{"id":"b","text":"Decrease speed","correct":true},{"id":"c","text":"Keep speed unchanged","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s10_id, 'At altitude, the relationship between EAS and angle of attack (for constant weight) is:',
     '[{"id":"a","text":"Unchanged from sea level, except for compressibility effects which reduce CL for a given angle of attack","correct":true},{"id":"b","text":"Completely different from sea level regardless of compressibility","correct":false},{"id":"c","text":"Always improved because CLmax increases with altitude","correct":false}]',
     '{"B1.1","B1.3","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M08.11 Climbing & Gliding (16 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s11_id, 'During a steady climb, an aircraft gains altitude primarily by:',
     '[{"id":"a","text":"Converting kinetic energy into potential energy only","correct":false},{"id":"b","text":"Expending propulsive energy above that required for level flight","correct":true},{"id":"c","text":"Reducing drag to zero","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s11_id, 'A zoom climb is best described as:',
     '[{"id":"a","text":"A sustained climb using excess thrust only","correct":false},{"id":"b","text":"A transient exchange of kinetic energy for potential energy","correct":true},{"id":"c","text":"A climb performed exclusively at minimum drag speed","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s11_id, 'In the power-required equation for a climb, the term accounting for lifting the aircraft at the rate of climb is:',
     '[{"id":"a","text":"Drag × V","correct":false},{"id":"b","text":"Weight × Vc","correct":true},{"id":"c","text":"Weight × V × a / g","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s11_id, 'Up to approximately what climb angle is it sufficiently accurate to assume that lift equals weight?',
     '[{"id":"a","text":"5°","correct":false},{"id":"b","text":"15°","correct":true},{"id":"c","text":"30°","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s11_id, 'Rate of climb can be expressed as:',
     '[{"id":"a","text":"Excess power divided by weight","correct":true},{"id":"b","text":"Excess power multiplied by weight","correct":false},{"id":"c","text":"Excess thrust divided by drag","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s11_id, 'For a jet aircraft, the speed giving the maximum angle of climb is approximately:',
     '[{"id":"a","text":"The stalling speed","correct":false},{"id":"b","text":"The minimum drag speed","correct":true},{"id":"c","text":"The never-exceed speed","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s11_id, 'Why does the thrust-horsepower-available curve for a jet engine appear as an approximately straight line against speed?',
     '[{"id":"a","text":"Because jet thrust remains virtually constant with speed at a given altitude","correct":true},{"id":"b","text":"Because propeller efficiency is constant at all speeds","correct":false},{"id":"c","text":"Because jet engines produce zero thrust at low speed","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s11_id, 'The best climbing speed (highest rate of climb) occurs where:',
     '[{"id":"a","text":"Power required is at a minimum","correct":false},{"id":"b","text":"The excess power (power available minus power required) is at a maximum","correct":true},{"id":"c","text":"Thrust exactly equals drag","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s11_id, 'At the intersection points of the power-available and power-required curves, an aircraft:',
     '[{"id":"a","text":"Has maximum excess power for climbing","correct":false},{"id":"b","text":"Has zero power available for climbing — these define minimum and maximum level flight speeds","correct":true},{"id":"c","text":"Is at its absolute ceiling","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s11_id, 'As altitude increases, the speed for best rate of climb and the spread between minimum and maximum level flight speeds:',
     '[{"id":"a","text":"Both increase","correct":false},{"id":"b","text":"Both reduce","correct":true},{"id":"c","text":"Remain unchanged","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s11_id, 'The service ceiling of a jet aircraft is defined as the altitude where maximum sustained rate of climb falls to:',
     '[{"id":"a","text":"100 fpm","correct":false},{"id":"b","text":"500 fpm","correct":true},{"id":"c","text":"1000 fpm","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s11_id, 'In a steady glide with the engine giving no thrust, which forces must be in equilibrium?',
     '[{"id":"a","text":"Lift and weight only","correct":false},{"id":"b","text":"Lift, drag and weight","correct":true},{"id":"c","text":"Thrust, drag and weight","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s11_id, 'For minimum rate of descent while gliding, the aircraft should be flown at the speed where:',
     '[{"id":"a","text":"Drag is at an absolute minimum","correct":false},{"id":"b","text":"Power required (Drag × V) is at a minimum","correct":true},{"id":"c","text":"IAS is highest","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s11_id, 'The best angle of glide (for maximum range) is obtained by flying at the angle of attack that gives:',
     '[{"id":"a","text":"Maximum CLmax","correct":false},{"id":"b","text":"The best lift/drag ratio (minimum drag)","correct":true},{"id":"c","text":"Zero induced drag","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s11_id, 'The best gliding speed at a given weight, in terms of EAS, is:',
     '[{"id":"a","text":"Constant regardless of altitude","correct":true},{"id":"b","text":"Higher at lower altitude","correct":false},{"id":"c","text":"Lower at lower altitude","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s11_id, 'An aircraft''s weight is reduced by 10%. Using the estimating rule for gliding, approximately how much should best glide EAS be reduced?',
     '[{"id":"a","text":"2.5%","correct":false},{"id":"b","text":"5%","correct":true},{"id":"c","text":"10%","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s11_id, 'Two aircraft with the same L/D ratio but different weights glide from the same height. Compared to the lighter aircraft, the heavier aircraft will have:',
     '[{"id":"a","text":"The same range but less endurance","correct":true},{"id":"b","text":"Less range and less endurance","correct":false},{"id":"c","text":"The same range and the same endurance","correct":false}]',
     '{"B1.1","B1.3","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M08.12 Turning & Manoeuvres (16 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s12_id, 'In a banked turn, the horizontal component of lift provides:',
     '[{"id":"a","text":"The centripetal force needed to turn the aircraft","correct":true},{"id":"b","text":"The force that balances aircraft weight","correct":false},{"id":"c","text":"Additional thrust for the turn","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s12_id, 'If an aircraft is banked while angle of attack is held constant, the aircraft will:',
     '[{"id":"a","text":"Climb, since total lift increases with bank","correct":false},{"id":"b","text":"Descend, since the vertical component of lift becomes too small to balance weight","correct":true},{"id":"c","text":"Maintain level flight automatically","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s12_id, 'For a steady level turn at a given TAS and angle of bank, the radius of turn is:',
     '[{"id":"a","text":"Strongly dependent on aircraft weight","correct":false},{"id":"b","text":"Basically independent of weight or aircraft type","correct":true},{"id":"c","text":"Dependent only on wing area","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s12_id, 'To achieve the minimum radius turn, which conditions should be satisfied?',
     '[{"id":"a","text":"Low wing loading, high air density, maximum product of CL and bank angle","correct":true},{"id":"b","text":"High wing loading, low air density, maximum bank angle alone","correct":false},{"id":"c","text":"Low wing loading only, with bank angle irrelevant","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s12_id, 'Why is "maximum angle of bank alone" not sufficient for achieving minimum radius turn?',
     '[{"id":"a","text":"Because increasing bank at a critical angle of attack requires increased speed, which may reduce maximum CL","correct":true},{"id":"b","text":"Because bank angle has no effect on turn radius","correct":false},{"id":"c","text":"Because wing loading always decreases with bank angle","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s12_id, 'The rate of turn is expressed as:',
     '[{"id":"a","text":"V × r radians per second","correct":false},{"id":"b","text":"V/r radians per second","correct":true},{"id":"c","text":"r/V radians per second","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s12_id, 'To achieve the maximum rate of turn, the maximum value of which product must be obtained?',
     '[{"id":"a","text":"Bank angle and wing loading","correct":false},{"id":"b","text":"Bank angle, speed and CL","correct":true},{"id":"c","text":"Speed and wing loading only","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s12_id, 'Compared to the speed for minimum radius turn, the speed for maximum rate turn is:',
     '[{"id":"a","text":"Somewhat lower","correct":false},{"id":"b","text":"Somewhat higher","correct":true},{"id":"c","text":"Identical","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s12_id, 'Increasing altitude causes the rate of turn (for the same bank and speed conditions) to:',
     '[{"id":"a","text":"Increase","correct":false},{"id":"b","text":"Decrease","correct":true},{"id":"c","text":"Remain unaffected","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s12_id, 'Lowering flap during a turn can produce a smaller radius turn provided that:',
     '[{"id":"a","text":"Flap limiting speed is not exceeded and sufficient thrust is available to overcome the extra drag","correct":true},{"id":"b","text":"The aircraft is above its service ceiling","correct":false},{"id":"c","text":"The engine is throttled back","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s12_id, 'The three major axes of an aircraft all pass through:',
     '[{"id":"a","text":"The centre of pressure","correct":false},{"id":"b","text":"The centre of gravity","correct":true},{"id":"c","text":"The wing root","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s12_id, 'Rotation about the longitudinal axis is called:',
     '[{"id":"a","text":"Pitching","correct":false},{"id":"b","text":"Yawing","correct":false},{"id":"c","text":"Rolling","correct":true}]',
     '{"B1.1","B1.3","B2"}'),

    (s12_id, 'Which of Newton''s laws states that to every action there is an equal and opposite reaction?',
     '[{"id":"a","text":"The first law","correct":false},{"id":"b","text":"The second law","correct":false},{"id":"c","text":"The third law","correct":true}]',
     '{"B1.1","B1.3","B2"}'),

    (s12_id, 'Centripetal force is best described as:',
     '[{"id":"a","text":"The force that deflects a body towards the centre of its curved path","correct":true},{"id":"b","text":"The reaction force that flings a body outward from a curved path","correct":false},{"id":"c","text":"A force that only exists in aircraft, not in general mechanics","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s12_id, 'During straight and level flight, an aircraft accelerometer normally reads:',
     '[{"id":"a","text":"0g","correct":false},{"id":"b","text":"+1g","correct":true},{"id":"c","text":"+2g","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s12_id, 'If a manoeuvre requires a centripetal force of three times the aircraft''s weight, pilots refer to this as:',
     '[{"id":"a","text":"A 1g turn","correct":false},{"id":"b","text":"A 3g turn","correct":true},{"id":"c","text":"A 9g turn","correct":false}]',
     '{"B1.1","B1.3","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M08.13 Stalling Speed (12 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s13_id, 'In level flight, when an engine is throttled back and speed reduces, which factor is readily varied to keep lift equal to weight?',
     '[{"id":"a","text":"Air density (ρ)","correct":false},{"id":"b","text":"Wing area (S)","correct":false},{"id":"c","text":"Lift coefficient (CL), via angle of attack","correct":true}]',
     '{"B1.1","B1.3","B2"}'),

    (s13_id, 'A stall occurs when:',
     '[{"id":"a","text":"Angle of attack is increased beyond the stalling (critical) angle","correct":true},{"id":"b","text":"IAS exceeds VNE","correct":false},{"id":"c","text":"CL reaches zero","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s13_id, 'For a clean aircraft, the stalling speed formula shows that VI (stall) is proportional to:',
     '[{"id":"a","text":"Lift squared","correct":false},{"id":"b","text":"The square root of lift","correct":true},{"id":"c","text":"The inverse of lift","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s13_id, 'During recovery from a steep dive, buffet due to flow separation at the critical angle of attack is typically felt:',
     '[{"id":"a","text":"At a high airspeed","correct":true},{"id":"b","text":"Only at zero airspeed","correct":false},{"id":"c","text":"Only during a vertical climb","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s13_id, 'In a true vertical climb, no stall buffet is produced even at zero IAS because:',
     '[{"id":"a","text":"CLmax is infinite in a vertical climb","correct":false},{"id":"b","text":"Lift is zero, so there is no flow separation","correct":true},{"id":"c","text":"The wing cannot exceed its critical angle of attack vertically","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s13_id, 'The basic stalling speed (VB) is defined for which flight condition?',
     '[{"id":"a","text":"A steep turn at maximum bank angle","correct":false},{"id":"b","text":"Straight and level flight, clean configuration, engines throttled back","correct":true},{"id":"c","text":"A maximum-power climb","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s13_id, 'An aircraft''s basic stalling speed at weight W1 is 120 kt. If weight increases to a value such that W2/W1 = 1.21, what is the new basic stalling speed?',
     '[{"id":"a","text":"120 kt (unchanged)","correct":false},{"id":"b","text":"132 kt","correct":true},{"id":"c","text":"145 kt","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s13_id, 'The relationship VB2 = VB1 × √(W2/W1) is valid provided that:',
     '[{"id":"a","text":"CLmax at the critical angle of attack is unaffected by speed","correct":true},{"id":"b","text":"The aircraft is in a banked turn","correct":false},{"id":"c","text":"Flaps are extended","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s13_id, 'The relationship between load factor (n) and manoeuvring stall speed (VM) is:',
     '[{"id":"a","text":"VM = VB × n","correct":false},{"id":"b","text":"VM = VB × √n","correct":true},{"id":"c","text":"VM = VB / n","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s13_id, 'In a 4g manoeuvre, the stalling speed relative to the basic stalling speed is:',
     '[{"id":"a","text":"The same as VB","correct":false},{"id":"b","text":"Twice VB","correct":true},{"id":"c","text":"Four times VB","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s13_id, 'In a level turn at 60° angle of bank, the load factor is 2. What is the resulting stalling speed relative to the basic stalling speed?',
     '[{"id":"a","text":"Approximately 1.4 times VB","correct":true},{"id":"b","text":"Exactly 2 times VB","correct":false},{"id":"c","text":"Approximately 0.7 times VB","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s13_id, 'Lowering flaps or extending slats typically changes the basic stalling speed by:',
     '[{"id":"a","text":"Increasing CLmax, which lowers the basic stalling speed","correct":true},{"id":"b","text":"Decreasing CLmax, which raises the basic stalling speed","correct":false},{"id":"c","text":"Having no effect on CLmax or stalling speed","correct":false}]',
     '{"B1.1","B1.3","B2"}');

END $$;
