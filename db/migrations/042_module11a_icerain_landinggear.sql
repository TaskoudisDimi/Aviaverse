-- Module 11A (Turbine Aeroplane, B1): Ice and Rain Protection, Landing Gear
-- Source: EASA Part-66 Module 11A official textbook (IKAROS Aviation Training Centre, IK M11A)

DO $$
DECLARE
    m11_id INT;
    s15_id INT;
    s16_id INT;
BEGIN
    SELECT id INTO m11_id FROM easa_modules WHERE code = 'M11';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M11A.15') THEN
        RAISE NOTICE 'M11A.15-M11A.16 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module M11A.15: Ice and Rain Protection
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m11_id, 'M11A.15', 'Ice and Rain Protection',
        $cnt$
# Ice and Rain Protection

## Introduction

Aircraft must be able to operate in all weather conditions, so it is essential that they are protected against the build-up of ice, which may affect safety and performance. Aircraft designed for public transport and some military aircraft must be provided with detection and protection equipment for flights where there is a probability of encountering icing (or rain) conditions.

Certain basic standards must also be met by all aircraft, whether or not they are required to carry full protection equipment, to provide reasonable protection if the aircraft is flown intentionally for short periods in icing conditions. These cover considerations such as stability and control balance characteristics, jamming of controls, and the ability of the engine to continue to function.

## Factors Affecting Ice Formation

Ice formation on aircraft in flight is the same as on the ground and is classified under four main headings: **Hoar Frost**, **Rime**, **Glaze Ice** and **Pack Snow**. Depending on circumstances, variations of these forms can occur, and two different types of icing may appear simultaneously on parts of the aircraft.

Ice in the atmosphere is caused by coldness acting on moisture in the air. Water occurs in the atmosphere in three forms: invisible vapour, liquid water and ice. The smallest drops of liquid water constitute clouds and fog, the largest drops occur only in rain, and drizzle drops lie in between. Snowflakes are produced when a number of ice crystals stick together or, in very cold regions, by small individual crystals.

## Types of Ice Formation

| Type | Formation | Characteristics |
|------|-----------|------------------|
| **Hoar Frost** | Forms in clear air when water vapour condenses on a cold airframe surface (below the frost point and below freezing) and converts directly to ice | White, semi-crystalline, normally feathery coating; on the ground may interfere with airflow, obscure the windscreen and affect free working of controls |
| **Rime Ice** | Aircraft flies through a cloud of small water drops with air and airframe temperature below freezing; droplets freeze instantly as individual particles | Less dense than glaze ice; opaque, rough, light and porous deposit with air trapped between particles; builds up on the leading edge but does not extend far back along the chord; interferes with airflow over the wings |
| **Glaze Ice** | Aircraft encounters large water drops in cloud or freezing (super-cooled) rain, with air and airframe temperature below freezing; liquid water flows over the airframe before freezing | Transparent or opaque, glassy, dense and tough coating that sticks closely to the surface; forms in **greatest thickness on the leading edges** and in reduced thickness as far aft as **one half of the chord**; the **most severe and dangerous** form of icing because of its high rate of catch; comes away in lumps if it breaks off |
| **Pack Snow** | Snow falling on an aircraft in flight does not normally settle, but if the airframe is below freezing, glaze ice may form from the moisture in the snow | Snow may become embedded in the ice so formed; icing is primarily due to water drops, not the snow itself |
| **Hail** | Water droplets falling as rain pass through icing levels and freeze; storm clouds (cumulonimbus) may carry hail vertically through the cloud repeatedly, increasing hailstone size at each pass | Can cause severe damage: dented skin, cracked windscreens, blocked intakes and serious damage to gas turbine engines |

## Areas to be Protected

The following are critical areas where ice forms and protection is essential:
- All aerofoil leading edges
- Engine air intakes (including carburettor intakes)
- Windscreens
- Propellers
- Pitot static pressure heads

### Effects of Ice Accretion in Flight

- **Decrease in lift** — due to loss of streamlined flow around the leading edge and top surfaces
- **Increase in drag** — the rough surface (especially rime) greatly increases surface friction
- **Increased weight and wing loading** — the weight of ice may prevent the aircraft from maintaining height
- **Decrease in thrust** — with turbo-prop and piston engines, propeller efficiency falls as blade profile and thickness alter, and vibration may occur due to uneven ice distribution; gas turbine engines may suffer disturbed compressor airflow, and ice breaking away from the intake may be ingested, damaging compressor blades
- **Inaccuracy of Pitot static instruments** — ice on the pitot static head blocks sensing lines and produces false readings
- **Loss of inherent stability** — due to displacement of the centre of gravity caused by the weight of the ice
- **Reduced radio antennae efficiency**
- **Loss of control** — ice may prevent movement of control surfaces (not usually a problem in flight, but may occur on the ground)

### Additional Effects on the Ground

- Restriction of controls if ice is not removed from hinges and gaps
- Increased take-off run due to increased weight and drag
- Reduced rate of climb due to increased weight and drag

## Ice Detection

The ANO Schedule 4 states that, for an aircraft of MTWA exceeding **5,700 kg (12,500 lb)**, a means of observing the existence and build-up of ice must be provided. The equipment is carried on flights when weather reports or forecasts at the aerodrome, at the time of departure, indicate that conditions favouring ice formation are likely to be met.

### Methods of Ice Detection

- **Visual (Hot Rod) Ice Detector** — an aluminium alloy plinth (with a built-in floodlight) carries a steel tube detector mast of aerofoil section, angled back from the vertical and mounted on the fuselage side so it can be seen from the flight deck. The mast houses a heating element, normally off; ice accretes on the leading edge of the mast where it can be observed, and the heating element can be switched on to disperse the ice for further observance.
- **Pressure Operated Ice Detector Head** — a short stainless steel or chromium-plated brass tube mounted vertically on a part of the aircraft known to be susceptible to icing, closed at its outer end. Four small holes are drilled in the leading edge and two holes (of less total area) in the trailing edge; a heater element clears the head of ice. In normal flight, airstream pressure builds up inside the tube and expands a capsule in an electro-pneumatic relay, separating a pair of contacts. When ice forms and closes the leading-edge holes, the trailing-edge holes (uncovered) allow the airstream to exhaust the system, collapsing the capsule and closing the relay contacts — illuminating a warning indicator and switching on the head heater. A cam holds the warning lamp on for a further 4 minutes and the heater on for a further 30 seconds; the cycle repeats if icing persists.
- **Serrated Rotor Ice Detector Head** — a serrated rotor, driven by a small AC motor via a reduction gearbox, rotates adjacent to a fixed knife-edge cutter, with its periphery within 0.050 mm (0.002 in) of the cutter. Under non-icing conditions the drive torque is slight (only bearing friction). Under icing conditions, ice accretes on the rotor until the gap is filled; the knife edge then cuts the ice, producing a substantial torque increase that moves a spring-mounted toggle bar and operates a micro-switch to give a warning. When icing ceases, torque loading reduces and the micro-switch opens the warning circuit.
- **Vibrating Rod Ice Detector** — a solid-state detector probe, exposed to the airstream, that vibrates ultrasonically in an axial mode at its own resonant frequency of approximately **40 kHz**. Ice forming on the sensing element decreases the probe frequency; the detector circuit compares this with a reference oscillator, and at a predetermined frequency change the ice warning light is illuminated and a timer circuit switches on a probe heater to clear the ice, then returns the system to detector mode if icing has ceased. A further ice warning signal during the timer period re-triggers the timer.
- **Ice Formation Spot Light** — many aircraft have two spotlights, one each side of the fuselage, to illuminate the leading edges of the mainplanes for visual examination; on some aircraft this may be the only method of ice detection.

