-- Module 11A: Aeroplane Structures and Systems (B1 Turbine Aeroplane) — Air Traffic Navigation Systems and Flight Instruments
-- Source: EASA Part-66 Module 11A official textbook (IKAROS Aviation Training Centre, IK01, Issue Oct.2012)

DO $$
DECLARE
    m11_id INT;
    s1_id  INT;
BEGIN
    SELECT id INTO m11_id FROM easa_modules WHERE code = 'M11';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M11A.7') THEN
        RAISE NOTICE 'M11A.7 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 11A.7: Air Traffic Navigation Systems and Flight Instruments
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m11_id, 'M11A.7', 'Air Traffic Navigation Systems and Flight Instruments',
        $cnt$
# Air Traffic Navigation Systems and Flight Instruments

## Dual Distance Radio Magnetic Indicator (DDRMI)

The **Dual-Distance Radio-Magnetic Indicator (DDRMI)** is an instrument that gives indications for various navigation systems:

1. **Magnetic heading** from the Compass system
2. **Bearings** from VORs or ADFs
3. **Distances** from the DMEs

The DDRMI combines these inputs so that the flight crew can read magnetic heading, VOR/ADF bearings, and DME distances from a single display. A block schematic of the DDRMI system shows its data sources feeding both the Captain's and First Officer's DDRMI displays: DME System No 1 and No 2, VOR System No 1 and No 2, ADF System No 1 and No 2, and Compass System No 1 and No 2.

## Global Positioning System (GPS)

**GPS** is a space-based radio navigation system, which provides worldwide, highly accurate three-dimensional position, velocity and time information. The overall system is divided into three parts:

1. **Space Segment**
2. **Control Segment**
3. **User Segment**

### Space Segment

The Space Segment consists of **24 satellites (21 active + 3 spare)**, in **six orbital planes** with **4 satellites in each orbit**. They orbit the earth every **12 hours** at an approximate altitude of between **11,000 nm and 12,500 nm**. The orbits are arranged so that a minimum of **6 satellites** are in view from any point on the earth. This provides redundancy, since only **4 satellites** are required for a three-dimensional position.

### Control Segment

The Control Segment is a ground station that controls all satellites and is made up of:

1. A **Master Control Station**
2. **Monitor Stations**

The Master Control Station is located at **Colorado**, USA, and is responsible for processing satellite-tracking information received from the **five** Monitor Stations. The Control Segment monitors total system performance, corrects satellite position, and re-calibrates the on-board atomic time standards as necessary. The Monitor Stations are located to provide continuous "ground" visibility of every satellite; **three** of the five monitor stations have ground antennas, used to upload data to the satellites.

### Operation and Position Fixing

GPS operates by measuring the time it takes a signal to travel from a satellite to a receiver on-board the aircraft. This time is multiplied by the **speed of light** to obtain the distance measurement, giving a **Line Of Position (LOP)**.

The satellites transmit a computer-generated "Pseudo Random Code." The receiver on the aircraft generates the same code, and the first step in using GPS data is to synchronise the two codes. Once the GPS receiver has synchronised with the satellite code, it measures the elapsed time since transmission by comparing the phase shift between the two codes — the larger the phase shift, the longer the time since transmission, and time since transmission multiplied by the speed of light equals distance.

**Position fixing** works progressively:
- A distance measurement from **one** satellite places the aircraft somewhere on the surface of a sphere of that radius.
- A **second** satellite and distance measurement refines the position, as the two LOPs intersect.
- A **third** satellite and distance measurement further refines the position, as three LOPs now intersect at a specific point in space, representing the aircraft's position.

### Signal Structure

GPS satellites transmit on **2 frequencies** in **2 modes** in the **UHF band**:

1. **Precision Mode (P)** — for military use only
2. **Coarse/Acquisition Mode (C/A)**

Both codes transmit signals in a "Pseudo Random Code" at a certain rate.

### Ionospheric Propagation Error

The ionosphere refracts UHF satellite transmissions in the same way it refracts VLF, LF/MF and HF transmissions, only to a lesser degree. A refracted signal has a greater distance to travel than a straight signal, so it arrives later, causing an error in the distance measurement. The ionosphere refracts signals by an amount **inversely proportional to the square of their frequency** — the higher the frequency, the less the refraction, and hence the less the error induced.

Since GPS satellites transmit two different UHF frequencies (**1575.42 MHz** and **1227.60 MHz**), each is affected differently by the ionosphere. By comparing the phase shift between the two frequencies, the amount of ionospheric distortion can be measured directly, and a correction factor entered into the computer to effectively cancel ionospheric propagation error.

### Derived Information and Navigation Management

Although GPS is primarily a position-determining system, it is possible to derive other data by tracking the change in position over time:

- **Actual track** — obtained from several position fixes
- **Ground speed** — calculated from the distance between two fixes
- **Drift angle** — obtained by comparing the aircraft's heading with its actual track

GPS is able to produce all the derived data commonly associated with existing long-range navigation systems such as INS.

A typical GPS provides Great Circle navigation from the present position direct to any waypoint or via a prescribed flight plan. A typical system (GNS-X) retains **up to 999 waypoints** and **up to 56 flight plans** when power is turned off or interrupted, and computes and displays navigation data including Present Position Coordinates, Magnetic Variation, Bearing and Distance to Waypoint, ETA, ETE, Wind Direction and Speed, Desired Track, Drift Angle, Ground Speed, Track Angle and Crosstrack Distance.

