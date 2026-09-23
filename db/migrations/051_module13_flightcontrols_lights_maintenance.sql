-- Module 13: Aircraft Aerodynamic Structures (B2) — Flight Controls, Aircraft Lights, On Board Maintenance Systems
-- Source: EASA Part-66 Module 13 official textbook (IKAROS Aviation Training Centre, IK01, Issue Oct.2012)
-- Licence scope: this module is B2-ONLY.

DO $$
DECLARE
    m13_id INT;
    s7_id  INT;
    s9_id  INT;
    s10_id INT;
BEGIN
    SELECT id INTO m13_id FROM easa_modules WHERE code = 'M13';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M13.7') THEN
        RAISE NOTICE 'M13.7/M13.9/M13.10 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 13.7: Flight Controls (ATA 27)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m13_id, 'M13.7', 'Flight Controls',
        $cnt$
# Flight Controls (ATA 27)

## Primary Control System Operating Methods

Different aircraft manufacturers use a variety of names for the units of the primary flight control system. The type and complexity of the control mechanisms used depend on the size, speed, and mission of the aircraft.

- A **small or low-speed aircraft** may have cockpit controls connected directly to the control surfaces by **cables or pushrods** (some aircraft use both).
- On **large or high-performance aircraft**, the control surfaces have high aerodynamic pressure exerted on them by the airflow, making them difficult for the pilot to move manually. **Hydraulic actuators** are therefore used within the linkage to assist the pilot.

Because powered systems reduce pilot fatigue and improve system performance, they are now commonly used, together with automatic pilot, automatic landing systems, and stability augmentation systems.

## Direct Cable Control Systems

In the direct cable control system, the cockpit controls are connected to the control surfaces with **high-strength steel cable**. Operating the control column places tension on the cable, which is supported and re-directed through the fuselage by **pulleys**. Cable tension is critical. This kind of control is only usable in **low-speed general aviation aeroplanes**. The force the pilot feels on the control column is in direct relation to airspeed — **the higher the airspeed, the greater the force on the control column**.

## Aerodynamically Controlled Control System

Control tabs are controlled by the control wheels in the flight deck, so that as one tab moves up, the opposite tab moves down. The ailerons are operated **aerodynamically**: when the control tabs are deflected, the aerodynamic forces on the tabs move the ailerons in the opposite direction.

## Hydraulically Assisted Control System

As aircraft increase in size and weight, their controls become more difficult to operate. The **power-boosted control system** is similar in principle to power steering in an automobile: a hydraulic actuator works in parallel with the mechanical control run, and normal pilot movement also moves a control valve that directs hydraulic fluid to the actuator.

### Hydraulically Actuated System with Direct Cable Backup

In this more advanced architecture, the direct connection between the control column and the control surface is normally **disconnected**, and pilot input is directed only to the actuator's control valve. In case of a **hydraulic power failure**, the hydraulic actuator is bypassed and pilot input is directed **directly** to the control surface — the force needed to move the surface is then much higher.

### Hydraulic Actuating System with Control Tab Backup

If a hydraulic failure makes control forces too great for the pilot to move the surfaces manually, the surfaces are controlled through **servo tabs**: in manual mode the flight control column moves the tab, and aerodynamic forces caused by the deflected tab move the main control surface.

## Hydraulic Power Operated Systems

Boosted flight control systems are typically found in aeroplanes **lighter than approximately 60 tons**; in heavier aeroplanes servo tabs would need to be too large and require too much force for manual operation. Another problem with power-boosted systems is that during **transonic flight**, shock waves forming on the control surfaces cause buffeting that is fed back into the control system. To prevent these forces reaching the pilot, many aeroplanes flying in this speed range use a **power-operated irreversible control system**, where flight deck controls actuate control valves that direct hydraulic fluid to control surface actuators.

## Follow-up Control

A follow-up system is used to close the control valve of a servo control unit once it has reached the desired position (a mechanical follow-up system is a typical example).

## Fly-By-Wire Systems

Modern aeroplane designs such as the **Airbus A320** and **Boeing 777** use fly-by-wire systems to connect the flight control surfaces to the cockpit controls with **electrical wire**, rather than steel cables, push-pull tubes, torque tubes or other mechanical methods.

- Cockpit controls convert pilot movements/pressures into **electrical signals** sent to a computer programmed with the aeroplane's flight characteristics.
- The computer output goes through wires to **electro-hydraulic valves** that convert the electrical signal into hydraulic fluid flow, which changes the position of a main control valve directing hydraulic fluid to the actuators.
- Within the actuators, **linear variable displacement transducers (LVDTs)** complete the loop, sending feedback signals to the computer on the amount of actuator movement.
- Rather than a moving control wheel or stick, some fly-by-wire aeroplanes use **side stick controllers**: pressures on the side-console-mounted controller are converted into electrical signals, just like movements of conventional controls. **Airbus** fly-by-wire aeroplanes use a side stick controller.

### Advantages of Fly-By-Wire Systems (Flight Laws)

In normal configuration (no system failures, aircraft airborne) the aircraft operates in **NORMAL LAW**. In this law, the computer:
- Supports the pilot in controlling elevators in a turn, lateral attitude hold, automatic pitch trim, turn coordination, dutch roll damping, and engine failure compensation.
- **Prevents unsafe manoeuvres** — even if the side stick is pulled fully back (which would normally cause a stall), maximum angle of attack and pitch attitude are limited by the computer.

Information from many other computers (air data, inertial reference, slat/flap position, flight-or-ground status, etc.) is sent to the flight control computers to calculate and prevent dangerous situations such as extreme attitudes, overspeed, excessive load factors, and stall.

### Redundancy / Fail Safe

Hydraulically operated primary flight control systems are often designed with **redundancy**: two or three actuators (servo control units) perform the same function, each fed from an independent hydraulic system. Modern systems are controlled through flight control computers, and more than one computer can perform the same function for safety — usually **one computer is active** and performs the real control action, while the **others are in hot standby** monitoring the active computer. If the active system fails, an automatic changeover isolates the faulty computer.

