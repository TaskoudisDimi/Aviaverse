-- Module 11B: Piston Aeroplane Structures and Systems (B1) — Ice and Rain Protection, Landing Gear
-- Source: EASA Part-66 Module 11B official textbook (IKAROS Aviation Training Centre, IK01, Issue Oct.2012)

DO $$
DECLARE
    m11_id INT;
    s14_id INT;
    s15_id INT;
BEGIN
    SELECT id INTO m11_id FROM easa_modules WHERE code = 'M11';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M11B.14') THEN
        RAISE NOTICE 'M11B.14/M11B.15 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 11B.14: Ice and Rain Protection
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m11_id, 'M11B.14', 'Ice and Rain Protection',
        $cnt$
# Ice and Rain Protection

## Introduction

The operation of aircraft today necessitates flying in all weather conditions, so it is essential that an aircraft is protected against the build-up of ice, which may affect its safety and performance. Aircraft designed for public transport and some military aircraft must be provided with certain detection and protection equipment for flights where there is a probability of encountering icing (or rain) conditions. Certain basic standards also have to be met by all aircraft, whether or not they are required to be protected, to provide reasonable protection if the aircraft is flown intentionally for short periods in icing conditions — covering stability, control balance, jamming of controls and the ability of the engine to continue to function.

## Factors Affecting Ice Formation

Ice formation on aircraft in flight is the same as on the ground. Water occurs in the atmosphere in three forms: **invisible vapour, liquid water and ice**. The smallest drops of liquid water constitute clouds and fog; the largest drops occur in rain; drizzle drops are in between. Icing consists of crystals whose size and density depend on temperature and the type of water present. Snowflakes are produced when crystals stick together or, in very cold regions, by small individual crystals.

## Types of Ice Formation

Ice formation can be classified under four main headings — **Hoar Frost, Rime, Glaze Ice and Pack Snow** — plus Hail. Depending on circumstances, variations can occur and two different types of icing may appear simultaneously on parts of the aircraft.

### Hoar Frost
Occurs on a surface at a temperature below the frost point of the adjacent air (and below freezing point). It forms in clear air when water vapour condenses on the cold airframe surface and converts directly to ice, building up into a **white semi-crystalline, feathery** coating. On the ground the weight is rarely serious, but if not removed it may interfere with airflow and the attainment of flying speed on take-off, obscure the windscreen, and affect free working of control surfaces. In flight, hoar frost usually commences with a thin layer of glaze ice on the leading edge, followed by frost spreading over the whole surface; effects are not usually serious, though some change in landing characteristics can be expected.

### Rime Ice
Less dense than glaze ice — an **opaque, rough** deposit. At ground level it forms in freezing fog on the windward side of exposed objects. Rime is **light and porous**, resulting from small water drops freezing as individual particles with little or no spreading; a large amount of air is trapped between the particles. In flight it forms when flying through a cloud of small water drops with both air and airframe temperature below freezing. It builds up on the leading edge but does not extend far back along the chord. It usually has no great weight, but the danger is that it interferes with airflow over the wings. If super-cooled droplets are small enough and temperature low, each freezes instantly on impact as an individual, non-adhesive dry powder particle ("**opaque rime**") and accumulation is not serious.

### Glaze Ice
The glassy deposit forms when the aircraft encounters large water drops in clouds or in freezing (super-cooled) rain, with air and airframe temperature below freezing. It is a transparent or opaque coating with a glassy surface, resulting from liquid water flowing over the airframe before freezing, and may be mixed with sleet or snow. **It forms in greatest thickness on the leading edges of aerofoils and in reduced thickness as far aft as one-half of the chord.** Ice formed this way is dense, tough and sticks closely to the surface — it cannot easily be shaken off, and if it breaks away it comes off in lumps of appreciable and sometimes dangerous size. Its main danger is aerodynamic, but the weight also produces unequal loading and propeller blade vibration. **Glaze ice is the most severe and most dangerous form of ice formation** because of its high rate of catch. Super-cooled rain is rare in the British Isles but more common on the Continent and the east coast of North America.

### Pack Snow
Snow falling on an aircraft in flight does not normally settle, but if the airframe temperature is below freezing, glaze ice may form from the moisture in the snow, with snow subsequently embedded in the ice so formed. Icing in such conditions is primarily due to water drops, not the snow itself.

### Hail
Formed when water droplets, falling as rain, pass through icing levels and freeze. Air currents in some storm clouds (**cumulo-nimbus**) may carry the hailstone vertically through the cloud a number of times, increasing its size at each pass until it is heavy enough to fall to earth. Aircraft encountering hail may suffer severe damage: dented skin, cracked windscreens, blocked intakes and serious damage to gas turbine engines.

## Areas to be Protected

The critical areas where ice forms, and where protection is essential, are:
- All aerofoil leading edges
- Engine air intakes (including carburettor intakes)
- Windscreens
- Propellers
- Pitot static pressure heads

## Effects of Ice Accretion on Aircraft

The build-up of ice is known as **ice accretion**. If it continues, one or more of the following effects may occur:

- **Decrease in Lift** — due to changes in wing section resulting in loss of streamlined flow around the leading edge and top surfaces.
- **Increase in Drag** — due to the rough surface, especially rime, causing greatly increased surface friction.
- **Increased Weight and Wing Loading** — may prevent the aircraft from maintaining height.
- **Decrease in Thrust** — propeller efficiency decreases due to altered blade profile and increased blade thickness; vibration may occur from uneven ice distribution along the blades. Gas turbine engines may suffer disturbed compressor airflow, and ice breaking from the intake may be ingested, causing severe compressor blade damage.
- **Inaccuracy of Pitot Static Instruments** — ice on the pitot static head blocks the sensing lines, producing false readings.
- **Loss of Inherent Stability** — due to displacement of the centre of gravity caused by the weight of the ice.
- **Radio antennae** — reduced efficiency.
- **Loss of Control** — due to ice preventing movement of control surfaces (not usually a problem in flight, but may occur on the ground).

### Additional Effects on the Ground
- Restriction of the controls if ice is not removed from hinges and gaps
- Increased take-off run due to increased weight and drag
- Reduced rate of climb due to increased weight and drag

## Ice Detection

The ANO Schedule 4 states: in the case of an aircraft of **MTWA exceeding 5,700 kg (12,500 lb)**, means of observing the existence and build-up of ice on the aircraft must be provided. The equipment must be carried on flights when weather reports or forecasts at the departure aerodrome indicate conditions favouring ice formation are likely to be met.

## Methods of Ice Detection

### Visual (Hot Rod) Ice Detector
An aluminium alloy oblong base (the plinth) carries a steel tube detector mast of aerofoil section, angled back from the vertical and mounted on the side of the fuselage so it can be seen from the flight compartment windows. The mast houses a heating element; the plinth has a built-in floodlight. The heating element is normally off; when icing conditions are met, ice accretes on the leading edge of the detector mast and is observed by the flight crew. The floodlight may be switched on at night to illuminate the mast, and the heating element can be manually selected to disperse the ice for further observation.

### Pressure Operated Ice Detector Heads
A short stainless steel or chromium-plated brass tube, closed at its outer end, projects vertically from a portion of the aircraft known to be susceptible to icing. Four small holes are drilled in the leading edge; two holes of less total area are drilled in the trailing edge. A heater clears the head of ice; some units add a baffle through the centre of the tube. In normal flight, pressure builds up inside the tube from the airstream and is communicated to the capsule of an electro-pneumatic relay, expanding it and separating a pair of electrical contacts. When icing conditions are met, ice covers the leading-edge holes; since the trailing-edge holes remain uncovered, the airstream exhausts the system, collapsing the relay capsule and closing the relay contacts — illuminating a warning indicator and switching on the detector-head heater. A cam holds the warning lamp on for a further 4 minutes and the heater for a further 30 seconds after the ice clears, then the cycle is automatically re-set if icing persists.

### Serrated Rotor Ice Detector Head
A serrated rotor, driven by a small AC motor via a reduction gearbox, rotates adjacent to a fixed knife-edge cutter, within 0.050 mm (0.002 in) of the cutter's leading edge. Under non-icing conditions, the torque required to drive the rotor is slight (only bearing friction to overcome). Under icing conditions, ice accretes on the rotor until the gap is filled; the resulting cutting action by the knife edge produces a substantial increase in required torque, moving a spring-tensioned toggle bar to operate a micro-switch and initiate a warning signal. Once icing ceases, torque loading reduces, the motor returns to its normal position, and the micro-switch open-circuits the warning indicator.

### Vibrating Rod Ice Detector
A solid-state ice detector with a probe protruding through the fuselage skin into the airstream, which ultrasonically vibrates in an axial mode at its own resonant frequency of approximately **40 kHz**. When ice forms on the sensing element, the probe frequency decreases; the detector circuit compares this against a reference oscillator. At a predetermined frequency change (proportional to ice build-up), the detector circuit activates the flight-compartment warning light and triggers a timer circuit, which switches on a probe heater for a set period to remove the ice and return the system to detector mode. If a further warning is received during the timer period, the timer re-triggers and the cycle repeats for as long as icing prevails.

### Ice Formation Spot Light
Many aircraft have two ice formation spot lights, one each side of the fuselage, positioned to light up the leading edges of the main planes for visual examination. On some aircraft this may be the only method of ice detection.

## Anti-Icing and De-Icing Systems

There are two main categories of ice protection:
- **De-icing** — ice is allowed to form on the surfaces and is then removed by operating the system in a specified sequence.
- **Anti-icing** — ice is prevented from forming by ensuring the ice protection system operates whenever icing conditions are encountered or forecast.

There are **four primary systems** used for ice protection:
1. Fluid
2. Pneumatic
3. Thermal
4. Electrical

