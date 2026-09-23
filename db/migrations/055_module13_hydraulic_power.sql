-- Module 13: Aircraft Aerodynamic Structures (B2) — Hydraulic Power
-- Source: EASA Part-66 official textbook chapter on Hydraulic Power (IKAROS Aviation Training Centre)

DO $$
DECLARE
    m13_id INT;
    s1_id  INT;
BEGIN
    SELECT id INTO m13_id FROM easa_modules WHERE code = 'M13';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M13.14') THEN
        RAISE NOTICE 'M13.14 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 13.14: Hydraulic Power
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m13_id, 'M13.14', 'Hydraulic Power',
        $cnt$
# Hydraulic Power

## Introduction to Fluid Power

Fluid power systems are mechanical systems in which a moving fluid performs work. The fluid may be either a compressible gas or an incompressible liquid:

- Systems that use **compressible fluids (gases)** are called **pneumatic systems**
- Systems that use **incompressible fluids** are called **hydraulic systems**

Hydraulic power is often used to operate aircraft landing gear, flight controls, flaps and slats, air brakes, wheel brakes, nose-wheel steering and freight doors, in conjunction with other systems. This method of operation is termed **Hydraulic Actuation**.

## Hydraulic Power Compared with Other Power Transfer Systems

### Advantages Over Mechanical Systems

- Hydraulics provides **smoother and steadier movement**.
- Hydraulic power is confined to pipelines and components, avoiding the extra strengthening of airframe structure required for mechanical operations.
- Hydraulic systems have a **higher power/weight ratio** than mechanical systems, particularly on large transport aircraft.
- Installation is simpler — pipelines can be routed around obstructions and structure, whereas mechanical operation requires levers, guides, bell-cranks and pulleys to change direction.
- Variation in speed of operation can be achieved without complex gearing.
- Hydraulic actuation normally obtains its power from the aircraft engines, relieving the pilot of unnecessary fatigue.

### Electrical Systems

Electrical cables can be routed around obstructions even more easily than pipelines, and are generally lighter. However, the power required to actuate landing gear and flight controls of large aircraft would require large electric motors powered by equally large (and heavy) generators, with high-current cables connecting the components. For this reason, electrically operated systems are normally limited to **light aircraft**.

### Pneumatic Systems

Some older aircraft used pneumatics for brake systems and emergency landing gear extension. Modern large transport aircraft use high-pressure pneumatics in high-temperature, fire-hazard areas such as jet-engine thrust reversing and engine starting, as well as cabin pressurisation and air-conditioning. The main disadvantage of pneumatics over hydraulic actuation is **compressibility** when actuating highly loaded systems such as landing gear and flight controls; difficulty in detecting leaks and problems with moisture/corrosion contamination have also limited its use as a remote control system. Pneumatic power does have advantages, such as lightness and the fact that return lines are unnecessary.

## Basic Hydraulic Principles: Compressibility and Pascal's Law

**All liquids have a high resistance to compression.** If two cylinders of equal volume — one containing liquid, one containing air — each have a force of 20,000 N applied to their pistons, the decrease in volume of the air is large compared with that of the liquid, which is negligible.

Power transmission in a closed hydraulic (or pneumatic) system is best explained by **Pascal's Law**, which states:

> "Pressure in an enclosed container is transmitted equally and undiminished to all parts of the container and acts at right angles to the enclosing walls."

In an open container, the pressure produced by a fluid is caused by the height of fluid above the point at which pressure is measured — the higher the fluid above the gauge, the greater the pressure. In a **closed** container, pressure applied to a liquid rises to the same amount in all parts of the container.

## Force Due to Fluid Pressure and Differential Area

Fluid pressure is transmitted equally in all directions, but in hydraulic actuation it is important to know the **total effect of the pressure upon a particular surface** — i.e. the force produced.

**Worked example:** A pressure of 10 N/mm² is applied to one side of a piston of 40 mm diameter (radius 20 mm) in a cylinder actuator:

- Piston area = 3.142 × 20mm² = **1,256.8 mm²**
- Force = 10 N/mm² × 1,256.8 mm² = **12,568 Nf**

When the same pressure is applied to the opposite side of the piston, where a ram reduces the effective area (piston area minus ram area), the force is **smaller**:

- Effective area = (3.142 × 20mm × 20mm) − (3.142 × 5mm × 5mm) = 1,256.8mm² − 78.55mm² = **1,178.25 mm²**
- Force = 10 N/mm² × 1,178.25 mm² = **11,782.5 Nf**

