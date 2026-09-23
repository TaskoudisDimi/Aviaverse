-- Module 14: Propulsion (B2) — Turbine Engines, Engine Starting
-- Source: EASA Part-66 Module 14 official textbook (IKAROS Aviation Training Centre)
-- Note: sort_order 2 (M14.2 Engine Indicating Systems) is seeded separately in migration 060.

DO $$
DECLARE
    m14_id INT;
    s1_id  INT;
    s3_id  INT;
BEGIN
    SELECT id INTO m14_id FROM easa_modules WHERE code = 'M14';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M14.1') THEN
        RAISE NOTICE 'M14.1 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 14.1: Turbine Engines
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m14_id, 'M14.1', 'Turbine Engines',
        $cnt$
# Turbine Engines

## Propulsion Principles

All aircraft propulsion is explained by **Newton's third law of motion**: every action has an equal and opposite reaction. An aircraft power plant — whether reciprocating engine and propeller, turbojet, or rocket — produces thrust in basically the same way, by changing the momentum of a mass of air.

The principle of thrust produced by jet propulsion was known as early as the first century A.D. — **Hero (Heron) of Alexandria** is credited with inventing a steam engine called an **aeolipile**: steam generated in a boiler was directed into a hollow sphere on an axle, with bent nozzles around its periphery, so that escaping steam produced a reaction force that rotated the sphere (the same principle as a rotating lawn sprinkler). The Chinese made the first practical application of jet propulsion with solid-fuel rockets.

There are two basic methods of producing thrust to propel an aircraft:

1. **Aerodynamic action** — an engine turns a propeller, a rotating airfoil that produces lift along a horizontal plane. The wash from this lift accelerates a **large mass of air** rearward through a **small change in velocity**.
2. **Jet reaction (jet propulsion)** — jet engines produce thrust by heating a mass of air inside the engine and discharging it at high velocity through a specially shaped nozzle. The amount of thrust is determined by the mass of the air and by the amount it is accelerated. Jet engines accelerate a **small mass of air** through a **large change in velocity**.

Different types of propulsion systems provide different mass airflows and flow velocities, but produce similar thrust at the end.

## Brayton Cycle

At the end of the 18th century, **George Brayton**, a Boston engineer, scientifically described the continuous combustion cycle now named after him — the **Brayton cycle**, also widely known as the **constant pressure cycle**. It is the continuous thermodynamic cycle of the gas turbine engine.

The same events — **intake, compression, expansion, power, and exhaust** — that occur in the constant-volume **Otto cycle** used by reciprocating engines also take place in a gas turbine engine. The basic difference:

- **Otto cycle (reciprocating engine):** events take place in the **same location** (the engine cylinder) but at **different times** — an intermittent process.
- **Brayton cycle (gas turbine engine):** events occur at the **same time**, but at **different locations** within the engine — a continuous process.

## Types of Gas Turbine Engines

Reciprocating engines have several built-in limitations that the gas turbine overcomes:

- The reciprocating action of pistons causes vibrations and significant internal stresses the engine must be designed for, so reciprocating engines are heavy for the power they produce.
- Reciprocating engines have a large number of moving parts, requiring overhaul after relatively few hours of operation.
- A reciprocating engine can only produce thrust by driving a propeller.

A gas turbine engine, by contrast, is extremely light for the power it produces, has few moving parts, and — with modern materials — achieves an exceptionally high TBO (time between overhauls).

### Turbojet Engines

The turbojet, as first patented by **Sir Frank Whittle**, had an impeller compressor, annular combustor, and a single-stage turbine. Today's turbojet designs vary, but the basic components remain the **compressor, combustor, and turbine**.

The turbojet gets its propulsive power from reaction to the flow of hot gases: air enters the inlet and its pressure is increased by the compressor; fuel is added in the combustor and the heat-driven expansion forces the turbine wheel to rotate; the turbine in turn drives the compressor. The energy remaining downstream of the turbine accelerates into the atmosphere through the tail-pipe, creating the reaction referred to as **thrust**.

Large turbojets remain in use in military aviation and were used in the last supersonic Concorde airliner; most supersonic aircraft now use turbofans instead.

### Turboprop

A turbine engine can drive a propeller by extracting most of the energy remaining in the exhaust gases after they have driven the compressor. An engine that uses a **separate turbine** to drive the propeller is called a **free-turbine engine**. A turboprop engine uses a free turbine to drive the propeller through a series of **planetary reduction gears**.

### Turboshaft

Turbine engines are ideally suited for powering helicopters because they operate most efficiently at the constant RPM a helicopter requires. Most turboshaft engines drive their output shaft with a **multistage free turbine** that extracts as much energy as possible from the exhaust gases before they leave the engine.

