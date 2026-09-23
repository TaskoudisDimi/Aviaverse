-- Module 16: Piston Engines (B1) — Supercharging/Turbocharging, Starting and Ignition Systems
-- Source: EASA Part-66 Module 16 official textbook (IKAROS Aviation Training Centre, IK01, Issue Oct.2012)

DO $$
DECLARE
    m16_id INT;
    s5_id  INT;
    s6_id  INT;
BEGIN
    SELECT id INTO m16_id FROM easa_modules WHERE code = 'M16';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M16.5') THEN
        RAISE NOTICE 'M16.5-M16.6 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 16.5: Supercharging and Turbocharging
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m16_id, 'M16.5', 'Supercharging and Turbocharging',
        $cnt$
# Supercharging and Turbocharging

## Principles and Purpose of Charging

The power output of a piston engine depends on the weight of fuel/air mixture induced and burnt in the cylinders in a given time. The factor having the greatest effect on this is the **pressure and temperature of the mixture in the induction manifold**.

Engines without superchargers depend on ambient atmospheric pressure filling the induction manifold through the throttle butterfly valve, and are known as **NORMALLY ASPIRATED ENGINES**. The manifold pressure will never be greater than atmospheric pressure — indeed, it will always be slightly lower at full throttle owing to intake duct losses. These engines "breathe unaided," so power output decreases as manifold pressure decreases with an increase in altitude, although some power is recovered due to better scavenging of the cylinders owing to reduced exhaust back pressure.

Where an engine is required to produce increased power for take-off and climb, or to maintain sea-level power at high altitude, the manifold pressure must be raised mechanically — this is done by a **supercharger**.

### Ground Boosted Engines

When the sea-level power of an engine has to be increased for take-off and climb, the construction of the engine must be modified to withstand much higher loads. Components which must be strengthened include the **crankshaft and main bearings, connecting rods, pistons and gudgeon pins**. A lower compression ratio may also be specified. Engines modified this way are referred to as **GROUND BOOSTED ENGINES**.

All superchargers require a control system to prevent high manifold pressures occurring at sea level, which would lead to **detonation and serious engine damage**.

The supercharger is basically a **centrifugal compressor**, driven either by internal gearing or by an externally-mounted exhaust-driven turbine (or, in some cases, a combination of both). Exhaust-driven superchargers are known as **TURBO-SUPERCHARGERS** or **TURBOCHARGERS**.

### The Centrifugal Compressor

The centrifugal compressor consists of a disc on which is formed a number of radially-spaced vanes, around which is placed a ring of stationary vanes forming divergent passages:

- The rotating disc is called the **IMPELLER**
- The stationary ring of vanes is called the **DIFFUSER**

When the impeller is rotated at high speed, it throws the air between the vanes outwards under centrifugal force. The air receives kinetic energy from the vanes, and some of this energy is converted into pressure energy because of the divergent passage formed between the vanes. The air leaves the impeller at high radial velocity and enters the passages formed by the stationary diffuser vanes, which guide the air into a volute (manifold), at the same time **reducing velocity and increasing pressure**.

Compressing the air, and changing its direction twice (through 90° each time), causes a **rapid rise in air temperature**, with a resultant loss of some of the density gained by compression. Further losses are caused by friction, air leakage and buffet at the impeller and diffuser inlets.

- Temperature may be lowered by fitting a **heat exchanger (intercooler)**, or by injecting vaporising fuel into the eye of the impeller
- Friction and air leakage losses are reduced by small working clearances and shrouded impellers
- Buffet losses are reduced by curved inlet vanes on the impeller

The centrifugal compressor is robust in construction and fairly simple to manufacture. It will achieve a **pressure ratio of up to 4.5 to 1**.

## Internally Driven Superchargers

This type of supercharger is fitted downstream of the throttle valve and is driven by a splined shaft into the rear of the crankshaft. The drive usually incorporates a **spring drive unit**, a **centrifugal clutch**, and a train of intermediate gears, giving a step-up ratio of **6:1**.

The spring drive unit and centrifugal clutch protect the gear train from the excessive loads that result from rapid acceleration and deceleration of the engine. Because supercharger speed is proportional to engine speed, this type of supercharger maintains sea-level manifold pressure up to an altitude of approximately **10,000 ft**; for operation above that altitude, two impellers in series and/or two-speed drives may be necessary.

The power developed by a normally aspirated engine is maximum at sea level and progressively falls with an increase in altitude. The same engine fitted with a supercharger, at the same speed and manifold pressure, will have a **lower** maximum power output at sea level — the difference being the power required to drive the supercharger. However, as altitude increases, power output increases because the lower temperature raises the density of the induced charge, giving a greater weight of charge induced (assuming the supercharger maintains sea-level manifold pressure). A further small power increase results from better scavenging due to the lower atmospheric pressure acting on the escaping exhaust gases — this is known as **EXHAUST BACK PRESSURE**.