### Differential Area

If the two fluid ports of a double-acting actuator are connected together, the pressure is the same on both sides of the piston, but the force is unequal because of the difference in area caused by the piston rod. With a force of 12,568 Nf on the larger area and 11,782.5 Nf on the smaller area, the resultant force is **785.5 Nf**, and the piston will extend.

## Hydraulic Fluids

### Efficiency

The efficiency of a hydraulic system is governed by resistance to motion, including friction between pistons and cylinders, and piston rods against bearings and seals. Friction between the fluid and pipeline/hose walls depends upon:

- Velocity of the fluid in the pipelines
- Bore, length and internal finish of the pipelines
- Number of bends in the pipelines and the radius of the bends
- Viscosity of the fluid

### Properties of an Ideal Hydraulic Fluid

Fluids used in an aircraft hydraulic system must:

- Be as **incompressible** as possible
- Have a very **low viscosity rate**
- Be free-flowing over a **wide temperature range**
- Be **chemically stable**
- Not affect, or be affected by, the materials in the system components
- Not foam during operation when subject to sudden pressure changes
- Have **good lubrication** properties
- Have a **high flash point**
- Not deteriorate or form sludge

Only the fluid type recommended by the manufacturer of the hydraulic components (specified in the Maintenance Manual) may be used in a given system.

### Types of Hydraulic Fluid

There are three basic types of hydraulic fluid used in aircraft:

| Type | Specification | Colour | Seal material | Notes |
|------|---------------|--------|----------------|-------|
| **Vegetable (Castor oil) base** | DTD 900/4081 (MIL-H-7644) | Golden yellow (or blue) | Natural rubber | Inflammable; strips paint; attacks synthetic rubber; toxic in a fine spray mist; flushed with alcohol; found only on very old aircraft types |
| **Mineral base** | DTD 585 (MIL-H-5606) | Red | Synthetic rubber (Neoprene) | Kerosene-type petroleum product with good lubricating properties; inflammable; attacks natural rubber; flushed with naphtha, varsol or Stoddard solvent; density and lubricating properties vary with temperature |
| **Synthetic ester base** | Skydrol 500B | Purple | Butyl, Ethylene Propylene or Teflon | Fire resistant; strips paint; attacks natural and synthetic rubbers; operates from −20°C (−68°F) to 107°C (225°F); flushed with trichlorethylene; components cleaned with methyl ethyl ketone (MEK) or isopropyl alcohol; causes irritation of skin and burning of eyes — protective equipment must be worn |

**CAUTION:** These fluids are **not compatible with each other and must never be mixed**. If a system is inadvertently serviced with the wrong fluid, it must be completely drained and flushed with an approved solvent, and all seals replaced.

## Seals

Seals minimise internal leakage and loss of system pressure. The two main types used in aviation are:

- **Gaskets** — used where there is no relative movement between surfaces (covers, inspection panels, end-plate sealing)
- **Packings** — used where relative movement exists (piston and actuator sealing, rotating shaft sealing)

All rubber seals have a **shelf life** starting from the cure (manufacture) date, dependent on material type, use and storage conditions. Rubber items should be stored in a constant, dry, cool environment away from UV light and ionised atmospheres, and issued from stores on a **"First in – First out"** basis.

### Types of Seals

| Seal type | Application / characteristics |
|-----------|-------------------------------|
| **Chevron/V-ring and U-section** | One-way seals; prevent flow in one direction only — two sets fitted back-to-back are needed to prevent flow in both directions; used in very high-pressure situations |
| **Double-acting (two-way), "T"-section** | Provides a stable base preventing rolling and spiral failure; PTFE backing rings prevent extrusion (distortion) under high pressure and piston speed |
| **Duplex seal** | Fitted in accumulators, floating pistons and emergency air circuits; inner layer of soft rubber bonded to a harder outer layer, sealing against varying oil and air pressures |
| **Square section seal** | Used on piston heads and landing gear oleos; withstands high pressure and sudden, high-speed piston deflections |
| **Wiper ring seal** | Not a pressure seal — acts as a scraper, removing dirt, oil and water from the piston shaft to protect and prolong the life of the pressure seal |
| **Bonded seal** | Fitted to banjo unions, adaptor plugs and flush-mounted components; rubber bonded to a metal washer |
| **O-ring seal** | The most commonly used two-way seal in fluid and pneumatic systems; the groove depth should be **10% less than the seal diameter**, providing compression ("pinch") that seals under zero-pressure conditions; back-up rings prevent extrusion under high pressure |

