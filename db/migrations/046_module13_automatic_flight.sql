-- Module 13: Aircraft Aerodynamic Structures (B2) — Automatic Flight
-- Source: EASA Part-66 Module 13 official textbook (IKAROS Aviation Training Centre, IK01, Issue Oct.2012)
-- This module is B2-ONLY.

DO $$
DECLARE
    m13_id INT;
    s1_id  INT;
BEGIN
    SELECT id INTO m13_id FROM easa_modules WHERE code = 'M13';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M13.3') THEN
        RAISE NOTICE 'M13.3 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 13.3: Automatic Flight
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m13_id, 'M13.3', 'Automatic Flight',
        $cnt$
# Automatic Flight

## Introduction

Early automatic pilots were primarily pilot relief devices, which did little more than hold the aircraft straight and level. The introduction of transistorized electronics permitted dramatic changes in the size, weight, and power requirements of automatic pilots. The automatic pilot has grown to become a system that is utilized in all phases of flight and has, as such, acquired its more modern identification as an **Automatic Flight Control System (AFCS)**.

**Commercial aircraft:** AFCS in modern jet transports are all uniquely tailored to the specific aircraft, but share common features. For example, the flight aerodynamics of an MD-11 differ from those of an A380, yet both would most likely require an "attitude hold" mode — this feature is common to both autopilot designs, but the gains differ to accommodate the differences in aerodynamics of each aircraft. Each AFCS receives attitude and heading signals from a vertical and directional gyro and has its own rate gyro/accelerometer system to develop attitude and flight path stabilization signals. The AFCS computer is an electronic "brain" that receives signals from its "senses" to compute the proper responses and provides outputs to electric and/or hydraulic actuators — the "muscles" — that move the aircraft's control surfaces.

**Smaller aircraft:** the need for automatic flight control has produced autopilots ranging from simple single-axis "wing levelers" in small single-engine aircraft up to three-axis systems for corporate jets with as many features as jet transport systems.

**Helicopters** are relatively unstable aircraft requiring constant pilot attention even in smooth flight. They must be controlled from zero forward speed to speeds approaching 200 miles per hour and, since they can also fly sideways and backwards, a completely new design approach was required.

## Aircraft Axes and Movements

Movements of an aircraft occur along and around three known axes:

| Axis | Also known as | Type of movement |
|------|----------------|-------------------|
| **X-Axis** | Longitudinal axis | Roll axis |
| **Y-Axis** | Lateral axis | Pitch axis |
| **Z-Axis** | Vertical axis | Yaw axis |

- **Pitch movement** — movement around the lateral (Y) axis, described in terms of attitude, rate and acceleration.
- **Bank (roll) movement** — movement around the longitudinal (X) axis, described in terms of attitude and acceleration.
- **Yaw movement** — movement around the vertical (Z) axis, described in terms of attitude (heading), rate and acceleration.

## Integrating and Differentiating

Integrating and differentiating are mathematical functions, more easily understood as graphs.

- **Integrating** — the output is the sum of all inputs: **Acceleration > Rate > Displacement**.
- **Differentiating** — the output is proportional to the rate of change of the input: **Displacement > Rate > Acceleration**.

## Operation Principle of Flight Controls

**Primary flight controls:**
- **Aileron** — steers around the roll axis, causing a heading change.
- **Elevator** — steers around the pitch axis, causing an altitude rate change.
- **Rudder** — steers around the yaw axis, causing a heading change.

**Secondary flight controls:**
- **Flaps** — control lift and drag.
- **Slats** — control lift and drag.
- **Spoiler** — assists the aileron and spoils lift.

**Flight maneuvers:** the primary flight controls must be deflected to initiate or terminate an attitude change. During a climb, for example, attitude is nose-up and the elevators are centred; to initiate and terminate the climb, the elevators must be shortly deflected. During a heading change, one wing is up or down and the ailerons are nearly centred; to initiate and terminate the turn, the ailerons must be shortly deflected, and may be assisted by spoilers and rudder.

## Feedback Controls

Feedback controls are widely used in modern automated systems. A feedback control system consists of **five basic components**:

1. **Input** — the reference value or set point for the system output (the desired operating value).
2. **Process being controlled** — e.g. a heater, a steering system, or an aircraft's engines.
3. **Output** — the variable of the process being measured and compared to the input.
4. **Sensing elements** — the measuring devices used in the feedback loop to monitor the output variable (e.g. a temperature sensor).
5. **Controller and actuating devices** — compare the measured output value with the reference input value and reduce the difference between them, using devices such as motors, valves, solenoid switches, piston cylinders, gears, power screws, pulley systems and chain drives.

### Hunting and Damping

The stability of a control system is determined largely by its response to a suddenly applied signal, or transient. If such a signal causes the system to over-correct itself, a phenomenon called **hunting** may occur, in which the system first overcorrects in one direction and then overcorrects in the opposite direction. Because hunting is undesirable, corrective measures are usually taken.

The most common corrective measure is the addition of **damping** somewhere in the system. Damping slows down system response and avoids excessive overshoots or overcorrections. Damping can take the form of electrical resistance in an electronic circuit, the application of a brake in a mechanical circuit, or forcing oil through a small orifice (shock-absorber damping); signals proportional to the actuating device rate or process rate are also commonly used for damping.

## Control Loops

The autopilot represents two different control loops:

- **Inner loop** — stabilizes the aircraft attitude around the pitch or roll axis, and controls the aircraft in the lateral and vertical direction (e.g. airspeed, altitude, track, interception of a radio beam, etc.).
- **Outer loop** — as illustrated in the helicopter AFCS hierarchy, the outer loop deals with conditions external to the aircraft such as airspeed, altitude and other navigational information, whereas the inner loop deals with internal conditions directly related to the aircraft such as pitch, roll and yaw attitudes, rates and accelerations.

## Synchronization

**Autopilot not engaged:** while the human pilot steers the aircraft manually, the attitude reference provides the actual attitude information to the autopilot computer. The output of the internal summing point is fed back instead of the input, to wash out any built-up signal to the servo. This mode is called **synchronization**, and is necessary to prevent any jerks of the flight controls at the moment of autopilot engagement. A disengaged autopilot synchronizes with the actual aircraft attitude, and therefore the autopilot must always be electrically powered and functionally operative.

