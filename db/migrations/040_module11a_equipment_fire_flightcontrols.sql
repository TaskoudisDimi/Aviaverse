-- Module 11A (Turbine Aeroplane, B1): Equipment and Furnishings, Fire Protection, Flight Control Systems
-- Source: EASA Part-66 Module 11A official textbook (IKAROS Aviation Training Centre, IK M11A)

DO $$
DECLARE
    m11_id INT;
    s10_id INT;
    s11_id INT;
    s12_id INT;
BEGIN
    SELECT id INTO m11_id FROM easa_modules WHERE code = 'M11';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M11A.10') THEN
        RAISE NOTICE 'M11A.10-M11A.12 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module M11A.10: Equipment and Furnishings
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m11_id, 'M11A.10', 'Equipment and Furnishings',
        $cnt$
# Equipment and Furnishings

## Emergency Equipment Requirements

Every aircraft carries some form of emergency equipment, ranging from a simple seat belt and fire extinguisher on a micro-light aircraft to a large list of equipment on a commercial airliner. A medium-sized aircraft such as the Fokker 50 carries over **thirty different types** of safety equipment; a 450+ seat Boeing 747-400 carries items such as seat belts, lifejackets, first-aid kits, fire extinguishers, oxygen sets and torches.

The types of safety equipment that must be carried on any specific flight are laid down in the **Air Navigation Order (ANO), Schedule No. 4**. **JAR 25 — Large Aeroplanes** details, among other things, the requirements for the design and performance of safety and other equipment, including access doors, emergency exits, cabin aisle width and seats abreast.

Some items may seem to be of little use, but each has a specific purpose:
- The large **axe** carried on passenger aircraft allows trapped passengers and crew to cut their own way out of the cabin
- **Smoke hoods** permit cabin staff to help passengers leave the aircraft even if the cabin is full of smoke
- **Portable oxygen** is used for passengers feeling ill, in addition to the 'drop-out' masks activated if cabin pressurisation fails

**Life jackets** use a CO₂ cylinder for rapid inflation once the passenger is outside the aircraft; buoyancy is then controlled by a mouthpiece for further inflation. Life jackets are inspected at **6-monthly intervals** for condition and inadvertent operation. The water-activated light is checked for insulation resistance across its terminals, which should be at least **1 Megohm**. The CO₂ bottle is checked by weighing it on laboratory scales.

## Seats, Harnesses and Belts

All seat belts must restrain the passenger (or crew) in their seat, even during a crash landing. The seat is held securely in **seat rails** — a continuous extrusion with circular cut-outs allowing seats to be attached and locked at different seat spacing (**pitch**), usually in **one inch or 25 mm increments**. The seats and rails are classed as **primary structure**.

Aircraft seats fall into three main groups:
- **Passenger seats** — usually part of multiple units, manufactured from riveted/welded aluminium alloy tube, with reclining seat backs and integral tables
- **Flight attendant seats** — more utilitarian, mounted on seat tracks, wall structure, or (as on the ATR-72) a sliding assembly that stows away. Fitted with a full harness seat belt (versus the passenger 'lap strap'); harnesses should only be cleaned with acid-free soap and water
- **Flight deck crew seats** — the most comfortable on the aircraft, since regulations require a full crew in the cockpit at all times. They have many axes of movement (height, reach, backrest tilt, lumbar support, arm rest height), often electrically actuated, and at least a **four-point harness** (in many cases a **five-point harness**, with a lower crotch strap)

An **inertia reel system** locks the harness if a rapid deceleration of the aircraft occurs; in the locked position backward motion is still possible but forward motion is prevented.

## Cabin Layouts

The cabin layout is a compromise between the manufacturer (who wants as many paying passengers as possible) and the airworthiness authorities (who limit the maximum number). The maximum permitted is the number of passengers that can be evacuated from the cabin, through **50% of available exits**, in **90 seconds**. This ruling dictates the number and size of exits, aisle width and number of seats.

The wide-body Boeing 747 usually has two aisles, with triple units outboard and paired double units between the aisles, giving **10-abreast** seating (the normal maximum).

**Passenger Service Units (PSU)** are located on the underside of overhead stowage lockers and normally contain reading lights, call buttons, seat belt/NO SMOKING signs and, where fitted, drop-out oxygen masks.

**Galleys** are found at the front, rear, or centrally (dividing classes of passenger). They have their own power supply for heating, lighting and ventilation, and their own connections to both fresh (potable) water and 'grey' (waste) water. Some galleys are fitted underfloor, requiring lifts between floors. For maintenance, galley units and all dividing partitions, overhead units and PSUs are removable.

## Cabin Furnishings and Entertainment

All furnishings must be easily removable, both for engineer access during deep maintenance and to permit replacement of items subject to fair wear and tear — worn carpets, torn seat covers, cracked plastic wall skins, ceiling panels and damaged overhead bin doors. These are attached by 'quick release' fittings.

Cabin entertainment varies from music over the cabin PA system on small aircraft to films, navigation information and cabin safety briefings on multiple television monitors, and to individual seat-back or seat-arm viewing screens on higher-class seats offering video, games, music and (in business class) satellite telephone access. To reduce weight, entertainment systems can use **multiplexing** to transmit different media down a single cable.

## Cargo Handling and Retention Equipment

In most commercial aircraft, cargo is carried below the cabin floor in dedicated fire-resistant compartments, which can be air-conditioned if animals are carried. Smaller aircraft (e.g. the Dornier 227 and Fokker 50) carry cargo within the cabin space due to limited underfloor space. Some wide-body aircraft are produced as dedicated freighters; the **'Combi freighter'** carries both extra freight and passengers, flexible for routes where the cargo/passenger ratio varies.

**Containers** are shaped to the fuselage contour to maximise freight-bay capacity, made from alloy or fibreglass honeycomb. They are sized by an internationally agreed code — for example **LD2** is a standard container sized for the lower deck (LD); other sizes range from **LD3 to LD8**.

### Automatic Cargo Loading Systems

An electro-mechanical loading system, built into the aircraft during manufacture, uses **rubber-tyred rollers** in contact with the base of containers, motor-powered from the aircraft electrical system, with guide rollers to steer containers into position.

- Containers are raised to cargo-bay floor level by a hydraulically operated deck with free-running rollers or balls, then manually pushed into the door area onto a **ball mat / ball transfer panel** — a low-friction device where each ball unit consists of a self-lubricated spring-loaded steel ball riding on smaller ball bearings in a cup-shaped housing, with a wiper ring to exclude dirt
- **Lateral rubber-covered drive rollers** drive the container fully into the bay; lateral guides keep it square
- **Sill rollers** are mounted to the lower doorframe to provide a rolling surface into and out of the door area
- **Roller trays** run the length of the cargo bay for onward movement; **centre/auxiliary guides** keep the container travelling squarely
- **Power Drive Units (PDU)** consist of an electric motor driving a rubber-tyred roller; when commanded, the roller is raised approximately **12 mm** from the floor by a cam before it begins to rotate and propel the container
- The control panel has a **joystick with eight positions and centre-off** for PDU operation
- During unloading, roll-out stops are locked down (electrically, or by foot pedal if electrical power is unavailable) to permit free container passage

Only approved personnel who have received proper training in the particular installation should operate automatic loading systems. **Dangerous goods** possess potentially hazardous characteristics (acids, explosives, radioactive materials, and also less obvious items such as magnets, breathing apparatus, gas cylinders and mercury-containing instruments) but, with suitable precautions, are not necessarily prohibited from air travel.

## Cargo Retention Equipment

