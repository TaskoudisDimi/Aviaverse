-- Module 13: Aircraft Aerodynamic Structures (B2) — Communication and Navigation Systems (Part 2)
-- Source: EASA Part-66 Module 13 official textbook (IKAROS Aviation Training Centre, IK M13, Issue Oct.2012)

DO $$
DECLARE
    m13_id INT;
    s1_id  INT;
BEGIN
    SELECT id INTO m13_id FROM easa_modules WHERE code = 'M13';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M13.4B') THEN
        RAISE NOTICE 'M13.4B already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 13.4B: Communication and Navigation Systems (Part 2)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m13_id, 'M13.4B', 'Communication and Navigation Systems (Part 2)',
        $cnt$
# Communication and Navigation Systems (Part 2)

## Cockpit Voice Recorder (CVR)

A voice recorder records flight crew communication and cockpit conversation. The microphone pick-ups are always "hot" and require no keying. The pick-ups are all in the cockpit, but the actual recorder is located near the tail of the aircraft in a fire-resistant box, painted bright orange with white fluorescent tape stripes so it is easily identified among wreckage. An underwater locator beacon (ULB) is fitted on the front panel of the recorder.

The recording is kept of the **last 30 minutes** of flight crew communication and conversation, and is used in combination with the flight data recorder for accident investigation.

**Recording channels:**

| Channel | Signal |
|---------|--------|
| 1 | All selected audio from the captain's audio station |
| 2 | All selected audio from the first officer's audio station |
| 3 | All selected audio from the observer's audio station, plus time reference signals from the flight data recording system |
| 4 | All area-sound signals from the flight compartment microphone |

**Power:** The voice recorder gets electrical power automatically when one engine is started (fuel levers open) or the aircraft is in flight. A time delay relay removes power from the recorder 5 minutes after the aircraft is on the ground and all fuel levers are closed. Power can also be applied manually with the CVR/FDR GND CONT push-switch on the avionics switch panel; automatic power switching overrides manual switching.

**Erase function:** The ERASE pushbutton lets the pilots erase the recorded information after a successfully completed flight. It is only operative when the aircraft is on the ground with the parking brake set. Pushing it applies 115 V AC to a bulk erase coil; holding it for at least 2 seconds and the resulting 400 Hz magnetic field completely erases the tape.

**Recorder:** The magazine contains an endless tape, a bulk erase coil, an erase head, recording heads and a monitor head. Before the tape passes the record heads it first passes the erase head. The tape unit can be endless, or automatic-reversing after 15 minutes to continue recording on other 4 tracks; after another 15 minutes the recorder begins to overwrite the previous 30-minute-old recording.

**Solid State CVR (Flash Crash Survivable Store Unit, FCSSU):** Non-volatile flash memory with no moving parts, encased in a crash-hardened titanium alloy unit.

- Storage capacity: 4 channels for 30 minutes high fidelity, or all channels up to 4 hours low fidelity
- Acceleration surviving: 3,400 g's
- Force to withstand: 5,000 lb
- Deep sea pressure: 20,000 ft (6,096 m)
- Temperature to survive: 1,100 °C

## Underwater Locator Beacon (ULB)

The ULB is a battery-operated underwater acoustic pulse generator that is activated when the switch end is immersed in either fresh or salt water. The water switch is part of a low-current triggering circuit which, when closed by a resistance of less than a few thousand ohms (such as immersion in water), initiates normal pulsing of the beacon oscillator circuit. The oscillator's output drives a piezoceramic transducer that radiates **37.5 kHz** acoustic energy into the surrounding water.

The pulses are of 10-millisecond nominal duration and occur once per second. The beacon operates continuously for **at least 30 days** after being immersed, withstands depths to 20,000 ft, and can be detected at a range of 2,000 to 4,000 yards depending on sea state and ambient noise. The internal battery must be replaced every **2 to 6 years**.

## Emergency Locator Transmitter (ELT)

