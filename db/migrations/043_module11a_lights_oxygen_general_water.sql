-- Module 11A: Turbine Aeroplane (B1) — Aircraft Lights, Oxygen Systems, Pneumatic & Vacuum ("General Practices"), Water and Waste Systems
-- Source: EASA Part-66 Module 11A official textbook (IKAROS Aviation Training Centre, IK M11A, Issue Oct.2012)
-- This is the final batch of Module 11A subjects (M11A.17 – M11A.20).

DO $$
DECLARE
    m11_id INT;
    s17_id INT;
    s18_id INT;
    s19_id INT;
    s20_id INT;
BEGIN
    SELECT id INTO m11_id FROM easa_modules WHERE code = 'M11';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M11A.17') THEN
        RAISE NOTICE 'M11A.17-M11A.20 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module M11A.17: Aircraft Lights
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m11_id, 'M11A.17', 'Aircraft Lights',
        $cnt$
# Aircraft Lights

## Purpose of Aircraft Lighting

Aircraft lighting is divided into external and internal systems.

**External lighting provides:**
- Navigation lights to mark the extremities of an aircraft and give position reference
- Flashing lights to mark the position of an aircraft
- Landing and taxiing lights for forward and lateral illumination
- Lights to illuminate the wings for ice inspection
- Illumination to assist the evacuation of passengers and crew during an emergency landing

**Internal lighting provides:**
- Lights to illuminate consoles/control panels
- Lights for passenger compartments and information signs
- Warning lights to indicate system-operating condition
- Emergency lighting

## Navigation (Position) Lights

All aircraft in flight or moving on the ground during the hours of darkness must display the following lights:
- A **GREEN** light at or near the starboard wingtip, visible in the horizontal plane through an arc of **110°**
- A **RED** light at or near the port wingtip, visible in the horizontal plane through an arc of **110°**
- A **WHITE** light visible from the rear of the aircraft in the horizontal plane through an arc of **140°**

## Landing Lights

Landing and taxi lamps provide illumination for landing and taxiing in conditions of night or poor visibility; the term "Landing and Taxi" lamp also covers equipment such as flare-out lights and runway turn-off lights.

On the Boeing 737, there are **4 landing lights**:
- **2 fixed type**, located on the wing leading edges near the fuselage
- **2 retractable type**, located in the outboard flap track fairing

When the retractable landing lights are extended, they shine forward **regardless of flap position**. The outboard lights provide good visibility in adverse weather and minimise the effect of reflected light into the flight deck.

### Retracting Landing Lights

Retracting landing lamps are extended by an actuator via a **slipping clutch or shear links**. This ensures the lamp retracts in the event it fails to do so at high speed, for whatever reason. The lamp unit is generally of the **sealed beam** type.

## Runway Turn-off and Taxi Lights

Runway turn-off lights are located in each wing root, inboard of the inboard landing lights, and are aimed ahead and to the side of the aircraft to illuminate taxiway turn-offs. A **nose gear taxi light** is mounted on the inner cylinder of the nose gear shock strut so that it turns with the nose gear.

## Anti-Collision Lights

Anti-collision lights are intended as "attention-getters" to warn of the presence of an aircraft and identify its position. They are mounted on the top and bottom of the fuselage, aft of the wing leading edge, and each anti-collision light is a **strobe light covered in a red lens**. Some aircraft are additionally fitted with **white strobe lights** on each wingtip and the tail, acting as aircraft position indicators.

### Strobe Light Operation

The strobe light works on the principle of a **capacitor-discharge flash tube**. The capacitor converts an input power of **28V dc or 115V ac** into a high dc output of around **450V**. This discharge occurs between two electrodes in a neon-filled tube, producing a high-intensity flash of light at a rate of approximately **60 flashes per minute**.

### Strobe Light Safety

- Do not handle the unit for at least **5 minutes** after power is removed
- Never touch a new flash tube with bare hands
- Damage to the eyes may result from looking directly into high-intensity light

### Rotating Beam Anti-Collision Lights

There are two types of rotating beam anti-collision light:
- **Rotating Reflector** — a motor drives a rotating reflector that reflects light from one lamp. The speed of rotation is typically **40–45 rpm**, giving a flashing frequency of **80–90 flashes per minute**. One half of the reflector is flat, emitting a narrow, high-intensity beam; the other half is curved, increasing the vertical spread of the beam to **30° above and below the horizontal**.
- **Rotating Lamp** — two filaments are mounted in tandem, each pivoted on its own axis, with one half of each lamp forming a reflector. A motor rotates the two lamps through **180°**. Since the lamps are set 180° opposite to each other, the effect is a continuously rotating light beam.

## Wing Illumination Lights

Two wing illumination lights are provided for scanning the wings and engines in flight for ice detection, and are also used on the ground to illuminate the immediate area. They are flush mounted, one on each side of the fuselage, forward of the wing leading edge and just above the cabin floor level.

## Emergency Escape Slide Lights

Four exterior lights illuminate the escape slide areas for the forward and aft entry and forward and aft service doors. An additional four lights illuminate the overwing escape doors and the areas just aft of the wing trailing edge.

## Cargo and Service Lighting

Dome lights and floodlights provide illumination in cargo compartments, wheel wells and servicing compartments, for cargo handling and performing service activities. The lights can operate from internal power or from an external power source, with light switches provided within the compartments the lighting serves.

## Flight Compartment Lights

Flight compartment lights provide illumination for the flight compartment, its instruments, controls and other equipment so flight crewmembers can perform their jobs. Dome lights supply general illumination for the cabin; the lightshield provides background lighting for the pilots; each instrument and instrument panel has integral lighting; the control stand is illuminated from an overhead floodlight; floodlights illuminate circuit breaker panels; there are also lights for the standby compass and for map lighting.

### Pillar and Bridge Lighting

The pillar light contains a miniature centre-contact filament lamp (a "pea lamp"). A single cable carries the supply, while a ground tag completes the circuit for the lamp. An aperture has a filter through which the light is distributed. These lights can be used as single items or in a bridge configuration.

### Wedge Lighting

Wedge lighting uses two wedges of glass — an inner wedge "A" and an outer wedge "B". Light is introduced to wedge A by a lamp: some light penetrates directly to the instrument dial, while some is trapped within wedge A to be distributed down the dial. Light escaping into wedge B is reflected down the wedge but is prevented from further escape by non-reflective black paint. In this way the light is retained and illuminates the dial.

### Master Caution / Failure Lights

The master caution/failure system informs the flight crew that a system fault annunciator has illuminated on the forward overhead, aft overhead or fire control panels. It receives inputs from various fault annunciators to illuminate two master caution lights and one of twelve sections of the master caution annunciators. Both annunciators have a **"Push to Cancel"** and a **"Push to Recall"** function.

## Passenger Compartment Lights

The passenger compartment is illuminated by ceiling and window lights. Entry and threshold lights provide additional lighting for the doorways. Other cabin lighting systems include lavatory lights, reading lights, passenger information signs and the attendant call system.

### Passenger Service Unit (PSU)

The passenger service unit contains:
- Reading lighting
- Fasten Seat Belt and No Smoking signs
- Attendant Call button
- Air conditioning fans
- Life vest storage
- Oxygen mask storage

## Passenger Reading Lights

All passengers have a reading light with a touch-control button on a Passenger Panel to switch the light on or off. There is a "Reading Reset" switch on the Attendant Panel to switch off all reading lights in one action. When operated, the reading lights supply is broken for **16 seconds** only; when the supply is restored, the lights remain off but are ready for "ON" selection. A "Read Lights Test" switch on a maintenance and test panel enables all reading lights to be switched on for inspection.

