-- Module 15: Gas Turbine Engine (B1) — Starting and Ignition Systems, Engine Indication Systems
-- Source: EASA Part-66 Module 15 official textbook (Gas Turbine Engine, Sub-Modules 13 and 14)

DO $$
DECLARE
    m15_id INT;
    s13_id INT;
    s14_id INT;
BEGIN
    SELECT id INTO m15_id FROM easa_modules WHERE code = 'M15';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M15.13') THEN
        RAISE NOTICE 'M15.13-M15.14 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 15.13: Starting and Ignition Systems
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m15_id, 'M15.13', 'Starting and Ignition Systems',
        $cnt$
# Starting and Ignition Systems

## Starting Requirements

Gas turbine engines are started by rotating the high-pressure compressor. To start the engine it is necessary to accelerate the compressor to provide sufficient air to support combustion in the combustion section (burners). Once ignition and fuel have been introduced and light-off has occurred, the starter must continue to assist the engine until the engine reaches **self-sustaining speed**. The torque supplied by the starter must exceed the torque required to overcome compressor inertia and the friction loads of the engine's compressor.

A typical starting sequence: as soon as the starter has accelerated the compressor sufficiently to establish airflow through the engine, ignition is turned on, followed by fuel. The exact sequence matters — there must be sufficient airflow through the engine to support combustion before the fuel-air mixture is ignited. At low cranking speeds, fuel flow rate is not sufficient to enable the engine to accelerate, so the starter continues cranking well beyond self-accelerating speed. If starter assistance were cut off too early, the engine could fail to accelerate to idle, or even decelerate. Conversely, if the starter continues too long past self-accelerating speed without cutting off, this delay can result in a **hot start**, a **hung (false) start**, or a combination of both.

The basic types of starters in current use for gas turbine engines are:
- **Direct current (DC) electric motor** starters
- **Starter/generators**
- **Air turbine** starters

Other methods that have largely given way to the above include **air impingement starting** (jets of compressed air piped to the inside of the compressor or turbine case, directing a jet air blast onto the rotor blades), **cartridge/pneumatic starters**, **fuel/air combustion starters**, and **hydraulic pumps and motors** (the latter rarely used on modern commercial aircraft due to the high power demands of large turbofan engines).

## Cartridge/Pneumatic Starters

A cartridge/pneumatic starter may be operated as an ordinary air turbine starter from a ground air supply or engine cross-bleed, or as a cartridge starter. To perform a cartridge start, a cartridge is placed in the breech cap; the breech is closed on the breech chamber with the breech handle and rotated a partial turn to engage the lugs. The cartridge is ignited by applying voltage through a connector at the end of the breech handle, and begins generating gas. The gas is forced out of the breech to hot gas nozzles directed at the turbine rotor buckets, producing rotation via the overboard exhaust collector. Before reaching the nozzle, hot gas passes an outlet leading to a **relief valve**, which bypasses the hot gas nozzle and directs gas straight to the turbine if pressure rises above a preset maximum — maintaining the hot gas circuit at an optimum pressure.

## Fuel/Air Combustion Starters

The fuel/air combustion starter uses the combustion energy of jet A fuel and compressed air. It consists of a turbine-driven power unit plus auxiliary fuel, air, and ignition systems. Operation is, in most installations, fully automatic: a single switch causes the starter to fire and accelerate the engine from rest to starter cutoff speed.

## Electric Starting Systems

Electric starting systems are of two general types:

| Type | Typical use | Key feature |
|------|-------------|-------------|
| **Direct cranking electric** | Small turbine engines, APUs, some small turboshaft engines | Must be disengaged from the shaft after the engine starts |
| **Starter/generator** | Many gas turbine aircraft | Permanently engaged with the engine shaft through drive gears; switches to generator function after self-sustaining speed |

A starter/generator saves weight and space by combining both functions in one unit — an economical arrangement that also reduces total system weight and spare-parts requirements. It is basically a shunt generator with an additional heavy **series winding**, electrically connected to produce a strong field and high torque for starting.

### Starter/Generator Internal Circuit

The starter/generator has **four field windings**:
- **Series field (C field)**
- **Shunt field**
- **Compensating field**
- **Interpole (commutating) winding**

During **starting**, the C field, compensating, and commutating windings are used (all in series with the source); the shunt field is not used while acting as a starter. A source of **24 volts and 1,500 peak amperes** is usually required for starting. A typical starter/generator has a gear ratio of approximately **435 to 1**.

During **generating**, the shunt, compensating, and commutating windings are used; the C field is used only for starting purposes. Compensating and commutating (interpole) windings provide almost sparkless commutation from no load to full load.

### Undercurrent Controller Sequence

An undercurrent controller contains two relays: a **motor relay** (controls input to the starter) and an **undercurrent relay** (controls the motor relay). Sequence of operation:

1. Closing the engine master switch completes the circuit from the aircraft bus to the start switch, fuel valves, and throttle relay; the throttle relay starts the fuel pumps.
2. Turning on the battery and start switch closes three relays: the **motor relay**, **ignition relay**, and **battery cutout relay**. The motor relay closes the circuit from the power source to the starter motor; the ignition relay closes the circuit to the ignition units; the battery cutout relay disconnects the battery (necessary because the heavy starter-motor current draw would damage the battery).
3. High current flowing to the motor also flows through the undercurrent relay coil, closing it, which completes a circuit from the positive bus to the motor relay coil, ignition relay coil, and battery cutout relay coil, keeping all three energized after the start switch returns to OFF.
4. As the motor builds speed, current draw decreases. When it drops below **200 amps**, the undercurrent relay opens, breaking the circuit to the motor, ignition, and battery cutout relay coils, and halting the start operation.
5. If the engine fails to reach sufficient speed to halt the starter automatically, a stop switch can break the circuit from the positive bus to the undercurrent relay's main contacts.

## Air Turbine Starters

Air turbine starters provide high starting torque from a small, lightweight source. A typical air turbine starter weighs from **one-fourth to one-half** as much as an electric starter capable of starting the same engine, and is capable of developing considerably more torque.

The typical air turbine starter consists of an axial-flow turbine that turns a drive coupling through a **reduction gear train** and a starter clutch mechanism. Air to operate the starter is supplied from a ground-operated air cart, the APU, or a cross-bleed start from an already-operating engine. Only one air source is used at a time. Duct pressure is normally around **30–50 psi**, with a normal limit minimum of about **30 psi** required for a complete start; duct pressure should always be checked prior to a start attempt.

Air passes into the starter turbine housing, where it is directed against the rotor blades by nozzle vanes, causing the turbine rotor to turn. As the rotor turns it drives the reduction gear train and clutch arrangement (rotor pinion, planet gears and carrier, sprag clutch assembly, output shaft assembly, drive coupling). The **sprag clutch** engages automatically as soon as the rotor starts to turn, but disengages as soon as the drive coupling turns more rapidly than the rotor side (i.e. once the engine is self-sustaining and accelerating past starter speed), allowing the gear train to coast to a halt.

A rotor switch actuator, mounted in the turbine rotor hub, opens the turbine switch when the starter reaches cutout speed. This interrupts the electrical signal to the **start valve**, closing it and shutting off the air supply to the starter.

The turbine housing incorporates a **rotor containment ring**, designed to dissipate the energy of blade fragments and direct their discharge at low energy through the exhaust duct in the event of rotor failure due to excessive turbine overspeed.

The transmission housing contains the reduction gears, clutch components, drive coupling, and a lubricating-oil reservoir. Normal maintenance includes checking oil level, inspecting the magnetic chip detector for metal particles, and checking for leaks. The starter uses **turbine oil**, the same as the engine, but this oil does not circulate through the engine.

### Pressure-Regulating and Shutoff Valve

The air path to the starter is controlled by a combination pressure-regulating and shutoff valve (or bleed valve), consisting of a **pressure-regulating valve** (a butterfly-type valve) and a **pressure-regulating valve control**. The butterfly valve shaft connects through a cam arrangement to a servo piston; the cam's slope is designed to give small initial travel and high initial torque when the starter is actuated, and to increase valve-opening time for more stable action. A control assembly (solenoid, control crank, pilot valve, bellows connected by air line to a pressure-sensing port on the starter) governs the servo piston. Turning on the starter switch energizes the regulating valve solenoid, which retracts and allows the control crank to open the pilot valve; as downstream (regulated) pressure reaches a preset value, air flow into the servo through a restriction balances air bled to atmosphere, and the system reaches equilibrium. Downstream from the bleed valve is the **start valve**, which controls air flow into the starter itself; when starter cutout speed is reached, the start valve closes.

## Turbine Engine Ignition Systems

Turbine ignition systems operate mostly for a brief period during the starting cycle, so they are generally more trouble-free than a reciprocating engine's ignition system. Unlike a reciprocating engine system, turbine ignition **does not need to be timed** to spark at an exact point in the operating cycle — it ignites the fuel in the combustor and is then switched off, since once combustion has begun the flame is continuous.

**Continuous ignition**, operated at a lower voltage and energy level, is used in case the engine were to flame out — it can relight the fuel and keep the engine from stopping. It is used for certain critical flight conditions, such as **takeoff, landing, and some abnormal and emergency situations**.

Most gas turbine engines are equipped with a **high-energy, capacitor-type** ignition system, air cooled by fan airflow ducted to the exciter box and around the igniter lead. Cooling is important when continuous ignition is used for extended periods. Some engines use an electronic-type ignition system, a variation of the simpler capacitor type.