## Anti-Icing and De-Icing Systems

Ice protection methods fall into one of two main categories:

- **De-Icing** — ice is allowed to form on the surfaces and is then removed by operating the system in a specified sequence
- **Anti-Icing** — ice is prevented from forming by ensuring the protection system is operating whenever icing conditions are encountered or forecast

There are **four primary systems** used for ice protection: **Fluid**, **Pneumatic**, **Thermal** and **Electrical**.

## Fluid Systems

Fluid systems may be used as either anti-icing or de-icing. As an anti-icing system, a fluid with a low freezing point is applied to the protected areas before icing occurs, lowering the freezing point of water. As a de-icing system, fluid is applied to the interface between the aircraft surface and the ice, breaking the ice's adhesion so it is carried away by the airflow. The system is normally used on windscreens, aerofoils and propellers; it is **not used on engine air intakes**, which are usually anti-iced by other means.

- **Windscreen protection** — an **alcohol-based** fluid is sprayed on to the windscreen panel. Principal components: fluid storage tank, hand-operated or electrically driven pump, supply pipelines and spray tubes.
- **Aerofoil systems** — the fluids used are **glycol-based**, with a low freezing point, non-corrosive, low toxicity and low volatility; however, they can have a detrimental effect on some windscreen sealing compounds and cause crazing of perspex panels. Components: tank, pump, filter, pipelines, distributors, switch, pump-failure warning light and tank contents indicator. Fluid is gravity-fed to the pump then pumped to leading-edge distributors; after an initial continuous-run 'flood' period to prime the lines and wet the leading edge, a cyclic timer switches the pump ON and OFF for predetermined periods. Leading-edge distributors are of **strip** type (a 'U' channel with porous metal spreader, now rare, found only on very old aircraft) or **panel** type (a micro-porous stainless steel outer panel and micro-porous plastic sheet, with a metering tube calibrating flow rate into a cavity through which fluid seeps).
- **Propeller systems** — the leading edge of the propeller blade root and a section of blade is de-iced; fluid is fed via a pipeline from a slinger ring on the spinner back plate to a rubber cuff at the blade root, then spread along the leading edge by centrifugal force, which also sheds the ice.

## Pneumatic Systems

Pneumatic (mechanical) systems are used for **de-icing only** — they cannot prevent ice formation. They work by cyclic inflation and deflation of rubber tubes (de-icer boots or overshoes) on aerofoil leading edges, and are used on certain piston-engine and twin turbo-propeller aircraft. Boots consist of layers of natural rubber and rubberised fabric with flat inflatable tubes (laid spanwise, chordwise or both) between them, fitted along the leading edges of wings and stabilisers, attached by screw fasteners or cementing. The external surface is coated with a conductive film to bleed off static electricity.

- **Air supplies** — the tubes are inflated by air from the pressure side of an engine-driven vacuum pump or, on some turbo-propeller aircraft, from an engine compressor tapping. Deflation is by vacuum from the vacuum pump or from the venturi of an ejector nozzle (compressor-tapping systems).
- **Distribution** — three methods are in general use: shuttle valves controlled by a separate solenoid valve, individual solenoid valves to each boot, or motor-driven valves.
- **Controls and indication** — typically a main ON/OFF switch and pressure/vacuum gauges or indicating lights; timing control of the pressure/vacuum sequence is usually by an electronic device.
- **Operation** — when switched on, pressure inflates groups of tubes in sequence, cracking and shedding the ice; at the end of the inflation stage the tubes are vented and fully deflated by vacuum. This cycle repeats while the system is on. When switched off, vacuum is supplied continually to hold the boots flat against the leading edges, minimising aerodynamic drag.

## Thermal (Hot Air) System

Heated air is ducted span-wise along the inside of the leading edge, distributed between double-thickness skins, entering at the stagnation point (where maximum temperature is needed) and flowing back chord-wise through corrugations to exhaust points. In anti-icing systems a continuous supply of heated air is fed to the leading edges; in de-icing systems more intensely heated air is supplied for shorter periods on a cyclic basis. Hot gas may be derived from heat exchangers around exhausts, independent combustion heaters, or direct tappings from turbine engine compressors.

- **Exhaust gas heating system** — ambient air enters an intake on the engine nacelle and passes through heat-exchanger tubes; exhaust gases are partially diverted by electrically actuated flaps to flow between the tubes before discharging overboard. The gas-flap actuator and hot-air-valve actuator are electrically interlocked so that the hot air valve must be fully open before the gas flap opens, and the gas flap must be fully closed before the hot air valve closes — preventing overheating of the heat exchanger. An emergency manual override can close the hot air valve and open a spill valve to dump hot air overboard if the gas flap fails open.
- **Hot air bleed system** — air is bled from a late stage of the gas turbine engine compressor and distributed to leading edges (wing, tail, and sometimes engine intakes) at temperatures of about **200°C**; wing and fuselage cross-over ducts ensure supply to all surfaces if an engine is shut down in flight. Air temperature may be controlled by mixing compressor bleed air with ram air via a cold air control valve; temperature sensors in the leading edge monitor the rise and progressively adjust the cold air valve via an inching unit. If the temperature sensor, cold air valve, or ram air inlet fails, an overheat sensor takes over control via the hot air valve.

## Electrical Ice Protection

Electrical heater elements are attached to the outer surface of the protected area, using either a **heater mat** or **spray mat**.

- **Heater mat** — two thin layers of rubber or PTFE sandwiching a heater element, moulded to fit the protected section; the latest mats use elements made from alloys woven in continuous filament glass yarn.
- **Spray mat** — developed by the Napier Company, sprayed directly on to the surface, well suited to compound curves. A base insulator of synthetic resin (about 0.03 in thick) is brushed on to the airframe; the heater element (aluminium or Kumanol, a copper-manganese alloy) is flame-sprayed on to it; a further insulation layer (about 0.01 in thick) is added; a protective 'stoneguard' coating of stainless alloy particles bonded with synthetic resin is applied where extra mechanical protection is needed, e.g. on leading edges.

Some elements are supplied continuously (anti-icing); others intermittently on a cyclic basis (de-icing). Continuously heated 'breaker' strips separate cyclically heated areas to ensure a clean breakaway of ice.

