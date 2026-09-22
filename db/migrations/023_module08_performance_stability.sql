-- Module 08: Basic Aerodynamics (B1/B2 Common) — Performance & Flight Stability & Dynamics
-- Source: IKAROS Aviation Training Center, IK M8 Basic Aerodynamics (B1/B2 Common), Chapters 7-8 and Part 8.4 Chapters 1-2
-- Covers subjects M08.14 (Performance) through M08.17 (Dynamic Stability)

DO $$
DECLARE
    m08_id INT;
    s14_id INT;
    s15_id INT;
    s16_id INT;
    s17_id INT;
BEGIN
    SELECT id INTO m08_id FROM easa_modules WHERE code = 'M08';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M08.14') THEN
        RAISE NOTICE 'M08.14-M08.17 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 08.14: Performance
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m08_id, 'M08.14', 'Performance',
        $cnt14$
# Performance

## The Manoeuvre Envelope (V-n Diagram)

The **manoeuvre envelope**, also called the **V-n diagram**, is a graphical representation of the operating limits of an aircraft. It plots **load factor (n)** on the vertical axis (both positive and negative) against **EAS (equivalent airspeed) or Mach number** on the horizontal axis.

The envelope serves three purposes:
- To lay down design requirements for a new aircraft
- For manufacturers to illustrate the performance of their products
- As a means of comparing the capabilities of different aircraft types

## Limits to the Basic Envelope

### The Lift (Stalling) Boundary

The most fundamental limit on the operation of an aircraft is the increase of stalling speed as load factor increases. As load factor rises, more lift — and therefore a higher angle of attack or a higher speed — is required to sustain flight, so the aircraft will stall at progressively higher speeds as n increases. Flight below the basic (1g) stalling speed is possible at load factors below one, so the complete envelope always shows both positive and negative load factor limits.

### G Limits

Every aircraft is designed to a structural strength requirement appropriate to its role:
- **Fighter and training aircraft** need to be stronger than transport aircraft, and are typically built to withstand about **+5g** — approximately the maximum an average human pilot can tolerate while remaining conscious.
- **Transport aircraft** are typically built to about **+2g**.
- Negative g limits are usually much lower in magnitude than positive limits, e.g. roughly **−3½g** for training aircraft and **−½g** for transport aircraft.

Extra structural strength means extra structural weight, which in turn requires larger engines — so aircraft are generally designed to the minimum strength needed for their role, plus a safety margin. These design limits usually carry a **50% safety margin** above which permanent deformation or failure may occur — though lesser damage (popped rivets, panels coming loose) can occur well before that ultimate limit is reached. Because the safety margin must be preserved, **g limits must be reduced if aircraft weight increases**.

### EAS Limitation (V<sub>NE</sub>)

An aircraft has a maximum permissible speed limit (maximum permissible diving speed) with a small safety factor, typically 5–10%. Exceeding this speed may cause loss of access panels, failure of the weakest structure (often the tailplane or canopy), or control surface damage. This speed limit forms the right-hand boundary of the basic manoeuvre envelope; operation outside the complete envelope is either impossible or unsafe.

## Variations in C<sub>L MAX</sub>

The basic envelope boundaries described above assume C<sub>L MAX</sub> remains constant. In reality, when plotted against Mach number, C<sub>L MAX</sub> varies with **compressibility**, **Reynolds number**, and **adverse pressure gradient**.

### Compressibility Effects

Increasing angle of attack increases local flow acceleration over the wing, so the critical Mach number (M<sub>CRIT</sub>) is reached at a progressively lower free-stream Mach number (M<sub>FS</sub>). The resulting shockwaves form nearer the leading edge, and as the flow behind the shock separates and becomes turbulent, a greater part of the wing loses lift.

### Reynolds Number Effects

An increase in Reynolds number due to speed only slightly affects the slope of the C<sub>L</sub> curve (which remains essentially a straight line against speed). However, it has a marked effect on C<sub>L MAX</sub> because a higher Reynolds number delays separation to a higher angle of attack, increasing C<sub>L MAX</sub>. In theory, C<sub>L MAX</sub> would rise with speed until compressibility effects become dominant, at which point it declines.

### Adverse Pressure Gradient

As speed increases, the adverse pressure gradient on the upper surface at high angles of attack becomes stronger. This slows and thickens the boundary layer, moving the separation point forward and reducing C<sub>L MAX</sub>.

### Practical Limits on Usable C<sub>L MAX</sub>

For a variety of reasons, the whole aircraft may be unable to use the theoretical highest angle of attack, so the **usable** C<sub>L MAX</sub> is reduced. Contributing factors include:
- Reduced elevator effectiveness when it operates behind a shockwave on the wing or tailplane
- Buffet on the tailplane from the turbulent wake of the wing, making it impossible to accurately hold angles of attack near the stall, forcing a lower angle to be chosen
- Wing-tip stalling, or increased downwash over the tailplane from the large vortices of a swept wing, which may cause pitch-up and further limit the usable angle of attack

In practice, the theoretical C<sub>L MAX</sub> is often unusable because control problems arising from separated flow prevent the required angle of attack from being safely selected.

## The Modified Envelope

Because usable C<sub>L MAX</sub> is reduced, the wing produces less lift than expected at a given speed, so the available load factor is reduced and a new lift boundary curve must be drawn. Since a given EAS corresponds to a progressively higher Mach number as altitude increases, C<sub>L MAX</sub> declines further with altitude, so new lift boundary curves must be constructed for each altitude (though the Mach number at which maximum load factor occurs stays the same). A lift boundary also exists for negative load factors, and a different lift boundary exists for each aircraft weight.

## Structural Limitations

### Mach Limit

Aircraft designed for subsonic or transonic flight have a compressibility Mach number limit. Exceeding it causes shockwave position and size to make control difficult or impossible, and may lead to structural failure. At high angles of attack the airflow accelerates more, so wave development occurs at a lower Mach number — this is why the Mach limit appears as a curved line on the envelope. Because the EAS/Mach number relationship changes with altitude, separate Mach number limit lines must be drawn for each altitude.

### Rolling G Limits

A **rolling g limit** is an additional, lower limit imposed when roll control is deflected, because the wing structure must also withstand the twisting (torsional) forces caused by aileron deflection in addition to the normal bending loads from g.

### Buffet Corners

Where high air loads combine with high structural loadings, the weakest part of the structure is more likely to fail. For the tailplane, this risk is aggravated by buffet from the turbulent wake of the wings, which can lead to fatigue failure.

### Other Limits

Additional limits may be imposed for different weights, fuel states, external stores, and CG positions.

## Information Available from the Manoeuvre Envelope

When all limits are drawn together on a single diagram, the envelope shows the available range of manoeuvre at any given height:
- Basic stalling speed
- Available load factor at any height and speed
- Maximum EAS at any height
- Stalling speed at any height and load factor