Once loaded, cargo must be restrained against movement during take-off, turbulence and landing (especially hard braking). **LD containers have positive latches** that attach them directly to the aircraft structure. 'Loose' baggage is usually restrained by **nets** locked into the floor or walls of the bay; the same system can be used on pallets, where cases and bags are covered by waterproof sheet and restraint netting before the pallet is clamped to the cargo bay floor.

## Airstairs

**Airstairs** are passenger steps integral to the aircraft structure, independent of normal passenger steps and airport jetways. They are often fitted to aircraft operating into poorly equipped airports. Airstairs can be manually or power operated — from a simple set of stairs built into the back of the entrance door, to a fully powered, folding set of steps extended and retracted by push-buttons on larger aircraft. Some aircraft (e.g. the Boeing 717-200) can be fitted with a second airstair at the rear of the cabin, allowing simultaneous embarkation/disembarkation through two doors to speed turnaround.
        $cnt$,
        10
    ) RETURNING id INTO s10_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module M11A.11: Fire Protection
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m11_id, 'M11A.11', 'Fire Protection',
        $cnt2$
# Fire Protection

## Introduction

Fire is the most dangerous threat to the safety of an aircraft, associated with external areas near the main engines and the APU. Other external hot spots are landing gear bays (where heat from the brakes could affect surrounding equipment and wiring when the gear is retracted) and overheating from very hot, leaking engine compressor bleed-air pipes. Internal areas requiring protection include the passenger, flight deck and toilet compartments, as well as cargo, air-conditioning and electrical/electronic equipment bays.

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
- Adequate visual and aural indication on the flight deck and in vital areas
- Separate warnings for each engine and specific areas as determined by the manufacturer

The Fire (and Overheat) Protection system is normally split into two main subsystems: **Fire/Overheat Detection and Warning**, and **Fire Extinguishing**.

## Fire/Overheat Detection and Warning

Fire/overheat detectors fall into two main groups: **Unit (Spot) Type** and **Continuous Loop (Firewire) Type**.

### Unit (Spot) Type

Fitted at strategic points within the fire/overheat zone, taking the form of a thermally activated switch. They are electrically connected **in parallel** with each other and **in series** with the audio/visual warning system, so that any switch can operate the warning even if others have failed.

- Some units use a pair of **bi-metallic contacts** that close when heated and open when cooled
- The majority use a thin casing surrounding two normally-separated electrical contacts; heat expands the casing and pulls the contacts together, completing the circuit — the **High Speed Resetting Switch (HSRS)**, valued for its sensitivity and fast reaction (both to warn and to cancel the warning once heat is removed)

Spot detectors are used mainly to detect high-temperature leaks from bleed air ducts and are normally positioned at pipe-to-pipe connections.

### Continuous Loop (Fire Wire) Detectors

This method gives more complete coverage of a fire hazard area than any spot-type detector. It uses the principle of **capacitance and resistance** to indicate a temperature rise at any point along the loop. The commonest type has a stainless steel or Inconel outer tube, with an inner pure nickel wire surrounded by ceramic beads wetted by eutectic salt — a rise in temperature causes a sharp **fall in electrical resistance** and a **rise in capacitance**. A loop can cover a complete powerplant within its cowling, so a fire is detected quickly regardless of where it starts; the firewire re-sets the control box automatically once temperature falls below the limit.

Firewire elements are attached to the airframe with quick-release clips approximately **6 inches apart and 4 inches from the end fittings**, supported by clips with a rubber grommet to prevent rubbing and damp vibration. Care is taken to avoid excessive bending, which could work-harden the capillary.

### Dual Loop System

Most aircraft use a dual loop system: Loop A and Loop B are independent of each other. With the selector set to **BOTH**, both loops must detect a fire before the warning activates; if only one loop detects a fire, the associated loop fault light illuminates. Switched to a single loop (A or B), a full fire warning activates if that loop alone senses a fire. Pressing the **loop test button** earths the inner electrode of the loop, functionally checking the system and its continuity.

### Pressure-Type Sensor

Uses a continuous loop of sealed stainless steel tube containing an element that absorbs gas when cold but releases it when heated, connected to a pressure switch that closes at a pre-determined pressure. The commonest make (Systron-Donner) uses a titanium centre wire and the expansion of both helium and hydrogen gas to give **two-stage warnings**: a localised fire releases hydrogen gas, closing the pressure switch to give a fire warning; a lower-level temperature rise over a larger area expands the helium, closing the switch to give a system (overheat) warning.

## Fire Zones

On light aircraft the only fire protection is a stainless steel or titanium **firewall (bulkhead)** dividing the engine bay from the cabin. Larger aircraft isolate the complete engine cowlings from the airframe/wing, and cowlings can be divided into a number of **fire zones**, each usually with its own warning and extinguishing system.

- **Hot and cool zones** — engines are split into a **hot zone** (combustion chamber, turbines, exhaust) and a **cool zone** (intake, compressors, accessory drives)
- **Fireproof bulkheads** — prevent fire spreading to other areas; APUs and tail-mounted engines are contained within such compartments, and engine pylons contain a firewall separating the engine from the wing. Made from titanium or stainless steel, with all joints sealed with fireproof sealants
- **Engine fire prevention** — flameproof/flame-resistant materials, bonding strips to prevent arcing, drainage of spilt fuel/oil and efficient cooling. Fuel, oil and hydraulic pipes are fire resistant; electrical components and connections are flame proof. In flight, cooling airflow through the cowlings renders them fireproof, but on the ground light-alloy cowlings would not contain a fire for long
- **Cockpit and cabin interiors** — wool, cotton and synthetic interior trim fabrics are treated to be flame resistant. Seat cushion foam is flammable but, covered with flame-resistant fabric, presents little danger from accidental contact with (e.g.) a cigarette. Interior fire protection is usually provided by hand-held extinguishers (Water, CO₂, Dry Powder)

## Smoke Detection

A smoke detection system monitors areas (e.g. cargo/baggage compartments and toilets) for smoke, used where the anticipated fire type generates substantial smoke before temperature changes are sufficient to actuate a heat/fire detector.

- **Carbon Monoxide Detectors** — CO (or N₂O) is dangerous to crew and passengers and may indicate fire as a combustion by-product. CO is especially dangerous because only a minute amount (approximately **2 parts in 10,000**) causes loss of attention and headaches; it is colourless, odourless, tasteless and a non-irritant. Detectors are usually a small card with a transparent pocket of treated silica gel crystals that change colour to green or black when exposed to CO
- **Photoelectric Smoke Detectors** — air from the monitored compartment is drawn through a detector chamber and a light beam is shone across it; a photoelectric cell senses light refracted by smoke particles, changing the current it conducts, which is amplified to initiate a warning
- **Ionisation Type Smoke Detector** — a small amount of radioactive material ionises oxygen and nitrogen molecules in the chamber air, allowing a reference current to flow; smoke reduces the level of ionisation and hence the current, and when current falls to a specific level a warning is initiated
- **Flame Detectors** — use a photoelectric cell to detect a sharp rise in light, such as from a flame in a closed bay

## Fire Extinguishing

### Extinguishing System

Aircraft with an integral fire extinguisher system have a number of pressurised bottles containing extinguishant, each with **two explosive cartridges (squibs)** that can be fired from the flight deck. Each bottle can feed either the port or starboard engine through a **crossfeed**. On multi-engine aircraft, one bottle may be provided per engine, or one bottle may feed two engines, giving either two 'shots' to a single engine or one 'shot' each to two engines. Bottle condition is shown by a pressure gauge (often red/green sectioned) and a discharge indication on the fire control panel; a **pop-up indicator** may show a squib has fired. Each bottle has overpressure protection via a **rupture disc**, which fails if bottle pressure becomes excessive due to overheating.