### Capacitor-Type (Capacitor-Discharge) Ignition System

A typical capacitor-type system consists of **two identical, independent ignition units** operating from a common low-voltage DC power source (the aircraft battery, 115 VAC, or the engine's permanent magnet generator, which is turned by the engine through the accessory gearbox and produces power any time the engine is turning). This dual arrangement is a safety factor — the ignition system fires **two igniter plugs**, via two exciter units, two transformers, two intermediate ignition leads, and two high-tension leads.

Because turbine fuel must ignite reliably even in the low temperatures of high altitude, the system supplies a high voltage to arc across a wide igniter spark gap, giving high reliability across widely varying altitude, pressure, temperature, fuel vaporization, and input voltage conditions.

**Typical operating sequence:** A 24-volt DC input is supplied to the exciter unit through a noise filter. The low-voltage input operates a DC motor driving a multilobe cam and a single-lobe cam. Input power also feeds a set of breaker points actuated by the multilobe cam. The rapidly interrupted current from the breaker points is delivered to an auto transformer; when the breaker closes, current through the primary winding establishes a magnetic field, and when it opens, the collapsing field induces a voltage in the secondary, producing a pulse of current into a **storage capacitor** through a rectifier (which limits flow to one direction). With repeated pulses, the storage capacitor charges up to a maximum of approximately **4 joules**. When sufficiently charged, a contactor (normally open) is closed by the single-lobe cam; a portion of the charge flows through the primary of a **triggering transformer**, inducing a high voltage in the secondary that ionizes the gap at the spark igniter. Once the igniter is conductive, the storage capacitor discharges its remaining energy through the primary of the triggering transformer, producing the ignition spark. The high-frequency triggering transformer, with a low-reactance secondary, keeps discharge duration to a minimum, concentrating maximum energy in minimum time — an optimum spark capable of blasting away carbon deposits and vaporizing fuel globules.

All high voltage in the triggering circuits is completely isolated from the primary circuits, and the complete exciter is **hermetically sealed**. This protects components from adverse conditions, eliminates the possibility of flashover at altitude due to pressure change, and shields against leakage of high-frequency voltage that could interfere with the aircraft's radio reception.

Each discharge circuit incorporates **two storage capacitors**, both in the exciter unit; their voltage is stepped up by transformer units. At the instant of igniter plug firing, gap resistance lowers enough to allow the larger capacitor to discharge across the gap; the second capacitor's discharge is low-voltage but very high energy, producing a spark of great heat intensity — capable of igniting abnormal fuel mixtures and burning away foreign deposits on the plug electrodes. A continuous series of sparks is produced until the engine starts, after which power is cut off (the plugs do not fire except during continuous ignition for certain flight conditions) — which is why exciters are air cooled, to prevent overheating during long continuous-ignition use.

## Igniter Plugs

The igniter plug of a turbine ignition system differs considerably from a reciprocating engine's spark plug. Its electrode must withstand a much higher energy current, which can quickly cause electrode erosion — though the short periods of operation minimize this. The electrode gap of a typical igniter plug is designed **much larger** than a spark plug's, since operating pressures are much lower and the spark can arc more easily. Electrode fouling, common in spark plugs, is minimized by the heat of the high-intensity spark.

Two main igniter plug designs are used:

- **Annular-gap igniter** (also called a **long-reach igniter**) — projects slightly into the combustion chamber liner to produce a more effective spark.
- **Constrained-gap plug** — operates at a much cooler temperature because it does not project into the combustion chamber liner; the spark does not remain close to the plug but arcs beyond the face of the liner.

Igniter plug gap types include high-voltage air surface gap, high-voltage surface gap, high-voltage recessed surface gap, and low-voltage shunted surface gap. During inspection, the firing end of **high-voltage** igniters can be cleaned to aid inspection; deposits or residue must **not** be removed from the firing end of **low-voltage** igniters.

## Inspection and Maintenance

Inspection of the ignition system normally includes:
- Ignition lead terminal inspection — the ceramic terminal should be free of arcing, carbon tracking, and cracks.
- The grommet seal should be free of flashover and carbon tracking.
- Wire insulation should remain flexible with no evidence of arcing through the insulation.
- Inspection of the complete system for security of component mounting, shorts or high-voltage arcing, and loose connections.

The igniter can be checked by listening for a **snapping noise** as the engine begins to turn, driven by the starter, or by removing it and activating the start cycle to observe the spark across the gap.

## Maintenance Safety

Residual high voltage and current in the ignition exciter can be present, and injury or death may occur if it is released into the human body — the most likely way for accidental discharge is by touching the igniter. Standard procedure for igniter maintenance:

1. Disconnect the low-voltage primary lead from the ignition exciter unit **first**, and wait **at least one minute** to permit stored energy to dissipate before disconnecting the high-voltage cable from the igniter.
2. Use **insulated tools**; coupling nuts or connectors should not be touched with bare hands.
3. Always follow the manufacturer's procedures when working on a turbine engine ignition system.

Any electrical charge remaining stored in the ignition leads should be discharged by grounding before the leads are removed from the engine.
        $cnt$,
        13
    ) RETURNING id INTO s13_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 15.14: Engine Indication Systems
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m15_id, 'M15.14', 'Engine Indication Systems',
        $cnt2$
