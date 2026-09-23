-- Module 13: Aircraft Aerodynamics (B2) — Air Conditioning and Cabin Pressurisation, Fire Protection
-- Source: EASA Part-66 Module 13 official textbook (IKAROS Aviation Training Centre, IK M13, Issue May 2012)
-- This module is B2-ONLY.

DO $$
DECLARE
    m13_id INT;
    s11_id INT;
    s12_id INT;
BEGIN
    SELECT id INTO m13_id FROM easa_modules WHERE code = 'M13';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M13.11') THEN
        RAISE NOTICE 'M13.11/M13.12 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 13.11: Air Conditioning and Cabin Pressurisation
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m13_id, 'M13.11', 'Air Conditioning and Cabin Pressurisation',
        $cnt$
# Air Conditioning and Cabin Pressurisation

## Introduction

The atmosphere above **10,000 ft** is too thin and cold for normal breathing. Passenger-carrying aircraft operating above this height need an air conditioning and pressurisation system. The temperature of the air passing through the passenger cabin, flight deck and other compartments must be strictly controlled, as well as flow rate and level of humidity.

Cabin temperature is normally maintained between **15 and 30 degrees Celsius**. Additionally, a controlled amount of pressurisation is necessary so that the air pressure in the passenger cabin and adjacent areas does not exceed the equivalent of the ambient air pressure at **8,000 ft**. Air conditioning is also essential for un-pressurised aircraft types.

A typical air conditioning and pressurisation system comprises **eight** principal sub-systems:

- Air Supplies (Pneumatics, ATA 36)
- Cooling
- Heating
- Temperature Control
- Humidity Control
- Mass Flow Control
- Distribution
- Pressurisation

## Air Supply

The source of fresh air supply and arrangement of essential components varies between aircraft type, but generally one of the following methods is adopted:

- **Engine Bleed Air (compression)** — the most common method, installed on the majority of modern aircraft. Very hot air is tapped from the main engine compressor stages and supplied to the cabin, flight deck and other areas. Before entering the cabin it passes through a temperature control system that reduces its temperature and pressure, plus a means of flow control and, on some aircraft, humidity control. In pressurised aircraft, discharge of the conditioned air is regulated to maintain cabin pressure at the selected pressure altitude.
- **Air Compressors or Blowers** — used on turbo-prop, piston-engine or even turbo-jet aircraft where main engine compressor bleed is unavailable or unsuitable. The compressor or blower is normally mechanically driven from the accessory gearbox, its air routed via a temperature control system similarly to the bleed method.
- **Auxiliary Power Unit (APU)** — a small gas turbine engine that can be connected into the main air supply system to provide an independent means of air conditioning and pressurisation, on the ground or in flight, when the main engines cannot supply. It utilises the engine bleed air principle.
- **Ram Air** — normally the primary ventilation system on un-pressurised aircraft, via a ram air scoop placed directly into the airflow. Since air at altitude is cold, the temperature control system it passes through is normally a form of heater (a combustion-type heater, or an exhaust gas heater). On pressurised aircraft, a ram air system can be used for emergency ventilation following a complete loss of the main system.
- **Ground Cart** — an independent means of heating or cooling the cabin on the ground, used on aircraft without an APU. The trolley connects externally via a purpose-built inlet, normally employing a combustion-type heater with a control panel on the cart.

## Cooling

When bleed air is used as the air supply, air tapped off the engine compressor can reach a temperature in excess of **300 degrees Celsius** — far too hot to be fed directly into air-conditioned areas, so it must first be cooled down to around **20 degrees Celsius**. There are two main methods of cooling: **Air Cycle** and **Vapour Cycle** cooling systems.

### Air Cycle Cooling

Air cycle cooling relies on three basic principles:

- **Surface heat exchange** — cooling by passing the charge air (tapped from the engine compressor) across a heat exchanger, subjected to a colder cross-flow of ambient (ram) air scooped as the aircraft moves forward. Although about **90%** of heat is given up this way, the charge air temperature can never be reduced below the ram air temperature by this method alone.
- **Expansion** — cooling by reducing the pressure of the charge air, increasing its velocity and expanding it across the turbine of an **Air Cycle Machine (ACM)** or **Cold Air Unit (CAU)**. This can rapidly lower charge air temperature to **zero degrees Celsius**, irrespective of ram air temperature.
- **Energy Conversion** — cooling by making the hot air do work: the charge air drives a turbine connected by a shaft to the compressor or fan within the cold air unit, converting heat energy into kinetic energy. This also helps reduce the charge air to zero degrees Celsius.

**Heat exchangers**, depending on their position in the system, are described as a **"Pre-cooler" / "Primary Heat Exchanger"** or an **"Inter-cooler" / "Secondary Heat Exchanger"**. Construction is a sealed unit with cooling passages, through which charge air flows and over which ram air is directed; thin corrugated strips between passages also dissipate heat.

**ACM/CAU types:**

| Type | Key feature |
|------|-------------|
| **Turbo-compressor** | Turbine driving a centrifugal compressor, operating with an inter-cooler between compressor and turbine stages |
| **Brake turbine** | Charge air routed directly from the pre-cooler to drive the turbine (no inter-cooler needed); the turbine is coupled to a compressor rotating in ambient air, which acts as a braking medium |
| **Turbo-fan** | Mechanically similar to the brake-turbine type, but the turbine drives a large centrifugal fan instead of a compressor; the fan draws ambient air over the pre-cooler, allowing use on the ground with engines running, without relying solely on ram air |