As the aircraft climbs, the supercharger output maintains sea-level manifold pressure through an automatic control system that progressively opens the throttle. Once the throttle is fully open, any further increase in altitude results in a fall in engine power, similar to a normally aspirated engine.

- The automatic control of manifold pressure is by a **pressure-sensitive device** acting on manifold pressure, which controls the degree of throttle opening
- At maximum power at sea level, the throttle valve is only **partially open**, preventing manifold pressures high enough to cause detonation
- As the aircraft climbs, the throttle valve is opened progressively to maintain the previously-set manifold pressure
- The altitude at which the throttle reaches fully open is known as **FULL THROTTLE HEIGHT**
- Any further increase in altitude beyond full throttle height brings a reduction in manifold pressure and power, as with a normally aspirated engine
- Full throttle height varies for different power settings; the full throttle height for **rated power** is known as **RATED ALTITUDE**

### The Variable Datum Automatic Boost Control (ABC)

Because the supercharger compresses low atmospheric air pressure at altitude to maintain sea-level conditions in the manifold, throttle opening must be restricted at low altitudes to prevent excessive manifold pressures (**OVERBOOSTING**), which could cause serious engine damage. The **Automatic Boost Control (ABC)** provides automatic control of manifold pressure up to full throttle height, relieving the pilot's workload. It is sensitive to manifold pressure, repositioning the throttle valve and controlling the quantity of air entering the eye of the impeller.

The ABC consists of an **aneroid** in a chamber open to manifold pressure, connected to a **relay valve** which uses engine oil pressure to position a **servo piston**, which in turn changes the position of the throttle butterfly valve.

- At slow running, low pressure in the manifold and aneroid chamber causes the aneroid to **expand**, moving the relay valve down and allowing oil to the underside of the servo piston. This holds the piston at the top of its stroke, straightening the cranked levers attached to the throttle-operating lever — giving the pilot direct control of the throttle via the cockpit lever.
- When the cockpit throttle lever is moved towards open, the variable cam depresses the aneroid and relay valve, and at the same time opens the throttle butterfly valve. Manifold pressure rises until it exceeds the pressure selected by the variable cam; the aneroid is then compressed enough to draw the relay valve up, directing oil to the top of the servo piston, moving it down and slightly closing the throttle — reducing manifold pressure back to the selected value.
- This motion returns the relay valve to its neutral position, and the hydraulic lock on both sides of the servo piston holds it stationary.
- Any further change in manifold pressure (e.g. due to changes in altitude) is felt by the aneroid, which causes the throttle butterfly valve to take up a new position to maintain the manifold pressure set by the variable datum cam.

## Externally Driven Superchargers

Externally-driven superchargers are powered by the energy of the engine exhaust gases, and do **not directly** lower the power output of the engine. They do, however, lower power output **indirectly**, because the turbine in the exhaust system restricts the free exit of the gases, causing an increase in exhaust back pressure. The power loss caused by the turbocharger is **less** than that caused by an internally-driven unit.

A **turbocharger** consists of a turbine wheel and a centrifugal compressor mounted on a common shaft. The casings of both units are connected by a bearing housing fed from the engine oil system, with cooling air directed between the casings. The exhaust manifold is connected to the turbine casing, and the air intake is connected to the compressor casing. The turbocharger may be mounted on the engine or nearby on the fireproof bulkhead, with suitable shielding to protect fuel and oil lines in the engine bay from heat.

The amount of exhaust gas passing through the turbine determines turbine speed, which in turn determines compressor output. This output is ducted to the throttle valve, which controls entry into the induction manifold. The supercharger output is also known as **UPPER DECK PRESSURE**, and must not build up to an unacceptable level. As density increases with altitude, a greater volume of air must be compressed to maintain a constant supercharger output pressure — achieved by the turbocharger running faster.

A regulator is required to prevent excessive supercharger outlet pressure and to allow the turbocharger to run at the speed needed to maintain the desired pressure, up to a critical altitude of approximately **16,000 ft**. The regulator is, in effect, a turbine bypass duct open to atmosphere, which varies the amount of exhaust gas passing to the turbine depending on the position of a valve within the duct.

### The Waste Gate

This valve is known as **THE WASTE GATE**. Its position ranges from fully closed (all exhaust gases pass through the turbine) to fully open (all exhaust gases pass directly to atmosphere), and is usually controlled automatically by devices sensitive to supercharger outlet pressure.

- The valve is moved to the **open** position by **engine oil pressure** acting on a spring-loaded piston within an actuator
- The valve moves to the **closed** position when spring pressure exceeds oil pressure
- Engine oil pressure is fed to the actuator through a restrictor; the actuator outlet return line connects to the waste gate controller
- When the controller opens the return line, oil flows back to the engine sump and pressure in the actuator falls, allowing the spring to move the waste gate towards **open**
- The extent to which oil pressure falls depends on the size of the bleed: the larger the bleed, the lower the oil pressure and the greater the amount of exhaust gas allowed to bypass the turbine — reducing supercharger output (Upper Deck Pressure)

