-- Module 15: Gas Turbine Engine (B1) — Powerplant Installation, Fire Protection Systems
-- Source: EASA Part-66 Module 15 official textbook (Aviation Maintenance Technician Certification Series, "Gas Turbine Engine")

DO $$
DECLARE
    m15_id INT;
    s19_id INT;
    s20_id INT;
BEGIN
    SELECT id INTO m15_id FROM easa_modules WHERE code = 'M15';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M15.19') THEN
        RAISE NOTICE 'M15.19-M15.20 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 15.19: Powerplant Installation
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m15_id, 'M15.19', 'Powerplant Installation',
        $cnt$
# Powerplant Installation

## Overview

The engine and its necessary accessories — including the gearbox, fuel control, intake cowling, exhaust, thrust reverser assembly, fire protection equipment, sensors, generators, ducting, wiring, cowling, mounts, control cables and rods, drains, and firewalls — are referred to collectively as the **powerplant**. Essentially, everything associated with the engine on the engine side of the firewall is part of the powerplant installation.

There are many powerplant installation configurations. The most notable is the wing-mounted powerplant installation, which dominates current air transport category aircraft design. Fuselage-mounted powerplant installations are also common, particularly on business class aircraft, which benefit from having thrust developed close to the longitudinal axis. No matter where the engines are mounted on the airframe, all turbine engine powerplant configurations share the same basic characteristics.

## Firewalls

A **firewall** is a partition between the engine powerplant installation and the aircraft. Its function is to isolate the powerplant from the airframe structure in case of fire and from the heat created during normal engine operation. Firewalls are typically sheet metal shields made from **stainless steel** or some other high heat resistance metal.

## Cowling

**Nacelles** are built around engines to protect the engine and accessories from the operating environment and to provide a streamlined, aerodynamic enclosure with low drag. The nacelle is also designed to route cooling air effectively around the engine and its components.

**Cowlings** are the fixed and movable panels that make up the nacelle enclosure. Because access to the powerplant for maintenance, repair, and inspection is frequent, nearly all engine cowls are constructed with access for these purposes in mind. Hinged cowling is very common — secured by a few to several strong latches, a hinged cowl can be opened and closed quickly and swung out of the way for clear access to a large section of the engine. Small access panels for a particular part of the powerplant requiring frequent inspection or servicing are also common.

## Acoustic Panels

Designers work to reduce the noise associated with turbine engine operation. One method of suppressing noise from the fan stage of a high by-pass ratio engine is to incorporate a **noise absorbent liner** around the inside wall of the by-pass duct. The lining is comprised of porous face sheeting that inhibits the motion of the sound waves; the depth of the cavity between the absorber and solid backing is tuned to suppress the appropriate part of the noise spectrum. A high by-pass ratio engine may also use a liner to suppress noise from the engine core.

The disadvantage of using liners for reducing noise is the addition of weight and the increase in specific fuel consumption caused by increasing the friction of the duct walls.

## Engine Mounts

The engine mounts on most turbofan engines support the engine and transmit the loads imposed by the engine to the aircraft structure. Most turbine engine mounts are made of **stainless steel**. Some engine mounting systems use two mounts to support the forward end of the engine and a single mount at the rear end.

### Vibration Isolation Engine Mounts

Vibration isolator engine mounts support the powerplant and isolate the airplane structure from adverse engine vibrations. Each powerplant is generally supported by **forward vibration isolator mounts** and an **aft vibration isolator mount**:

- **Forward mounts** carry vertical, side, and axial (thrust) loads and allow engine growth due to thermal expansion.
- **Aft mounts** take only vertical and side loads, but also accommodate thermal expansion of the engine without applying axial loads to the engine flanges.

The vibration isolators consist of a **resilient material** permanently enclosed in a metal case. As the engine vibrates, the resilient material deforms slightly, dampening the vibrations before they reach the airplane structure. If the resilient material completely fails or is lost, the isolators will continue to support the engine.

## Control Cables and Rods

Control cables and rods are used on many powerplant installations to activate accessories such as the fuel control unit. When changing an engine, these components normally remain with the aircraft. Manufacturer's instructions must be followed for proper inspection, connection, disconnection, and adjustment of all control cables and rods.

## Hoses and Pipes

Numerous hoses, tubing, pipes, and ducting are part of an engine installation, each connected and supported in a very specific manner according to manufacturer's instructions. Technicians should avoid connecting and supporting these critical powerplant elements by what "looks good." Climbing on engines to access these installations is highly discouraged — proper engine access stands and ladders should be used instead.

### Fuel Lines

When fuel system lines are replaced or repaired:

- All fittings must be compatible with their mating parts — different fittings often have different thread pitches or minor design differences that prevent proper mating and may cause the joint to leak or fail.
- Lines must not chafe against control cables, airframe structure, or electrical wiring/conduit. Where physical separation of fuel lines from electrical wiring is impracticable, the fuel line should be located **below** the wiring and clamped securely. Wiring must never be supported by the fuel line.
- Bends should be located accurately so tubing aligns with support clamps and end fittings without being drawn, pulled, or forced into place. A straight length of tubing should never be installed between two rigidly-mounted fittings — at least one bend should always be incorporated to absorb strain from vibration and temperature changes.
- Metallic fuel lines must be **bonded** at each point where they are clamped to the structure. Integrally bonded and cushioned line support clamps are preferred.
- Support clamps or brackets for metallic lines should be placed as close to bends as possible to reduce overhang.