# Engine Indication Systems

## Exhaust Gas Temperature Indication

**Exhaust gas temperature (EGT)**, **turbine inlet temperature (TIT)**, **turbine gas temperature (TGT)**, **interstage turbine temperature (ITT)**, and **turbine outlet temperature (TOT)** are all relative temperatures used to monitor the temperature of the exhaust gases entering the **first stage turbine inlet guide vanes**. Although each is taken at a different location (each engine having one such location), all are relative to the temperature of the gases entering the first stage turbine inlet guide vanes — the most critical of all engine variables, since it is an engine operating limit used to monitor the mechanical integrity of the turbines and check engine operating conditions.

It is impractical to measure turbine inlet temperature directly in most engines, especially large ones. Consequently, temperature thermocouples are inserted at the turbine discharge, where — although the temperature is much lower than at the inlet — it still provides surveillance over the engine's internal operating conditions. Several thermocouples are spaced at intervals around the perimeter of the engine exhaust duct near the turbine exit; the cockpit EGT indicator shows the **average temperature** measured by the individual thermocouples. Tiny thermocouple voltages are typically amplified and used to energize a servomotor that drives the indicator pointer, with a digital drum indication commonly geared off the pointer motion.

A typical hermetically sealed EGT indicator has a scale from **0 °C to 1,200 °C**, with a vernier dial and a power-off warning flag.

**Dual thermocouples**, containing two electrically independent junctions within a single probe, are also used: one set of parallel thermocouples transmits signals to the cockpit indicator, while the other set provides temperature signals to engine monitoring and control systems. Each circuit is electrically independent, providing dual system reliability.

A typical analog TIT indicating system contains a **bridge circuit**, a **chopper circuit**, a two-phase motor to drive the pointer, and a **feedback potentiometer**, along with a voltage reference circuit, an amplifier, a power-off flag, a power supply, and an **over-temperature warning light**. The feedback potentiometer provides a humming signal to stop the drive motor once the pointer reaches the correct position relative to the temperature signal. The over-temperature warning light illuminates when TIT reaches a predetermined limit; an external test switch allows the over-temperature warning lights for all engines to be tested at the same time by simulating an over-temperature signal in each indicator's temperature control bridge circuit.

## Engine Pressure Ratio (EPR) Indicator

The **EPR gauge** relates the power being developed by the engine and is considered a measure of the thrust being developed. It compares the engine turbine discharge pressure to the pressure of the ram air at the engine inlet — since it compares two pressures, it is a **differential pressure gauge**. It is instrumented by total pressure pickups in the engine inlet (**Pt2**) and in the turbine exhaust (**Pt7**). With adjustments for temperature, altitude, and other factors, the EPR gauge indicates the thrust being developed, and EPR is used to set power for takeoff on many aircraft types.

The EPR gauge is a remote-sensing instrument, receiving input from an EPR transmitter (which contains a bellows arrangement comparing the two pressures and converting the ratio into an electric signal) or, in digital systems, from a computer.

## Torquemeter (Turboprop Engines)

Less than **15 percent** of the thrust produced by a turboprop engine comes from propulsive jet thrust exiting the exhaust, so EPR is not used as a power indicator for turboprop engines. Turboprops are instead usually fitted with a **torquemeter**, measuring torque applied to a shaft turned by the gas generator and power turbines. The torquemeter can be operated by engine oil pressure metered through a valve controlled by a helical ring gear that moves in response to applied torque — this gear moves against a piston controlling the valve opening, making oil pressure proportional to the torque applied at the propeller shaft. A transducer is generally used to convert the oil pressure into an electrical signal for the flight deck instrument. The flight-deck readout is normally in **lb/ft of torque or percent horsepower**. The torquemeter is important because it is used to set power settings, and must be calibrated at intervals to assure its accuracy.

## Tachometer

Gas turbine engine speeds are measured by engine rpm — the rpm of each rotating spool (compressor/turbine combination) is measured. Most turbofan engines have two or more spools turning independently at different speeds. Tachometers are usually calibrated in **percent rpm** so different engine types can be compared on the same basis. Turbofan engines with two spools (high-pressure and low-pressure) are generally referred to as **N1 and N2**, each with its own indicator. The main purpose of the tachometer is to monitor rpm under normal conditions, during engine start, and to indicate an overspeed condition.

