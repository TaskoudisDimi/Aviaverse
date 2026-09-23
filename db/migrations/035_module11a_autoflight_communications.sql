-- Module 11A: Turbine Aeroplane (B1 only) — Automatic Flight and Communications Systems
-- Source: EASA Part-66 Module 11A official textbook (IKAROS Aviation Training Centre, IK01, Issue Oct.2012)

DO $$
DECLARE
    m11_id INT;
    s1_id  INT;
BEGIN
    SELECT id INTO m11_id FROM easa_modules WHERE code = 'M11';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M11A.5') THEN
        RAISE NOTICE 'M11A.5 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 11A.5: Automatic Flight and Communications Systems
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m11_id, 'M11A.5', 'Automatic Flight and Communications Systems',
        $cnt$
# Automatic Flight and Communications Systems

## Automatic Flight

### Automatic Flight Control Systems (AFCS)

Automatic Flight Control Systems (AFCS) in modern jet transports are uniquely tailored to the specific aircraft, but all share common features. For example, the flight aerodynamics of a DC-9 differ from those of a Boeing 747, yet both aircraft would most likely require an "attitude hold" mode of operation — the feature is common to both autopilot designs, but the gains in each autopilot differ to accommodate the differences in aerodynamics.

Each AFCS receives attitude and heading signals from a vertical and directional gyro, and has its own rate gyro/accelerometer system to develop attitude and flight path stabilization signals. The AFCS computer is an electronic "brain" that receives signals from its "senses" to compute the proper responses, and provides outputs to electric and/or hydraulic actuators, which move the aircraft's control surfaces.

### The Autopilot System

Modern autopilots are designed to provide pitch, roll and yaw axis stabilization around the pilot's desired reference attitude. To achieve this, the autopilot must detect changes in aircraft attitude and respond to them more quickly and smoothly than a human pilot.

For an autopilot to maintain stability, it must:

1. Know what the pilot's desired aircraft attitude is.
2. Know what the actual aircraft attitude is.
3. Compare the two and produce a control signal if there is a difference (error).
4. Use the control signal to correct the difference, and control the speed of the correction.

The autopilot is divided into **four main parts**:

- **Error Sensing** — determines when the aircraft's flight condition differs from that commanded by the pilot. Almost all modern aircraft use a gyro for this purpose. The error signal can be generated either by **attitude gyros**, which only detect how far the aircraft is away from the set attitude, or by **rate gyros**, which detect the rate at which it is deviating and are, hence, more accurate.
- **Correction** — the correcting input sent to the actuators connected into the flying control systems, commanding the autopilot to reverse the aircraft's movement away from its set course. It has no idea of when to stop the correction — that is the job of the follow-up mechanism.
- **Follow-Up** — the detection mechanism that senses the aircraft is righting itself under the commands from the correction part. It reduces the correction input as the aircraft nears the original selected position, so that by the time the aircraft is level there is no correcting input left to the actuators.
- **Command** — allows the pilot to dictate which heading, height, speed or rate of climb the aircraft is to follow. This may be a simple "Heading Hold" system controlled by a "bug" on the compass, set with a knob, or a "Mode Control Panel" that allows many parameters to be commanded, such as autopilot modes, altitude, vertical speed and airspeed/Mach number.

A basic autopilot block diagram comprises: a **Vertical Gyroscope**, **Compass Gyroscope** and **Air Data Computer** feeding an **Autopilot Computer** and **Autopilot Controller**, whose outputs drive the **Pitch Servo**, **Roll Servo** and **Yaw Servo**, which in turn operate the **Aircraft Trim System**. The sensors take the place of the pilot's "senses"; the computer calculates the output signal size and axis; the controller turns the autopilot on/off and provides other system inputs; the servos are the "muscle" of the system, moving the flight control surfaces. As the aircraft responds, the sensors detect the attitude change (through aerodynamic feedback) and tell the computer when the aircraft is back where it should be.

### Autopilot Interlocks

Before an automatic control system can be engaged with an aircraft's flight controls, certain preliminary operating requirements must be fulfilled to ensure the system is in a condition where it may safely take control. The principal requirement is that the connections between system power supplies, the elements comprising the system, and the appropriate signal and engage circuits, are electrically complete.

It is therefore the practice to incorporate a series of switches and/or relays, known as **interlocks**, which operate in a specific sequence to ensure satisfactory engagement and the coupling of input signals from outer loop control elements. Typical interlock switches include:

- **A/P Disconnect** (Captain's or First Officer's switch — either will disconnect the autopilot; usually located on the control column)
- **AC-DC power valid** (qualifies that power is available — any loss of power disconnects the autopilot)
- **Mach Trim** (in some systems Mach trim is on at all times, whether the autopilot is engaged or not; in others it is disengaged when the autopilot is engaged)
- **Pitch Trim** (qualifies that auto pitch trim is available in autopilot mode — important because, if there is a mis-trim, the autopilot can compensate for it until disconnected, either through malfunction or deliberate action, and the aircraft could otherwise nose up/down rather dramatically)
- **Attitude Reference** (checks that the valids from the vertical gyro are all correct and available)

On more sophisticated systems there are other interlock switches, for example the air data computer, compass system, hydraulic pressure monitoring and radio altimeters. Some systems, instead of an electrical servomotor, use a hydraulic servo.

In a typical interlock circuit, with the selector in the **yaw damper only** position, relay K1 closes and energizes the **rudder servo clutch only**, engaging it to accept signals from a gyro or computer to move the rudder. With the selector in the **autopilot** position, K1 is energized subject to all the interlock switches being made; a second switch engages the aileron and elevator clutches, and a third switch energizes the rudder clutch. So the yaw damper position provides yaw damping only, while the autopilot position provides yaw, pitch and roll engagement. In the yaw damper position only the pilot's disconnect and power valids are needed; in the full autopilot condition, all interlock switches must be made.

### Servomotors

The power output element of any automatic flight control system consists of **servomotors** (also called servo-actuators), connected into the aircraft's primary flight control circuits; the number employed is governed by the number of control loops required. Servomotors may also actuate secondary flight controls provided for trimming and for yaw damping.

Servomotors generally operate on **electro-pneumatic**, **electromechanical**, or **electro-hydraulic** principles, the choice depending on the type of automatic control system and the method of actuating the primary flight control surfaces. They may be connected either:

- **In series** with the normal flight control system — moves the flight control surfaces **without** moving the pilot's controls, or
- **In parallel** — moves **both** the control surfaces and the pilot's controls.

Servomotors may use either direct current or alternating current, ranging from DC permanent magnet types to AC two-phase or hysteresis types.

The **closed loop servo technique** forms the basic control system for all classes of automatic flight control system, and controls what is termed **"Inner Loop" stabilization**. A functional diagram of this loop comprises: Manual Flight Controls/Pilot's Demands → Attitude Sensing → Error Sensing → Signal Processing → Servomotors (Actuators) → aerodynamic response, with a feedback path back to the sensing stage, and an Autopilot Mode Select input.

### Single, Two and Three-Axis Control Systems

The number of control loops (channels) comprising an AFCS depends on the number of axes about which control is to be effected, and systems are classified as:

| System | Axis/Axes controlled | Control surfaces | Typical application |
|---|---|---|---|
| **Single-Axis System** | Roll | Ailerons | Small aircraft — provides lateral stabilization (wing levelling) |
| **Two-Axis System** | Roll and Pitch | Ailerons and Elevators | Medium-sized aircraft — automatically controls heading and altitude |
| **Three-Axis System** | Pitch, Roll and Yaw | All three | High-performance category aircraft — stabilization/control with a large number of operating modes |

### Sensing Attitude Changes

Under automatically controlled flight conditions, all changes in the aircraft's attitude are sensed by referencing them against a stabilized device. The device universally adopted for this purpose, from the earliest control systems to those now current, has been the **gyroscope**.

In addition to the gyro, it is also common practice to adopt a **pendulous device** which, although not purely stabilizing in function, can serve as a "back-up" to a gyro by sensing short-term attitude changes brought about by accelerations, vertical speed changes, and side-slip. A three-axis automatic control system typically incorporates a Pitch Rate Gyro, a Roll Rate Gyro and a Yaw Rate Gyro, each mounted about its respective axis with a defined direction of precession.

### Autopilots and Flight Director Systems

Once the controller has been selected and activated, the aircraft is controlled by the Flight Director/Autopilot System. **Rate gyros** detect any movement of the aircraft from the selected flight datum and output a signal proportional to the disturbance and in the opposite sense. The gyro output, along with other associated system signals, is processed in the **Flight Director/Autopilot Computer**, which gives flight director information and/or outputs to move the control surfaces to bring the aircraft back onto the correct flight datum.

### Altitude Hold, Airspeed Hold and Altitude Alerting

**Altitude Hold System** — the autopilot alone cannot detect a pure vertical displacement of the aircraft, so further sensing elements are required to maintain the aircraft at a selected altitude. The pilot selects "ALT" on the Flight Mode Panel (FMP) and the system maintains that altitude. The sensing element consists of a **pressure transducer**, similar to that in the Air Data System — any change in static pressure produces an output that is fed to the pitch channel of the autopilot system to adjust the aircraft's altitude.

**Airspeed Hold** — since airspeed hold sensors are used in conjunction with altitude hold sensors, the methods of transmitting error signals are of a common nature. The only difference is that whereas an altitude sensor measures only **static pressure** changes, an airspeed sensor is required to measure **both Static and Pitot pressures**.