### Boeing 777 GPS

The Boeing 777 has **two independent GPS**, used to calculate the aircraft's Latitude, Longitude, Altitude, Groundspeed, and accurate Time. The two sensor units receive GPS satellite signals and calculate the aircraft's position and accurate time. This data is sent to the **Aircraft Information Management System (AIMS)** cabinets and the **Ground Proximity Warning Computer (GPWC)**. AIMS also sends GPS data to the **Air Data Inertial Reference Units (ADIRU)**, used to calibrate the inertial sensors and thereby decrease inertial reference drift. GPS time goes to the Universal Time Co-ordinated function (UTCF) within the AIMS, which also outputs time data to the flight deck clocks.

### GPS Modes of Operation

The Boeing 777 GPS operates in four modes:

1. **Acquisition Mode**
2. **Navigation Mode**
3. **Altitude Aided Mode**
4. **Aided Mode**

**Acquisition Mode** — the GPS sensor units look for and lock onto satellite signals; the sensors must find **at least 4 satellites** before GPS data can be calculated. While in this mode, the sensor receives Aircraft's Present Position, Velocity, and Time & Date from the Flight Management System, to determine which satellites are available.

**Navigation Mode** — once the sensor has acquired and locked onto at least 4 satellites, it enters Navigation Mode and computes GPS data.

**Altitude Aided Mode** — with 4 satellites available, the GPS sensor stores the difference between the ADIRU altitude and the GPS altitude. When only 3 satellites are received, the sensor uses this stored data, together with the ADIRU altitude and the earth's radius as a fourth "range," to estimate GPS altitude.

**Aided Mode** — entered during short periods (less than 30 seconds) of bad satellite coverage (e.g. poor satellite geometry, where at least 4 satellites are available but not spread out far enough for an accurate fix). In this mode the GPS sensor receives altitude, heading and groundspeed from the Flight Management System (FMS), and its own output is again "Non Computed Data" (NCD) until good coverage returns.

### Receiver Autonomous Integrity Monitoring (RAIM)

**RAIM** monitors the status of the satellites the GPS sensor unit is using for its navigation calculations. Its output is an estimate of GPS position error, which is sent to the Flight Management System (FMS) and used by the FMS to determine whether the GPS data can be used for navigation.

### Differential GPS

The accuracy of GPS is typically **15–25 metres** in 95% of position fixes. For security reasons, the US Department of Defence can degrade this accuracy to **100 metres** in 95% of position fixes. This error can be further reduced to almost zero using **Differential GPS**: GPS receivers placed on the ground at known locations calculate the exact errors of the GPS satellites by comparing their known position against the satellite-calculated position. This error is transmitted to other receivers, which use it to correct their own GPS errors and obtain a more accurate position fix.

## Compass Systems

### Direct Reading Compass

This type of compass comprises a magnet system in a liquid-filled bowl. The compass card is attached to a single angular cobalt-steel magnet, suspended in a sapphire cup by an iridium-tipped pivot.

Damping is achieved by filling the compass bowl with a mineral liquid or alcohol, which has low viscosity, a low freezing point, high resistance to corrosion, and does not discolour. The liquid also gives the compass buoyancy, reducing wear on the pivots. Since the compass liquid expands and contracts with temperature changes, a **bellows or corrugated diaphragm** is fitted to compensate.

**B** and **C** correctors compensate for East–West and North–South errors respectively. On some modern aircraft, the direct reading compass is stowed on the centre windscreen strut and only used in an emergency; its lighting is operated by DC and does not affect compass operation.

### Remote Reading Compass (Magnet Gyro)

The magnetic-gyro compass system provides the flight crew with magnetic heading information. A compass card in the Radio Magnetic Indicators (RMIs) on the instrument panel displays the heading, read against a reference point (lubber line).

The compass heading is controlled by a **directional gyro**, which has a stable direction in space. To orient the system with the earth's magnetic field and correct for gyro drift, a **flux valve** is used, which senses the direction of the earth's magnetic field.

### Flux Valve (Detector Unit)

A flux valve, or **detector unit**, senses the angle of the horizontal component of the earth's magnetic field with respect to the aircraft's heading, and gives a long-term stable signal to monitor the gyro-controlled master shaft. It is best described as a North-sensing device, and is similar to a CX (synchro transmitter) in a synchro control system.

### Control Panel and System Test

The compass control panel consists of:

1. **Synchronisation Annunciator**
2. **Synchronisation Knob**
3. **Slaved/DG Switch**

The **Synchronisation Annunciator** indicates synchronisation between the Detector Unit (DU) heading and the gyro heading; a discrepancy is shown as a "DOT" or a "CROSS". The **Synchronisation Knob** allows manual synchronisation — moving it in the direction indicated by the annunciator brings the system to the correct heading.

In the **Slaved/DG Switch**'s normal operating mode (Slaved), the DU and gyro headings are slaved together, with the DU precessing the gyro when an error occurs between the two. In **DG mode**, the DU is removed from the system and the compass operates purely as a Directional Gyro; this mode is mainly used for maintenance, since in flight the heading indication can drift due to gyro drift.