## Simple Hydraulic System Operation

A basic hydraulic system consists of: fluid to transmit the force; pipelines and hoses; a **reservoir** to store fluid; a **pump** to move fluid; **actuators** to convert fluid flow into mechanical work; and **valves** to control flow, direction and pressure.

In a simple system, fluid is drawn from the reservoir into a hand pump through a non-return valve (NRV), then pushed through another NRV to a 3-position **selector valve**, which directs it to either side of a double-acting linear actuator, or locks it (Off position). Fluid from the non-pressure side returns to the reservoir.

Fitting an **Engine Driven Pump (EDP)** relieves the pilot of hand-pumping; the hand pump is retained as an emergency back-up and for ground servicing/testing.

An EDP maintains pressure even when not needed, wasting engine power. This is overcome by an **unloading (automatic cut-out) valve**, which diverts fluid back to the reservoir so it circulates freely with no opposition. A **non-return valve** after the unloading valve maintains positive system pressure when idling. A **pressure relief valve** dumps excess pressure back to the reservoir if the actuator reaches the end of its stroke. An **accumulator** maintains a pressurised fluid supply to absorb the initial pressure drop when a selector valve opens, and cushions pressure surges. A **standpipe (stackpipe)** in the reservoir, set higher than the emergency hand-pump supply line, ensures sufficient fluid remains for essential services (brakes, landing gear) in the event of a leak downstream. A **scavenge/return filter** is fitted in the return line before the reservoir, and a second filter immediately after the EDP protects the rest of the system from contamination in case of EDP failure.

## System Components — Reservoirs

The reservoir stores hydraulic fluid, supplies it to the system, receives return fluid, accommodates thermal expansion, compensates for slight leaks, and (via a standpipe) provides a reserve for emergency operation of essential services.

### Vented Reservoir

Normally fitted to piston-engine, unpressurised aircraft operating below **20,000 feet**. Construction includes a welded aluminium alloy body, vented filler cap, gauze strainer, sight glass (max/min/normal levels), remote level indicator, and outlet connections to the EDP and emergency hand pump. It is located higher than the EDPs to ensure a positive head of pressure; a low-pressure boost pump may be fitted to prevent EDP inlet cavitation during turbulence or negative-g manoeuvres.

### Pressurised Reservoir

Jet and turbo-prop aircraft flying **above 20,000 feet** require a pressurised reservoir to prevent fluid foaming (due to low ambient pressure) and pump cavitation. Pressurisation may be achieved by: a nitrogen-charged cylinder; cabin pressurisation air; engine compressor/bleed air (P3); or hydraulic system pressure. Typical bleed-air pressurisation is **30–45 psi**. Where system pressure itself pressurises the reservoir, pressure ratios of about **50:1** are common (e.g. a 3,000 psi system pressure pressurises the reservoir fluid to 60 psi).

### Filters

Filters are rated by the size of particles they arrest, measured in **microns** (one micron = one millionth of a metre, or 0.000039 inch). Particles as small as 40 microns are just visible to the naked eye; filters removing particles **less than 10 microns** maintain very clean fluid. Common filter types are paper element (pleated for surface area) and micronic element (wrapped around a spring coil to prevent collapse); filters normally have a bypass valve so unfiltered fluid can still reach the system if the element becomes blocked. Main filter locations are: Low Pressure (LP) filter, High Pressure (HP) filter, and by-pass filter.

## Accumulators

### Purpose

- To absorb fluctuations in pressure
- To ensure immediate response and delivery of pressurised fluid on demand
- To allow limited operation of systems when the EDP is not running

Hydraulic fluid is non-compressible, and pressure can only be stored using a compressible medium — gained via an accumulator.

### Construction

Three types are commonly used: **Piston type**, **Bladder type**, and **Diaphragm type**, all made from high-strength materials (cast/machined aluminium alloys or stainless steel), divided into two compartments by a movable sealing partition. One compartment connects to the system pressure manifold; the other is charged with dry air or nitrogen through a high-pressure charging valve (nitrogen is preferred because it is inert and free of water vapour after processing).

- **Piston type**: charging pressure normally around **1,500 psi** (approximately half system operating pressure).
- **Bladder/diaphragm type**: charged to **1,200–1,500 psi**; maximum system pressure typically **2,500–3,000 psi**.

HP charging valve cores are identified by a letter "H" embossed on the stem and are **not interchangeable** with tyre valve cores.

