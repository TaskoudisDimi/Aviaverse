-- Module 13: Aircraft Aerodynamics (B2) — Ice and Rain Protection (ATA 30), Information Systems (ATA 46)
-- Source: EASA Part-66 Module 13 official textbook (IKAROS Aviation Training Centre, IK M13, Issue Oct.2012)
-- This module is B2-ONLY.

DO $$
DECLARE
    m13_id INT;
    s15_id INT;
    s22_id INT;
BEGIN
    SELECT id INTO m13_id FROM easa_modules WHERE code = 'M13';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M13.15') THEN
        RAISE NOTICE 'M13.15/M13.22 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 13.15: Ice and Rain Protection
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m13_id, 'M13.15', 'Ice and Rain Protection',
        $cnt$
# Ice and Rain Protection

## Factors Affecting Ice Formation

Ice formation on aircraft in flight is the same as on the ground. It is caused by coldness acting on moisture in the air. Water occurs in the atmosphere in three forms — invisible vapour, liquid water and ice. The smallest drops of liquid water constitute clouds and fog, the largest drops occur only in rain, and drizzle drops are in between. Icing consists of crystals whose size and density depend on the temperature and the type of water in the atmosphere from which they form. Snowflakes are produced when a number of crystals stick together or, in very cold regions, by small individual crystals.

Ice formation can be classified under four main headings: **Hoar Frost**, **Rime Ice**, **Glaze Ice** and **Pack Snow**. Depending on circumstances, variations of these forms can occur, and two different types of icing may appear simultaneously on parts of the aircraft.

## Types of Ice Formation

### Hoar Frost

Hoar frost occurs on a surface at a temperature below the frost point of the adjacent air (and below freezing point). It forms in clear air when water vapour condenses on the cold airframe surface and is converted directly to ice, building up into a white, semi-crystalline, normally feathery coating.

On the ground, the weight of hoar frost is unlikely to be serious, but if not removed it may interfere with airflow and the attainment of flying speed during take-off, obscure the windscreen, and affect free working of control surfaces. In flight, hoar frost usually commences with a thin layer of glaze ice on the leading edge, followed by frost gradually spreading over the whole surface; effects are not usually serious, though some change in landing characteristics can be expected.

### Rime Ice

Less dense than glaze ice, rime ice is an opaque, rough deposit. At ground level it forms in freezing fog on the windward side of exposed objects. It is light and porous, resulting from small water drops freezing as individual particles with little or no spreading, trapping a large amount of air between the particles.

In flight, rime icing occurs when flying through a cloud of small water drops with the air temperature and airframe temperature below freezing. It builds up on the leading edge but does not extend far back along the chord. It usually has no great weight, but the danger is that it interferes with airflow over the wings. If super-cooled droplets are small enough and the temperature is low, each droplet freezes instantly on impact as an individual particle; being a non-adhesive dry powder in the slipstream, the accumulation is not serious — this is called **"opaque rime."**

### Glaze Ice

Glaze ice forms when the aircraft encounters large water drops in clouds or in freezing rain (super-cooled rain) with the air and airframe temperature below freezing. It is a transparent or opaque coating with a glassy surface, resulting from liquid water flowing over the airframe before freezing, and may be mixed with sleet or snow. **It forms in greatest thickness on the leading edges of aerofoils and in reduced thickness as far aft as one half of the chord.** Ice formed this way is dense, tough and sticks closely to the surface — it cannot easily be shaken off, and if it breaks away it comes off in lumps of appreciable, sometimes dangerous, size.

The main danger of glaze ice is aerodynamic, but its weight also produces unequal loading and propeller blade vibrations. **Glaze ice is the most severe and most dangerous form of ice formation** because of its high **rate of catch**. Super-cooled rain is rare in the British Isles but more common on the Continent and the East coast of North America.

### Pack Snow

Snow falling on an aircraft in flight normally does not settle, but if the airframe temperature is below freezing, glaze ice may form from moisture in the snow; snow may subsequently be embedded in the ice so formed. The icing in such conditions is primarily due to water drops.

### Hail

Hail forms when water droplets, falling as rain, pass through icing levels and freeze. Air currents in some storm clouds (Cumulo-nimbus) may carry hail vertically through the cloud a number of times, increasing the hailstone size at each pass until it is heavy enough to fall from the base of the cloud. Aircraft encountering hail may suffer severe damage — dented skin, cracked windscreens, blocked intakes and serious damage to gas turbine engines.

## Areas to be Protected

The following are critical areas where ice forms and protection is essential:
- All aerofoil leading edges
- Engine air intakes (including carburettor intakes)
- Windscreens
- Propellers
- Pitot static pressure heads

## Effects of Ice on the Aircraft

The build-up of ice is known as **"ice accretion."** If ice continues to be deposited, one or more of these effects may occur:

- **Decrease in Lift** — due to changes in wing section resulting in loss of streamlined flow around the leading edge and top surfaces.
- **Increase in Drag** — due to the rough surface, especially if the formation is rime, resulting in greatly increased surface friction.
- **Increased Weight and Wing Loading** — the weight of the ice may prevent the aircraft maintaining height.
- **Decrease in Thrust** — with turbo-prop and piston engines, propeller efficiency decreases due to alteration of blade profile and increased blade thickness; vibration may occur due to uneven ice distribution along the blades. Gas turbine engines may be affected by ice on the intake disturbing airflow to the compressor, and ice breaking away may be ingested, causing severe compressor blade damage.
- **Inaccuracy of Pitot Static Instruments** — ice on the pitot static pressure head blocks sensing lines and produces false readings.
- **Loss of Inherent Stability** — due to displacement of the centre of gravity caused by the ice weight.
- **Reduced radio antennae efficiency.**
- **Loss of Control** — ice may prevent movement of control surfaces (usually a ground problem, not usually in flight).

On the ground, additional effects can include restriction of controls if ice is not removed from hinges and gaps, an increased take-off run (increased weight and drag), and a reduced rate of climb.

## Ice Detection

Per the ANO Schedule 4: in the case of an aircraft of MTWA exceeding 5700 kg (12500 lb), a means of observing the existence and build-up of ice on the aircraft must be provided. The equipment is carried on flights when weather reports or forecasts at the aerodrome indicate that conditions favouring ice formation are likely to be met.

## Methods of Ice Detection

### Visual (Hot Rod) Ice Detector

Consists of an aluminium alloy oblong base (the plinth) on which is mounted a steel tube detector mast of aerofoil section, angled back approximately 30° from the vertical, mounted on the fuselage side so it can be seen from the flight compartment windows. The mast houses a heating element; the plinth has a built-in floodlight. The heating element is normally off; when icing conditions are met, ice accretes on the leading edge of the detector mast and can be observed by the flight crew. The floodlight may be switched on at night. By manual selection of the heating element switch, the formed ice is dispersed for further observance.

### Pressure Operated Ice Detector Heads

A short stainless steel or chromium-plated brass tube, closed at its outer end, mounted to project vertically from a portion of the aircraft known to be susceptible to icing. Four small holes are drilled in the leading edge; the trailing edge has two holes of less total area. A heater element clears the head of ice.

