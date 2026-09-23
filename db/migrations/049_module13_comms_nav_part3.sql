-- Module 13: Aircraft Aerodynamic Structures (B2) — Communication and Navigation Systems (Part 3)
-- Source: EASA Part-66 Module 13 official textbook (IKAROS Aviation Training Centre, IK01, Issue Oct 2012)
-- This is the third and final part of the Communication/Navigation chapter (ATA 23/34), covering:
-- Mode S transponder essentials, TCAS, Weather Radar, MLS, Hyperbolic Navigation (LORAN),
-- Doppler Radar, GPS, Inertial Navigation (INS/IRS) and the Flight Director.

DO $$
DECLARE
    m13_id INT;
    s1_id  INT;
BEGIN
    SELECT id INTO m13_id FROM easa_modules WHERE code = 'M13';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M13.4C') THEN
        RAISE NOTICE 'M13.4C already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 13.4C: Communication and Navigation Systems (Part 3)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m13_id, 'M13.4C', 'Communication and Navigation Systems (Part 3)',
        $cnt$
# Communication and Navigation Systems (Part 3)

## Mode S Transponder Essentials

The **Mode S** transponder enhances ATCRBS operation by adding a data-link feature that improves aircraft location determination. Mode S capabilities include bidirectional air-to-air information exchange, ground-to-air data uplink, and air-to-ground data downlink. It may also function as part of an airborne separation assurance system when interfaced with **TCAS**.

Each Mode S interrogation and reply (except the all-call reply) contains a discrete **24-bit address**, allowing a very large number of aircraft to operate without a redundant address. Mode S interrogations use **binary differential phase-shift keying (DPSK)**; the reply data block uses **pulse position modulation (PPM)**. Transmissions are either 56-bit or 112-bit, with the last 24 bits used for address or parity.

Fleet (aircraft) identification is achieved by pin-programming a country code into the address plug; the remaining 15 of the 24 available bits allow up to **32,768 airplanes** to be individually assigned within that country's block.

**Internationally agreed emergency codes** (decoded automatically by the ground station, not to be used while testing the system):

| Code | Meaning |
|------|---------|
| **7700** | Emergency |
| **7600** | Communication failure |
| **7500** | Hijacking |

An **Identification Pulse (IP)** is transmitted upon interrogator request, activated by the IDENT switch on the controller, and is transmitted for a period of **18 seconds**.

## Traffic Collision Avoidance System (TCAS)

TCAS is a family of airborne devices that function independently of the ground-based ATC system, detecting and displaying aircraft in the vicinity and providing the flight crew with indications to avoid intruders.

| Type | Capability |
|------|------------|
| **TCAS I** | Proximity warning only, to assist visual acquisition of intruder aircraft — used by smaller/general aviation aircraft |
| **TCAS II** | Traffic advisories (TA) and resolution advisories (RA) — recommended escape manoeuvres in the **vertical** direction only — used by airline and larger commuter/business aircraft |
| **TCAS III** | Under development at the time of writing; would add resolution advisories in the horizontal as well as the vertical direction |

**Principle:** TCAS interrogates the ATC transponders of intruder aircraft. From the replies it determines each intruder's **bearing**, **range and closure rate**, and **relative altitude** (if the intruder reports altitude via Mode C or Mode S).

**Timing:** A **Traffic Advisory (TA)** is generated **40 to 45 seconds** prior to a predicted conflict; a **Resolution Advisory (RA)** is generated **20 to 25 seconds** prior to a conflict. Once the intruder's flight path no longer conflicts, all advisories cease and the voice message **"Clear of Conflict"** is broadcast.

TCAS provides **no protection** against aircraft without an operating ATC transponder, and cannot provide an RA when the intruder does not report altitude. **Below 500 ft radio altitude, all resolution advisory is suppressed.**

Corrective RAs (vertical speed pointer in the red "stay-out-of" area) require the pilot to change vertical speed until the pointer is in the green "fly to" area; example aural messages include "CLIMB-CLIMB-CLIMB" and "DESCEND-DESCEND-DESCEND," nominally at **1500 fpm**, increasing to **2500 fpm** for "INCREASE CLIMB" / "INCREASE DESCENT." Preventive RAs ("MONITOR VERTICAL SPEED") require the pilot to keep the VSI needle out of the lighted segments. The TCAS voice warnings are inhibited by higher-priority warnings such as stall warning, wind shear warning, ground proximity warnings and low radio heights.