### Hydraulic Lines

Hydraulic lines and fittings must be carefully inspected at regular intervals for fluid loss or leaks. Metal lines are checked for leaks, loose anchorage, scratches, kinks, or other damage; fittings and connections are checked for leakage, looseness, cracks, burrs, or other damage.

When replacing a damaged line, use tubing of the same size and material as the original. The old tubing can be used as a bending template unless too badly damaged, in which case a soft iron wire template is made instead. Soft aluminum tubing (1100, 3003, or 5052) under 3/8-inch outside diameter may be bent by hand; larger or other tubing requires a hand or power tube-bending tool.

**Tubing damage limits:**
- A small amount of flattening in bends is acceptable, but must **not exceed 75 percent** of the original outside diameter — excessive flattening causes fatigue failure.
- Scratches or nicks not deeper than **10 percent** of the wall thickness in aluminum alloy tubing, and not in the heel of a bend, may be repaired by burnishing with hand tools.
- A dent less than **20 percent** of the tube diameter is not objectionable, unless it is in the heel of a bend.
- Any crack or deformity in a flare is unacceptable and is cause for rejection.
- A severely-damaged line may be repaired by cutting out the damaged section and inserting a tube section of the same size and material, using standard unions, sleeves, and tube nuts.

### Flexible Hose

When replacing a flexible line, use the same type, size, part number, and length of hose as the line being replaced. Synthetic oils require a specially compounded synthetic rubber hose.

- A hose should **not** be stretched tight between two fittings, as this causes overstressing and eventual failure. The length of hose should provide about **5 to 8 percent slack**.
- Avoid tight bends in flex lines and never exceed the minimum bend radii.
- All flexible hose installations should be supported at least every **24 inches**; closer supports are preferred.
- Excessive flexing may weaken the hose or loosen the fittings.
- Hose that shows signs of leakage, abrasion, or kinking should be replaced. A hose suspected of kinking may be checked by passing a steel ball of the proper size through it — the ball will not pass through if the hose is distorted beyond limits.

**Teflon hose** is compounded from tetrafluoroethylene resin, which is unaffected by fluids normally used in aircraft. It has an operating range of **−65°F to 450°F**, making it suitable for hydraulic and engine lubricating systems where temperatures and pressures preclude the use of rubber hose. Teflon hose tends to assume a permanent set when exposed to high pressure or temperature — a Teflon hose that has been in service should **never** be straightened.

## O-Ring Seals

O-ring seals may function simply as a gasket (compressed within a recessed area) or may depend primarily on their resiliency for sealing. On moving parts, a moist surface (minor seepage) is a normal indication that a hydraulic seal is being properly lubricated; in pneumatic systems, lubrication is provided by a grease-impregnated felt wiper ring. On static systems, seepage past seals is **not** normally acceptable.

O-ring seals should be stored where temperatures do not exceed **120°F**, kept packaged to avoid exposure to ambient air and light (particularly sunlight).

**Do's and don'ts for O-ring seals:**
- Correct all leaks from static seal installations.
- Do not retighten packing gland nuts — retightening will, in most cases, increase rather than decrease the leak.
- **Never reuse O-ring seals** — they tend to swell from exposure to fluids and become set from being under pressure, and may have minor cuts or abrasions not readily visible.
- Avoid tools that might damage the seal or sealing surface.
- Do not depend on color-coding, which may vary by manufacturer — verify the part number is correct.
- Retain replacement seals in their package until ready for use.
- Ensure sealing surfaces are clean and free of nicks or scratches before installing the seal; protect the seal from sharp surfaces during installation (use an installation bullet or tape); lubricate the seal so it slides into place smoothly; ensure the seal has not twisted during installation.

A repaired or overhauled flexible hose, before being installed on the aircraft, should be tested to at least **1.5 times system pressure**.

## Feeders, Connectors, and Wiring Looms

Wire bundles must be routed in accessible areas protected from damage by personnel, cargo, and maintenance activity, and must not be routed where they could be used as handholds or support for personal equipment. Wiring must be clamped so contact with equipment and structure is avoided; where this cannot be achieved, protective grommets, chafe strips, etc. must be provided. Protective grommets must ensure at least a **3/8-inch clearance** from structure at penetrations.

A wire bundle consists of a quantity of wires fastened together, all traveling in the same direction; bundles may consist of two or more groups of wires, often individually tied within the bundle for ease of later identification.

**Bend radii for wire groups/bundles:**
- Minimum radii for bends must be **not less than 10 times** the outside diameter of the largest wire.
- At breakouts, or where they must reverse direction within a bundle, wires may be bent at **6 times** their outside diameter, provided they are suitably supported.
- RF cables should not be bent on a radius of less than **6 times** the outside diameter of the cable.

Wire groups or bundles should normally not exceed **1/2-inch deflection** between support points under normal hand pressure. This may be exceeded only where there is no possibility of the wire group or bundle touching a surface that may cause abrasion.

Sufficient slack should be provided at wiring terminal lugs or connectors to allow **two re-terminations** without replacing wires, in addition to the drip loop allowance. A **drip loop** is an area where wire is dressed downward to a connector, terminal block, panel, or junction box to prevent fluid or condensate from running into the device.

