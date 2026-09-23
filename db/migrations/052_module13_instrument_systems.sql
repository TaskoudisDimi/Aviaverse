-- Module 13: Aircraft Aerodynamics (B2) — Instrument Systems (ATA 31)
-- Source: EASA Part-66 Module 13 official textbook (IKAROS Aviation Training Centre, IK M13, Issue Oct.2012)
-- This module is B2-ONLY.

DO $$
DECLARE
    m13_id INT;
    s1_id  INT;
BEGIN
    SELECT id INTO m13_id FROM easa_modules WHERE code = 'M13';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M13.8') THEN
        RAISE NOTICE 'M13.8 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 13.8: Instrument Systems
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m13_id, 'M13.8', 'Instrument Systems',
        $cnt$
# Instrument Systems (ATA 31)

## Position Transmitting — Signal Types

Devices used for position and parameter transmission in instrument systems produce one of three basic signal types:

- **AC or DC ratio signals** — a signal with a variable amplitude or level, controlled by a parameter such as speed or angular displacement. **Potentiometers, synchros, RVDTs/LVDTs and rate generators** are examples of devices producing ratio signals. A simple ratio signal can be shown with a **moving coil meter**; where more torque is needed, a **servo system** is used instead.
- **Variable resistance signals** — a device whose resistance is controlled by a parameter such as temperature, rotation or pressure, varying between a high and low value that depend on the type and range of the resistor.
- **Variable frequency signals** — a device with a variable output frequency, controlled by a parameter such as a control voltage, a variable capacitor or a variable resistor. Frequency counters, microprocessor systems and special moving-coil meters work with these signals. A **vibrating diaphragm transducer** used inside air data computers is an example: its resonant frequency increases with applied pressure against a vacuum reference, and the output frequency (proportional to pressure) is easily converted to a digital signal; a temperature-sensing resistor compensates for ambient temperature effects.

## Synchros and Resolvers

### Control Transformer

A transformer has a primary and a secondary coil. The primary coil, excited by an AC voltage, produces a continuously changing magnetic flux in the iron core; this induces an alternating voltage in the secondary coil. Depending on the relative rotation between primary and secondary:

- **Aligned (0°)** — output has the same phase angle as the input.
- **90° rotated** — no flux through the secondary; output is null.
- **180° rotated** — output phase angle is opposite to the input.
- **270° rotated** — output is also null.

Positions between these four cardinal positions change the **amplitude** of the output, not its phase angle.

### Synchros

A typical synchro has a **rotor and three stator coils**, the stator coils spaced at **120 degrees** with respect to each other — the unit behaves like three control transformers in one. Synchros are excited with **26 V AC or 115 V AC** on the rotor. This magnetic field induces voltages in the stator coils that are in-phase or 180° out-of-phase with each other, depending on the angle between rotor and each stator coil.

In a synchro system, the three output signals of a **synchro transmitter** are connected to a **synchro receiver**. The field made by the transmitter rotor is repeated in the stator of the receiver; the receiver rotor field is made 180° out of phase with the transmitter's field, and the receiver rotor then follows any change in position of the transmitter rotor.

### Servo Systems

The rotor of a synchro receiver gives limited torque. When more torque is needed, a **synchro-servo system** is used: the receiver rotor signal drives a servo amplifier, which drives a motor; the motor drives, via a reduction gear, the rotor of the synchro receiver and a load. The output signal of the rotor is zero when the angle between rotor and stator field is **90 degrees** — this is the position the servo drives to.

Some synchro receivers have **two rotor windings at 90 degrees** to each other so failures (transmitter supply failure, broken rotor wire) can be detected: when the rotor is correctly positioned, one coil's output is zero and the other's is maximum. A **continuity detector** monitors both signals and enables a valid signal (e.g. to a flag) when the system is working properly.

### Differential Synchros

A differential synchro has **three coils in the rotor and three in the stator**, both at 120° spacing, and can **add or subtract angles**. Turning its rotor left or right adds or subtracts that angle from the stator field angle. Differential synchros are used, for example, to let a pilot manually synchronize a slaved compass system by adjusting the directional gyro output signal relative to the flux valve signal.

### Resolvers

A resolver has **two stator coils and a rotor coil**, with the rotor and stator coil pairs at **90 degrees** to each other. A resolver converts the signals in the stator coils into **sine and cosine signals**, and can be used as an angular transmitter or as a phase-angle shifter over 0–360°.

## LVDT and RVDT

### Linear Variable Differential Transducer (LVDT)

An LVDT changes **linear position information into electrical signals**. It has: one primary coil, a linear moveable iron core, and **two series-connected secondary coils**. As the mechanical input moves the core, magnetic coupling changes: one secondary coil receives more flux (higher induced voltage), the other less (lower voltage). The **difference** between the two secondary voltages is proportional to the mechanical position, and its phase indicates the direction of core movement.