Another fail-safe approach is **split controls**: each control surface has its own Power Flight Control Unit (PFCU) supplied by a separate hydraulic system, so loss of one PFCU or hydraulic system still allows partial control.

## Artificial Feel System

Since the pilot has no direct feel of flight loads in a hydraulically actuated system, **artificial feel** must be built in to make control stick force proportional to the flight loads on the control surfaces.

- A **spring force** is usually adequate.
- For elevators and rudders, it is common to have both a static spring force **and** a variable hydraulic force, or a spring force more or less compressed by an electric actuator.
- Artificial feel is essentially varied **as a function of airspeed**.

## Operation of a Fly-By-Wire Actuator (Airbus Aileron Actuator Example)

- **Servo control pressurized:** pressurization opens the inlet (HP) blocking valve and the return (LP) blocking valve, supplying the servo valve with system HP and connecting the servo control return line to system LP.
- **Active mode:** the solenoid valve is energized, putting the mode selector valve in active mode; both actuator chambers connect to the servo valve's user ports. A mode-selector-valve position transducer signals this state, and a feedback transducer provides servo loop feedback.
- **Damping mode:** the solenoid valve is de-energized; the mode selector valve moves under spring action, interconnecting the two actuator chambers through a damping restriction and anti-cavitation valves. The feedback transducer gives piston rod position for cockpit display of aileron position.
- **After a hydraulic failure:** the inlet and return blocking valves close, isolating the servo control from the aircraft hydraulic system. An accumulator (permanently connected to the servo valve return line) is kept filled by a return relief valve, which also protects against a rupture in the aircraft return system. The mode selector valve moves to damping mode under spring action.
- **After an electrical failure:** the solenoid valve de-energizes and the mode selector valve moves to damping mode under spring action.

### Maintenance and Rigging

Maintenance is **"on condition."** The rod end roller bearing must be re-lubricated. Line Replaceable Units (LRUs) include: filter, servo valve, solenoid valve, mode selector valve transducer, and differential pressure transducer. After replacing the servo control, the feedback transducer must be adjusted to achieve equal voltage in the secondary windings (**electrical zero**) with the aileron in the neutral position.

### Safety Tests

The servo control design permits: a mode change test (mode selector valve transducer); a damping coefficient check (differential pressure transducer, measuring pressure differential between chambers); and a test of the accumulator, blocking valves and return relief valve, using the accumulator sight indicator and a manually operated **test finger** with three positions:

| Position | Name | Function |
|----------|------|----------|
| 0 | ZERO | Check sealing of inlet blocking valve, return blocking valve, return relief valve |
| 1 | LEAK CHECK | Check sealing of inlet blocking valve, return relief valve |
| 2 | DISCHARGE | Check stroke of accumulator piston |

## Trim Control Systems

### Roll and Yaw Trimming — Cable Controlled Flight Controls

**Trim tabs** are normally used for roll and yaw trimming on cable-controlled aeroplanes, found on the rudder and ailerons. They are cockpit-controllable and allow the pilot to deflect the control surface a small amount, so the aeroplane can fly straight and level hands/feet off. Once adjusted, a trim tab maintains a fixed relationship with the control surface as it moves.

Boosted or hydraulically operated aileron and rudder systems are usually trimmed by moving the **artificial feel and centering unit** out of its center position, using a manually or electrically motor-operated **jack-screw**. **Fly-by-wire operated systems do not need special provision for trimming the ailerons** — if an imbalance occurs, the roll control computers send a re-positioning signal to the aileron servo control units to restore level flight.

### Pitch Trimming

Larger transport aeroplanes are trimmed longitudinally by adjusting the position of the leading edge of the **horizontal stabilizer**. The stabilizer pivots about the rear spar; a jack-screw controlled from the cockpit raises or lowers the leading edge:
- **Raising** the leading edge gives **nose-down** trim.
- **Lowering** the leading edge gives **nose-up** trim.

For redundancy, different hydraulic systems supply the Trimmable Horizontal Stabilizer (THS) actuator; some systems provide electrical actuators for backup. The THS can be moved **manually** (cockpit control wheels, switches, or suitcase handles) or **automatically** (signals from the autopilot or Flight Management System). During manual THS movement an **audible signal** sounds in the cockpit so pilots can perceive motion — this signal is also used to warn of dangerous **THS runaway**.

In auto flight mode, autopilot command signals are sent to the flight control computers, which calculate auto trim signals for the THS actuator. On large aircraft, some horizontal stabilizers are designed as **fuel tanks**, allowing a calculated amount of fuel to be transferred to keep the centre of gravity in a safe, economic range and avoid extensive THS pitch angles.

## High Lift Devices

### Trailing Edge Flaps

Flaps that only increase camber have a **fixed hinge point** and are generally moved by hydraulic actuators; the trailing edge moves down immediately on a "flaps extend" selection.

Flaps that increase both **surface area and camber** have rollers running in specially formed tracks. On "flaps extend," the flap first moves **backwards** via rollers and tracks (increasing wing area), followed by the trailing edge moving **down** (increasing camber). This combined movement uses driving axles and screw spindles or rotary actuators, driven by a hydraulic or electric motor depending on aircraft type/size. A **screw-type system** is often used to prevent flap loads feeding back into the control system. The flaps are operated via the flap handle, which can be set to different positions for different flight phases.

### Leading Edge Flaps

Leading edge flaps, also called **Krueger flaps**, are installed below the forward wing edge. They have only two positions — **extended or retracted** — commanded from the flap handle or via the flap computer, and are driven hydraulically, pneumatically, or electrically.

### Slats

Slats, together with flaps, are used for lift augmentation. They are installed on tracks attached to the leading edge of each wing, and are usually operated mechanically by cables, hydro-mechanically, or pneumatically, with a hydraulic or pneumatic **Power Control Unit (PCU)** driving the mechanical transmission system. Extension of slats and flaps must generally happen together, so there is usually **only one control handle** in the cockpit for both. A cockpit indication system shows slat position, similar to the flap system.

### Position Indication

