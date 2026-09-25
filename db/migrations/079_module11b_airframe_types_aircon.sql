-- Module 11B: Aeroplane Structures and Systems (Piston Aeroplanes, B1) — Fuselage/Wings/Stabilisers/Nacelles, Air Conditioning and Cabin Pressurisation
-- Source: EASA Part-66 Module 11B official textbook (IKAROS Aviation Training Centre, IK01, Issue Oct.2012)

DO $$
DECLARE
    m11_id INT;
    s3_id  INT;
    s4_id  INT;
BEGIN
    SELECT id INTO m11_id FROM easa_modules WHERE code = 'M11';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M11B.3') THEN
        RAISE NOTICE 'M11B.3-M11B.4 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 11B.3: Fuselage, Wings, Stabilisers and Nacelles
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m11_id, 'M11B.3', 'Fuselage, Wings, Stabilisers and Nacelles',
        $cnt$
# Fuselage, Wings, Stabilisers and Nacelles

## 3.1 Fuselage

The fuselage of a light aircraft is the body of the aircraft, to which the wings, tail, landing gear and engines may be attached. Larger aircraft can have their main landing gear attached to the wings and, on multiple engined aircraft, a number of the power-plants can be wing mounted also.

The loads produced either on the ground or in flight will, at some time, have to pass through the fuselage. To absorb these loads the fuselage must have maximum strength, combined with minimum weight. There are **two types of construction** found in the majority of modern aircraft fuselage design: the **truss** and the **stressed skin** type.

### 3.1.1 Truss Fuselage Construction

A truss is a form of construction in which a number of members (or struts) are joined to form a rigid structure, normally covered with non-load carrying material such as cloth, fabric or thin sheets of wood.

Very early aircraft used the **Pratt Truss**, where struts were held in **compression** and wires, running diagonally between the struts, were in **tension**.

### 3.1.2 Truss Fuselage – Warren Truss

When fuselages were later made from welded tubes, the **Warren Truss** became popular. In this arrangement, the longerons are separated by diagonal members which carry **both compressive and tensile loads**.

### 3.1.3 Stressed Skin Structure

The need to build a non-load-carrying covering over a structural truss led designers to develop the **stressed skin** form of construction, in which a proportion of the load is carried by the outside skin, which can also be formed into a smoother, more efficient shape.

**Pure Monocoque** — the commonest form of stressed skin structure, likened to a chicken egg: a seemingly fragile shell that can resist high loads if applied in the proper direction. This form is rarely seen in its purest form, because it is normal to add some light internal structure to help support the skin. Some gliders and sailplanes made from **glass reinforced plastic (GRP)**, with a thick skin and a core of balsa wood or composite honeycomb, are constructed as pure monocoque with no internal supporting structure needed.

**Semi-Monocoque** — has a skin carrying a large amount of the loads, but with an internal structure of **frames and stringers** to keep the skin to its correct shape. Some have **longerons**, which are more substantial than stringers and carry most of the longitudinal structural loads, with the frames carrying the radial loads.

### 3.1.4 Pressurised Structure

High altitude flight places occupants in a hostile environment where life cannot be sustained without oxygen. To avoid wearing oxygen masks, cabin pressure is raised higher than outside pressure.

- In the **1950s**, piston-engined aircraft had a pressure differential across the cabin wall of about **2 psi** maximum.
- **Modern aircraft** cabins can sustain a pressure differential between **8 and 10 psi**.

There must be no part of the structure containing 'stress raisers' which would concentrate stress to an unacceptable level. Much modern aircraft structure is built to the **'fail safe' philosophy**, with multiple load paths for the major stresses, to cater for the unlikely failure of a single structural item.

**Pressurisation Sealing** — all joints, doors, panels and emergency exits must be completely airtight in flight. Joints use an interface of sealing compound; windows and doors employ pre-formed rubber seals. Where control tubes and cables pass in and out of the pressure hull, flexible **bellows** are used, which are leak proof but move with the controls.

### 3.1.5 Attachments

Most other airframe components — wing, stabilisers, pylon and undercarriage — are fitted to the fuselage.

- **Wings** can be mounted above or below the passenger compartment, usually attached with multiple attachments, although light aircraft may have wings attached with as few as **two bolts**.
- **Stabilisers**: when the horizontal stabiliser is fitted part-way up or on top of the vertical stabiliser, there is only one strong attachment point; otherwise, there are separate attachments for the fin and for the left and right tailplane sections. Where a moving horizontal stabiliser is employed, the attachment consists of left and right rear pivot fittings and a single forward attachment to a trim actuator. Because of the loads generated by the empennage, the rear fuselage structure usually has stronger frames around the stabiliser attachment points, which transmit the loads along the fuselage and away from the tail.
- **Landing gear** can be attached to the fuselage, the wings, or within wing-mounted engine nacelles. Because of the need for cabin space, fuselage-mounted landing gear on passenger and freight aircraft often has the main gear mounted in fairings or nacelles beneath the fuselage (e.g. the ATR-72). The landing gear is mounted on strong fuselage frames, which in this case are also used to mount the wings above the fuselage; loads are transmitted into the fuselage by longitudinal stringers and longerons.

### 3.1.6 Passengers and Cargo

Aircraft carrying passengers must have seats complying with crashworthiness regulations: a correctly-strapped-in seat must be able to survive a sudden stop of over **20 times the force of gravity (20g)**, without the floor mountings failing or the seat collapsing. Seats have a tubular framework and floor attachment 'feet' that are strong yet light, and can be disconnected from the floor via a few quick-release fasteners.

Passenger compartment floors are often panels of the composite material **'Fibrelam'**, strong enough to carry the general loads from passengers and galley equipment. The panels are supported by lateral and longitudinal beams (primary structure); lateral beams attach to the lower portion of the fuselage frames, and longitudinal beams (supported by the lateral beams) are those on which the seats are fitted.

The top of each longitudinal beam has location holes of standard size into which all seats are slotted, allowing seats to be fitted at variable **pitch** for different cabin classes. On the **Fokker 100**, there are **five** longitudinal seat tracks in the cabin floor, allowing five-abreast seating (3+2 or 2+3) with an off-set aisle.

**Cargo Loading Systems** — aircraft used for freight need the floor modified with reinforced tracks, guides and rollers for safe motorised movement of pallets/containers. In the entrance door area, a **'ball-mat'** allows freight to be easily loaded, rotated and man-handled onto the rollers.

### 3.1.7 Doors

Doors cover most methods of entry/exit for passengers, crew, refreshments, baggage and major maintenance access; some doors are dedicated to emergencies only.

If the aircraft is pressurised, doors must be more substantial and fitted with safety devices to prevent accidental opening. One method is to let the door open **inwards**, so it 'plugs' the aperture when closed and is held in place by cabin pressure in addition to the door frame locating bolts. Any door that opens **outwards** on a pressurised aircraft must have additional devices and a flight deck warning system to indicate if it is not properly closed and secured.

