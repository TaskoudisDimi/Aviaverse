-- Module 11B (Piston Aeroplanes, B1): Instruments and Avionics (Part 2)
-- Source: EASA Part-66 Module 11B official textbook (IKAROS Aviation Training Centre, IK01, Issue Oct.2012)

DO $$
DECLARE
    m11_id INT;
    s1_id  INT;
BEGIN
    SELECT id INTO m11_id FROM easa_modules WHERE code = 'M11';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M11B.6') THEN
        RAISE NOTICE 'M11B.6 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 11B.6: Instruments and Avionics (Part 2)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m11_id, 'M11B.6', 'Instruments and Avionics (Part 2)',
        $cnt$
# Instruments and Avionics (Part 2)

## Engine Instrument Systems

### Fuel Contents Gauges

Most modern aircraft have a number of fuel tanks within the wing structure, and the contents of each individual tank must be known. There are two main methods of indicating fuel contents:

- **Resistance gauges**
- **Capacitance quantity indicators**

**Resistance gauges** tend to be found on smaller aircraft. A float in the fuel tank is connected to a variable resistor; as the fuel level changes the float moves, changing the resistance, which alters the current flow through a DC circuit and operates a meter indicating fuel contents.

**Capacitance quantity indicators** have the advantage over other quantity systems that they can give accurate readings in very large or unusually shaped tanks. The probes within the fuel tank are actually capacitors, whose two plates are separated by fuel on the lower end and air on the upper end. Since fuel and air have different **dielectric constant** values, capacitance changes as the fuel level rises and falls, and the probes send signals to the flight deck gauges. This system usually includes a **totalizer**, giving a reading of total fuel on board; some systems also indicate fuel used since take-off.

### Fuel Flow Indicators

Fuel flow provides a useful indication of the satisfactory operation of the engine and the amount of fuel consumed during flight. A typical system consists of a **fuel flow transmitter**, fitted into the low pressure fuel system, and an indicator that shows the rate of fuel flow and total fuel used, in **pounds per hour**. In some aircraft a combined fuel flow/pressure indicator with two pointers (one per engine) is used; on most large passenger aircraft, a dedicated fuel flow indicator is used for each engine.

There are two types of fuel flow transmitter:

- **Synchronous Mass Flow Flow-meter System** — measures mass flow rather than volume, so it compensates for fuel temperature in its readout. Fuel enters the transmitter impeller, which is rotated at a constant **60 rpm** by a synchronous impeller motor. The turbine is twisted against calibrated restraining (retaining) springs by the mass flow force created by the impeller. The mass flow electrical transmitter arrangement works on the principle of a **torque synchro**.
- **Motorless Mass Flow Meter System** — the latest electronic solid-state fuel measuring system, small in size, accounting for fuel temperature and specific gravity with an accuracy of **1%**, as opposed to **2%** for motor-driven flow meters. Almost all large turbine-powered aircraft use this pound-per-hour system. Fuel entering from the drive end rotates a drum containing magnet 1 and the drive shaft; a spring connects the drive shaft to an impeller containing magnet 2. As the magnets rotate, pick-off coils receive current pulses with a time lag between them; the greater the mass flow, the greater the spring deflection and the angular (time) difference between the magnets, which is directly proportional to mass flow rate. Indicator electronics convert this time difference into a pound-per-hour readout.

### Pressure Indicators

Accurate indication of engine oil and fuel pressure is essential for correct and safe engine operation. There are two methods of detecting pressure:

- **Pressure capsule (diaphragm) detection** — a diaphragm-type indicator is attached to a capillary tube carrying pressurised fuel; as the diaphragm becomes pressurised it expands, rotating an indicator pointer.
- **Bourdon tube detection** — a metal tube formed into a circular shape with a flattened cross-section, one end open and one end sealed. The open end connects to a capillary tube containing the pressurised medium; as the medium enters, the tube tends to straighten, and this movement is transferred through a series of gears to the indicating pointer.

The most common method on modern passenger aircraft is a **pressure transmitter and indicator**: oil/fuel pressure acting on a Bourdon tube within the transmitter moves an electromagnet core, and this movement is transmitted to the indicator via a **torque synchro system**, moving a pointer over the calibrated pressure scale.

### Oil and Fuel Temperature Indicators

There are two main types of temperature sensor used for oil and fuel temperature measurement:

- **Resistive bulb sensor** — oil and fuel temperatures are sensed by a temperature-sensitive resistive bulb fitted in the oil/fuel system. The indicator contains a **Wheatstone Bridge circuit**, with the temperature sensor as the variable resistance. A rise in temperature raises the resistance value, unbalancing the bridge and producing a corresponding current flow at the indicator; the pointer deflects by an amount equivalent to the temperature change, calibrated in degrees centigrade.
- **Thermocouple sensor** — its advantage over the resistive bulb type is that it requires **no power** from the aircraft electrical system: it is a self-contained, self-generating circuit. It derives its power from a pair of dissimilar metals — **iron and constantan** — which, when heated at the hot junction, produce a millivoltage and cause a current flow through the meter.

