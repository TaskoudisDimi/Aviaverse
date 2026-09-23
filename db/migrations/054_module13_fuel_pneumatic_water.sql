-- Module 13: Aircraft Aerodynamic Structures (B2) — Fuel Systems, Pneumatic and Vacuum Systems, Water and Waste Systems
-- Source: EASA Part-66 Module 13 official textbook (IKAROS Aviation Training Centre — 13.13 Fuel Systems, 13.18 Pneumatic & Vacuum, 13.19 Water & Waste)

DO $$
DECLARE
    m13_id INT;
    s13_id INT;
    s18_id INT;
    s19_id INT;
BEGIN
    SELECT id INTO m13_id FROM easa_modules WHERE code = 'M13';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M13.13') THEN
        RAISE NOTICE 'M13.13/M13.18/M13.19 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 13.13: Fuel Systems
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m13_id, 'M13.13', 'Fuel Systems',
        $cnt$
# Fuel Systems

## System Layout

The purpose of the fuel system is to store and deliver fuel to the engines and the APU. An aircraft must be able to carry sufficient fuel to enable the engines to operate over long periods, so there must be some way of storing the fuel safely and supplying it to the engines in a suitable condition and at a controlled rate.

A typical fuel system consists of a number of tanks, fuel lines, connections and fittings compatible with all types of fuel meeting engine and APU specifications. Often the fuel system is subdivided into **storage, refuelling, distribution, transfer, venting and indicating** subsystems. Some operators install centre tanks for additional range, offered as optional on most single-aisle and wide-bodied aircraft.

## Fuel Tank Construction

Fuel tanks normally fall into three categories of construction:

- **Rigid**
- **Flexible**
- **Integral**

Whatever the construction method, fuel tanks should be shaped so that almost all the fuel is available to the engine; awkward pockets which prevent fuel leaving the tank are avoided if possible.

### Rigid Tanks

Rigid tanks are normally made from metal or plastic material and fitted internally where space permits. Metal fuel tanks are constructed from **aluminium alloy, stainless steel or tinned steel**, riveted, welded or soldered together. The tank structure is strengthened by internal stiffeners, angle pieces and baffles, which are necessary in large tanks to reduce the effects of fuel surge when the aircraft manoeuvres. A rigid tank is secured within the airframe by built-in padded cradles and padded metal straps, shaped to match the tank contours.

Very few aircraft over **5,700 kg** would use metal rigid tanks, except when long range tanks are fitted in the cargo hold (e.g. commercial IATA LD6 containers).

### Flexible Fuel Tanks

Flexible tanks may have thin, very flexible walls (**bag tanks**) or thicker, less flexible material. Their flexibility allows them to be folded and inserted through a small aperture that would not allow a rigid tank of similar capacity to be fitted, so a greater fuel capacity is made available. When filled with fuel, the tank expands to contact the walls of the compartment so that the weight of the fuel is carried by the aircraft structure, not by the tank — so flexing of the structure does not impose harmful loads on the tank material. Flexible tanks are resilient, like an inner tube, and can withstand considerable distortion or shock loading; if not completely full, a flexible tank is unlikely to burst on crash impact.

**Protective covering:** usually several layers of fabric, or fabric and rubber, cemented to the tank material with adhesives. A tank fitted with a protective cover generally becomes stiff enough to support its own weight. Tanks without protective covers are reinforced by nylon fabric or net instead — this type remains very flexible and limp, cannot support its own weight, and is sometimes called a **'bag tank'**.

**Self-sealing coverings** reduce the magnitude of a fuel leak if the tank is pierced or ruptured. They are usually made from layers of cellular rubber with an overall protective cover of glass fabric or nylon fabric. The cellular rubber swells on contact with fuel and forces its way into the puncture to block the hole and reduce or stop the leak. Minor leaks may remain undiscovered until the self-sealing cover begins to swell and bulge on the outside.

**Attachments and fittings:** each aperture in a flexible tank is strengthened and stiffened by fitting a metal attachment ring, sometimes called a **'stud ring'** or **'bolt ring'**.

### Integral Fuel Tanks

Primary wing structure is used for integral tanks. They are normally located between the front and rear wing spars and between the upper and lower wing skin. Solid **'tank end' ribs** close the ends of each tank, while all other ribs act as fuel baffles to minimise fuel slosh. A centre tank often traverses the fuselage between the two inner wing root ribs.

All fuel tanks are fuel tight: close metal-to-metal fit of all parts forms the basic seal, with sealing compounds and sealing fasteners on all joints completing the fluid-tight seal. The centre tank has a secondary external barrier coating to prevent fuel vapour entering the pressurised section of the fuselage. Some wing ribs contain free-swinging, fuel-actuated **baffle check valves**, to prevent fuel flow away from the electric boost pumps. The outer portion of the wing provides fuel overflow by means of a **surge tank**, which also affords venting into the system.

**Integral tank sealing:** structural parts are cleaned to a specification, coated with a special sealant, and assembled wet. Joints must be finished (rivets closed or bolts tightened) before the sealant sets. The first coating of sealant is the **'interfay'**, which bonds with all parts of the joint. After the joint is tightened, surplus sealant is removed and a neat coating is applied at the joint edges — the **fillet** — strong enough to cope with flexing between the parts. A final brush-on coat overlaps the joint and fillet. A quicker-drying **barrier coating** may also be applied over partially cured sealant to reduce contamination from swarf, aiding production — but the barrier coat is not the sealant and will not prevent or cure leaks.

Large commercial aircraft generally have three tanks in each wing: inner, outer and surge tank, with a centre tank sometimes available as a standard option. Each fuel tank has additional space for **2% expansion** of the fuel without spillage into the surge tank.

**Water draining:** water drain valves are provided at low points of each tank; valves may be opened with standard tools and the outer seal is replaceable without emptying the tanks.

**Water scavenge system:** a typical system is fitted in the optional centre tank. Two **jet pumps**, using tappings on the tank pumps for motive power, collect water from low points and discharge it towards the fuel pump inlet.

## Engine Fuel Feed

### Design Requirements

A fuel system must be designed to comply with requirements laid down in the Joint Airworthiness Requirements, including:

- A flow of fuel at a rate and pressure to ensure proper engine functioning for each operating condition
- Supply to each engine through a system independent of the system supplying any other engine
- No pump can draw fuel from two or more tanks simultaneously unless means prevent introduction of air
- Fuel tank vents and transfer systems designed so no structural failure occurs from over-filling
- Integral tanks must have facilities for interior inspection and repair
- Fuel tanks located so no fuel is released near the engines in sufficient quantity to start a fire in survivable crash conditions
- Pressure cross-feed lines through crew/passenger/cargo compartments must be enclosed in a fuel/vapour-proof, ventilated and drained enclosure, OR be a pipe without fittings, protected against damage
- Means to prevent collection of water/dirt or deposition of ice
- Lines isolated by valves must have provision for relief of excess pressure from fuel expansion
- Filler connections marked with fuel type, with a bonding point and drain
- A fuel strainer at each fuel tank outlet or booster pump
- Fuel lines designed and supported to prevent excessive vibration, allowing deformation/stretching without leakage

### Multi-Tank Systems