All cabin doors (normal and emergency) must be operable by a **single handle** whose operation shall be "rapid and obvious", usually indicated by decals and large red arrows. Dedicated emergency exits are almost always the 'plug' type and cannot be opened in flight because cabin pressure acts on the door opening mechanism (usually an over-centre cam arrangement), preventing handle rotation.

All doors have a substantial seal around their edges to keep the door-to-frame aperture airtight; some seals simply compress and fill the space, others use cabin air to inflate and expand the seal.

### 3.1.8 Windows and Windscreens

Transparencies on non-pressurised aircraft are normally made from acrylic or other clear plastic. On pressurised aircraft, flight deck windscreens must comply with strict bird-strike regulations and are made from a toughened sandwich of **glass/plastic/glass**. During testing, a dead bird is fired at the screen from a large air gun and the screen must survive the impact.

The glass/plastic/glass sandwich is fitted with a **heating element** between the front glass panel and the plastic core — this provides anti-icing protection and helps absorb impact by making the plastic core more pliable and shock absorbent.

Passenger cabin windows are almost always made from **acrylic plastic**, saving weight and cost. For added safety, cabin windows are actually **two layers** with a space between them, so that if one fails the other carries the pressurisation loads (a fail-safe design). Some cabin window assemblies have a **third pane** of acrylic to help reduce engine noise in the cabin.

Flight deck windows can usually be opened (**Direct Vision windows**) for signalling to ground crew, for fresh air ventilation when air conditioning is off on the ground, and to see out in emergencies (e.g. an obliterated windscreen). If the cabin is pressurised, these cannot be opened due to a 'pressure on' safety lock system similar to the cabin doors.

## 3.2 Wings

### 3.2.1 Construction

Wings can be classified as either **externally braced** or of **cantilever** construction (no external bracing). Early aircraft were braced by wires and struts, producing high drag but low structural weight. As materials and construction improved, the number of wires was progressively reduced until, in the **mid-1930s**, the first genuine fully cantilever wings with no external bracing entered production — bracing is included within the wing structure and made much stronger.

The heart of a wing is the **spar** (or spars), to which ribs, stringers and other structural items are attached. The number of spars is decided by the designer; modern airliners normally have **two**. Simpler wings (e.g. light aircraft) may have only one main spar, but some aircraft can have up to **five** (a measure of 'fail safe' philosophy), and some modern military fighters can have more than **15 spars** as part of a 'damage tolerant' design.

**Wing plan forms** are generally grouped into: straight (including slightly swept leading/trailing edge), swept (both leading and trailing edges swept back at various angles), delta (from the Greek for triangle) and combination wings.

### 3.2.2 Fuel Storage

Wings are often used for fuel storage — either separate fuel tanks within the wing structure, or the wing structure itself (suitably sealed) as **integral tanks**.

- **Rigid tanks** — usually manufactured from light alloy, first riveted then welded to make them fuel tight, and clamped into the wing structure by straps or tie bars. They often have **baffles** inside to prevent fuel surge.
- **Flexible tanks** — also called 'bladder' tanks, located snugly into the tank bay since the bay sides support the relatively weak tank skin. Older types were rubber-covered fabric; modern versions use man-made fibres impregnated with neoprene or a similar fuel-tight material.
- **Integral tanks** — found on most modern commercial aircraft. Practically the entire wing structure becomes a box (front and rear spars, top and bottom wing skins, sealed inboard/outboard ribs) into which pumps, drains, filler caps and vents are installed. The main advantage is maximum fuel capacity for minimum weight, with the only sealing required applied to the seams after construction.

### 3.2.3 Landing Gear

The attachments for major components are often strong points on the wing spars, or a separate spar built specifically for that purpose — the main landing gear (undercarriage) is one such component. On some very large aircraft, additional body gears are found alongside conventional wing gears, requiring reinforcements in the lower fuselage structure to absorb the extreme touchdown loads.

### 3.2.4 Pylons

Many aircraft have engines mounted on pylons attached to the wing (the 'podded engine' configuration). Pylons take large thrust forces from the engines and transfer them to the airframe, normally by attaching the engine to strong points on the pylon and attaching the pylon to the wing spars; **thrust links** transfer engine thrust efficiently between the engine frame and the wing spars. Pylons must be positioned low enough that engine exhaust doesn't strike the wing, but not so low as to risk a runway scrape.

### 3.2.5 Control Surface and High Lift/Drag Attachments

All flying controls on the wing — high and low speed ailerons, leading and trailing edge flaps, slats, roll spoilers, speed brakes and lift dumpers — are attached to strong points on either the front or rear spars. The wing structure must be strong enough to carry lift forces in flight plus the additional loads of pilot control inputs and drag devices. Consequently, **the spars are always the strongest part of the wing structure**.

## 3.3 Stabilisers

The **vertical stabiliser (fin)** produces directional (lateral) stability, while the **horizontal stabiliser (tailplane)** produces longitudinal stability. These surfaces are of similar construction to the wings (spars, ribs, stringers), and must resist the twisting forces from control surfaces mounted on their trailing edges. In many cases the fin is similar to one half of the tailplane, and on some light aircraft it is actually constructed this way, simplifying production and component parts.

Light aircraft have stabilisers manufactured from welded tube or fabricated from thin aluminium sheet of simple construction. As aircraft size and weight increase, surfaces are made from stronger milled or machined skins and forged spars.

## 3.4 Flight Control Surfaces

Flight control surface construction is critical, since designers want them as light as possible. Early control surfaces used a light tubular frame covered with fabric; later, light alloy was adopted. Today, metallic structures with **honeycomb cores** or **epoxy reinforced composite construction** are used for most control surfaces, attached to the wing, fin or stabiliser by hinges, with the spars reinforced at these attachment points.

To prevent the risk of **flutter**, ailerons, elevators and rudders are constructed so that the part of the surface behind the hinge line is as light as possible, and calibrated weights — **mass balance weights** — are added to the leading edge of the surface. This procedure is known as **mass balancing**.

In addition to mass balancing, surfaces that lack hydraulic power assistance and are difficult to move at high speed benefit from **aerodynamic balancing**: the hinge of the control is inset, so that part of the surface in front of the hinge line projects into the airstream when the control is deflected from neutral.

## 3.5 Nacelles and Pylons

Nacelles and pylons attach the engines to the wings and, on some aircraft, other parts of the airframe. The main purpose of engine fairings is to keep the engines outside the airframe itself — this is safer in the event of a fire or explosion (isolated from the fuselage/wings by firewalls) and much easier for routine maintenance and engine changes.

Most nacelles are simply fairings that streamline the power-plant, and usually also serve as the intake for jet and turbo-propeller engines. They are covered by large, easy-to-open doors and panels for quick access, sometimes with smaller quick-release panels for checking items such as oil level.

On light aircraft, engine nacelles are usually simple **GRP fairings** split into two parts, removed by releasing a few screws or quick-release fasteners, and containing a small intake for air to reach the carburettor.

