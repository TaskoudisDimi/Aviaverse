-- Module 11A (Turbine Aeroplane, B1): Fuel Systems, Hydraulic Power Systems
-- Source: EASA Part-66 Module 11A official textbook (IKAROS Aviation Training Centre, IK M11A)

DO $$
DECLARE
    m11_id INT;
    s13_id INT;
    s14_id INT;
BEGIN
    SELECT id INTO m11_id FROM easa_modules WHERE code = 'M11';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M11A.13') THEN
        RAISE NOTICE 'M11A.13-M11A.14 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module M11A.13: Fuel Systems
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m11_id, 'M11A.13', 'Fuel Systems',
        $cnt$
# Fuel Systems

## Fuel Tank Construction

### Rigid Tanks

Rigid fuel tanks are normally made from metal or plastic material and fitted internally where space permits. Metal fuel tanks are constructed from aluminium alloy, stainless steel or tinned steel, riveted, welded or soldered together. The tank is a light structure strengthened by internal stiffeners, angle pieces and baffles, which are necessary in large tanks to reduce the effects of **fuel surge** caused when the aircraft manoeuvres. Rigid tanks are secured within the airframe by built-in padded cradles and padded metal straps.

Very few aircraft over **5,700 kg** would use metal rigid tanks, except when long-range tanks are fitted in the cargo hold (e.g. commercial IATA LD6 containers).

### Flexible Fuel Tanks

Flexible fuel tanks may have thin, very flexible walls (**bag tanks**) or thicker, less flexible material. Their flexibility allows them to be folded and inserted through a small aperture that would not admit a rigid tank of similar capacity. Because they can be shaped to fit most of the available space, flexible tanks give a greater fuel capacity than rigid tanks, and they are lighter and easier to handle and store. When filled, the tank expands to contact the compartment walls so that the fuel weight is carried by the aircraft structure, not the tank — flexing of the structure therefore does not impose harmful loads on the tank material. Flexible tanks are resilient, like an inner tube, and can withstand considerable distortion or shock loading; if not completely full, a flexible tank is unlikely to burst on crash impact.

- **Protective covering** — several layers of fabric, or fabric and rubber, cemented to the tank material with adhesives; a tank fitted with a protective cover generally becomes stiff enough to support its own weight
- Tanks without a protective cover may instead be reinforced by nylon fabric or net — this does not stiffen the tank, which remains flexible and limp; this is the type sometimes called a **'bag tank'**, and it cannot support its own weight
- **Self-sealing coverings** — made from layers of cellular rubber with an overall protective cover of glass fabric or nylon fabric; if the tank is pierced, the cellular rubber swells on contact with the fuel and forces its way into the puncture to block the hole and reduce or stop the leak. Minor leaks may go undiscovered until the covering begins to swell and bulge on the outside
- **Attachments and fittings** — each moulded aperture is strengthened by a metal attachment ring, sometimes called a **'stud ring'** or **'bolt ring'**

### Integral Fuel Tanks

Integral tanks use primary wing structure, normally located between the front and rear wing spars and between the upper and lower wing skin. Solid **'tank end' ribs** close the ends of each tank, while the other ribs act as fuel baffles to minimise fuel slosh. A centre tank often traverses the fuselage between the two inner wing root ribs, and has a secondary external barrier coating to prevent fuel vapour entering the pressurised section of the fuselage.

All fuel tanks are fuel-tight: a close metal-to-metal fit of all parts forms the basic seal, with sealing compounds and sealing fasteners on all joints. Some wing ribs contain free-swinging, fuel-actuated **baffle check valves** to prevent fuel flow away from the electric boost pumps. The outer portion of the wing provides fuel overflow by means of a **surge tank**, which also affords venting into the system.

**Integral tank sealing sequence:**
1. **Interfay** — the first coat of sealant, applied wet before assembly, which should bond with all parts of the joint
2. **Fillet** — a neat coating of sealant applied at the edges of the joint after cleaning off the squeezed-out surplus, strong enough to cope with flexing between the parts
3. **Brush-on coat** — a final coat applied to overlap the joint and fillet
4. A quicker-drying **barrier coating** may also be applied over partially cured sealant, as an aid to production, to reduce contamination from swarf — it is not the same as the jointing sealant and will not prevent or cure leaks

Large commercial aircraft generally have three tanks in each wing — inner, outer and surge tank — with a centre tank sometimes available. Each fuel tank has additional space for **2% expansion** of the fuel without spillage into the surge tank.

**Water draining and scavenging:**
- Water drain valves are provided at low points of each tank, openable with standard tools, with a replaceable outer seal
- A **water scavenge system** may be fitted in the optional centre tank: two jet pumps, using tappings on the tank pumps for motive power, collect water from low points and discharge it towards the fuel pump inlet

## Engine Fuel Feed

### Design Requirements

An aircraft fuel system must be designed and arranged, among other requirements laid down in the Joint Airworthiness Requirements, so that:
- Fuel flows at a rate and pressure to ensure proper engine functioning in each likely operating condition
- Each engine is supplied through a system independent of that supplying any other engine
- No pump can draw fuel from two or more tanks simultaneously, unless means are provided to prevent air entering the system
- Fuel tank vents and transfer systems are designed so that over-filling during tank-to-tank transfer cannot cause structural failure
- Integral tanks have facilities for interior inspection and repair
- Fuel tanks are designed, located and installed so that no fuel release near the engines could start a fire in otherwise survivable crash conditions
- There is a fuel strainer at each fuel tank outlet or for the booster pump(s)
- Each fuel line is designed, installed and supported to prevent excessive vibration and allow reasonable deformation without leakage

### Multi-Tank Feed Arrangements

- **Booster pumps in each tank** — pumps are located in collector tanks equipped with check valves providing one-way fuel flow
- **Collector tanks** — rather than a booster pump in every tank, groups of tanks feed collector tanks
- **Fuel cells (example system)** — each engine is normally supplied from one pump in the optional centre tank, or both pumps in the tank of its own wing; any one pump can supply the maximum demand of one engine. A **cross-feed pipe**, controlled by a double motor-actuated spherical plug valve, allows both engines to be fed from one side, or all the fuel to be used by one engine. Pressure relief sequence valves on the wing tank pumps ensure the centre tank pumps deliver fuel preferentially when all pumps are running (no sequence valves are fitted on a two-tank version). In each wing tank the pumps sit in a collector box fed by gravity through flap non-return valves, ensuring continued fuel supply under negative 'g' or transient manoeuvres; a bypass at the pumps permits gravity feed. Air release valves are fitted to the feed lines. Fuel supply to each engine can be shut off by an **engine LP valve**, controlled by the engine fire handles