**Autopilot engaged:** the navigation system and sensors provide a steering command to the autopilot computer. The summing point feeds the steering order to the servo, and the aircraft's reaction is sensed by the attitude reference and fed back to the summing point.

## Terms and Definitions

The following functions may be performed by an Automatic Flight Control System, whose purpose is to increase passenger comfort, relieve pilot routine workload and increase aircraft stability:

- **Take-off** — there is currently no aircraft certificated for automatic take-off; functions such as yaw damper, pitch trim and auto thrust must or may be activated.
- **Cruise** — the AFCS controls the aircraft around and along all three axes.
- **Landing** — the AFCS lands the aircraft automatically, including align, flare, nose lowering and roll out.
- **Roll out** — the AFCS steers and maintains the aircraft along the runway centreline.
- **Yaw damper (YD)** — damps Dutch rolling, assists lateral steering by turn coordination, and eliminates gusty wind effects close to the ground; the electronically controlled active rudder compensates for every small distortion around the aircraft's yaw axis.
- **Control wheel steering (CWS)** — with no autopilot engaged, ailerons and elevators are deflected via electro-hydraulic servos manually controlled by force sensors installed at the control wheel and column.
- **Automatic pitch trim (APT)** — if the elevator is deflected over a longer time, the AFCS trims the horizontal stabilizer to eliminate the elevator deflection load.
- **Longitudinal stability augmentation system (LSAS)** — used on large aircraft with reduced-size horizontal stabilizers, needing an electronically controlled active elevator that compensates every small distortion around the aircraft's pitch axis.
- **Centre of gravity control** — controls CG within allowable limits by transferring fuel between regular fuel tanks and tanks located in the tail or the horizontal stabilizer.
- **Mach pitch trim** — with increasing aircraft speed the outer wing produces more lift, causing a nose-down effect; Mach pitch trim counteracts this effect.
- **Flight director (FD)** — the AFCS calculates "how to fly" (aileron, elevator and rudder commands), shown on a flight director horizon instrument or EFIS display; pilots follow the steering orders to reach and maintain the correct flight path. The FD can also be used to monitor AP reactions.
- **Mode annunciation** — armed (preselected but not momentarily active) and active AFCS operating modes are displayed at the PFD or a separate flight mode annunciator.
- **Flight envelope protection** — according to aircraft configuration (landing gear, flap, slat, weight and angle of attack), the AFCS calculates and displays minimum and maximum operating airspeeds.
- **Engine thrust limit (N1/EPR)** — depending on environmental conditions and the selected operating mode, the AFCS calculates the maximum thrust limit, which is displayed and applied to the engine thrust control system.
- **Auto Throttle (AT)** — the AFCS thrust control circuit moves the power levers with a servo motor, or applies a signal directly to the electronic engine control (EEC) without moving the thrust levers; it operates in speed or thrust mode.
- **Stall warning** — the AFCS triggers a warning if aerodynamic lift is lost (increasing angle of attack); engine thrust is increased and a safe nose-down attitude is established.
- **Failure monitoring and logging** — the AFCS stores failure conditions for analysis and troubleshooting; tests can be initiated for maintenance purposes.

## System Layout — Fail-Safe, Fail-Passive, Fail-Operational

- **Fail-safe** — the crew is part of the monitoring, typically when only one sensor of one kind is available (e.g. one radio altimeter, one ILS).
- **Redundant** — having extra equipment: flight control computers, calculations, sensors and servos.
- **Redundant modes** — the extra equipment is genuinely in use in **Take-off**, **Land** and **Go-Around**; all other modes are non-redundant.
- **Fail-passive system** — the system monitor disconnects a system before a dangerous situation occurs; a system becomes fail-passive by using two different computers for monitoring multiple channels and multiple feedbacks.
- **Fail-operational system** — after a single failure, the system continues its operation but degrades to fail-passive. Adding a third or fourth channel of redundancy gives the auto-flight system a fail-operational status, used in critical modes such as Take-off, Land and Go-Around.
  - **Triple configuration** examples: Boeing 747, Fokker 100.
  - **Quadruple configuration** examples: MD-11, Airbus A320, A330, A340.

**Dual channel fail-passive system** — one dual-channel flight control computer with duplex servo actuators is active. If a failure occurs, the system disengages and, if available, the second autopilot must be manually selected.

**Quadruple channel fail-operational system** — two dual flight control computers with two duplex servo actuators are active. If a failure occurs, the system remains engaged and continues the flight with the healthy system.

## System Layout Examples

Different stand-alone autopilot and flight director systems from the 1960s–2000 are today integrated into modern systems, typically comprising: Autopilot (AP), Flight Director (FD), Auto Throttle/Speed Command Computer (AT/SC), Flight Control Computer (FCC), Thrust Control Computer (TCC), Flight Augmentation Computer (FAC) and, on later aircraft, the Flight Management Guidance Envelope Computer (FMGEC), integrating Flight Envelope (FE), Flight Guidance (FG), Flight Management (FM) and Fault Isolation Detection System (FIDS) functions.

**Example — MD-80:** the Digital Flight Guidance Computer is a dual-channel unit that provides, among other functions: engagement and mode selection at the Flight Guidance Control Panel; a Flight Mode Annunciator; an Attitude Direction Indicator (ADI) showing speed deviation and Flight Director commands; Automatic Reserve Thrust that increases engine power if one engine fails during take-off; EPR synchronization to keep both engines at identical thrust; an Auto Throttle servo that moves both power levers; an EPR limit dependent on outside temperature, bleed air consumption, air pressure and flight phase; a Speed Bug on the airspeed indicator; an Altitude Alert; Aileron, Elevator and Rudder Servos steering roll, pitch and yaw respectively; Auto Pitch Trim and Mach Trim; and a Yaw Damper that counteracts Dutch rolling and performs turn coordination.

