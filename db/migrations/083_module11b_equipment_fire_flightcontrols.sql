-- Module 11B: Aeroplane Structures and Systems (Piston Aeroplanes, B1) — Equipment and Furnishings, Fire Protection, Flight Control Systems
-- Source: EASA Part-66 Module 11B official textbook (IKAROS Aviation Training Centre, IK01, Issue Oct.2012)

DO $$
DECLARE
    m11_id INT;
    s9_id  INT;
    s10_id INT;
    s11_id INT;
BEGIN
    SELECT id INTO m11_id FROM easa_modules WHERE code = 'M11';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M11B.9') THEN
        RAISE NOTICE 'M11B.9-M11B.11 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 11B.9: Equipment and Furnishings
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m11_id, 'M11B.9', 'Equipment and Furnishings',
        $cnt$
# Equipment and Furnishings

## Emergency Equipment Requirements

Every aircraft carries some form of emergency equipment. This can vary from a simple seat belt and a fire extinguisher on a micro-light aircraft, to a large list of equipment fitted to a commercial airliner — a small aircraft may carry over **ten different types of safety equipment**. Typical items include seat belts, lifejackets, first-aid kits, fire extinguishers, oxygen sets and torches.

The types of safety equipment that must be carried on any specific flight are laid down in the **JARs**. **JAR 25 — Large Aeroplanes** details the requirements for the design and performance of safety and other equipment, including the size of access doors and emergency exits and the numbers required for each size of aircraft, the width of cabin aisles, and the number of seats abreast.

Some items may seem of little use, but each has a specific emergency purpose:
- The large **axe** carried on passenger aircraft allows trapped passengers and crew to cut their own way out of the cabin
- **Smoke hoods** permit cabin staff to help passengers leave the aircraft even if the cabin is full of smoke
- **Portable oxygen** is used for passengers feeling ill, in addition to the 'drop-out' masks which activate if cabin pressurisation has failed

### Life Jackets

Life jackets use a **CO₂ cylinder** to give rapid inflation once the passenger is outside the aircraft. Buoyancy is then controlled by a mouthpiece for further inflation. Life jacket maintenance checks include:
- Inspected at **6-monthly intervals** for condition and inadvertent operation
- The **water-activated light** is checked for insulation resistance across its terminals, which should be **at least 1 Megohm**
- Inadvertent operation of the light is checked by signs of chemical reaction
- The **CO₂ bottle** is checked by weighing it on laboratory scales

## Seats, Harnesses and Belts

All seat belts must restrain the passenger (or crew) in their seat, even during a crash landing. The seat to which the belt is attached must hold securely in the seat rails even during the high 'g' loadings experienced in an emergency landing. **Seat rails** are a continuous extrusion with circular cut-outs, allowing seats to be attached and locked at different seat spacing (**pitch**), usually in **one inch or 25 mm increments**.

Aircraft seats divide into three main groups:
- **Passenger seats** — usually part of multiple units, manufactured from aluminium alloy tube, riveted and welded to form the frame with supporting legs, braces, reclining seat backs and integral tables. Seats and rails are classed as **primary structure**.
- **Flight attendant seats** — more utilitarian, mounted on seat tracks, the aircraft wall structure, or (as on the ATR-72) a sliding assembly that stows away without taking up passenger space. They are normally fitted with a **full harness seat belt**, compared with the 'lap strap' assemblies for passengers. Harnesses should only be cleaned with **acid-free soap and water**.
- **Flight deck crew seats** — must be the most comfortable on the aircraft, since airline regulations require a full crew in the cockpit at all times. Flight deck seats have many axes of movement (height, reach, backrest tilt, lumbar support, arm rest height), often powered by electrical actuators, and will have at least a **four-point harness**, and in many cases a **five-point harness** with a lower crotch strap.

An **inertia reel system** locks the harness if a rapid deceleration of the aircraft occurs. In the locked position, backward motion is still possible but forward motion is prevented.

## Cabin Layouts

The cabin layout is a compromise between the builder/designer, who wants to fit as many paying passengers as possible, and the airworthiness authorities, who limit the maximum number of passengers. This maximum is the number that can be evacuated from inside the cabin, through **50% of available exits, in 90 seconds**. This ruling dictates the number and size of exits, the width of the aisles and the number of seats.

**Galleys** can be found in various places in the cabin — front, rear, or occasionally centrally, where they can divide different classes of passenger. They have their own power supply for heating, lighting and ventilation. For maintenance, galley units are removable, as are all other dividing partitions, overhead units and PSUs. Galleys are also supplied with connections to both fresh (**potable**) water and 'grey' (**waste**) water. Some galleys are fitted in the under-floor areas of larger aircraft, requiring lifts between floors.

## Cabin Furnishings

All furnishings must be easily removable, not only to allow engineers access during deep maintenance, but also to permit items to be changed at irregular intervals due to "fair wear and tear" — worn carpets, torn seat covers, cracked plastic cabin wall skins, ceiling panels and damaged overhead bin doors. These items are attached by 'quick release' fittings of varying types.

## Cabin Entertainment

Cabin entertainment varies greatly depending on aircraft type, age and operating airline — from 'music' played over the cabin P.A. system on smaller aircraft, through to films, navigation information and cabin safety briefings displayed on multiple television monitors. To reduce weight, entertainment systems can use **multiplexing** to transmit different media down a single cable. Some modern aircraft fit higher-class seats with individual viewing screens (attached to the seat back in front, or seat-arm mounted), offering video selection, computer games, musical videos with stereo headphones and, in business class, access to a satellite telephone.

## Galley Installations

Galleys must be modular units so they can be removed for maintenance or in case of technical problems. Most galley units have a supply of electricity and potable water, and facilities for the disposal of 'grey' water overboard. As most catering uses pre-prepared food, standard-sized food trolleys and containers are given stowage space in the galley units, which can keep warm, heat up and chill food and drinks as required.

## Cargo Handling and Retention Equipment

In most commercial aircraft, cargo is carried below the cabin floor in dedicated **fire-resistant compartments**, which can be air-conditioned if animals are carried. Smaller aircraft, such as the Piper Navajo, carry cargo within the cabin space since the underfloor space is limited, and such aircraft can have their cabin converted into cargo.

Cargo containers are normally raised to the cargo bay floor level by a **hydraulically operated deck**, whose load area is covered with free-running rollers or balls. Containers are then manually pushed into the door area, supported by a **ball mat or ball transfer panel** — low-friction devices permitting easy container movement. Each ball unit consists of a self-lubricated spring-loaded steel ball riding on smaller ball bearings in a cup-shaped housing; a **wiper ring** surrounding the ball prevents the ingress of dirt into the mechanism.

## Cargo Retention Equipment

Once loaded, cargo must be restrained to prevent movement during take-off, in turbulent flight and during landing (especially hard braking):
- **LD containers** have positive latches which attach the containers directly to the aircraft structure
- 'Loose' baggage in cargo holds is usually restrained by **nets**, which can be locked into the floor or walls of the bay
- On **pallets**, cases and bags are pre-loaded, covered by waterproof sheet and restraint netting, and the pallets are clamped down onto the cargo bay floor

## Air Stairs

The term **airstairs** describes passenger steps integral to the aircraft structure, independent of normal passenger steps and jetways at large airports. They are often fitted to aircraft operated into poorly equipped airports on a day-to-day basis. Airstairs can be manually or power operated — from a simple set of stairs set into the back of the entrance door, to a fully powered, folding set of steps extended and retracted by push buttons on larger aircraft.
        $cnt$,
        9
    ) RETURNING id INTO s9_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 11B.10: Fire Protection
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m11_id, 'M11B.10', 'Fire Protection',
        $cnt2$