The controller therefore controls actuator oil pressure, which determines waste gate position according to engine requirements.
        $cnt$,
        5
    ) RETURNING id INTO s5_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 16.6: Starting and Ignition Systems
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m16_id, 'M16.6', 'Starting and Ignition Systems',
        $cnt2$
# Starting and Ignition Systems

## Starting Systems

### Direct-Cranking Starters

Today, the most widely-used starting system on all types of reciprocating engines is the **direct-cranking starter**. A direct-cranking starter differs from an inertia starter in that it provides instant and continual cranking when energised, eliminating the need to store preliminary energy in a flywheel.

**Series-wound DC motors** are the most common direct-cranking starter motors because they are capable of producing high starting torque. Starter motor characteristics provide a relatively constant voltage throughout a starting cycle while drawing a very high current from the battery at the start of motor rotation — this high current draw provides the starting torque needed to crank the engine. However, as engine and starter speed increase, counter-electromotive force builds up and limits the amount of current the starter can draw.

Typically, starter circuits do **not** contain fuses or circuit breakers, because the initial starter motor current would otherwise create the nuisance of a tripped circuit breaker or blown fuse each time the engine is started.

The shift lever is attached by a cable to a handle in the cockpit. When the handle is pulled, the shift lever compresses the meshing spring and forces the pinion gear outward to mesh with the crankshaft starter gear. Once the pinion and starter gear are fully meshed, further movement of the shift lever closes the starter motor switch and the starter cranks the engine. When the engine starts, an **over-running clutch** allows the pinion to spin freely with the engine until the cockpit handle is released and the return spring pulls the pinion away from the starter gear.

### Bendix Starter

Another type of direct-cranking electric starter also uses a series-wound DC motor, but the over-running clutch is replaced by a **Bendix drive**, similar to that found on automobile engines. The Bendix drive, developed by the Bendix Corporation, consists of a drive spring, drive pinion, and drive shaft with helical splines.

- When the starter switch is closed, the starter motor spins the pinion through the Bendix drive spring
- The drive pinion fits loosely over the drive shaft; as the armature spins, the pinion moves forward on the helical splines and engages the teeth on the engine's flywheel, turning the engine
- When the engine starts, the spinning flywheel gear spins the Bendix drive pinion **faster** than the starter motor, forcing the pinion back along the helical splines until it disengages from the flywheel

### Large Engine Starters

Because of the increased force required to turn over a high-horsepower engine, a typical direct-cranking electric starter for large reciprocating engines must employ some sort of **reduction gear assembly**. The reduction gear assembly, the motor assembly, and an automatic engaging/disengaging mechanism are contained in a single starter unit.

The starter reduction gear assembly consists of a housing with an integral mounting flange, an integral gear assembly, a **planetary gear reduction**, a torque-limiting clutch, and a jaw and cone assembly. Starter motor torque is transmitted to the starter jaw through an internal gear assembly and reduction gear assembly.

### Auxiliary Starting Systems

One of the primary limitations of magnetos is that, when the magnet inside a magneto turns at a slow speed, the magneto produces relatively little voltage. As magneto speed increases, more current is induced into the primary circuit and the magneto produces a higher voltage spark. In most cases, the voltage generated at low magneto speeds is insufficient to fire a spark plug.

The speed at which a magnet must rotate to produce enough voltage to fire a spark plug is known as the magneto's **coming-in speed**. Although coming-in speed varies between magnetos, a typical value is between **100 and 200 rpm**.

When starting an engine, the starter motor cannot crank the engine fast enough for a magneto to reach its coming-in speed. In addition, since the spark event normally occurs prior to top dead centre on the compression stroke, normal ignition timing can cause the engine to **kick back** when started. To help prevent kick-back, some magnetos use a second set of **retard breaker points** to retard the spark during starting — the spark is delayed, in most cases until after the piston reaches top dead centre on the compression stroke.

Although retarded ignition promotes easier starting, it does nothing to increase the voltage a magneto generates at slow rotational speeds. To do this, almost all magnetos incorporate some form of **ignition booster**, such as the impulse coupling, induction vibrator, or shower-of-sparks ignition system.

### Impulse Couplings

Impulse couplings are one of the most widely-used auxiliary ignition devices found on magnetos. An **impulse coupling** is a small, spring-loaded device that provides a magneto with a momentary high rotational speed and a retarded spark, using a spring-loaded mechanical linkage that is wound up by the magneto drive gear and then released to momentarily increase the magneto's rotational speed.

Components of an impulse coupling include the impulse coupling body, a set of **flyweights** mounted to a cam, and a **coiled spring**. The cam assembly is keyed to the magneto shaft, while the impulse coupling body rotates with the engine; the coiled spring links the cam assembly and body together.