Turbine engine tachometers are typically **electric or probe-type**:

- **Electric tachometer** — a small AC generator is mounted to the accessory drive section of the engine. As the engine turns, so does the generator, whose frequency output is directly proportional to engine speed. This is connected via wires to a synchronous motor in the indicator, which mirrors the output; a drag cup (or drag disk link) drives the indicator, as in a mechanical tachometer.
- **Probe-type (tacho probe)** — has the advantage of **no moving parts**. It is a sealed unit mounted on a flange, protruding into the compressor section. A magnetic field is set up inside the probe, extending through pole pieces and out the probe end. A rotating gear wheel, moving at the same speed as the compressor shaft, alters the magnetic field flux density as it passes the pole pieces at close proximity, generating voltage signals in coils inside the probe. The amplitude of these EMF signals varies directly with engine speed.

Tachometer probe output signals are processed in a remotely located module; they may be amplified to drive a servo-motor-type cockpit indicator, conditioned for digital display, or used as input for an automatic power control system or flight data acquisition system.

## Engine Oil Pressure Indicator

To guard against engine failure from inadequate lubrication and cooling, the oil supply to critical areas must be monitored. The oil pressure indicator usually shows the **engine oil pump discharge pressure**.

## Engine Oil Temperature Indicator

The ability of engine oil to lubricate and cool depends on its temperature as well as the quantity supplied. An oil inlet temperature indicator frequently shows the temperature of the oil as it enters the oil pressure pump; oil inlet temperature is also an indication of the proper operation of the engine oil cooler.

## Vibration Monitoring

Engine vibration indication is a secondary engine instrument parameter, indicating the amount of vibration measured on the low-pressure and/or high-pressure rotor. Vibration is displayed in **non-dimensional units** and is used for condition monitoring, identifying the affected engine after foreign object ingestion, and detecting fan unbalance due to icing; the level of vibration changes with engine speed. Vibration monitors in general **track rotor imbalance**. Modern engines equipped with vibration monitoring typically use **piezo-electric sensors** — a mass inside the sensor housing impinges on the piezo element, causing a current flow proportional to the vibration, which can be amplified and displayed via an analog ammeter-type gauge or digitized for display on an EICAS or ECAM display.

## Fuel-Flow Indicator

Fuel-flow instruments indicate fuel flow in **pounds per hour (lbs/hr)** from the engine fuel control — measured in lbs/hr rather than gallons because fuel weight is a major factor in the aerodynamics of large turbine aircraft. Fuel flow indication is of interest in monitoring fuel **consumption** and checking engine performance.