Different methods indicate flap/slat position to the flight crew, with signal transmission either **mechanically** (steel cables) or **electrically** (position pickup unit and electrical indicator). The principle of slat and flap position transmission is usually similar. Modern aircraft use electronic displays rather than analogue indicators.

## Lift Dump, Speed Brakes

Wings of transport aeroplanes are equipped with **spoiler surfaces** (also called lift dumpers), grouped by function:
- **Flight spoilers** — roll spoilers (lateral control augmentation) and speed brakes (in flight).
- **Ground spoilers** — used during landing roll-out or take-off abort.

### Roll Spoiler System Operation

Part of the spoiler surfaces on each wing assists the ailerons for lateral control: the down-moving wing's spoilers extend as the control wheel/stick actuates the ailerons. The aileron and spoiler systems are connected mechanically or electrically depending on the aeroplane.

### Speed Brake System Operation

Manually moving the pedestal-mounted lever aft extends the flight spoilers on both wings to act as speed brakes, symmetrically, to a maximum of approximately **35°** depending on the aeroplane. Using aileron control during speed brake operation results in **asymmetrical** spoiler extension to assist lateral control.

### Ground Spoiler System Operation

The system may be armed for automatic operation from the speed brake lever. When armed, all spoilers (flight and ground) fully extend after a combination of signals confirms ground configuration (landing roll or take-off abort), typically from:
- Ground/flight signal
- Wheel spinning signal
- Throttle lever angle signal
- Aeroplane speed signal

## Rudder Travel Limiter

Large aeroplanes have a **rudder travel limiter** to protect the empennage from overload if excessive rudder is inadvertently applied at high speed.
- In **older aeroplanes**, the limiter operates using **ram air pressure** from its own pitot tube, usually in the leading edge of the vertical stabilizer — the higher the airspeed, the more ram pressure, and the more the rudder movement is restricted.
- **Modern aeroplanes** instead use a **computer-controlled** rudder travel limiter, receiving airspeed electrical signals from the air data system for the travel-limiting computation.
        $cnt$,
        9
    ) RETURNING id INTO s7_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 13.9: Aircraft Lights (ATA 33)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m13_id, 'M13.9', 'Aircraft Lights',
        $cnt2$
# Aircraft Lights (ATA 33)

## Introduction

Lighting systems illuminate everything from cargo compartments to the pilot instrument panel. **Exterior lights** are required for safe operations during night flights. **Emergency lights** are important for escaping the aeroplane in a dangerous situation. The aircraft technician must be familiar with aircraft lighting circuits in order to service these systems properly.

## Maintenance and Inspection of Lighting Systems

Most lighting circuits are relatively low-maintenance items. Periodic inspections should check the wiring for chafing and hardware security, corrosion of components, and general circuit condition.

- **Lamp replacement** is generally the most needed repair. Several variations of a given lamp may fit the same socket — always be careful to install a bulb with the **correct voltage and power requirements**.
- Before discarding expensive sealed light beams, **verify functionality with an ohmmeter** — corroded contacts may be the actual cause of failure.
- When dealing with any **high-intensity flashing lamp or strobe system**, be careful to avoid electrical shock. The system operates at high voltage and needs time to discharge if the lamp is defective — always allow a strobe system to remain **OFF for approximately five minutes** prior to maintenance.
- **Halogen and strobe light bulbs** are sensitive to oil or grease from touching the glass. Body grease left on the glass can concentrate heat during operation and crack the glass, so always avoid touching a strobe bulb without proper protection.

## Exterior Lights

Exterior lighting systems include **position, landing, taxi, anti-collision, and wing inspection lights**, fulfilling several functions:
- Illuminating the runway and taxiway.
- Illuminating the wing leading edges and engine air intakes.
- Indicating aircraft position and direction.
- Reducing collision risk in flight and on the ground.

### Overview of Exterior Lights

- **White flashing strobe lights** are installed in each wingtip leading edge and one in the tail cone (facing rearward). A timing system synchronizes anti-collision strobe lights with anti-collision beacon lights so they flash alternately.
- **Red flashing anti-collision beacon lights** — one on the lower and one on the upper fuselage, at the aircraft centre line.
- **Runway turn-off lights** — illuminate the lateral areas of the runway, installed on the nose landing gear.
- **Landing light** — a fixed light installed on each wing.
- **Take-off and taxi lights** — fixed position on the nose landing gear; all go off automatically when the landing gear is retracted.
- **Wing and engine scan lights** — installed on each side of the fuselage so the flight crew can visually detect ice on engine air intakes and leading edges.
- **Navigation lights** — give external visual indication of aircraft position and direction of flight.
- **Logo lights** — installed on the horizontal stabilizer to illuminate the company logo.

## Position Lights

Position lights indicate an aircraft's position during night operations; because pilots can identify another aircraft's position and safely navigate around it from these lights, they are often called **navigation lights**. One or more position lights must be located on each wingtip and the tail:
- **Right wingtip:** green light
- **Left wingtip:** red light
- **Tail:** white light

These lights are required on any aircraft certified for night flight. Commercial aircraft use a **dual system**, so the crew can select a second system if a bulb fails, and replacement can be scheduled at a convenient time.

## Anti-Collision Light

Anti-collision lights come in two basic styles:
- **Older aircraft** — rotating beacons on top of the vertical stabilizer or on top/bottom of the fuselage, typically a stationary light bulb with a rotating reflector covered by a **red glass lens**.
- **Newer systems** — solid-state electronics creating a flashing- or strobe-type light.

### Strobe Light

The strobe light produces an extremely bright flash from a **Xenon tube**, requiring approximately **400 Volts**, generated by a strobe power supply using a **capacitor charging system**. Modern aircraft are required to have **3 white strobe lights** — one on each wing and one at the tail. Coordinated flashing of strobe and anti-collision lights is controlled by a synchronization connection between the power supply units. The voltage to the xenon flash tube assembly is **dangerous**.

## Interior Lights

Interior lights (instrument lights, overhead lights, step lights, reading lights, etc.) fall into two basic categories: **incandescent** and **fluorescent**.

### Incandescent Lights