- **Anti-icing** — heat is supplied continuously, graded so no ice forms under operating conditions, regulated by an embedded sensing element with a thermal controller, or a surface-mounted thermostatic switch with pre-set cut-in/cut-out temperatures.
- **Cyclic de-icing** — areas are grouped and connected to a cyclic switch, controlled by timed impulses from a pulse generator or a built-in electronic device. Higher ambient temperatures need shorter heating periods (despite a higher icing rate); lower temperatures need longer heating periods, but the ratio of ON time to OFF time stays the same — the typical ratio is **1:10**. Power may be DC, single-phase AC or 3-phase AC; in 3-phase systems heated areas are arranged for balanced loading, with OFF periods for some areas coinciding with ON periods for others.

## Windscreen Anti-Icing

Windscreens and other critical cockpit windows on high-performance pressurised aircraft use a **laminated glass** construction: sheets of clear vinyl plastic (polyvinyl butyral) interposed between layers of preformed, pre-tempered glass, bonded under pressure and heat, giving shatterproof and bird-proof characteristics.

The bird-proof characteristics depend on the plasticity — and therefore the temperature — of the vinyl. The optimum temperature range for maximum energy absorption is between **27°C and 49°C**, within which electrically heated windscreens are normally maintained. Below this range, impact resistance can be reduced by **30% to 50%** at a still-moderate temperature of **16°C**.

The heating element is an extremely thin, transparent conductive coating (tin oxide or gold film) floated on to the inside surface of the outer glass ply, heated by alternating current supplied to busbars at the panel edges. A controlling device maintains a constant windscreen temperature and prevents overheating of the vinyl inter-layer(s), connected to embedded temperature-sensing elements. Two sensing methods are commonly used:
- A **grid** whose resistance varies directly and linearly with temperature
- A **thermistor** whose resistance varies inversely and exponentially with temperature

When the glass reaches the normal operating temperature, the sensing element's resistance change causes the controller to isolate the heating supply; when the glass cools, power is reapplied and the cycle repeats. If the controller fails, glass temperature rises until an overheat sensing element trips an overheat control circuit, cutting the heating supply and illuminating a warning light.

## Windscreen and Cabin Window De-Misting

Because glass is a poor conductor of heat, at altitude the low atmospheric temperature can keep the inside of windscreens and cabin windows cold, causing condensation and obscured vision. Windscreens are normally kept mist-free by blowing hot air from the air conditioning system across the inner surface. Cabin windows (and often windscreens) additionally use **"dry air sandwich"** construction — outer and inner layers of glass sandwiching a layer of dry air, like double-glazing. The outer layer is thick laminate (glass and vinyl) for impact/shatterproof qualities; the thinner inner layer is warmed by cabin air, preventing condensation.

The air sandwich is kept dry by one of two methods:
- Hermetically sealing the two glass layers with dry air between them during manufacture
- Venting the space between layers to cabin pressure through a **desiccant unit** that absorbs moisture during venting

The desiccant used is **Silica Gel**, which is blue when dry and gradually changes to pink or white as it absorbs moisture; it must be replaced when it begins to turn pink, or condensation within the sandwich may result, requiring lengthy rectification or replacement of the window.

## Rain Repellent and Rain Removal

Vision through windscreens may be obscured by rain, dust, dirt and flies, so windscreen clearing systems are provided. These fall under rain clearing systems, comprising: **windscreen wipers**, **pneumatic rain removal**, **rain repellent** and **windscreen washing**.

### Windscreen Wiper Systems

- **Electrical system** — wiper blades are driven by an electric motor, sometimes with separate motors for pilot and co-pilot to keep at least one screen clear if a system fails. A motor-converter assembly converts rotary motor motion to reciprocating wiper-arm motion. Selecting "high" energises both relays, putting the fields in parallel, giving approximately **250 strokes/minute**; selecting "low" energises only relay 1, putting the fields in series, giving approximately **160 strokes/minute**. Selecting OFF lets the relay contacts return to normal, but the motor keeps running until the wiper reaches the "park" position, where reversed excitation moves it off the screen edge, opens the park switch, de-energises the motor and applies a brake solenoid to prevent it re-closing the park switch.
- **Electro-hydraulic system** — used on older aircraft, with two independently operated hydraulic motors (one per hydraulic system) and control valves selected from the flight deck.
- **Wiper path** — may sweep an arc or a parallel motion; parallel motion gives a greater swept area but a more complex mechanism.
- **Servicing** — inspection covers cleanliness, security, damage and blade condition (replaced at regular intervals). During an operational check the windscreen must be kept wet with water — wipers must **never** be operated on a dry screen, as this may cause scratches. Blade tension is checked with a spring balance lifting the arm at 90°; blade angle is adjusted to prevent the blade striking the windscreen frame.

### Pneumatic Rain Removal

Windscreen wipers suffer two problems: aerodynamic forces at speed reduce blade pressure on the screen, and it is hard to achieve oscillation rates fast enough to clear heavy rain. Pneumatic rain clearance systems overcome these by blowing high-pressure bleed air from the gas turbine engine over the windscreen face from ducts at the base of the screen, forming an air barrier that prevents rain spots from striking the screen.

### Windscreen Washing System

A spray of fluid (usually de-icing fluid, e.g. Kilfrost) is directed on to the windscreen through nozzles to help the wipers clear dust and dirt from dry windscreens, in flight or on the ground. Fluid is contained in a reservoir and directed to the nozzles by an electrically driven pump, or by pressurising the reservoir with compressor bleed air via a pressure-reducing valve.

### Rain Repellent

When treated with certain chemicals (typically silicone-based), a windscreen causes water to break up into beads rather than spread as a film, leaving the glass dry between the beads so the water can be readily removed. The chemical is stored in a pressurised, disposable can and discharged through propelling nozzles, usually under control of a time-delay unit, for about **5 seconds** per application, using about **5 cc** of fluid from a canister holding approximately **50 cc**; the button must be re-selected for a further application. It is essential the system is not operated on a dry windscreen, since undiluted repellent will smear and may form globules that distort vision. The system is normally used to supplement the wipers in heavy rain at low altitude and low airspeed, and may be used with or without wipers. If inadvertently operated on a dry screen, the wipers must not be used (this increases smearing) — the screen should instead be washed with clean water immediately. Rain repellent residues can cause staining or minor corrosion of the aircraft skin.

### Drain Mast Heating

On many large aircraft, water supply and drain lines are electrically heated (heater tapes and blankets, controlled by thermostats) to prevent ice formation, powered via the AC bus and available on the ground and in flight. On a typical aircraft (Boeing 757), the thermostats open the heating above **15.5°C** and close it at **7.2°C**. Drain masts themselves are heated to allow in-flight drainage without freezing, controlled by an air/ground relay — low heat is supplied on the ground and high heat in flight.
        $cnt$,
        15
    ) RETURNING id INTO s15_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module M11A.16: Landing Gear
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m11_id, 'M11A.16', 'Landing Gear',
        $cnt2$