**Altitude Alerting System** — allows the pilot to make changes to the aircraft's altitude and provides alerts when the selected altitude is reached. The pilot sets the required altitude, from 0 to 50,000 feet, in steps of 10 feet, on the Flight Mode Panel. The altitude alerter gives the pilot an **entry alert ("C" Chord)** with an illuminated warning lamp as the aircraft approaches the selected altitude, and an **exit alert ("C" Chimes)** with an illuminated warning lamp if the aircraft subsequently departs from the selected altitude.

### Controls and Selectors

Using the BAe 146 as an example, the autopilot controllers comprise:

- **Mode Selector** — mounted on the glareshield, containing push-button switches for the selected mode. Hidden legends mean the button appears blank until a mode is selected, when a white triangle illuminates. Autopilot engagement is indicated by a green triangle on the AP button. The bottom row selects lateral modes and the middle row selects vertical modes.
- **Navigation Selector** — mounted on the glareshield, containing a large rotary switch labelled NAV 1-SPLIT-NAV 2, which selects the distribution of radio navigation information to the autopilot and pilot's flight instruments. With SPLIT selected, NAV 1 supplies HSI 1 and NAV 2 supplies HSI 2; if NAV 1 is selected, both HSIs are supplied from NAV 1 (and similarly for NAV 2). COURSE selector knobs rotate the course pointer on the HSIs, and a HDG knob provides remote selection of the heading cursor on both HSIs (coarse and fine ratios).
- **Altitude Selector** — mounted on the glareshield, containing a five-figure readout (the last two figures are fixed zeros). An **ALT ARM** button arms the selected altitude, indicated by a white triangle. A press-to-TEST switch allows warning altitudes to be checked against the altitude set on the captain's altimeter.
- **Autopilot Controller** — mounted on the centre console, containing the autopilot (AP) and yaw damper (YD) engage buttons, which indicate engagement by a green illuminated "IN" for the AP and "YD1/YD2" for the yaw damper. PITCH and ROLL controls and associated out-of-trim indicators (ELEV and RUD) are also found on the controller.

### Automatic Flight Director System (AFDS) — Boeing 777 Example

The purpose of the AFDS is to automatically control the aircraft's attitude, and to supply indications to the flight crew so they can manually control the aircraft's attitude. The autopilot controls the aircraft's attitude through: **Takeoff** (Flight Director only), **Climb, Cruise, Descent, Approach, Go-around** and **Autoland**.

In Flight Director mode, horizontal and vertical director bars are shown on the Primary Flight Display (PFD) as guides to control aircraft attitude. The **mode select panel** is the primary interface between the flight crew and the AFDS; other crew inputs are the disconnect switches and the Go-around (GA) switches.

**Mode Control Panel controls include:**

- **A/P Engage Switch** — Captain's and First Officer's autopilot engage buttons, shown white when engaged.
- **A/T ARM** — left and right autothrottle arm switches; **A/T Switch** engages the autothrottle system.
- **F/D Switch** — selects the Flight Director bars for display on the PFD.
- **CLB CON Switch** — climb continuous thrust switch.
- **L-NAV / V-NAV** — engage lateral navigation / vertical navigation modes.
- **FLCH** — Flight Level Change engage switch.
- **IAS/MACH Window and Switch** — shows/selects IAS or MACH as the reference for speed hold mode.
- **A/P DISENGAGE Bar** — three toggle switches beneath the bar control the left, centre and right AFDS respectively. The **centre AFDC cannot perform a single autopilot engagement**, because it does not connect to any backdrive unit — it exists only as a back-up for the left or right AFDS. The bar is normally up; pushing it down disengages all AFDS.
- **Light Sensor** — a photo light sensor on the MCP front panel monitors ambient lighting and controls the brightness of the LCDs.
- **HDG/TRK Window and Selector** — shows heading or track angle from 001 to 360 (shows 360 at power-up). The selector has two concentric controls (outer = bank angle, inner = heading/track value) and an inner push-button that toggles between Heading and Track select modes. A HOLD push-button engages Heading/Track hold mode.
- **V/S-FPA Window and Selector** — shows vertical speed (+6,000 fpm to −8,000 fpm) or flight path angle (+9.9 to −9.9). Rotating the selector up decreases the value, down increases it. A VS/FPA push-button engages the mode.
- **Altitude Window and Selector** — range 0 to 50,000 ft (shows 1,000 ft at power-up); the set altitude is also the altitude alert value. The inner selector changes the reference altitude (pushing it while in V-NAV activates altitude intervention); the outer selector changes the window increment — 1000 position gives 1000 ft/detent, AUTO position gives 100 ft/detent. A HOLD push-button engages Altitude Hold mode.
- **LOC / APP Push Buttons** — LOC engages the ILS Localizer mode (captures/holds a localizer flight path); APP engages the Approach mode (captures/holds a glideslope, i.e. vertical descent, flight path).