Use a small coil of wire (a **filament**) that glows white when current flows through it. They can be dimmed using a solid-state circuit; a **potentiometer** controls the input signal to a transistor, which controls the current to the lamp.

### Electro Luminescent (EL) Light

A recently introduced interior lighting technology used on instrument panels, signs, and emergency exit/escape path markings. The EL panel contains a **fluorescent paste sandwiched between two layers of plastic**, which glows when an **AC voltage** is applied. Light glows through unpainted areas of the plastic, typically forming letters/numbers. EL panels operate only on alternating current; most light aircraft with EL systems use a **static inverter** designed specifically for the panel.

### Fluorescent Lights

A gas-filled glass tube glows when high AC voltage is applied to heated electrodes at each end. The electrodes emit electrons, which strike mercury vapour atoms, producing **ultraviolet light**; the invisible UV light strikes the tube's **phosphorous coating**, causing it to glow white — this conversion of one kind of light to another is called **fluorescence**.

Fluorescent lamps are much more efficient than incandescent lamps but require **ballast-transformers and AC voltage**, so they are found only on **large commercial aircraft**. They can operate bright or dimmed by varying the voltage applied to the ballast-transformer. Modern electronic ballasts are weight-saving, start the tube faster, and no longer flicker during start and operation.

## Cockpit Lighting

The cockpit lighting system lets the crew see all equipment details, inscriptions, and indications regardless of darkness — especially important at night. It comprises:
- Dome lights and lighting strips
- Map holder lighting (Captain and First Officer stations)
- Console and floor lighting (briefcase stowage, side console, floor)
- Centre instrument panel lighting and standby compass integral lighting
- Reading lights and centre pedestal lighting (flood light on overhead panel)
- Outlet plugs and coat stowage lighting

**Dome lights** provide shadowless general cockpit lighting. Instruments other than cathode ray tubes are **integrally lit**, with dimming control, achieved by:
- Miniature lights
- Light Emitting Diodes (LEDs)
- Electro Luminescence (EL)

The integrity of all **annunciator lights** can be tested, and their intensity can be dimmed.

## Emergency Lighting

Passenger aeroplanes have emergency lights to illuminate the cockpit and cabin, powered from **separate batteries**. All exits are marked with special signs guiding passengers to the doors even in dense smoke; exterior lights at over-wing and other emergency doors illuminate the outside area.

- **Cabin:** emergency lights illuminate the cabin if the general lighting system fails; installed in the main and cross-aisle ceiling panels.
- **Exits:** the emergency lighting system illuminates exit location signs and exit marking signs at each cabin door.

### Floor Proximity Escape Path Marking

An additional system showing passengers where emergency exits are if smoke obscures the emergency lights. **Electroluminescence strips** with blocks and arrows pointing toward emergency exits are installed on the floor, and **EL EXIT sign panels** are on the wall just above the floor near each emergency exit. Battery power supply units (also used for the emergency lights) supply this system, and **static inverters supply 115 V, 400 Hz**, installed below the floor panels. The colour of the floor proximity/EXIT signs can be changed using different filters to match carpet or side panel colour.

### Benefits of Electro Luminescence (EL)

EL strip lighting eliminates the need for bulbs, sockets, diffusers, and reflectors. Without filaments to break, it can withstand extreme shock, vibration, and temperature extremes without failure, continuing to operate under very high G forces and after considerable structural damage. As an area light source, EL is more easily seen through smoke than incandescent or other point light sources, even at considerably higher brightness.
        $cnt2$,
        11
    ) RETURNING id INTO s9_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 13.10: On Board Maintenance Systems (ATA 45)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m13_id, 'M13.10', 'On Board Maintenance Systems',
        $cnt3$
# On Board Maintenance Systems (ATA 45)

## Central Maintenance System

### Introduction — Acquisition

Aircraft system data is acquired by **4 major electronic systems**:
- **ECAM** (Electronic Centralized Aircraft Monitoring) — monitors operational data to display warnings and system information.
- **FDRS** (Flight Data Recording System) — mandatory; records aircraft operational parameters for incident investigation.
- **CMS** (Central Maintenance System) — monitors BITE data to record system failures.
- **ACMS** (Aircraft Condition Monitoring System) — records significant operational parameters to monitor engines, aircraft performance, and analyse specific problems.

### Consolidation

In normal operation, the ECAM permanently displays normal aircraft parameters while the ACMS and FDRS permanently record aircraft system parameters. When an anomaly is detected, the ECAM displays the abnormal parameter/function and its associated warning, and the **CMS records the failure information** detected by the system BITE.

### Retrieval

Information can be retrieved through:
- The cockpit Multipurpose Control Display Unit (MCDU)
- The ECAM displays
- The cockpit printer
- The down-loading system
- A ground station via ACARS
- The recorders

### Analysis

Maintenance operations divide into three groups:
- **Minor troubleshooting** — via ECAM and CMS, through the MCDUs and printed or ACARS down-linked reports.
- **In-depth troubleshooting** — via CMS and ACMS, through the MCDUs and printed reports.
- **Long-term maintenance** — via ACMS and FDRS, through printed, ACARS down-linked and down-loaded reports, or recorded tapes.

## BITE Philosophy

### General

A system is composed of **LRUs** (Line Replaceable Units) — computers, sensors, actuators, probes, etc. — mostly controlled by digital computers. For safety, LRUs are permanently monitored, tested, and troubleshot; the dedicated part of a computer performing this function is called **Built-In Test Equipment (BITE)**. In some multi-computer systems, one computer concentrates the BITE data of the system.

### BITE Functions

During normal operation the system is permanently monitored: **internal monitoring**, **inputs/outputs monitoring**, and **link monitoring** between LRUs.

- **Fault Detection** — a failure can be **permanent (consolidated)** or **intermittent**.
- **Isolation** — after detection, BITE identifies the possible failed LRUs and can give a snapshot of the system environment when the failure occurred.
- **Memorization** — all information needed for maintenance/troubleshooting is stored in **Non-Volatile Memory**.

### Concept