- **Directional Flow Control Valves (2-Way Valves)** — non-return valves used in a crossfeed system so the contents of one or several extinguishers can be directed into any one engine or compartment, preventing reverse flow into the other bottle/engine
- **Fire Extinguishant Container** — the electrically-ignited cartridge drives a cutter into a disc which, on rupture, releases the extinguishant; a strainer prevents broken disc fragments entering the distribution system. A fusible **safety plug**, connected to a red indicator disc outside the compartment, melts at a pre-determined temperature if compartment temperature/pressure rises excessively, discharging the bottle overboard and blowing out the red indicator
- **Toilet Compartment Systems** — small automatic units in toilet waste bins discharge via a fusible plug that melts at approximately **75°C**; most give no cockpit/attendant indication, though some have a visible temperature strip checked before flight

### Warnings and Indications

Once fire is detected, a signal from the firewire element goes to a control unit, which signals the cockpit Caution/Warning Panel (CWP), the associated power lever handle and the fire control panel. The CWP red **FIRE** caption illuminates for the affected engine/compartment, together with the master warning lights and audio warnings; the affected power lever handle and fire extinguisher handle on the overhead console also illuminate red. To activate the extinguishant, the red fire handle is pulled to arm the system and the squib button pressed to fire the bottle; if fire persists after the first bottle is exhausted, the second squib button fires the second bottle. An amber **DISCH** caption indicates when a bottle is empty.

### Hand-Held (Portable) Fire Extinguishers

Every aircraft must carry portable extinguishers for cabin crew use; the amount and location depend on aircraft type and size.
- **Halon** extinguishers interrupt the chemical reaction of combustion, leave no residue (useful for electrical equipment), and have a limited range of **4 to 6 feet**. Initial application should be at the base of the fire, even after flames are extinguished
- **Carbon Dioxide** extinguishers disperse gas quickly and are effective from **3 to 8 feet**; stored as a compressed liquid, expansion cools the surrounding air and often causes ice to form around the discharge horn. Used mainly for electrical fires in cabin and cockpit
- **Dry powder** extinguishers use compressed nitrogen to expel sodium or potassium bicarbonate powder; effective on most fires but should **never** be used on the flight deck due to loss of visibility and interference with electrical equipment
- **Water** extinguishers are for fires in ordinary combustibles such as wood and paper

Hand-held extinguishers are periodically checked for weight (stamped on the bottle neck as the charged weight); if below the set limit, the extinguisher is replaced.

## System Tests

All extinguishing systems have a method of testing serviceability, from weighing the complete cylinder off-aircraft to reading a gauge with safe/low-pressure sectors, or internal pressure switches that notify the flight deck of pressure loss or discharge. All bottles and squibs have a life, after which they must be removed and returned to the manufacturer.

- **Fire System Test Switch** — checks all warning lights and audio warnings; a light that fails to illuminate normally indicates a bulb filament failure
- **Fire Wire Loop Test** — checks the continuity of each sensing element loop; if serviceable, the Loop caption illuminates
- **Squib Test** — checks continuity of the discharge heads for each fire extinguisher bottle; a squib warning light/magnetic indicator illuminates if serviceable. The current used during the squib test is at a much lower value than that required to fire the squib
        $cnt2$,
        11
    ) RETURNING id INTO s11_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module M11A.12: Flight Control Systems
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m11_id, 'M11A.12', 'Flight Control Systems',
        $cnt3$
# Flight Control Systems

## Primary Flight Controls

Aircraft are equipped with moveable aerofoil surfaces that provide control in flight. Controls are divided into **primary** and **secondary/auxiliary** controls. The primary flight controls are **ailerons, elevators and rudders**; the EASA 66 syllabus also includes **spoilers** as primary controls, although there is some variation of opinion on this. Because aircraft operate over wide speed and weight ranges, secondary/auxiliary controls are also needed: trim controls, high lift devices, and speed brakes/lift dump.

- **Ailerons** — provide lateral roll control about the longitudinal axis, normally mounted on the trailing edge of the wing near the tip. Some large turbine aircraft use two sets: an outboard set (near the wingtip) and an inboard/mid-wing set. At low speed both operate for maximum control; at high speed hydraulic isolate valves cut power to the outer ailerons so only the inboard ailerons operate. Operating outer ailerons at high speed can twist the wing leading edge downward, producing **aileron reversal**
- **Elevators** — control aircraft movement about the lateral axis (pitch), normally hinged to the rear spar of the horizontal stabiliser
- **Rudders** — control movement about the vertical (normal) axis. Small aircraft rudders are usually a single structural unit; larger transport aircraft rudders may comprise two or more segments, each controlled by a different operating system for redundancy
- **Spoilers** — secondary-type surfaces used to reduce (spoil) wing lift, normally multiple flat panels on the upper wing surface, hinged at the forward edge and lying flush when retracted:
  - **Flight spoilers** — used in flight to reduce lift; on the down-going wing during a roll they move upward, in proportion to the rate of roll required, to aid rolling (on some aircraft they are the primary roll control). Only the surfaces on one wing are raised at a time when acting purely as flight spoilers, and they are normally positioned outboard of the ground spoilers
  - **Ground spoilers** — used only on the ground, operating with the flight spoilers to greatly reduce lift and drag after landing, normally deflected to their maximum position for maximum drag

## Trim Controls

Aircraft develop a tendency to deviate from straight-and-level flight (due to fuel state, speed, load position, or flap/undercarriage position changes). Continuously holding a correcting force would be fatiguing, so **trim** adjustments correct the tendency; once trimmed to balanced flight, no further pilot effort is required until a further deviation develops.

- **Fixed trim tab** — a piece of sheet metal on the trailing edge of a control surface, adjusted on the ground by bending (by trial and error) to give zero control force in the cruise
- **Controllable trim tab** — adjusted mechanically from the flight deck, usually with a position indication; most aircraft have pitch trim, more advanced aircraft trim on all three axes. Actuation may be mechanical, electrical or hydraulic
- **Servo tab** — used on large control surfaces, often on older aircraft. The pilot's input moves only the tab; airflow force on the tab then moves the primary control surface, reducing pilot effort on a large aircraft
- **Balance tab** — linked so that main surface movement gives an opposite movement to the tab, helping move the main surface and reducing effort; typically fitted where controls were found to be heavy during flight testing
- **Anti-balance tab** — operates mechanically like a balance tab but in reverse, adding loading to the pilot's control to make it feel heavier; often found on **stabilators**, which need extra 'feel' to prevent over-stressing
- **Spring tab** — used on large aircraft requiring considerable force; provides a boost that is progressive — little assistance at slow speed, much more at high speed

## Fully Powered Flying Control Trim System

Because fully powered flying controls are irreversible (loads are fed via mountings to structure), simple trim tabs would be ineffective. Instead, electric trim struts/actuators reposition the "null" position of a self-centring spring device, holding the input system in a new neutral position so the control surface remains deflected and the aircraft trimmed.