## Fuel Feed Components

### Fuel (Booster) Pumps

Each tank is normally provided with **two** identical, interchangeable fuel pumps, installed in canister assemblies to allow replacement without de-fuelling the tank. They are **centrifugal pumps** driven by 115-volt, three-phase motors. The output of each pump is about **250–300 litres per minute**, with a maximum fuel pressure at zero flow of about **38 p.s.i.** Each pump includes a non-return valve and a by-pass valve; the by-pass valve reduces the pressure drop, allowing an engine to be operated on suction feed up to about **6,000 feet**. The pumps are protected by a thermal fuse, activated at approximately **175°C**.

### Jet Pumps

Jet pumps transfer fuel around the aircraft fuel system using fuel bled from the booster pump, continually fed through a central nozzle into a venturi. The depression created in the venturi draws fuel from the surrounding tank, through a filter and up through the venturi tube, into the next fuel tank or straight to the collector box.

### Sequence Valves

Sequence valves give automatic transfer from one tank to another. In a typical example (centre, inner and outer tank pumps), the valve limits the fuel pressure of the outer tank pumps from **38 psi to 17.5 psi**, giving priority to the inner tank fuel pumps for structural reasons; when the inner tanks are empty, the engines are automatically supplied from the outer tanks, so the outer fuel pumps run continuously.

### Transfer Valves

Transfer valves enable transfer to take place between fuel cells split at a rib; their operation is actuated by a signal from low-level sensors.

### L.P. Valve

The L.P. shut-off valve enables isolation of the fuel system in the event of fire or engine maintenance (e.g. engine removal). It is located at the top of the pylon on the outside of the front wing spar, controlled normally by the fire handles, and activated by either a pair of electric motors or mechanically.

### Cross-Feed Valve

The cross-feed valve enables fuel to be fed to any engine from any tank, normally of a spherical construction with two 28 VDC electric motors mounted on a differential gearbox — one motor drives the valve, the other is a back-up.

## APU Fuel Feed

The APU feed is taken from the left engine feed, but may be taken from the right engine feed when the cross-feed valve is open. The tank booster pumps can supply fuel to the APU at the required pressure; for starting the APU without electrical power for the tank pumps, a separate pump, operable from the aircraft batteries, is mounted in the feed line on the rear spar of the centre section. The APU fuel supply can be shut off by a spherical plug valve driven by a double motor actuator, with the two actuators supplied from different busbars and cables routed separately.

## Dumping (Jettison)

Fuel jettison systems, fitted to a number of large commercial aircraft, allow fuel to be jettisoned in an emergency, reducing weight to prevent structural damage on landing. They are often fitted after installation of a centre tank because of the extra fuel weight. In a typical wide-bodied twin, the jettison pipe branches off the feed pipe between the inner tank fuel pump and the inner tank shut-off valve. A **check valve** separates the outer tanks during jettisoning, preventing the dumping of the outer tanks' fuel. The jettison pipe runs inside the wing tanks, through the ribs, into the outer tanks, where the jettison valves — fitted to the bottom of the tank — are installed and driven by two 28 VDC electric motors.