Each system comprises a detector head, a detector relay and a warning lamp. In normal flight, air-stream pressure builds up inside the tube, communicated to the capsule of an electro-pneumatic relay, tending to expand it and separate a pair of electrical contacts. When icing conditions are met, ice forms on the leading edge and closes off those holes; since the trailing-edge holes remain uncovered, the air-stream tends to exhaust the system, collapsing the relay capsule and closing the relay contacts. These contacts, generally operating with a thermal device, illuminate a warning indicator and switch on the heater in the detector head; a cam holds the lamp on for a further **4 minutes** and the heater for a further **30 seconds**. Should icing persist and the head ices up again, the cam automatically re-sets and the cycle repeats.

### Serrated Rotor Ice Detector Head

Consists of a serrated rotor with an integral drive shaft coupled to a small AC motor via a reduction gearbox, rotated adjacent to a fixed knife-edge cutter. The motor casing connects via a spring-tensioned toggle bar to a micro-switch assembly. The rotor periphery rotates within **0.050 mm (0.002 in)** of the knife-edge cutter's leading edge. Under non-icing conditions, torque to drive the rotor is slight (only bearing friction). Under icing conditions, ice accretes on the rotor until the gap is filled, whereupon the knife edge's cutting action produces a substantial increase in required torque, moving the toggle bar against its spring mounting and operating the micro-switch to initiate a warning signal. Once icing ceases, torque loading reduces, the motor returns to its normal position, and the micro-switch opens the ice warning circuit.

### Vibrating Rod Ice Detector

A solid-state ice detector with an advisory warning light. The probe (exposed to the airstream) is an ice-sensing element that ultrasonically vibrates in an axial mode at its own resonant frequency of approximately **40 kHz**. When ice forms on the sensing element, the probe frequency decreases; the detector circuit compares this against a reference oscillator, and at a predetermined frequency change, the ice detector circuit activates: the warning light illuminates and a timer circuit triggers, switching a probe heater on for a set period to remove the ice. If a further ice warning signal is received during the timer period, the timer is re-triggered, the warning light remains on, and the heater is again selected on — this cycle repeats for as long as icing conditions prevail.

### Ice Formation Spot Light

Many aircraft have two ice formation spot lights, one each side of the fuselage, positioned to light up the leading edges of the mainplanes for visual examination. On some aircraft this may be the only method of ice detection.

## Anti-Icing and De-Icing Systems — Introduction

There are two main categories of ice protection:

- **De-icing** — ice is allowed to form on the surfaces and is then removed by operating the particular system in the specified sequence.
- **Anti-icing** — ice is prevented from forming by ensuring the protection system is operating whenever icing conditions are encountered or forecast.

There are **four primary systems** used for ice protection:
1. Fluid
2. Pneumatic
3. Thermal
4. Electrical

## Fluid Systems

May be used as anti-icing or de-icing. As anti-icing, it works on the principle that the freezing point of water can be lowered if a fluid of low freezing point is applied to the protected areas before icing occurs. As de-icing, fluid is applied to the interface of the aircraft surface and the ice, breaking the ice's adhesion so it is carried away by the airflow. Normally used on windscreens and aerofoils, and also successfully on propellers; **not used on engine air intakes**, which are usually anti-iced.

### Windscreen Protection

The windscreen panel is sprayed with an **alcohol-based fluid**. Principal components: fluid storage tank, hand-operated or electrically-driven pump, supply pipelines, spray tubes.

### Aerofoil Systems

Fluids used are all **glycol-based**, with low freezing point, non-corrosive, low toxicity and low volatility properties. They have a detrimental effect on some windscreen sealing compounds and cause crazing of perspex panels. System components: tank, pump, filter, pipelines, distributors, and controls/indicators (switch, pump power failure warning light, tank contents indicator). The system may be switched on automatically by the ice detector or manually. After an initial "flood" period (pump runs continuously to prime pipelines and wet the leading edge), the system is controlled by a cyclic timer turning the pump ON and OFF for predetermined periods.

Leading edge distributors take two forms:
- **Strip Distributor** — a "U" channel divided into primary and secondary channels by a central web, closed by a porous metal spreader through which fluid seeps; primary and secondary channels are interconnected by flow control tubes. Rarely used; only found on very old aircraft.
- **Panel Distributors** — a micro-porous stainless steel outer panel, a micro-porous plastic sheet and a metering tube. Fluid passes through the metering tube, which calibrates flow rate into a cavity between the plastic sheet and a back-plate; this cavity stays filled during operation, and fluid seeps through the porous outer panel, with airflow directing it over the aerofoil.

When a system is out of service or unused for an extended period, it should be functioned periodically to prevent fluid crystallising and blocking the metering tubes, porous surfaces and pipelines.

### Propeller Systems

The propeller blade root and a section of the blade must be de-iced to prevent build-up that would change the blade profile and upset aerodynamic characteristics; uneven build-up also causes imbalance and vibration. The leading edge is de-iced, and ice is shed by centrifugal force. The blade root has a rubber cuff into which de-icing fluid is fed by a pipeline from a **slinger ring** on the spinner back plate; from the cuff, fluid is spread along the leading edge by centrifugal force. Fluid is fed into the slinger ring from a fixed pipe on the front of the engine.

## Pneumatic Systems

Pneumatic (mechanical) systems are used for **de-icing only** — it is not possible to prevent ice formation this way. They work by cyclic inflation and deflation of rubber tubes on aerofoil leading edges, used on certain piston-engine and twin turbo-propeller aircraft types.

De-icer boots (overshoes) consist of layers of natural rubber and rubberised fabric, between which are flat inflatable tubes closed at the ends, fitted in sections along the leading edges of wing, vertical and horizontal stabilisers. Tubes may be laid spanwise, chordwise, or a combination. Boots are attached by screw fasteners or cemented directly to the leading edge skin, and their external surfaces are coated with a conductive material film to bleed off static electricity.

### Air Supplies

Overshoe tubes are inflated by air from the pressure side of an engine-driven vacuum pump or, on some turbo-propeller aircraft, from a tapping on the engine compressor. At the end of the inflated stage, and whenever the system is switched off, boots are deflated by vacuum from the vacuum pump or from the venturi section of an ejector nozzle (in systems using engine compressor tapping).

### Distribution

Three methods are generally used to distribute air to the boots: shuttle valves controlled by a separate solenoid valve; individual solenoid valves direct air to each boot; motor driven valves.

### Controls and Indication

A typical system has a main ON-OFF switch and pressure/vacuum gauges or indicating lights. Pressure and vacuum are applied to the boots in an alternating, timed sequence, usually controlled by an electronic timing device.

### Operation

When switched on, pressure inflates groups of tubes in sequence, weakening the bond between ice and boot surface and cracking the ice, which is carried away by the airflow. At the end of the inflation stage, air is vented to atmosphere and the tubes are fully deflated by the vacuum source; the inflation/deflation cycle repeats while the system is on. When switched off, vacuum is applied continually to hold the tubes flat against the leading edges, minimising aerodynamic drag.

## Thermal (Hot Air) System

Employs heated air ducted span-wise along the inside of the leading edge, distributed between double-thickness skins. Entry to the leading edge is at the stagnation point, where maximum temperature is required; hot air then flows back chord-wise through corrugations into the main aerofoil section to exhaust points. In anti-icing systems a continuous supply of heated air is fed to the leading edges; in de-icing systems, more intensely heated air is supplied for shorter periods on a cyclic basis. Hot gas may be derived from heat exchangers around exhausts, independent combustion heaters, or direct tappings from turbine engine compressors.

### Exhaust Gas Heating System