**Example — A320:** the interactive Flight Management and Guidance System (FMGS) provides predictions of flight time, mileage, speed, economy profiles and altitude, reducing cockpit workload. During cockpit preparation, the pilot inserts a planned route via the Multifunction Control and Display Units (MCDUs). Either Flight Management and Guidance Computer (FMGC) performs all operations if the other fails.
  - The **FM part** provides: navigation; performance prediction and optimization; flight planning management; managed guidance computation; information display.
  - The **FG part** provides: autopilot command (AP); flight director command (FD); auto thrust command (A/THR).
  - The **Flight Augmentation part** provides: yaw functions; flight envelope functions; wind shear protection; low energy warning.

**Example — MD-11:** the aircraft is equipped with an Automatic Flight System (AFS) supplying automatic flight control and flight crew guidance through the full flight envelope, from take-off above 100 feet through ground roll-out after landing. Functions include: automatic ILS approach; Longitudinal Stability Augmentation System (LSAS); speed envelope limiting; dual autopilot (AP) and flight director (FD); auto throttle system (ATS) engine trim control; automatic pitch trim in AP and LSAS; full-time parallel actuation roll control wheel steering (CWS) with roll attitude hold when the AP is not engaged; wind shear warning with AP/FD/ATS compensation; yaw damping/turn coordination; elevator load feel (ELF) control and flap limiting; automatic ground spoiler (AGS); stall warning with stick shaker and auto slat extend; and altitude alerting.

## Autopilot and Actuators

**General:** the autopilot represents a closed control loop, controlling the aircraft via associated servos to fly it in the correct order. When not engaged, the clutches are open, so the pilot controls the plane while the autopilot synchronizes the output of the servos to zero — allowing the autopilot to be engaged at any time with no jerking aircraft movement. Aircraft response is sensed by different sensors and applied back to the autopilot as feedback. Pilot tasks include mode selection and switching, setting navigation parameters (speeds, altitude, radio frequencies), and selecting aircraft configuration (flaps, slats, landing gear, trims).

**Control panels** are used to engage the autopilot, presetting parameters and mode selection — examples range from analogue panels (e.g. DC-9) to digital flight guidance systems (e.g. MD-80). Boeing 747 uses a triple autopilot system; MD-11 uses a dual autopilot system where each pilot has two channels; Airbus A320/330/340 use a dual autopilot system where each autopilot has two channels.

**Servos/actuators** vary in complexity with aircraft size and the aerodynamic forces they must control:

- **Pneumatic servo** — the simplest servo, using a diaphragm moved by suction or positive air pressure from the gyro pick-off, attached to the control cable by a clamp.
- **Electric servo actuator** — uses a reversible DC or AC motor driving a capstan through a reduction gear; when engaged, the servo motor gear train is mechanically clutched to the control cables via an electric solenoid; the servo motor drives a tachometer generator to provide inverse feedback to the amplifier for speed limiting and smoothing. A follow-up synchro is driven to null prior to engagement; control surface movement stops when the follow-up signal equals the computed command.
- **Hydraulic servo** — the servo amplifier has a low power output on the order of **100 millivolts or 8 mA**. The transfer valve is an electrically controlled hydraulic valve operating a piston assembly (the autopilot actuator), which operates the main control valve for the actuating cylinder. The amount of autopilot actuator movement is indicated by a Linear Variable Differential Transformer (LVDT). Direct operation of the hydraulic power unit has two main advantages: very low power computer output, and more sensitive, accurate control by bypassing cable slack, stretch and drag.
- **Rudder servo** — rotates the cable drum; operates in parallel mode; rudder pedals move with rudder movement; rudder deflection is **±25°**.
- **Yaw damper servo** — moves an output rod linearly; input to the rudder system is in serie(s) mode; no movement is felt at the rudder pedals; rudder deflection is **±3–6°**.

**Serie vs. parallel mode:** autopilot servo output can be applied to the flight control system in two ways, illustrated for the rudder function:
- **Serie mode** — Yaw Damper servo movement is added in series to the pedal input, with no feelable feedback to the pedals; deflections are small, up to ±6°. Used for the yaw damper function during cruise.
- **Parallel mode** — in critical modes (Take-off, Land, Go-around, engine failure), servo movement is applied directly/in parallel to the pedal input, so the pedals move accordingly; deflection authority can be large, up to 25°. Active during take-off, approach, landing and go-around.

**Control Wheel Steering (CWS):** force sensors are installed in the mechanical steering links or directly inside the control wheel hub. When the pilot steers manually, sensors send the applied force from the control wheel to the autopilot computer, whose output is sent electrically to the servo actuator; the control surface movement is mechanically fed back to the control column and wheel. CWS provides lateral and vertical stability through electronic control of ailerons and elevators when the AP is not engaged. With no force on the control wheel the aircraft holds its current attitude; force on the wheel commands a roll/pitch rate proportional to the applied force, so that when the force is removed the aircraft holds the new attitude. CWS is available when the flight control computer is operational but not engaged.

**Fly-by-wire:** sidesticks are used to fly the aircraft in pitch and roll. Pilot inputs are interpreted by computers and move the flight controls as necessary to achieve the desired flight path; regardless of pilot input, the computers prevent excessive manoeuvres and exceeding the safe flight envelope. Flight control surfaces are electrically controlled and hydraulically actuated. If the sidestick is centred, the aircraft maintains its attitude; deflection represents a pitch or roll attitude change at a predetermined rate. The autopilot provides its commands directly into the flight control computers instead of via the sidestick signal.

## Operational Modes — Take-off, Go-Around and Basic Modes

**Take-off:** the mode in which the system powers up on the ground, giving steering signals for ground roll, rotation, lift-off and climb-out. On the ground and up to approximately 35–100 feet of radio altitude, the AFS gives flight director commands only; above that height it is allowed to engage the autopilot. Relevant speeds:
- **V1** — Decision Speed
- **VR** — Rotation Speed
- **V2** — Take-Off Safety Speed

The autopilot can be engaged after lift-off; pitch attitude is controlled to reach and maintain the take-off reference speed **V2 + 10 kts**, with wings level or heading hold. After lift-off the autopilot steers for wings level, then after reaching a safe height controls heading hold; after pilot selection the mode changes to heading select or navigation. During take-off the rudder channel stabilizes the aircraft around the yaw axis; if one engine fails, the rudder immediately deflects to compensate the asymmetric thrust.