The jettison pipe outlet is normally at the end of the flap track fairing and fitted with an **anti-corona device** to avoid vaporisation of the fuel. A normal transfer rate is in the region of **30–350 litres per minute**. The jettison operation is controlled from a jettison panel (flight engineer's station or overhead panel), normally protected by a quick-release cover, with a primary switch for motor number one and a guarded secondary switch for motor number two. Jettison valve position is monitored by two magnetic indicators showing green cross-line (closed), green in-line (open), and amber cross-line for transit or malfunction.

## The Vent Sub-System

An air vent is fitted to the top of each tank to allow free flow of air in and out as the fuel level rises and falls (**inwards and outwards venting**), preventing over-pressurisation as the level rises and depressurisation as it falls. The vent sub-system must also cope automatically with expansion and contraction of the fuel due to heat.

### Unpressurised System Venting

The simplest method connects fuel tank vent orifices to a vent pipe gallery leading directly to atmosphere, found mainly on small aircraft, some helicopters and aircraft with low flight ceilings. Disadvantages of 'open orifice' or 'open vented' tanks include fuel venting during manoeuvres, a limited maximum ceiling (because fuel boils at low ambient pressure at altitude), danger of cavitation in fuel supply lines, and increased evaporation rate — **Reid Vapour Pressure (RVP)**, the rate at which fuel gives off vapour — leading to greater fire risk.

### Pressurised Fuel Tanks

On most large aircraft, fuel tanks are vented through a pipe connected to a surge vent tank, sized to prevent tank over-pressure in the event of a refuel cut-off failure. Vent pipe ends are arranged so fuel overflowing into the surge vent tank is drawn back into the wing tanks by suction as long as fuel pumps are running. Each vent tank is vented to atmosphere via a **NACA valve**, which ensures tank pressurisation during flight and allows fuel to flow out in the event of a high-level cut-off failure during refuelling. A frangeable disc may be fitted in the surge tank to prevent structural damage from over-pressure, and a flame arrester is fitted in the NACA intake in case of ground fires.

Each wing tank has an additional vent opening controlled by a **vent float valve** at the highest point of the tank. At the lowest points of each vent pipe, a self-draining non-return valve (synthetic rubber) is fitted.

## Cross-Feed and Transfer

**Cross-feed valves** permit the transfer of fuel from any tank to any engine, whereas **transfer valves** enable fuel to be transferred from tank to tank.

- **Auto-transfer** — on wings with lateral dihedral, fuel pumps are normally inboard and fuel flow is towards the wing root; the outboard tank automatically transfers into the inboard tank and empties first. A transfer valve between the tanks opens automatically whenever a high-level float switch in the inboard tank detects it not being full
- **Manual transfer** — no in-flight transfer of fuel between left and right mainplanes is possible for reasons of trim; however, fuel can be fed from any tank to any engine by boost pump selection and opening a cross-feed valve from the flight deck

## Indications, Warnings and Fuel Level Sensing

Fuel tank quantity, boost pump low pressure, cross-feed valve and fuel/fire shut-off valve position are displayed on the flight deck overhead panel; aural and visual warnings on the glareshield result if the fuel system develops a fault.

Modern aircraft use **thermistors**, sending signals through amplifiers to actuate warnings and sequencing; older aircraft may use **float switches**. Float-operated switches are magnetic, designed to isolate the electrical mechanism from the fuel tank for safety. Whether float switches or thermistors, the functions provided are:

1. **High level sensing** — prevents overfilling; the associated refuel/defuel valve closes and the blue FULL light comes on
2. **Overflow sensing** — if high-level shut-off fails, fuel enters the adjacent vent tank, indicated by the amber FULL light
3. **Low level sensing** — divided into outer tank low level (amber LO LVL light) and inner/centre tank low level (function only in AUTO MODE)
4. **Under full level sensing** — when fuel quantity in an outer tank drops below a certain level, the maximum flight speed (**VMO**) is reduced to protect the wing structure; sensor signals go to the ADC (Air Data Computer)
5. **Calibration sensing (Fuel Trim only)** — sensors in centre, inner and trim tanks give a signal at a predetermined filling level for accuracy testing during refuelling; the trim tank calibration switching level is corrected by stabiliser position

## Fuel Quantity Measurement and Indication

The fuel quantity system: measures fuel quantity in the tanks; indicates it on the fuel quantity indicator, pre-selector and ECAM/EFIS; controls automatic refuelling; and sends fuel quantity messages to the flight management computer. It comprises a fuel quantity computer, capacitance probes, a capacitance index compensator, a condensicon sensor, an attitude sensor, a THS position detector and flight-compartment indicators.

### Principle of Capacitance Gauging

A capacitor stores electrical charge, the amount depending on the surface area of the plates, the gap between the plates, and the insulating material (**dielectric**) between them. In a fuel tank 'capacitor stack', the plate area and gap are fixed; the only variable is the dielectric — fuel, air, or both. As the fuel level falls, the dielectric changes toward air and the stored charge reduces; this change in capacitance is sensed by a signal conditioner to indicate fuel level.

### Fuel Quantity Indicating System

Each tank has a group of probes arranged so at least one probe is always immersed. In one wide-bodied twin example (with fuel trim system), there are **6 probes in each outer tank, 6 in each inner tank, and 4 in the centre tank**, wired in parallel to a summing adapter on the wing rear spar, feeding the fuel quantity computer.

- **Capacitance Index Compensator** — one installed at the lowest capacitance probe in each tank; senses different fuel types and additives to correct readings
- **Condensicon sensor** — senses density and dielectric constant of running fuel while refuelling
- **Attitude sensor** — senses aircraft attitude (roll/longitudinal and pitch/lateral axes) on ground and in flight, depending on the AIR/GRND signal (wing bending direction)
- **THS position detector** — senses the tailplane (THS) position for correction of trim tank fuel measurement

Fuel quantity is normally displayed in **10 kg steps**; the indicator sends feedback signals to the computer to avoid transmission errors, and displays number codes in test mode.

## Refuelling and De-Fuelling

As any liquid flows through a pipeline it produces **static electricity**; if discharged in the presence of fuel vapour, an explosion could result. Safety precautions during refuelling include:
- Use the correct grade of fuel (Av-gas, Av-tur, Av-tag)
- No smoking within **15 m**
- No metal-studded or -tipped footwear
- Correct bonding of aircraft and bowser, and correct positioning of the bowser
- No vehicles or ground equipment under the aircraft
- No replenishment of LOX and no transmitting of radar during refuelling
- Aircraft and bowser not left unattended
- Fuel spillage or leakage checked and remedied
- An appropriate fire appliance readily available

For smaller aircraft, refuelling order between tanks may be regulated to control wing bending loads (e.g. filling inner tanks first). Larger aircraft must also be refuelled in the correct order longitudinally, to maintain aircraft stability where fin, tailplane or rear-fuselage tanks are fitted.

Modern large aircraft use **pressure refuelling**, which has replaced open-line refuelling on high-capacity aircraft (filling a Boeing 747 through a normal hose and nozzle would take hours). A large-diameter hose is rigidly connected to a coupling, and fuel under a pressure of about **40 psi** is pumped into the tanks; the total fuel load can be pre-set so refuelling stops automatically at the correct time.

**Pressure refuel functional description:** fuel flows from the refuel adapters into the refuel/jettison manifold; when refuel valves open, fuel flows into the tanks through a flow tube that decreases exit force and distributes fuel within the tank. As each tank reaches full, the high-level sensor signals the refuel valve to close. Remaining fuel in the manifold drains through manifold drain valves into the main tanks, with vacuum relief valves admitting air as the fuel drains. If a system failure prevents the refuel valves closing, fuel enters the surge tanks; if it reaches the surge tank float switches, all refuel valves are closed.

**Defuelling** a pressure-type system is almost the reverse of refuelling: a de-fuel bowser is connected to the single fuel point coupling, and using the bowser's suction pump together with the aircraft's own booster pumps, selected tanks return their contents to the bowser.

## Longitudinal Balance Fuel Systems

Fuel weight is a large percentage of an aircraft's total weight, and the aircraft's balance changes as fuel is used. In small aircraft, the fuel tank(s) are located near the centre of gravity so balance changes little as fuel is used. In large aircraft, fuel tanks are installed in every available location, and fuel valves allow the flight engineer to keep the aircraft balanced by scheduling fuel use from the various tanks. High-performance military jets and modern civil aircraft use a fully automatic fuel scheduling system to reduce flight-crew workload.

**Supersonic flight fuel transfer:** in supersonic flight the aerodynamic centre of pressure moves aft, changing longitudinal stability. This was compensated in aircraft such as **Concorde** by moving the centre of gravity — shifting fuel as necessary between the fuel tanks in the rear fuselage and the wings.
        $cnt$,
        13
    ) RETURNING id INTO s13_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module M11A.14: Hydraulic Power Systems
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m11_id, 'M11A.14', 'Hydraulic Power Systems',
        $cnt2$
# Hydraulic Power Systems

## Comparison with Other Power Transfer Systems

Fluid power systems are mechanical systems in which a moving fluid performs work. Systems using a compressible gas are **pneumatic systems**; systems using an incompressible liquid are **hydraulic systems**. This method of operation is termed **Hydraulic Actuation**, often used for landing gear, flight controls, flaps and slats, air brakes, wheel brakes, nose-wheel steering and freight doors.

**Advantages of hydraulics over mechanical systems:**
- Smoother and steadier movement
- Power confined to pipelines and components, avoiding extra airframe strengthening needed for mechanical operations
- Higher power/weight ratio than mechanical systems, particularly on large transport aircraft
- Simpler installation — pipelines can be routed around obstructions, whereas mechanical operation needs levers, guides, bell-cranks and pulleys
- Variation in speed of operation achieved without complex gearing
- Power normally obtained from the aircraft engines, relieving the pilot of fatigue