## Attendant Call System

An attendant can be called from each passenger station through the "ATT. CALL" touch button. This action brings on a light in the "Area Call Lights" aft and forward stations, and a chime on the PA system also alerts the action. Reset is achieved by a second touch at the "ATT CALL" switch. Operation of a switch in either lavatory will call an attendant in similar fashion, with the calling lavatory identified at the Area Call Lights aft and forward stations.

## Emergency Exit Lighting

Emergency lights automatically illuminate exit signs and egress paths when normal lighting system power is lost. They are powered by battery packs and are located in the flight and passenger compartments. The system also includes external lights used to illuminate the escape routes from the doors and overwing hatches.

**Floor proximity lighting** provides visual guidance for cabin evacuation when all sources of cabin lighting above four feet are obscured by smoke. It is positioned on the left-hand side of the aisle and has an illuminated arrow spaced every **40 inches** to indicate the direction to the nearest exit.

### Emergency Lighting Operation

The emergency lights (**6V**) are fed from battery packs which, under normal conditions, are trickle charged from the aircraft's main electrical system. A three-position switch located on the flight deck controls the system:

| Position | Effect |
|----------|--------|
| **ARMED** | The normal in-flight position of the switch. A "NOT ARMED" warning light is displayed if the switch is in the OFF or ON position during flight |
| **ON** | The battery packs are not charged. 6V lights are ON even though main electrical power is available and normal lights are also ON |
| **OFF** | The battery packs are charged. 6V lights remain OFF even in the event of main electrical power loss |

Minimum use of the battery packs (e.g. for testing) must be made, because the battery packs take up to **20 hours** to recharge.

## Self-Illuminating Signs

The only possible hazard attendant on the use of self-illuminating signs is inhalation or absorption into the body of gas released should the glass envelope break. **Tritium** gas is mildly radioactive, so the signs should be handled carefully to avoid breakage. Should breakage occur, the aircraft should be evacuated and all doors left open to allow maximum ventilation. Disposal of broken signs is subject to the Radioactive Substances Act 1960 and the Radioactive Substances (Luminous Articles) Exemption Order 1962, and broken signs should be returned to the manufacturer for disposal. All self-illuminating signs should be checked for luminosity level on initial fitting and at periods specified in the relevant maintenance schedule. Such signs usually have a scrap life of **5 years**, after which they should be returned to the manufacturer for disposal.
        $cnt$,
        17
    ) RETURNING id INTO s17_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module M11A.18: Oxygen Systems
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m11_id, 'M11A.18', 'Oxygen Systems',
        $cnt2$
# Oxygen Systems

## Oxygen Systems General

If an aircraft is designed to fly at heights above, say, **8,000 feet**, there must be some way of maintaining a comfortable environment for the crew and passengers to breathe normally — normally done by cabin pressurisation. If the pressurisation fails above this altitude, an alternate but emergency source of breathable air must be supplied. This is normally provided by individual oxygen supplies from gaseous, liquid and chemical sources. **Civil aircraft use the gaseous and chemical type, with the military using liquid.**

- Some small, unpressurised aircraft only require oxygen occasionally and use a **continuous flow** system that meters oxygen based on the altitude flown.
- Aircraft that fly above **18,000 feet** have a **diluter demand** system that also meters oxygen based on altitude but directs it to the mask only when the user inhales.
- Aircraft flying at very high altitude, where the outside air pressure is too low to force oxygen into the lungs, use **pressure demand** systems, which send oxygen to the mask under a slight positive pressure that forces the oxygen into the lungs.

## Oxygen Safety Precautions

Safety precautions associated with the use of oxygen are laid down in the aircraft maintenance manuals. Although oxygen is non-flammable, it **will support combustion**. If oil, grease, dust or metal particles are present, a spontaneous explosion may occur. Precautions include:

1. Keep oil and grease away — oxygen equipment, hoses and fittings must not be handled with greasy hands or greasy overalls
2. Keep oxygen away from fire — a small fire or spark will rapidly grow in an oxygen-enriched atmosphere
3. No smoking
4. Handle oxygen components carefully
5. Don't mix oxygen [types/sources]
6. Always follow instructions in manuals and/or on charging panels

When charging a gaseous system, ensure: no refuelling operations are being carried out; no switching electrical supplies on or off; adequate warning notices are in place; no smoking or naked flames; the aircraft is earthed; and adequate fire-fighting equipment is available.

## System Layout

The crew and passenger gaseous oxygen systems and their oxygen cylinders are usually independent of each other, except for a common charging point and an overpressure relief facility. In general, gaseous oxygen systems are used for the cockpit and chemically generated oxygen is used for the cabin — though some aircraft use gaseous systems for both.

### Cockpit System Layout

Each occupant has a quick-fitting mask located inside a storage box within easy reach. The mask contains a permanently connected microphone so communications can be maintained at all times. On some aircraft an inflatable harness allows one-handed fitting: squeezing the storage box release levers unlocks the doors and the mask is withdrawn (a green oxygen-on flag appears), and the harness automatically inflates on withdrawal. Once fitted and the levers released, the inflating oxygen is exhausted to atmosphere and the harness deflates and tightens. A **test lever** tests oxygen flow — a blinker indicator turns green when operating correctly — and a **100% selector button** delivers pure, undiluted oxygen to the mask.

### Cabin System Layout

On gaseous systems, a ring main runs from the storage bottles to the PSUs. On chemically generated systems, an oxygen module (a "candle") is located in each PSU. Passenger masks are deployed by gravity via a drop-out mechanism, with a simple cup-shaped moulding and elasticated strap designed to fit all sizes from babies to adults. A **reservoir bag** is fitted to the mask to store an immediate supply of oxygen.

### Continuous Flow Oxygen System

Used mainly for passenger systems where oxygen is needed only occasionally; wasteful of oxygen but simple. Oxygen is carried in a high-pressure bottle, regulated down to around **400 psi** by a pressure-reducing valve, and metered by a pressure regulator to around **70 psi** before delivery to the masks. A pressure relief valve prevents damage if the reducing valve fails — a green blow-out disc on the aircraft skin gives visual indication, and some aircraft also deploy a red streamer.

Continuous flow masks are re-breather type: oxygen continually flows into a transparent plastic bag through a tube. On exhale, air that spent the shortest time in the lungs fills the bag first; on the next inhale, the oxygen-enriched air in the bag is re-breathed. More sophisticated versions (pressurised aircraft) auto-deploy on loss of cabin pressure: oxygen pressure opens the mask compartment doors, a mask drops, and pulling the tube opens a lanyard-operated rotary valve starting the flow.

### Demand Type Oxygen System

Cockpit crews of most commercial aircraft are supplied via a **diluter demand** system, which meters oxygen only when the user inhales, with the amount depending on altitude. At altitudes above **40,000 feet**, oxygen pressure is so low that even a pure oxygen supply must be forced into the lungs — this is done under a slight positive pressure from a **pressure demand oxygen regulator**.

### Portable Oxygen Systems

Portable oxygen sets are located at various cabin positions for cabin crew to check passengers have their masks on, and to assist breathing in the event of fumes or smoke. **Therapeutic** sets provide enriched or 100% oxygen for medical purposes (e.g. a passenger having difficulty breathing) until they feel better or medical assistance is obtained after landing. A typical portable set may have two outlets, one of which may be therapeutic, delivering a greater volume of oxygen for passengers with breathing difficulties or heart conditions.

## Drop Out System