Turboshaft engines are also widely used in industrial applications such as electrical power generating plants and surface transportation systems. In aviation, turboshaft engines power many modern helicopters and **auxiliary power units (APUs)**.

### Turbofan

The turbofan is, in effect, a ducted, multi-bladed propeller driven by a gas turbine engine. Turbofans generally contain **20 to 40 fixed pitch blades**. They were developed to provide a compromise between the best features of the turbojet and the turboprop: with its ducted design, the turbofan has turbojet-type cruise speed capability while retaining some of the short-field takeoff capability of the turboprop.

Compared with a turboprop's propeller, a turbofan's fan diameter is much smaller, but it has many more blades and moves the air at greater velocity from its convergent exhaust nozzle.

**Turbofan classifications (civil aircraft):**

| Classification | Bypass Ratio |
|----------------|--------------|
| Low bypass | less than 2:1 |
| Medium bypass | between 2:1 and 4:1 |
| High bypass | 4:1 or greater |

The **bypass ratio** is the ratio of the mass of air moved by the fan to the mass of air moved by the core engine. The amount of thrust produced by the fan varies between **30% and 85%** of total thrust, depending on the bypass ratio. High bypass engines have the lowest fuel consumption of the various turbofan types.

- The **PW-4000** is a 5:1 bypass ratio engine, with **80%** of thrust produced by the fan and **20%** by the core engine.
- Actual high-bypass engines include the **Rolls Royce Trent 500** (bypass ratio higher than **7:1**) and the **Pratt & Whitney PW8000** (bypass ratio around **11:1**).

The high bypass turbofan has become the most widely used engine type for medium to large airliners because it offers the best fuel economy. The aviation industry has, for the most part, turned to fan engines and away from turbojets for high-performance business, commercial and military aircraft.

## Turbine Engine Terms and Definitions

An aircraft gas turbine engine is divided into two sections:

- **Cold section** — includes the inlet air duct, the compressor, and the diffuser. (The air inlet duct is technically part of the airframe, but is included with the engine because of its importance to thrust development.)
- **Hot section** — includes the combustion section, the turbine, and the exhaust system.

The industry has agreed upon standard abbreviations and symbols, including **numerical engine station designations**, to enable specific locations within the engine to be identified easily and accurately, and to allow gas turbine engines to be compared.

## Engine Efficiency

**Propulsive efficiency** is defined as the ratio of power available to do useful work in propelling a body, to the power supplied.

The closer the aircraft's speed comes to exhaust (or prop/fan wake) velocity, the higher the propulsive efficiency — though reaching the same speed as the exhaust velocity is not possible, because no momentum change (and hence no thrust) would then occur.

- A **propeller-driven aircraft** at a given power setting has varying efficiency depending on forward speed, and is also limited by altitude and speed.
- A **jet engine increases its efficiency with an increase in speed**.

## Turbine Engine Fuel System

Liquid fuel will not burn as a liquid — to release its energy it must be **vaporized** so it can mix with air to form a combustible mixture. Two types of nozzles discharge the fuel: the widely used **atomizing nozzles** and the more seldom-used **vaporizing nozzle**. Not all nozzles are supplied with fuel during starting; during full thrust, all nozzles are supplied with fuel — this is controlled via the burner staging valve (BSV) and depends on engine RPM.

The fuel distribution system supplies ice-free, filtered fuel at the pressure and flow rates needed for all engine operating requirements, permitting fuel to flow: **aircraft fuel tank → engine fuel pump → fuel metering unit (fuel control unit) → fuel injectors**. Fuel not sent to the fuel control unit goes to the servo fuel heater to supply servo fuel pressure for engine component actuation.

### Fuel System Description (typical modern engine)

1. Fuel is delivered from the aircraft fuel tank by submerged boost pumps.
2. It flows through the **engine shutoff valve** into the **main multi-stage fuel pump**, first through a low-pressure centrifugal primary-stage pump, then through a **fuel-oil heat exchanger** (fuel pump is attached to and driven from the gearbox).
3. Hot oil flowing through the heat exchanger keeps fuel temperature high enough to **prevent ice crystal formation**. A built-in spring-loaded bypass valve opens to allow fuel to flow around the core if it becomes clogged.
4. Fuel flows through the **filter**. If partially clogged, a pressure-differential switch across the filter closes a warning light circuit; if completely clogged, fuel flows around it through a built-in **filter-bypass valve**.
5. Fuel then flows through the **high-pressure stage of the pump** into the **fuel control unit**, which contains pressure and temperature sensors, valves and servo valves, and an **N2 overspeed protection system**. The most important valve is the **fuel metering valve**, which controls fuel delivered to the nozzles. On modern systems, valves are often controlled by servo valves, triggered by the **electronic engine controller (EEC)**, using muscle/servo pressure (fuel) to actuate the associated valve.
6. From the fuel control, fuel passes through the **fuel flow transmitter** — used by the EEC as a feedback signal and for indication.