### Engine RPM Indicators

All engines have their rotational speed (rpm) indicated. On two- or three-spool engines, the high pressure assembly speed (**N3** on a triple-spool engine) is always indicated; additional indicators, where fitted, show the low pressure (**N1**) and intermediate pressure (**N2**) assemblies. Engine speed indication is electrically transmitted from a small generator driven by the engine to an indicator showing speed as a **percentage of maximum engine speed**. Engine speed is often used to assess engine thrust, but it does not give an absolute indication of thrust because inlet temperature and pressure conditions also affect the thrust produced at a given engine speed.

The **engine speed generator** supplies three-phase alternating current, whose frequency depends on engine speed. The generator output frequency controls the speed of a synchronous motor in the indicator, and rotation of a magnet assembly housed in a drum (drag-cup) moves the indicator pointer.

Where there is no provision for driving a generator, a **variable-reluctance speed probe**, working with a **phonic wheel** machined into the compressor shaft, may be used instead. The teeth on the wheel pass the probe once per revolution, inducing an electric current by varying the magnetic flux across a coil in the probe; the current magnitude relates directly to engine speed. This removes the need for a separately driven generator and its associated drives, reducing the number of engine components and moving parts. The current induced at the speed probe can also illuminate a warning lamp indicating that a rotor assembly is turning — particularly important at engine start, informing the flight crew when to open the fuel cocks.

### Exhaust Temperature Indicating

Exhaust gas temperature is closely monitored during engine operation, especially during the starting cycle, when overheat damage is most prevalent. Hot section temperature is considered the **most critical of all engine operating parameters**, because an out-of-limits condition can render an engine un-airworthy in a matter of seconds. Depending on where it is measured, exhaust temperature indication may be called:

| Abbreviation | Meaning |
|---|---|
| **TIT** | Turbine Inlet Temperature — measured forward of the turbine wheel(s) |
| **ITT** | Inter-stage Turbine Temperature — measured between multiple turbine wheels |
| **EGT** | Exhaust Gas Temperature — measured aft of the turbine wheels |
| **TOT** | Turbine Outlet Temperature — measured aft of the turbine wheels |

Each EGT system consists of several thermocouples spaced around the circumference of the engine exhaust section casing; the cockpit indicator displays the **average temperature** measured by the individual probes. The thermocouple wires are joined inside a metal guard tube with transfer holes allowing exhaust gas to flow across the junction, and are usually made of **nickel-chromium and nickel-aluminium** alloys.

### Vibration Instruments

A turbo-jet engine has an extremely low vibration level, and a change of vibration due to an impending or partial failure may pass unnoticed. Vibration indicators continually monitor engine vibration, measured in **mils (thousandths of an inch)**. The indicator is usually a milliammeter receiving signals through an amplifier from engine-mounted transmitters. On multi-spool engines a more accurate **crystal-type vibration transmitter** has been developed, with a system of filters in the electronic circuit that differentiates between the frequency ranges of each rotating assembly, allowing the source of vibration to be isolated; a multiple selector switch lets the pilot select a specific area to obtain a vibration reading.

## Automatic Pilot

Autopilots are mainly classified by the number of axes about which their control is effected:

- **Single axis** — the simplest system, controlling attitude about the roll axis by control of the ailerons for lateral control.
- **Two axis** — attitude control about the pitch and roll axes, via the elevators and ailerons respectively; this can also feed a flight director so the pilot or autopilot can fly a pre-selected flight path.
- **Three axis** — attitude control about pitch, roll and yaw axes, via the elevators, ailerons and rudder respectively. Normally integrated with a flight director, and in many cases has sufficient control to carry out automatic landings.

The control function allows the pilot to engage/disengage the autopilot and select flight paths (**modes**), such as navigation tracks, climbs, descents and specific altitudes. A basic single-axis (pitch) autopilot uses these elements:

- **Attitude sensing** — achieved by gyroscopes, accelerometers, or both, sensing attitude changes about the relevant axis.
- **Error sensing** — transducers (synchro-transmitters or E&I bars) that convert the attitude signal into an electrical error signal.
- **Signal processing** — a discriminator and amplifier that process the attitude error signal into a form suitable for operating the servo motors.
- **Servo motors** — move the control surfaces in response to the processed signal.

When the autopilot is engaged, it holds the aircraft in the flight attitude present at engagement. If pitch attitude changes (e.g. due to air disturbance or an out-of-trim condition), an error signal is discriminated, amplified and fed to the servo motor, which drives the elevator to correct the disturbance. Elevator movement in turn produces an **electrical feedback** signal to the amplifier, opposing the error signal; as the aircraft returns to the correct attitude, the position feedback signal predominates, moving the elevator back toward a faired position, so the manoeuvre is achieved smoothly.

### Yaw Damper System