The ACM/CAU compressor and turbine wheels rotate at extremely high speeds, often in excess of **80,000 rpm**, so efficient bearing lubrication is essential. Two lubrication methods are used: **integral wet sump arrangements** (oil metered to bearings via wicks or an oil slinger), or **pressurised air bearings** that need no oil lubrication (the rotor "floats" on a thin layer of air, similar to the hovercraft principle, and must be kept clean, dry and free from oil/grease).

### Vapour Cycle Cooling

An alternative to air cycle cooling, though not commonly used these days for air conditioning — it may instead be used to remove heat from electrical and electronic equipment. It relies on the ability of a refrigerant to absorb heat when changing from a liquid to a gas (vaporisation/expansion); a sufficient reduction in pressure causes a liquid to change state to a vapour, and a corresponding pressure increase reverses the process.

Major components: a **liquid receiver**, **thermostatic expansion valve**, **evaporator**, **turbo-compressor**, **condenser** and **condenser fan** — often mounted together as a line-replaceable refrigeration pack. The refrigerant (typically a volatile chemical such as Freon) passes from the receiver to the expansion valve, is metered into the evaporator, and hot charge air flowing across the evaporator releases heat that vaporises the refrigerant, cooling the air before it enters the cabin. The vaporised refrigerant is drawn into the turbo-compressor (whose turbine is driven by main engine bleed air, though an electric motor may be used instead), leaves at high pressure/temperature, is cooled and condensed back to liquid by ram air across the condenser, and returns to the receiver. The condenser fan induces airflow across the condenser when the aircraft is stationary with no ram air available.

## Heating

Un-pressurised aircraft use a ram-air system for ventilation; at altitude this air is very cold, so a heating system is required. Two types:

- **Exhaust Heating Systems** — a heater muff surrounds the exhaust pipes (piston engine) or jet pipe (turbo-jet). A ram air scoop feeds cold air directly to a mixing valve, while the remainder enters the muff, is heated by the exhaust/jet pipes, and joins the cold air at the mixing valve. A control lever modulates the hot/cold proportion. Because ventilation air could become contaminated from the exhaust pipes, some aircraft fit carbon monoxide detectors (indicators with brightly coloured crystals that turn black if exposed to dangerous CO levels).
- **Combustion Heating Systems** — a purpose-built combustion chamber heater assembly provides the heat source. Fuel passes through a pressure regulating and shut-off valve, a fuel filter, fuel pump and spray nozzle, where it is atomised and ignited with an igniter plug; the combustion chamber heats the surrounding ram air.

## Temperature Control

For aircraft using the engine bleed air method, temperature regulation is usually accomplished by controlling the proportion of hot and cold air from the supply system. An electric motor driving a **double butterfly type air mixing valve** regulates cabin temperature by allowing a controlled amount of hot air to bypass the air cycle system, recombined with cold air at a downstream mix chamber. The mixing valve position is set by the temperature control system, which operates **automatically**, or **manually** if the automatic controller fails.

In automatic operation, the controller monitors cabin temperatures and repositions the mixing valve using signals from the flight deck temperature selector (requested temperature) and temperature sensors in the cabin, flight compartment and supply ducts (actual temperature), sending an output signal until parity is restored. In manual operation, the control circuit bypasses the controller, connecting the flight deck selector directly to the mixing valve; other sensors still transmit compartment temperatures to flight deck indicators.

## Humidity Control

Humidity control ensures the correct amount of water moisture in the cabin air conditioning supply, so occupants do not suffer low humidity at high altitude. Two methods:

- **Water Separation** — removal of excessive moisture from the charge air, normally by a water extractor/separator. Water is introduced into the system by compression and expansion of air in the ACM/CAU and other parts of the air cycle process. Three types of water separator are in general use:
  - **Coalescer/diffuser type** — a coalescer of monel metal gauze and glass fibre cloth sandwiched between stainless steel gauze, supported by a diffuser cone; moisture converts to droplets as air passes over the coalescer, collected and drained overboard.
  - **Coalescer/bag type** — a porous bag imparts a swirl to the conditioned air; centrifugal effect forces droplets to the outlet shell to drain. A bag visual indicator (operated by back pressure) shows when the bag becomes dirty/blocked, and a relief valve opens to maintain flow.
  - **Swirl vane type** — a fixed or rotating swirl vane spins moisture-laden air at high speed, separating heavier water droplets by centrifugal force into a sump for draining.
- **Water Infiltration** — addition of moisture into conditioned air as it enters the cabin, by pumping water from a tank to a spray nozzle at the cabin air inlet. Humidity sensors detect low humidity and automatically turn on the water pump/controller to restore acceptable levels.

## Mass Flow Control

Legislation requires a minimum amount of fresh air to be supplied to passengers and crew — at least **0.5 lb per minute** per person — with stale air removed and odours eliminated. Most pressurisation systems rely on air being delivered at a constant rate under all flight conditions. Mass flow must be held constant regardless of altitude or cabin pressure, and must adjust for changes in engine compressor speed (bleed air systems) or blower rotor speed (accessory-gearbox-driven systems).

- **Mass Flow Controller** — automatically compensates for changes in air density, cabin back pressure and engine compressor supply pressure. Compressor bleed pressure acts on an altitude-compensated piston valve opposed by a spring and cabin back pressure; the pressure drop across the valve varies the size of the outlet ports, giving a constant mass flow downstream at all times.
- **Spill Valve Flow Controller** — a metering duct senses variations in air velocity and density and transmits this to a mass flow controller, which converts the pressure signals into electrical signals controlling spill valve position; the valve opens or closes to spill more or less air overboard, ensuring a constant flow rate into the cabin.