- **Rudder trim** — trim commands cause an actuator to extend/retract, rotating the feel and centring mechanism to give a new zero-force pedal position. The trim switch is spring-loaded to neutral; both positive and negative circuit elements are switched to prevent a trim runaway from a short-circuited contact
- **Aileron trim** — trim switches must be operated simultaneously (again to prevent runaway from a short circuit) to reposition the feel and centring mechanism null detent
- **Tailplane trim** — instead of trimming the elevators, the angle of incidence of the whole tailplane is altered via a screw jack at its forward end, rotated by two hydraulic or electric motors through a gearbox; over-travel is prevented by a micro-switch. Reasons for fitting variable-incidence tailplane trim to transport aircraft:
  1. A large useable centre of gravity range gives flexibility in cargo loading and fuel usage in a swept wing
  2. A wide speed range — trimming at one speed then flying slower/faster would otherwise require sustained "up" or "down" elevator, causing extra drag
  3. Compensating for centre of pressure changes due to slat/flap or gear extension
  4. Minimising trim drag for optimum cruise performance

  The tailplane pivots at the rear of the centre-section torsion box, driven by an actuator (a re-circulating ball screw jack and nut driven by two hydraulic motors with separate gear trains) forward of the centre section; friction brakes prevent air loads back-driving the actuator when depressurised. The actuator can be signalled from the autopilot servo, Mach trim servo, or the trim hand-wheel. Each hydraulic motor is powered from a separate system, with a bypass valve to "freewheel" on failure. Some aircraft have a **tail-plane in motion warning** for continuous motion beyond a set time.

## Active Load Controls

**Active Control Technology (ACT)** uses a multivariable automatic flight control system to improve manoeuvrability, dynamic flight characteristics and structural dynamic properties by simultaneously driving control surfaces and auxiliary force/moment generators, either reducing loads the aircraft would otherwise experience or giving manoeuvrability beyond a conventional aircraft. For example, the **Tristar** reduces wing flight loads by partially deploying spoilers, shifting the lift profile closer to the (stronger) wing root, allowing a lighter wing.

Devices used for ACT include **foreplanes** (move together, pitch control only), **canards** (can also move independently, giving roll response), **flaperons** (act as flaps and/or ailerons, moving independently for roll or together for take-off/landing) and **thrust vectoring**.

Advantages of ACT: more stable flight, higher agility (military), more comfortable flight, reduced fatigue (allowing lighter construction), better fuel consumption, more streamlined wings, and (under normal conditions) it is impossible to fly the aircraft beyond its design limitations. Conventional aircraft have four forces of control (rolling, pitching, yawing moment, and thrust/drag modulation); ACT adds two more: **direct lift force** (foreplanes and flaperons operate together to increase lift front and rear simultaneously, changing altitude without pitching the nose) and **direct side force** (rudder and canards deployed together to pull the nose and tail sideways, allowing the aircraft to side-step without rolling).

## High Lift Devices

High lift devices provide extra lift for take-off and greater lift plus high drag for landing.

- **Flaps** — trailing-edge devices ranging from simple types on light aircraft to complex triple-slotted flaps (e.g. Boeing 777). As complexity increases (to improve performance), weight, maintenance and cost increase proportionally. Flap levers typically have several detent positions from fully up, through take-off settings, to a maximum landing setting
- **Slats** — separate small aerofoils (fixed or retractable) that control airflow over the top of the wing at slow speed; on larger aircraft, retractable slat extension is interconnected with the trailing edge flaps. Fixed slats are usually found on light aircraft, accepting slightly higher drag than a clean wing
- **Drooped leading edges** — aim to smooth airflow over the top of the wing, typically operated by screw jack powered by the hydraulic system
- **Krueger flaps** — usually fitted to the inboard leading edge sections, where slats or drooped leading edges are less efficient

## Lift Dump and Speed Brakes

- **Lift dumpers** — spoil wing lift after touchdown so aircraft weight is fully on the landing gear, letting brakes work at 100% for the full landing run; without them the aircraft could 'float' or bounce, reducing braking efficiency and increasing skid risk. Nearly always flat, rectangular, hydraulically powered panels hinged at their leading edge, positioned near maximum wing thickness. A set of landing gear switches senses **weight-on-wheels** to deploy them automatically once the aircraft is fully on the ground; a "lift dumper arming" button lets the pilot arm the system in flight
- **Speed brakes** — used across aircraft types to put panels into the airflow and increase drag; some modulate the amount of drag, others are simply IN or OUT. Some airliners use the same upper-wing surfaces as speed brakes in flight, for roll control augmentation, and as lift dumpers after landing. Light aircraft rarely need speed brakes (a power reduction is usually sufficient); sailplanes use vertical panels projecting top and bottom for steep, slow, safe approaches; military jets use them on approach and during combat for rapid speed reduction

## Powered Flying Control Units (PFCUs) and Redundancy

In large, fast modern aircraft, air loads on control surfaces exceed what a pilot can move manually, so hydraulic pressure via a **Powered Flying Control Unit (PFCU)**, or booster, is used. In its simplest form a PFCU is a hydraulic jack, body fixed to structure, ram linked to the control surface, with a **servo (control) valve** connected to the pilot's controls via the **input system** directing fluid to either side of the piston.

- **Proportionality** — a "follow-up linkage" connects the input system to the output system so that output movement (jack ram) cancels the input once the desired position is reached, re-centring the servo valve and stopping fluid flow
- **Redundancy of hydraulic supplies** — a PFCU relying on a single hydraulic supply risks total loss of powered control on that supply's failure, so redundancy is designed in via multiple independent hydraulic systems:
  - **Tandem PFCU** — a single jack ram with two pistons in co-axial cylinders, each fed from a separate hydraulic circuit via its own duplicated servo valve (set up in the overhaul workshop to work in unison). Loss of one supply allows that piston to "free-stroke" while the other operates the surface
  - **Dual Assembly PFCU** — similar principle, but two piston rams in cylinders mounted side by side, connected to a common output lever
  - **Duplicate/Triplicate PFCUs** — each control surface (or, alternatively, each surface split into two/three independent sections) is operated by two or three separate PFCUs, each from a separate hydraulic supply. If one PFCU is switched off, a bypass valve opens to interconnect both sides of its jack ram, allowing it to be "dragged"/"free-stroke" by the serviceable PFCU(s) without hydraulic lock. Where surfaces are split into independent segments, an unserviceable PFCU's segment is instead "blown back" to neutral by aerodynamic load and held by a lock. A common input lever feeds all PFCU servo valves via **compressible spring struts**, so one malfunctioning PFCU cannot block input to the others
  - **Self-contained PFCU** — a jack-ram powered by its own integral hydraulic generator (a radial piston pump within a slip-ring assembly) and reservoir, driven by a 3-phase electric motor from the aircraft electrical system — independent of the aircraft's hydraulic system, so control is maintained even with total hydraulic failure. On malfunction it "blows back" to neutral and is held by an integral lock; each PFCU in a set draws power from a different bus bar for redundancy
- **Input systems** — generally a cable system (quadrants, pulleys, fairleads) with push-rod connections to the control column and PFCU input lever; duplicated and routed separately through the aircraft to avoid a single incident damaging both runs
- **High speed primary controls** — control surfaces sized for adequate authority at low speed (landing) can become oversensitive at high speed, risking over-control or airframe over-stress. Two mitigation systems: **geared controls** (a single-acting hydraulic jack on an idler lever alters the effective radius of operation, reducing control-surface movement for a given pilot input as pressure is modulated via a pitot-system transducer) and **high-speed ailerons** (an additional set of ailerons at the wing root is powered at high speed, while hydraulic isolate valves — controlled by pitot-system pressure switches — cut power to the wingtip ailerons)

## Trailing and Leading Edge Flap Controls

A representative trailing-edge flap system (three flap segments per mainplane, each with its own linear hydraulic actuator, servo valve, and duplicated cable/pushrod control input) illustrates typical safety design: a **spring strut** in the input circuit "stores" lever movement so a rapid selection can still be progressively released to all actuators at their controlled rate; a **mechanical lock** engages when flaps are fully up and is hydraulically released on a down selection; **flap accumulator pressure** backs up main system pressure whenever the selector is not fully up; and links between adjacent mid/outer flap surfaces prevent an asymmetric flap condition if an actuator or its signalling cable fails. On a related large-aircraft example, flaps are driven by **twin hydraulic motors** (each from a different hydraulic system) on a common gearbox, driving flap surfaces via torque tubes, gearboxes and screw jacks running trolleys along flap tracks; an **asymmetry protection circuit** using paired synchros on the torque shafts detects out-of-phase rotation and isolates the system if it occurs; "fail-safe" weak joints in the torque tubes are designed to fail under excessive load rather than transmit damage further.