On many larger aircraft, particularly those with fan bypass engines, **thrust reversers** are fitted as part of the cowlings — usually doors that translate rearwards to open panels containing cascade vanes, redirecting exhaust thrust forward when reverse thrust is selected after landing.

Modern jet engines produce harmful high frequency noise. One way to keep noise below the safe/legal minimum is to make the cowlings from **honeycomb sandwich**, which is light and excellent at absorbing sound; the honeycomb can be manufactured from glass or carbon fibre and covered with composite or light alloy skin facing panels.

Pylons supporting engines on the wings or rear fuselage transmit the full thrust of the engines into the airframe — they must be extremely strong yet flexible, as wing-mounted pylons especially have to move with the flexing of the wings. On many large aircraft, the space within pylons is used to fit heat exchangers (radiators), air valves, fuel valves, pipes carrying air/oil/fuel, and electric cabling.

All engines must be isolated from the rest of the aircraft, so a fire can be contained within the nacelle and extinguished. There is a sealed **bulkhead or divider** between the engine and airframe, made of a fire resistant material such as **titanium or stainless steel**.

Engine vibration is reduced by engine mounts designed not only to hold the engine securely and transmit thrust, but also fabricated with a shock absorbing material — usually an elastomeric or metallic woven block — absorbing a large proportion of vibration for a smooth flight.
        $cnt$,
        3
    ) RETURNING id INTO s3_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 11B.4: Air Conditioning and Cabin Pressurisation
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m11_id, 'M11B.4', 'Air Conditioning and Cabin Pressurisation',
        $cnt2$
# Air Conditioning and Cabin Pressurisation

## 4.1 Introduction

The atmosphere above **10,000 ft** is too thin and cold for normal breathing. Passenger-carrying aircraft operating above this height need an air conditioning and pressurisation system. Temperature, flow rate and humidity of the air passing through the passenger cabin, flight deck and other compartments must be strictly controlled.

- Cabin temperature is normally maintained between **15 and 30 degrees Celsius**.
- Pressurisation is controlled so the cabin air pressure does not exceed the equivalent of the ambient air pressure at **8,000 ft**.
- Air conditioning is also essential for **un-pressurised** aircraft types.

A typical air conditioning and pressurisation system comprises **eight** principal sub-systems: Air Supplies (Pneumatics, ATA 36), Cooling, Heating, Temperature Control, Humidity Control, Mass Flow Control, Distribution, and Pressurisation.

## 4.2 Air Supply

### 4.2.1 Engine Bleed Air (Compression)

The most common method, installed on the majority of modern aircraft. Very hot air is tapped from the main engine compressor stages and supplied to the cabin, flight deck and other areas. Before entering the cabin, it passes through a temperature control system that reduces its temperature and pressure; flow control is also used, and on some aircraft humidity control forms part of the system. In pressurised aircraft, discharge of the conditioned air is regulated to maintain cabin pressure at the selected pressure altitude.

### 4.2.2 Air Compressors or Blowers

Used on turbo-prop, piston engine or even turbo-jet aircraft where main engine compressor bleed is unavailable or unsuitable. The compressor or blower is normally mechanically driven from the accessory gearbox of the main engine, with its air supply routed via a temperature control system similar to the engine bleed method.

### 4.2.3 Auxiliary Power Unit (APU)

The APU is a small gas turbine engine that can be connected into the main air supply system, providing an independent means of air conditioning and pressurisation, on the ground or in flight, when the main engines cannot supply. It uses the engine bleed air principle.

### 4.2.4 Ram Air

The primary ventilation system on un-pressurised aircraft. A ram air scoop placed directly into the airflow provides the air supply as the aircraft moves forward. Since air at altitude is cold, the temperature control system it passes through is normally a form of heater — either a self-contained combustion type heater or an exhaust gas heater. On pressurised aircraft, a ram air system can be used as a means of **emergency ventilation** following a complete loss of the main system.

### 4.2.5 Ground Cart

An independent means of heating or cooling the passenger cabin on the ground, used on aircraft that do not have an APU. The trolley connects externally to the aircraft via a purpose-built inlet and normally employs a combustion type heater with a control panel on the cart.

## 4.3 Cooling

When bleed air is used as the air supply, air tapped off the engine compressor can reach a temperature in excess of **300 degrees Celsius** — far too hot to feed directly into air-conditioned areas, so it must first be cooled down to around **20 degrees Celsius**. There are two main methods of cooling: **Air Cycle** and **Vapour Cycle** cooling systems.

### 4.3.1 Air Cycle Cooling

Relies on three basic principles: surface heat exchange, expansion and energy conversion.

- **Surface heat exchange** — cools by passing charge air across a heat exchanger, against a colder cross flow of ram air. Although 90% of heat is given up this way, charge air temperature can never be reduced below ram air temperature by this method alone.
- **Expansion** — cools when the pressure of the charge air is reduced by increasing its velocity and expanding it across the turbine of an **Air Cycle Machine (ACM)** or **Cold Air Unit (CAU)**. Temperature can be rapidly lowered to zero degrees Celsius, irrespective of ram air temperature.
- **Energy Conversion** — cools by making the hot air do work: charge air drives a turbine connected by a shaft to the compressor or fan within the cold air unit, converting heat energy into kinetic energy, also reducing charge air to zero degrees Celsius.

**Heat Exchangers** transfer heat from one gas stream to another; ram air cools the very hot charge air. Depending on position in the system, they are described as a **'Pre-cooler' (Primary Heat Exchanger)** or an **'Inter-cooler' (Secondary Heat Exchanger)**. Construction is a sealed unit with cooling passages through which charge air flows, over which ram air is directed, with thin corrugated strips between passages to help dissipate heat.

**Air Cycle Machine (ACM) / Cold Air Unit (CAU)** types:

| Type | Key feature |
|------|-------------|
| **Turbo-compressor** | Turbine driving a centrifugal compressor, operating with an inter-cooler between compressor and turbine stages |
| **Brake turbine** | Charge air routed directly from the pre-cooler to drive the turbine; dispenses with the inter-cooler (greater efficiency, weight saving); coupled with a compressor rotating in ambient air acting as a braking medium |
| **Turbo-fan** | Turbine drives a large centrifugal fan (instead of a compressor) that draws ambient air over the pre-cooler; major advantage is it can be used on the ground with engines running, without relying solely on ram air |

For the turbo-compressor type, the basic construction has two main casings (turbine volute and compressor volute), enclosing a bearing housing with two bearing assemblies supporting a shaft carrying the turbine and compressor wheels. Compressor and turbine wheels rotate at extremely high speeds, often in excess of **80,000 rpm**, so efficient bearing lubrication is essential. Two lubrication methods are used: **integral wet sump** arrangements (using wicks or an 'oil slinger') or **pressurised air bearings** needing no oil (the rotor 'floats' on a thin layer of air, similar to the hovercraft principle, and must be kept clean, dry and free from oil and grease).