An ELT is a small, self-contained radio transmitter mounted where it is least likely to be damaged in a crash. It has an inertia switch that closes in the event of a crash and starts the transmitter emitting down-sweeping tones **simultaneously** on two emergency frequencies: **121.5 MHz** (VHF band) and **243.0 MHz** (UHF band). The audio signal down-sweeps from 1,600 Hz to 300 Hz, repeated 3 times a second. The battery has a design life long enough to operate the transmitter continuously for **48 hours**.

ELTs are installed as far aft in the fuselage as practical and connected to a flexible whip or external antenna. The installation orients the inertia switch to be sensitive to a force of approximately **5 g** along the longitudinal axis of the aircraft.

**3-position toggle switch:**

| Position | Function |
|----------|----------|
| OFF | Transmitter disabled |
| AUTO | Automatic control; if the unit senses a shock of at least 5 g for a duration of 11 msec, the transmitter starts automatically |
| ON / MAN-RESET | Transmitter starts to transmit; also resets the automatic transmission when switched to ON and back to AUTO |

An ELT can be tested by removing it to a shielded room to prevent a false alert, or with an operational check in the aircraft of no more than **three audible sweeps**, and this test must be conducted within the first five minutes after any full hour. Orbiting COSPAS-SARSAT satellites can locate the signal by Doppler effect to approximately **14 km**.

## Automatic Direction Finder (ADF)

The ADF is a historic short- and medium-range radio navigation aid which receives and interprets signals from a non-directional broadcasting ground station (NDB). Bearing information comes from the combination of signals received from **two loop antennae**, positioned **90° apart** on the aircraft structure, and from **one omni-directional sense antenna** whose signal is not affected by relative bearing. An additional Morse signal identifies the selected ground station. The ADF operates in the LF/MF frequency band, approximately **190–1750 kHz**.

The direction-sensitive loop antenna receives a stronger or weaker signal depending on its position in the transmitter's field; rotating the loop 360° produces two maxima and two minima. Combining the loop signal with the non-directional sense antenna signal resolves the ambiguity and gives the correct bearing to the NDB. A beat frequency oscillator (BFO) is used when the ADF is tuned to an unmodulated (non-modulated Morse, CW) transmitter, since most radio beacons are modulated and the BFO is not normally switched in.