# Landing Gear

## Introduction

Landing gears have two main functions:
- Supporting the weight of the stationary aircraft on the ground
- Absorbing the loads during touchdown, the landing run and taxiing

Landing gear is divided into two main categories: **fixed (non-retractable)** or **fully retractable**. Early aircraft had fixed landing gear, which produced a large amount of parasitic drag in flight; since drag increases at the square of forward speed, this became increasingly prohibitive as aircraft got faster. In the short term this was resolved with streamlined fairings over the wheels, but it soon became clear that drag could be almost completely eliminated if the gear were retracted and stowed out of the airstream after take-off.

## General

Early landing gear consisted of two main legs set just in front of the aircraft's centre of gravity (C of G) with a small tailwheel at the rear of the fuselage. Placing the C of G just aft of the main gear ensured the aircraft quickly attained flying attitude on take-off, and the inclined fuselage gave the (propeller-driven) aircraft of the time ample propeller-to-ground clearance. The main disadvantages were the risk of the aircraft 'nosing over' under heavy braking, and poor crew visibility during taxiing and the early take-off run.

This was overcome by the **tricycle configuration**, now used almost exclusively, which places the main landing gear aft of the C of G and a supporting nose gear at the front of the fuselage. As aircraft became larger and heavier, landing gear design came to include multi-leg and multi-wheel configurations.

## Construction

All landing gears attach to strong points on the fuselage or wing structure so that landing loads are absorbed and transferred safely to the aircraft structure.

- Smaller light aircraft may use a **steel leaf or tubular steel spring** as the undercarriage: one end attaches to an airframe strong point, the wheel and axle are on the other end, and deflection of the spring tube absorbs the landing loads. A properly conducted landing will not cause any undercarriage rebound.
- Another simple method uses an elastic **bungee cord**, encased in loose-weave cotton braid, located on support struts carrying the wheel and axle; the cord stretches on landing to transfer the landing forces into the airframe.
- Larger, more modern aircraft use complex, heavier retractable systems. Each landing gear unit is basically a wheeled shock absorber (**oleo**): a forged cylinder body is attached to the airframe on trunnions, allowing it to pivot when raised and lowered. Articulated **side stays** between the cylinder body and airframe strong points give the leg strength, rigidity and the ability to fold; **drag or bracing struts** may also be fitted to absorb high acceleration loads on take-off and deceleration loads during braking.
- The wheel and axle assembly (**bogey**) attaches to the piston end. A hinged **torque (scissor) link**, between the axle yoke and the cylinder body, allows the piston to move freely in and out of the cylinder but prevents the piston/wheel assembly from swivelling.
- Two actuators are usually fitted: a **main actuator**, attached to the cylinder body, to raise and lower the gear; and a **downlock actuator**, located on the bracing strut, which mechanically locks the gear when lowered and unlocks the mechanism before raising.
- A **hop damper** is often used with multi-wheel units to align the bogie at the correct angle for landing and to absorb minor shock loads during taxiing; it connects between the main landing gear body and the bogie.

## Multiple Axles and Wheels

To allow maximum utilisation of aircraft operating from different runways, multi-wheel landing gear is used, in single, double, tandem or bogie configurations.

**Advantages of multi-wheel configurations:**
- Spread landing loads over a larger area (footprint)
- Easier to stow, as wheel volume is reduced
- Greater safety — a burst tyre is not as critical, since the remaining wheels accept the extra load

**Disadvantages:**
- More moving parts, requiring more maintenance
- More expensive to produce
- Larger footprint increases the turning circle needed to prevent the tyres crabbing and wearing excessively

## Shock Absorbing

To absorb and dissipate the shock loads of landing, kinetic energy from the impact must be converted into other forms of energy. Most landing gear legs use self-contained hydraulic shock-absorbing struts. Three main types of strut are used on commercial aircraft:

- **Oleo-pneumatic without separator**
- **Oleo-pneumatic with separator**
- **Liquid spring**

### Oleo-Pneumatic Without Separator

This strut uses compressed gas (normally **nitrogen**) combined with a specific quantity of hydraulic oil — an outer cylinder with an inner hollow piston inserted. When airborne, the piston fully extends under nitrogen pressure; the lighter nitrogen settles in the upper cylinder above the heavier oil. Since there is no separator, some aeration ('froth') occurs where the oil and gas mix at the demarcation line.

On landing, the inner piston is forced up into the outer cylinder, reducing internal volume. A tapered **metering pin** and **snubber knob**, integral with the piston, are forced into a **snubber tube** on the outer cylinder; oil is forced into the upper chamber through holes in the snubber tube and an open flapper valve, and the tapered metering pin steadily reduces the available orifice area as it compresses. Landing energy is absorbed both by the oil being forced through the ever-decreasing orifice and by compression of the nitrogen gas. On recoil, as the piston extends, the **flapper valve slams shut**, leaving only a reduced number of snubber-tube holes to transfer oil back into the piston; this restriction and the increasing internal volume prevent rapid extension, damping the recoil energy and preventing the aircraft bouncing back off the runway.

### Oleo-Pneumatic With Separator

Operates on the same principle as the type above, but includes a **floating piston** that separates the oil chamber from the nitrogen chamber, preventing the oil and gas from mixing. This also means the nitrogen chamber does not have to be positioned at the top of the leg, or limited to one chamber. This design makes shock absorbing more efficient, gives less severe jolting during taxiing, and simplifies servicing.

### Liquid Spring

This type has no gas compartment. It relies on the fact that if a piston is forced into a cylinder completely filled with oil under static pressure, energy absorption occurs through oil compression. Oil is normally considered incompressible, and at typical hydraulic system pressures (around **3,000 psi**) compression is negligible; but in liquid spring struts, pressures in excess of **60,000 psi** are often generated, at which point the oil does compress. During touchdown the piston is forced into the upper cylinder as before, compressing the oil as the volume progressively reduces — a process known as **'jack ram displacement'**. A restrictor valve absorbs the recoil in a similar manner to the other two types.

## Servicing — Filling and Charging

To guarantee correct operation, the shock strut must be filled with the correct quantity of oil (completely free of air) and the nitrogen chamber charged to the correct value, maintaining the correct oil/gas ratio. When correctly filled and charged, the strut adopts the correct extension on the ground and avoids the piston 'bottoming' against the outer cylinder during touchdown. A typical sequence for an oleo-pneumatic without separator strut:

1. Position the aircraft on jacks with the wheels clear of the ground
2. Release the nitrogen pressure via the charging valve, leaving the valve open
3. Use a bottle jack to compress the leg fully
4. Open the hydraulic bleed valve and pump oil in until fresh, air-free oil emerges from the bleed valve
5. Close and tighten the oil charging valve and bleed valve
6. Remove the bottle jack, connect a nitrogen rig, and inflate the leg until fully extended at the gas pressure specified in the AMM
7. Close and tighten the nitrogen charging valve and remove the rig; repeat on the other leg; lower the aircraft off jacks