### 4.3.2 Vapour Cycle Cooling

An alternative to air cycle cooling, not commonly used these days for air conditioning but sometimes used to remove heat from electrical and electronic equipment. Relies on the principle that a refrigerant absorbs heat when changing from a liquid to a gas (vaporisation/expansion). A sufficient reduction in pressure causes a liquid to change state into a vapour; a corresponding increase in pressure reverses the process.

Major components: a liquid receiver, a thermostatic expansion valve, an evaporator, a turbo-compressor, a condenser and a condenser fan — often mounted together as a line-replaceable refrigeration pack.

The **liquid receiver** stores the refrigerant (normally a highly volatile chemical such as **Freon**), which passes to a **thermostatic expansion valve** where it is metered and released into the **evaporator**. Hot charge air from the main engine bleed flows across the evaporator, releasing heat that vaporises the liquid refrigerant, which then passes into the passenger cabin at a much lower temperature. The vaporised refrigerant gas is drawn into the **turbo-compressor** wheel, whose coupled turbine is driven by the main engine bleed air (in some cases an electric motor is used instead, as in a domestic refrigerator). The refrigerant gas leaves the compressor at high pressure/temperature and passes across the **condenser** matrix, where ram air cools and condenses it back into a liquid, which returns to the liquid receiver to repeat the cycle. A **condenser fan** induces air across the condenser matrix when the aircraft is stationary on the ground with no ram air available.

## 4.4 Heating

Un-pressurised aircraft use a ram-air system for ventilation; at altitude this air would be very cold, so heating is required. Heating systems divide into two types: **Exhaust heating systems** and **Combustion heating systems**.

### 4.4.1 Exhaust Heating Systems

The simplest form employs a **heater muff** surrounding the exhaust pipes of a piston engine (or the jet pipe of a turbo-jet). A ram air scoop at the forward end of the heater muff allows some cold air to go directly to a mixing valve; the remainder enters the muff, surrounds the exhaust/jet pipes, and picks up heat which is carried to the mixing valve. Heated air joins cold air at the mixing valve, and the combined flow is directed into the passenger cabin. A control lever, connected to the mixing valve, allows the proportion of hot and cold air to be modulated.

Because ventilation air can become contaminated from the exhaust pipes, some aircraft are fitted with **carbon monoxide detectors** in the cabin — indicators filled with brightly coloured crystals that turn black if exposed to dangerous levels of carbon monoxide.

On smaller piston aircraft, cabin heat sources also include an **oil radiator** pickup (heated air from the oil radiator, with no carbon monoxide risk, though the temperature difference between oil and air is smaller than between exhaust and air) and, on turbocharged engines, tapping **induction system air** (compressed by the turbo, so already at a raised temperature — as high as around **300°F (150°C)** at altitude and high manifold pressure).

Twin-engine and some single-engine aircraft heat the cabin with a **combustion heater**, producing up to **50,000 Btu** in general aviation aircraft. Unlike heat-muff systems, combustion heaters do not have carbon monoxide poisoning as a major concern, since the combustion tube is at lower pressure than the surrounding ventilation air, so any leak draws air inward rather than exhaust gas outward.

### 4.4.2 Combustion Heating Systems

Uses a purpose-built combustion chamber heater assembly as the heat source. Fuel is directed from the aircraft fuel system through a pressure regulating and shut-off valve (ensuring correct pressure for atomisation), a fuel filter, a fuel pump and a spray nozzle, where it is atomised and ignited with an **igniter plug**. The combustion chamber assembly heats the ram air passing around it.

## 4.5 Temperature Control

Temperature regulation for aircraft using the engine bleed air method is usually accomplished by controlling the proportion of hot and cold air from the air supply system. An **electric motor** driving a double butterfly type **air mixing valve** regulates cabin temperature, allowing a controlled amount of hot air to bypass the air cycle system, recombined with cold air at a downstream mix chamber. The position of the air-mixing valve is determined by signals from the temperature control system.

The system normally operates **automatically**, with a **manual** system available if the automatic controller fails. In automatic operation, the temperature controller continually monitors cabin temperatures and repositions the air mixing valve as needed, using signals from a flight deck temperature selector (requested temperature) and temperature sensors in the cabin, flight compartment and supply ducts (actual temperature). In manual operation, the control circuit bypasses the controller and connects the flight deck selector directly to the air-mixing valve, while other sensors transmit compartment temperatures to flight deck indicators so the crew can monitor actual temperatures and valve position.

## 4.6 Humidity Control

Ensures the correct amount of water moisture content is in the cabin air conditioning air, so occupants do not suffer from the low humidity levels experienced during high altitude flight. Achieved two ways:

- **Water Separation** — removal of excessive moisture from the charge air, normally by a water extractor/separator.
- **Water Infiltration** — addition of moisture into the conditioned air as it enters the cabin, using a water pump and spray nozzle.

### 4.6.1 Water Separation – Water Extractor

Water can be introduced into the air conditioning system due to compression and expansion of the air in the ACM/CAU and other areas of the air cycle process. There are **three** types of water separator in general use:

- **Coalescer/Diffuser type** — a coalescer of layers of monel metal gauze and glass fibre cloth sandwiched between layers of stainless steel gauze, supported by a diffuser cone and held by a relief valve housing. As air leaves the diffuser and passes over the coalescer, moisture converts into water droplets, which enter a collector shell, drain into collector tubes and a collector box, and are ejected overboard.
- **Coalescer/Bag type** — a porous bag, supported by a shell, converts moisture into water droplets. A swirl is imparted into the conditioned air and centrifugal effect forces droplets to the outlet shell where they collect and drain. A **bag visual indicator**, operated by back pressure, shows when the coalescer bag becomes dirty or blocked, at which point a relief valve opens to ensure flow is still available.
- **Swirl Vane type** — uses centrifugal force to spin moisture-laden air outwards against the exit shell; a swirl vane (fixed or rotating) imparts the swirl by rotating the airflow at high speed, separating heavier water droplets, which collect in a sump to be drained away.

### 4.6.2 Water Infiltration

As an aircraft climbs to high altitude, moisture level in the air reduces well below that at lower altitudes, potentially causing occupant discomfort. To counteract this, moisture is added to the conditioned air by pumping water from a tank to a spray nozzle at the cabin air inlet. **Humidity sensors** detect low humidity conditions and automatically turn on the controller water pump to restore humidity to acceptable levels.

## 4.7 Mass Flow Control

Legislation requires a minimum amount of fresh air be supplied to passengers and crew; stale air must be removed and odours eliminated. Most pressurisation systems rely on air being delivered at a **constant rate** under all flight conditions. Mass flow control systems constantly monitor the velocity and density of the air supply, by either increasing/decreasing demand on the supply source, or by spilling excess supply air overboard. The mass of air must be controlled at a constant value regardless of aircraft altitude or cabin pressure, and must adjust for changes in main engine compressor speed (bleed air systems) or rotor speed (accessory gearbox driven blower).

