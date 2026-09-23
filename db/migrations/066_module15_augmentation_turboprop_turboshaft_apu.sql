-- Module 15: Gas Turbine Engine (B1) — Power Augmentation Systems, Turbo-prop Engines, Turbo-shaft Engines, Auxiliary Power Units (APUs)
-- Source: EASA Part-66 Module 15 official textbook (IKAROS Aviation Training Centre)

DO $$
DECLARE
    m15_id INT;
    s15_id INT;
    s16_id INT;
    s17_id INT;
    s18_id INT;
BEGIN
    SELECT id INTO m15_id FROM easa_modules WHERE code = 'M15';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M15.15') THEN
        RAISE NOTICE 'M15.15-M15.18 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 15.15: Power Augmentation Systems
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m15_id, 'M15.15', 'Power Augmentation Systems',
        $cnt$
# Power Augmentation Systems

## After Burning / Thrust Augmentation

Some low-bypass turbofan engines are used in speed ranges above **0.8 Mach** (military aircraft). These engines use augmenters or afterburners to increase thrust. By adding more fuel nozzles and a flame holder in the exhaust system, extra fuel can be sprayed and burned, giving large increases in thrust for short amounts of time.

The terms **after burning** and **thrust augmentation** generally pertain to military engine applications and are used to describe the same system. Normally, this is used to increase the thrust of the engine up to **double the original thrust**.

The required additions to the exhaust nozzle for this system are:
- A **flame stabilizer**
- A **fuel manifold**
- A **flame holder**
- An **igniter**
- A **variable area exhaust nozzle**

After the engine has reached full power under normal operation, the power lever can be advanced to activate the afterburner. This allows more fuel to flow into the exhaust nozzle where it is ignited and burned. As energy and mass are added to the gas flow, the exhaust nozzle must **open wider** to allow greater flow. As the power lever is moved back out of the afterburner, the exhaust nozzle closes down again.

Some low-bypass turbofan engines used in military aircraft use bypass (fan air) to flow into the exhaust nozzle. Just as in a ducted fan, this air is used in the afterburner — it contains more oxygen and assists combustion in the afterburner.

Since fuel is being burned in the exhaust nozzle, heat buildup around the nozzle is a problem. A special type of liner is used around the nozzle to allow cooler air to circulate around it. This operates somewhat like a single burner can combustion chamber.

Operation in the afterburner mode is limited by **high fuel consumption**, which can be almost double normal consumption. The two principal problems related to afterburner systems are therefore: **extreme heat in the exhaust ducts** and **very high fuel flow rates**.

## Water Injection System

Before high-bypass turbofan engines, some older types of engines used **water injection** to increase thrust for takeoff (a "wet" rating). This is the maximum allowable thrust for takeoff. The rating is obtained by actuating the water-injection system and setting the computed wet thrust with the throttle, in terms of a predetermined turbine discharge pressure or engine pressure ratio for the prevailing ambient conditions.

The water injection rating is:
- Restricted to **takeoff**
- **Time-limited**
- Subject to an **altitude limitation**

Water injection is not used very much on turbine engines any more, and is **not normally used on high-bypass turbofan engines**.

On warm days, thrust is reduced because of the decrease in air density. This can be compensated for by **injecting water at the compressor inlet or diffuser case**. This lowers the air temperature and increases air density. A microswitch in the fuel control is actuated by the control shaft when the power lever is moved toward the maximum power position.

### Water Injection Speed Reset Servo

A **water injection speed reset servo** resets the speed adjustment to a higher value during water injection. Without this adjustment, the fuel control would decrease rpm so that no additional thrust would be realized during water injection.

The servo is a **shuttle valve** acted upon by water pressure during water injection. Movement of the servo displaces a lever on the cam-operated lever linkage to the speed governor speeder spring, increasing the force of the speeder spring and increasing the set speed. Because the resulting rpm is usually higher while water is flowing, increased thrust during water injection is ensured.

If the water injection system is not armed in the cockpit, or if there is no water available, nothing happens when the water injection switch in the fuel control unit is actuated. When water is available, a portion of it is directed to the water injection speed reset servo.

### Water Methanol

Some water injection systems use a **water methanol mixture**:
- The **methanol acts as an anti-freeze** for the water while it is in the storage reservoir
- Methanol also **burns in the engine combustion chamber**, thus contributing to the production of thrust
        $cnt$,
        15
    ) RETURNING id INTO s15_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 15.16: Turbo-prop Engines
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m15_id, 'M15.16', 'Turbo-prop Engines',
        $cnt2$
# Turbo-prop Engines

## Overview

The turboprop (turbo-propeller) engine is a combination of a gas turbine engine, reduction gear box, and a propeller. Turboprops are basically gas turbine engines that have a compressor, combustion chamber(s), turbine, and an exhaust nozzle (gas generator), all of which operate in the same manner as any other gas turbine engine. The difference is that the turbine in the turboprop engine usually has **extra stages** to extract energy to drive the propeller.

## Gear Coupled/Fixed Turbine and Free Turbine

There are two types of multiple-stage turbine configurations in turboprop engines:

- **Gear coupled / fixed turbine** — all turbine stages are connected to a single shaft. This shaft not only turns the engine compressor but also turns the propeller through a gear reduction gearbox. Example: the **Garrett TPE331** turboprop.
- **Free turbine** — the turbine stages are connected to two completely independent shafts. One shaft turns the engine compressor. The second shaft turns the propeller through a reduction gearbox, driven by gas pressure developed by the turbine section. Example: the **Pratt & Whitney PT6** engine.

Although three turbines are typical, as many as **five turbine stages** have been used for driving the two rotor elements, propeller, and accessories. Both configurations have been used successfully in turboprop engine design.

