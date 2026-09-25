-- Module 11B: Piston Aeroplane Structures and Systems (B1) — Aircraft Lights, Oxygen Systems, Pneumatic and Vacuum Systems, Water and Waste Systems
-- Source: EASA Part-66 Module 11B official textbook (IKAROS Aviation Training Centre, IK M11B, Issue Oct.2012)

DO $$
DECLARE
    m11_id INT;
    s16_id INT;
    s17_id INT;
    s18_id INT;
    s19_id INT;
BEGIN
    SELECT id INTO m11_id FROM easa_modules WHERE code = 'M11';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M11B.16') THEN
        RAISE NOTICE 'M11B.16-M11B.19 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 11B.16: Aircraft Lights
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m11_id, 'M11B.16', 'Aircraft Lights',
        $cnt$
# Aircraft Lights

## External and Internal Lighting — Purpose

Aircraft lighting systems fall into two broad groups.

**External lighting** is provided to:
- Mark the extremities of the aircraft and give position reference (**Navigation Lights**)
- Mark the position of the aircraft using **Flashing (Anti-Collision) Lights**
- Provide forward and lateral illumination for landing and taxiing (**Landing and Taxiing Lights**)
- Illuminate the wings for ice inspection
- Assist the evacuation of passengers and crew during an emergency landing

**Internal lighting** is provided to:
- Illuminate consoles and control panels
- Light passenger compartments and information signs
- Provide warning lights indicating system operating condition
- Provide emergency lighting

## Navigation (Position) Lights

All aircraft in flight, or moving on the ground during the hours of darkness, must display the following lights:
- A **GREEN** light at or near the starboard wingtip, visible in the horizontal plane through an arc of **110°** from a point directly ahead
- A **RED** light at or near the port wingtip, visible in the horizontal plane through an arc of **110°** from a point directly ahead
- A **WHITE** light, visible from the rear of the aircraft in the horizontal plane through an arc of **140°**

On the Boeing 737, wingtip navigation lights, a wingtip rear position light and a tail cone strobe light together make up the navigation/position lighting.

## Landing Lights

Landing and taxi lamps provide illumination for landing and taxiing at night or in poor visibility. The term also covers equipment such as flare-out lights and runway turn-off lights.

The Boeing 737 has a total of **4 landing lights**:
- **2 fixed type**, located on the wing leading edges near the fuselage
- **2 retractable type**, located in the outboard flap track fairing

When the retractable lights are extended, they shine forward **regardless of flap position**. The outboard lights give good visibility in adverse weather and minimise reflected light into the flight deck.

### Retracting Landing Lights

The lamp is extended by an actuator via a **slipping clutch or shear links**. This ensures the lamp retracts even if it fails to do so at high speed, for whatever reason. The lamp unit is generally of the sealed-beam type. When an "extend" selection is made, a motor drives cams that sequence the contacts controlling the motor and lamp supplies, and arm the circuit for a subsequent "retract" selection.

## Runway Turn-off and Taxi Lights

Runway turn-off lights are fitted in each wing root, inboard of the inboard landing lights, aimed ahead and to the side to illuminate taxiway turn-offs. A nose gear taxi light is mounted on the inner cylinder of the nose gear shock strut so that it turns with the nose gear.

## Anti-Collision Lights

Anti-collision lights are "attention-getters" that warn of the presence of an aircraft and identify its position. They are mounted on the top and bottom of the fuselage, aft of the wing leading edge, and each is a strobe light covered by a **red lens**. Some aircraft additionally fit white strobe lights on each wingtip and the tail as position indicators.

### Strobe Light Operation

The strobe light works on the principle of a **capacitor-discharge flash tube**. The capacitor converts an input of **28V DC or 115V AC** into a high DC output of around **450V**. This discharges between two electrodes in a neon-filled tube, producing a high-intensity flash at a rate of approximately **60 flashes per minute**.

### Strobe Light Safety

- Do not handle the unit for at least **5 minutes** after power is removed
- Never touch a new flash tube with bare hands
- Damage to the eyes may result from looking directly into the high-intensity light

### Rotating Beam Anti-Collision Lights

There are two types:

**Rotating Reflector** — a motor drives a rotating reflector that reflects light from one lamp. Rotation speed is typically **40–45 rpm**, giving a flashing frequency of approximately **80–90 flashes per minute**. Half the reflector is flat, emitting a narrow high-intensity beam; the other half is curved, spreading the beam **30° above and below the horizontal**.

**Rotating Lamp** — two filaments are mounted in tandem, each pivoted on its own axis, one half of each being a reflector. A motor rotates the two lamps through **180°**. Because the lamps are set 180° opposite each other, the effect is of a continuously rotating light beam.

## Wing Illumination Lights

Two wing illumination lights scan the wings and engines in flight for ice detection, and can also illuminate the immediate area on the ground. They are flush mounted on each side of the fuselage, forward of the wing leading edge, above the cabin floor level.

## Emergency Escape Slide and Exit Lighting

Exterior lights illuminate the escape slide areas at entry, service and over-wing exit doors. **Floor proximity lighting** provides visual guidance for cabin evacuation when smoke obscures cabin lighting above four feet; it is positioned on the left-hand side of the aisle with an illuminated arrow spaced every **40 inches** to indicate the direction to the nearest exit.

### Emergency Lighting Operation

The emergency lights (**6V**) are fed from battery packs, normally trickle-charged from the aircraft's main electrical system. A three-position switch on the flight deck controls the system:

| Position | Effect |
|----------|--------|
| **ARMED** | Normal in-flight position. A "NOT ARMED" warning is displayed if the switch is OFF or ON during flight |
| **ON** | Battery packs not charged; 6V lights ON even with main power and normal lights also ON |
| **OFF** | Battery packs charged; 6V lights remain OFF even if main electrical power is lost |

Minimum use should be made of the battery packs (e.g. for testing), since they take up to **20 hours** to recharge.

## Self-Illuminating Signs

Self-illuminating signs may contain **Tritium gas**, which is mildly radioactive. The signs must be handled carefully to avoid breakage; if breakage occurs, the aircraft should be evacuated and all doors left open for maximum ventilation. Disposal is subject to the Radioactive Substances Act 1960 and related legislation, and broken signs should be returned to the manufacturer. Such signs usually have a scrap life of **5 years**, after which they should also be returned to the manufacturer for disposal.

## Interior Lighting

Interior lighting includes dome lights for general cabin illumination, a lightshield providing background lighting for pilots, integral lighting for each instrument and panel, an overhead floodlight for the control stand, floodlights for circuit breaker panels, and dedicated lights for the standby compass and map reading.

**Pillar lighting** uses a miniature centre-contact filament lamp (a "pea lamp"). A single cable carries the supply while a ground tag completes the circuit; an aperture with a filter distributes the light. Pillar lamps can be used singly or in a bridge configuration.