**Mode Control Panel (MCP) internal operation:**

- **Power Supplies A and B** receive 28V DC from the left and right 28V DC buses (the MCP functions with either source), and supply +12V, −12V and +5V DC to their respective microprocessors and logic circuits, as well as to Power Supply C (part of the fluorescent tube control).
- **Microprocessors A and B** — Microprocessor A receives data from the left and centre AFDC and sends data to the left and centre AFDC; Microprocessor B receives data from the right and centre AFDC and sends data to the right AFDS. To ensure all three AFDCs use data from one MCP processor, all AFDS use the microprocessor data sent to the **master AFDS**: when the left AFDS is master, Microprocessor A writes to the LCD displays and the right/centre AFDC receive its data via the AFDC cross-channel buses (and vice-versa when the right AFDS is master).
- **Push-button and toggle switches** each have two sets of contacts, one connecting to Microprocessor A and one to Microprocessor B; the LED annunciators also connect to each microprocessor.
- **Fluorescent tube control** supplies current to drive the tube and its heater coil, which operates when temperature is below 40°F.
- **LCD windows and control knob encoders** — four LCD windows show reference values, driven by Microprocessors A and B; each selector connects to two encoders, each sending data to its on-side microprocessor.
- **AFDS Disconnect Switches** are located on the outboard side of each control wheel; each is a push-button type with multiple contacts, and manually disconnects all AFDCs.

### Autopilot Flight Director Computer (AFDC)

There are three AFDCs within the AFDS, each containing: ARINC 629 Input/Output (I/O) modules, a Discrete I/O module, and Processors A, B and C, plus a power supply module.

**Input Signal Selection** — each ARINC and discrete I/O module first monitors the validity of the signal, then selects it by one of the following methods:

1. **Mid value selection** — uses the middle value of three signals (e.g. Radio Altitude and ILS).
2. **Priority selection** — for signals with two sources (left/right); e.g. the Air Data Inertial Reference Unit (ADIRU) is the normal source of air/inertial data, and if the ADIRU fails, the AFDC selects the Secondary Attitude Air Data Reference Unit (SAARU).
3. **Forced selection** — for Aeroplane Information Management System (AIMS) data; AIMS tells the AFDC which signal to use.

**AFDC Processors** — Processors A and B receive digital backdrive commands from the Primary Flight Computers (PFC) and convert them into analogue signals for output to the backdrive actuators. **Processor C** calculates the autopilot and flight director control laws, test and data loading, engage/disengage logic, and failure detection/fault response monitoring.

### Primary Flight Computer (PFC)

The PFC receives commands from the AFDC. It calculates and sends surface position digital commands to the **Actuator Control Electronics (ACE)**, which converts these into analogue signals and sends them to the **Power Control Units (PCU)**. The PCU moves the flight control surface and sends a positional feedback signal to the ACE, which converts it back to digital and sends it to the PFC. The PFC then calculates and sends digital feedback signals to the AFDC, which converts them to analogue and sends them to the backdrive actuators — moving the control column, control wheels and rudder pedals to match the surface position.

## Communications

Communication is defined as the exchange of information of any kind, by any means, involving the transfer of meaningful information from one location (the sender or transmitter) to another (the destination or receiver). Radio communication equipment in aircraft is primarily for communicating with Air Traffic Control (ATC) and other ground stations, but can also be used for aircraft-to-aircraft communication and internally with cabin crew and passengers.

### Radio Waves, Wavelength and Frequency

Radio signals emanate from a transmitter's antenna partly as **electromagnetic waves**; the antenna also generates an electric field. Both fields radiate from the antenna at the speed of light, approximately **186,300 miles/sec (300,000,000 metres/sec)**. Because radio waves travel at the speed of light, a signal may be detected instantly hundreds or thousands of miles away, depending on transmitter power and the nature of the wave. A transmitter typically radiates its electromagnetic signal in a 360° pattern from an omni-directional aerial.

The **wavelength** (Greek letter lambda) is the distance from the crest of one wave to the next. Since the wave travels at the speed of light, wavelength in metres equals 300,000,000 divided by the frequency in cycles per second (hertz):

- **Wavelength = Velocity / Frequency**
- **Frequency = Velocity / Wavelength**
- **Velocity = speed of light = 300,000,000 metres per second**

### Frequency Bands

Frequencies used in radio systems range from 3 KHz up to 30 GHz, divided into seven bands assigned to particular types of operation:

| Designation | Frequency range | Wavelength |
|---|---|---|
| Very Low Frequency (VLF) | 3 – 30 KHz | 1,000,000 – 10,000 m |
| Low Frequency (LF) | 30 – 300 KHz | 10,000 – 1,000 m |
| Medium Frequency (MF) | 300 – 3,000 KHz | 1,000 – 100 m |
| High Frequency (HF) | 3 – 30 MHz | 100 – 10 m |
| Very High Frequency (VHF) | 30 – 300 MHz | 10 – 1 m |
| Ultra High Frequency (UHF) | 300 – 3,000 MHz | 1 m – 10 cm |
| Super High Frequency (SHF) | 3 – 30 GHz | 10 cm – 1 cm |

Above these radio frequencies lie the light frequencies — infrared and white light are used for some information transmission between 10⁹ and 10¹¹ KHz. Below radio frequencies are the audible sound waves, ranging from 20 Hz to 15 KHz. The audio frequency range for radio transmission is between 300 Hz and 3 KHz and is known as **"Commercial Quality Speech"**. Without special techniques, transmitting these low frequencies directly would cause two major problems: high power would be required to transmit them, and all radio transmissions would interfere with each other.

### Carrier Wave, Amplitude and Frequency Modulation

The energy that carries the intelligence of a radio signal is called the **Carrier Wave**. Its frequency may be only a few hundred kilohertz (VLF) or several thousand megahertz (UHF). Carrier waves are usually in the **Radio Frequency (RF)** range, in excess of 20 KHz; frequencies below 20 KHz are in the **Audio Frequency (AF)** range.

To carry intelligence, an RF carrier wave must be **modulated** — its form and characteristics changed by a signal impressed onto it. There are two methods of modulating a carrier wave:

- **Amplitude Modulation (AM)** — the audio signal is mixed in a "Modulator" with the higher carrier frequency; the audio affects the **amplitude** of the carrier frequency.
- **Frequency Modulation (FM)** — accomplished by varying the **frequency** of the carrier in accordance with the desired audio signal. FM provides a signal **much less affected by interference** than an AM signal.

### Radio Wave Propagation

The carrier wave emitted by a transmission antenna may be broken into three propagation categories:

- **Ground Wave** — held near the earth's surface and bends with the curvature of the earth. Range is limited by the transmitter's output power, antenna design, local terrain, and weather conditions; a relatively powerful transmitter can send ground waves a distance of about **1,000 miles**.
- **Sky Wave** — travels in straight lines but may also be reflected off the ionosphere to reach the receiver. This can produce a **skip zone**, where neither the line-of-sight wave nor the reflected wave can be received. The ionosphere's density and distance from the earth determine the skip-zone range and which frequencies are reflected; the ionosphere is a layer of ionized gases surrounding the earth at an altitude of between **20 and 250 miles**, varying with time of day, season and location, and affected by solar flare activity.
- **Space Wave** — has a short wavelength that allows it to penetrate the ionosphere, so it is limited to **line-of-sight reception only**. This method is used to communicate with satellites (SATCOM/GPS).

### Antennas

An antenna is a specially designed conductor that accepts energy from a transmitter and radiates it into the atmosphere; during reception it acts as a device receiving an induced current from passing electromagnetic waves, which is sent to the receiver circuitry. Where transmitter and receiver are built into one unit — a **"Transceiver"** — the same antenna is used for both transmitting and receiving.

As frequencies increase, wavelengths decrease, and antenna length must be matched as closely as possible to the wavelength of the carrier wave. On aircraft the antenna size is normally **¼ wavelength**. Most aircraft communication antennas are of the **"Blade"** type, with a radiating surface of ¼ wavelength protected by a polyurethane rubber coating. They are generally "Broad band" antennas, receiving a wide range of frequencies, with the required frequency filtered out by circuitry within the transceiver.

### Microphones and Earphones

The purpose of a microphone is to convert sound energy into electric energy: sound strikes a diaphragm, converting sound energy into mechanical energy, which is then converted into electric energy. There are four common aircraft microphone types:

- **Carbon Microphone** — contains tiny carbon granules compressed in a sealed chamber. The diaphragm vibrates the chamber, changing the resistance of the granules; the current passing through changes in amplitude as the sound wave moves the diaphragm.
- **Crystal Microphone** — a voltage generator using the **piezoelectric** properties of a quartz crystal. When subjected to mechanical pressure, the crystal develops a potential across two of its faces, dependent on the pressure exerted, producing an output that corresponds exactly to the applied pressure wave.
- **Moving Coil Microphone** — a voltage generator working on the **electromagnetic-induction** principle. The diaphragm is attached to a coil free to move in or out of a strong magnet; movement causes the coil to cut the magnetic flux and a voltage is induced.
- **Electrostatic Microphone** — similar to the carbon microphone in that it controls power taken from a DC supply, by varying the value of a capacitor as the diaphragm alters the distance (and hence capacitance) between two plates; the current varies directly as the charge across the microphone alters.

