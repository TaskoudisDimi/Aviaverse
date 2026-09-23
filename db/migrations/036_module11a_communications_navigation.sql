-- Module 11A: Turbine Aeroplane (B1 only) — Communications and Navigation Radio Systems
-- Source: EASA Part-66 Module 11A official textbook (IKAROS Aviation Training Centre, IK01, Issue Oct.2012)

DO $$
DECLARE
    m11_id INT;
    s1_id  INT;
BEGIN
    SELECT id INTO m11_id FROM easa_modules WHERE code = 'M11';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M11A.6') THEN
        RAISE NOTICE 'M11A.6 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module M11A.6: Communications and Navigation Radio Systems
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m11_id, 'M11A.6', 'Communications and Navigation Radio Systems',
        $cnt$
# Communications and Navigation Radio Systems

## Selective Calling System (SELCAL)

The Selective Calling (SELCAL) system allows a ground station to call an aircraft, or a group of aircraft, using HF and VHF communications without the flight crew having to continuously monitor the ground station's frequency.

A coded signal is transmitted from the ground station and received by the aircraft's HF or VHF transceiver tuned to the appropriate frequency. The output code is fed to a SELCAL decoder, which activates aural and visual alerts if, and only if, the received code corresponds to the code selected in the aircraft.

There are a total of **10,920 codes** available. These codes are assigned to airline organisations, who in turn assign codes to their individual aircraft on either a flight-number or an aircraft-registration basis.

### SELCAL Control Panel

The SELCAL control panel consists of SELCAL warning lamps annotated to the associated radio system, i.e. VHF 1, VHF 2, HF 1 and HF 2. It also provides a means of resetting the SELCAL, thus cancelling the visual and audio indications. The panel also has a self-test button to allow testing of the SELCAL system. Normally located along with the control panel is the SELCAL code selection panel, used to set the aircraft's SELCAL code.

### SELCAL Decoder

The SELCAL decoder determines whether the aircraft's four-letter code has been received and produces alert signals in the form of indicators on the SELCAL control panel and audio tones to the audio system. The alerts are cancelled by pressing the corresponding alert light on the SELCAL control panel. A self-test of the alert lights and audio warnings is carried out using the self-test button on the SELCAL control panel.

## Cockpit Voice Recorder (CVR)

The CVR records the last **30 minutes** of flight deck audio on continuous magnetic tape. All voice communication is recorded. Operation is automatic from engine start until five minutes after engine shutdown. The CVR receives sound from the flight compartment and audio signals from the digital audio control system. Sensing of "aircraft-on-ground" and "parking-brake-set" is used to permit bulk erasure of the voice recording.

The system records on four channels:

1. **Channel 1** — Records the third crew member's summed microphone and telephone audio, or passenger address system audio.
2. **Channel 2** — Records the First Officer's summed microphone and telephone audio.
3. **Channel 3** — Records the Captain's summed microphone and telephone audio.
4. **Channel 4** — Records the control panel area microphone audio.

### Voice Recorder Control Panel

The control panel allows remote monitoring and testing of the voice recorder unit and controls bulk erasure of the recording tape. It contains an area microphone (capacitive) which senses compartment audio. Pressing the erase button for a minimum of **2 seconds** erases the tape — this is only possible when the aircraft is on the ground and the parking brake is set.

Pressing the TEST switch tests all 4 recording channels in sequence. The meter indicates green during TEST if the test tone is recorded at a sufficient level. The headset jack is used to monitor all 4 recorded channels.

### Voice Recorder Unit

The voice recorder unit makes a 30-minute recording of four audio channels on a continuous polyamide tape. The recorder is shock and heat resistant and contains an underwater locating beacon. It has a TEST switch to initiate an internal test signal to be recorded, and a phone jack to monitor the recording as it is made. The Status indicator provides monitoring of the tape transport operation and the recorded signal during test.

### Underwater Locator Device

The underwater locating device is a battery-operated acoustical beacon that is activated when the unit is submerged in water. The unit provides a usable signal for **30 days**. The battery replacement date decal is located on the front of the device.

## Aircraft Navigation Systems — Overview

Aircraft navigation is a matter of knowing the direction in which the aircraft is flying and its position in relation to the earth's surface. Modern aircraft carry various navigational aids to assist the crew, including:

- Very High Frequency Omni-Range (VOR)
- Distance Measuring Equipment (DME)
- Instrument Landing System (ILS)
- Marker Beacon System (MBS)
- Automatic Direction Finder (ADF)
- Air Traffic Control (ATC)
- Traffic Alert and Collision Avoidance System (TCAS)
- Inertial Navigation System (INS)
- Radio Magnetic Indicator (RMI)
- Global Positioning System (GPS)
- Compass Systems
- Radio Altimeter System (RADALT)
- Weather Radar

## VHF Omni-Range (VOR)

VOR is an international standard navigational beacon system enabling a number of aircraft to receive signals from a ground station and determine the bearing to the station, with respect to magnetic north. The VOR ground station continually broadcasts an infinite number of directional radio beams, or radials. The VOR signal received in the aircraft operates a visual indicator from which the pilot determines the bearing of the VOR station relative to the aircraft.

### VOR Operation

VOR operates in the frequency band from **108.00 to 117.95 MHz**. The ground station transmits signals in all directions (omni-directional) and modulates two 30 Hz signals on the carrier — a **reference signal** and a **variable signal**. The phase shift between the two signals depends on the radial over which they are transmitted: the radial in the magnetic north direction has a phase shift of 0°, magnetic east (090°) has a phase shift of 90°, magnetic south (180°) has a phase shift of 180°, and so on.

When the aircraft's VOR system detects the phase shift between the reference and variable signals, it knows on which radial the aircraft is flying. To obtain the bearing to the station (the opposite direction, from aircraft to ground station), the VOR system adds 180 degrees to the detected radial. Because the radial and bearing are both referenced to magnetic north, the VOR bearing output is a **magnetic bearing**, displayed on a Radio Magnetic Indicator (RMI).

VOR operates in the VHF band responding to horizontally polarised transmissions. It shares its frequency range with the Localiser facility of the ILS, and in doing so often shares the aerial system and much of the receiver unit. The VOR aerial is mounted on the fin (or flush-mounted on the nose section) and must be omni-directional.

## Distance Measuring Equipment (DME)

DME gives distance information from the aircraft to a DME ground station. The airborne system interrogates the ground station, which replies to every interrogation; the system detects the time delay between the transmitted interrogation and the received reply, and from this time delay the distance is calculated.

The DME frequency range is **960 to 1215 MHz**. All DME frequencies are paired with either VOR or ILS system frequencies — when a VOR or ILS frequency is selected, the associated DME facility is automatically selected too. In addition to the distance reply, identification tones (**1350 Hz**) are received from the ground station and may be heard as Morse code by the aircrew through headsets.

The DME system may interrogate several types of ground station within its frequency range:

1. **DME** — gives a reply on every DME interrogation.
2. **VOR/DME** — a combined VOR and DME station, giving VOR bearing and distance replies.
3. **ILS/DME** — a combined ILS and DME station, giving ILS guidance and distance replies.
4. **MLS/DME** — a combined Microwave Landing System (MLS) and DME station.
5. **TACAN** — a military station for bearing and distance; civil aircraft use only the distance replies.
6. **VOR/TAC** — a combined VOR and TACAN station, giving VOR bearing and distance replies.

Since many aircraft use the DME facility simultaneously, the airborne equipment must select only those replies that correspond to its own interrogations. A "**Search and Track**" circuit within the airborne equipment achieves this selection: it examines all received DME replies to determine which have a regular time relation to the aircraft's own transmitted interrogations, and the tracking unit then locks onto them.

## Instrument Landing System (ILS)

The purpose of ILS is to provide approach information to the pilot when, due to weather, the runway is obscured from view. A typical system allows the pilot to bring the aircraft to within **½ mile** of the runway and less than **200 ft** above the runway (the **Decision Height**) without external visual reference. At the Decision Height, the pilot must have visual contact with the runway and its surrounding environment to continue the landing; otherwise a missed approach procedure is carried out.

### ILS Categories

| Category | Decision Height | Runway Visual Range (RVR) |
|----------|------------------|----------------------------|
| **Cat I** | minimum 200 ft | 800 m |
| **Cat II** | below 200 ft, down to as low as 100 ft | down to 400 m |
| **Cat III A** | to and along the runway surface, with external reference in the final phase | minimum 200 m |
| **Cat III B** | to and along the runway and taxiway surfaces, with external reference in the final phase | minimum 50 m |
| **Cat III C** | to and along the runway and taxiways, without external visual reference | — |

### ILS Operation