Ambient air enters an intake in the engine nacelle and is ducted through tubes of a heat exchanger; exhaust gases from the jet pipe are partially diverted by electrically actuated flaps to flow between the tubes before discharging to atmosphere. Heated air passes to a duct with an electrically operated hot air valve before reaching the leading edges. If the gas flap fails open, an emergency manual override closes the hot air valve and opens an actuator-operated spill valve to direct hot air overboard. The gas flap actuator and hot air valve actuator are electrically interlocked so the hot air valve must be fully open before the gas flap opens, and the gas flap must be fully closed before the hot air valve closes — controlled by limit switches, preventing heat exchanger overheating. Temperature control is automatic with a standby manual facility; a control unit with "normal" and "overheat" thermistors provides automatic control and overheat protection, and an overheat control unit with an "override" thermistor and flame-stat provides a final overheat protection system.

### Hot Air Bleed System

Air is bled from a late stage of the gas turbine engine compressor and distributed to aerofoil leading edges, used for anti-icing or de-icing on wing and tail leading edges, and also for ice protection of engine intakes. The system works either by maintaining skin temperature above the icing point or by raising it to melt ice already formed. On aircraft with rear-fuselage-mounted engines, distribution along the wing leading edges may be graded for higher heating intensity inboard, to prevent shedding ice into the engine intakes. Anti-icing shut-off valves on each engine open to supply air to the leading edge ducting at temperatures of about **200°C**; wing and fuselage cross-over ducts ensure supply to all surfaces if an engine shuts down in flight. Air temperature in the ducting may also be controlled by mixing compressor bleed air with ram air via a cold air control valve. When initially switched on, hot air is fed undiluted into the cold ducting; temperature sensors in the leading edge monitor the temperature rise and progressively open/close the cold air valve via an inching unit to control skin temperature. If the temperature sensor, cold air valve, or ram air inlet fails/blocks, an overhead sensor controls temperature by regulating the hot air valve.

## Electrical Ice Protection System

Electrical heater elements are attached to the outer surface of the protected area, using two methods: the **heater mat** and the **spray mat**.

### Heater Mat

Consists of two thin layers of rubber or PTFE sandwiching a heater element, moulded to fit snugly over the section to be protected. The latest mats have elements made from a range of alloys woven in continuous filament glass yarn.

### Spray Mat

Sprayed directly onto the surface, developed by the Napier Company for a lightweight system suited to compound curves. A base insulator (synthetic resin), normally about **0.03 inches thick**, is brushed directly onto the airframe. The heater element (aluminium or Kumanol, a copper-manganese alloy) is sprayed onto the base insulation using a flame spraying technique. A further insulation layer of the same material, about **0.01 inches thick**, is applied. A protective coating, called **"stoneguard,"** consisting of stainless alloy particles bonded with synthetic resin, is used where the heater requires extra protection, e.g. on leading edges.

Some elements are supplied continuously (anti-icing); others intermittently on a cyclic basis (de-icing). Continuously heated "breaker" strips separate cyclically heated areas to ensure a clean breakaway of ice.

**Anti-icing** — heat is supplied continuously, graded so no ice formation occurs under operating conditions, regulated by an embedded sensing element with a thermal controller or a surface-mounted thermostatic switch pre-set to cut-in/cut-out temperature levels.

**Cyclic De-icing** — areas are grouped and connected to a cyclic switch controlled by timed impulses from a pulse generator or a built-in electronic device. The ratio of time ON to time OFF remains unchanged regardless of ambient temperature; the **typical ratio is 1:10**. At higher ambient temperature, icing rate is likely higher but only a short heating period is needed to shed ice; at very low temperatures, icing rate is lower but longer heating periods are required. Setting may be manual (from ambient air temperature indications) or automatic (ON:OFF periods varied by an ambient air temperature probe working with an ice detector or rate-of-icing indicator).

### Windscreen Anti-Icing

Windscreens of high-performance pressurised aircraft use a **laminated glass** construction — clear vinyl plastic (polyvinyl butyral) interposed between preformed, pre-tempered glass plies, bonded by pressure and heat, giving shatter-proof characteristics. Bird-proof characteristics depend on the plasticity of the vinyl, which depends on its temperature. The optimum temperature range for maximum energy absorption is between **27°C and 49°C**, and electrically heated windscreen panels are normally maintained within these limits; below this range, bird-proof characteristics decline rapidly, and at a moderate temperature of 16°C a panel's impact resistance can be reduced by 30% to 50%.

The heating element is an extremely thin, transparent conductive coating "floated" onto the inside surface of the outer glass ply (which is normally thinner, allowing more rapid heat conduction); the coating may be tin oxide or gold film. The coating is heated by alternating current supplied to busbars at the panel edges. A controlling device maintains a constant windscreen temperature and prevents overheating of the vinyl inter-layer(s), connected to temperature-sensing elements embedded in the windscreen. Two temperature-sensing methods are used: a grid whose resistance varies directly and linearly with temperature, and a thermistor whose resistance varies inversely and exponentially with temperature. Warning lights/indicators show circuit conditions such as "normal," "off" or "overheat." If the controller fails, glass temperature rises until the overheat sensing element's setting is reached, at which an overheat control circuit cuts off the heating power and illuminates a warning light; power is restored and the light extinguished once the glass has cooled through a specific temperature range.

## Windscreen / Cabin Window De-Misting Systems

Glass is a very poor conductor of heat; at altitude the low atmospheric temperature keeps the windscreen/cabin window inner surface cold, causing condensation and obscured vision. Windscreens are normally kept mist-free by blowing hot air from the air conditioning system across the inner surface. Demisting of some windscreens and usually all cabin windows is also achieved using **"dry air sandwich"** construction: outer and inner glass layers sandwiching a layer of dry air, like double-glazing. The outer layer is thick laminate (glass and vinyl) for impact/shatterproof qualities; the inner layer is much thinner, allowing it to be warmed by cabin air, preventing condensation.

The air sandwich is kept dry by one of two methods: the two glass layers are hermetically sealed with dry air between them during manufacture, or the space between layers is vented to the cabin to equalise pressure, with venting passing through a desiccant unit that absorbs moisture to maintain dryness. The desiccant used is **Silica Gel crystals**, blue in colour, gradually changing to pink or white as they absorb moisture; the desiccant must be replaced when it begins to turn pink, or condensation within the dry air sandwich may occur, requiring lengthy rectification or replacement of the windscreen/window.

## Rain Protection: Windscreen Clearing Systems

Vision through windscreens may be obscured by rain, dust, dirt and flies. Windscreen clearing systems fall under: rain clearing systems (windscreen wipers, pneumatic rain removal, rain repellent) and windscreen washing systems.

### Windscreen Wiper Systems — Electrical System

Wiper blades are driven by electric motor(s) powered from the aircraft electrical system; sometimes the pilot's and co-pilot's wipers use separate motors so clear vision is maintained on one screen if the other system fails. Each wiper is driven by a motor-converter assembly converting rotary motor motion to reciprocating motion. When "high" is selected, relays 1 and 2 energise, fields 1 and 2 energise in parallel, and motors operate at approximately **250 strokes/minute**. When "low" is selected, relay 1 energises, fields 1 and 2 energise in series, and the motor operates at approximately **160 strokes/minute**. Setting the switch to OFF allows relay contacts to return to normal, but the motor continues running until the wiper arm reaches the "park" position: with both relays open and the park switch closed, motor excitation reverses, moving the motor off the lower edge of the windscreen and opening the cam-operated park switch, which de-energises the motor and releases the brake solenoid to apply the brake, preventing the motor coasting and re-closing the park switch.