- Core centred → coupling is equally divided → output voltage is **zero**.
- Core moved one way → output increases, **in phase** with excitation.
- Core moved the other way → output increases, **opposite phase** to excitation.

The AC output must be **phase-dependent demodulated** (synchronous demodulator) to drive a pointer: with no input signal the indicator shows zero; deflection to one side or the other depends on which half-cycle of the reference voltage passes the electronic switch during core displacement.

### Rotary Variable Differential Transducer (RVDT)

An RVDT changes **angular position information into electrical signals**. It has: a primary stator coil, an iron rotor core, and two secondary stator coils. Operation is analogous to the LVDT but senses rotation rather than linear displacement — the voltage difference between the two secondary coils is an **AC ratio signal** proportional to the rotated angle, with the direction of rotation shown by the phase.

## Servo Motors and Tachometer (Rate) Generators

### Two-Phase Servo Motor

The AC two-phase induction servo motor has a stator with **two fields at right angles**, a fixed field and a variable field.

- With a 400 Hz voltage at 0° on the variable field and a 400 Hz voltage at 90° on the fixed field (via a capacitor shifting the fixed-field voltage by 90°), the resulting rotating field drags the rotor with it (**counter-clockwise rotation**).
- Reversing the phase of the variable signal reverses the direction of rotation (**clockwise**).
- **Direction** of rotation depends on the **phase** of the variable signal; **speed** of rotation depends on its **amplitude**.
- **Braking**: disconnecting either field stops the field from rotating, holding the rotor in a fixed position.

### Tachometer / Rate Generator

A tachometer generator (rate generator) produces an output **in phase or opposite phase** with the excitation, at **400 Hz**, with amplitude proportional to rotor speed. With the fixed field perpendicular to the variable field and the rotor stationary, there is no transformer action and no output. As the rotor turns, it drags the magnetic field with it — faster rotation displaces the field further from perpendicular, producing a larger output voltage; the **output frequency stays at 400 Hz regardless of rotor speed**, while output amplitude is a direct function of speed, and phase indicates direction of rotation. Rate generators commonly provide **inverse (rate) feedback** in servo loops for speed limiting and smoothing, preventing overshoot and oscillation as the servo reaches its final position.

## Pressure Measuring Instruments

Pressure is force per unit area, measured from a known reference:

| Reference | Definition |
|---|---|
| **Absolute pressure** | Measured from zero pressure (a vacuum) |
| **Gage pressure** | Measured from the existing atmospheric (barometric) pressure |
| **Differential pressure** | The difference between two pressures |

- **Absolute pressure instruments (aneroid)** use a sealed, evacuated, concentrically corrugated metal capsule. As air pressure increases the capsule thickness decreases (and vice versa); a rocking shaft, sector gear and pinion multiply this movement to drive a pointer.
- **Bourdon tube** — a flattened, thin-wall bronze tube formed into a curve, sealed at one end. Rising internal pressure tries to change its cross-section from flat to round, straightening the curve and moving a sector/pinion gear linkage. Used for relatively **high** pressures such as engine lubricating and hydraulic systems.
- **Bellows** — expands with increasing pressure, rotating a rocking shaft and sector gear. Used for **lower** pressures such as instrument air, deicer air pressure and suction.
- **Differential bellows** — can measure absolute, differential or gage pressure. As a fuel pressure gage, one bellows senses carburettor inlet air pressure and the other senses fuel pressure; for gage pressure, one bellows is left open to atmosphere.
- **Strain gages** — electrical passive devices whose resistance varies with applied force; the sensing wire is a chrome-nickel alloy. Expanding force **increases** resistance, shortening force **decreases** it. Used for structure monitoring, force sensing, pressure transducers and weight measurement — inside a pressure sensor, pressure is first converted to force.
- **Piezo-resistive sensors** — P- or N-conducting elements diffused into a pure silicon substrate; this piezo-resistive effect gives much higher sensitivity than a metallic strain gage. A typical substrate example given is 3.5 × 3.5 mm with a 4-element bridge inside.

## Temperature Indication

Operational temperatures range from well below freezing (outside air, fuel, oil, air-conditioning/pneumatic air) to around **1000°C** for exhaust gas temperatures.

### Non-Electrical Methods

- **Bimetallic strip** — two metals of different expansion coefficients welded together and twisted into a helix; used e.g. in a simple outside-air-temperature gauge. When heated, one strip expands more than the other and the spiral tries to straighten, moving a pointer.
- **Gas expansion (vapour-pressure) thermometer** — a thin-wall metal bulb filled with a volatile liquid (e.g. **methyl chloride**) is connected via a capillary tube to a **Bourdon tube**; temperature is inferred from the vapour pressure above the liquid, which the Bourdon tube senses and displays via a linkage.