A typical Boeing 747 **leading-edge flap** system has 28 leading-edge flaps (22 variable-camber, 6 Krueger), each wing powered by pneumatic drive units with both a pneumatic motor (primary) and an electric motor (used if pneumatic power is unavailable); approximate leading-edge flap extension/retraction times are **9 seconds pneumatic** and **90 seconds electric**.

A typical Boeing 757 **speed brake / ground spoiler control** is electrically controlled and hydraulically powered: Rotary Variable Differential Transducers (RVDTs) convert control-wheel inputs to electrical signals for Spoiler Control Modules (SCMs), which command Power Control Actuators (PCAs) to raise the spoilers; placing the speed-brake lever UP raises all flight spoilers. Each spoiler has one PCA (a hydraulic actuator, an electro-hydraulic servo valve, and an RVDT feeding back surface position), powered from one of three hydraulic systems; the servo valve is spring-loaded to the retract position, so a spoiler panel retracts automatically if the command signal is lost.

## Mechanical and Electrical Flight Control Systems

Most aircraft use **conventional mechanical controls** — cables, chains and control tubes — with the control column/wheel operated instinctively (wheel left to bank left, column forward to dive, back to climb). Many modern aircraft instead use **electrical inputs** to powered control units, eliminating chains, pulleys, fairleads and linkages. On a typical Airbus system, electrical flight control computers use a high degree of redundancy — five EFCS computers of two dissimilar types, each composed of a separate control unit and monitoring unit, with permanent cross-talk between them for self-monitoring. **Side-stick controllers**, installed on the forward lateral consoles, provide pitch and roll manual control and are electrically coupled; an instinctive disconnect button signals side-stick priority if one pilot needs control. Normal control laws use manoeuvre-command with normal acceleration and roll rate as basic parameters, giving neutral static stability and automatic longitudinal trimming, with protections against extreme attitudes, excessive load factors, overspeed and stall. The **load alleviation function (LAF)** uses accelerometers in the forward fuselage to sense up-gusts and deploy ailerons and the outboard spoiler pair to smooth the response, supported by dedicated hydraulic accumulators.

## Artificial Feel, Yaw Damper, Mach Trim, Rudder Limiter and Gust Locks

**'Q' feel** is an artificial force felt at the control column, increasing with aerodynamic pressure (dynamic pressure, **Q = ½ρV²**), simulating the control loading lost with powered controls and preventing the pilot from damaging the aircraft with excessive g. Artificial Q-feel units increase centralising force in proportion to the square of the airspeed.
- **Mechanical Q feel** — a spring cartridge's effective force is adjusted by moving the fulcrum point of a bell-crank lever, using mechanical advantage; the fulcrum arm position is set by an electrical linear actuator driven by an airspeed sensor via a closed-loop positional servo, with feedback from a follow-up potentiometer
- **Hydraulic Q feel** — a hydraulic jack on the control rods produces feel proportional to a signal pressure controlled by a servo valve responding to pitot and static pressure acting on a diaphragm; at zero airspeed the piston is fully up with no feel simulated, and feel increases (in proportion to the square of airspeed) as pitot pressure rises. **Mach number correction** further reduces feel force at high Mach numbers, since control surface effectiveness reduces due to air compressibility at those speeds; a differential-area diaphragm/aneroid capsule compensates for the fact that Mach number is not constant for a given airspeed at different altitudes

**Yaw damping** improves directional stability and turn coordination: a hydraulic yaw damper actuator automatically generates rudder inputs to compensate when the aircraft yaws due to side air-loads, commanded by the **Flight Augmentation Computer (FAC)**, operative throughout the flight envelope, with rudder travel limited as a function of airspeed (CAS).

**Mach trim** automatically maintains correct pitch trim in relation to speed by varying tailplane trim, countering the pitch-up caused by shock-induced separation and forward centre-of-pressure movement near the aircraft's critical Mach number. In a representative system the Mach trim range is **0.68 to 0.84 Indicated Mach Number**, active above **9,000 ft** when the autopilot is disengaged (passive with the autopilot engaged); a flashing activity light indicates a trimming demand, while sustained illumination indicates a runaway or seized actuator; an ON/OFF switch permits isolating a faulty system. The Mach trim actuator is connected by chain drive to the manual tailplane trim hand-wheel cross-shaft via a solenoid-operated clutch, and only one actuator (Mach trim or autopilot auto-trim) can be engaged at a time; manual hand-wheel operation automatically declutches the Mach trim actuator.

**Rudder limiting** restricts maximum rudder movement as airspeed increases, to prevent structural damage from full-deflection inputs at high speed. In a typical **'Q' limiter**, a pitot-fed 'Q' pot (a sealed piston dividing two pitot-pressure chambers) extends a stepped stop as pitot pressure rises, restricting movement of a clawed stop connected to the rudder trim unit's input lever.

**Gust locks** lock the primary control surfaces in neutral for taxiing, parking or mooring, via forward (aileron/elevator) and aft (rudder, with an electrical actuator) installations operated by a single flight-deck lever. Weight-switch-controlled solenoid locks ("snibs") prevent selecting LOCKED in flight; selecting LOCKED on the ground also operates an interlock that restricts engine power lever movement during taxiing. A red warning light illuminates if the lever is out of UNLOCKED or the rudder lock strut is not fully disengaged.

## Rigging and Balancing Controls

**Rigging** is the practice of truing and checking a control system so that the cockpit control is in neutral at the same time as the control surface, ensuring correct sense of movement, correct maximum travel, and acceptable friction. Rigging is carried out at specified intervals and after any disturbance of the control system.

- **Establishing the neutral setting** — the cockpit control is set to neutral and locked, then the rest of the control run adjusted to neutral and locked, often using **rigging pins**. Control surfaces are in neutral when in line with the main surface, except where a specified **aileron droop** is set below the mainplane trailing edge
- **Rigging pins** — issued in sets; the No. 1 (master) pin secures the cockpit end in neutral, with subsequent pins locating aligned holes elsewhere in the system. Removing and refitting each pin in turn checks there is no strain/backlash. Failure to remove rigging pins (or substitution with an incorrect item, such as a bolt) has caused accidents/near-accidents
- **Control surface setting gauges** — attached to a fixed part of the aircraft next to the movable surface, used to check neutral and maximum travel positions against marked gauge points
- **Checking sense of movement** — verified by two tradesmen (one at the cockpit control, one at the surface) to ensure no inadvertent cross-over of connections, which would reverse control response
- **Mechanical stops** — limit maximum travel in each direction; in manual systems, limit stops are near the control surface with a second set of **override stops** near the pilot's control to protect against main-stop failure; in powered systems, mechanical stops are on the input (PFCU), usually near the cockpit control
- **Static and running friction** — measured with a spring balance on the cockpit control; the reading when the control first moves from rest is the **breakout force** (static friction); the (lower) force needed to keep it moving is the **running friction**
- **Checks after rigging** — functional test over full range, security of turnbuckles/end fittings/stops, examination for security of attachment (split pins), cable alignment at pulleys, lubrication, and a check for FOD left in the system. The final check is always a **duplicate check** by a suitably qualified engineer
- **Duplicate checks** cover: correct assembly and locking, function, range of movement, and sense — applying to all engine, undercarriage, flying and associated control systems affecting safety