- When the engine is turned by the starter, the flyweights contact stop pins on the magneto housing, stopping magneto shaft rotation while the engine continues to rotate and wind up the spring
- As engine rotation brings a piston to top dead centre, a projection on the impulse coupling body contacts a trigger ramp on the flyweights, forcing them off the stop pins
- This releases the stored spring force and accelerates the magneto shaft fast enough to produce a **high-voltage, retarded spark**

An impulse coupling produces a high-voltage spark for every spark plug during starting. Once the engine starts and the magneto spins fast enough to provide a high voltage spark on its own, **centrifugal force** pulls the heel of the flyweights outward so they can no longer contact the stop pins — the impulse coupling is then disabled, and sparks revert to their normal **advanced** timing.

## Magneto Types, Construction and Principles of Operation

### The Mechanical System

The mechanical system of a magneto includes the housing, the magneto drive shaft, and all non-electrical portions of the magneto. Most magnetos are encased in an **aluminium alloy** housing, because aluminium does not interfere with the magnetic circuit while providing mechanical strength, rigidity, and light weight.

A single hardened steel shaft runs the length of the magneto, protruding from one end of the housing. Mounted to this shaft, inside the magneto, are the **rotating magnet**, a gear that drives the distributor, and a **cam**. The shaft is typically supported by ball or needle bearings.

### Types of Magneto

**The Rotating Armature Magneto** — the assembly of primary and secondary coils on a soft-iron core is known as the **armature**. In this type, the armature is mounted on a shaft driven from the engine and rotates between the poles of a permanent magnet. As only **two sparks** are produced per revolution of the armature, this type is normally used only on engines with up to **six cylinders**.

**The Rotating Magnet Magneto** — the most usual type is the **polar inductor magneto**, where the permanent magnets are stationary and soft-iron inductors, mounted on a non-magnetic shaft driven from the engine, guide the magnetic flux through the armature. **Four sparks** are produced per revolution of the inductor shaft, making this type suitable for engines with more than six cylinders. A second type has the magnet itself rotating inside the soft-iron inductors, but this arrangement can only produce **two sparks** per revolution.

### The Magnetic Circuit

The magnetic circuit consists of a rotating permanent magnet, pole shoes, pole shoe extensions, and a coil core. A rotating magnet may have **two, four, or eight** magnetic poles, arranged with alternating north and south poles spaced evenly around the drive shaft (e.g. on a four-pole magnet, all poles are 90° apart; on an eight-pole magnet, all poles are 45° apart).

Rotating magnets are often made from **Alnico**, an alloy of aluminium, iron, nickel and cobalt, which retains magnetism for an indefinite length of time. **Permalloy** is another alloy with similar qualities, also used for rotating magnet construction.

The rotating magnet is geared to the engine and rotates between two pole shoes, which are joined at one end by the **magneto coil core**. Both the pole shoes and coil core are constructed of several laminated layers of high-grade soft iron — the laminated construction reduces eddy currents, keeping the magneto cooler and boosting efficiency. Soft iron also has high permeability, allowing flux lines to pass through easily.

- When a pair of magnetic poles fully aligns with the pole shoes, flux density (and the magnetic field) through the coil core is at its **strongest** — this is the **full register position**
- As the magnet rotates beyond full register, the magnetic field collapses until no flux passes through the coil core — this is the **neutral position**, where the field is at its **weakest**
- Continued rotation again aligns the poles in full register, but with opposite orientation, so flux now flows in the **opposite direction**

One revolution of a two-pole magnet produces two positions of maximum flux concentration and two positions of zero flux flow, with the direction of flux travel reversing twice. This pulsating magnetic field induces current into the primary winding.

As the rotating magnet induces current into the primary winding, the magnetic field produced by that current opposes further current flow. Once flux density reaches its highest point and the field produced by the rotating magnet starts to collapse, the electromagnetic field from the current flow attempts to sustain (hold) the collapsing field until the magnet reaches the neutral position. Once the magnet rotates beyond neutral, a magnetic field of opposite polarity starts to build, and the greatest magnetic field stress exists at this point. The specific number of degrees beyond the neutral position where this occurs is known as the **efficiency gap**, or **E-gap angle**.

### The Primary Circuit

The primary electrical circuit consists of the primary winding of an insulated magneto coil, a set of **breaker points**, and a **capacitor**. The primary winding typically consists of **180 to 200 turns of 18-gauge copper wire**, coated with enamel insulation and wound directly over the laminated core. One end of the primary winding attaches to a ground lead; the other connects to the secondary winding and the insulated side of the breaker points.

The breaker points are normally mounted to the magneto housing and held closed by a leaf-type spring. A cam mounted on the end of the rotating magnet shaft forces one contact away from the other to open the points. To allow the magnet to induce the maximum current into the primary winding, the points are forced open at the **E-gap position**, where the greatest magnetic field stress exists. Opening the points at this moment interrupts primary current flow and allows current to be induced into the secondary coil. As the points close, the magnet is near full register, producing a quick reversal of the magnetic field in the coil core — causing a high rate of flux change.