In addition, the following Flight Manual limitations can be read directly from the envelope:
- Maximum permitted load factor
- Maximum EAS
- Compressibility Mach number
- Rolling g limits

## Manoeuvring Considerations

During a manoeuvre, an aircraft is not in a state of equilibrium, because an out-of-balance force is required to continuously deflect it from a straight line. This out-of-balance force is called **centripetal force**.

### Summary — Causes of Variation in C<sub>L MAX</sub>

- Compressibility effects
- Separation behind shockwaves
- Reduction of control effectiveness behind shockwaves
- Buffet on the tailplane, making it impossible to hold an accurate angle of attack
- Change in Reynolds number
- Increase in the adverse pressure gradient with speed
        $cnt14$,
        14
    ) RETURNING id INTO s14_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 08.15: Lift Augmentation
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m08_id, 'M08.15', 'Lift Augmentation',
        $cnt15$
# Lift Augmentation

## Introduction

Lift augmentation devices increase the lift produced by a wing, particularly at low speed, using two broad categories:
- **Leading edge devices**
- **Trailing edge devices**

## Leading Edge Devices

The purpose of a leading edge device is to increase the velocity of the airflow over the top surface of the aerofoil. This delays the transition to turbulent flow — the transition point moves back towards the trailing edge. The result is that a higher angle of attack (and therefore a higher lift coefficient) can be reached before the stall, because the stalling angle is increased.

There is inevitably a corresponding increase in drag coefficient, but this is of little consequence because leading edge devices are primarily used to augment lift at low speed, where drag penalties matter less.

Leading edge devices can create trim problems, because the centre of pressure moves further forward as angle of attack increases. To fully exploit the short take-off and landing performance that leading edge devices provide, an aeroplane may need a tail-wheel configuration with a long main landing gear — which brings its own structural and handling complications.

### Types of Leading Edge Device

**Slats**
Slats are small auxiliary aerofoils mounted just in front of the main aerofoil, separated by a gap or slot. At high angles of attack, air accelerated through the slot maintains smooth, attached flow over the upper surface of the wing, delaying the stall to a higher angle. At conventional (cruise) angles of attack, the slat retracts and forms part of the wing leading edge.

The lift coefficient of the part of the wing fitted with a slat can be increased by as much as **60%**, and the wing stalling angle can be increased from around **15° to about 22°**.

**Droop Leading Edge**
A droop leading edge increases the camber (or effective camber) of the leading edge, accelerating the airflow over the upper surface and delaying separation — an effect similar to a slat. The key difference is that thin, high-speed aerofoils can be fitted with a droop leading edge without compromising high-speed performance, whereas slats are more commonly associated with low-speed aerofoils (although the wings of larger modern passenger aircraft are large enough to accommodate slats too).

For any leading edge device to produce the required increase in lift, the aerofoil must be operated at an angle of attack approaching its "clean" stalling angle. This is achieved either by giving the aeroplane a nose-up attitude (pitch control) or by lowering the trailing edge of the aerofoil (or part of it) to increase its effective angle of attack.

## Trailing Edge Devices (Flaps)

Flaps increase the camber of the aerofoil's upper surface **and** increase the effective angle of attack, producing an increase in lift coefficient without requiring an increase in speed. With large flap deflection there is also an increase in drag coefficient — provided there is enough power available to maintain the required thrust, this gives a high climb angle and rate, and also considerably shortens the landing run.

### Types of Flap

| Flap type | Mechanism | Key characteristic |
|---|---|---|
| **Plain Flap** | Rear part of the wing is hinged and normally moves downwards only. Fitted at the inboard wing sections; port and starboard flaps move symmetrically. | Simple, but limited lift gain |
| **Split Flap** | Only the lower aerofoil surface is hinged and deflects down. The protruding flap forces more air over the top surface at higher velocity. | Structurally awkward, but very little centre of pressure movement — useful trim characteristics |
| **Extension Flap** | Ranges from a single flap to designs with up to three extending elements; slots are typically exposed as the flap lowers, accelerating flow over the flap's upper surface to delay separation. Wing area is directly increased as well as camber and angle of attack. | Centre of pressure moves rearward (nose-down pitching tendency), requiring greater rearward control column force on take-off and more sensitivity on landing — most aircraft with extension flaps have a pitch trim input (mechanical or electronic) as standard |

### Combination of Flaps and Slats

Combining slotted extension flaps with leading edge slats is the most effective system, capable of increasing the lift coefficient of the affected part of the wing by as much as **120%**. Lowering the flap produces the high angle of attack at which the slat is most efficient, without the pronounced nose-up attitude seen with slats alone. As a further benefit, the airflow accelerated through the slot tends to move the centre of pressure forward when the flaps are fully extended — with careful aerofoil design, centre-of-pressure movement can be reduced to the point where there are practically no adverse pitching moments.
        $cnt15$,
        15
    ) RETURNING id INTO s15_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 08.16: Static Stability
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m08_id, 'M08.16', 'Static Stability',
        $cnt16$
# Static Stability

## Definitions

Newton's first law states that a body tends to remain at rest or in uniform motion unless disturbed by an external force. Where a body is disturbed, **stability** concerns the motion of the body after the disturbing force has been removed. This response is considered under two headings:

- **Static stability** — describes the *immediate* reaction of the body after disturbance.
- **Dynamic stability** — describes the *subsequent* reaction over time.

The response relative to the original equilibrium is described using three terms:
- **Positive stability** — the body tends to return towards its pre-disturbance position (colloquially "stable").
- **Neutral stability** — the body takes up a new position with a constant relationship to the original.
- **Negative stability** — the body continuously diverges from the original state (colloquially "unstable").

### The Bowl-and-Ball Analogy

A simple analogy for static stability is a ball inside (or on top of) a bowl. If the ball is displaced from its position and released:
- If it rolls back towards its original position, it has **positive stability** (ball in a concave bowl).
- If it stays in its new position, it has **neutral stability** (ball on a flat surface).
- If it continues to move away, it has **negative stability** (ball on top of an inverted, convex bowl).

The degree of stability can be shown graphically by plotting displacement (any quantity — distance, moment, volts, etc.) against time. Two parameters describe the degree of stability:
- The **sign** of the slope of the response curve indicates whether the response is favourable (stable) or unfavourable (unstable).
- The **magnitude of the slope** is a measure of the strength of the static stability.

### The Three Body Axes

Before considering an aircraft's response to disturbance, motion is resolved into components about the three body axes through the CG:

| Axis | Motion about the axis | Associated stability |
|---|---|---|
| Longitudinal (x) | Roll (p) | Lateral |
| Lateral (y) | Pitch (q) | Longitudinal |
| Normal (z) | Yaw (r) | Directional |