## Fluid Systems

Fluid systems may be used as either anti-icing or de-icing. As an **anti-icing** system, it works on the principle that the freezing point of water can be lowered if a fluid of low freezing point is applied to the protected areas before icing occurs. As a **de-icing** system, the fluid is applied to the interface of the aircraft surface and the ice, breaking the ice's adhesion so it is carried away by the airflow. The system is normally used on windscreens and aerofoils, and has also been used successfully on propellers. **It is not used on engine air intakes**, which are usually anti-iced instead.

### Windscreen Protection
The windscreen panel is sprayed with an **alcohol-based** fluid, via a fluid storage tank, hand-operated or electrically-driven pump(s), supply pipelines and spray tubes. Some designs allow operation using either of two pumps, or both, according to the severity of icing.

### Aerofoil Systems
The fluids used are all **glycol-based**, with properties of low freezing point, non-corrosive, low toxicity and low volatility — though they have a detrimental effect on some windscreen sealing compounds and cause crazing of Perspex panels. The system (tank, pump, filter, pipelines, distributors, switch, pump-failure warning light, tank contents indicator) may be switched on automatically by the ice detector or manually by the pilot. After an initial "flood" period during which the pump runs continuously to prime the pipelines and wet the leading edge, a cyclic timer turns the pump ON and OFF for predetermined periods. Leading-edge distributors appear in two forms:

| Distributor type | Description |
|---|---|
| **Strip Distributor** | A 'U' channel divided into primary and secondary channels by a central web, closed by a porous metal spreader through which fluid seeps. Rarely used; found only on very old aircraft. |
| **Panel Distributor** | A micro-porous stainless steel outer panel, a micro-porous plastic sheet and a metering tube; fluid fills a cavity between the plastic sheet and back-plate and seeps through the outer panel, with airflow directing it over the aerofoil. |

Systems out of service for an extended period should be functioned periodically to prevent fluid crystallising and blocking metering tubes, porous surfaces and pipelines; distributors should be cleaned periodically with a jet of water at an angle.

### Propeller Systems
The propeller blade root and a section of the blade are de-iced to prevent build-up changing the blade profile and upsetting aerodynamic characteristics, and to prevent imbalance/vibration from uneven ice build-up. Ice is shed by centrifugal force. The blade root has a rubber cuff fed by a pipeline from a slinger ring on the spinner back plate, itself fed from a fixed pipe on the front of the engine; from the cuff the fluid spreads along the leading edge by centrifugal force.

## Pneumatic Systems

Pneumatic (mechanical) systems are used **for de-icing only** — it is not possible to prevent ice formation this way. They work by cyclic inflation and deflation of rubber tubes on aerofoil leading edges, and are used on certain piston-engine and twin turbo-propeller aircraft. The de-icer boots (overshoes) consist of layers of natural rubber and rubberised fabric with flat inflatable tubes closed at the ends, fitted along the leading edges of the wing, vertical and horizontal stabilisers, laid span-wise, chord-wise or a combination. Boots may be attached by screw fasteners or by cementing directly to the leading-edge skin. External surfaces are coated with a film of conductive material to bleed off static electricity.

**Air supplies:** the tubes are inflated by air from the pressure side of an engine-driven vacuum pump or, on some turbo-propeller types, from a tapping on the engine compressor. Boots are deflated by vacuum from the vacuum pump or from the venturi of an ejector nozzle.

**Distribution:** three methods are in use — shuttle valves controlled by a separate solenoid valve; individual solenoid valves direct to each boot; or motor-driven valves.

**Operation:** pressure inflates groups of tubes in sequence, weakening the bond between ice and the boot surface and cracking the ice, which is carried away by the airflow. At the end of inflation, air is vented and the tubes are fully deflated by the vacuum source; this cycle repeats while the system is switched on. When switched off, vacuum is supplied continually to hold the tubes flat against the leading edges, minimising aerodynamic drag.

## Thermal (Hot Air) System

Fitted to aerofoils to prevent ice formation, employing heated air ducted span-wise along the inside of the leading edge and distributed between double-thickness skins. Entry is made at the stagnation point, where maximum temperature is required; hot air then flows back chord-wise through corrugations to suitable exhaust points. In **anti-icing** systems, a continuous supply of heated air is fed; in **de-icing** systems, more intensely heated air is supplied for shorter periods on a cyclic basis. Hot gas may be derived from heat exchangers around exhausts, independent combustion heaters, or direct tappings from turbine engine compressors.

### Exhaust Gas Heating System
Ambient air enters an intake on the engine nacelle and passes through the tubes of a heat exchanger; exhaust gases from the jet pipe are partially diverted by electrically actuated flaps to flow between the tubes before discharging to atmosphere. Heated air then passes through an electrically operated hot air valve to the leading edges. If the gas flap fails open, an emergency manual override closes the hot air valve and opens a spill valve to dump hot air overboard. The gas flap and hot air valve actuators are electrically interlocked — the hot air valve must be fully open before the gas flap opens, and the gas flap must be fully closed before the hot air valve closes — to prevent heat exchanger overheating. Temperature control is automatic with a standby manual facility, using 'normal' and 'overheat' thermistors, plus a final overheat protection system using an 'override' thermistor and flame-stat.

### Hot Air Bleed System
Air is bled from a late stage of the gas turbine engine compressor and distributed to aerofoil leading edges, for anti-icing or de-icing of wing and tail leading edges, and may also protect engine intakes. The system works by maintaining skin temperature above that at which ice occurs, or by raising skin temperature to melt ice already formed. On rear-fuselage-mounted-engine aircraft, distribution may be graded for higher heating intensity inboard, to prevent shedding ice into the engine intakes. Anti-icing shut-off valves on each engine open to supply air to the leading-edge ducting at temperatures of about **200 ºC**; wing and fuselage cross-over ducts ensure supply to all surfaces if an engine shuts down in flight. Air temperature may be controlled by mixing compressor bleed air with ram air via a cold air control valve: when first switched on, hot air is fed undiluted into the cold leading-edge ducting, and temperature sensors progressively open and close the cold air valve via an inching unit to control skin temperature. If the temperature sensor, cold air valve, or ram air inlet fails/blocks, an overheat sensor regulates the hot air valve instead.

## Electrical Ice Protection System

Electrical heater elements are attached to the outer surface of the protected area, using two methods: the **heater mat** and the **spray mat**.

### Heater Mat
Two thin layers of rubber or PTFE sandwich a heater element, moulded to fit snugly over the protected section. Elements differ by purpose and environment; the latest mats use alloy filaments woven in continuous filament glass yarn.

### Spray Mat
Sprayed directly onto the surface to be protected — developed by the Napier Company for a lightweight system suited to compound curves. A base insulator of synthetic resin is brushed directly onto the airframe, normally about **0.03 in** thick. The heater element, of aluminium or Kumanol (copper-manganese alloy), is flame-sprayed onto the base insulation. A further insulation layer of the same material, about **0.01 in** thick, is applied on top. A protective "stone guard" coating of stainless alloy particles bonded with synthetic resin is used where extra mechanical protection is needed, e.g. on leading edges.

Some elements are supplied continuously (anti-icing) while others are supplied intermittently on a cyclic basis (de-icing); continuously heated areas sit immediately ahead of cyclically de-iced areas, and cyclically heated areas are separated by continuously heated "breaker" strips to ensure clean ice breakaway.

**Anti-icing control:** heat is supplied continuously, graded so no ice forms under operating conditions, regulated by a sensing element and thermal controller or a surface-mounted thermostatic switch pre-set for cut-in/cut-out temperatures.

**Cyclic de-icing control:** areas are grouped and connected to a cyclic switch, controlled by timed impulses from a pulse generator or a built-in electronic device. At high ambient temperature, water content and icing rate are high but only a short heating period is needed; at very low temperature, water content and icing rate are lower but longer heating periods are required — the **ratio of time ON to time OFF remains unchanged, typically 1:10**. Setting may be manual or automatic, working with an ambient air temperature probe and either an ice detector or rate-of-icing indicator. In 3-phase systems, heated areas are arranged for balanced phase loading; de-icing heaters are connected so the OFF period for some areas coincides with the ON period for others, keeping current requirements roughly constant.

### Windscreen Anti-Icing
Windscreens and other critical cockpit windows of high-performance pressurised aircraft use a **laminated** construction — sheets of clear vinyl plastic (polyvinyl butyral) interposed between preformed, pre-tempered glass plies, bonded by pressure and heat — to impart shatterproof, bird-proof characteristics. The bird-proof characteristics depend heavily on the plasticity of the vinyl, and therefore on its temperature. The **optimum temperature range for maximum energy absorption is between 27 ºC and 49 ºC**; electrically heated windscreen panels are normally maintained within these limits. Below this range, bird-proof characteristics decline rapidly — at a moderate temperature of **16 ºC**, a panel's impact resistance can be reduced by **30% to 50%**.

The heating element is an extremely thin transparent conductive coating "floated" onto the inside surface of the (thinner) outer glass ply, allowing more rapid heat conduction; the coating may be tin oxide or gold film. It is heated by alternating current supplied to bus bars at the panel edges. A controlling device maintains constant windscreen temperature and prevents overheating of the vinyl inter-layer(s), connected to temperature-sensing elements embedded in the windscreen — either a resistance grid (resistance varies directly/linearly with temperature) or a thermistor (resistance varies inversely/exponentially with temperature). Warning lights/indicators show 'normal', 'off' or 'overheat' conditions. If the controller fails, glass temperature rises until the overheat sensing element's setting is reached, cutting off power and illuminating a warning light; power is restored and the light extinguished once the glass has cooled through a specific range.