Any time moving contact points interrupt current flow, an **arc** is produced between them. As the points begin to separate, their electrical resistance increases, and the current flowing through that resistance produces heat intense enough to ionise the air, allowing current to arc across. Arcing delays the collapse of the magnetic field in the primary winding and transfers metal from one breaker point to the other — if severe enough, it could weld the points together.

To reduce arcing, a **capacitor** is installed in parallel with the points. Electrons flow into the capacitor as the points begin to open; by the time the capacitor is charged enough to stop electron flow, the points have opened far enough that no arcing occurs. With primary current flow stopped, the magnetic field collapses rapidly, inducing a high-voltage pulse into the secondary circuit.

### The Secondary Circuit

The secondary circuit produces the high-voltage energy required to cause a spark, and comprises the secondary winding in the magneto coil and the distributor.

The current induced into the secondary winding depends on:
- The rate at which the magnetic field around the primary winding collapses
- The turns ratio between the primary and secondary windings

The secondary winding is made from approximately **13,000 turns** of very fine wire, giving a turns ratio capable of producing a **20,000 volt pulse**. One end of the secondary winding attaches to the primary winding (providing a path to ground); the other end attaches to a high-voltage contact protruding from the magneto coil body.

A spring-loaded carbon brush, mounted in the centre of the distributor rotor, carries current from the secondary winding into the distributor rotor. The rotor carries this high voltage to the electrodes for each spark plug in the distributor block, and is driven by a gear mounted to the magneto drive shaft. To allow the engine to operate, the **distributor rotor must complete one revolution for every two revolutions of the crankshaft** (a 2:1 ratio) — meaning a magneto fires all spark plugs once for each **720° of crankshaft rotation**.

A typical distributor block is constructed of a lightweight insulating material, mounted in one half of the magneto housing, with a set of electrodes on one side and corresponding receptacles for the spark plug leads on the other. Each time the rotating magnet is in the E-gap position, the distributor finger lines up with an electrode and delivers a high-voltage pulse. Current is then routed through the spark plug leads to the spark plugs, where it jumps the air gap between the centre and ground electrodes, completing the circuit back to the magneto.

**Safety Gap** — to protect the secondary winding, some magnetos provide an alternate ground path, called a **safety gap**, connected in series with the secondary winding by two electrodes (one connected to a high-tension brush holder, the other to a ground plate). If the path to the spark plug gap becomes interrupted, excessive voltage induced into the secondary winding jumps the safety gap to ground, preventing damage to the magneto coil.

### Magneto Speed

The distributor rotor always rotates at one-half engine crankshaft speed, since the crankshaft must complete two revolutions to fire each spark plug once. The speed of the rotating magnet shaft, however, varies with the number of cylinders and the number of poles on the rotating magnet, according to:

**Magneto speed (× crankshaft speed) = Number of cylinders / (2 × number of poles)**

*Worked example: a six-cylinder engine uses a magneto with a two-pole magnet. Magneto speed = 6 / (2 × 2) = 6/4 = 1.5 times crankshaft speed. So when the engine turns at 2,000 rpm, the magneto shaft rotates at 3,000 rpm.*

## Ignition Harnesses and Spark Plugs

### Ignition Harness

For any ignition system to be efficient, the high-voltage energy produced by a magneto must be delivered to the spark plugs with minimal loss. The purpose of an **ignition harness** is to deliver this high voltage from the magneto to the spark plugs through a low-resistance electrical path that keeps electrical leakage to a minimum. A typical ignition harness consists of individual ignition leads, one end of each attaching to a receptacle on the magneto distributor block and the other to a spark plug.

**Construction** — the conductor in a modern spark plug lead is made of either stranded wire or a single coiled conductor, typically encased in one or two layers of rubber or silicone insulation, covered with a braided metal shield. The insulation prevents current leakage, while the shielding collects and channels high-frequency electromagnetic waves emanating from the lead to ground, reducing radio interference. The shielding is typically impregnated with silicone to protect it from chafing and moisture.

Ignition leads are terminated with straight terminals whenever possible; sharp bends must be avoided, since the stress they impose causes weak points in the insulation over time, which could allow high-tension current to leak.

Modern terminal ends consist of a **silicone rubber nose** and coiled wire that slips into a spark plug body, often called an **all-weather terminal** because the silicone rubber forms a watertight seal at the top of the spark plug body — these terminals are crimped onto the lead and can be replaced if damaged.

Some older terminals use a phenolic or ceramic insulator tube commonly referred to as a **cigarette**, containing a coiled spring that extends beyond the insulator tube to provide positive electrical contact. Another older method used **cable-piercing screws** to connect ignition leads to a distributor block.

### Spark Plugs