### Electrical Resistance Methods

- **NTC (Negative Temperature Coefficient)** resistors — resistance **decreases** with increasing temperature ("Heissleiter").
- **PTC (Positive Temperature Coefficient)** resistors — resistance **increases** with increasing temperature ("Kaltleiter").
- A typical nickel-chrome resistance temperature bulb has approximately **20 ohms** resistance at the low end of its range and about **200 ohms** at the high end.
- **Ratiometer circuits** — two coils on the indicator needle; the balance of current through the temperature-sensing bulb versus a fixed resistor determines needle deflection, minimizing error from supply voltage variation.
- **Wheatstone bridge circuits** — a temperature probe forms one variable-resistance arm of the bridge. When the ratio of resistances balances, no current flows through the indicator (**balanced bridge**); as the probe's resistance changes with temperature, the bridge unbalances and current flows through the indicator, proportional to the imbalance.

### Thermocouples

A thermocouple is a loop of two dissimilar wires (e.g. **chromel and alumel**) welded together at a **hot (measuring) junction**; the current-measuring instrument forms a **cold (reference) junction**. The voltage produced is proportional to the temperature difference between the hot and cold junctions, driving a current proportional to the measured temperature. Used for higher temperatures such as reciprocating-engine cylinder head temperature (hot junction held in the spark plug gasket) and, with several thermocouples arranged around the exhaust, turbine engine **EGT (Exhaust Gas Temperature)**. Because the reference-junction temperature cannot practically be held constant on an aircraft, the EGT indicator needle is mounted on a **bimetallic hairspring** that compensates for cockpit (reference junction) temperature changes.

## Quantity Indicating Systems

### DC Electrical (Resistive Float) Indicators

A common fuel/oil quantity system uses direct current with a variable resistor as the tank unit: a wiper arm driven by a float moves across a resistance element as fuel level changes. A **ratio meter** type indicator minimizes error from system voltage variation.

### Capacitance Fuel Quantity System

This electronic system measures the **mass** of fuel (not just level) via the **capacitance** of tank probes. A capacitor's capacity depends on plate area, plate separation, and the dielectric constant of the material between the plates. Tank probes are two concentric metal tubes spanning the tank top-to-bottom:

- Tank **empty** → dielectric is air, dielectric constant of approximately **one**.
- Tank **full** → dielectric is fuel, dielectric constant of approximately **two**.
- Partially full → part air, part fuel, so probe capacitance varies with fuel level.

A **compensator**, installed in parallel with the probes at the bottom of one tank unit, cancels changes in the fuel's dielectric constant caused by temperature variation. The system operates as a **capacitance bridge**: when the tank probe capacitance changes, the bridge unbalances, an amplifier drives a **two-phase servo motor** that repositions a balancing potentiometer and the pointer until the bridge rebalances, with the pointer indicating fuel weight (kg or lb). Calibration uses separate **Empty** and **Full** calibrating potentiometers.

### Digital Fuel Quantity Indication

Digital systems still use capacitance probes; a processor converts capacitance into fuel weight. A typical indicator contains a power supply, probe driver, analog-to-digital converter and processor, combining a digital read-out with an analog pointer. A **densitometer** senses fuel density for weight determination, and an **aircraft attitude signal** compensates for the influence of pitch and roll angles on indicated quantity.

## Air Data Systems

The pilot-static system determines **static pressure**, **total (pitot) pressure**, and **total (ram) air temperature**, from which instruments/computers derive **altitude, vertical speed, velocity and temperature**.

### ISA Basics for Air Data

- Pressure decreases with altitude at a **non-linear** rate; at sea level, pressure decreases by approximately **1 hPa every 28 feet**.
- Temperature in the troposphere decreases roughly linearly at about **2°C per 1,000 ft**; standard sea-level temperature is **15°C**. Above the tropopause (about 36,000 ft) temperature remains constant (stratosphere).

### Air Data Sensors

- **Pitot tube** — an approximately **6 mm** inside-diameter tube pointed into the relative airflow, picking up ram air pressure for the airspeed indicator; electrically heated to prevent icing.
- **Static probe** — small holes on the fuselage/fin or in a pitot-static head sense still (static) air pressure, fed to the case of the altimeter, ASI and VSI.
- **Combined pitot-static probe** — total/impact pressure taken at the front of the head; static pressure taken through holes/slots in the sides and bottom.
- **Total Air Temperature (TAT) probe** — contains a temperature-dependent (platinum) resistor with a linear positive temperature coefficient over its range; the probe is heated against icing.
- **Air Data Module (ADM)** — converts pitot or static pressure into a digital output signal, transmitted in **ARINC 429** format to the air data computer.

### Altimeters

An altimeter is a barometer measuring absolute air pressure, calibrated to indicate altitude. Because the pressure lapse rate is not linear with altitude, altimeter capsules use corrugations designed to give a linear response to altitude change. A barometric scale (set via a knob) can be calibrated in inches of mercury, millibars or hectopascals.