Three items are tested in the system:
- **Cross-dot annunciator sensitivity** — moving the card 5° away from synchronised (manual knob) should make the cross or dot fully visible.
- **Slaving speed** — moving the card 10° away from synchronised, the automatic slaving system should return it within 10 minutes (minimum slaving speed of 1°/min).
- **Directional gyro drift** — with the slaving cut-out switch in DG, drift is checked against a specified formula over a 15-minute period.

The synchro transmitters in the RMI and directional gyro unit transmit heading information to the Autopilot, Flight Director system, Horizontal Situation Indicators (HSIs), Flight Data Recorder system, and VHF NAV receivers.

### Servo Loop and Slaving Loop

A **servo loop** between the gyro and the compass card in the RMI ensures that any change of aircraft heading causes a corresponding (opposite-direction) rotation of the compass card. The loop comprises a **synchro transmitter (Tx)**, a **control transformer (CT)**, a **servo amplifier**, and a **servomotor**. The rotor of the synchro transmitter points in the same direction as the gyro; when an error signal exists at the control transformer, it is amplified and drives the motor, which drives the compass card and the control transformer rotor until the error signal reduces to zero.

The **slaving loop** uses the flux valve's detection of the earth's magnetic field as a common reference. A second control transformer in the RMI compares the compass card reading with the direction of the earth's magnetic field; any difference produces an error signal, amplified by a **slaving amplifier**, which drives a **torque motor** in the directional gyro unit to correct the stable element's position. The same amplified error signal also drives the **cross-dot annunciator**, which can be used for manual synchronisation via the control panel knob.

## Radio Altimeter

Radio altimeters are carried in virtually all aircraft outside the general aviation sector, and their outputs are vital to automatic landing and ground proximity warning systems.

**Barometric altitude** is the altitude of the aircraft as a function of change in air pressure, referenced (above about 3,000 ft) to a standard mean sea level pressure of **1013.25 mb (29.92 in Hg)** — since actual sea-level pressure is rarely exactly this, the altimeter does not read true height above sea level or ground.

**Radio altitude**, by contrast, is always the height above the ground, regardless of air pressure or terrain, and is therefore more useful at low levels — particularly during the landing phase or for ground collision warning.

### Basic Principles

Radio altimeters are **primary radar** systems that transmit RF energy and time how long it takes for an echo to be received. The target is always the ground immediately below the aircraft; the transmitted beam is broadly directional, pointing straight down.

The system transmits a continuous wave, constant-amplitude, frequency-modulated carrier at **4,300 MHz**, with a modulation depth of **50 MHz** — the transmission varies continuously between **4,250 MHz and 4,350 MHz**. Because the transmitted and reflected frequencies differ (due to the travel time to the ground and back), a beat frequency results.

For each foot of transmitted distance, there is a frequency change of approximately **10 cycles**; since the signal must travel to the ground and back, the frequency change per foot of aircraft **altitude** is approximately **20 cycles**. For example, at 1,000 ft above the ground, there would be **20,000 cycles** of frequency difference between transmitted and received signals.

In the receiver mixer, the transmitted and received frequencies are mixed and the beat frequency is counted; the beat counter converts this to an analogue DC voltage whose amplitude is a function of aircraft altitude above the ground, driving a servo system in the indicator.

Indicators may be of dial or ribbon type. On the ribbon type, the aircraft reference symbol stays fixed in the centre while the tape moves behind it, with different tape colours giving an instant indication of approximate height. A manually set **Decision Height (DH)** bug can be set; if the aircraft flies below the DH setting, a DH lamp illuminates as a warning.

### Antenna

The antennas are designed so that, provided the **roll angle does not exceed 30°** and the **pitch attitude does not exceed 20°**, the altitude indication remains correct. Exceeding these limits causes excessive indications, but since these high values are not sustained for long, this does not present a practical problem.

Radio Altimeter systems are called **"Low Range"** because they are not intended to operate at aircraft altitudes above the ground greater than **2,500 ft**; they are used mostly during final approach. During a CAT II approach, the radio altimeter notifies the crew when the aircraft is **100 ft** above the extended runway — the point at which the crew must be able to see the runway to land, called the **"Decision Height"** (which may be selected above 100 ft as required).

### Testing

The system may be tested from the transceiver or other areas depending on aircraft type. When the test switch is operated, the integral test lights are exercised: a **test altitude of 40 ft** is given, and lights display "SYS OK" for serviceable, or "RT"/"ANT" for a fault.

## Weather Radar

Weather Radar is designed to detect turbulent conditions so the pilot can avoid areas that could cause an uncomfortable flight or even structural damage — there is no direct method of detecting turbulence, so the system instead detects conditions **associated with** turbulence.

In calm conditions, water droplets in the air are small and float gently, their weight balanced by air resistance. In turbulent conditions, droplets or ice particles are thrown around, collide and stick together, eventually becoming large and heavy enough to fall. The more violent the turbulence, the larger the droplets become before falling — particularly where there is an updraft. A sufficiently large water droplet will scatter incident electromagnetic waves, with some scattered energy returning toward the transmitter-receiver — this is the basis of **primary radar** detection of water droplets and ice particles. The larger the droplet, the more energy is scattered, so a cloud mass with large droplets gives strong signals — suggesting turbulent conditions. A high rainfall gradient (strong signals adjacent to weak signals) indicates strong, clearly defined updrafts.

The part of a cloud giving strong radar returns is known as the **storm cell**; the closer the storm cell is to the edge of the detected cloud, the higher the rainfall gradient and the worse the conditions are likely to be.