For an oleo-pneumatic **with** separator, an additional procedure is needed to ensure the separator is correctly positioned before deflating the nitrogen pressure. A **liquid spring** strut follows a similar oil filling/bleeding procedure but has no nitrogen charging step. In service, shock strut serviceability can be monitored using a **pressure/extension graph**, with nitrogen pressure adjusted as required.

## Extension and Retraction Systems

Retracting the landing gear becomes economically practical once the parasite drag of the extended gear exceeds the induced drag caused by the added weight of the retraction system. Raising and lowering is done hydraulically or pneumatically via a cockpit selector lever, mechanically or electrically linked to a **selector valve**, which directs fluid to one side or the other of the actuator piston.

The gear is uplocked and downlocked mechanically or hydraulically through **uplock boxes** and **downlock toggle levers**. Leg positions are sensed by proximity switches or microswitches and transmitted to the cockpit instrumentation via a control unit. In the event of fluid or electrical failure, a mechanical **emergency lowering system** is available: an emergency handle in the cockpit operates push-pull cables and gearboxes to release the uplocks, and the selector (or a freefall) valve opens all extension/retraction lines to return, allowing the gear to fall under gravity and aerodynamic forces, possibly assisted by a spring or gas-operated free-fall assister.

Smaller light aircraft may use electric motors driving actuators, a winding cable system, a simple lever with safety locks, or a manual hydraulic jacking system. Most modern light aircraft use a self-contained, lightweight **hydraulic power pack** containing the fluid reservoir, sight glass, pressure pump, filter, thermal relief valve, pressure relief valve, and ground service/replenishment connections.

### Extension System

Selecting **GEAR DOWN** makes a micro-switch on the lever that powers up the hydraulic pump; pressure is fed to the uplock actuator valves, unlocking the uplocks (the hooks then remain mechanically open under spring pressure). Leg movement breaks the uplock limit switches, showing **red triangles** ('in transit', gear unlocked) on the instrument panel. The selector valve opens the down lines to the actuators and return lines to the reservoir; fluid pressure extends the actuators until the legs mechanically lock, after which excess pressure is bled back through the low pressure control valve. When all three wheels are down and locked, proximity switches signal a control unit, which turns off the hydraulic pump, closes the selector valve lines and shows **green triangles** ('locked down').

### Retraction System

Broadly the reverse of the extension procedure. Selecting **GEAR UP** makes a micro-switch that powers the pump; pressure is fed to the downlock actuators (unlocking the mechanical locks on the bracing struts) and to the selector valve (opening the uplines to the main actuators and return lines). Leg movement breaks the downlock proximity switches, showing red triangles. Fluid pressure retracts the legs via the main actuators; on full retraction the legs mechanically lock the uplocks, and excess pressure is bled back through the low pressure control valve. When all three wheels are up and locked, uplock limit switches signal the control unit to turn off the pump, close the selector valve lines, and change the red triangles to black.

If a red triangle remains on when the gear is fully extended or retracted, there is a **fault** in the system. A **squat switch** system and an electro-mechanical stop on the selector lever prevent the landing gear being retracted while the aircraft is on the ground; retraction is normally only possible once all landing gear legs have fully extended after take-off, as sensed by proximity switches on each leg.

## Selector Valve

On modern large aircraft the selector valve is normally operated by electrical solenoids signalled from micro-switches in the landing gear selector lever, though on some aircraft it is mechanically operated. A spool valve moves from neutral to one side or the other, directing hydraulic pressure to the appropriate side of the main actuator piston. Normal operation can be **overridden in an emergency**: the spool valve is moved mechanically by rods, cables and levers to open all lines for free flow of hydraulic fluid, normally interlinked with emergency mechanical opening of the uplocks.

## Uplock Mechanism

On large modern aircraft the uplocks operate mechanically during retraction: a roller on the landing gear leg engages the uplock hook, and limit switches sense engagement and turn off hydraulic pressure — the gear is then held retracted purely mechanically. Normal release is by a hydraulically actuated valve: supplied pressure pushes a plunger against the lock lever, rotating it about its pivot and allowing the uplock hook to disengage under its own spring tension, after which the main actuator extends the gear hydraulically.

## Downlock Mechanism

The downlock actuator may be single- or double-direction, depending on the aircraft. A single-direction actuator unlocks the downlock mechanism (upper and lower toggles) before retraction, the leg relying on its own extension to provide the over-centre lock; a double-direction actuator locks the mechanism on extension and unlocks it before retraction.

Once the gear is fully extended (sensed by a limit switch), hydraulic pressure extends the downlock actuator piston, which acts on a toggle lever to move both toggle levers to an **over-centre position**, forming a mechanical lock that prevents the leg collapsing. After landing and parking, a red-flagged **safety pin** is inserted through alignment holes in the toggle levers to prevent inadvertent collapse or retraction on the ground, and is removed before flight.

On selecting gear up, hydraulic pressure retracts the downlock actuator piston, moving the lower toggle to overcome the mechanical lock and shifting both toggle levers from over-centre to **under-centre**, so the leg can fold.

## Emergency Landing Gear Operation

If the actuator or hydraulic system fails, the uplocks can be released manually. An emergency landing gear lever, operated from the cockpit, rotates the hook locks to release the legs from the uplock hooks, and also operates a lever on the selector valve to open all hydraulic lines to return, allowing free flow of hydraulic fluid through the system. The legs then extend under gravity and aerodynamic forces, possibly assisted by spring or gas-operated free-fall assistors; proximity and limit switches continue to operate normally, giving cockpit indication of the gear in transit and down-locked. On aircraft with hydraulically sequenced doors, if the hydraulic system fails, the door jack is mechanically unlocked, also via a mechanical linkage connected to the cockpit's emergency release mechanism.

## Landing Gear Doors Sequencing

Landing gear bays have access doors that open and close with gear movement, either mechanically linked to the gear (by connecting rods, bellcranks and links) or operated hydraulically via a sequencing valve, signalled by micro-switches or proximity switches through a control unit. Some doors close again once the gear is extended, to further reduce drag, and may include a manual unlocking mechanism for maintenance access. Anything that upsets the sequence can cause considerable structural damage and lead to an unsafe landing condition. The sequencing valve can be **door operated** or **gear operated**.

- **Door operated sequencing** — pressure is initially fed to the door actuator to open the door; when the door reaches maximum travel it depresses a plunger, unseating a valve in the sequence valve and opening a gallery that allows pressure to the main actuator, extending the gear. On retraction, pressure to the main actuator retracts the leg; when fully retracted, the leg depresses the sequence valve plunger, unseating the valve and opening a gallery that feeds the door actuator to close the door — only when the door is fully open is pressure allowed to the main actuator.
- **Gear operated sequencing** — the same principle, except the plunger (or slide) is operated by a cam and linkage attached directly to the landing gear leg, ensuring the door starts (or is in the process of) opening as soon as the gear starts to move.