## Distribution Systems

The distribution system takes cold air from the air conditioning packs and hot bleed air from the engines and mixes them in a mixer unit to the required temperature, before distribution to sidewall and overhead cabin vents. On some aircraft, cabin air is drawn back into the mixing unit by re-circulating fans, mixed with new air, and re-distributed.

A **gasper fan** provides cold air to individual overhead outlets for aircrew and passengers, drawn direct from outside or from the cooling packs; each occupant can control the amount received via a rotary nozzle or louvre. One duct system supplies the cockpit and another the cabin; cabin ducting divides into overhead (fore/aft ceiling ducting) and sidewall systems (ducting between sidewall and interior linings, releasing air through cove light grills and louvres). A cockpit-controlled selector valve on the main distribution manifold allows overhead, sidewall, or any combination to be used. Systems are protected from excess pressure by a spring-loaded pressure relief valve in the main distribution manifold. Air is exhausted from the cabin through grills and outflow valves in the sidewalls above the floor; a **flotation check valve** (a plastic ball in a cage) below each floor exhaust outlet seals off the floor if the cargo compartment floods, helping prevent water entering the cabin.

### Re-circulation Air System

To improve cabin ventilation and offload the air supply system (converted into a fuel saving), cabin air is recirculated back to the main distribution manifold and mixed with conditioned air from the cooling packs. The re-circulation fan draws air from the cabin through a check valve and filter assembly (removing smoke and noxious odours) before passing it to the mixer unit; the check valve prevents reverse flow when the fan is not in use.

## Pressurisation Systems

Air conditioning provides temperature control and supplemental oxygen provides breathable air, but at altitude there is insufficient atmospheric pressure to aid breathing — this is overcome by pressurising the cockpit/cabin area. Aircraft are pressurised by sealing off a strengthened portion of the fuselage — the **pressure vessel** — normally including cabin, cockpit and possibly cargo areas. Air is pumped into the pressure vessel and controlled by an **outflow valve** at the rear of the vessel. Sealing is achieved with seals around tubing, ducting, bolts, rivets and other hardware, sealing compounds on panels/structural components, and integral (some inflatable) seals on doors and hatches.

Pressurisation systems do not move large volumes of air — their function is to raise pressure inside the vessel:

- **Small reciprocating engine aircraft** — pressurisation air from the compressor of a coupled turbocharger; part of the compressed air is tapped off after the compressor, passes through a flow limiter (**sonic venturi**) and an inter-cooler, then into the cabin. A sonic venturi is fitted in-line; when airflow across it reaches the speed of sound, a shock wave forms that limits the flow to the pressurisation system.
- **Large reciprocating engine aircraft** — air from engine-driven compressors (driven through an accessory drive, or by an electric/hydraulic motor); multi-engine aircraft interconnect multiple compressors through ducting, each with a check/isolation valve to prevent pressure loss if one system fails.
- **Turbine powered aircraft** — use compressor bleed air, which is contamination-free and suitable for cabin pressurisation. Some aircraft use an independent compressor driven by bleed air, or a **jet pump** — a venturi nozzle in the flush air intake ducting; high-velocity engine air through the nozzle produces a low-pressure area that sucks in outside air, mixed with the high-velocity air before passing into the cabin.

### Modes of Pressurisation

There are **three modes**: un-pressurised, isobaric, and constant-differential pressure.

- **Un-pressurised mode** — the outflow valve remains open and cabin pressure equals outside ambient pressure. Usually applies from sea level up to around **5,000 ft**, varying by aircraft.
- **Isobaric mode** — cabin pressure is maintained at a specific cabin altitude as flight altitude changes. The cabin pressure controller closes the outflow valve as the aircraft climbs to the chosen cabin altitude, then modulates the valve to maintain it up to the flight altitude that produces the maximum differential pressure the structure is rated for.
- **Constant-differential pressure mode** — takes over once maximum differential pressure is reached. Cabin differential pressure is the ratio between internal and external air pressures; as altitude increases further, cabin altitude increases too, but the pressure ratio is maintained, up to a maximum cabin altitude that determines the aircraft's operating ceiling.

The amount of differential pressure is determined by the structural strength of the aircraft — the stronger the structure, the higher the differential pressure and the higher the operating ceiling.

### Cabin Air Pressure Regulator

Maintains cabin altitude at a selected level in the isobaric range and limits cabin pressure to a pre-set differential in the differential range, by regulating outflow valve position. It has two main sections: the **head and reference chamber**, and the **base** (with outflow valve and diaphragm). It uses cabin altitude for isobaric control and barometric pressure for differential control, with a cabin rate-of-climb controller governing the rate of pressure change.

- **Isobaric Control System** — incorporates an evacuated capsule, rocker arm, valve spring and ball-type metering valve. As cabin pressure increases, the reference chamber pressure compresses the evacuated capsule, pivoting the rocker arm and opening the metering valve proportionally, bleeding reference pressure air to atmosphere; this reduces reference pressure and causes the outflow valve to open, decreasing cabin pressure.
- **Differential Control System** — incorporates a diaphragm, rocker arm, valve spring and ball-type metering valve, with atmospheric pressure on one side of the diaphragm and reference chamber pressure on the other. When reference pressure exceeds the set differential limit, the diaphragm collapses and opens the metering valve, bleeding reference pressure to atmosphere and causing the outflow valve to open, reducing cabin pressure to maintain the set differential.

### Safety Valves