Masks drop from the PSU either **automatically** when cabin altitude reaches a pre-determined level (usually around **10,000 feet**), or when the aircrew select oxygen (drop-out may be actuated electrically, pneumatically or mechanically). The PSU is a hinged flap containing, on its underside, reading lights, cold air vents, warning signs and a cabin crew alert button, with the masks stored inside the flap panel.

### Pneumatically Operated PSU Flap

A small plunger fitted above each PSU flap is held closed by a spring-loaded latch assembly. Oxygen pressure extends the plunger, overcoming the latch, and the flap opens under gravity, deploying the masks. A sharp pull on the mask withdraws the flow control pin, allowing oxygen to flow. A manual closing toggle lets cabin crew shut off the flow at each PSU, and a manual actuation pin can open the flap if it fails to open automatically.

### Electrically Operated PSU Flap

Used where chemical oxygen generators are fitted (since generated oxygen is not available until the masks are pulled, it cannot be used to open the flap itself). An electrical solenoid energises a plunger that operates a latch assembly, opening the PSU door so the masks fall under gravity.

## Sources of Oxygen

Most aircraft use gaseous oxygen for the aircrew and a chemically generated source for passengers, though some aircraft with oxygen generators are having them replaced with gaseous systems due to associated fire hazards. Gaseous oxygen is easy to handle and widely available at airports, though generated systems are more lightweight. The main disadvantage of gaseous systems is that oxygen is stored at high pressure, reacts explosively with greases and oils, and requires heavy storage bottles. Bottles are made from high tensile steel or, on more modern aircraft, Kevlar-wrapped aluminium alloy, carbon fibre or plastics; they are painted black with a white dome top or green (USA), stencilled "Aviation Oxygen" in white letters.

### Chemical Oxygen Generator

Oxygen generators ("oxygen candles") are a convenient way to carry emergency oxygen: long shelf life, lightweight, and storage capacity around **three times** that of a gaseous system. **Sodium chlorate** and **iron** are mixed with a binding material and moulded into a solid block, installed in an insulated stainless steel case. Pulling the mask withdraws a safety pin from the firing mechanism, and a spring-loaded percussion cap or electrical squib igniter starts the sodium chlorate decomposing; the heat of reaction is self-sustaining (it does not burn) and cannot be cut off once started. Byproducts, besides oxygen, are **sodium chloride (salt)** and **ferrous oxide (rust)**. Oxygen output is proportional to the cross-sectional area of the core and the reaction rate, which is determined by the iron concentration; output is greater initially, to provide high oxygen output during the first few minutes of an emergency descent. Core temperature is approximately **450°F** once the reaction has started. Normal output from the generator is **10 psi** and is not regulated prior to breathing; a pressure relief valve relieves pressures in the generator above **50 psi**. The main disadvantage is the large amount of heat generated, requiring good insulation from the airframe structure.

### Gaseous Oxygen Systems

Storage cylinders' number and capacity depend on the number of passengers and crew. The normal charge is usually **1800 psi**, with a capacity of **30 to 120 cubic feet**. Cylinders normally have a manually operated shut-off valve in the neck, a direct-reading pressure gauge, and an electrical transducer that sends pressure indication signals to the cockpit.

### Charging of Systems

Gaseous systems can be recharged at the aircraft from a portable, large-capacity oxygen trolley, or by removing the bottle for recharging in a dedicated oxygen charging bay — the method used is dictated by the Airworthiness Authority of the country of registration. With "on aircraft" charging, the trolley hose is usually purged before connection to clear it of impurities and moisture. During charging, temperatures generated in the pipelines are dissipated by **thermal compensators** — sintered bronze elements soldered inside the pipelines that act as heat sinks.

### Oxygen Distribution

High-pressure supply pipes, from the storage bottle to the pressure-regulating valve, are made from stainless steel or copper-based alloys, colour coded "breathing oxygen" with a black rectangular symbol on a white background. Since maximum pressure to the masks is **70 psi**, distribution pipelines from the pressure regulator are made from aluminium alloy or plastic. Crew lines run from the storage bottle to the cockpit pressure regulator; passenger lines run from the storage bottle up the side walls and along the roof to each PSU.

## Supply Regulation

### Diluter Demand Type Regulator

Oxygen flows through the supply valve; when the user inhales, pressure inside the regulator decreases and the demand valve opens. An aneroid capsule operated metering valve mixes cabin air with the oxygen: at low altitude the user gets mostly cabin air with a small amount of oxygen; as altitude increases, less cabin air and more oxygen is supplied. At about **34,000 feet** cabin air is shut off completely and pure oxygen is supplied. If there is smoke in the cockpit, or the pilot needs pure oxygen, the oxygen lever can be moved to the **100%** position, shutting off cabin air entirely. If the regulator malfunctions, an emergency lever opens the demand valve for a continuous flow of pure oxygen.

### Continuous Flow Regulators

There are automatic regulators (an aneroid capsule senses altitude and meters the correct amount of oxygen) and manual regulators (a control valve lets the pilot adjust flow rate based on altitude). A calibrated orifice in the mask outlet determines the amount of oxygen delivered.

## Indications and Warnings

Systems are provided with an overpressure relief facility — normally a **green** rupture disc at the overboard discharge fitting, flush with the aircraft skin. When maximum cylinder pressure is exceeded, the cylinder safety valve discharges excess pressure into the overboard line; the green disc ruptures and a red (or yellow) indicator becomes visible, and some aircraft also deploy a red streamer.

On aircraft with oxygen generators, once activated, "dolls eye" indicators on the end casing turn from orange (or purple) to black; some have heat-sensitive tape that changes colour when the generator has been activated.

A pressure gauge showing storage bottle pressure has a **green segment** (indicating actual system pressure) and a **red segment** (indicating an empty bottle, or that the shut-off valve is closed). A **low pressure switch** downstream of the storage bottle gives a **"LO PR"** indication on the local panel if pressure drops below a pre-set figure, with an associated **"OXY"** caution light on the CWP and a single chime warning.
        $cnt2$,
        18
    ) RETURNING id INTO s18_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module M11A.19: Airframe Systems — General Practices
    -- (Source content: Pneumatic and Vacuum systems, chapter 16 — "16.1 GENERAL" and
    --  following sections, which is the material found within the assigned line range)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m11_id, 'M11A.19', 'Airframe Systems — General Practices',
        $cnt3$
# Airframe Systems — General Practices

*This subject covers general principles, safety precautions and practices for pneumatic and vacuum systems, as found in the source material's "General" section for these airframe systems.*

## General

Pneumatic systems are fluid power systems that use a **compressible fluid — air**. They are dependable and lightweight, and because the fluid is air there is no need for a return system.

Some aircraft have only a low pressure pneumatic system to operate the gyro instruments; others use compressed air as an emergency backup for lowering the landing gear and operating the brakes in the case of hydraulic failure. Other aircraft have a complete pneumatic system that actuates landing gear retraction, nose wheel steering, passenger doors and propeller brakes.

## Safety Precautions

When working on bleed air systems:
- Bleed air is **hot** — do not touch pipes and ducts
- Always replace seals (normally crush seals) when replacing joints
- Tighten clamps to the torque figure quoted in the Maintenance Manual
- Never lever against ducts, as dents cause hot spots
- All duct supports and struts must not put any strain onto the duct

## Full Pneumatic Systems

Advantages of using compressed air:
- Air is universally available and in unlimited supply
- Pneumatic system components are reasonably simple and lightweight
- No return lines are fitted, resulting in a weight saving
- There is no fire hazard and the danger of explosion is slight
- Contamination is minimised by the use of filters