## Safety Bars

On some aircraft with hydraulically sequenced doors, if the hydraulic system fails, the extending landing gear legs push against **safety bars** fitted to the doors, forcibly and safely opening them without damage; once operated, the doors remain open.

## Indications and Warning

All modern aircraft with retractable gear indicate on the flight deck whether the legs are locked down, in transit, or correctly locked up, usually via a dedicated set of coloured indicator lights near the selector lever for each leg. Under the modern 'dark cockpit' philosophy, all indicator lights are extinguished when the legs are properly locked up. A **red light** indicates transit (not locked up and not locked down); a **green light** indicates each leg down and locked.

A typical red light illuminates when:
- The lever is not down and the gear is not up, **or**
- The lever is down and the gear is not down and locked, **or**
- Engine No.1 or No.2 throttle is in the idle range and any gear is not down and locked

A green light illuminates when the gear is down and locked. On some aircraft, red transit lights are replaced by a **'nips'** light in the selector lever itself, with separate amber warning lights on the panel to show a fault (e.g. any leg failing to reach its selected position within a time limit). Where visual confirmation is not possible from the cabin (typically for the nose gear), the locked-down indicator may be duplicated as an additional 'confidence light' in case of bulb failure.

Micro-switches or proximity sensors on each leg relay information to the flight deck indicators, changing output voltage whenever the uplock or downlock mechanisms are made or broken during retraction or lowering. Other methods include mechanical indicators visible from the cockpit — painted indicator lines on the toggle levers that align when the gear is down and locked, or spring-loaded **pop-up indicators** on the upper wing surface, operated via a plunger and cable linkage to the toggle lever, standing proud of the airframe skin when the gear is down and locked and retracting into their housing when the gear retracts.

A separate warning system, connected to a centralised warning panel with lights and audio warnings, may activate when the aircraft descends to a certain height above the ground (sensed by the radio altimeter) or when the landing configuration is incorrect (e.g. power levers or flaps set incorrectly), to prevent the pilot landing with the gear retracted.

The landing gear may also have an electro-mechanical safety device preventing operation of the selector lever on the ground: when all legs are compressed, a safety solenoid is de-energised and a latch pin moves under the selector lever, preventing its operation. As each leg fully extends, its limit switch signals the control unit; once all legs have signalled, the safety solenoid is energised and the latch pin withdraws, allowing gear-up selection.

## Safety Switches

**Proximity switches** on each landing gear leg indicate whether the leg is downlocked or in transit. The switch is made when a target on the leg aligns with the switch probe, indicating the leg is downlocked; the gap between probe and target is set per the aircraft maintenance manual. When the probe and target are out of alignment, the switch is broken, indicating the leg is in transit. Signals go to an electronic control unit or computer, illuminating a **green triangle** when locked down and a **red triangle** when in transit.

**Limit micro-switches** on the uplocks sense when the gear is locked up, and limit switches on the oleos sense when the oleo leg is fully extended; these signals are also processed by the control unit/computer. When the gear is locked up, the limit switch changes the red triangles to black; when the oleos are fully extended, the limit switches allow the gear to be retracted.

Together, the proximity switches and limit switches form part of the **weight-on-wheels / weight-off-wheels squat switch system**, which prevents inadvertent retraction of the landing gear on the ground. Retraction is only permitted when all three landing gear legs are weight-off-wheels and fully extended, and the downlocks have been unlocked.

## Wheels

Early wheels and tyres were of the bicycle type, with spoke rims and tyres fitted using tyre levers. Most light aircraft use fixed-flange, one-piece forged or cast wheels. Modern, more rigid load-bearing tyres require two-piece wheel construction, of two types: **removable rim** wheels (which have an inner tube) and **split** wheels (tubeless, requiring a perfect seal between the halves, sealed by an O-ring). Wheels are usually constructed from aluminium or magnesium alloys, cast or forged, to be as light and strong as possible. The inboard wheel section has key ways into which brake discs slot, driving the discs with the wheel. Larger aircraft wheels are fitted with one or more **fusible plugs** — a centre hole filled with a low melting point alloy that melts if a temperature limit is reached (e.g. from an overheated tyre), allowing the tyre to deflate safely.