## Drains

Powerplant installations provide for draining various fluids — some provisions are for malfunction conditions, others are part of normal engine operation. Drains may flow overboard or to a reservoir collection point. Inspecting drains to ensure they are open and clear of debris is important.

## Lifting Points

When removing and replacing turbine engines, only the **manufacturer's designated lifting points** should be used to raise and lower the engine into position. These fittings are designed to safely lift the weight of the engine — lifting from any other point or fitting could cause damage. The manufacturer's data must be consulted to determine exactly which fittings on an engine are the lifting points.
        $cnt$,
        19
    ) RETURNING id INTO s19_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 15.20: Fire Protection Systems
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m15_id, 'M15.20', 'Fire Protection Systems',
        $cnt2$
# Fire Protection Systems

## Overview

Because fire is one of the most dangerous threats to an aircraft, the potential fire zones of all multiengine aircraft currently produced are protected by a **fixed** fire protection system — "fixed" meaning permanently installed, in contrast to portable fire extinguishing equipment such as a hand-held extinguisher. A **fire zone** is an area or region of an aircraft designated by the manufacturer to require fire detection and/or fire extinguishing equipment and a high degree of inherent fire resistance. Multiengine turbine powered aircraft, all commuter and transport category aircraft, and auxiliary power unit (APU) compartments are all required to have fire protection systems.

Turbine engine failures that lead to overheat conditions or fires are classified as:

1. **Thermodynamic** — upsets the proportion of air used to cool combustion temperatures to levels the turbine materials can tolerate. When the cooling cycle is upset, turbine blades can melt, causing sudden loss of thrust. Most thermodynamic failures are caused by ice, excess air bleed or leakage, or faulty controls permitting compressor stall or excess fuel.
2. **Mechanical** — such as fractured or thrown blades, which can puncture the tail cone and create an overheat condition, or penetrate lines and components containing flammable fluids.

A complete fire protection system includes both a **fire detection** system and a **fire extinguishing** system.

## Ideal Fire Detector System Features

An ideal fire detector system includes as many of the following features as possible:

1. No false warnings under any flight or ground condition.
2. Rapid indication of a fire and accurate location of the fire.
3. Accurate indication that a fire is out.
4. Indication that a fire has reignited.
5. Continuous indication for the duration of a fire.
6. Means for electrically testing the detector system from the cockpit.
7. Resistance to damage from oil, water, vibration, extreme temperatures, or handling.
8. Light weight, easily adaptable to any mounting position.
9. Detector circuitry that operates directly from the aircraft power system without inverters.
10. Minimum electrical current requirements when not indicating a fire.
11. A cockpit light indicating fire location, plus an audible alarm.
12. A separate detector system for each engine.

## Fire Detection System Types

Fires are detected using **overheat detectors**, **rate-of-temperature-rise detectors**, and **flame detectors**. Two common categories are **spot detector systems** (individual sensors monitoring a fire zone) and **continuous loop systems** (typically installed on transport aircraft, providing more complete coverage). Smoke detectors and carbon monoxide detectors are better suited to areas such as baggage compartments or lavatories, where materials burn slowly or smolder, and are not used to detect engine fires.

### Thermal Switch System

A thermal switch system has one or more lights energized by the aircraft power system and controlled by **thermal switches** — heat-sensitive units that complete electrical circuits at a certain temperature. The switches are connected in parallel with each other but in series with the indicator lights. If the temperature rises above the set value, the thermal switch closes, completing the light circuit to indicate a fire or overheat condition. The exact number of thermal switches used is determined by the aircraft manufacturer.

### Thermocouple System

A thermocouple system operates on an entirely different principle from the thermal switch system: it depends on the **rate of temperature rise** and does not warn when an engine slowly overheats or a short circuit develops. The system consists of a relay box (containing a sensitive relay, a slave relay, and a thermal test unit), warning lights, and thermocouples, wired into detector, alarm, and test circuits.

A thermocouple is constructed of two dissimilar metals (such as **chromel and constantan**). The junction where these metals meet and are exposed to fire heat is the **hot junction**; a **reference junction** is enclosed in a dead air space between insulation blocks. If temperature rises rapidly, the thermocouple produces a voltage due to the temperature difference between the hot and reference junctions. During normal, gradual engine warm-up, both junctions heat at the same rate and no voltage (and no warning) results.

Whenever detector current exceeds **4 milliamperes (0.004 ampere)**, the sensitive relay closes, completing a circuit to the slave relay coil; the slave relay then closes and completes the circuit to the warning light. Total circuit resistance in individual detector circuits usually does not exceed **5 ohms**.

### Infrared Optical Fire Detection

Optical sensors ("flame detectors") alarm when they detect prominent, specific radiation emissions from hydrocarbon flames. Two types exist: infrared (IR) and ultraviolet. IR-based optical flame detectors are used primarily on light turboprop aircraft and helicopter engines. Radiation from the fire impinges on the detector's front face and window; a filter allows only radiation in a tight waveband centered around **4.3 micrometers** in the IR to pass through to the radiation-sensitive surface, generating small thermoelectric voltages that are amplified and processed. The processing electronics is tailored to the time signature of known hydrocarbon flame sources and ignores false-alarm sources such as incandescent lights and sunlight.