**Compared with electrical systems:** cables route around obstructions even more easily than pipelines and are generally lighter, but actuating landing gear and flight controls on large aircraft would require large, heavy electric motors and generators with high-current cables — so electrically operated systems are normally limited to light aircraft.

**Compared with pneumatic systems:** some older aircraft used pneumatics for brakes and emergency gear extension; modern large transports use high-pressure pneumatics for high-temperature, fire-hazard areas such as thrust-reversing and engine starting, and for cabin pressurisation/air-conditioning. The main disadvantage versus hydraulics is compressibility when actuating highly loaded systems such as landing gear and flight controls, plus difficulty detecting leaks and problems with moisture/corrosion contamination. Pneumatic advantages include lightness and the fact that return lines are unnecessary.

## Basic Hydraulic Principles

### Compressibility

All liquids have a high resistance to compression. If two cylinders of equal volume — one containing liquid, one containing air — each have a force of **20,000 N** applied to their pistons, the decrease in volume of the air is large compared with that of the liquid, which is negligible.

### Pascal's Law

Power transmission in a closed hydraulic (or pneumatic) system is explained by **Pascal's Law**: *"Pressure in an enclosed container is transmitted equally and undiminished to all parts of the container and acts at right angles to the enclosing walls."*

### Force Due to Fluid Pressure

Worked example: a pressure of **10 N/mm²** is applied to a piston of **40 mm diameter** (20 mm radius) in a cylinder actuator.
- Piston area = π × r² = 3.142 × 20² = **1,256.8 mm²**
- Force = 10 N/mm² × 1,256.8 mm² = **12,568 N**

When the same pressure is applied to the opposite side of the piston, where a 10 mm diameter ram reduces the effective area:
- Effective area = 1,256.8 mm² − (3.142 × 5²) = 1,256.8 − 78.55 = **1,178.25 mm²**
- Force = 10 N/mm² × 1,178.25 mm² = **11,782.5 N**

### Differential Area

When the two fluid ports of the actuator above are connected together, the pressure is the same on both sides of the piston, but the resultant force — because the areas differ — is 12,568 N − 11,782.5 N = **785.5 N**, and the piston extends.

## Hydraulic Fluids

### Efficiency

The efficiency of a hydraulic system is governed by the resistance to fluid motion: a certain amount of force is needed to overcome friction between pistons and cylinders, piston rods against bearings and seals, etc. Friction between the fluid and pipeline/hose walls depends on the velocity of the fluid, the bore/length/internal finish of the pipelines, the number and radius of bends, and the viscosity of the fluid.

### Properties of an Ideal Hydraulic Fluid

Fluids used in aircraft hydraulic systems must:
- Be as incompressible as possible
- Have a very low viscosity rate
- Be free-flowing over a wide temperature range
- Be chemically stable
- Not affect, or be affected by, the materials in the system components
- Not foam during operation under sudden pressure increases or decreases
- Have good lubrication properties
- Have a high flash point
- Not deteriorate or form sludge

Only the fluid type recommended by the component manufacturer (specified in the Maintenance Manual) is permitted in a given system.

### Types of Hydraulic Fluid

There are three basic types:
1. **Vegetable (Castor oil) base** — DTD 900/4081 (MIL-H-7644), golden yellow (or blue), used with natural rubber seals; inflammable, strips paint, attacks synthetic rubber, and is toxic in a fine spray mist. Can be flushed with alcohol; found only on very old aircraft
2. **Mineral base** — DTD 585 (MIL-H-5606), red, used with synthetic rubber (Neoprene) seals; a kerosene-type petroleum product with good lubricating properties, but inflammable and attacks natural rubber. Can be flushed with naphtha, varsol or Stoddard solvent
3. **Synthetic ester base** — Skydrol 500B, purple, used with Butyl, Ethylene Propylene or Teflon seals; fire-resistant, strips paint, attacks natural and synthetic rubbers, and operates over a very wide temperature range (from about −20°C up to 107°C / 225°F). Skydrol systems are flushed with trichlorethylene; components cleaned with MEK or isopropyl alcohol; it causes skin/eye irritation so protective equipment must be worn

**Caution:** these fluid types are not compatible with each other and must never be mixed. If a system is inadvertently serviced with the wrong fluid, it must be drained, flushed with an approved solvent, and all seals replaced.

### Seals

Seals minimise internal leakage and pressure loss. The two main types are **gaskets** (no relative movement between surfaces) and **packings** (relative movement exists, e.g. piston and rotating shaft sealing). Rubber seals have a shelf life from their cure (manufacture) date, and should be stored in original packaging, issued **First In – First Out**, away from UV light and ionised atmospheres.

Common seal designs:
- **Chevron/V-ring and U-section seals** — one-way seals; two sets installed back-to-back are needed to prevent flow in both directions; used in high-pressure situations
- **Double-acting (two-way) seals** — "T" section profile prevents rolling and spiral failure; PTFE backing rings prevent extrusion under high pressure/speed
- **Duplex seals** — often in accumulators, floating pistons and emergency air circuits; inner soft rubber bonded to a harder outer layer, sealing against varying oil and air pressures
- **Square section seals** — used on piston heads and landing gear oleos; withstand high pressure and sudden deflections
- **Wiper ring seals** — not a pressure seal, but a scraper that removes dirt, oil and water from the piston shaft to protect the pressure seal
- **Bonded seals** — fitted to banjo unions and adaptor plugs; the rubber is bonded to a metal washer
- **O-ring seals** — the most common double-acting seal; the groove depth should be **10% less than the seal diameter** to provide correct compression ("pinch"); with less than 10% pinch, fluid leaks past under low pressure. Back-up rings prevent extrusion between piston and cylinder wall under high pressure

## Hydraulic Power Systems

As aircraft complexity has grown, so has the demand for hydraulically operated equipment — retractable landing gear, wing flaps, brakes, cowl flaps, doors and stairs, powered flight controls, leading/trailing edge flaps and slats — leading to complete, independent hydraulic power supply systems.

### Simple Hydraulic System

A basic system consists of fluid, pipelines/hoses, a **reservoir**, a **pump**, **actuators**, and **valves**. In the simplest form, fluid is drawn from the reservoir through a non-return valve into a hand pump, pushed through another NRV to a 3-position **selector valve**, which directs it to either side of a double-acting linear actuator or locks the fluid (Off position). Return fluid is diverted back to the reservoir via the selector valve.

Fitting an **Engine Driven Pump (EDP)** relieves the pilot of hand-pumping; the hand pump is retained as an emergency back-up and for ground servicing/testing. Because a constant-volume EDP keeps producing pressure even when not needed, an **unloading (cut-out) valve** is fitted to divert fluid back to the reservoir with minimal engine power absorbed. A **non-return valve** after the unloading valve maintains positive system pressure when idling. A **system pressure relief valve** relieves excess pressure when an actuator reaches the end of its stroke.