The motion involved is angular velocity, and the disturbance is an angular displacement. Each axis is normally considered separately, although in anything other than straight-and-level flight the aircraft's motion is more complex — e.g. in a level turn the aircraft is both yawing and rolling simultaneously.

## Directional Stability

Directional stability is stability about the normal (vertical) axis. If an aircraft is displaced directionally (yawed), its momentum initially carries it along its original flight path, so the fin now meets the airflow at an angle. This produces a turning moment about the CG which yaws the aircraft back towards its original heading — the fin acts like a weathervane.

For a given displacement (sideslip angle), the strength of the restoring moment depends mainly on:
- The design of the vertical stabiliser (fin and rudder)
- The moment arm (distance from CG to the fin's centre of pressure)

**Design of the fin and rudder**: The vertical stabiliser is a symmetrical aerofoil that produces an aerodynamic force at positive angles of attack (i.e. in sideslip). The total side force on the fin/rudder is proportional to its lift coefficient and area; the lift coefficient varies with aspect ratio and sweepback, as with any aerofoil. At high sideslip angles the fin can stall — designers avoid this by increasing sweepback, decreasing aspect ratio, or fitting multiple low-aspect-ratio fins.

**Moment arm**: The position of the CG determines the distance between the CG and the fin's centre of pressure, and therefore the degree of directional stability. A **forward CG lengthens the moment arm and increases directional stability**; a **rearward CG shortens it and decreases directional stability**.

## Longitudinal Stability

Longitudinal stability is stability about the lateral (transverse) axis. If an aircraft is disturbed so that the nose pitches up, momentum carries the aircraft along its original flight path, giving the tailplane a positive angle of attack. This produces a nose-down restoring moment that returns the aircraft to level flight. The reverse happens if the nose pitches down: the tailplane develops a negative angle of attack and produces a nose-up restoring moment.

The main factors affecting longitudinal stability are:
- Design of the tailplane
- Position of the CG

### Design of the Tailplane

The tailplane is itself an aerofoil; the lift force resulting from a change in angle of attack is proportional to its C<sub>L</sub> and area. The lift increment produced depends on the slope of the tailplane's C<sub>L</sub> curve and on the downwash angle behind the wing (if downwash changes with angle of attack). Key tail design features affecting the restoring moment:

- **Moment arm** — the distance from the tailplane's centre of lift to the CG.
- **Tail area** — since total wing lift is C<sub>L wing</sub> × q × S and total tail lift is C<sub>L tail</sub> × q × S, comparing tail and wing moments (at a constant EAS) reduces to comparing their respective areas and moment arms.
- **Tail volume** — the product of tailplane area × moment arm. The ratio of tail volume to wing volume is the principal design parameter used to determine longitudinal stability.
- **Planform** — as with any lifting surface, the slope of the C<sub>L</sub> curve is affected by aspect ratio, taper, and sweepback. A swept-back tail produces lower C<sub>L</sub> increments than a rectangular-planform tail for the same change in angle of attack.
- **Wing downwash** — if a disturbance changes the downwash angle from the wing, the tailplane's effective angle of attack changes too. For example, a nose-up disturbance that increases downwash reduces the tailplane's effective angle of attack, reducing tail lift and hence the restoring moment — reducing stability. This effect is typically compensated for by positioning the CG further forward, which increases the moment arm.

### Position of the CG

The CG position affects the ratio of tail moment to wing moment, and therefore the degree of longitudinal stability:
- A **rearward CG decreases** positive stability.
- A **forward CG increases** positive stability.

Because CG position affects positive longitudinal stability, it also affects pitch handling characteristics — stability opposes manoeuvre, since the pitching moment from elevator deflection must overcome the restoring moment from the aircraft's inherent stability. For a given elevator deflection, an aircraft with a forward CG (more stable) gives a smaller pitch response, while one with an aft CG (less stable) gives a larger response.

### Neutral Point and CG Margin

The Aircrew/Flight Manual specifies the permitted CG range. The forward limit is set mainly by the manoeuvrability required; more critical to the pilot is the **aft limit**. If the CG moves aft beyond the permitted limit, a point is eventually reached where the (increasing) wing moment equals the (decreasing) tail moment — the restoring moment becomes zero, and the aircraft is neutrally stable. This CG position is the **neutral point**. The published aft CG limit is always safely forward of the neutral point; exceeding loading limits can put the CG on or aft of the neutral point, an unsafe condition made worse if the controls are allowed to "trail" (stick free).

The **static margin** (or CG margin, stick fixed) is the distance the CG can move aft from the quoted datum before reaching the neutral point — it is a direct indication of the degree of longitudinal stability. A larger tail area produces a larger tail moment and therefore a greater static margin. The greater the CG margin, the greater the stability: a training or fighter aircraft might have a margin of only a few centimetres, while a large passenger aircraft may have a margin greater than a metre.

### Aerodynamic Centre

Rather than the centre of pressure, stability texts typically refer to the **aerodynamic centre (AC)** — a point within the aerofoil (usually ahead of the CP) about which the pitching moment is independent of angle of attack. It is a convenient, calculated datum for the mathematical treatment of stability and control.

### Stick-Free Longitudinal Stability

If the elevator is left free to trail, the change in tail force following a displacement depends on the position the floating elevator takes up — usually it trails with the relative airflow, which reduces the tail moment. With the tail moment reduced, the CG position at which tail and wing moments balance moves further forward (because the less-effective tail needs a longer moment arm) — the neutral point moves forward, reducing the **stick-free CG margin**. Since this margin measures longitudinal stability, allowing the elevators to float free **reduces longitudinal stability**.

## Lateral Stability (Stick Fixed)

When an aircraft is disturbed in roll about its longitudinal axis, the angle of attack of the down-going wing increases and that of the up-going wing decreases. Provided the aircraft is not near the stall, this produces more lift on the down-going wing and less on the up-going wing — a rolling moment that opposes the disturbance, known as the **damping in roll** effect.

Because damping in roll is proportional to roll rate, it cannot by itself return the aircraft to wings-level — once the rolling motion stops, the damping moment disappears, so an aircraft disturbed in roll (with no other force) simply remains at the new bank angle. This means an aircraft has **neutral static stability with respect to angle of bank**. However, a laterally disturbed aircraft also develops a **sideslip**, caused by the inclination of the lift vector once banked, and it is this sideslip that produces the forces which actually roll the aircraft back towards wings-level. Lateral static stability therefore reacts to **sideslip velocity (v)**, or a displacement in yaw, and this strongly influences the aircraft's long-term (lateral dynamic) response.

### Contributions to Lateral Stability

The main contributions to overall lateral static stability are:
- Wing contribution — dihedral, sweepback
- Wing/fuselage interference
- Fuselage and fin contribution
- Undercarriage, flap, and power effects

**Dihedral Effect**: With geometric dihedral, a point nearer the wingtip is higher than a point further inboard. In a sideslip to starboard, the relative airflow crosses the starboard wing from the higher point to the lower point — equivalent to raising the leading edge and lowering the trailing edge, i.e. increasing angle of attack, so lift increases (provided the aircraft is not near the stall). On the port wing the opposite happens: angle of attack and lift both reduce. The result is a stable rolling moment whenever sideslip is present. This contribution depends on dihedral angle and the slope of the lift curve, and is therefore also affected by aspect ratio and wing taper. Dihedral is one of the most important contributions to lateral stability — so much so that lateral static stability is often loosely called "the dihedral effect," even though several other contributions exist.

**Sweepback**: Sweepback adds a further stabilising contribution, effectively increasing the wing's apparent dihedral (roughly, 10° of sweep behaves like about 1° of dihedral). In sideslip:
- *Angle of sweep* — the component of flow accelerated by section camber is proportional to the cosine of the sweep angle. Sideslip decreases the effective sweep of the leading (low) wing and increases that of the trailing (high) wing, inducing a stable rolling moment.
- *Aspect ratio* — on the leading (low) wing, effective span increases and chord decreases (an effective increase in aspect ratio); on the trailing (high) wing the reverse occurs (a reduction in aspect ratio). The more efficient low wing produces more lift, again giving a stable rolling moment.
- *Taper ratio* — a smaller effect: increased taper ratio (tip chord relative to root chord) affects lift coefficient and produces a small additional stable rolling moment in sideslip.

**Variation with Speed**: Because the contribution of sweep to lateral stability depends on the divergence of the C<sub>L</sub> curves of the leading and trailing wings, it becomes more significant at higher C<sub>L</sub> — i.e. at lower forward speeds. Consequently the "dihedral effect" varies considerably across the speed range: stability from sweep is much greater at low speed than at high speed. To keep stability at a reasonable level at high angles of attack (low speed), swept-wing aircraft may need to incorporate some **negative dihedral (anhedral)**.

**Wing/Fuselage Interference — Shielding Effect**: In a sideslip, the root section of the trailing wing lies in the aerodynamic "shadow" of the fuselage, reducing local dynamic pressure and lift there. This tends to increase the overall dihedral effect, and on some aircraft can be considerable.

**Wing/Fuselage Interference — Vertical Location**:
- **High wing**: lies in a region of upwash on the upstream (leading, low) side of the fuselage, increasing that wing's effective angle of attack, and in downwash on the downstream (trailing, high) side, decreasing its angle of attack. The resulting lift difference produces a restoring moment — equivalent to about **1–3° of dihedral**.
- **Low wing**: the leading wing sits in downwash (reducing its angle of attack) and the trailing wing sits in upwash (increasing its angle of attack) — the reverse of the high-wing case. This produces an unstable moment equivalent to about **1–3° of anhedral**.
- A **mid-mounted wing** has essentially zero effect on lateral stability from this source; the effect also lessens where the wing/fuselage junction has significant separation.

**Fuselage/Fin Contribution**: In sideslip there is a drag component opposing the sideslip velocity. If the aircraft's drag line is **above** the CG, the resulting moment tends to raise the low wing — a stabilising (positive) contribution. If the drag line is **below** the CG, the contribution is destabilising. Configurations contributing a high drag line include a high wing, a high fin and rudder, and a T-tail configuration (which also makes the fin more effective while adding its own drag).

### Design Problems

Positive lateral static stability is desirable, but excessive lateral stability can create dynamic handling problems (notably Dutch roll — see Dynamic Stability).
        $cnt16$,
        16
    ) RETURNING id INTO s16_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 08.17: Dynamic Stability
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m08_id, 'M08.17', 'Dynamic Stability',
        $cnt17$