The wiper blade's swept path may clear an arc, or move in a parallel motion. Parallel motion is preferred as it provides a greater swept surface, but the operating mechanism is more complex.

### Windscreen Wiper Systems — Electro-Hydraulic System

Older aircraft used hydraulic motors instead of electric motors to drive the wiper blades, with two independently operated motors powered from each hydraulic system and control valves operated from a flight deck selector.

### Windscreen Wiper Servicing

Servicing consists of inspection, operational checks, adjustments and fault finding.

- **Inspection** — cleanliness, security, damage, connections and locking of the system; blades checked for security, damage and contamination and replaced at regular intervals; fluid level checked (electro-pneumatic system); hydraulic pipes checked for leakage and electrical cables for deterioration and chafing.
- **Operational check** — the windscreen must be free of foreign matter and the blade secure and undamaged before checking; the windscreen must be kept wet with water during the check. **Wipers must never be operated on a dry screen** — it may cause scratches.
- **Adjustments** — blade tension is adjusted per the Maintenance Manual, checked with a spring balance at 90° to the point of attachment; blade angle is adjusted so the blade does not strike the windscreen frame (which would cause rapid blade damage); proper parking must be ensured so wipers do not obscure vision.

## Pneumatic Rain Removal Systems

Windscreen wipers suffer two basic problems: aerodynamic forces at speed tend to reduce blade pressure on the screen, causing ineffective wiping, and it is hard to achieve blade oscillation rates high enough to clear the screen during heavy rain. Pneumatic rain clearance systems overcome these by using high-pressure bleed air from the gas turbine engine, blown over the windscreen face from ducts mounted at the base of the screen; the air blast forms a barrier preventing rain spots from striking the screen.

## Windscreen Washing System

A spray of fluid (usually de-icing fluid, e.g. Kilfrost) is directed onto the windscreens to enable wipers to clear dust and dirt from dry windscreens in flight or on the ground. The fluid is contained in a reservoir and sprayed through nozzles, directed by an electrically driven pump or by pressurising the reservoir top with compressor bleed air via a pressure reducing valve. Servicing involves functional testing, reservoir replenishment, and checks for security, leaks and damage. The system may be used in flight and on the ground.

## Rain Repellant

When water is poured on clear glass it spreads evenly to form a thin film, and even when tilted and subjected to an air stream, the glass remains wetted, reducing vision. When treated with certain chemicals (typically silicone based), the water film breaks up and forms beads of water, leaving the glass dry between the beads, so the water can be readily removed. The chemical is stored in pressurised, disposable cans, discharged onto the windscreen through propelling nozzles.

The system is operated by a push button, opening the relevant solenoid valve; fluid is discharged onto the windscreen for about **5 seconds** under the control of a time delay unit. About **5 cc** of fluid is used per discharge, from a container holding approximately **50 cc**. The solenoid de-energises after discharge, and the button must be re-selected for a further application. The fluid is spread over the screen by the rain, which acts as a carrier. The system may be used with or without wipers, but is normally used to supplement wipers in heavy rain at low altitude where airspeeds are low.

It is essential the system is **not operated on dry windscreens**, because heavy undiluted repellent will cause smearing and the repellent may form globules and distort vision. If inadvertently operated, the wipers must not be used (this would increase smearing) — the screen should be washed with clean water immediately, using the windscreen wash system if fitted. Rain repellent residues can cause staining or minor corrosion of the aircraft skin.

## Drain Mast Heating

On many large aircraft, the water supply and water drain lines are electrically heated to prevent ice formation, with power normally supplied via the AC bus line, available both on the ground and in flight.

## Water Supply and Drain Lines

Heater tapes and blankets are wrapped around some water supply and drain lines, with temperature controlled by thermostats. In a typical aircraft (Boeing 757), the thermostats control the heating to open when temperature exceeds **15.5°C** and close when temperature drops to **7.2°C**. Heating gaskets may be installed on the ends of toilet drain pipes.

## Drain Masts

Drain masts are heated to allow in-flight drainage without freezing. Drain mast heating is controlled by an air/ground relay: low heat is supplied on the ground, high heat in flight.
        $cnt$,
        19
    ) RETURNING id INTO s15_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 13.22: Information Systems
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m13_id, 'M13.22', 'Information Systems',
        $cnt2$
# Information Systems (ATA 46)

## Scope

Information Systems (ATA 46) covers the units and components which furnish a means of storing, updating and retrieving digital information traditionally provided on paper, microfilm or microfiche. This includes units dedicated to information storage and retrieval, such as the electronic library mass storage and controller. It does **not** include units or components installed for other uses and shared with other systems, such as a flight deck printer or a general-use display.

Typical examples include Air Traffic and Information Management Systems and Network Server Systems, as well as: Aircraft General Information System; Flight Deck Information System; Maintenance Information System; Passenger Cabin Information System; Miscellaneous Information System.

## Onboard Information Systems (OIS)

### Purpose

The purpose of Information Systems is to improve flight, cabin and maintenance operations, and provide services for passengers. The Onboard Information System (OIS) includes:
- The **Network Server System (NSS)**, which hosts the OIS
- The **Air Traffic Control (ATC) system**

### Overview

Modern aircraft computer architectures are based on a system of networked "real-time" servers and routers, combined with central acquisition of parameters and secure digital communications. Although open to the world via digital radio links, the whole onboard system is designed to be highly secure, both from a computer-security and an operational-availability point of view, thanks to its redundant architecture.

The information system collects, centralizes and compiles all flight-related data on a single system, and provides external communication, data calculation and storage. This modular, central system also hosts applications unique to the aircraft type and particular airlines, dealing with aeroplane operation and services offered to passengers — for example onboard electronic documentation, navigation diagrams, performance calculations and flight logs.

The OIS mainly improves airline operations on the ground and in flight by supplying electronic forms (e.g. logbook) and documentation, replacing paper media, and offering customized applications and documentation developed by the aircraft manufacturer, the airline or a third party. These enhancements provide: the flight crew easy, intuitive and quick access to decision-making data; maintenance personnel tools for easy maintenance operations, improving aircraft autonomy and reducing troubleshooting time; cabin crew easy access to electronic documentation and forms; and passengers worldwide electronic mail and internet services.

The **Network Server System (NSS)** is the system's backbone. One part of the NSS is highly secured, with a high confidence level, strictly devoted to the avionics field; another part, containing information and documents related to flight operations, is connected to the outside world (in-flight entertainment system, wireless connections, etc.).

The **Secure Communication Interface (SCI)** is a link between the world of avionics and the open world. As a basic component of the network's security, it guarantees the security of information exchanged between the IFE and the avionics systems, and the security of ground-to-air and air-to-ground exchanges.

The Onboard Information System is made up of these sections:
- Onboard Information System – Core
- Onboard Information System – Cockpit
- Onboard Information System – Maintenance
- Onboard Information System – Cabin
- Air Traffic Control systems
- Internal Wireless Data link
- Maintenance Applications – Electronic Logbook
- Software Pin Programming Broadcasting

The **Software Pin Programming Broadcasting** application configures the other systems for different aircraft types and provides related options for different airlines.

The OIS makes the electronic library available to flight and maintenance crew, to improve operations and passenger services. The flight crew uses the **OIS display** to access the OIS; the maintenance crew uses the **Onboard Maintenance Terminal (OMT)**. Maintenance documentation and applications are also available from the **Portable Multipurpose Access Terminal (PMAT)** or the OIS displays in the cockpit. The PMAT supplies back-up data and functions if an OIS fails.