## Fuel Control Unit

Fuel controls fall into two basic groups: **hydromechanical** and **electronic**. Most basic controls are hydromechanical; large airliners and many high-performance military aircraft use electronic controls because of their ability to sense more parameters and perform more control functions.

- **Hydromechanical** controls contain components such as speed governors, servo systems, **three-dimensional cams**, sleeve and pilot valves, feedback/follow-up devices, and metering systems.
- **Electronic** fuel controls are a maze of printed circuit boards, thermocouples, amplifiers, relays, electrical servo systems, switches, and solenoids.
- **Electro-hydromechanical** control — a basic hydromechanical control with an added electronic sensor circuit, powered by the electronic engine controller and analysing parameters such as exhaust temperatures, gas path pressure, and engine RPM. It has not been as widely used as pure hydromechanical or hydro-pneumatic control, though it has appeared on some newer commercial and business aircraft engines.

### Air-Fuel Ratio

The purpose of the fuel control is to maintain the correct combustion zone air-to-fuel mixture ratio of **15:1 by weight** (weight of combustor primary air to weight of fuel) — sometimes expressed as a fuel-air ratio of **0.067:1**. This is the **stoichiometric (chemically correct) mixture** for air and jet fuels; at rich or lean mixtures fuel still burns, but not completely.

The ratio is sometimes expressed as **60:1** in terms of **total** airflow rather than primary combustor airflow — if primary airflow is approximately **25%** of total airflow, then 15:1 (primary) corresponds to 60:1 (total).

A gas turbine engine experiences a mixture of about **10:1 during acceleration** and **22:1 during deceleration** (primary airflow terms); expressed in terms of total airflow (at 25% primary), these become **48:1 on acceleration** and **80:1 on deceleration**.

### Signals Sensed by the Fuel Control

- **Thrust Lever Angle (TLA)** — the pilot's input specifying the amount of power/thrust desired.
- **Compressor Inlet Total Temperature (Tt2)** — relates to the density of air entering the engine.
- **Compressor RPM (N1 or N2)** — important for steady-state fuel control and for limiting acceleration/deceleration rate.
- **Burner Pressure (Pb)** — relates to the weight of air flowing through the engine.
- **Turbine Inlet Temperature (TIT)** — the most critical temperature in a gas turbine engine, normally the factor that limits the thrust an engine can produce.

### How the Fuel Control Works

Maximum thermal efficiency and thrust are obtained when TIT is held close to its allowable limit. The fuel control is programmed (in most hydromechanical controls, via a **three-dimensional cam**) to vary fuel flow according to a schedule ensuring the engine stays within safe temperature limits.

Combustion temperature varies directly with fuel flow: increased fuel flow raises the temperature (and pressure) of gas acting on the turbine and compressor, giving the turbine additional energy; the compressor accelerates despite back pressure, forcing more air through the engine, and thrust increases. Reducing fuel flow lowers combustion temperature and thrust.

The fuel control automatically changes fuel flow as compressor inlet conditions change: fuel flow **decreases** as compressor inlet pressure decreases with altitude gain, and **increases** during descent. As inlet air temperature rises (less dense air), compressor load decreases and RPM increases, so the fuel control sends less fuel and thrust/TIT decrease; on cold days, denser inlet air raises compressor load, requiring more fuel, increasing thrust and TIT.

To **accelerate** the engine, energy supplied to the turbine must exceed that needed to maintain constant RPM — but if fuel flow increases too rapidly, an overly rich mixture can cause excessive TIT or a **compressor surge**: a condition of unstable airflow through the compressor in which the compressor blades reach an excessive angle of attack and stall. Susceptibility to surge increases with the low density of high altitude. The fuel control must therefore limit acceleration fuel flow.

- Too-rapid fuel increase risking excess TIT/surge, or an over-rich mixture, may even cause the fire to go out — a **rich blowout**.
- Reducing fuel flow faster than the compressor can reduce airflow to the burners during deceleration may cause a **lean die-out**.

The fuel control must supply the correct fuel-air ratio to prevent flameout during either acceleration or deceleration.

## Electronic Engine Control Systems

Advances in gas turbine technology demanded more precise engine parameter control than hydromechanical fuel controls alone could provide. **Electronic engine controls (EEC)** meet this demand, and are of two types: **supervisory** and **full-authority**.

### Supervisory Electronic Engine Control

Works together with a proven hydromechanical fuel control. Major components: the electronic control itself, the hydromechanical fuel control on the engine, and the bleed air and variable stator vane control.