A typical high pressure pneumatic system uses air compressors driven from the engine's accessory drive. Compressed air is discharged through a **bleed valve** to a pressure relief (unloading) valve. The bleed valve is held closed by oil pressure; if oil pressure fails, the bleed valve opens to offload the compressor. The pressure relief valve maintains system pressure at around **3,000 psi**. A **shuttle valve** in the line between the compressor and the main system allows the system to be charged from a ground source; when the engine is not running, the shuttle valve isolates the compressor.

Moisture in a compressed air system will freeze as pressure drops when a component is actuated. A **water separator** collects moisture from the air onto a baffle and drains it overboard, with an electric heater to prevent the separator freezing. After the water separator, remaining moisture is removed by a **desiccant (chemical) dryer**, and the air is then filtered before entering the main system.

Air is then fed to storage bottles that provide emergency air for several systems. A manually operated isolation valve allows the supply to be shut off for maintenance without discharging the bottles. Air is stored at maximum system pressure (around **3,000 psi**) to supply the landing gear and brakes in an emergency; a pressure reducing valve reduces this to the operating pressure of most components (around **1,000 psi**) — for example, normal landing gear operation, the passenger door, the propeller brake and nose wheel steering.

## Vacuum Systems

A supply of air at negative pressure can be required for a number of purposes. Vacuum for instruments usually comes from either a small vacuum pump attached to a piston engine, or a venturi jet pump powered by a tapping from a jet engine — the low pressure caused by the venturi draws in air to supply the system.

Vacuum may also be required for a pneumatic de-icing system, which inflates flexible leading-edge mats ("boots") to break off ice. To keep the boots in place, they are fed a negative pressure from a venturi, sucking them flat onto the wing leading edge for a smooth aerodynamic surface.

## Low Pressure Pneumatic Systems Layout

These systems provide air for gyroscopic attitude and direction indicators and to inflate pneumatic de-icing boots, usually from a vane-type engine driven air pump.

### Engine Driven Air Pump

On early aircraft, engine driven air pumps were used primarily to evacuate the casings of air-driven gyroscopic instruments, so were commonly known as vacuum pumps. On later aircraft the discharge air was used to inflate de-icing boots, and the units are now more correctly called air pumps. There are two types:

- **Wet Air Pumps** — steel vanes lubricated and sealed with engine oil, drawn in through the pump mounting pad and exhausted with the discharge air; the oil is removed with an oil separator before use.
- **Dry Air Pumps** — developed so there is no oil in the discharge air, so no oil separator is needed. The vanes are made from carbon and are self-lubricating; the main problem is that the vanes are easily broken by contaminants, so the inlet air is filtered.

## Air Supply Sources

The source of air supply and system component arrangement depend on the aircraft type, but generally one of the following methods is used:

### Engine Bleed Air

Used in turbojet aircraft, with hot air bled from the engine compressors to the cabin, passed through a pressure and temperature control system before mixing with ram air. Because of the great variation in air output from ground to maximum flight rpm, two tappings are taken from the engine — one from the LP stages and one from the HP stages — to maintain a reasonable pressure band at all engine speeds. At low rpm, LP air pressure is insufficient, so air is tapped from the HP stages; as engine speed increases, LP pressure rises and at a pre-determined pressure the HP air is shut off, so at maximum speed (and in all normal stages of flight) air is taken purely from the LP stages.

### Compressors or Blowers

Used by some turbojet, turboprop or piston engine aircraft, driven via an accessory drive, bleed air, or electric or hydraulic motors. Controlled by a cockpit shut-off valve, opened when insufficient LP air pressure is available at low engine speeds, directing LP air to drive the turbo compressor; a pressure regulator ensures constant output pressure. On large multi-engine aircraft, only some engines have a turbo compressor.

### Auxiliary Power Unit (APU)

An independent source of pressurised air — basically a small gas turbine engine providing air and other services while the aircraft is on the ground with its main engines stopped. Usually self-contained and located in the tail section. On some aircraft the APU can be started in flight as a backup source of air and hydraulic services if an engine is lost.

### Ground Supply

Used on the ground when engines are not running. A ground cart is basically a compressor driven by an engine (usually diesel), with output pressure regulated to match the aircraft's system pressure. A quick release hose connects the cart to the aircraft service panel; maximum system pressure and operating/safety instructions are detailed on the service access panel.

## Pressure Control

In many bleed air systems, pressure is regulated only by operation of the high pressure shut-off valve, ranging from about **10 psi** at ground idle to **65 psi** at take-off power. Many modern aircraft use bleed air for pressure-sensitive systems requiring dedicated regulation, via a **pressure regulator** — a pneumatically operated valve giving a predetermined output pressure, which may also perform as the shut-off valve (a "pressure regulating and shut-off valve").

### Pressure Regulator

Operates on a balance between air pressure and spring pressure. In a typical example: a piston of area 1 sq in is held in its seat by a spring exerting 100 lb force; the piston shoulder (0.5 sq in) is acted on by system air pressure of 1,500 psi; the cone-shaped valve seat (0.5 sq in) is acted on by a reduced pressure of 200 psi. A bleed orifice allows air pressure into the piston chamber, where a relief valve (acted on by the 200 psi reduced pressure and a spring) maintains chamber pressure at **750 psi**. When a pneumatic service draws air, the downline pressure drops below 200 psi, which is insufficient to keep the relief valve closed; the 750 psi chamber pressure then unseats the relief valve, reducing chamber pressure, which in turn unseats the piston cone and allows system pressure to bleed into the down lines. Once downline pressure rises back to 200 psi, the piston cone and relief valve re-seat and the system is back in balance.

## Distribution

Ducting and pipelines carry charge air from the engine compressors to the services that need it. Because bleed air is hot, leakage causes an extreme temperature rise with a risk of fire or structural damage, so leak detection systems are incorporated. Ducting is built in sections, of thin wall material, clamped together with joints that allow for thermal expansion, for ease of maintenance and cheapness of replacement. Engine bleed air system ducts are manufactured from stainless steel; ducts and pipelines are usually manufactured from titanium, as it withstands higher temperatures and is lighter in weight. Duct sections are supported throughout their length by clamps and tie-rod attachments to the aircraft structure.

### Expansion Joints

Joints are assembled cold, but ducting temperatures can reach up to **350°F** in use, so expansion devices must be incorporated to prevent distortion or buckling:

- **Pre-Stressed Joint** — duct sections are installed slightly shorter and allowed to expand with heat to fit correctly, being pre-stressed by clamps when cold
- **Flexible Ball Joint** — allows for slight flexing, misalignment and expansion; a flange on one duct end connects to a bearing nut on the other; shims maintain clearance and a crush-type metal seal prevents air leakage
- **Cable Attachment Joint** — used where large temperature changes exist (cold soak at altitude to maximum working temperature); bosses at each duct end are connected by (typically three) short cables with swaged ball and threaded fittings; a nut tightens the cables and seals the duct, with a small gap left for expansion

## Indications and Warnings

Safety devices are fitted to prevent overheat or overpressure that could cause severe damage to ducting or systems.

- **Overpressure** — usually caused by malfunction of the high pressure shut-off valve remaining open at maximum engine rpm. A pressure relief valve in the engine bleed air ducting relieves excess pressure, and may work with a pressure switch that closes the high pressure shut-off valve at a pre-determined pressure.
- **Overheat** — prevented by an electrical temperature sensor downstream of the engine bleed air valve; at a pre-determined temperature, the sensor signals the high pressure shut-off valve to close, with an overheat indication given to the aircrew on the CWP.
- **Duct Hot Air Leakage** — a duct protection system includes fire-wire (thermistor-type) elements around hot zones (engine air bleeds, air conditioning packs, APUs). As temperature increases, resistance decreases until a circuit is made, sending a warning to the cockpit central warning panel with associated caution/warning lights and aural chimes; the leaking duct may be isolated automatically or the pilot may need to close off the air valves, and the faulty system then remains out of use.