### Principle of Operation

The radar antenna is installed in the nose of the aircraft behind a **radome**. The transmitter/receiver transmits high-energy pulses via the antenna, scanning left to right and back across the area ahead of the aircraft. Reflected pulses are converted into a picture representing weather conditions, using:

- The **strength** of reflected pulses (converted to colour, representing rain density)
- The **time delay** between transmission and reception (converted to distance)
- The **azimuth angle** of the antenna (used to position information on the display)

A secondary function is to show a ground terrain map, achieved by tilting the antenna down and switching to **MAP mode** for correct interpretation of ground returns (which differ from cloud returns). The radar must display range, bearing and signal intensity of the cloud; the display device best suited to this is a **cathode ray tube (CRT)** used as a **plan position indicator (PPI)**.

### Scanner Stabilization

As the aircraft pitches and rolls, the scanner must pitch and roll in the **opposite** direction, to keep scanning directly ahead of the aircraft. The scanner is mounted on a stabilized platform maintained at a constant attitude with respect to the horizon, with stabilization derived from the **Inertial Reference System (IRS)**. Pitch and roll stabilization are completely independent systems, each with a separate motor; three rotating joints are required in the scanner waveguide assembly to allow freedom of movement in pitch, roll and azimuth.

### Test Mode

With the mode selector in the TEST position, the transmitter is on for **1 second** for a transmitter test, and off for the remainder of the test, while a test picture is painted on the display. A test sweep of **+15° up and −15° down** is carried out by the antenna, which centralizes at 0° at the end of the test.

### Radome

The **radome** is an aerodynamically shaped nose cone made of dielectric material, normally of sandwich construction — a honeycomb structure supported on each side by a thin skin of laminated glass fibre. It should transmit **90%** of incident energy, possess structural strength, protect against erosion, prevent static spark discharge, and protect against lightning strikes. Anti-static/erosion protection is provided by a bonded polyurethane coating (not too thick, to avoid affecting transmission) plus anti-static paint containing graphite particles. Lightning protection takes the form of metal strips bonded to the radome surface, running from nose to bulkhead, with good electrical bonding to dissipate strikes into the airframe.

## Ground Proximity Warning System (GPWS)

The purpose of GPWS is to alert the flight crew to an unsafe condition due to terrain proximity. Hazardous conditions are divided into **7 modes**:

1. **Mode 1** — Excessive Descent Rate
2. **Mode 2** — Excessive Closure Rate (with respect to rising terrain)
3. **Mode 3** — Excessive Altitude Loss (during climb-out after take-off)
4. **Mode 4** — Insufficient Terrain Clearance (when not in landing configuration)
5. **Mode 5** — Excessive Deviation below the Glideslope (ILS landing)
6. **Mode 6** — Descent Below selected Decision Height
7. **Mode 7** — Windshear

### System Operation

The main component is the **GPWS computer**, which receives information from other aircraft systems (Baro/Rad Alt height, speed, etc.) and calculates whether the aircraft is in danger of contacting terrain below. GPWS only operates within the **Rad Alt range (50 ft to 2,500 ft)**.

The **Ground Proximity Warning Computer (GPWC)** establishes the limits for GPWS modes, compares the aircraft's flight and terrain-clearance status against those limits, and issues warning/alerting signals when a mode is entered. It also stores failure data in non-volatile memory for display on a front-panel window.

### Control Panel and Warning Lights

The GPWS control panel provides visual indications of operation, self-test capability, and flap/gear inhibit capability:

- **INOP light** — amber, illuminates on computer/input malfunction or during self-test.
- **Flap/Gear Inhibit switch** — a guarded, safety-wired two-position toggle; when placed in "INHIBIT", **Modes 2, 3 and 4** are inhibited.
- **Self Test switch** — initiates a GPWS self-test, which can be conducted on the ground or in-flight.

Two warning lights give visual indication of ground proximity warnings: **PULL-UP** and **BELOW G/S**. A "WINDSHEAR" warning message is displayed on the EFIS PFD. The red PULL-UP light illuminates for Mode 1, 2, 3 or 4; the amber BELOW G/S light illuminates for excessive glideslope deviation, and can be inhibited by pressing the BELOW G/S switch.

### BITE

The purpose of the **BITE** (Built-In Test Equipment) is to internally check GPWC functions, record past faults from the last ten flights, and annunciate system status. BITE carries out three types of test:

- **Continuous Test** — performed during each program loop; checks CPU operation, data input integrity, and monitors ADC, IRS, ILS and RAD ALT systems and internal power supplies for valid data.
- **Periodic Test** — subdivided into small segments performed sequentially, one per program loop; covers processor instruction sets, program memory, RAM addressing/storage, voice memory, and data parity checks.
- **Event-Initiated Tests** — performed during or after a specific event, e.g. resetting the program before a power supply failure, or checksumming stored fault/entered data.

Faults are recorded in non-volatile fault memory by flight segment, identified using radio altitude, IAS and Mode 3–4 transitions; up to **24 faults** may be recorded during each flight segment.

## Enhanced Ground Proximity Warning System (EGPWS)

The EGPWS contains all the modes of the standard GPWS, plus additional features enabled by a worldwide terrain database, an obstacle database, and a worldwide airport database. Additional features include:

- **Terrain Alerting and Display (TAD)** — provides a graphic display of surrounding terrain on the Weather Radar Indicator, EFIS, or a dedicated display. Terrain above or within **2,000 ft** below the aircraft's altitude is presented on the display.
- **Peaks** — a TAD supplemental feature providing additional terrain display detail (highest/lowest elevations, extra colour bands, 0 MSL representation) independent of aircraft altitude.
- **Obstacles** — uses an obstacle database for obstacle conflict alerting and display, graphically displayed similarly to terrain when TAD is enabled.
- **Terrain Clearance Floor** — adds protection against premature descent, intended for non-precision approaches, based on aircraft position relative to the nearest runway.
- **Geometric Altitude** — a computed pseudo-barometric altitude based on GPS altitude, designed to reduce/eliminate altitude errors from temperature extremes, non-standard pressure conditions, and altimeter mis-sets.

Table 3 of the source defines terrain/obstacle threat colour coding — for example, **Solid Red** and **Solid Yellow** indicate a terrain/obstacle threat warning, while **Black** indicates no significant terrain/obstacle.

### Controlled Flight Into Terrain (CFIT)

Because most CFIT accidents occur near an airport, the terrain database contains higher-resolution grids for airport areas, with lower-resolution grids elsewhere. Using accurate GPS and FMS information (present position, track, groundspeed), the EGPWS presents a graphical plan view of the aircraft relative to terrain and advises the crew of potential conflicts. Alerts are given when terrain violates computed envelope boundaries on the projected flight path, via visual caution/warning lights, audio annunciation, and colour-enhanced display.

### Terrain Look Ahead Alerting

This feature uses the internal terrain database to look ahead of the aircraft and detect terrain/obstacle conflicts with greater alerting time, based on aircraft position, flight path angle, track and speed relative to the terrain image ahead. A terrain conflict intruding into the **caution** area (typically **60 seconds** ahead of the conflict) triggers caution lights and the aural message "CAUTION TERRAIN" (repeated every 7 seconds while the conflict remains). Intrusion into the **warning** area (typically **30 seconds** ahead) activates warning lights and the message "TERRAIN, TERRAIN, PULL UP", with "PULL UP" repeating continuously while the conflict remains.

### Terrain Clearance Floor (TCF)

TCF enhances the basic GPWS modes by alerting the crew to a descent below a defined "Terrain Clearance Floor," regardless of aircraft configuration, based on RAD ALT and distance (from Lat/Long) relative to the centre of the nearest runway. TCF alerts illuminate the EGPWS caution lights and give the aural message "TOO LOW TERRAIN," provided once on initial envelope penetration and repeated only for an additional 20% decrease in RAD ALT altitude; the caution lights remain on until the TCF envelope is exited. Neither loss nor inhibition of TAD/TCF affects the basic GPWS Modes 1–7.

### EGPWS Interface and Self Test

The EGPWS uses input signals from other on-board systems, including Altitude (RAD ALT/GPS/IRS), Airspeed (IAS/TAS), Attitude (IRS), Glideslope (ILS), Present Position (FMS/IRS/GPS), and Flap/Gear Position; the Windshear function additionally requires Accelerations (IRS), Angle of Attack, and Flap Position. Discrete program pins configure the system for the specific aircraft and interface during installation.

The EGPWS provides a **Self-Test** capability with **six levels**:

1. **Level 1** — GO/NO GO Test (used by the flight crew for pre-flight test)
2. **Level 2** — Current Faults
3. **Level 3** — EGPWS Configuration
4. **Level 4** — Fault History
5. **Level 5** — Warning History
6. **Level 6** — Discrete Test

## Air Data System (ADS)

Air Data Systems depend upon **Pitot and Static pressure sensing**, as well as temperature sensing. **Static air pressure** is the pressure of the outside air at the aircraft's location; **Pitot pressure** is the dynamic pressure caused by the aircraft's forward motion. Temperature sensing is required to calculate Total/Static Air Temperature (TAT/SAT) and True Airspeed (TAS).

In a parked aircraft, pitot and static pressures are equal; in a moving aircraft, pitot pressure is greater because motion through the air develops additional pressure at the tube's forward end. **Altitude** is calculated from static air pressure, and **airspeeds** are calculated from the difference between pitot and static pressures. Since pitot/static probes can be subject to icing, they are fitted with a heater; flush static ports may also be heated.

### Total Air Temperature Probe

**Total Air Temperature (TAT)** is the static air temperature plus the temperature rise created by the pitot effect. TAT is important for setting jet engine operating conditions, since the air entering the engine is at static air temperature increased by the pitot factor; **Static Air Temperature (SAT)** can also be derived from TAT and pitot pressure. The TAT probe resembles a pitot probe but is more complex, since air entering it must be shielded from the probe's own de-icing heat, using metered orifices.

### Location of Probes and Static Vents

Probe/vent locations depend on aircraft type, speed range and aerodynamic characteristics, so there is no common standard across aircraft. Larger aircraft normally have standby probes and static vents located one on each side of the fuselage and interconnected, to balance out dynamic pressure effects from yawing or side-slip. Pitot and static pressures are carried through seamless, corrosion-resistant metal pipelines (with flexible sections where connecting to anti-vibration-mounted components). Provision is made to eliminate water from condensation, rain or snow — via drain holes in the probes and drain taps/valves in the pipelines — to prevent "slugs" of water blocking the lines.