Turboprop engines are used for many single, twin, and commuter aircraft. Smaller turboprop engines, such as the PT-6, are used on single and twin engine designs, with power ranging from **500 to 2,000 shaft horsepower**. Larger commuter aircraft use turboprop engines such as the P&W 150 and AE2100, which can deliver up to **5,000 shaft horsepower**.

## Turboprop Controls

The turboprop fuel control and the propeller governor are connected and operate in coordination with each other. The power lever directs a signal from the cockpit to the fuel control for a specific amount of power from the engine. The fuel control and the propeller governor together establish the correct combination of **rpm, fuel flow, and propeller blade angle** to create sufficient propeller thrust to provide the desired power.

The propeller control system is divided into two types of control: one for **flight** and one for **ground operation**.

- **Flight (alpha range)**: propeller blade angle and fuel flow for any given power lever setting are governed automatically according to a predetermined schedule.
- **Ground handling (beta range)**: below the "flight idle" power lever position, the coordinated rpm/blade angle schedule becomes incapable of handling the engine efficiently. In the beta range, propeller blade angle is **not governed by the propeller governor**, but is controlled directly by the **power lever position**. When the power lever is moved below the start position, the propeller pitch is reversed to provide reverse thrust for rapid deceleration of the aircraft after landing.

A characteristic of the turboprop is that **changes in power are not related to engine speed, but to turbine inlet temperature**. During flight, the propeller maintains a **constant engine speed** — known as the **100 percent rated speed** of the engine, the design speed at which most power and best overall efficiency can be obtained.

Power changes are effected by changing fuel flow: an increase in fuel flow causes an increase in turbine inlet temperature and a corresponding increase in energy available at the turbine. The turbine absorbs more energy and transmits it to the propeller in the form of torque. The propeller, in order to absorb the increased torque, **increases blade angle**, thus maintaining constant engine rpm with added thrust.

## Reduction Gear Assembly

The function of the reduction gear assembly is to reduce the high rpm from the engine to a propeller rpm that can be maintained **without exceeding the maximum propeller tip speed (speed of sound)**. Most reduction gear assemblies use a **planetary gear reduction**.

Additional power takeoffs are available for the propeller governor, oil pump, and other accessories. A **propeller brake** is often incorporated into the gearbox, designed to:
- Prevent the propeller from **windmilling** when it is feathered in flight
- Decrease the time for the propeller to come to a complete stop after engine shutdown (i.e. it operates only when the engine has been shut down/turned off)

## Turbo-Propeller Assembly

The turbo-propeller provides an efficient and flexible means of using the power of the engine at any condition in flight (**alpha range**). For ground handling and reversing (**beta range**), the propeller can be operated to provide either zero or negative thrust.

The major subassemblies of the propeller assembly are: the barrel, dome, low-pitch stop assembly, over speed governor, pitch control unit, auxiliary pump, feather and unfeather valves, torque motor, spinner, deice timer, beta feedback assembly, and propeller electronic control.

Modern turboprop engines use dual **Full Authority Digital Engine Control (FADEC)** to control both engine and propeller. The **spinner assembly** is a cone-shaped configuration that mounts on the propeller and encloses the dome and barrel to reduce drag.

The **synchrophasing system** is designed to maintain a preset angular relationship between the designated master propeller and the slave propellers. Propeller operation is controlled by a mechanical linkage from the cockpit-mounted power lever and the emergency engine shutdown handle (if provided) to the coordinator, which in turn is linked to the propeller control input lever. Newer designs use electronic throttle control linked to the FADEC controller.

Turbo-propeller control assemblies have a **feathering system** that feathers the propeller **when the engine is shut down in flight**. The propeller can also be unfeathered during flight, if the engine needs to be started again. Propeller control systems for large turboprop engines differ from smaller engines because they are **dual acting** — hydraulic pressure is used to both increase and decrease propeller blade angle.

## Over Speed Safety Devices

**Over speed** is the condition in which the actual engine speed is higher than the desired engine speed set on the propeller control by the pilot.

An **over speed governor** is a backup for the propeller governor and is mounted on the reduction gearbox. It has its own flyweights and pilot valve, and it releases oil from the propeller whenever the propeller rpm exceeds a preset limit above 100%. Releasing the oil allows the blades to move to a **higher pitch angle**, which reduces the rpm.

The over speed governor is **adjusted when installed and cannot be adjusted in flight** — there are no cockpit controls for it.
        $cnt2$,
        16
    ) RETURNING id INTO s16_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 15.17: Turbo-shaft Engines
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m15_id, 'M15.17', 'Turbo-shaft Engines',
        $cnt3$
# Turbo-shaft Engines

## Overview

A turboshaft engine is optimized to produce **shaft power** rather than jet thrust. In concept, turboshaft engines are very similar to turboprops, with a basic single engine design provided in both forms. Turboshaft engines come in many different styles, shapes, and horsepower ranges.

The output shaft may be **coupled directly to the engine turbine**, or the shaft may be **driven by a turbine of its own (free turbine)** located in the exhaust stream — the free turbine rotates independently. This principle is used extensively in current production of turboshaft engines. The turboshaft engine's output is measured in **horsepower** instead of thrust because the power output is a turning shaft.

A turboshaft engine may be made up of two major part assemblies:
- The **gas generator** — consists of the compressor, combustion chambers with igniters and fuel nozzles, and one or more stages of turbine
- The **power section** — consists of additional stages of turbines, a gear reduction system, and the shaft output

The gas generator creates the hot expanding gases to drive the power section. Depending on the design, engine accessories may be driven either by the gas generator or by the power section.