**Go-around:** after a missed approach, an automatic go-around can be initiated. Pitch control applies the angle-of-attack speed plus a safe margin of 10 kts; roll control is identical to take-off. The Go-Around (GA) selection is made via switches on the thrust levers; on some types it automatically engages the ATS, selects heading hold, and sets a safe speed in the speed display, while on other types the throttles must be manually moved fully forward. Go-around thrust is demanded from the engines and a positive safe climb is automatically initiated; the wings are levelled and, at a safe altitude, heading hold or heading select mode is initiated.

**Heading Hold** — the autopilot makes steering signals to hold the aircraft's existing heading; if the crew selects HDG hold while the aircraft is in a roll, the AFCS first levels the aircraft off. Heading hold is the basic roll mode.

**Heading Select** — the AFCS controls the aircraft to capture and hold the heading selected by the crew on the flight mode panel.

**Altitude Hold** — the auto flight system makes steering signals to level the aircraft off and then holds the altitude at which the aircraft was flying when altitude hold was initiated (by momentarily pressing the selector knob in).

**Altitude Select** — the auto flight system makes steering signals to level the aircraft off at a preselected altitude (reached while climbing or descending at a preselected vertical speed, or in level change mode) and then holds that altitude.

**Level Change** — a combination of a speed mode and a thrust mode (when AT is engaged); the AFCS flies the aircraft from an old flight level to a new preselected altitude, controlling speed with the elevator (IAS or Mach select mode) while the auto throttle controls the engines to the upper limit in climb or the lower limit in descent. Vertical speed in this mode depends on aircraft weight, etc. The AFCS remains in level change until the aircraft reaches the preselected altitude, then transitions to altitude capture/hold.

**Vertical Speed Select** — selected with the VS selector; the read-out shows the current vertical speed, and rotating the knob updates the display and adjusts the aircraft's vertical speed to the displayed value.

**Flight Path Angle Select** — allows preselection of a desired climb or descent path angle, along which the aircraft is guided.

**Lateral Navigation** — in navigation mode, the flight management computer gives steering signals to the flight control computers to control aircraft heading.

**Profile (Vertical Navigation)** — the FMS gives vertical steering and thrust commands to the flight control computers, performing all altitude changes, captures and holds when the AFCS is in profile mode.

**VOR or LOC mode** — the flight control computers use VOR or localizer signals to generate roll steering signals.

## Automatic Landing

**Landing mode** provides capture and track of the ILS beam (LOC and GLIDE) and ensures alignment, flare and roll out; available for AP and FD, it enables landings in CAT2/CAT3 operations. Selecting the LAND mode authorizes engagement of a second autopilot. Arming LAND enables the LOC and GLIDE modes to be armed on the lateral and longitudinal axes; once stabilized on the beams, the AP/FD guides the aircraft along the ILS beam to 30 ft, where LAND mode provides runway centreline alignment (yaw axis) and flare (pitch axis). The ROLLOUT submode engages at touchdown for centreline guidance; LAND mode is latched below 400 ft and can only be deactivated by engaging Go-Around.

**Capture phase:**
- **Localizer capture** is smooth and stable at ranges from 4 up to 40 nautical miles from the runway threshold, at airspeeds up to 1.5 Vs, and at any intercept angle up to 90° from the selected runway heading (from either side of the beam).
- **Glideslope capture** is performed from above or below the glideslope centreline at any intercept angle up to ±3°, smoothly and without overshoot.

**Align phase** engages automatically at about **150 feet** radio altitude, bringing the aircraft heading to the runway heading. **Flare phase** engages automatically at about **50 feet** radio altitude; the autopilot commands a flare path with a nose-up control column motion, and auto throttle reduces thrust to idle at approximately the same point.

**Nose lowering** is initiated immediately after main landing gear touchdown, decreasing the nose-up attitude at a minimum pitch rate of **2° per second**; after nose gear touchdown the autopilot continuously commands nose-down to maintain firm runway contact during rollout. **Rollout** controls the aircraft to stay on the runway centreline.

### Automatic Landing Categories

In CAT II/CAT III regulations two heights are defined:

- **Decision Height (DH)** — the wheel height above runway elevation by which a go-around must be initiated, unless adequate visual reference has been established and the aircraft's position and approach path have been assessed as satisfactory to continue safely. A pilot may not continue below DH without visual reference of at least a 3-light segment of the approach/runway centreline, touchdown zone, or runway edge lights.
- **Alert Height (AH)** — a height above the runway, based on the aircraft's characteristics and its fail-operational automatic landing system, above which a CAT III approach would be discontinued and a missed approach initiated if a failure occurred in a redundant part of the automatic landing system or relevant ground equipment. A failure occurring below the Alert Height is generally ignored and the approach continued.

**Runway Visual Range (RVR)** is the range over which a pilot on the runway centreline can see the runway surface markings, or the lights delineating the runway or identifying its centreline (ICAO definition).

**Fail-passive automatic landing system** — in the event of a failure there is no significant out-of-trim condition or deviation of flight path/attitude, but the landing is not completed automatically; the pilot assumes control after a failure. On Airbus aircraft since the A320, fail-passive capability is announced by **CAT 3 SINGLE** on the PFD.

**Fail-operational automatic landing system** — in the event of a failure below alert height, the approach, flare and landing can be completed by the remaining part of the automatic system (the system then operates as fail-passive). On Airbus aircraft since the A320, fail-operational capability is announced by **CAT 3 DUAL** on the PFD.

**A brief history:** on **9 January 1969**, an Air Inter Caravelle became the first aircraft in the history of civil aviation to land in actual Category IIIA conditions during a commercial flight (Lyon–Paris), the result of successful flight tests conducted since 1962.

## Pitch Trim

The horizontal stabilizer is automatically positioned to off-load any steady-state elevator deflection of more than **3 seconds**; trim rate varies with airspeed and altitude for best performance. Automatic Pitch Trim (APT) is contained within the auto flight system; out-of-trim conditions that could cause an unacceptable trim function result in disengagement, annunciated to the crew.