In most turbine aircraft installations, the fuel-flow indicating system consists of a transmitter and an indicator for each engine. The transmitter is mounted in the engine's accessory section and measures fuel flow between the engine-driven fuel pump and the fuel control device. It is an electrical device containing a turbine that turns faster as flow increases, increasing the electrical signal sent to the indicator on the flight deck (or on the test cell operator's panel).
        $cnt2$,
        14
    ) RETURNING id INTO s14_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M15.13 Starting and Ignition Systems (24 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s13_id, 'Once ignition and fuel have been introduced and light-off has occurred, the starter must continue to assist a gas turbine engine until it reaches:',
     '[{"id":"a","text":"Self-sustaining speed","correct":true},{"id":"b","text":"Maximum continuous rpm","correct":false},{"id":"c","text":"Flight idle rpm exactly","correct":false}]',
     '{"B1"}'),

    (s13_id, 'What is the consequence if starter assistance is cut off before the engine reaches self-accelerating speed?',
     '[{"id":"a","text":"The engine could fail to accelerate to idle speed, or even decelerate","correct":true},{"id":"b","text":"The engine would immediately overspeed","correct":false},{"id":"c","text":"There is no operational consequence","correct":false}]',
     '{"B1"}'),

    (s13_id, 'If the starter continues to assist the engine for too long after self-accelerating speed is reached, the likely result is:',
     '[{"id":"a","text":"A hot start, a hung (false) start, or a combination of both","correct":true},{"id":"b","text":"An immediate compressor stall only","correct":false},{"id":"c","text":"Improved fuel economy for the remainder of the flight","correct":false}]',
     '{"B1"}'),

    (s13_id, 'The three basic types of starters currently in use on gas turbine engines are:',
     '[{"id":"a","text":"DC electric motor, starter/generator, and air turbine starters","correct":true},{"id":"b","text":"Hydraulic, pneumatic impingement, and magneto starters","correct":false},{"id":"c","text":"Cartridge, jet-fuel, and steam turbine starters","correct":false}]',
     '{"B1"}'),

    (s13_id, 'In a cartridge/pneumatic starter, what is the function of the relief valve located before the hot gas nozzle?',
     '[{"id":"a","text":"It bypasses hot gas directly to the turbine, maintaining the hot gas circuit at an optimum pressure if the preset maximum is exceeded","correct":true},{"id":"b","text":"It ignites the cartridge when voltage is applied","correct":false},{"id":"c","text":"It regulates the flow of engine lubricating oil","correct":false}]',
     '{"B1"}'),

    (s13_id, 'Compared to a direct cranking electric starter, a starter/generator unit is distinguished by:',
     '[{"id":"a","text":"Being permanently engaged with the engine shaft, and switching to generator function after self-sustaining speed","correct":true},{"id":"b","text":"Requiring disengagement from the shaft after every start, the same as a direct cranking starter","correct":false},{"id":"c","text":"Using compressed air rather than electrical power to start the engine","correct":false}]',
     '{"B1"}'),

    (s13_id, 'A starter/generator has four field windings. Which windings are used while the unit is acting as a starter?',
     '[{"id":"a","text":"The series (C) field, the compensating field, and the commutating winding","correct":true},{"id":"b","text":"The shunt field only","correct":false},{"id":"c","text":"All four windings equally, including the shunt field","correct":false}]',
     '{"B1"}'),

    (s13_id, 'The typical voltage and peak current required to operate a starter/generator as a starter are approximately:',
     '[{"id":"a","text":"24 volts and 1,500 peak amperes","correct":true},{"id":"b","text":"115 volts and 50 peak amperes","correct":false},{"id":"c","text":"12 volts and 300 peak amperes","correct":false}]',
     '{"B1"}'),

    (s13_id, 'In an undercurrent-controller starting circuit, what causes the undercurrent relay to open and halt the start sequence?',
     '[{"id":"a","text":"Motor current draw decreasing to less than 200 amps as the starter builds up speed","correct":true},{"id":"b","text":"The ignition relay overheating","correct":false},{"id":"c","text":"The battery cutout relay closing","correct":false}]',
     '{"B1"}'),

    (s13_id, 'Why does an undercurrent-controller starting circuit include a battery cutout relay that disconnects the battery during start?',
     '[{"id":"a","text":"Because the heavy current drain of the starter motor would otherwise damage the battery","correct":true},{"id":"b","text":"Because the battery is only needed after the engine reaches idle","correct":false},{"id":"c","text":"Because the battery supplies power exclusively to the ignition system","correct":false}]',
     '{"B1"}'),

    (s13_id, 'Compared to an electric starter capable of starting the same engine, a typical air turbine starter weighs approximately:',
     '[{"id":"a","text":"One-fourth to one-half as much, while developing considerably more torque","correct":true},{"id":"b","text":"Two to three times as much, but develops less torque","correct":false},{"id":"c","text":"The same amount, with identical torque output","correct":false}]',
     '{"B1"}'),

    (s13_id, 'When starting an engine with an air turbine starter, duct air pressure should be at least approximately:',
     '[{"id":"a","text":"30 psi","correct":true},{"id":"b","text":"5 psi","correct":false},{"id":"c","text":"150 psi","correct":false}]',
     '{"B1"}'),

    (s13_id, 'In an air turbine starter, the sprag clutch disengages when:',
     '[{"id":"a","text":"The drive coupling begins turning more rapidly than the rotor side, i.e. once the engine has accelerated past starter speed","correct":true},{"id":"b","text":"The starter switch is first turned on","correct":false},{"id":"c","text":"Duct air pressure drops below 5 psi","correct":false}]',
     '{"B1"}'),

    (s13_id, 'The purpose of the rotor containment ring in an air turbine starter''s turbine housing is to:',
     '[{"id":"a","text":"Dissipate the energy of blade fragments and direct their discharge at low energy through the exhaust duct in the event of rotor failure","correct":true},{"id":"b","text":"Increase the rotational speed of the turbine rotor","correct":false},{"id":"c","text":"Filter incoming air before it reaches the nozzle vanes","correct":false}]',
     '{"B1"}'),

    (s13_id, 'The lubricating oil used in an air turbine starter is:',
     '[{"id":"a","text":"Turbine oil, the same as the engine, but it does not circulate through the engine","correct":true},{"id":"b","text":"Hydraulic fluid shared with the aircraft''s hydraulic system","correct":false},{"id":"c","text":"Engine oil that circulates directly through the engine oil system","correct":false}]',
     '{"B1"}'),

    (s13_id, 'Unlike a reciprocating engine ignition system, a turbine engine ignition system:',
     '[{"id":"a","text":"Does not need to be timed to spark at an exact point in the operating cycle","correct":true},{"id":"b","text":"Must fire continuously throughout every phase of engine operation","correct":false},{"id":"c","text":"Requires magneto-driven ignition timed to compressor rpm","correct":false}]',
     '{"B1"}'),

    (s13_id, 'Continuous ignition, operated at a lower voltage and energy level than starting ignition, is typically used during:',
     '[{"id":"a","text":"Takeoff, landing, and certain abnormal or emergency conditions","correct":true},{"id":"b","text":"Normal cruise flight only","correct":false},{"id":"c","text":"Engine shutdown on the ground only","correct":false}]',
     '{"B1"}'),

    (s13_id, 'A typical capacitor-type turbine ignition system, as a safety factor, is designed as a dual system that:',
     '[{"id":"a","text":"Fires two igniter plugs via two independent exciter units, transformers, and leads","correct":true},{"id":"b","text":"Uses a single igniter plug fired by two redundant power sources","correct":false},{"id":"c","text":"Fires four igniter plugs simultaneously for redundancy","correct":false}]',
     '{"B1"}'),

    (s13_id, 'In a capacitor-discharge ignition exciter, the storage capacitor typically charges up to a maximum of approximately:',
     '[{"id":"a","text":"4 joules","correct":true},{"id":"b","text":"400 joules","correct":false},{"id":"c","text":"0.04 joules","correct":false}]',
     '{"B1"}'),

    (s13_id, 'Why is the complete ignition exciter unit hermetically sealed?',
     '[{"id":"a","text":"To protect components from adverse conditions, eliminate flashover at altitude due to pressure change, and shield against interference with aircraft radio reception","correct":true},{"id":"b","text":"To reduce the overall weight of the exciter unit","correct":false},{"id":"c","text":"To allow the exciter to be submerged in engine oil for cooling","correct":false}]',
     '{"B1"}'),

    (s13_id, 'Compared with a spark plug in a reciprocating engine, the electrode gap of a typical turbine igniter plug is:',
     '[{"id":"a","text":"Much larger, since operating pressures are lower and the spark can arc more easily","correct":true},{"id":"b","text":"Much smaller, to concentrate the spark energy","correct":false},{"id":"c","text":"Identical in size to a reciprocating engine spark plug","correct":false}]',
     '{"B1"}'),

    (s13_id, 'The annular-gap (long-reach) igniter plug is designed to:',
     '[{"id":"a","text":"Project slightly into the combustion chamber liner to produce a more effective spark","correct":true},{"id":"b","text":"Remain fully recessed outside the combustion chamber liner at all times","correct":false},{"id":"c","text":"Operate only with low-voltage shunted surface gaps","correct":false}]',
     '{"B1"}'),

    (s13_id, 'Before disconnecting the high-voltage cable from a turbine engine igniter, standard safety procedure requires that a technician first:',
     '[{"id":"a","text":"Disconnect the low-voltage primary lead from the exciter unit and wait at least one minute for stored energy to dissipate","correct":true},{"id":"b","text":"Apply full engine power to bleed off residual voltage","correct":false},{"id":"c","text":"Ground the aircraft battery only, with no waiting period required","correct":false}]',
     '{"B1"}'),

    (s13_id, 'A quick functional check of a turbine igniter can be made by:',
     '[{"id":"a","text":"Listening for a snapping noise as the engine begins to turn, driven by the starter","correct":true},{"id":"b","text":"Measuring compressor discharge pressure during shutdown","correct":false},{"id":"c","text":"Checking exhaust gas temperature at flight idle only","correct":false}]',
     '{"B1"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M15.14 Engine Indication Systems (14 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s14_id, 'EGT, TIT, TGT, ITT, and TOT are all relative temperatures used to monitor the temperature of the exhaust gases entering:',
     '[{"id":"a","text":"The first stage turbine inlet guide vanes","correct":true},{"id":"b","text":"The compressor inlet","correct":false},{"id":"c","text":"The combustion chamber fuel nozzles","correct":false}]',
     '{"B1"}'),

    (s14_id, 'Why are turbine temperature thermocouples typically inserted at the turbine discharge rather than at the turbine inlet?',
     '[{"id":"a","text":"Because it is impractical to measure turbine inlet temperature directly in most, especially large, engines","correct":true},{"id":"b","text":"Because turbine discharge temperature is a completely unrelated parameter","correct":false},{"id":"c","text":"Because regulations prohibit sensors at the turbine inlet","correct":false}]',
     '{"B1"}'),

    (s14_id, 'The cockpit EGT indicator displays:',
     '[{"id":"a","text":"The average temperature measured by several thermocouples spaced around the exhaust duct perimeter","correct":true},{"id":"b","text":"The single highest reading from one thermocouple only","correct":false},{"id":"c","text":"A calculated compressor inlet temperature","correct":false}]',
     '{"B1"}'),

    (s14_id, 'A dual-thermocouple turbine temperature probe provides two electrically independent junctions so that:',
     '[{"id":"a","text":"One set of parallel thermocouples feeds the cockpit indicator while the other feeds engine monitoring/control systems, giving dual reliability","correct":true},{"id":"b","text":"One junction measures EGT and the other measures EPR","correct":false},{"id":"c","text":"Both junctions feed the same single circuit for redundancy of wiring only","correct":false}]',
     '{"B1"}'),

    (s14_id, 'In a typical analog turbine inlet temperature (TIT) indicating system, the feedback potentiometer''s function is to:',
     '[{"id":"a","text":"Provide a signal that stops the drive motor once the pointer reaches the position corresponding to the temperature signal","correct":true},{"id":"b","text":"Regulate fuel flow to the combustor","correct":false},{"id":"c","text":"Convert AC power to DC for the exciter unit","correct":false}]',
     '{"B1"}'),

    (s14_id, 'On a multi-engine aircraft, the over-temperature warning lights for all engines can typically be tested together by:',
     '[{"id":"a","text":"Operating an external test switch that simulates an over-temperature signal in each indicator''s bridge circuit","correct":true},{"id":"b","text":"Running each engine individually to its over-temperature limit","correct":false},{"id":"c","text":"Disconnecting the thermocouples one at a time","correct":false}]',
     '{"B1"}'),

    (s14_id, 'The Engine Pressure Ratio (EPR) gauge is classified as a differential pressure gauge because it compares:',
     '[{"id":"a","text":"Engine turbine discharge pressure to the pressure of the ram air at the engine inlet","correct":true},{"id":"b","text":"Fuel pressure to oil pressure","correct":false},{"id":"c","text":"Cabin pressure to ambient outside pressure","correct":false}]',
     '{"B1"}'),

    (s14_id, 'EPR is instrumented using total pressure pickups located at:',
     '[{"id":"a","text":"The engine inlet (Pt2) and the turbine exhaust (Pt7)","correct":true},{"id":"b","text":"The fuel control unit and the oil pump inlet","correct":false},{"id":"c","text":"The compressor bleed port only","correct":false}]',
     '{"B1"}'),

    (s14_id, 'Why is EPR generally not used to indicate the power produced by a turboprop engine?',
     '[{"id":"a","text":"Because less than 15 percent of a turboprop''s thrust comes from jet thrust exiting the exhaust","correct":true},{"id":"b","text":"Because turboprop engines do not produce measurable exhaust pressure","correct":false},{"id":"c","text":"Because turboprops have no turbine section to measure pressure across","correct":false}]',
     '{"B1"}'),

    (s14_id, 'A turboprop torquemeter operated by engine oil pressure derives its reading from:',
     '[{"id":"a","text":"Oil pressure metered through a valve controlled by a helical ring gear that moves in response to applied torque","correct":true},{"id":"b","text":"A direct strain-gauge measurement bonded to the propeller blades","correct":false},{"id":"c","text":"The difference between EPR and EGT readings","correct":false}]',
     '{"B1"}'),

    (s14_id, 'Turbine engine tachometers are usually calibrated in percent rpm, with N1 and N2 designations referring to:',
     '[{"id":"a","text":"The rotational speeds of the low-pressure and high-pressure spools respectively","correct":true},{"id":"b","text":"The number of igniter plugs fitted to each engine","correct":false},{"id":"c","text":"The first and second stages of the fuel control unit","correct":false}]',
     '{"B1"}'),

    (s14_id, 'A probe-type (tacho probe) rpm sensor has the key advantage of:',
     '[{"id":"a","text":"Having no moving parts, since a rotating gear wheel alters magnetic flux density to generate a voltage signal","correct":true},{"id":"b","text":"Being significantly cheaper than an electric AC generator tachometer","correct":false},{"id":"c","text":"Requiring no electrical connection to the cockpit indicator","correct":false}]',
     '{"B1"}'),

    (s14_id, 'Turbine engine vibration monitors, displayed in non-dimensional units, are generally used to track:',
     '[{"id":"a","text":"Rotor imbalance","correct":true},{"id":"b","text":"Fuel flow fluctuation","correct":false},{"id":"c","text":"Oil pump discharge pressure ripple","correct":false}]',
     '{"B1"}'),

    (s14_id, 'Turbine engine fuel flow is measured and indicated in pounds per hour rather than gallons per hour primarily because:',
     '[{"id":"a","text":"Fuel weight is a major factor in the aerodynamics of large turbine aircraft","correct":true},{"id":"b","text":"Gallons cannot be measured electrically","correct":false},{"id":"c","text":"Pounds per hour is required for EPR calculation only","correct":false}]',
     '{"B1"}');

END $$;