- The **hydromechanical element** controls the basic operation of the engine — starting, acceleration, deceleration, shutdown — and also controls high-pressure rotor speed (N2), compressor stator vane angles, and engine bleed system.
- The **EEC**, acting in a supervisory capacity, modulates engine fuel flow to maintain the designated thrust. The pilot simply selects a desired thrust setting (e.g. full takeoff thrust, maximum climb); the control adjusts engine RPM to maintain that thrust rating, compensating for flight and environmental changes, and limits engine operating speed and temperature.
- If a problem develops, control automatically reverts to the hydromechanical system with **no discontinuity in thrust**; a cockpit warning is displayed but no immediate pilot action is required. The pilot can also revert to hydromechanical control at any time.

### Full-Authority Digital Engine Control (FADEC)

The supervisory control was a step toward the full-authority, fully redundant EEC. **FADEC** controls **all** engine functions and eliminates the need for a backup hydromechanical control.

One basic purpose of FADEC is to reduce flight crew workload: its control logic simplifies power settings for all operating conditions, so throttle position achieves consistent engine settings regardless of flight or environmental conditions.

FADEC establishes engine power through direct closed-loop control of the **engine pressure ratio (EPR)**, the thrust-rating parameter, calculated as a function of **throttle lever angle, altitude, Mach number, and total air temperature**. The air data computer supplies altitude, Mach number and total air temperature; sensors provide engine temperature, pressure and speed measurements. This data provides automatic thrust control, engine limit protection, transient control, and engine starting.

**FADEC advantages over hydromechanical and supervisory EEC:**

- Requires no engine trimming
- Ensures improved engine starts
- Provides constant idle speed despite changing atmospheric conditions and service bleed air requirements
- Saves fuel through improved engine bleed air management
- Fully modulates the clearance control system (instead of a stepped modulating system)
- Ensures more repeatable engine transients, due to higher digital computer precision
- Provides engine limit protection by automatically limiting critical engine pressures and speeds

**FADEC architecture:** dual electronic channels, each with its own processor, power supply, program memory, selected input sensors, and output actuators. Power to each channel is provided by a dedicated, engine-gearbox-driven **alternator**, giving high operational reliability — no single electronic malfunction causes an engine operational problem. Each control channel incorporates fault identification, isolation, and accommodation logic.

A hierarchy of fault-tolerance logic handles single or multiple faults: if computational capability is lost in the primary channel, FADEC automatically switches to the **secondary channel**; if a sensor is lost in the primary channel, the secondary channel supplies the information; if data from the secondary channel is also lost, FADEC produces usable **synthesized information** from available parameters.

FADEC includes extensive, continuously actuated self-test routines. **Built-in test equipment (BITE)** detects and isolates faults within the EEC and its input/output devices. Fault words are decoded into English messages by a maintenance monitor identifying the faulty **line-replaceable unit (LRU)**. In-flight fault data is recorded for recall during shop repair; computer-aided troubleshooting can identify a fault at the circuit-board level.

*Closed-loop control: a type of control in which part of the output is fed back to the input.*

## Fuel Control Adjustments

The EGT (and thus thrust) of some of the first turbojet engines was adjusted by varying the area of the exhaust nozzle — trimming the end of the tail pipe to increase nozzle area, or installing small metal tabs called "mice" to decrease it. This adjustment process is still called **trimming**, even though these specific procedures are no longer followed.

There is not much maintenance an aviation maintenance technician can perform on a gas turbine engine's fuel control beyond removing/replacing units and making manufacturer-specified adjustments. There are **no adjustments** to be made to an EEC, since it automatically adjusts for performance deterioration. Adjustments allowed for a **hydromechanical** fuel control are normally: the specific gravity adjustment for the fuel, idle RPM, and full throttle RPM — following the procedure outlined in the engine service manual.
        $cnt$,
        1
    ) RETURNING id INTO s1_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 14.3: Engine Starting
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m14_id, 'M14.3', 'Engine Starting',
        $cnt2$
# Engine Starting

## Engine Starting Systems — Overview

It is necessary to use an **external source of power** to initiate the cycle of any internal combustion engine. If fuel is added to a static engine and lit, the result will simply be a fire — there will be no initiation of the cycle, due to lack of rotation of the engine.

Gas turbine engines require a higher rate of turning than a piston engine in order to achieve their **self-sustaining rpm**.

- **Self-sustaining rpm** — the engine speed from which the engine will accelerate to idle rpm, under its own power, smoothly and without overheating (exceeding turbine temperature limitations).
- **Idle rpm** — the lowest rpm at which an engine will run for a long period without overheating. Sometimes idle rpm is also the minimum rpm required for taxying the aircraft along a level pavement.