Multi-tank fuel systems may use a **low-pressure fuel booster pump** in each tank, located in collector tanks equipped with check valves for one-way fuel flow. Alternatively, some systems use groups of tanks that feed **collector tanks**.

In a typical fuel cell arrangement, each engine is normally supplied from one pump in the optional centre tank, or both pumps in the tank of its own wing; any one pump can supply the maximum demand of one engine. A **cross-feed pipe**, controlled by a double motor actuated spherical plug valve mounted on the rear spar, allows both engines to be fed from one side, or all fuel to be used by one engine.

Two plug-in AC-driven booster pumps supplied from different busbars are fitted in each tank. Pumps deliver fuel via a built-in non-return valve into a single pipe. Wing tank pumps are fitted with **pressure relief sequence valves** ensuring that, when all pumps run, the centre tank pumps deliver fuel preferentially (no sequence valves on a two-tank version aircraft). In each wing tank the pumps are located in a collector box fed by gravity through flap non-return valves, allowing continued supply under negative 'g' or transient manoeuvres; a bypass permits gravity feed. Air release valves are fitted to the feed lines.

Fuel supply to each engine can be shut off by an engine **LP valve** mounted on the front spar — a spherical plug valve driven by a double motor actuator, with the two actuators supplied from different busbars and cables routed separately for integrity. LP valves are controlled by operating the engine fire handles.

## Fuel Feed Components

**Fuel pumps (booster pumps):** each tank is normally provided with two identical, interchangeable pumps, installed in canister assemblies to enable replacement without de-fuelling the tank. The pumps are **centrifugal pumps driven by 115 volt, three-phase motors**. Output of each pump is about **250–300 litres per minute**, with maximum fuel pressure at zero flow of about **38 psi**. Each pump includes a non-return and a by-pass valve — the by-pass valve reduces the pressure drop, allowing an engine to be operated on suction feed up to about **6,000 ft**. Pumps are protected by a thermal fuse, activated at approximately **175°C**. Special features on some pumps include a pressure relief valve, non-return valve, AC/DC motor, thermal trip devices, and a canister shut-off valve to facilitate pump replacement with fuel in the tanks.

**Jet pumps** are another method of transferring fuel around the system. They use fuel bled from the booster pump, continually fed through a central nozzle into a venturi. The depression created in the venturi draws fuel from the surrounding tank, through a filter and up through the venturi tube, into the next fuel tank or straight to the collector box.

**Sequence valves** give automatic transfer from one tank to another. In a typical example (centre, inner and outer tank pumps), the sequence valve limits the fuel pressure of the outer tank pumps from **38 psi to 17.5 psi**, giving priority to the inner tank fuel pumps for structural reasons. When the inner tanks are empty, the engines are automatically supplied from the outer tanks, so the outer fuel pumps run continuously.

**Transfer valves** enable transfer between tank cells (e.g. two cells split at a rib), actuated by a signal from low level sensors.

**L.P. valve:** enables isolation of the fuel system in the event of fire and for engine maintenance (e.g. engine removal). Located at the top of the pylon on the outside of the front wing spar, controlled normally by operation of the fire handles, activated by a pair of electric motors or mechanically.

**Cross feed valve:** enables fuel to be fed to any engine from any tank. Normally a spherical type construction with two 28 VDC electric motors mounted on a differential gearbox — one motor drives the valve, the other is a back-up. Normally fitted on the rear spar.

## APU Fuel Feed

The feed to the APU is taken from the left engine feed but may be taken from the right engine feed when the cross-feed valve is open. Tank booster pumps can supply fuel to the APU at the required pressure. For starting the APU without electrical power for the tank pumps, a separate pump is provided, operated from the aircraft batteries and mounted in the feed line on the rear spar of the centre section. The APU fuel supply can be shut off by a valve mounted on the rear spar of the centre section — a spherical plug valve driven by a double motor actuator, with actuators from different busbars and separated cable routes. The feed pipe passes through the pressurised fuselage in a drained and vented shroud extending to the APU fire wall.

## Dumping, Venting and Draining

### Dumping (Jettison)

Fuel jettison systems are fitted to a number of large commercial aircraft to allow jettisoning of fuel in an emergency, reducing weight to prevent structural damage on landing. Jettison systems are often fitted after installation of a centre tank, because of the extra fuel weight.

The jettison pipe is branched off the feed pipe between the inner tank fuel pump and the inner tank shut-off valve. A **check valve** separates the outer tanks during jettisoning, preventing the dumping of the outer tanks' fuel. The jettison pipe runs inside the wing tanks through the ribs into the outer tanks, where jettison valves — fitted to the bottom of the tank — are located, driven by two 28 VDC electric motors.

The outlet of the jettison pipe is normally at the end of the flap track fairing and fitted with an **anti-corona device** to avoid vaporisation of the fuel. A normal transfer rate is in the region of **30–350 litres per minute**.