## Windscreen/Cabin Window De-Misting

Glass is a poor conductor of heat; at altitude, low atmospheric temperature keeps the inside of windscreens and cabin windows cold, causing condensation and obscured vision. Windscreens are normally kept mist-free by blowing hot air from the air conditioning system across the inner glass surface. Demisting of some windscreens and, usually, all cabin windows uses **"dry air sandwich" construction** — outer and inner glass layers sandwiching a layer of dry air, like double-glazing. The outer layer is thick laminate (glass and vinyl) for impact/shatterproof qualities; the inner layer is thinner, warmed by cabin air, preventing condensation. The air sandwich is kept dry either by hermetically sealing the two layers with dry air during manufacture, or by venting the space to the cabin through a desiccant unit that absorbs moisture during venting. Larger aircraft may interconnect fixed cabin windows to a common desiccant unit, while escape windows have their own integral unit. The desiccant is **silica gel** crystals, blue when dry, gradually changing to pink or white as they absorb moisture; they must be replaced when they begin to turn pink, or condensation within the dry air sandwich may require lengthy rectification or window replacement.

## Rain Repellent and Rain Removal

Vision through windscreens may be obscured by rain, dust, dirt and flies, requiring methods to clear the screens for safe ground manoeuvring, take-off and landing. Windscreen clearing systems fall under: windscreen wipers, pneumatic rain removal, rain repellent, and windscreen washing.

### Windscreen Wiper Systems

**Electrical system:** wiper blades are driven by electric motor(s) from the aircraft electrical system; pilot's and co-pilot's wipers are sometimes driven by separate motors so clear vision is maintained if one system fails. Each wiper is driven by a motor-converter assembly converting rotary to reciprocating motion. Selecting "high" energises relays 1 and 2, energising fields 1 and 2 in parallel — motors operate at approximately **250 strokes/minute**. Selecting "low" energises relay 1 only, putting fields 1 and 2 in series — motors operate at approximately **160 strokes/minute**. Selecting OFF allows the relay contacts to return to normal, but the wiper motor continues running until the arm reaches the "park" position, opening the cam-operated park switch, de-energising the motor and applying the brake solenoid so the motor cannot coast and re-close the park switch. Wiper blade sweep may be an **arc** or a **parallel motion**; parallel motion gives a greater swept surface but a more complex mechanism.

**Electro-hydraulic system:** older aircraft used hydraulic motors instead of electric — typically two independently operated motors, one per hydraulic system, with control valves operated from a flight-deck selector.

**Servicing** covers inspection (cleanliness, security, damage, connections, blade condition, fluid level, hydraulic/electrical line condition), operational checks (screen free of foreign matter, blade secure, screen kept wet during the check — **wipers must never be operated on a dry screen, as this may cause scratches**), adjustments (blade tension checked with a spring balance at 90º to the required Maintenance Manual value; blade angle to avoid striking the frame; proper parking), and fault-finding per the Maintenance Manual (ATA 100 Chapter 30-42-0).

### Pneumatic Rain Removal Systems
Windscreen wipers suffer from aerodynamic forces reducing blade pressure at speed, and difficulty achieving oscillation rates high enough to clear heavy rain. Pneumatic systems overcome this using high-pressure bleed air from the gas turbine engine, blown over the windscreen face from ducts at the base of the screen, forming an air barrier that prevents rain spots from striking the screen.

### Windscreen Washing System
Directs a spray of fluid (usually de-icing fluid, e.g. Kilfrost) onto the windscreen to help the wipers clear dust and dirt from dry screens, in flight or on the ground. Fluid is contained in a reservoir and sprayed through nozzles, directed by an electrically driven pump or by pressurising the reservoir with compressor bleed air via a pressure-reducing valve. Servicing involves functional testing, reservoir replenishment, and checks for security, leaks and damage.

### Rain Repellent
When water is poured onto clear glass it spreads evenly into a thin film and remains wetted even when tilted and subjected to an airstream. When the glass is treated with certain chemicals (typically **silicone-based**), the water film breaks up into beads, leaving the glass dry between them, so the water can be readily removed. The chemical is stored in pressurised, disposable cans and discharged onto the windscreen through propelling nozzles by a push-button-operated solenoid valve, for a period of about **5 seconds** under a time-delay unit; about **5 cc** of fluid is used per discharge from a container holding approximately **50 cc**. The button must be re-selected for a further application. The fluid is spread over the screen by the rain, which acts as a carrier. It may be used with or without wipers depending on aircraft speed, but is normally used to supplement wipers in heavy rain at low altitude / low airspeed. **It must not be operated on dry windscreens** — heavy undiluted repellent causes smearing and may form globules distorting vision; if inadvertently operated on a dry screen, wipers must not be used (this increases smearing) and the screen should be washed with clean water immediately. Rain repellent residues can cause staining or minor corrosion of aircraft skin.

### Drain Mast Heating
On many large aircraft the water supply and drain lines are electrically heated to prevent ice formation, normally powered via the AC bus, available both on the ground and in flight. Heater tapes and blankets are wrapped around some water supply and drain lines, with temperature controlled by thermostats; in a typical aircraft (Boeing 757), the thermostats controlling this heating **open when temperature exceeds 15.5 ºC and close when temperature drops to 7.2 ºC**. Heating gaskets may be installed on the ends of toilet drain pipes. Drain masts are heated to allow in-flight drainage without freezing, with heating controlled by an **air/ground relay** — low heat is supplied on the ground and high heat in flight.
        $cnt$,
        14
    ) RETURNING id INTO s14_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 11B.15: Landing Gear
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m11_id, 'M11B.15', 'Landing Gear',
        $cnt2$
# Landing Gear

## Introduction

Landing gears have two main functions: supporting the weight of the stationary aircraft on the ground, and absorbing the loads during touchdown, the landing run and taxiing. They divide into two main categories: **fixed (non-retractable)** or **fully retractable**. Early aircraft had fixed landing gear, which produced a large amount of parasitic drag in flight; since drag increases at the square of forward speed, as aircraft flew faster this drag became too prohibitive. This was first resolved with streamlined fairings over the wheels, but it soon became clear that drag could be almost completely eliminated if the landing gear were retracted after take-off and stowed out of the airstream.

## General

Early landing gear designs had two main legs set just in front of the aircraft's centre of gravity (C of G) plus a small tailwheel at the rear — putting the C of G just aft of the main gear ensured the aircraft attained flying attitude quickly on take-off. At the time all aircraft were propeller-driven, and the inclined fuselage gave ample propeller-to-ground clearance while taxiing, taking off and landing. The main disadvantage was the risk of the aircraft "nosing over" under heavy braking, and poor crew visibility while taxiing and during the initial take-off run.

This was overcome by the **tricycle configuration**, now used almost exclusively, which places the main landing gear aft of the C of G and a supporting nose gear at the forward fuselage. As aircraft became larger and heavier, landing gear design came to include multi-leg and multi-wheel configurations.

## Construction

All landing gears must attach to strong points on the fuselage or wing structure so landing loads can be absorbed and transferred safely to the aircraft structure. Smaller light aircraft use a steel leaf or tubular steel spring as an undercarriage: one end attaches to a strong point on the airframe, the wheel and axle are on the other end, and deflection of the spring tube on landing absorbs the landing loads and transmits them to the airframe (a properly conducted landing causes no undercarriage rebound). Another simple method uses elastic **bungee cord** encased in a loose-weave cotton braid, located on support struts carrying the wheel and axle; the cord stretches on landing to transfer landing forces into the airframe.

On oleo-type gear, the wheel-and-axle assembly (bogey) attaches to the piston end. A hinged **torque (scissor) link** sits between the axle yoke and the cylinder body, allowing the piston to move freely in and out while preventing the piston/wheel assembly from swivelling. Two actuators are usually fitted: a **main actuator** on the cylinder body to raise/lower the gear, and a **down-lock actuator** on the bracing strut, which mechanically locks the gear when lowered and unlocks it before raising. A **hop damper** is often used with multi-wheel units to align the bogie at the correct landing angle and absorb minor shock loads during taxiing; it connects between the main landing gear body and the bogie.

## Multiple Axles and Wheels

Multi-wheel landing gear allows for maximum utilisation of aircraft operating from different runways. Configurations include **single, double, tandem and bogie**.

**Advantages of multi-wheel configurations:**
- Spread landing loads over a larger footprint
- Easier to stow, as wheel volume is reduced
- Greater safety — loads are spread over several wheels, so a burst tyre is less critical as remaining wheels accept the extra load

**Disadvantages:**
- More moving parts, requiring more maintenance
- Expensive to produce
- Larger footprint increases the turning circle, needed to prevent tyres crabbing and increasing wear

## Shock Absorbing

To absorb and dissipate the shock loads of landing, the kinetic energy of impact must be converted into other forms of energy. Most landing gear legs use self-contained hydraulic shock-absorbing struts. There are three main types of strut used in commercial aircraft:
- Oleo-pneumatic without separator
- Oleo-pneumatic with separator
- Liquid spring

### Oleo-Pneumatic Without Separator
Uses compressed gas (normally **nitrogen**) combined with a specific quantity of hydraulic oil — an outer cylinder into which a hollow inner piston is inserted. Airborne, the piston fully extends under nitrogen pressure; the lighter nitrogen settles in the upper cylinder with heavier oil at the bottom. With no separator between oil and gas, some aeration ("froth") occurs where they mix at the demarcation line. On landing, the inner piston is forced up into the outer cylinder, reducing internal volume; a tapered **metering pin** and snubber knob (integral with the piston) are forced into a snubber tube on the outer cylinder. Oil is forced into the upper chamber through holes in the snubber tube and an open flapper valve; the tapered metering pin steadily reduces the available orifice area as it compresses. Landing energy is absorbed by oil forced through the ever-decreasing orifice and by compression of the nitrogen gas. On recoil, as the piston extends, oil is forced down into the hollow piston — the flapper valve slams shut, leaving only a reduced number of snubber-tube holes to permit transfer. This restriction, and the associated increase in internal volume, prevents rapid strut extension and dampens the recoil energy.