BITE information stored in system BITE memories is sent to a **centralized maintenance device**, through which manual tests (SYSTEM TEST and SPECIFIC TESTS) can be initiated. Main advantages:
- Single interface location (cockpit)
- Easy fault identification
- Reduced troubleshooting duration
- Simplified technical documentation
- Standardization of equipment

### Test — Four Groups

| Test | When performed | Purpose |
|------|-----------------|---------|
| **Power Up Test** | On ground, after long power cuts (more than 200 ms); limited scope if airborne | Safety test ensuring compliance with safety objectives; typical tasks: microprocessor test, memory test, ARINC 429 and I/O circuit test, configuration test |
| **Cyclic Tests** (In Operation Test) | Continuously, without disturbing operation | Watchdog test (restarts the microprocessor if software fails), RAM test, permanent monitoring by the operational program (e.g. ARINC 429 message validity) |
| **System Test** | After LRU replacement | More complete than the power-up test; performed with all peripherals supplied, to check integrity of the system/sub-system |
| **Specific Tests** | On demand, for select systems | Generates stimuli to command devices (actuators, valves); can have major effects on the aircraft, e.g. automatic movement of slats/flaps, engine dry cranking |

## Architecture

The **Central Maintenance System**, also called the **Centralized Fault Display System**, is composed of one or two **Maintenance Computers** and the aircraft system BITEs. The CMC/CFDIU interfaces are:
- MCDUs
- A printer
- ACARS (Aircraft Communication Addressing and Reporting System)
- A data loader — the Multifunction Disk Drive Unit (MDDU)

The Central Maintenance Computer (CMC), or Centralized Fault Display Interface Unit (CFDIU), continuously scans the buses from the aircraft systems. If a failure message from a system BITE appears on a bus, the CMC/CFDIU copies and stores it; it also stores ECAM messages generated by the Flight Warning Computers.

- **MCDU** — the operator's interface with the Central Maintenance System; **any two of the three MCDUs** may be operated simultaneously.
- **Printer** — most CMS reports may be printed; provides the **Post Flight Report (PFR)**, the main maintenance tool.
- **ACARS** — data may also be transmitted to the ground.
- **MDDU** — data may also be loaded into the CMCs through the Multifunction Disk Drive Unit.

## Condition Monitoring

### General

The main functions of the **ACMS** (Aircraft Condition Monitoring System) are engine condition, APU condition, and aircraft performance monitoring, plus troubleshooting assistance. It collects, records, and processes aircraft system data retrievable through the MCDU, on a memory support, or printed.

### Architecture

The ACMS consists of:
- The **Data Management Unit (DMU)**, including a **Smart ACMS Recorder (SAR)**; the DMU may include a PCMCIA interface.
- The **Flight Data Interface Unit (FDIU)**.
- An on-ground **Ground Support Equipment (GSE)**.
- An optional **Digital ACMS Recorder (DAR)**.

- **DMU** — collects, stores and processes aircraft system data (internal memory, PCMCIA card, or DAR) and generates condition reports.
- **FDIU** — part of the Flight Data Recording System; sends the same parameters as the Digital Flight Data Recorder (DFDR) to the DMU, recorded on the PCMCIA card.
- **SAR** — a DMU function recording compressed data, programmable through the GSE.
- **DAR** — stores data on an optical disk for on-ground performance, maintenance, or condition monitoring; preprogrammed via GSE; can also store on the PCMCIA card.
- **MCDU** — connected to the DMU for online display of selected parameters, listing stored reports/SAR files, and manual request of reports and recording (more limited programming than the GSE).
- **Printer** — prints DMU-generated reports and most ACMS MCDU displays; controlled automatically by the DMU, manually from the MCDU, or via the ACMS PRINT pushbutton.
- **ACARS** — sends reports and broadcasts ACMS-generated parameters to a ground station via **VHF Voice Data Radio, Satellite Communication, or Gate-Link** (wireless LAN when on ground). Report download can be automatic (DMU) or manual (MCDU).

### Ground Support Equipment (GSE)

Based on a compatible PC able to read **3.5-inch floppy disks and PCMCIA disks**, providing:
- **Reconfiguration function** — configures the customer database (trigger conditions, recording space layout).
- **Readout function** — display, print-out and analysis of recorded data.
- **Data loader** — uploads data (operational software, customer databases) and downloads data (reports, SAR data) to a 3.5-inch floppy disk for GSE analysis.
- **PCMCIA interface** — accepts high-capacity removable PCMCIA disks storing ACMS reports, SAR, DFDR and DAR data (disk space ratio programmable by GSE); can also act as a portable data loader.

## Structure Monitoring

Structure monitoring instruments a structure with a sensor system that monitors how the surroundings load it. Advanced software receives and interprets the data, reporting the structure's condition to the operator in real time, so overloading can be avoided and damage discovered quickly. This enables condition-based maintenance, black-box recorder functionality, and incident investigation. The technology also suits condition monitoring of oil platforms, wind turbines and bridges. **In civil aviation, such systems are used only during development and certification of an aircraft.**

### Damage Tolerance Monitoring

A good example is permanent monitoring of an aircraft's **vertical acceleration during landing** — a hard landing can seriously damage the structure and must be avoided. If it occurs, the computer registers the excessive touchdown acceleration, which is reported (e.g. to the pilot or maintenance personnel) so the necessary action can be taken.

## Data Loading

### General

The data loading system interfaces between aircraft computers and ground data processing equipment, used to update software/databases or retrieve aircraft system data. The **MDDU** operates in two modes:
- **Manual mode** — download only.
- **Automatic mode** — up- and down-load.

The data loading system includes two rotary selectors for system selection and an MDDU. If the MDDU is not installed, up/down-loading can be performed through a connector using a **portable data loader**.

- **Up Loading** — used to update a system's database (e.g. the FMGEC — Flight Management Guidance and Envelope Computer) or modify parts of its operational software (e.g. the ACARS Management Unit).
- **Down Loading** — used to download, to a 3.5-inch disk, data recorded by certain computers during operation (e.g. the ACMS).

### Components