ILS gives horizontal and vertical guidance to a runway using two radio signals:

1. The **Localizer** — for lateral guidance, from a transmitter at the end of the runway, operating in the frequency range **108.000–111.95 MHz**.
2. The **Glideslope** — for vertical guidance, from a transmitter at the beginning of the runway, operating in the frequency range **329.3–335 MHz**, giving a glidepath of approximately **3°**.

The Localizer transmits two beams: the beam on the right of the runway centreline is modulated at **150 Hz**, and the beam on the left is modulated at **90 Hz**. When the aircraft is on the extended centreline it receives both signals at equal strength; deviation from the centreline is measured by comparing the relative strength of the 90 Hz and 150 Hz signals.

The Glideslope beams are similarly modulated with 90 Hz and 150 Hz: the 90 Hz beam is above the 3° glidepath and the 150 Hz beam is below it. Deviation from the glidepath is measured the same way, by comparing the strength of the two modulation signals.

### LOC/GS Signal Processing

The Localizer and Glideslope receivers operate in the same manner, with RF, IF and AF stages. The AF detector output produces separated 90 Hz and 150 Hz signals via filters. These two signals are first **summed**: if the result is more than **250 mV**, the LOC/GS warning flag goes out of view (signal valid); if less than 250 mV, the flag remains in view (signal invalid). The two signals are also compared in a **difference** circuit: if the 90 Hz and 150 Hz signals are of equal amplitude they cancel, giving a 0 V output and a centred deviation bar (aircraft on the centreline / glidepath). If one signal is stronger, the resulting voltage drives the deviation bar to give a fly-left/fly-right (localizer) or fly-up/fly-down (glideslope) indication.

## Marker Beacon System (MBS)

To inform the pilot of the aircraft's progress along the centreline and glideslope during an ILS approach, a system of marker beacons is used. All marker beacon frequencies are modulated on a **75 MHz** carrier.

| Marker | Indicator Light | Tone | Purpose |
|--------|------------------|------|---------|
| **Outer marker** | Blue | 400 Hz | Usually located directly below the point where an aircraft on the localizer course should intersect the glideslope and start descending |
| **Middle marker** | Amber | 1300 Hz | Located near the runway, usually under a point on the glidepath where a descent could be discontinued |
| **Inner marker** | White | 3000 Hz | Virtually non-existent with Cat II & Cat III ILS; now used as an "Airways" marker for en-route navigation or as a holding point above an airport |

The outer and middle markers are associated with the ILS approach itself.

## Automatic Direction Finder (ADF)

The ADF system detects the direction to a Non-Directional Beacon (NDB) and receives audio identification from the NDB. The ADF system displays the direction to the NDB on the instruments with a bearing pointer, and operates in the frequency range **190 to 1750 kHz**.

The NDB ground station transmits an AM (Amplitude Modulated) signal in a circular pattern in all directions. The radio energy induces RF signals in a combined loop and sense antenna; the receiver antenna signals are measured in the ADF receiver and calculated to give relative station bearing.

### Loop Aerial and Station Line

A "loop aerial" is very sensitive to its directional position: when pointing towards the transmitter, it receives a null signal, but when pointing away from the transmitter, it receives a strong signal. This property is used to automatically find the direction of the transmitter relative to the aircraft heading, displayed on the Radio Magnetic Indicator (RMI).

By turning the loop aerial to either of its two null positions, the direction of a line joining the receiver with the transmitting station can be determined — this is called the "**Station Line**". Because there are two nulls, 180° apart, the transmitter could be in either of two opposite directions, causing ambiguity.

### Resolving the Ambiguity

To resolve this ambiguity, a second aerial (the sense aerial) is introduced, which combines its horizontal polar diagram with that of the loop aerial to produce a new heart-shaped polar diagram called a "**Cardioid**". In modern aircraft the loop aerials are more streamlined and do not physically rotate — they are rotated electronically. The **fixed loop** antenna is preferred because it is more trouble-free, having fewer moving parts; it consists of two loops orientated at 90° to each other, each connected to an individual stator of a receiving resolver within the ADF receiver.

## Air Traffic Control Radar Beacon System (ATCRBS) and Mode S

### Transponders

Transponders are a "means of identification" rather than navigation equipment. Ground control uses two types of radar:

1. **Primary radar** — a reflection-type radar system providing a symbol for every aircraft in the area, requiring no response from the aircraft.
2. **Secondary radar** — uses an "ATC Transponder" in the aircraft, a transmitter/receiver that transmits in response to an interrogation from the ground secondary surveillance radar.

The aircraft's transponder reply can include a special code identifying that aircraft on the ground controller's scope; pressing the "Ident" button on the control panel changes the display to identify the aircraft to the controller. The transponder can also transmit the aircraft's altitude.

The ground station transmits its interrogation pulse on **1030 MHz** as a three-pulse signal; the space between the first and third pulse signifies the mode of reply required. The system operates in four modes:

1. **Mode A** — Identify.
2. **Mode B** — Obsolete.
3. **Mode C** — Pressure Altitude.
4. **Mode D** — Unassigned.

In **Mode A**, the transponder replies with a unique identification code. In **Mode C**, the aircraft's Air Data System supplies altitude information for use in the reply, allowing the ground controller to ascertain the aircraft's altitude as well as its identity. Transponder replies are transmitted on **1090 MHz**. A suppression pulse (P2) prevents the aircraft replying to interrogations received via the antenna's sidelobes rather than its main beam.

### Mode S Transponders

After 1989, a new type of ATC system was introduced, called **Mode S** (Mode Select). New interrogators and transponders, called ATCRBS/Mode S, can work with either old ATCRBS-only equipment or new Mode S equipment. One of the most important aspects of Mode S is the ability to **discretely address** one aircraft, using its unique **24-bit Mode S address**, so that only the specific aircraft interrogated responds, instead of all transponder-equipped aircraft within range.

A Mode S ground station enters the address and location of a Mode S aircraft into a roll-call file; on the next scan it discretely addresses that aircraft. The discrete interrogation may contain a command field that desensitises the transponder to further Mode S all-call interrogations — this is called "**Mode S lockout**". ATCRBS interrogations from ATCRBS-only interrogators are not affected by this lockout. If the aircraft does not receive an interrogation for **16 seconds**, the transponder automatically cancels the lockout.

## Traffic Alert and Collision Avoidance System (TCAS)

TCAS is an airborne traffic alert and collision avoidance advisory system that operates **without support from ATC or ground stations**. TCAS detects nearby intruder aircraft equipped with transponders that reply to ATCRBS Mode C or Mode S interrogations, tracks and evaluates their threat potential, and provides traffic advisory alerts and vertical manoeuvring resolution advisories to help the crew avoid mid-air collisions. TCAS provides **no protection against aircraft without an operating transponder**.

- **TCAS I** — provides proximity warning only, to assist visual acquisition of intruder aircraft; used by smaller commuter and general aviation aircraft.
- **TCAS II** — provides traffic advisories (TA) and vertical resolution advisories (RA, recommended escape manoeuvres); used by airline, larger commuter and business aircraft.
- **TCAS III** — still under development at the time of writing; would add horizontal, as well as vertical, resolution advisories.

### Tracking and Range

When a Mode S or Mode C intruder is acquired, TCAS tracks it using repetitious interrogations in Mode S and Mode C. Measuring the time between interrogation transmission and reply reception allows TCAS to calculate the range of the intruder; if the intruder's transponder provides altitude in its reply, TCAS can also determine relative altitude. The range of TCAS is about **30 NM** in the forward direction.

### Aural Annunciation

The words "**Traffic, Traffic**" are annunciated at a traffic advisory, directing the pilot to the TA display. If the encounter does not resolve itself, a resolution advisory is annunciated, such as "**Climb, Climb, Climb**" (climb at the rate shown on the RA indicator, normally 1500 fpm) or "**Descend, Descend, Descend**". The single announcement "**Clear of Conflict**" indicates the encounter has ended and the pilot should smoothly return to the previous clearance.

### Self-Test

Self-test can be initiated on the ground or in flight by pressing the control unit TEST button. The aural annunciation "**TCAS TEST**" is heard and a test pattern appears on the display for **eight seconds**, after which "**TCAS TEST PASS**" or "**TCAS TEST FAIL**" is aurally announced.

### Mode Control Selector

The TCAS mode control selector switch is labelled **STBY–ALT RPTG OFF–XPNDR–TA–TA/RA**. The system is activated by selecting TA or TA/RA. In the **ABV** altitude-range mode the display shows 7,000 ft above and 2,700 ft below the aircraft; in **BLW** mode it shows 2,700 ft above and 7,000 ft below; in **Normal (N)** mode it shows 2,700 ft above and below.

