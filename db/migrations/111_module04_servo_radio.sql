-- Module 04: Electronic Fundamentals — Servomechanisms (B1/B2 Common), Radio Communication (B1 Addendum)
-- Source: EASA Part-66 Module 04 B1 official textbook (Aircraft Technical Book Company); IK Module 4 B2 course notes (IKAROS, Issue Oct.2012)

DO $$
DECLARE
    m04_id INT;
    s5_id  INT;
    s6_id  INT;
BEGIN
    SELECT id INTO m04_id FROM easa_modules WHERE code = 'M04';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M04.5') THEN
        RAISE NOTICE 'M04.5/M04.6 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 04.5: Servomechanisms
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m04_id, 'M04.5', 'Servomechanisms',
        $cnt5$
# Servomechanisms

## What Is a Servomechanism?

A **servomechanism** is an electric control system for an automatic, powered mechanism that produces motion or force from a low-energy input signal. The amplified system typically drives an electric or hydraulic motor, and the resulting motion may be rotary or linear depending on the mechanical transmission used. Servomechanisms are integral to automatic flight control systems (autopilots) and are also found in auto-throttle systems and radar scanner systems.

The word "servo" derives from the Latin *servus*, meaning "slave" — the output of a servomechanism slavishly follows the demands placed on the input. Human operators cannot provide the precision needed to operate complex machines with fast, accurate control, nor can they supply large amounts of power to a load; servomechanisms supply both the precision and the power that humans cannot.

Servomechanisms share four defining properties:
- They are **error activated**.
- They provide **power amplification**.
- They contain **moving parts**.
- They are **automatic in operation**.

## Open-Loop and Closed-Loop Systems

### Open-Loop Systems

In an **open-loop system**, the controls are set to a desired setting; the signal produced by the controller is amplified to drive a motor that moves the controlled unit to the selected position. If something prevents the unit from actually reaching the desired setting, the control system has no way of knowing this — there is no **feedback** on the result of the setting. Bearing friction, wind resistance, variations in load conditions, variations in the power supply, the value of the demand voltage itself, and variations in amplifier gain can all cause the output to fail to follow the input precisely. Because of this, open-loop systems cannot provide the close tolerance required and are not used in advanced aircraft autopilot or automatic flight control systems.

### Closed-Loop Systems

A **closed-loop (feedback) system** detects errors in the output and feeds them back to the input so that corrections can be made to eliminate the error. The essential features of a closed-loop system are:
- Information about the behaviour of the load is fed back to the input — this is **feedback**, also called **follow-up**.
- The position of the output (feedback) is compared with that demanded by the input, typically in a **summing amplifier**.
- An **error signal** is produced that is proportional to the difference between the demand and feedback signals.
- The error signal is power-amplified to control the load.
- The load moves in whatever direction reduces the error signal to zero, at which point the output matches the input demand.

## Transducers

A **transducer** is a device that converts one form of energy into another — for example, electrical to mechanical, heat to electrical, or light to electrical. In servo systems, transducers are generally used to convert a mechanical input (the position of a flight control surface or other controlled unit) into an electrical signal that the controller can process.

A common example is the **Linear Variable Differential Transducer (LVDT)**: essentially a transformer with a primary coil, two secondary induction coils connected in series opposition, and a moving core attached to the controlled unit. As the unit moves, the core moves, changing the voltage induced in the two secondary coils; the differential of the two coil outputs is the feedback signal sent to the controller. Because the connection between primary and secondary coils is purely inductive, these transducers are very stable and operate accurately and reliably over long periods, with the core as the only moving part. Both linear (LVDT) and rotary (RVDT) versions are used.

## Remote Position Control (RPC) Servomechanisms

A **Remote Position Control (RPC) servo system** is a form of closed-loop system used to control the position of a remotely located device in response to a change in the demanded input. Its essential parts are:
- **Transducers** — convert the mechanical input to an electrical signal for the servo.
- **Amplifier** — raises the power of the input signal to a level suitable for driving the load, so that large mechanical work outputs are possible from very small work inputs.
- **Motor** — moves the device being controlled, usually via a gearbox, producing linear or rotary motion.

### Positional Feedback — Worked Example

In an ideal system using positional feedback, the output shaft exactly follows the input shaft. If demand and feedback potentiometers both read 5 V when input and output are aligned, the summing amplifier subtracts feedback from demand:

**Error = Demand − Feedback = 5 V − 5 V = 0**

With zero error, the motor is stationary and the system is at rest. If the input shaft is rotated clockwise, raising the demand voltage to 6 V while the output (feedback) remains at 5 V:

**Error = Demand − Feedback = 6 V − 5 V = 1 V**

The motor runs in the direction set by the polarity of the error voltage, moving the feedback potentiometer wiper until the feedback voltage again equals the demand voltage (6 V), at which point the error falls to zero, the motor stops, and the output shaft is realigned with the input shaft. If the input shaft had instead been rotated anticlockwise, dropping demand to 4 V, the error would have been −1 V, driving the motor in the opposite direction. The same principle applies to an equivalent AC circuit, except that motor direction is then determined by the phase relationship between output and a reference phase rather than by voltage polarity.

## Types of Servo Inputs

There are three types of input a servo may experience:
- **Step input** — achieved by switching off servo power, moving the input shaft, then reapplying power. The system's response to a step input reveals a great deal about its behaviour and is used as a test signal.
- **Ramp input** — created when the input shaft is suddenly rotated at a constant angular velocity (radians/second). Servo systems experience ramp inputs during normal operation.
- **Accelerating input** — created when the input shaft is rotated with constant angular acceleration (radians/second²). Systems are also subject to this type of input during normal operation.

## System Response, Hunting and Damping

How well a servomechanism responds to a change in input — in terms of transient response and overshoot — measures its overall performance. Every servomechanism takes a finite time to start moving and to settle at a new position; **settling time** is the time taken to reach a final steady state within specified limits.

Unless precautions are taken, a servomechanism will oscillate: when the output reaches the required value, the load has acquired momentum and overshoots; the error then reverses sign, a reverse torque is applied, the load is brought to rest and accelerates back the other way, again overshooting. If frictional losses are negligible this can continue indefinitely — a condition called **hunting**. To avoid hunting, some form of damping is required.

### Degrees of Damping

- **Underdamped** — overshoots and transient oscillations are observed at the output.
- **Critically damped** — the output moves to the required position at the fastest possible rate without overshoot. This is a theoretical dividing line between underdamping and overdamping.
- **Overdamped** — no overshoot is produced, but a time lag is introduced.

In practice, servo systems are deliberately designed to be slightly underdamped to reduce response delay — this is often called **ideal damping**. Under ideal damping the system reaches the required position more quickly than when critically damped, but overswings and must move back onto position, so it takes slightly longer to reach steady state than a critically damped system would in theory.

### Frictional Forces That Produce Damping