Jettison operation is controlled from a jettison panel (flight engineer's station or overhead panel), normally protected by a quick release cover, with a primary switch for motor number one and a guarded secondary switch for motor number two. Jettison valve position is monitored by magnetic indicators, showing green cross-line when closed and in-line when open, and amber cross-line to indicate transit or malfunction.

### The Vent Sub-System

An air vent is fitted to the top of each tank to allow free flow of air in and out as the fuel level rises and falls (inwards and outwards venting), preventing over-pressurisation as fuel level rises and depressurisation as it falls. The vent sub-system must also cope automatically with expansion and contraction of the fuel due to heat, allowing air (and sometimes fuel) to escape via vent pipes, and allowing air in during contraction as outside air temperature decreases.

**Unpressurised system venting** is a simple method connecting fuel tank vent orifices directly to a vent pipe gallery leading to atmosphere, found mainly in small aircraft, some helicopters and aircraft with low flight ceilings. Disadvantages of 'open orifice'/'open vented' tanks include fuel venting during manoeuvres, limits on maximum ceiling (fuel boils at low ambient pressure at altitude), danger of cavitation in fuel supply lines, and increased evaporation rate (**Reid Vapour Pressure**, RVP — the rate at which fuel gives off vapour), leading to greater fire risk.

**Pressurised fuel tanks:** on most large aircraft, fuel tanks are vented through a pipe connected to the surge vent tank, sized to prevent tank overpressure in the event of a refuel cut-off failure. The centre tank vent pipe ends inside the surge vent tank at the top; inner and outer vent pipes end about **3 centimetres** above the bottom of the surge vent tank, so any fuel overflowing into the surge vent tank is drawn back into the wing tanks by suction while one or more fuel pumps run. Each vent tank is vented to atmosphere via the **NACA valve**, which ensures tank pressurisation during flight and allows fuel to flow out in the event of a high level cut-off failure during refuelling. A **frangeable disc** may be fitted in the surge tank to prevent structural damage from over-pressure, and a **flame arrester** is fitted in the NACA intake in case of ground fires.

**Float valves:** each wing tank has an additional vent opening, connected to the venting line and controlled by a vent float valve at the highest point of the tank.

**Vent pipe drains:** at the lowest points of each vent pipe, a self-draining non-return valve (made of synthetic rubber) is fitted.

### Cross-Feed and Transfer

Cross-feed valves permit transfer of fuel from any tank to any engine, whereas transfer valves enable fuel to be transferred from tank to tank.

**Auto-transfer:** where a wing has lateral dihedral, fuel pumps are normally inboard with fuel flow towards the wing root. The outboard tank automatically transfers into the inboard tank and so empties first — a transfer valve between inboard and outboard tanks opens automatically whenever a high level float switch in the inboard tank detects it is not full.

**Manual transfer:** no in-flight transfer of fuel between left and right mainplanes is possible for reasons of trim, but fuel can be fed from any tank to any engine by boost pump selection and opening a cross-feed valve from the flight deck.

## Indications and Warnings

Provision is made to display fuel tank quantity, boost pump low pressure, cross-feed valve and fuel/fire shut-off valve position on the flight deck overhead panel. Aural and visual warnings on the glare shield result if the fuel system develops a fault.

## Fuel Level Sensing

Modern aircraft use thermistors to send signals through amplifiers to actuate warnings and sequencing; older aircraft may use float switches. Float-operated switches are of a magnetic type, designed to isolate the electrical mechanism from the fuel tank for safety. Whether float switches or thermistors are used, their functions are:

1. High level sensing
2. Overflow sensing
3. Low level sensing
4. Under full level sensing
5. Calibration sensing (fuel trim only)

**High level sensing:** prevents overfilling. When fuel washes around the sensor, the associated refuel/defuel valve closes and the **blue FULL light** on the fuelling panel comes on.

**Overflow sensing:** if the high level shut-off system fails, fuel enters the adjacent vent tank and washes around the overflow sensor, indicated by the **amber FULL light** on the refuel panel.

**Low level sensing:** divided into outer tank low level and inner/centre tank low level. If the outer tank LO LVL sensor is exposed to air, the associated amber LO LVL light comes on.

**Calibration sensing (fuel trim only):** calibration sensors in centre tanks, inner tanks and trim tank give a signal at a predetermined filling level in the trim tank for accuracy testing of the fuel quantity indication during refuelling.

**Under full level sensing:** when fuel quantity drops in either outer tank below a certain level, maximum flight speed (**VMO**) is reduced to protect the wing structure; sensor signals are sent to the Air Data Computer (ADC).

## Fuel Quantity System — Measurement and Indication

The system measures fuel quantity in the tanks, indicates it (fuel quantity indicator, pre-selector, ECAM fuel page/EFIS), controls automatic refuelling, and messages fuel quantity to the flight management computer. The system comprises a fuel quantity computer, capacitance probes, a capacitance index compensator, a condensicon sensor, an attitude sensor, a THS position detector, and associated flight compartment indicators.

### Principle of Capacitance Gauging

A capacitor stores electrical charge. The amount of charge depends on three physical properties: the surface area of the plates, the size of the gap between the plates, and the insulating material (dielectric) between the plates. In a fuel tank "capacitor stack", the plate area and gap are fixed — the only variable is the dielectric, which is either fuel or air (or both). As the fuel level falls, the dielectric gradually changes to air and the stored charge reduces; this change in capacitance is sensed by a signal conditioner, so the change in fuel level is sensed.

### Fuel Quantity Indicating System

Each tank has a group of probes arranged so a minimum of one probe is immersed at all times (number varies by aircraft). In one wide-bodied twin example fitted with a fuel trim system: **6 probes in each outer tank, 6 in each inner tank, 4 in the centre tank**. Probes of each group are wired in parallel to a summing adapter on the wing rear spar, sending level signals to the fuel quantity computer.

A **capacitance index compensator** is installed in each tank at the lowest located capacitance probe, sensing different types of fuels and additives to correct fuel readings.

**Measurement** accuracy is improved by further signals: the capacitance index compensator (balances fuel types); the condensicon sensor (senses density and dielectric constant of running fuel while refuelling); the attitude sensor (senses aircraft attitude to roll and pitch axes, on ground and in flight, depending on the AIR/GRND signal); and the THS position detector (senses THS position for correction of trim tank fuel measurement). The fuel quantity indicator normally displays fuel quantity in **10 kg steps**; the indicator sends feedback signals to the computer to avoid transmission errors and is also used for test purposes.

## Refuelling and De-fuelling

As any liquid flows through a pipeline it produces static electricity, which — if discharged in the presence of aviation fuel vapour — could cause an explosion. Refuelling safety precautions include:

- Use the correct grade of fuel (Av-gas, Av-tur, Av-tag)
- No smoking within 15 m
- No metal-studded or tipped footwear
- Correct bonding of aircraft and bowser
- Correct positioning of the bowser
- No vehicles or ground equipment under the aircraft
- Maintenance activity kept to a minimum
- No replenishment of LOX
- No transmitting of radar
- Aircraft and bowser not left unattended
- Check and remedy fuel spillage or leakage
- Appropriate fire appliance readily available
- The electrical state of the aircraft must not change while connected to the bowser

For small aircraft, refuelling is similar to filling a car, though it may be necessary to re-fuel to less than full to keep the aircraft within weight limits when fully loaded. Larger aircraft with multiple tanks may need to be filled in a specific lateral order (e.g. inner tanks first) to reduce bending load on the wing spars, and — where fin, tailplane or rear fuselage tanks are fitted — refuelled in the correct longitudinal order to maintain stability.

**Pressure refuelling** has replaced open line refuelling on most modern large aircraft with high fuel capacities, since filling through a normal hose and nozzle would take hours. A large diameter hose is rigidly connected to a coupling, and fuel under pressure of about **40 psi** is pumped into the tanks. The total fuel load can often be pre-set at the connection point so refuelling stops automatically at the correct quantity.

In pressure refuel operation, fuel flows from the refuel adapters into the refuel/jettison manifold; when refuel valves open, fuel flows into the tanks via a flow tube that decreases exit force and distributes fuel within the tank. As each tank reaches full, the high level sensor signals the refuel valve to close. Remaining fuel in the manifold drains into the main tanks through manifold drain valves; two vacuum relief valves permit air into the manifold as fuel drains. If a refuel system failure prevents the refuel valves closing, fuel goes into the surge tanks; if it reaches the level of the surge tank float switches, the switch closes and all refuel valves close.

**De-fuelling** a pressure-type system is almost the reverse of refuelling: a de-fuel bowser is connected to the single fuel point coupling, and using a combination of the bowser's suction pump and the aircraft's own booster pumps, selected tanks have their contents returned to the bowser.

## Longitudinal Balance and Supersonic Fuel Transfer

The weight of fuel is a large percentage of an aircraft's total weight, and aircraft balance changes as fuel is used. In small aircraft, tanks are located near the centre of gravity so balance changes little as fuel is used. In large aircraft, fuel tanks are installed in every available location, and fuel valves allow the flight engineer to keep the aircraft balanced by scheduling fuel use from various tanks; high performance military jets and modern civil aircraft may use a fully automatic fuel scheduling system to reduce flight crew workload.

In **supersonic flight**, the aerodynamic centre of pressure moves aft, changing longitudinal stability. This was compensated in aircraft like **Concorde** by moving the centre of gravity — shifting fuel as necessary between fuel tanks in the rear fuselage and the wings.
        $cnt$,
        15
    ) RETURNING id INTO s13_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 13.18: Pneumatic and Vacuum Systems
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m13_id, 'M13.18', 'Pneumatic and Vacuum Systems',
        $cnt2$