**Wedge lighting** uses two glass wedges: an inner wedge "A" and an outer wedge "B". Light from a lamp enters wedge A; some passes directly to the instrument dial while some is trapped and distributed down the dial. Light escaping into wedge B is reflected down the wedge but is prevented from further escape by **non-reflective black paint**, so the light is retained and illuminates the dial.

The **master caution/failure system** informs the flight crew that a fault annunciator has illuminated on the forward overhead, aft overhead or fire control panels. It illuminates two master caution lights and one of **twelve sections** of the master caution annunciator. Both annunciators have a "Push to Cancel" and a "Push to Recall" function.

The **Passenger Service Unit (PSU)** contains reading lighting, Fasten Seat Belt and No Smoking signs, an attendant call button, air conditioning fans, life vest storage and oxygen mask storage. All passengers have a reading light with a touch-control button; a "Reading Reset" switch on the Attendant Panel breaks the reading light supply for **16 seconds**, after which the lights remain off but are ready for "ON" selection.
        $cnt$,
        16
    ) RETURNING id INTO s16_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 11B.17: Oxygen Systems
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m11_id, 'M11B.17', 'Oxygen Systems',
        $cnt2$
# Oxygen Systems

## General

If an aircraft is designed to fly above altitudes such as **8,000 feet**, a comfortable breathing environment must be maintained for crew and passengers — normally through cabin pressurisation. If pressurisation fails above this altitude, an alternate emergency source of breathable air must be supplied. This is normally by individual oxygen supplies from **gaseous, liquid or chemical** sources. **Civil aircraft use gaseous and chemical types; the military uses liquid.**

Different oxygen delivery methods suit different flight regimes:
- Small, unpressurised aircraft that need oxygen only occasionally use a **continuous flow** system, metering oxygen based on altitude
- Aircraft flying above **18,000 feet** use a **diluter demand** system, which meters oxygen based on altitude and delivers it to the mask only when the user inhales
- Aircraft flying at very high altitude, where outside air pressure is too low to draw oxygen into the lungs by inhalation alone, use **pressure demand** systems, which supply oxygen to the mask under a slight positive pressure

## Oxygen Safety Precautions

Although oxygen is **non-flammable**, it **supports combustion**. If oil, grease, dust or metal particles are present, a spontaneous explosion may occur. Precautions include:

- Keep oil and grease away — oxygen equipment must not be handled with greasy hands or overalls
- Keep oxygen away from fire — a small fire or spark will rapidly grow in an oxygen-enriched atmosphere
- No smoking
- Handle oxygen components carefully
- Don't mix oxygen types
- Always follow manual and charging panel instructions

When charging a gaseous system: no refuelling operations must be in progress, no switching of electrical supplies, adequate warning notices must be displayed, no smoking or naked flames, the aircraft must be earthed, and adequate firefighting equipment must be available.

## System Layout

Crew and passenger gaseous oxygen systems are usually independent of each other except for a common charging point and an over-pressure relief facility. In general, **gaseous oxygen systems serve the cockpit** and **chemically generated oxygen serves the cabin**, though some aircraft use gaseous systems for both.

**Cockpit:** Each crew member has a quick-fitting mask, located inside an easily reached storage box. The mask contains a permanently connected microphone. On some aircraft an inflatable harness allows one-handed fitting: squeezing the box release levers unlocks the doors, the mask is withdrawn, a green "oxygen on" flag appears, and the harness inflates automatically before deflating and tightening once fitted. The storage box has a test lever, a flow indicator that shows a green blinker when the system operates correctly, and a **100% selector button** for pure undiluted oxygen.

**Cabin:** Gaseous systems use a ring main from the storage bottles to the PSUs; chemically generated systems locate an oxygen module (candle) in each PSU. Passenger masks are cup-shaped mouldings with an elasticated strap, sized to fit all occupants from babies to adults, each fitted with a reservoir bag storing an immediate supply of oxygen.

## Continuous Flow Oxygen System

Used mainly for passenger oxygen where oxygen is needed only occasionally; wasteful of oxygen but simple, and installed on most aircraft. Oxygen is carried in a high-pressure bottle, regulated down to around **400 psi** by a pressure-reducing valve, then metered by a pressure regulator to around **70 psi** before delivery to the masks. A pressure relief valve protects against failure of the pressure-reducing valve; if relieved, a **green blow-out disc** on the aircraft skin gives a visual indication, and some aircraft also deploy a **red streamer**.

Continuous flow masks are re-breather type: oxygen flows continuously into a transparent plastic bag held loosely over the mouth and nose; exhaled air fills the bag and is re-breathed, enriched with the oxygen supply, on the next inhalation.

## Demand Type Oxygen System

Cockpit crews of most commercial aircraft are supplied through a **diluter demand** system, which meters oxygen only on inhalation, the amount depending on altitude. At altitudes above **40,000 feet**, outside air pressure is so low that even a pure oxygen supply must be forced into the lungs — this is done by a **pressure demand** regulator, supplying oxygen under a slight positive pressure.

## Portable Oxygen Systems

Portable sets are located around the cabin for cabin crew to check that passengers have fitted their masks, and can also assist breathing in cases of smoke or fumes. **Therapeutic sets** are used for medical purposes, delivering an enriched or 100% oxygen supply to a passenger having difficulty breathing.

## Drop-Out System

Masks in each PSU are released to ensure an adequate oxygen supply. Only masks that are pulled receive flow, minimising waste. Masks drop:
- Automatically when cabin altitude reaches a pre-determined level, usually around **10,000 feet**
- When the aircrew selects oxygen — drop-out may be actuated electrically, pneumatically or mechanically

On **pneumatically operated** PSU flaps, oxygen pressure extends a plunger that overcomes a spring-loaded latch, opening the flap under gravity; pulling the mask withdraws a flow control pin, directing oxygen to the mask.