### Pneumatic Thermal Fire Detection

Pneumatic detectors are based on gas laws. The sensing element is a closed **helium-filled tube** connected to a responder assembly. As the element heats, gas pressure inside the tube increases until the alarm threshold is reached, closing an internal switch that reports an alarm to the cockpit. An integrity pressure switch triggers a fault alarm if the pneumatic detector loses pressure, as in a leak.

### Continuous-Loop Detector Systems

Large commercial aircraft almost exclusively use continuous thermal sensing elements for powerplant fire protection, since they offer superior detection performance and coverage and proven ruggedness. Continuous-loop systems are versions of the thermal switch system — they are overheat systems with **no rate-of-heat-rise sensitivity**. Two widely used types are the **Fenwal** and **Kidde** systems.

**Fenwal system:** uses a slender inconel tube packed with thermally sensitive eutectic salt and a nickel wire center conductor. Lengths of sensing elements are connected in series to a control unit, which impresses a small voltage on the elements. When an overheat condition occurs anywhere along the element, the resistance of the eutectic salt drops sharply, causing current flow between the outer sheath and center conductor; this is sensed by the control unit, which actuates the output relay. When the fire is extinguished or the temperature lowers, the system automatically returns to standby.

**Kidde system:** two wires are embedded in an inconel tube filled with a thermistor core material. One conductor grounds to the tube; the other connects to the fire detection control unit. As core temperature increases, electrical resistance to ground **decreases**. The control unit monitors this resistance: if it decreases to the overheat set point, an overheat indication occurs (typically with a **10-second time delay**); if it decreases further to the fire set point, a fire warning occurs. The rate of resistance change distinguishes an electrical short from a fire — resistance decreases more quickly with an electrical short. The Kidde system can also supply nacelle temperature data to the aircraft condition monitoring function (AIMS).

The sensing element consists, in effect, of an infinite number of unit thermistors electrically in parallel along its length, so the sensing element responds not to a fixed alarm temperature but to the sum of the parallel resistances — a non-arithmetic "average." This allows the element to be routed close to nonhazardous hot spots without causing false alarms, while giving greater sensitivity to a general overheat or fire condition.

### Combination Fire and Overheat Warning

The analog signal from the thermistor sensing element allows a two-level response from the same loop: an **overheat warning** at a level below the fire warning (indicating general compartment temperature rise, e.g. from leaking hot bleed air), and a **fire warning** at a higher level.

### System Test

The integrity of a continuous-loop system is tested by actuating a test switch in the flight deck, which switches one end of the sensing element loop to a test circuit built into the control unit that simulates the resistance change due to fire — demonstrating loop continuity, alarm indicator integrity, and control circuit function. The thermistor properties of the sensing element remain unchanged for its life, since no chemical or physical changes occur on heating.

### Dual-Loop Systems

Dual-loop systems are, in essence, two complete basic fire detection systems whose output signals are combined so that **both** must signal to result in a fire warning ("AND" logic) — this greatly increases reliability against false fire warnings. If one loop is found inoperative at the preflight integrity test, a cockpit selector switch disconnects it and allows the remaining loop alone to activate the fire warning, permitting safe dispatch with maintenance deferred. Should a loop fail in flight, a cockpit fault signal alerts the crew to select single-loop operation.

**Automatic self-interrogation** eliminates the need for crew action: if one loop signals "fire," the system automatically tests the other loop within milliseconds — if that loop is operative, the fire signal is suppressed (since the operative loop would have signaled too); if the other loop tests inoperative, the circuit outputs a fire signal.

### Support Tube-Mounted Sensing Elements

Support tube mounting solves the problem of providing sufficient support points for sensing elements and facilitates removal/reinstallation for maintenance. The element is attached to a prebent stainless steel tube by closely spaced clamps and bushings, protecting it from vibration damage, pinching, and excessive bending, while being installed in its precise designed location.

### Fire Detection Control Unit

The simplest control units contain electronic resistance monitoring and alarm output circuitry in a hermetically sealed aluminum case with a mounting bracket and circular electrical connector. More sophisticated systems use removable control cards for individual hazard areas; the most advanced systems control all aircraft fire protection functions (detection and extinguishing for engines, APUs, cargo bays, and bleed air systems).

## Fire Zones

The powerplant installation has several designated fire zones: (1) the engine power section; (2) the engine accessory section; (3) except for reciprocating engines, any complete powerplant compartment where no isolation is provided between the power section and accessory section; (4) any APU compartment; (5) any fuel-burning heater and other combustion equipment installation; (6) the compressor and accessory sections of turbine engines; and (7) combustor, turbine, and tailpipe sections of turbine engine installations containing lines or components carrying flammable fluids or gases.

## Engine Fire Extinguishing System

Commuter aircraft (14 CFR Part 23) are required to have, at minimum, a **one-shot** fire extinguishing system. Transport category aircraft (14 CFR Part 25) are required to have **two discharges** (two-shot system), each producing adequate agent concentration. An individual one-shot system may be used for APUs, fuel-burning heaters, and other combustion equipment.

### Fire Extinguishing Agents