**System characteristics:** pulse power **500 Watt**; transmit frequency **1030 MHz**; reception frequency **1090 MHz**; range **80 NM**; capable of handling **8 intruders simultaneously**. The computer is protected by a built-in test equipment (BITE) function and can be self-tested from the front panel.

## Weather Radar (WXR)

The airborne Weather Radar System allows detection and display of severe weather areas, helping the pilot avoid them and their associated turbulence by determining range and bearing; it also provides ground mapping. The radar emits microwave pulses through a directive antenna; range is determined by echo return time, azimuth by antenna position when the echo is received. Frequency is approximately **9.4 GHz** (9,375 MHz); pulse power ranges from **125 Watt to 65 kW**, at **180–400 pulses per second**.

**Turbulence detection:** a conventional radar echo depends only on the reflectivity of rainfall droplets. Turbulence is detected because the **Doppler effect** shifts the echo frequency from that of the transmitted pulse — the broader the resulting frequency spectrum, the greater the turbulence. When the spectrum exceeds a threshold defined as moderate-to-heavy, the return is displayed as a magenta-coloured turbulence area; this threshold occurs when droplets move at a rate of **5 metres per second**.

**Microburst / wind shear detection:** a microburst is a cool, cylindrical downward-moving shaft of air, **1000–3000 feet** across. Downward air velocities within the shaft range from **40 to 110 knots**; once translated to horizontal outflow at the base, front-to-back velocities range from **80 to 220 knots**. A wet microburst has rain reaching the ground largely intact; a dry microburst has rain substantially evaporating before reaching the ground (virga). A Forward-Looking wind shear detection/avoidance radar can detect a microburst up to **5 NM ahead** of the aircraft when **below 1500 ft AGL**.

**Antennas:** older systems use a **parabolic reflector** antenna (dipole feed, main lobe with side lobes, higher power). Newer systems use a **flat plate antenna** (slotted waveguide array) producing a narrow pencil beam of only **3 degrees**, allowing the system to operate at a reduced transmission power of just **125 Watts**. Older parabolic systems generated their high transmission pulse RF energy with a **magnetron**: a 13 kVolt, 12 ampere pulse from the magnetic modulator drives the magnetron to produce a **9375 MHz, 65 kW peak power** output; the magnetic modulator switches the magnetron's high-voltage supply **200 times per second**, with a pulse duration of **5 microseconds on** and **4995 microseconds off**.

The antenna is stabilised in pitch and roll by the vertical gyro or AHRS, with mechanical limits of roughly **±43° roll, ±25° pitch, ±15° tilt**, and scans azimuth at up to **±45° to ±90°**, some **20 times per minute**.

**Safety:** the high-energy radio waves are dangerous to human tissue (eyes are especially vulnerable) and may ignite flammable liquids. **10 mW/cm²** is the generally accepted maximum permissible exposure level (MPEL). The radar must never be operated during refuelling/defuelling, with a disconnected wave guide, close to large reflecting objects, or in a hangar.

## Microwave Landing System (MLS)

The time-referenced scanning-beam **MLS** was adopted by ICAO as the standard precision approach system intended to replace **ILS**, providing azimuth, elevation and distance guidance. It divides into five functions: **approach azimuth**, **back azimuth**, **approach elevation**, **range**, and **data communications**. All MLS signals (except DME) share a single frequency by time-sharing; **200 channels** are available between **5031 and 5090.6 MHz**, at a signalling rate of 15,625 bits/sec.

ILS limitations that motivated MLS development include site sensitivity and high installation cost, a single approach path, multipath interference, and only **40 channels**. MLS advantages include all-weather coverage to **±60°** from runway centreline (0.9° to 15° elevation, out to 20 NM), curved/segmented approach capability, and **200 channels — five times more than ILS**.