On **electrically operated** PSU flaps (used with chemical generators, since generated oxygen isn't available until the masks are pulled), a solenoid extends a plunger that operates the latch assembly.

## Sources of Oxygen

Most aircraft use **gaseous oxygen** for the aircrew and **chemically generated oxygen** for passengers, though some aircraft with generators are being converted to gaseous systems due to fire hazard. Gaseous oxygen's main disadvantage is that it is stored at high pressure, reacts explosively with greases and oils, and its storage bottles are heavy. Bottles are made from high-tensile steel or, on modern aircraft, Kevlar-wrapped aluminium alloy, carbon fibre or plastics; they are painted black with a white dome top, or green (USA), and stencilled "Aviation Oxygen" in white letters.

### Chemical Oxygen Generator

An oxygen "candle" is a convenient emergency oxygen source with a long shelf life and light weight; storage capacity is about **three times** that of a gaseous system. Sodium chlorate mixed with iron and a binding material is moulded into a block inside an insulated stainless steel case. Pulling the mask withdraws a safety pin, and a percussion cap or electrical squib igniter starts the sodium chlorate decomposing; the heat of the reaction is then self-sustaining. **There is no way to stop the process once started.** Byproducts are **sodium chloride (salt)** and **ferrous oxide (rust)**.

Oxygen output is proportional to core cross-sectional area and reaction rate, and is greatest during the initial few minutes. Once generation starts, core temperature reaches approximately **450°F**. Normal generator output is **10 psi**, not regulated before breathing; a pressure relief valve relieves pressures above **50 psi**.

### Gaseous Oxygen Systems

Storage cylinders hold gaseous oxygen, their number and capacity depending on the number of crew and passengers. Normal cylinder charge is usually **1,800 psi**, with capacities of **30 to 120 cubic feet**. Cylinders have a manually operated shut-off valve, a direct-reading pressure gauge, and an electrical transducer sending pressure signals to the cockpit.

### Charging and Distribution

Gaseous systems are recharged either "on aircraft" from a portable oxygen trolley, or by removing the bottle for recharging in a dedicated bay. During on-aircraft charging, thermal compensators — sintered bronze elements soldered inside the pipelines — dissipate the heat generated. High-pressure supply pipes are stainless steel or copper-based alloy, colour-coded "breathing oxygen" with a black rectangular symbol on white. Since maximum pressure to the masks is **70 psi**, distribution pipelines beyond the regulator are aluminium alloy or plastic.

## Supply Regulation

The **diluter demand regulator** mixes cabin air with oxygen via an aneroid-capsule-operated metering valve: at low altitude the user gets mostly cabin air, and as altitude increases the proportion of oxygen rises until, at about **34,000 feet**, cabin air is shut off completely and pure oxygen is supplied. A **100% lever position** allows the pilot to select pure oxygen at any altitude; an emergency lever provides continuous flow of pure oxygen if the regulator malfunctions.

**Continuous flow regulators** may be automatic (an aneroid capsule senses altitude and meters oxygen accordingly) or manual (a control valve lets the pilot adjust flow), with a calibrated orifice in the mask outlet determining delivered flow.

## Indications and Warnings

An overpressure relief facility uses a **green rupture disc** at the overboard discharge fitting; if cylinder pressure is exceeded, the safety valve discharges through the line, the disc ruptures, and a red (or yellow) indicator — sometimes with a red streamer — becomes visible. On aircraft with oxygen generators, **dolls' eye indicators** turn from orange (or purple) to black once activated, and some units have heat-sensitive tape that changes colour.

A pressure gauge shows storage bottle pressure with green and red segments; the red segment indicates an empty bottle or a closed shut-off valve. A low-pressure switch gives a **LO PR** indication on the local panel, illuminates an **OXY** caution light on the centralised warning panel, and sounds a single chime.
        $cnt2$,
        17
    ) RETURNING id INTO s17_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 11B.18: Pneumatic and Vacuum Systems
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m11_id, 'M11B.18', 'Pneumatic and Vacuum Systems',
        $cnt3$
# Pneumatic and Vacuum Systems

## General

Pneumatic systems are fluid power systems using a **compressible fluid — air**. They are dependable and lightweight, and because the fluid is air there is **no need for a return system**.

Some aircraft have only a low-pressure pneumatic system to operate gyro instruments; others use compressed air as an emergency backup for lowering the landing gear and operating the brakes if hydraulics fail; other aircraft have a complete pneumatic system actuating landing gear retraction, nose wheel steering, passenger doors and propeller brakes.

## Safety Precautions

When working on bleed air systems:
- Bleed air is **hot** — do not touch pipes and ducts
- Always replace seals (normally crush seals) when replacing joints
- Tighten clamps to the torque figure quoted in the Maintenance Manual
- Never lever against ducts, as dents cause hot spots
- Duct supports and struts must not put strain on the duct

## Full Pneumatic Systems

Advantages of using compressed air over hydraulics or electrics for systems such as landing gear:
- Air is universally available in unlimited supply
- Components are reasonably simple and lightweight
- No return lines are needed, saving weight
- Low fire hazard and slight danger of explosion
- Contamination is minimised by filters

In a typical high-pressure system, air compressors driven from the engine accessory drive discharge compressed air through a bleed valve to a pressure relief (unloading) valve. The bleed valve is held closed by oil pressure; if oil pressure fails, the bleed valve opens to offload the compressor. The pressure relief valve maintains system pressure at around **3,000 psi**. A shuttle valve between the compressor and main system allows the system to be charged from a ground source and isolates the compressor when the engine is not running.

Moisture is removed in stages: a **water separator** collects moisture onto a baffle and drains it overboard, with an electric heater preventing it from freezing; remaining moisture is then removed by a **desiccant (chemical) dryer**; the air is filtered before entering the main system.

Air is then fed to storage bottles providing emergency air for several systems, at maximum system pressure of around **3,000 psi**. A manually operated isolation valve allows maintenance without discharging the bottles. A pressure-reducing valve reduces the air to the operating pressure most components use — around **1,000 psi** — for normal landing gear operation, the passenger door, the propeller brake and nose wheel steering.

## Vacuum Systems

A supply of air at negative pressure may be required for instruments (typically from a small vacuum pump on a piston engine, or a venturi jet pump tapped from a jet engine) or for a **pneumatic de-icing system**, where a negative pressure keeps de-icer boots sucked flat onto the wing leading edge for a smooth aerodynamic surface.

## Low Pressure Pneumatic Systems

These provide air for gyroscopic attitude and direction indicators and for inflating de-icing boots, usually from a **vane-type engine-driven air pump**. On early aircraft such pumps evacuated instrument casings and were called vacuum pumps; on later aircraft, discharge air also inflates de-icing boots, so they are called air pumps.

- **Wet air pumps** — steel vanes lubricated and sealed with engine oil, drawn in through the mounting pad and exhausted with the discharge air; oil is removed by an oil separator before the air is used
- **Dry air pumps** — carbon vanes that are self-lubricating, avoiding the need for an oil separator; the vanes are easily broken by contaminants, so inlet air is filtered

## Air Supply Sources

**Engine Bleed Air** — used on turbojet aircraft; hot air is bled from the engine compressors, passed through a pressure and temperature control system, and mixed with ram air. Two tappings are taken — one from the LP stages and one from the HP stages — to maintain a reasonable pressure band across all engine speeds. At low rpm the LP air is insufficient, so HP air is used; as engine speed increases, LP pressure rises and HP air is shut off at a pre-determined pressure, so in normal flight bleed air comes from the LP stages.

**Compressors or Blowers** — used on some turbojet, turboprop or piston aircraft, driven by an accessory drive, bleed air, or electric/hydraulic motors, controlled by a cockpit-operated shut-off valve. When LP pressure is insufficient at low engine speeds, the valve is opened to drive the turbo compressor; a pressure regulator ensures constant output. On large multi-engine aircraft, only some engines carry a turbo compressor.