An **earphone** is a transducer that converts electrical waves into sound (pressure) waves — the reverse process of a microphone, with the sound waveform intended to be identical to the electrical wave in all factors but amplitude.

### VHF Radio Communication

Aircraft communication systems normally use the **VHF** waveband within a **118.000 MHz to 136.000 MHz** range. Channel spacing was previously 25 KHz but, due to demand for more channels, is being reduced to 8.33 KHz. The VHF system provides short-range (space wave) voice communication between the aircraft and ground stations, and aircraft to aircraft. All modern aircraft have at least **two** VHF systems, with larger aircraft also fitting a third.

Each VHF system receives RF energy via its antenna, processes it and sends the resulting AF to the digital audio control system and the SELCAL system. During transmission, microphone audio from the flight compartment is processed and the RF energy is transmitted via the antenna. Frequency selection is controlled on a **VHF Communication control panel**, which provides frequency selection (tuning), frequency transfer, and testing of the transceiver via two sets of concentric frequency select knobs, a VHF COMM TRF (transfer) switch, and a COMM TEST push-button for confidence testing of the receiving circuits.

The **audio control panel** provides microphone selector pushbuttons (connecting the mic to the desired VHF transceiver) and volume controls for audio from the transceivers heard over the flight compartment speakers or headphones.

The **VHF transceiver** is a solid-state device with a minimum transmit power output of **20 watts**. A "squelch disable" pushbutton allows testing of the receiver section, and an amber "transmit monitor" lamp illuminates whenever transmitted output power exceeds 10 watts. "Phone" and "mic" jacks allow monitoring of the receiver and transmitter.

On the Boeing 737, the **No.1 VHF antenna** is located on top of the fuselage and the **No.2 VHF antenna** is on the forward underside of the fuselage, radiating and intercepting signals across the 118.00–136.00 MHz range.

The **INT/MIC switch** on the outboard horn of the captain's and first officer's control wheel provides PTT input for the boom or oxygen mask microphones: in the MIC position, mic audio is directed to the selected communication system, and in the INT position, mic audio is connected directly to the flight interphone system.

### Operating the VHF Communication System

To operate the system: apply power to the transceiver and allow a short warm-up period; select the VHF comm to be used (1 or 2) on the audio selector panel; select the ground station frequency and "listen out" to ensure no other transmissions are taking place; key the transmitter with the PTT switch and speak slowly and clearly into the microphone; identify position by airline and aircraft registration using the standard phonetic alphabet (A = Alpha, B = Bravo, etc.); release the PTT switch and listen for a loud, clear reply; and confirm receipt of the reply to the ground station.

Important operating notes:

- **DO NOT TRANSMIT on 121.50 MHz** — this is a recognized emergency/distress channel.
- **DO NOT TRANSMIT** whilst refuelling is taking place.
- **DO NOT INTERRUPT** ATC-aircraft communication.

### HF Radio Communication

The HF communication system is used for aircraft-to-ground station communication. Because the ionosphere reflects HF band frequencies, line of sight does not limit the reception range, making HF COMM suitable for **long range, worldwide communication**. The frequency range is **2 to 29.999 MHz**, with frequency selection in 1 KHz steps, giving **28,000 channels** available. There are two modes of operation:

- **AM (Amplitude Modulation)** — the system transmits a carrier with amplitude modulation.
- **SSB (Single Side Band)** — the carrier and the lower sideband are removed; the system transmits only the **Upper Side Band (USB)**.

An HF aerial differs considerably from other aerials, both because of the transmitter's power output (**400 watts**) and because the quarter-wavelength distance is about 40 metres at 2 MHz but only 2.5 metres at 30 MHz — so broadband aerials are not possible. Instead, HF aerials are fed from an **aerial coupling unit**, which electrically lengthens or shortens the aerial for optimum matching to the transmitter. For optimal power transfer, antenna impedance must match the transmitter output impedance (**50-Ohm**); since the aircraft's antenna has a fixed length it only suits one frequency, so the antenna coupler tunes filters to adapt the antenna impedance to the transmitter output impedance for each frequency used.

The **HF Communication Control Panel** enables frequency selection, mode control and RF sensitivity adjustment, with four frequency select controls (MHz, 100 KHz, 10 KHz and 1 KHz). The function selector allows selection of: **OFF**, **Upper Side Band (USB)**, **Lower Side Band (LSB)**, or **Amplitude Modulation (AM)**. LSB is reserved for military operations; civil aircraft normally have the facility to select USB.

### Interphone, Crew Call and Passenger Address Systems