- **Stiction** (static friction) — present only when the system is at rest; this initial friction must be overcome before the system can move, and falls to zero once moving.
- **Coulomb friction** — a constant force, independent of speed, caused by rubbing friction between surfaces. The number of overshoots it produces is proportional to the size of the initial error, and it brings the system to a steady state with a **positional error** still present. For this reason coulomb friction is not deliberately used in practical systems, although it is always present to some degree and good design keeps it to a minimum.
- **Viscous friction** — proportional to velocity, and provides satisfactory damping for servo systems. When system velocity is zero, viscous friction is zero, so it does not itself cause a positional error. In response to a **ramp input**, viscous friction damps out oscillation but leaves a constant error called **velocity lag**, proportional to the amount of viscous damping applied.

Both coulomb and viscous damping have the disadvantage of being applied at the **output** of the system, requiring large amounts of energy to control high-power outputs and generating heat that demands complex cooling. It is more efficient to apply damping at the **input**, where power levels are much lower.

### Velocity Feedback Damping

A simple, widely used method of damping at the input is **Negative Velocity Feedback (NVFB)**, using a **tachogenerator (TG)** driven by the system's output shaft. Velocity feedback provides damping similar to viscous friction, but because it acts on the input, little power is required, and the amount of feedback voltage — and hence the amount of damping — can be adjusted with a simple potentiometer. In an RPC servo, velocity lag from this feedback is present only while the load is moving, so it causes only a slight increase in response time.

## Velocity Control Servomechanisms (Rate Servos)

Some applications must control the **rotational speed** of a shaft rather than its position. In a **rate servo**, the input demand signal sets the angular velocity of the output shaft; there is **no position feedback**. Movement of a speed-control potentiometer produces a voltage proportional to the demanded speed, while a tachogenerator produces a voltage proportional to the actual angular velocity of the output shaft. Any difference between the two produces an error voltage that is amplified and used to accelerate or decelerate the motor until the tachogenerator output equals the demand voltage.

- **Residual error** — because frictional and damping losses always require some torque to keep the motor and load turning at constant speed, a difference between demand and actual speed is always present; high amplifier gain keeps this difference very small.
- **Velocity lag** — a rate servo using velocity feedback is just as prone to velocity lag as an RPC servo, but because only speed (not position) is being measured, the lag may be ignored.

## AC Servomechanism Components

### E & I Bar Transducer

Named for the shape of its parts, the **E & I bar transducer** has a winding on the centre limb of the "E" carrying an AC excitation supply, with secondary coils on the outer limbs connected in series opposition. With the "I" bar centred, equal flux flows in both outer limbs, the two secondary voltages are equal and opposite, and they cancel — giving no output. When the I bar is displaced, more flux flows through the limb with the smaller air gap and less through the limb with the larger gap, so the induced voltages no longer cancel and an output voltage appears. The **phase** of the output indicates the direction the I bar moved; the **magnitude** indicates how far it moved. In a servo system the follow-up action keeps this movement small. The E & I bar can sense both linear and rotary movement.

### AC Tachogenerators

Tachogenerators provide velocity feedback for AC servo systems, typically using the **drag cup** principle, and always produce a voltage at the same frequency as the supply. With the drag cup stationary, the secondary winding (placed at right angles to the primary) has no voltage induced and the output is zero. As the output shaft rotates the cup, rotating eddy currents are induced in it, which in turn induce a voltage across the output winding. The **amplitude** of this voltage is proportional to the speed of rotation; the **phase** depends on the direction of rotation. In practice, a small residual voltage is present even when the cup is stationary.

## Practical Servo Systems

### Direct (DC) Servo Current System

Two potentiometer wipers produce potentials proportional to the input and output shaft positions; any difference between them is the error signal fed to the amplifier, with polarity indicating the direction of the error. The amplified signal produces flux in a split-field motor; because the armature carries current continuously, the presence of this field produces a torque that drives the load toward alignment. When alignment is reached, the error signal falls to zero, the field disappears, and the motor stops.

### Alternating Current Servo System

The input shaft sets the position of the control transmitter (CX) rotor and hence the stator field of the control transformer (CT); the output shaft sets the position of the CT rotor. When the CT rotor sits 90° to the CX rotor, no EMF is induced in the CT rotor and the system is nulled (stationary). Any misalignment induces an EMF in the CT rotor — this is the error signal — which is amplified and drives the motor in the direction set by the phase of the rotor EMF, until alignment (and null) is restored.

## Other Transducers

- **Linear Variable Differential Transformer (LVDT)** — a moveable iron core inside three windings on a former: a centre **excitation winding** fed with an AC reference voltage, and two outer windings connected in series opposition to provide the output. With the core centred, the EMFs induced in the two output windings are equal but 180° out of phase, so they cancel, giving no output. Moving the core increases the EMF in one winding and decreases it in the other; the resulting output voltage's phase reverses if the core is displaced the same amount in the opposite direction.
- **Rotary Variable Differential Transformer (RVDT)** — works on the same principle as the LVDT but produces an electrical signal proportional to rotational rather than linear movement. (Excitation may instead be applied to the two outer windings, each inducing an opposite-polarity EMF in the centre winding; the phase of the resulting output depends on which reference coil induces the larger EMF, which in turn depends on core position.)
- **Inductive type transducers** — use inductance in one of two ways:
  - **Induced EMF type**: a coil and permanent magnet requiring a steel target. A stationary target near the coil changes flux density but induces no EMF (no relative movement); only when the target moves back and forth does the changing flux induce an EMF, whose frequency depends on the speed of movement. This form is used to measure rotational speed, such as of engine shafts.
  - **AC current control type**: AC flowing in an inductor produces a changing back-EMF (inductive reactance) that opposes current flow. Placing a piece of steel near the coil increases its inductance and hence its inductive reactance, reducing AC current flow — a change that can be detected and used to signal proximity. This form is used in proximity-sensing systems, such as sensing undercarriage position.

## Synchronous Data Transmission

Synchronous data transmission systems indicate the position of a component or control surface that cannot be directly observed. They fall into two categories: DC systems called **Desynn systems**, and AC systems generally grouped as **synchro systems**. Both comprise a transmitting element and a receiving element (usually an indicator) linked by wiring; "synchronous" means "happening at the same time" — when the transmitter moves, the receiver follows instantly.

### Desynn Systems

- **Basic Desynn** — the transmitter comprises an endless resistance wound on a circular former (a "toroidal resistance"), with three tappings spaced 120° apart. Two wiper-arm contacts, 180° apart and insulated from each other, carry system power. The indicator has a two-pole permanent-magnet rotor pivoted inside a soft-iron stator carrying three star-connected windings wired to the three tappings. Because resistance varies linearly around the resistor, applying DC power produces different potentials at the three tappings depending on wiper position; the resulting currents create magnetic fields in the indicator's stator windings whose resultant field the permanent-magnet rotor (and pointer) aligns with, always mirroring the transmitter wiper position. A small permanent magnet is fitted in the indicator as a **fail-safe device**: under normal power its field is too weak to matter, but if power is lost it pulls the rotor and pointer off-scale, flagging the fault rather than leaving the pointer showing a stale (and misleading) reading.
- **Slab Desynn** — the basic Desynn's tapping voltages trace a sawtooth waveform (not a sinewave) as the wiper rotates through 360°, causing the indicator to not follow the transmitter exactly; usually insignificant, but not always acceptable. The slab Desynn corrects this: the resistor is wound on a slab former with power applied directly to it, while three wiper arms (120° apart) provide the output — a sinewave — to the same type of indicator, operating in the same way as the basic Desynn.