Turboshaft engines are commonly used in applications that require a sustained high power output, high reliability, small size, and light weight. In aviation, these include **helicopters** and **auxiliary power units (APUs)**. Basic arrangements are similar to turboprops except the drive systems are more elaborate — for example, over-running clutches allow for autorotation in case of power loss. Additionally, twin helicopters drive a single transmission with clutches allowing for single engine operation if required.

## Reduction Gearing

About **two thirds** of the energy produced by a helicopter turboshaft engine is used to operate the gas generator. The remaining **one third** is extracted to drive the high ratio reduction gearbox, which in a helicopter is called a **transmission**.

Helicopter rotors tend to rotate at only **300–400 rpm**. This is the reduction from approximately **35,000 rpm** of the turbine shaft.

## Couplings and Drive Systems

Most turbine helicopters make use of a **short shaft system** to deliver power to the transmission. These short shafts vary in design, but all have some way to correct for misalignment and for movement of the transmission. Some of these shafts operate with no lubrication, while others require it — usually in the form of grease, often hand packed.

The **drive shaft** consists of a shaft with two flexible couplings attached at each end. The shaft turns at high speed (**6,000 to 30,000 rpm**), so balance is important. The drive shaft itself must also be provided with flexibility for the deflection caused by transmission movements, but will not carry any tension or compression loads because of the housing. The flexible coupling allows for small movements between the engine(s) and the transmission.

A **freewheeling unit or over-running clutch** is located somewhere between the engine and the main rotor shaft to allow for **autorotation** without the rotor driving the engine — a seizure of the engine could otherwise prevent autorotation. A **spray clutch** is commonly used on the engine output shaft for this purpose, and engages at **zero rpm** (i.e. in the event of an engine seizure).

## Control Systems

Power control of a helicopter engine is regulated via a **hand throttle (twist grip)** built into the side collective stick. The collective stick, when raised, increases the angle of attack of all rotor blades at the same time. As this increases drag, the rotor assembly will tend to slow. The fuel system increases engine power to match the load change at the main rotor through the use of a **flyweight-controlled free turbine governor**, which modulates the flow of fuel to the combustion section of the engine.

On some turbine engine helicopters, the twist grip arrangement has been eliminated in favour of a **power lever** for the free turbine. The **N1** usually has three positions: **ground idle, flight idle, and full N1**. The N1 system will speed up and slow down as a function of **N2**, so a steady rotor rpm may be maintained during all flight conditions.

Like fuel controls for turbojet and turbofan engines, the fuel control for a turboshaft engine receives a signal from the pilot for a given level of power. The control then takes certain variables into consideration and adjusts engine fuel flow to provide the desired power **without exceeding the rpm and turbine inlet temperature limitations** of the engine.

The power plant is controlled **between ground and flight idle by the throttle twist grip**. Between flight idle power and maximum power, control is **automatic by the free turbine governor**.

Modern turboshaft helicopter engines have **electronic engine controls (EEC)** and **FADEC**-controlled engines.
        $cnt3$,
        17
    ) RETURNING id INTO s17_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 15.18: Auxiliary Power Units (APUs)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m15_id, 'M15.18', 'Auxiliary Power Units (APUs)',
        $cnt4$
# Auxiliary Power Units (APUs)

## Overview

Auxiliary Power Units, or APUs, are self-contained turbo-shaft engines in the **55 to 350 SHP (shaft horse power)** range. Categorized as either **ground or in-flight certified**, they are used to provide pneumatic and electrical power to aircraft systems. Installed in almost all modern turbine aircraft, they are primarily used during:

- Main engine starting
- Main engines not operating
- In-flight emergencies
- Ground power support not available
- Main engine de-loading of bleed air demands

APUs were originally developed for the electrical requirements of large reciprocating and early turbojet powered aircraft, which used GPU (ground power unit) carts with a piston engine and a direct drive generator to provide electrical energy to the main engine's starter motor. As larger engines required more torque (and so more electrical energy), turbo-shaft engines eventually replaced the piston engines on GPU carts — but the aircraft were still tied to their availability at every airport. It thus made sense to install APUs in the aircraft to provide operating flexibility, increase the margin for flight safety as a built-in back-up for the main engine generators, and improve passenger comfort by using APU pneumatic power to run air conditioning on the ground.

## Construction

Most APUs share a common construction divided into three main sections: **intake/compression**, **combustion/turbine**, and **gear box**.

### Intake and Compression

The inlet or plenum consists of ducting from an intake door or scoop on the top or side of the fuselage. Before intake air passes into the APU's compressor, it first passes down the plenum through a **FOD and ice screen** — important because, as a primarily ground-operating engine, the APU would otherwise be very prone to FOD damage from ramp debris.

Most APUs use a **centrifugal impeller/radial diffuser** combination, in one or two stages, to compress intake air for engine operation and airframe system use. The centrifugal configuration is favoured because it:
- Creates a larger pressure rise per stage
- Creates a smaller engine area
- Is more **FOD and surge/stall resistant** than axial flow compressors

Some engines use a **power compressor** for engine operation and a separate **load compressor** to create bleed air; others use a single entry double-sided compressor to perform both functions with one unit. An electrically operated butterfly valve, the **load control valve**, controls the amount of compressed air delivered to the aircraft's pneumatic manifold. As an example figure quoted in the source material, one APU engine (Honeywell GTCP 131) can offer air at a pressure of **52 PSI (3.5 Bar)** at a flow rate of up to **154 lbs. (70 Kg) per minute**.

Surge and stall prevention in the compressor is often accomplished through **IGVs (inlet guide vanes)**, which de-turbulate the inlet airflow, or **surge valves**, which bleed off compressor pressure should a surge/stall event become imminent.

### Combustion/Turbine