- **Cabin Air Pressure Safety (relief) Valve** — prevents cabin pressure from exceeding the predetermined cabin-to-ambient differential.
- **Negative Pressure Relief Valve** — an inward relief valve allowing outside air to enter the cabin if cabin pressure were to fall below outside pressure (which could otherwise fail the structure).
- **Dump Valve** — normally solenoid-actuated by a cockpit switch; when energised it dumps cabin air to atmosphere, rapidly reducing cabin pressure to ambient.
- **Ditching Valve** — a mechanical or electrical selection made by the crew to seal off all pressurisation valves and inlets, preventing cabin flooding if control valves below water level would otherwise flood the cabin during a ditching.

## Electronic Pressurisation Control

Most modern airliners electronically control cabin pressure automatically for the entire flight, from pre-flight flight-crew settings. The system consists of: a flight deck control panel; an automatic pressure controller with pressure sensing inputs/outputs to monitoring indicators; an electrically-driven gate-type outflow valve; and inward and outward safety relief valves.

### Flight Deck Control Panel

Three mode selections:

- **Auto (fully automatic mode)** — cruise altitude and destination landing altitude are set before flight, giving automatic cabin pressure control for the whole flight.
- **Standby (semi-automatic mode)** — a cabin altitude setting is made for each desired cabin pressure change, then controlled automatically.
- **Manual mode** — if neither automatic mode is available (e.g. controller failure), the outflow valve is positioned directly by operating electric torque motors, with a choice of AC or DC electrical supply.

### Automatic Pressure Controller

Provides output control signals to the outflow valve's AC or DC torque motors, positioning and modulating the valve per pre-programmed climb, cruise and descent schedules, so every aircraft altitude corresponds to a particular cabin altitude. Inputs come from the flight deck control panel, cabin and ambient pressure sensors, barometric correction and air/ground sensing.

### Outflow Valve

Has a moving gate covering/uncovering an aperture in the fuselage skin: a larger aperture drops cabin pressure (cabin altitude ascends), a smaller aperture raises cabin pressure (cabin altitude descends). Driven by one of two AC or DC electric motors, chosen by flight crew input; motor signals come from the controller (auto/standby) or directly from a control panel switch (manual).

### Inward and Outward Safety Relief Valves

Fuselage frames accept tensile (outward) loads well but withstand inward compression loads poorly. An **inward relief valve** opens to equalise pressure if the inward (negative) differential exceeds about **0.5 psid**. Two **outward relief valves** prevent the maximum outward differential from exceeding the structural limit, typically around **8.5 psid**. The safety relief valves are mechanically operated and completely independent of the automatic (electronic) control system.

## Cabin Pressure Indication

Most pressurisation systems have three basic cockpit indicators:

- **Cabin altitude gauge** — measures actual cabin altitude.
- **Cabin rate of climb indicator** — shows the rate the cabin is climbing or descending (losing or gaining pressure). A typical maximum climb rate is **500 ft/min** and maximum descent rate is **300 ft/min**; control may be automatic or manual depending on aircraft type.
- **Differential pressure gauge** — reads the difference between cabin and outside air pressures, normally controlled/maintained to a structural limit around **7 psid** (depending on aircraft type and operating ceiling). It may be combined with the cabin altitude indication in a dual gauge.

To ground test the pressurisation system with engines running, at least **three** men are required inside the aircraft for safety reasons.

## Safety and Warning Devices

Both air conditioning and pressurisation systems use safety and warning devices against possible catastrophic failures; some protection devices may be inhibited during certain flight stages (e.g. landing or take-off) where extra distractions could be unsafe for the crew. For air conditioning, the main concerns are overheating of the packs and extraction/ventilation fans, plus hot air leaks from ducting.

- **Overheating** — a thermal switch downstream of the pack outlet operates if the outlet temperature reaches a predetermined figure, shutting the pack valves and sending a warning to the cockpit central warning panel (CWP) with caution/warning lights and aural chimes, and a fault light on the pack selector switch. Once cooled, the crew may be able to reselect the system, or control it manually if the automatic temperature control had faulted. Extraction/ventilation fans are protected similarly, and speed sensors detect over- or under-speed conditions, also signalling the CWP.
- **Duct Hot Air Leakage** — a duct protection system includes firewire elements (thermistor type) around hot zones such as engine air bleeds, air conditioning packs and APUs. As temperature around the wire increases, resistance decreases until the warning circuit is made, signalling the CWP; the leaking duct may be isolated automatically, or the pilot may need to close off the air valves, leaving the faulty system out of use.
- **Excess Cabin Altitude** — uncontrolled cabin altitude increase could cause hypoxia; most aircraft give a CWP warning (audio and visual) when cabin altitude reaches **10,000 ft**.
- **Smoke Detection** — smoke detectors may be fitted in the cabin, avionics bay and cargo areas to monitor systems liable to generate smoke or catch fire, signalling the CWP and, in some cases, automatically switching on extractor fans to remove smoke overboard. The pilot may have a switch/lever to isolate cockpit air conditioning ducting from the rest of the aircraft to prevent smoke reaching the cockpit.
        $cnt$,
        13
    ) RETURNING id INTO s11_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 13.12: Fire Protection
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m13_id, 'M13.12', 'Fire Protection',
        $cnt2$
# Fire Protection

## Introduction

Fire is the most dangerous threat to the safety of an aircraft, associated with external areas near the main engines and the APU. Other external hot spots are landing gear bays (heat from brake units when gears are retracted) and overheating from very hot air leaking from engine compressor bleed pipes. Fire from internal areas — passenger, flight deck and toilet compartments, cargo, air-conditioning, and electrical/electronic equipment bays — also requires protection. Any source considered a likely hazard by the manufacturer or operator will be protected.