### "Avionics World" and "Open World"

On the A380, systems are structured within an "Avionics World" and an "Open World":
- The **"Avionics World"** gathers aircraft systems in a secured environment.
- The **"Open World"** is like an extension of the aircraft systems to the outside, for airline operations and passengers' needs. It is mainly composed of an onboard hardware platform called the Network Server System (NSS), and of a set of applications and electronic documentation within the OIS.

### Maintenance Tools

The primary maintenance tools on a modern large commercial air transport aircraft are:
- The **Onboard Maintenance System (OMS)**
- The **e-Logbook**, available onboard or on the ground
- **"Airman"** (Airbus system) or the airline's maintenance information system — ground-based software dedicated to optimized maintenance of fly-by-wire aircraft

There are three user profiles with access to the OMS and the e-Logbook: flight crew, cabin crew, and maintenance. **Only maintenance personnel have access to "Airman."**

## Core System

### Airbus A380 Example

On the A380, the Core System is divided into three domains:

**Avionics Domain** — the OIS part hosted here supplies: tools for maintenance operations on the Avionics World, Avionics Domain components and the cabin; recording capability of aircraft parameters; electronic documentation for flight, maintenance and cabin operations; a servicing tool for the refuelling operation.

**Flight Operations Domain** — the OIS part hosted here supplies: performance computation tools; operational electronic documentation for flight operations; tools to support aircraft navigation; communication management services for data exchanged with the AOC centres; tools for maintenance operations on the flight operations domain components.

**Communication and Cabin Domain** — the OIS part hosted here supplies: passenger services such as electronic mail and internet; communication management services for data exchanged with AOC centres and service providers; tools for maintenance operations on the communication and cabin domain components.

### Airbus A350 Example

On the A350, the core OIS is divided into two domains: the **Aircraft Control Domain (ACD)** and the **Airline Information Services Domain (AISD)**. Each domain has two parts.

The **ACD** parts are: the flight domain (not included in the OIS, related to aircraft systems), and the **Avionics Server Function Cabinet (ASFC)**, which hosts flight operations, maintenance and communication applications. The two ACD parts connect through two **Secure Communication Interfaces (SCIs)** — a type of "firewall" preventing unauthorized access and data entry to aircraft systems.

The **AISD** parts are: the **Open World Server Function Cabinet (OSFC)**, which hosts flight operations, cabin, maintenance and communication applications (data between the ASFC and OSFC is transmitted through a diode in one direction only, from ASFC to OSFC), and hardwired docking stations in the cockpit, to which the flight crew can connect their **Electronic Flight Bag (EFB)** laptops to access OSFC applications and specific EFB data.

## Onboard Information System (OIS) — Cockpit

The cockpit OIS gives access to flight operations applications, hosted in the two cabinets (ASFC and OSFC), for the flight crew. The flight crew accesses them through the **Control and Display System (CDS)** and **Electronic Flight Bag (EFB)** laptops or tablet computers.

## Onboard Information System (OIS) — Maintenance

The maintenance OIS gives access to maintenance applications, hosted in the two cabinets (ASFC and OSFC), for maintenance personnel. In the cockpit, maintenance personnel access these applications via the **Onboard Maintenance Terminal (OMT)**, or through the Control and Display System (CDS) if necessary. In the cabin, access is via the **Flight Attendant Panels (FAPs)**, which are touchscreens, or through the internal wireless cabin network (the leaky line antennas). Access in the cabin or cockpit is also possible through a **Portable Multipurpose Access Terminal (PMAT)**, connected to the aircraft network through Ethernet connectors installed in different areas inside and outside the aircraft.

## Onboard Information System (OIS) — Cabin

The cabin OIS gives access to cabin applications and documentation, hosted in the Open World Server Function Cabinet (OSFC), for the cabin crew. Access is via the Flight Attendant Panels (FAPs), touchscreens, or through the internal wireless cabin network (leaky line antennas). A printer may be installed in the cabin to print cabin and maintenance data.

## Internal Wireless Data Link

Gives the resources necessary for wireless connections in the cabin and cockpit areas. Passengers can use this function if made available by the airline. It is part of the **Airline Information Services Domain (AISD)** in the core, and has: one or two leaky line antennas, two **Wireless LAN Units (WLU)**, a **Radio Frequency (RF) combiner**, and a wireless manager application.

## Air Traffic Control (ATC) System

### Function/Description

**Controller-Pilot Data link Communications (CPDLC)**, also referred to as Controller-Pilot Data Link (CPDL), is a method by which air traffic controllers can communicate with pilots over a data link system. The standard method of communication between controller and pilot is voice radio, using VHF bands for line-of-sight communication or HF bands for long-distance communication. CPDLC is an air/ground data-link application enabling the exchange of text messages between controllers and pilots, complementing traditional voice communications with an additional communications medium.

A major problem with voice radio is that all pilots handled by a controller are tuned to the same frequency; as the number of flights increases, so does the risk of one pilot accidentally overriding another, requiring re-transmission, and each exchange takes time, eventually limiting the number of aircraft a controller can handle. Traditionally, a saturated ATC sector is divided into two smaller sectors, each with its own controller and voice channel — but each division increases "handover traffic" (the overhead of transferring a flight between sectors), and the number of available voice channels is finite, which can be a problem in high-density airspace such as central Europe or the Eastern Seaboard of the USA. Data link based communications increases the effective capacity of the communications channel.

CPDLC provides air-ground data communication for the ATC service, including clearance/information/request message elements corresponding to voice phraseology used by ATC procedures. The controller can issue level assignments, crossing constraints, lateral deviations, route changes and clearances, speed assignments, radio frequency assignments, and various requests for information. The pilot can respond to messages, request clearances and information, report information, and declare/rescind an emergency, plus request conditional (downstream) clearances and information from a downstream Air Traffic Service Unit (ATSU). A "free text" capability exchanges information not conforming to defined formats, and an auxiliary capability lets a ground system forward a CPDLC message to another ground system.

A sequence of messages between the controller at an ATSU and a pilot relating to a particular transaction (e.g. request and receipt of a clearance) is termed a **"dialogue."** There can be several sequences of messages in a dialogue, each closed by an appropriate acknowledgement or acceptance message; closure of a dialogue does not necessarily terminate the link, since there can be several dialogues between controller and pilot while an aircraft transits the ATSU airspace.

The CPDLC application has three primary functions: the exchange of controller/pilot messages with the current data authority; the transfer of data authority (current and next data authority); and downstream clearance delivery with a downstream data authority. It also: lets the pilot request and receive Flight Information Services (FIS) from ground FIS systems, and sends automatic reports of aircraft position to give aircraft surveillance data to the ATC ground station (no pilot action necessary).

The ATC system has an ATC data link application hosted in a **Core Processing Input/Output Module (CPIOM)**, and ATC HMIs. Apart from the direct link, CPDLC adds benefits such as: allowing the flight crew to print messages if an onboard printer is available; allowing auto-load of specific uplink messages into the Flight Management System (FMS), reducing crew-input errors; allowing the crew to download a complex route clearance request, re-sent by the controller when approved without re-typing coordinates; specific uplink messages arming the FMS to automatically downlink a report when an event (e.g. crossing a waypoint) occurs, assisting workload management; and specific downlink messages and responses to uplink messages automatically updating the Flight Data Record in some ground systems.

### Interface