**Auxiliary Power Unit (APU)** — an independent source of pressurised air; essentially a small gas turbine engine providing air (and other services) while the aircraft is on the ground with main engines stopped, usually mounted in the tail. On some aircraft the APU can be started in flight as a backup source of air and hydraulic services.

**Ground Supply** — a ground cart, essentially a diesel-engine-driven compressor, regulated to match the aircraft's system pressure and connected via a quick-release hose to the aircraft's service panel.

## Pressure Control

Bleed air pressure may range from about **10 psi at ground idle to 65 psi at take-off power**. A pressure regulator — a pneumatically operated valve — gives a pre-determined output pressure and may also act as the shut-off valve (a "pressure regulating and shut-off valve").

The regulator balances air pressure against spring pressure: with a piston area of 1 sq in held by a 100 lb spring, a piston shoulder of 0.5 sq in acted on by system pressure of **1,500 psi**, and a cone seat of 0.5 sq in acted on by reduced pressure of **200 psi**, a relief valve maintains the piston chamber pressure at **750 psi**. As downstream demand reduces the 200 psi line pressure, the relief valve and piston cone unseat to bleed system pressure into the downline until 200 psi is restored and the system re-balances.

## Distribution

Ducting and pipelines carry bleed air from the engine compressors to the services requiring it. Because bleed air is hot, any duct leak can cause an extreme local temperature rise, risking fire or structural damage, so **leak detection systems** are fitted. Ducts are built in short sections for ease of maintenance, made from thin-wall material and clamped together with joints allowing for thermal expansion. Engine bleed air ducts are usually **stainless steel**, while distribution ducts and pipelines are often **titanium** for its higher temperature tolerance and lighter weight, supported by clamps and tie rods.

### Expansion Joints

Ducting can reach temperatures up to around **350°F**, so expansion devices are needed:
- **Pre-stressed joint** — sections installed slightly short so they expand with heat to fit correctly
- **Flexible ball joint** — a flange and bearing nut allow flexing, misalignment and expansion, sealed with shims and a crush-type metal seal
- **Cable attachment joint** — used where large temperature swings occur; three swaged cables pull the joint together and seal it, with a small gap left for expansion

## Indications and Warnings

- **Overpressure** — usually caused by a malfunctioning high-pressure shut-off valve; a pressure relief valve, sometimes working with a pressure switch, closes the shut-off valve at a pre-determined pressure
- **Overheat** — an electrical temperature sensor downstream of the bleed valve signals the shut-off valve to close if a pre-determined temperature is reached, with an indication on the centralised warning panel
- **Duct Hot Air Leakage** — fire-wire thermistor elements are fitted around hot zones; as temperature rises, resistance decreases until a circuit is made, triggering a warning with caution lights and aural chimes; the leaking duct may be isolated automatically or by the pilot

## System Interfaces

**Pneumatic Gyro Power** — gyro instruments are driven by air striking cups on the wheel periphery, either by **air pump suction** (evacuating the instrument case, drawing filtered air through a nozzle, with a suction relief valve and gauge) or, at high altitude where ambient pressure is too low, by **dry air pump pressure**, with the discharge air evacuated overboard after driving the instruments.

**Backup High-Pressure Pneumatic Systems** — for emergency landing gear extension and braking if hydraulics fail, comprising a pressurised cylinder holding approximately **3,000 psi** of compressed air or nitrogen, with a shuttle valve directing hydraulic fluid for normal operation or the compressed gas for emergency operation.

**Pneumatic De-Icing** — wet air pumps supply the boots; oily air passes through an oil separator (baffle plates draining to the engine oil sump), and clean air flows through a de-icing selector valve to a pressure regulating valve and then a distribution sequencing valve, being directed overboard when the system is switched off.

**Air Conditioning and Pressurisation** — bleed air passes through heat exchangers before mixing with cold air; the hot air also flows across a turbine driving the system compressor. Bleed air similarly drives a compressor (or, on some aircraft, a jet pump) to pressurise cabin air, passing through an intercooler to reduce temperature. Flow control valves often double as shut-off valves in the event of a fault.

**Air-Driven Hydraulic Pumps** — some aircraft use hydraulic pumps driven by air turbines fed with bleed air, flow controlled by a solenoid-operated pressure regulator and shut-off valve, the turbine connected to the pump via a shaft and exhausting to atmosphere.

**Pressurising Hydraulic Reservoirs** — aircraft flying above **20,000 feet** require the hydraulic reservoir to be pressurised to prevent fluid foaming and pump cavitation; bleed air is fed through a regulator/reducing valve, with a pressure relief valve venting excess.

**Pneumatic Stall Warning** — common on light aircraft: a slotted plate at the wing leading edge, positioned at the stagnation point in normal flight, is connected via a tube to a horn. When angle of attack increases toward the stall, low pressure is drawn into the tube, sounding the horn to warn the pilot.
        $cnt3$,
        18
    ) RETURNING id INTO s18_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 11B.19: Water and Waste Systems
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m11_id, 'M11B.19', 'Water and Waste Systems',
        $cnt4$
# Water and Waste Systems

## Water Systems

**Potable water** refers to drinking water, used for drinking, galleys, and hot/cold water at wash basins. A centralised water tank can feed any number of galleys and toilets through a gallery of pipes, speeding servicing turnaround since there is only one main replenishment point. Potable water is **hyper-chlorinated** at set intervals to control bacteria.

The major components of a potable water system are:
- A storage tank
- An air pressure system to force water from the tank to the services
- Distribution lines
- A filling system
- A quantity indication system
- Valves to drain the system

The tank is usually mounted under the cabin floor in a cradle, constructed from fibreglass with metal bonded bands, or stainless steel. Aircraft operating in cold climates may have heater blankets built in to prevent icing. The tank assembly incorporates a drain, filler connection, overflow connection, air pressure connection and outlet pipelines to the galleys and toilets.

### Pressure Control

Air for moving water is normally tapped from the engine compressor or APU bleed air supply. Some aircraft, needing to draw water when no bleed air pressure is available (e.g. on the ramp), have an **electrically powered air compressor** that automatically starts when bleed air pressure drops below a pre-determined value. Where a compressor is fitted, a **riser loop** — with its top higher than the distribution ducting — prevents water siphoning back through the compressor, with a pressure switch controlling the compressor's starting and stopping.

### Water Distribution

A main distribution line runs from the tank to the cabin ceiling, with individual pipelines to the toilets and galleys, usually flexible hoses in an aluminium sheath, insulated against freezing. The outer sheath prevents leakage entering the cabin — any leak is directed to the lower fuselage and drained overboard. Quick-release connections above each toilet and galley allow disconnection for unit removal. On smaller aircraft, the tank may be located above the wash basin/galley areas and supply water by gravity.

### Water Heating