# Pneumatic and Vacuum Systems

## General

Pneumatic systems are fluid power systems that use a compressible fluid — air. These systems are dependable and lightweight, and because the fluid is air there is no need for a return system.

Some aircraft have only a low pressure pneumatic system to operate the gyro instruments; others use compressed air as an emergency backup for lowering the landing gear and operating the brakes in the case of hydraulic failure. Other aircraft have a complete pneumatic system that actuates the landing gear retraction, nose wheel steering, passenger doors and propeller brakes.

## Safety Precautions

When working on bleed air systems:

- Bleed air is hot — do not touch pipes and ducts
- Always replace seals (normally crush seals) when replacing joints
- Tighten clamps to the torque figure quoted in the Maintenance Manual
- Never lever against ducts, as dents cause hot spots
- All duct supports and struts must not put any strain onto the duct

## Full Pneumatic Systems

Most aircraft use hydraulic or electrical power for landing gear systems, but some use air systems. Advantages of compressed air include:

- Air is universally available and in unlimited supply
- Pneumatic system components are reasonably simple and lightweight
- No return lines are fitted, resulting in a weight saving
- There is no fire hazard, and the danger of explosion is slight
- Contamination is minimised by the use of filters

A typical high pressure pneumatic system uses air compressors driven from the engine accessory drive. Compressed air is discharged through a bleed valve to a pressure relief (unloading) valve. The bleed valve is held closed by oil pressure — if oil pressure fails, the bleed valve opens to offload the compressor. The pressure relief valve maintains system pressure at around **3,000 psi**.

A **shuttle valve** in the line between the compressor and the main system makes it possible to charge the system from a ground source; when the engine is not running, the shuttle valve slides over to isolate the compressor.

Moisture in a compressed air system will freeze as air pressure drops when a component is actuated, so water must be completely extracted from the air. A **water separator** collects moisture from the air onto a baffle and allows it to drain overboard; an electric heater prevents the water in the separator from freezing. After leaving the water separator, any remaining moisture is removed as the air flows through a **desiccant (chemical) dryer**, and the air is then filtered before entering the main system.

The air is then fed to storage bottles, which provide emergency air for several systems. A manually operated isolation valve allows the air supply to be shut off so maintenance can be carried out without discharging the storage bottles. Air is stored at maximum system pressure (around **3,000 psi**) to supply the landing gear and brakes in an emergency. A **pressure reducing valve** reduces the air pressure down to the operating pressure most components work at (around **1,000 psi**) — i.e. landing gear normal operation, the passenger door, the propeller brake and the nose wheel steering.

## Vacuum Systems

A supply of air at negative pressure may be needed for a number of purposes. The supply of vacuum to instruments, for example, usually comes from either a small vacuum pump attached to a piston engine, or from a venturi jet pump, which obtains its power via a tapping from a jet engine — the low pressure caused by the venturi draws in air to supply the system.

Another requirement for a vacuum source might be a **pneumatic de-icing system**, which uses the inflation of flexible leading edge mats (de-icer boots) to break off ice that has formed. To keep the boots in place, they are fed a negative pressure from a venturi, ensuring they are sucked flat onto the wing leading edge for a smooth, aerodynamic surface.

## Low Pressure Pneumatic Systems Layout

Low pressure pneumatic systems provide air for gyroscopic attitude and direction indicators, and air to inflate the pneumatic de-icing boots. This compressed air is usually provided by a **vane type engine driven air pump**.

On early aircraft, engine driven air pumps were used primarily to evacuate the casings of air-driven gyroscopic instruments, so were commonly known as vacuum pumps. On later aircraft, discharge air was also used to inflate de-icing boots on control surfaces, so they are now more correctly called air pumps. There are two types:

- **Wet air pumps** — steel vanes lubricated and sealed with engine oil, drawn in through the pump mounting pad and exhausted with the discharge air. This oil is removed from the discharge air with an oil separator before use for de-icing or driving the instruments.
- **Dry air pumps** — developed so there is no oil in the discharge air and therefore no need for an oil separator. Pump vanes are made from carbon and are self-lubricating; the main problem is that the vanes are easily broken by contaminants entering the pump, so inlet air is filtered.

## Air Supply Sources

### Engine Bleed Air

Used in turbo jet aircraft, in which hot air is bled off from the engine compressors to the cabin. Before entering the cabin, the air passes through a pressure and temperature control system, which reduces its pressure and temperature, and is then mixed with ram air. Because of the great variation of air output from ground to maximum flight rpm, two tappings are taken from the engine — one from the LP stages and one from the HP stages — to maintain a reasonable pressure band at all engine speeds. At low engine rpm, LP air is of insufficient pressure, so air is tapped from the HP stages; as engine speed increases, LP air pressure increases, and at a predetermined pressure the HP air is shut off. At maximum engine speed the air is taken purely from the LP stages, so in all normal stages of flight the bleed air comes from the LP stages.

### Compressors or Blowers

Used by some turbo jet, turbo prop or piston engine aircraft; compressors or blowers may be engine driven via an accessory drive, or driven by bleed air, or by electric or hydraulic motors. The compressor inlet duct connects to an air scoop, and its outlet connects to the pneumatic manifold, controlled by a shut-off valve operated from the cockpit. When insufficient LP air pressure is available at low engine speeds, the aircrew select the shut-off valve open, directing LP air to drive the turbo compressor. A pressure regulator ensures constant output at the required pressure. On large multi-engine aircraft, only some of the engines have a turbo compressor, normally mounted with its controls in an engine bay.

### Auxiliary Power Unit (APU)

Provides an independent source of pressurised air. It is basically a small gas turbine engine that provides air and other services while the aircraft is on the ground with its main engines stopped, usually self-contained and located in the tail section where it can be run safely. On some aircraft, the APU can be started in flight and act as a backup source of air and hydraulic services in the event of a loss of an engine.

### Ground Supply

Used on the ground when the engines are not running; the ground cart runs until the aircraft is independent of the trolley. The ground cart is basically a compressor driven by an engine, usually a diesel, with output pressure regulated to match the aircraft's system pressure. A quick release hose connects the cart to the aircraft service panel.

## Pressure Control

In many bleed air systems, pressure is regulated only by the operation of the high pressure shut-off valve; the pressure range may be from **10 psi at ground idle to 65 psi at take-off power**. Many modern aircraft use bleed air for pressure-sensitive systems, so regulation is required.

A **pressure regulator** is a pneumatically operated valve giving a predetermined output pressure from the engine bleed air system. It may also perform as the shut-off valve — a **pressure regulating and shut-off valve**.

In one worked example of a pressure regulator: the piston has an area of 1 square inch and is held in its seat by a spring pushing with a **100 pound** force. The piston has a shoulder of 0.5 square inches acted on by a system air pressure of **1,500 psi**. The cone-shaped valve seat has an area of 0.5 square inches, acted on by a reduced pressure of **200 psi**. A bleed orifice in the piston allows air pressure into the piston chamber; a relief valve, acted on by the reduced 200 psi pressure and relief valve spring pressure, maintains the air pressure in the piston chamber at **750 psi**. When the air supply is used by a pneumatic service, the reduced downline pressure drops below what is needed to keep the relief valve closed; the 750 psi piston chamber pressure unseats the relief valve and reduces piston chamber pressure, which unseats the piston cone and allows system pressure to bleed into the down lines. Once downline pressure rises back to 200 psi, the piston cone and relief valve re-seat and the system is back in balance.