APUs use either a **can** or **annular** style combustor, depending on the type of turbine used:
- **Radial inflow turbines** (similar to a reciprocating engine turbocharger unit) are usually used with a **can type** combustor
- **Axial flow turbines** (like those in turbofan/turbojet engines) are often used with an **annular type** combustor

Although more efficient, **can-annular combustors are not typically used** on APUs due to maintenance and inspection concerns.

Single or dual turbine configurations are used:
- **Single turbine**: provides horsepower to rotate both the compressor and the gear box section
- **Dual turbine**: one turbine spins the compressor, the other powers the gear box and its attached accessories

The APU exhaust is carried overboard through stainless steel ducting located in the tail cone or side of the empennage. Cooling can also be accomplished by an **educator** — a convergent duct located around the APU exhaust, similar to an exhaust augmenter on some reciprocating engines, that creates a low pressure pulling airflow in and around the APU. Some modern APUs use corrugated perimeter exhaust silencers to reduce operating noise.

### Gear Box and Generator

The APU gearbox is normally located **opposite the combustion section**, with the intake and compressor section in the middle. It provides the drive input for the APU's **electric starter motor**, and uses shaft horsepower from the turbine to drive the engine's fuel pump, oil pump, and the APU's generator — of all the APU's power outputs, the **generator's electrical output is the most important** to aircraft operation.

The generator is commonly a **permanent magnet generator**, with an output of **30–90 KVA**, creating **115V three phase AC power at 400 Hz** to the aircraft's electrical bus. If DC voltage is required, an airframe-installed transformer rectifier creates **28V DC**. The APU's generator is almost always identical to the units on the main engines, both to deliver the same electrical output and to provide an on-aircraft spare for the main engine generator. A CSD (constant speed drive) or VSCF (variable speed constant frequency) converter is **not required** for APU generators because the engines are not throttleable and run at a **constant 90–100% RPM**.

In large rotor wing aircraft, the APU often provides a third power output in the form of **hydraulic pressure** from a multi-piston hydraulic pump on the gearbox, used to power a multi-piston hydraulic motor delivering start rpm to the main engine, transmission, and rotor head assembly. This can also be achieved by a hydraulic accumulator attached to the APU hydraulic pump; only hydraulics provide the power density needed for this start function, so bleed air and electric motors are not used for it.

## Installation

APU units are normally located in the **empennage** of the aircraft, either embedded in an accessory bay or suspended within the tail cone structure. Enclosures are commonly fabricated from **high temperature stainless steel** and perform several functions:
- Provide a sealed space for engine fire suppression and cooling airflow
- Reduce noise through sound absorbing materials
- Provide **ballistic containment** in case of catastrophic engine failure

Ballistic containment is a key factor in determining if an APU can be **in-flight certified** — an in-flight failure of an APU turbine or compressor, if not contained, could lead to further damage and failure of flight-critical systems, potentially resulting in loss of the aircraft.

## Engine Systems

APU engine systems are separated into four main categories: **fuel, oil, starting, and ignition** — very comparable to systems on other turbine engine designs. Typically, the same feed tank that supplies the main engines also provides fuel to the APU.

### Fuel System

Fuel first passes through an electrically operated shut-off valve for engine shutdown and fire suppression, then is delivered to the APU **fuel control unit (FCU)** — a simple high-capacity gear pump run by and attached to the APU gearbox. The FCU is the metering portion of a supervisory configuration controlled by the **Electronic Engine Control (EEC)**. The FCU and EEC can be consolidated into a **FADEC (full authority digital engine controller)** system that both meters fuel and controls the APU. The FCU almost always contains a metal mesh fuel filter with bypass capability, rated **7 to 10 microns**. Fuel is delivered to the combustion chamber through a flow divider and a duplex-style nozzle that atomizes it for ignition.

### Oil System

Most turbo-prop and larger turbo-shaft engine APUs utilize a **wet sump oil system**, with most oil system components and the oil supply contained in the gear box. Fuel and oil filter units are almost identical in construction, both using metal mesh elements with bypass capability. A gear-type pump provides oil pressure for cooling and lubricating the bearings, creating a constant **40 PSI** to the oil nozzles. Unlike most primary engine systems, APUs traditionally use an **air-to-fluid heat exchanger** to cool the oil, using intake air, ram air, or gearbox-mounted cooling fans.

### Starting and Ignition

APU starting rpm is provided by a **28V DC series starter unit**, usually powered by a designated 28V battery with a charging unit separate from the main aircraft batteries. The starter motor often contains a **centrifugal sprag type clutch** to disengage the unit from the gearbox at approximately **60% RPM**, once the engine becomes self-sustaining.

APU ignition systems consist of a **high energy capacitive discharge exciter**, a lead, and an igniter plug (surface gap type, discharge potential **5,000–8,000 Volts**). In a typical start sequence, ignition is engaged by the APU's EEC (normally at **10% RPM**) and disengaged at **95% RPM**.

APUs also have a separate automatic fire detection system and a manually discharged suppression system.

## APU Control

The APU is almost a fully automated unit — only **start, shutdown, and fire suppression discharge** are commanded by the flight or ground crew. The **EEC** (sometimes called the **APCU**, Auxiliary Power Control Unit) provides all control, monitoring, and management functions, using internal logic and data base memory.

The EEC has input connections to exhaust gas temperature thermocouple probes, oil/fuel/pneumatic pressure switches, and RPM sensing monopole/magnetic sensors. It handles all start and shutdowns as well as engine cooling. Cooling control is provided by an EEC input to the load control valve — if the engine is overheating, the EEC will restrict bleed flow to the aircraft, keeping it in the APU for secondary combustion cooling air. Electrical load output always has **priority over pneumatic extraction** from the engine.