**Automatic Pitch Trim threshold:** if elevator position exceeds the trim threshold for more than 3 seconds, the trim coupler trims the horizontal stabilizer until elevator position is **10% below the threshold**. An out-of-trim condition is met if elevator position exceeds **3 times the trim threshold**, causing a warning to the pilots.

**Pitch trim functions:**
- **Electric trim** — the basic function, providing pitch axis stabilizing and allowing loads applied to the control column in manual flight to be overridden via the pitch trim control switches on the control wheels.
- **Automatic trim (autotrim)** — without action on the trim switch, permanently stabilizes the pitch axis and overcomes out-of-trim conditions.
- **Mach/Speed trim** — compensates the aerodynamic pitch-down tendency at high Mach number or speed.
- **Alpha trim (angle-of-attack trim)** — applies forward trim to improve aircraft resistance to stall at high angle of attack.

Generally, manual operation of the stabilizer trim system by the pilot disconnects the autopilot, since the reasoning is that if the pilot needs to trim the stabilizer manually, the autopilot is not doing its job correctly.

## Yaw Damping

Many high-speed jet aircraft with swept-back wings have the undesirable problem of **Dutch Roll** flight characteristics — an oscillatory flight condition, uncomfortable for passengers, countered by yaw dampers. A rate gyro senses the rate of yaw and sends a signal to the rudder servo, providing just enough rudder deflection to cancel the Dutch Roll before it reaches a disturbing amplitude. Dutch roll is only dampened, not eliminated.

The yaw damper system provides:
- **Dutch roll damping**
- **Turn coordination** in low-speed manual flight, to reduce sideslip induced by the turn
- **Engine failure compensation** — a rudder command counteracts sideslip during the transient induced by an engine failure

The oscillation frequency of Dutch Roll is approximately **0.25 Hz**. The Dutch roll filter is a narrow band-pass filter designed to pass only signals changing at the Dutch Roll frequency, ranging from **1/5 Hz to 1/3 Hz**; other rate-gyro outputs are filtered out before reaching the servo amplifier driving the rudder servo motor. The air data computer provides computed airspeed for gain programming to the yaw damper computer — at high CAS the correction is smoother than at low CAS. The yaw damper servo output applied to the rudder actuator is not feelable at the pilot's pedal input.

## Stability Augmentation Systems in Helicopters

No civil fixed-wing transport aircraft with inherent static instabilities has ever received flight certification, whereas helicopters routinely receive certification despite being naturally unstable, provided a good Automatic Stabilisation Equipment (ASE) or Stability Augmentation System (SAS) is installed. At hover or low speed (up to approximately 45 knots), a helicopter exhibits poor handling qualities, with interactions between longitudinal and lateral axes, control-input coupling, and inherent low-frequency instabilities. Correction movements are relatively fast and small (constant regulation), with no correction movement feedback to the steering column.

A helicopter has four main controls: **cyclic**, **collective**, **yaw pedals** and **throttle**. Moving the cyclic forward tilts the rotor blades forward, giving the thrust vector a forward component; the collective changes blade pitch to change thrust (increasing collective pitch increases thrust); the yaw pedals alter tail rotor collective pitch to counter main rotor torque; the throttle primarily controls engine power output (though in turbine/some piston helicopters a governor maintains constant engine rpm instead of a manual throttle).

The AFCS hierarchy builds from vehicle stability to an operational autopilot, dividing into an inner and outer loop:

- **SAS (Stability Augmentation System)** — the innermost level, provides rate damping, making the helicopter stable in flight. Rate or attitude gyros with a differentiator detect a disturbance, and the AFCS sends a control signal to cancel the resulting movement.
- **SCAS (Stability Control Augmentation System)** — the next level, provides control of the helicopter by "feeding the signal forward" so that a control input (pilot or autopilot command) is not damped by the SAS, avoiding a delay in responsiveness.
- **ASE (Attitude Stabilization System)** — the last level of the inner loop, maintains helicopter attitude using a rate or attitude gyro; a rate-gyro signal is integrated over time to provide a displacement, which is corrected until the previous attitude is attained.
- **Autopilot (outer loop, lowest level)** — maintains airspeed, altitude and sideslip according to levels set by the operational autopilot.
- **Operational autopilot (outermost level)** — carries out higher-level functions such as coordinating manoeuvres (e.g. hover-to-forward-flight transition) and point-to-point navigation.

The common parts of a typical auto flight system include: the Autopilot Computer; the Autopilot Control Unit; the Attitude Direction Indicator (ADI); rate gyros for sensing fast turn movements; accelerometers for sensing accelerations; and servomotors/actuators in each of the primary controls (roll, pitch, yaw and collective/power axis).

## Auto Throttle / Auto Thrust

The Auto Throttle System (ATS) controls engine power setting to reach and maintain a preselected speed or thrust limit, via a servo that moves the thrust levers, or an electronic signal commanding engine power through the engine control unit. The ATS operates in the following modes:

| Mode | Function |
|------|----------|
| **IAS HOLD** | Controls throttles to hold the current airspeed |
| **IAS SELECT** | Controls throttles to capture and hold the selected reference airspeed |
| **MACH HOLD** | Controls throttles to hold the current Mach number |
| **MACH SELECT** | Controls throttles to capture and hold the selected reference Mach number |
| **THRUST LIMIT/TARGET** | Controls throttles to capture and hold thrust at the thrust limit/target |
| **RETARD** | Reduces thrust at the appropriate radio altitude during the landing flare mode |
| **CLAMP** | Inhibits ATS control during take-off at approximately **80 knots**, without disengaging the ATS; full manual throttle is available |

**Engine thrust trim** is available during both manual and automatic throttle operation, engaging any time two or more engines operate above an EPR/N1 threshold, to maintain a common thrust setting and eliminate the need for manual throttle adjustments.

**MD-11 example:** a single or duplex throttle system drives the throttle quadrant via a thrust control slip clutch; manual operation of the levers is always possible, and throttle position is transmitted as thrust demand to the FADEC.