The ATC system interfaces with: navigation systems such as the Air Data/Inertial Reference System (ADIRS), Flight Management System (FMS), Aircraft Environment Surveillance System (AESS), etc., for surveillance of aircraft position and heading by the ATC ground station; and communication systems for communication with the ATC ground station.

### Control and Indicating

The Captain and First Officer **ATC MSG pushbutton switches** and loudspeakers alert the crew each time a message is received. The flight crew accesses the ATC application through the **Keyboard and Cursor Control Units (KCCUs)**.

## Network Server System (NSS)

### Overview

The NSS includes a common file server, data processing, mass storage and interface capabilities to a number of terminals connected via an onboard aircraft **Local Area Network (LAN)**. It is a central node through which terminals communicate with avionics systems and access data/applications in NSS mass memory storage.

Key features and benefits: for flight operations, crews access electronic flight manuals, checklists, charts, maps and logbook, data-linked weather graphics, email, and performance calculations; for cabin operations, cabin crews call up electronic manuals, checklists and logbook; for maintenance operations, workers remotely access electronic maintenance manuals and checklists, a virtual quick access recorder, and maintenance data analysis tools; for passenger services, passengers use email and access a passenger airborne intranet.

The NSS is based on a high-speed communication protocol and supplies: a servers and routers platform; connections to Human Machine Interfaces (HMIs) for the flight crew, maintenance personnel, cabin crew and passengers; secured data communication to the aircraft systems in the "Avionics World" through firewalls; and external data communication capability with Airline Operational Control (AOC) centres and service providers (e.g. electronic mail).

### Human Machine Interfaces (HMIs)

The HMIs are: **OITs (Onboard Information Terminals), printers and laptops.** OITs are mostly used by pilots and display information copied from the laptops. On the ground, it is possible to switch OITs to the avionics domain, in which case they are used for maintenance applications. There are typically two printers: **Printer 1**, on the centre pedestal, for the avionics domain, and **Printer 2**, on the captain's side console, for the flight ops domain.

Some NSS switches and reset controls are located on the overhead panel. NSS components are installed in a specific bay in the avionics compartment, which has a **Smoke Detection system** provided by the **Cabin Intercommunication Data System (CIDS)**; this system triggers the **SMOKE light** on the NSS MASTER Switch.

### Onboard Maintenance Terminal (OMT)

The OMT is installed at the back of the cockpit, enclosed in a folding cabinet, and is not used in flight. It has two Line Replaceable Items (LRIs): the CD/DVD combo drive and the back-lights of the LCD screen. On the ground, the OMT starts up automatically with aircraft power.

### Interface via Laptop

Laptops are enclosed in a docking station; in most cases they stay closed in their station, since their data is also shown on the OITs. They are commercially available personal computers that may also run as standalone devices, have a hard disk but no CD drive, and the docking station has two USB ports. The laptop front face has an ON/OFF switch and control LEDs, indicating power supply availability and laptop operation. Laptops do not start and stop automatically — this must be done manually as part of cockpit procedures. In particular, laptops should be powered off after the flight, otherwise they would drain their internal battery after aircraft power off.

### Portable Maintenance Access Terminal (PMAT)

The PMAT is used to access the Avionics Domain from outside the cockpit, giving access to the same functions as the OMT with two exceptions: BITE tests with caution (tests in which components will move or start) cannot be run from the PMAT, and data loading cannot be done if the software is coming from the OMT CD drive. PMAT network plugs are located at several areas of the aircraft (e.g., on the A380: cockpit OMT rack, main avionics bay, upper and AFT avionics bays, Nose Landing Gear, Body Landing Gear bay in refuel panel, APU bay, forward and AFT Lower Deck Cargo Compartments).

PMATs are **not part of the aircraft definition** — they are ground tools, stored and controlled by the airline maintenance organization's tool stores department. PMAT plugs on the aircraft are inhibited during flight. The **MAINTENANCE GROUND CONNECTION switch** (in the cockpit) must be activated, and only one PMAT can be plugged in at a time.

### NSS Architecture

The main components of the NSS infrastructure are onboard servers, routers and laptops. The NSS platform is split into three domains: the **Avionics Domain**, the **Flight Operations Domain**, and the **Communication and Cabin Domain**.

**Avionics Domain** includes: servers named **Aircraft Network Server Unit-Operations (ANSU-OPS)**, supplying computing and memory resources to hosted OIS applications, documentation and database; duplicated routers named **Aircraft Router Unit-Operations (ARU-OPS)**, managing data exchanged between the Avionics World, the NSS and its HMIs; the **Secure Interface Router Unit (SIRU)**, used to secure Aircraft Communication Addressing and Reporting System (ACARS) messages coming from the ground, safely connecting PMATs and MP-FAPs; **Secured Communication Interfaces (SCIs)**, firewalls supplying safe duplex communication between OIS applications and the Avionics World, and between OIS applications and AOC centres through the ACARS network; the **Centralized Data Acquisition Module (CDAM)**, supplying aircraft parameters and avionics data from the Avionics World to the NSS for recording and OIS application needs; and an **Open World Diode (OWD)**, an electrical device letting unidirectional data flow come from the Avionics Domain and go to the other NSS domains and some cabin systems — it stops malicious data coming from its right and prevents it reaching the avionics domain/world.

Access to the Avionics Domain is via various HMIs: the CAPT and F/O Onboard Information Terminals (OITs) with their keyboards and Additional Control Devices (ACDs), used most frequently by the flight crew; the OMT (including a media drive), used by maintenance personnel; the PMATs, used by maintenance personnel; the Multipurpose (MP) FAPs, used by cabin crew; and the printer installed on the pedestal, used by maintenance personnel.

**Flight Operations Domain** includes: a server, the **Aircraft Network Server Unit-Airframer (ANSU-AFMR)**, which configures the Flight Operations Domain network and manages communication with the wireless ground network through the **Terminal Wireless LAN Unit (TWLU)**; a router, the **Aircraft Router Unit (ARU)**, routing data between the three NSS domains, the Flight Operations Domain HMIs and the optional **Wireless Airport Communication System (WACS)** (which supplies aircraft-to-AOC wireless communication capability); and CAPT and F/O laptops stored in their docking stations, supplying computing and memory resources to hosted OIS applications and documentation. Access is via the cockpit OITs, the flight crew laptops' Universal Serial Bus (USB) plugs (used by flight crew and maintenance personnel for data loading), and the printer.

**Communication and Cabin Domain** is based on the Airline Network Architecture and high-speed SATCOM communications. Its main components are the **Head End Server Unit (HESU)**, the **Cabin Wireless LAN Units (CWLUs)**, and the related antennas. The system supplies wired connectivity to passengers through the In Flight Entertainment (IFE) system, and wireless connectivity in the cabin using CWLUs, giving passengers access to services such as live internet, webmail and web-chat. The **SATCOM** system supplies the aircraft with an air/ground worldwide communication capability. Two HMIs are used for system monitoring and maintenance: the **Multipurpose FAP (MP FAP)** and a cabin laptop.

### HMI — Cabin Laptop

To access the Communication and Cabin Domain maintenance HMI, the operator must first log on and indicate their user group and password (depending on airline policy). The Flight Ops and Communication and Cabin Domain Maintenance HMIs differ, both in presentation and capabilities; this application is dedicated only to maintenance of Communication and Cabin Domain equipment.

### Post Flight Report (PFR)