A small-capacity heater is fitted in the supply piping under each lavatory sink, with electrical elements, a warning light, a control switch, an overheat reset switch and a pressure relief valve. A switch controller regulates water temperature to around **125°F**. If the temperature reaches **190°F**, the overheat switch trips, switching off power to the heater and extinguishing the power light; after cooling, the heater must be **manually reset**. A pressure relief valve relieves pressures above around **140 psi**, primarily to relieve pressure caused by overheating.

### Waste Water Collection and Quantity Indication

Wash basin water may drain directly overboard or into a soil tank used to flush the toilet system. Overboard drainage is through electrically heated **drain masts** (to prevent freezing), with the aircraft's forward motion finely atomising the water as it leaves; the heater can be checked on the ground by carefully feeling for warmth by hand.

Tank contents may be indicated by a simple sight gauge, by a remote sensor feeding gauges on the attendants' panel and water service panel from the same float/transmitter, or by a series of lights controlled by magnetic floats inside the tank.

### Water Service Panel

Normally found on the lower fuselage for easy access by maintenance crew, the panel typically contains a filling point, a drain/overflow point, quantity indication (lights or gauge) and an external air connection, allowing water movement from a ground air source when no internal air pressure is available. The quantity indicator allows the tank to be filled to a **less-than-full** quantity, trading the weight of unused water against fuel on short flight legs.

## Waste Systems

Aircraft toilets must be maintained and serviced carefully to protect passenger comfort and health, and kept clean and odour-free. There are three main types, the choice depending on passenger numbers and aircraft age:

| Type | Description |
|------|--------------|
| **Removable ("Elsan")** | A simple storage bin with a toilet seat, partly filled with chemical deodorant; removed, emptied at an approved site, replenished and refitted with quick-release fittings; found only on short-range light aircraft |
| **Liquid Flush** | The most common type on passenger aircraft; a self-contained, quick-release unit with the waste tank directly beneath the bowl and a service panel below |
| **Vacuum** | Dry toilet modules connected by pipelines to a central storage tank, emptied using a vacuum |

### Liquid Flush Toilets

Components typically include a motor and pump, filter, drain valve, rinse ring, flush line and air vent. The bowl is stainless steel; the tank is stainless steel or fibreglass laminate. A typical tank capacity is **20 gallons (90 litres)**, of which **3 gallons (13.5 litres)** is a pre-charge of chemical (disinfectant, dye and deodorant) — sufficient for about **100 uses** before recharging is needed.

When the flush button is pressed, the motor runs for a fixed cycle of around **10 seconds**, pumping fluid through a bowl spray pipe in a swirling action that flushes the bowl contents into the tank via a lightly sprung hinged separator. At the end of the cycle the motor re-arms to run briefly in reverse, to keep the filter from becoming blocked with solid waste.

### Vacuum Toilets

Vacuum toilets overcome the **corrosion risk** and lengthy **drain/replenish time** associated with individual liquid flush units. A negative pressure inside the waste container (tank) draws waste and flushing water from the bowl into a central collector tank; larger aircraft may use more than one tank. The tank is connected to the outside of the aircraft, so as aircraft speed increases, pressure at the connection drops, drawing waste to the tank. At low speed or low altitude, where the pressure differential is insufficient, a small **vacuum generator** pump, controlled by a pressure switch, provides the pressure drop; its normal operating range is from sea level up to **16,000 feet**.

**Emptying:** After landing, waste tanks are usually emptied by specialist sub-contracted companies, using either the **gravity method** (operating a shut-off valve after connecting the emptying hose) or the **suction method** (requiring correctly configured emptying equipment and aircraft ducting cleared for suction use — using suction equipment on gravity-only ducting will cause severe damage).

### Corrosion Control