**A320/A330/A340/A380 example:** thrust control is provided by the Electronic Engine Control (EEC) dedicated to each engine; thrust selection is via the thrust levers in manual or automatic mode, while the Auto Flight System provides the thrust rating limit according to thrust lever position. The maximum allowable engine thrust is a function of: selected flight mode (take-off, take-off flexible for a derated take-off, go-around, maximum continuous, climb, cruise); ambient conditions (Ram/Total Air Temperature, airspeed, altitude); and bleed-air demand for anti-ice and air conditioning. The thrust limit is shown as EPR-limit or N1-limit depending on engine type. TO-Flexible thrust is used for noise abatement, environmental and engine-protection reasons, using an assumed temperature higher than the actual outside air temperature for the derated take-off thrust computation. When auto thrust is engaged, the target thrust from the flight management system is lower than the limit thrust computed by the electronic engine control, giving a more economical flight.

## Warnings and Flight Envelope Protection

Modern flight guidance systems cover warnings for: stall, altitude alert, wind shear, flight envelope protection, and autopilot failure/disengage.

**Stall:** caused by separation of airflow from the wing's upper surface, resulting in a rapid decrease in lift. For a given aircraft, a stall always occurs at the same angle of attack, regardless of airspeed, flight attitude or weight. As angle of attack increases, the lift coefficient (CL) increases up to a peak — the point of maximum lift, called **CLmax**; beyond this angle, lift decreases rapidly and the wing stalls.

**Stall sensor:** an electrically operated stall warning system uses a small vane mounted near the stagnation point at the wing's leading edge. In normal flight the airflow over the vane is downward and the vane is held down, with its electrical switch open. As angle of attack increases toward a stall, the stagnation point moves down until airflow over the vane becomes upward, blowing the vane up and closing the switch, triggering a red warning light and/or warning horn.

**Angle of Attack (AOA) sensor:** a vane sensing the angle between the airflow and the aircraft's longitudinal axis, used for static source error correction, stall warning/protection and other avionics.

**Stall warning:** activation is a function of angle of attack and flap/slat/horizontal stabilizer position. Increasing angle of attack activates stick shakers at both control columns to indicate a pre-stall condition; at stall, an aural warning and visual (STALL) indication are given.

**Stall prevention:** a **stick pusher** activates to push the control column forward, remaining active until stall warning conditions are no longer met or it is manually disengaged; **autoslat extension** automatically controls slats to the correct position to prevent a deep stall.

**Altitude alert:** visual and aural alerts trigger when the aircraft deviates from, or approaches, a selected altitude, comparing the selected altitude with the current altitude from the air data computer or the altitude hold reference. The entry alert resets when the aircraft leaves the entry alert area or a new altitude is selected; the exit alert resets when the aircraft returns within the alert area or a new altitude is selected.

**Wind shear** is a strong horizontal or vertical wind shift acting at right angles to the wind direction, normally associated with a front's passage; it can be dangerous when an aircraft flies through one while slowed for landing or immediately after take-off. A **microburst** is a localized, extremely high-intensity column of descending air, with downward velocity extreme enough to slam a slow-flying aircraft near the ground into it before it can fly out. Comparing airspeed from the air data computer with groundspeed from the inertial reference system reveals wind information; any change in wind means wind shear. The Windshear Alert and Guidance System (WAGS) provides detection, alerting and guidance: on take-off it is available from **80 kts to 1500 feet** radio altitude; on landing from **1500 feet to 50 feet** radio altitude.

**Flight envelope protection (Airbus example):** computes aircraft weight, centre of gravity, alpha floor acquisition, wind shear conditions, operational speed, and lateral asymmetry due to engine failure. Speeds generated by the Flight Augmentation Computer (FAC) and displayed on the PFD speed scale include: maximum selectable speed; speed trend; slat retraction speed; flap retraction speed; lowest selectable speed; and stall warning speed, plus an alpha-floor signal for protection against high angle of attack. Specific speeds include:
- **F Speed** — minimum flap retraction speed.
- **S Speed** — minimum slat retraction speed.
- **VLS** — lowest selectable speed, giving a safety margin against stalling and buffeting.
- **VMAN (Green Dot)** — a manoeuvring speed, function of weight, altitude and number of running engines; the optimum speed in the event of one engine failure.
- **VMAX** — the maximal speed, corresponding to VMO/MMO, used to prevent excessive speed.
- **VFEN** — the predictive maximum flap/slat extended speed at the next slat/flap position.
- **VCTREND** — represents airspeed tendency (acceleration/deceleration), computed as the speed the aircraft would reach 10 seconds later if acceleration remained constant.

**Auto flight failure warnings:** master warning lights illuminate red with a "cavalry charge" sound if the autopilot disengages due to a system failure or manual disengagement; master caution lights illuminate amber with a single chime for an auto-flight failure not causing complete disengagement. A triple-click sound indicates the autoland category has been downgraded (CAT3/CAT2), and a C-chord sounds for altitude alerting.

## Fault Isolation and Test

Advanced digital flight guidance aircraft integrate test and maintenance devices to assist troubleshooting, via a dedicated status/test panel or through the Multipurpose Control and Display Units (MCDU).

**AFS Maintenance Panel — Status/Test Panel (STP):** the primary Digital Flight Guidance System (DFGS) troubleshooting tool, providing two-way communication with the Built-In Test system (BIT) and three functions:

- **Flight Fault Review** — reads failures logged during flight, in a first-in/last-out method (the most recent failure is read out first); has enough memory to log about **350 failures**, erasable via the Maintenance Memory Erase feature.
- **Return To Service Test (RTS)** — a fast, comprehensive system recheck run after line maintenance, requiring operator interaction and taking **less than 5 minutes**; concludes with a "GO" message (the system, including fail-passive CAT IIIA autoland, is fully capable) or "NO-GO" (one or more failures detected, with the affected system displayed).
- **Maintenance Test** — an extensive troubleshooting test, structured to isolate DFGS failures using forward space, back space and verify push buttons.