Some larger aircraft suffer from yaw oscillations that are tiresome and difficult to control manually. A **yaw damper system** handles this automatically, using a rate-sensing gyro (normally part of the INS system) feeding inputs into the rudder channel during manual and automatic flight. When the yaw damper is operating there is **no feedback to the rudder pedals**. On some aircraft, if the yaw damper is not operating an **INOP light** illuminates, and the autopilot will not engage.

### Automatic Pitch Trim and Mach Trim

The stabiliser is automatically trimmed by commands generated by the autopilot and Mach trim systems. Autopilot stabiliser trim commands are generated when **prolonged elevator deflection** beyond a certain threshold occurs. The trim servo motor may be electric or hydraulic; dual circuits, dual motors, and dual control/monitoring systems are always provided for reliability and safety. Sensitivity of the automatic stabiliser trim unit is normally controlled by an airspeed function. An **UNSCHED STAB TRIM** (amber) light indicates the stabiliser is trimming without a command signal.

To guard against **nose tuck-under** in transonic flight, frequent pitch trim changes are required. The **Mach trim system** automatically positions the stabiliser leading edge down as speed increases, aiding longitudinal stability and ensuring forward stick forces increase proportionally with increasing Mach number.

### Control Wheel Steering (CWS)

When the autopilot is engaged in CWS mode, the pilot can fly the aircraft by applying signals from the control column, via transducers, to the autopilot pitch and roll channels, operating the ailerons and elevators. Its advantage is that the pilot can control the aircraft using relatively small control column forces.

### Autopilot Disengage

Disengagement may be manual or automatic, and is always accompanied by a warning. Manual disengagement is via switches on the outboard side of the control wheels (leaving the throttle hand free); these switches also silence the warning. Automatic disengagement occurs if a fault opens one of the interlocks in the relevant autopilot system.

## Aircraft Communications

Air carrier operations require uninterrupted communications between ATC agencies and company operations, typically by voice, using short-range VHF or long-distance HF.

**Long range communications (up to 4,000 km)** — when more than 200 miles from land, aircraft use **HF transceivers**, usually duplicated (one for ATC, one for company messages). The frequency range covers approximately **2,800 kHz to 24,000 kHz (2–30 MHz)** in 1 kHz steps. Although AM and LSB facilities exist, operations are generally confined to USB. Power output is around **400 watts**, giving ranges of more than **2,000 nautical miles** in good conditions.

**Short range communications (up to 450 km)** — over land, most communications use **VHF**. Like HF, operation is in **simplex mode** (transmission and reception are not simultaneous). An aircraft may carry as many as three identical VHF transceivers operating in the range **118 MHz to 137 MHz**. The International Aeronautical Emergency frequency of **121.5 MHz** lies within this band. Frequencies are channelised at **8.33 kHz** intervals, transmission is **AM**, output power is around **25 watts**, and range is quasi-optical, typically **220 to 250 nautical miles** at jet cruising levels.

### Selective Calling (SELCAL)

The **SELCAL** system relieves pilots from continuous monitoring of communication channels and operates on both HF and VHF radios. A four-tone audio signal transmitted by the ground station is routed to the aircraft's Selcal decoder (overriding the squelch control); when the tones match the pre-selected **Selcal Code** (a 4-letter group, e.g. HMJE), the pilot is alerted by an intermittent light and a two-tone chime. Codes are assigned from **10,920 combinations**. The system is not used on VHF air traffic channels, presumably because immediate response to control instructions is essential.

**Today's navigation aids** include: Automatic Direction Finding (ADF), VHF Omni-Range (VOR), Radio Altimeter (RA), Instrument Landing Systems (ILS), Distance Measuring Equipment (DME), Inertial Navigation Systems (INS), Global Positioning Systems (GPS), Ground Proximity Warning Systems (GPWS), Secondary Surveillance Radar (SSR) and Traffic Collision Avoidance System (TCAS).

## Automatic Direction Finding (ADF)

ADF allows an aircraft to determine the bearing of a radio transmitter at a known position, assisting navigation; bearings from two or more sources may fix the aircraft's position. Ground transmitters used for this purpose are **non-directional beacons (NDBs)**.

### The NDB

The NDB is a simple LF/MF transmitter operating within an assigned band of approximately **190 kHz to 1,750 kHz**; in practice most NDBs fall between **200 kHz and 400 kHz**. Power levels vary from a few watts up to a kilowatt or so, according to the required range:

| Time / Surface | Range |
|---|---|
| Day, over sea | up to ~430 miles |
| Day, over land | up to ~330 miles |
| Night, over sea | ~160 miles |
| Night, over land | ~125 miles |

Night range for reliable bearings is much reduced owing to ionospheric changes. An NDB installed on the extended runway centreline as an approach aid is known as a **locator**; beacons are identified by 2- or 3-letter Morse code groups transmitted at **7 words per minute**.

### DF Principles