The MDDU contains: an electronic unit (power supply, I/O, and CPU/Floppy Disk Drive control boards), a disk drive on **shock mounts**, a **16-character alphanumerical LCD display**, and a door protecting the disk drive. The data support is a **3.5-inch double-face, high-density disk (1.44 megabytes)** in MS-DOS format, readable/writable on the ground by IBM-PC Ground Support Equipment (GSE).

### Abnormal Operation Messages

| Message | Meaning |
|---------|---------|
| **TRANSFER FAILURE** | The MDDU has to stop data transfer (up or down loading) for any reason |
| **UNIT FAIL** | A hardware failure was detected during self-test; the MDDU stops all operations |
| **DISK ERROR** | The MDDU cannot read or write the data disk (incorrect formatting, write-protected, disk damaged, etc.); operations are interrupted |

## Electronic Library

### General

The **Electronic Library System (ELS)** is an information management system giving airline flight, maintenance, and cabin crews timely, instantaneous access to information contained in tens of thousands of pages of operational manuals, procedures, and navigation charts — provided, wherever possible, in a **task-oriented manner**. The long-term objective is to eliminate the airline's need to carry and update paper documentation on board.

Maintenance crews benefit because the **Onboard Maintenance System (OMS)** is combined with the ELS in an integrated maintenance and fault-reporting environment. The industry goal is a **common source database** for all facets of airline operations (dispatch, flight operations, maintenance, inventory/parts control, etc.), with updates and ground/airborne communication via the **Gate-link** concept and other channels — eventually allowing the aircraft to "log in" as a node on the airline's computer network while parked at the gate.

### Evaluation System Example

An evaluation system consisted of a monochromatic active-matrix liquid crystal display (LCD), an avionics-quality optical disk drive, a prototype **ARINC 744A printer**, and a workstation platform. User input used a **capacitive touch screen overlay** (no physical keyboard — a "soft" keyboard was displayed for text entry). Software included simple page-turning as well as text and graphical hyperlinking, with a carefully designed graphical user interface (GUI).

A subset of manuals and navigation charts normally carried in flight crew kit bags was stored digitally on the optical disk (compressed bitmap, text, and vector graphic formats), including sections of the Flight Crew Operating Manual, Aircraft Flight Manual, Airport Analysis Manual, Aircraft Maintenance Manual, Aircraft Schematic Manual, Illustrated Parts Catalogue, and Minimum Equipment List (MEL). The electronic system would eliminate up to **90 kilograms** of paper documentation carried by international flight crews, while significantly reducing the cost of producing, updating, distributing and maintaining paper information.

## Airborne Printer

### General

The printer comprises: a front panel with pushbuttons and indicators; an electronic part (Central Processing Unit, printer controller, and power supply boards); and a mechanical block. It prints Central Maintenance System reports plus additional printouts from:
- The Aircraft Condition Monitoring System (ADAS, AIDS, or ACMS)
- ACARS
- The Flight Management, Guidance and Envelope System (FMGES)
- The Engine Interface/Vibration Monitoring Unit (EIVMU/EVMU)

### Paper

The printer is a **non-impact thermal printer** that only works on special **heat-sensitive paper**, inserted via an access door in the front panel, using paper rolls of **108 or 216 mm**.

### Controls

- **TEST** switch — performs a functional test.
- **SLEW** switch — advances (exits) paper.
- **PAPER ALARM** pushbutton — includes an amber caution light.
- **OFF** pushbutton — includes a status indicator light.

A different, commonly used cockpit printer model has:
- **PRINTER INHIBIT** button/light — turns the printer on/off.
- **DOOR LOCK** — opens the printer for paper replacement.
- **SELF TEST** button — starts a self-test and prints a test pattern.
- **FAULT LED** — illuminates on internal failure or overheating.
- **PAPER ADVANCE/SLEW** button — advances paper without printing.

### Paper Loading

A **red line** marked on the paper indicates the supply roll must be replaced. Open the printer, insert a new roll, verify the heat-sensitive side faces the print head, close the printer, and initiate a test print.

### Dot Matrix Printing Technology

