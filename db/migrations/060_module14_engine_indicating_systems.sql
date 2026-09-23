-- Module 14: Propulsion (B2) — Engine Indicating Systems
-- Source: EASA Part-66 Module 14 official textbook (IKAROS Aviation Training Centre)

DO $$
DECLARE
    m14_id INT;
    s1_id  INT;
BEGIN
    SELECT id INTO m14_id FROM easa_modules WHERE code = 'M14';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M14.2') THEN
        RAISE NOTICE 'M14.2 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 14.2: Engine Indicating Systems
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m14_id, 'M14.2', 'Engine Indicating Systems',
        $cnt$
# Engine Indicating Systems

## Introduction

Aircraft cockpits contain either conventional panels with typical gauge displays, or the newer "glass cockpit" arrangement using cathode ray tubes (CRT), flat panels (TFT) and light emitting diode displays (LED). Both arrangements provide essentially the same information to the pilot, although the newer electronic cockpits are capable of displaying a greater amount of fault-isolation information about the instrument package and the engine.

Engine instruments in the cockpit can be divided into the following categories:

| Category | Parameters |
|----------|------------|
| **Power / Performance** | Fan Speed (N1), Core Speed (N2), Exhaust Gas Temperature (EGT), Engine Pressure Ratio (EPR), Engine Torque (propeller-driving engines) |
| **Fuel** | Flow, Temperature |
| **Oil** | Quantity, Pressure, Temperature |
| **Condition** | Engine Vibration |

In some cockpit layouts, the power-related indications are categorised as the **primary engine display**, while all other indications are categorised as **secondary displays**.

## Conventional Instruments

On a conventional instrument panel, individual round-dial gauges are provided for each parameter:

- **EPR Indicators** — indicate the ratio of turbine discharge pressure (Pt7) to inlet pressure (Pt2), as a measure of engine thrust output
- **N1 RPM Indicators** — indicate low pressure compressor speed in % RPM
- **EGT Indicators** — indicate average temperature aft of the turbine, in °C
- **N2 RPM Indicators** — indicate high pressure compressor speed in % RPM
- **Fuel Flow Indicators** — dial indicates fuel flow in kg/hr; a digital counter indicates fuel used in kg
- **Fuel-Used Reset Switch** — resets the fuel-used digital counters to zero
- **Fuel Temperature Indicator** — indicates fuel temperature downstream of the fuel heater
- **Oil Pressure Indicators** — indicate distribution line lubrication oil pressure in psi
- **Oil Temperature Indicators** — indicate oil temperature at the outlet of the oil cooler, in °C
- **Oil Quantity Indicators** — indicate the quantity of usable engine lubricating oil, in quarts

## Flat Panel Displays

Flat panel displays replace the older electromechanical indicators. They include an **Electronic Engine Display Panel** and an **Electronic Systems Display Panel**, which accept existing signals from the aircraft sensors and display the information in digital and analog format (e.g. Reverse Thrust Annunciators, EPR Limit, N1/N2 Tach, EGT, Fuel Flow, Fuel Used, Oil Pressure/Temperature/Quantity on the Engine Display Panel; Ram Air Temperature, Fuel Temperature, Hydraulic Pressure/Quantity, Flap Position, Slat Annunciators on the System Display Panel).

The display technology used is Light Emitting Diode (LED): it has excellent brightness-control characteristics so that no colour change occurs with changes in brightness, and dimming is achievable down to very low brightness levels. Being solid-state (no mechanical components) gives the system much higher reliability.

## Electronic Displays (EIS)

Most modern cockpits are equipped with an Electronic Instrument System (EIS), using Cathode Ray Tubes (CRT) or transistorised Thin Film Technology (TFT) displays in place of individual gauges.

**Engine/Warning Display (E/WD)** — primary engine parameters are permanently (continuously) shown:
- N1 — displayed both analog and numeric
- EGT — displayed both analog and numeric
- N2 — displayed numeric; normal indication green, above-limit indication red, sensor-fail indication amber
- Fuel Flow — displayed numeric, in kg per hour
- Thrust Limit Mode (e.g. climb mode selected) — used to calculate the rate limit
- N1 or EPR Rating Limit — the maximum allowable engine thrust
- Warnings — text shown in amber or red (about 40 different engine-related warnings are possible)