# Fire Protection

## Introduction

Fire is the most dangerous threat to the safety of an aircraft, and is associated with external areas near the main engines and the APU, if fitted. Other external hot spots are the landing gear bays, where heat from brake units could affect surrounding equipment and wiring when the gears are retracted. Overheating of structure, equipment and wiring from very hot leaking engine compressor bleed air pipes must also be catered for. Fire from internal areas such as the passenger, flight deck and toilet compartments, as well as cargo, air-conditioning and electrical/electronic equipment bays, also requires protection.

Ideally, a fire protection system will include as many as possible of the following features:
- Rapid warning of fire/overheat and its accurate location
- Must not cause false warnings
- Continuous warning for the duration of the fire/overheat
- Confirmation that the fire has been extinguished
- Indication that the fire has re-ignited
- A means of testing the system from the flight deck
- Detectors proof against oil, water, vibration and high temperatures
- Detectors that are easily accessible throughout the aircraft
- Detectors and extinguishers wired electrically or powered from emergency electrical buses
- Adequate visual and aural indication on the flight deck and vital areas of the aircraft
- Separate warnings for each engine and specific areas as determined by the aircraft manufacturer

The Fire (and Overheat) Protection system is normally split into two main subsystems: **Fire/Overheat Detection and Warning**, and **Fire Extinguishing**.

## Fire/Overheat Detection and Warning

Fire/overheat detectors divide into two main groups: **Unit (Spot) Type** and **Continuous Loop (Firewire) Type**.

### Unit (Spot) Type

Fitted at various strategic points within the fire/overheat zone, this type takes the form of a thermally activated switch. Units are electrically connected in **parallel** with each other and in **series** with the audio/visual warning system, so that any switch can operate the warning even if others have failed.

- Some Unit detectors use a pair of **bi-metallic contacts** that close when heated and open when cooled
- The majority have a thin casing surrounding two conventional electrical contacts, normally set apart; when heated the casing expands and pulls the contacts together, completing the warning circuit — this is the so-called **'High Speed Resetting Switch' (HSRS)**, valued for its sensitivity and fast reaction time to both initiate and cancel the warning
- Spot detectors are used mainly to detect high-temperature leaks from **bleed air ducts**, normally positioned at pipe-to-pipe connections

### Continuous Loop (Fire Wire) Detectors

This method gives more complete coverage of a fire hazard area than any spot-type detector. The continuous loop uses the principle of **capacitance and resistance** to indicate a rise in temperature at any point along the loop. The commonest type has a stainless steel or Inconel outer tube, with an inner pure nickel wire surrounded by ceramic beads wetted by a eutectic salt. A rise in temperature causes a sharp **fall in electrical resistance** and a **rise in capacitance**; the detection unit senses this anywhere along the wire and generates an overheat warning. The firewire loop can cover a complete powerplant within its cowling, and resets the control box automatically when temperature falls below the limit.

Firewire elements are attached to the airframe structure with quick-release clips approximately **6 inches apart** and **4 inches from the end fittings**, supported in clips with a rubber grommet to prevent rubbing and damp out vibration. Care is taken to eliminate strain on the element, as excessive bending could work-harden the capillary.

### Dual Loop System

Most aircraft use a dual loop system, with each sensing circuit having two independent loops, **A** and **B**. When the loop selector switch is set to **BOTH**, both loops must detect a fire condition before the warning activates; if only one loop detects a fire, the associated loop fault light illuminates. If the selector is switched to a single loop, full fire warnings activate if that loop alone senses a fire. Pressing the loop test button simulates a fire condition by earthing the inner electrode, functionally checking the system and the continuity of the loop.

### Pressure-Type Sensor

This system also uses a continuous loop, made from sealed stainless steel tube containing an element that **absorbs gas when cold but releases it when heated**. The tube connects to a pressure switch that closes when pressure reaches a pre-determined level. The commonest make (**Systron-Donner**) uses a titanium centre wire and the expansion of both **helium and hydrogen** gas to give two-stage warnings: a localised fire releases hydrogen, closing the switch for a fire warning, while a lower-level rise over a larger area expands the helium to activate an overheat warning.

## Fire Zones

On light aircraft, the only fire protection is a stainless steel or titanium **bulkhead (firewall)** dividing the engine bay from the cabin. Larger aircraft isolate the complete engine cowlings from the airframe/wing assemblies, and cowlings can be divided into a number of **'fire zones'**, each usually with its own warning and extinguishing system. Light aircraft with piston engines, due to the high airflow through the bay, typically have no fire protection and depend on isolating the fuel supply to the engine to put out a fire.

### Hot and Cool Zones

Engines are usually split into **hot** and **cool** zones. The hot zone comprises the combustion chamber, turbines and exhaust areas; the cool zone comprises the intake, compressors and accessory drives.

### Fireproof Bulkheads

Fireproof bulkheads prevent fire from spreading to other areas. Auxiliary power units and tail-mounted engines are normally contained within such bulkhead compartments, separating them from the rest of the airframe. Engine pylons also contain a firewall separating the engine from the wing. These bulkheads are made from **titanium or stainless steel**, with all joints sealed using fireproof sealants.

### Engine Fire Prevention

Techniques used to help prevent fire around engines include the use of flameproof or flame-resistant materials, bonding strips to prevent arcing, drainage of spilt fuel/oil, and efficient cooling. All pipes carrying fuel, oil or hydraulic fluid are made fire resistant, and all electrical components and connections are made flameproof. A fire starting in any zone must be contained within that zone. Engine cowlings form a natural container but are usually light alloy and would not contain a ground fire for long; in flight, cooling airflow through the cowlings renders them fireproof. Fireproof bulkheads and any cowling with no cooling airflow are usually made from titanium or stainless steel.

### Cockpit and Cabin Interiors

All wool, cotton and synthetic fabrics used in interior trim are treated to render them flame resistant. Tests have shown that although the foam used in seat cushions is flammable, if covered with a flame-resistant fabric there is little danger of fire from accidental contact with, for example, a cigarette. Fire protection for the aircraft interior is usually provided by hand-held extinguishers (**Water, CO₂ and Dry Powder**); each type is best used on one kind of fire but may be used on others — it is best to be sure which is safe to use on which type of fire.

## Smoke Detection

A smoke detection system monitors certain areas — such as cargo and baggage compartments and toilets — for the presence of smoke, which could indicate a fire condition. It is used where the anticipated fire type is expected to generate substantial smoke before temperature changes are sufficient to actuate a heat/fire detection system.

### Carbon Monoxide Detectors

The presence of **Carbon Monoxide (CO)**, or **Nitrous Oxides (N₂O)**, is dangerous to flight crew and passengers and may indicate a fire condition as a by-product of combustion. Carbon Monoxide is very dangerous — a minute amount (approximately **2 parts in 10,000**) causes loss of attention and headaches. It is colourless, odourless, tasteless and a non-irritant. CO detectors, used in cabin and cockpit areas, are usually a small card with a transparent pocket containing silica gel crystals treated with a chemical that changes colour to **green or black** when exposed to carbon monoxide.

### Photoelectric Smoke Detectors

Air from the monitored compartment is drawn through the detector chamber, where a **light beam** is shone on it. A photoelectric cell senses light refracted by smoke particles, installed in a bridge circuit measuring the resulting current change. With no smoke, no light is refracted and the photocell produces a reference current; when smoke is present, refracted light changes the photocell's conductivity, and this amplified current change initiates a smoke warning signal.

### Ionisation Type Smoke Detector