A loop antenna presented to a radio wave has a maximum signal induced when parallel to the wave and a minimum when at right angles to it; plotting signal strength against orientation produces a **figure-of-eight polar diagram**, with 2 sharp minima and 2 broad maxima — but this leaves a **180° ambiguity** as to the true direction. This is resolved by combining the loop output with that of an **omnidirectional antenna**, producing a **cardioid** polar diagram; the phase of the omnidirectional signal can be adjusted by 180° to produce the cardioid on the left or right, resolving the ambiguity.

### ADF System Components

An ADF system consists of five basic components: the **loop**, the **omnidirectional aerial**, the **receiver/processor**, the **control unit**, and the **display** (analogue or EFIS). The loop's bearing may be displayed remotely on a **Remote Bearing Indicator (RBI)**, or on a **Radio Magnetic Indicator (RMI)**, which presents the bearing over a compass card slaved to the remote indicating compass, showing a magnetic bearing of the transmitter, with aircraft heading shown against a lubber line at the top of the instrument.

## VHF Omni-Range (VOR)

VOR was introduced in the 1950s as the standard worldwide short-range navigation aid. It operates in the band **108 to 117.95 MHz**, with a visual presentation, and provides all-round bearing information with an accuracy of approximately **±5°**.

### Ground Equipment

There are two types of VOR ground installation: the original **Conventional VOR (CVOR)** and the current **Doppler VOR (DVOR)**; both are compatible with the same airborne receiver. A reference signal and a bearing signal are transmitted on a common VHF carrier using different forms of modulation. A **30 Hz frequency-modulated** signal, radiated omnidirectionally, provides the reference signal; a limaçon polar diagram rotated at **1,800 revolutions per minute** supplies a **30 Hz amplitude-modulated** bearing signal. The two modulations are in phase for an observer bearing 000° magnetic from the station; observers elsewhere measure a phase difference equal to their angular displacement from magnetic north. These magnetic bearings are known as **radials**. Each beacon also radiates a 2- or 3-letter Morse identification group, at **7 words per minute**, with a modulating frequency of **1,020 Hz**, recommended to be sent 3 times every 30 seconds. DVOR uses a complex aerial array of **49 elements** and much reduces the siting errors ("scalloping") of CVOR.

### Range, Accuracy and the Cone of Confusion

VOR operates on VHF, so range depends on aircraft altitude; at **39,000 feet** signals may be received at nearly **250 nm**. Aggregate errors (radiated signal accuracy, beam bending over terrain, aircraft installation resolution) produce an overall accuracy of approximately **±5°**. Above elevation angles of about 40°, close to the station, the signal pattern becomes diffuse, causing false needle reversals and misleading indications — this is known as the **cone of confusion**, extending over about **8 nautical miles** at jet cruising altitudes; a constant heading is normally flown through the overhead until reliable indications return.

### Presentation (RMI and HSI)

VOR information may be displayed on a **Radio Magnetic Indicator (RMI)** — most RMIs have two switchable pointers, serving two VHF navigation receivers or ADF — or on a **Horizontal Situation Indicator (HSI)**, which combines a heading input with VOR information to show the desired radial relative to a miniature aircraft symbol, using a **course deviation bar**. VOR indications are **not affected by aircraft heading**.

## Radio Altimeter

The radio altimeter measures aircraft height above ground with high accuracy, providing a flight deck display of height above ground level (AGL). It also supplies data to the automatic flight system for automatic landings (in association with the ILS/MLS), and furnishes height and rate-of-change-of-height information to the **Ground Proximity Warning System (GPWS)**, of which it is a crucial component.

Operation uses primary radar principles: a **frequency-modulated continuous wave (FMCW)** or pulsed system determines the time for a radio wave to travel to the ground directly beneath the aircraft and back; since the rate of frequency change is known, the frequency difference between transmitted and received signals gives aircraft height. Of the two frequency bands historically used, only the first remains in current use:

- **4,200 MHz to 4,400 MHz** (SHF band) — currently used
- **1,600 MHz to 1,660 MHz** (UHF band) — historical

A typical indicator has a height scale expanded from zero to 500 feet, and logarithmic from 500 to 2,500 feet. The height pointer disappears behind a **mask** when altitude exceeds 2,500 ft, when there is a fault in the transmitted signal, or when the altimeter is switched off. A **failure warning flag** appears with excessive radio noise, local airframe reflections, or loss of power. A **press-to-test button** swings the pointer to a known preset altitude to confirm satisfactory operation. A **low height warning** light illuminates below a pilot-selected decision height (DH), accompanied by cessation of an alert tone that sounds with increasing loudness from about 100 feet above the DH setting.

## Instrument Landing System (ILS)

ILS provides a radio guidance system for all-weather approach operations in reduced visibility and low cloud, consisting of **localiser** and **glide slope** beams guiding the aircraft horizontally and vertically to the runway, often supplemented by **marker beacons** indicating distance from the threshold.

### Localiser and Glide Slope