**System Display (SD)** — secondary parameters, shown when the ENG system page key is selected on the ECAM/EIS panel:
- Fuel Used — numeric accumulated fuel flow (kg); resets to zero at engine start on the ground
- Oil Quantity — normally green display; pulsing display if quantity is low
- Oil Pressure — normally green display; out-of-limit gives a pulsing display, low pressure gives a red display
- Oil Temperature — numeric, green display
- Nacelle Temperature — displayed green if temperature is above 240°C
- N1 and N2 Vibration — numeric, green display; pulsing if the limit is exceeded
- Oil Filter Clog Warning — indicates excessive pressure drop across the oil filter
- Fuel Filter Clog Warning — indicates excessive pressure drop across the fuel filter

## Engine Power Indication — Tachometers

Tachometers are one of the required instruments in all powered aircraft; their indications allow pilots to monitor engine performance.

- **N1 indicator** — receives a signal from a tachometer generator, giving an indication of LP compressor and turbine speed
- **N2 indicator** — receives a signal from an accessories-gearbox-mounted electric tachometer generator, giving an indication of HP compressor and turbine speed

**Units of indication:**
- Tachometers for **reciprocating engines** indicate engine speed in **RPM × 100**
- Tachometers for **turbine engines** indicate compressor and turbine speed in **percent of rated RPM**

### Mechanical Tachometers

The most widely used tachometer for smaller reciprocating engines is the **magnetic drag type**. A relatively small permanent magnet inside the instrument case is driven by a steel cable from the engine at one half of the crankshaft speed. An aluminium drag cup rides over (but does not touch) the outside of the magnet, and a steel shaft attached to the drag cup carries the pointer, its rotation restrained by a calibrated hairspring.

As the engine turns, the rotating magnet's lines of flux cut across the aluminium drag cup and induce an eddy current in it; this current produces a magnetic field that tries to magnetically lock the drag cup to the rotating magnet. The calibrated hairspring restrains the cup so it turns only a portion of a revolution proportional to engine speed, moving the pointer across a dial marked in RPM × 100.

Magnetic drag tachometers are not known for their accuracy, and since engine RPM is extremely important, their indication should be checked with a stroboscopic or laser tachometer any time accuracy is in question.

### Electric Tachometers

Some older electric tachometers were simply voltmeters measuring the voltage produced by an AC or DC permanent-magnet tachometer generator. This system has the inherent limitation that its accuracy depends on the strength of the permanent magnet in the generator, and that strength deteriorates over time.

The much more accurate and widely used system employs a **three-phase AC permanent-magnet generator** on the engine, driving a small **synchronous motor** inside the tachometer case. This motor drives a magnet assembly and a drag disk, which operates in the same way as the drag cup in the mechanical tachometer. This instrument is inherently accurate because the generator frequency is determined only by engine RPM — variations in generator magnet strength have little or no effect on accuracy.

### Electronic Solid-State Systems

- **Fan RPM Pick-Up** — a sensor mounted at the fan case places a magnet adjacent to the fan blade rotation. As the fan blade tips cut through the sensor's magnetic field, an eddy current is created; a conditioner unit amplifies this signal to the percent-tachometer indicator. Since fan speed relates directly to thrust, manufacturers often choose the N1 tachometer as the primary thrust indicator.
- **Gearbox-Mounted N2 Speed Sensor** — a sensor is fitted very close to a rotating gear in the main accessory gearbox; as the lines of flux are broken by the passing gear teeth, the sensor electronically counts the teeth to determine N2 speed.

## Temperature Indication System — Thermocouple Principle

Cylinder head temperature (reciprocating engines) and exhaust gas temperature (both reciprocating and turbine engines) are measured with **thermocouple instruments**. These instruments require no external power, because a thermocouple is itself an electrical generator.

A thermocouple is a loop made of two dissimilar types of wire. Temperature is measured at the **measuring (hot) junction**, where the two wires are joined. The other junction — the **cold, or reference, junction** — is located inside the instrument case. A voltage is produced between the two junctions proportional to the temperature difference between them; this causes a current to flow, which is measured by a milliampere-meter whose dial is calibrated in °C or °F.

Since the indicator measures current, the resistance of the conductors between the junctions is critical. Thermocouple leads usually have a resistance of either **two or eight ohms**, and their length must not be altered to suit the installation, as this would change their resistance. If leads are too long, they may be neatly coiled and secured. If resistance is too low, a special resistor may be installed in the negative lead.

For the indication to be meaningful, the reference junction temperature must be held constant — in a laboratory this is done with a container of melting ice, but this is impractical in an aircraft instrument. Instead, the indicator needle is mounted on a **bimetallic hairspring** that moves the pointer back as cockpit temperature increases, compensating for reference junction temperature changes.

**Approximate thermoelectric voltage output:**