A small amount of **radioactive material** mounted in the detector chamber bombards oxygen and nitrogen molecules in the air, ionising it so a reference current flows across the chamber. Smoke flowing through the chamber changes the level of ionisation and **decreases the current**; when the current falls to a specific level, the external circuit initiates a smoke warning signal.

### Flame Detectors

This system uses a photoelectric cell to detect a sharp rise in light, such as that from a flame in a closed bay.

## Fire Extinguishing

There are a variety of aircraft and ramp extinguishing agents; their use depends on variables such as location, proximity to personnel, environment and possible sources of fire. There are integral extinguishing systems on board the aircraft as well as hand-held extinguishers.

### Extinguishing System

An integral fire extinguisher system uses a number of pressurised bottles containing extinguishant, each with **two explosive cartridges (squibs)** that can be fired from the flight deck. Each bottle can feed either the port or starboard engine through a **crossfeed**, with extinguishant fed through pipelines and valves to outlet nozzles and tubes. Fixed systems may also protect landing gear wheel bays and baggage compartments, independently of the engine system, either fully automatic or requiring aircrew initiation. On multi-engine aircraft there may be one bottle per engine, or one bottle feeding two engines, with a facility for cross-feeding to another engine if needed. Two bottles can give either two 'shots' to a single engine, or one 'shot' each to either engine. Bottle condition is shown by a pressure gauge, or a red/green sectioned gauge (red = empty or low pressure), plus a discharge indication on the fire control panel. There may also be **pop-up indicators** to show a squib has fired, and a pressure switch giving an electrical indication when pressure drops to a pre-determined level. Each bottle has overpressure protection via a **rupture disc**, which fails if bottle pressure becomes excessive due to overheating.

### Directional Flow Control Valves (2-Way Valves)

These non-return valves are used in a crossfeed system to direct the contents of one or several extinguishers into any one engine or compartment, preventing reverse flow of extinguishant into the other bottle or engine.

### Fire Extinguishant Container

The cartridge is electrically ignited, driving a cartridge cutter into a disc that ruptures to release the extinguishant; a strainer prevents broken disc fragments from entering the distribution system. A safety plug connects via a pipeline to a red indicator disc outside the compartment: if gas pressure rises due to a compartment temperature increase, the fusible safety plug melts at a pre-determined temperature, the bottle contents discharge overboard, and the red indicator blows out. The gauge shows the pressure of extinguishant in the container.

### Toilet Compartment Systems

Small automatic units in toilet waste bins discharge themselves when a heat source is sensed at around **75°C**, melting a fusible plug that allows the contents to discharge. Most such systems give no indication to the cockpit or attendants' panel when activated; some have a visible temperature strip checked before each flight, or by cabin crew in flight.

### Warnings and Indications

Once a fire is detected in the engine bay (or monitored compartment), the firewire element sends a signal to a control unit, which sends a signal to the cockpit **CWP**, the associated power lever handle, and the fire control panel. The CWP red Fire warning caption illuminates for the affected engine/compartment, along with the master warning lights and audio warnings; the affected power lever handle and fire extinguisher handle on the overhead console also illuminate red. To activate the extinguishant, the red fire handle is pulled to arm the system, then the squib button is pressed to fire the bottle; if the fire indication remains after the first bottle is exhausted, the second squib button fires the other bottle into the same affected engine/compartment. Once discharged, an amber **DISCH** caption on the fire control panel indicates the corresponding bottle is empty.

### Hand Held (Portable) Fire Extinguishers

Every aircraft must carry portable fire extinguishers for use by cabin crew, positioned for easy crew access; amount and location depend on aircraft type and size.

- **Halon extinguishers** interrupt the chemical reaction of combustion, leave no residue, and are often used to protect valuable electrical equipment. They have a limited range, usually **4 to 6 feet**; the initial application should be made at the base of the fire, even after the flames have been extinguished.
- **Carbon Dioxide extinguishers** disperse the gas quickly and are only effective from **3 to 8 feet**. CO₂ is stored as a compressed liquid; as it expands it cools the surrounding air, often causing ice to form around the discharge "horn". They are primarily used for electrical fires in the cabin and cockpit.
- **Dry powder extinguishers** use compressed nitrogen to expel a dry powder such as sodium bicarbonate or potassium bicarbonate. They can be used on most fires but should never be used on the flight deck, due to lack of visibility and interference with electrical equipment caused by the powder.
- **Water extinguishers** are fitted on some aircraft and used to put out fires in ordinary combustibles such as wood and paper.

Hand-held extinguishers are subject to periodic maintenance, checked for weight (stamped on the neck of the bottle, indicating charged weight); if weight is below the set limit, the extinguisher must be replaced.

## System Tests

All extinguishing systems have a means of testing their serviceability, from weighing the complete cylinder off-aircraft (marked with the correct 'full' weight), to a bottle gauge with safe and low-pressure sectors marked on it. More sophisticated systems have internal pressure switches that notify the flight deck of loss of bottle pressure (or discharge) via a warning light or magnetic indicator. All bottles and squibs have a life, after which they must be removed and returned to the manufacturer for maintenance.

### Fire System Test Switch

A test switch is available for each system; when pressed, all warning lights and audio warnings are checked. If a light fails to illuminate, it normally indicates a bulb filament failure.

### Fire Wire Loop Test

A test switch on the cockpit fire panel tests each sensing element loop by checking the continuity of each circuit. If the system is serviceable, the Loop caption(s) illuminate; if not, there is a fault in the system.

### Squib-Test

A squib test button checks the continuity of the discharge heads for each fire extinguisher bottle. When pressed, a squib warning light or magnetic indicator illuminates if the system is serviceable; no illumination means a fault exists. The current used during the squib test is at a much lower value than that required to actually fire the squib.
        $cnt2$,
        10
    ) RETURNING id INTO s10_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 11B.11: Flight Control Systems
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m11_id, 'M11B.11', 'Flight Control Systems',
        $cnt3$
# Flight Control Systems

## Introduction

An aircraft is equipped with fixed and moveable surfaces, or aerofoils, which provide stability and control. Each item is designed for a specific function during aircraft operation.

## Fixed Aerofoils

The fixed aerofoils are the **wings** (main planes), the **horizontal stabiliser** (tail plane) and the **vertical stabiliser** (fin). The wings provide the lift needed to support the aircraft. The tail section, including stabilisers, elevators and rudder, is occasionally known as the **empennage**.

### Horizontal Stabiliser

Used to provide longitudinal pitch stability, usually attached to the aft fuselage. It may be mounted on top of the vertical stabiliser, at a mid-point, or below it. Conventional horizontal stabilisers are placed aft of the wing, normally set at a slightly smaller or negative angle of incidence relative to the wing chord line, giving a small downward force on the tail whose value depends on the stabiliser size and its distance from the Centre of Gravity (CG).

### T-Tail Arrangement

Places the complete stabiliser/tailplane and elevator assembly on top of the vertical stabiliser, ensuring pitch control is not affected by turbulent air from the wing, and improving rudder effectiveness due to the 'end plate effect'. A T-Tail (with rear engines) would be dangerous if the aircraft entered a **'deep stall'** — at very high angle of attack, airflow could make pitch control non-effective and may cause the engines to flame out. To prevent this, T-Tailed aircraft have a **'stick push'** system to automatically recover from excessive angles of attack. A disadvantage is a heavier empennage structure (to combat greater bending loads); an advantage is that, since the pitch moment arm is increased, the stabiliser and elevators can be made smaller and lighter. Often the complete stabiliser can be moved to provide longitudinal trim, negating the need for trim tabs.

### Vertical Stabiliser