## Distribution

Distribution is achieved by ducting and pipelines carrying charge air from the engine compressors to the services that require it. Because of the heat of bleed air, any leakage causes an extreme temperature rise in the area of the leak, with the possibility of fire or damage — so leak detection systems are incorporated. Ducting is made up of many sections for ease of maintenance and cheapness of replacement, constructed of thin wall material and clamped together with joints that allow for thermal expansion. Engine bleed air system ducts are manufactured from **stainless steel**, while the ducts and pipelines are usually manufactured from **titanium**, as it withstands higher temperatures and is lighter in weight. Duct sections are supported throughout their length by clamps and tie rod attachments to the aircraft structure.

### Expansion Joints

Joints are assembled cold, and in use ducting temperatures can reach up to **350°F**. Expansion devices must be incorporated to prevent distortion or buckling:

- **Pre-stressed joint** — duct sections installed slightly shorter, pre-stressed by clamps when cold, allowed to expand with heat to fit correctly
- **Flexible ball joint** — a flange on one end connects to a bearing nut on the other, screwed together; shims maintain clearance for expansion and flexing, and a crush type metal seal prevents air leakage at the joint
- **Cable attachment joint** — used where large temperature changes exist (cold soak at altitude to maximum working temperature). Bosses are attached at each end of the duct with usually 3 short cables equally spaced around it, each with a swaged ball end fitting at one end and a swaged threaded fitting at the other; a nut on the threaded end is tightened to pull the cables tight and seal the duct, with a small gap left at the seal ends for expansion

## Indications and Warnings

Safety devices are fitted to prevent overheat or overpressure which could cause severe damage to the air ducting or systems.

**Overpressure** is usually caused by a malfunction of the high pressure shut-off valve remaining open at maximum engine rpm. A pressure relief valve is fitted in the engine bleed air ducting to relieve excess pressure, and may work with a pressure switch to close the high pressure shut-off valve at a predetermined pressure.

**Overheat** of bleed air is prevented by an electrical temperature sensor downstream of the engine bleed air valve; at a predetermined temperature, the sensor signals the high pressure shut-off valve to close, and an overheat is indicated to the aircrew on the CWP and associated control panel.

**Duct hot air leakage:** any ducting with joints is liable to leak under abnormal conditions. A duct protection system includes fire-wire elements (**thermistor type**) around hot zones such as engine air bleeds, air conditioning packs and APUs. As temperature around the wire increases, resistance decreases until an electrical circuit is made, sending a warning signal to the cockpit central warning panel with associated lights and aural chimes. The leaking duct may be isolated automatically or may require the pilot to close off the air valves, after which the faulty system remains out of use.

## System Interfaces

Once bleed air has been reduced in pressure to around **40 to 50 psi**, most services have their own pressure and temperature controls, generating their own warnings and indications.

**Pneumatic gyro power systems:** gyroscopes in pneumatic gyro instruments are driven by air impinging on cups cut in the periphery of the wheel, using either:

- **Air pump suction** — the air pump suction evacuates the instrument case and draws air in through a filter; the filtered air is directed through a nozzle and strikes the driving cups. A suction relief valve regulates the suction to the correct value, and a suction gauge reads the pressure drop across the instrument.
- **Dry air pump pressure** — used at high altitudes where there is insufficient air pressure to drive the instruments by suction. The instruments are driven by air from the pressure side of a dry air pump, filtered before entering the pump and regulated before flowing through an in-line filter to the instruments, then evacuated overboard after driving them.

**Backup high pressure pneumatic systems:** on some aircraft, in case of hydraulic system failure, provision is made for emergency extension of the landing gear and application of brakes, using a pressurised cylinder containing approximately **3,000 psi** of compressed air or nitrogen. A shuttle valve in the actuator line directs hydraulic fluid to the actuator for normal operation, or compressed air/nitrogen for emergency operation.

**Pneumatic de-icing systems:** the compressed air system inflating de-icing boots uses wet air pumps. Oily air passes through baffle plates in an oil separator, where oil collects and is drained back to the engine oil sump. Clean air flows through the de-icing selector valve to a pressure regulating valve, where its pressure is reduced to the value needed for the boots, then to the distribution sequencing valve; when the system is switched off, the air is directed overboard.

**Air conditioning and pressurisation:** bleed air supplies hot air to the air conditioning packs, passing through primary and secondary heat exchangers before mixing with cold air. The hot air flows across a turbine which drives the system compressor. Bleed air is also used for cabin pressurisation, driving a compressor which pressurises the air before feeding it to the cabin (some aircraft use a jet pump); the air passes through an inter-cooler to reduce temperature before entering the cabin. Air conditioning systems are often protected by flow control valves, which double as shut-off valves in the case of a fault.

**Air driven hydraulic pumps:** some aircraft use hydraulic pumps operated by air turbines, driven by bleed air from the engines, with flow controlled and modulated by a solenoid operated pressure regulator and shut-off valve to maintain turbine speed within set limits. The turbine connects to the pump via a shaft, and air is exhausted to atmosphere from the turbine outlet.

**Pressurising of hydraulic reservoirs:** aircraft flying above **20,000 ft** require the hydraulic reservoir to be pressurised, to prevent foaming of the fluid (due to low ambient air pressure) and to prevent pump cavitation. Bleed air is fed to a regulator/reducing valve which regulates the pressure supplied to the reservoir; a pressure relief valve vents any excess air pressure to atmosphere.

**Waste and water systems:** toilet systems fitted to larger aircraft use a vacuum to empty a number of toilets into a single collector tank, saving the need for a self-contained tank full of deodorising fluid and associated pumping mechanisms attached to each toilet. The flush operation consists of fresh water from the potable supply and, importantly, the vacuum, which draws the waste into the collector tank — obtained by having the tank connected to the outside of the aircraft. Only at low levels, when outside air pressure is insufficient, is a small vacuum pump called into operation.

**Pneumatic stall warning:** common on light aircraft. A slotted plate is mounted on the wing leading edge, with its slot coinciding with the stagnation point of the wing during normal flight. The slot is connected to a horn via a tube. When the angle of attack is sufficient to induce a stall, low air pressure is drawn into the tube and sounds the horn, warning the pilot of an impending stall.
        $cnt2$,
        16
    ) RETURNING id INTO s18_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 13.19: Water and Waste Systems
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m13_id, 'M13.19', 'Water and Waste Systems',
        $cnt3$
# Water and Waste Systems

## Water Systems

**Potable water** refers to drinking water. On aircraft it supplies drinking water, galleys, and hot and cold water to wash basins throughout the aircraft. A centralised water tank can feed any number of galleys and toilets through a gallery of pipes, speeding servicing turnaround since there need only be one main replenishment point. Potable water is **hyper-chlorinated** to control bacteria, carried out at set intervals.

The major components of a potable water system are:

- A storage tank
- Air pressure system to force water from the tank to the services
- Distribution lines
- Filling system
- Quantity indication system
- Valves to drain the system