| Setting | Reference | Result |
|---|---|---|
| **QNH** | Local sea-level pressure | **Indicated altitude** — altitude above mean sea level; reads field elevation on the ground |
| **QNE / STD** | Standard pressure, **29.92 in Hg / 1013.25 hPa** | **Pressure altitude / Flight Level** — a constantly changing reference shared by all aircraft at high level for vertical separation |
| **QFE** | Local field (airfield) pressure | **Height above ground** — reads zero on landing; seldom used today, largely replaced by radio altimeters |

- **Altitude** = vertical distance between aircraft and sea level (barosetting QNH).
- **Height** = vertical distance between aircraft and terrain (barosetting QFE).
- **Flight Level** = vertical distance between aircraft and the standard pressure reference (barosetting QNE); e.g. Flight Level 320 = 32,000 ft pressure altitude.
- **Elevation** = vertical distance from sea level to the airport or an obstacle.

Older three-pointer altimeters (100 ft / 1,000 ft / 10,000 ft pointers, range up to 20,000–80,000 ft) were prone to misreading; modern instruments use a drum + single pointer display. **Encoding altimeters** send a digital code to the radar beacon transponder for ATC read-out. **Position error** (static port not in fully undisturbed air) varies with airspeed and altitude; a **servo altimeter** has built-in compensation tailored to the aircraft type. Instrument (mechanical) error testing includes: scale error, hysteresis, after-effect, friction, case leak, and barometric scale error.

### Vertical Speed Indicator (VSI)

A bellows/pressure capsule is vented to the instrument case through a **calibrated leak (diffuser)**. As the aircraft climbs, capsule pressure falls faster than case pressure (which leaks down through the diffuser), producing a pressure difference proportional to rate of altitude change; the difference vanishes (indicating zero rate) once the aircraft levels off. An **Instantaneous VSI (IVSI)** adds an accelerometer-operated air pump across the capsule to give an immediate indication at the start of a climb or descent, eliminating the lag of a conventional VSI.

### Airspeed Indicators

An ASI is a differential pressure gauge measuring the difference between pitot (total) pressure and static pressure via a capsule; if airspeed is zero, pitot pressure equals static pressure.

| Term | Meaning |
|---|---|
| **IAS** | Indicated Airspeed — the raw, uncorrected ASI reading |
| **CAS** | Calibrated Airspeed — IAS corrected for static-port position/installation error |
| **TAS** | True Airspeed — CAS corrected for temperature and altitude |
| **GS** | Groundspeed — TAS adjusted for wind (headwind decreases GS, tailwind increases it) |

- **1 knot (kt) = 1 nautical mile (NM) per hour**; **1 NM = 1.852 km** (1 NM is 1 arc-minute along a great circle).
- The Mach number increases if the aircraft **climbs at constant TAS**, because the speed of sound decreases as outside temperature decreases.
- Aircraft limited by structural considerations mark **never-exceed speed** with a fixed red line; aircraft limited by **critical Mach number** instead use a red pointer ("barber pole") driven as a function of altitude, since the Mach-equivalent IAS changes with altitude.
- **Vmo/Mmo overspeed warning** alerts the crew if the maximum operating limit speed or Mach number is exceeded; the warning can be triggered by an overspeed warning switch, the mach/airspeed indicator, or the air data computer.
- A **Mach meter** compares aircraft speed with the local speed of sound; below Mach 1 the value is shown as a decimal fraction, above Mach 1 as an integer with a decimal.
- **True airspeed indicators** combine the airspeed capsule with a temperature sensor and an altitude bellows to directly display TAS; electrically driven versions display TAS calculated by the air data computer.

### Air Data Computer

The air data computer samples discrete signals, total temperature, total and static pressures, baro setting and angle of attack, and distributes computed results (altitude, airspeed, TAS, Mach, etc.) to instruments, displays, and the autoflight and navigation systems.

## Gyroscopic Instruments

A gyroscope is a wheel with its mass concentrated in the rim; spun at high speed it exhibits **rigidity in space** and **precession**.

- **Rigidity in space** is used by attitude gyros (directional gyros, gyro horizons) to provide a stable reference. The Earth itself behaves as a very large gyro, maintaining its direction in space.
- **Precession**: a force applied to a spinning gyro produces its effect **90 degrees away, in the direction of rotation** — the gyro rotates about a different axis rather than toppling. Precession is undesired in directional/vertical gyros but is the working principle of **rate gyros**, since the amount of precession is proportional to the applied force.

### Types of Gyro