### 4.7.1 Mass Flow Controller

Automatically caters for changes in air density, cabin back pressure and engine compressor supply pressure. At ground level and during take-off, engine compressor outlet pressure is high; as altitude increases or engines reach cruise speed, supply pressure drops. Pressure from the engine compressor bleed acts on an **altitude-compensated piston valve**, opposed by a spring and cabin back pressure, determining valve position. The pressure drop across the valve varies the size of outlet ports, determining the valve's degree of opening/closing, resulting in constant mass flow downstream of the valve at all times.

### 4.7.2 Spill Valve Flow Controller

Receives charge air supply through a metering duct that senses variations in velocity and density, transmitting this information to a mass flow controller, which converts air pressure signals into electrical signals controlling the position of **spill valves**, which move towards a more open or closed position to vary the amount of air spilled overboard, ensuring a constant flow rate into the cabin.

## 4.8 Distribution Systems

The air distribution system takes cold air from the air conditioning packs and hot air bleed from the engines, mixes them in a **mixer unit** to the required temperature, and distributes it to side wall and overhead cabin vents. On some aircraft, cabin air is drawn back into the mixing unit by re-circulating fans, mixed with new air and re-distributed.

A **gasper fan** provides cold air to individual overhead air outlets for aircrew and passengers, drawn directly from outside or from the cooling packs; each passenger/crew member controls the amount of air received via a rotary nozzle or louvre outlet.

Conditioned air is dispensed evenly throughout the cabin and crew areas: one duct system supplies the cockpit, another the cabin. The cabin ducting divides into the **overhead** system (releases air from ducting running fore and aft in the cabin ceiling) and the **sidewall** system (takes air through ducting between the sidewall and cabin interior linings, releasing it through cove light grills and louvres). A cockpit-controlled selector valve on the main distribution manifold allows overhead, sidewall, or a combination of the two to be used.

Duct sections are joined with clamps or clips; the systems are protected from excess pressure by a spring-loaded pressure relief valve, usually located in the main distribution manifold immediately downstream of the mixing units.

On large aircraft, a cockpit-controlled **dual selector valve** divides air between cockpit and cabin — interlinked butterfly valves, where when one is fully open the other is fully closed and vice versa. Air is exhausted from the passenger cabin through grills and outflow valves in the sidewalls above the floor, and can be directed around the cargo compartment walls to assist compartment temperature control before discharge overboard.

Below each floor air exhaust outlet is a **flotation check valve** — a plastic ball held in a cage — which, if the cargo compartments become flooded, floats up the cage and seals off the floor to help prevent water entering the cabin.

### 4.8.1 Re-circulation Air System

To improve cabin ventilation and supplement airflow, cabin air is recirculated back to the main distribution manifold and mixed with conditioned air from the cooling packs. This offloads the air supply system, converting into a fuel saving. The re-circulation fan draws air from the cabin, through a check valve and filter assembly (to remove smoke and noxious odours), before passing it to the mixer unit for re-distribution; the check valve prevents reverse flow through the fan and ducting when not in use.

## 4.9 Pressurisation Systems

Cabin pressurisation adds pressure to the cabin to create an artificial atmosphere equivalent to an environment below **10,000 feet** when flying at high altitude. The minimum quantity of fresh air supplied to each person on board must be at least **0.5 lb/minute**.

Aircraft are pressurised by sealing off a strengthened portion of the fuselage — the **pressure vessel** — normally including cabin, cockpit and possibly cargo areas. Air is pumped into this vessel and controlled by an **outflow valve** located at the rear of the vessel. Sealing is accomplished with seals around tubing, ducting, bolts, rivets and other hardware; panels and structural components use sealing compounds; access/removable doors and hatches have integral (some inflatable) seals.

Small reciprocating engine powered aircraft receive pressurisation air from the compressor of a coupled turbocharger. Larger reciprocating engine powered aircraft receive air from engine driven compressors, and turbine powered aircraft use compressor bleed air.

**Small Reciprocating Engine Powered Aircraft — Cabin Pressurisation:** turbochargers are driven by engine exhaust gases flowing through a turbine, coupled to a centrifugal compressor whose output feeds the engine inlet manifold to increase manifold pressure. Part of this compressed air is tapped off after the compressor and used to pressurise the cabin, passing through a **flow limiter (sonic venturi)** and then an **inter-cooler** before being fed into the cabin. A sonic venturi fitted in line between the engine and the pressurisation system: when airflow across the venturi reaches the speed of sound, a shock wave forms which limits the flow of air to the pressurisation system.

**Large Reciprocating Engine Powered Aircraft** use engine driven compressors, driven through an accessory drive or by an electric or hydraulic motor; multi-engine aircraft have more than one air compressor, interconnected through ducting, each with a check or isolation valve to prevent pressure loss if one system is out of action.

**Turbine Powered Aircraft** — air supplied from a gas turbine engine compressor is contamination free and can be used directly for cabin pressurisation; some aircraft use an independent compressor driven by engine bleed air. Some aircraft use a **jet pump** — a venturi nozzle in the flush air intake ducting — where high velocity engine air flowing through the nozzle produces a low pressure area that sucks in outside air, mixed with the high velocity air before passing into the cabin.

### 4.9.1 Control and Indication

There are **three modes** of pressurisation:

| Mode | Behaviour |
|------|-----------|
| **Un-pressurised** | Cabin altitude remains the same as flight altitude |
| **Isobaric** | Cabin altitude remains constant as flight altitude changes |
| **Constant-differential pressure** | Cabin pressure is maintained at a constant amount above outside ambient air pressure |

The amount of differential pressure is determined by the structural strength of the aircraft: the stronger the structure, the higher the differential pressure and the higher the aircraft's operating ceiling.

### 4.9.2 The Un-Pressurised Mode

The outflow valve remains open and cabin pressure equals outside ambient air pressure. Usually applies from sea level up to around **5,000 ft**, though this varies by aircraft.

### 4.9.3 The Isobaric Mode

Cabin pressure is maintained at a specific cabin altitude as flight altitude changes. The cabin pressure controller begins closing the outflow valve as the aircraft climbs to a chosen cabin altitude; the outflow valve then modulates to maintain the selected cabin altitude up to the flight altitude that produces the maximum differential pressure for which the aircraft structure is rated, at which point the constant differential mode takes control.

### 4.9.4 The Constant-Differential Pressure Mode

Cabin pressurisation puts the aircraft structure under tensile stress as cabin pressure expands the pressure vessel. The cabin differential pressure is the ratio between internal and external air pressures. At maximum constant-differential pressure, as altitude increases, cabin altitude increases but the internal/external pressure ratio is maintained; there is a maximum cabin altitude allowed, determining the aircraft's operating ceiling.

### 4.9.5 Cabin Air Pressure Regulator