Provides directional stability. A problem on single-engine propeller aircraft is that the propeller causes the airflow to rotate rearward, striking one side of the vertical stabiliser more than the other and producing a yawing moment. Such aircraft may have the leading edge of the stabiliser offset slightly to counter this yaw.

## Moveable Control Surfaces

Moveable control surfaces divide into **Primary** and **Secondary** controls:
- **Primary control surfaces**: elevators, rudder, ailerons, and roll spoilers (spoilers that operate in conjunction with the ailerons during roll are treated as primary in this syllabus). Used to make the aircraft follow the correct flight path and execute manoeuvres.
- **Secondary control surfaces**: trim controls (tabs), high lift devices (flaps and slats), and speed brakes and lift dumpers (additional spoilers). Used to change lift and drag characteristics, or assist the primary controls.

### Roll Control — Ailerons

Provide lateral (roll) control about the longitudinal axis, normally hinged at the trailing edge of the wing near the tip, moving in opposite directions — the up-going aileron reduces lift on its side (wing goes down), the down-going surface increases lift on the opposite side (wing rises). Large aircraft often use two sets of ailerons per wing: an inboard ('**high speed ailerons**') set near mid-span, and outboard surfaces working at low speed for maximum control during take-off and landing. At high cruising speed the outer ailerons are isolated and only the inboard set operates — allowing the outer ailerons to operate at high speed on flexible thin wings could twist the wing and produce **'aileron reversal'**. Ailerons are operated by a control wheel, control column or side-stick, and are usually operated in conjunction with the rudder and/or elevator during a turn (rarely alone). A **co-ordinated turn** occurs without slip or skid — too little bank causes the aircraft to skid outwards, too much bank causes it to slip downwards.

### Roll Control — Spoilers

Used as a primary control, spoilers (**roll spoilers**) operate asymmetrically in conjunction with aileron movement, mounted on top of the wing just inboard of the outboard ailerons. Movement of the aileron control wheel deploys each spoiler progressively upward on the up-going aileron side, via a **spoiler/aileron mixer unit**, while the spoiler on the down-going aileron side stays flush with the upper wing camber. The up-going spoiler spoils lift on the down-going wing, augmenting the effect of the up-going aileron. On some aircraft, spoilers replace ailerons completely as the sole means of roll control.

### Pitch Control — Elevators

Govern movement in pitch about the lateral axis, normally hinged on the rear spar of the horizontal stabiliser. When the control column is pushed forward, the elevators move down; the resultant upward lift force raises the tail and lowers the nose. The reverse happens when the control is pulled back.

### Pitch Control — Stabilators

A **stabilator** (or slab/all-flying tailplane) is a complete all-moving horizontal stabiliser combining the functions of the elevator and horizontal stabiliser, changing its angle of attack when the control column is moved to alter the total lift generated by the tail. A related **variable incidence stabiliser** incorporates a conventional elevator control system and is often used for pitch trim, with a powerful electric motor varying its angle of attack when trim switches are operated.

### Canards

Some early powered aircraft (e.g. the Wright Flyer) had horizontal surfaces located ahead of the wings — a **canard** or fore plane. With the tail plane at the front, the stabilising force is directed upwards, contributing to total lift and reducing drag from the lift-producing wing (whereas a conventional rear tail plane provides a small down force that the wing must overcome by producing more lift, hence more drag). A fundamental feature of canard design is that the fore plane's angle of attack (ahead of the CG) is set greater than the main wing's, ensuring the fore plane reaches its stalling angle first, producing a predictable nose drop and certain recovery, while the main wing stays safely below the stalling angle.

### Yaw Control — Rudder

A vertical control surface hinged at the rear of the fin, designed to apply yawing moments about the vertical axis, controlled by rudder pedals operated by the pilot's feet. Pushing the right pedal moves the rudder right, generating a sideways 'lifting' force to the left that turns the nose to the right. Powerful (particularly assisted) rudder systems may have their range reduced at high speed by a **speed-sensitive range limiting system**. On large transport aircraft the rudder may comprise two or more operational segments moved by different operating systems, for redundancy.

### Combined-Function Controls — Elevons and Ruddervators

On delta-wing aircraft, pitch and roll control surfaces must be fitted on the trailing edge of the wing. **Elevons** are dual-function (elevator + aileron) controls, providing both pitch and roll by moving symmetrically in pitch or asymmetrically in roll via a mixer unit. **Ruddervators** are used on aircraft with a 'V' or Butterfly tail, serving the purposes of both rudder and elevator.

## High Lift Devices

Aerodynamic lift is determined by the shape and size of the main lifting surfaces. A wing designed for optimum lift in cruise needs additional lift at low speed to keep landing speed slower than the 'clean' stalling speed — obtained from **high lift devices**, divided into:
- **Leading edge devices**: slots, slats and Krueger flaps
- **Trailing edge devices**: plain, slotted and Fowler flaps

These increase lift and reduce stalling speed, and consequently reduce landing speed (about **1.3 times the stalling speed**), since drag also increases with large trailing-edge flap deployment. Some aircraft combine ailerons with flaps so that both move downward together when trailing edge flaps extend to the landing position, acting as additional plain flaps for extra drag and lift while still providing roll control — these are called **'Droop Ailerons'** or **'Flaperons'**.

## Drag Inducing Devices

For slower, high-drag light aircraft, simply closing the throttle allows high airframe drag and the idling propeller to slow the aircraft to gliding speed. Modern low-drag airliners need dedicated **drag inducing devices**: spoilers, lift dumpers, speed brakes, and in unusual circumstances lowering the landing gear or operating in-flight thrust reversers.

### Spoilers and Lift Dumpers

Hinged panels located about mid-chord on the upper wing surface, hydraulically operated, producing large turbulence and drag when deployed, reducing lift. Spoiler panels can combine several jobs: primary roll control (as above); symmetrical, part-deployed use to slow the aircraft quickly in cruise or descend steeply without accelerating (deployment angle variable via a flight deck control lever on some aircraft). **Lift dumpers** are spoiler panels used solely to dump lift, normally deployed after landing to destroy wing lift and produce high drag, assisting the wheel brakes to stop the aircraft more effectively.

### Speed Brakes

While in-flight spoiler use may be called 'selecting the speed brakes', true **speed brakes (air brakes)** are devices solely for producing drag without any change of trim — e.g. the rear-fuselage-mounted 'clamshell-type' doors on the BAe 146 and Fokker 70/100. Unlike wing-mounted spoilers (which cause vibration/rumble felt in the cabin), aft-mounted speed brakes produce high drag at any airspeed virtually vibration-free, and leave lift completely unaffected, permitting their deployment on approach and making a go-around safer.

## Airflow Control Devices — Wing Fences

Fitted to swept-wing aircraft, total airflow over a swept wing splits into a chordwise component and a spanwise component towards the wing tip. **Wing fences** are fitted about mid-span on the leading edge, extending rearwards, to control the spanwise flow of boundary layer air over the top of the wing, straighten airflow over the ailerons (improving effectiveness), and straighten airflow nearer the tip, reducing 'spillage' from beneath the wing and thus drag.

### Saw Tooth Leading Edges

More common on military aircraft, the saw tooth or notch is a small increase in wing chord on the outer wing. The step forms an 'invisible wall' of high-velocity air that straightens the spanwise flow, functioning like a wing fence but without the extra drag and weight penalty.

### Winglets

Seen on later-generation airliners and business jets, the outboard wing is upswept to an extreme dihedral angle. Winglets work best at higher speeds, using the up-flow from below the wing to produce forward thrust (rather like a yacht sail), giving better airflow control and reducing wing drag. Winglets add weight and increase parasitic drag, but the large reduction in induced drag at the wingtip results in a significant fuel saving.