The localiser (horizontal guidance) is based on **lobe comparison**: two overlapping beams are radiated from a single transmitter at the upwind end of the runway, and their area of overlap defines the extended runway centreline. The system measures the difference in depth of modulation between a **150 Hz** and a **90 Hz** modulation; the 90 Hz modulation lies to the left when approaching to land. The localiser transmits on one of **40 spot frequencies between 108.1 MHz and 111.95 MHz** in the VHF band. A similar arrangement, on a paired UHF frequency, defines the **glide path**, located to one side of the runway near the touchdown point (the lower lobe carries the 150 Hz modulation); tuning the localiser VHF frequency automatically tunes the paired glide slope UHF frequency.

The **course radiation pattern** of the localiser extends **10° either side of the centreline** to a distance of **25 nm**. The glide path extends approximately **10 nm** from the runway threshold, giving an average approach angle of **3 degrees**.

### Marker Beacons

Marker beacons associated with the ILS all operate on a radio frequency of **75 MHz**, vertically radiated to avoid mutual interference. Most installations include an outer and a middle marker:

| Marker | Modulation | Pattern | Light |
|---|---|---|---|
| **Outer** | 400 Hz | 2 dashes per second | Blue |
| **Middle** | 1,300 Hz | Alternate dots and dashes | Amber |
| **Inner** (some military airports) | 3,000 Hz | Continuous dots | White |

The marker receiver is a simple fixed-tuned radio receiver with audio filters to illuminate the appropriate lights; a Hi/Lo sensitivity switch, where fitted, should always be set to **Lo** for ILS use. Outer or middle markers are sometimes supplemented by low-power MF beacons, or dispensed with where DME is available; certain DME channels are associated with particular localiser channels and are automatically tuned when the localiser frequency is selected.

## Distance Measuring Equipment (DME)

VOR provides track guidance but not range; **DME** provides the range from the facility, and together the two form the internationally approved short-range navigation aid for the world's airways. DME is a form of secondary radar operating in the band **960 MHz to 1,215 MHz**, using vertical polarisation on channels spaced **1 MHz** apart. Of the theoretically available **126 channels**, some are reserved for military use and Secondary Surveillance Radar (SSR), leaving **100 channels** for general use.

The aircraft transmits an omnidirectional interrogation on the frequency of the required ground beacon (identified by Morse code); a triggered beacon responds with an answering pair of pulses, and the airborne receiver determines **slant range** from the interval between transmission and reception. DME is normally co-located with VOR, and selecting the VOR automatically tunes the matching DME frequency.

Since DME operates in the UHF band, range is quasi-optical (varies with height), with a generally accepted maximum range of **200 nm**, although some indicators display range in excess of 500 nm. Normal DME accuracy, at distances up to 200 nm, should be within **½ nm, or 3% of range (whichever is greater), on 95% of occasions**; in practice, typical system accuracy is around **±0.2 nm**.

## Inertial Navigation System (INS)

An **INS** is a self-contained unit requiring neither visual nor radio links to determine position or direction, applying Newton's laws of motion. A common type uses precision computer-controlled gyroscopes to provide a stable reference platform for sensitive **accelerometers**. Minute accelerations sensed by the accelerometers are applied to a computer, which calculates velocity, distance travelled, and direction via a process of **double integration**: acceleration is integrated once to give velocity, and integrated a second time to give distance.

In a simplified two-dimensional system, a stabilised platform carries two accelerometers with sensitive axes aligned parallel to a grid reference system; their outputs, after double integration, give the distances travelled along the X and Y axes. With this information, the system knows its position as long as it knows where it started. INS outputs depend on the operational functions selected by the user, controlled and displayed through a **mode selector / control display unit (CDU)**.

## Global Positioning System (GPS)

Satellite navigation overcomes the disadvantages of traditional celestial navigation (only usable by day, and only when the sky is not obscured). The **Navstar Global Positioning System (GPS)**, operated by the US Department of Defence, and the **Global Orbiting Navigation System (GLONASS)**, developed by the former USSR, both supply precise position and velocity information worldwide.

| | GPS (USA) | GLONASS (former USSR) |
|---|---|---|
| Satellites | 21, with 3 reserves | 21, with 3 reserves |
| Orbital planes | 6 planes × 4 satellites | 3 planes × 8 satellites |
| Inclination | ~55° to the equator | ~65° to the equator |
| Altitude | ~20,150 km | ~19,100 km |
| Orbital period | ~12 hours | ~11 hours 15 minutes |

In both systems, satellites are positioned so that at least **4** are always in view (5 or more above the horizon) to any observer on or above the earth's surface. The system determines the receiver's range from each of four satellites to deduce aircraft position; three satellites may be used if an altitude input is provided to resolve ambiguity. Time is maintained by **4 separate atomic clocks** in each satellite, and by crystal oscillators in the receivers; satellites are monitored, and their data updated, by ground earth stations.

## Ground Proximity Warning System (GPWS)