An **accumulator** maintains a pressurised fluid supply to absorb the initial pressure drop when a selector valve opens, and cushions pressure surges ("shock absorber") at the end of actuator travel. It has two compartments separated by a movable piston or diaphragm — one connected to the pressure manifold, the other charged with air or nitrogen (nitrogen is used because it is inert and moisture-free).

A **standpipe (stackpipe)** in the reservoir sets the EDP supply line higher than the emergency hand-pump supply line, ensuring enough fluid remains to operate essential services (brakes, landing gear) via the hand pump even after a significant leak downstream. A **scavenge/return filter** is fitted in the return line before the reservoir; a second filter is fitted immediately after the EDP to protect the system from contamination if the EDP fails.

## System Components

### Reservoirs

The reservoir stores hydraulic fluid, supplies it to the system through the pump, receives return fluid, accommodates fluid from thermal expansion, compensates for slight leaks, and (via a standpipe) provides a reserve for emergency operation.

- **Vented reservoir** — normally fitted to unpressurised piston-engine aircraft operating below about **20,000 feet**; located above the EDPs to ensure a positive head of pressure. Turbulence, negative 'g' or high roll angles can cause temporary loss of supply and pump inlet cavitation, so a low-pressure pump is sometimes installed between the reservoir and EDPs
- **Pressurised reservoir** — required on jet/turboprop aircraft flying above **20,000 feet**, to prevent fluid foaming at low ambient pressure and to prevent pump cavitation. Pressurisation sources include a nitrogen-charged cylinder, cabin pressurisation air, engine compressor/bleed air (P3), or hydraulic system pressure. Bleed-air/cabin-air pressurisation is typically **30 to 45 psi**. Where pressurised by system hydraulic pressure, pressure ratios of about **50:1** are common — e.g. a 3,000 psi system pressure gives a reservoir pressure of about 60 psi
- **Remote servicing point** — a convenient, ground-accessible point for replenishment, typically comprising a self-sealing quick-release filler point, hand pump, reservoir de-pressurisation valve, level indicator and selector valve

### Filters

Filters are rated by the size of particles they arrest, measured in **microns** (one micron = one millionth of a metre, or 0.000039 inch). Particles as small as **40 microns** are just visible to the naked eye; filters removing particles smaller than **10 microns** maintain very clean fluid. Common designs include the paper element type (pleated for surface area) and the micronic element type (wrapped around a spring wire coil); most have a bypass valve so a blocked filter allows unfiltered fluid through rather than starving the system. Filters are typically fitted as L.P. (low pressure), H.P. (high pressure) and by-pass filters.

### Accumulators

**Purpose:** absorb pressure fluctuations, ensure immediate delivery of pressurised fluid on demand, and allow limited system operation when the EDP is not running. Since hydraulic fluid is non-compressible, the compressibility effect needed to store pressure is gained via the accumulator's gas charge.

- **Piston type** — a cylinder with a floating piston; one compartment connects to the pressure manifold, the other is charged with dry air or nitrogen through a high-pressure charging valve, typically to about **1,500 psi** (approximately half normal system operating pressure)
- **Bladder and diaphragm type** — spherical, cast or moulded aluminium (or stainless steel); the gas side is charged to about **1,200–1,500 psi**; as system pressure rises (typically to around **2,500–3,000 psi**), fluid deflects the bladder/diaphragm, compressing the nitrogen and providing a flexible cushion

## Pressure Generation (Hydraulic Pumps)

A pump does not create pressure — pressure is produced when fluid flow is restricted (analogous to an electrical circuit: flow = current, pressure = voltage, opposition to flow = resistance).

### Hand Pumps

Most modern aircraft use **double-action** hand pumps (moving fluid on both strokes) rather than single-action types, for greater efficiency — a "piston rod displacement pump," where the pumping action arises from the difference in area between the two sides of the piston due to the piston rod.

### Suction Boost Pumps

A low-pressure pump (approximately **100 psi**) located between the reservoir and the EDP inlet, providing positive inlet pressure to prevent cavitation of the main pressure pump. If a boost pump fails, the EDP and system still operate, but at possibly reduced efficiency with a risk of cavitation.

### Powered Pumps

The two basic types are:

1. **Constant Volume/Fixed Displacement (Non-self-idling)** — moves a specific volume of fluid per drive-shaft revolution, requiring an unloading/cut-out valve to relieve excess pressure. The most common medium-pressure type is the **gear pump**: rugged, dependable, few moving parts, inexpensive; a relief valve holds oil in the shafts (case pressure) at about **15 psi**, so if a shaft or seal is scored, fluid is forced out rather than air drawn in. Spur gear pumps give a good non-pulsating flow but are limited to about **800 psi**, so are used on smaller aircraft or as back-up pumps for piston-type pumps (operating between roughly **1,200 and 3,000 psi**). Other constant-volume types include axial and radial piston pumps (used above about **2,500 psi**) and vane pumps (large volume at relatively low pressure)

2. **Constant Pressure/Variable Displacement (Self-idling)** — moves only the amount of fluid the system requires; as pressure builds with no actuation, delivery is automatically reduced toward no-flow, maintaining constant system pressure without a separate unloading valve. Typically a two-stage pump: a low-pressure, high-volume spur gear first stage feeding a high-pressure axial multi-piston second stage. Piston stroke is varied by a **yoke (swash-plate/cam)** mechanism, controlled by a servo control piston sensing system pressure — at 90° to the drive shaft, stroke is zero and there is no load on the shaft. The **Stratopower** demand-type pump is a common example, using nine axially-orientated pistons with a fixed-stroke cam, typically delivering **22–37 gpm** at a nominal supply pressure of **3,000 psi**; the effective piston stroke (controlled by a compensator spring/stem piston mechanism) governs delivery

### Emergency Pressure Generation

If the main hydraulic supply fails, alternative sources include: a hand pump operated by the pilot; duplication of supplies; electrically operated AC or DC pumps; compressed-air-driven Air Turbine Motor pumps (ATM/ATDP); and Ram Air Turbine pumps (RAT).