## Stall Warning and Protection

At a high angle of attack lift is increased, but beyond a critical angle the airflow separates and becomes turbulent, causing lift to fall sharply — the wing/aircraft has **stalled**. Some aircraft give an inherent warning through **buffet** as the turbulent wake strikes the airframe/tailplane; aircraft without this characteristic need a stall-warning system.

- **Pneumatic stall warning system** (common on light aircraft) — a plenum chamber in the wing leading edge, covered by an adjustable plate with a slot positioned at the stagnation point in normal flight. As angle of attack increases the slot moves into an area of lower pressure, eventually drawing air through a horn/reed assembly in the cabin to emit a warning noise
- **Electric stall warning system** (typical of larger aircraft) — a micro-switch (transducer) operated by a vane at the stagnation point; as angle of attack increases, air loads on the vane overcome a spring to deflect it and close the switch, illuminating a warning light and sounding a horn just prior to the stall

Larger, more complex aircraft use a **stall protection system**, which provides more than warning:
- **Stall Warning** — tells the pilot a stall is being approached
- **Stall Identification** — detects an imminent stall and automatically takes action (e.g. the stick is automatically pushed forward by a hydraulic or pneumatic jack on the elevator control system) to prevent the stall occurring
- **Auto Ignition** — on rear-engine aircraft, disturbed intake airflow near the stall may flame out the engines; auto ignition may be initiated on a stall warning/identification condition
- **Flap/Slat/Krueger Flap Modulation** — because their position affects the stall angle, the system may monitor them and modify the stall warning threshold accordingly

Typical components: duplicated **stall warning sensors** (main-plane or fuselage mounted) feeding a **stall warning computer**; a **stick shaker** (electrically driven, out-of-balance rotor that shakes the control column); a **stick pusher** (hydraulic/pneumatic ram that pushes the control column forward, normally overridable by higher-than-normal pilot force); **ground/flight sensing** (landing gear weight switches disarm the system on the ground); a pre-flight **test** facility; and **Mach sensing** (an input from Mach switches or the air data computer, since speeds above the critical Mach number may cause a high-speed stall or flame-out).

In a representative large-aircraft system, four slotted conical **incidence probes** (two each side of the forward fuselage) rotate through **50° in pitch (4° of which are above the fuselage datum)**, detecting airflow direction and transmitting a voltage proportional to the angle between airflow and fuselage datum; the probes are ice-protected by heaters. **Nitrogen**, stored at **1,500 psi**, is piped via a stop valve and pressure-reducing valve to a low-pressure reservoir, with a relief valve venting at **52 psi**; low-pressure nitrogen feeds solenoid valves and a control ram on the control column linkage, with a STALL DUMP VALVE lever able to release line pressure and inhibit the stick pusher. Minimum HP nitrogen pressure for flight is **500 psi**; an LP red warning light illuminates if pressure falls to **32 psi**. Auto ignition switches on at a predetermined incidence (modified by slat position and Mach number, brought in earlier if slats are extended or **0.74 Mach** is exceeded). Stall identification operates only if armed by a prior stall warning signal, and a stick-shaker signal must have preceded it by **0.7 seconds** before an advanced (rate-modified) identification signal is accepted.

## Fly By Wire

**Fly By Wire (FBW)** replaces the conventional mechanical link between the pilot's controls and the control surfaces/servo valves with an electrical link; **Fly By Optical Wire (FBOW)** uses fibre-optic cable instead. FBW flying control actuators are of electro-hydraulic design, converting electrical signals into hydraulic ram movement. An optical fibre cable carries pulses of light without amplification or electromagnetic interference; one fibre can carry over **9,000 simultaneous signals**. Advantages of FBOW over FBW: more information can be carried, at higher transmission speed, with lighter weight.

Other inputs that can feed a Powered Flying Control Unit besides the pilot include: auto-stabilisation (variable incidence tailplane), datum shift from landing gear operation, Mach trim, the autopilot, Terrain Following Radar, Inertial Navigation System, Instrument Landing System, automatic airspeed control, and the position of secondary controls (flaps, leading-edge flaps, slats).

On a representative wide-body (777-type) FBW aircraft, the **Primary Flight Control System (PFCS)** uses digital and analogue electronics to control aircraft attitude, operating ailerons, flaperons, spoilers, the horizontal stabiliser, elevators and a tabbed rudder in response to flight crew and autopilot commands; the separate **High Lift Control System (HLCS)** uses digital electronics to operate the leading-edge slats, Krueger flaps and trailing-edge flaps for take-off and landing at lower speed and higher weight (ailerons and flaperons droop on both wings when the high-lift devices extend). Benefits of the fly-by-wire design include a more efficient structure, increased fuel economy, a smaller vertical fin and horizontal stabiliser, reduced weight, and improved controls and protections.