Ideally a fire protection system includes as many as possible of the following features:

- Rapid warning of fire/overheat and its accurate location
- Must not cause false warnings
- Continuous warning for the duration of the fire/overheat
- Confirmation that the fire has been extinguished
- Indication that the fire has re-ignited
- A means of testing the system from the flight deck
- Detectors proof against oil, water, vibration and high temperatures
- Detectors that are easily accessible throughout the aircraft
- Detectors and extinguishers wired electrically, or powered from emergency electrical buses
- Adequate visual and aural indication on the flight deck and vital areas
- Separate warnings for each engine and specific areas as determined by the manufacturer

The Fire (and Overheat) Protection system is normally split into two main subsystems: **Fire/Overheat Detection and Warning**, and **Fire Extinguishing**.

## Fire/Overheat Detection and Warning

Fire/overheat detectors divide into two main groups: **Unit or Spot Type** and **Continuous Loop (Firewire) Type**.

### Unit (Spot) Type

Fitted at various strategic points within the fire/overheat zone, taking the form of a thermally activated switch. Units are electrically connected in parallel with each other and in series with the audio/visual warning system, so any switch can operate the warning even if others have failed. Some have a pair of bi-metallic contacts that close when heated and open when cooled; the majority have a thin casing surrounding two normally separated contacts that are pulled together when the casing expands under heat, completing the warning circuit. This type is known as a **High Speed Resetting Switch (HSRS)**, valued for its sensitivity and fast reaction — both to initiate the warning and to cancel it once heat is removed. Spot detectors are used mainly to detect high-temperature leaks from bleed air ducts, normally positioned at pipe-to-pipe connections.

### Continuous Loop (Fire Wire) Detectors

Permits more complete coverage of a fire hazard area than spot-type detectors. It uses the principle of **capacitance and resistance** to indicate a temperature rise at any point along the detector loop. The commonest type has a stainless steel or Inconel outer tube, with an inner pure nickel wire surrounded by ceramic beads wetted by eutectic salt — a rise in temperature causes a sharp fall in electrical resistance and a rise in capacitance. Once the detection unit senses this anywhere along the wire, it generates an overheat warning; hence "firewire". A loop can cover the complete powerplant within its cowling, so fire or overheat is detected quickly regardless of where it starts, and the firewire resets the control box when temperature falls below the limit.

Firewire elements are attached to the airframe structure with quick-release clips approximately **6 inches** apart and **4 inches** from the end fittings, supported in clips with a rubber grommet to prevent rubbing and damp vibration. Care is taken to eliminate strain on the element, as excessive bending could work-harden the capillary.

### Dual Loop System

Most aircraft use a dual loop system: each sensing circuit has independent Loop A and Loop B. With the loop selector switch set to **BOTH**, both loops must detect a fire condition before the warning activates; if only one loop detects a fire, the associated loop fault light illuminates. If the selector is set to a single loop (A or B), a full fire warning activates if that loop alone senses a fire. Pressing the loop test button simulates a fire condition on the respective loop by earthing the inner electrode, functionally checking the system and the continuity of the loop.

### Pressure-Type Sensor

Uses a continuous loop of sealed stainless steel tube containing an element that absorbs gas when cold but releases it when heated; the tube connects to a pressure switch that closes when pressure reaches a pre-determined level. The commonest make, the **Systron-Donner** system, uses a titanium centre wire and the expansion of both **helium and hydrogen** gas to give two-stage warnings. Whereas a firewire actuates when any part of the loop reaches the limit temperature, the pressure-type system actuates in two ways: a localised fire releases hydrogen gas, closing the pressure switch and setting off the warning; a temperature rise over a larger area to a lower level than a fire warning expands the helium, closing the pressure switch to activate the system warning.

## Fire Zones

On light aircraft, the only fire protection is a stainless steel or titanium firewall dividing the engine bay from the cabin and the rest of the aircraft. Larger aircraft have complete engine cowlings isolated from the airframe/wing assemblies, divided into a number of **fire zones**, each usually with its own warning and extinguishing system. Light aircraft with piston engines, due to high airflow through the bay, typically have no fire protection and depend on isolating fuel from the engine to put out a fire.

### Hot and Cool Zones

Engines are usually split into hot and cool zones — the **hot zone** comprises the combustion chamber, turbines and exhaust areas; the **cool zone** comprises the intake, compressors and accessory drives.

### Fireproof Bulkheads

Prevent fire spreading to other areas. APUs and tail-mounted engines are normally contained within bulkhead compartments separating them from the rest of the airframe; engine pylons also contain a firewall separating the engine from the wing. These are made from **titanium or stainless steel**, with all joints sealed with fireproof sealants.

### Engine Fire Prevention

Techniques include flameproof/flame-resistant materials, bonding strips to prevent arcing, drainage of spilt fuel/oil, and efficient cooling. All fuel, oil and hydraulic pipes are fire resistant, and electrical components/connections are flame proof. A fire starting in one zone must be contained there: engine cowlings form a natural container but, being usually light alloy, would not contain a ground fire for long — in flight, cooling airflow through the cowlings renders them effectively fireproof. Fireproof bulkheads and cowlings with no cooling airflow are usually made from titanium or stainless steel.

### Cockpit and Cabin Interiors