### DC Selsyn Systems

Widely used on DC aircraft electrical systems, the DC selsyn system consists of a transmitter, an indicator, and connecting wires. The transmitter has a circular resistance winding and a rotatable contact arm whose two ends (brushes) always touch the winding on opposite sides; the shaft is mechanically linked to the unit being monitored (e.g. flaps, landing gear). The resistance winding is tapped at three points, usually 120° apart, feeding the toroidal windings of the indicator motor. As the transmitter shaft turns, the resistance between the supply arm and each tapoff changes, varying the current sent to each of the indicator's three windings; the resulting magnetic field direction in the indicator tracks the transmitter arm position, and a permanent magnet with an attached pointer aligns with that field to show the transmitted position. On landing gear applications, lock switches that close when up-locks or down-locks engage add a resistor into one transmitter winding section, shifting the indicator's field to also show the locked condition.

### AC Synchro Systems

Aircraft with AC electrical power commonly use **autosyn** or **magnesyn** synchro remote-indicating systems, which operate similarly to the DC selsyn but use electric induction rather than resistance/brush current flow:

- **Magnesyn systems** use permanent-magnet rotors (as in DC selsyn); the indicator magnet and pointer align with the field set up by the stator coils, adopting the same deflection angle as the transmitter rotor.
- **Autosyn systems** use electromagnet rotors rather than permanent magnets in both transmitter and indicator; the electromagnet still aligns with the field created by stator current flow, so the indicator pointer position mirrors the transmitter rotor position.

A **resolver** is a type of synchro whose stator windings are spaced at 90° to each other (rather than 120°), producing Sine and Cosine stator outputs that represent the angular displacement of the sensed rotor; resolver signals are typically fed to analogue-to-digital converters.

### Synchro Types (IK B2 Classification)

- **Torque Transmitter (TX)** — rotor is mechanically positioned; transmits electrical information corresponding to rotor angle.
- **Torque Receiver (TR)** — rotor is free to turn; develops torque proportional to the difference between its own position and the received angular information.
- **Control Transmitter (CX)** — mechanically positioned rotor; transmits angular information, normally to a differential transmitter or control transformer.
- **Control Transformer (CT)** — supplied with electrical angular information; outputs a voltage proportional to the sine of the difference between the input angle and its own rotor position.
- **Torque Differential Transmitter (TDX)** — mechanically positioned rotor; modifies received angular information and transmits the sum of, or difference from, its own rotor angle.
- **Control Differential Transmitter (CDX)** — the control equivalent of the TDX.
- **Torque Differential Receiver (TDR)** — free rotor; develops torque based on the difference between its own position and the sum of, or difference between, two received sets of angular information.
- **Resolver** — has two mutually perpendicular windings on both rotor and stator (four windings total); resolves an input signal into sine and cosine components, performs vector addition/subtraction, and converts between polar and cartesian coordinates.

### Synchro Schematics and the XYZ System

Synchros are represented by a common schematic symbol, usually showing the rotor at the zero-degree position; by convention, the vertical stator winding is labelled **S2**, the lower right **S1**, and the lower left **S3**. In aircraft wiring diagrams, stator ends are often labelled **X, Y, Z** and rotor ends **H, C**: S1↔X, S2↔Z, S3↔Y, R1↔H, R2↔C. Where earthing is required, the S2/Z stator wire and the C end of the rotor winding are earthed.

### Synchro Supplies

Aircraft synchros are powered from either **115 V 400 Hz** or **26 V 400 Hz** AC supplies; radio systems commonly use 26 V 400 Hz.

### Torque Synchro System

A torque synchro system links a Torque Transmitter (TX) and Torque Receiver (TR); in practice R2 and S2 are connected to earth, the transmitter rotor is mechanically driven by the source of positional data, a pointer is attached to the receiver rotor, and AC power feeds both rotors in parallel. With supply current flowing, voltages are induced in both stators by transformer action; with both rotors at the same angle, the induced voltages are equal and opposite, no current flows, and the system is **balanced (nulled)** — for the reference position shown in the source, S1 and S3 each carry half maximum voltage, S2 carries maximum voltage. Rotating the transmitter rotor unbalances the stator voltages, producing current flow, magnetic fields, and a torque reaction at both TX and TR; since the TX rotor is mechanically held, only the free TR rotor responds, turning until balance (and zero current) is restored. Because sufficient current must flow to produce torque even for small position changes, winding impedance must be low — this is of no concern in normal operation, but a jammed receiver pointer can create a large, sustained potential difference and high currents that burn out one or both synchros.

**Synchro system faults** commonly examined include:
- Loss of supply to the **TR rotor** → low-torque operation with possible 180° error.
- Loss of supply to the **TX rotor** → no operation of the synchro.
- **Open circuit** on one stator line → receiver oscillates between two points approximately 75° apart.
- **Short circuit** between two stator lines → receiver displaced by 0°, 60°, 120°, 180°, 240° or 300°, moving in 180° steps.
- **S1 & S2 reversed** → receiver indicates 120° error and rotates opposite to the transmitter.
- **S2 & S3 reversed** → receiver indicates 240° error and rotates opposite to the transmitter.
- **S1 & S3 reversed** → receiver indicates correctly but rotates opposite to the transmitter.
- **R1 & R2 reversed** → receiver indicates 180° error but rotates in the same direction as the transmitter.

### Electrical Zero

**Electrical zero** provides a common reference so that all synchro units can be aligned to the same position before installation. It is defined as the rotor position, relative to the stator, at which the voltage between S1 and S3 is zero and the voltage at S2 (relative to S1 or S3) is in phase with that of R1 relative to R2 — i.e. the rotor is parallel to S2 with R1 at the top. With voltmeters connected appropriately, V1 reads zero and V2 reads a value less than the supply voltage; if R2 were at the top instead, V1 would still read zero, but V1–S2 would be in antiphase and V2 would read a value greater than the supply voltage.

### Differential Torque Synchro System

A **differential synchro** (rotor with three equally spaced windings) sits between a transmitter and receiver, with no direct connection to the supply, and can be wired to output either the **difference** or the **sum** of two mechanical inputs. If the transmitter alone is rotated, current flows and torque turns the free receiver rotor until balance is restored; rotating the differential (TDX) instead has the same effect but, as wired in the reference schematic, clockwise TDX rotation produces anticlockwise TR rotation. Rotating both TX and TDX makes the TR show the difference between the two movements. Worked examples from the source: TX rotated 30° clockwise with TDX rotated 15° clockwise moves the TR 45° clockwise; TX rotated 30° anticlockwise with TDX rotated 15° clockwise moves the TR 15° anticlockwise. Crossing the S1/S3 connections on both sides of the differential makes the system algebraically **add** the two mechanical inputs instead.