- **Electric Motor Driven Pumps (EMDP)** — commonly 115V AC, three-phase, connected in parallel with each EDP, drawing from the same reservoir via a lower supply line; capacity is typically **6–10 gpm** at about **2,700 psi**. Some aircraft also fit a low-capacity (3 gpm at 2,700 psi) 28V DC motor-driven pump for emergency power and initial system pressurisation for brakes
- **Air Turbine Driven Pumps (ATDP)** — used on aircraft such as the Airbus A300 series and Boeing 767; receive pressurised bleed air, with flow controlled and modulated by a solenoid-operated pressure regulator and shut-off valve
- **Power Transfer Units (PTU)** — a hydraulic motor supplied by one system drives a shaft that powers a pump feeding a second system, in one integrated casing; e.g. the B737 PTU automatically supplies the slat system if pressure drops
- **Hydraulic Ram Air Turbines (HYRAT)** — an emergency turbine, normally stowed in the fuselage (e.g. Lockheed L-1011, Boeing 767), deployed automatically or manually in a major hydraulic failure; output pressure is governed by varying blade angle with aircraft speed and demand

**Duplication of supply:** on multi-engined aircraft, two or more pumps often supply a power circuit so that, should one self-idling pump fail, the remaining pump still provides fluid flow (at half the normal rate). Accumulators in such circuits dampen pump pulsations, speed up initial operation of components, and provide power when EDPs are not running. Modern jet transports typically have at least two completely independent hydraulic systems with duplicated actuation of primary flight controls, plus a standby system.

## Hydraulic Valves

Hydraulic valves divide into **pressure control valves** (adjust, regulate or limit pressure) and **flow control valves** (select and direct the flow of fluid, not normally concerned with pressure).

### Pressure Control Valves

- **Pressure relief valve** — e.g. a "blow-back" valve in a flap circuit, bypassing pressure fluid in the Down line to the return line, allowing flaps to blow back if left down as speed increases, and preventing the pilot lowering flaps at high airspeed
- **Pressure regulators** — e.g. a "balanced-type" regulator: in a worked example, at a balance pressure of **1,500 psi**, a 1,000 lb spring force plus 1/3 of 1,500 lb (500 lb) of ball force balances the upward piston force; above this, the piston lifts the ball off its seat and dumps pump delivery to the reservoir at near-zero pressure until system pressure drops to **1,000 psi**, giving a cycling pressure range of **1,000–1,500 psi**
- **Thermal relief valve** — relieves excess pressure caused by fluid expansion from a temperature rise in a closed circuit (e.g. between an NRV and an actuator), back to the reservoir; a restrictor pack ensures only slow, thermal-expansion pressure changes operate the valve
- **Pressure reducing valve** — reduces system pressure by a balance of hydraulic and spring forces for components needing a lower operating pressure; in a worked example, a 1,500 psi system is reduced to and maintained at **200 psi**, with an internal relief action holding the chamber behind the piston at **750 psi**

### Flow Control Valves

Flow control valves may be manually or automatically operated (by flow, pressure or remote sensing), and mechanically, electrically or hydraulically actuated; valve types include ball, sleeve, poppet, rotary, piston and sliding-spool.

- **Non-return (check) valve** — the simplest flow control valve, allowing flow in one direction only; always fitted just downstream of the pump to prevent reverse flow. A **restricted (orifice) check valve** allows full flow one way and restricted flow the other
- **Selector valves** — direct fluid to the appropriate side of an actuator and provide a return path from the opposite side; may be ball, rotary, sliding-spool or poppet type (poppet types give more positive shut-off for higher-pressure systems). Electrically operated selector valves use solenoids to control a spool valve, eliminating bulky mechanical linkages — **fly-by-wire** systems are a modern example
- **Priority valves** — similar to sequence valves but opened by hydraulic pressure rather than mechanical means; e.g. shutting off flow to the Main Landing Gear until wheel-well doors have fully opened and pressure builds at the end of their stroke
- **Sequence valves** — similar in function to priority valves (allowing one component to operate before another) but controlled by mechanical displacement of a plunger moving a ball valve off its seat, rather than by fluid pressure; commonly used so landing gear doors open fully before the gear itself retracts or extends
- **Hydraulic fuses** — block fluid flow if a serious leak develops. A **pressure-sensing fuse** senses the pressure drop across the valve: if a serious leak occurs downstream, the resulting pressure drop generates a force on the piston greater than that of its spring, moving the piston to shut off flow — the valve resets only once system pressure is relieved. A **flow-sensing fuse** shuts off flow after a specific amount of fluid has passed through it, but allows unrestricted reverse flow

## Power Distribution

The complete hydraulic system consists of a **power circuit** (supplies and returns fluid to/from the component circuits), various **component circuits**, and an **emergency circuit**. A power circuit may be **self-idling** (idles once working pressure is reached) or **non-self-idling** (pump supplies fluid continuously, requiring an automatic unloading/cut-out valve).

**Component circuit examples:**
- **Flaps** — port and starboard flap jacks and synchronising jacks; a **throttling valve** (normally in the DOWN line) reduces flow rate to prevent sudden trim changes, automatically setting flow rate in proportion to supply pressure. Synchronising jacks (interconnected by transfer pipes, not connected to the power circuit) provide an assisting force to a flap that lags, keeping port and starboard flaps aligned. Thermal relief valves are fitted in both the up and down lines to prevent pipeline bursts from thermal expansion at altitude changes
- **Landing gear** — main undercarriage jacks, nose-wheel jack, and fairing door jacks; a non-return valve before the control valve provides a hydraulic lock in both UP and DOWN positions so the gear stays in its selected position when other services operate

## Hydraulic Power — Indication and Warning Systems

Information relayed to the flight deck normally comprises actual hydraulic **pressure**, **temperature** and **quantity**, plus warnings of low pressure, low quantity or high oil temperature; because most reservoirs are pressurised by bleed air, a warning of low air pressure is also included.

- **Pressure** — electro-hydraulic transducers in the hydraulic bay relay pressure to a ratiometer or LCD display, keeping oil lines out of the flight deck; a pressure switch set to minimum pump output pressure triggers visual and aural warnings
- **Quantity** — a float switch or capacitance-type detector in the reservoir relays quantity to a flight-deck gauge (litres or percentage of full); a low-level switch triggers visual/aural warnings at a pre-calibrated minimum
- **Temperature** — usually just a temperature switch in the return line as it enters the reservoir, triggering a warning above a pre-determined maximum; often associated with EMDPs, monitoring motor winding as well as oil temperature
- **Reservoir low air pressure** — a low-pressure switch in the bleed-air line, downstream of the pressure regulator, triggers a warning if pressure drops too low
- **Accumulator gas pressure** — direct-reading gauges show pre-charge (nitrogen) pressure when hydraulic pressure has dissipated, and system pressure when the pumps are running

## Interfaces with Other Systems