### Oleo-Pneumatic With Separator
Operates on the same principle, but includes a **floating piston** separating the oil chamber from the nitrogen chamber, preventing oil and gas mixing. This also means the nitrogen chamber need not be positioned at the top of the leg, or limited to a single chamber, making shock absorption more efficient, reducing jolting during taxiing, and simplifying servicing.

### Liquid Spring
Has no gas compartment; instead it relies on the fact that forcing a piston into a cylinder completely filled with oil under static pressure absorbs energy through oil compression. Oil is generally considered incompressible, but as a fluid it obeys the same rules as a gas; at normal hydraulic system pressures (typically **3,000 psi**) compression is negligible, but in liquid spring shock absorbers, pressures in excess of **60,000 psi** are often generated, and the oil is compressed. During touchdown the piston is forced into the upper cylinder as before, compressing the oil as volume progressively reduces ("jack ram displacement"); a restrictor valve absorbs the recoil similarly to the other two types.

## Servicing — Filling and Charging

The strut must be serviced to fill the leg with the correct quantity of air-free oil, and the nitrogen chamber charged to the correct value to maintain the correct oil/gas ratio. When correctly filled and charged, the strut adopts the correct extension supporting the aircraft on the ground, eliminating the risk of the inner piston "bottoming" against the outer cylinder during touchdown. Filling and charging procedures vary by aircraft type and are detailed in the AMM. A typical sequence for an oleo-pneumatic without separator strut:

1. Position the aircraft on jacks with wheels clear of the ground
2. Release nitrogen pressure via the charging valve, keeping the valve open after all pressure has dissipated
3. Place a bottle jack under the strut and compress the leg until it fully bottoms
4. Open the hydraulic bleed valve and pump oil into the filling connection until fresh, air-free oil emerges from the bleed valve
5. Close and tighten the oil charging valve and bleed valve
6. Remove the bottle jack, connect a nitrogen rig, and slowly inflate until the leg is fully extended and the gauge shows the AMM-specified pressure
7. Close and tighten the nitrogen charging valve and remove the rig
8. Repeat on the other main leg if required, then lower the aircraft off jacks

*Notes:* an oleo-pneumatic-with-separator leg needs an additional procedure to position the separator correctly before deflating; a liquid spring type is similar for oil filling/bleeding but has no nitrogen charging procedure. In service, shock strut serviceability can be monitored using a pressure/extension graph, and nitrogen pressure adjusted as required.

## Extension and Retraction Systems

As aircraft speed becomes high enough that the parasite drag of fixed landing gear exceeds the induced drag from the added weight of a retraction system, it becomes economically practical to retract the gear into the structure. Raising/lowering is carried out hydraulically or pneumatically via a cockpit selector lever mechanically or electrically linked to a **selector valve**, which directs fluid to one side or the other of the piston. The gear is up-locked and down-locked mechanically or hydraulically through up-lock boxes and down-lock toggle levers; positions are sensed by proximity or micro-switches and transmitted to cockpit instrumentation via a control unit.

In case of fluid or electrical failure, a mechanical **emergency lowering system** is available: an emergency handle in the cockpit, via push-pull cables and gearboxes, releases the up locks; the selector valve or a free-fall valve opens all extension/retraction lines to return, and the gear falls under gravity and aerodynamic forces, possibly assisted by a spring- or gas-operated free-fall assister. Smaller light aircraft may use electric motor-driven actuators, a winding cable system, a simple operating lever with safety locks, or a manual hydraulic jacking system. Most modern light aircraft use a **hydraulic power pack** — a self-contained, lightweight, easy-to-maintain unit containing the fluid reservoir, sight glass, pressure pump, filter, thermal and pressure relief valves, and ground service/replenishment connections.

### Extension System
Selecting GEAR DOWN makes a micro-switch that powers up the hydraulic pump, feeding pressure to the up-lock actuator valves to unlock the up locks (the hooks remain mechanically open under spring pressure). Movement of the legs breaks the up-lock limit switches, showing "in transit" (red triangles) on the instrument panel. The selector valve opens the down lines to the actuators and return lines to the reservoir; fluid pressure extends the actuators. Once the main actuators are fully extended and the legs mechanically locked, excess pressure bleeds back through the low-pressure control valve to the reservoir. When all three wheels are down and locked, proximity switches signal a control unit that turns off the hydraulic pump, closes the selector valve lines, and shows "locked down" (green triangles).

### Retraction System
Basically the reverse. Selecting GEAR UP powers the hydraulic pump, feeding pressure to the down-lock actuators to unlock the mechanical locks on the bracing struts, and to the selector valve to open the up lines to the main actuators and the return lines to the reservoir. Movement of the legs breaks the down-lock proximity switches, showing "in transit" (red triangles). Fluid pressure retracts the gear via the main actuators; on full retraction the legs mechanically lock in the up locks, and excess pressure bleeds back to the reservoir. When all three wheels are up and locked, up-lock limit switches turn off the pump, close the selector valve lines, and change the red triangles to black.

A **squat switch system** and an electro-mechanical stop on the selector lever prevent the landing gear from being retracted while the aircraft is on the ground, normally until all legs have fully extended after take-off (sensed by proximity switches on each leg).

## Selector Valve

Normally operated by electrical solenoids signalled from micro-switches in the gear selector lever on modern large aircraft, though some aircraft use mechanical operation. A spool valve is moved from neutral to allow hydraulic pressure to one side of the main actuator piston, depending on whether the gear is to be raised or lowered. Normal operation can be overridden in an emergency if the gear fails to extend due to a system fault: the spool valve is moved mechanically by rods, cables and levers to open all lines for free fluid flow, normally inter-linked with the emergency mechanical opening of the up locks.

## Up Lock Mechanism

On large modern aircraft, retraction operates the up locks mechanically: a roller on the landing gear leg locates and engages the up-lock hook. Limit switches sense engagement and turn off hydraulic pressure, so the gear is then held retracted purely mechanically. Normal release of the up lock is by a hydraulically actuated valve: supplied hydraulic pressure pushes a plunger against the lock lever, which rotates about its pivot, allowing the up-lock hook to disengage under its own spring tension; the gear then extends hydraulically via the main actuator.

## Down Lock Mechanism

The down-lock actuator may have single or double direction operation. In a single-direction system, the actuator unlocks the down-lock mechanism (upper and lower toggles) before retraction, with the leg relying on its own extension to provide the over-centre lock. A double-direction actuator locks the down-lock mechanism on extension and unlocks it before retraction. Once the gear is fully extended (sensed by a limit switch), hydraulic pressure extends the down-lock actuator piston, which acts against a toggle lever, moving both toggle levers to an **over-centre position**, forming a mechanical lock that prevents the leg from collapsing. Once parked, a red-flagged safety pin is inserted through alignment holes in the toggle levers to prevent inadvertent collapse or retraction on the ground, and is removed before flight. Selecting gear up first retracts the down-lock actuator piston, moving the lower toggle to overcome the mechanical lock and moving both toggle levers to an **under-centre position** so the leg can fold.

## Emergency Landing Gear Operation

The up locks can be released manually if the actuator or hydraulic system fails. An emergency lever in the cockpit rotates the hook locks, releasing the legs from the up-lock hooks, and also operates a lever on the selector valve to open all hydraulic lines to return, allowing free fluid flow so the gear can extend. Once released, the legs extend under gravity and aerodynamic forces, possibly assisted by spring- or gas-operated free-fall assisters; proximity and limit switches operate normally, giving cockpit indication of transit and down-lock. On aircraft with hydraulically sequenced doors, if the hydraulic system fails, the door jack is mechanically unlocked, also via a mechanical linkage connected to the cockpit's emergency release mechanism.

## Landing Gear Doors Sequencing

To keep the aircraft streamlined and reduce drag, the gear is normally retracted into bays with access doors that open and close in relation to gear movement. Some doors are mechanically linked to the gear via connecting rods, bell cranks and links; others open/close under a hydraulic sequencing valve, signalled by micro- or proximity switches via a control unit. Some doors close again once the gear has been extended, to further reduce drag. Doors may have a manual unlocking mechanism for ground access during maintenance. Anything that jeopardises the sequence can cause considerable structural damage or an unsafe landing condition. Sequencing valves can be **door operated** or **gear operated**.

### Door Operated Sequencing System
Pressure only flows to the main actuator once the door is fully open; if not fully open the main actuator remains isolated. Hydraulic pressure first feeds the door actuator to open the door; when it reaches maximum travel it depresses a plunger, unseating a valve in the sequence valve and opening a gallery for fluid pressure to the main actuator, extending the gear. Retraction reverses this: pressure retracts the gear leg, which on full retraction depresses a sequence-valve plunger, unseating a valve that opens a gallery for fluid pressure to the door actuator, closing the door.

### Gear Operated Sequencing System
Operates on a very similar principle, except the plunger (or slide) is operated via a cam-and-linkage mechanism directly attached to the landing gear leg, ensuring the door starts (or is in the process of) opening as soon as the gear starts to move.

## Safety Bars

On some aircraft with hydraulically sequenced doors, if the hydraulic system fails, the extending wheels forcibly open the doors by the landing gear legs pushing against **safety bars** fitted to the doors — the doors open without damage and remain open once operated.

## Indications and Warning