## Boundary Layer Control

The boundary layer is the layer of air adjacent to the aerofoil surface, with velocity varying from zero at the surface to the free-stream velocity at its outer extremity. At the wing leading edge the boundary layer is normally **laminar**; as air moves towards the trailing edge it becomes thicker and **turbulent**. The region where flow changes from laminar to turbulent is the **transition point**, which moves forward as airspeed increases — designers try to maintain laminar flow as far back as possible.

### Vortex Generators

Small plates or wedges projecting up from the aerofoil surface about **25 mm** (about 3 times the typical boundary layer thickness) into the free stream, shedding small vortices that mix high-energy free-stream air into the sluggish boundary layer, pushing the transition point backwards toward the trailing edge. The small drag they create is more than offset by the boundary layer drag saved; they also weaken shock waves and reduce shock drag at high speed.

### Stall Wedges

Small wedge-shaped strips mounted on the leading edge at about **one-third span**, designed to disrupt boundary layer airflow at large angles of attack approaching the stall, ensuring the airflow breaks away (stalls) at the wing root first — supplementing washout, which allows the wing root to stall first so the pilot retains roll control during the stall. At smaller angles of attack, stall wedges also produce a wing-fence-like effect, smoothing airflow over the ailerons.

### Leading Edge Devices

Leading edge droop flaps and Krueger flaps also help prevent laminar separation at the low-speed end of the range and control boundary layer air; they can be a droop snoot or permanent droop type, or adjustable in flight.

## Trim Tabs

During flight, an aircraft develops a tendency to deviate from a straight and level 'hands-off' attitude (due to fuel state, speed, load position or flap/gear selection changes). Rather than the crew applying a continuous, fatiguing correcting force, **trim tabs** are used. Trim tabs move the primary control surface aerodynamically in the opposite direction to the tab's own movement — e.g. to correct a 'nose down' condition, the elevator tab moves down, causing the elevator to move up, the tail to move down, and the nose to come up.

| Tab Type | Description |
|----------|-------------|
| **Fixed Trim Tab** | Simple sheet metal section on the trailing edge, ground-adjustable by bending, or via a ground-adjustable connecting rod; correct position found by trial and error |
| **Controllable Trim Tab** | Adjusted from the flight deck (trim-wheel, lever, switch), position shown on a flight deck indicator (trim units, left/right of neutral); actuated mechanically, electrically or hydraulically; trim is normally provided on all three axes |
| **Servo Tab** | Positioned on the trailing edge, connected directly to flight deck controls, acting as a 'power booster' — pilot effort only deflects the small tab, whose aerodynamic force moves the primary control until aerodynamic loads balance |
| **Balance Tab** | Hinged to the trailing edge of the primary surface but connected to the fixed aerofoil (not the flight deck), moving in the opposite direction to the control surface to assist its movement; a 'geared balance tab' has more than one attachment point, altering the range of deflection |
| **Anti-Balance Tab** | Operates similarly to a balance tab but with reversed connection, so the tab moves in the same direction as the primary control surface, adding to pilot effort (loading) to provide 'feel' and prevent over-stressing the airframe |
| **Spring Tab** | Connected via a torque rod (spring box); at low speed the torque tube rigidity moves the tab with the primary control (no assistance); at higher speed increasing air loads cause the torque tube to twist, deflecting the tab and providing progressively increasing aerodynamic assistance as speed increases |

Note: aircraft with hydraulic fully powered (**irreversible**) controls do not have trim tabs, since a tab would be aerodynamically ineffective — trimming is instead achieved by moving the primary control surface to a new neutral datum. A balance tab's function can also be combined with a trim tab by adjusting the connecting rod length from the flight deck (usually via a linear actuator), termed a **trim/balance tab**.

## Mass Balance

All aircraft structures distort under load and, being elastic, spring back when the load is removed. Since a control surface is hinged near its leading edge, its centre of gravity lies behind the hinge — more weight is aft of the hinge line than forward of it. If an air load distorts the wing upward, the aileron may lag and distort downward, producing an extra upward aerodynamic force that pushes the wing up further; the wing then springs back, the aileron lags upward, forcing the wing down further than elastic recoil alone — the cycle repeats as a high-speed oscillation called **flutter**.

Flutter can be prevented by moving the control surface's centre of gravity in line with, or slightly ahead of, the hinge line — normally achieved by adding high-density weights (typically **lead, depleted uranium or tungsten**) within the leading edge of the surface or externally ahead of the hinge line. This procedure is called **mass balancing** of the controls.

### Control Surface Mass Balance — Maintenance

Primary control surfaces are mass balanced to prevent flutter; trim tabs are rarely mass balanced, relying instead on their low mass. Backlash in a tab operating system must be kept to a minimum to reduce the possibility of flutter — in the absence of manufacturer data, the free play at the trailing edge of the tab **should not exceed 2.5% of the average chord of the tab**. If a control surface is repaired or repainted, mass balance must be checked (and adjusted if necessary) in accordance with the maintenance manual.

**Worked mass-balance repair moment example:**
- L = distance from hinge line to centre of repair (inches)
- W = weight of additional material (lb)
- Moment of repair = **W × L** lb·in

The weight of any material removed must be subtracted from the total weight of new material fitted. If the repair allowance is exceeded, the control surface must be removed and rebalanced, after which the original repair allowance is again permissible.

**Typical rebalancing procedure** (e.g. an elevator): the elevator is removed, supported with the hinge line horizontal and pivoted at the outer hinges to move freely; it must be painted to final finish and fully complete (tabs, rods, inspection covers fitted); with the chord line horizontal, the elevator must be **trailing-edge heavy**; a spring balance is attached at a specified distance from the hinge line (e.g. 22 inches) and, with the chord line horizontal, the spring balance reading must not exceed a specified amount (e.g. 10 oz). Only the minimum number of balance weights needed is added, by a specified method (e.g. an adjustable weight with added washers). Paint stripping to bare metal and repainting to the original standard may have no effect on mass balance, but each additional coat of paint reduces the repair allowance by a specific amount — all such painting must be recorded, and if the allowance is exceeded the surface must be rebalanced.

## Control Surface Bias

When a control surface is deliberately set away from the true neutral position, it is said to have a **bias** — for example, a single-propeller aircraft with a tendency to roll opposite to engine torque may have its ailerons offset (one slightly up, one down) to counteract this. Once the aircraft flies level with the bias set, the cabin trim gauge is then set to read zero.

## Aerodynamic Balance

To overcome high stick forces on larger, faster aircraft, the control surfaces themselves are used to lighten the pilot's forces — termed **Aerodynamic Balancing**, achieved principally by: **horn balance**, **inset hinge**, and **pressure balancing**.

- **Horn Balance**: a small part of the primary control surface ahead of the hinge projects into the airflow when the control is deflected. Airflow on this side assists the movement in the desired direction, opposing the air loads aft of the hinge that would otherwise push the surface back toward neutral (making controls heavy). Correct proportioning of balance area (forward of hinge) to control area (aft of hinge) makes control loads more manageable.
- **Inset Hinge**: similar effect to horn balance, but instead of a forward projection at one or both ends, the hinges are set back so the area forward of the hinge line (which projects into the airflow when deflected) is spread evenly along the whole surface length.
- **Balance Panels**: fitted between the leading edge of the aileron (ahead of the hinge) and the rear face of the wing. When the aileron deflects, high-velocity, low-pressure air passing over one gap decreases pressure under/above the balance panel and pulls it accordingly, assisting the pilot; the force is proportional to airspeed and control surface deflection.