## Inertial Navigation System (INS) / Inertial Reference System (IRS)

The modern inertial navigation system is the only self-contained single source for all navigation data. After being supplied with initial position information, it continuously updates extremely accurate displays of the aircraft's **position**, **ground speed**, **attitude** and **heading**, and can also provide guidance and steering information for the autopilot and flight instruments.

### INS Operation

The basic measuring instrument of the INS is the **accelerometer**. Two accelerometers are mounted in the system — one measuring accelerations in the north-south direction and one in the east-west direction. When the aircraft accelerates, the accelerometer produces a signal proportional to the acceleration. This signal passes through a first integrator (a time-multiplication device) to produce **velocity**, then through a second integrator to produce **distance**. If the computer knows the latitude and longitude of the starting point, and the distance travelled north/south and east/west, it can calculate the aircraft's present position.

To maintain the accelerometers correctly orientated, they are mounted on a gimballed **platform**, which also contains gyroscopes to stabilise it against the aircraft's attitude changes.

### Earth Rate Compensation

Because the earth rotates in space, a space-orientated gyro appears to rotate with respect to an earth-bound observer, making it unsuitable as an earth-fixed reference unless it is deliberately torqued to rotate at a rate proportional to the earth's rotational rate (**earth rate = 15°/hour**). When torqued in this way, the gyro's spin axis appears stationary and it is effectively slaved to the earth's coordinate system.

### Alignment

The accuracy of an INS depends on the precise alignment of the inertial platform to True North, with respect to the latitude and longitude of the ground starting position. Before alignment the computer requires the aircraft's **latitude**, **longitude**, and **magnetic heading**. The alignment procedure can only be carried out on the ground, and the aircraft must not be moved; once started, it is automatic. Alignment time is approximately **10 minutes**.

### Strapdown Inertial Navigation and the Laser Ring Gyro (LRG)

In a **strapdown** system, unlike a gimballed system, the accelerometers and gyros are mounted solidly to the aircraft's axes rather than kept level by gimbals. A microprocessor integrates the acceleration signals, using the pitch, roll and heading angles derived from the gyros, to resolve them into earth-related accelerations for navigation.

**Laser Ring Gyros (LRG)** are not, in fact, gyros in the classical sense but sensors of angular rate about a single axis. They consist of a triangular block of temperature-stable glass with tunnels drilled parallel to the perimeter and reflecting mirrors at each corner, containing a small charge of Helium-neon gas. When a high voltage ionises the gas, two beams of light travel around the cavity in opposite directions. If the gyro rotates about its axis, the path length of one beam shortens and the other lengthens, causing a frequency difference between the two beams that is directly proportional to the angular rate of turn.

### Mode Select Unit (MSU) and Annunciators

The Mode Select Unit controls the mode of operation of the IRS. Two types are in common use: the **Six-Annunciator MSU** (for one Inertial Reference Unit) and the **Triple-Channel MSU** (for three IRUs). Typical MSU annunciators include:

- **ALIGN** — the IRU is in alignment mode (a flashing ALIGN indicates incorrect lat/long entry or excessive aircraft movement during alignment).
- **NAV RDY** — alignment is complete.
- **FAULT** — an IRS fault is indicated.
- **ON BATT** — back-up battery power is being used.
- **BATT FAIL** — back-up battery power is inadequate to sustain IRS operation (less than **21 volts**).
- **NO AIR** — cooling airflow is inadequate to cool the IRU.

## Radio Magnetic Indicator (RMI)