All modern aircraft with retractable gear indicate on the flight deck whether legs are locked down, in transit, or correctly locked up. A separate warning system may show faults or indicate legs are not in the selected position ('**nips**'). Leg position is normally shown by a dedicated set of coloured indicators near the selector lever, one set per leg; on some aircraft a 'nips' light is built into the selector lever itself.

Under the modern "dark cockpit" philosophy, all indicator lights are normally extinguished (no lights) when the legs are properly locked up. **Red lights** are used for "in transit" (neither locked up nor down); **green lights** illuminate when each leg is down and locked. A red light comes on whenever: (1) the lever is not down and gear not up; (2) the lever is down and gear not down-and-locked; (3) engine No. 1 or 2 throttle is in idle range and any gear is not down and locked. A green light comes on whenever the gear is down and locked.

On other aircraft, red transit lights are replaced by the 'nips' light in the selector lever, with separate amber warning lights showing a fault if any leg fails to reach its selected position within a time limit. Where visual confirmation from cabin windows isn't possible (usually for the nose gear), the locked-down indicator may be duplicated as an additional "confidence light" in case of bulb failure. Micro-switches or proximity sensors on each leg relay information to the indicators, changing output voltage as up-lock or down-lock mechanisms are made or broken during retraction/lowering. Other methods include mechanical indicators outside the aircraft visible from the cockpit — painted indicator lines on the toggle levers that align when down and locked — or **pop-up indicators** that stand proud on the upper wing surface when down and locked, operated by a plunger through a cable linkage attached to the toggle levers, returning under spring pressure into their housing when retracted.

A warning system connected to the centralised warning panel, with warning lights and audio warnings, may prevent the pilot landing with the gear retracted — activated when the aircraft descends below a certain height (radio altimeter) or when the landing configuration is incorrect (e.g. power levers or flaps set incorrectly). An electro-mechanical safety device may also prevent operation of the selector lever on the ground: when all legs are compressed, a safety solenoid is de-energised, moving a latch pin under the selector lever to prevent it operating; as each leg fully extends, a limit switch signals the control unit, and once all legs have signalled, the solenoid energises and withdraws the latch pin, allowing gear-up selection.

## Safety Switches

Proximity switches on each leg indicate down-locked or in-transit status: the switch is made when the target on the leg aligns with the switch probe (down-locked), and broken when out of alignment (in transit) — the probe/target gap is set per the maintenance manual. Signals are processed by an electronic control unit or computer, illuminating a green triangle (locked down) or red triangle (in transit) on the landing gear panel. Limit micro-switches on the up locks sense gear locked up (changing red triangles to black), and limit switches on the oleos sense the oleo leg fully extended (allowing retraction). These proximity and limit switches form part of the **weight-on-wheels / weight-off-wheels squat switch system**, preventing inadvertent gear retraction on the ground — retraction is only allowed once all three legs are weight-off-wheels and fully extended, and the down locks have been unlocked.

## Wheels, Brakes, Antiskid and Autobraking

### Wheels
Wheels provide some form of suspension and adhesion between the aircraft and the ground. Early wheels/tyres were bicycle-type with spoke rims, fitted using tyre levers. Most light aircraft use fixed-flange, one-piece forged or cast wheels. Modern, more rigid tyres require two-piece wheel construction — **removable rim** (with an inner tube) or **split wheel** (tubeless, requiring a perfect seal between halves via an O-ring). Wheels are usually aluminium or magnesium alloy, cast or forged, for light weight and strength. The inboard wheel section has key ways that drive the brake discs with the wheel. Larger aircraft wheels have one or more **fusible plugs**, with a centre hole filled with a low-melting-point alloy — when the tyre overheats past a temperature limit, the alloy melts, allowing the tyre to safely deflate.

**Three basic types of wheel:**

| Type | Description |
|---|---|
| **Well-based** | Limited to smaller light aircraft; similar to a typical family car wheel |
| **Divided (Split)** | Used on most modern commercial airliners; two half-assemblies, each with its own tapered bearing, bolted together with a sealing ring between the halves for tubeless-tyre air-tightness; the inner half carries the brake rotor drive blocks and the outer half may carry fusible plugs |
| **Loose and Detachable Flange** | Main hub carries bearings, brake rotor drive blocks and fusible plugs; one of the two flanges is removable to facilitate tyre replacement, retained by a locking ring (loose flange) or nuts and bolts (detachable flange), with a sealing ring for tubeless tyres |

## Tyres

Patterned tread became important once aircraft had effective brakes for slowing on landing. Early treads were a diamond pattern for good braking on wet grass, but ribbed tread proved more suitable for hard-surface runways; today almost all aircraft tyres have a **ribbed tread** of straight grooves running around the circumference.

### Tyre Inflation and Deflation
Tyres are inflated with **nitrogen** from a ground cart; required pressure is laid down in the AMM, and a tyre inflation box regulates charge rate and pressure. A deflation tool releases pressure, and any ice must be allowed to thaw before the valve core is removed.

### Tyre Construction
- **The Bead** — gives strength and stiffness for a firm wheel mount; bundles of high-strength carbon steel wire (two or three bundles per side), streamlined with rubber strips, enclosed in rubberised fabric layers to insulate the carcass plies from bead-wire heat.
- **The Carcass (chord body)** — layers of rubberised fabric cut in strips with threads at about **45 degrees** to the strip length, extending across the tyre around the bead and partially up the side; each ply's threads cross the adjacent ply's at about 90 degrees — known as **bias ply** construction. Cords were originally cotton, then nylon, and now **aramid fibres (kevlar)** — stronger than nylon, polyester or fibreglass, and pound-for-pound even stronger than steel.
- **Chafing strips** — rubberised fabric strips wrapping the edges of the carcass plies and enclosing the bead area, providing a smooth, chafe-resistant surface between the tyre and the wheel's bead seat.
- **The Undertread** — a compound rubber layer between the plies and tread rubber for good tread/carcass adhesion; more fabric plies above strengthen the tread and oppose centrifugal forces during high-speed rotation.
- **The Inner Liner** — a thin rubber coating over the inside plies; on tubeless tyres, a less-permeable compound seals the tyre and reduces leakage; on tubed tyres, it is very smooth to prevent chafing.
- **The Tread** — the thick layered rubber wearing surface around the outer circumference, with moulded grooves for optimum runway traction.

### Tyre Wear Assessment
Circumferential grooves in the tread primarily displace water on the runway (helping prevent aquaplaning) and can also indicate wear: wear resulting in any groove being **less than 2 mm deep for more than 25% of the tread circumference** requires tyre replacement. Other wear-assessment methods:

| Method | Description | Limit |
|---|---|---|
| **Tie Bars** | Small transverse rubber bars moulded at intervals in the circumferential grooves, set at a depth of 2 mm (or as specified) | Tyre worn to the top of the tie bar |
| **Wear Indicator Grooves** | Dedicated grooves in the tread pattern, typically 2 mm shallower than the water-displacing grooves | Tyre worn to the bottom of the indicator groove anywhere on the circumference |
| **Sipes** | An axial slit in the tread rubber at some corners of a zigzag tread pattern, not extending into the tread depth | Tyre worn to the bottom of the sipe |

### Tyre Damage
Very little damage can be tolerated before a tyre becomes unserviceable. Damage near the bead is rarely tolerated; cuts in the casing plies must be carefully assessed per the manufacturer's requirements. If the cords are exposed due to any damage, including splits or crazing, the tyre is classed unserviceable. Always consult the Aircraft/Component Maintenance Manual.

### Leak Holes (Awl Holes) and Vent Holes
During inflation of a tyre/tube assembly, trapped air can cause incorrect inflation; this is reduced by **leak holes** pierced completely through the sidewall during manufacture (often made with an awl, hence "awl holes"), marked by **6 mm diameter spots of grey (usually) or green litho ink**. During manufacture of tubeless tyres, air trapped between casing layers escapes through **vent holes**, which do not penetrate right through the sidewall, identified similarly by 6 mm diameter spots, usually **green**.

### Balance Marks
A red spot (sometimes triangular) on either side of the tyre indicates its lightest point around the circumference, as determined during the manufacturer's balancing procedure. On assembly, the red spot should align with the inflation valve on a tubeless assembly, or with a red line (heavy point) on the tube for a tubed assembly (or the tube's inflation valve if there is no red line).

### Electrically Conducting Tyres
Some wheel assemblies use tyres designed to conduct electrical charges to earth as the aircraft touches down, identified by the word **CONDUCTIVE** or the letters **ECTA** (electrically conducting tyre assembly) on the sidewall.

### Aquaplaning
Occurs on wet runways when a wave of water builds up in front of a spinning wheel, potentially lifting the tyre from the runway surface to float on the thin water layer — dangerous, as complete loss of braking efficiency results. The approximate aquaplaning speed formula is:

**Aquaplaning Speed (kt, approx.) = 9 × √(Tyre Pressure)**

This speed is placarded for the crew to traverse quickly through in wet conditions on landing. If tyre pressures are incorrect, the placarded speed becomes useless and aquaplaning occurs at a different speed — so tyre pressures must be maintained at their correct value at all times.

## Brakes

Aircraft brake systems convert the kinetic energy of aircraft motion into heat energy, generated by friction between the brake linings and the brake drum or disc. There are two types: **energising (servo)** brakes, which use friction between rotating and stationary parts to produce a wedging action that uses the aircraft's momentum to increase braking force (reducing pilot effort); and **non-energising** brakes, which do not use this wedging action.

### Energising Brakes
Used on some smaller light aircraft, with a single servo action, operating only with forward motion. Shoes and linings mount on a torque plate, free to move out against the rotating drum; applying the brakes moves two pistons out to push the linings against the drum, and drum rotation wedges the linings against it. Releasing hydraulic pressure allows a retracting spring to pull the linings from the drum.