Maintains cabin altitude at a selected level in the isobaric range and limits cabin pressure to a pre-set differential in the differential range, by regulating the position of the outflow valve. Normal operation requires only selecting the desired cabin altitude/rate of climb and adjusting the barometric control. A typical differential pressure regulator is built into the normally-closed, air-operated outflow valve, using cabin altitude for isobaric control and barometric pressure for differential control; a **cabin rate of climb controller** controls the pressure change inside the cabin.

The regulator has two main sections: the head and reference chamber, and the base with the outflow valve and diaphragm. The **balance diaphragm** extends from the baffle plate to the outflow valve, creating an air chamber; cabin air flowing into this chamber exerts a force trying to open the valve, opposed by a spring around the valve pilot trying to hold it closed. The **actuator diaphragm** extends from the outflow valve to the head assembly; air from the head and reference chamber exerts a force on the inner face of the outflow valve, helping the spring hold it closed. The position of the outflow valve — controlling how much cabin air flows from the pressure vessel — is determined by the amount of reference chamber air pressure pressing on the valve's inner face.

### 4.9.6 Isobaric Control System

Incorporates an evacuated capsule, a rocker arm, a valve spring and a ball type metering valve. One end of the rocker arm connects to the valve head via the evacuated capsule; the other end holds the metering valve closed. A valve spring tries to move the metering valve away from its seat as far as the rocker arm allows. When cabin air pressure increases enough for reference chamber pressure to compress the evacuated capsule, the rocker arm pivots and allows the metering valve to open proportionally, venting reference pressure air to atmosphere. In the isobaric range, cabin pressure is held constant by reducing the flow of reference chamber air through the metering valve, preventing a further decrease in reference pressure. An increase in cabin pressure opens the isobaric metering valve, decreasing reference pressure and causing the outflow valve to open, which decreases cabin pressure.

### 4.9.7 Differential Control System

Incorporates a diaphragm, a rocker arm, a valve spring and a ball type metering valve. One end of the rocker arm attaches to the head via the diaphragm, forming a pressure-sensitive face between the reference chamber and atmospheric chamber; atmospheric pressure acts on one side, reference chamber pressure on the other. The other end of the rocker arm holds the metering valve closed. When reference chamber pressure increases to the system differential pressure limit, it collapses the diaphragm and opens the metering valve, venting air from the reference chamber to atmosphere, reducing reference pressure, which causes the outflow valve to open and reduce cabin pressure to maintain the system pressure differential.

### 4.9.8 Safety Valves

- **Cabin Air Pressure Safety Valve** — the pressure relief valve prevents cabin pressure from exceeding the predetermined cabin-to-ambient pressure differential; a negative pressure relief valve and pressure dump valve may also be incorporated.
- **Negative Pressure Relief Valve** — allows outside air to enter the cabin if cabin pressure becomes lower than outside air pressure (which could otherwise cause cabin structure failure); essentially an inward pressure relief valve.
- **Dump Valve** — normally solenoid actuated by a cockpit switch; when energised, opens and dumps cabin air to atmosphere, so cabin pressure decreases rapidly to match outside pressure and cabin altitude rises to match flight altitude.
- **Ditching Valve** — a mechanical or electrical ditching selection made by the crew to seal off all pressurisation valves and inlets, preventing rapid flooding if the aircraft ditches in water and cabin control valves are below the water level.

## 4.10 Electronic Pressurisation Control

Most modern airliners electronically control cabin pressure automatically for the entire flight, from settings made by the flight crew before take-off. The system consists of: a flight deck control panel; an automatic pressure controller with pressure sensing inputs/outputs to monitoring indicators; an electrically-driven gate-type outflow valve; and inward and outward safety relief valves.

### 4.10.1 Flight Deck Control Panel

Provides a means for the flight crew to control cabin pressure by positioning the outflow valve, with three mode selections:

- **Auto (fully automatic mode)** — settings such as intended cruise altitude and destination airfield altitude are made before flight, allowing automatic control of cabin pressure for the whole flight.
- **Standby (semi-automatic mode)** — a cabin altitude setting must be made for each desired cabin pressure change; the input is then controlled automatically as before.
- **Manual mode** — if neither automatic mode is available (e.g. the pressure controller fails), the outflow valve is positioned directly from the flight deck by operating electric torque motors, with a choice of AC or DC electrical supply.

### 4.10.2 Automatic Pressure Controller

Provides output control signals to the outflow valve's AC or DC torque motors, which position and modulate the valve to establish and control actual cabin pressure according to the controller's pre-programmed climb, cruise or descent schedules — ensuring a particular cabin altitude for every aircraft altitude. Input signals come from the flight deck control panel, cabin and ambient pressure sensors, barometric correction and air/ground sensing.

### 4.10.3 Outflow Valve

Has a moving gate that covers or uncovers an aperture in the fuselage skin: an increase in aperture size causes cabin pressure to fall (cabin altitude to ascend), while a decrease in aperture size increases cabin pressure (cabin altitude to descend). The gate is driven by one of two electrically driven motors (AC or DC, per flight crew input), with motor input signals from the controller (auto/standby modes) or directly from a control panel switch (manual mode).

### 4.10.4 Inward and Outward Safety Relief Valves

Fuselage frames accept tensile loads from an outward force within the pressure cell well, but have poor ability to withstand compression loads that would occur if outside pressure exceeded inside pressure. Therefore, an **inward relief valve** opens to equalise pressure if the inward (negative) differential exceeds about **0.5 psid**. **Two outward relief valves** are fitted to prevent the maximum outward differential pressure from exceeding the structural limit, typically around **8.5 psid**. Even though the main pressure control is electronic, the safety relief valves are mechanically operated and completely independent of any automatic control system.

## 4.11 Cabin Pressure Indication

Most pressurisation systems have three basic cockpit indicators: cabin altitude, cabin rate of climb, and the pressure differential indicator.

- The **cabin altitude gauge** measures the actual cabin altitude.
- The **cabin rate of climb indicator** shows the rate at which the cabin is climbing or descending (i.e. losing or gaining pressure). A typical maximum climb rate is **500 ft/min** and the maximum descent rate is **300 ft/min**; control can be automatic or manual depending on aircraft type.
- The **differential pressure gauge** reads the difference between cabin and outside air pressures, normally controlled and maintained to a structural limitation around **7 psid** (depending on aircraft type and operating ceiling). The differential pressure gauge may be combined with the cabin altitude gauge.

## 4.12 Safety and Warning Devices

To ground test the pressurisation system with engines running, at least **three** people are required inside the aircraft for safety reasons. Both air conditioning and pressurisation systems use safety and warning devices to protect against catastrophic failures; some protection devices may be inhibited during landing or take-off where extra distractions could be unsafe for the crew. Main air conditioning concerns are overheating of packs and extraction/ventilation fans, plus hot air leaks from ducting that could damage surrounding structure.

### 4.12.1 Overheating