## Gust Locks and Dampers

Aircraft are equipped with gust locks or gust dampers to protect primary flight controls and adjacent structure from damage when wind gusts swing control surfaces onto their stops while parked.

- **Gust Locks** hold control surfaces in neutral when parked in gusty conditions, engaged/disengaged by a lever (usually on the central console) operating a plunger that engages a control quadrant or a notch in a cable tension regulator. Gust locks incorporate a means of preventing take-off with the locks engaged.
- **Gust Dampers** are usually attached to the rear spar of the main surface and the front spar of the control surface, consisting of a body with an equal-area piston and ram and a spring-loaded accumulator reservoir (accommodating fluid volume changes from temperature variation). A restricting valve links each end of the ram body, progressively increasing restriction to fluid flow and controlling the rate of movement of the control surface.

## Control Stops

The range of movement of any control surface is calculated to give sufficient control effect without overstressing the surface or airframe, limited by mechanical stops fitted on or near the cabin controls and/or on or near the control surface. Cable-operated systems usually have two sets of stops: **Primary stops**, positioned adjacent to the control surface (first to make contact, setting the range of travel), and **Secondary stops**, fitted at the control cabin end to limit pilot's control movement (with specified clearance when primary stops contact). Push-pull operated systems have the primary stops at the control cabin end, with a small clearance specified at the secondary stops.

## Flying Control System Rigging

Rigging is carried out: after manufacture; when stated in the maintenance schedule; when a system component is changed; after a reported flying fault; and sometimes after a heavy landing or flight through turbulence. Procedures vary depending on whether controls are manually or power operated, and whether operated by cable, push-pull rods, or fly-by-wire. The **AMM Chapter 27** gives the proper rigging procedure (referring where necessary to Chapter 20, Standard Practices).

**General rigging procedure:**
1. Refer to the AMM
2. Set the control system to neutral
3. Check cable tensions
4. Do a sense of movement check
5. Do a freedom of movement check (static friction check)
6. Do a range of movement check
7. Do a loose article check
8. Do a duplicate inspection

Preparatory work includes jacking and levelling the aircraft to the rigging position; the aircraft temperature must usually be stable (within **±3°C** along the length of the cable) for at least one hour before starting; flaps may need rigging before the aileron system; hydraulic and electrical power is needed for power controls; warning notices are placed, personnel kept clear, circuits tripped and labelled, and hydraulic accumulator pressure released; drive shaft joints are marked before disconnection to ensure correct realignment.

**Setting to neutral** may require slackening control cables and use of rigging pins/fixtures at the pilot's controls, the control surface end, and intermediate cable-quadrants/linkages, ensuring PFCUs, artificial feel units, cockpit indicators, trim systems, tabs and tab indicators are all in neutral, and control chains/cables equally placed around sprockets/drums, with control surfaces aligned with the adjacent fixed trailing edge (some aircraft specify a control surface up-float or down-float).

**Cable tensions** are checked with a **tensiometer** and adjusted via turnbuckles, or adjusted until the cable tension regulator pointer indicates ambient temperature; new cables may need tightening above normal tension, operated through full travel a set number of times (e.g. 20), then reduced to correct tension. When rigging is complete, each rigging pin should be removable and replaceable easily, confirming correct cable length and tension.

**Freedom of movement (static friction) check** pulls the control system through its full range using a spring balance on the control column and rudder pedals; the force required must not exceed specified limits:

| Max. Aeroplane Weight | Elevator | Aileron | Rudder |
|------------------------|----------|---------|--------|
| 5,700 kg (12,500 lb) or less | 17.79 N (4 lbf) | 8.89 N (2 lbf) | 26.68 N (6 lbf) |
| 22,680 kg (50,000 lb) or more | 44.48 N (10 lbf) | 35.59 N (8 lbf) | 44.48 N (10 lbf) |

*(Linear variation is assumed between these weights. If manual reversion is provided on a powered system, static friction must be checked in both manual and power modes; 'feel' spring struts may need disconnecting to obtain the true friction value.)*

**Range of movement check**: pilot's controls are moved in both directions from neutral and travel is measured with a ruler; incorrect range is corrected by adjusting the control surface (primary) stops, then the cockpit (secondary) stops to a specified clearance. Trim tabs and other tabs must also be checked for correct operation and indication; screw jacks operating a tab must not be out of safety when fully extended. Control locks must be checked for correct engagement/disengagement and their warning devices for correct operation.

**Loose article check**: after every job, the area is inspected to ensure no tools, spares, locking wire or cleaning cloths have been left behind (including checks outside the aircraft).

**Duplicate inspection**: all parts of a flying control system are generally classed as **VITAL POINTS** — any point where a single incorrect assembly could cause loss of the aircraft and/or fatalities — and if disturbed require a duplicate inspection: first made and certified by one qualified person, then made and certified by a second qualified person. A duplicate inspection may be limited to the disturbed part of the system, but must be carried out as soon as possible after the first inspection and before the aircraft flies; if the system is further disturbed, another duplicate set of inspections is required. All work must be recorded with part and serial numbers, and a CRS signed and entered/attached to the aircraft log book.

## Stall

A **stall** is a reduction in the lift coefficient generated by a foil as angle of attack increases, occurring when the **critical angle of attack** is exceeded — typically about **15 degrees**, though this may vary significantly depending on the fluid, foil and Reynolds number. A stall does not mean the engine(s) have stopped working or that the aircraft has stopped moving — the effect is the same even in an unpowered glider.

### Stall Warning Devices

The majority of aircraft carry a device that warns the pilot of an impending stall as stall speed is approached:
- The simplest is a **stall warning horn**, using a pressure sensor or a movable metal tab that actuates a switch to produce an audible warning
- An **Angle-of-Attack (AOA) Indicator** displays margin above stall and/or angle of attack on a continuous readout, immediately responsive to changes in speed, angle of attack and wind conditions, and automatically compensating for aircraft weight, altitude and temperature
- An **angle of attack limiter ('alpha' limiter)** is a flight computer that automatically prevents pilot input from raising the aircraft above the stall angle; some can be disabled by the pilot