Wool, cotton and synthetic fabrics used in interior trim are treated to be flame resistant. Tests show that although the foam used in seat cushions is flammable, when covered with a flame-resistant fabric there is little danger of fire from accidental contact with, e.g., a cigarette. Interior fire protection is usually provided by hand-held extinguishers, available in **Water, CO2 and Dry Powder** types — each best suited to one kind of fire, though usable on others.

## Smoke Detection

A smoke detection system monitors certain areas — including cargo/baggage compartments and toilets on transport category aircraft — for the presence of smoke, which may indicate a fire condition. It is used where the anticipated fire type generates substantial smoke before temperature changes would be sufficient to actuate a heat/fire detection system.

### Carbon Monoxide Detectors

Carbon Monoxide (CO) or Nitrous Oxides (N2O) are dangerous to flight crew and passengers and may indicate a fire condition, being a by-product of combustion. CO is especially dangerous because only a minute amount — approximately **2 parts in 10,000** — is required to cause loss of attention and headaches; it is colourless, odourless, tasteless and a non-irritant. CO detectors, usually used in cabin and cockpit areas, are typically a small card with a transparent pocket containing silica gel crystals treated with a chemical that changes colour to green or black when exposed to carbon monoxide.

### Photoelectric Smoke Detectors

Air from the monitored compartment is drawn through the detector chamber and a light beam shone through it. A photoelectric cell senses light refracted by smoke particles; the photocell is in a bridge circuit measuring changes in the current it conducts, which — when smoke is present — differs from the reference current produced when no smoke is present.

### Ionisation Type Smoke Detector

A small amount of radioactive material mounted in the detector chamber bombards oxygen and nitrogen molecules in the airflow, ionising the air so a reference current can flow through the ionised gas to an external circuit. Smoke flowing through the chamber changes the level of ionisation and decreases the current; when current reduces to a specific level, the external circuit initiates a smoke warning.

### Flame Detectors

A photoelectric cell detects a sharp rise in light, such as from a flame in a closed bay.

## Fire Extinguishing

There are a variety of aircraft and ramp extinguishing agents; their use depends on variables such as location, proximity to personnel, environment and possible fire sources. There are integral extinguishing systems on board, as well as hand-held extinguishers.

### Extinguishing System

Aircraft with an integral fire extinguisher system have a number of pressurised bottles containing extinguishant, each with **two explosive cartridges (squibs)** that can be fired from the flight deck. Each bottle can feed either the port or starboard engine through a crossfeed. Fixed systems may also protect landing gear wheel bays and baggage compartments, independently, and may be fully automatic or require aircrew initiation.

On multi-engine aircraft, there may be one bottle per engine, or one bottle feeding two engines. Two bottles can give either two "shots" to a single engine, or one shot each to either engine. Bottle condition is indicated via a pressure gauge, or a red/green sectioned gauge (red = empty or low pressure), plus a discharge indication on the fire control panel. There may also be pop-up indicators showing that a squib has fired, and a pressure switch giving an electrical indication when pressure drops to a pre-determined level. Each bottle has overpressure protection via a **rupture disc**, which fails if bottle pressure becomes excessive due to overheating.

### Directional Flow Control Valves (2-Way Valves)

Non-return valves used in a crossfeed system to allow the contents of one or several extinguishers to be directed into any one engine (or compartment), preventing reverse flow of extinguishant into the other bottle or engine.

### Fire Extinguishant Container

The cartridge is electrically ignited, driving a cartridge cutter into a disc that ruptures and releases the extinguishant; a strainer prevents broken disc fragments entering the distribution system. A safety plug connects by pipeline to a red indicator disc outside the compartment: if gas pressure rises due to increased compartment temperature, the fusible safety plug melts at a pre-determined temperature, discharging the bottle contents overboard and blowing out the red indicator. The gauge shows extinguishant pressure in the container.

### Toilet Compartment Systems

Small automatic units are often fitted in toilet waste bins, discharging themselves when a heat source is sensed in the region of **75 degrees Celsius** via a fusible plug that melts to release the contents. Most such systems give no cockpit or attendant panel indication when activated, though some have a visible temperature strip that can be checked before flight or in flight by cabin crew.

### Warnings and Indications

Once a fire is detected, a signal from the firewire element is sent to a control unit, which processes it and signals the cockpit CWP, the associated power lever handle, and the fire control panel. The CWP red Fire warning caption illuminates for the affected engine/compartment along with master warning lights and audio warnings; the affected power lever handle and fire extinguisher handle on the overhead console also illuminate red. To activate the extinguishant, the red fire handle is pulled to arm the system, then the squib button is pressed to fire the bottle; if the fire indication remains after the first bottle is exhausted, the second squib button fires the other bottle into the same affected engine/compartment. An amber **DISCH** caption on the fire control panel indicates when a bottle is empty.

### Hand-Held (Portable) Fire Extinguishers

Every aircraft must carry portable fire extinguishers for cabin crew use, positioned for easy access; the amount and location depend on aircraft type and size.

| Type | Characteristics |
|------|------------------|
| **Halon** | Interrupts the chemical reaction of combustion; leaves no residue, so often used to protect valuable electrical equipment; limited range of **4 to 6 feet**; initial application should be at the base of the fire, even after flames are extinguished |
| **Carbon Dioxide (CO2)** | Disperses gas quickly; effective from **3 to 8 feet**; stored as a compressed liquid, cools the surrounding air as it expands (can cause ice around the discharge "horn"); primarily used for electrical fires in cabin/cockpit |
| **Dry Powder** | Uses compressed nitrogen to expel a dry powder such as sodium or potassium bicarbonate; usable on most fires but never on the flight deck, due to loss of visibility and possible interference with electrical equipment |
| **Water** | Used for fires in ordinary combustibles such as wood and paper |