This printer uses a **64 ASCII character set**, printed in a **10x16 dot matrix**, at a speed of **160 lines per minute**. It receives data as serial ASCII or ARINC code from one or more aircraft systems. Status lines using ARINC 429 signals feed the printer status back to the sender — a **handshake**.
        $cnt3$,
        12
    ) RETURNING id INTO s10_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M13.7 Flight Controls (12 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s7_id, 'In a direct cable control system, using high-strength steel cable to connect cockpit controls to control surfaces, the force the pilot feels on the control column is:',
     '[{"id":"a","text":"Constant regardless of airspeed","correct":false},{"id":"b","text":"In direct relation to airspeed — the higher the airspeed, the greater the force","correct":true},{"id":"c","text":"Inversely related to airspeed — the higher the airspeed, the lower the force","correct":false}]',
     '{"B2"}'),

    (s7_id, 'In an aerodynamically controlled control system, when the control tabs are deflected by the control wheels:',
     '[{"id":"a","text":"Aerodynamic forces on the tabs move the ailerons in the opposite direction","correct":true},{"id":"b","text":"A hydraulic actuator directly moves the ailerons, bypassing the tabs entirely","correct":false},{"id":"c","text":"The tabs have no aerodynamic effect and are purely cosmetic","correct":false}]',
     '{"B2"}'),

    (s7_id, 'In a hydraulically actuated system with direct cable backup, what happens after a hydraulic power failure?',
     '[{"id":"a","text":"The aircraft becomes fully uncontrollable until the failure is fixed","correct":false},{"id":"b","text":"The hydraulic actuator is bypassed and control column input goes directly to the control surface, requiring much higher force","correct":true},{"id":"c","text":"The control surface automatically locks in its last commanded position","correct":false}]',
     '{"B2"}'),

    (s7_id, 'Boosted flight control systems using servo tabs are typically limited to aeroplanes:',
     '[{"id":"a","text":"Lighter than approximately 60 tons","correct":true},{"id":"b","text":"Heavier than approximately 60 tons","correct":false},{"id":"c","text":"Of any weight, with no practical limit","correct":false}]',
     '{"B2"}'),

    (s7_id, 'In a fly-by-wire system, what completes the servo loop within the actuator and sends feedback signals to the flight control computer?',
     '[{"id":"a","text":"Linear variable displacement transducers (LVDTs)","correct":true},{"id":"b","text":"The artificial feel spring","correct":false},{"id":"c","text":"The mechanical follow-up cable","correct":false}]',
     '{"B2"}'),

    (s7_id, 'In NORMAL LAW on a fly-by-wire aircraft, if the side stick is pulled fully backward, which would normally lead to a stall:',
     '[{"id":"a","text":"The aircraft will stall exactly as with a conventional control system","correct":false},{"id":"b","text":"Maximum angle of attack and pitch attitude are limited by the computer to prevent the unsafe manoeuvre","correct":true},{"id":"c","text":"The flight control computer disconnects and reverts to direct cable control","correct":false}]',
     '{"B2"}'),

    (s7_id, 'In a redundant hydraulically operated primary flight control system with multiple flight control computers, the normal arrangement is:',
     '[{"id":"a","text":"All computers are active simultaneously and vote on the control output","correct":false},{"id":"b","text":"One computer is active while the others are in hot standby, monitoring the active computer","correct":true},{"id":"c","text":"Only one computer exists per aircraft, with no redundancy","correct":false}]',
     '{"B2"}'),

    (s7_id, 'The purpose of an artificial feel system in a hydraulically actuated flight control system is to:',
     '[{"id":"a","text":"Reduce the mechanical complexity of the control run","correct":false},{"id":"b","text":"Make control stick force proportional to the flight loads on the control surfaces, since the pilot has no direct feel of them","correct":true},{"id":"c","text":"Increase control surface deflection rate at low airspeed","correct":false}]',
     '{"B2"}'),

    (s7_id, 'On the Airbus aileron actuator example, what happens to the mode selector valve when the solenoid valve is de-energized?',
     '[{"id":"a","text":"It moves under spring action, putting the servo control into damping mode","correct":true},{"id":"b","text":"It locks the actuator rigidly in its last position","correct":false},{"id":"c","text":"It has no effect, since the solenoid only controls the feedback transducer","correct":false}]',
     '{"B2"}'),

    (s7_id, 'On a fly-by-wire operated aileron system, how is trimming normally handled?',
     '[{"id":"a","text":"A manually operated trim tab on each aileron is adjusted before flight","correct":false},{"id":"b","text":"No special provision is needed — the roll control computers send a re-positioning signal to the aileron servo control units","correct":true},{"id":"c","text":"The pilot must continuously hold sidestick pressure to compensate for any imbalance","correct":false}]',
     '{"B2"}'),

    (s7_id, 'For pitch trimming using a trimmable horizontal stabilizer (THS), raising the leading edge of the stabilizer gives the aeroplane:',
     '[{"id":"a","text":"Nose-up trim","correct":false},{"id":"b","text":"Nose-down trim","correct":true},{"id":"c","text":"No pitch trim change, only roll trim","correct":false}]',
     '{"B2"}'),

    (s7_id, 'During automatic ground spoiler extension, which of the following is NOT listed as one of the signals used to determine ground configuration?',
     '[{"id":"a","text":"Wheel spinning signal","correct":false},{"id":"b","text":"Ground/flight signal","correct":false},{"id":"c","text":"Cabin altitude signal","correct":true}]',
     '{"B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M13.9 Aircraft Lights (10 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s9_id, 'Before discarding an expensive sealed light beam that appears not to work, the recommended check is to:',
     '[{"id":"a","text":"Verify its functionality with an ohmmeter, since corroded contacts may be the actual cause","correct":true},{"id":"b","text":"Immediately replace it without further checks, as sealed beams cannot be tested","correct":false},{"id":"c","text":"Apply full line voltage directly across the terminals to confirm failure","correct":false}]',
     '{"B2"}'),

    (s9_id, 'Before carrying out maintenance on a strobe light system, the recommended practice is to:',
     '[{"id":"a","text":"Leave the system ON to bleed off residual charge","correct":false},{"id":"b","text":"Allow the strobe system to remain in the OFF position for approximately five minutes before maintenance","correct":true},{"id":"c","text":"Disconnect the battery only, with no waiting period required","correct":false}]',
     '{"B2"}'),

    (s9_id, 'The correct colours for aircraft position (navigation) lights are:',
     '[{"id":"a","text":"Green on the right wingtip, red on the left wingtip, white on the tail","correct":true},{"id":"b","text":"Red on the right wingtip, green on the left wingtip, white on the tail","correct":false},{"id":"c","text":"White on both wingtips, red on the tail","correct":false}]',
     '{"B2"}'),

    (s9_id, 'An older-style rotating beacon anti-collision light typically consists of:',
     '[{"id":"a","text":"A rotating light bulb and a stationary red glass lens","correct":false},{"id":"b","text":"A stationary light bulb and a rotating reflector covered by a red glass lens","correct":true},{"id":"c","text":"A xenon flash tube with no moving parts","correct":false}]',
     '{"B2"}'),

    (s9_id, 'A modern aircraft strobe light system uses a Xenon tube that requires approximately:',
     '[{"id":"a","text":"12 Volts","correct":false},{"id":"b","text":"400 Volts","correct":true},{"id":"c","text":"4,000 Volts","correct":false}]',
     '{"B2"}'),

    (s9_id, 'Modern aircraft are required to have how many white strobe lights, and where?',
     '[{"id":"a","text":"3 — one on each wing and one at the tail","correct":true},{"id":"b","text":"2 — one on the nose and one on the tail","correct":false},{"id":"c","text":"5 — one at each wingtip, nose, tail and belly","correct":false}]',
     '{"B2"}'),

    (s9_id, 'Fluorescent interior lighting requires ballast-transformers and AC voltage, and for this reason is generally found only on:',
     '[{"id":"a","text":"Small, low-speed general aviation aircraft","correct":false},{"id":"b","text":"Large commercial aircraft","correct":true},{"id":"c","text":"Unpressurized aircraft only","correct":false}]',
     '{"B2"}'),

    (s9_id, 'In an Electro Luminescent (EL) panel, light is produced by:',
     '[{"id":"a","text":"A fluorescent paste sandwiched between two layers of plastic, glowing when AC voltage is applied","correct":true},{"id":"b","text":"A tungsten filament heated by DC current","correct":false},{"id":"c","text":"Mercury vapour excited by a heated electrode at each end of a glass tube","correct":false}]',
     '{"B2"}'),

    (s9_id, 'The floor proximity escape path marking system, including its EL strips and EXIT sign panels, is supplied by static inverters providing:',
     '[{"id":"a","text":"28 V DC","correct":false},{"id":"b","text":"115 V, 400 Hz","correct":true},{"id":"c","text":"230 V, 50 Hz","correct":false}]',
     '{"B2"}'),

    (s9_id, 'Compared with incandescent or other point light sources, Electro Luminescence (EL) as an area light source is:',
     '[{"id":"a","text":"More easily seen through smoke, even at considerably higher brightness of the point source","correct":true},{"id":"b","text":"Less easily seen through smoke under all conditions","correct":false},{"id":"c","text":"Equally visible through smoke, with no practical difference","correct":false}]',
     '{"B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M13.10 On Board Maintenance Systems (12 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s10_id, 'Which of the four major electronic systems monitors BITE data in order to record system failures?',
     '[{"id":"a","text":"ECAM","correct":false},{"id":"b","text":"CMS (Central Maintenance System)","correct":true},{"id":"c","text":"FDRS","correct":false}]',
     '{"B2"}'),

    (s10_id, 'Maintenance operations supported by the on-board maintenance system are divided into three groups. Long-term maintenance is performed with the help of:',
     '[{"id":"a","text":"The ECAM and the CMS through the MCDUs","correct":false},{"id":"b","text":"The ACMS and the FDRS, through printed, ACARS down-linked, and down-loaded reports or recorded tapes","correct":true},{"id":"c","text":"Only the cockpit printer, with no other data source","correct":false}]',
     '{"B2"}'),

    (s10_id, 'In BITE philosophy, the function that stores all information necessary for maintenance and troubleshooting in Non-Volatile Memory is called:',
     '[{"id":"a","text":"Isolation","correct":false},{"id":"b","text":"Fault Detection","correct":false},{"id":"c","text":"Memorization","correct":true}]',
     '{"B2"}'),

    (s10_id, 'The Power Up Test of a BITE system is normally executed:',
     '[{"id":"a","text":"Only in flight, above 10,000 ft","correct":false},{"id":"b","text":"On the ground, after long power cuts of more than 200 ms","correct":true},{"id":"c","text":"Continuously, regardless of power interruptions","correct":false}]',
     '{"B2"}'),

    (s10_id, 'A BITE cyclic test (in-operation test), such as a watchdog test or RAM test, is characterised by the fact that it:',
     '[{"id":"a","text":"Is carried out permanently without disturbing system operation","correct":true},{"id":"b","text":"Can only be run on the ground, with all peripherals supplied","correct":false},{"id":"c","text":"Generates stimuli that move actuators such as slats or flaps","correct":false}]',
     '{"B2"}'),

    (s10_id, 'A BITE Specific Test, unlike a System Test, is characterised by the fact that it:',
     '[{"id":"a","text":"Only checks memory and microprocessor integrity","correct":false},{"id":"b","text":"Generates stimuli to command devices such as actuators or valves, which can have a major effect on the aircraft (e.g. moving slats/flaps or engine dry cranking)","correct":true},{"id":"c","text":"Is run continuously in flight without crew awareness","correct":false}]',
     '{"B2"}'),

    (s10_id, 'How many of the aircraft''s Multipurpose Control and Display Units (MCDUs) may normally be operated simultaneously?',
     '[{"id":"a","text":"Only one at a time","correct":false},{"id":"b","text":"Any two of the three MCDUs","correct":true},{"id":"c","text":"All available MCDUs with no limit","correct":false}]',
     '{"B2"}'),

    (s10_id, 'The main maintenance tool produced by the Central Maintenance System printer is the:',
     '[{"id":"a","text":"Post Flight Report (PFR)","correct":true},{"id":"b","text":"Minimum Equipment List (MEL)","correct":false},{"id":"c","text":"Illustrated Parts Catalogue","correct":false}]',
     '{"B2"}'),

    (s10_id, 'Within the ACMS architecture, which unit sends the same parameters as the Digital Flight Data Recorder (DFDR) to the Data Management Unit (DMU)?',
     '[{"id":"a","text":"The Flight Data Interface Unit (FDIU)","correct":true},{"id":"b","text":"The Ground Support Equipment (GSE)","correct":false},{"id":"c","text":"The Multifunction Disk Drive Unit (MDDU)","correct":false}]',
     '{"B2"}'),

    (s10_id, 'In civil aviation, structural sensor systems used for structure monitoring are typically used:',
     '[{"id":"a","text":"Throughout the entire operational life of every in-service aircraft","correct":false},{"id":"b","text":"Only during development and certification of an aircraft","correct":true},{"id":"c","text":"Only after a reported hard landing event","correct":false}]',
     '{"B2"}'),

    (s10_id, 'The data support disk used by the Multifunction Disk Drive Unit (MDDU) is a:',
     '[{"id":"a","text":"3.5-inch double-face, high-density disk (1.44 megabytes) in MS-DOS format","correct":true},{"id":"b","text":"5.25-inch single-face, low-density disk (360 kilobytes)","correct":false},{"id":"c","text":"USB flash drive formatted in FAT32","correct":false}]',
     '{"B2"}'),

    (s10_id, 'On the Multifunction Disk Drive Unit (MDDU), which abnormal operation message indicates that a hardware failure was detected during self-test, causing the unit to stop all operations?',
     '[{"id":"a","text":"DISK ERROR","correct":false},{"id":"b","text":"TRANSFER FAILURE","correct":false},{"id":"c","text":"UNIT FAIL","correct":true}]',
     '{"B2"}');

END $$;