The Radio Magnetic Indicator is a navigation instrument able to display several pieces of information simultaneously. Its circular rotating "card" is a self-correcting compass, much more accurate than the older floating-magnet type of compass. Displays from the ADF or VOR units can be superimposed on the card using two pointers (one single, one double), allowing the pilot to see, in a single instrument, the aircraft heading together with the orientation of up to two ground stations, relative to the aircraft, using two different navigation systems.
        $cnt$,
        6
    ) RETURNING id INTO s1_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M11A.6 Communications and Navigation Radio Systems (23 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s1_id, 'The Selective Calling (SELCAL) system allows a ground station to call an aircraft:',
     '[{"id":"a","text":"Without the flight crew having to continuously monitor the ground station''s frequency","correct":true},{"id":"b","text":"Only while the aircraft is on the ground","correct":false},{"id":"c","text":"Using satellite datalink only, never HF or VHF","correct":false}]',
     '{"B1"}'),

    (s1_id, 'How many SELCAL codes are available in total, for assignment to airline organisations?',
     '[{"id":"a","text":"10,920","correct":true},{"id":"b","text":"1,092","correct":false},{"id":"c","text":"109,200","correct":false}]',
     '{"B1"}'),

    (s1_id, 'The Cockpit Voice Recorder (CVR) records the last:',
     '[{"id":"a","text":"30 minutes of flight deck audio","correct":true},{"id":"b","text":"2 hours of flight deck audio","correct":false},{"id":"c","text":"5 minutes of flight deck audio","correct":false}]',
     '{"B1"}'),

    (s1_id, 'On the CVR, bulk erasure of the recording tape is only possible when:',
     '[{"id":"a","text":"The aircraft is on the ground and the parking brake is set","correct":true},{"id":"b","text":"The aircraft is airborne above 10,000 ft","correct":false},{"id":"c","text":"The engines are running at idle","correct":false}]',
     '{"B1"}'),

    (s1_id, 'VOR (VHF Omni-Range) operates in the frequency band:',
     '[{"id":"a","text":"108.00 to 117.95 MHz","correct":true},{"id":"b","text":"960 to 1215 MHz","correct":false},{"id":"c","text":"190 to 1750 kHz","correct":false}]',
     '{"B1"}'),

    (s1_id, 'The VOR ground station modulates two 30 Hz signals on the carrier. The phase shift between these two signals identifies:',
     '[{"id":"a","text":"The radial on which the two signals are transmitted, referenced to magnetic north","correct":true},{"id":"b","text":"The distance from the aircraft to the ground station","correct":false},{"id":"c","text":"The identity of the ground station only, not any directional information","correct":false}]',
     '{"B1"}'),

    (s1_id, 'The DME system gives distance information to the aircraft by:',
     '[{"id":"a","text":"Interrogating the ground station and measuring the time delay between interrogation and reply","correct":true},{"id":"b","text":"Comparing the phase shift between a reference and a variable 30 Hz signal","correct":false},{"id":"c","text":"Measuring the strength of a continuously broadcast omni-directional signal","correct":false}]',
     '{"B1"}'),

    (s1_id, 'DME ground station identification tones are transmitted at a frequency of:',
     '[{"id":"a","text":"1350 Hz","correct":true},{"id":"b","text":"75 MHz","correct":false},{"id":"c","text":"400 Hz","correct":false}]',
     '{"B1"}'),

    (s1_id, 'A typical ILS system allows the pilot to bring the aircraft to within ½ mile of the runway and to a Decision Height of approximately:',
     '[{"id":"a","text":"Less than 200 ft above the runway, without external visual reference","correct":true},{"id":"b","text":"1,000 ft above the runway, without external visual reference","correct":false},{"id":"c","text":"50 ft above the runway, with full external visual reference required throughout","correct":false}]',
     '{"B1"}'),

    (s1_id, 'ILS Cat I operation permits a minimum decision height and runway visual range of approximately:',
     '[{"id":"a","text":"200 ft decision height and 800 m RVR","correct":true},{"id":"b","text":"100 ft decision height and 400 m RVR","correct":false},{"id":"c","text":"50 ft decision height and 200 m RVR","correct":false}]',
     '{"B1"}'),

    (s1_id, 'In the ILS Localizer, the beam on the right side of the runway centreline is modulated at 150 Hz and the beam on the left side is modulated at 90 Hz. When the aircraft is on the extended centreline:',
     '[{"id":"a","text":"Both signals are received with equal strength","correct":true},{"id":"b","text":"Only the 150 Hz signal is received","correct":false},{"id":"c","text":"Only the 90 Hz signal is received","correct":false}]',
     '{"B1"}'),

    (s1_id, 'In the ILS LOC/GS receiver, the 90 Hz and 150 Hz signals are first summed. If the summed result is less than 250 mV:',
     '[{"id":"a","text":"The LOC/GS warning flag remains in view, indicating the signal is invalid","correct":true},{"id":"b","text":"The LOC/GS warning flag goes out of view, indicating the signal is valid","correct":false},{"id":"c","text":"The deviation bar is automatically centred regardless of aircraft position","correct":false}]',
     '{"B1"}'),

    (s1_id, 'On an ILS approach, the Outer Marker is identified in the cockpit by:',
     '[{"id":"a","text":"A blue light and a 400 Hz tone","correct":true},{"id":"b","text":"An amber light and a 1,300 Hz tone","correct":false},{"id":"c","text":"A white light and a 3,000 Hz tone","correct":false}]',
     '{"B1"}'),

    (s1_id, 'On an ILS approach, the Middle Marker is identified in the cockpit by:',
     '[{"id":"a","text":"A blue light and a 400 Hz tone","correct":false},{"id":"b","text":"An amber light and a 1,300 Hz tone","correct":true},{"id":"c","text":"A white light and a 3,000 Hz tone","correct":false}]',
     '{"B1"}'),

    (s1_id, 'The ADF system detects the direction to which of the following?',
     '[{"id":"a","text":"A Non-Directional Beacon (NDB)","correct":true},{"id":"b","text":"A VOR ground station only","correct":false},{"id":"c","text":"A Mode S transponder","correct":false}]',
     '{"B1"}'),

    (s1_id, 'A "loop aerial" used in an ADF system is very sensitive to its directional position. When pointing towards the NDB transmitter it receives:',
     '[{"id":"a","text":"A null signal","correct":true},{"id":"b","text":"The maximum possible signal","correct":false},{"id":"c","text":"No signal at any orientation","correct":false}]',
     '{"B1"}'),

    (s1_id, 'Because a loop aerial has two nulls, 180° apart, resolving the resulting ambiguity as to which direction the transmitter lies is achieved by:',
     '[{"id":"a","text":"Adding a sense aerial, combining a cardioid polar diagram with the loop pattern","correct":true},{"id":"b","text":"Doubling the number of loop aerials fitted to the aircraft","correct":false},{"id":"c","text":"Switching the ADF receiver to a higher frequency range","correct":false}]',
     '{"B1"}'),

    (s1_id, 'In the ATCRBS system, an aircraft transponder is best described as:',
     '[{"id":"a","text":"A means of identification, transmitting in response to a ground interrogation","correct":true},{"id":"b","text":"A primary radar system requiring no response from the ground station","correct":false},{"id":"c","text":"A navigation aid providing distance information only","correct":false}]',
     '{"B1"}'),

    (s1_id, 'Mode C of the ATCRBS transponder system provides the ground controller with:',
     '[{"id":"a","text":"The aircraft''s pressure altitude, in addition to identification","correct":true},{"id":"b","text":"Only a simple identify response, with no altitude information","correct":false},{"id":"c","text":"A discrete 24-bit aircraft address","correct":false}]',
     '{"B1"}'),

    (s1_id, 'The key feature of Mode S transponders, compared with earlier ATCRBS-only equipment, is:',
     '[{"id":"a","text":"The ability to discretely address one aircraft using its unique 24-bit Mode S address","correct":true},{"id":"b","text":"Operation exclusively on VHF frequencies below 137 MHz","correct":false},{"id":"c","text":"Elimination of the need for any ground interrogation","correct":false}]',
     '{"B1"}'),

    (s1_id, 'TCAS I, as fitted to smaller commuter and general aviation aircraft, provides:',
     '[{"id":"a","text":"Proximity warning only, to assist visual acquisition of intruder aircraft","correct":true},{"id":"b","text":"Both traffic advisories and vertical resolution advisories","correct":false},{"id":"c","text":"Traffic advisories and resolution advisories in both the vertical and horizontal directions","correct":false}]',
     '{"B1"}'),

    (s1_id, 'The Inertial Navigation System (INS) uses accelerometer signals to derive ground speed and distance flown by:',
     '[{"id":"a","text":"Passing the acceleration signal through two successive time-integrators, giving velocity and then distance","correct":true},{"id":"b","text":"Comparing the phase shift of two 30 Hz reference and variable signals","correct":false},{"id":"c","text":"Measuring the time delay between an interrogation and a ground station reply","correct":false}]',
     '{"B1"}'),

    (s1_id, 'To remain a usable earth-fixed reference despite the earth''s rotation, an INS gyro must be deliberately torqued to rotate at a rate proportional to:',
     '[{"id":"a","text":"Earth rate, approximately 15° per hour","correct":true},{"id":"b","text":"The aircraft''s true airspeed","correct":false},{"id":"c","text":"The DME interrogation pulse rate","correct":false}]',
     '{"B1"}');

END $$;