Most pack systems are protected by a **thermal switch** downstream of the pack outlet: if the outlet temperature reaches a predetermined figure, the switch operates, shutting the pack valves and sending a warning to the cockpit central warning panel (CWP) with caution/warning lights, aural chimes, and a fault light on the pack selector switch. Once the system has cooled sufficiently, the crew may reselect the system; if the overheat was caused by an automatic temperature control fault, the pilot may control the system manually. Extraction/ventilation fans are protected similarly, and may also be protected from over- or under-speeding via speed sensors that signal a fault to the CWP.

### 4.12.2 Duct Hot Air Leakage

Any ducting with joints is liable to leak under abnormal conditions. A duct protection system includes **fire-wire elements** around hot zones such as engine air bleeds, air conditioning packs and APUs. The sensing elements are **thermistor** type: as temperature around the wire increases, resistance decreases until an electrical circuit is made, sending a warning to the CWP. The leaking duct may be isolated automatically or require pilot action to close the air valves; the faulty system then remains out of use.

### 4.12.3 Excess Cabin Altitude

If cabin altitude were allowed to increase unchecked, crew and passengers could unknowingly suffer the effects of **hypoxia**. Most aircraft give a warning on the CWP, with associated audio and visual warnings, when cabin altitude reaches **10,000 ft**.

### 4.12.4 Smoke Detection