The approach azimuth antenna provides lateral coverage of **40°** either side of scan centre, reliable to a minimum of 20 NM and up to 20,000 ft, with the ground antenna located about 1000 ft beyond the runway end. Range guidance is provided by the MLS precision DME (**DME/P**), with an accuracy of **±100 ft**, compared with **±1200 ft** for the standard DME system.

## Hyperbolic Navigation (LORAN)

A hyperbolic navigation system uses a time-comparison technique based on the constant propagation velocity of radio waves (**300,000 km/s**, or **6.18 microseconds per nautical mile**). Ground installations consist of two or more stations — a **MASTER** and one or more **SLAVE** stations — transmitting on very low frequency between 12 kHz and 2 MHz, typically **200 to 400 NM apart**. **LORAN** (Long Range Navigation) and **OMEGA** are hyperbolic navigation systems; both were long-wave, high-energy-consumption systems mainly used by submarines and have been replaced by satellite navigation.

**Worked example:** if two stations are 200 NM apart, the MASTER signal takes **200 × 6.18 µs = 1236 µs** to reach the SLAVE station. The airborne receiver compares the arrival time difference between the MASTER and SLAVE signals; a constant time difference (e.g. 20 µs) traces a hyperbolic line of position, and LORAN charts are drawn using such hyperbolic lines of constant time difference.

## Doppler Radar Navigation

Doppler radar is an airborne, self-contained, long-range navigation aid requiring **no ground installation**, providing: **ground speed**, **drift angle**, **miles-to-go** (to a preselected position), and **off-set miles** (from a desired track). Today it is used mainly in military aircraft and helicopters (where it is unaffected by rotor interference, unlike satellite navigation), and has largely been replaced by inertial navigation systems for civil use.

**Principle:** when a receiver moves toward a transmitter the received frequency rises; moving away, it falls. The Doppler frequency shift is given by **fd = fc × v/c**, where v is the rate of change of path length, c is the speed of light, and fc is the carrier frequency.

**Worked example:** a stationary transmitter radiates at 3,000 MHz (wavelength 0.1 m). A receiver moves toward it at 3,600 km/h (1 km/s). Adding this to the propagation velocity gives a resultant speed of 300,001 km/s, producing a received frequency of 3,000,010 kHz — a Doppler shift of **10 kHz**.

The aircraft equipment uses a four-beam antenna reflecting off the earth's surface to derive ground speed and drift angle, feeding a navigation computer for miles-to-go, offset miles and position. Typical accuracy: drift **±½ degree**; ground speed error **±0.5% plus 1 knot**.

## Global Positioning System (GPS)

GPS is a space-based radio navigation system providing worldwide, continuous, three-dimensional position, velocity and time information, divided into three parts: **Space Segment**, **Control Segment**, and **User Segment**.

**Space Segment:** **24 satellites** (21 operational + 3 active spares) in six orbital planes of four satellites each, orbiting the earth every **12 hours** at an altitude of approximately **11,000 nautical miles**, each with a 28° view of the earth; six to ten satellites are visible from any point at any time, though only four are required for a 3-D fix.

**Control Segment:** a master control station (Colorado Springs, USA) plus four monitor stations (Kwajalein, Hawaii, Ascension Island, Diego Garcia) that track the satellites, compute ephemerides and clock corrections, and update the satellites **three times a day**.

**Accuracy:** the military precision (P) mode has an accuracy of approximately **±16 metres** laterally and vertically; the civilian coarse/acquisition (C/A) mode has an accuracy of approximately **±100 metres**. Position error (figure of merit) can be up to **500 metres**.

**Theory of operation:** GPS works like DME in principle but is a **passive** system — it requires no interrogation signal (unlike DME, which is **active** and limited to roughly 100 users per station) and can therefore serve an unlimited number of users. A GPS receiver measures the time for a signal to travel from satellite to receiver and multiplies by the speed of light to get a line of position (LOP); **four** satellite distance measurements are needed to resolve latitude, longitude, altitude and time (three satellites alone cannot resolve elevation/altitude). A time error of **one microsecond** represents a LOP difference of **300 metres**.