From the COM and CABIN Maintenance Interface, the user can access the **Post Flight Report (PFR)** related to COM and CABIN equipment, showing either the full fault list or only faults related to the last leg. It indicates: the fault apparition time, the flight phase concerned, the source ATA, the current equipment state, the fault message, and the fault code.

## Electronic Logbook (e-Logbook)

### Function/Description

As an application of the Electronic Flight Bag (Boeing system) or "AIRMAN" (Airbus system), the **Electronic Logbook (ELB, or e-Logbook)** replaces paper logbooks with computer-based logs that can be easily stored and shared. The e-Logbook connects flight data with ground-based technicians and equipment, feeding flight crew data into a central repository combined with maintenance and engineering information, helping airlines better understand and diagnose issues within the context of multiple aeroplane systems.

The e-Logbook maintenance application has the same function as the paper logbook and is used for: **defect reporting**, **maintenance action reporting**, and **aircraft release after maintenance**. It is hosted in the OSFC and records: pilot, mechanic and cabin crew entries; and aircraft status and identification data from aircraft systems, the ASFC, and passenger service Line Replaceable Units (LRUs).

The e-Logbook is split into three domains linked to the three main user profiles: the **Technical Logbook**, dedicated to the pilot; the **On-board Maintenance System (OMS) Logbook** functions, dedicated to line maintenance crew; and the **Cabin Logbook**, also called the **Digital Cabin Logbook (DCL)**, dedicated to cabin crew. For each domain, the HMIs are defined according to the user profile.

The e-Logbook is linked to the ground to synchronize with the **"AIRMAN"** database, which is the legal repository of the e-Logbook. AIRMAN is a ground tool used to optimize the maintenance of Airbus aircraft, and receives and analyses aircraft information supplied by the Onboard Maintenance System (OMS) and e-Logbook.

### Interface

The e-Logbook maintenance application interfaces with the aircraft communication systems to send/receive data to/from airline ground tools. There are three tailored interfaces with the synchronized air and ground databases: the **pilot interface**, following normal flight deck standards; the **laptop interface**, designed for mechanics and engineers as a task-driven user interface; and the **maintenance control interface**, designed to monitor the logbook status of an entire fleet, perform research, and direct resources efficiently.

### Control and Indicating

Maintenance personnel access the electronic-logbook maintenance application through the **Onboard Maintenance System (OMS)** HMIs.

### e-Logbook Architecture