# Dynamic Stability

## General

When an aircraft is disturbed from equilibrium, the resulting motion and the changing aerodynamic forces and moments acting on it can be complex — especially for a yaw disturbance, which affects both the yawing and rolling planes simultaneously.

Factors affecting the aircraft's long-term (dynamic) response include:
- Linear velocity and mass (momentum)
- The static stabilities in roll, pitch, and yaw
- Angular velocities about the three axes — together with moments of inertia, these determine angular momentum
- Moments of inertia about the three axes
- Aerodynamic damping moments due to roll, pitch, and yaw

If a body is disturbed from equilibrium and the disturbing force is removed, and the subsequent forces/moments initially act to decrease the displacement, the body has **positive static stability**. It may, however, overshoot the equilibrium position and oscillate about it — the character of that oscillation is what dynamic stability describes.

### Forms of Dynamic Motion

Given positive static stability, the subsequent (dynamic) motion may take several forms:
- **Amplitude increases** — negative dynamic stability
- **Amplitude constant** — neutral dynamic stability
- **Amplitude damped** (decreasing) — positive dynamic stability
- **Heavily damped** — oscillations cease and the motion becomes "dead-beat" — positive dynamic stability
- **Motion diverges** — negative dynamic stability

## The Bowl-and-Ball Analogy Extended

Returning to the bowl-and-ball analogy: when the disturbance is removed, the ball returns towards the bottom of the bowl (static stability), but it typically overshoots and oscillates about the equilibrium position before settling — this oscillation is the analogy for dynamic stability. If the oscillations are constant in amplitude and period, the motion is **simple harmonic motion**. The **amplitude** shows the extent of the motion; the **periodic time** is the time for one complete oscillation.

### Periodic Time

The time for one complete oscillation depends on the degree of static stability: the stronger the static stability, the shorter the periodic time.

### Damping

In the idealised bowl-and-ball analogy with no damping, oscillations continue indefinitely at constant amplitude. In practice there is always some damping (e.g. the viscosity of air, proportional to the speed of the moving mass). Damping can be expressed as the time (or number of cycles) required for the oscillation amplitude to decay to one half of its initial value (this halving concept is referred to for the **damped phugoid**). As damping increases, oscillations die away more rapidly; beyond a certain level of damping, no oscillation occurs at all — the mass returns slowly to equilibrium without overshoot, i.e. the motion is **"dead beat"** (a strong form of positive dynamic stability).

## Dynamic Stability of Aircraft

An aircraft's dynamic stability depends on its specific design and on the speed and height at which it is flying. For conventional aircraft, coupling between longitudinal (pitching) motion and lateral (rolling/yawing) motion is normally assumed negligible, allowing longitudinal and lateral dynamic stability to be analysed separately.

### Design Specification