**Bearing indicators:**
- **Relative Bearing Indicator (RBI)** — the oldest type; the heading scale is always fixed and not rotatable. The pointer shows the relative bearing (angle between the aircraft's longitudinal axis and the tuned station).
- **Radio Magnetic Indicator (RMI)** — the heading dial rotates automatically with the compass system; the pointer shows the direction toward the tuned NDB as an absolute bearing (QDM).

## VHF Navigation Overview

## VOR — VHF Omnidirectional Range

The VOR is a medium-range radio navigation aid that receives, decodes and processes bearing information from an omnidirectional ground station. It operates in the frequency range **108.00–117.95 MHz**.

The VOR system provides:
- Bearing information from the phase difference between two signals transmitted by the ground station
- Aircraft angular position with respect to a selected course
- TO/FROM indication with respect to a selected course
- A Morse identification signal

**Reference and variable signals:** A VOR carrier is simultaneously frequency- and amplitude-modulated. The **reference signal (FM)** is constant in all directions. The **variable signal (AM)**'s phase differs from the reference signal according to the direction in which it leaves the station. The phase difference between the two determines the aircraft's line of position.

**Line of position:** The magnetic course flown TO a station (in no wind) is called the **track or QDM**. The magnetic course leading away FROM a station is called the **radial or QDR**.

**Classic VOR emissions:** The carrier is amplitude-modulated by a 9,960 Hz subcarrier, which is itself frequency-modulated (±480 Hz) by the 30 Hz reference phase signal. A rotating sideband antenna radiates a lobe pattern at 30 revolutions per second, producing the 30 Hz variable phase signal. Accuracy is approximately **3–5°**.

**Cone of Silence:** Overflying a VOR station, the directional component of the signal directly overhead is not usable for direction-finding; this "cone of silence" (or "zone of confusion") gives unusable reception and navigation guidance.

**Doppler VOR (D-VOR):** To increase accuracy, many VOR stations use the Doppler effect. The reference phase is the carrier amplitude-modulated by 30 Hz; the variable phase is received as a 30 Hz FM signal produced by the Doppler effect from a ground antenna of 39 dipoles arranged in a circle, rotating a 9,960 Hz-modulated carrier around 360° in 1/30 second. Aircraft equipment is identical to that used for classic VOR. Accuracy is approximately **0.5°**.

**Indication:** The Radio Magnetic Indicator (RMI) shows the VOR bearing (QDM) automatically once a station is tuned. With manual VOR, the pilot selects a desired course at the course selector; the display then shows VOR deviation (each dot representing 5° of lateral deviation), course error, TO/FROM indication, and a warning flag that activates when reception is too weak (e.g., aircraft out of VOR range, or equipment malfunction).

## Instrument Landing System (ILS)

The ILS allows the aircraft to follow an optimum descent. The descent axis is determined by the **intersection of a localizer beam and a glide slope beam**, created by ground stations. The ILS allows measurement and display of angular deviations, and also detects a Morse audio identification signal from the ground station.

### Localizer

The localizer transmitter is located at the end of the runway and operates in the frequency range **108.10–111.95 MHz**. It transmits two beams: the beam on the **right** side of the runway centre line has **150 Hz** modulation, and the beam on the **left** side has **90 Hz** modulation. When the aircraft is on the extended centre line, both signals are received with equal strength; deviation from the centre line is measured by comparing the strength of the 90 Hz and 150 Hz signals.

If the aircraft is to the right of the centre line (150 Hz area), the needle deflects left to show the runway is to the left; if to the left of centre line (90 Hz area), the needle deflects right. The needle deflects full scale at approximately 2.5 dots off centre line, corresponding to about 1,500 feet at five miles out.

### Glide Slope

The glide slope transmitter is located near the beginning of the runway and transmits on a channel in the UHF range (in the approximate 329–335 MHz band), giving vertical guidance along a glidepath of approximately **3°**. Like the localizer, the glide slope beams are modulated with 90 Hz and 150 Hz: the **90 Hz** beam is **above**, and the **150 Hz** beam is **below**, the 3° glidepath. If the aircraft is above the glide slope (90 Hz area), the pointer is driven down to instruct the pilot to fly down; if below (150 Hz area), the pointer is driven up to instruct the pilot to fly up.

### Receiver and System

The ILS receiver contains two independent receivers — localizer and glide slope. If two or more ILS receivers are installed, all must be tuned to the same frequency, which is especially important at airports with parallel runways. Glide slope channels are automatically paired with a specific localizer frequency. The VOR and localizer functions of the ILS share the same VHF antenna.

## Marker Beacon

The Marker system is a radio navigation aid that determines the distance between the aircraft and the runway threshold. When the aircraft overflies a marker transmitter, aural and visual indications are given to the flight crew. Markers operate on a frequency of **75 MHz** with A2 modulation, keyed with one of three audio tones for identification.

Two types of markers are used:
- **Z-Marker** — a cone-shaped vertical beam, used to mark a crossing point of airways or to fill the cone of silence over an NDB
- **Fan-Marker** — a fan-shaped beam, used to mark important positions along airways and to give distance-to-threshold information on approach and landing

According to ICAO recommendations, airway markers should reach at least 20,000 ft and ILS markers 6,000 ft in altitude. The marker receiver antenna, mounted on the bottom of the fuselage, receives the horizontally polarized signal that markers transmit vertically upward.

## DME — Distance Measuring Equipment

DME provides a digital read-out of the aircraft's **slant range distance** (in nautical miles) from a selected ground station. An onboard interrogator sends interrogation pulses to a ground station, which replies; the interrogator determines distance from the time difference between interrogation and reply, and can also detect the station's Morse identification.

DME operates around **1 GHz**, on 252 channels paired with VHF NAV frequencies:
- The interrogator transmitter operates in the range **1025 to 1150 MHz**
- The ground station transmitter operates in the range **962 to 1213 MHz**, always **63 MHz** above or below the interrogator's frequency

Selecting a VOR frequency automatically selects the paired DME frequency. Where DME is co-located with an ILS runway, the ground station's built-in reply delay of **50 microseconds** is reduced to compensate for the offset between the runway threshold and the DME ground station location. The DME ground station transmits its identity as a Morse-code burst of three letters at an audio tone of **1350 Hz once every 30 seconds**.

**DME interrogator modes:**

| Mode | Description |
|------|-------------|
| Standby | No reception of an active or squittering ground station; dashes shown |
| Search | A delay counter runs from zero to maximum delay to match the received signal; pulse repetition rate 40–150 pulse-pairs/sec |
| Track | Counter has locked on and tracks slowly to maintain the match; pulse repetition rate 16–40 pulse-pairs/sec |
| Memory | If replies are lost, the interrogator holds a static or velocity-based readout for normally 4–12 seconds while it tries to re-track the station |

**TACAN** (TACtical Air Navigation) is a military rho-theta (distance-angle) navigation system; range and bearing can be determined from a single TACAN station. Its distance-measuring part is identical in operation to DME, and a civil aircraft equipped with DME can use any TACAN station for distance determination.

The maximum range of an airway DME is up to **300 NM**; terminal DME beacons (co-located with terminal VOR beacons of restricted coverage) have a nominal range of **25 NM**.

## Area Navigation (RNAV) and Flight Management System (FMS)

**Area Navigation (RNAV)** is a navigation and guidance system that uses VOR bearing, DME slant ranging, and barometric altitude as its basic signal inputs to compute course and distance to a waypoint. Since it can only function within the service area of a VOR/DME station, it cannot be used for oceanic navigation, which instead requires inertial reference or GPS inputs.

- **Rho-Theta mode:** using a known DME distance (Rho) and VOR bearing (Theta), the system computes distance and track angle to the waypoint.
- **Rho-Rho method:** an improvement over Rho-Theta using two DME distances instead, giving improved position accuracy. Rho-Rho is the preferred method of area navigation.

The **Flight Management System (FMS)** compares a pilot-selected flight plan with the actual horizontal and vertical aircraft position, and issues steering and thrust commands when a difference exists. The FMS/ANS computes its position ("FM position") by blending several sources:

| Source | Description | Accuracy |
|--------|-------------|----------|
| Mix IRS position | Weighted mean average of the three onboard IRS positions | 2 NM/h |
| Radio position | Computed from navaids such as DME/DME, VOR/DME, LOC | 0.3 NM |
| GPS position | Used when GPS data meet integrity criteria (GPS Primary) | less than 0.3 NM |

The FMS uses information from its navigation database to automatically tune the navaids (ILS, VOR, DME) and measure the aircraft's position, direction and velocity. The navigation database (flight plans, navaid data) must be updated every **28 days**. FMS functions combine lateral navigation, vertical (profile) navigation, and full performance management (fuel and thrust optimisation).

## Radio Altimeter

The Radio Altimeter System determines the height of the aircraft above the terrain during initial climb, approach and landing phases. It transmits a frequency-modulated signal from the aircraft to the ground and receives the ground-reflected signal after a delay proportional to the aircraft's height.

- Frequency: approximately **4.3 GHz**
- Maximum height: **2,500 feet**
- Transmitter (VCO) sweeps through a frequency band from 4,239 MHz to 4,362 MHz (an FM sweep of 123 MHz)

The radio altitude is sent to the EFIS or conventional indicators, the flight data recorder, the flight warning system (altitude call-outs), the ground proximity warning system, and the autopilot (for automatic landings, during which the RT Unit's self-test is inhibited to prevent a false manoeuvre). The DH (decision height) light illuminates, with an audible tone, when aircraft height is equal to or lower than the selected decision height. Below **400 feet**, radio altitude is announced automatically by a synthetic voice generated by the Flight Warning Computer.

## Ground Proximity Warning System (GPWS / EGPWS)

A GPWS senses the nearness of the ground and warns the pilot if the aircraft gets too close to the ground when not configured for landing. It monitors the radio altimeter for actual height above ground, and the air data computer, ILS, and landing gear/flap position to determine if the aircraft is properly configured.

| Mode | Condition | Aural warning |
|------|-----------|----------------|
| 1 | Excessive rate of descent below 2,450 ft radio altitude | "SINKRATE" or "WHOOP! WHOOP! PULL UP!" |
| 2 | Terrain rising at an excessively fast rate (excessive terrain closure) | "TERRAIN" or "WHOOP! WHOOP! PULL UP!" |
| 3 | Altitude loss after takeoff or missed approach | "DON'T SINK" |
| 4 | Insufficient terrain clearance with gear up or flaps not in landing configuration | "TOO LOW GEAR" or "TOO LOW FLAPS" |
| 5 | Aircraft sinks below the glide slope on ILS approach | "GLIDE SLOPE GLIDE SLOPE" |
| 6 | Altitude call-outs (Decision Height, Minimums, Approaching Minimums) and excessive bank angle alerts | Synthetic voice call-outs |
| 7 | Excessive wind shear during take-off or final approach (optional) | Aural, visual and ARINC 429 output indications |

Mode 6 "Excessive Bank Angle" aural alerts are given twice and then suppressed unless roll angle increases by a further 20%.

**EGPWS (Enhanced GPWS)** adds terrain alerting and display functions, using aircraft position, altitude, and an internal terrain database to predict conflicts between the flight path and terrain:
- **Terrain Awareness Display (TAD)** — predicts terrain conflict and displays terrain on the Navigation Display; conflicting terrain is shown in solid yellow (Caution, approximately 60 seconds from impact) or solid red (Warning, approximately 30 seconds from impact), with the aural messages "Caution Terrain, Caution Terrain" or "Terrain, Terrain, Pull Up!"
- **Terrain Clearance Floor (TCF)** — creates an increasing terrain clearance envelope around the intended airport runway, active during takeoff, cruise and final approach, and improves low-terrain warning at airports whose approach/departure profiles are not fully compatible with standard GPWS.

## ATC Transponder and Secondary Surveillance Radar (SSR)

The ATC transponder is an integral part of the Air Traffic Control Radar Beacon System (ATCRBS). It is interrogated by radar pulses from the ground station and automatically replies with coded pulses that supply identification and automatic altitude reporting. The transponder also responds to interrogation from aircraft equipped with a Traffic Collision Avoidance System (TCAS).

The ATCRBS combines **Primary Surveillance Radar (PSR)**, which provides bearing and range of an aircraft by timing the reflected RF beam and noting the antenna bearing angle, with **Secondary Surveillance Radar (SSR)**, which provides altitude and identification by interrogating the aircraft transponder.

**Interrogation:** The SSR interrogates the transponder with two pulses, P1 and P3, whose spacing determines the mode:
- **Mode A** (identity): P1–P3 spacing **8 microseconds**
- **Mode C** (altitude): P1–P3 spacing **21 microseconds**

A third pulse, P2, is radiated by an omnidirectional antenna 2 microseconds after P1, allowing the transponder to detect and reject side-lobe interrogations (if P2 is within 6 dB of P1, the transponder suppresses replies for 35 microseconds). Interrogations are received at **1030 MHz**; replies are transmitted at **1090 MHz** with approximately **600 Watt**.

**Reply:** Mode A/C replies use two framing pulses spaced **20.3 microseconds** apart, containing thirteen information pulses. These pulses make up the **4,096 (2^12)** possible identification codes selectable by the pilot.
        $cnt$,
        5
    ) RETURNING id INTO s1_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M13.4B Communication and Navigation Systems (Part 2) (21 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s1_id, 'The Cockpit Voice Recorder normally keeps a recording of:',
     '[{"id":"a","text":"The last 30 minutes of flight crew communication and conversation","correct":true},{"id":"b","text":"The entire flight from engine start to shutdown","correct":false},{"id":"c","text":"Only the last 5 minutes before touchdown","correct":false}]',
     '{"B2"}'),

    (s1_id, 'On a CVR control panel, the ERASE pushbutton is operative only when:',
     '[{"id":"a","text":"The aircraft is airborne above 10,000 feet","correct":false},{"id":"b","text":"The aircraft is on the ground with the parking brake set","correct":true},{"id":"c","text":"Both engines are shut down and the battery is disconnected","correct":false}]',
     '{"B2"}'),

    (s1_id, 'The Underwater Locator Beacon (ULB) fitted to a CVR/FDR transmits acoustic pulses at a frequency of approximately:',
     '[{"id":"a","text":"37.5 kHz","correct":true},{"id":"b","text":"7.5 kHz","correct":false},{"id":"c","text":"375 kHz","correct":false}]',
     '{"B2"}'),

    (s1_id, 'An Emergency Locator Transmitter (ELT), when triggered, transmits down-sweeping tones simultaneously on:',
     '[{"id":"a","text":"121.5 MHz and 243.0 MHz","correct":true},{"id":"b","text":"108.0 MHz and 118.0 MHz","correct":false},{"id":"c","text":"75 MHz only","correct":false}]',
     '{"B2"}'),

    (s1_id, 'The battery fitted to an ELT has a design life sufficient to operate the transmitter continuously for:',
     '[{"id":"a","text":"48 hours","correct":true},{"id":"b","text":"8 hours","correct":false},{"id":"c","text":"5 days","correct":false}]',
     '{"B2"}'),

    (s1_id, 'To obtain bearing information, the ADF system combines signals from:',
     '[{"id":"a","text":"Two loop antennae positioned 90° apart and one omni-directional sense antenna","correct":true},{"id":"b","text":"A single rotating parabolic dish antenna","correct":false},{"id":"c","text":"Two identical sense antennas positioned 180° apart","correct":false}]',
     '{"B2"}'),

    (s1_id, 'Compared with the Relative Bearing Indicator (RBI), the Radio Magnetic Indicator (RMI):',
     '[{"id":"a","text":"Has a heading dial that rotates automatically with the compass system, showing absolute bearing (QDM)","correct":true},{"id":"b","text":"Has a fixed heading scale that never rotates, showing only relative bearing","correct":false},{"id":"c","text":"Cannot be used with either ADF or VOR signals","correct":false}]',
     '{"B2"}'),

    (s1_id, 'The VOR system operates in the frequency range:',
     '[{"id":"a","text":"108.00–117.95 MHz","correct":true},{"id":"b","text":"190–1750 kHz","correct":false},{"id":"c","text":"962–1213 MHz","correct":false}]',
     '{"B2"}'),

    (s1_id, 'In VOR terminology, the magnetic course leading away FROM a radio station is called:',
     '[{"id":"a","text":"The radial or QDR","correct":true},{"id":"b","text":"The track or QDM","correct":false},{"id":"c","text":"The lubber line","correct":false}]',
     '{"B2"}'),

    (s1_id, 'Compared to classic VOR (accuracy approximately 3–5°), Doppler VOR (D-VOR) offers an accuracy of approximately:',
     '[{"id":"a","text":"0.5°","correct":true},{"id":"b","text":"10°","correct":false},{"id":"c","text":"25°","correct":false}]',
     '{"B2"}'),

    (s1_id, 'The ILS descent axis that an aircraft follows is determined by:',
     '[{"id":"a","text":"The intersection of a localizer beam and a glide slope beam","correct":true},{"id":"b","text":"A single VOR radial only","correct":false},{"id":"c","text":"DME slant range alone","correct":false}]',
     '{"B2"}'),

    (s1_id, 'On an ILS localizer, the beam on the right side of the runway centre line is modulated at:',
     '[{"id":"a","text":"150 Hz","correct":true},{"id":"b","text":"90 Hz","correct":false},{"id":"c","text":"400 Hz","correct":false}]',
     '{"B2"}'),

    (s1_id, 'On an ILS glide slope beam, the approximate angle of the glidepath and the modulation of the beam above it are:',
     '[{"id":"a","text":"Approximately 3°, with the beam above modulated at 90 Hz","correct":true},{"id":"b","text":"Approximately 10°, with the beam above modulated at 150 Hz","correct":false},{"id":"c","text":"Approximately 3°, with no modulation used above the path","correct":false}]',
     '{"B2"}'),

    (s1_id, 'Marker beacons used with the ILS operate on a frequency of:',
     '[{"id":"a","text":"75 MHz","correct":true},{"id":"b","text":"108 MHz","correct":false},{"id":"c","text":"1 GHz","correct":false}]',
     '{"B2"}'),

    (s1_id, 'A Fan-Marker, as distinct from a Z-Marker, is used to:',
     '[{"id":"a","text":"Mark important positions along airways and give distance-to-threshold information on approach","correct":true},{"id":"b","text":"Fill the cone of silence directly over an NDB only","correct":false},{"id":"c","text":"Replace the ILS glide slope transmitter","correct":false}]',
     '{"B2"}'),

    (s1_id, 'DME determines the distance between the aircraft and a ground station by:',
     '[{"id":"a","text":"Measuring the time difference between an interrogation pulse pair and the ground station''s reply","correct":true},{"id":"b","text":"Comparing the phase of two amplitude-modulated signals","correct":false},{"id":"c","text":"Measuring the Doppler shift of a continuous wave signal","correct":false}]',
     '{"B2"}'),

    (s1_id, 'A DME ground station transmits its Morse-code identification, consisting of a burst of three letters, at a tone of 1350 Hz:',
     '[{"id":"a","text":"Once every 30 seconds","correct":true},{"id":"b","text":"Continuously","correct":false},{"id":"c","text":"Once every 30 minutes","correct":false}]',
     '{"B2"}'),

    (s1_id, 'TACAN (Tactical Air Navigation) is best described as:',
     '[{"id":"a","text":"A military rho-theta system whose distance-measuring part operates identically to DME","correct":true},{"id":"b","text":"A civil-only VHF omnidirectional bearing system with no distance function","correct":false},{"id":"c","text":"A ground-based radar system unrelated to aircraft-borne interrogation","correct":false}]',
     '{"B2"}'),

    (s1_id, 'In Area Navigation (RNAV), the Rho-Rho method of position computation is preferred over Rho-Theta because it:',
     '[{"id":"a","text":"Uses two DME distances instead of a DME distance and a VOR bearing, giving improved accuracy","correct":true},{"id":"b","text":"Requires no ground stations at all","correct":false},{"id":"c","text":"Uses only barometric altitude for lateral position","correct":false}]',
     '{"B2"}'),

    (s1_id, 'A radio altimeter determines aircraft height above terrain by:',
     '[{"id":"a","text":"Transmitting a frequency-modulated signal and measuring the delay of the ground-reflected return","correct":true},{"id":"b","text":"Comparing static and dynamic pressure at the pitot-static system","correct":false},{"id":"c","text":"Interrogating a ground-based secondary surveillance radar","correct":false}]',
     '{"B2"}'),

    (s1_id, 'A GPWS Mode 4 warning, announced as "TOO LOW GEAR" or "TOO LOW FLAPS", occurs when:',
     '[{"id":"a","text":"There is insufficient terrain clearance while the landing gear is up or flaps are not in the landing configuration","correct":true},{"id":"b","text":"The aircraft descends below the selected decision height during an ILS approach","correct":false},{"id":"c","text":"The aircraft climbs too steeply immediately after takeoff","correct":false}]',
     '{"B2"}');

END $$;