| Thermocouple materials | Voltage output |
|---|---|
| Alumel – Chromel | **2.60 mV per 100°C** |
| Copper – Constantan | **4.25 mV per 100°C** |

### Cylinder Head Temperature (CHT) — Reciprocating Engines

CHT is measured with thermocouples made of **copper or iron wire for the positive lead** and **constantan** (a copper-nickel alloy) **for the negative lead**. One end of each wire is embedded in a special copper spark plug gasket, or joined inside a bayonet probe — this forms the hot (measuring) junction. The other ends connect to the instrument movement, forming the cold (reference) junction.

### Exhaust Gas Temperature (EGT) — Reciprocating and Turbine Engines

The higher temperatures of exhaust gas (both reciprocating and turbine engines) are measured with thermocouples made of **chromel** (an alloy of nickel and chromium, used as the positive lead) and **alumel** (an alloy of nickel, aluminium, manganese and silicon, used as the negative lead). On a reciprocating engine, the thermocouple is mounted in the exhaust stack, usually within six inches of the cylinder head.

## Turbine Engine Temperature Indication

Hot-section temperature is considered the most critical of all engine operating parameters, because an out-of-limits condition can render an engine unairworthy within seconds. The temperature gauge in the cockpit may be labelled according to where it is actually sensed:

| Label | Sensing position |
|---|---|
| **TIT** — Turbine Inlet Temperature | Forward of the turbine wheel(s) |
| **ITT** — Interstage Turbine Temperature | At an intermediate position between multiple turbine wheels |
| **EGT** — Exhaust Gas Temperature | Aft of the turbine wheel(s) |
| **TOT** — Turbine Outlet Temperature | Identical to EGT |

Regardless of the actual monitoring position, the important consideration is always the temperature at the turbine inlet. It is not always possible to monitor directly at this point, because the high heat there can degrade the service life of the sensing probe.

Several thermocouple probes are positioned around the engine on pads that allow the hot junction to penetrate the hot gas path. Connected in a **parallel electrical circuit**, the system indicates the **average** of all the thermocouple temperatures on a single cockpit gauge. This system, more than any other engine instrument system, indicates the integrity of the turbine components: for instance, damaged or missing turbine blades cause hot gases to reach the sensing probes more quickly, resulting in a high temperature indication.

**Why EGT is normally the parameter displayed:** the most critical temperature is the turbine inlet temperature (TIT), but this is extremely difficult to measure directly — a probe placed just ahead of the first-stage turbine would interfere with the critical flow of gases entering the turbine, and any probe sensitive enough to measure the temperature accurately would be easily damaged by the high-velocity flow of hot gases. Engineering tests show a definite relationship between the temperature of the gases leaving the last stage of the turbine and their temperature entering the first stage. Since the temperature leaving the turbine (EGT) is easy to measure, this is the value displayed to the flight crew — as long as EGT remains within its allowable range, TIT is not excessive. A turbine EGT system uses several thermocouples connected in parallel, arranged around the tail cone to sample temperature at several locations; the parallel connection gives one indication that is the average temperature of the gases leaving the turbine.

## Engine Pressure Ratio (EPR)

Engine Pressure Ratio is used as a performance (thrust) setting instrument on many flight decks, and also as a condition-monitoring instrument on some fan-speed-rated engines that use N1 speed as their primary performance instrument.

**EPR calculation:** EPR is the ratio of two engine pressures — turbine discharge total pressure and compressor inlet total pressure:

**EPR = Exhaust Pressure (Pt7) / Intake Pressure (Pt2)**

Each manufacturer uses a slightly different engine station numbering system to identify the tap-off points; for example, Pratt & Whitney engines use Station 2 (Pt2) and Station 7 (Pt7) — for dual-spool engines Stations 2 (Pt2) and 5 (Pt5) may also be used.

**Worked example (Pratt & Whitney JT8):** turbine discharge pressure Pt7 = 28.52 psia, compressor inlet pressure Pt2 = 14.7 psia:

**EPR = 28.52 psia / 14.7 psia = 1.94**

An EPR indication of 1.245, for example, means turbine discharge pressure (Pt7) is 1.245 times greater than compressor inlet pressure (Pt2). Since the gas turbine converts pressure energy into a high-velocity jet, and the tailpipe has a large exit flow area and high velocities, even a relatively low pressure ratio (e.g. 1.94 times ambient) can produce a large thrust force.