Many toilet chemicals have a severe effect on aluminium alloy aircraft structure. All spillages must be neutralised and cleaned off promptly, and affected areas — the toilet floor and beneath it, around the collector tank(s), the draining/filling panel and elsewhere corrosive fumes might reach — must be inspected regularly. Some toilet units are enclosed in an anti-corrosion tank connected to the drain lines to self-contain any leaks; toilet floors may be made from composite materials to reduce corrosion risk, and all service panel connections are sealed when the panel is closed.
        $cnt4$,
        19
    ) RETURNING id INTO s19_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M11B.16 Aircraft Lights (13 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s16_id, 'Anti-collision (strobe) lights on the top and bottom of the fuselage are fitted for what purpose, and behind what colour lens?',
     '[{"id":"a","text":"They are attention-getters warning of the aircraft''s presence and position, covered by a red lens","correct":true},{"id":"b","text":"They illuminate the wings for ice inspection, and have no coloured lens","correct":false},{"id":"c","text":"They provide taxi illumination, covered by a green lens","correct":false}]',
     '{"B1"}'),

    (s16_id, 'On the Boeing 737, how many landing lights are fitted, and of what types?',
     '[{"id":"a","text":"4 total: 2 fixed on the wing leading edges and 2 retractable in the outboard flap track fairing","correct":true},{"id":"b","text":"2 total: both fixed, mounted on the nose gear","correct":false},{"id":"c","text":"6 total: all retractable, mounted in the wing root","correct":false}]',
     '{"B1"}'),

    (s16_id, 'A retracting landing light is extended by an actuator via a slipping clutch or shear links. What is the purpose of this arrangement?',
     '[{"id":"a","text":"To increase the light''s beam intensity at high speed","correct":false},{"id":"b","text":"To ensure the lamp retracts even if it fails to do so normally at high speed, for whatever reason","correct":true},{"id":"c","text":"To allow the lamp to rotate and track the aircraft''s ground track","correct":false}]',
     '{"B1"}'),

    (s16_id, 'The strobe (anti-collision) light works on the principle of a capacitor-discharge flash tube. What voltage does the capacitor convert the input supply to?',
     '[{"id":"a","text":"A high DC output of around 450V","correct":true},{"id":"b","text":"A low DC output of around 12V","correct":false},{"id":"c","text":"A high AC output of around 1000V","correct":false}]',
     '{"B1"}'),

    (s16_id, 'A strobe anti-collision light produces a high-intensity flash at a rate of approximately:',
     '[{"id":"a","text":"6 flashes per minute","correct":false},{"id":"b","text":"60 flashes per minute","correct":true},{"id":"c","text":"600 flashes per minute","correct":false}]',
     '{"B1"}'),

    (s16_id, 'What is the minimum time a technician should wait before handling a strobe light unit after power has been removed?',
     '[{"id":"a","text":"5 minutes","correct":true},{"id":"b","text":"30 seconds","correct":false},{"id":"c","text":"1 hour","correct":false}]',
     '{"B1"}'),

    (s16_id, 'In a rotating reflector type anti-collision light, the reflector is half flat and half curved. What is the purpose of the curved half?',
     '[{"id":"a","text":"To increase the narrow beam intensity further","correct":false},{"id":"b","text":"To increase the vertical spread of the light beam to 30° above and below the horizontal","correct":true},{"id":"c","text":"To reduce the rotation speed of the motor","correct":false}]',
     '{"B1"}'),

    (s16_id, 'A rotating lamp type anti-collision light uses two filaments mounted in tandem. How is the effect of a continuously rotating beam achieved?',
     '[{"id":"a","text":"A motor rotates the two lamps through 180°, and since they are set 180° opposite each other, the effect is continuous rotation","correct":true},{"id":"b","text":"Both filaments flash simultaneously at a fixed position","correct":false},{"id":"c","text":"The lamps are stationary and only the lens rotates","correct":false}]',
     '{"B1"}'),

    (s16_id, 'In wedge type instrument lighting, what prevents light from escaping further once it has entered the outer wedge "B"?',
     '[{"id":"a","text":"A polished chrome reflector","correct":false},{"id":"b","text":"Non-reflective black paint","correct":true},{"id":"c","text":"A second lamp mounted behind wedge B","correct":false}]',
     '{"B1"}'),

    (s16_id, 'The master caution/failure system illuminates two master caution lights and one of how many sections of the master caution annunciator?',
     '[{"id":"a","text":"Four sections","correct":false},{"id":"b","text":"Twelve sections","correct":true},{"id":"c","text":"Twenty sections","correct":false}]',
     '{"B1"}'),

    (s16_id, 'Operating the "Reading Reset" switch on the Attendant Panel breaks the passenger reading light supply for how long?',
     '[{"id":"a","text":"16 seconds","correct":true},{"id":"b","text":"60 seconds","correct":false},{"id":"c","text":"5 minutes","correct":false}]',
     '{"B1"}'),

    (s16_id, 'What is the normal in-flight position of the emergency lighting selector switch, and what warning is given if it is not in that position?',
     '[{"id":"a","text":"ARMED is normal; a ''NOT ARMED'' warning displays if the switch is OFF or ON during flight","correct":true},{"id":"b","text":"OFF is normal; a ''BATTERY LOW'' warning displays if the switch is ARMED or ON","correct":false},{"id":"c","text":"ON is normal; no warning is provided for other positions","correct":false}]',
     '{"B1"}'),

    (s16_id, 'Self-illuminating signs may contain a gas that is mildly radioactive. What is this gas, and what is the typical scrap life of such signs?',
     '[{"id":"a","text":"Helium; scrap life of 10 years","correct":false},{"id":"b","text":"Tritium; scrap life of 5 years","correct":true},{"id":"c","text":"Argon; scrap life of 1 year","correct":false}]',
     '{"B1"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M11B.17 Oxygen Systems (13 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s17_id, 'If cabin pressurisation fails above the altitude at which it is required, what must be provided as an emergency measure?',
     '[{"id":"a","text":"An alternate emergency source of breathable air, normally from individual gaseous, liquid or chemical oxygen supplies","correct":true},{"id":"b","text":"An immediate descent below 1,000 feet before any other action","correct":false},{"id":"c","text":"Activation of the fuel dump system","correct":false}]',
     '{"B1"}'),

    (s17_id, 'Which type of oxygen source is used by civil aircraft, and which is used by the military?',
     '[{"id":"a","text":"Civil aircraft use gaseous and chemical types; the military uses liquid oxygen","correct":true},{"id":"b","text":"Civil aircraft use liquid oxygen only; the military uses gaseous only","correct":false},{"id":"c","text":"Both civil and military aircraft exclusively use chemical oxygen generators","correct":false}]',
     '{"B1"}'),

    (s17_id, 'A diluter demand oxygen system is typically used on aircraft flying above approximately what altitude, and what does it do?',
     '[{"id":"a","text":"18,000 feet; it meters oxygen based on altitude and delivers it to the mask only when the user inhales","correct":true},{"id":"b","text":"1,800 feet; it provides a constant continuous flow of oxygen regardless of altitude","correct":false},{"id":"c","text":"8,000 feet; it shuts off automatically above this altitude","correct":false}]',
     '{"B1"}'),

    (s17_id, 'At altitudes above approximately 40,000 feet, why is a pressure demand oxygen regulator needed?',
     '[{"id":"a","text":"Outside air pressure is so low that even pure oxygen must be forced into the lungs under a slight positive pressure","correct":true},{"id":"b","text":"The cabin temperature is too high for a diluter demand regulator to function","correct":false},{"id":"c","text":"Gaseous oxygen bottles cannot be pressurised above this altitude","correct":false}]',
     '{"B1"}'),

    (s17_id, 'Regarding the fire/explosion hazard of oxygen, which statement is correct?',
     '[{"id":"a","text":"Oxygen is non-flammable but supports combustion, and can cause a spontaneous explosion if oil, grease, dust or metal particles are present","correct":true},{"id":"b","text":"Oxygen is highly flammable and will ignite spontaneously on contact with air","correct":false},{"id":"c","text":"Oxygen presents no fire hazard under any circumstances","correct":false}]',
     '{"B1"}'),

    (s17_id, 'In a continuous flow oxygen system, high-pressure bottle oxygen is progressively reduced through the system. What are the approximate intermediate and final delivery pressures?',
     '[{"id":"a","text":"Reduced to around 400 psi by a pressure-reducing valve, then metered to around 70 psi before delivery to the masks","correct":true},{"id":"b","text":"Reduced to around 4,000 psi, then metered to 700 psi at the mask","correct":false},{"id":"c","text":"Reduced to around 40 psi, then metered to 7 psi at the mask","correct":false}]',
     '{"B1"}'),

    (s17_id, 'Under what conditions do passenger oxygen masks in a drop-out system deploy?',
     '[{"id":"a","text":"Only when manually deployed by the flight crew after landing","correct":false},{"id":"b","text":"Automatically when cabin altitude reaches a pre-determined level (usually around 10,000 feet), or when the aircrew selects oxygen","correct":true},{"id":"c","text":"Continuously throughout every flight above sea level","correct":false}]',
     '{"B1"}'),

    (s17_id, 'How is a chemical oxygen generator (candle) initiated, and can the reaction be stopped once started?',
     '[{"id":"a","text":"Pulling the mask withdraws a safety pin and a percussion cap or electrical squib starts the reaction; there is no way to stop it once started","correct":true},{"id":"b","text":"A cockpit switch starts the reaction, which can be stopped at any time by the same switch","correct":false},{"id":"c","text":"It ignites automatically at a pre-set cabin altitude and self-extinguishes after 30 seconds","correct":false}]',
     '{"B1"}'),

    (s17_id, 'Besides oxygen, what are the byproducts of the chemical reaction in an oxygen generator?',
     '[{"id":"a","text":"Carbon dioxide and water vapour","correct":false},{"id":"b","text":"Sodium chloride (salt) and ferrous oxide (rust)","correct":true},{"id":"c","text":"Nitrogen and hydrogen peroxide","correct":false}]',
     '{"B1"}'),

    (s17_id, 'Once a chemical oxygen generator has started producing oxygen, approximately what core temperature is reached, and at what pressure is a relief valve set to operate?',
     '[{"id":"a","text":"Approximately 450°F core temperature; relief valve operates above 50 psi","correct":true},{"id":"b","text":"Approximately 45°F core temperature; relief valve operates above 5 psi","correct":false},{"id":"c","text":"Approximately 4,500°F core temperature; relief valve operates above 500 psi","correct":false}]',
     '{"B1"}'),

    (s17_id, 'What is the normal charge pressure and capacity range of a gaseous oxygen storage cylinder?',
     '[{"id":"a","text":"Normal charge around 1,800 psi, capacity 30 to 120 cubic feet","correct":true},{"id":"b","text":"Normal charge around 180 psi, capacity 3 to 12 cubic feet","correct":false},{"id":"c","text":"Normal charge around 18,000 psi, capacity 300 to 1,200 cubic feet","correct":false}]',
     '{"B1"}'),

    (s17_id, 'In a diluter demand regulator, at approximately what altitude is cabin air shut off completely so that only pure oxygen is delivered?',
     '[{"id":"a","text":"About 8,000 feet","correct":false},{"id":"b","text":"About 18,000 feet","correct":false},{"id":"c","text":"About 34,000 feet","correct":true}]',
     '{"B1"}'),

    (s17_id, 'What indications are given to the crew if oxygen system pressure falls below a pre-set value, as sensed by a low-pressure switch?',
     '[{"id":"a","text":"A ''LO PR'' indication on the local panel, an OXY caution light on the CWP, and a single chime warning","correct":true},{"id":"b","text":"Only a silent visual flag with no audible warning","correct":false},{"id":"c","text":"Automatic shutdown of the cabin pressurisation system","correct":false}]',
     '{"B1"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M11B.18 Pneumatic and Vacuum Systems (13 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s18_id, 'Pneumatic systems are fluid power systems using a compressible fluid, air. What is a key advantage of this over hydraulic systems?',
     '[{"id":"a","text":"Because the fluid is air, there is no need for a return system","correct":true},{"id":"b","text":"Air-based systems require no filtration at all","correct":false},{"id":"c","text":"Air-based systems can only operate at ground level","correct":false}]',
     '{"B1"}'),

    (s18_id, 'Which of the following is NOT listed as an advantage of using compressed air for systems such as landing gear operation?',
     '[{"id":"a","text":"Air is universally available in unlimited supply","correct":false},{"id":"b","text":"No return lines are needed, saving weight","correct":false},{"id":"c","text":"Pneumatic systems provide greater precision of control than hydraulic systems","correct":true}]',
     '{"B1"}'),

    (s18_id, 'In a typical high-pressure pneumatic system, the pressure relief (unloading) valve maintains system pressure at around what value, and what happens to the bleed valve if oil pressure fails?',
     '[{"id":"a","text":"Around 3,000 psi; the bleed valve opens to offload the compressor","correct":true},{"id":"b","text":"Around 300 psi; the bleed valve closes fully and locks the compressor","correct":false},{"id":"c","text":"Around 30,000 psi; the bleed valve has no relationship to oil pressure","correct":false}]',
     '{"B1"}'),

    (s18_id, 'What is the correct sequence for removing moisture from air in a typical pneumatic system, before the air enters the main system?',
     '[{"id":"a","text":"Filter, then water separator, then desiccant dryer","correct":false},{"id":"b","text":"Water separator, then desiccant (chemical) dryer, then filter","correct":true},{"id":"c","text":"Desiccant dryer only, with no separator or filter required","correct":false}]',
     '{"B1"}'),

    (s18_id, 'Storage bottles in a pneumatic system hold air at maximum system pressure of around 3,000 psi. To what approximate pressure is this reduced for most services, such as normal landing gear operation and nose wheel steering?',
     '[{"id":"a","text":"Around 1,000 psi","correct":true},{"id":"b","text":"Around 100 psi","correct":false},{"id":"c","text":"Around 10,000 psi","correct":false}]',
     '{"B1"}'),

    (s18_id, 'A supply of air at negative pressure for instruments can be obtained from which two sources?',
     '[{"id":"a","text":"A small vacuum pump on a piston engine, or a venturi jet pump tapped from a jet engine","correct":true},{"id":"b","text":"Only from a dedicated electric turbine compressor","correct":false},{"id":"c","text":"Only from cabin pressurisation outflow valves","correct":false}]',
     '{"B1"}'),

    (s18_id, 'What is the key difference between wet air pumps and dry air pumps?',
     '[{"id":"a","text":"Wet pumps use oil-lubricated steel vanes requiring an oil separator; dry pumps use self-lubricating carbon vanes that need no oil separator but are more easily damaged by contaminants","correct":true},{"id":"b","text":"Wet pumps are used only for de-icing; dry pumps are used only for gyro instruments","correct":false},{"id":"c","text":"There is no functional difference between the two types","correct":false}]',
     '{"B1"}'),

    (s18_id, 'In a two-stage engine bleed air system with LP and HP tappings, when is HP air used?',
     '[{"id":"a","text":"At low engine rpm, when LP air pressure is insufficient; in normal flight, bleed air comes from the LP stages","correct":true},{"id":"b","text":"Only at maximum engine speed, with LP air used exclusively at idle","correct":false},{"id":"c","text":"HP air is never used; only LP air is tapped at any engine speed","correct":false}]',
     '{"B1"}'),

    (s18_id, 'What is the Auxiliary Power Unit (APU), and what role can it play in flight on some aircraft?',
     '[{"id":"a","text":"A small gas turbine engine that provides pressurised air on the ground with main engines stopped, and can be started in flight as a backup air/hydraulics source on some aircraft","correct":true},{"id":"b","text":"A ground-only diesel compressor that cannot be started while airborne","correct":false},{"id":"c","text":"A backup fuel pump used only during engine start","correct":false}]',
     '{"B1"}'),

    (s18_id, 'In many bleed air systems, over what approximate pressure range might pressure vary between ground idle and take-off power?',
     '[{"id":"a","text":"From about 10 psi at ground idle to 65 psi at take-off power","correct":true},{"id":"b","text":"From about 1,000 psi at ground idle to 6,500 psi at take-off power","correct":false},{"id":"c","text":"A constant 50 psi regardless of engine speed","correct":false}]',
     '{"B1"}'),

    (s18_id, 'What causes an overheat condition in a bleed air system to be detected, and what action follows?',
     '[{"id":"a","text":"An electrical temperature sensor downstream of the bleed valve signals the high pressure shut-off valve to close, with an indication on the CWP","correct":true},{"id":"b","text":"A mechanical thermostat physically vents the duct to atmosphere with no crew indication","correct":false},{"id":"c","text":"Overheat can only be detected after the flight, during ground inspection","correct":false}]',
     '{"B1"}'),

    (s18_id, 'A backup high-pressure pneumatic system for emergency landing gear extension and braking typically stores compressed air or nitrogen at approximately what pressure?',
     '[{"id":"a","text":"Approximately 300 psi","correct":false},{"id":"b","text":"Approximately 3,000 psi","correct":true},{"id":"c","text":"Approximately 30,000 psi","correct":false}]',
     '{"B1"}'),

    (s18_id, 'How does a pneumatic stall warning system, common on light aircraft, warn the pilot of an impending stall?',
     '[{"id":"a","text":"A slotted plate at the wing leading edge stagnation point is connected via a tube to a horn; as angle of attack increases toward the stall, low pressure is drawn into the tube and sounds the horn","correct":true},{"id":"b","text":"A pressure switch on the landing gear triggers an aural warning independent of angle of attack","correct":false},{"id":"c","text":"An electrical strain gauge on the wing spar measures bending loads and sounds a warning","correct":false}]',
     '{"B1"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M11B.19 Water and Waste Systems (13 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s19_id, 'What is potable water treated with, and why?',
     '[{"id":"a","text":"It is hyper-chlorinated at set intervals to control bacteria","correct":true},{"id":"b","text":"It is de-ionised continuously to reduce corrosion of the tank","correct":false},{"id":"c","text":"It is filtered through activated carbon only, with no chemical treatment","correct":false}]',
     '{"B1"}'),

    (s19_id, 'Which of the following is one of the major components of a potable water system?',
     '[{"id":"a","text":"A hydraulic accumulator","correct":false},{"id":"b","text":"An air pressure system to force water from the storage tank to the services","correct":true},{"id":"c","text":"A turbo compressor for cabin pressurisation","correct":false}]',
     '{"B1"}'),

    (s19_id, 'What materials is the potable water storage tank typically constructed from, and what feature helps prevent icing in cold climates?',
     '[{"id":"a","text":"Fibreglass with metal bonded bands, or stainless steel; heater blankets may be built into the tank design","correct":true},{"id":"b","text":"Untreated mild steel only, with no anti-icing provision","correct":false},{"id":"c","text":"Solid titanium, cooled by ram air to prevent bacterial growth","correct":false}]',
     '{"B1"}'),

    (s19_id, 'On aircraft with an electrically powered air compressor for moving water, when does the compressor automatically start?',
     '[{"id":"a","text":"When bleed air pressure drops below a pre-determined value","correct":true},{"id":"b","text":"Continuously, whenever the aircraft is on the ground","correct":false},{"id":"c","text":"Only when the cabin altitude exceeds 10,000 feet","correct":false}]',
     '{"B1"}'),

    (s19_id, 'What is the function of the riser loop fitted where a water system uses an electric compressor?',
     '[{"id":"a","text":"It prevents water from siphoning back through the compressor","correct":true},{"id":"b","text":"It increases the flow rate of water to the galleys","correct":false},{"id":"c","text":"It filters particulates out of the potable water supply","correct":false}]',
     '{"B1"}'),

    (s19_id, 'A lavatory sink water heater is regulated to around what normal temperature, and at what temperature does the overheat switch trip, requiring a manual reset?',
     '[{"id":"a","text":"Regulated to around 125°F; overheat switch trips at 190°F","correct":true},{"id":"b","text":"Regulated to around 32°F; overheat switch trips at 100°F","correct":false},{"id":"c","text":"Regulated to around 212°F; overheat switch trips at 250°F","correct":false}]',
     '{"B1"}'),

    (s19_id, 'Why are drain masts under the fuselage normally electrically heated, and what ensures the water is atomised as it leaves the aircraft?',
     '[{"id":"a","text":"Heating prevents freezing, and the aircraft''s forward motion finely atomises the water as it leaves","correct":true},{"id":"b","text":"Heating sterilises the waste water, and gravity alone atomises it","correct":false},{"id":"c","text":"Heating is only for de-icing the fuselage skin nearby, unrelated to the water itself","correct":false}]',
     '{"B1"}'),

    (s19_id, 'What is one purpose of the quantity indication system on the water service panel, in terms of aircraft weight?',
     '[{"id":"a","text":"It allows the tank to be filled to a less-than-full quantity, trading the weight of unused water against fuel on short flight legs","correct":true},{"id":"b","text":"It has no relation to aircraft weight and only shows a full/empty status","correct":false},{"id":"c","text":"It automatically jettisons excess water in flight to reduce weight","correct":false}]',
     '{"B1"}'),

    (s19_id, 'What are the three main types of toilet fitted to aircraft?',
     '[{"id":"a","text":"Removable (''Elsan''), liquid flush, and vacuum","correct":true},{"id":"b","text":"Chemical, mechanical, and pneumatic","correct":false},{"id":"c","text":"Gravity, electric, and hydraulic","correct":false}]',
     '{"B1"}'),

    (s19_id, 'For a typical liquid flush toilet with a tank capacity of 20 gallons (90 litres), approximately what proportion is a pre-charge of chemical, and how many uses does this support?',
     '[{"id":"a","text":"About 3 gallons (13.5 litres) of chemical, sufficient for about 100 uses","correct":true},{"id":"b","text":"About 15 gallons (68 litres) of chemical, sufficient for about 10 uses","correct":false},{"id":"c","text":"No chemical pre-charge is used in liquid flush toilets","correct":false}]',
     '{"B1"}'),

    (s19_id, 'What two problems associated with liquid flush toilets does a vacuum toilet system overcome?',
     '[{"id":"a","text":"The corrosion risk and the time taken to drain and replenish each individual toilet","correct":true},{"id":"b","text":"Excessive water usage and cabin noise","correct":false},{"id":"c","text":"High electrical power consumption and weight","correct":false}]',
     '{"B1"}'),

    (s19_id, 'A vacuum toilet system''s tank is connected to the outside of the aircraft so that increasing aircraft speed draws waste into the tank. What is the normal operating range of the backup vacuum generator pump, used at low speed or altitude?',
     '[{"id":"a","text":"From sea level up to 16,000 feet","correct":true},{"id":"b","text":"From sea level up to 1,600 feet","correct":false},{"id":"c","text":"Only above 35,000 feet","correct":false}]',
     '{"B1"}'),

    (s19_id, 'Why is it important that a waste tank is only emptied by the method (gravity or suction) that its ducting is designed for?',
     '[{"id":"a","text":"Using suction emptying equipment on ducting that is only cleared for gravity emptying will cause severe damage to the toilet equipment","correct":true},{"id":"b","text":"There is no difference in outcome between the two methods, provided the correct vehicle is used","correct":false},{"id":"c","text":"Gravity emptying always contaminates the potable water supply if used incorrectly","correct":false}]',
     '{"B1"}');

END $$;