Smoke detectors may be fitted in the cabin, avionics bay and cargo areas to monitor systems that may generate smoke on overheating or catch fire. Detectors send a signal to the CWP with associated lights and audio warnings, and may automatically switch on extractor fans to remove smoke overboard away from the cabin and cockpit. The pilot may have a switch or control lever to operate a valve isolating the cockpit air conditioning ducting from the rest of the aircraft, to prevent smoke reaching the cockpit.
        $cnt2$,
        4
    ) RETURNING id INTO s4_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M11B.3 Fuselage, Wings, Stabilisers and Nacelles (13 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s3_id, 'What are the two main types of construction found in the majority of modern aircraft fuselage design?',
     '[{"id":"a","text":"The truss and the stressed skin type","correct":true},{"id":"b","text":"The monocoque and the geodetic type","correct":false},{"id":"c","text":"The riveted and the bonded type","correct":false}]',
     '{"B1"}'),

    (s3_id, 'In the Pratt Truss fuselage, the struts and diagonal wires respectively carry:',
     '[{"id":"a","text":"Struts in tension, wires in compression","correct":false},{"id":"b","text":"Struts in compression, wires in tension","correct":true},{"id":"c","text":"Both struts and wires in compression only","correct":false}]',
     '{"B1"}'),

    (s3_id, 'In a Warren Truss fuselage, the diagonal members separating the longerons carry:',
     '[{"id":"a","text":"Only compressive loads","correct":false},{"id":"b","text":"Only tensile loads","correct":false},{"id":"c","text":"Both compressive and tensile loads","correct":true}]',
     '{"B1"}'),

    (s3_id, 'A semi-monocoque fuselage structure differs from a pure monocoque structure in that it has:',
     '[{"id":"a","text":"No skin carrying any load at all","correct":false},{"id":"b","text":"An internal structure of frames and stringers supporting the load-carrying skin","correct":true},{"id":"c","text":"An external bracing of wires and struts","correct":false}]',
     '{"B1"}'),

    (s3_id, 'Approximately what pressure differential could 1950s piston-engined aircraft cabins sustain, compared with modern aircraft?',
     '[{"id":"a","text":"About 2 psi maximum, versus 8 to 10 psi for modern aircraft","correct":true},{"id":"b","text":"About 15 psi maximum, versus 2 to 4 psi for modern aircraft","correct":false},{"id":"c","text":"About 8 psi maximum, versus 2 to 4 psi for modern aircraft","correct":false}]',
     '{"B1"}'),

    (s3_id, 'At points where control tubes and cables pass in and out of a pressurised fuselage hull, an airtight yet moveable seal is achieved using:',
     '[{"id":"a","text":"Rigid welded joints","correct":false},{"id":"b","text":"Flexible bellows","correct":true},{"id":"c","text":"Pre-formed rubber door seals","correct":false}]',
     '{"B1"}'),

    (s3_id, 'Aircraft seats, correctly strapped, must be able to survive a sudden stop of over what value without the floor mountings failing?',
     '[{"id":"a","text":"5g","correct":false},{"id":"b","text":"20g","correct":true},{"id":"c","text":"50g","correct":false}]',
     '{"B1"}'),

    (s3_id, 'A door fitted so that it opens inwards and "plugs" the aperture when closed, held in place partly by cabin pressure, is a safety feature found on:',
     '[{"id":"a","text":"Non-pressurised aircraft only","correct":false},{"id":"b","text":"Pressurised aircraft cabin doors","correct":true},{"id":"c","text":"Cargo bay ball-mats","correct":false}]',
     '{"B1"}'),

    (s3_id, 'Flight deck windscreens on pressurised aircraft are typically constructed from:',
     '[{"id":"a","text":"A single pane of toughened acrylic","correct":false},{"id":"b","text":"A toughened sandwich of glass/plastic/glass","correct":true},{"id":"c","text":"Laminated mylar sheet","correct":false}]',
     '{"B1"}'),

    (s3_id, 'Passenger cabin acrylic windows are typically constructed with two layers and a space between them so that:',
     '[{"id":"a","text":"Both layers must fail simultaneously before any pressurisation load is lost","correct":false},{"id":"b","text":"If one layer fails, the other will carry the pressurisation loads (fail safe)","correct":true},{"id":"c","text":"Noise reduction is achieved with no safety benefit","correct":false}]',
     '{"B1"}'),

    (s3_id, 'The first genuine, fully cantilever wings with no external bracing entered production around:',
     '[{"id":"a","text":"The early 1900s","correct":false},{"id":"b","text":"The mid-1930s","correct":true},{"id":"c","text":"The late 1960s","correct":false}]',
     '{"B1"}'),

    (s3_id, 'In an integral wing fuel tank, the main advantage is that it provides:',
     '[{"id":"a","text":"Maximum fuel capacity for the minimum amount of weight","correct":true},{"id":"b","text":"The easiest tank to remove for maintenance","correct":false},{"id":"c","text":"Complete immunity from the need for sealing","correct":false}]',
     '{"B1"}'),

    (s3_id, 'On flying control surfaces such as ailerons, elevators and rudders, calibrated weights added to the leading edge to prevent flutter are known as:',
     '[{"id":"a","text":"Trim tabs","correct":false},{"id":"b","text":"Mass balance weights","correct":true},{"id":"c","text":"Aerodynamic balance panels","correct":false}]',
     '{"B1"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M11B.4 Air Conditioning and Cabin Pressurisation (20 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s4_id, 'Passenger carrying aircraft need an air conditioning and pressurisation system when operating above approximately:',
     '[{"id":"a","text":"1,000 ft","correct":false},{"id":"b","text":"10,000 ft","correct":true},{"id":"c","text":"25,000 ft","correct":false}]',
     '{"B1"}'),

    (s4_id, 'Cabin temperature in a typical air conditioning system is normally maintained between:',
     '[{"id":"a","text":"0 and 10 degrees Celsius","correct":false},{"id":"b","text":"15 and 30 degrees Celsius","correct":true},{"id":"c","text":"30 and 45 degrees Celsius","correct":false}]',
     '{"B1"}'),

    (s4_id, 'What is the most common method of obtaining fresh air supply for a modern aircraft air conditioning system?',
     '[{"id":"a","text":"Engine bleed air (compression) tapped from the main engine compressor stages","correct":true},{"id":"b","text":"A dedicated onboard oxygen generator","correct":false},{"id":"c","text":"Cabin re-circulation fans alone, with no external air source","correct":false}]',
     '{"B1"}'),

    (s4_id, 'The APU provides an independent means of air conditioning and pressurisation using which principle?',
     '[{"id":"a","text":"Vapour cycle refrigeration only","correct":false},{"id":"b","text":"The engine bleed air principle","correct":true},{"id":"c","text":"Ram air only, with no compression","correct":false}]',
     '{"B1"}'),

    (s4_id, 'On a pressurised aircraft, a ram air system is primarily used as:',
     '[{"id":"a","text":"The sole normal air supply at all altitudes","correct":false},{"id":"b","text":"A means of emergency ventilation after loss of the main system","correct":true},{"id":"c","text":"A dedicated fuel cooling system","correct":false}]',
     '{"B1"}'),

    (s4_id, 'Air tapped from the engine compressor for bleed air can reach a temperature in excess of approximately what value, requiring it to be cooled before entering the cabin?',
     '[{"id":"a","text":"100 degrees Celsius","correct":false},{"id":"b","text":"300 degrees Celsius","correct":true},{"id":"c","text":"600 degrees Celsius","correct":false}]',
     '{"B1"}'),

    (s4_id, 'The three basic principles relied upon by air cycle cooling are surface heat exchange, energy conversion and:',
     '[{"id":"a","text":"Expansion","correct":true},{"id":"b","text":"Combustion","correct":false},{"id":"c","text":"Condensation","correct":false}]',
     '{"B1"}'),

    (s4_id, 'A heat exchanger positioned between the compressor and turbine stages of a turbo-compressor Cold Air Unit is known as the:',
     '[{"id":"a","text":"Primary heat exchanger (pre-cooler)","correct":false},{"id":"b","text":"Secondary heat exchanger (inter-cooler)","correct":true},{"id":"c","text":"Tertiary heat exchanger","correct":false}]',
     '{"B1"}'),

    (s4_id, 'A major advantage of the turbo-fan type Cold Air Unit over the turbo-compressor and brake-turbine types is that it:',
     '[{"id":"a","text":"Requires no lubrication whatsoever","correct":false},{"id":"b","text":"Can be used on the ground with the aircraft stationary and engines running, without relying solely on ram air","correct":true},{"id":"c","text":"Eliminates the need for a pre-cooler entirely","correct":false}]',
     '{"B1"}'),

    (s4_id, 'ACM/CAU compressor and turbine wheels typically rotate at speeds often in excess of:',
     '[{"id":"a","text":"8,000 rpm","correct":false},{"id":"b","text":"80,000 rpm","correct":true},{"id":"c","text":"800,000 rpm","correct":false}]',
     '{"B1"}'),

    (s4_id, 'In a vapour cycle cooling system, the refrigerant absorbs heat and cools the charge air by:',
     '[{"id":"a","text":"Changing from a liquid to a gas (vaporisation)","correct":true},{"id":"b","text":"Being compressed into a solid","correct":false},{"id":"c","text":"Combustion within the evaporator","correct":false}]',
     '{"B1"}'),

    (s4_id, 'Some aircraft use carbon monoxide detectors, filled with brightly coloured crystals that turn black on exposure, to guard against contamination in which type of heating system?',
     '[{"id":"a","text":"Vapour cycle cooling systems","correct":false},{"id":"b","text":"Exhaust heating systems","correct":true},{"id":"c","text":"Electronic pressurisation control systems","correct":false}]',
     '{"B1"}'),

    (s4_id, 'Humidity control in an air conditioning system can be achieved by which two methods described in the text?',
     '[{"id":"a","text":"Water separation and water infiltration","correct":true},{"id":"b","text":"Vapour compression and freeze-drying","correct":false},{"id":"c","text":"Ram air cooling and bleed air heating","correct":false}]',
     '{"B1"}'),

    (s4_id, 'The three types of water separator described are the coalescer/diffuser type, the swirl vane type and the:',
     '[{"id":"a","text":"Coalescer/bag type","correct":true},{"id":"b","text":"Thermal expansion type","correct":false},{"id":"c","text":"Centrifugal jet pump type","correct":false}]',
     '{"B1"}'),

    (s4_id, 'The minimum quantity of fresh air legally required to be supplied to each person on board a pressurised aircraft is at least:',
     '[{"id":"a","text":"0.5 lb/minute","correct":true},{"id":"b","text":"5 lb/minute","correct":false},{"id":"c","text":"50 lb/minute","correct":false}]',
     '{"B1"}'),

    (s4_id, 'In the isobaric mode of cabin pressurisation control:',
     '[{"id":"a","text":"Cabin altitude remains the same as flight altitude","correct":false},{"id":"b","text":"Cabin altitude remains constant as flight altitude changes","correct":true},{"id":"c","text":"Cabin pressure is dumped to atmosphere at all times","correct":false}]',
     '{"B1"}'),

    (s4_id, 'An inward (negative) pressure relief valve on a pressurised aircraft typically opens to equalise pressure if the inward differential exceeds approximately:',
     '[{"id":"a","text":"0.5 psid","correct":true},{"id":"b","text":"5 psid","correct":false},{"id":"c","text":"15 psid","correct":false}]',
     '{"B1"}'),

    (s4_id, 'On the flight deck control panel of an electronic pressurisation control system, the mode where a cabin altitude setting must be made for each desired cabin pressure change, after which the system controls it automatically, is called:',
     '[{"id":"a","text":"Fully automatic (Auto) mode","correct":false},{"id":"b","text":"Semi-automatic (Standby) mode","correct":true},{"id":"c","text":"Manual mode","correct":false}]',
     '{"B1"}'),

    (s4_id, 'A typical maximum cabin rate of climb, as indicated on the cabin rate of climb indicator, is approximately:',
     '[{"id":"a","text":"50 ft per minute","correct":false},{"id":"b","text":"500 ft per minute","correct":true},{"id":"c","text":"5,000 ft per minute","correct":false}]',
     '{"B1"}'),

    (s4_id, 'Most aircraft give a warning on the cockpit central warning panel with associated audio and visual warnings if cabin altitude is allowed to reach:',
     '[{"id":"a","text":"2,000 ft","correct":false},{"id":"b","text":"10,000 ft","correct":true},{"id":"c","text":"25,000 ft","correct":false}]',
     '{"B1"}');

END $$;