## System Interfaces

The pneumatic system interfaces with various other aircraft systems. Once bleed air pressure has been reduced to around **40 to 50 psi**, most services have their own pressure and temperature controls and generate their own warnings/indications.

- **Pneumatic Gyro Power Systems** — gyroscopes are driven by air impinging on cups cut into the wheel periphery, either via air pump suction (evacuating the instrument case, drawing filtered air through a nozzle onto the driving cups, with a suction relief valve and suction gauge) or via dry air pump pressure (for high-altitude operation where suction alone is insufficient), with air evacuated overboard after driving the instruments.
- **Backup High Pressure Pneumatic Systems** — provide emergency landing gear extension and braking if hydraulics fail, using a pressurised cylinder of approximately **3,000 psi** compressed air or nitrogen; a shuttle valve directs hydraulic fluid for normal operation, or compressed air/nitrogen for emergency operation.
- **Pneumatic De-Icing Systems** — the de-icing boot inflation system uses wet air pumps; oily air passes through baffle plates in an oil separator, with collected oil returned to the engine oil sump, before clean air flows through a de-icing selector valve, a pressure regulating valve and a distribution sequencing valve.
- **Air Conditioning and Pressurisation** — bleed air supplies hot air to air conditioning packs via primary and secondary heat exchangers before mixing with cold air; bleed air also drives a compressor (or jet pump) for cabin pressurisation, with the air passing through an intercooler to reduce temperature.
- **Air Driven Hydraulic Pumps** — some aircraft use hydraulic pumps operated by air turbines driven by bleed air, with flow controlled by a solenoid-operated pressure regulator and shut-off valve to keep turbine speed within set limits.
- **Pressurising of Hydraulic Reservoirs** — aircraft flying above **20,000 feet** require the hydraulic reservoir to be pressurised, to prevent fluid foaming (due to low ambient pressure) and pump cavitation; bleed air is fed via a regulator/reducing valve, with a pressure relief valve venting excess pressure.
- **Waste and Water Systems** — toilet systems on larger aircraft use a vacuum to empty a number of toilets into a single collector tank, saving the need for a self-contained tank and pumping mechanism at each toilet. The flush uses fresh water from the potable supply together with the vacuum, which draws the waste into the collector tank (the tank being connected to the outside of the aircraft; at low levels, when outside air pressure is insufficient, a small vacuum pump operates).
- **Pneumatic Stall Warning** — common on light aircraft: a slotted plate mounted on the wing leading edge coincides with the stagnation point in normal flight; the slot connects via a tube to a horn, and at a stalling angle of attack the low pressure is drawn into the tube, sounding the horn to warn the pilot.
        $cnt3$,
        19
    ) RETURNING id INTO s19_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module M11A.20: Water and Waste Systems
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m11_id, 'M11A.20', 'Water and Waste Systems',
        $cnt4$
# Water and Waste Systems

## Water Systems

"Potable water" refers to drinking water. On aircraft it supplies water for drinking, galleys, and hot and cold water to wash basins throughout the aircraft. A centralised water tank can feed any number of galleys and toilets through a gallery of pipes, speeding servicing turnaround since there need only be one main replenishment point. Potable water is **hyper-chlorinated** to control bacteria, carried out at set intervals.

The major components of a potable water system are:
- A storage tank
- Air pressure system to force water from the storage tank to the services
- Distribution lines
- Filling system
- Quantity indication system
- Valves to drain the system

The tank is usually stored under the cabin floor in a cradle structure, constructed from either fibreglass with metal bonded bands or stainless steel. Its quantity and volume are dictated by the number of passengers carried and the length of time the aircraft is airborne. Aircraft expected to operate in cold climates may have built-in heater blankets to keep the tank and replenishing panel free of ice. The tank assembly incorporates a drain, filler connection, overflow connection, air pressure connection and outlet pipelines to the galley and toilets.

### Pressure Control

The air supply for moving water is tapped from the bleed air supply of the engine compressor or the APU. Some aircraft, needing to draw water when there is no air pressure available (e.g. on the ramp), have an **electrically powered air compressor** to provide a head of pressure; the compressor may automatically start when bleed air pressure drops below a pre-determined value. On aircraft using a compressor, a **riser loop** is incorporated to prevent water entering the compressor (siphoning back), with the top of the loop higher than the distribution ducting to ensure water goes to the distribution lines first. A pressure switch controls the compressor starting and stopping as bleed air pressure varies.

### Water Distribution System

A main water distribution line runs from the water tank up into the cabin ceiling, with individual pipelines routed to toilets and galleys. Distribution lines are usually flexible hoses enclosed in an aluminium sheath, insulated to prevent freezing; the outer sheath prevents leakage entering the cabin, with any leaking water directed to the lower fuselage via drain tubes for overboard drainage. A quick release connection above each toilet and galley enables the supply line to be disconnected for removal. On smaller aircraft, the water tank may be located above the wash basin and galley areas, providing water under gravity.

### Water Heating

A small-capacity water heater is installed in the supply piping under each lavatory sink, containing electrical elements in its base. On the side of the tank are a warning light, a control switch, an overheat re-set switch and a pressure relief valve. A switch controller regulates water temperature to around **125°F**. If a malfunction increases the temperature to **190°F**, the overheat switch operates, switching off power to the heater (the power light goes out); the heater must then be manually reset after a cooling-down period. The pressure relief valve relieves pressures in excess of around **140 psi**, its primary function being to relieve pressures caused by the water overheating.

### Waste Water Collection and Drainage

Collection and drainage depends on the aircraft: on some aircraft, wash basin water drains directly overboard, while on others it drains into a soil tank used to flush the toilet system. Overboard drainage is through **drain masts** under the fuselage, which are normally electrically heated to prevent freezing, with the aircraft's forward motion finely atomising the water as it leaves. To test drain mast heaters on the ground, the hand is carefully used to feel for warmth.

### Quantity Indication

Some aircraft use a simple sight gauge beside the tank. On larger aircraft, a sensor remotely signals tank levels to the cabin crew — one method uses a gauge on the attendants' panel and a corresponding gauge on the water service panel, fed from the same float and electrical transmitter. Another method uses a series of lights controlled by magnetic floats inside the tank: when the water level operates a float, a circuit is made and the corresponding panel light illuminates.

### Water Service Panel

Normally found on the lower fuselage, easily reached by the maintenance crew for turnaround replenishment. It typically contains a filling point, a drain/overflow point, a quantity indication (lights or gauge) and an external air connection. The filling point allows a replenishing rig/truck to fill the tank; the drain/overflow shows when the tank is full, with excess water overflowing out of the overflow line — once overflow is seen, the fill/vent valve is closed to the vent position. The quantity indicator allows the tank to be filled to a "less-than-full" quantity on short flight legs, trading the excess weight of unused water against fuel. The external air connection allows a ground air source to move water within the system when no internal air pressure is available. The water drain valve is manually operated, draining the tank under gravity and manually re-set once emptied. The fill/vent valve, manual or electrically operated, rotates between fill and vent positions and may also electrically isolate the air compressor during filling. The vent valve's purpose is to prevent an air lock in the wash basin taps by opening the tap lines to atmosphere — modern aircraft have self-venting taps that automatically relieve air locks.

## Waste Systems