### Control Synchro System

Control synchros are used in electromechanical servo and shaft-positioning systems, producing only a low-power signal representative of transmitter position — this signal is then amplified to drive much larger loads. Because they carry no motive power, control synchros can be lighter, with higher-impedance windings than torque synchros, eliminating any burnout risk; the control synchro system is the most common synchro type and is extensively used in aircraft instrument and navigation systems.

AC power is applied only to the transmitter (CX) rotor; the receiving element is the **control transformer (CT)**, whose rotor supplies the output signal. In the balanced (nulled) position, the CX and CT rotors sit **90° apart**. Current flowing in the CT stator windings (driven by the CX-created stator field) produces a resultant field that cuts the CT rotor winding; the EMF induced in the CT rotor is proportional to the **sine of the angle** between the rotor and the resultant field — maximum when the rotor is parallel to the field, zero when at 90° to it. The phase of this induced EMF depends on whether the rotor is displaced clockwise or anticlockwise of null. Because of this behaviour, the control transformer functions as a **null detector**, and is most often found within servo systems: as the diagram shows, when the system is balanced there is zero output from the CT and the servo motor is stationary; rotating the CX rotor shifts the resultant stator field, inducing an EMF in the CT rotor that (via a discriminator amplifier, which senses phase to determine direction) drives the motor, which repositions the pointer and simultaneously drives the CT rotor back toward the 90° null position, stopping once the EMF again falls to zero.

### Differential Control Synchros