The tank is usually stored under the cabin floor in a cradle structure, constructed from either fibreglass with metal bonded bands, or stainless steel. Tank quantity and volume are dictated by the number of passengers carried and the length of time the aircraft is airborne. Aircraft expected to operate in cold climates may have heater blankets built in to keep the tank and replenishing panel free of ice. The tank assembly incorporates a drain, filler connection, overflow connection, air pressure connection and outlet pipelines to the galley and toilets.

### Pressure Control

The supply of air for the movement of water is tapped from the bleed air supply of the engine compressor or the APU. Some aircraft, which need to draw water when there is no air pressure available (e.g. on the ramp), have an electrically powered air compressor providing a head of pressure so water can be drawn off at any time; the compressor may automatically start when bleed air pressure drops below a predetermined value.

On aircraft using a compressor, a **riser loop** is incorporated to prevent water entering the compressor — the top of the loop is higher than the distribution ducting, ensuring water goes to the distribution lines first. A pressure switch controls the compressor starting and stopping as bleed air pressure varies.

### Water Distribution System

A main water distribution line is taken from the water tank, routed up into the cabin ceiling, with individual pipelines routed to the toilets and galleys. Distribution lines are usually flexible hoses enclosed in an aluminium sheath, normally insulated to prevent freezing; the outer sheath prevents leakage entering the cabin, with any leaking water directed to the lower fuselage through drain tubes to be drained overboard. A quick release connection is located above each toilet and galley to allow disconnection for removal. On smaller aircraft, the water tank may be located above the wash basin and galley areas, providing water under gravity.

### Water Heating

A small-capacity water heater is installed in the supply piping under each lavatory sink, providing hot water to the tap. The heater contains electrical elements in its base, with a warning light, control switch, overheat re-set switch and a pressure relief valve on the side of the tank. A switch controller regulates water temperature to around **125°F**. If a malfunction increases the temperature to **190°F**, the overheat switch operates and switches off power to the heater (the power light goes out); after cooling, the heater must be manually reset by pressing the re-set button. A pressure relief valve relieves pressures in excess of around **140 psi**, primarily to relieve pressures caused by the water overheating.

### Waste Water Collection and Drainage

Waste water collection and drainage depends on the aircraft: on some, water from wash basins drains directly overboard; on others it drains into a soil tank and is used to flush the toilet system. Water drained overboard passes through drain masts under the fuselage, normally electrically heated to prevent freezing, with the aircraft's forward motion finely atomising the water as it leaves. Drain mast heaters are tested on the ground by carefully feeling for warmth by hand.

### Quantity Indication

Some aircraft use a simple sight gauge by the tank to indicate waste tank contents level. Larger aircraft fit a sensor to remotely signal tank levels to cabin crew — one method uses a gauge on the attendants' panel fed from the same float and electrical transmitter as a corresponding gauge on the water service panel. Another method uses a series of lights controlled by magnetic floats inside the tank: when the waste water level operates a magnetic float, a circuit is made and a corresponding panel light illuminates.

### Water Service Panel

Normally found on the lower part of the fuselage for easy access by maintenance crew replenishing the tank during turnaround, the panel will probably contain a filling point, a drain/overflow point, quantity indication (lights or a gauge), and an external air connection. The filling point allows a replenishing rig/truck to fill the tank during turnaround servicing; the drain/overflow shows when the tank is full — once water is seen from the overflow, the fill/vent valve is closed to the vent position. The quantity indicator allows the tank to be filled to a 'less-than-full' quantity where excess weight of unused water is traded off against fuel on short flight legs. The external air connection allows a ground air source to move water within the system whenever no internal air pressure is available.

The water drain valve is manually operated, allowing tank contents to drain under gravity, and is manually re-set once the tank is emptied. The fill/vent valve can be manually or electrically operated and rotates to the fill or vent position; its operation may also electrically isolate the air compressor (if fitted) during filling. The vent valve's purpose is to prevent an air lock in the wash basin taps by opening the tap lines to atmosphere — modern aircraft have self-venting taps which automatically relieve any air locks.

## Waste Systems

The provision of aircraft toilets is essential for any aircraft carrying passengers over long distances; toilets must be maintained and serviced with care to protect passenger comfort and health, and kept clean and odour free. Due to the nature of the fluids carried, protection must also be given to the aircraft structure against corrosion caused by these fluids.

There are three main types of toilet fitted to aircraft, the type used depending on passenger capacity and aircraft age:

- **Removable toilet assembly**
- **Liquid flush type**
- **Vacuum toilet assembly**

### Removable Toilet Assemblies

The removable, or **'carry out'**, toilet is the simplest type, often referred to as an **'Elsan'**, named after the original manufacturing company. It is simply a storage bin with a toilet seat fitted to the top, partially filled with a strong chemical deodorant. The unit is removed from the aircraft and emptied into an approved disposal site; once washed out it is replenished with deodorant and re-fitted using a quick release attachment such as 'pip' pins. This type of toilet is only found on short range, small, light aircraft.

### Liquid Flush Toilets

The most common type found in passenger aircraft, each toilet is a completely self-contained quick release unit with its waste collection tank mounted directly beneath the toilet bowl. The tank is normally made from composites or plastics, with a service panel directly below. A typical assembly contains: motor and pump, filter, drain valve, rinse ring, flush line, and air vent.

The bowl is constructed from stainless steel; tank units can be the same material or fibreglass laminate. Tank capacity depends on flight duration and passenger numbers — an average tank capacity is **20 gallons (90 litres)**, of which **3 gallons (13.5 litres)** are a pre-charge of chemical containing disinfectant, dye and deodorant, sufficient for about **100 uses** before emptying and re-charging is required.

**System operation:** when the flush button is pressed, the motor runs for a fixed time, usually around **10 seconds**, pumping fluid through the bowl spray pipe in a swirling action. This flushes the bowl contents into the tank via a lightly sprung, hinged separator (loaded into the closed position). At the end of the 10-second cycle, the motor re-arms to run again in the reverse direction, to ensure the filter does not become blocked with solid waste.

### Vacuum Toilets

On aircraft fitted with a number of liquid flush toilets, two major problems arise: corrosion risk and the time taken to drain and replenish each individual toilet. Both are overcome by installing vacuum toilets: dry toilet modules are installed at convenient locations around the cabin and connected to a central storage tank by pipelines.

The vacuum toilet uses a waste container with negative pressure (vacuum) inside, which draws waste from the bowl together with clean flushing water and deposits it in the tank. On very large aircraft, more than one waste tank may be used to avoid one tank filling during the flight. The toilet systems fitted to larger aircraft use a vacuum to empty a number of toilets into a single collector tank, saving a self-contained tank and pumping mechanism per toilet.

The flush operation uses fresh water from the potable supply and, importantly, the vacuum, which draws waste into the collector tank — obtained by connecting the tank to the outside of the aircraft. As aircraft speed increases, the pressure at the connection drops, drawing the waste to the storage tank. At low speeds or low altitudes, when the pressure differential is insufficient, a small vacuum pump called a **'vacuum generator'** is operated by a pressure switch to provide the required pressure drop; its normal range of operation is between sea level and **16,000 ft**.