If the EEC senses an over speed event (typically around **110% RPM**), it will close the fuel shut-off valve and shut down the engine. The same protective shutdown occurs if the EEC senses low oil pressure or an overheat event.

Because the EEC is computerized, it contains **BITE (Built in Test Equipment)** to record faults, self-troubleshoot, and monitor systems operation. BITE information is available through displays on the EEC unit, the **EICAS** (Engine Indicating and Crew Alerting System) display, or the aircraft's central maintenance computer.

The EEC/APCU is usually a standard **ARINC LRU (Line Replaceable Unit)** located in the airframe's avionics bay; two units are generally installed, one primary and one backup. Newer FADEC-equipped APU models have the EEC combined with the FCU in a common housing attached to the gearbox.

## Crew Control and Monitoring

Crew input to the APU is given through an **APU control panel** in the cockpit. Transport category aircraft often have a secondary control unit on the nose landing gear. Control is limited to the **APU master, start, and shutdown**. The APU master switch "ON/OFF" controls power to the APU EEC unit; once on, the EEC receives the start command and begins the sequence automatically, controlling the fuel, starter motor, and ignition unit.

The crew monitors the APU start sequence via **RPM and EGT gauges** on the panel, or the APU information page on EICAS. A remote operation panel, if installed, contains no monitoring devices — only start, shutdown, and fire discharge switching. Once the APU is running at full rpm, the generator is brought online via switching and relays; separate switching opens the load control valve to deliver pneumatic power for main engine starting, anti-icing, cabin pressurizing, water system pressurizing, and cabin cooling.

## Flight Certified APUs

An APU's usefulness increases dramatically when it is **in-flight certified**. Two of the largest differences between ground and in-flight APUs are **ballistic containment** and **ram air intake**. The ram air scoop delivers intake air to the APU and prevents performance degradation in the low air density environment of high altitude flight. In-flight APUs usually require a lower starting altitude (around **15,000 to 17,000 ft.**, to ensure enough primary/combustion and secondary/cooling air for start) but are then capable of operation up to **40,000 ft.** altitude.

**ETOPS** (Extended Twin Operational Performance) is a certification granted to twin engine aircraft that allows travel on routes much further from emergency landing fields than traditional routes, enabling more efficient long-range flight. One of the primary requirements to achieve ETOPS certification is the aircraft's possession of an **in-flight APU** — should an in-flight main engine shut down occur, the APU can shoulder the electrical and pneumatic load from the lost engine, increasing the margin of safety during single engine operation.

Depending on the ETOPS certification standards for a specific installation, the APU may be required to run continuously on an ETOPS route. Most modern installations, however, meet criteria for an **on-demand authorization**, allowing the APU to run only if a main engine shutdown occurs — saving fuel and reducing wear on the APU.

In-flight, APUs are often started during an aircraft's landing phase. This de-loads the main engine's pneumatic burden and allows the engine to keep compressor air available for reserve thrust, should an aborted landing or go-around emergency occur.

## Inspection and Servicing

All APU inspection, service, and maintenance must be performed in accordance with **OEM guidelines**. Most APU maintenance is performed **"on-condition,"** meaning as failure or faults deem necessary, with most inspections performed on an hourly basis. In-service time is tracked through operational hours using a Hobbs or hour meter.

APUs require several **cold and hot section inspections** prior to overhaul:
- A **cold section inspection** requires partial disassembly and visual examination of the compressor section and components. In-field repairs of most compressors are not permitted — the engine must be removed and returned to the **OEM** or an approved service center.
- A **hot section inspection** requires partial disassembly and visual examination of the turbine and combustion components, often using die penetrant and other non-destructive testing methods to locate cracking around burner welds and at turbine/compressor stress points. APU hot section components are time-limited and are often removed from the engine to provide an improved margin of safety, anywhere from **3,000 to 9,000 hours** of operation.

Servicing tasks include: starter motor brush, oil filter, and fuel filter changes; chip detector inspection; gear box oil changes; and spectrometric oil analysis, among others — all recorded in the APU logbook.