### Air Data Computer (ADC)

The ADC receives Pitot/Static pressure and an electrical temperature signal, and uses these to calculate:

1. Indicated Air Speed (IAS)
2. True Airspeed (TAS)
3. Speed of Sound (Mach)
4. Altitude
5. Rate of change of Altitude
6. Total Air Temperature (TAT)
7. Static Air Temperature (SAT)

The ADC supplies air data information to other aircraft systems in digital or analogue form. The **Altitude Module** contains a capsule for measuring static pressure and an "E & I" pick-off, which converts capsule movement into an electrical signal; this is amplified and fed to a motor servo system that drives a gear train to give the correct altitude reading (and, via a tacho-generator, position feedback and altitude rate).

True Airspeed (TAS) and Indicated Airspeed (IAS) are the same value at sea level; as altitude increases, holding the same IAS results in an increasing TAS.

### Digital Air Data Computer (DADC)

The **DADC** uses digital computing and electronic circuits, rather than a servo motor system, to calculate its outputs. Analogue inputs are converted to digital for computation; outputs are either converted back to analogue or left as digital signals, output via the **ARINC 429 or 629** data buses.

### Definitions

- **Static pressure (Ps)** — the ambient atmospheric pressure acting on the surface of a body at rest.
- **Total pressure (Pt)**, or pitot pressure — the sum of static pressure and impact pressure; the total force acting on the surface of a body in motion.
- **Impact pressure** — the force needed to stop moving air; equal to total pressure minus static pressure (Pt − Ps).
- **Pressure altitude** — the altitude in a standard atmosphere (29.921 in Hg / 1013.25 mb at sea level), without accounting for real-world pressure or temperature variations.
- **Baro corrected altitude** — pressure altitude corrected for QFE or QNH barometric correction signals, via manual input from an altimeter set panel.
- **Altitude rate** — the change in altitude in ft per minute; also called vertical speed, vertical rate, rate of climb, or baro rate.
- **Computed airspeed (CAS)** — an air data function related to impact pressure, corrected by the computer for instrument and installation errors.
- **Mach number (Ma)** — the ratio between true airspeed and the speed of sound.
- **Maximum operational speed (Vmo/Mmo)** — Vmo is the maximum safe airspeed without excessive structural stress; Mmo is the maximum safe Mach number without the negative effects of subsonic shock waves. Both are specified by the manufacturer and pre-programmed in the ADC.
- **Overspeed warning** — a discrete signal from the ADC, present at Vmo/Mmo.
- **Angle of Attack (AOA)** — the angle between the aircraft's longitudinal axis and its flight path, measured from the aircraft's centre of mass.
- **True airspeed (TAS)** — the aircraft's speed relative to the ambient air, i.e. airspeed (impact pressure) corrected for compressibility and density, dependent on altitude and temperature.
- **Total Air Temperature (TAT)** — the temperature sensed by an outside probe when the airstream is brought to a stop against it, rising in pressure and therefore temperature; equal to the air temperature plus this temperature rise.
- **Static Air Temperature (SAT)** — the temperature of the undisturbed ambient air (TAT corrected for speed).
        $cnt$,
        7
    ) RETURNING id INTO s1_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M11A.7 Air Traffic Navigation Systems and Flight Instruments (21 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s1_id, 'The Dual Distance Radio Magnetic Indicator (DDRMI) provides the flight crew with indications of:',
     '[{"id":"a","text":"Magnetic heading from the Compass system, bearings from VORs/ADFs, and distances from DMEs","correct":true},{"id":"b","text":"Only DME distance information","correct":false},{"id":"c","text":"Autopilot mode annunciation only","correct":false}]',
     '{"B1"}'),

    (s1_id, 'The GPS Space Segment consists of:',
     '[{"id":"a","text":"24 satellites (21 active + 3 spare) in six orbital planes with 4 satellites per orbit","correct":true},{"id":"b","text":"12 satellites in a single equatorial orbit","correct":false},{"id":"c","text":"6 satellites, one per orbital plane","correct":false}]',
     '{"B1"}'),

    (s1_id, 'How many GPS satellites are required to obtain a three-dimensional position fix?',
     '[{"id":"a","text":"2 satellites","correct":false},{"id":"b","text":"3 satellites","correct":false},{"id":"c","text":"4 satellites","correct":true}]',
     '{"B1"}'),

    (s1_id, 'The GPS Master Control Station is located at:',
     '[{"id":"a","text":"Colorado, USA","correct":true},{"id":"b","text":"Hawaii, USA","correct":false},{"id":"c","text":"Diego Garcia","correct":false}]',
     '{"B1"}'),

    (s1_id, 'GPS position fixing (Line of Position, LOP) is derived by:',
     '[{"id":"a","text":"Measuring the time a signal takes to travel from satellite to receiver and multiplying by the speed of light","correct":true},{"id":"b","text":"Measuring the Doppler shift of the satellite carrier only","correct":false},{"id":"c","text":"Comparing satellite signal strength against a fixed reference table","correct":false}]',
     '{"B1"}'),

    (s1_id, 'GPS satellites transmit in the UHF band using two modes; the Precision (P) code is:',
     '[{"id":"a","text":"Available to civilian and military users alike","correct":false},{"id":"b","text":"For military use only","correct":true},{"id":"c","text":"Used only for the Control Segment uplink","correct":false}]',
     '{"B1"}'),

    (s1_id, 'The ionosphere refracts GPS satellite transmissions by an amount that is:',
     '[{"id":"a","text":"Inversely proportional to the square of the signal frequency","correct":true},{"id":"b","text":"Directly proportional to the square of the signal frequency","correct":false},{"id":"c","text":"Independent of frequency","correct":false}]',
     '{"B1"}'),

    (s1_id, 'From a series of GPS position fixes over time, which of the following can be derived?',
     '[{"id":"a","text":"Actual track, ground speed and drift angle","correct":true},{"id":"b","text":"Only present position, with no other derived data","correct":false},{"id":"c","text":"Engine fuel flow and EGT trend data","correct":false}]',
     '{"B1"}'),

    (s1_id, 'On the Boeing 777, GPS data sent to the Air Data Inertial Reference Units (ADIRU) is used to:',
     '[{"id":"a","text":"Calibrate the inertial sensors and decrease inertial reference drift","correct":true},{"id":"b","text":"Directly replace the ADIRU''s pitot/static inputs","correct":false},{"id":"c","text":"Shut down the ADIRU when GPS data is available","correct":false}]',
     '{"B1"}'),

    (s1_id, 'In the Boeing 777 GPS system, before the sensor unit can begin computing GPS data it must, in Acquisition Mode, first lock onto:',
     '[{"id":"a","text":"At least 4 satellites","correct":true},{"id":"b","text":"At least 8 satellites","correct":false},{"id":"c","text":"Any single satellite","correct":false}]',
     '{"B1"}'),

    (s1_id, 'The Boeing 777 GPS "Aided Mode" is entered during:',
     '[{"id":"a","text":"Short periods (less than 30 seconds) of bad satellite coverage, using FMS altitude, heading and groundspeed data","correct":true},{"id":"b","text":"Normal cruise flight as the default operating mode","correct":false},{"id":"c","text":"Complete loss of all satellite signals for an indefinite period","correct":false}]',
     '{"B1"}'),

    (s1_id, 'The purpose of Receiver Autonomous Integrity Monitoring (RAIM) is to:',
     '[{"id":"a","text":"Monitor the status of satellites being used and provide an estimate of GPS position error to the FMS","correct":true},{"id":"b","text":"Physically realign the GPS antenna toward the strongest satellite","correct":false},{"id":"c","text":"Encrypt the GPS signal for civilian users","correct":false}]',
     '{"B1"}'),

    (s1_id, 'Differential GPS improves position accuracy by:',
     '[{"id":"a","text":"Comparing the known position of ground-based receivers against the GPS-calculated position, and transmitting the resulting error correction to other receivers","correct":true},{"id":"b","text":"Doubling the number of satellites tracked simultaneously","correct":false},{"id":"c","text":"Increasing the transmitted power of the P code","correct":false}]',
     '{"B1"}'),

    (s1_id, 'In a Direct Reading Compass, the "B" and "C" correctors compensate for errors in which respective directions?',
     '[{"id":"a","text":"East-West and North-South","correct":true},{"id":"b","text":"Vertical and horizontal only","correct":false},{"id":"c","text":"North-South and East-West","correct":false}]',
     '{"B1"}'),

    (s1_id, 'In a Remote Reading (magnetic-gyro) Compass System, the component that senses the direction of the earth''s magnetic field to correct for gyro drift is the:',
     '[{"id":"a","text":"Flux valve (detector unit)","correct":true},{"id":"b","text":"Servo amplifier","correct":false},{"id":"c","text":"Control transformer alone","correct":false}]',
     '{"B1"}'),

    (s1_id, 'On the compass control panel, placing the Slaved/DG switch in the DG position:',
     '[{"id":"a","text":"Removes the detector unit from the system so the compass operates as a plain Directional Gyro, mainly for maintenance use","correct":true},{"id":"b","text":"Increases slaving speed to improve in-flight accuracy","correct":false},{"id":"c","text":"Disables the compass system entirely","correct":false}]',
     '{"B1"}'),

    (s1_id, 'A radio altimeter transmits a continuous-wave, frequency-modulated carrier centred at approximately:',
     '[{"id":"a","text":"4,300 MHz, varying between 4,250 and 4,350 MHz","correct":true},{"id":"b","text":"430 MHz, varying between 425 and 435 MHz","correct":false},{"id":"c","text":"1,575 MHz, matching one of the GPS frequencies","correct":false}]',
     '{"B1"}'),

    (s1_id, 'Radio altimeter systems are described as "Low Range" because they are not intended to operate above a ground clearance of approximately:',
     '[{"id":"a","text":"2,500 ft","correct":true},{"id":"b","text":"25,000 ft","correct":false},{"id":"c","text":"250 ft","correct":false}]',
     '{"B1"}'),

    (s1_id, 'Weather radar detects conditions associated with turbulence because:',
     '[{"id":"a","text":"There is no direct method of detecting turbulence, so the system detects water droplets/ice particles that scatter radar energy in turbulent conditions","correct":true},{"id":"b","text":"Turbulence itself directly reflects radar pulses back to the receiver","correct":false},{"id":"c","text":"Turbulence increases the ambient air temperature detectably","correct":false}]',
     '{"B1"}'),

    (s1_id, 'As an aircraft pitches and rolls, a stabilized weather radar scanner (referenced to the horizon via the IRS) will:',
     '[{"id":"a","text":"Pitch and roll in the opposite direction to the aircraft, to keep scanning ahead of the aircraft","correct":true},{"id":"b","text":"Pitch and roll in the same direction as the aircraft, unstabilized","correct":false},{"id":"c","text":"Remain fixed relative to the aircraft structure at all times","correct":false}]',
     '{"B1"}'),

    (s1_id, 'GPWS Mode 2 provides a warning for:',
     '[{"id":"a","text":"Excessive closure rate with respect to rising terrain","correct":true},{"id":"b","text":"Excessive descent rate in level cruise flight","correct":false},{"id":"c","text":"Descent below the selected Decision Height","correct":false}]',
     '{"B1"}'),

    (s1_id, 'On the GPWS control panel, placing the Flap/Gear Inhibit switch in the INHIBIT position inhibits which GPWS modes?',
     '[{"id":"a","text":"Modes 2, 3 and 4","correct":true},{"id":"b","text":"Modes 5, 6 and 7 only","correct":false},{"id":"c","text":"All seven modes","correct":false}]',
     '{"B1"}');

    -- ──────────────────────────────────────────────────────────────
    -- Additional Questions — M11A.7 (EGPWS and Air Data System continued)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s1_id, 'The EGPWS Terrain Alerting and Display (TAD) feature presents terrain on the display when it is:',
     '[{"id":"a","text":"Above the aircraft''s altitude, or within 2,000 ft below it","correct":true},{"id":"b","text":"More than 10,000 ft below the aircraft only","correct":false},{"id":"c","text":"Within the immediate vicinity of any airport, regardless of altitude difference","correct":false}]',
     '{"B1"}'),

    (s1_id, 'The EGPWS Terrain Look Ahead Alerting function typically issues a caution alert how far ahead of a detected terrain conflict?',
     '[{"id":"a","text":"Approximately 60 seconds","correct":true},{"id":"b","text":"Approximately 5 seconds","correct":false},{"id":"c","text":"Approximately 10 minutes","correct":false}]',
     '{"B1"}'),

    (s1_id, 'The EGPWS Terrain Clearance Floor (TCF) function is primarily intended to protect against:',
     '[{"id":"a","text":"Premature descent during non-precision approaches, based on position relative to the nearest runway","correct":true},{"id":"b","text":"Excessive airspeed during cruise flight","correct":false},{"id":"c","text":"Engine overtemperature during climb-out","correct":false}]',
     '{"B1"}'),

    (s1_id, 'Which EGPWS Self-Test level is normally carried out by the flight crew as part of their pre-flight test?',
     '[{"id":"a","text":"Level 1 - GO/NO GO Test","correct":true},{"id":"b","text":"Level 4 - Fault History","correct":false},{"id":"c","text":"Level 6 - Discrete Test","correct":false}]',
     '{"B1"}'),

    (s1_id, 'In an Air Data System, aircraft altitude is calculated from:',
     '[{"id":"a","text":"Static air pressure","correct":true},{"id":"b","text":"Pitot pressure alone","correct":false},{"id":"c","text":"Total air temperature","correct":false}]',
     '{"B1"}'),

    (s1_id, 'Total Air Temperature (TAT) differs from Static Air Temperature (SAT) because TAT includes:',
     '[{"id":"a","text":"The temperature rise caused by the pitot effect as the airstream is brought to rest at the probe","correct":true},{"id":"b","text":"A fixed correction for engine bleed air heating","correct":false},{"id":"c","text":"The temperature drop caused by adiabatic expansion around the probe","correct":false}]',
     '{"B1"}'),

    (s1_id, 'The Air Data Computer (ADC) Altitude Module converts static pressure into an altitude indication using:',
     '[{"id":"a","text":"A pressure-sensing capsule, an E and I pick-off, and a motor-driven servo/gear train","correct":true},{"id":"b","text":"A rotating vane anemometer directly coupled to the altimeter needle","correct":false},{"id":"c","text":"A simple mercury manometer read visually by the crew","correct":false}]',
     '{"B1"}'),

    (s1_id, 'For a constant Indicated Airspeed (IAS) as altitude increases, True Airspeed (TAS) will:',
     '[{"id":"a","text":"Increase progressively above the sea-level value","correct":true},{"id":"b","text":"Remain exactly equal to IAS at all altitudes","correct":false},{"id":"c","text":"Decrease progressively below the sea-level value","correct":false}]',
     '{"B1"}'),

    (s1_id, 'A Digital Air Data Computer (DADC) differs from an analogue ADC mainly in that it:',
     '[{"id":"a","text":"Uses digital computing/electronic circuits rather than a servo motor system, outputting via ARINC 429 or 629 data buses","correct":true},{"id":"b","text":"Dispenses with pitot and static pressure inputs entirely","correct":false},{"id":"c","text":"Can only supply analogue outputs, never digital ones","correct":false}]',
     '{"B1"}'),

    (s1_id, 'Impact pressure, as defined for an Air Data System, is equal to:',
     '[{"id":"a","text":"Total pressure minus static pressure (Pt - Ps)","correct":true},{"id":"b","text":"Total pressure plus static pressure (Pt + Ps)","correct":false},{"id":"c","text":"Static pressure alone","correct":false}]',
     '{"B1"}');

END $$;