The GPS antenna is an L-band antenna designed to operate at **1575.42 MHz**, with right-hand circular polarisation and omnidirectional upper-hemispheric coverage. **Differential GPS** uses a fixed ground reference station that compares its computed position with its known surveyed position, transmitting error corrections to nearby aircraft by data link to improve local accuracy (e.g. for curved approaches).

## Inertial Navigation System (INS/IRS)

Inertial navigation rests on Newton's laws of motion, using **accelerometers** to sense aircraft acceleration; velocity is obtained by integrating acceleration once, and distance by integrating velocity once more.

**Gimballed platform systems** mount the accelerometers on a gyro-stabilised platform kept level with the earth's surface, so accelerometers sense only true horizontal acceleration and do not sense a component of gravity. **Strap-down systems**, by contrast, mount the gyros and accelerometers solidly to the aircraft chassis — one accelerometer per axis (longitudinal, lateral, vertical) and one gyro per axis (roll, pitch, yaw) — with a microprocessor resolving the raw signals into earth-related accelerations using computed pitch, roll and heading. Strap-down sensors must be roughly **10 times more sensitive** than those of a gimballed platform to achieve equivalent accuracy.

**Ring Laser Gyro (RLG):** two laser beams travel in opposite directions around a triangular cavity of temperature-stable glass (helium-neon gas, high voltage around 3,000 volts applied across the cathode/anodes). Rotation of the gyro shortens the path of one beam and lengthens the other, producing a frequency difference between the beams that is directly proportional to the angular rate of turn; this is detected optically as a fringe pattern. The helium-neon laser wavelength is **6,328 Angstroms (0.6328 µm / 632.8 nm)**, corresponding to a frequency of **474 × 10¹² Hz**. A **dither motor** vibrating the block eliminates "laser lock" near the zero-rate point.

**Earth rate compensation:** because the earth rotates, a platform that is level at one instant would otherwise appear to tip over every 24 hours; the earth's rotation rate as sensed at the equator is **15.04 degrees per hour**, reducing to zero at the poles, and the IRU computer subtracts this stored value from the gyro signal.

**Alignment:** on the ground, the IRS determines local vertical and true north from the sensed earth-rotation vector; coarse levelling brings pitch/roll within **1.0 degree**, followed by fine levelling and heading determination. Alignment is normally restricted to latitudes between **70°N and 70°S**, must be completed with the aircraft stationary, and takes a maximum of **10 minutes**. If the IRU detects excessive motion during alignment, the ALIGN annunciator flashes and the FAULT annunciator lights, requiring a restart. On loss of aircraft power, the IRU switches to battery power, providing a maximum of **30 minutes** of operation.

An IRU (or ADIRU, which also handles air data) provides pitch/roll attitude, magnetic and true heading, body linear accelerations and angular rates, inertial velocity (N-S, E-W, ground speed, track angle, vertical rate), navigation position (latitude, longitude, inertial altitude), and wind data.

## Flight Director

Introduced in 1950 as the original "Zero Reader," the **Flight Director (FD)** processes signals such as air data, radio, course and heading information, and vertical gyro data through an electronic computer, presenting "how to fly" steering commands on the command bars of the Attitude Director Indicator (ADI) and/or to an autopilot. Like an autopilot, a flight director system can be divided into four parts: **sensors**, **computer**, **controls**, and **loads**.

The key difference between a flight director and an autopilot: the **flight director provides steering commands to the human pilot**, who must follow them by keeping the command bars centred — the pilot effectively acts as a servo in a closed control loop. The **autopilot provides steering commands directly to the flight controls** via electric or hydraulic servos, with the pilot primarily monitoring, selecting modes, and intervening if needed. Both systems typically use the same input signals and operational modes.