**Fault Isolation Detection System (FIDS):** a card physically located inside each Flight Management Guidance and Envelope Computer (FMGEC), connected to the BITEs of the various AFS computers and serving as the system BITE, linked in acquisition and reception to the Centralized Maintenance Computers (CMCs). It receives and interprets commands from the CMC, requests complementary BITE information, receives and manages malfunction reports, and generates a consolidated fault message to the CMC. It has two modes: **NORMAL MODE** (stores AFS failure data in non-volatile memory and transmits it to the CMC) and **MENU MODE** (transmits menus/submenus per operator selection on the MCDU, available only on the ground when the CMC allows System Report Test access). BITE tests performed by the FMGC/FMGEC are the power-up test, the MCDU test, and the in-operation test.
        $cnt$,
        3
    ) RETURNING id INTO s1_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M13.3 Automatic Flight (28 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s1_id, 'Which of the following correctly matches an aircraft axis to its associated type of movement?',
     '[{"id":"a","text":"X-axis (longitudinal) = roll axis; Z-axis (vertical) = yaw axis","correct":true},{"id":"b","text":"X-axis (longitudinal) = yaw axis; Y-axis (lateral) = roll axis","correct":false},{"id":"c","text":"Y-axis (lateral) = yaw axis; Z-axis (vertical) = pitch axis","correct":false}]',
     '{"B2"}'),

    (s1_id, 'In the context of automatic flight control mathematical functions, integrating produces an output that:',
     '[{"id":"a","text":"Is the sum of all inputs, e.g. acceleration integrated gives rate, and rate integrated gives displacement","correct":true},{"id":"b","text":"Is proportional to the rate of change of the input only","correct":false},{"id":"c","text":"Cancels out all inputs to zero over time","correct":false}]',
     '{"B2"}'),

    (s1_id, 'Differentiating, as a mathematical function used in automatic flight control systems, produces an output that is:',
     '[{"id":"a","text":"The sum of all inputs over time","correct":false},{"id":"b","text":"Proportional to the rate of change of the input, e.g. displacement differentiated gives rate, and rate differentiated gives acceleration","correct":true},{"id":"c","text":"Independent of the input signal entirely","correct":false}]',
     '{"B2"}'),

    (s1_id, 'Among the primary flight controls, the elevator:',
     '[{"id":"a","text":"Steers around the roll axis, causing a heading change","correct":false},{"id":"b","text":"Steers around the pitch axis, causing an altitude rate change","correct":true},{"id":"c","text":"Steers around the yaw axis, assisting the aileron","correct":false}]',
     '{"B2"}'),

    (s1_id, 'A feedback control system consists of five basic components: input, process being controlled, output, sensing elements, and:',
     '[{"id":"a","text":"Controller and actuating devices","correct":true},{"id":"b","text":"A secondary redundant computer only","correct":false},{"id":"c","text":"A synchronization relay only","correct":false}]',
     '{"B2"}'),

    (s1_id, 'If a transient signal causes a control system to overcorrect first in one direction and then in the opposite direction, this undesirable phenomenon is called:',
     '[{"id":"a","text":"Synchronization","correct":false},{"id":"b","text":"Hunting","correct":true},{"id":"c","text":"Flare","correct":false}]',
     '{"B2"}'),

    (s1_id, 'The most common corrective measure taken against hunting in a control system is the addition of:',
     '[{"id":"a","text":"Damping","correct":true},{"id":"b","text":"A second autopilot channel","correct":false},{"id":"c","text":"A stick pusher","correct":false}]',
     '{"B2"}'),

    (s1_id, 'When the autopilot is disengaged and the pilot is manually flying the aircraft, the mode in which the summing point output is fed back to wash out any built-up signal to the servo is called:',
     '[{"id":"a","text":"Synchronization","correct":true},{"id":"b","text":"Flight envelope protection","correct":false},{"id":"c","text":"Mode annunciation","correct":false}]',
     '{"B2"}'),

    (s1_id, 'Why must a disengaged autopilot always remain electrically powered and functionally operative?',
     '[{"id":"a","text":"Because it must continuously synchronize with the actual aircraft attitude, to allow engagement at any time without jerking movements","correct":true},{"id":"b","text":"Because it is required to power the yaw damper at all times","correct":false},{"id":"c","text":"Because EASA regulations require continuous engine thrust trim","correct":false}]',
     '{"B2"}'),

    (s1_id, 'A system becomes fail-passive by using:',
     '[{"id":"a","text":"Two different computers for monitoring multiple channels and multiple feedbacks","correct":true},{"id":"b","text":"A single sensor of a single kind, monitored by the crew","correct":false},{"id":"c","text":"A stick pusher connected directly to the elevator","correct":false}]',
     '{"B2"}'),

    (s1_id, 'A quadruple-channel fail-operational automatic flight control system, giving the aircraft continued fail-operational status after a single failure, is exemplified by which aircraft?',
     '[{"id":"a","text":"Boeing 747 and Fokker 100 (triple configuration)","correct":false},{"id":"b","text":"MD-11 and Airbus A320/A330/A340 (quadruple configuration)","correct":true},{"id":"c","text":"DC-9 (analogue single-channel system)","correct":false}]',
     '{"B2"}'),

    (s1_id, 'According to the definitions of redundant modes, the extra (redundant) equipment of an auto-flight system is genuinely in use in which modes?',
     '[{"id":"a","text":"Take-off, Land and Go-Around only","correct":true},{"id":"b","text":"Cruise and Level Change only","correct":false},{"id":"c","text":"All modes equally, without exception","correct":false}]',
     '{"B2"}'),

    (s1_id, 'Comparing serie mode and parallel mode of an autopilot servo applied to the rudder function, which statement is correct?',
     '[{"id":"a","text":"Serie mode gives small deflections up to about ±6° with no feelable pedal feedback (used for yaw damper in cruise); parallel mode gives large deflection authority up to 25° with the pedals moving accordingly (used for take-off, land, go-around)","correct":true},{"id":"b","text":"Serie mode gives large deflections up to 25° with pedal movement; parallel mode gives small deflections up to 6° with no pedal movement","correct":false},{"id":"c","text":"Both serie and parallel modes always move the rudder pedals identically","correct":false}]',
     '{"B2"}'),

    (s1_id, 'Control Wheel Steering (CWS) provides lateral and vertical stability through electronic control of ailerons and elevators, and is available when:',
     '[{"id":"a","text":"The flight control computer is operational but the autopilot is not engaged","correct":true},{"id":"b","text":"Only when the aircraft is on the ground with engines stopped","correct":false},{"id":"c","text":"Only during an automatic Category IIIA landing","correct":false}]',
     '{"B2"}'),

    (s1_id, 'During the take-off roll, which of the following speeds is defined as the Take-Off Safety Speed?',
     '[{"id":"a","text":"V1","correct":false},{"id":"b","text":"VR","correct":false},{"id":"c","text":"V2","correct":true}]',
     '{"B2"}'),

    (s1_id, 'During an automatic ILS approach, the Align phase and Flare phase are engaged automatically at approximately which radio altitudes respectively?',
     '[{"id":"a","text":"150 feet (align) and 50 feet (flare)","correct":true},{"id":"b","text":"400 feet (align) and 150 feet (flare)","correct":false},{"id":"c","text":"30 feet (align) and 10 feet (flare)","correct":false}]',
     '{"B2"}'),

    (s1_id, 'Decision Height (DH), as defined for CAT II/CAT III operations, is:',
     '[{"id":"a","text":"The wheel height above runway elevation by which a go-around must be initiated unless adequate visual reference has been established and the approach assessed as safe to continue","correct":true},{"id":"b","text":"A fixed height of exactly 50 feet at which the flare mode always engages","correct":false},{"id":"c","text":"The height at which the ROLLOUT submode is always engaged","correct":false}]',
     '{"B2"}'),

    (s1_id, 'On Airbus aircraft since the A320, a fail-operational automatic landing capability (where the approach, flare and landing can be completed after a failure below alert height) is announced on the PFD by the display of:',
     '[{"id":"a","text":"CAT 3 SINGLE","correct":false},{"id":"b","text":"CAT 3 DUAL","correct":true},{"id":"c","text":"CAT 1 ONLY","correct":false}]',
     '{"B2"}'),

    (s1_id, 'When the crew selects Heading Hold mode while the aircraft is in a roll, the AFCS will first:',
     '[{"id":"a","text":"Level the aircraft off before holding the existing heading","correct":true},{"id":"b","text":"Immediately capture the heading that was selected on the flight mode panel","correct":false},{"id":"c","text":"Disengage the autopilot entirely","correct":false}]',
     '{"B2"}'),

    (s1_id, 'Automatic Pitch Trim (APT) begins trimming the horizontal stabilizer when the elevator position exceeds the trim threshold for more than 3 seconds, and continues trimming until the elevator position is:',
     '[{"id":"a","text":"10% below the threshold","correct":true},{"id":"b","text":"Exactly at zero deflection","correct":false},{"id":"c","text":"3 times the threshold","correct":false}]',
     '{"B2"}'),

    (s1_id, 'Which pitch trim function applies forward trim to improve aircraft resistance to stall at high angle of attack?',
     '[{"id":"a","text":"Electric trim","correct":false},{"id":"b","text":"Mach/Speed trim","correct":false},{"id":"c","text":"Alpha trim","correct":true}]',
     '{"B2"}'),

    (s1_id, 'The yaw damper system counteracts Dutch Roll, an oscillatory flight condition whose frequency is approximately:',
     '[{"id":"a","text":"0.25 Hz","correct":true},{"id":"b","text":"25 Hz","correct":false},{"id":"c","text":"2.5 Hz","correct":false}]',
     '{"B2"}'),

    (s1_id, 'In the helicopter Automatic Flight Control System hierarchy, which is the innermost level, providing basic rate damping to make the helicopter stable in flight?',
     '[{"id":"a","text":"SAS (Stability Augmentation System)","correct":true},{"id":"b","text":"The operational autopilot","correct":false},{"id":"c","text":"SCAS (Stability Control Augmentation System)","correct":false}]',
     '{"B2"}'),

    (s1_id, 'The Auto Throttle System (ATS) CLAMP mode:',
     '[{"id":"a","text":"Inhibits ATS control during take-off at approximately 80 knots without disengaging the ATS, while leaving full manual throttle available","correct":true},{"id":"b","text":"Permanently locks the throttles at maximum continuous thrust","correct":false},{"id":"c","text":"Is only used during the landing flare to retard thrust to idle","correct":false}]',
     '{"B2"}'),

    (s1_id, 'For a given aircraft, a stall occurs:',
     '[{"id":"a","text":"Always at the same angle of attack, regardless of airspeed, flight attitude or weight","correct":true},{"id":"b","text":"Only above a fixed indicated airspeed regardless of angle of attack","correct":false},{"id":"c","text":"Only when weight exceeds maximum landing weight","correct":false}]',
     '{"B2"}'),

    (s1_id, 'A microburst, as described in relation to wind shear, is best characterised as:',
     '[{"id":"a","text":"A localized, extremely high-intensity column of descending air","correct":true},{"id":"b","text":"A steady horizontal wind that blows parallel to the runway","correct":false},{"id":"c","text":"A slow, gentle rise in ambient temperature near the ground","correct":false}]',
     '{"B2"}'),

    (s1_id, 'The Flight Fault Review function of the Status/Test Panel (STP) has enough memory to log approximately how many failures, read out in first-in/last-out order?',
     '[{"id":"a","text":"35 failures","correct":false},{"id":"b","text":"350 failures","correct":true},{"id":"c","text":"3,500 failures","correct":false}]',
     '{"B2"}'),

    (s1_id, 'The Return To Service Test (RTS), run after line maintenance, is a fast comprehensive system recheck that:',
     '[{"id":"a","text":"Takes less than 5 minutes and concludes with a \"GO\" or \"NO-GO\" result","correct":true},{"id":"b","text":"Takes several hours and requires removal of the flight control computers","correct":false},{"id":"c","text":"Can only be performed in flight above 10,000 feet","correct":false}]',
     '{"B2"}');

END $$;