Aircraft toilets are an essential requirement for any aircraft carrying passengers over long distances. They must be maintained and serviced with care, kept clean and odour-free, as passenger comfort and health must be protected. There are **three main types** of toilet fitted to aircraft, the type used depending on the number of passengers carried and the age of the aircraft. Relevant health precautions must be observed during all forms of servicing. Because of the nature of the fluids carried, protection must also be given to the aircraft structure against corrosion caused by these fluids.

The three types of toilet are:
- Removable toilet assembly
- Liquid flush type
- Vacuum toilet assembly

### Removable Toilet Assemblies

The removable, or "carry out", toilet is the simplest type, often referred to as an **"Elsan"**, named after the original manufacturing company. It is simply a storage bin with a toilet seat fitted to the top, partially filled with a strong chemical deodorant. It is removed from the aircraft and emptied at an approved disposal site, washed out, replenished with deodorant, and re-fitted using a quick release attachment such as "pip" pins. This type of toilet is found only on **short range small light aircraft**.

### Liquid Flush Toilets

The most common type on passenger aircraft: a completely self-contained quick release unit, with its waste collection tank mounted directly beneath the toilet bowl (usually composites or plastics), and a service panel directly below the tank. Typical components include: motor and pump, filter, drain valve, rinse ring, flush line and air vent. The bowl is constructed from stainless steel; tank units may be the same material or fibreglass laminate. Tank capacity depends on flight duration and passenger numbers. An average tank capacity is **20 gallons (90 litres)**, of which **3 gallons (13.5 litres)** are a pre-charge of chemical containing disinfectant, dye and deodorant, sufficient for about **100 uses** before emptying and recharging is required.

**System Operation:** when the flush button is pressed, the motor runs for a fixed time (usually around **10 seconds**), pumping fluid through the bowl spray pipe in a swirling action that flushes the bowl contents into the tank via a lightly sprung, hinged separator. At the end of the 10-second cycle, the motor re-arms to run again in the reverse direction, to ensure the filter does not become blocked with solid waste.

### Vacuum Toilets

Overcome two major problems of liquid flush toilets on aircraft with a number of units: corrosion risk and the time taken to drain and replenish each individual toilet. Dry toilet modules are installed at convenient locations around the cabin, connected to a **central storage tank** by pipelines. The vacuum toilet uses a waste container with a negative pressure (vacuum) inside, which draws waste from the bowl together with clean flushing water and deposits it into the tank. On very large aircraft, more than one waste tank is used to avoid a single tank filling up during the flight.

The flush uses fresh water from the potable supply together with the vacuum, which draws waste into the collector tank; the tank is connected to the outside of the aircraft, and as aircraft speed increases, the pressure at the connection drops, drawing the waste to the storage tank. At low speeds or low altitudes, when the pressure differential is insufficient, a small vacuum pump (a **"vacuum generator"**) operated by a pressure switch provides the required pressure drop — its normal range of operation is from sea level up to **16,000 ft**.

**Emptying:** large aircraft hold waste in a storage tank that is emptied after landing, usually by specialist companies sub-contracted to the airlines at particular airports. Tanks are emptied by one of two methods:
- **Gravity** — the emptying vehicle's hose is connected and the shut-off valve operated; once emptied, the tank is flushed out and, depending on tank type, replenished with deodorising fluid
- **Suction** — requires both that the emptying vehicle has the correct equipment (set at the correct suction value) and that the aircraft has ducting cleared for use with suction equipment; using suction equipment on an aircraft with only "gravity" ducting and piping will cause severe damage to the toilet equipment

### Corrosion Control