In common use, differential control synchros operate identically to torque differential synchros and can likewise be wired to produce a signal proportional to the sum or difference of two mechanical inputs.
        $cnt5$,
        5
    ) RETURNING id INTO s5_id;

    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s5_id, 'A servomechanism is best described as:',
     '[{"id":"a","text":"An electric control system for an automatic, powered mechanism that produces motion or force from a low-energy input signal","correct":true},{"id":"b","text":"A device that stores electrical charge for backup power","correct":false},{"id":"c","text":"A purely mechanical linkage with no electrical components","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'An open-loop control system is characterised by:',
     '[{"id":"a","text":"The presence of feedback confirming the controlled unit reached the demanded setting","correct":false},{"id":"b","text":"The absence of feedback, so the system cannot know whether the demanded setting was actually reached","correct":true},{"id":"c","text":"An error signal that is always reduced to zero automatically","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'In a closed-loop servomechanism, the signal produced by comparing demand and feedback is known as the:',
     '[{"id":"a","text":"Carrier signal","correct":false},{"id":"b","text":"Error signal","correct":true},{"id":"c","text":"Null signal","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'In an RPC (Remote Position Control) servo, if the demand potentiometer reads 6 V and the feedback potentiometer reads 5 V, the error signal applied to the amplifier is:',
     '[{"id":"a","text":"−1 V","correct":false},{"id":"b","text":"+1 V","correct":true},{"id":"c","text":"0 V","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'Which type of servo input is created by switching off power, moving the input shaft, and reapplying power — used as a test signal?',
     '[{"id":"a","text":"Ramp input","correct":false},{"id":"b","text":"Step input","correct":true},{"id":"c","text":"Accelerating input","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'A ramp input to a servo system is created when the input shaft is:',
     '[{"id":"a","text":"Rotated at a constant angular velocity","correct":true},{"id":"b","text":"Held stationary indefinitely","correct":false},{"id":"c","text":"Switched off and then abruptly reversed","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'Continuous oscillation of a servo output, caused by overshoot with negligible frictional losses, is known as:',
     '[{"id":"a","text":"Hunting","correct":true},{"id":"b","text":"Stiction","correct":false},{"id":"c","text":"Electrical zero","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'A servomechanism that reaches the demanded position at the fastest possible rate without any overshoot is said to be:',
     '[{"id":"a","text":"Underdamped","correct":false},{"id":"b","text":"Critically damped","correct":true},{"id":"c","text":"Overdamped","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'Which frictional force is present only while the system is at rest, and falls to zero once the system begins to move?',
     '[{"id":"a","text":"Viscous friction","correct":false},{"id":"b","text":"Coulomb friction","correct":false},{"id":"c","text":"Stiction","correct":true}]',
     '{"B1","B2"}'),

    (s5_id, 'Coulomb friction is generally avoided in practical servo design because it:',
     '[{"id":"a","text":"Is proportional to velocity and causes excessive overshoot","correct":false},{"id":"b","text":"Is a constant force that leaves a positional error at steady state","correct":true},{"id":"c","text":"Only occurs at very high speeds","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'A servomechanism responding to a ramp input with viscous friction damping settles with a constant error known as:',
     '[{"id":"a","text":"Velocity lag","correct":true},{"id":"b","text":"Electrical zero error","correct":false},{"id":"c","text":"Residual torque","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'Negative Velocity Feedback (NVFB) damping is typically produced using a:',
     '[{"id":"a","text":"Tachogenerator driven by the output shaft","correct":true},{"id":"b","text":"Capacitance bridge circuit","correct":false},{"id":"c","text":"Loop antenna","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'A rate (velocity control) servomechanism differs from an RPC (positional) servomechanism in that:',
     '[{"id":"a","text":"It has no position feedback and instead controls the angular velocity of the output shaft","correct":true},{"id":"b","text":"It uses no amplifier at all","correct":false},{"id":"c","text":"It cannot use a tachogenerator for feedback","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'In a rate servo, the small, unavoidable difference between demanded speed and actual speed — caused by inherent friction and damping losses — is called:',
     '[{"id":"a","text":"Residual error","correct":true},{"id":"b","text":"Electrical zero","correct":false},{"id":"c","text":"Stiction","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'In an E & I bar transducer, when the I bar is displaced from centre, the direction of movement is indicated by the output signal''s:',
     '[{"id":"a","text":"Frequency","correct":false},{"id":"b","text":"Phase","correct":true},{"id":"c","text":"Resistance","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'An AC tachogenerator commonly employs which construction principle?',
     '[{"id":"a","text":"The drag cup principle","correct":true},{"id":"b","text":"A toroidal resistance winding with wiper arms","correct":false},{"id":"c","text":"A capacitance bridge with a reference capacitor","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'In a practical DC (direct) servo current system, the error signal is amplified and used to produce flux in a:',
     '[{"id":"a","text":"Split-field motor","correct":true},{"id":"b","text":"Toroidal resistance winding","correct":false},{"id":"c","text":"Reference capacitor","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'In a basic AC synchro servo system using a control transmitter (CX) and control transformer (CT), the system is nulled (stationary) when the CT rotor is positioned:',
     '[{"id":"a","text":"Parallel to the CX rotor","correct":false},{"id":"b","text":"At 90° to the resultant stator field","correct":true},{"id":"c","text":"At 180° to the CX rotor, always","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'An inductive-type transducer that uses a coil, permanent magnet, and steel target to measure rotational speed (such as an engine shaft speed) relies on:',
     '[{"id":"a","text":"Capacitance changes between two fixed plates","correct":false},{"id":"b","text":"An EMF induced only when the target moves, changing the flux linking the coil","correct":true},{"id":"c","text":"A toroidal resistance winding tapped at 120° intervals","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'The purpose of the small permanent magnet fitted in a basic Desynn indicator is to:',
     '[{"id":"a","text":"Increase the torque available to move the pointer under normal power","correct":false},{"id":"b","text":"Provide fail-safe operation by moving the pointer off scale if system power is lost","correct":true},{"id":"c","text":"Compensate for the sawtooth waveform error inherent in the basic Desynn","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'On a landing gear DC selsyn indicating system, up-lock and down-lock engagement is shown by:',
     '[{"id":"a","text":"A separate mechanical flag unrelated to the synchro circuit","correct":false},{"id":"b","text":"Lock switches adding a resistor into a transmitter winding section, shifting the indicator''s magnetic field","correct":true},{"id":"c","text":"A change in the AC supply frequency from 400 Hz to 60 Hz","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'Magnesyn synchro systems are distinguished from autosyn systems in that magnesyn systems use:',
     '[{"id":"a","text":"Permanent-magnet rotors in both transmitter and indicator","correct":true},{"id":"b","text":"Electromagnet rotors in both transmitter and indicator","correct":false},{"id":"c","text":"No rotor at all, only stator windings","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'A resolver differs from a standard torque or control synchro in that its stator windings are spaced at:',
     '[{"id":"a","text":"120° to each other, the same as other synchros","correct":false},{"id":"b","text":"90° to each other, producing sine and cosine outputs","correct":true},{"id":"c","text":"45° to each other, producing four-phase outputs","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'Aircraft synchro systems are typically powered from which AC supplies?',
     '[{"id":"a","text":"115 V 400 Hz or 26 V 400 Hz","correct":true},{"id":"b","text":"12 V 60 Hz or 24 V 60 Hz DC-derived supplies only","correct":false},{"id":"c","text":"230 V 50 Hz only","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'In a torque synchro system, when the transmitter (TX) and receiver (TR) rotors are at the same angular position, the induced stator voltages are equal and opposite, current ceases to flow, and the system is described as:',
     '[{"id":"a","text":"Balanced or nulled","correct":true},{"id":"b","text":"Open circuited","correct":false},{"id":"c","text":"In electrical zero fault","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'In a torque synchro system, loss of AC supply to the TR (receiver) rotor typically results in:',
     '[{"id":"a","text":"No operation of the synchro at all","correct":false},{"id":"b","text":"Low-torque operation with a possible 180° error","correct":true},{"id":"c","text":"The receiver oscillating continuously between two points 75° apart","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'Electrical zero, for a synchro unit, is defined by the rotor position at which:',
     '[{"id":"a","text":"The voltage between S1 and S3 is zero, and the S2 voltage is in phase with R1 relative to R2","correct":true},{"id":"b","text":"All three stator voltages are equal to the supply voltage","correct":false},{"id":"c","text":"The rotor is at 90° to S2","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'In a differential torque synchro system wired for subtraction, if the TX is rotated 30° clockwise and the TDX is rotated 15° clockwise, the TR will move:',
     '[{"id":"a","text":"45° clockwise","correct":true},{"id":"b","text":"15° clockwise","correct":false},{"id":"c","text":"15° anticlockwise","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'In a control synchro system, in the balanced (nulled) position, the CX and CT rotors are positioned:',
     '[{"id":"a","text":"At 0° to each other","correct":false},{"id":"b","text":"At 90° to each other","correct":true},{"id":"c","text":"At 180° to each other","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'A resolver, as defined in synchro terminology, has how many windings in total, and what can it compute?',
     '[{"id":"a","text":"Two windings; it can only indicate a fixed reference angle","correct":false},{"id":"b","text":"Four windings (two on the rotor, two on the stator); it can resolve a signal into sine/cosine components and perform vector addition/subtraction or polar-cartesian conversion","correct":true},{"id":"c","text":"Six windings; it can only be used as a torque receiver","correct":false}]',
     '{"B1","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 04.6: Radio Communication — ELT and ADS-B (B1-only addendum)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m04_id, 'M04.6', 'Radio Communication — ELT and ADS-B',
        $cnt6$
# Radio Communication — ELT and ADS-B

*Note: this sub-module reflects a B1 addendum topic. Its content is not part of the B2 knowledge requirements.*

## Radio Waves and the Electromagnetic Spectrum

Much of aviation communication and navigation relies on **radio waves**, invisible electromagnetic waves that form part of the same electromagnetic spectrum as gamma rays, X-rays, ultraviolet rays, infrared waves and visible light. Every wave has a specific frequency and a corresponding wavelength, and frequency and wavelength are **inversely proportional**: a high-frequency wave has a short wavelength, and a low-frequency wave has a long wavelength.

Aviation uses a wide range of radio frequencies, from Low Frequency (LF) at around 100 kHz up to Super High Frequency (SHF) at nearly 10 GHz — the Federal Communications Commission (FCC) controls the assignment of frequency usage. Representative aviation frequency bands and uses include:

| Band | Approx. range | Example aviation use |
|------|---------------|------------------------|
| VLF/LF | below 300 kHz | Loran C (~100 kHz), NDBs / ADF (190–1600 kHz) |
| MF | 300 kHz–3 MHz | AM broadcast (550–1800 kHz) |
| HF | 3–30 MHz | HF Comm (2–30 MHz) |
| VHF | 30–300 MHz | VHF Comm (118–137 MHz), VHF NAV/VOR (108–118 MHz), FM broadcast (88–108 MHz), Marker Beacons (75 MHz) |
| UHF | 300 MHz–3 GHz | Transponder (1030 & 1090 MHz), DME (960–1215 MHz), Glideslope (328–336 MHz), GPS (1.6 GHz) |
| SHF | 3–30 GHz | Radar Altimeter (4.3 GHz), Doppler NAV (8.8 GHz), Weather Radar (9.375 GHz) |

## How a Radio Wave Is Produced

To transmit radio waves, an AC generator (oscillator) is placed at the midpoint of an antenna that is **half the wavelength** of the applied AC signal. As current builds and collapses in the antenna, a magnetic field builds and collapses around it, while a corresponding electric field builds and subsides as voltage shifts along the antenna; the two fields fluctuate together, oriented at 90° to each other and at 90° to the direction the wave travels. Because the AC cycles too fast for the fields to completely collapse before the next cycle begins, each new field forces the previous, not-yet-collapsed field outward into space — these expanding fields are the radio waves. Radio waves propagate at 186,000 miles per second, and at any one point along the antenna, voltage and current vary inversely to each other.

## Types of Radio Waves

Depending on frequency, radio waves behave differently as they propagate through the atmosphere:

- **Ground (surface) waves** — VLF, LF and MF waves (roughly 3 kHz–3 MHz) with long wavelengths and correspondingly long antennas. They follow the curvature of the earth from transmitter to receiver and are useful for long-distance transmission; Automatic Direction Finders (ADF) and LORAN navigation aids use these frequencies.
- **Sky waves** — HF waves (2–25 MHz) that travel in a straight line but **bounce off the ionosphere**, extending their range well beyond line-of-sight. Transoceanic aircraft often use HF radios for voice communication because of this characteristic.
- **Space waves** — waves above HF frequencies (VHF 30–300 MHz, UHF 300 MHz–3 GHz, SHF 3–30 GHz). These are capable of **line-of-sight transmission only** and do not refract off the ionosphere; most aviation communication and navigation aids operate using space waves.

VHF communication radios are the primary communication radios in aviation, operating from **118.0 MHz to 136.975 MHz**, with 720 separate channels spaced 25 kHz apart (further divided to 8.33 kHz spacing in Europe). Each party transmits and receives on the same channel, and only one party can transmit at a time.

## Loading Information onto a Radio Wave

The plain radio wave described above — a **carrier wave** — conveys no useful information by itself. To transmit and receive information, the carrier wave is altered, or **modulated**, by an information signal.

### Amplitude Modulation (AM)

A DC information signal (e.g. from a microphone) is amplified and superimposed on the AC carrier wave so that the **amplitude** of the carrier varies in proportion to the information signal, while the carrier's oscillator frequency remains constant. At the receiver, the weaker received signal is amplified and then **demodulated** — circuits containing capacitors, inductors, diodes and filters remove everything but the original information signal, which is amplified again to drive an output device such as a speaker. AM has limited fidelity because atmospheric noise or static alters the carrier's amplitude, making it hard to separate genuine modulation from static; AM is used in aircraft VHF communication radios.

### Frequency Modulation (FM)

FM is generally considered superior to AM for carrying and deciphering information. An FM carrier wave retains **constant amplitude**, while the information signal instead alters the carrier's **frequency** in proportion to the strength of the signal. Because the oscillator's output fluctuates during modulation, FM bandwidth is greater than AM bandwidth — but this drawback is outweighed by how easily noise and static can be removed from an FM signal. FM also requires less power to produce, since modulating an oscillator's frequency takes less power than modulating a signal's amplitude through an amplifier.

### Single Side Band (SSB)

When two AC signals are mixed — as when a carrier wave is modulated by an information signal — three main frequencies result: the original carrier frequency, the carrier frequency **plus** the modulating frequency, and the carrier frequency **minus** the modulating frequency. The additional frequencies either side of the carrier are called **sidebands**, and the full range of upper and lower sidebands plus the carrier frequency is the signal's **bandwidth**. Because each sideband independently contains the complete information signal, an SSB transmission filters out the carrier wave and one sideband, broadcasting only the remaining sideband. This halves the required bandwidth, allows more efficient use of the radio spectrum, and uses less power to transmit the same information over an equal distance — many long-distance HF aviation communications use SSB.

## Radio Transmitters and Receivers

### Transmitters

A transmitter consists of a precise **oscillator** that creates the AC carrier frequency, combined with **amplification** circuits; the distance a carrier wave travels depends directly on how much the signal sent to the antenna is amplified. Other circuits accept the input information signal and process it for loading onto the carrier: **modulator** circuits modify the carrier wave with the processed information signal. Multi-channel transmitters include tuning circuitry to select the broadcast frequency, adjusting the oscillator output accordingly; many transmitters use a stable oscillating frequency followed by a **frequency multiplier** to raise the AC to the final transmitting frequency, allowing the oscillator itself to run at more practical, controllable frequencies.

### Receivers

An antenna captures the desired carrier wave along with many other radio waves present in the atmosphere; the receiver isolates the desired carrier and separates the information signal from it for output. A common design is the **superheterodyne receiver**: it amplifies the weak captured signal, and a **local oscillator** produces a frequency different from the desired carrier frequency; the two are combined in a mixer, producing four resulting frequencies — the radio frequency, the local oscillator frequency, and the **sum** and **difference** of the two. The difference frequency, called the **intermediate frequency (IF)** — 10.8 MHz in VHF aircraft communication radios — is amplified and sent to the detector (demodulator), where the information signal is separated from the carrier. In AM receivers the signal is rectified, leaving a weak version of the original transmitted signal; in FM receivers the varying frequency is converted to a varying amplitude signal at this stage. The result is amplified again to drive the output device.

### Transceivers

A **transceiver** is a communication radio that both transmits and receives, typically on the same frequency. When transmitting, the receiving circuitry does not function — the **push-to-talk (PTT)** switch blocks the receiver and enables the transmitter. Because much of the circuitry (and the antenna) is shared between transmit and receive functions, transceivers save space and components. They are **half-duplex** systems: communication can occur in both directions, but only one party can transmit while the other listens. VHF aircraft communication radios are usually transceivers.

## Antennas

Antennas are conductors used to transmit and receive radio frequency energy. Three characteristics are of major concern: **length**, **polarization**, and **directivity**.

### Length

An antenna that is half the wavelength of the applied AC frequency is **resonant**, allowing full voltage and current flow through its length. A formula gives the ideal length of a half-wavelength antenna:

**Antenna length (feet) = 468 / F(MHz)**

VHF aviation frequencies (118–136.975 MHz) correspond to half-wavelengths of roughly 3.44–3.96 feet (41.2–47.5 inches), making a full half-wave VHF antenna relatively long. Because a quarter-wavelength antenna mounted on a metal fuselage forms a **ground plane** — with the fuselage effectively supplying the missing quarter-wavelength — quarter-wave antennas are often used instead. An antenna's effective length can be adjusted electrically: a series capacitor shortens it, and an added inductor lengthens it, allowing one antenna to serve a narrow range of frequencies; more sophisticated radios use tuning circuits (variable capacitor and inductor, or switched crystal-controlled circuits) to match antenna length to the desired frequency electronically.

### Polarization, Directivity and Field Pattern

The electric field of a radio wave is parallel to an antenna's polarization, caused by the voltage difference between the antenna's ends; the magnetic (electromagnetic) field component is at 90° to the polarization. All antennas — even nominally omnidirectional ones — radiate more strongly in some directions than others, a property called **directivity**. Receiving antennas with the **same polarization** as the transmitting antenna produce the strongest received signal.

- A **vertically polarized** antenna radiates in a donut-like pattern in all horizontal directions.
- A **horizontally polarized** antenna also radiates in a donut-like pattern, but the strongest signal comes from directions 90° to the length of the antenna, with essentially no signal radiated off the ends.

Many aircraft antennas are mounted at a slight angle off the vertical or horizontal plane ("canted") so that a weak signal can still be received even when the transmitting and receiving antennas' polarizations do not exactly match.

### Types of Antennas

Three basic antenna types are used in aviation:

- **Dipole antenna** — a conductor approximately half the wavelength of the transmission frequency, fed with AC current at its centre (sometimes called a Hertz antenna). Current flow is greatest at the centre and decreases toward the ends. A common example is the V-shaped VOR navigation antenna, each arm one-quarter wavelength (together forming a half-wave antenna fed at the centre); it is horizontally polarized and most sensitive to signals from the sides rather than head-on.
- **Marconi antenna** — a quarter-wave antenna that achieves the efficiency of a half-wave antenna by using the conductive aircraft skin (or, on fabric-covered aircraft, wires or foil fitted beneath the skin) as a **ground plane** supplying the missing second quarter-wavelength. Most aircraft VHF communication antennas are Marconi antennas; they are vertically polarized and radiate omnidirectionally.
- **Loop antenna** — formed by shaping the antenna conductor into a loop, making it compact and less prone to damage. As a receiving antenna it is highly direction-sensitive: a signal striking the loop broadside induces equal, opposite-polarity currents in each side of the loop that cancel out, producing minimum (effectively no) signal; a signal striking the loop in line with its plane produces currents of different phase in each side, generating the strongest signal. This directional sensitivity is exploited in Automatic Direction Finder (ADF) navigation aids.

### Transmission Lines

Transmitters and receivers connect to their antennas via **coaxial cable (coax)**: a centre wire conductor, surrounded by a semi-rigid insulator, surrounded by a conductive braided shield, surrounded by a protective waterproof covering. The braided shield keeps external fields from affecting the inner conductor and prevents the inner conductor's fields from radiating away. For optimum performance, the transmission line's impedance should match the antenna's impedance — commonly around **50 ohms** in aviation antenna applications.

## Automatic Dependent Surveillance–Broadcast (ADS-B)

ADS-B is a collision-avoidance technology and an integral part of the FAA's Next-Gen plan for transforming the National Airspace System, enabled by the success of global navigation satellite systems (GNSS) such as GPS.

ADS-B has two segments:

- **ADS-B OUT** combines positioning information from a GPS receiver with on-board flight status information (location including altitude, velocity, and time), broadcasting this to other ADS-B-equipped aircraft and to ground stations. Two frequencies carry these broadcasts: an expanded use of the **1090 MHz Mode-S transponder protocol (1090 ES)**, and, largely for general aviation, **978 MHz** via a **Universal Access Transceiver (UAT)**, which requires its own omnidirectional antenna in addition to the GPS antenna and receiver.
- **ADS-B IN** lets equipped aircraft receive additional data to enhance situational awareness: **Traffic Information Services–Broadcast (TIS-B)** supplies traffic data on non-ADS-B and ADS-B aircraft from ground radar and the network, giving a more complete picture than air-to-air-only collision avoidance; **Flight Information Services–Broadcast (FIS-B)** delivers weather text and graphics, ATIS information, and NOTAMs to aircraft with UAT capability.

Compared with conventional ground-based radar, ADS-B offers several advantages: inexpensive ground stations (which can run on solar or propane power alone, unlike power-hungry radar) can cover remote and obstructed areas at far lower cost; positioning data is more accurate because it is generated by the aircraft itself via GPS; weather has much less effect on ADS-B than on radar; increased positioning accuracy supports higher-density traffic flow and approaches, more efficient routing, and reduced weather-related delays; and ADS-B's collision-avoidance role extends to detecting runway incursions by other aircraft and surface vehicles. Dedicated **ADS-B test units** are used by trained maintenance personnel to verify correct system operation, since accurate air traffic separation depends on accurate data throughout the system.

## Emergency Locator Transmitter (ELT)

An **Emergency Locator Transmitter (ELT)** is an independent, battery-powered transmitter activated by the excessive G-forces experienced during a crash. It transmits a digital signal every **50 seconds** on a frequency of **406.025 MHz** at **5 watts**, for at least **24 hours**. This signal is received anywhere in the world by satellites of the **COSPAS-SARSAT** system, which uses both **low earth orbiting satellites (LEOSATs)** and **geostationary satellites (GEOSATs)** with complementary capabilities. The signal is partially processed and stored aboard the satellites, then relayed to ground stations called **Local User Terminals (LUTs)**, where further deciphering occurs; appropriate search-and-rescue operations are then notified through **Mission Control Centers (MCCs)**. Maritime Emergency Position-Indicating Radio Beacons (EPIRBs) and Personal Locator Beacons (PLBs) use the same COSPAS-SARSAT system; the US portion of the system is maintained and operated by NOAA.

**Installation and inspection:** ELTs are required to be installed per FAR 91.207, covering most general aviation aircraft not operating under Parts 135 or 121. They must be inspected within **12 months** of the previous inspection for proper installation, battery corrosion, correct operation of the controls and crash sensor, and sufficient signal strength at the antenna. Built-in test equipment allows this testing without actually transmitting an emergency signal; technicians are specifically cautioned **not** to activate the ELT and transmit a live distress signal during inspection. Inspection results — including the new battery expiration date — must be recorded in maintenance records and on the outside of the ELT unit itself.

**Location and construction:** ELTs are typically mounted as far aft in the fuselage as practicable, just forward of the empennage, with the built-in G-force sensor aligned to the aircraft's longitudinal axis. Helicopter ELTs may be located elsewhere and are fitted with multidirectional activation devices, since a crash impact may occur from any angle. Automatic G-force-activated ELTs are designed to be easily removable and often include a portable antenna, so survivors can carry the operating unit with them away from the crash site. A flight-deck-mounted panel alerts the pilot if the ELT has activated, and also allows the unit to be armed, tested, and manually activated.

**Locating accuracy:** Doppler processing of the 406 MHz signal allows the origin of a crash to be calculated to within **2 to 5 kilometres**. Second-generation 406 MHz ELTs additionally embed **GPS location coordinates** (from an internal or integrated external receiver) in the digital signal, improving location accuracy to within **100 metres**. The digital signal also carries unique registration information identifying the aircraft, owner, and contact details, which is used to quickly verify that a received alert is a genuine emergency before rescue resources are deployed.
        $cnt6$,
        6
    ) RETURNING id INTO s6_id;

    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s6_id, 'The relationship between the frequency and wavelength of a radio wave is:',
     '[{"id":"a","text":"Directly proportional — higher frequency means longer wavelength","correct":false},{"id":"b","text":"Inversely proportional — higher frequency means shorter wavelength","correct":true},{"id":"c","text":"Unrelated — frequency and wavelength vary independently","correct":false}]',
     '{"B1"}'),

    (s6_id, 'Aircraft VHF communication radios operate within which approximate frequency range?',
     '[{"id":"a","text":"2.0 to 25 MHz","correct":false},{"id":"b","text":"118.0 to 136.975 MHz","correct":true},{"id":"c","text":"960 to 1215 MHz","correct":false}]',
     '{"B1"}'),

    (s6_id, 'Ground (surface) waves are useful for long-distance transmission because they:',
     '[{"id":"a","text":"Bounce off the ionosphere back to earth","correct":false},{"id":"b","text":"Follow the curvature of the earth as they travel","correct":true},{"id":"c","text":"Travel only in a perfectly straight line-of-sight path","correct":false}]',
     '{"B1"}'),

    (s6_id, 'Sky waves, used by transoceanic aircraft for HF voice communication, extend beyond line-of-sight range because they:',
     '[{"id":"a","text":"Refract (bounce) off the ionosphere","correct":true},{"id":"b","text":"Follow the curvature of the earth like ground waves","correct":false},{"id":"c","text":"Travel at a slower speed than space waves","correct":false}]',
     '{"B1"}'),

    (s6_id, 'Space waves, which include VHF, UHF and SHF transmissions used by most aviation communication and navigation aids, are limited to:',
     '[{"id":"a","text":"Following the curvature of the earth","correct":false},{"id":"b","text":"Line-of-sight transmission only","correct":true},{"id":"c","text":"Refraction off the ionosphere only","correct":false}]',
     '{"B1"}'),

    (s6_id, 'In amplitude modulation (AM), the information signal varies the carrier wave''s:',
     '[{"id":"a","text":"Frequency, while amplitude stays constant","correct":false},{"id":"b","text":"Amplitude, while frequency stays constant","correct":true},{"id":"c","text":"Phase only, with no change to amplitude or frequency","correct":false}]',
     '{"B1"}'),

    (s6_id, 'Compared with AM, frequency modulation (FM):',
     '[{"id":"a","text":"Retains a constant amplitude and requires less power to produce than AM","correct":true},{"id":"b","text":"Retains a constant frequency and varies only in amplitude","correct":false},{"id":"c","text":"Always uses less bandwidth than AM","correct":false}]',
     '{"B1"}'),

    (s6_id, 'A single side band (SSB) transmission achieves a narrower bandwidth than a standard AM transmission by:',
     '[{"id":"a","text":"Transmitting both sidebands plus the carrier simultaneously","correct":false},{"id":"b","text":"Filtering out the carrier wave and one sideband, broadcasting only the remaining sideband","correct":true},{"id":"c","text":"Doubling the modulating frequency before transmission","correct":false}]',
     '{"B1"}'),

    (s6_id, 'In a superheterodyne receiver, the frequency produced by mixing the local oscillator frequency with the incoming radio frequency, and used for further processing, is called the:',
     '[{"id":"a","text":"Sideband frequency","correct":false},{"id":"b","text":"Intermediate frequency (IF)","correct":true},{"id":"c","text":"Carrier frequency","correct":false}]',
     '{"B1"}'),

    (s6_id, 'A transceiver is described as a half-duplex device because:',
     '[{"id":"a","text":"It can only receive, never transmit","correct":false},{"id":"b","text":"Communication can occur in both directions, but only one party can transmit at a time while the other listens","correct":true},{"id":"c","text":"It permanently splits the signal power in half","correct":false}]',
     '{"B1"}'),

    (s6_id, 'The formula given for the ideal length, in feet, of a half-wavelength antenna is:',
     '[{"id":"a","text":"Length = 468 / F(MHz)","correct":true},{"id":"b","text":"Length = F(MHz) / 468","correct":false},{"id":"c","text":"Length = 468 × F(MHz)","correct":false}]',
     '{"B1"}'),

    (s6_id, 'On a metal-skinned aircraft, a quarter-wavelength Marconi antenna achieves the efficiency of a half-wave antenna because:',
     '[{"id":"a","text":"The aircraft skin acts as a ground plane supplying the missing quarter wavelength","correct":true},{"id":"b","text":"A second physical antenna is always mounted opposite it","correct":false},{"id":"c","text":"It is mounted vertically at exactly 90° to the fuselage","correct":false}]',
     '{"B1"}'),

    (s6_id, 'The V-shaped VOR navigation antenna is an example of which antenna type?',
     '[{"id":"a","text":"Loop antenna","correct":false},{"id":"b","text":"Dipole antenna","correct":true},{"id":"c","text":"Marconi antenna","correct":false}]',
     '{"B1"}'),

    (s6_id, 'A loop antenna used as a receiving antenna produces its strongest signal when a radio wave strikes it:',
     '[{"id":"a","text":"Broadside (perpendicular) to the plane of the loop","correct":false},{"id":"b","text":"In line with the plane of the loop","correct":true},{"id":"c","text":"At exactly 45° to the plane of the loop, always","correct":false}]',
     '{"B1"}'),

    (s6_id, 'ADS-B OUT broadcasts aircraft position and flight status using which two frequencies?',
     '[{"id":"a","text":"118 MHz and 136.975 MHz","correct":false},{"id":"b","text":"1090 MHz (1090 ES) and 978 MHz (UAT)","correct":true},{"id":"c","text":"406.025 MHz and 121.5 MHz","correct":false}]',
     '{"B1"}'),

    (s6_id, 'ADS-B IN service that delivers weather text and graphics, ATIS information, and NOTAMs to the flight deck is known as:',
     '[{"id":"a","text":"Traffic Information Services–Broadcast (TIS-B)","correct":false},{"id":"b","text":"Flight Information Services–Broadcast (FIS-B)","correct":true},{"id":"c","text":"Terminal Information Service (ATIS-B)","correct":false}]',
     '{"B1"}'),

    (s6_id, 'An Emergency Locator Transmitter (ELT) is activated by:',
     '[{"id":"a","text":"A manual switch only, with no automatic activation possible","correct":false},{"id":"b","text":"Excessive G-forces experienced during a crash","correct":true},{"id":"c","text":"Loss of GPS signal for more than 24 hours","correct":false}]',
     '{"B1"}'),

    (s6_id, 'A 406 MHz ELT transmits its digital distress signal on which frequency, and for at least how long?',
     '[{"id":"a","text":"121.5 MHz, for at least 1 hour","correct":false},{"id":"b","text":"406.025 MHz, for at least 24 hours","correct":true},{"id":"c","text":"978 MHz, for at least 50 seconds total","correct":false}]',
     '{"B1"}'),

    (s6_id, 'Satellites of the COSPAS-SARSAT system relay a received ELT signal first to which type of station, before search-and-rescue coordination begins?',
     '[{"id":"a","text":"Local User Terminals (LUTs)","correct":true},{"id":"b","text":"ADS-B ground transceivers","correct":false},{"id":"c","text":"VHF marker beacon stations","correct":false}]',
     '{"B1"}'),

    (s6_id, 'Per the source material, an ELT must be inspected for proper installation, battery corrosion, and correct operation of controls and crash sensor at intervals not exceeding:',
     '[{"id":"a","text":"12 months","correct":true},{"id":"b","text":"5 years","correct":false},{"id":"c","text":"50 hours of flight time","correct":false}]',
     '{"B1"}');

END $$;