Hydraulic power operates powered flying controls (primary controls), leading and trailing edge flaps, spoilers, speed brakes and air brakes, wheel brakes and anti-skid, nosewheel steering, landing gear retraction and lowering, and windscreen wipers. Hydraulic pumps can be driven mechanically from the engine accessory gearbox or APU, electrically from the main electrical buses, by a Ram Air Turbine deployed into the airflow (emergency), or by bleed air (emergency). Hydraulic accumulators can also be used for parking-brake pressure storage.
        $cnt2$,
        14
    ) RETURNING id INTO s14_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M11A.13 Fuel Systems (14 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s13_id, 'Compared with rigid fuel tanks, flexible fuel tanks have the advantage of:',
     '[{"id":"a","text":"Being lighter, easier to handle and store, and able to be shaped to fit odd spaces","correct":true},{"id":"b","text":"Being able to support the full weight of the fuel without being fitted into a compartment","correct":false},{"id":"c","text":"Never requiring a protective or self-sealing covering","correct":false}]',
     '{"B1"}'),

    (s13_id, 'Integral fuel tanks are typically located:',
     '[{"id":"a","text":"Outside the wing, in external underwing pods only","correct":false},{"id":"b","text":"Between the front and rear wing spars and between the upper and lower wing skin","correct":true},{"id":"c","text":"Only within the fuselage, never within the wing structure","correct":false}]',
     '{"B1"}'),

    (s13_id, 'When sealing an integral fuel tank structure, the correct order of sealant application is:',
     '[{"id":"a","text":"Brush-on coat, then fillet, then interfay","correct":false},{"id":"b","text":"Interfay, then fillet, then a final brush-on coat","correct":true},{"id":"c","text":"Barrier coating only, with no interfay or fillet required","correct":false}]',
     '{"B1"}'),

    (s13_id, 'Each fuel tank is normally designed with additional space for fuel expansion without spillage into the surge tank of approximately:',
     '[{"id":"a","text":"2%","correct":true},{"id":"b","text":"20%","correct":false},{"id":"c","text":"50%","correct":false}]',
     '{"B1"}'),

    (s13_id, 'A typical aircraft fuel booster pump, driven by a 115-volt, three-phase motor, has an output of approximately:',
     '[{"id":"a","text":"25-30 litres per minute","correct":false},{"id":"b","text":"250-300 litres per minute","correct":true},{"id":"c","text":"2,500-3,000 litres per minute","correct":false}]',
     '{"B1"}'),

    (s13_id, 'The thermal fuse fitted to protect a fuel booster pump is activated at approximately:',
     '[{"id":"a","text":"50 degrees centigrade","correct":false},{"id":"b","text":"100 degrees centigrade","correct":false},{"id":"c","text":"175 degrees centigrade","correct":true}]',
     '{"B1"}'),

    (s13_id, 'The by-pass valve fitted to a fuel booster pump allows an engine to be operated on suction feed up to approximately:',
     '[{"id":"a","text":"2,000 feet","correct":false},{"id":"b","text":"6,000 feet","correct":true},{"id":"c","text":"20,000 feet","correct":false}]',
     '{"B1"}'),

    (s13_id, 'In a typical sequence valve arrangement (centre, inner and outer tank pumps), the valve limits the outer tank pump pressure from 38 psi to approximately:',
     '[{"id":"a","text":"5 psi","correct":false},{"id":"b","text":"17.5 psi","correct":true},{"id":"c","text":"30 psi","correct":false}]',
     '{"B1"}'),

    (s13_id, 'In a fuel jettison (dumping) system, the check valve installed to separate the outer tanks during jettisoning is fitted to:',
     '[{"id":"a","text":"Prevent the dumping of fuel from the outer tanks","correct":true},{"id":"b","text":"Increase the jettison transfer rate above 350 litres per minute","correct":false},{"id":"c","text":"Allow the APU to draw fuel directly from the jettison pipe","correct":false}]',
     '{"B1"}'),

    (s13_id, 'Reid Vapour Pressure (RVP) is defined as:',
     '[{"id":"a","text":"The pressure at which a hydraulic reservoir is charged","correct":false},{"id":"b","text":"The rate at which fuel gives off vapour","correct":true},{"id":"c","text":"The pressure differential across a fuel filter element","correct":false}]',
     '{"B1"}'),

    (s13_id, 'On modern large aircraft, pressure refuelling delivers fuel to the tanks under a typical pressure of about:',
     '[{"id":"a","text":"4 psi","correct":false},{"id":"b","text":"40 psi","correct":true},{"id":"c","text":"400 psi","correct":false}]',
     '{"B1"}'),

    (s13_id, 'In a typical wide-bodied twin fuel quantity indicating system with a fuel trim system fitted, the number of capacitance probes is:',
     '[{"id":"a","text":"6 in each outer tank, 6 in each inner tank, and 4 in the centre tank","correct":true},{"id":"b","text":"2 in each outer tank, 2 in each inner tank, and 1 in the centre tank","correct":false},{"id":"c","text":"10 in each outer tank, 10 in each inner tank, and 10 in the centre tank","correct":false}]',
     '{"B1"}'),

    (s13_id, 'During aircraft refuelling, one of the listed safety precautions is that smoking is not permitted within:',
     '[{"id":"a","text":"1 metre of the aircraft","correct":false},{"id":"b","text":"15 metres of the aircraft","correct":true},{"id":"c","text":"150 metres of the aircraft","correct":false}]',
     '{"B1"}'),

    (s13_id, 'On Concorde, the effect of the aerodynamic centre of pressure moving aft in supersonic flight was compensated by:',
     '[{"id":"a","text":"Jettisoning fuel from the rear fuselage tanks only","correct":false},{"id":"b","text":"Shifting fuel between the rear fuselage tanks and the wing tanks to move the centre of gravity","correct":true},{"id":"c","text":"Increasing cross-feed valve pressure to the engines","correct":false}]',
     '{"B1"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M11A.14 Hydraulic Power Systems (18 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s14_id, 'A fluid power system that uses an incompressible liquid to transmit force is termed:',
     '[{"id":"a","text":"A pneumatic system","correct":false},{"id":"b","text":"A hydraulic system","correct":true},{"id":"c","text":"An electro-mechanical system","correct":false}]',
     '{"B1"}'),

    (s14_id, 'Compared with mechanical systems, hydraulic actuation offers:',
     '[{"id":"a","text":"A lower power/weight ratio, particularly on large transport aircraft","correct":false},{"id":"b","text":"Smoother, steadier movement and a higher power/weight ratio","correct":true},{"id":"c","text":"No benefit in routing pipelines around structure compared to mechanical linkages","correct":false}]',
     '{"B1"}'),

    (s14_id, 'Pascal''s Law states that pressure in an enclosed container is:',
     '[{"id":"a","text":"Transmitted equally and undiminished to all parts of the container, acting at right angles to the enclosing walls","correct":true},{"id":"b","text":"Concentrated only at the lowest point of the container","correct":false},{"id":"c","text":"Reduced progressively the further it travels from the point of application","correct":false}]',
     '{"B1"}'),

    (s14_id, 'A hydraulic actuator piston of 40 mm diameter has a pressure of 10 N/mm² applied to it. The force produced is approximately:',
     '[{"id":"a","text":"1,257 N","correct":false},{"id":"b","text":"12,568 N","correct":true},{"id":"c","text":"125,680 N","correct":false}]',
     '{"B1"}'),

    (s14_id, 'In a differential area actuator, when equal pressure is applied to both sides of the piston simultaneously, the piston:',
     '[{"id":"a","text":"Remains stationary because the forces are perfectly balanced","correct":false},{"id":"b","text":"Extends, because the rod reduces the effective area on one side, producing a resultant force","correct":true},{"id":"c","text":"Retracts fully regardless of which side has the rod","correct":false}]',
     '{"B1"}'),

    (s14_id, 'Mineral-base hydraulic fluid to specification DTD 585 (MIL-H-5606) is:',
     '[{"id":"a","text":"Purple in colour, used with Teflon seals, and fire resistant","correct":false},{"id":"b","text":"Red in colour, used with synthetic rubber seals, and attacks natural rubber","correct":true},{"id":"c","text":"Golden yellow, used with natural rubber seals, and flushed with alcohol","correct":false}]',
     '{"B1"}'),

    (s14_id, 'Skydrol 500B is a hydraulic fluid that is:',
     '[{"id":"a","text":"A vegetable (castor oil) base fluid, coloured golden yellow","correct":false},{"id":"b","text":"A mineral base fluid, coloured red","correct":false},{"id":"c","text":"A synthetic ester base fluid, coloured purple, used with Butyl, Ethylene Propylene or Teflon seals","correct":true}]',
     '{"B1"}'),

    (s14_id, 'Which of the following is NOT a required property of an ideal aircraft hydraulic fluid?',
     '[{"id":"a","text":"A high flash point","correct":false},{"id":"b","text":"A very low viscosity rate and good lubrication properties","correct":false},{"id":"c","text":"A tendency to foam under sudden pressure changes","correct":true}]',
     '{"B1"}'),

    (s14_id, 'The groove into which an O-ring seal fits should have a depth that is:',
     '[{"id":"a","text":"10% less than the O-ring diameter, to provide correct compression (pinch)","correct":true},{"id":"b","text":"Exactly equal to the O-ring diameter","correct":false},{"id":"c","text":"50% greater than the O-ring diameter","correct":false}]',
     '{"B1"}'),

    (s14_id, 'The purpose of the standpipe (stackpipe) in a hydraulic reservoir is to:',
     '[{"id":"a","text":"Retain a reserve of fluid for emergency operation of essential services such as brakes and landing gear","correct":true},{"id":"b","text":"Vent the reservoir directly to atmosphere at all altitudes","correct":false},{"id":"c","text":"Increase the fluid temperature before it reaches the EDP","correct":false}]',
     '{"B1"}'),

    (s14_id, 'Jet and turboprop aircraft that fly above approximately 20,000 feet require a pressurised hydraulic reservoir mainly to:',
     '[{"id":"a","text":"Prevent foaming of the fluid and pump cavitation caused by low ambient pressure","correct":true},{"id":"b","text":"Reduce the fluid''s flash point at altitude","correct":false},{"id":"c","text":"Increase the fluid''s viscosity for landing gear operation","correct":false}]',
     '{"B1"}'),

    (s14_id, 'A hydraulic filter capable of removing particles smaller than 10 microns will:',
     '[{"id":"a","text":"Maintain a very clean fluid","correct":true},{"id":"b","text":"Allow only particles visible to the naked eye to pass","correct":false},{"id":"c","text":"Block all fluid flow through the system","correct":false}]',
     '{"B1"}'),

    (s14_id, 'The purpose of a hydraulic accumulator includes all of the following EXCEPT:',
     '[{"id":"a","text":"Absorbing fluctuations in system pressure","correct":false},{"id":"b","text":"Allowing limited system operation when the EDP is not running","correct":false},{"id":"c","text":"Permanently replacing the need for an engine-driven pump","correct":true}]',
     '{"B1"}'),

    (s14_id, 'A Constant Volume/Fixed Displacement (non-self-idling) hydraulic pump requires an unloading (cut-out) valve because it:',
     '[{"id":"a","text":"Delivers a fixed amount of fluid per shaft revolution regardless of system demand","correct":true},{"id":"b","text":"Automatically reduces its delivery to zero once system pressure is reached","correct":false},{"id":"c","text":"Cannot be used with an accumulator","correct":false}]',
     '{"B1"}'),

    (s14_id, 'Spur gear type hydraulic pumps are generally limited to pressures of approximately:',
     '[{"id":"a","text":"80 psi","correct":false},{"id":"b","text":"800 psi","correct":true},{"id":"c","text":"8,000 psi","correct":false}]',
     '{"B1"}'),

    (s14_id, 'A non-return (check) valve is normally fitted immediately downstream of a hydraulic pump in order to:',
     '[{"id":"a","text":"Prevent reverse flow of fluid through the pump when it is stationary or not in use","correct":true},{"id":"b","text":"Increase pump output pressure above its rated maximum","correct":false},{"id":"c","text":"Provide the only means of filtering the system fluid","correct":false}]',
     '{"B1"}'),

    (s14_id, 'The key difference between a priority valve and a sequence valve is that:',
     '[{"id":"a","text":"Priority valves are opened by hydraulic pressure, while sequence valves are controlled by mechanical displacement of a plunger","correct":true},{"id":"b","text":"Sequence valves are opened by hydraulic pressure, while priority valves are electrically operated only","correct":false},{"id":"c","text":"There is no functional difference between the two valve types","correct":false}]',
     '{"B1"}'),

    (s14_id, 'A pressure-sensing hydraulic fuse shuts off fluid flow when:',
     '[{"id":"a","text":"A specific total volume of fluid has passed through it","correct":false},{"id":"b","text":"A serious downstream leak causes a pressure drop that generates a force on the piston greater than its spring force","correct":true},{"id":"c","text":"The fluid temperature exceeds a pre-set maximum","correct":false}]',
     '{"B1"}');

END $$;