**EPR Indicating System** — consists of a set of Pt7 probes, a single Pt2 probe, a manifold, an EPR transducer containing a synchro transmitter, and a cockpit indicator. The single Pt2 probe senses compressor inlet pressure (suction at high ground-level compressor speeds, or pressure above ambient in flight) and sends a signal to the transducer. The several Pt7 probes, via the manifold, send a turbine discharge pressure signal to the same transducer. The two signals combine to provide the pressure ratio indication in the cockpit.

## Torque Indicating System

Torque indicating systems are required on all torque-producing engines, such as **turboprops and turboshafts**, where torque indication is the primary performance instrument in the cockpit. The torque indicator receives its input from the torque-sensing system on the engine, giving the operator a continuous indication of the power output of the engine to the propeller.

**Common units for torque display:**
- Torque oil pressure (psi)
- Torque oil pressure (ft. lbs.)
- Torque percent
- Horsepower

**The two most-used torque-sensing systems are:**
- **Hydro-mechanical system** (balanced oil piston) — converts engine oil pressure into a torque signal
- **Electronic system** (phase shift) — converts the twist of the power output shaft into a torque signal

**Torque limits:** the torque load applied to the power reduction gearbox is limited, and overtorque is prevented by the operator monitoring the torque gauge during engine operation. Torque limits are time-influenced — for example, the engine can operate up to **5,900 foot-pounds of torque for a maximum of 15 seconds** with no maintenance action required; if either the torque limit or the 15-second limit is exceeded, the power output reduction gearbox must be removed for overhaul.

### Hydro-Mechanical Torque Indicating System

The torque-sensing mechanism contains a pilot valve under very little tension at zero torque; engine oil pressure then acts equally on both oil lines to the differential pressure gauge, cancelling out to give a zero reading. When the output shaft loads the torsion gear, forcing the outer helical gear over and adding tension to the pilot valve spring, a reduced case pressure results, and the torque gauge indication rises. The pressure drop between calibrated engine oil pressure and case oil pressure is proportional to the applied torque load. The main and torsion shafts rotate at the same speed as the turbine driving them: the torsion shaft carries the majority of the load from the output shaft, while the main shaft is used as a reference point.

### Electronic Torque Indicating System

This system uses a torque signal transmitter (pick-up) containing an inner and an outer drive shaft, both rotating at the same speed as the engine turbine wheel(s) to which they are mechanically coupled. Only the inner shaft carries the majority of the load from the power output shaft; the outer shaft is used as a reference point. Teeth machined on the front end of both shafts are aligned at zero torque. When a load is applied to the inner shaft, its teeth move out of alignment with the outer shaft's teeth; this angular deflection (twist), applied to the torque sensor circuit, is converted to a voltage output that powers the cockpit gauge.

## Engine Fuel Indication

Engine fuel system indicators generally consist of **fuel flow** and **fuel temperature**. Many cockpits also include warning lights for low fuel pressure and for filter bypass (contamination).

- **Fuel Temperature** — receives a signal from a temperature sensor located at the fuel heater output line
- **Fuel Flow** — the gauge receives a signal from a fuel flow transmitter located in the metered fuel line to the combustor
- **Inlet Fuel Pressure Low** warning light — indicates fuel supply pressure to the engine is too low
- **Fuel Filter Press Drop** warning light — indicates fuel filter differential pressure is high, due to ice or contamination
- **Fuel Used Reset** — resets the fuel-used digital counter to zero

## Fuel Flow Indicating System

The fuel flow indication system for turbine engines measures fuel consumption in pounds or kilograms per hour. Modern fuel flow meters measure **mass flow rather than volume**, which compensates for fuel temperature in the read-out. Three types of fuel flow meter are in use:

### Vane-Type Flow Meter

Designed to measure the **volume** of flow. The system consists of a flow meter transmitter (generally located in the engine fuel line to the combustor) and a cockpit indicator. The synchros of the transmitter and indicator are connected in parallel and excited with **26V, 400 Hz**. As the vane is moved against its restraining spring by the volume of flow, the transmitter rotor moves with it, and the indicator rotor tracks along with the transmitter magnet, giving a fuel flow reading (in pounds per hour, in the source example).

### Synchronous Mass Flow Meter

More recently developed than the vane type, with greater accuracy because it measures **mass** flow rather than volume, compensating for fuel temperature in the read-out. Fuel enters the transmitter impeller, which is rotated at a **constant 60 revolutions per minute** by a synchronous impeller motor. Fuel temperature determines the fuel's volume and the force created by the impeller's action; the turbine is twisted against its restraining spring by the mass-flow force, and the transmitter arrangement is otherwise similar to the vane-type system.

### Motorless Mass Flow Meter