Fixed fire extinguisher systems dilute the atmosphere with an **inert agent** that does not support combustion, distributed via perforated tubing or discharge nozzles. High Rate of Discharge (HRD) systems use open-end tubes to deliver extinguishing agent in **1 to 2 seconds**. The most common extinguishing agent is **Halon 1301**, valued for its effective firefighting capability and relatively low toxicity; it is noncorrosive, does not affect materials it contacts, and requires no clean-up when discharged. Because Halon 1301 depletes the ozone layer, only recycled Halon 1301 is currently available, and it remains in use until a suitable replacement is developed. Some military aircraft use HCL-125, which the FAA was testing for commercial use.

### Turbine Engine Ground Fire Protection

Many aircraft provide spring-loaded or pop-out access doors for rapid access to the compressor, tailpipe, or burner compartments. Internal engine tailpipe fires occurring during shutdown or false starts can often be blown out by motoring the engine with the starter, or by accelerating a running engine to rated speed. If a fire persists, extinguishing agent can be directed into the tailpipe — but excessive use of CO₂ or other cooling-effect agents can shrink the turbine housing and cause the engine to disintegrate.

### Containers (HRD Bottles)

Fire extinguisher containers store liquid halogenated extinguishing agent pressurized with gas (typically nitrogen), normally manufactured from **stainless steel** (titanium is an alternate material). Most containers are **spherical**, giving the lightest weight possible; cylindrical shapes are used where space is limited. Each container incorporates a temperature/pressure sensitive safety relief diaphragm preventing container pressure from exceeding test pressure under excessive temperature exposure.

### Discharge Valves

A cartridge (squib) and frangible disk type valve is installed in the discharge valve outlet. Standard release type uses a slug driven by explosive energy to rupture a segmented closure disk; for high temperature or hermetically sealed units, a direct explosive impact cartridge fragments a pre-stressed corrosion-resistant steel diaphragm.

### Pressure Indication

A simple visual gauge (typically a vibration-resistant helical bourdon-type indicator) shows agent charge status. A combination gauge switch indicates container pressure visually and provides an electrical signal if pressure is lost.

### Two-Way Check Valve

Required in a two-shot system to prevent the agent in a reserve container from backing up into a previously-emptied main container.

### Discharge Indicators

- **Thermal discharge indicator (red disk):** connected to the fire container relief fitting; ejects a red disk when container contents have dumped overboard due to excessive heat, indicating the container must be replaced before the next flight.
- **Yellow disk discharge indicator:** ejected from the aircraft skin if the flight crew activates the fire extinguisher system, indicating to maintenance crew that the system was activated and the container needs replacement.

### Fire Switch

Fire switches are typically installed on the center overhead panel or center console. When activated, the fire switch: stops the engine (fuel control shuts off), isolates the engine from aircraft systems, and arms/controls the fire extinguishing system. A lock prevents accidental activation, releasing only when a fire has been detected (though it can be manually released by the crew if the detection system malfunctions).

### Warning Systems

Visible and audible warning systems alert the flight crew: a horn sounds and warning lights illuminate to indicate an engine fire has been detected; indications stop when the fire is extinguished.

## Boeing 777 Fire Detection and Extinguishing System (Example)

Each B777 engine has two fire detection loops (loop 1 and loop 2), monitored by a **fire detection card** in the system card file (one card per engine). In normal (dual loop) operation, both loops must indicate a fire or overheat condition to cause flight deck indications.

- **Overheat detection:** master caution lights, caution aural, and an overheat caution message.
- **Fire detection:** master warning lights, fire warning aural, engine fire warning message, engine fire warning light, and fuel control switch fire warning light.

The fire detection card measures average loop temperature and sends this data to the Aircraft In-Flight Monitoring System (AIMS) via ARINC 629 buses, where it is recorded by the airplane condition monitoring function. Built-in test equipment (BITE) tests the system when power is first applied, after a power interrupt, and **every 5 minutes** of operation.

If a loop fails, the system switches to single-loop operation; if both loops fail, an advisory message displays and the fire detection system does not operate.

**Fire extinguisher bottles:** the B777 has two Halon-filled bottles (pressurized with nitrogen), located behind the right sidewall lining of the forward cargo compartment. Halon from each bottle can be discharged to either engine. Each bottle has a safety relief/fill port, a removal/installation handle, a pressure switch, two discharge assemblies, an identification plate, and four mounting lugs.

**Squib:** an electrically operated explosive device installed in the discharge assembly; each container has two squibs (one per engine). When fired, the squib drives a slug through a breakable disk, and nitrogen pressure pushes the Halon out through the discharge port. The squib fires when the fire switch is pulled and rotated to the DISCH 1 or DISCH 2 position.

**Engine fire switch functions:** gives an indication of an engine fire; stops the engine; isolates the engine from the airplane systems; controls the engine fire extinguishing system. Pulling the switch also: closes the fuel spar valve, de-energizes the FMU cutoff solenoid, closes the hydraulic pump shutoff valve, depressurizes the hydraulic pump valve, closes the pressure regulator/shutoff valve, removes power from the thrust reverser isolation valve, and trips the generator and backup generator fields.

If the fire warnings do not clear after the switch is pulled, it is positioned to DISCH 1 or DISCH 2 and held against the stop for **one second**, firing the squib and releasing agent into the nacelle. If the first bottle does not extinguish the fire, the switch is moved to the other DISCH position to fire the second bottle's squib.