Oscillatory motions with a **long** periodic time are not usually a serious concern — even poorly damped, the pilot can control the aircraft fairly easily. However, oscillatory motions with a periodic time close to the pilot's own response time **must be heavily damped**, because the pilot can get out of phase with the motion and trigger **pilot-induced oscillations (PIOs)**. The typical minimum damping specification requires oscillations to decay to half their original amplitude within one complete cycle. Some modern aircraft do not naturally meet this requirement, making **autostabilisation systems** (e.g. pitch dampers, yaw dampers) necessary to improve basic stability.

## Longitudinal Dynamic Stability

When an aircraft is disturbed in pitch from trimmed level flight, it typically oscillates about the original trim state, with variations in speed, height, and load factor. With positive dynamic stability these oscillations die away and the aircraft returns to its original trimmed condition. The pitching motion consists of two distinct oscillations with very different characteristics: the **phugoid** and the **short-period oscillation**.

### Phugoid

The phugoid is usually a **long-period, poorly damped** motion involving large variations in speed and height but **negligible change in load factor (n)**. It can be regarded as a constant-energy motion in which potential energy and kinetic energy are continuously exchanged. Phugoid damping depends on the aircraft's drag characteristics — the modern trend towards low-drag design has made phugoid oscillation more of a problem, since less drag means less natural damping of this energy exchange.

### Short-Period Oscillation

The short-period oscillation is usually **heavily damped** and involves large changes in load factor with only small changes in speed and height. It can be regarded as essentially a pure pitching oscillation with one degree of freedom. As with static stability generally, the periodic time of the short-period oscillation depends on the strength of the static longitudinal stability.

### Stability Factors

Longitudinal dynamic stability — the manner in which the aircraft returns to equilibrium — depends on:
- Static longitudinal stability
- Aerodynamic pitch damping
- Moments of inertia in pitch
- Angle of pitch
- Rate of pitch

## Lateral Dynamic Stability

When an aircraft in trimmed level flight is disturbed laterally, the resulting motion consists of three components:

- **Rolling motion** — initially the roll only changes bank angle and is rapidly damped (damping in roll, described under static stability).
- **Spiral motion** — a combination of bank and yaw that produces a gradually tightening spiral if the aircraft is spirally unstable. This mode is not usually serious: even when divergent, the rate of divergence is slow enough for the pilot to control easily.
- **Dutch roll** — an oscillation involving roll, yaw, and sideslip together. Its periodic time is usually fairly short, and the motion may be weakly damped or even undamped, making lateral dynamic stability historically more troublesome than longitudinal dynamic stability.

### Spiral Stability

Lateral stability depends on forces that tend to right the aircraft when a wing drops. At the same time, the keel surface (including the fin) tends to yaw the aircraft into the airflow in the direction of the lower wing. Once yaw begins, the higher (outer) wing — travelling slightly faster — produces more lift, setting up a rolling moment that opposes (and may exceed) the correcting moment from dihedral, since roll due to yaw tends to increase bank angle further.

If this rolling moment is strong enough to overcome the restoring effect of dihedral and yaw damping, bank angle increases progressively and the aircraft enters a diving turn of steadily increasing steepness — **spiral instability**. Reducing fin area (reducing directional stability and the tendency to yaw into the sideslip) results in less lift gain from the raised wing and therefore **greater spiral stability**. Spiral instability itself is not usually considered very important, but it can interact dangerously with directional effects: some high-performance aircraft, when yawed by prolonged rudder input or asymmetric power, develop a rapid rolling motion in the direction of yaw and can quickly enter a steep spiral dive.

### Dutch Roll

Oscillatory (Dutch roll) instability is more serious than spiral instability and is commonly found, to varying degrees, in combinations of high wing loading, sweepback (particularly at low IAS), and high altitude. It is characterised by a combined rolling-and-yawing "wallowing" motion.

A simplified explanation for a swept-wing aircraft: if the aircraft yaws to starboard, the port wing (now presenting a larger effective span to the airflow) generates more lift, and the aircraft rolls in the direction of yaw. However, the advancing port wing also generates more drag (from the larger exposed area), and this higher drag yaws the aircraft back to port — which then gives the starboard wing more lift and reverses the roll. The result is an undulating, coupled motion in yaw and roll: **Dutch roll**. Because it is driven by an excessive restoring force, one way to temper Dutch roll is to reduce lateral stability by fitting a slight **anhedral** angle.

### Balance Between Weathercock and Dihedral Effects

Lateral dynamic stability is largely governed by the relative strength of two effects:
- **Rolling moment due to sideslip** (dihedral effect)
- **Yawing moment due to sideslip** (weathercock/directional stability)