## Pressure Generation — Hydraulic Pumps

The pump does not create pressure — pressure is produced when fluid flow is restricted. (A hydraulic analogy is often used for electricity: fluid flow = current, pressure = voltage, opposition to flow = resistance.)

### Hand Pumps

Double-action ("piston rod displacement") hand pumps move fluid on both strokes and are more efficient than single-action types, so are used on most modern aircraft.

### Suction Boost Pumps

A low-pressure pump (approx. **100 psi**) that provides positive pressure to the inlet of the main EDP to prevent cavitation, located between the reservoir and EDP inlet. Normally powered by a 3-phase electric motor, or sometimes a hydraulic motor driven by system pressure. If a boost pump fails, the EDP will still operate, but with a risk of cavitation.

### Powered Pumps — Constant Volume/Fixed Displacement (Non-Self-Idling)

Moves a specific volume of fluid per revolution, and requires an unloading (cut-out) valve to relieve pressure when the pump delivers more fluid than needed.

- **Gear pump**: the most common type for medium-pressure systems; rugged, dependable, few moving parts, relatively inexpensive. A relief valve maintains **case pressure** at about **15 psi** so that, if a shaft or seal is scored, fluid is forced out rather than air being drawn in. Gear pumps provide a good, non-pulsating, high flow rate but are limited to about **800 psi** — used mainly on smaller aircraft or as back-up pumps.
- **Piston pumps** (axial or radial): used where a relatively small volume of fluid is required at **2,500 psi or more**. Larger aircraft hydraulic systems typically operate between **1,200 and 3,000 psi**.
- **Vane pumps**: move a large volume of fluid at relatively low pressures; normally used on light aircraft (particularly "power-pack" systems) and more generally in fuel and pneumatic systems than hydraulics.

### Powered Pumps — Constant Pressure/Variable Displacement (Self-Idling)

Only moves the amount of fluid the system requires — as system pressure builds with no actuation, delivery displacement is automatically reduced toward no-flow, maintaining a constant system pressure **without** the need for a separate unloading/cut-out valve. Because the pump can turn without delivering fluid, an LP spur-gear back-up pump continuously by-passes fluid through the HP piston pump to provide cooling. Construction is typically a 2-stage pump: an LP, high-volume spur-gear first stage feeding an HP, axial multi-piston second stage, whose stroke is varied by a **yoke (swash-plate)** mechanism controlled by a servo control piston sensing system pressure.

A well-known example is the **Stratopower demand-type pump**, which uses nine axially-orientated pistons with a fixed-stroke cam; the effective length of stroke (controlled by a compensator spring/stem piston balance) determines delivery. Typical delivery capacity is **22–37 gpm**, maintaining a nominal supply pressure of **3,000 psi**.

## Emergency Pressure Generation

If the normal hydraulic supply fails, alternative power sources include:

- **Hand pump** operated by the pilot
- **Duplication of supplies** (multiple EDPs/systems)
- **Electrically operated AC or DC pumps**
- **Compressed-air, Air Turbine Motor driven pumps (ATM/ATDP)**
- **Ram Air Turbine pumps (RAT/HYRAT)**

### Electric Motor Driven Pumps (EMDP)

Installed as a back-up to the EDP under high demand, or in case of EDP/engine failure. A typical 3-phase 115V AC EMDP is connected in parallel with the EDP, draws from the same reservoir (via a lower supply line for continued supply at low fluid level), and delivers about **6–10 gpm at approximately 2,700 psi**. Some aircraft also fit a lower-capacity **28V DC** motor-driven pump (about **3 gpm at 2,700 psi**) as an emergency source, also used to charge the system for brakes before towing or engine start.

### Air Turbine Motor Driven Pumps (ATDP)

Used on aircraft such as the Airbus 300 series and Boeing 767; driven by engine bleed air, with flow controlled and modulated by a solenoid-operated pressure regulator and shut-off valve to keep turbine speed within set parameters.

### Power Transfer Units (PTU)

A PTU consists of a hydraulic motor supplied by pressure from one hydraulic system, which drives a hydraulic pump feeding a **second, separate** hydraulic system — transferring power between systems without transferring fluid between them. It may be isolated in normal operation and selected manually or automatically (by a pressure switch) on a pressure drop or pump failure elsewhere.

### Hydraulic Ram Air Turbines (HYRAT)