The **Service Interphone** system allows communication between the flight crew, cabin attendants, ground crew and maintenance personnel via jacks for plug-in microphones and headsets at various locations, and handsets permanently installed at the forward and aft attendants' panels. An on/off switch on the aft overhead panel controls the external jacks. **Attendant interphone handsets** resemble a common hand-held telephone receiver, with a pushbutton switch on the grip to activate the mic.

The **Flight and Ground Crew Call System** is a three-way alerting system:

- **Captain's Call** — a "Hi tone" chime sounds once and the Captain's CALL light illuminates, when a call is initiated from an attendant's panel or the ground crew panel.
- **Attendant Call** — a "Two-tone" chime sounds and the "Pink Master Call" lights illuminate when initiated from the flight compartment or either attendant's panel; the lights reset at the attendant's panels.
- **Ground Crew Call** — initiated in the flight compartment, sounds a call horn in the nose wheel well.

The **Passenger Address (PA) System** transmits flight crew announcements, boarding music and chime signals to the passenger cabin. Audio inputs from the pilots, attendants and tape reproducer are prioritized by the PA amplifier, in the following order:

1. Pilots
2. Cabin attendants
3. Pre-recorded announcements
4. Boarding music

The audio with the highest priority is amplified and distributed to the passenger cabin speakers, attendant's speakers and audio integration.