Hand-held extinguishers are subject to periodic maintenance, including a weight check against the charged weight stamped on the neck of the bottle; if below the set limit, the extinguisher is replaced.

## System Tests

All extinguishing systems have a method of testing serviceability — from weighing the complete cylinder off-aircraft against its marked "full" weight, to a bottle gauge with safe and low-pressure sectors, to internal pressure switches that notify the flight deck of pressure loss or discharge via a warning light or magnetic indicator. All bottles and squibs have a life, after which they must be removed and returned to the manufacturer for maintenance.

- **Fire System Test Switch** — when pressed, checks all warning lights and audio warnings; a light that fails to illuminate normally indicates a bulb filament failure.
- **Fire Wire Loop Test** — a test switch on the cockpit fire panel checks the continuity of each sensing element loop; if serviceable, the Loop caption(s) illuminate, otherwise there is a fault in the system.
- **Squib Test** — checks the continuity of the discharge heads for each fire extinguisher bottle; a squib warning light or magnetic indicator illuminates if serviceable, with no illumination indicating a fault. The current used during the squib test is at a much lower value than that required to actually fire the squib.
        $cnt2$,
        14
    ) RETURNING id INTO s12_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M13.11 Air Conditioning and Cabin Pressurisation (17 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s11_id, 'A typical air conditioning and pressurisation system comprises how many principal sub-systems?',
     '[{"id":"a","text":"Eight","correct":true},{"id":"b","text":"Four","correct":false},{"id":"c","text":"Twelve","correct":false}]',
     '{"B2"}'),

    (s11_id, 'Cabin temperature is normally maintained within which range?',
     '[{"id":"a","text":"15 to 30 degrees Celsius","correct":true},{"id":"b","text":"0 to 15 degrees Celsius","correct":false},{"id":"c","text":"30 to 45 degrees Celsius","correct":false}]',
     '{"B2"}'),

    (s11_id, 'Which air supply method is described as the most common, installed on the majority of modern aircraft types?',
     '[{"id":"a","text":"Ram air","correct":false},{"id":"b","text":"Engine bleed air (compression)","correct":true},{"id":"c","text":"Ground cart","correct":false}]',
     '{"B2"}'),

    (s11_id, 'Charge air tapped from the engine compressor can reach a temperature in excess of approximately:',
     '[{"id":"a","text":"100 degrees Celsius","correct":false},{"id":"b","text":"300 degrees Celsius","correct":true},{"id":"c","text":"1,000 degrees Celsius","correct":false}]',
     '{"B2"}'),

    (s11_id, 'The three basic principles on which air cycle cooling relies are:',
     '[{"id":"a","text":"Surface heat exchange, expansion, and energy conversion","correct":true},{"id":"b","text":"Compression, condensation, and evaporation","correct":false},{"id":"c","text":"Refrigeration, humidification, and filtration","correct":false}]',
     '{"B2"}'),

    (s11_id, 'In an Air Cycle Machine (ACM) / Cold Air Unit (CAU), expansion across the turbine can rapidly lower the charge air temperature to approximately:',
     '[{"id":"a","text":"Zero degrees Celsius","correct":true},{"id":"b","text":"20 degrees Celsius","correct":false},{"id":"c","text":"−56 degrees Celsius","correct":false}]',
     '{"B2"}'),

    (s11_id, 'Which type of ACM/CAU has its charge air routed directly from the pre-cooler to drive the turbine, dispensing with an inter-cooler?',
     '[{"id":"a","text":"Turbo-compressor type","correct":false},{"id":"b","text":"Brake-turbine type","correct":true},{"id":"c","text":"Turbo-fan type","correct":false}]',
     '{"B2"}'),

    (s11_id, 'The turbo-fan type ACM/CAU has a particular advantage over the other types because:',
     '[{"id":"a","text":"It requires no cooling air at all","correct":false},{"id":"b","text":"Its fan-induced airflow over the pre-cooler allows use on the ground with the aircraft stationary and engines running","correct":true},{"id":"c","text":"It operates without any bearings","correct":false}]',
     '{"B2"}'),

    (s11_id, 'ACM/CAU compressor and turbine wheels typically rotate at speeds often in excess of:',
     '[{"id":"a","text":"8,000 rpm","correct":false},{"id":"b","text":"80,000 rpm","correct":true},{"id":"c","text":"800,000 rpm","correct":false}]',
     '{"B2"}'),

    (s11_id, 'In a vapour cycle cooling system, the refrigerant absorbs heat from the charge air while:',
     '[{"id":"a","text":"Condensing from a gas to a liquid in the condenser","correct":false},{"id":"b","text":"Vaporising in the evaporator","correct":true},{"id":"c","text":"Being stored in the liquid receiver","correct":false}]',
     '{"B2"}'),

    (s11_id, 'Temperature control of the cabin, for aircraft using the engine bleed air method, is usually accomplished by an electric motor driving which type of valve?',
     '[{"id":"a","text":"A double butterfly type air mixing valve","correct":true},{"id":"b","text":"A ball-type metering valve","correct":false},{"id":"c","text":"A sonic venturi valve","correct":false}]',
     '{"B2"}'),

    (s11_id, 'Which of the following is NOT one of the three types of water separator described for humidity control?',
     '[{"id":"a","text":"Coalescer/diffuser type","correct":false},{"id":"b","text":"Swirl vane type","correct":false},{"id":"c","text":"Membrane osmosis type","correct":true}]',
     '{"B2"}'),

    (s11_id, 'The minimum quantity of fresh air that must be supplied to each person on board is at least:',
     '[{"id":"a","text":"0.5 lb per minute","correct":true},{"id":"b","text":"5 lb per minute","correct":false},{"id":"c","text":"0.05 lb per minute","correct":false}]',
     '{"B2"}'),

    (s11_id, 'In the isobaric mode of a pressurisation system:',
     '[{"id":"a","text":"Cabin altitude remains the same as flight altitude","correct":false},{"id":"b","text":"Cabin altitude remains constant while flight altitude changes","correct":true},{"id":"c","text":"Cabin pressure is maintained at a constant amount above ambient pressure regardless of cabin altitude","correct":false}]',
     '{"B2"}'),

    (s11_id, 'The un-pressurised mode of a pressurisation system, where the outflow valve remains open and cabin pressure equals ambient pressure, is usually used from sea level up to approximately:',
     '[{"id":"a","text":"1,000 ft","correct":false},{"id":"b","text":"5,000 ft","correct":true},{"id":"c","text":"15,000 ft","correct":false}]',
     '{"B2"}'),

    (s11_id, 'An inward (negative) pressure relief valve is designed to open and equalise pressure when the inward differential exceeds approximately:',
     '[{"id":"a","text":"0.5 psid","correct":true},{"id":"b","text":"8.5 psid","correct":false},{"id":"c","text":"15 psid","correct":false}]',
     '{"B2"}'),

    (s11_id, 'Most aircraft give a warning on the CWP, with associated audio and visual warnings, when cabin altitude reaches:',
     '[{"id":"a","text":"5,000 ft","correct":false},{"id":"b","text":"10,000 ft","correct":true},{"id":"c","text":"20,000 ft","correct":false}]',
     '{"B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M13.12 Fire Protection (10 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s12_id, 'Fire/overheat detectors are divided into two main groups:',
     '[{"id":"a","text":"Unit (Spot) type and Continuous Loop (Firewire) type","correct":true},{"id":"b","text":"Photoelectric type and Ionisation type","correct":false},{"id":"c","text":"Bi-metallic type and Capacitance type only","correct":false}]',
     '{"B2"}'),

    (s12_id, 'The Unit (Spot) type fire detector, valued for its sensitivity and fast reaction time, is commonly known as:',
     '[{"id":"a","text":"A Continuous Loop Firewire","correct":false},{"id":"b","text":"A High Speed Resetting Switch (HSRS)","correct":true},{"id":"c","text":"A Systron-Donner sensor","correct":false}]',
     '{"B2"}'),

    (s12_id, 'The continuous loop (firewire) detector indicates a rise in temperature at any point along its length by using the principle of:',
     '[{"id":"a","text":"Capacitance and resistance","correct":true},{"id":"b","text":"Radioactive ionisation","correct":false},{"id":"c","text":"Photoelectric refraction","correct":false}]',
     '{"B2"}'),

    (s12_id, 'In a dual loop fire detection system with the loop selector switch set to BOTH:',
     '[{"id":"a","text":"Either loop alone can trigger a full fire warning","correct":false},{"id":"b","text":"Both loops must detect a fire condition before the warning system activates","correct":true},{"id":"c","text":"Only Loop B is monitored, with Loop A held as a spare","correct":false}]',
     '{"B2"}'),

    (s12_id, 'The Systron-Donner pressure-type fire detection system gives two-stage warnings using the expansion of which two gases?',
     '[{"id":"a","text":"Nitrogen and oxygen","correct":false},{"id":"b","text":"Helium and hydrogen","correct":true},{"id":"c","text":"Argon and carbon dioxide","correct":false}]',
     '{"B2"}'),

    (s12_id, 'On an aircraft engine, the hot zone (as distinct from the cool zone) comprises:',
     '[{"id":"a","text":"The intake, compressors and accessory drives","correct":false},{"id":"b","text":"The combustion chamber, turbines and exhaust areas","correct":true},{"id":"c","text":"The engine pylon and firewall only","correct":false}]',
     '{"B2"}'),

    (s12_id, 'Carbon monoxide is especially dangerous because loss of attention and headaches can be caused by a concentration of only approximately:',
     '[{"id":"a","text":"2 parts in 10,000","correct":true},{"id":"b","text":"2 parts in 100","correct":false},{"id":"c","text":"2 parts in 1,000,000","correct":false}]',
     '{"B2"}'),

    (s12_id, 'In an ionisation type smoke detector, the presence of smoke in the chamber:',
     '[{"id":"a","text":"Increases the ionisation current until a warning threshold is exceeded","correct":false},{"id":"b","text":"Decreases the current, triggering a warning when it falls to a specific level","correct":true},{"id":"c","text":"Has no effect on the ionisation current","correct":false}]',
     '{"B2"}'),

    (s12_id, 'A Halon hand-held fire extinguisher has a limited effective range of approximately:',
     '[{"id":"a","text":"4 to 6 feet","correct":true},{"id":"b","text":"20 to 30 feet","correct":false},{"id":"c","text":"1 to 2 feet","correct":false}]',
     '{"B2"}'),

    (s12_id, 'A dry powder hand-held fire extinguisher should never be used on the flight deck because:',
     '[{"id":"a","text":"It is not effective against any type of fire found on the flight deck","correct":false},{"id":"b","text":"It causes loss of visibility and may interfere with some electrical equipment","correct":true},{"id":"c","text":"It requires refrigeration to remain effective","correct":false}]',
     '{"B2"}');

END $$;