The latest development in electronic solid-state fuel measuring systems: small in size, it accounts for variables such as fuel temperature and specific gravity with an accuracy of about **1%**, compared with approximately **2%** for motor-driven flow meters. Almost all large turbine-powered aircraft use this motorless type, with a digital display rather than a traditional gauge and pointer.

The flow meter transmitter converts flow rate into two electronic signals, created as the flowing fuel gives an angular displacement to two continuously rotating magnets, which induce electronic impulses into stationary pick-off coils; the **time difference between the two pulses** is used as the measure of mass flow rate — the greater the mass flow, the greater the spring deflection and angular difference between the magnets, and thus the greater the time displacement, which is directly proportional to mass flow rate.

A related motorless, turbine-driven fuel flow transmitter is located in the fuel line between the fuel filter and the HP fuel pump; the fuel flow drives its turbine at a **constant speed of 300 RPM**. A jammed rotor has no effect on engine performance, because the pressure drop across the transmitter is minimal. A pulse shaper in the EMUX (Engine Multiplexer) conditions the signal, which is sent to the MFD (Multi Function Display Unit), where the time factor is integrated into the fuel flow rate signal to give a fuel-used figure. The fuel-used figure remains on display after engine shutdown and resets automatically at the next engine start; when fuel flow or fuel-used information becomes unreliable, the relevant display shows amber dashes.

## Engine Oil Indication

Oil system indicators generally consist of oil **temperature**, **pressure**, and **quantity**. Many cockpits include warning lights for low oil pressure and for filter bypass if contaminated.

- **Pressure** — taken from an external oil line at the accessories gearbox
- **Temperature** — taken by a sensor in an external line at the supply line
- **Quantity** — taken at the oil tank
- **Oil Pressure Low** warning light — indicates oil pressure is too low (**below 35 psi**)
- **Oil Strainer Clogging** warning light — indicates oil filter differential pressure is too high due to contamination (**above 35 psi**)

### Oil Temperature Indication

The oil temperature indicating system consists of a **resistance bulb** and an indicator in a **28V DC**-powered circuit. The bulb contains a temperature-sensitive pure-nickel wire wound around a mica core, contained in a steel outer casing, and is installed in an oil line with its tip protruding into the oil stream. The resistance bulb acts as the variable resistor in a **Wheatstone bridge**-type circuit: bulb resistance increases when heated, and as this occurs more current flows through the meter, giving a milliampere-circuit indication of oil temperature in the cockpit.

An alternative solution is the **ratiometer instrument**, using two coils: Coil 1 (in series with the bulb) moves the pointer toward the right of the scale according to sensed oil temperature; Coil 2 (in series with a fixed resistor) moves the pointer toward the left. Together, the two coils compensate for any instability in the aircraft's supply voltage.

### Oil Quantity Indication

A magnet located on a float controls reed switches; the current to the indicator depends on the resistance inside the probe.

### Oil Pressure Indication

Depending on the oil pressure, the iron core inside the transmitter moves position, and the pointer of the oil pressure indicator moves accordingly. Close to the oil pressure transmitter at the engine, there are two switches:
- **Oil low-pressure caution switch** — warns if oil pressure drops below 35 psi
- **Oil filter differential-pressure switch** — warns if the filter is contaminated (clogged)

## Engine Vibration Monitoring

The Vibration Indication system presents a read-out of vibration amplitude to the flight deck. Amplitude is presented in **"mils"** (thousandths of an inch), with a limit of around **4.5 mils**.

**Components:** the component used to sense vibration is an **accelerometer**. Two types are in use:
- The **spring-mounted magnet type** — used on older engines
- The **piezo-electric type**

There can be up to six pick-ups located around the engine, but most engines have only two — one on the fan case and one on the turbine case. The display may be a separate instrument (older aircraft) or part of a digital display on an Electronic Instrument System. Signals are processed and converted from velocity signals into voltage by the **Airborne Vibration Monitor (AVM)**, usually located in the aircraft's main Electronic Equipment centre.

**Operation:** on the earlier (spring-loaded magnet) pick-up, a spring-loaded magnet is surrounded by a powered coil, the whole enclosed in a case. As the engine vibrates, the case and coil move but the magnet stays still, and the relative movement generates a signal. The later piezo-electric version uses a stack of piezo-electrical crystal discs placed between a mass and a base; under vibration, the mass exerts a variable force on the discs, generating a voltage directly proportional to acceleration in the chosen frequency range. Most engines use two accelerometers to sense engine vibration in the radial direction.