The **Audio Integration System** provides the flight crew with a means of controlling all radio communications, interphone and PA selection, and navigation receiver audio signals; both pilots have their own individual system and control panel.
        $cnt$,
        5
    ) RETURNING id INTO s1_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M11A.5 Automatic Flight and Communications Systems (20 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s1_id, 'The autopilot is divided into four main parts. Which of the following correctly lists them?',
     '[{"id":"a","text":"Error Sensing, Correction, Follow-Up, Command","correct":true},{"id":"b","text":"Detection, Amplification, Transmission, Feedback","correct":false},{"id":"c","text":"Gyro Sensing, Modulation, Correction, Trim","correct":false}]',
     '{"B1"}'),

    (s1_id, 'Compared with attitude gyros, rate gyros used for autopilot error sensing are more accurate because they:',
     '[{"id":"a","text":"Only detect how far the aircraft is from the set attitude","correct":false},{"id":"b","text":"Detect the rate at which the aircraft is deviating","correct":true},{"id":"c","text":"Do not require electrical power to operate","correct":false}]',
     '{"B1"}'),

    (s1_id, 'In an autopilot system, the function of the follow-up mechanism is to:',
     '[{"id":"a","text":"Generate the original error signal from the gyros","correct":false},{"id":"b","text":"Reduce the correction input as the aircraft nears the selected position, until none remains when level","correct":true},{"id":"c","text":"Allow the pilot to select heading, altitude and airspeed on the Mode Control Panel","correct":false}]',
     '{"B1"}'),

    (s1_id, 'The purpose of autopilot interlocks is to:',
     '[{"id":"a","text":"Provide the pilot with manual override of the flight controls at all times","correct":false},{"id":"b","text":"Ensure the system is electrically complete and engages in a safe, specific sequence","correct":true},{"id":"c","text":"Increase the transmit power of the VHF communication system","correct":false}]',
     '{"B1"}'),

    (s1_id, 'In a typical interlock circuit, with the selector in the yaw damper only position, relay K1 energizes:',
     '[{"id":"a","text":"The rudder servo clutch only","correct":true},{"id":"b","text":"The aileron and elevator clutches only","correct":false},{"id":"c","text":"All three servo clutches simultaneously","correct":false}]',
     '{"B1"}'),

    (s1_id, 'The pitch trim interlock switch is important because, without it, a mis-trim condition could:',
     '[{"id":"a","text":"Cause a dramatic nose up or down pitch on autopilot disconnect, since the autopilot may have been compensating for it","correct":true},{"id":"b","text":"Prevent the yaw damper from engaging","correct":false},{"id":"c","text":"Cause the VHF transceiver to lose power","correct":false}]',
     '{"B1"}'),

    (s1_id, 'A series-connected autopilot servomotor is one which:',
     '[{"id":"a","text":"Moves the flight control surfaces without moving the pilot''s controls","correct":true},{"id":"b","text":"Moves both the flight control surfaces and the pilot''s controls","correct":false},{"id":"c","text":"Can only be used for yaw damping, never for primary flight control","correct":false}]',
     '{"B1"}'),

    (s1_id, 'A single-axis automatic flight control system, typically found on small aircraft, controls:',
     '[{"id":"a","text":"The roll axis via the ailerons, for lateral stabilization (wing levelling)","correct":true},{"id":"b","text":"The pitch axis via the elevators, for altitude hold","correct":false},{"id":"c","text":"All three axes via ailerons, elevators and rudder","correct":false}]',
     '{"B1"}'),

    (s1_id, 'The sensing element of the Altitude Hold system consists of a:',
     '[{"id":"a","text":"Rate gyro measuring angular velocity","correct":false},{"id":"b","text":"Pressure transducer, similar to that in the Air Data System, sensing static pressure","correct":true},{"id":"c","text":"Piezoelectric crystal measuring dynamic pressure","correct":false}]',
     '{"B1"}'),

    (s1_id, 'The key difference between the Altitude Hold and Airspeed Hold sensing arrangements is that the airspeed sensor must measure:',
     '[{"id":"a","text":"Only static pressure, the same as the altitude sensor","correct":false},{"id":"b","text":"Both static and Pitot pressures, whereas the altitude sensor measures only static pressure","correct":true},{"id":"c","text":"Only Pitot pressure, ignoring static pressure entirely","correct":false}]',
     '{"B1"}'),

    (s1_id, 'On the Boeing 777 AFDS, the centre AFDC:',
     '[{"id":"a","text":"Can perform a full single autopilot engagement independently, like the left and right AFDC","correct":false},{"id":"b","text":"Cannot perform a single autopilot engagement, because it has no connection to a backdrive unit, and exists only as a back-up","correct":true},{"id":"c","text":"Is used exclusively for HF radio frequency selection","correct":false}]',
     '{"B1"}'),

    (s1_id, 'Within the AFDC, "priority selection" of input signals — for example between the ADIRU and the SAARU — is used when:',
     '[{"id":"a","text":"A signal has three independent sources and the middle value is taken","correct":false},{"id":"b","text":"A signal has two sources (left/right), with the AFDC switching to the secondary source if the primary fails","correct":true},{"id":"c","text":"The AIMS explicitly tells the AFDC which signal to use","correct":false}]',
     '{"B1"}'),

    (s1_id, 'In the Primary Flight Computer (PFC) system, surface position digital commands from the PFC are sent to the:',
     '[{"id":"a","text":"Actuator Control Electronics (ACE), which converts them to analogue for the Power Control Units","correct":true},{"id":"b","text":"Mode Control Panel microprocessors directly","correct":false},{"id":"c","text":"HF Communication Control Panel","correct":false}]',
     '{"B1"}'),

    (s1_id, 'The wavelength of a radio wave, in metres, is calculated as:',
     '[{"id":"a","text":"Frequency divided by Velocity","correct":false},{"id":"b","text":"Velocity divided by Frequency","correct":true},{"id":"c","text":"Velocity multiplied by Frequency","correct":false}]',
     '{"B1"}'),

    (s1_id, 'According to the frequency band table, Very High Frequency (VHF) covers:',
     '[{"id":"a","text":"3 – 30 KHz, with a wavelength of 1,000,000 – 10,000 m","correct":false},{"id":"b","text":"30 – 300 MHz, with a wavelength of 10 – 1 m","correct":true},{"id":"c","text":"3 – 30 GHz, with a wavelength of 10 cm – 1 cm","correct":false}]',
     '{"B1"}'),

    (s1_id, 'The two methods used to modulate an RF carrier wave with intelligence are:',
     '[{"id":"a","text":"Amplitude Modulation (AM) and Frequency Modulation (FM)","correct":true},{"id":"b","text":"Priority selection and Forced selection","correct":false},{"id":"c","text":"Ground wave and Sky wave modulation","correct":false}]',
     '{"B1"}'),

    (s1_id, 'A "skip zone", where neither the line-of-sight wave nor the reflected wave can be received, is associated with:',
     '[{"id":"a","text":"Ground wave propagation","correct":false},{"id":"b","text":"Sky wave propagation, due to reflection off the ionosphere","correct":true},{"id":"c","text":"Space wave propagation used for satellite communication","correct":false}]',
     '{"B1"}'),

    (s1_id, 'The crystal microphone generates a voltage by exploiting the:',
     '[{"id":"a","text":"Piezoelectric properties of a quartz crystal","correct":true},{"id":"b","text":"Electromagnetic-induction principle of a coil and magnet","correct":false},{"id":"c","text":"Varying resistance of carbon granules","correct":false}]',
     '{"B1"}'),

    (s1_id, 'The VHF communication system fitted to aircraft normally operates within the frequency range of:',
     '[{"id":"a","text":"2.000 MHz to 29.999 MHz","correct":false},{"id":"b","text":"118.000 MHz to 136.000 MHz","correct":true},{"id":"c","text":"300 Hz to 3 KHz","correct":false}]',
     '{"B1"}'),

    (s1_id, 'Which frequency must never be transmitted on, as it is a recognized emergency/distress channel?',
     '[{"id":"a","text":"118.000 MHz","correct":false},{"id":"b","text":"121.50 MHz","correct":true},{"id":"c","text":"136.000 MHz","correct":false}]',
     '{"B1"}');

END $$;