Used as an emergency power source for a major system failure. A turbine (resembling a small propeller), normally stowed in a fuselage compartment, is deployed automatically or manually to provide minimum hydraulic supply for safe aircraft recovery; pressure output is governed by varying blade angle in response to aircraft speed and pressure demand.

## Hydraulic Valves

Hydraulic valves divide into **pressure control valves** (adjust, regulate and/or limit pressure) and **flow control valves** (select and direct the flow of fluid, not normally concerned with pressure).

### Pressure Control Valves

- **Pressure Relief Valve**: e.g. in a flap circuit, acts as a "blow-back" valve, allowing flaps to blow back (and preventing pilot selection of flaps at excessive speed) by bypassing Down-line pressure to the return line.
- **Pressure Regulators**: relieve and regulate the pressure produced by a constant volume/fixed displacement pump. In a typical "balanced-type" regulator, a balance is reached between spring force and fluid forces on a piston and ball; a worked example in the source gives a cycling range of **1,000–1,500 psi** (piston moves up at 1,500 psi, unloading the pump, until pressure falls to 1,000 psi, when the ball reseats and pressure rises again).
- **Thermal Relief Valve**: relieves excessive pressure caused by expansion of hydraulic fluid due to a temperature rise, fitted in pipelines between components where fluid is in a closed circuit (hydraulic lock); a restrictor pack ensures only slow, thermal-expansion pressure changes operate the valve.
- **Pressure Reducing Valve**: reduces system pressure for components that require a lower operating pressure than main system pressure, by a balance of hydraulic and spring forces.

### Flow Control Valves

- **Non-Return (Check) Valve (NRV)**: the simplest flow control valve, allowing flow in one direction only; always fitted just downstream of the pump to prevent reverse flow damaging it. A **Restricted (Orifice) Check Valve** allows full flow one way and restricted flow the other.
- **Selector Valves**: direct fluid to the appropriate side of an actuator and provide a return path for displaced fluid. Types include ball, rotary, sliding-spool and poppet valves; higher-pressure systems often use poppet-type valves for more positive shut-off. Electrically operated (solenoid) selector valves eliminate bulky mechanical linkages — "fly-by-wire" systems are a modern example.
- **Priority Valves**: opened by **hydraulic pressure**; ensure a lower-pressure service (e.g. wheel-well doors) completes its movement before flow is allowed to a higher-priority component (e.g. main landing gear).
- **Sequence Valves**: similar in function to priority valves, but controlled by **mechanical displacement** of a plunger rather than fluid pressure — commonly used to ensure landing gear doors open before the gear itself retracts/extends.
- **Hydraulic Fuses**: block fluid flow if a serious leak develops. Two types: a **pressure-sensing fuse**, which shuts off flow if the pressure drop across it exceeds a specified limit; and a **flow-sensing fuse**, which shuts off flow after a specific amount of fluid has passed through it.

## Power Distribution and Component Circuits

A complete hydraulic system consists of: a **power circuit** (supplies fluid to component circuits and accommodates return fluid); various **component circuits**; and an **emergency circuit** for use in case of power failure. Modern jet transport aircraft typically have at least two independent hydraulic systems, with duplicated actuation of primary flight controls, plus a standby system.

Power circuits may be **self-idling** (idles once working pressure is achieved, used with constant pressure/variable displacement pumps) or **non-self-idling** (pump supplies fluid continuously, requiring an automatic unloading/cut-out valve, used with constant volume/fixed displacement pumps).

In a typical **flap circuit**, a **throttling valve** (a two-way restrictor, normally in the Down line) automatically sets flow rate in proportion to supply pressure, ensuring the flaps move slowly to avoid sudden trim changes; **synchronising jacks** help keep port and starboard flaps moving together. A **landing gear circuit** uses a non-return valve positioned before the control valve to create a hydraulic lock in both Up and Down positions, keeping the gear in its selected position when other services are operated.

## Hydraulic Power — Indication and Warning Systems

Information on the condition of the hydraulic system — pressure, temperature and quantity (normal indications), plus warnings of low pressure, low quantity, high oil temperature and low reservoir air pressure (abnormal indications) — must be relayed to the flight deck.

### Hydraulic Pressure

Because the hydraulic bay is often remote from the flight deck, and to avoid the risk of hydraulic oil leaking onto electronic equipment, **no oil pipes run directly to the flight deck instruments**. Instead, **electro-hydraulic transducers** fitted in the hydraulic bay relay pressure information electrically to a ratiometer or solid-state LCD display calibrated to read hydraulic pressure. A pressure switch, set to minimum pump output pressure, triggers a visual warning (warning lamp / flashing glareshield lights) and an aural warning (chimes) via the aircraft alerting and warning system.