Spark plugs transmit short impulses of high-voltage current from the ignition harness into the combustion chambers. The demands on a spark plug are severe: in an engine operating at **2,100 rpm**, approximately **17 separate ignition events occur per second** in each cylinder. Each ignition event begins with a **15,000 volt spark** jumping the air gap between the plug's electrodes. A spark plug must also operate at temperatures of **3,000°F or higher**, with gas pressures as high as **2,000 psi**.

**Construction** — a typical spark plug consists of three major parts:
- A durable **metal shell**
- A **ceramic insulator**
- An **electrode assembly**

The metal shell supports the internal components and provides an electrical path to ground for the braided shield of the ignition lead. All shielded spark plug shells are threaded at both ends: one end (terminal, or shield threads) allows the ignition lead to attach; the other permits the plug to be screwed into a cylinder. A hex nut is cast as part of the metal shell to facilitate installation and removal.

The ceramic insulator prevents high-voltage current from arcing to ground, usually in two overlapping sections. Nickel gaskets between the spark plug shell and insulator prevent the escape of high-pressure gases from the cylinder.

The electrode assembly consists of a terminal contact, a resistor, a glass seal, a centre electrode, and a set of outer electrodes. The resistor — typically **1,500 ohms** — prevents **capacitance afterfiring**: electrical energy induced into the ignition shielding as current flows through the lead, which, once built up, would otherwise release as a surge of current across the spark plug's air gap, lengthening spark duration and accelerating electrode wear.

- With a **massive-electrode** spark plug, the outer (ground) electrodes are typically made of a nickel alloy, and the centre electrode of nickel-clad copper
- With a **fine-wire electrode** spark plug, the ground electrode is made of platinum or iridium, and the centre electrode of silver

The ground and centre electrodes on all spark plugs are separated by an **air gap** of specified width; if the gap is not adjusted correctly, the intensity of the spark produced will also be incorrect.

### Spark Plug Classification

**Thread Classification** — spark plug thread is classified according to the size of the shell gasket seat to the end of the shell threads (shell skirt). Spark plugs are available in **long reach** or **short reach** sizes to suit differences in cylinder head construction. When the recommended plug is installed, the end of the threads should be flush with the cylinder head's inside wall.

- A long-reach plug fitted where a short-reach plug is required exposes the end threads directly to combustion heat and carbon build-up, making the plug difficult to remove for service
- A short-reach plug fitted where a long-reach plug is required exposes the cylinder head threads to combustion gases and possible damage

**Heat Range** — the heat range of a spark plug refers to its ability to conduct heat away from its firing tip to the cylinder head. Plugs are classified as **'hot'**, **'normal'**, or **'cold'**, depending on how well they transfer heat, determined primarily by the length of the **nose core**:

- **Cold plugs** have a relatively short nose core, giving a large contact area between the ceramic insulator and plug shell, so heat conducts readily to the cylinder head
- **Hot plugs** have a relatively long nose core, giving little contact area for heat to dissipate

All aircraft engines are certified for a specific spark plug heat range. As a general rule, high-compression engines operate at high temperatures and use **cold** spark plugs; lower-compression engines operate at relatively low temperatures and use **hot** spark plugs.