**Three basic types of aircraft wheel:**
- **Well-based** — limited to smaller light aircraft, similar to a typical car wheel
- **Divided (or Split)** — used on most modern commercial airliners; two near-identical half assemblies, each with its own tapered bearing assembly, bolted together, with a sealing ring between the halves for an airtight joint with a tubeless tyre; the inner half carries the brake rotor drive blocks, and the outer half may carry fusible plugs
- **Loose and Detachable Flange** — a main hub carries both bearings, the brake rotor drive blocks and fusible plugs; one of the two wheel flanges is removable to ease tyre replacement, retained by a locking ring (loose flange) or by nuts and bolts (detachable flange), with a sealing ring in the flange recess for tubeless tyres
        $cnt2$,
        16
    ) RETURNING id INTO s16_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M11A.15 Ice and Rain Protection (21 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s15_id, 'Ice formation on aircraft is classified under four main headings. Which of the following lists them correctly?',
     '[{"id":"a","text":"Hoar Frost, Rime, Glaze Ice and Pack Snow","correct":true},{"id":"b","text":"Hoar Frost, Sleet, Hail and Pack Snow","correct":false},{"id":"c","text":"Rime, Glaze Ice, Fog and Drizzle","correct":false}]',
     '{"B1"}'),

    (s15_id, 'Which type of ice formation is described as the most severe and dangerous, because of its high rate of catch?',
     '[{"id":"a","text":"Hoar frost","correct":false},{"id":"b","text":"Rime ice","correct":false},{"id":"c","text":"Glaze ice","correct":true}]',
     '{"B1"}'),

    (s15_id, 'Glaze ice forms in greatest thickness on the leading edges of aerofoils and in reduced thickness as far aft as:',
     '[{"id":"a","text":"One quarter of the chord","correct":false},{"id":"b","text":"One half of the chord","correct":true},{"id":"c","text":"The full chord length","correct":false}]',
     '{"B1"}'),

    (s15_id, 'Rime ice, compared with glaze ice, is:',
     '[{"id":"a","text":"Denser and more transparent","correct":false},{"id":"b","text":"Less dense, opaque, rough and porous","correct":true},{"id":"c","text":"Identical in density and appearance","correct":false}]',
     '{"B1"}'),

    (s15_id, 'Hoar frost forms when:',
     '[{"id":"a","text":"Water vapour condenses on a cold airframe surface and converts directly to ice","correct":true},{"id":"b","text":"Large water drops freeze on impact with the airframe","correct":false},{"id":"c","text":"Hailstones are carried repeatedly through a cumulonimbus cloud","correct":false}]',
     '{"B1"}'),

    (s15_id, 'According to the ANO Schedule 4, means of observing the existence and build-up of ice must be provided on an aircraft of MTWA exceeding:',
     '[{"id":"a","text":"2,000 kg (4,400 lb)","correct":false},{"id":"b","text":"5,700 kg (12,500 lb)","correct":true},{"id":"c","text":"10,000 kg (22,000 lb)","correct":false}]',
     '{"B1"}'),

    (s15_id, 'In a pressure operated ice detector head, the leading edge of the tube has four small holes and the trailing edge has:',
     '[{"id":"a","text":"Two holes of less total area than the leading edge holes","correct":true},{"id":"b","text":"Four holes of equal total area to the leading edge holes","correct":false},{"id":"c","text":"No holes at all","correct":false}]',
     '{"B1"}'),

    (s15_id, 'The vibrating rod ice detector probe vibrates ultrasonically at its own resonant frequency of approximately:',
     '[{"id":"a","text":"4 kHz","correct":false},{"id":"b","text":"40 kHz","correct":true},{"id":"c","text":"400 kHz","correct":false}]',
     '{"B1"}'),

    (s15_id, 'In the classification of ice protection methods, the difference between anti-icing and de-icing is that:',
     '[{"id":"a","text":"Anti-icing prevents ice from forming; de-icing allows ice to form and then removes it","correct":true},{"id":"b","text":"De-icing prevents ice from forming; anti-icing allows ice to form and then removes it","correct":false},{"id":"c","text":"Both terms describe exactly the same process","correct":false}]',
     '{"B1"}'),

    (s15_id, 'The four primary systems used for ice protection are:',
     '[{"id":"a","text":"Fluid, Pneumatic, Thermal and Electrical","correct":true},{"id":"b","text":"Fluid, Mechanical, Chemical and Hydraulic","correct":false},{"id":"c","text":"Pneumatic, Thermal, Electrical and Manual","correct":false}]',
     '{"B1"}'),

    (s15_id, 'Fluid ice protection systems are normally used on windscreens, aerofoils and propellers, but are NOT used on:',
     '[{"id":"a","text":"Engine air intakes, which are usually anti-iced by other means","correct":true},{"id":"b","text":"Pitot static heads only","correct":false},{"id":"c","text":"Any part of the airframe","correct":false}]',
     '{"B1"}'),

    (s15_id, 'The fluid used for windscreen fluid protection is typically:',
     '[{"id":"a","text":"Alcohol-based","correct":true},{"id":"b","text":"Glycol-based","correct":false},{"id":"c","text":"Silicone-based","correct":false}]',
     '{"B1"}'),

    (s15_id, 'Pneumatic (rubber boot) de-icing systems work on the principle of:',
     '[{"id":"a","text":"Continuous heating of the leading edge","correct":false},{"id":"b","text":"Cyclic inflation and deflation of rubber tubes on the aerofoil leading edge","correct":true},{"id":"c","text":"Spraying glycol fluid over the leading edge continuously","correct":false}]',
     '{"B1"}'),

    (s15_id, 'When a pneumatic de-icing system is switched OFF, vacuum is supplied continually to the boots in order to:',
     '[{"id":"a","text":"Hold the tubes flat against the leading edge and minimise aerodynamic drag","correct":true},{"id":"b","text":"Keep the boots fully inflated for maximum protection","correct":false},{"id":"c","text":"Prevent static electricity from accumulating","correct":false}]',
     '{"B1"}'),

    (s15_id, 'In a thermal hot-air anti-icing system, heated air enters the leading edge at the stagnation point because:',
     '[{"id":"a","text":"That is where the maximum temperature is required","correct":true},{"id":"b","text":"That is the coolest point on the aerofoil","correct":false},{"id":"c","text":"It is the only point structurally able to accept ducting","correct":false}]',
     '{"B1"}'),

    (s15_id, 'For a cyclic electrical de-icing system, the typical ratio of heating time ON to time OFF is:',
     '[{"id":"a","text":"1:1","correct":false},{"id":"b","text":"1:10","correct":true},{"id":"c","text":"10:1","correct":false}]',
     '{"B1"}'),

    (s15_id, 'The optimum temperature range for maximum energy absorption (and hence bird-proof characteristics) of a laminated windscreen''s vinyl inter-layer is:',
     '[{"id":"a","text":"0°C to 15°C","correct":false},{"id":"b","text":"27°C to 49°C","correct":true},{"id":"c","text":"60°C to 80°C","correct":false}]',
     '{"B1"}'),

    (s15_id, 'The desiccant used to keep a "dry air sandwich" cabin window free of internal condensation is:',
     '[{"id":"a","text":"Silica Gel, which changes from blue to pink/white as it absorbs moisture","correct":true},{"id":"b","text":"Activated charcoal, which changes from black to grey","correct":false},{"id":"c","text":"Rock salt, which dissolves as it absorbs moisture","correct":false}]',
     '{"B1"}'),

    (s15_id, 'A windscreen wiper system must never be operated on a dry windscreen because this may:',
     '[{"id":"a","text":"Cause scratches to the screen","correct":true},{"id":"b","text":"Overheat the wiper motor immediately","correct":false},{"id":"c","text":"Drain the hydraulic reservoir","correct":false}]',
     '{"B1"}'),

    (s15_id, 'A pneumatic rain removal system clears the windscreen by:',
     '[{"id":"a","text":"Blowing high-pressure engine bleed air across the screen to form an air barrier against rain","correct":true},{"id":"b","text":"Spraying alcohol fluid across the screen surface","correct":false},{"id":"c","text":"Mechanically wiping the screen at very high frequency","correct":false}]',
     '{"B1"}'),

    (s15_id, 'A rain repellent system works by treating the windscreen with a chemical (typically silicone-based) that causes water to:',
     '[{"id":"a","text":"Spread evenly to form a thin film","correct":false},{"id":"b","text":"Break up into beads, leaving the glass dry between them","correct":true},{"id":"c","text":"Freeze instantly into a removable ice layer","correct":false}]',
     '{"B1"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M11A.16 Landing Gear (19 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s16_id, 'The two main functions of a landing gear are to:',
     '[{"id":"a","text":"Support the weight of the stationary aircraft on the ground and absorb the loads during touchdown, landing run and taxiing","correct":true},{"id":"b","text":"Provide directional stability in flight and reduce drag at cruise speed","correct":false},{"id":"c","text":"Generate lift during the take-off roll and act as a speed brake on landing","correct":false}]',
     '{"B1"}'),

    (s16_id, 'The tricycle landing gear configuration, now used almost exclusively, places the main gear:',
     '[{"id":"a","text":"Aft of the centre of gravity, with a supporting nose gear at the front","correct":true},{"id":"b","text":"Forward of the centre of gravity, with a tailwheel at the rear","correct":false},{"id":"c","text":"Directly beneath the centre of gravity only, with no other gear","correct":false}]',
     '{"B1"}'),

    (s16_id, 'A disadvantage of the older tailwheel undercarriage configuration was:',
     '[{"id":"a","text":"The risk of the aircraft nosing over under heavy braking, and poor crew visibility while taxiing","correct":true},{"id":"b","text":"Excessive weight compared with a tricycle undercarriage","correct":false},{"id":"c","text":"Inability to be used on propeller-driven aircraft","correct":false}]',
     '{"B1"}'),

    (s16_id, 'On an oleo landing gear leg, the hinged link that prevents the piston and wheel assembly from swivelling, while still allowing free in-and-out movement, is called the:',
     '[{"id":"a","text":"Torque (scissor) link","correct":true},{"id":"b","text":"Downlock toggle link","correct":false},{"id":"c","text":"Drag strut","correct":false}]',
     '{"B1"}'),

    (s16_id, 'The three main types of shock absorbing strut used on commercial aircraft are:',
     '[{"id":"a","text":"Oleo-pneumatic without separator, oleo-pneumatic with separator, and liquid spring","correct":true},{"id":"b","text":"Steel leaf spring, bungee cord, and liquid spring","correct":false},{"id":"c","text":"Oleo-pneumatic, air-oil, and rubber-in-compression","correct":false}]',
     '{"B1"}'),

    (s16_id, 'In an oleo-pneumatic strut WITHOUT a separator, some aeration ("froth") occurs at the demarcation line because:',
     '[{"id":"a","text":"There is no separator to prevent the oil and gas mixing together","correct":true},{"id":"b","text":"The nitrogen pressure is too low to keep the gas and oil apart","correct":false},{"id":"c","text":"The oil is deliberately mixed with air before filling","correct":false}]',
     '{"B1"}'),

    (s16_id, 'The main advantage of an oleo-pneumatic strut WITH a separator, compared with one without, is that it:',
     '[{"id":"a","text":"Makes shock absorbing more efficient, gives less severe jolting during taxiing and simplifies servicing","correct":true},{"id":"b","text":"Eliminates the need for hydraulic oil altogether","correct":false},{"id":"c","text":"Removes the need for a metering pin","correct":false}]',
     '{"B1"}'),

    (s16_id, 'In a liquid spring shock absorber, energy absorption relies on:',
     '[{"id":"a","text":"Compression of the hydraulic oil itself, at pressures in excess of 60,000 psi","correct":true},{"id":"b","text":"Compression of nitrogen gas in a separate chamber","correct":false},{"id":"c","text":"Deflection of a steel leaf spring","correct":false}]',
     '{"B1"}'),

    (s16_id, 'When servicing (filling and charging) an oleo-pneumatic strut, the aircraft is normally:',
     '[{"id":"a","text":"Positioned on jacks with the wheels clear of the ground","correct":true},{"id":"b","text":"Kept fully loaded with fuel and on its wheels","correct":false},{"id":"c","text":"Only serviced while airborne","correct":false}]',
     '{"B1"}'),

    (s16_id, 'Retracting the landing gear becomes economically practical once:',
     '[{"id":"a","text":"The parasite drag of the extended gear exceeds the induced drag caused by the added weight of the retraction system","correct":true},{"id":"b","text":"The aircraft exceeds its maximum landing weight","correct":false},{"id":"c","text":"The engine reaches its maximum continuous power rating","correct":false}]',
     '{"B1"}'),

    (s16_id, 'When the selector lever is set to GEAR DOWN, the instrument panel shows red triangles ("in transit") because:',
     '[{"id":"a","text":"Leg movement breaks the uplock limit switches as the gear unlocks and starts to extend","correct":true},{"id":"b","text":"The hydraulic pump has failed and pressure has been lost","correct":false},{"id":"c","text":"The gear is already fully down and locked","correct":false}]',
     '{"B1"}'),

    (s16_id, 'When all three wheels are down and locked, the landing gear indicator panel changes to:',
     '[{"id":"a","text":"Green triangles","correct":true},{"id":"b","text":"Amber triangles","correct":false},{"id":"c","text":"Flashing red triangles","correct":false}]',
     '{"B1"}'),

    (s16_id, 'A squat switch system, together with an electro-mechanical stop on the selector lever, is fitted to:',
     '[{"id":"a","text":"Prevent the landing gear from being retracted while the aircraft is on the ground","correct":true},{"id":"b","text":"Prevent the landing gear from being lowered while airborne","correct":false},{"id":"c","text":"Automatically apply the wheel brakes on landing","correct":false}]',
     '{"B1"}'),

    (s16_id, 'In an emergency landing gear extension, once the uplocks are released the landing gear legs:',
     '[{"id":"a","text":"Extend under gravity and aerodynamic forces, possibly assisted by a spring or gas-operated free-fall assister","correct":true},{"id":"b","text":"Remain locked up until the aircraft lands","correct":false},{"id":"c","text":"Are extended only by manually cranking each leg individually","correct":false}]',
     '{"B1"}'),

    (s16_id, 'A door-operated landing gear door sequencing system only allows hydraulic pressure to the main actuator once:',
     '[{"id":"a","text":"The door is fully open and has depressed the sequence valve plunger","correct":true},{"id":"b","text":"The gear selector lever has been in the DOWN position for 10 seconds","correct":false},{"id":"c","text":"The aircraft weight is fully off the wheels","correct":false}]',
     '{"B1"}'),

    (s16_id, 'On aircraft with hydraulically sequenced landing gear doors, if the hydraulic system fails, safety bars fitted to the doors are used so that:',
     '[{"id":"a","text":"The extending landing gear legs can forcibly and safely push the doors open","correct":true},{"id":"b","text":"The doors are locked permanently closed for the remainder of the flight","correct":false},{"id":"c","text":"The pilot can manually winch the doors open from the cockpit","correct":false}]',
     '{"B1"}'),

    (s16_id, 'Proximity switches on each landing gear leg indicate that the leg is downlocked when:',
     '[{"id":"a","text":"A target on the leg comes into alignment with the switch probe","correct":true},{"id":"b","text":"The hydraulic pump pressure drops to zero","correct":false},{"id":"c","text":"The wheels begin to spin up on touchdown","correct":false}]',
     '{"B1"}'),

    (s16_id, 'The weight-on-wheels / weight-off-wheels squat switch system only permits landing gear retraction when:',
     '[{"id":"a","text":"All three legs are weight-off-wheels, fully extended and the downlocks are unlocked","correct":true},{"id":"b","text":"The engines are shut down","correct":false},{"id":"c","text":"The selector lever has been cycled twice","correct":false}]',
     '{"B1"}'),

    (s16_id, 'Larger aircraft wheels are commonly fitted with fusible plugs, whose purpose is to:',
     '[{"id":"a","text":"Melt at a set temperature limit, allowing an overheated tyre to deflate safely","correct":true},{"id":"b","text":"Provide the electrical bonding path between the wheel and axle","correct":false},{"id":"c","text":"Balance the wheel assembly during high-speed rotation","correct":false}]',
     '{"B1"}');

END $$;