GPWS is an automatic monitoring and advisory system giving visual and aural warning that the flight profile is becoming dangerous due to closeness of the ground. It operates generally between **50 feet and 2,450 feet AGL**, as determined by the radio altimeter. It gives **no warning of steeply rising ground directly ahead**, and will not protect a properly configured aircraft from landing short of the runway in the absence of an ILS glide path. A central processing unit (CPU) continually examines its various inputs and generates visual/aural warnings if a collision risk with terrain exists; computer or input signal failure is also displayed on a warning panel.

A GPWS event is identified by mode:

| Mode | Condition |
|---|---|
| **1** | Excessive descent rate below 2,450 ft AGL |
| **2** | Excessive terrain closure rate (cruise or landing configuration) |
| **3** | Loss of altitude after take-off or on go-around |
| **4** | Unsafe terrain clearance not in landing configuration (below 500 ft AGL, undercarriage; below 200 ft AGL, flaps) |
| **5** | Excessive downward departure from ILS glide path |
| **6** | Aural altitude call-outs on approach, including decision height |
| **7** | Wind shear detection, warning and guidance |

Current equipment distinguishes a cautionary **alert** from an imperative **warning**. Warnings for Modes 1–4 include a flashing red "pull-up" light and aural warnings (e.g. "Whoop Whoop Pull-up"). Mode 5's alert is a steady amber glideslope light with an aural glideslope warning that becomes more frequent as deviation increases, and louder if deviation exceeds 2 dots below 300 feet.

## Secondary Surveillance Radar (SSR)

Air Traffic Services rely extensively on SSR, and carrying a serviceable transponder is generally a prerequisite for flight in controlled airspace. Compared with primary radar, SSR offers increased range for reduced power, the ability to convey coded information, and independence from target size and attitude, providing position, identity and altitude data for three-dimensional surveillance. A ground interrogator transmits pulses from a rotating directional aerial; the aircraft transponder replies, and the recovered data is presented as a position symbol and label (code/call sign and flight level) on the display.

The interrogator carrier frequency is **1,030 MHz**, and the reply frequency is **1,090 MHz**; interrogation rate is **450 interrogations per second**, with vertical polarisation.

### Modes and Special Codes

Ground transmissions are Mode A or Mode C:

- **Mode A** — a coded reply set by the pilot on the transponder control unit.
- **Mode B** — a four-figure code group, each digit (0–7) selecting a combination of 0–3 pulses (eight binary options per digit).
- **Mode C** — a coded combination of pulses indicating aircraft altitude referenced to **1,013.2 mb**, from an encoder (within a pressure altimeter) producing discrete codes at **100-foot increments**.

Special code assignments agreed for international use include: **7500** (unlawful interference/hijack), **7600** (communication failure), **7700** (emergency).

### Mode S

Most aircraft now use **Mode S**, which interrogates each transponder-equipped aircraft individually via a **unique 24-bit aircraft address**, allowing more than **16 million** different addresses (over 262,000 have been allocated for UK-registered aircraft). Each interrogation contains the intended aircraft's unique address; only the addressed aircraft replies, and all others ignore the interrogation. The Mode S data link supports air-to-air collision avoidance coordination (ACAS) and can back up many ATC voice services (e.g. flight identification, altitude/take-off clearance confirmation, sector hand-off frequency, clearance acknowledgement, transmission of flight parameters, minimum safe altitude warning), reducing communications-related errors.

## Airborne Collision Avoidance System (ACAS/TCAS)

**ACAS** alerts pilots to nearby aircraft and, where possible, provides an escape manoeuvre, using only on-board equipment, independent of ground ATC installations, to complement (not replace) conventional air traffic management. Current equipment, known as **TCAS (Traffic Alert and Collision Avoidance System)**, provides traffic information within approximately **30 miles**, at three defined capability levels:

- **TCAS I** — provides a Traffic Advisory (TA) display of range and bearing of a threat aircraft; a warning and aid to visual acquisition only, with no escape manoeuvre recommendation.
- **TCAS II** — additionally provides escape manoeuvre **Resolution Advisories (RAs)** in the vertical plane only, based on Mode C reports from conflicting traffic. This is the **preferred system**.
- **TCAS III** — would also provide RAs and manoeuvre guidance in the horizontal plane, but bearing measurement accuracy cannot presently support this.

TCAS II equipment comprises a TCAS computer, two TCAS antennas (upper directional, lower directional or omnidirectional), a combined ATC transponder/TCAS control panel, a flight-deck display, and Mode S transponder(s). TCAS relies on other aircraft's transponders; non-equipped aircraft are "transparent" to TCAS, and Mode A–only targets are assumed to be at the interrogator's own level, generating only a TA.