**Emptying:** large aircraft usually hold waste in a storage tank, emptied after landing — usually by specialist companies sub-contracted to the airlines at particular airports. Tanks are emptied by one of two methods: **gravity** (the toilet emptying vehicle's hose is connected and the shut-off valve operated; the tank is then flushed out and, depending on tank type, replenished with deodorising fluid), or **suction** (requires the emptying vehicle to have correctly set suction equipment, and the aircraft to have ducting cleared for suction use — if the aircraft only has 'gravity' ducting and piping, severe damage will be caused if used with vacuum emptying equipment).

### Corrosion Control

All areas where toilet equipment is fitted must be protected against corrosion; the effect of many toilet chemicals on aluminium alloy aircraft structure is severe. Spillages must be neutralised and cleaned off as soon as possible, with thorough checks of all potentially affected areas at regular intervals — including the toilet floor and beneath it, the vicinity of the collector tank(s), around the draining/filling panel, and anywhere corrosive fumes could affect the structure. Some toilet units are enclosed in an anti-corrosion tank, containing any leaks and connected to the drain lines. Toilet floors may be made from composite materials to reduce the likelihood of corrosion damage, and all connections in the service panel are sealed off when the panel is closed.
        $cnt3$,
        17
    ) RETURNING id INTO s19_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M13.13 Fuel Systems (15 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s13_id, 'Fuel tanks normally fall into which three categories of construction?',
     '[{"id":"a","text":"Rigid, flexible and integral","correct":true},{"id":"b","text":"Metal, composite and bladder","correct":false},{"id":"c","text":"Pressurised, unpressurised and vented","correct":false}]',
     '{"B2"}'),

    (s13_id, 'Very few aircraft over what weight would use metal rigid fuel tanks (except long range tanks in the cargo hold)?',
     '[{"id":"a","text":"5,700 kg","correct":true},{"id":"b","text":"2,000 kg","correct":false},{"id":"c","text":"50,000 kg","correct":false}]',
     '{"B2"}'),

    (s13_id, 'A flexible fuel tank with thin, very flexible walls that cannot support its own weight is commonly known as a:',
     '[{"id":"a","text":"Collector tank","correct":false},{"id":"b","text":"Bag tank","correct":true},{"id":"c","text":"Surge tank","correct":false}]',
     '{"B2"}'),

    (s13_id, 'A self-sealing fuel tank covering reduces the magnitude of a leak because the cellular rubber:',
     '[{"id":"a","text":"Swells on contact with fuel and forces its way into the puncture to block the hole","correct":true},{"id":"b","text":"Chemically reacts with fuel to solidify it into a plug","correct":false},{"id":"c","text":"Automatically triggers a warning light and shuts off the tank","correct":false}]',
     '{"B2"}'),

    (s13_id, 'The metal attachment ring used to strengthen and stiffen an aperture in a flexible fuel tank is sometimes called a:',
     '[{"id":"a","text":"Baffle ring","correct":false},{"id":"b","text":"Stud ring or bolt ring","correct":true},{"id":"c","text":"Sequence ring","correct":false}]',
     '{"B2"}'),

    (s13_id, 'In an integral fuel tank, the first coating of sealant applied to a joint before it is closed and tightened is known as the:',
     '[{"id":"a","text":"Barrier coat","correct":false},{"id":"b","text":"Fillet","correct":false},{"id":"c","text":"Interfay","correct":true}]',
     '{"B2"}'),

    (s13_id, 'The purpose of the centre integral tank''s secondary external barrier coating is to:',
     '[{"id":"a","text":"Prevent fuel vapour entering the pressurised section of the fuselage","correct":true},{"id":"b","text":"Increase the tank''s resistance to fuel surge during manoeuvres","correct":false},{"id":"c","text":"Reduce the weight of the centre tank structure","correct":false}]',
     '{"B2"}'),

    (s13_id, 'Each fuel tank normally has additional space, without spillage into the surge tank, to allow for fuel expansion of approximately:',
     '[{"id":"a","text":"2%","correct":true},{"id":"b","text":"20%","correct":false},{"id":"c","text":"50%","correct":false}]',
     '{"B2"}'),

    (s13_id, 'A booster (fuel) pump is typically driven by:',
     '[{"id":"a","text":"A 28 VDC electric motor","correct":false},{"id":"b","text":"A 115 volt, three-phase electric motor, as a centrifugal pump","correct":true},{"id":"c","text":"A hydraulically driven vane motor only","correct":false}]',
     '{"B2"}'),

    (s13_id, 'The by-pass valve fitted to a booster pump allows an engine to be operated on suction feed up to approximately:',
     '[{"id":"a","text":"1,000 ft","correct":false},{"id":"b","text":"6,000 ft","correct":true},{"id":"c","text":"20,000 ft","correct":false}]',
     '{"B2"}'),

    (s13_id, 'Sequence valves are used to give priority to the inner tank fuel pumps, for structural reasons, by limiting the outer tank pump pressure from:',
     '[{"id":"a","text":"38 psi to 17.5 psi","correct":true},{"id":"b","text":"100 psi to 50 psi","correct":false},{"id":"c","text":"17.5 psi to 38 psi","correct":false}]',
     '{"B2"}'),

    (s13_id, 'The distinction between a cross-feed valve and a transfer valve in a fuel system is that:',
     '[{"id":"a","text":"Cross-feed valves permit transfer from any tank to any engine, while transfer valves transfer fuel from tank to tank","correct":true},{"id":"b","text":"Cross-feed valves only operate on the ground, while transfer valves only operate in flight","correct":false},{"id":"c","text":"Cross-feed valves are electrically operated, while transfer valves are always manually operated","correct":false}]',
     '{"B2"}'),

    (s13_id, 'On most large aircraft, each vent tank is vented to atmosphere via the:',
     '[{"id":"a","text":"NACA valve","correct":true},{"id":"b","text":"L.P. valve","correct":false},{"id":"c","text":"Sequence valve","correct":false}]',
     '{"B2"}'),

    (s13_id, 'In a typical capacitance-based fuel quantity gauging system, the only variable physical property of the "capacitor stack" as fuel level changes is:',
     '[{"id":"a","text":"The gap between the plates","correct":false},{"id":"b","text":"The surface area of the plates","correct":false},{"id":"c","text":"The dielectric (fuel or air) between the plates","correct":true}]',
     '{"B2"}'),

    (s13_id, 'On most large aircraft, modern pressure refuelling supplies fuel to the tanks at a pressure of about:',
     '[{"id":"a","text":"5 psi","correct":false},{"id":"b","text":"40 psi","correct":true},{"id":"c","text":"400 psi","correct":false}]',
     '{"B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M13.18 Pneumatic and Vacuum Systems (11 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s18_id, 'A key advantage of pneumatic systems over hydraulic systems is that, because the working fluid is air:',
     '[{"id":"a","text":"No return system/lines are needed","correct":true},{"id":"b","text":"They require no filtration at all","correct":false},{"id":"c","text":"They can never freeze","correct":false}]',
     '{"B2"}'),

    (s18_id, 'In a typical high pressure pneumatic system, the pressure relief (unloading) valve maintains system pressure at around:',
     '[{"id":"a","text":"3,000 psi","correct":true},{"id":"b","text":"300 psi","correct":false},{"id":"c","text":"30,000 psi","correct":false}]',
     '{"B2"}'),

    (s18_id, 'In a high pressure pneumatic system, the bleed valve is held closed by oil pressure. If oil pressure fails, the bleed valve will:',
     '[{"id":"a","text":"Remain closed until manually reset","correct":false},{"id":"b","text":"Open to offload the compressor","correct":true},{"id":"c","text":"Trigger an immediate system shutdown of the storage bottles","correct":false}]',
     '{"B2"}'),

    (s18_id, 'After leaving the water separator, remaining moisture in a pneumatic system is removed by the air flowing through a:',
     '[{"id":"a","text":"Desiccant (chemical) dryer","correct":true},{"id":"b","text":"Second bleed valve","correct":false},{"id":"c","text":"Shuttle valve","correct":false}]',
     '{"B2"}'),

    (s18_id, 'Dry air pumps were developed mainly to eliminate the need for an oil separator, but their carbon vanes have the drawback of being:',
     '[{"id":"a","text":"Easily broken by contaminants entering the pump","correct":true},{"id":"b","text":"Unable to withstand any negative pressure","correct":false},{"id":"c","text":"Heavier than the equivalent wet pump vanes","correct":false}]',
     '{"B2"}'),

    (s18_id, 'In a typical two-stage engine bleed air system, during normal stages of flight (at higher engine speeds), bleed air is taken from:',
     '[{"id":"a","text":"The HP stages only","correct":false},{"id":"b","text":"The LP stages","correct":true},{"id":"c","text":"Neither stage — the APU supplies all bleed air in flight","correct":false}]',
     '{"B2"}'),

    (s18_id, 'In a typical bleed air pressure control system, the pressure range may vary between:',
     '[{"id":"a","text":"10 psi at ground idle to 65 psi at take-off power","correct":true},{"id":"b","text":"100 psi at ground idle to 650 psi at take-off power","correct":false},{"id":"c","text":"65 psi at ground idle to 10 psi at take-off power","correct":false}]',
     '{"B2"}'),

    (s18_id, 'Bleed air distribution ducts and pipelines are usually manufactured from titanium mainly because titanium is:',
     '[{"id":"a","text":"Able to withstand higher temperatures and is lighter in weight","correct":true},{"id":"b","text":"The cheapest material available for ducting","correct":false},{"id":"c","text":"A better electrical insulator than stainless steel","correct":false}]',
     '{"B2"}'),

    (s18_id, 'In-use pneumatic ducting temperatures can reach up to approximately:',
     '[{"id":"a","text":"100°F","correct":false},{"id":"b","text":"350°F","correct":true},{"id":"c","text":"1,000°F","correct":false}]',
     '{"B2"}'),

    (s18_id, 'Duct hot air leakage detection in a pneumatic system typically uses fire-wire elements of the following type:',
     '[{"id":"a","text":"Thermistor type","correct":true},{"id":"b","text":"Piezoelectric type","correct":false},{"id":"c","text":"Capacitive type","correct":false}]',
     '{"B2"}'),

    (s18_id, 'Aircraft flying above approximately 20,000 ft require the hydraulic reservoir to be pressurised mainly to:',
     '[{"id":"a","text":"Prevent foaming of the fluid and prevent pump cavitation","correct":true},{"id":"b","text":"Reduce the weight of the hydraulic reservoir","correct":false},{"id":"c","text":"Increase the reservoir''s fluid capacity","correct":false}]',
     '{"B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M13.19 Water and Waste Systems (10 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s19_id, 'Potable water on an aircraft is treated by being:',
     '[{"id":"a","text":"Hyper-chlorinated at set intervals to control bacteria","correct":true},{"id":"b","text":"Deodorised with a chemical additive","correct":false},{"id":"c","text":"Filtered through a desiccant dryer","correct":false}]',
     '{"B2"}'),

    (s19_id, 'The supply of air used to force water from the storage tank to the services is normally tapped from:',
     '[{"id":"a","text":"The bleed air supply of the engine compressor or the APU","correct":true},{"id":"b","text":"A dedicated vacuum pump only","correct":false},{"id":"c","text":"The fuel jettison system","correct":false}]',
     '{"B2"}'),

    (s19_id, 'The purpose of the riser loop fitted on aircraft that use an electrically powered water pressurisation compressor is to:',
     '[{"id":"a","text":"Prevent water entering the compressor by siphoning back","correct":true},{"id":"b","text":"Heat the water before it reaches the galley","correct":false},{"id":"c","text":"Increase the pressure delivered to the cabin taps","correct":false}]',
     '{"B2"}'),

    (s19_id, 'A lavatory water heater''s switch controller normally regulates water temperature to around:',
     '[{"id":"a","text":"60°F","correct":false},{"id":"b","text":"125°F","correct":true},{"id":"c","text":"212°F","correct":false}]',
     '{"B2"}'),

    (s19_id, 'If a lavatory water heater malfunctions and its temperature rises to approximately 190°F, the overheat switch will:',
     '[{"id":"a","text":"Switch off power to the heater unit, requiring a manual reset after cooling","correct":true},{"id":"b","text":"Automatically increase the pressure relief valve setting","correct":false},{"id":"c","text":"Have no effect until the temperature reaches 300°F","correct":false}]',
     '{"B2"}'),

    (s19_id, 'The pressure relief valve fitted to a lavatory water heater relieves pressures in excess of approximately:',
     '[{"id":"a","text":"14 psi","correct":false},{"id":"b","text":"140 psi","correct":true},{"id":"c","text":"1,400 psi","correct":false}]',
     '{"B2"}'),

    (s19_id, 'The simplest type of aircraft toilet, a storage bin with a seat fitted on top and partially filled with chemical deodorant, is commonly known as:',
     '[{"id":"a","text":"A vacuum toilet","correct":false},{"id":"b","text":"An ''Elsan'' or ''carry out'' toilet","correct":true},{"id":"c","text":"A liquid flush toilet","correct":false}]',
     '{"B2"}'),

    (s19_id, 'In a typical liquid flush toilet, an average waste tank capacity is about 20 gallons (90 litres), of which approximately how much is a pre-charge of chemical (disinfectant, dye and deodorant)?',
     '[{"id":"a","text":"3 gallons (13.5 litres)","correct":true},{"id":"b","text":"10 gallons (45 litres)","correct":false},{"id":"c","text":"18 gallons (81 litres)","correct":false}]',
     '{"B2"}'),

    (s19_id, 'Vacuum toilets were introduced mainly to overcome which two problems associated with liquid flush toilets?',
     '[{"id":"a","text":"Corrosion risk and the time taken to drain and replenish each individual toilet","correct":true},{"id":"b","text":"Excessive water consumption and high electrical power demand","correct":false},{"id":"c","text":"Excessive weight and limited passenger capacity","correct":false}]',
     '{"B2"}'),

    (s19_id, 'The small vacuum pump (''vacuum generator'') used in a vacuum toilet system at low speed or low altitude has a normal operating range of:',
     '[{"id":"a","text":"Sea level up to 16,000 ft","correct":true},{"id":"b","text":"Sea level up to 1,600 ft only","correct":false},{"id":"c","text":"16,000 ft up to 41,000 ft","correct":false}]',
     '{"B2"}');

END $$;