Too much weathercock stability tends towards **spiral instability**; too much dihedral effect tends towards **Dutch roll instability**. Aircraft design must balance these two effects.
        $cnt17$,
        17
    ) RETURNING id INTO s17_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions: M08.14 Performance
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s14_id, 'The manoeuvre envelope (V-n diagram) plots:',
     '[{"id":"a","text":"Altitude against airspeed","correct":false},{"id":"b","text":"Load factor against EAS or Mach number","correct":true},{"id":"c","text":"Angle of attack against drag coefficient","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s14_id, 'The most fundamental limit on the basic manoeuvre envelope is:',
     '[{"id":"a","text":"The increase in stalling speed as load factor increases","correct":true},{"id":"b","text":"The maximum fuel flow of the engines","correct":false},{"id":"c","text":"The maximum operating altitude","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s14_id, 'Training and fighter aircraft are typically designed to withstand a positive g limit of about:',
     '[{"id":"a","text":"+2g","correct":false},{"id":"b","text":"+5g","correct":true},{"id":"c","text":"+9g","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s14_id, 'Transport category aircraft are typically designed to a positive g limit of about:',
     '[{"id":"a","text":"+2g","correct":true},{"id":"b","text":"+5g","correct":false},{"id":"c","text":"+7g","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s14_id, 'Negative g limits, compared to positive g limits, are generally:',
     '[{"id":"a","text":"Equal in magnitude","correct":false},{"id":"b","text":"Much lower in magnitude","correct":true},{"id":"c","text":"Much higher in magnitude","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s14_id, 'The typical safety margin above the design g limit, beyond which permanent deformation or failure may occur, is approximately:',
     '[{"id":"a","text":"10%","correct":false},{"id":"b","text":"50%","correct":true},{"id":"c","text":"200%","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s14_id, 'If aircraft weight increases, in order to retain the same structural safety margin, the g limits must be:',
     '[{"id":"a","text":"Increased","correct":false},{"id":"b","text":"Reduced","correct":true},{"id":"c","text":"Left unchanged","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s14_id, 'The EAS limitation on the manoeuvre envelope represents:',
     '[{"id":"a","text":"The maximum permissible diving speed, with a small safety factor","correct":true},{"id":"b","text":"The stalling speed at 1g","correct":false},{"id":"c","text":"The minimum controllable airspeed","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s14_id, 'Increasing angle of attack causes the critical Mach number (M CRIT) to be reached at a:',
     '[{"id":"a","text":"Progressively lower free-stream Mach number","correct":true},{"id":"b","text":"Progressively higher free-stream Mach number","correct":false},{"id":"c","text":"Fixed free-stream Mach number, independent of angle of attack","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s14_id, 'An increase in Reynolds number due to increasing speed primarily affects C L MAX by:',
     '[{"id":"a","text":"Delaying separation to a higher angle of attack, increasing C L MAX","correct":true},{"id":"b","text":"Causing immediate wing stall at any angle of attack","correct":false},{"id":"c","text":"Having no measurable effect on C L MAX","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s14_id, 'As speed increases, a strengthening adverse pressure gradient on the upper surface at high angle of attack causes the boundary layer to:',
     '[{"id":"a","text":"Thin and accelerate, increasing C L MAX","correct":false},{"id":"b","text":"Slow down and thicken, moving separation forward and reducing C L MAX","correct":true},{"id":"c","text":"Remain unaffected","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s14_id, 'Which of the following can reduce the usable C L MAX below the theoretical value?',
     '[{"id":"a","text":"Buffet on the tailplane from the turbulent wing wake","correct":true},{"id":"b","text":"An increase in fuel quantity","correct":false},{"id":"c","text":"A decrease in outside air temperature","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s14_id, 'Because C L MAX declines with altitude for a given EAS, the lift boundary curve on the manoeuvre envelope must be:',
     '[{"id":"a","text":"Drawn once and applied at all altitudes","correct":false},{"id":"b","text":"Redrawn for each altitude","correct":true},{"id":"c","text":"Ignored above 10,000 ft","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s14_id, 'On the manoeuvre envelope, the Mach limit line appears curved because:',
     '[{"id":"a","text":"At high angles of attack the airflow accelerates more, so wave development occurs at a lower Mach number","correct":true},{"id":"b","text":"Mach number has no relationship to angle of attack","correct":false},{"id":"c","text":"EAS is constant at all altitudes","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s14_id, 'A rolling g limit is imposed at a lower value than the ordinary g limit because:',
     '[{"id":"a","text":"The wing structure must also withstand twisting forces from aileron deflection","correct":true},{"id":"b","text":"Rolling manoeuvres never occur at high speed","correct":false},{"id":"c","text":"It only applies to aircraft without ailerons","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s14_id, 'During a manoeuvre, an aircraft is not in equilibrium because an out-of-balance force is needed to continuously deflect it from a straight line. This force is called:',
     '[{"id":"a","text":"Centripetal force","correct":true},{"id":"b","text":"Centrifugal force","correct":false},{"id":"c","text":"Induced force","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s14_id, 'Buffet corners on the manoeuvre envelope are of particular concern for the tailplane because:',
     '[{"id":"a","text":"High air loads combined with high loadings, aggravated by turbulent wake buffet, can lead to fatigue failure","correct":true},{"id":"b","text":"The tailplane is not subject to aerodynamic loads","correct":false},{"id":"c","text":"They only occur at zero airspeed","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s14_id, 'From the complete manoeuvre envelope, which of the following can be read directly as a Flight Manual limitation?',
     '[{"id":"a","text":"Maximum permitted load factor and maximum EAS","correct":true},{"id":"b","text":"Exact fuel burn per hour","correct":false},{"id":"c","text":"Cabin pressurisation differential","correct":false}]',
     '{"B1.1","B1.3","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions: M08.15 Lift Augmentation
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s15_id, 'The two broad categories of lift augmentation device described are:',
     '[{"id":"a","text":"Leading edge devices and trailing edge devices","correct":true},{"id":"b","text":"Spoilers and speed brakes","correct":false},{"id":"c","text":"Winglets and vortex generators","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s15_id, 'The primary aerodynamic purpose of a leading edge device is to:',
     '[{"id":"a","text":"Increase the velocity of airflow over the top surface, delaying transition to turbulence","correct":true},{"id":"b","text":"Reduce the wing area","correct":false},{"id":"c","text":"Increase the stalling speed","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s15_id, 'A slat increases the lift coefficient of the affected part of the wing by as much as:',
     '[{"id":"a","text":"10%","correct":false},{"id":"b","text":"60%","correct":true},{"id":"c","text":"200%","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s15_id, 'Fitting a slat can increase the wing stalling angle from about 15° to approximately:',
     '[{"id":"a","text":"18°","correct":false},{"id":"b","text":"22°","correct":true},{"id":"c","text":"30°","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s15_id, 'At conventional (cruise) angles of attack, a slat:',
     '[{"id":"a","text":"Retracts and forms part of the wing leading edge","correct":true},{"id":"b","text":"Remains fully deployed at all times","correct":false},{"id":"c","text":"Is jettisoned","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s15_id, 'Compared to slats, a droop leading edge is particularly suited to:',
     '[{"id":"a","text":"Thin, high-speed aerofoils, without compromising high-speed performance","correct":true},{"id":"b","text":"Only very low-speed light aircraft","correct":false},{"id":"c","text":"Vertical stabilisers only","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s15_id, 'For any leading edge device to produce its intended increase in lift, the aerofoil must be operated:',
     '[{"id":"a","text":"At an angle of attack approaching its clean stalling angle","correct":true},{"id":"b","text":"At zero angle of attack","correct":false},{"id":"c","text":"Only above the critical Mach number","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s15_id, 'Trailing edge devices (flaps) increase lift coefficient primarily by:',
     '[{"id":"a","text":"Increasing camber of the upper surface and increasing effective angle of attack","correct":true},{"id":"b","text":"Reducing wing area","correct":false},{"id":"c","text":"Reducing the aspect ratio permanently","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s15_id, 'A large flap deflection typically produces an increase in drag coefficient which, given sufficient power, can be used to achieve:',
     '[{"id":"a","text":"A high climb angle and rate, and a shortened landing run","correct":true},{"id":"b","text":"A reduced stalling speed only, with no other effect","correct":false},{"id":"c","text":"An increase in cruise speed","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s15_id, 'In a plain flap, the hinged rear portion of the wing normally moves:',
     '[{"id":"a","text":"Both upward and downward symmetrically","correct":false},{"id":"b","text":"Downward only","correct":true},{"id":"c","text":"Only forward, telescoping into the wing","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s15_id, 'The main advantage of a split flap, despite its structural drawbacks, is that:',
     '[{"id":"a","text":"There is very little movement of the centre of pressure when it is used","correct":true},{"id":"b","text":"It increases wing area more than any other flap type","correct":false},{"id":"c","text":"It requires no hinge mechanism","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s15_id, 'Extension flaps differ from plain and split flaps mainly because they:',
     '[{"id":"a","text":"Also directly increase wing area as they extend","correct":true},{"id":"b","text":"Cannot be used for landing","correct":false},{"id":"c","text":"Produce no change in camber","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s15_id, 'A known drawback of extension flaps is that they tend to move the centre of pressure:',
     '[{"id":"a","text":"Forward, giving a nose-up pitching tendency","correct":false},{"id":"b","text":"Rearward, giving a nose-down pitching tendency that requires a pitch trim input","correct":true},{"id":"c","text":"Directly over the CG, eliminating pitch trim changes","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s15_id, 'A combination of slotted extension flaps and leading edge slats can increase the lift coefficient of the affected wing section by as much as:',
     '[{"id":"a","text":"60%","correct":false},{"id":"b","text":"90%","correct":false},{"id":"c","text":"120%","correct":true}]',
     '{"B1.1","B1.3","B2"}'),

    (s15_id, 'With a combined flap/slat system, when the flaps are fully extended the centre of pressure tends to move:',
     '[{"id":"a","text":"Further forward, reducing adverse pitching moments","correct":true},{"id":"b","text":"Sharply rearward with no compensating effect","correct":false},{"id":"c","text":"Outboard along the wing span","correct":false}]',
     '{"B1.1","B1.3","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions: M08.16 Static Stability
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s16_id, 'Static stability describes:',
     '[{"id":"a","text":"The immediate reaction of a body after a disturbance","correct":true},{"id":"b","text":"The subsequent, longer-term reaction of a body after a disturbance","correct":false},{"id":"c","text":"Only the behaviour of a body while the disturbing force is still applied","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s16_id, 'In the bowl-and-ball analogy, a ball that rolls back to its original position after being displaced demonstrates:',
     '[{"id":"a","text":"Negative stability","correct":false},{"id":"b","text":"Positive stability","correct":true},{"id":"c","text":"Neutral stability","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s16_id, 'Yaw (rotation about the normal axis) is associated with which type of stability?',
     '[{"id":"a","text":"Lateral","correct":false},{"id":"b","text":"Longitudinal","correct":false},{"id":"c","text":"Directional","correct":true}]',
     '{"B1.1","B1.3","B2"}'),

    (s16_id, 'Roll (rotation about the longitudinal axis) is associated with which type of stability?',
     '[{"id":"a","text":"Lateral","correct":true},{"id":"b","text":"Longitudinal","correct":false},{"id":"c","text":"Directional","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s16_id, 'Pitch (rotation about the lateral axis) is associated with which type of stability?',
     '[{"id":"a","text":"Directional","correct":false},{"id":"b","text":"Longitudinal","correct":true},{"id":"c","text":"Lateral","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s16_id, 'After a yaw disturbance, directional stability returns the aircraft to its original heading because:',
     '[{"id":"a","text":"The fin meets the airflow at an angle and produces a restoring turning moment","correct":true},{"id":"b","text":"The wings automatically develop more lift on one side","correct":false},{"id":"c","text":"Engine thrust automatically realigns with the flight path","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s16_id, 'A forward CG position, relative to a rearward one, will:',
     '[{"id":"a","text":"Lengthen the fin moment arm and increase directional stability","correct":true},{"id":"b","text":"Shorten the fin moment arm and reduce directional stability","correct":false},{"id":"c","text":"Have no effect on directional stability","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s16_id, 'If an aircraft pitches nose-up from trim, positive longitudinal stability is provided when the tailplane develops:',
     '[{"id":"a","text":"A positive angle of attack, producing a nose-down restoring moment","correct":true},{"id":"b","text":"A negative angle of attack, producing a further nose-up moment","correct":false},{"id":"c","text":"Zero lift, producing no moment at all","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s16_id, 'The product of tailplane area and moment arm is known as:',
     '[{"id":"a","text":"The static margin","correct":false},{"id":"b","text":"The tail volume","correct":true},{"id":"c","text":"The neutral point","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s16_id, 'A rearward shift of the CG, within normal limits, will:',
     '[{"id":"a","text":"Increase positive longitudinal stability","correct":false},{"id":"b","text":"Decrease positive longitudinal stability","correct":true},{"id":"c","text":"Have no effect on longitudinal stability","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s16_id, 'The neutral point is the CG position at which:',
     '[{"id":"a","text":"The wing moment and tail moment are equal, giving zero restoring moment","correct":true},{"id":"b","text":"The aircraft achieves maximum positive stability","correct":false},{"id":"c","text":"The elevator has no aerodynamic effect whatsoever","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s16_id, 'The static (CG) margin is defined as:',
     '[{"id":"a","text":"The distance the CG can move aft from the quoted datum before reaching the neutral point","correct":true},{"id":"b","text":"The distance between the wingtip and the fuselage centreline","correct":false},{"id":"c","text":"The vertical distance between the CG and the thrust line","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s16_id, 'The aerodynamic centre (AC) of an aerofoil is defined as the point about which:',
     '[{"id":"a","text":"The pitching moment is independent of angle of attack","correct":true},{"id":"b","text":"Lift is always zero","correct":false},{"id":"c","text":"Drag is at a maximum","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s16_id, 'Allowing the elevator to trail freely (stick free) compared to stick fixed will typically:',
     '[{"id":"a","text":"Increase longitudinal stability","correct":false},{"id":"b","text":"Reduce longitudinal stability, moving the neutral point forward","correct":true},{"id":"c","text":"Have no effect on the neutral point","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s16_id, 'The "damping in roll" effect, acting alone with no sideslip, gives an aircraft disturbed in roll:',
     '[{"id":"a","text":"Positive static stability in bank angle, always returning to wings level","correct":false},{"id":"b","text":"Neutral static stability with respect to angle of bank","correct":true},{"id":"c","text":"Negative static stability, diverging further in bank","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s16_id, 'Dihedral produces a stable rolling moment in sideslip because the wing with the higher-positioned tip:',
     '[{"id":"a","text":"Experiences an effective decrease in angle of attack and loses lift","correct":false},{"id":"b","text":"Experiences an effective increase in angle of attack and gains lift","correct":true},{"id":"c","text":"Is entirely shielded from the airflow","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s16_id, 'Approximately how much sweepback produces a stabilising effect roughly equivalent to 1° of dihedral?',
     '[{"id":"a","text":"1°","correct":false},{"id":"b","text":"10°","correct":true},{"id":"c","text":"45°","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s16_id, 'The contribution of sweepback to lateral stability is most significant:',
     '[{"id":"a","text":"At high forward speed and low C L","correct":false},{"id":"b","text":"At low forward speed and high C L","correct":true},{"id":"c","text":"Only at supersonic Mach numbers","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s16_id, 'A high-mounted wing contributes to lateral stability an effect roughly equivalent to:',
     '[{"id":"a","text":"1-3° of dihedral","correct":true},{"id":"b","text":"1-3° of anhedral","correct":false},{"id":"c","text":"No measurable effect at all","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s16_id, 'A low-mounted wing contributes to lateral stability an effect roughly equivalent to:',
     '[{"id":"a","text":"1-3° of additional dihedral","correct":false},{"id":"b","text":"1-3° of anhedral (destabilising)","correct":true},{"id":"c","text":"Zero effect, identical to a high wing","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s16_id, 'A T-tail configuration with a high fin tends to contribute to lateral stability because:',
     '[{"id":"a","text":"Its drag line lies above the CG, producing a restoring moment that raises the low wing","correct":true},{"id":"b","text":"Its drag line lies below the CG, producing a destabilising moment","correct":false},{"id":"c","text":"It eliminates sideslip entirely","correct":false}]',
     '{"B1.1","B1.3","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions: M08.17 Dynamic Stability
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s17_id, 'Dynamic stability describes:',
     '[{"id":"a","text":"The immediate reaction of a body after disturbance","correct":false},{"id":"b","text":"The subsequent reaction of a body after disturbance","correct":true},{"id":"c","text":"Only steady, undisturbed straight and level flight","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s17_id, 'If an aircraft with positive static stability overshoots equilibrium and the oscillation amplitude progressively decreases, this represents:',
     '[{"id":"a","text":"Negative dynamic stability","correct":false},{"id":"b","text":"Neutral dynamic stability","correct":false},{"id":"c","text":"Positive dynamic stability","correct":true}]',
     '{"B1.1","B1.3","B2"}'),

    (s17_id, 'A motion in which oscillations cease entirely and the body returns to equilibrium without overshoot is described as:',
     '[{"id":"a","text":"Dead-beat","correct":true},{"id":"b","text":"Divergent","correct":false},{"id":"c","text":"Neutrally stable","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s17_id, 'If the amplitude of an oscillation increases with each cycle following a disturbance, the body exhibits:',
     '[{"id":"a","text":"Negative dynamic stability","correct":true},{"id":"b","text":"Positive dynamic stability","correct":false},{"id":"c","text":"Static instability only, with no dynamic component","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s17_id, 'The periodic time of an oscillatory motion is:',
     '[{"id":"a","text":"The time for one complete oscillation","correct":true},{"id":"b","text":"The time for the amplitude to reach zero","correct":false},{"id":"c","text":"The total flight time of the disturbance","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s17_id, 'Stronger static stability results in a periodic time that is:',
     '[{"id":"a","text":"Longer","correct":false},{"id":"b","text":"Shorter","correct":true},{"id":"c","text":"Unaffected","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s17_id, 'Oscillatory motions with a periodic time close to the pilot''s own response time are of particular concern because they can lead to:',
     '[{"id":"a","text":"Pilot-induced oscillations (PIOs)","correct":true},{"id":"b","text":"A permanent increase in static stability","correct":false},{"id":"c","text":"Complete loss of static stability with no oscillation","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s17_id, 'The typical minimum damping specification for handling qualities requires oscillation amplitude to halve within:',
     '[{"id":"a","text":"One complete cycle of the motion","correct":true},{"id":"b","text":"Ten complete cycles of the motion","correct":false},{"id":"c","text":"The aircraft''s entire flight duration","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s17_id, 'The phugoid oscillation is best characterised by:',
     '[{"id":"a","text":"Large variations in speed and height with negligible change in load factor","correct":true},{"id":"b","text":"Large changes in load factor with negligible change in speed or height","correct":false},{"id":"c","text":"Pure rolling motion with no pitch component","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s17_id, 'The phugoid can be regarded as a constant-energy motion because:',
     '[{"id":"a","text":"Potential and kinetic energy are continuously interchanged","correct":true},{"id":"b","text":"Engine thrust is held perfectly constant throughout","correct":false},{"id":"c","text":"It occurs only with the engine shut down","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s17_id, 'Modern low-drag aircraft designs have tended to make the phugoid oscillation:',
     '[{"id":"a","text":"Better damped than on older, higher-drag designs","correct":false},{"id":"b","text":"More of a problem, since damping depends on drag","correct":true},{"id":"c","text":"Completely eliminated","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s17_id, 'The short-period pitching oscillation is normally:',
     '[{"id":"a","text":"Heavily damped, with large load factor changes but small speed/height changes","correct":true},{"id":"b","text":"Poorly damped, with large speed and height changes","correct":false},{"id":"c","text":"Identical in character to the phugoid","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s17_id, 'The three components of lateral dynamic motion following a disturbance are:',
     '[{"id":"a","text":"Rolling motion, spiral motion, and Dutch roll","correct":true},{"id":"b","text":"Phugoid, short-period oscillation, and yaw damping","correct":false},{"id":"c","text":"Stall, spin, and spiral dive only","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s17_id, 'Spiral instability develops when:',
     '[{"id":"a","text":"The rolling moment from yaw overcomes the restoring moment from dihedral and yaw damping","correct":true},{"id":"b","text":"The aircraft has excessive fin area and no dihedral at all","correct":false},{"id":"c","text":"Damping in roll is at its theoretical maximum","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s17_id, 'Reducing fin area on an aircraft tends to:',
     '[{"id":"a","text":"Increase spiral stability but reduce directional stability","correct":true},{"id":"b","text":"Increase directional stability with no other effect","correct":false},{"id":"c","text":"Have no relationship to spiral stability at all","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s17_id, 'Dutch roll is an oscillatory motion that couples:',
     '[{"id":"a","text":"Roll, yaw, and sideslip","correct":true},{"id":"b","text":"Pitch and airspeed only","correct":false},{"id":"c","text":"Altitude and load factor only","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s17_id, 'One practical method of reducing the severity of Dutch roll is to:',
     '[{"id":"a","text":"Increase dihedral further","correct":false},{"id":"b","text":"Introduce a slight anhedral angle to reduce lateral stability","correct":true},{"id":"c","text":"Remove the fin entirely","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s17_id, 'Excessive weathercock (directional) stability relative to dihedral effect tends to promote:',
     '[{"id":"a","text":"Spiral instability","correct":true},{"id":"b","text":"Dutch roll instability","correct":false},{"id":"c","text":"Phugoid instability","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s17_id, 'Excessive dihedral effect relative to weathercock stability tends to promote:',
     '[{"id":"a","text":"Spiral instability","correct":false},{"id":"b","text":"Dutch roll instability","correct":true},{"id":"c","text":"Short-period instability","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s17_id, 'Some modern aircraft that do not naturally meet damping requirements rely on which system to improve dynamic stability?',
     '[{"id":"a","text":"Autostabilisation systems such as yaw dampers or pitch dampers","correct":true},{"id":"b","text":"Increased dihedral angle only","correct":false},{"id":"c","text":"A reduction in tail volume","correct":false}]',
     '{"B1.1","B1.3","B2"}');

END $$;