Stall warning systems often use inputs from a broad range of sensors, including a dedicated angle of attack sensor. Blockage, damage or malfunction of stall/AOA probes can cause unreliability of the stall warning, and can also affect the stick pusher, overspeed warning, autopilot and yaw damper.
        $cnt3$,
        11
    ) RETURNING id INTO s11_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M11B.9 Equipment and Furnishings (10 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s9_id, 'Which document details the requirements for the design and performance of safety and other equipment, such as access doors, emergency exits, cabin aisle width and number of seats abreast, for large aeroplanes?',
     '[{"id":"a","text":"JAR 25 — Large Aeroplanes","correct":true},{"id":"b","text":"JAR 66 — Aircraft Maintenance Licensing","correct":false},{"id":"c","text":"JAR 21 — Certification Procedures","correct":false}]',
     '{"B1"}'),

    (s9_id, 'Life jackets are inflated rapidly once the passenger is outside the aircraft by means of:',
     '[{"id":"a","text":"A CO2 cylinder","correct":true},{"id":"b","text":"A manual foot pump","correct":false},{"id":"c","text":"Cabin bleed air pressure","correct":false}]',
     '{"B1"}'),

    (s9_id, 'During a life jacket inspection, the water-activated light is checked for insulation resistance across its terminals, which should be at least:',
     '[{"id":"a","text":"1 Megohm","correct":true},{"id":"b","text":"1 Ohm","correct":false},{"id":"c","text":"100 Kilohms","correct":false}]',
     '{"B1"}'),

    (s9_id, 'Seat rails have circular cut-outs that allow seats to be attached and locked at different seat spacing (pitch), usually in increments of:',
     '[{"id":"a","text":"One inch or 25 mm","correct":true},{"id":"b","text":"One foot or 300 mm","correct":false},{"id":"c","text":"Half an inch or 12 mm","correct":false}]',
     '{"B1"}'),

    (s9_id, 'Compared to passenger lap-strap seat belts, flight attendant seats are normally fitted with:',
     '[{"id":"a","text":"A full harness seat belt","correct":true},{"id":"b","text":"No restraint, since attendants remain standing","correct":false},{"id":"c","text":"A two-point lap belt only, identical to passengers","correct":false}]',
     '{"B1"}'),

    (s9_id, 'An inertia reel harness system, once locked following a rapid deceleration, will:',
     '[{"id":"a","text":"Prevent forward motion while still allowing backward motion","correct":true},{"id":"b","text":"Prevent all motion, forward and backward, permanently","correct":false},{"id":"c","text":"Release the harness completely to allow rapid evacuation","correct":false}]',
     '{"B1"}'),

    (s9_id, 'The maximum number of passengers permitted in a cabin is based on the ability to evacuate the cabin through:',
     '[{"id":"a","text":"50% of available exits, in 90 seconds","correct":true},{"id":"b","text":"All available exits, in 60 seconds","correct":false},{"id":"c","text":"25% of available exits, in 3 minutes","correct":false}]',
     '{"B1"}'),

    (s9_id, 'Galleys require connections to the aircraft''s own water systems, specifically:',
     '[{"id":"a","text":"Fresh (potable) water and grey (waste) water","correct":true},{"id":"b","text":"Hydraulic fluid and de-icing fluid only","correct":false},{"id":"c","text":"Fuel and oxygen supply lines only","correct":false}]',
     '{"B1"}'),

    (s9_id, 'In a typical cargo bay roller ball guide, what prevents dirt from entering the ball mechanism?',
     '[{"id":"a","text":"A wiper ring surrounding the ball","correct":true},{"id":"b","text":"A sealed vacuum chamber","correct":false},{"id":"c","text":"A continuous flow of compressed air","correct":false}]',
     '{"B1"}'),

    (s9_id, 'Loose baggage in cargo holds (not carried in LD containers) is usually restrained by:',
     '[{"id":"a","text":"Nets that can be locked into the floor or walls of the bay","correct":true},{"id":"b","text":"Adhesive strapping applied directly to the fuselage skin","correct":false},{"id":"c","text":"Magnetic clamps built into the cargo floor","correct":false}]',
     '{"B1"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M11B.10 Fire Protection (12 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s10_id, 'Unit (Spot) Type fire detector switches are electrically connected:',
     '[{"id":"a","text":"In parallel with each other and in series with the warning system","correct":true},{"id":"b","text":"In series with each other and in parallel with the warning system","correct":false},{"id":"c","text":"Independently, with no electrical connection between switches","correct":false}]',
     '{"B1"}'),

    (s10_id, 'The so-called ''High Speed Resetting Switch'' (HSRS) unit-type detector operates by:',
     '[{"id":"a","text":"A thin casing that expands with heat, pulling two contacts together","correct":true},{"id":"b","text":"Releasing a pressurised gas that trips a pressure switch","correct":false},{"id":"c","text":"Ionising the surrounding air to change circuit resistance","correct":false}]',
     '{"B1"}'),

    (s10_id, 'A continuous loop (firewire) fire detector uses the principle of:',
     '[{"id":"a","text":"Capacitance and resistance","correct":true},{"id":"b","text":"Radioactive ionisation only","correct":false},{"id":"c","text":"Photoelectric light refraction","correct":false}]',
     '{"B1"}'),

    (s10_id, 'A rise in temperature along a continuous loop (firewire) detector causes:',
     '[{"id":"a","text":"A sharp fall in electrical resistance and a rise in capacitance","correct":true},{"id":"b","text":"A sharp rise in electrical resistance and a fall in capacitance","correct":false},{"id":"c","text":"No change in resistance, only a change in capacitance","correct":false}]',
     '{"B1"}'),

    (s10_id, 'In a dual loop fire detection system with the loop selector set to BOTH, a full fire warning is activated when:',
     '[{"id":"a","text":"Both Loop A and Loop B detect a fire condition","correct":true},{"id":"b","text":"Either Loop A or Loop B alone detects a fire condition","correct":false},{"id":"c","text":"Neither loop needs to detect anything, as BOTH bypasses detection","correct":false}]',
     '{"B1"}'),

    (s10_id, 'In a pressure-type fire detection system such as the Systron-Donner type, a localised fire is indicated by:',
     '[{"id":"a","text":"Release of hydrogen gas, closing the pressure switch","correct":true},{"id":"b","text":"A drop in helium pressure opening the pressure switch","correct":false},{"id":"c","text":"A change in electrical resistance along the loop","correct":false}]',
     '{"B1"}'),

    (s10_id, 'An engine is typically split into hot and cool fire zones. The hot zone comprises:',
     '[{"id":"a","text":"The combustion chamber, turbines and exhaust areas","correct":true},{"id":"b","text":"The intake, compressors and accessory drives","correct":false},{"id":"c","text":"The entire engine bay, with no distinction made","correct":false}]',
     '{"B1"}'),

    (s10_id, 'Fireproof bulkheads separating an APU or tail-mounted engine from the rest of the airframe are typically made from:',
     '[{"id":"a","text":"Titanium or stainless steel","correct":true},{"id":"b","text":"Aluminium alloy sheet","correct":false},{"id":"c","text":"Carbon fibre composite","correct":false}]',
     '{"B1"}'),

    (s10_id, 'A Carbon Monoxide detector card changes colour when exposed to CO because it contains silica gel crystals treated with a chemical that turns:',
     '[{"id":"a","text":"Green or black","correct":true},{"id":"b","text":"Bright blue","correct":false},{"id":"c","text":"Fluorescent yellow","correct":false}]',
     '{"B1"}'),

    (s10_id, 'In an ionisation type smoke detector, the presence of smoke in the chamber causes the reference current to:',
     '[{"id":"a","text":"Decrease","correct":true},{"id":"b","text":"Increase","correct":false},{"id":"c","text":"Remain completely unchanged","correct":false}]',
     '{"B1"}'),

    (s10_id, 'A toilet compartment automatic fire extinguisher unit typically discharges when a heat source is sensed at around:',
     '[{"id":"a","text":"75°C","correct":true},{"id":"b","text":"250°C","correct":false},{"id":"c","text":"15°C","correct":false}]',
     '{"B1"}'),

    (s10_id, 'A hand-held dry powder fire extinguisher should never be used in which location, due to lack of visibility and possible interference with electrical equipment?',
     '[{"id":"a","text":"The flight deck","correct":true},{"id":"b","text":"The rear passenger cabin","correct":false},{"id":"c","text":"The cargo hold","correct":false}]',
     '{"B1"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M11B.11 Flight Control Systems (21 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s11_id, 'The three fixed aerofoils of a conventional aircraft are the wings, the horizontal stabiliser and the:',
     '[{"id":"a","text":"Vertical stabiliser","correct":true},{"id":"b","text":"Canard","correct":false},{"id":"c","text":"Winglet","correct":false}]',
     '{"B1"}'),

    (s11_id, 'A key safety feature required on T-Tail aircraft, to automatically recover from a dangerous deep stall condition, is a:',
     '[{"id":"a","text":"Stick push system","correct":true},{"id":"b","text":"Speed-sensitive range limiting system","correct":false},{"id":"c","text":"Gust damper","correct":false}]',
     '{"B1"}'),

    (s11_id, 'On a single-engine propeller aircraft, the leading edge of the vertical stabiliser may be offset slightly in order to:',
     '[{"id":"a","text":"Counter the yawing moment caused by propeller-induced rotating airflow","correct":true},{"id":"b","text":"Reduce parasitic drag at cruise speed","correct":false},{"id":"c","text":"Improve the aircraft''s stall recovery characteristics","correct":false}]',
     '{"B1"}'),

    (s11_id, 'Which set of control surfaces is classed as primary, in accordance with this syllabus?',
     '[{"id":"a","text":"Elevators, rudder, ailerons and roll spoilers","correct":true},{"id":"b","text":"Trim tabs, flaps and slats only","correct":false},{"id":"c","text":"Speed brakes and lift dumpers only","correct":false}]',
     '{"B1"}'),

    (s11_id, 'On large aircraft with two sets of ailerons per wing, the outboard ailerons are normally isolated at high cruising speed mainly to prevent:',
     '[{"id":"a","text":"Aileron reversal from twisting flexible thin wings","correct":true},{"id":"b","text":"Excessive fuel consumption from aileron drag","correct":false},{"id":"c","text":"Interference with the autopilot trim system","correct":false}]',
     '{"B1"}'),

    (s11_id, 'A coordinated turn is one that occurs without slip or skid. Too little bank in a turn will cause the aircraft to:',
     '[{"id":"a","text":"Skid outwards","correct":true},{"id":"b","text":"Slip downwards","correct":false},{"id":"c","text":"Enter a spin","correct":false}]',
     '{"B1"}'),

    (s11_id, 'A stabilator (slab or all-flying tailplane) achieves pitch control by:',
     '[{"id":"a","text":"Moving the entire horizontal stabiliser to change its angle of attack","correct":true},{"id":"b","text":"Deflecting a small elevator hinged to a fixed tailplane","correct":false},{"id":"c","text":"Varying engine thrust asymmetrically","correct":false}]',
     '{"B1"}'),

    (s11_id, 'A fundamental design feature of a canard configuration is that the fore plane is set at a greater angle of attack than the main wing so that:',
     '[{"id":"a","text":"The fore plane stalls first, producing a predictable nose-down recovery","correct":true},{"id":"b","text":"The main wing stalls first, giving maximum warning to the pilot","correct":false},{"id":"c","text":"Both surfaces stall simultaneously for balanced handling","correct":false}]',
     '{"B1"}'),

    (s11_id, 'Pushing the right rudder pedal causes the rudder to move to the right, which:',
     '[{"id":"a","text":"Generates a sideways force to the left, turning the nose to the right","correct":true},{"id":"b","text":"Generates a sideways force to the right, turning the nose to the left","correct":false},{"id":"c","text":"Has no aerodynamic effect until the ailerons are also deflected","correct":false}]',
     '{"B1"}'),

    (s11_id, 'On a delta-wing aircraft, combined-function control surfaces providing both pitch and roll by moving symmetrically or asymmetrically are called:',
     '[{"id":"a","text":"Elevons","correct":true},{"id":"b","text":"Ruddervators","correct":false},{"id":"c","text":"Flaperons","correct":false}]',
     '{"B1"}'),

    (s11_id, 'High lift devices are used mainly to:',
     '[{"id":"a","text":"Increase lift and reduce stalling speed, allowing a slower landing speed","correct":true},{"id":"b","text":"Increase cruise speed at high altitude","correct":false},{"id":"c","text":"Reduce structural loads on the wing during turbulence","correct":false}]',
     '{"B1"}'),

    (s11_id, 'True speed brakes (air brakes), such as the rear-fuselage clamshell doors on the BAe 146, have a major advantage over wing-mounted spoilers in that they:',
     '[{"id":"a","text":"Produce high drag with virtually no cabin vibration and leave lift unaffected","correct":true},{"id":"b","text":"Produce far more drag but at the cost of a significant lift increase","correct":false},{"id":"c","text":"Only operate on the ground, never in flight","correct":false}]',
     '{"B1"}'),

    (s11_id, 'Wing fences fitted to swept-wing aircraft are designed primarily to:',
     '[{"id":"a","text":"Control the spanwise flow of boundary layer air towards the wing tip","correct":true},{"id":"b","text":"Reduce structural weight of the wing box","correct":false},{"id":"c","text":"Increase the critical Mach number of the aircraft only","correct":false}]',
     '{"B1"}'),

    (s11_id, 'Vortex generators, mounted on an aerofoil surface, work by:',
     '[{"id":"a","text":"Mixing high-energy free-stream air into the sluggish boundary layer, delaying separation","correct":true},{"id":"b","text":"Reducing the local airflow velocity to prevent shock formation","correct":false},{"id":"c","text":"Sealing the boundary layer entirely from the free-stream airflow","correct":false}]',
     '{"B1"}'),

    (s11_id, 'A balance tab differs from an anti-balance tab in that the balance tab:',
     '[{"id":"a","text":"Moves in the opposite direction to the primary control surface, assisting its movement","correct":true},{"id":"b","text":"Moves in the same direction as the primary control surface, adding to pilot effort","correct":false},{"id":"c","text":"Is connected directly to the flight deck controls rather than the fixed aerofoil","correct":false}]',
     '{"B1"}'),

    (s11_id, 'A spring tab provides increasing aerodynamic assistance to the pilot as aircraft speed increases because:',
     '[{"id":"a","text":"Rising air loads cause the torque tube to twist, deflecting the tab progressively more","correct":true},{"id":"b","text":"The tab is directly connected to an engine-driven hydraulic pump","correct":false},{"id":"c","text":"Increasing airspeed reduces the stiffness of the torque tube","correct":false}]',
     '{"B1"}'),

    (s11_id, 'The high-speed oscillation of a control surface about its hinge line, caused by the surface centre of gravity lying aft of the hinge, is known as:',
     '[{"id":"a","text":"Flutter","correct":true},{"id":"b","text":"Aileron reversal","correct":false},{"id":"c","text":"Buffet","correct":false}]',
     '{"B1"}'),

    (s11_id, 'In the absence of manufacturer data, the free play at the trailing edge of a trim tab should not exceed:',
     '[{"id":"a","text":"2.5% of the average chord of the tab","correct":true},{"id":"b","text":"25% of the average chord of the tab","correct":false},{"id":"c","text":"0.25 mm, regardless of tab size","correct":false}]',
     '{"B1"}'),

    (s11_id, 'According to the static friction check table, for an aeroplane of maximum weight 5,700 kg (12,500 lb) or less, the maximum permitted static force on the aileron control is:',
     '[{"id":"a","text":"8.89 N (2 lbf)","correct":true},{"id":"b","text":"17.79 N (4 lbf)","correct":false},{"id":"c","text":"26.68 N (6 lbf)","correct":false}]',
     '{"B1"}'),

    (s11_id, 'All parts of a flying control system are generally classed as vital points. A duplicate inspection of a vital point means the inspection is:',
     '[{"id":"a","text":"First made and certified by one qualified person, then made and certified by a second","correct":true},{"id":"b","text":"Made once, but recorded twice in the aircraft log book","correct":false},{"id":"c","text":"Carried out by the same person twice, on different days","correct":false}]',
     '{"B1"}'),

    (s11_id, 'A stall occurs when the angle of attack of a foil exceeds the critical angle of attack, which is typically approximately:',
     '[{"id":"a","text":"15 degrees","correct":true},{"id":"b","text":"45 degrees","correct":false},{"id":"c","text":"5 degrees","correct":false}]',
     '{"B1"}');

END $$;