Pilot manual commands (control wheel, columns, rudder pedals, speedbrake lever) are converted by position transducers to analogue signals sent to **Actuator Control Electronics (ACEs)**, which digitise them for the **Primary Flight Computers (PFCs)**; the PFCs calculate commands based on control laws and flight envelope protection functions, and the ACEs convert digital commands back to analogue signals for the **Power Control Units (PCUs)**. The PFCS has three modes: **Normal** (full control laws, protections and autopilot available), **Secondary** (control laws and protections downgraded when important air/attitude data is lost; autopilot unavailable) and **Direct** (PFCs not used — ACEs set surface position directly from analogue pilot inputs).
        $cnt3$,
        12
    ) RETURNING id INTO s12_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M11A.10 Equipment and Furnishings (10 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s10_id, 'The types of safety equipment that must be carried on any specific flight are laid down in:',
     '[{"id":"a","text":"The Air Navigation Order (ANO), Schedule No. 4","correct":true},{"id":"b","text":"The engine type certificate only","correct":false},{"id":"c","text":"The passenger boarding pass conditions","correct":false}]',
     '{"B1"}'),

    (s10_id, 'Life jackets carried as emergency equipment use a co2 cylinder for inflation and are inspected for condition and inadvertent operation at intervals of:',
     '[{"id":"a","text":"6 months","correct":true},{"id":"b","text":"5 years","correct":false},{"id":"c","text":"Every flight","correct":false}]',
     '{"B1"}'),

    (s10_id, 'The water-activated light on a life jacket is checked for insulation resistance across its terminals, which should be at least:',
     '[{"id":"a","text":"1 Megohm","correct":true},{"id":"b","text":"1 ohm","correct":false},{"id":"c","text":"100 Megohms","correct":false}]',
     '{"B1"}'),

    (s10_id, 'Aircraft seat rails (seat tracks) are a continuous extrusion with circular cut-outs that allow seats to be attached and locked at different seat spacing (pitch), usually in increments of:',
     '[{"id":"a","text":"One inch or 25 mm","correct":true},{"id":"b","text":"One foot or 300 mm","correct":false},{"id":"c","text":"Ten inches or 250 mm","correct":false}]',
     '{"B1"}'),

    (s10_id, 'Compared with passenger seat lap straps, flight attendant seats are normally fitted with:',
     '[{"id":"a","text":"No restraint at all","correct":false},{"id":"b","text":"A full harness seat belt","correct":true},{"id":"c","text":"A two-point lap strap identical to passenger seats","correct":false}]',
     '{"B1"}'),

    (s10_id, 'The maximum number of passengers permitted in a cabin layout is governed by the requirement that the cabin must be evacuable through 50% of available exits within:',
     '[{"id":"a","text":"30 seconds","correct":false},{"id":"b","text":"90 seconds","correct":true},{"id":"c","text":"5 minutes","correct":false}]',
     '{"B1"}'),

    (s10_id, 'Passenger Service Units (PSU), located on the underside of overhead stowage lockers, normally contain reading lights, call buttons and seat belt/NO SMOKING signs, and on some aircraft also:',
     '[{"id":"a","text":"Drop-out oxygen masks","correct":true},{"id":"b","text":"Fire extinguisher bottles","correct":false},{"id":"c","text":"The aircraft''s main batteries","correct":false}]',
     '{"B1"}'),

    (s10_id, 'An LD2 container, as used in automatic cargo loading systems, is identified by a code letter that indicates it is a standard size container designed for:',
     '[{"id":"a","text":"The lower deck (LD)","correct":true},{"id":"b","text":"Overhead cabin stowage only","correct":false},{"id":"c","text":"Use exclusively on the flight deck","correct":false}]',
     '{"B1"}'),

    (s10_id, 'In an automatic cargo loading system, the Power Drive Unit (PDU) roller is raised from the floor level by a cam before it begins to rotate and drive the container; this raised clearance is approximately:',
     '[{"id":"a","text":"12 mm","correct":true},{"id":"b","text":"120 mm","correct":false},{"id":"c","text":"1.2 mm","correct":false}]',
     '{"B1"}'),

    (s10_id, 'Loose baggage in a cargo hold that is not carried in LD containers is usually restrained by:',
     '[{"id":"a","text":"Nets locked into the floor or walls of the bay","correct":true},{"id":"b","text":"Individual seat belts fitted to the cargo floor","correct":false},{"id":"c","text":"No restraint, since the hold is unpressurised","correct":false}]',
     '{"B1"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M11A.11 Fire Protection (11 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s11_id, 'The Fire (and Overheat) Protection system is normally split into two main subsystems:',
     '[{"id":"a","text":"Fire/Overheat Detection and Warning, and Fire Extinguishing","correct":true},{"id":"b","text":"Engine fire only and cabin fire only","correct":false},{"id":"c","text":"Smoke detection and hydraulic isolation","correct":false}]',
     '{"B1"}'),

    (s11_id, 'Fire/overheat detectors fall into two main groups: Unit (Spot) Type detectors and:',
     '[{"id":"a","text":"Continuous Loop (Firewire) Type detectors","correct":true},{"id":"b","text":"Radar-based detectors","correct":false},{"id":"c","text":"Manual visual inspection ports only","correct":false}]',
     '{"B1"}'),

    (s11_id, 'A continuous loop (firewire) fire detector uses the principle of capacitance and resistance; a rise in temperature at any point along the loop causes:',
     '[{"id":"a","text":"A sharp fall in electrical resistance and a rise in capacitance","correct":true},{"id":"b","text":"A rise in electrical resistance and a fall in capacitance","correct":false},{"id":"c","text":"No measurable change in either resistance or capacitance","correct":false}]',
     '{"B1"}'),

    (s11_id, 'On a dual loop fire detection system with the selector set to BOTH, a full fire warning is generated when:',
     '[{"id":"a","text":"Either Loop A or Loop B alone detects a fire condition","correct":false},{"id":"b","text":"Both Loop A and Loop B detect a fire condition","correct":true},{"id":"c","text":"The loop test button is pressed, regardless of loop condition","correct":false}]',
     '{"B1"}'),

    (s11_id, 'An engine is typically divided into a hot zone and a cool zone for fire zoning purposes. The hot zone comprises:',
     '[{"id":"a","text":"The intake, compressors and accessory drives","correct":false},{"id":"b","text":"The combustion chamber, turbines and exhaust areas","correct":true},{"id":"c","text":"The engine pylon only","correct":false}]',
     '{"B1"}'),

    (s11_id, 'Carbon Monoxide is considered especially dangerous because:',
     '[{"id":"a","text":"It has a strong, easily recognised odour that causes panic","correct":false},{"id":"b","text":"Only a minute amount, approximately 2 parts in 10,000, causes loss of attention and headaches, and it is colourless, odourless and tasteless","correct":true},{"id":"c","text":"It is heavier than air and only affects cargo holds","correct":false}]',
     '{"B1"}'),

    (s11_id, 'A photoelectric smoke detector works by:',
     '[{"id":"a","text":"Sensing light refracted by smoke particles onto a photoelectric cell, changing the current it conducts","correct":true},{"id":"b","text":"Measuring the electrical resistance of the surrounding air","correct":false},{"id":"c","text":"Weighing the accumulated particulate matter in a filter","correct":false}]',
     '{"B1"}'),

    (s11_id, 'In an ionisation type smoke detector, the presence of smoke in the chamber:',
     '[{"id":"a","text":"Increases the ionisation current until a warning is triggered","correct":false},{"id":"b","text":"Decreases the level of ionisation and reduces the current, triggering a warning when it falls to a specific level","correct":true},{"id":"c","text":"Has no effect on the ionisation current","correct":false}]',
     '{"B1"}'),

    (s11_id, 'Each bottle in an integral engine fire extinguisher system typically has two explosive cartridges, known as:',
     '[{"id":"a","text":"Squibs","correct":true},{"id":"b","text":"Relief valves","correct":false},{"id":"c","text":"Rupture discs","correct":false}]',
     '{"B1"}'),

    (s11_id, 'A small, automatic fire extinguisher fitted in a toilet waste bin typically discharges via a fusible plug that melts at approximately:',
     '[{"id":"a","text":"75°C","correct":true},{"id":"b","text":"750°C","correct":false},{"id":"c","text":"7.5°C","correct":false}]',
     '{"B1"}'),

    (s11_id, 'Dry powder hand-held fire extinguishers should never be used on the flight deck mainly because:',
     '[{"id":"a","text":"They are too heavy to be carried in the cockpit","correct":false},{"id":"b","text":"They cause loss of visibility and can interfere with some electrical equipment","correct":true},{"id":"c","text":"They are only effective on Class A combustibles such as wood and paper","correct":false}]',
     '{"B1"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M11A.12 Flight Control Systems (21 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s12_id, 'According to the EASA 66 syllabus definition referred to in this module, the primary flight controls include:',
     '[{"id":"a","text":"Ailerons, elevators and rudders only, never spoilers","correct":false},{"id":"b","text":"Ailerons, elevators, rudders, and spoilers","correct":true},{"id":"c","text":"Trim tabs, flaps and slats only","correct":false}]',
     '{"B1"}'),

    (s12_id, 'On some large turbine aircraft with two sets of ailerons, at high speed hydraulic isolate valves cut power to the outer (wingtip) ailerons so that only the inboard ailerons operate. If the outer ailerons were instead operated at high speed, the resulting wing leading-edge twist could produce a condition known as:',
     '[{"id":"a","text":"Aileron reversal","correct":true},{"id":"b","text":"Mach tuck","correct":false},{"id":"c","text":"Dutch roll","correct":false}]',
     '{"B1"}'),

    (s12_id, 'Ground spoilers, as distinct from flight spoilers, are:',
     '[{"id":"a","text":"Used only on the ground, operating with the flight spoilers to reduce lift and increase drag after landing","correct":true},{"id":"b","text":"Used only in cruise flight to fine-tune the lift distribution","correct":false},{"id":"c","text":"Positioned outboard of the flight spoilers at all times","correct":false}]',
     '{"B1"}'),

    (s12_id, 'A servo tab differs from a balance tab in that:',
     '[{"id":"a","text":"The pilot''s input moves only the tab, and airflow force on the tab then moves the primary control surface","correct":true},{"id":"b","text":"The tab always moves in the same direction as the main surface","correct":false},{"id":"c","text":"It is only ever used to add artificial loading to make the controls feel heavier","correct":false}]',
     '{"B1"}'),

    (s12_id, 'An anti-balance tab, often fitted to stabilators, has the effect of:',
     '[{"id":"a","text":"Reducing the pilot''s control effort in the same way as a balance tab","correct":false},{"id":"b","text":"Adding loading to the pilot''s pitch control to make it feel heavier","correct":true},{"id":"c","text":"Automatically returning the surface to neutral when released","correct":false}]',
     '{"B1"}'),

    (s12_id, 'On a fully powered (irreversible) flying control system, trimming is achieved by:',
     '[{"id":"a","text":"A conventional trim tab on the trailing edge of the control surface","correct":false},{"id":"b","text":"An electric trim strut/actuator that repositions the null position of a self-centring spring device in the input system","correct":true},{"id":"c","text":"Bending a fixed metal tab on the ground by trial and error","correct":false}]',
     '{"B1"}'),

    (s12_id, 'A variable incidence tailplane trim system alters aircraft pitch trim by:',
     '[{"id":"a","text":"Deflecting the elevators only","correct":false},{"id":"b","text":"Altering the angle of incidence of the whole tailplane via a screw jack at its forward end","correct":true},{"id":"c","text":"Changing the camber of the wing trailing edge","correct":false}]',
     '{"B1"}'),

    (s12_id, 'A tandem PFCU consists of a single jack ram with two pistons in co-axial cylinders, each fed by a separate hydraulic circuit. If one hydraulic supply fails:',
     '[{"id":"a","text":"The whole control surface immediately locks in position","correct":false},{"id":"b","text":"The affected piston free-strokes while the other piston continues to operate the control surface","correct":true},{"id":"c","text":"Both pistons stop working simultaneously","correct":false}]',
     '{"B1"}'),

    (s12_id, 'In a duplicate/triplicate PFCU arrangement where each control surface is split into independent segments, if one PFCU malfunctions and is switched off, its segment will:',
     '[{"id":"a","text":"Be blown back to a neutral position by aerodynamic loads and held by a lock","correct":true},{"id":"b","text":"Continue to move under full hydraulic power regardless","correct":false},{"id":"c","text":"Jam permanently in its last commanded position","correct":false}]',
     '{"B1"}'),

    (s12_id, 'A self-contained PFCU is independent of the aircraft''s hydraulic system because it is powered by:',
     '[{"id":"a","text":"A dedicated integrally mounted hydraulic generator driven by a 3-phase electric motor","correct":true},{"id":"b","text":"Compressed nitrogen from the stall protection system","correct":false},{"id":"c","text":"A direct mechanical linkage from the engine gearbox","correct":false}]',
     '{"B1"}'),

    (s12_id, 'Geared controls, used to prevent over-sensitivity of primary controls at high speed, work by:',
     '[{"id":"a","text":"Altering the effective radius of the control rod attachment on an idler lever via a single-acting hydraulic jack","correct":true},{"id":"b","text":"Disconnecting the control surface completely above a set airspeed","correct":false},{"id":"c","text":"Increasing hydraulic pressure to the PFCU as airspeed increases","correct":false}]',
     '{"B1"}'),

    (s12_id, 'On a typical Boeing 747 leading edge flap system with 22 variable-camber flaps and 6 Krueger flaps, the pneumatic drive is the primary source of power. The approximate leading edge flap extension/retraction times are:',
     '[{"id":"a","text":"9 seconds pneumatic, 90 seconds electric","correct":true},{"id":"b","text":"90 seconds pneumatic, 9 seconds electric","correct":false},{"id":"c","text":"9 seconds for both pneumatic and electric drive","correct":false}]',
     '{"B1"}'),

    (s12_id, 'On a typical speed brake/ground spoiler control system, Rotary Variable Differential Transducers (RVDTs) convert control wheel inputs into electrical signals, which are processed by Spoiler Control Modules (SCMs) to command:',
     '[{"id":"a","text":"Power Control Actuators (PCAs) that raise the spoilers","correct":true},{"id":"b","text":"The autopilot flight director computers directly","correct":false},{"id":"c","text":"The main landing gear brake units","correct":false}]',
     '{"B1"}'),

    (s12_id, 'On a typical Airbus-style electrical flight control system, the side-stick controllers used for manual pitch and roll control are:',
     '[{"id":"a","text":"Mechanically interconnected only, with no electrical coupling","correct":false},{"id":"b","text":"Electrically coupled","correct":true},{"id":"c","text":"Only active when the autopilot is engaged","correct":false}]',
     '{"B1"}'),

    (s12_id, '"Q" feel is an artificial force felt at the control column that increases with aerodynamic (dynamic) pressure. Dynamic pressure Q is given by:',
     '[{"id":"a","text":"Q = ½ρV²","correct":true},{"id":"b","text":"Q = ρV","correct":false},{"id":"c","text":"Q = 2ρV²","correct":false}]',
     '{"B1"}'),

    (s12_id, 'In a hydraulic "Q" feel system, at zero airspeed (static conditions) with no pitot pressure resisting the servo valve piston:',
     '[{"id":"a","text":"Maximum feel force is simulated at the control column","correct":false},{"id":"b","text":"No feel is simulated, since the signal pressure lines are open to exhaust/return","correct":true},{"id":"c","text":"The Q feel jack is isolated and locked solid","correct":false}]',
     '{"B1"}'),

    (s12_id, 'A typical Mach trim system operates within an Indicated Mach Number range of approximately:',
     '[{"id":"a","text":"0.68 to 0.84 IMN, active above 9,000 ft","correct":true},{"id":"b","text":"0.10 to 0.30 IMN, active only below 9,000 ft","correct":false},{"id":"c","text":"1.20 to 1.50 IMN, active only at sea level","correct":false}]',
     '{"B1"}'),

    (s12_id, 'On a typical rudder gust lock system, the aft installation (which locks the rudder) includes an electrical actuator; the forward installation caters for locking:',
     '[{"id":"a","text":"The aileron and elevator surfaces","correct":true},{"id":"b","text":"The nose wheel steering only","correct":false},{"id":"c","text":"The speed brakes only","correct":false}]',
     '{"B1"}'),

    (s12_id, 'During control system rigging, the force recorded on a spring balance at the instant the control first starts to move from rest is known as the:',
     '[{"id":"a","text":"Running friction","correct":false},{"id":"b","text":"Breakout force","correct":true},{"id":"c","text":"Proportional load","correct":false}]',
     '{"B1"}'),

    (s12_id, 'The final check required after any adjustment to a flying control system is always:',
     '[{"id":"a","text":"A duplicate check by a suitably qualified engineer","correct":true},{"id":"b","text":"A full engine ground run","correct":false},{"id":"c","text":"A weight and balance recalculation","correct":false}]',
     '{"B1"}'),

    (s12_id, 'A stick pusher, part of a stall protection system, is designed to:',
     '[{"id":"a","text":"Sound a warning horn only, with no physical control input","correct":false},{"id":"b","text":"Push the control column forward via a hydraulic or pneumatic ram when a stall identification condition is sensed","correct":true},{"id":"c","text":"Automatically retract the flaps to prevent a stall","correct":false}]',
     '{"B1"}'),

    (s12_id, 'In Fly By Wire (FBW) systems, the conventional mechanical link between the pilot''s controls and the control surfaces/servo valves is replaced by:',
     '[{"id":"a","text":"An electrical or fibre-optic cable link","correct":true},{"id":"b","text":"A pneumatic tube system","correct":false},{"id":"c","text":"A direct gear-driven mechanical shaft","correct":false}]',
     '{"B1"}');

END $$;