Idle rpm is **not necessarily** the coolest rpm at which the engine will run — for example, the **RR Viper** should be run at a slightly higher rpm than idle to cool it prior to shutting it down.

Starting a gas turbine engine is the **most dangerous period** of the engine's operation — the time when the engine goes from cold to very hot in an exceedingly short time. This sudden temperature change can promote **thermal shock**. Furthermore, **all gas turbine engines will stall during the start cycle**. The aim is therefore to achieve as short a start time as possible, to get the engine to idle and smooth running quickly, without exceeding turbine temperature limitations.

The turbine is likely to reach a very high temperature for a short while during the start sequence — acceptable providing the temperature (and its time duration) is not exceeded. There is very little air being fed back through the engine during starting, so what air there is remains largely used for combustion until a reasonable rpm — just sub-idle — is attained. The starter must turn the engine shaft fast enough to obtain a **minimum airflow for cooling purposes** during light-up (ignition).

### Hung Start

Whatever rotates the engine to self-sustaining rpm must do so rapidly and sustain a level of torque that keeps the engine accelerating smoothly. Once the igniters have lit the fuel, torque assistance from the turbine gradually increases. The **combined torque** from the starter and the turbine must always stay above a minimum required to keep the engine accelerating, ultimately, to idle rpm.

A **hung start** is the result if either fails to do this: a point is reached where the engine is still rotating but has failed to accelerate.

- If fuel is burning at this point, a very high turbine temperature will be apparent, and the engine should be **shut down immediately**.
- Sometimes a hung start is caused by lack of fuel flow — for example, the HP shut-off valve has not been opened — in which case the engine will "**hang on the starter**".

### Requirements for a Satisfactory Start

A satisfactory start requires:

- **Rotation** (for air)
- **Fuel**
- **Ignition**

Rotation of the engine, to provide air for combustion, can be achieved by:

- Turning the **compressor by a starter**
- Turning the **turbine by impingement**
- **Windmilling** the engine

## Types of Starter

There are many types of starters — anything that can apply sufficient torque at an adequate rate to the engine shaft has been pressed into service; even hand-cranking the shaft has been used on some older, smaller engines.

### Low Pressure Air Turbine Starters

Light, simple and efficient — the choice for most large engines, and common on commercial aircraft. The required air pressure can be taken from several sources, including external supplies.

When LP air is supplied to the starter, guide vanes direct it onto an **impulse turbine**, which rotates a drive coupling through a **two-stage spur epicyclic reduction gear** and a **sprag clutch**. The coupling engages the engine gearbox, which in turn drives the HP compressor as well as the accessories required for starting.

### Hydraulic Starter

Provides lots of torque, and is fairly light and simple — but needs a supply of hydraulic pressure and flow, which is heavier and difficult to arrange adequately.

### Gas Turbine Starters

A small gas turbine with a free turbine is installed on the aircraft. The free turbine is connected to the main shaft of the engine(s) to be started. The gas turbine starter is itself started with a small electric motor, and its free turbine is then used to start the main engine; once the main engine(s) has started, the gas turbine starter is shut down. This system is fairly heavy and is largely restricted to military use.

### Electric Starters

Light, simple, and efficient, giving enough torque to turn over the engine from a convenient power source — the battery or an external supply. Common on smaller engines, although some fairly heavy engines have used them.

An electric starter motor must produce a great deal of torque from zero rpm, sometimes from the battery, so the motor is a **24 volt, DC, series wound machine**. On heavier engines the starter motor can make a considerable current demand — for example, some **Dart engines** use a 12 HP starter motor, and the electrical equivalent of 12 HP needs **373 amps** of current, which could damage the system through overheating. To reduce the current demand at the initial stages of operation, a **slow start resistor** is incorporated; it is shorted out after a pre-determined time.

### Starter Generator

Used on small gas turbine engines — largely turbopropeller and turboshaft engines. This single machine contains **two circuits**: a series winding for starting, and a shunt winding for generating electricity. They are switched between **START and RUN** on the start switch on the flight deck, so that starting and generating cannot be attempted simultaneously. These units are restricted to small engines, because the rpm range of larger engines would prohibit an armature from covering it all.

## Air Starting System

The air for a low pressure air starter unit is obtainable from one of the following sources:

- **APU**
- **Ground Supply**
- **An engine that is already running**

Normally the first engine to be started receives its supply from the APU or an external source, and subsequent engines then receive their supply from the running engine. When using a running engine as an air source, its rpm must be raised to the specified point to give the correct air pressure — while not exceeding its own turbine temperature limitations. The air supply lever on both the feeding and the fed engines must be opened to permit air delivery to, and from, those engines.

### Ducting