All areas where toilet equipment is fitted must be protected against corrosion, since many toilet chemicals severely affect aluminium alloy aircraft structure. All spillages must be neutralised and cleaned off as soon as possible, with thorough checks of affected areas — the toilet floor and the area beneath it, the vicinity of the collector tank(s), around the draining/filling panel, and anywhere else corrosive fumes could affect the structure — inspected at regular intervals. Some toilet units are enclosed in an anti-corrosion tank connected to the drain lines, containing any leaks. Toilet floors may be made from composite materials to reduce the likelihood of corrosion damage, and all service panel connections are sealed off when the panel is closed.
        $cnt4$,
        20
    ) RETURNING id INTO s20_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M11A.17 Aircraft Lights (13 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s17_id, 'During the hours of darkness, what colour navigation light is displayed at or near the starboard wingtip of an aircraft?',
     '[{"id":"a","text":"Green","correct":true},{"id":"b","text":"Red","correct":false},{"id":"c","text":"White","correct":false}]',
     '{"B1"}'),

    (s17_id, 'During the hours of darkness, what colour navigation light is displayed at or near the port wingtip of an aircraft?',
     '[{"id":"a","text":"Green","correct":false},{"id":"b","text":"Red","correct":true},{"id":"c","text":"White","correct":false}]',
     '{"B1"}'),

    (s17_id, 'The white navigation light, visible from the rear of the aircraft, is displayed through a horizontal arc of approximately:',
     '[{"id":"a","text":"110°","correct":false},{"id":"b","text":"140°","correct":true},{"id":"c","text":"180°","correct":false}]',
     '{"B1"}'),

    (s17_id, 'On the Boeing 737, how many landing lights are fitted, and of what types?',
     '[{"id":"a","text":"4 in total — 2 fixed on the wing leading edges and 2 retractable in the outboard flap track fairing","correct":true},{"id":"b","text":"2 in total, both of the fixed type only","correct":false},{"id":"c","text":"4 in total, all of the retractable type","correct":false}]',
     '{"B1"}'),

    (s17_id, 'When the Boeing 737''s retractable landing lights are extended, in which direction do they shine?',
     '[{"id":"a","text":"Forward, regardless of flap position","correct":true},{"id":"b","text":"Forward, only when the flaps are fully extended","correct":false},{"id":"c","text":"Downward, for taxi illumination only","correct":false}]',
     '{"B1"}'),

    (s17_id, 'Retracting landing lamps are extended by an actuator via a slipping clutch or shear links. The purpose of this arrangement is to:',
     '[{"id":"a","text":"Ensure the lamp retracts even if it fails to do so at high speed","correct":true},{"id":"b","text":"Increase the maximum extension speed of the lamp","correct":false},{"id":"c","text":"Allow the lamp to rotate for taxi turns","correct":false}]',
     '{"B1"}'),

    (s17_id, 'In strobe (anti-collision) light operation, the capacitor converts an input of 28V dc or 115V ac into a high dc output of approximately:',
     '[{"id":"a","text":"45V","correct":false},{"id":"b","text":"450V","correct":true},{"id":"c","text":"4500V","correct":false}]',
     '{"B1"}'),

    (s17_id, 'A strobe (capacitor-discharge) anti-collision light produces a high intensity flash at a rate of approximately:',
     '[{"id":"a","text":"6 flashes per minute","correct":false},{"id":"b","text":"60 flashes per minute","correct":true},{"id":"c","text":"600 flashes per minute","correct":false}]',
     '{"B1"}'),

    (s17_id, 'After power is removed from a strobe light unit, how long should you wait before handling it?',
     '[{"id":"a","text":"At least 5 minutes","correct":true},{"id":"b","text":"At least 30 seconds","correct":false},{"id":"c","text":"At least 24 hours","correct":false}]',
     '{"B1"}'),

    (s17_id, 'On a rotating reflector type anti-collision light, the curved half of the reflector increases the vertical spread of the light beam to:',
     '[{"id":"a","text":"10° above and below the horizontal","correct":false},{"id":"b","text":"30° above and below the horizontal","correct":true},{"id":"c","text":"90° above and below the horizontal","correct":false}]',
     '{"B1"}'),

    (s17_id, 'On the emergency lighting system three-position selector switch, which position is the normal in-flight setting?',
     '[{"id":"a","text":"OFF","correct":false},{"id":"b","text":"ARMED","correct":true},{"id":"c","text":"ON","correct":false}]',
     '{"B1"}'),

    (s17_id, 'With the emergency lighting selector switch in the OFF position:',
     '[{"id":"a","text":"The battery packs are charged and the 6V lights remain OFF, even if main electrical power is lost","correct":true},{"id":"b","text":"The battery packs are discharged and the 6V lights remain ON at all times","correct":false},{"id":"c","text":"A ''NOT ARMED'' warning light is inhibited","correct":false}]',
     '{"B1"}'),

    (s17_id, 'Self-illuminating aircraft signs use which mildly radioactive gas, requiring careful handling to avoid breakage?',
     '[{"id":"a","text":"Tritium","correct":true},{"id":"b","text":"Radon","correct":false},{"id":"c","text":"Krypton","correct":false}]',
     '{"B1"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M11A.18 Oxygen Systems (12 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s18_id, 'According to the source material, above approximately what altitude must some means be provided to maintain a breathable environment for crew and passengers (normally by cabin pressurisation)?',
     '[{"id":"a","text":"8,000 feet","correct":true},{"id":"b","text":"800 feet","correct":false},{"id":"c","text":"18,000 feet","correct":false}]',
     '{"B1"}'),

    (s18_id, 'Civil aircraft normally use which types of emergency oxygen source, with the military using liquid oxygen?',
     '[{"id":"a","text":"Gaseous and chemical","correct":true},{"id":"b","text":"Liquid and chemical","correct":false},{"id":"c","text":"Gaseous only","correct":false}]',
     '{"B1"}'),

    (s18_id, 'Aircraft that fly above 18,000 feet typically use which type of oxygen system for the crew, which meters oxygen based on altitude and delivers it only when the user inhales?',
     '[{"id":"a","text":"Continuous flow system","correct":false},{"id":"b","text":"Diluter demand system","correct":true},{"id":"c","text":"Chemical candle system","correct":false}]',
     '{"B1"}'),

    (s18_id, 'Although oxygen itself is non-flammable, the key safety hazard it presents is that it:',
     '[{"id":"a","text":"Will support combustion, so a small fire or spark can rapidly grow in an oxygen-enriched atmosphere","correct":true},{"id":"b","text":"Reacts explosively with pure water","correct":false},{"id":"c","text":"Is corrosive to all aircraft structural materials","correct":false}]',
     '{"B1"}'),

    (s18_id, 'On a crew oxygen mask storage box, what does depressing the 100% selector button do?',
     '[{"id":"a","text":"Delivers pure, undiluted oxygen to the mask","correct":true},{"id":"b","text":"Tests the oxygen flow indicator only","correct":false},{"id":"c","text":"Inflates the mask harness fully","correct":false}]',
     '{"B1"}'),

    (s18_id, 'A chemical oxygen generator ("oxygen candle") produces oxygen by the decomposition of a solid block made primarily from:',
     '[{"id":"a","text":"Sodium chlorate and iron","correct":true},{"id":"b","text":"Liquid nitrogen and hydrogen peroxide","correct":false},{"id":"c","text":"Compressed carbon dioxide and iron oxide","correct":false}]',
     '{"B1"}'),

    (s18_id, 'Besides oxygen, what are the byproducts of the chemical reaction in an oxygen generator (candle)?',
     '[{"id":"a","text":"Sodium chloride (salt) and ferrous oxide (rust)","correct":true},{"id":"b","text":"Carbon dioxide and water vapour only","correct":false},{"id":"c","text":"Nitrogen and ozone","correct":false}]',
     '{"B1"}'),

    (s18_id, 'The normal output pressure from an activated chemical oxygen generator, which is not further regulated before breathing, is approximately:',
     '[{"id":"a","text":"10 psi","correct":true},{"id":"b","text":"100 psi","correct":false},{"id":"c","text":"1,000 psi","correct":false}]',
     '{"B1"}'),

    (s18_id, 'The normal charge pressure of a gaseous oxygen storage cylinder is typically around:',
     '[{"id":"a","text":"1,800 psi","correct":true},{"id":"b","text":"180 psi","correct":false},{"id":"c","text":"18,000 psi","correct":false}]',
     '{"B1"}'),

    (s18_id, 'In a diluter demand type oxygen regulator, at approximately what altitude is cabin air shut off completely so that only pure oxygen is supplied to the mask?',
     '[{"id":"a","text":"10,000 feet","correct":false},{"id":"b","text":"34,000 feet","correct":true},{"id":"c","text":"60,000 feet","correct":false}]',
     '{"B1"}'),

    (s18_id, 'Above approximately what altitude does the pressure demand oxygen regulator need to deliver oxygen to the mask under a slight positive pressure, because the user''s lungs alone cannot draw it in?',
     '[{"id":"a","text":"18,000 feet","correct":false},{"id":"b","text":"40,000 feet","correct":true},{"id":"c","text":"8,000 feet","correct":false}]',
     '{"B1"}'),

    (s18_id, 'A low pressure switch fitted downstream of the oxygen storage bottle, on sensing a pressure drop below a pre-set value, will typically cause:',
     '[{"id":"a","text":"A ''LO PR'' indication on the local panel, an ''OXY'' caution light on the CWP, and a single chime warning","correct":true},{"id":"b","text":"Automatic closure of the aircraft''s cabin outflow valve","correct":false},{"id":"c","text":"Automatic activation of all chemical oxygen generators","correct":false}]',
     '{"B1"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M11A.19 Airframe Systems — General Practices (Pneumatic & Vacuum) (12 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s19_id, 'Pneumatic systems are fluid power systems that use a compressible fluid. One key advantage of this, stated in the source material, is that:',
     '[{"id":"a","text":"No return system is needed, since the fluid is air","correct":true},{"id":"b","text":"The fluid never needs filtering","correct":false},{"id":"c","text":"The system can operate without any pressure regulation","correct":false}]',
     '{"B1"}'),

    (s19_id, 'In a typical high pressure pneumatic system, the bleed valve is normally held closed by:',
     '[{"id":"a","text":"Oil pressure, opening to offload the compressor if oil pressure fails","correct":true},{"id":"b","text":"A mechanical spring only, with no other control","correct":false},{"id":"c","text":"Cabin differential pressure","correct":false}]',
     '{"B1"}'),

    (s19_id, 'In a typical high pressure pneumatic system, the pressure relief (unloading) valve maintains system pressure at around:',
     '[{"id":"a","text":"300 psi","correct":false},{"id":"b","text":"3,000 psi","correct":true},{"id":"c","text":"30,000 psi","correct":false}]',
     '{"B1"}'),

    (s19_id, 'The purpose of the shuttle valve fitted between the compressor and the main pneumatic system is to:',
     '[{"id":"a","text":"Allow the system to be charged from a ground source and isolate the compressor when the engine is not running","correct":true},{"id":"b","text":"Regulate cabin temperature","correct":false},{"id":"c","text":"Convert compressed air into hydraulic pressure","correct":false}]',
     '{"B1"}'),

    (s19_id, 'In a pneumatic system, after the water separator removes moisture onto a baffle, any remaining moisture is removed by a:',
     '[{"id":"a","text":"Desiccant (chemical) dryer","correct":true},{"id":"b","text":"Second bleed valve","correct":false},{"id":"c","text":"Venturi jet pump","correct":false}]',
     '{"B1"}'),

    (s19_id, 'A dry air pump differs from a wet air pump in that its vanes are:',
     '[{"id":"a","text":"Made from carbon and are self-lubricating, so no oil separator is required","correct":true},{"id":"b","text":"Made from steel and lubricated by engine oil","correct":false},{"id":"c","text":"Made from ceramic and require no filtration of inlet air","correct":false}]',
     '{"B1"}'),

    (s19_id, 'On a turbojet aircraft using engine bleed air, at low engine rpm the pneumatic systems are normally supplied from:',
     '[{"id":"a","text":"The HP stages, since LP air pressure is insufficient at low rpm","correct":true},{"id":"b","text":"The LP stages exclusively at all times","correct":false},{"id":"c","text":"The APU only, regardless of engine speed","correct":false}]',
     '{"B1"}'),

    (s19_id, 'The Auxiliary Power Unit (APU), as described for pneumatic system air supply, is best described as:',
     '[{"id":"a","text":"A small gas turbine engine providing an independent source of pressurised air (and other services) with the main engines stopped","correct":true},{"id":"b","text":"A ground-based diesel-driven compressor only","correct":false},{"id":"c","text":"A vacuum pump used solely for gyro instruments","correct":false}]',
     '{"B1"}'),

    (s19_id, 'Bleed air ducting and pipelines are usually manufactured from titanium primarily because it:',
     '[{"id":"a","text":"Withstands higher temperatures and is lighter in weight","correct":true},{"id":"b","text":"Is the cheapest material available","correct":false},{"id":"c","text":"Is magnetic, simplifying leak detection","correct":false}]',
     '{"B1"}'),

    (s19_id, 'Which type of duct expansion joint is used where large temperature changes exist, such as from a cold soak at altitude to maximum working temperature, using short cables with swaged fittings around the duct?',
     '[{"id":"a","text":"Pre-stressed joint","correct":false},{"id":"b","text":"Cable attachment joint","correct":true},{"id":"c","text":"Flexible ball joint","correct":false}]',
     '{"B1"}'),

    (s19_id, 'Duct hot air leakage protection systems typically use which type of sensing element, whose resistance decreases as temperature increases?',
     '[{"id":"a","text":"Thermistor (fire-wire) elements","correct":true},{"id":"b","text":"Piezoelectric crystals","correct":false},{"id":"c","text":"Bimetallic strips only","correct":false}]',
     '{"B1"}'),

    (s19_id, 'Aircraft flying above approximately 20,000 feet require the hydraulic reservoir to be pressurised (usually from bleed air) primarily to:',
     '[{"id":"a","text":"Prevent fluid foaming and pump cavitation caused by low ambient pressure","correct":true},{"id":"b","text":"Increase the hydraulic system''s maximum operating pressure","correct":false},{"id":"c","text":"Cool the hydraulic fluid","correct":false}]',
     '{"B1"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M11A.20 Water and Waste Systems (12 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s20_id, 'Potable water carried on aircraft is hyper-chlorinated at set intervals primarily to:',
     '[{"id":"a","text":"Control bacteria","correct":true},{"id":"b","text":"Prevent the water freezing","correct":false},{"id":"c","text":"Increase its density for accurate quantity indication","correct":false}]',
     '{"B1"}'),

    (s20_id, 'On aircraft using an electrically powered air compressor to pressurise the potable water system, a riser loop is incorporated to:',
     '[{"id":"a","text":"Prevent water entering (siphoning back through) the compressor","correct":true},{"id":"b","text":"Increase the water flow rate to the galleys","correct":false},{"id":"c","text":"Heat the water before distribution","correct":false}]',
     '{"B1"}'),

    (s20_id, 'A lavatory water heater''s switch controller normally regulates water temperature to around:',
     '[{"id":"a","text":"75°F","correct":false},{"id":"b","text":"125°F","correct":true},{"id":"c","text":"212°F","correct":false}]',
     '{"B1"}'),

    (s20_id, 'If a lavatory water heater malfunctions and its temperature rises to approximately 190°F, what happens?',
     '[{"id":"a","text":"The overheat switch operates, switching off power to the heater until manually reset","correct":true},{"id":"b","text":"The pressure relief valve automatically resets the thermostat","correct":false},{"id":"c","text":"The heater output increases to compensate","correct":false}]',
     '{"B1"}'),

    (s20_id, 'A water heater''s pressure relief valve typically relieves pressures in excess of approximately:',
     '[{"id":"a","text":"14 psi","correct":false},{"id":"b","text":"140 psi","correct":true},{"id":"c","text":"1,400 psi","correct":false}]',
     '{"B1"}'),

    (s20_id, 'Drain masts, used to discharge waste water overboard under the fuselage, are normally electrically heated primarily to:',
     '[{"id":"a","text":"Prevent the water freezing","correct":true},{"id":"b","text":"Sterilise the waste water before discharge","correct":false},{"id":"c","text":"Increase the rate of discharge","correct":false}]',
     '{"B1"}'),

    (s20_id, 'What are the three main types of aircraft toilet described in the source material?',
     '[{"id":"a","text":"Removable, liquid flush, and vacuum","correct":true},{"id":"b","text":"Chemical, electric, and pneumatic","correct":false},{"id":"c","text":"Gravity, pressure, and vacuum-assisted gravity","correct":false}]',
     '{"B1"}'),

    (s20_id, 'The removable, "carry out" toilet, commonly referred to as an "Elsan", is typically found only on:',
     '[{"id":"a","text":"Short range small light aircraft","correct":true},{"id":"b","text":"Long range widebody aircraft","correct":false},{"id":"c","text":"Aircraft with vacuum toilet systems fitted as a backup","correct":false}]',
     '{"B1"}'),

    (s20_id, 'A typical liquid flush toilet tank has an average capacity of about 20 gallons (90 litres), of which approximately 3 gallons (13.5 litres) is:',
     '[{"id":"a","text":"A pre-charge of chemical containing disinfectant, dye and deodorant","correct":true},{"id":"b","text":"Reserve potable drinking water","correct":false},{"id":"c","text":"Compressed air for the flush cycle","correct":false}]',
     '{"B1"}'),

    (s20_id, 'On a liquid flush toilet, after the flush motor runs for its fixed cycle (around 10 seconds), it then re-arms to run again in reverse in order to:',
     '[{"id":"a","text":"Prevent the filter becoming blocked with solid waste","correct":true},{"id":"b","text":"Refill the chemical pre-charge","correct":false},{"id":"c","text":"Reset the quantity indication gauge","correct":false}]',
     '{"B1"}'),

    (s20_id, 'In a vacuum toilet system, when the pressure differential at the outside connection is insufficient to draw waste to the storage tank (e.g. at low speed or low altitude), what provides the required pressure drop?',
     '[{"id":"a","text":"A small vacuum pump known as a ''vacuum generator'', operated by a pressure switch","correct":true},{"id":"b","text":"The engine bleed air system operating in reverse","correct":false},{"id":"c","text":"A manually operated hand pump used by the cabin crew","correct":false}]',
     '{"B1"}'),

    (s20_id, 'When emptying an aircraft''s waste storage tank using suction equipment, what is essential to avoid severe damage to the toilet equipment?',
     '[{"id":"a","text":"The aircraft must have ducting that is cleared for use with suction equipment, not just gravity ducting","correct":true},{"id":"b","text":"The tank must first be filled to maximum capacity","correct":false},{"id":"c","text":"The aircraft''s vacuum generator must be switched off first","correct":false}]',
     '{"B1"}');

END $$;