## APU Fire Detection and Extinguishing System

The APU fire protection system is similar in design to engine fire protection systems but differs in that the APU is often operated unattended. In **unattended mode** (on the ground, engines not running), the fire extinguisher discharges **automatically** if a fire is detected. In **attended mode** (at least one engine running), the crew discharges the bottle manually. If fire warnings persist after the switch is pulled, it is placed to the DISCH position and held for one second to fire the bottle squib and release agent into the APU compartment.
        $cnt2$,
        20
    ) RETURNING id INTO s20_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M15.19 Powerplant Installation (18 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s19_id, 'Everything associated with the engine on the engine side of the firewall is referred to as the:',
     '[{"id":"a","text":"Powerplant","correct":true},{"id":"b","text":"Nacelle only","correct":false},{"id":"c","text":"Fuselage structure","correct":false}]',
     '{"B1"}'),

    (s19_id, 'What is the function of a firewall in a powerplant installation?',
     '[{"id":"a","text":"To isolate the powerplant from the airframe structure in case of fire and normal operating heat","correct":true},{"id":"b","text":"To reduce aerodynamic drag around the nacelle","correct":false},{"id":"c","text":"To provide the engine mounting attachment points","correct":false}]',
     '{"B1"}'),

    (s19_id, 'Firewalls are typically sheet metal shields made from:',
     '[{"id":"a","text":"Stainless steel or another high heat resistance metal","correct":true},{"id":"b","text":"Untreated mild steel","correct":false},{"id":"c","text":"Plywood laminate","correct":false}]',
     '{"B1"}'),

    (s19_id, 'One method of suppressing noise from the fan stage of a high by-pass ratio engine is to incorporate:',
     '[{"id":"a","text":"A noise absorbent liner around the inside wall of the by-pass duct","correct":true},{"id":"b","text":"A second firewall around the fan case","correct":false},{"id":"c","text":"A thicker cowling made of solid aluminum","correct":false}]',
     '{"B1"}'),

    (s19_id, 'A disadvantage of using acoustic liners to reduce engine noise is:',
     '[{"id":"a","text":"Added weight and increased specific fuel consumption from increased duct wall friction","correct":true},{"id":"b","text":"A reduction in engine thrust output","correct":false},{"id":"c","text":"Increased risk of engine fire","correct":false}]',
     '{"B1"}'),

    (s19_id, 'Forward vibration isolator engine mounts are designed to carry:',
     '[{"id":"a","text":"Vertical, side, and axial (thrust) loads, while allowing engine growth due to thermal expansion","correct":true},{"id":"b","text":"Torque loads only","correct":false},{"id":"c","text":"No loads — they are purely cosmetic covers","correct":false}]',
     '{"B1"}'),

    (s19_id, 'The vibration isolators used in turbine engine mounts consist of:',
     '[{"id":"a","text":"A resilient material permanently enclosed in a metal case","correct":true},{"id":"b","text":"A rigid steel spacer block","correct":false},{"id":"c","text":"A hollow pressurized bladder","correct":false}]',
     '{"B1"}'),

    (s19_id, 'Where physical separation of a fuel line from electrical wiring or conduit is impracticable, the fuel line should be:',
     '[{"id":"a","text":"Located below the wiring and clamped securely to the airframe structure","correct":true},{"id":"b","text":"Used to support the wiring bundle","correct":false},{"id":"c","text":"Routed directly through the wiring conduit","correct":false}]',
     '{"B1"}'),

    (s19_id, 'When installing a straight run of fuel or hydraulic tubing between two rigidly-mounted fittings, a technician should:',
     '[{"id":"a","text":"Always incorporate at least one bend to absorb strain from vibration and temperature changes","correct":true},{"id":"b","text":"Install it perfectly straight to minimize pressure drop","correct":false},{"id":"c","text":"Add a rigid brace at the midpoint instead of a bend","correct":false}]',
     '{"B1"}'),

    (s19_id, 'A small amount of flattening is acceptable when bending aluminum tubing, provided it does not exceed what percentage of the original outside diameter?',
     '[{"id":"a","text":"25 percent","correct":false},{"id":"b","text":"75 percent","correct":true},{"id":"c","text":"90 percent","correct":false}]',
     '{"B1"}'),

    (s19_id, 'Any crack or deformity found in the flare of a metallic tube is:',
     '[{"id":"a","text":"Acceptable provided the flare is refinished","correct":false},{"id":"b","text":"Cause for rejection","correct":true},{"id":"c","text":"Only a concern on hydraulic lines, not fuel lines","correct":false}]',
     '{"B1"}'),

    (s19_id, 'A flexible hose installed between two fittings should be given approximately how much slack?',
     '[{"id":"a","text":"5 to 8 percent","correct":true},{"id":"b","text":"25 to 30 percent","correct":false},{"id":"c","text":"None — it should be pulled taut","correct":false}]',
     '{"B1"}'),

    (s19_id, 'Teflon hose has an operating temperature range of approximately:',
     '[{"id":"a","text":"−65°F to 450°F","correct":true},{"id":"b","text":"0°F to 100°F","correct":false},{"id":"c","text":"−200°F to 1200°F","correct":false}]',
     '{"B1"}'),

    (s19_id, 'A Teflon hose that has been in service and has taken a permanent set should be:',
     '[{"id":"a","text":"Straightened by hand before reinstallation","correct":false},{"id":"b","text":"Never straightened — a set hose should not be straightened","correct":true},{"id":"c","text":"Heated and reshaped with a bending tool","correct":false}]',
     '{"B1"}'),

    (s19_id, 'Regarding O-ring seals, correct maintenance practice is to:',
     '[{"id":"a","text":"Never reuse an O-ring seal, since it may have swollen or taken a set and may have unseen minor damage","correct":true},{"id":"b","text":"Reuse an O-ring seal as long as it is not visibly cut","correct":false},{"id":"c","text":"Rely on the O-ring''s color coding to confirm the correct part","correct":false}]',
     '{"B1"}'),

    (s19_id, 'The minimum bend radius for a wire group or bundle must not be less than how many times the outside diameter of its largest wire?',
     '[{"id":"a","text":"3 times","correct":false},{"id":"b","text":"10 times","correct":true},{"id":"c","text":"25 times","correct":false}]',
     '{"B1"}'),

    (s19_id, 'Under normal hand pressure, deflection of a wire group or bundle between support points should normally not exceed:',
     '[{"id":"a","text":"1/2 inch","correct":true},{"id":"b","text":"3 inches","correct":false},{"id":"c","text":"There is no limit as long as the wires are not touching a surface","correct":false}]',
     '{"B1"}'),

    (s19_id, 'When removing and replacing a turbine engine, the engine should be lifted using:',
     '[{"id":"a","text":"Any convenient structural point strong enough to hold the weight","correct":false},{"id":"b","text":"Only the manufacturer''s designated lifting points","correct":true},{"id":"c","text":"The engine mount bolts only","correct":false}]',
     '{"B1"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M15.20 Fire Protection Systems (23 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s20_id, 'A "fire zone" is best defined as:',
     '[{"id":"a","text":"An area designated by the manufacturer to require fire detection and/or extinguishing equipment and a high degree of inherent fire resistance","correct":true},{"id":"b","text":"Any compartment that contains a fuel line","correct":false},{"id":"c","text":"The area immediately surrounding a hand-held fire extinguisher","correct":false}]',
     '{"B1"}'),

    (s20_id, 'The term "fixed" fire protection system describes a system that is:',
     '[{"id":"a","text":"Permanently installed, as opposed to portable equipment such as a hand-held extinguisher","correct":true},{"id":"b","text":"Only activated automatically, never manually","correct":false},{"id":"c","text":"Installed only on APUs","correct":false}]',
     '{"B1"}'),

    (s20_id, 'Turbine engine failures leading to overheat conditions or fires are classified into two major types:',
     '[{"id":"a","text":"Electrical and hydraulic","correct":false},{"id":"b","text":"Thermodynamic and mechanical","correct":true},{"id":"c","text":"Structural and aerodynamic","correct":false}]',
     '{"B1"}'),

    (s20_id, 'A complete fire protection system includes both a fire detection system and a:',
     '[{"id":"a","text":"Fire extinguishing system","correct":true},{"id":"b","text":"Smoke removal fan","correct":false},{"id":"c","text":"Secondary firewall","correct":false}]',
     '{"B1"}'),

    (s20_id, 'Smoke detectors and carbon monoxide detectors are best suited for monitoring:',
     '[{"id":"a","text":"Areas such as baggage compartments or lavatories where materials burn slowly or smolder","correct":true},{"id":"b","text":"The engine power section, as the primary engine fire detector","correct":false},{"id":"c","text":"The compressor case exclusively","correct":false}]',
     '{"B1"}'),

    (s20_id, 'In a thermal switch fire detection system, the thermal switches are wired:',
     '[{"id":"a","text":"In parallel with each other and in series with the indicator lights","correct":true},{"id":"b","text":"In series with each other and in parallel with the indicator lights","correct":false},{"id":"c","text":"Independently, with no connection to the indicator lights","correct":false}]',
     '{"B1"}'),

    (s20_id, 'A thermocouple fire detection system operates based on:',
     '[{"id":"a","text":"The rate of temperature rise, and does not warn when an engine slowly overheats","correct":true},{"id":"b","text":"Absolute cabin altitude","correct":false},{"id":"c","text":"A fixed resistance threshold regardless of heating rate","correct":false}]',
     '{"B1"}'),

    (s20_id, 'A thermocouple fire detector is constructed from two dissimilar metals, typically:',
     '[{"id":"a","text":"Chromel and constantan","correct":true},{"id":"b","text":"Copper and aluminum","correct":false},{"id":"c","text":"Titanium and magnesium","correct":false}]',
     '{"B1"}'),

    (s20_id, 'In a thermocouple fire detection circuit, the sensitive relay closes and a fire warning sequence begins once the detector current exceeds:',
     '[{"id":"a","text":"4 milliamperes (0.004 ampere)","correct":true},{"id":"b","text":"4 amperes","correct":false},{"id":"c","text":"0.4 milliamperes","correct":false}]',
     '{"B1"}'),

    (s20_id, 'IR-based optical (infrared) flame detectors allow only radiation in a tight waveband centered around what wavelength to reach the sensing device?',
     '[{"id":"a","text":"4.3 micrometers","correct":true},{"id":"b","text":"0.43 micrometers","correct":false},{"id":"c","text":"43 micrometers","correct":false}]',
     '{"B1"}'),

    (s20_id, 'The sensing element of a pneumatic thermal fire detector consists of a closed tube filled with:',
     '[{"id":"a","text":"Helium","correct":true},{"id":"b","text":"Hydraulic fluid","correct":false},{"id":"c","text":"Compressed engine bleed air","correct":false}]',
     '{"B1"}'),

    (s20_id, 'Compared with spot-type detectors, continuous-loop detector systems are best described as:',
     '[{"id":"a","text":"Overheat systems with no rate-of-heat-rise sensitivity, offering more complete fire hazard area coverage","correct":true},{"id":"b","text":"Systems sensitive only to the rate of temperature rise, not absolute temperature","correct":false},{"id":"c","text":"Systems limited to a single sensing point per zone","correct":false}]',
     '{"B1"}'),

    (s20_id, 'In the Fenwal continuous-loop system, an overheat condition causes the resistance of the eutectic salt within the sensing element to:',
     '[{"id":"a","text":"Rise sharply, opening the detector circuit","correct":false},{"id":"b","text":"Drop sharply, causing current flow that is sensed by the control unit","correct":true},{"id":"c","text":"Remain unchanged, with the alarm triggered instead by tube pressure","correct":false}]',
     '{"B1"}'),

    (s20_id, 'In the Kidde continuous-loop system, as the temperature of the thermistor core increases, the electrical resistance to ground:',
     '[{"id":"a","text":"Decreases","correct":true},{"id":"b","text":"Increases","correct":false},{"id":"c","text":"Stays constant until the fire set point is reached","correct":false}]',
     '{"B1"}'),

    (s20_id, 'In the Kidde continuous-loop system, distinguishing an electrical short from an actual fire is possible because:',
     '[{"id":"a","text":"Resistance decreases more quickly with an electrical short than with a fire","correct":true},{"id":"b","text":"A short causes resistance to rise, while a fire causes it to fall","correct":false},{"id":"c","text":"Shorts can only be detected with the system powered off","correct":false}]',
     '{"B1"}'),

    (s20_id, 'In a dual-loop fire detection system using "AND" logic, a fire warning is generated only when:',
     '[{"id":"a","text":"Both loops signal a fire or overheat condition","correct":true},{"id":"b","text":"Either loop alone signals a fire condition","correct":false},{"id":"c","text":"The crew manually confirms the fire after loop activation","correct":false}]',
     '{"B1"}'),

    (s20_id, 'Automatic self-interrogation in a dual-loop system, upon one loop signaling "fire," will:',
     '[{"id":"a","text":"Immediately shut down the affected engine without testing the other loop","correct":false},{"id":"b","text":"Test the other loop within milliseconds and suppress the fire signal if that loop is operative and shows no fire","correct":true},{"id":"c","text":"Wait for the next scheduled maintenance check before responding","correct":false}]',
     '{"B1"}'),

    (s20_id, 'Under 14 CFR Part 25 (transport category aircraft), the engine fire extinguishing system is required to provide:',
     '[{"id":"a","text":"A single one-shot discharge only","correct":false},{"id":"b","text":"Two discharges, each producing adequate agent concentration","correct":true},{"id":"c","text":"Continuous agent release for the duration of the flight","correct":false}]',
     '{"B1"}'),

    (s20_id, 'The most common fire extinguishing agent still used in engine fire protection systems is:',
     '[{"id":"a","text":"Halon 1301","correct":true},{"id":"b","text":"Pure water","correct":false},{"id":"c","text":"Compressed engine bleed air","correct":false}]',
     '{"B1"}'),

    (s20_id, 'Excessive use of CO2, or other extinguishing agents with a strong cooling effect, on a turbine engine tailpipe fire can:',
     '[{"id":"a","text":"Shrink the turbine housing and cause the engine to disintegrate","correct":true},{"id":"b","text":"Permanently increase engine thrust output","correct":false},{"id":"c","text":"Have no adverse mechanical effect on the turbine","correct":false}]',
     '{"B1"}'),

    (s20_id, 'Most fire extinguisher containers (HRD bottles) are spherical in shape primarily because this design:',
     '[{"id":"a","text":"Provides the lightest weight possible","correct":true},{"id":"b","text":"Is the only shape compatible with nitrogen pressurization","correct":false},{"id":"c","text":"Allows the container to double as an engine mount","correct":false}]',
     '{"B1"}'),

    (s20_id, 'On the Boeing 777, in normal dual-loop operation, flight deck fire indications are triggered only when:',
     '[{"id":"a","text":"Either loop 1 or loop 2 alone detects a fire or overheat condition","correct":false},{"id":"b","text":"Both loop 1 and loop 2 have a fire or overheat condition","correct":true},{"id":"c","text":"The AIMS cabinet independently confirms the fire via a separate sensor","correct":false}]',
     '{"B1"}'),

    (s20_id, 'On the Boeing 777, if the fire warnings do not clear after the engine fire switch is pulled, the switch is placed to a DISCH position and held against the stop for approximately:',
     '[{"id":"a","text":"One second","correct":true},{"id":"b","text":"One minute","correct":false},{"id":"c","text":"Ten minutes","correct":false}]',
     '{"B1"}');

END $$;