Because of their frequent use, it is not uncommon to remove an APU from the aircraft prior to the required hours. There are usually only limited connections to the aircraft — electrical, fuel, intake, and exhaust — making removal simple; depending on aircraft design, it is not unusual to remove an APU engine in **under 30 minutes**.
        $cnt4$,
        18
    ) RETURNING id INTO s18_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M15.15 Power Augmentation Systems (9 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s15_id, 'After burning / thrust augmentation systems are used on low-bypass turbofan engines mainly in military aircraft operating above approximately:',
     '[{"id":"a","text":"0.8 Mach","correct":true},{"id":"b","text":"0.4 Mach","correct":false},{"id":"c","text":"1.5 Mach","correct":false}]',
     '{"B1"}'),

    (s15_id, 'An afterburner increases the thrust of the engine, typically up to:',
     '[{"id":"a","text":"10% above the original thrust","correct":false},{"id":"b","text":"Double the original thrust","correct":true},{"id":"c","text":"Half the original thrust","correct":false}]',
     '{"B1"}'),

    (s15_id, 'The required additions to the exhaust nozzle for an afterburner system include a flame stabilizer, fuel manifold, igniter, and:',
     '[{"id":"a","text":"A variable area exhaust nozzle","correct":true},{"id":"b","text":"A second compressor stage","correct":false},{"id":"c","text":"A fixed-area convergent nozzle only","correct":false}]',
     '{"B1"}'),

    (s15_id, 'As the afterburner adds fuel energy and mass to the gas flow, the variable exhaust nozzle must:',
     '[{"id":"a","text":"Close down to increase back-pressure","correct":false},{"id":"b","text":"Open wider to allow greater flow","correct":true},{"id":"c","text":"Remain fixed regardless of flow changes","correct":false}]',
     '{"B1"}'),

    (s15_id, 'The two principal problems associated with afterburner operation are:',
     '[{"id":"a","text":"Extreme heat in the exhaust ducts and very high fuel flow rates","correct":true},{"id":"b","text":"Low oil pressure and reduced compressor efficiency","correct":false},{"id":"c","text":"Excessive vibration and reduced turbine inlet temperature","correct":false}]',
     '{"B1"}'),

    (s15_id, 'Water injection is used to increase thrust for takeoff primarily by:',
     '[{"id":"a","text":"Injecting water at the compressor inlet or diffuser case to lower air temperature and increase air density","correct":true},{"id":"b","text":"Injecting water directly into the turbine exducer only","correct":false},{"id":"c","text":"Replacing engine oil with a water-based coolant","correct":false}]',
     '{"B1"}'),

    (s15_id, 'The water injection rating ("wet" thrust) is:',
     '[{"id":"a","text":"Usable at any phase of flight without restriction","correct":false},{"id":"b","text":"Restricted to takeoff, time-limited, and subject to an altitude limitation","correct":true},{"id":"c","text":"Only usable above the tropopause","correct":false}]',
     '{"B1"}'),

    (s15_id, 'The purpose of the water injection speed reset servo is to:',
     '[{"id":"a","text":"Reset the speed adjustment to a higher value so the fuel control does not decrease rpm during water injection","correct":true},{"id":"b","text":"Shut off the water supply once maximum thrust is reached","correct":false},{"id":"c","text":"Reduce rpm to compensate for the added water mass flow","correct":false}]',
     '{"B1"}'),

    (s15_id, 'In a water methanol injection system, the methanol serves to:',
     '[{"id":"a","text":"Act as an anti-freeze for the water in the storage reservoir and also burn in the combustion chamber, contributing to thrust","correct":true},{"id":"b","text":"Lubricate the water injection pump only, with no combustion role","correct":false},{"id":"c","text":"Cool the exhaust nozzle liner exclusively","correct":false}]',
     '{"B1"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M15.16 Turbo-prop Engines (13 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s16_id, 'Compared with other gas turbine engines, the turbine in a turboprop engine usually has:',
     '[{"id":"a","text":"Extra stages, to extract energy to drive the propeller","correct":true},{"id":"b","text":"Fewer stages, to reduce weight for propeller drive","correct":false},{"id":"c","text":"No turbine at all — the propeller is driven directly by the compressor","correct":false}]',
     '{"B1"}'),

    (s16_id, 'In a gear coupled (fixed turbine) turboprop engine:',
     '[{"id":"a","text":"All turbine stages are connected to a single shaft that drives both the compressor and, via a reduction gearbox, the propeller","correct":true},{"id":"b","text":"The turbine stages are split across two fully independent shafts","correct":false},{"id":"c","text":"The propeller is driven directly with no reduction gearbox","correct":false}]',
     '{"B1"}'),

    (s16_id, 'In a free turbine turboprop engine such as the Pratt & Whitney PT6, the propeller is driven by:',
     '[{"id":"a","text":"A shaft mechanically common with the compressor shaft","correct":false},{"id":"b","text":"Gas pressure developed by the turbine section, via an independent power turbine shaft","correct":true},{"id":"c","text":"A belt drive from the accessory gearbox","correct":false}]',
     '{"B1"}'),

    (s16_id, 'The Garrett TPE331 is an example of a:',
     '[{"id":"a","text":"Free turbine turboprop engine","correct":false},{"id":"b","text":"Fixed (gear coupled) turbine turboprop engine","correct":true},{"id":"c","text":"Turboshaft engine only, never used as a turboprop","correct":false}]',
     '{"B1"}'),

    (s16_id, 'In the beta (ground handling) range of the throttle quadrant, propeller blade angle is:',
     '[{"id":"a","text":"Governed automatically by the propeller governor according to a schedule","correct":false},{"id":"b","text":"Controlled directly by the power lever position","correct":true},{"id":"c","text":"Fixed and cannot be changed until airborne","correct":false}]',
     '{"B1"}'),

    (s16_id, 'A key characteristic of the turboprop engine is that changes in power are related to:',
     '[{"id":"a","text":"Engine (compressor) speed alone","correct":false},{"id":"b","text":"Turbine inlet temperature, while engine speed remains constant","correct":true},{"id":"c","text":"Propeller blade angle alone, independent of fuel flow","correct":false}]',
     '{"B1"}'),

    (s16_id, 'During flight, the propeller maintains a constant engine speed known as the:',
     '[{"id":"a","text":"100 percent rated speed","correct":true},{"id":"b","text":"Flight idle speed","correct":false},{"id":"c","text":"Beta range speed","correct":false}]',
     '{"B1"}'),

    (s16_id, 'When fuel flow is increased on a turboprop engine, the propeller responds by:',
     '[{"id":"a","text":"Decreasing blade angle to reduce absorbed torque","correct":false},{"id":"b","text":"Increasing blade angle to absorb the increased torque, maintaining constant rpm","correct":true},{"id":"c","text":"Feathering automatically","correct":false}]',
     '{"B1"}'),

    (s16_id, 'The function of the reduction gear assembly on a turboprop engine is to:',
     '[{"id":"a","text":"Increase propeller rpm above engine rpm for better efficiency","correct":false},{"id":"b","text":"Reduce the high engine rpm to a propeller rpm that does not exceed the maximum propeller tip speed (speed of sound)","correct":true},{"id":"c","text":"Convert rotational energy into hydraulic pressure only","correct":false}]',
     '{"B1"}'),

    (s16_id, 'Most reduction gear assemblies on turboprop engines use what type of gear reduction?',
     '[{"id":"a","text":"Planetary gear reduction","correct":true},{"id":"b","text":"Worm gear reduction","correct":false},{"id":"c","text":"Bevel gear reduction only","correct":false}]',
     '{"B1"}'),

    (s16_id, 'A propeller brake incorporated into a turboprop reduction gearbox operates to:',
     '[{"id":"a","text":"Prevent windmilling when feathered in flight and decrease stopping time after engine shutdown","correct":true},{"id":"b","text":"Reverse propeller pitch during normal cruise flight","correct":false},{"id":"c","text":"Limit maximum rpm during the takeoff run","correct":false}]',
     '{"B1"}'),

    (s16_id, 'An over speed governor on a turboprop engine is mounted on the reduction gearbox and functions as:',
     '[{"id":"a","text":"A backup for the propeller governor, releasing oil to move blades to a higher pitch angle and reduce rpm when a preset limit above 100% is exceeded","correct":true},{"id":"b","text":"The primary means of setting cruise power","correct":false},{"id":"c","text":"A device adjustable from the cockpit during flight","correct":false}]',
     '{"B1"}'),

    (s16_id, 'The over speed governor on a turboprop engine:',
     '[{"id":"a","text":"Can be freely adjusted in flight via a cockpit control","correct":false},{"id":"b","text":"Is adjusted only when installed and has no cockpit controls for in-flight adjustment","correct":true},{"id":"c","text":"Is automatically recalibrated by the FADEC every flight cycle","correct":false}]',
     '{"B1"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M15.17 Turbo-shaft Engines (9 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s17_id, 'A turboshaft engine is optimized to produce:',
     '[{"id":"a","text":"Jet thrust rather than shaft power","correct":false},{"id":"b","text":"Shaft power rather than jet thrust","correct":true},{"id":"c","text":"Equal amounts of thrust and shaft power by design requirement","correct":false}]',
     '{"B1"}'),

    (s17_id, 'A turboshaft engine whose output shaft is driven by a turbine of its own located in the exhaust stream, rotating independently of the gas generator shaft, is called a:',
     '[{"id":"a","text":"Free turbine","correct":true},{"id":"b","text":"Fixed turbine","correct":false},{"id":"c","text":"Centrifugal turbine","correct":false}]',
     '{"B1"}'),

    (s17_id, 'The two major part-assemblies of a turboshaft engine are the gas generator and the:',
     '[{"id":"a","text":"Power section","correct":true},{"id":"b","text":"Afterburner section","correct":false},{"id":"c","text":"Bypass duct","correct":false}]',
     '{"B1"}'),

    (s17_id, 'In aviation, turboshaft engines are commonly used to power:',
     '[{"id":"a","text":"Helicopters and auxiliary power units (APUs)","correct":true},{"id":"b","text":"Large commuter fixed-wing aircraft exclusively","correct":false},{"id":"c","text":"Supersonic military fighters exclusively","correct":false}]',
     '{"B1"}'),

    (s17_id, 'Of the total energy produced by a helicopter turboshaft engine, approximately how much is used to operate the gas generator itself, versus drive the transmission?',
     '[{"id":"a","text":"About half is used for the gas generator, half for the transmission","correct":false},{"id":"b","text":"About two thirds is used for the gas generator, one third drives the transmission","correct":true},{"id":"c","text":"Almost none is used for the gas generator; nearly all drives the transmission","correct":false}]',
     '{"B1"}'),

    (s17_id, 'Helicopter main rotors typically rotate at approximately 300-400 rpm, reduced down from a turbine shaft speed of approximately:',
     '[{"id":"a","text":"3,500 rpm","correct":false},{"id":"b","text":"35,000 rpm","correct":true},{"id":"c","text":"350,000 rpm","correct":false}]',
     '{"B1"}'),

    (s17_id, 'A freewheeling unit or over-running clutch is located between the engine and main rotor shaft primarily to:',
     '[{"id":"a","text":"Allow autorotation without the rotor driving the engine","correct":true},{"id":"b","text":"Increase engine rpm during autorotation","correct":false},{"id":"c","text":"Disconnect the tail rotor during normal powered flight","correct":false}]',
     '{"B1"}'),

    (s17_id, 'A spray clutch used on a helicopter turboshaft engine output shaft, for allowing autorotation, engages at approximately:',
     '[{"id":"a","text":"Zero rpm, such as in the event of an engine seizure","correct":true},{"id":"b","text":"50% of normal operating rpm","correct":false},{"id":"c","text":"110% of normal operating rpm","correct":false}]',
     '{"B1"}'),

    (s17_id, 'On a helicopter turboshaft engine, power control between ground idle and flight idle is provided by the throttle twist grip, while between flight idle and maximum power, control is:',
     '[{"id":"a","text":"Automatic, by the free turbine governor","correct":true},{"id":"b","text":"Manual, requiring continuous throttle twist grip adjustment","correct":false},{"id":"c","text":"Not possible — power is fixed once flight idle is reached","correct":false}]',
     '{"B1"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M15.18 Auxiliary Power Units (APUs) (17 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s18_id, 'Auxiliary Power Units (APUs) are self-contained turbo-shaft engines that typically fall within which shaft horsepower (SHP) range?',
     '[{"id":"a","text":"55 to 350 SHP","correct":true},{"id":"b","text":"1,000 to 5,000 SHP","correct":false},{"id":"c","text":"5 to 25 SHP","correct":false}]',
     '{"B1"}'),

    (s18_id, 'Which of the following is NOT listed as a typical scenario in which an APU is used?',
     '[{"id":"a","text":"Main engine starting","correct":false},{"id":"b","text":"Supplying primary flight control hydraulic power at cruise altitude","correct":true},{"id":"c","text":"In-flight emergencies","correct":false}]',
     '{"B1"}'),

    (s18_id, 'Before intake air reaches an APU compressor, it passes through a screen primarily to protect against:',
     '[{"id":"a","text":"FOD (foreign object damage) and ice","correct":true},{"id":"b","text":"Excess humidity only","correct":false},{"id":"c","text":"Electromagnetic interference","correct":false}]',
     '{"B1"}'),

    (s18_id, 'Most APUs use which compressor configuration, favoured for its higher pressure rise per stage, smaller engine area, and better FOD/surge resistance?',
     '[{"id":"a","text":"Axial flow compressor","correct":false},{"id":"b","text":"Centrifugal impeller/radial diffuser","correct":true},{"id":"c","text":"Free-piston compressor","correct":false}]',
     '{"B1"}'),

    (s18_id, 'On an APU, the electrically operated butterfly valve that controls the amount of compressed air delivered to the aircraft''s pneumatic manifold is called the:',
     '[{"id":"a","text":"Load control valve","correct":true},{"id":"b","text":"Surge valve","correct":false},{"id":"c","text":"Feather valve","correct":false}]',
     '{"B1"}'),

    (s18_id, 'A load compressor on an APU is dedicated to providing:',
     '[{"id":"a","text":"Additional electrical power only","correct":false},{"id":"b","text":"Pneumatic air to the aircraft","correct":true},{"id":"c","text":"Hydraulic pressure only","correct":false}]',
     '{"B1"}'),

    (s18_id, 'Although more efficient than can or annular types, which combustor type is not typically used on APUs, due to maintenance and inspection concerns?',
     '[{"id":"a","text":"Can-annular combustor","correct":true},{"id":"b","text":"Can type combustor","correct":false},{"id":"c","text":"Annular type combustor","correct":false}]',
     '{"B1"}'),

    (s18_id, 'Of all the power outputs an APU can provide, which is considered the most important to aircraft operation?',
     '[{"id":"a","text":"The generator''s electrical output","correct":true},{"id":"b","text":"The hydraulic pump output","correct":false},{"id":"c","text":"The starter motor drive output","correct":false}]',
     '{"B1"}'),

    (s18_id, 'A CSD (constant speed drive) or VSCF (variable speed constant frequency) unit is not required for an APU generator because the APU engine:',
     '[{"id":"a","text":"Is not throttleable and runs at a constant 90-100% RPM","correct":true},{"id":"b","text":"Never produces AC power","correct":false},{"id":"c","text":"Only operates intermittently for a few seconds at a time","correct":false}]',
     '{"B1"}'),

    (s18_id, 'A key factor in determining whether an APU installation can be in-flight certified is:',
     '[{"id":"a","text":"Ballistic containment of the enclosure in case of catastrophic engine failure","correct":true},{"id":"b","text":"The colour of the exterior paint on the enclosure","correct":false},{"id":"c","text":"Whether the APU uses a can or annular combustor","correct":false}]',
     '{"B1"}'),

    (s18_id, 'The APU fuel control unit (FCU) is essentially a:',
     '[{"id":"a","text":"Simple high capacity gear pump run by and attached to the APU gearbox","correct":true},{"id":"b","text":"Centrifugal fuel booster pump mounted in the fuel tank","correct":false},{"id":"c","text":"Electric solenoid valve with no metering function","correct":false}]',
     '{"B1"}'),

    (s18_id, 'The APU starter motor commonly contains a centrifugal sprag type clutch that disengages the unit from the gearbox at approximately what RPM, once the engine becomes self-sustaining?',
     '[{"id":"a","text":"10% RPM","correct":false},{"id":"b","text":"60% RPM","correct":true},{"id":"c","text":"95% RPM","correct":false}]',
     '{"B1"}'),

    (s18_id, 'If the APU EEC senses an over speed event, typically around 110% RPM, it will respond by:',
     '[{"id":"a","text":"Closing the fuel shut-off valve and shutting down the engine","correct":true},{"id":"b","text":"Opening the load control valve fully to bleed off excess power","correct":false},{"id":"c","text":"Ignoring the event unless it persists for over one minute","correct":false}]',
     '{"B1"}'),

    (s18_id, 'Two of the largest differences between ground-only and in-flight certified APUs are:',
     '[{"id":"a","text":"Ballistic containment and ram air intake","correct":true},{"id":"b","text":"Fuel type and ignition voltage","correct":false},{"id":"c","text":"Generator frequency and oil capacity","correct":false}]',
     '{"B1"}'),

    (s18_id, 'ETOPS (Extended Twin Operational Performance) certification for a twin engine aircraft relies significantly on the aircraft possessing:',
     '[{"id":"a","text":"An in-flight certified APU capable of shouldering electrical and pneumatic load if a main engine shuts down","correct":true},{"id":"b","text":"A third main engine for redundancy","correct":false},{"id":"c","text":"A ground-only APU used solely before departure","correct":false}]',
     '{"B1"}'),

    (s18_id, 'A cold section inspection of an APU requires partial disassembly and visual examination of the:',
     '[{"id":"a","text":"Compressor section and components","correct":true},{"id":"b","text":"Turbine and combustion components only","correct":false},{"id":"c","text":"Gearbox generator windings only","correct":false}]',
     '{"B1"}'),

    (s18_id, 'Most APU maintenance is performed according to which philosophy?',
     '[{"id":"a","text":"Fixed hard-time replacement regardless of condition","correct":false},{"id":"b","text":"\"On-condition,\" as failure or faults deem necessary, with inspections on an hourly basis","correct":true},{"id":"c","text":"Only after a catastrophic in-flight failure occurs","correct":false}]',
     '{"B1"}');

END $$;