The AVM receives these vibration signals along with N1 and N2 speed signals; a digital filter, controlled by the tachometer signals, controls (tunes) the velocity signals. The Engine Vibration Monitoring (EVM) system shows the out-of-balance force for the N1 and N2 shafts — high engine vibration indicates engine damage or other deviations, and also reduces comfort in the aft passenger compartment. Vibration is shown either as speed in inches per second (**iPS**) or amplitude in **Mils** (milli-inch = 1/1000 inch). The vibration transducer is located on the compressor casing or close to a bearing; N1 and N2 engine speed control the band-pass frequency of the tracking filter, whose output represents vibration of the N1 and N2 shafts respectively.

## Engine Multiplexing and Electronic Engine Control (EEC)

Earlier aircraft engine indicating systems used separate wiring and an indicator for each parameter. Digital technology allows parameters to share one data line between different users — this is called **multiplexing**, and it reduces the amount of wiring between engine and cockpit, reduces weight, and improves reliability.

The **Engine Multiplexer (EMUX)** is located close to the engine. Its input signals are analog, from the various sensors; its output data line consists of one pair of shielded wires, over which all parameters are transmitted in sequence to the display system (**Multi Function Display System, MFDS**).

Modern engines are fully electronically controlled: the engine is equipped with an **Electronic Engine Control (EEC)** unit. To control the engine, the EEC needs many different engine parameters. Thrust lever position is submitted to the EEC as a thrust demand; based on this signal and all environmental inputs, the EEC controls fuel metering and bleed control. The most necessary parameters are displayed to the pilots, as the EEC provides the data output to the Electronic Instrument System.

**Primary engine parameters shown on the E/WD** (fed by the EEC): EPR (or N1), N2, Fuel Flow.