**Example — heading select manoeuvre:** the aircraft flying heading 090° with 150° preselected: the roll command bar orders a right bank; once the correct bank is established the FD bar centres; as the aircraft approaches the selected heading, the roll bar orders a left control-wheel input to roll wings-level, and once at 150° the FD bars are centred.
        $cnt$,
        6
    ) RETURNING id INTO s1_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M13.4C Communication and Navigation Systems (Part 3) (22 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s1_id, 'The internationally recognised transponder code for a hijacking situation is:',
     '[{"id":"a","text":"7700","correct":false},{"id":"b","text":"7500","correct":true},{"id":"c","text":"7600","correct":false}]',
     '{"B2"}'),

    (s1_id, 'Each Mode S interrogation and reply (except the all-call reply) contains a discrete address of:',
     '[{"id":"a","text":"12 bits","correct":false},{"id":"b","text":"24 bits","correct":true},{"id":"c","text":"56 bits","correct":false}]',
     '{"B2"}'),

    (s1_id, 'TCAS II, as used by airline and larger commuter/business aircraft, provides resolution advisories (recommended escape manoeuvres) in:',
     '[{"id":"a","text":"The vertical direction only","correct":true},{"id":"b","text":"The horizontal direction only","correct":false},{"id":"c","text":"Both the horizontal and vertical directions","correct":false}]',
     '{"B2"}'),

    (s1_id, 'A TCAS Traffic Advisory (TA) is generated, relative to a predicted conflict, approximately:',
     '[{"id":"a","text":"40 to 45 seconds prior","correct":true},{"id":"b","text":"5 to 10 seconds prior","correct":false},{"id":"c","text":"2 to 3 minutes prior","correct":false}]',
     '{"B2"}'),

    (s1_id, 'Below what radio altitude is all TCAS resolution advisory suppressed?',
     '[{"id":"a","text":"500 ft","correct":true},{"id":"b","text":"1500 ft","correct":false},{"id":"c","text":"100 ft","correct":false}]',
     '{"B2"}'),

    (s1_id, 'Conventional airborne weather radar detects turbulence primarily by:',
     '[{"id":"a","text":"Measuring the Doppler frequency shift of the returned echo caused by moving rain droplets","correct":true},{"id":"b","text":"Measuring the absolute reflectivity of the rainfall only","correct":false},{"id":"c","text":"Comparing static and dynamic pressure readings","correct":false}]',
     '{"B2"}'),

    (s1_id, 'A Forward-Looking wind shear detection weather radar can detect a microburst, when the aircraft is below 1500 ft AGL, up to:',
     '[{"id":"a","text":"5 NM ahead of the flight path","correct":true},{"id":"b","text":"50 NM ahead of the flight path","correct":false},{"id":"c","text":"0.5 NM ahead of the flight path","correct":false}]',
     '{"B2"}'),

    (s1_id, 'Compared with an older parabolic-reflector weather radar antenna, a modern flat-plate (slotted waveguide) antenna:',
     '[{"id":"a","text":"Produces a narrower pencil beam and allows a substantial reduction in transmitted power","correct":true},{"id":"b","text":"Requires significantly higher transmitted power to achieve the same beam width","correct":false},{"id":"c","text":"Cannot be used for ground mapping","correct":false}]',
     '{"B2"}'),

    (s1_id, 'Compared with ILS, one of the key advantages of the Microwave Landing System (MLS) is:',
     '[{"id":"a","text":"Availability of 200 channels, five times more than the 40 available with ILS","correct":true},{"id":"b","text":"Complete elimination of the need for any distance-measuring equipment","correct":false},{"id":"c","text":"Operation entirely without a data communications function","correct":false}]',
     '{"B2"}'),

    (s1_id, 'The five functions into which the MLS system may be divided are approach azimuth, back azimuth, approach elevation, range, and:',
     '[{"id":"a","text":"Data communications","correct":true},{"id":"b","text":"Glide slope modulation","correct":false},{"id":"c","text":"Marker beacon identification","correct":false}]',
     '{"B2"}'),

    (s1_id, 'In a hyperbolic navigation system such as LORAN, position is determined by:',
     '[{"id":"a","text":"Comparing the arrival time difference of pulses from a MASTER and a SLAVE ground station","correct":true},{"id":"b","text":"Measuring the Doppler shift of a single ground transmitter","correct":false},{"id":"c","text":"Interrogating a satellite and timing the round-trip delay","correct":false}]',
     '{"B2"}'),

    (s1_id, 'Doppler radar navigation is described in the text as being particularly suited to helicopters because:',
     '[{"id":"a","text":"It is independent of rotor interference, unlike satellite navigation reception","correct":true},{"id":"b","text":"It requires a ground installation near the helicopter''s base","correct":false},{"id":"c","text":"It only functions below 500 feet AGL","correct":false}]',
     '{"B2"}'),

    (s1_id, 'In the Doppler navigation worked example, a stationary transmitter radiating at 3,000 MHz is approached by a receiver moving at 3,600 km/h (1 km/s). The resulting Doppler frequency shift is approximately:',
     '[{"id":"a","text":"10 kHz","correct":true},{"id":"b","text":"1 MHz","correct":false},{"id":"c","text":"100 Hz","correct":false}]',
     '{"B2"}'),

    (s1_id, 'The GPS Space Segment nominally consists of:',
     '[{"id":"a","text":"24 satellites (21 operational plus 3 active spares) in six orbital planes","correct":true},{"id":"b","text":"6 satellites in a single geostationary orbital plane","correct":false},{"id":"c","text":"100 satellites distributed randomly around the earth","correct":false}]',
     '{"B2"}'),

    (s1_id, 'The civilian coarse/acquisition (C/A) mode of GPS provides an accuracy of approximately:',
     '[{"id":"a","text":"±100 metres","correct":true},{"id":"b","text":"±16 metres","correct":false},{"id":"c","text":"±1 metre","correct":false}]',
     '{"B2"}'),

    (s1_id, 'A fundamental operational difference between DME and GPS is that:',
     '[{"id":"a","text":"DME is an active system requiring interrogation, while GPS is a passive system requiring none","correct":true},{"id":"b","text":"GPS requires interrogation from the aircraft, while DME is entirely passive","correct":false},{"id":"c","text":"Both systems require the ground station to interrogate the aircraft first","correct":false}]',
     '{"B2"}'),

    (s1_id, 'For GPS to resolve a full three-dimensional position (latitude, longitude and altitude) plus time, the minimum number of satellites that must be in view is:',
     '[{"id":"a","text":"Four","correct":true},{"id":"b","text":"Two","correct":false},{"id":"c","text":"Eight","correct":false}]',
     '{"B2"}'),

    (s1_id, 'In a strap-down inertial reference system, compared with a gimballed platform system, the gyros and accelerometers are:',
     '[{"id":"a","text":"Mounted solidly to the aircraft chassis, with no gimbals to keep them level with the earth''s surface","correct":true},{"id":"b","text":"Mounted on a gyro-stabilised gimballed platform kept level at all times","correct":false},{"id":"c","text":"Suspended in a fluid bath to isolate them from aircraft vibration","correct":false}]',
     '{"B2"}'),

    (s1_id, 'The frequency difference between the two counter-rotating beams in a Ring Laser Gyro is:',
     '[{"id":"a","text":"Directly proportional to the angular rate of turn about the gyro''s axis","correct":true},{"id":"b","text":"Always zero regardless of rotation","correct":false},{"id":"c","text":"Proportional only to linear acceleration, not rotation","correct":false}]',
     '{"B2"}'),

    (s1_id, 'The earth''s rotation rate, as sensed at the equator and compensated for by the IRU computer, is approximately:',
     '[{"id":"a","text":"15.04 degrees per hour","correct":true},{"id":"b","text":"1.5 degrees per hour","correct":false},{"id":"c","text":"360 degrees per hour","correct":false}]',
     '{"B2"}'),

    (s1_id, 'An Inertial Reference Unit (IRU) alignment must normally be initiated within which latitude band, and takes a maximum alignment time of:',
     '[{"id":"a","text":"70°N to 70°S, maximum 10 minutes","correct":true},{"id":"b","text":"90°N to 90°S, maximum 1 hour","correct":false},{"id":"c","text":"45°N to 45°S, maximum 1 minute","correct":false}]',
     '{"B2"}'),

    (s1_id, 'The essential difference between a flight director and an autopilot is that:',
     '[{"id":"a","text":"The flight director provides steering commands for the pilot to follow, while the autopilot drives the flight controls directly via servos","correct":true},{"id":"b","text":"The autopilot only displays commands for the pilot to follow, while the flight director drives the controls directly","correct":false},{"id":"c","text":"There is no functional difference between the two systems","correct":false}]',
     '{"B2"}');

END $$;