### Non-Energising Brakes
The most common type, actuated by hydraulic pressure, with braking action depending on the pressure applied. The main types are **expander tube, single disc and multiple disc** brakes.

- **Expander Tube Brakes** — use a heavy neoprene tube, rarely used on modern aircraft; hydraulic fluid expands the tube (located on a torque flange's circumference), pushing brake block linings out against the drum. Heat is kept from damaging the tube by stainless steel heat shields between lining blocks; releasing the pedal lets return springs collapse the tube, forcing fluid back to the reservoir.
- **Single Disc Brakes** — most common on light aircraft; hydraulic pressure from a master cylinder squeezes the rotating disc between linings in a calliper. Two types: **floating disc, fixed calliper** (disc keyed into the wheel, free to move in/out) and **fixed disc, floating calliper** (disc rigidly attached to the wheel, calliper moves on anchor bolts). Some have automatic adjusters and wear indicators — an adjusting pin is pulled through a grip when brakes are applied, and its protrusion indicates lining wear; linings are generally replaced when the pin is flush with the housing.
- **Multi Disc Brakes** — segmented rotor, multiple disc brakes standard on most modern high-performance aircraft; three rotating discs are keyed onto the wheel, segmented for cooling and thermal expansion. Between each disc is a stator (brake-lining disc) keyed onto the axle shaft, with linings riveted to each side; a pressure plate sits inboard and a backing plate outboard. Automatic adjusting pins work as for single disc brakes. Larger jet aircraft use multiple brake cylinders (each fed from a separate hydraulic system, so one failure still allows full braking from the other) rather than a single annular cylinder. Some aircraft use **carbon fibre** brake discs — lighter and able to function at higher temperatures, though expensive, and generally used only on transport aircraft where the weight saving justifies the cost.

### Brake Systems
Light aircraft generally use hydraulic pressure generated by the pilot's feet via rudder-pedal-connected master cylinders (foot motors) operating slave cylinders at the brakes; larger aircraft use the aircraft's main hydraulic systems. Pressure applied must be proportional to pedal force, and the pilot must be able to hold the brakes partially applied without pressure build-up — achieved with a **brake control valve** (metering valve). Rudder pedals connect to the valve hydraulically (via a master cylinder), or by rods or cables. Hydraulic systems operate simultaneously, usually with a different system feeding inboard versus outboard wheels, so a single system's failure still leaves braking on at least one set of wheels.

### Brake Control Valve
As the pilot applies the brakes, a centre slide moves left, opening the pressure line and closing the return line, applying the brakes; pressure is simultaneously directed to a metering chamber, building up until it equals the pedal input pressure, at which point the slide moves back to the central position with both pressure and return lines blocked, holding brake pressure constant until the pilot's input changes. Releasing the pedals moves the slide right, opening the line from the brakes to return and dissipating pressure.

## Anti-Skid Systems

### Introduction
Designed to provide maximum effective braking for any runway condition without skidding, often used with an autobrake system. It automatically overrides or modifies the metered input brake pressure from the flight deck or autobrake commands. Hydraulic pressure is automatically controlled at each brake unit to maintain the optimum wheel braking requirement regardless of weather (ice, heavy rain, crosswind, etc.), minimising stopping distances while maintaining directional control. Maximum braking efficiency occurs when all main wheels are at maximum deceleration rate just before an impending wheel skid. The system continuously modulates hydraulic pressure at each brake unit in response to actual wheel speed, preventing blown tyres, flat spots or aquaplaning from a locked wheel. On a normal landing, no corrective signal is needed if wheel deceleration stays within limits; if it exceeds limits (an approaching skid), a corrective signal momentarily reduces brake pressure at that wheel, removed once wheel speed increases, repeating as required. Anti-skid systems can be **electronically** or **mechanically** controlled; most modern systems are electronic, mechanical ones being fitted only to older aircraft types.

### Electronic Anti Skid System
Consists of: a **wheel speed transducer** in each main gear axle, driven by wheel rotation; an **electronic antiskid control unit**, usually in the electronic/electrical equipment bay, with BITE for continuous self-test and fault warning; an **antiskid control valve** for each main wheel, usually in the hydraulic equipment bay; and a **control switch and failure warning indicator** on the flight deck panel.

**Wheelspeed transducer:** a speed-sensing generator-type device sending an output voltage directly proportional to wheel rotation to the control unit, which compares it with a reference voltage scheduled to the aircraft's maximum deceleration rate. If the transducer voltage exceeds the reference, an error signal goes to the relevant antiskid control valve, momentarily reducing hydraulic pressure at that brake unit until the voltages agree again.

**Anti-skid control valve:** a two-stage electro-hydraulic servo valve metering pressure to the brake unit per signals from the control unit. The first stage is a torque-motor-operated flapper valve between return and pressure hydraulic ports; the second stage is a spool valve, spring-biased to "brakes on" and hydraulically controlled by oil pressure into a drilled passage at either end. With no control signal, the flapper valve biases toward the return nozzle and maximum braking is possible; a current signal to the torque motor (triggered by a transducer detecting a wheel slowing too quickly) moves the flapper toward the pressure nozzle, restricting fluid into the chamber and allowing more to escape to return — reducing first-stage chamber pressure, which is felt on the bias-spring side of the second-stage spool valve, forcing it to move, close off the pressure line, and connect the brake line to return. Second-stage valve movement is proportional to torque motor current, which depends on the brake pressure reduction needed to achieve wheel spin-up. As the wheel spins up again, torque motor current reduces, the flapper moves back, and the spool valve re-closes the return line, re-applying brake pressure. This cycle can repeat with a rapid "brakes off/brakes on" modulation rate of **up to 50 cycles per second**.

**Control switch and warning system:** normally on the flight deck front panel, often combined with the autobrake selector; a simple on/off switch powers the anti-skid circuitry, with a warning light for system malfunction, after which the Anti Skid Control Unit can be interrogated to pinpoint the cause (a particular transducer, valve, or the control unit itself).

### Mechanical Anti Skid System
An older type, modulating brake pressure as the electronic type does, but mechanically via a single self-contained device per wheel, often called a "**maxaret**" (maximum arresting) unit. It detects rapid wheel deceleration and momentarily releases brake pressure. It may be mounted externally on the brake unit torque plate, driven by a small rubber-tyred wheel in contact with the main wheel, or mounted inside the axle, driven via a splined drive shaft in the hub cap. Both types incorporate an internally mounted heavy flywheel sensitive to angular deceleration during braking: when braking is severe, or just before the wheel locks, the flywheel continues rotating at the higher speed due to inertia, advancing through an arc until it contacts a set of limit stops. The flywheel connects mechanically to two hydraulic system metering valves within the maxaret unit; via thrust balls and push rods, the valves change from the normal "pressure to brakes" position to "no pressure in and brakes to return." With brake pressure removed, the wheel regains speed and the flywheel returns to its original position (assisted by a return spring), re-applying the brakes; the "brakes on/brakes off" sequence continues until deceleration returns to normal limits.

## Autobraking

Some modern aircraft have auto-braking systems: a selector switch on the instrument panel lets the pilot select a deceleration rate to be controlled automatically after landing, applying the brakes smoothly to a complete stop without further crew action, freeing the crew to concentrate on other activities. The autobrake system uses the normal anti-skid and brake units, but instead of pressure from the brake metering valve, hydraulic pressure is sent via solenoid valves that allow a pre-determined amount of pressure through the anti-skid valves to the brake units.

### Selector Panel
A solenoid-latched switch holds a selected position only if all arming conditions for that setting are met; if the system cannot be armed, the switch automatically returns to DISARM and a warning illuminates on the local and centralised warning panels. Settings correspond to different deceleration rates.

### Auto-Brake Control Unit
Selection sends an electrical signal to the auto-brake control unit, which commands the solenoid valve to direct pressure to the brake units. Brake pressure must build up and release gradually to prevent brake snatch and jerking, using a time delay (ensuring the aircraft is firmly on the ground before activation) and an electrical ramp. Terminology:
- **On Ramp** — gradual build-up of brake pressure to the amount required for the selected deceleration rate
- **Off Ramp** — gradual decrease in pressure to zero at the end of the landing run or on cancellation
- **Drop Out** — instantaneous pressure release to zero (go-around mode)

### Auto Brake Solenoid Valve
Electrically controlled hydraulic valves, fitted just upstream of the anti-skid valves, allowing pressure to the brake units at a specific setting (higher deceleration rate = higher setting). The solenoid opens when all arming conditions are met and the aircraft is weight-on-wheels; it also shuts immediately on Drop Out. A solenoid servo valve modulates brake pressure to regulate the deceleration rate; a pressure switch is connected to the DISARM warning light to monitor zero pressure when the auto-brakes are armed.

### System Operation
Once the aircraft lands and is weight-on-wheels, anti-skid transducers signal the control unit; once wheels reach a certain speed, or after a pre-determined time delay, brakes are applied "up the ramp." Once the selected deceleration rate is reached, auto-brake pressure is modulated to hold it. If wheel speed slows more than the deceleration rate requires, the servo valve closes slightly, reducing pressure and letting the wheel speed up. Once the aircraft stops (or drops below a certain speed), the auto-brakes switch off to enable taxiing.

### Auto Brake Termination
Auto-brake can be cancelled at any time, and depending on the aircraft, overridden by the pilot moving the selector to disarm/off, or by using manual braking. It must be immediately cancelled if the pilot initiates a go-around; the following cause immediate **DROP OUT**: the thrust levers are advanced from the idle gate, or the speed brake lever is moved to stow the speed brakes.

## Steering

Nose wheel steering systems improve ground operation: less tyre scrub improves tyre life, reduces brake wear, and saves fuel/engine life as brakes and engine thrust are no longer required to turn the aircraft. Most systems use servo-jack-operated scissor links attached to a collar on the landing gear leg, driven by servo jacks that rotate the nose wheel leg via the scissor links, with steering inputs from a cockpit tiller (and, in some cases, the rudder pedals). Apart from mechanical steering, there are three basic operating methods:

- **Single Servo Jack** — used on smaller light aircraft; both ends of the jack ram attach to the landing gear leg, and fluid moves the jack body along its ram. A cam and link assembly attached to the jack body operates the link, rotating a cam that turns the wheel; the shock absorber is splined onto the steering shaft so it can still compress and extend independently.
- **Double Servo Jack** — used on larger aircraft; two jacks are fixed to a steering collar, free to rotate around the landing gear leg, attached to the upper scissor link — actuating the jacks rotates the wheel and axle through the scissor link.
- **Rack and Pinion** — hydraulically operated racks rotate a pinion, which rotates the wheel and axle; a mechanical linkage from the cockpit tiller operates a servo valve in a hydraulic metering valve, directing fluid to one side or the other of the rack piston, which moves and rotates the pinion, turning the nose wheel.

### Steering Mechanisms
On some small aircraft, the nose wheel is steered by direct linkages from the rudder pedals, or (on small retractable-gear aircraft) from the rudder pedals to a steering bar that locates against a steering arm on the landing gear leg — once the wheel is stowed the mechanism is ineffective. Nose or tail wheels on light aircraft may be steerable or castoring; a castoring nose wheel aircraft is steered by independent use of the brakes and rudder inputs. Some light aircraft have limited tail wheel steering interlinked with the rudder pedals, with the tail wheel breaking out to castor if the turning circle is too small, becoming steerable again once centralised; some aircraft have a tail skid mechanism. Inputs to hydraulic control valves directing pressure to the steering jacks are carried out mechanically (cables, bell cranks, levers, gearboxes) from the tiller and rudder pedals, with a follow-up action through interconnected links/cables that neutralise nose wheel movement once the desired turn rate is achieved. Rudder pedal steering input is usually restricted to a small degree of movement either side of the centreline, normally used on take-off or landing, and isolated when airborne.

### Nose Wheel Self-Centring
It is important that a steerable nose wheel is centred when retracted, so it fits into the wheel well without damaging the aircraft structure or landing gear. This can be achieved by a **centring cam** inside the oleo strut: when the strut is compressed, the piston cam disengages from the cylinder cam receptacle, allowing the wheel to be steered; on take-off, as the strut extends, the piston cam is forced into the cylinder receptacle, holding the wheel in the desired stowing position. Double servo jacks can centralise the wheel by supplying pressure to a centralising jack, normally initiated by the weight-on-wheels micro-switches as the aircraft takes off.
        $cnt2$,
        15
    ) RETURNING id INTO s15_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M11B.14 Ice and Rain Protection (20 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s14_id, 'Ice formation on aircraft can be classified under four main headings. Which of the following is one of them?',
     '[{"id":"a","text":"Glaze Ice","correct":true},{"id":"b","text":"Frazil Ice","correct":false},{"id":"c","text":"Wet Snow","correct":false}]',
     '{"B1"}'),

    (s14_id, 'Which type of ice formation is described as an opaque, rough deposit, light and porous, with a large amount of air trapped between the particles?',
     '[{"id":"a","text":"Glaze ice","correct":false},{"id":"b","text":"Rime ice","correct":true},{"id":"c","text":"Hoar frost","correct":false}]',
     '{"B1"}'),

    (s14_id, 'Glaze ice forms in greatest thickness on the leading edges of aerofoils and in reduced thickness as far aft as:',
     '[{"id":"a","text":"One quarter of the chord","correct":false},{"id":"b","text":"One half of the chord","correct":true},{"id":"c","text":"The full chord length","correct":false}]',
     '{"B1"}'),

    (s14_id, 'Glaze ice is considered the most severe and most dangerous form of ice formation on aircraft because of its:',
     '[{"id":"a","text":"Low weight","correct":false},{"id":"b","text":"High rate of catch","correct":true},{"id":"c","text":"Feathery appearance","correct":false}]',
     '{"B1"}'),

    (s14_id, 'Hail is formed when:',
     '[{"id":"a","text":"Water droplets, falling as rain, pass through icing levels and freeze","correct":true},{"id":"b","text":"Rime ice particles fuse together in freezing fog","correct":false},{"id":"c","text":"Snowflakes melt and refreeze on the ground","correct":false}]',
     '{"B1"}'),

    (s14_id, 'Which of the following is NOT listed as a critical area requiring ice protection?',
     '[{"id":"a","text":"Pitot static pressure heads","correct":false},{"id":"b","text":"All aerofoil leading edges","correct":false},{"id":"c","text":"The fuselage undersurface aft of the wing","correct":true}]',
     '{"B1"}'),

    (s14_id, 'According to the ANO Schedule 4, an aircraft of MTWA exceeding what weight must be provided with means of observing the existence and build-up of ice?',
     '[{"id":"a","text":"2,300 kg (5,000 lb)","correct":false},{"id":"b","text":"5,700 kg (12,500 lb)","correct":true},{"id":"c","text":"20,000 kg (44,000 lb)","correct":false}]',
     '{"B1"}'),

    (s14_id, 'The Visual (Hot Rod) Ice Detector consists of a steel tube detector mast of aerofoil section, mounted on the fuselage side, that houses:',
     '[{"id":"a","text":"A heating element, with a built-in floodlight in the plinth","correct":true},{"id":"b","text":"A wheelspeed transducer","correct":false},{"id":"c","text":"A resonant vibrating probe operating at 40 kHz","correct":false}]',
     '{"B1"}'),

    (s14_id, 'In a Pressure Operated Ice Detector Head, icing conditions are detected when:',
     '[{"id":"a","text":"Ice covers the leading-edge holes, so the airstream exhausts the system through the uncovered trailing-edge holes, collapsing the relay capsule and closing the contacts","correct":true},{"id":"b","text":"A serrated rotor experiences an increase in driving torque","correct":false},{"id":"c","text":"The probe''s resonant frequency increases","correct":false}]',
     '{"B1"}'),

    (s14_id, 'In the Serrated Rotor Ice Detector Head, a warning signal is initiated when:',
     '[{"id":"a","text":"Ice accretes on the rotor until the gap is filled and the knife-edge cutting action causes a substantial increase in required torque","correct":true},{"id":"b","text":"The airstream exhausts the pressure head through trailing-edge holes","correct":false},{"id":"c","text":"The vibrating probe frequency drops below 40 kHz","correct":false}]',
     '{"B1"}'),

    (s14_id, 'The Vibrating Rod Ice Detector''s sensing probe vibrates ultrasonically at its own resonant frequency of approximately:',
     '[{"id":"a","text":"4 kHz","correct":false},{"id":"b","text":"40 kHz","correct":true},{"id":"c","text":"400 kHz","correct":false}]',
     '{"B1"}'),

    (s14_id, 'There are four primary systems used for ice protection. Which of the following is NOT one of them?',
     '[{"id":"a","text":"Chemical immersion","correct":true},{"id":"b","text":"Thermal","correct":false},{"id":"c","text":"Pneumatic","correct":false}]',
     '{"B1"}'),

    (s14_id, 'Fluid ice protection systems are normally used on windscreens, aerofoils and propellers, but are NOT used on:',
     '[{"id":"a","text":"Engine air intakes, which are usually anti-iced instead","correct":true},{"id":"b","text":"Windscreens","correct":false},{"id":"c","text":"Aerofoil leading edges","correct":false}]',
     '{"B1"}'),

    (s14_id, 'The fluids used for aerofoil fluid ice protection systems are:',
     '[{"id":"a","text":"Alcohol based","correct":false},{"id":"b","text":"Glycol based","correct":true},{"id":"c","text":"Ammonia based","correct":false}]',
     '{"B1"}'),

    (s14_id, 'Pneumatic (mechanical) de-icing systems, using cyclic inflation and deflation of rubber boots on the leading edges, can be used:',
     '[{"id":"a","text":"For de-icing only — they cannot prevent ice formation","correct":true},{"id":"b","text":"For anti-icing only","correct":false},{"id":"c","text":"Interchangeably for both anti-icing and de-icing with equal effectiveness","correct":false}]',
     '{"B1"}'),

    (s14_id, 'In a thermal (hot air) ice protection system, entry of the heated air to the leading edge is made at the:',
     '[{"id":"a","text":"Trailing edge","correct":false},{"id":"b","text":"Stagnation point, where maximum temperature is required","correct":true},{"id":"c","text":"Wing root only","correct":false}]',
     '{"B1"}'),

    (s14_id, 'In a cyclic electrical de-icing system, the ratio of heating time ON to time OFF typically remains unchanged at approximately:',
     '[{"id":"a","text":"1:1","correct":false},{"id":"b","text":"1:10","correct":true},{"id":"c","text":"1:100","correct":false}]',
     '{"B1"}'),

    (s14_id, 'For a laminated glass windscreen, the optimum temperature range for maximum energy absorption (bird-proof characteristics) by the vinyl inter-layer is:',
     '[{"id":"a","text":"27ºC to 49ºC","correct":true},{"id":"b","text":"0ºC to 15ºC","correct":false},{"id":"c","text":"60ºC to 90ºC","correct":false}]',
     '{"B1"}'),

    (s14_id, 'In the "dry air sandwich" construction used to demist cabin windows, the desiccant used is silica gel crystals which are blue when dry and must be replaced when they:',
     '[{"id":"a","text":"Begin to turn pink","correct":true},{"id":"b","text":"Turn black","correct":false},{"id":"c","text":"Dissolve completely","correct":false}]',
     '{"B1"}'),

    (s14_id, 'A rain repellent system must never be operated on a dry windscreen because:',
     '[{"id":"a","text":"Heavy undiluted repellent will cause smearing and may form globules that distort vision","correct":true},{"id":"b","text":"It will immediately drain the entire fluid canister","correct":false},{"id":"c","text":"It will trigger the fire warning system","correct":false}]',
     '{"B1"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M11B.15 Landing Gear (22 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s15_id, 'The two main functions of a landing gear are:',
     '[{"id":"a","text":"Supporting the weight of the stationary aircraft on the ground, and absorbing the loads during touchdown, landing run and taxiing","correct":true},{"id":"b","text":"Steering the aircraft and generating lift on the runway","correct":false},{"id":"c","text":"Reducing engine vibration and cooling the brakes","correct":false}]',
     '{"B1"}'),

    (s15_id, 'The tricycle undercarriage configuration became almost universal because it overcame the main disadvantage of the earlier tailwheel configuration, which was:',
     '[{"id":"a","text":"Excessive parasitic drag at all speeds","correct":false},{"id":"b","text":"The risk of the aircraft nosing over under heavy braking and poor crew visibility while taxiing","correct":true},{"id":"c","text":"Inability to support propeller-driven aircraft","correct":false}]',
     '{"B1"}'),

    (s15_id, 'On an oleo-type landing gear, the hinged torque (scissor) link located between the axle yoke and the cylinder body:',
     '[{"id":"a","text":"Allows the piston to move freely in and out of the cylinder but prevents the piston and wheel assembly from swivelling","correct":true},{"id":"b","text":"Provides the main shock-absorbing action of the strut","correct":false},{"id":"c","text":"Locks the gear in the retracted position","correct":false}]',
     '{"B1"}'),

    (s15_id, 'A hop damper, used with multi-wheel landing gear units, is connected between the main landing gear body and the bogie in order to:',
     '[{"id":"a","text":"Align the bogie at the correct angle for landing and absorb minor shock loads during taxiing","correct":true},{"id":"b","text":"Provide the main up-lock function","correct":false},{"id":"c","text":"Steer the nose wheel","correct":false}]',
     '{"B1"}'),

    (s15_id, 'Which of the following is an advantage of multi-wheel landing gear configurations?',
     '[{"id":"a","text":"A smaller turning circle","correct":false},{"id":"b","text":"Landing loads are spread over a larger footprint and a burst tyre is less critical","correct":true},{"id":"c","text":"Fewer moving parts requiring less maintenance","correct":false}]',
     '{"B1"}'),

    (s15_id, 'The three main types of shock-absorbing strut commonly used in commercial aircraft are oleo-pneumatic without separator, oleo-pneumatic with separator, and:',
     '[{"id":"a","text":"Liquid spring","correct":true},{"id":"b","text":"Leaf spring only","correct":false},{"id":"c","text":"Pure air spring","correct":false}]',
     '{"B1"}'),

    (s15_id, 'In an oleo-pneumatic strut WITHOUT a separator, some aeration ("froth") of the oil and gas occurs because:',
     '[{"id":"a","text":"There is no separator between the oil and gas, so they mix at the demarcation line","correct":true},{"id":"b","text":"The nitrogen pressure is always higher than the oil pressure","correct":false},{"id":"c","text":"The strut is filled entirely with compressed air instead of nitrogen","correct":false}]',
     '{"B1"}'),

    (s15_id, 'The main advantage of an oleo-pneumatic strut WITH a separator (floating piston) compared to one without is:',
     '[{"id":"a","text":"It prevents oil and gas mixing, allows more flexible nitrogen chamber positioning, and simplifies servicing","correct":true},{"id":"b","text":"It eliminates the need for a metering pin","correct":false},{"id":"c","text":"It removes the need for any hydraulic oil","correct":false}]',
     '{"B1"}'),

    (s15_id, 'In a liquid spring shock absorber, energy absorption relies on compression of the oil at pressures that can exceed:',
     '[{"id":"a","text":"3,000 psi, the same as normal hydraulic system pressure","correct":false},{"id":"b","text":"60,000 psi","correct":true},{"id":"c","text":"600 psi","correct":false}]',
     '{"B1"}'),

    (s15_id, 'When filling and charging a typical oleo-pneumatic strut, the correct general sequence is to:',
     '[{"id":"a","text":"Charge the nitrogen first, then bleed the oil afterwards","correct":false},{"id":"b","text":"Release nitrogen pressure, compress the leg, fill and bleed the oil, then charge the leg with nitrogen to the correct extension","correct":true},{"id":"c","text":"Fill the oil while the aircraft is airborne","correct":false}]',
     '{"B1"}'),

    (s15_id, 'It becomes economically practical to retract a landing gear into the aircraft structure once:',
     '[{"id":"a","text":"The parasite drag of the fixed gear exceeds the induced drag caused by the added weight of the retracting system","correct":true},{"id":"b","text":"The aircraft reaches its maximum landing weight","correct":false},{"id":"c","text":"The aircraft is fitted with an anti-skid system","correct":false}]',
     '{"B1"}'),

    (s15_id, 'A squat switch system and an electro-mechanical stop on the selector lever exist primarily to:',
     '[{"id":"a","text":"Prevent the landing gear from being retracted while the aircraft is on the ground","correct":true},{"id":"b","text":"Prevent the landing gear from being lowered in flight","correct":false},{"id":"c","text":"Automatically apply the aircraft brakes on touchdown","correct":false}]',
     '{"B1"}'),

    (s15_id, 'The down-lock mechanism forms a mechanical lock preventing the landing gear leg from collapsing by moving the upper and lower toggle levers to a(n):',
     '[{"id":"a","text":"Under-centre position","correct":false},{"id":"b","text":"Over-centre position","correct":true},{"id":"c","text":"Neutral mid-travel position","correct":false}]',
     '{"B1"}'),

    (s15_id, 'A door-operated landing gear door sequencing system will only allow hydraulic pressure to flow to the main gear actuator when:',
     '[{"id":"a","text":"The door is fully open","correct":true},{"id":"b","text":"The gear leg is fully retracted","correct":false},{"id":"c","text":"The aircraft is weight-on-wheels","correct":false}]',
     '{"B1"}'),

    (s15_id, 'Under the modern "dark cockpit" philosophy for landing gear indications, when the legs are properly locked up the indicator lights are normally:',
     '[{"id":"a","text":"All illuminated green","correct":false},{"id":"b","text":"All extinguished (no lights)","correct":true},{"id":"c","text":"All illuminated red","correct":false}]',
     '{"B1"}'),

    (s15_id, 'The proximity and limit switches that prevent inadvertent retraction of the landing gear on the ground form part of the:',
     '[{"id":"a","text":"Weight-on-wheels / weight-off-wheels squat switch system","correct":true},{"id":"b","text":"Autobrake termination system","correct":false},{"id":"c","text":"Rain repellent time-delay circuit","correct":false}]',
     '{"B1"}'),

    (s15_id, 'Larger aircraft wheels are fitted with one or more fusible plugs, which contain a low-melting-point alloy that:',
     '[{"id":"a","text":"Melts if the tyre overheats past a temperature limit, allowing the tyre to safely deflate","correct":true},{"id":"b","text":"Conducts static electricity to earth on touchdown","correct":false},{"id":"c","text":"Indicates tyre wear once exposed","correct":false}]',
     '{"B1"}'),

    (s15_id, 'The carcass (chord body) of an aircraft tyre is constructed from layers of rubberised fabric with threads running at an angle of about 45 degrees, with each ply crossing the adjacent ply at about 90 degrees. This type of construction is known as:',
     '[{"id":"a","text":"Radial ply","correct":false},{"id":"b","text":"Bias ply","correct":true},{"id":"c","text":"Cross-lattice ply","correct":false}]',
     '{"B1"}'),

    (s15_id, 'Using the tyre groove wear-assessment method, a tyre must be replaced when any groove is worn to less than 2mm in depth for more than what percentage of the tread circumference?',
     '[{"id":"a","text":"10%","correct":false},{"id":"b","text":"25%","correct":true},{"id":"c","text":"75%","correct":false}]',
     '{"B1"}'),

    (s15_id, 'The approximate formula for aquaplaning speed, as given in the source text, is:',
     '[{"id":"a","text":"Aquaplaning Speed (kt) = 9 x Square Root of the Tyre Pressure","correct":true},{"id":"b","text":"Aquaplaning Speed (kt) = Tyre Pressure divided by 9","correct":false},{"id":"c","text":"Aquaplaning Speed (kt) = 9 x Tyre Pressure squared","correct":false}]',
     '{"B1"}'),

    (s15_id, 'In an electronic anti-skid system, the anti-skid control valve can achieve a rapid "brakes off/brakes on" modulation rate of up to:',
     '[{"id":"a","text":"5 cycles per second","correct":false},{"id":"b","text":"50 cycles per second","correct":true},{"id":"c","text":"500 cycles per second","correct":false}]',
     '{"B1"}'),

    (s15_id, 'In a mechanical anti-skid ("maxaret") unit, rapid wheel deceleration is detected by:',
     '[{"id":"a","text":"A wheel speed transducer sending an output voltage to an electronic control unit","correct":false},{"id":"b","text":"A heavy internally mounted flywheel that continues rotating at higher speed due to inertia, advancing through an arc until it contacts limit stops","correct":true},{"id":"c","text":"A torque-motor-operated flapper valve","correct":false}]',
     '{"B1"}');

END $$;