**Secondary engine parameters shown on the SD** (fed by the EEC): Fuel Used, Oil Quantity, Oil Pressure, Oil Temperature, Vibrations, Nacelle Air Temperature.
        $cnt$,
        2
    ) RETURNING id INTO s1_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M14.2 Engine Indicating Systems (26 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s1_id, 'Engine instruments in the cockpit are commonly divided into which categories?',
     '[{"id":"a","text":"Power/Performance, Fuel, Oil, Condition (Vibration)","correct":true},{"id":"b","text":"Airframe, Hydraulic, Electrical, Avionics","correct":false},{"id":"c","text":"Primary, Secondary, Tertiary, Auxiliary only","correct":false}]',
     '{"B2"}'),

    (s1_id, 'On some cockpit layouts, engine indications are grouped into primary and secondary displays. What determines whether a parameter is shown on the primary display?',
     '[{"id":"a","text":"Power-related indications are categorised as primary; all other indications are secondary","correct":true},{"id":"b","text":"Only warning indications are categorised as primary","correct":false},{"id":"c","text":"Fuel indications are always primary and power indications are always secondary","correct":false}]',
     '{"B2"}'),

    (s1_id, 'On an Engine/Warning Display (E/WD) in an Electronic Instrument System, which parameters are permanently (continuously) shown?',
     '[{"id":"a","text":"N1, EGT, N2 and Fuel Flow","correct":true},{"id":"b","text":"Only cabin pressure and hydraulic quantity","correct":false},{"id":"c","text":"Only the fuel-used digital counter","correct":false}]',
     '{"B2"}'),

    (s1_id, 'The N1 indicator receives its signal from a tachometer generator to indicate:',
     '[{"id":"a","text":"LP compressor and turbine speed","correct":true},{"id":"b","text":"HP compressor and turbine speed","correct":false},{"id":"c","text":"Propeller shaft torque","correct":false}]',
     '{"B2"}'),

    (s1_id, 'The N2 indicator receives its signal from an accessories-gearbox-mounted electric tachometer generator to indicate:',
     '[{"id":"a","text":"LP compressor and turbine speed","correct":false},{"id":"b","text":"HP compressor and turbine speed","correct":true},{"id":"c","text":"Fan blade tip speed only","correct":false}]',
     '{"B2"}'),

    (s1_id, 'Reciprocating-engine and turbine-engine tachometers use different indication scales. Which is correct?',
     '[{"id":"a","text":"Reciprocating engine tachometers indicate RPM x 100; turbine engine tachometers indicate percent of rated RPM","correct":true},{"id":"b","text":"Both reciprocating and turbine tachometers always indicate percent of rated RPM","correct":false},{"id":"c","text":"Reciprocating engine tachometers indicate percent of rated RPM; turbine tachometers indicate RPM x 100","correct":false}]',
     '{"B2"}'),

    (s1_id, 'In a magnetic drag tachometer, the instrument pointer is driven by:',
     '[{"id":"a","text":"An aluminium drag cup, restrained by a calibrated hairspring, reacting to eddy currents induced by a rotating permanent magnet","correct":true},{"id":"b","text":"A direct mechanical gear train from the crankshaft with no restraining spring","correct":false},{"id":"c","text":"A piezo-electric crystal stack that generates a voltage proportional to RPM","correct":false}]',
     '{"B2"}'),

    (s1_id, 'Compared with an older electric tachometer that simply measures generator voltage, the three-phase AC synchronous-motor tachometer is inherently more accurate because:',
     '[{"id":"a","text":"Its indication depends only on generator frequency (i.e. engine RPM), which is largely unaffected by deterioration of generator magnet strength","correct":true},{"id":"b","text":"It has no moving parts of any kind","correct":false},{"id":"c","text":"It reads groundspeed rather than engine RPM","correct":false}]',
     '{"B2"}'),

    (s1_id, 'A thermocouple instrument used for temperature indication requires no external power supply because:',
     '[{"id":"a","text":"A thermocouple is itself an electrical generator, producing a voltage proportional to the temperature difference between its two junctions","correct":true},{"id":"b","text":"It is powered directly from the aircraft''s 28V DC bus at all times","correct":false},{"id":"c","text":"It uses a piezo-electric crystal to generate its own power","correct":false}]',
     '{"B2"}'),

    (s1_id, 'In a thermocouple temperature indicator, compensation for changes in the reference (cold) junction temperature inside the instrument case is achieved by:',
     '[{"id":"a","text":"Mounting the indicator needle on a bimetallic hairspring that moves the pointer as cockpit temperature changes","correct":true},{"id":"b","text":"Packing the reference junction in melting ice inside the instrument case","correct":false},{"id":"c","text":"Automatically adjusting the thermocouple lead resistance electronically","correct":false}]',
     '{"B2"}'),

    (s1_id, 'According to the source material, the approximate thermoelectric voltage output of an Alumel-Chromel thermocouple pair is:',
     '[{"id":"a","text":"2.60 mV per 100°C","correct":true},{"id":"b","text":"4.25 mV per 100°C","correct":false},{"id":"c","text":"26.0 mV per 100°C","correct":false}]',
     '{"B2"}'),

    (s1_id, 'For Cylinder Head Temperature (CHT) thermocouples on reciprocating engines, the wire materials used are:',
     '[{"id":"a","text":"Copper or iron for the positive lead, constantan for the negative lead","correct":true},{"id":"b","text":"Chromel for the positive lead, alumel for the negative lead","correct":false},{"id":"c","text":"Platinum for both the positive and negative leads","correct":false}]',
     '{"B2"}'),

    (s1_id, 'For Exhaust Gas Temperature (EGT) thermocouples on reciprocating and turbine engines, the wire materials used are:',
     '[{"id":"a","text":"Copper for the positive lead, constantan for the negative lead","correct":false},{"id":"b","text":"Chromel for the positive lead, alumel for the negative lead","correct":true},{"id":"c","text":"Iron for both the positive and negative leads","correct":false}]',
     '{"B2"}'),

    (s1_id, 'On a turbine engine, Turbine Outlet Temperature (TOT), when labelled in the cockpit, is:',
     '[{"id":"a","text":"Identical to EGT","correct":true},{"id":"b","text":"Always higher than TIT","correct":false},{"id":"c","text":"Measured forward of the turbine wheel(s), the same as TIT","correct":false}]',
     '{"B2"}'),

    (s1_id, 'Although Turbine Inlet Temperature (TIT) is the most critical temperature, EGT is normally the value displayed to the flight crew because:',
     '[{"id":"a","text":"A probe located to measure TIT directly would interfere with the critical gas flow and would be easily damaged, whereas a defined relationship exists between EGT and TIT so that EGT within limits confirms TIT is not excessive","correct":true},{"id":"b","text":"TIT has no relationship to engine health, so it is not worth measuring","correct":false},{"id":"c","text":"EGT probes require no thermocouples, unlike TIT probes","correct":false}]',
     '{"B2"}'),

    (s1_id, 'Engine Pressure Ratio (EPR) is defined as the ratio of:',
     '[{"id":"a","text":"Turbine discharge total pressure (Pt7) to compressor inlet total pressure (Pt2)","correct":true},{"id":"b","text":"Compressor inlet total pressure (Pt2) to ambient static pressure","correct":false},{"id":"c","text":"Fan speed (N1) to core speed (N2)","correct":false}]',
     '{"B2"}'),

    (s1_id, 'In the worked EPR example, turbine discharge pressure Pt7 = 28.52 psia and compressor inlet pressure Pt2 = 14.7 psia. What is the resulting EPR?',
     '[{"id":"a","text":"Approximately 0.52","correct":false},{"id":"b","text":"Approximately 1.94","correct":true},{"id":"c","text":"Approximately 13.82","correct":false}]',
     '{"B2"}'),

    (s1_id, 'A torque indicating system is the primary performance instrument on which type of engine, and what are its two most-used torque-sensing system types?',
     '[{"id":"a","text":"Turboprop/turboshaft engines; hydro-mechanical (balanced oil piston) and electronic (phase shift)","correct":true},{"id":"b","text":"Turbojet engines; EPR-based and N1-based sensing","correct":false},{"id":"c","text":"Piston engines only; manifold pressure and RPM sensing","correct":false}]',
     '{"B2"}'),

    (s1_id, 'In the source material''s torque-limit example, for how long can an engine operate at 5,900 foot-pounds of torque before maintenance action is required?',
     '[{"id":"a","text":"A maximum of 15 seconds","correct":true},{"id":"b","text":"A maximum of 5 minutes","correct":false},{"id":"c","text":"Indefinitely, with no time limit","correct":false}]',
     '{"B2"}'),

    (s1_id, 'Turbine-engine fuel flow meters are generally designed to measure mass flow rather than volume flow because:',
     '[{"id":"a","text":"Measuring mass flow compensates for the effect of fuel temperature on the read-out","correct":true},{"id":"b","text":"Mass flow meters are mechanically simpler than volume flow meters","correct":false},{"id":"c","text":"Volume flow cannot be measured in the metered line to the combustor","correct":false}]',
     '{"B2"}'),

    (s1_id, 'Compared with motor-driven fuel flow meters (approximately 2% accuracy), the motorless mass flow meter achieves an accuracy of approximately:',
     '[{"id":"a","text":"1%","correct":true},{"id":"b","text":"10%","correct":false},{"id":"c","text":"0.01%","correct":false}]',
     '{"B2"}'),

    (s1_id, 'In a vane-type fuel flow indicating system, the transmitter and indicator synchros are connected in parallel and excited with:',
     '[{"id":"a","text":"26V, 400 Hz","correct":true},{"id":"b","text":"115V, 50 Hz","correct":false},{"id":"c","text":"28V DC","correct":false}]',
     '{"B2"}'),

    (s1_id, 'The oil low-pressure warning light on a typical turbine engine illuminates when oil pressure drops below:',
     '[{"id":"a","text":"35 psi","correct":true},{"id":"b","text":"350 psi","correct":false},{"id":"c","text":"3.5 psi","correct":false}]',
     '{"B2"}'),

    (s1_id, 'The oil temperature indicating system described uses a resistance bulb containing a pure-nickel wire wound on a mica core, connected as the variable resistor in a:',
     '[{"id":"a","text":"Wheatstone bridge-type circuit, powered at 28V DC","correct":true},{"id":"b","text":"Simple series capacitor circuit, powered at 115V AC","correct":false},{"id":"c","text":"Piezo-electric bridge circuit requiring no external power","correct":false}]',
     '{"B2"}'),

    (s1_id, 'In the oil quantity indication system described, the current to the indicator depends on the resistance inside the probe, controlled by:',
     '[{"id":"a","text":"A magnet located on a float, which operates reed switches","correct":true},{"id":"b","text":"A rotating impeller driven by oil flow through the tank","correct":false},{"id":"c","text":"A thermocouple mounted at the base of the oil tank","correct":false}]',
     '{"B2"}'),

    (s1_id, 'Engine vibration amplitude is presented to the flight deck in units of "mils," and the approximate limit quoted is:',
     '[{"id":"a","text":"1 mil = 1/1000 inch, with a limit of around 4.5 mils","correct":true},{"id":"b","text":"1 mil = 1 inch, with a limit of around 45 mils","correct":false},{"id":"c","text":"1 mil = 1/1000 mm, with a limit of around 4.5 mils","correct":false}]',
     '{"B2"}'),

    (s1_id, 'On a modern engine equipped with an Electronic Engine Control (EEC), the EEC uses thrust lever position (as thrust demand) and environmental inputs primarily to control:',
     '[{"id":"a","text":"Fuel metering and bleed control","correct":true},{"id":"b","text":"Landing gear retraction sequencing","correct":false},{"id":"c","text":"Cabin pressurisation only","correct":false}]',
     '{"B2"}');

END $$;