| Gyro | Degrees of freedom | Senses | Typical use |
|---|---|---|---|
| **Vertical Gyro (VG)** | 2 | Angular displacement from vertical (roll & pitch) | Artificial horizon / attitude indication, autopilot attitude reference |
| **Directional Gyro (DG)** | 2 | Angular displacement in the horizontal plane (heading) | Compass stabilization, autopilot heading reference |
| **Rate Gyro (RG)** | 1 | Angular rate about an axis (yaw, pitch or roll) | Turn and slip indicator, turn coordinator, autopilot |
| **Rate Integrating Gyro (RIG)** | 1 | Integral of angular rate | Platform stabilization for Inertial Navigation Systems |
| **Ring Laser Gyro (RLG)** | — | Angular rate (very high accuracy) | Inertial Reference System |

### Attitude Indicator

The vertical gyro senses pitch/roll relative to a vertical line through the Earth's centre and provides a stable pitch/bank reference. The display sky segment is typically light (blue), the ground segment dark (brown/black); bank-angle index marks are located at **10°, 20°, 30°, 60° and 90°**.

### Erection of Vertical Gyros

- **By air**: an early rotor spun by a jet of air exits through four vertical slots, half covered by pendulum valves; when the gyro tilts, unequal air escape creates a precessive force returning it to vertical.
- **Electrically driven gyros** use a gravity-sensing liquid switch (like a carpenter's level) that powers a **torquer** to erect the spin axis; a pitch erection torquer is mounted in the roll axis and a roll erection torquer in the pitch axis (erection forces must act at right angles to the desired motion). Roll erection is cut off above approximately **6°** of bank, and pitch erection is cut off above approximately **2 kt/sec²** of acceleration, to avoid erecting to a false vertical. A higher torquer voltage is applied for the **first 3 minutes** after gyro start-up for fast initial erection.
- **Ball erection system**: two steel balls on a circular track, driven by a slow transport arm; eddy-current drag reduces gyro-derived speed from about **18,000 rpm** down to about **50 rpm** for the ball drive. An out-of-balance ball position produces a precessive force that erects the gyro; the balls are mechanically blocked during turns to prevent false erection.

### Apparent Drift

A free gyro maintains its direction in space, but relative to the Earth it appears to drift due to Earth's rotation (**15° per hour**):

- **Directional Gyro** apparent drift = **15°/h × sin(latitude)**
- **Vertical Gyro** apparent drift = **15°/h × cos(latitude)**

Apparent drift is composed of: **Earth Rate** (Earth's rotation), **Transport Rate** (aircraft's own movement around the globe), and **Random Drift** (mechanical error).

### Turn and Slip / Turn Coordinator

- **Turn and slip indicator**: combines an inclinometer (a curved liquid-filled glass tube with a ball, balancing gravity against centrifugal force in a turn — centred in a correctly coordinated turn) with a rate gyro whose spin axis is parallel to the aircraft's lateral axis. A **standard rate turn** is **3°/second (360° in 120 seconds / 2 minutes)**; some instruments are calibrated as "**four-minute turn**" indicators, deflecting one needle-width at **1.5°/second** (half-standard rate).
- **Turn coordinator**: mechanically similar to the turn and slip indicator, but its gimbal axis is tilted (typically about **30°**) so the gyro precesses on roll as well as yaw — useful because it also senses the roll that initiates a turn, cancelling deflection from adverse yaw. It uses a symbolic aeroplane rather than a needle.

### Gyro Instrument Power

- **Electric motors** — used in most modern commercial aircraft gyros, running at roughly **6,000–20,000 RPM**.
- **Pneumatic (vacuum) system** — brass gyro wheels with notches/buckets in the rim are spun by an air jet, typically from a venturi or engine-driven vacuum pump; aircraft flying above **18,000 ft** need a compressor system to maintain sufficient air mass flow through the gyro. For redundancy, attitude and rate gyros may be split between electric and pneumatic power, or some instruments dual-powered.

## Compass Systems

### Earth's Magnetic Field, Variation and Deviation

The Earth acts as a huge permanent magnet; its magnetic poles are located roughly **2,000 km** from the geographic poles and move over time.

- **Variation** — the angular difference between True North (geographic) and Magnetic North; found from isogonic lines on charts, constant on any heading at a given location, and **not compensable** — only correctable by reference to charts.
- **Deviation** — the error caused by the aircraft's own magnetic fields (wiring, magnetos, alternators/generators) disturbing the compass; different on each heading flown, but does **not** change with aircraft location. Reduced using **compensator magnets**, with any residual error recorded on a deviation/compass correction card.

A compass heading is correct only if: the aircraft is level, there is no acceleration, and the reading is corrected using the deviation card.

### Magnetic Compass Construction

A simple magnetic compass has a cast aluminium housing, a **lubber line**, and a brass float (with two small bar magnets aligned north-south) riding on a jewel pivot inside a graduated dial (36 marks around 360°, each representing 10°: 0/N, 9/E, 18/S, 27/W). The housing is filled with a **hydrocarbon compass fluid** similar to kerosene, with an expansion diaphragm/bellows to accommodate thermal expansion of the fluid.

### Flux Valve and Slaved Gyro Compass

A **flux valve (flux gate)**, mounted in a low-interference location such as a wingtip or tail, has a highly permeable iron "spider" frame with **three legs at 120°**, an excitation coil at the centre, and pick-up coils on each leg. The excitation coil is driven at **400 Hz**, alternately saturating and unsaturating the spider legs so the Earth's magnetic field is alternately accepted and rejected, inducing a voltage in the pick-up coils. Because the exciter current reaches a maximum (and a null) **twice** per cycle, the Earth-field-induced signal frequency is **double** the exciter frequency, i.e. **800 Hz**. The Earth's magnetic field is treated as approximately **35 µT (0.35 Gauss)**.

This signal drives a **slaving torque motor** that precesses the directional gyro until it agrees with the flux valve heading, and the corrected heading is repeated via synchros to indicators such as the **Radio Magnetic Indicator (RMI)**, **Radio Direction Indicator (RDI)** or **Horizontal Situation Indicator (HSI)**. A **synchronization annunciator** shows a deflection while the system is not yet slaved; the pilot can manually rotate a SYN knob to speed synchronization. The normal automatic slaving rate is slow (about **2–5° per minute**), so manual synchronization is provided since large heading errors could otherwise take over an hour to resolve automatically. In some legacy layouts (e.g. an MD-80-type dual compass system), each crew member's primary and backup indications are cross-fed from **two independent compass systems** for redundancy — if both fail, both pilots read a magnetic standby compass.

Newer aircraft derive magnetic heading from the **IRS (part of the ADIRU)**, computing it from true heading using magnetic variation stored in IRS memory, eliminating the need for flux valves; a **Dual Distance Radio Magnetic Indicator (DDRMI)** can show magnetic heading sourced from different ADIRUs.

### Compass Errors

| Error | Cause | Correction |
|---|---|---|
| **Index error** | Misaligned installation of compass or flux valve | Alignment; remote compensator INDEX adjustment |
| **One-cycle error** | Magnetic fields from electric wiring or magnetized steel parts | Compensating magnets or calibrated currents through the flux valve; remote compensator N-S/E-W adjustment |
| **Two-cycle error** | Deflection of Earth's field by steel parts (e.g. screws); asymmetric cable impedance from flux valve | Non-ferromagnetic materials/brass screws nearby; remote compensator TRANSMISSION adjustment |
| **Coriolis** | Earth's rotation deflecting the compass/flux valve of a north-south moving aircraft | None — this small effect cannot be compensated |

## Flight Data Recording

The **Digital Flight Data Recorder System (DFDRS)** records mandatory flight parameters in crash-protected storage. Early recorders scratched a handful of parameters (vertical acceleration, altitude, speed, heading, time) with diamond needles into heat-resistant metal foil; modern digital recorders collect roughly **300 parameters** (versus 6–50 in earlier versions) via a **Flight Data Acquisition Unit (FDAU)** and store them for **25–50 hours** on magnetic tape or solid-state memory.

Key components:

- **Flight Data Acquisition Unit (FDAU)** — a computer collecting and converting basic aircraft system parameters, configured by pin-programming for the specific aircraft.
- **Flight Data Recorder (FDR)** — located in the rear of the aircraft, in a mechanically protected box; includes an **Underwater Locator Beacon (ULB)** on its front face.
- **Linear (three-axis) accelerometer** — installed at the aircraft **centre of gravity**, sensing acceleration along the longitudinal, lateral and vertical axes, typically via a bending strain-gauge element in a resistance bridge, or a pendulum-based sensing mass held centred by feedback current.
- **Event push button** — located on the pedestal; marks an event in the FDR memory when pressed.
- **Power interlock** — the FDR is automatically powered when an engine is started and stops **five minutes after the last engine shutdown**; ground/preflight testing is possible via a ground control push button on the overhead panel.

Typical solid-state DFDR specifications include: heat resistance of **1100°C for 30 minutes**; shock resistance of **100 G** (tape) or **3400 G for 6 ms** (solid state); saltwater-proof to **6000 m depth for one month**; and Mean Time Between Failures (MTBF) of about **7,000 hours** (tape) or **15,000 hours** (solid state).

The **Underwater Locator Beacon (ULB)** contains a mercury battery, a water-sensitive switch, an electronic timer module and a piezo-electric transducer. Once immersed in water it transmits a pulse (in the tens-of-kHz range) about once per second, with a range of about **2 miles** and an operating duration of about **30 days**.

**ADAS / AIDS / ACMS** — the Aircraft Data Acquisition System / Aircraft Integrated Data System / Aircraft Condition and Monitoring System accepts large amounts of engine and aircraft system data for ground-based analysis (troubleshooting, system engineering, procedure evaluation, flight crew sections). Data is stored on magnetic tape or optical disk, can be printed, and may be transmitted to the home base via **ACARS** on request; **MCDUs** are used to operate the system and read data.
        $cnt$,
        10
    ) RETURNING id INTO s1_id;


    -- ──────────────────────────────────────────────────────────────
    -- Questions — M13.8 Instrument Systems (24 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s1_id, 'On a control transformer, when the primary coil is rotated 90 degrees from alignment with the secondary coil, the output voltage U2 is:',
     '[{"id":"a","text":"Equal to the input voltage, in phase","correct":false},{"id":"b","text":"Null, because no magnetic flux passes through the secondary coil","correct":true},{"id":"c","text":"Opposite in phase to the input voltage","correct":false}]',
     '{"B2"}'),

    (s1_id, 'A typical synchro has a rotor and three stator coils spaced at:',
     '[{"id":"a","text":"90 degrees with respect to each other","correct":false},{"id":"b","text":"120 degrees with respect to each other","correct":true},{"id":"c","text":"180 degrees with respect to each other","correct":false}]',
     '{"B2"}'),

    (s1_id, 'A differential synchro, with three coils in both rotor and stator, is used to:',
     '[{"id":"a","text":"Add or subtract angles between two synchro signals","correct":true},{"id":"b","text":"Convert AC power to DC power only","correct":false},{"id":"c","text":"Measure absolute pressure","correct":false}]',
     '{"B2"}'),

    (s1_id, 'An LVDT (Linear Variable Differential Transducer) converts:',
     '[{"id":"a","text":"Temperature into a resistance change","correct":false},{"id":"b","text":"Linear position information into an electrical signal","correct":true},{"id":"c","text":"Angular position into a mechanical torque","correct":false}]',
     '{"B2"}'),

    (s1_id, 'In a two-phase AC servo motor, the direction of rotation is determined by:',
     '[{"id":"a","text":"The amplitude of the variable signal","correct":false},{"id":"b","text":"The phase of the variable signal","correct":true},{"id":"c","text":"The temperature of the stator windings","correct":false}]',
     '{"B2"}'),

    (s1_id, 'Absolute pressure is measured from:',
     '[{"id":"a","text":"The existing atmospheric (barometric) pressure","correct":false},{"id":"b","text":"Zero pressure, or a vacuum","correct":true},{"id":"c","text":"The difference between two other pressures","correct":false}]',
     '{"B2"}'),

    (s1_id, 'A Bourdon tube pressure instrument is typically used to measure:',
     '[{"id":"a","text":"Very low pressures such as instrument suction","correct":false},{"id":"b","text":"Relatively high pressures, such as engine lubricating and hydraulic system pressures","correct":true},{"id":"c","text":"Only absolute pressure in a sealed vacuum","correct":false}]',
     '{"B2"}'),

    (s1_id, 'A thermocouple used for exhaust gas temperature (EGT) indication produces a voltage that is proportional to:',
     '[{"id":"a","text":"The absolute temperature of the hot junction alone","correct":false},{"id":"b","text":"The difference in temperature between the hot (measuring) and cold (reference) junctions","correct":true},{"id":"c","text":"The resistance of the connecting wires only","correct":false}]',
     '{"B2"}'),

    (s1_id, 'In a capacitance-type fuel quantity system, when a tank is completely full, the dielectric between the probe plates is fuel, with a dielectric constant of approximately:',
     '[{"id":"a","text":"One","correct":false},{"id":"b","text":"Two","correct":true},{"id":"c","text":"Ten","correct":false}]',
     '{"B2"}'),

    (s1_id, 'When an altimeter''s barometric scale is set to the local QNH, the altimeter indicates:',
     '[{"id":"a","text":"Height above the airfield only","correct":false},{"id":"b","text":"Pressure altitude referenced to the standard datum","correct":false},{"id":"c","text":"Indicated altitude — altitude above mean sea level","correct":true}]',
     '{"B2"}'),

    (s1_id, 'When the barometric scale is set to standard pressure (29.92 in Hg / 1013.25 hPa), an aircraft is said to be flying at a:',
     '[{"id":"a","text":"Flight Level","correct":true},{"id":"b","text":"QFE height","correct":false},{"id":"c","text":"Radio altitude","correct":false}]',
     '{"B2"}'),

    (s1_id, 'The Instantaneous Vertical Speed Indicator (IVSI) improves on a conventional VSI mainly by:',
     '[{"id":"a","text":"Eliminating the diffuser leak entirely","correct":false},{"id":"b","text":"Using an accelerometer-operated air pump to give an immediate indication and reduce lag","correct":true},{"id":"c","text":"Measuring true airspeed instead of vertical speed","correct":false}]',
     '{"B2"}'),

    (s1_id, 'Calibrated Airspeed (CAS) is obtained from Indicated Airspeed (IAS) by correcting for:',
     '[{"id":"a","text":"Static-port position/installation error","correct":true},{"id":"b","text":"Wind drift over the ground","correct":false},{"id":"c","text":"Magnetic compass deviation","correct":false}]',
     '{"B2"}'),

    (s1_id, 'A gyroscope spinning at high speed exhibits two characteristics used in flight instruments. Which pair is correct?',
     '[{"id":"a","text":"Rigidity in space and precession","correct":true},{"id":"b","text":"Magnetism and thermal drift","correct":false},{"id":"c","text":"Resonance and damping","correct":false}]',
     '{"B2"}'),

    (s1_id, 'A Vertical Gyro (VG), used for artificial horizon / attitude indication, has how many degrees of freedom and senses what?',
     '[{"id":"a","text":"1 degree of freedom, sensing angular rate about the yaw axis","correct":false},{"id":"b","text":"2 degrees of freedom, sensing angular displacement from vertical (roll and pitch)","correct":true},{"id":"c","text":"3 degrees of freedom, sensing all three aircraft axes simultaneously","correct":false}]',
     '{"B2"}'),

    (s1_id, 'On an attitude indicator, the bank-angle index marks across the top of the instrument are typically located at:',
     '[{"id":"a","text":"10, 20, 30, 60 and 90 degrees","correct":true},{"id":"b","text":"15, 45, 75 and 105 degrees","correct":false},{"id":"c","text":"5, 10, 15 and 20 degrees only","correct":false}]',
     '{"B2"}'),

    (s1_id, 'The apparent drift of a Directional Gyro (DG) caused by the Earth''s rotation is calculated as:',
     '[{"id":"a","text":"15 degrees/hour multiplied by the sine of the latitude","correct":true},{"id":"b","text":"15 degrees/hour multiplied by the cosine of the latitude","correct":false},{"id":"c","text":"360 degrees/hour regardless of latitude","correct":false}]',
     '{"B2"}'),

    (s1_id, 'A standard rate turn, as used for a two-minute turn indicator, corresponds to a turn rate of:',
     '[{"id":"a","text":"1.5 degrees per second","correct":false},{"id":"b","text":"3 degrees per second (360 degrees in 2 minutes)","correct":true},{"id":"c","text":"6 degrees per second (360 degrees in 1 minute)","correct":false}]',
     '{"B2"}'),

    (s1_id, 'Variation, the angular difference between True North and Magnetic North, is best described as:',
     '[{"id":"a","text":"Caused by the aircraft''s own wiring and magnetized parts, and compensable with magnets","correct":false},{"id":"b","text":"Dependent on the aircraft''s position on the Earth, found from chart isogonic lines, and not compensable","correct":true},{"id":"c","text":"Identical on every heading and every location worldwide","correct":false}]',
     '{"B2"}'),

    (s1_id, 'Deviation error in a magnetic compass is caused by:',
     '[{"id":"a","text":"The distance between the geographic and magnetic poles","correct":false},{"id":"b","text":"Magnetic fields from the aircraft''s own wiring, magnetos, alternators and generators","correct":true},{"id":"c","text":"The Earth''s rotation deflecting a north-south moving aircraft","correct":false}]',
     '{"B2"}'),

    (s1_id, 'A flux valve senses the direction of the Earth''s magnetic field using a spider frame with legs spaced at:',
     '[{"id":"a","text":"90 degrees, with two legs","correct":false},{"id":"b","text":"120 degrees, with three legs","correct":true},{"id":"c","text":"60 degrees, with six legs","correct":false}]',
     '{"B2"}'),

    (s1_id, 'Of the compass errors described, which one cannot be compensated at all?',
     '[{"id":"a","text":"Index error","correct":false},{"id":"b","text":"One-cycle error","correct":false},{"id":"c","text":"Coriolis error","correct":true}]',
     '{"B2"}'),

    (s1_id, 'The Flight Data Recorder (FDR) power interlock arrangement typically means the recorder is powered:',
     '[{"id":"a","text":"Continuously, even with the aircraft fully shut down and unpowered","correct":false},{"id":"b","text":"Only during ground maintenance testing, never in flight","correct":false},{"id":"c","text":"When an engine is started, and it stops five minutes after the last engine shutdown","correct":true}]',
     '{"B2"}'),

    (s1_id, 'ADAS, AIDS and ACMS all refer to systems that:',
     '[{"id":"a","text":"Accept large amounts of engine and aircraft system data for ground-based analysis and troubleshooting","correct":true},{"id":"b","text":"Control the autopilot flight director exclusively","correct":false},{"id":"c","text":"Replace the pilot-static system on modern aircraft","correct":false}]',
     '{"B2"}');

END $$;