TCAS-protected airspace is defined by time-to-convergence and by ATC vertical separation minima of **400 to 740 feet**, depending on altitude. **Traffic Advisories (TA)** appear on targets **30–45 seconds** from convergence; **Resolution Advisories (RA)** appear **20–30 seconds** from completed convergence, and are announced aurally (e.g. "Traffic, Traffic", then "Climb, Climb"). RAs may be **corrective** (instructing a climb or descend) or **preventive** (advising avoidance of certain manoeuvres, e.g. "Don't Climb"). Intruder information is shown on a colour display (or the Navigation Display/Weather Radar Indicator), with the preferred manoeuvre often shown on a dedicated **RA/VSI** instrument.
        $cnt$,
        6
    ) RETURNING id INTO s1_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M11B.6 Instruments and Avionics (Part 2) (26 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s1_id, 'In a capacitance fuel quantity indicating system, the probes act as capacitors whose capacitance changes with fuel level because:',
     '[{"id":"a","text":"Fuel and air have different dielectric constant values","correct":true},{"id":"b","text":"The probes physically shorten as fuel rises","correct":false},{"id":"c","text":"Fuel is electrically conductive and air is not","correct":false}]',
     '{"B1"}'),

    (s1_id, 'Compared with a motor-driven mass flow meter (approximately 2% accuracy), the motorless mass flow meter system used on most large turbine aircraft achieves an accuracy of approximately:',
     '[{"id":"a","text":"1%","correct":true},{"id":"b","text":"5%","correct":false},{"id":"c","text":"10%","correct":false}]',
     '{"B1"}'),

    (s1_id, 'In the resistive bulb type of oil/fuel temperature sensing system, the indicator uses the temperature sensor as the variable resistance in a:',
     '[{"id":"a","text":"Wheatstone Bridge circuit","correct":true},{"id":"b","text":"Torque synchro circuit","correct":false},{"id":"c","text":"Capacitance discriminator circuit","correct":false}]',
     '{"B1"}'),

    (s1_id, 'A thermocouple temperature sensor has an advantage over a resistive bulb sensor in that it:',
     '[{"id":"a","text":"Requires no power from the aircraft electrical system, being self-generating","correct":true},{"id":"b","text":"Is more accurate at low temperatures only","correct":false},{"id":"c","text":"Uses a Wheatstone Bridge for greater precision","correct":false}]',
     '{"B1"}'),

    (s1_id, 'On a triple-spool engine, which compressor speed indication is always provided?',
     '[{"id":"a","text":"N1 (low pressure) only","correct":false},{"id":"b","text":"N3 (high pressure)","correct":true},{"id":"c","text":"N2 (intermediate pressure) only","correct":false}]',
     '{"B1"}'),

    (s1_id, 'A variable-reluctance speed probe working with a phonic wheel is useful at engine start because it:',
     '[{"id":"a","text":"Measures fuel flow more accurately than a torque synchro","correct":false},{"id":"b","text":"Can illuminate a warning lamp indicating a rotor assembly is turning, informing the crew when to open the fuel cocks","correct":true},{"id":"c","text":"Eliminates the need for an EGT indicator during start","correct":false}]',
     '{"B1"}'),

    (s1_id, 'Which exhaust temperature abbreviation refers to a measurement taken forward of the turbine wheel(s)?',
     '[{"id":"a","text":"EGT","correct":false},{"id":"b","text":"TIT","correct":true},{"id":"c","text":"TOT","correct":false}]',
     '{"B1"}'),

    (s1_id, 'Engine vibration, as displayed on a vibration indicator, is measured in:',
     '[{"id":"a","text":"Mils (thousandths of an inch)","correct":true},{"id":"b","text":"Hertz","correct":false},{"id":"c","text":"Millibars","correct":false}]',
     '{"B1"}'),

    (s1_id, 'A three-axis autopilot provides attitude control about which axes?',
     '[{"id":"a","text":"Pitch and roll only","correct":false},{"id":"b","text":"Pitch, roll and yaw","correct":true},{"id":"c","text":"Roll and yaw only","correct":false}]',
     '{"B1"}'),

    (s1_id, 'In a basic single-axis autopilot, the function of the error sensing transducers (synchro-transmitters or E and I bars) is to:',
     '[{"id":"a","text":"Move the control surfaces directly","correct":false},{"id":"b","text":"Change the attitude signal into an electrical error signal","correct":true},{"id":"c","text":"Sense attitude changes using gyroscopes","correct":false}]',
     '{"B1"}'),

    (s1_id, 'The yaw damper system, used to counter tiresome yaw oscillations on larger aircraft, typically derives its rate signal from:',
     '[{"id":"a","text":"A rate sensing gyro, normally part of the INS system","correct":true},{"id":"b","text":"The radio altimeter","correct":false},{"id":"c","text":"The VOR receiver","correct":false}]',
     '{"B1"}'),

    (s1_id, 'Long range aircraft HF communications, giving ranges of more than 2,000 nautical miles, typically use an output power in the order of:',
     '[{"id":"a","text":"25 watts","correct":false},{"id":"b","text":"400 watts","correct":true},{"id":"c","text":"4,000 watts","correct":false}]',
     '{"B1"}'),

    (s1_id, 'The NDB (non-directional beacon) used for ADF operates within an assigned frequency band of approximately:',
     '[{"id":"a","text":"190 kHz to 1,750 kHz","correct":true},{"id":"b","text":"108 MHz to 117.95 MHz","correct":false},{"id":"c","text":"960 MHz to 1,215 MHz","correct":false}]',
     '{"B1"}'),

    (s1_id, 'The ambiguity inherent in a simple figure-of-eight loop aerial polar diagram, used for direction finding, is resolved in an ADF system by:',
     '[{"id":"a","text":"Combining the loop output with an omnidirectional aerial to form a cardioid pattern","correct":true},{"id":"b","text":"Doubling the loop aerial size","correct":false},{"id":"c","text":"Switching to a higher NDB frequency","correct":false}]',
     '{"B1"}'),

    (s1_id, 'VOR (VHF Omni-Range) operates in which frequency band?',
     '[{"id":"a","text":"108 to 117.95 MHz","correct":true},{"id":"b","text":"960 to 1,215 MHz","correct":false},{"id":"c","text":"2,800 to 24,000 kHz","correct":false}]',
     '{"B1"}'),

    (s1_id, 'Close to a VOR station, above elevation angles of about 40 degrees, the signal pattern becomes diffuse and can cause false needle reversals. This area is known as the:',
     '[{"id":"a","text":"Cone of confusion","correct":true},{"id":"b","text":"Zone of silence","correct":false},{"id":"c","text":"Scalloping sector","correct":false}]',
     '{"B1"}'),

    (s1_id, 'The ILS localiser measures the difference in depth of modulation between two audio tones. These tones are:',
     '[{"id":"a","text":"90 Hz and 150 Hz","correct":true},{"id":"b","text":"400 Hz and 1,300 Hz","correct":false},{"id":"c","text":"75 Hz and 1,020 Hz","correct":false}]',
     '{"B1"}'),

    (s1_id, 'ILS marker beacons associated with the outer marker are amplitude modulated at 400 Hz (two dashes per second) and illuminate which colour light on the instrument panel?',
     '[{"id":"a","text":"Amber","correct":false},{"id":"b","text":"Blue","correct":true},{"id":"c","text":"White","correct":false}]',
     '{"B1"}'),

    (s1_id, 'DME (Distance Measuring Equipment) operates in the frequency band:',
     '[{"id":"a","text":"960 MHz to 1,215 MHz","correct":true},{"id":"b","text":"108 to 117.95 MHz","correct":false},{"id":"c","text":"4,200 to 4,400 MHz","correct":false}]',
     '{"B1"}'),

    (s1_id, 'In an Inertial Navigation System (INS), accelerometer outputs are converted into distance travelled by a process of:',
     '[{"id":"a","text":"Single differentiation","correct":false},{"id":"b","text":"Double integration","correct":true},{"id":"c","text":"Triple differentiation","correct":false}]',
     '{"B1"}'),

    (s1_id, 'For a GPS (or GLONASS) receiver to fix aircraft position, range measurements are normally taken from how many satellites?',
     '[{"id":"a","text":"Two","correct":false},{"id":"b","text":"Four","correct":true},{"id":"c","text":"Twenty-one","correct":false}]',
     '{"B1"}'),

    (s1_id, 'GPWS Mode 1 provides a warning for:',
     '[{"id":"a","text":"Excessive descent rate below 2,450 ft AGL","correct":true},{"id":"b","text":"Excessive downward departure from the ILS glide path","correct":false},{"id":"c","text":"Wind shear encounter","correct":false}]',
     '{"B1"}'),

    (s1_id, 'The Secondary Surveillance Radar (SSR) special code assigned internationally to indicate an emergency is:',
     '[{"id":"a","text":"7500","correct":false},{"id":"b","text":"7600","correct":false},{"id":"c","text":"7700","correct":true}]',
     '{"B1"}'),

    (s1_id, 'How many bits are used to encode the unique aircraft address in Mode S SSR interrogations and replies?',
     '[{"id":"a","text":"8 bits","correct":false},{"id":"b","text":"16 bits","correct":false},{"id":"c","text":"24 bits","correct":true}]',
     '{"B1"}'),

    (s1_id, 'TCAS II differs from TCAS I in that it additionally provides:',
     '[{"id":"a","text":"Resolution Advisories (RAs) in the vertical plane, based on Mode C reports","correct":true},{"id":"b","text":"Manoeuvre guidance in both the vertical and horizontal planes","correct":false},{"id":"c","text":"Direct control of the aircraft flight controls without crew action","correct":false}]',
     '{"B1"}'),

    (s1_id, 'In TCAS operation, a Resolution Advisory (RA) typically appears on a threat target approximately how many seconds from completed convergence?',
     '[{"id":"a","text":"20 to 30 seconds","correct":true},{"id":"b","text":"2 to 3 minutes","correct":false},{"id":"c","text":"5 to 10 seconds","correct":false}]',
     '{"B1"}');

END $$;