The e-Logbook is part of the Onboard Maintenance System (OMS). Logbook applications run in the NSS Avionics Domain, in the OMT, in the OIT and the FAP. The e-Logbook data is stored in the **OMS shared database**. All e-Logbook sub-parts — the Technical Logbook (TLB), Maintenance Logbook and the Digital Cabin Logbook (DCL) — share the same database, ensuring all on-board users have access to the same information at the same time.
        $cnt2$,
        23
    ) RETURNING id INTO s22_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M13.15 Ice and Rain Protection (17 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s15_id, 'Ice formation on aircraft is classified under four main headings. Which of the following is one of them?',
     '[{"id":"a","text":"Glaze Ice","correct":true},{"id":"b","text":"Wind Ice","correct":false},{"id":"c","text":"Vapour Ice","correct":false}]',
     '{"B2"}'),

    (s15_id, 'Which type of ice formation is described as the most severe and most dangerous, due to its high rate of catch?',
     '[{"id":"a","text":"Hoar frost","correct":false},{"id":"b","text":"Rime ice","correct":false},{"id":"c","text":"Glaze ice","correct":true}]',
     '{"B2"}'),

    (s15_id, 'Glaze ice forms in greatest thickness on the leading edges of aerofoils and in reduced thickness as far aft as:',
     '[{"id":"a","text":"One quarter of the chord","correct":false},{"id":"b","text":"One half of the chord","correct":true},{"id":"c","text":"The full chord","correct":false}]',
     '{"B2"}'),

    (s15_id, 'Rime ice is described as light and porous because it results from:',
     '[{"id":"a","text":"Large water drops flowing over the airframe before freezing","correct":false},{"id":"b","text":"Small water drops freezing instantly as individual particles, trapping air between them","correct":true},{"id":"c","text":"Water vapour condensing directly onto a cold surface as a semi-crystalline coating","correct":false}]',
     '{"B2"}'),

    (s15_id, 'Which of the following is NOT listed among the critical areas requiring ice protection?',
     '[{"id":"a","text":"Pitot static pressure heads","correct":false},{"id":"b","text":"Aerofoil leading edges","correct":false},{"id":"c","text":"Fuselage tail cone","correct":true}]',
     '{"B2"}'),

    (s15_id, 'In a pressure operated ice detector head, when icing conditions are met and ice covers the leading-edge holes, the trailing-edge holes remain clear. This causes the relay capsule to:',
     '[{"id":"a","text":"Expand further, opening the electrical contacts","correct":false},{"id":"b","text":"Collapse under exhausting airflow, closing the relay contacts to trigger a warning","correct":true},{"id":"c","text":"Remain unaffected, since trailing-edge holes have no function","correct":false}]',
     '{"B2"}'),

    (s15_id, 'In the vibrating rod ice detector, the sensing probe ultrasonically vibrates at its own resonant frequency of approximately:',
     '[{"id":"a","text":"4 kHz","correct":false},{"id":"b","text":"40 kHz","correct":true},{"id":"c","text":"400 kHz","correct":false}]',
     '{"B2"}'),

    (s15_id, 'Of the four primary systems used for ice protection, which one is used for de-icing only, and cannot prevent ice from forming?',
     '[{"id":"a","text":"Thermal (hot air) system","correct":false},{"id":"b","text":"Pneumatic system","correct":true},{"id":"c","text":"Fluid system","correct":false}]',
     '{"B2"}'),

    (s15_id, 'Fluid ice protection systems are not used on which of the following areas?',
     '[{"id":"a","text":"Windscreens","correct":false},{"id":"b","text":"Propellers","correct":false},{"id":"c","text":"Engine air intakes","correct":true}]',
     '{"B2"}'),

    (s15_id, 'The fluids used in aerofoil fluid de-icing systems are based on:',
     '[{"id":"a","text":"Alcohol","correct":false},{"id":"b","text":"Glycol","correct":true},{"id":"c","text":"Ammonia","correct":false}]',
     '{"B2"}'),

    (s15_id, 'When a pneumatic de-icing system is switched OFF, vacuum is applied continually to the overshoe tubes in order to:',
     '[{"id":"a","text":"Hold the tubes fully inflated to shed any remaining ice","correct":false},{"id":"b","text":"Hold the tubes flat against the leading edges, minimising aerodynamic drag","correct":true},{"id":"c","text":"Bleed static electricity from the tube surfaces","correct":false}]',
     '{"B2"}'),

    (s15_id, 'In a hot air bleed anti-icing system, air is typically supplied to the leading edge ducting at temperatures of about:',
     '[{"id":"a","text":"50°C","correct":false},{"id":"b","text":"200°C","correct":true},{"id":"c","text":"500°C","correct":false}]',
     '{"B2"}'),

    (s15_id, 'In electrical de-icing (spray mat) systems using cyclic heating, the typical ratio of time ON to time OFF is:',
     '[{"id":"a","text":"1:10","correct":true},{"id":"b","text":"1:2","correct":false},{"id":"c","text":"10:1","correct":false}]',
     '{"B2"}'),

    (s15_id, 'On an electrically heated windscreen, the optimum temperature range for maximum energy absorption (bird-proof characteristics) by the vinyl inter-layer is:',
     '[{"id":"a","text":"0°C to 10°C","correct":false},{"id":"b","text":"27°C to 49°C","correct":true},{"id":"c","text":"60°C to 80°C","correct":false}]',
     '{"B2"}'),

    (s15_id, 'In a "dry air sandwich" cabin window, the desiccant used to keep the air space dry is Silica Gel, which is normally blue and changes colour as it absorbs moisture. It must be replaced when it turns:',
     '[{"id":"a","text":"Green","correct":false},{"id":"b","text":"Pink","correct":true},{"id":"c","text":"Black","correct":false}]',
     '{"B2"}'),

    (s15_id, 'A key safety precaution when operating windscreen wipers is that they must never be operated:',
     '[{"id":"a","text":"On a dry screen, as this may cause scratches","correct":true},{"id":"b","text":"At high speed settings above 200 strokes per minute","correct":false},{"id":"c","text":"When the aircraft is on the ground","correct":false}]',
     '{"B2"}'),

    (s15_id, 'Pneumatic rain removal systems clear the windscreen by:',
     '[{"id":"a","text":"Spraying an alcohol-based fluid across the screen","correct":false},{"id":"b","text":"Blowing high-pressure bleed air over the screen face to form a barrier preventing rain from striking it","correct":true},{"id":"c","text":"Oscillating a wiper blade at very high frequency","correct":false}]',
     '{"B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M13.22 Information Systems (15 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s22_id, 'The Onboard Information System (OIS) includes which two elements?',
     '[{"id":"a","text":"The Network Server System (NSS) and the Air Traffic Control (ATC) system","correct":true},{"id":"b","text":"The Flight Management System (FMS) and the Autopilot","correct":false},{"id":"c","text":"The Weather Radar and the Terrain Awareness System","correct":false}]',
     '{"B2"}'),

    (s22_id, 'The link between the world of avionics and the open world, guaranteeing security of information exchanged between the IFE and avionics systems, is called the:',
     '[{"id":"a","text":"Secure Communication Interface (SCI)","correct":true},{"id":"b","text":"Open World Diode (OWD)","correct":false},{"id":"c","text":"Aircraft Router Unit (ARU)","correct":false}]',
     '{"B2"}'),

    (s22_id, 'On the A380, aircraft systems are structured within an "Avionics World" and an:',
     '[{"id":"a","text":"External World","correct":false},{"id":"b","text":"Open World","correct":true},{"id":"c","text":"Extended World","correct":false}]',
     '{"B2"}'),

    (s22_id, 'Of the three user profiles (flight crew, cabin crew, maintenance) that have access to the OMS and e-Logbook, which one alone also has access to "Airman"?',
     '[{"id":"a","text":"Flight crew","correct":false},{"id":"b","text":"Cabin crew","correct":false},{"id":"c","text":"Maintenance personnel","correct":true}]',
     '{"B2"}'),

    (s22_id, 'On the Airbus A350, the core OIS is divided into two domains: the Aircraft Control Domain (ACD) and the:',
     '[{"id":"a","text":"Airline Information Services Domain (AISD)","correct":true},{"id":"b","text":"Avionics Server Function Cabinet (ASFC)","correct":false},{"id":"c","text":"Communication and Cabin Domain (CCD)","correct":false}]',
     '{"B2"}'),

    (s22_id, 'On the A350, data between the Avionics Server Function Cabinet (ASFC) and the Open World Server Function Cabinet (OSFC) is transmitted through a diode. In which direction does data flow?',
     '[{"id":"a","text":"In both directions, bidirectionally","correct":false},{"id":"b","text":"In one direction only, from the ASFC to the OSFC","correct":true},{"id":"c","text":"In one direction only, from the OSFC to the ASFC","correct":false}]',
     '{"B2"}'),

    (s22_id, 'In the cockpit, the flight crew accesses flight operations applications through the Control and Display System (CDS) and through:',
     '[{"id":"a","text":"Electronic Flight Bag (EFB) laptops or tablet computers","correct":true},{"id":"b","text":"The Onboard Maintenance Terminal (OMT) exclusively","correct":false},{"id":"c","text":"The Flight Attendant Panels (FAPs)","correct":false}]',
     '{"B2"}'),

    (s22_id, 'In the cabin, maintenance personnel and cabin crew can access maintenance/cabin applications via the Flight Attendant Panels (FAPs) or through the internal wireless cabin network, which uses:',
     '[{"id":"a","text":"Leaky line antennas","correct":true},{"id":"b","text":"Satellite dishes mounted on the fuselage crown","correct":false},{"id":"c","text":"HF radio antennas","correct":false}]',
     '{"B2"}'),

    (s22_id, 'Controller-Pilot Data Link Communications (CPDLC) is best described as:',
     '[{"id":"a","text":"A method allowing air traffic controllers to communicate with pilots over a data link system, complementing voice radio","correct":true},{"id":"b","text":"A replacement for the aircraft''s primary flight display","correct":false},{"id":"c","text":"A system used only for passenger internet connectivity","correct":false}]',
     '{"B2"}'),

    (s22_id, 'One of the main problems with traditional voice radio ATC communication, which CPDLC helps to address, is that:',
     '[{"id":"a","text":"Voice radio cannot be used above 10,000 feet","correct":false},{"id":"b","text":"All pilots handled by a particular controller are tuned to the same frequency, increasing the chance of overridden transmissions","correct":true},{"id":"c","text":"Voice radio requires satellite relay for all transmissions","correct":false}]',
     '{"B2"}'),

    (s22_id, 'The sequence of messages between a controller at an ATSU and a pilot relating to a particular transaction (e.g. request and receipt of a clearance) is termed a:',
     '[{"id":"a","text":"Handshake","correct":false},{"id":"b","text":"Dialogue","correct":true},{"id":"c","text":"Session","correct":false}]',
     '{"B2"}'),

    (s22_id, 'The Network Server System (NSS) Human Machine Interfaces (HMIs) are:',
     '[{"id":"a","text":"OITs, printers and laptops","correct":true},{"id":"b","text":"Weather radar displays only","correct":false},{"id":"c","text":"Circuit breaker panels only","correct":false}]',
     '{"B2"}'),

    (s22_id, 'The Onboard Maintenance Terminal (OMT), installed at the back of the cockpit in a folding cabinet, is:',
     '[{"id":"a","text":"Used continuously throughout every flight","correct":false},{"id":"b","text":"Not used in flight","correct":true},{"id":"c","text":"Only usable when the aircraft is being refuelled","correct":false}]',
     '{"B2"}'),

    (s22_id, 'Compared to the Onboard Maintenance Terminal (OMT), the Portable Maintenance Access Terminal (PMAT) has two functional exceptions. One of these is that:',
     '[{"id":"a","text":"BITE tests with caution, in which components will move or start, cannot be run from the PMAT","correct":true},{"id":"b","text":"The PMAT cannot connect to the aircraft network at all","correct":false},{"id":"c","text":"The PMAT can only be used during flight, never on the ground","correct":false}]',
     '{"B2"}'),

    (s22_id, 'The e-Logbook is split into three domains linked to the three main user profiles. Which domain is dedicated to the pilot?',
     '[{"id":"a","text":"The Digital Cabin Logbook (DCL)","correct":false},{"id":"b","text":"The Technical Logbook","correct":true},{"id":"c","text":"The OMS Logbook functions","correct":false}]',
     '{"B2"}');

END $$;