### Hydraulic Quantity

Reservoir fluid quantity is relayed to a flight-deck gauge by a **float switch** in the tank, or alternatively a **capacitance-type detector** — both causing a voltage change at the gauge corresponding to the change in oil level. Gauges may show actual quantity (litres) or a percentage of full. A **low-level switch** in the reservoir or gauge triggers visual and aural warnings when fluid reaches a pre-calibrated minimum.

### Hydraulic Temperature

A temperature transducer may relay system temperature to a gauge, but this is usually unnecessary — typically a **temperature switch**, often in the return line as it enters the reservoir, triggers visual/aural warnings if temperature exceeds a predetermined maximum. Such sensors are often associated with electric motor driven pumps, and may monitor motor winding temperature as well as actual oil temperature.

### Reservoir Low Air Pressure

A low-pressure switch fitted in the bleed-air line, downstream of the pressure regulator just before it enters the reservoir, triggers a visual/aural warning if pressure drops below a predetermined minimum.

### Accumulator Gas Pressure

Gauges fitted to accumulators indicate the pre-charge gas (nitrogen) pressure when all hydraulic pressure has been dissipated; these gauges are usually direct-reading and show system pressure while the hydraulic pumps are running.

## Interfaces with Other Systems

Hydraulic power is used for a large number of aircraft systems, including:

- Powered flying controls — primary controls
- Leading edge and trailing edge flaps
- Spoilers
- Speed brakes and air brakes
- Wheel brakes and anti-skid
- Nosewheel steering
- Landing gear retraction and lowering
- Windscreen wipers

Hydraulic pumps can be driven:

- **Mechanically**, from the main engine accessory gearbox or from the APU
- **Electrically**, from the main electrical buses
- By a **Ram Air Turbine** deployed into the airflow (emergency)
- **Air-driven**, from the aircraft bleed air system (emergency)