- If a **hot** plug is installed in an engine requiring a cold plug, the hotter operating temperature could lead to **preignition or engine run-on**
- If a **cold** plug is installed in a cold-running engine, the plug could become **fouled** with unburned carbon and lead deposits
        $cnt2$,
        6
    ) RETURNING id INTO s6_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M16.5 Supercharging and Turbocharging (9 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s5_id, 'On a normally aspirated engine, manifold pressure at full throttle is:',
     '[{"id":"a","text":"Always slightly lower than atmospheric pressure owing to intake duct losses","correct":true},{"id":"b","text":"Always higher than atmospheric pressure","correct":false},{"id":"c","text":"Completely independent of atmospheric pressure","correct":false}]',
     '{"B1"}'),

    (s5_id, 'Engines whose construction has been strengthened (crankshaft, main bearings, connecting rods, pistons and gudgeon pins) to withstand increased sea-level power for take-off and climb are known as:',
     '[{"id":"a","text":"Altitude boosted engines","correct":false},{"id":"b","text":"Ground boosted engines","correct":true},{"id":"c","text":"Normally aspirated engines","correct":false}]',
     '{"B1"}'),

    (s5_id, 'In a centrifugal compressor, the rotating disc carrying the vanes is called the impeller, and the surrounding ring of stationary vanes is called the:',
     '[{"id":"a","text":"Volute","correct":false},{"id":"b","text":"Diffuser","correct":true},{"id":"c","text":"Manifold","correct":false}]',
     '{"B1"}'),

    (s5_id, 'The function of the diffuser vanes in a centrifugal compressor is to:',
     '[{"id":"a","text":"Guide the air into the volute while reducing its velocity and increasing its pressure","correct":true},{"id":"b","text":"Accelerate the air to the highest possible velocity before it enters the manifold","correct":false},{"id":"c","text":"Cool the air before it enters the impeller eye","correct":false}]',
     '{"B1"}'),

    (s5_id, 'A typical centrifugal compressor used for supercharging can achieve a pressure ratio of up to approximately:',
     '[{"id":"a","text":"1.5 to 1","correct":false},{"id":"b","text":"4.5 to 1","correct":true},{"id":"c","text":"10 to 1","correct":false}]',
     '{"B1"}'),

    (s5_id, 'The drive to an internally driven (gear-driven) supercharger usually incorporates a spring drive unit and a centrifugal clutch. Their purpose is to:',
     '[{"id":"a","text":"Protect the gear train from excessive loads caused by rapid engine acceleration and deceleration","correct":true},{"id":"b","text":"Increase the maximum speed the impeller can reach","correct":false},{"id":"c","text":"Reduce the weight of the supercharger assembly","correct":false}]',
     '{"B1"}'),

    (s5_id, 'The altitude at which the throttle valve of a supercharged engine reaches the fully open position, while still maintaining the set manifold pressure, is known as:',
     '[{"id":"a","text":"Rated altitude","correct":false},{"id":"b","text":"Full throttle height","correct":true},{"id":"c","text":"Critical altitude","correct":false}]',
     '{"B1"}'),

    (s5_id, 'In the Variable Datum Automatic Boost Control (ABC), the servo piston that repositions the throttle butterfly valve is actuated by:',
     '[{"id":"a","text":"Engine oil pressure, directed by a relay valve responding to an aneroid sensing manifold pressure","correct":true},{"id":"b","text":"Direct mechanical linkage from the cockpit throttle lever only, with no automatic control","correct":false},{"id":"c","text":"Fuel pressure acting directly on the throttle butterfly","correct":false}]',
     '{"B1"}'),

    (s5_id, 'Compared with an internally (gear) driven supercharger, an externally driven turbocharger:',
     '[{"id":"a","text":"Directly reduces engine power by absorbing crankshaft power to drive the compressor","correct":false},{"id":"b","text":"Only indirectly reduces engine power, via increased exhaust back pressure from the turbine, and this loss is less than that of an internally driven unit","correct":true},{"id":"c","text":"Has no effect whatsoever on engine power output","correct":false}]',
     '{"B1"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M16.6 Starting and Ignition Systems (16 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s6_id, 'A direct-cranking starter differs from an inertia starter in that it:',
     '[{"id":"a","text":"Provides instant and continual cranking when energised, without storing preliminary energy in a flywheel","correct":true},{"id":"b","text":"Must first spin up a flywheel before engaging the engine","correct":false},{"id":"c","text":"Can only be used on engines with fewer than four cylinders","correct":false}]',
     '{"B1"}'),

    (s6_id, 'Series-wound DC motors are the most common type of direct-cranking starter motor primarily because they:',
     '[{"id":"a","text":"Are capable of producing a high starting torque","correct":true},{"id":"b","text":"Require no electrical current to operate","correct":false},{"id":"c","text":"Run at a constant, low current throughout the starting cycle","correct":false}]',
     '{"B1"}'),

    (s6_id, 'Starter motor circuits typically do not include fuses or circuit breakers because:',
     '[{"id":"a","text":"The very high initial starter current would otherwise trip the breaker or blow the fuse on every start","correct":true},{"id":"b","text":"Starter motors draw negligible current at start-up","correct":false},{"id":"c","text":"Fuses are not compatible with DC motors","correct":false}]',
     '{"B1"}'),

    (s6_id, 'In a Bendix drive starter, once the engine starts, the drive pinion is disengaged from the flywheel because:',
     '[{"id":"a","text":"The pilot manually releases the cockpit handle","correct":false},{"id":"b","text":"The spinning flywheel drives the pinion faster than the starter motor, forcing it back along the helical splines","correct":true},{"id":"c","text":"An electrical solenoid retracts the pinion","correct":false}]',
     '{"B1"}'),

    (s6_id, 'The typical range of a magneto''s "coming-in speed" — the rotational speed at which it first produces enough voltage to fire a spark plug — is approximately:',
     '[{"id":"a","text":"10 to 20 rpm","correct":false},{"id":"b","text":"100 to 200 rpm","correct":true},{"id":"c","text":"1,000 to 2,000 rpm","correct":false}]',
     '{"B1"}'),

    (s6_id, 'Some magnetos use a second set of retard breaker points during starting. The purpose of these points is to:',
     '[{"id":"a","text":"Advance the spark to well before top dead centre for maximum starting power","correct":false},{"id":"b","text":"Delay the spark, typically until after top dead centre on the compression stroke, to help prevent engine kick-back","correct":true},{"id":"c","text":"Increase the voltage produced by the magneto at low rpm","correct":false}]',
     '{"B1"}'),

    (s6_id, 'An impulse coupling produces a momentary high magneto rotational speed and a retarded, high-voltage spark by:',
     '[{"id":"a","text":"Winding up a coiled spring, via flyweights held against stop pins, then releasing it to accelerate the magneto shaft","correct":true},{"id":"b","text":"Directly connecting the aircraft battery to the magneto secondary circuit","correct":false},{"id":"c","text":"Reversing the direction of magneto rotation during starting","correct":false}]',
     '{"B1"}'),

    (s6_id, 'Once an engine has started and the magneto is producing a high voltage spark on its own, the impulse coupling is disabled because:',
     '[{"id":"a","text":"Centrifugal force pulls the flyweights outward so they can no longer contact the stop pins","correct":true},{"id":"b","text":"The pilot switches it off from the cockpit","correct":false},{"id":"c","text":"Oil pressure locks the flyweights in the disengaged position","correct":false}]',
     '{"B1"}'),

    (s6_id, 'In a rotating armature magneto, the number of sparks produced per revolution of the armature, and the resulting typical cylinder-count limit, are:',
     '[{"id":"a","text":"Four sparks per revolution; suitable for more than six cylinders","correct":false},{"id":"b","text":"Two sparks per revolution; normally used only on engines with up to six cylinders","correct":true},{"id":"c","text":"One spark per revolution; suitable for any number of cylinders","correct":false}]',
     '{"B1"}'),

    (s6_id, 'In a polar inductor magneto, the permanent magnets are stationary while soft-iron inductors rotate to guide the flux. This type produces:',
     '[{"id":"a","text":"Two sparks per revolution of the inductor shaft","correct":false},{"id":"b","text":"Four sparks per revolution of the inductor shaft, suiting engines with more than six cylinders","correct":true},{"id":"c","text":"Eight sparks per revolution of the inductor shaft, regardless of cylinder count","correct":false}]',
     '{"B1"}'),

    (s6_id, 'The point in magnet rotation where flux density through the coil core is at its greatest is called the full register position; the point where flux flow through the core is at its weakest is called the:',
     '[{"id":"a","text":"E-gap position","correct":false},{"id":"b","text":"Neutral position","correct":true},{"id":"c","text":"Breaker position","correct":false}]',
     '{"B1"}'),

    (s6_id, 'The breaker points in a magneto primary circuit are forced open at the point of greatest magnetic field stress, which is known as the:',
     '[{"id":"a","text":"Neutral position","correct":false},{"id":"b","text":"Full register position","correct":false},{"id":"c","text":"E-gap (efficiency gap) position","correct":true}]',
     '{"B1"}'),

    (s6_id, 'The purpose of the capacitor connected in parallel with the magneto breaker points is to:',
     '[{"id":"a","text":"Store energy to help start the engine on a weak battery","correct":false},{"id":"b","text":"Reduce arcing at the points by absorbing the flow of electrons as the points open, allowing the primary field to collapse rapidly","correct":true},{"id":"c","text":"Step up the primary voltage before it reaches the coil","correct":false}]',
     '{"B1"}'),

    (s6_id, 'The distributor rotor of a magneto must complete one revolution for every two revolutions of the crankshaft, meaning all spark plugs are fired once for every:',
     '[{"id":"a","text":"360° of crankshaft rotation","correct":false},{"id":"b","text":"720° of crankshaft rotation","correct":true},{"id":"c","text":"180° of crankshaft rotation","correct":false}]',
     '{"B1"}'),

    (s6_id, 'A six-cylinder engine is fitted with a magneto having a two-pole rotating magnet. Using magneto speed = number of cylinders / (2 x number of poles), if the engine is turning at 2,000 rpm, the magneto shaft rotates at approximately:',
     '[{"id":"a","text":"1,333 rpm","correct":false},{"id":"b","text":"2,000 rpm","correct":false},{"id":"c","text":"3,000 rpm","correct":true}]',
     '{"B1"}'),

    (s6_id, 'The resistor built into a spark plug''s electrode assembly, typically of around 1,500 ohms, serves to:',
     '[{"id":"a","text":"Prevent capacitance afterfiring, which would otherwise lengthen spark duration and accelerate electrode wear","correct":true},{"id":"b","text":"Limit the spark plug''s operating temperature","correct":false},{"id":"c","text":"Increase the voltage delivered to the centre electrode","correct":false}]',
     '{"B1"}'),

    (s6_id, 'A spark plug with a relatively short nose core, giving a large contact area between the ceramic insulator and the shell so that heat conducts readily to the cylinder head, is classified as a:',
     '[{"id":"a","text":"Hot plug","correct":false},{"id":"b","text":"Cold plug","correct":true},{"id":"c","text":"Fine-wire plug","correct":false}]',
     '{"B1"}'),

    (s6_id, 'Fitting a hot spark plug in an engine that requires a cold plug can lead to:',
     '[{"id":"a","text":"Preignition or engine run-on, due to the plug''s higher operating temperature","correct":true},{"id":"b","text":"Fouling of the plug with unburned carbon and lead deposits","correct":false},{"id":"c","text":"No adverse effect, provided the electrode gap is correct","correct":false}]',
     '{"B1"}');

END $$;