The ducting used to convey air from the source to the starter is generally **large bore, aluminium alloy, rigid pipe**, constructed to a specific design. Where a degree of flexibility is necessary, a **bellows type coupling** is used.

### Valves

There are three types of valve used in air starter systems:

- **Non-return valves** — simple flap type valves, lightly spring loaded into the closed position.
- **ON/OFF valves** — normally of the carbon gate type, electrically actuated open and closed.
- **Pressure regulating valves (Start Control Valves)** — maintain a constant pressure into the air starter motor, keeping torque at a constant level until the turbine takes over the production of torque.

## Air Impingement Starting

Light and simple, but requires specific ground support equipment. Compressed air is blown directly onto the turbine of the engine to promote initial rotation. Once the engine starts and the pressure of the gas passing into the turbine builds up, a valve supplying the external compressed air supply shuts, and the pipe can then be disconnected. This method is impractical and rare.

## Windmill Starting

The engine may also be started by an airflow passing over the propeller or down the intake. In flight, this airflow is created by the forward passage of the aircraft through the air, which creates separate starting problems addressed elsewhere.

It is possible to start some aircraft engines by positioning another aircraft in front of the aircraft to be started, and passing air back from the front aircraft's propellers onto the propellers of the aircraft behind — sufficient to windmill the rear aircraft's engines fast enough to start them. Once one engine is started, it is normally possible to feed the others with air or electricity to start them in the normal manner. This method is rarely used, and **not recommended for commercial/civil use**, because of the danger of **FOD** flung up by the front aircraft.
        $cnt2$,
        3
    ) RETURNING id INTO s3_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M14.1 Turbine Engines (20 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s1_id, 'All aircraft propulsion is fundamentally explained by:',
     '[{"id":"a","text":"Newton''s third law of motion","correct":true},{"id":"b","text":"Bernoulli''s Theorem","correct":false},{"id":"c","text":"Boyle''s Law","correct":false}]',
     '{"B2"}'),

    (s1_id, 'Hero (Heron) of Alexandria is credited with inventing an early reaction-propulsion device known as:',
     '[{"id":"a","text":"The aeolipile","correct":true},{"id":"b","text":"The Brayton turbine","correct":false},{"id":"c","text":"The impulse rotor","correct":false}]',
     '{"B2"}'),

    (s1_id, 'Compared with a jet engine, a propeller (aerodynamic action) produces thrust by:',
     '[{"id":"a","text":"Accelerating a small mass of air through a large change in velocity","correct":false},{"id":"b","text":"Accelerating a large mass of air through a small change in velocity","correct":true},{"id":"c","text":"Heating a small mass of air and discharging it through a nozzle","correct":false}]',
     '{"B2"}'),

    (s1_id, 'The continuous thermodynamic cycle of the gas turbine engine is named after George Brayton and is also known as the:',
     '[{"id":"a","text":"Constant volume cycle","correct":false},{"id":"b","text":"Constant pressure cycle","correct":true},{"id":"c","text":"Variable pressure cycle","correct":false}]',
     '{"B2"}'),

    (s1_id, 'In the Brayton cycle, intake, compression, expansion, power and exhaust events occur:',
     '[{"id":"a","text":"At the same location but at different times","correct":false},{"id":"b","text":"At the same time but at different locations within the engine","correct":true},{"id":"c","text":"At the same time and at the same location","correct":false}]',
     '{"B2"}'),

    (s1_id, 'The turbojet, as first patented by Sir Frank Whittle, had which basic arrangement?',
     '[{"id":"a","text":"Impeller compressor, annular combustor, single-stage turbine","correct":true},{"id":"b","text":"Axial compressor, can combustor, three-stage turbine","correct":false},{"id":"c","text":"Centrifugal fan, ramjet duct, no turbine","correct":false}]',
     '{"B2"}'),

    (s1_id, 'An engine that uses a separate turbine to drive the propeller, connected through planetary reduction gears, is called a:',
     '[{"id":"a","text":"Turboshaft engine","correct":false},{"id":"b","text":"Free-turbine (turboprop) engine","correct":true},{"id":"c","text":"Ramjet engine","correct":false}]',
     '{"B2"}'),

    (s1_id, 'Turbine engines are ideally suited to powering helicopters because:',
     '[{"id":"a","text":"They operate most efficiently at the constant rpm a helicopter requires","correct":true},{"id":"b","text":"They are the lightest possible engine type regardless of rpm","correct":false},{"id":"c","text":"They require no reduction gearing of any kind","correct":false}]',
     '{"B2"}'),

    (s1_id, 'A turbofan engine is best described as:',
     '[{"id":"a","text":"A ducted, multi-bladed propeller driven by a gas turbine engine","correct":true},{"id":"b","text":"An unducted propeller driven by a piston engine","correct":false},{"id":"c","text":"A pure jet reaction engine with no rotating compressor","correct":false}]',
     '{"B2"}'),

    (s1_id, 'A turbofan engine is classified as "high bypass" when its bypass ratio is:',
     '[{"id":"a","text":"Less than 2:1","correct":false},{"id":"b","text":"Between 2:1 and 4:1","correct":false},{"id":"c","text":"4:1 or greater","correct":true}]',
     '{"B2"}'),

    (s1_id, 'The bypass ratio of a turbofan engine is defined as:',
     '[{"id":"a","text":"The ratio of the mass of air moved by the fan to the mass of air moved by the core engine","correct":true},{"id":"b","text":"The ratio of fan diameter to core engine diameter","correct":false},{"id":"c","text":"The ratio of thrust at takeoff to thrust at cruise","correct":false}]',
     '{"B2"}'),

    (s1_id, 'On the PW-4000, a 5:1 bypass ratio engine, approximately what percentage of total thrust is produced by the fan?',
     '[{"id":"a","text":"20%","correct":false},{"id":"b","text":"50%","correct":false},{"id":"c","text":"80%","correct":true}]',
     '{"B2"}'),

    (s1_id, 'The cold section of a gas turbine engine includes the inlet air duct, the compressor, and the:',
     '[{"id":"a","text":"Diffuser","correct":true},{"id":"b","text":"Combustion chamber","correct":false},{"id":"c","text":"Exhaust system","correct":false}]',
     '{"B2"}'),

    (s1_id, 'Propulsive efficiency is defined as:',
     '[{"id":"a","text":"The ratio of power available to do useful work in propelling a body, to the power supplied","correct":true},{"id":"b","text":"The ratio of fuel burned to thrust produced at idle rpm only","correct":false},{"id":"c","text":"The ratio of turbine inlet temperature to compressor inlet temperature","correct":false}]',
     '{"B2"}'),

    (s1_id, 'As forward speed increases, the propulsive efficiency of a jet engine:',
     '[{"id":"a","text":"Decreases steadily","correct":false},{"id":"b","text":"Increases","correct":true},{"id":"c","text":"Remains completely unaffected by speed","correct":false}]',
     '{"B2"}'),

    (s1_id, 'The stoichiometric (chemically correct) air-to-fuel mixture ratio by weight, maintained by the fuel control in the combustion zone, is approximately:',
     '[{"id":"a","text":"5:1","correct":false},{"id":"b","text":"15:1","correct":true},{"id":"c","text":"60:1","correct":false}]',
     '{"B2"}'),

    (s1_id, 'Which of the following is NOT one of the basic parameters typically sensed by a turbine engine fuel control?',
     '[{"id":"a","text":"Turbine Inlet Temperature (TIT)","correct":false},{"id":"b","text":"Compressor RPM (N1 or N2)","correct":false},{"id":"c","text":"Cabin differential pressure","correct":true}]',
     '{"B2"}'),

    (s1_id, 'A compressor surge is caused by:',
     '[{"id":"a","text":"Unstable airflow through the compressor, in which the compressor blades reach an excessive angle of attack and stall","correct":true},{"id":"b","text":"Too little fuel being supplied during cruise, causing the compressor to slow gradually","correct":false},{"id":"c","text":"Excessive oil pressure in the accessory gearbox","correct":false}]',
     '{"B2"}'),

    (s1_id, 'A Full-Authority Digital Engine Control (FADEC) establishes engine power through direct closed-loop control of which thrust-rating parameter?',
     '[{"id":"a","text":"Engine Pressure Ratio (EPR)","correct":true},{"id":"b","text":"Oil pressure ratio","correct":false},{"id":"c","text":"Idle RPM only","correct":false}]',
     '{"B2"}'),

    (s1_id, 'If computational capability is lost in the primary channel of a dual-channel FADEC, the system will:',
     '[{"id":"a","text":"Shut the engine down immediately as a precaution","correct":false},{"id":"b","text":"Automatically switch to the secondary channel","correct":true},{"id":"c","text":"Freeze fuel flow at its last commanded value indefinitely","correct":false}]',
     '{"B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M14.3 Engine Starting (13 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s3_id, 'Self-sustaining rpm is best defined as:',
     '[{"id":"a","text":"The engine speed from which the engine will accelerate to idle rpm, under its own power, smoothly and without overheating","correct":true},{"id":"b","text":"The lowest rpm at which the engine will run for a long period without overheating","correct":false},{"id":"c","text":"The rpm at which the starter must be disengaged by law","correct":false}]',
     '{"B2"}'),

    (s3_id, 'Idle rpm is defined as:',
     '[{"id":"a","text":"The highest rpm the engine can sustain without exceeding turbine temperature limits","correct":false},{"id":"b","text":"The lowest rpm at which an engine will run for a long period without overheating","correct":true},{"id":"c","text":"The rpm at which the igniters are switched off","correct":false}]',
     '{"B2"}'),

    (s3_id, 'Why is starting considered the most dangerous period of a gas turbine engine''s operation?',
     '[{"id":"a","text":"Because the engine goes from cold to very hot in an exceedingly short time, which can promote thermal shock","correct":true},{"id":"b","text":"Because fuel pressure is at its highest value of the entire flight","correct":false},{"id":"c","text":"Because the aircraft is normally moving at this time","correct":false}]',
     '{"B2"}'),

    (s3_id, 'A hung start is a condition in which:',
     '[{"id":"a","text":"The engine overspeeds well beyond its rated rpm during the start cycle","correct":false},{"id":"b","text":"The engine is still rotating but has failed to accelerate","correct":true},{"id":"c","text":"The starter disengages before ignition occurs","correct":false}]',
     '{"B2"}'),

    (s3_id, 'If fuel is burning during a hung start, the appropriate action is to:',
     '[{"id":"a","text":"Increase the throttle to try to force the engine through to idle","correct":false},{"id":"b","text":"Shut the engine down immediately, since a very high turbine temperature will be apparent","correct":true},{"id":"c","text":"Continue the start sequence unchanged, since this is a normal occurrence","correct":false}]',
     '{"B2"}'),

    (s3_id, 'A satisfactory engine start requires which three things?',
     '[{"id":"a","text":"Rotation (for air), fuel, and ignition","correct":true},{"id":"b","text":"Hydraulic pressure, electrical power, and bleed air only","correct":false},{"id":"c","text":"High rpm, low fuel flow, and rich mixture","correct":false}]',
     '{"B2"}'),

    (s3_id, 'Low pressure air turbine starters are widely used because they are:',
     '[{"id":"a","text":"Light, simple and efficient, and the choice for most large engines","correct":true},{"id":"b","text":"The only starter type capable of producing torque from zero rpm","correct":false},{"id":"c","text":"Restricted almost exclusively to military applications","correct":false}]',
     '{"B2"}'),

    (s3_id, 'In a low pressure air turbine starter, LP air is directed by guide vanes onto an impulse turbine, which drives the engine gearbox through a:',
     '[{"id":"a","text":"Direct rigid coupling with no reduction gearing","correct":false},{"id":"b","text":"Two-stage spur epicyclic reduction gear and a sprag clutch","correct":true},{"id":"c","text":"Hydraulic torque converter","correct":false}]',
     '{"B2"}'),

    (s3_id, 'An electric starter motor used to turn a gas turbine engine is typically a:',
     '[{"id":"a","text":"24 volt, DC, series wound machine","correct":true},{"id":"b","text":"115 volt, AC, three-phase induction motor","correct":false},{"id":"c","text":"12 volt, DC, shunt wound machine","correct":false}]',
     '{"B2"}'),

    (s3_id, 'A slow start resistor is incorporated into an electric starter circuit in order to:',
     '[{"id":"a","text":"Reduce the current demand of the motor at the initial stages of operation","correct":true},{"id":"b","text":"Increase starter torque above the motor''s rated maximum","correct":false},{"id":"c","text":"Delay ignition until the compressor reaches idle rpm","correct":false}]',
     '{"B2"}'),

    (s3_id, 'A starter generator, used on small turbopropeller and turboshaft engines, contains:',
     '[{"id":"a","text":"Two circuits — a series winding for starting and a shunt winding for generating","correct":true},{"id":"b","text":"A single winding used interchangeably with no switching required","correct":false},{"id":"c","text":"Three independent windings for start, taxi, and cruise generation","correct":false}]',
     '{"B2"}'),

    (s3_id, 'When a low pressure air starting system draws air from an engine that is already running, the rpm of the supplying engine must be raised in order to:',
     '[{"id":"a","text":"Give the correct air pressure without exceeding its own turbine temperature limitations","correct":true},{"id":"b","text":"Reduce its own fuel consumption during the start sequence","correct":false},{"id":"c","text":"Allow its own igniters to be switched off safely","correct":false}]',
     '{"B2"}'),

    (s3_id, 'Windmill starting by positioning another aircraft in front to blow air onto the propellers of the aircraft behind is:',
     '[{"id":"a","text":"A standard, widely recommended commercial starting procedure","correct":false},{"id":"b","text":"Rarely used and not recommended for commercial/civil use, due to the danger of FOD","correct":true},{"id":"c","text":"Only permitted for turbofan engines, never for turboprops","correct":false}]',
     '{"B2"}');

END $$;