Hydraulic accumulators can also be used for **parking brake pressure storage**.
        $cnt$,
        18
    ) RETURNING id INTO s1_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M13.14 Hydraulic Power (27 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s1_id, 'Systems that use an incompressible fluid to transmit force are called:',
     '[{"id":"a","text":"Pneumatic systems","correct":false},{"id":"b","text":"Hydraulic systems","correct":true},{"id":"c","text":"Mechanical systems","correct":false}]',
     '{"B2"}'),

    (s1_id, 'Compared with mechanical remote-control systems, hydraulic actuation offers:',
     '[{"id":"a","text":"A higher power/weight ratio and smoother, steadier movement","correct":true},{"id":"b","text":"A lower power/weight ratio but simpler pilot workload","correct":false},{"id":"c","text":"No difference in installation complexity","correct":false}]',
     '{"B2"}'),

    (s1_id, 'Why are large electrically-powered actuation systems normally limited to light aircraft?',
     '[{"id":"a","text":"Electric motors and generators large enough for landing gear/flight control loads on big aircraft would be excessively heavy, with high-current cables required","correct":true},{"id":"b","text":"Electrical systems cannot be routed around obstructions","correct":false},{"id":"c","text":"Electrical systems are more compressible than hydraulic systems","correct":false}]',
     '{"B2"}'),

    (s1_id, 'The main disadvantage of pneumatic power compared with hydraulic actuation for highly loaded systems such as landing gear is:',
     '[{"id":"a","text":"Its compressibility","correct":true},{"id":"b","text":"Its excessive weight","correct":false},{"id":"c","text":"The need for return lines","correct":false}]',
     '{"B2"}'),

    (s1_id, 'Pascal''s Law states that pressure in an enclosed container is:',
     '[{"id":"a","text":"Concentrated at the lowest point of the container","correct":false},{"id":"b","text":"Transmitted equally and undiminished to all parts of the container, acting at right angles to the walls","correct":true},{"id":"c","text":"Proportional only to the height of fluid above the measuring point, regardless of whether the container is open or closed","correct":false}]',
     '{"B2"}'),

    (s1_id, 'A pressure of 10 N/mm² is applied to a piston of 40 mm diameter. The piston area is approximately 1,256.8 mm². What force does the piston produce?',
     '[{"id":"a","text":"Approximately 1,257 Nf","correct":false},{"id":"b","text":"Approximately 12,568 Nf","correct":true},{"id":"c","text":"Approximately 125,680 Nf","correct":false}]',
     '{"B2"}'),

    (s1_id, 'In a double-acting actuator, when equal pressure is connected to both sides of the piston, the piston moves because:',
     '[{"id":"a","text":"The piston rod reduces the effective area on one side, so the forces on each side are unequal","correct":true},{"id":"b","text":"The pressure on the rod side is always higher than on the other side","correct":false},{"id":"c","text":"Fluid is incompressible and therefore forces are always equal, causing constant oscillation","correct":false}]',
     '{"B2"}'),

    (s1_id, 'Which of the following is NOT listed as a required property of an ideal aircraft hydraulic fluid?',
     '[{"id":"a","text":"Low viscosity and good lubrication properties","correct":false},{"id":"b","text":"High flash point and chemical stability","correct":false},{"id":"c","text":"High compressibility to absorb pressure surges","correct":true}]',
     '{"B2"}'),

    (s1_id, 'Skydrol 500B is a synthetic ester-base hydraulic fluid that is typically:',
     '[{"id":"a","text":"Red in colour, used with natural rubber seals, and flushed with alcohol","correct":false},{"id":"b","text":"Purple in colour, fire resistant, used with Butyl, Ethylene Propylene or Teflon seals","correct":true},{"id":"c","text":"Golden yellow in colour, toxic in a fine spray mist, and used only on very old aircraft","correct":false}]',
     '{"B2"}'),

    (s1_id, 'Mixing different base types of aircraft hydraulic fluid (e.g. mineral and synthetic ester) is:',
     '[{"id":"a","text":"Acceptable provided the seals are made of Teflon","correct":false},{"id":"b","text":"Never permitted — the fluids are not compatible with each other","correct":true},{"id":"c","text":"Only a concern at high altitude","correct":false}]',
     '{"B2"}'),

    (s1_id, 'A gasket-type seal, as distinct from a packing, is used where:',
     '[{"id":"a","text":"There is no relative movement between the sealed surfaces","correct":true},{"id":"b","text":"Relative movement exists, such as piston or rotating shaft sealing","correct":false},{"id":"c","text":"Only pneumatic, not hydraulic, systems are involved","correct":false}]',
     '{"B2"}'),

    (s1_id, 'When fitting an O-ring seal, the groove depth should be:',
     '[{"id":"a","text":"Exactly equal to the O-ring diameter","correct":false},{"id":"b","text":"10% less than the O-ring diameter, to provide sealing compression (\"pinch\")","correct":true},{"id":"c","text":"10% greater than the O-ring diameter, to avoid pinching the ring on installation","correct":false}]',
     '{"B2"}'),

    (s1_id, 'In a simple hydraulic system, the purpose of the pump unloading (automatic cut-out) valve is to:',
     '[{"id":"a","text":"Relieve pressure off the pump by diverting fluid back to the reservoir when the system does not need pressure","correct":true},{"id":"b","text":"Permanently lock the pump output at maximum system pressure","correct":false},{"id":"c","text":"Replace the need for a reservoir standpipe","correct":false}]',
     '{"B2"}'),

    (s1_id, 'The function of the standpipe (stackpipe) in a hydraulic reservoir is to:',
     '[{"id":"a","text":"Filter the fluid before it reaches the EDP","correct":false},{"id":"b","text":"Retain sufficient fluid to operate essential services, such as brakes and landing gear, if a downstream leak occurs","correct":true},{"id":"c","text":"Pressurise the reservoir using engine bleed air","correct":false}]',
     '{"B2"}'),

    (s1_id, 'A pressurised hydraulic reservoir is generally required on aircraft that:',
     '[{"id":"a","text":"Operate below 20,000 feet with a piston engine","correct":false},{"id":"b","text":"Fly at altitudes above 20,000 feet, to prevent fluid foaming and pump cavitation","correct":true},{"id":"c","text":"Have no accumulator fitted","correct":false}]',
     '{"B2"}'),

    (s1_id, 'Hydraulic filters that remove particles smaller than approximately what size will maintain a very clean fluid?',
     '[{"id":"a","text":"10 microns","correct":true},{"id":"b","text":"100 microns","correct":false},{"id":"c","text":"1,000 microns","correct":false}]',
     '{"B2"}'),

    (s1_id, 'The purpose of a hydraulic accumulator is to:',
     '[{"id":"a","text":"Absorb pressure fluctuations, provide immediate fluid delivery on demand, and allow limited system operation when the EDP is not running","correct":true},{"id":"b","text":"Permanently replace the need for an engine-driven pump","correct":false},{"id":"c","text":"Filter contamination out of the return line","correct":false}]',
     '{"B2"}'),

    (s1_id, 'A gear-type, constant volume/fixed displacement hydraulic pump is generally limited to a maximum pressure of approximately:',
     '[{"id":"a","text":"800 psi","correct":true},{"id":"b","text":"8,000 psi","correct":false},{"id":"c","text":"80 psi","correct":false}]',
     '{"B2"}'),

    (s1_id, 'A key advantage of a constant pressure/variable displacement (self-idling) pump over a constant volume/fixed displacement pump is that it:',
     '[{"id":"a","text":"Requires a separate unloading (cut-out) valve to control system pressure","correct":false},{"id":"b","text":"Automatically reduces its own delivery toward no-flow as system pressure builds, without needing an unloading valve","correct":true},{"id":"c","text":"Cannot be used with an accumulator","correct":false}]',
     '{"B2"}'),

    (s1_id, 'A Power Transfer Unit (PTU) allows:',
     '[{"id":"a","text":"Pressure from one hydraulic system to drive a motor that powers a pump supplying a second, separate hydraulic system","correct":true},{"id":"b","text":"Direct mixing of fluid between two independent hydraulic systems","correct":false},{"id":"c","text":"An accumulator to recharge itself without a pump","correct":false}]',
     '{"B2"}'),

    (s1_id, 'The difference between a priority valve and a sequence valve is that:',
     '[{"id":"a","text":"A priority valve is opened by hydraulic pressure, while a sequence valve is controlled by mechanical displacement of a plunger","correct":true},{"id":"b","text":"A priority valve is only used on landing gear doors, while sequence valves are only used on flaps","correct":false},{"id":"c","text":"There is no functional difference between them","correct":false}]',
     '{"B2"}'),

    (s1_id, 'A pressure-sensing hydraulic fuse shuts off fluid flow when:',
     '[{"id":"a","text":"A specific total amount of fluid has passed through it","correct":false},{"id":"b","text":"The pressure drop across the fuse exceeds a specified limit, indicating a serious leak downstream","correct":true},{"id":"c","text":"The reservoir fluid quantity reaches its minimum level","correct":false}]',
     '{"B2"}'),

    (s1_id, 'On modern aircraft, hydraulic system pressure is indicated on the flight deck by:',
     '[{"id":"a","text":"Direct oil pipes routed from the hydraulic bay to a mechanical flight-deck gauge","correct":false},{"id":"b","text":"Electro-hydraulic transducers in the hydraulic bay relaying pressure electrically to a ratiometer or LCD display","correct":true},{"id":"c","text":"A float switch mounted directly on the flight-deck instrument panel","correct":false}]',
     '{"B2"}'),

    (s1_id, 'Why are oil pipes normally NOT run directly to flight deck hydraulic pressure instruments?',
     '[{"id":"a","text":"To avoid the risk of hydraulic oil leaking onto electronic equipment","correct":true},{"id":"b","text":"Because oil pipes cannot withstand cabin pressurisation","correct":false},{"id":"c","text":"Because hydraulic pressure cannot be measured remotely","correct":false}]',
     '{"B2"}'),

    (s1_id, 'Hydraulic reservoir fluid quantity is typically relayed to the flight-deck gauge by:',
     '[{"id":"a","text":"A pressure relief valve","correct":false},{"id":"b","text":"A float switch or a capacitance-type detector, causing a voltage change corresponding to the oil level","correct":true},{"id":"c","text":"The accumulator charging valve","correct":false}]',
     '{"B2"}'),

    (s1_id, 'A temperature switch used for hydraulic system overheat warning is most commonly located:',
     '[{"id":"a","text":"In the pump inlet line only","correct":false},{"id":"b","text":"In the return line as it enters the reservoir","correct":true},{"id":"c","text":"On the flight deck instrument panel itself","correct":false}]',
     '{"B2"}'),

    (s1_id, 'A gauge fitted directly to a hydraulic accumulator, when all hydraulic pressure has been dissipated, indicates:',
     '[{"id":"a","text":"Zero, since the accumulator only reads pressure when the pumps are running","correct":false},{"id":"b","text":"The pre-charge gas (nitrogen) pressure","correct":true},{"id":"c","text":"Reservoir fluid quantity","correct":false}]',
     '{"B2"}');

END $$;
