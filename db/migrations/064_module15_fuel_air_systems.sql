-- Module 15: Gas Turbine Engine (B1) — Fuel Systems, Air Systems
-- Source: EASA Part-66 Module 15 official textbook (Gas Turbine Engine, Sub-Modules 11 and 12)

DO $$
DECLARE
    m15_id INT;
    s11_id INT;
    s12_id INT;
BEGIN
    SELECT id INTO m15_id FROM easa_modules WHERE code = 'M15';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M15.11') THEN
        RAISE NOTICE 'M15.11-M15.12 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 15.11: Fuel Systems
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m15_id, 'M15.11', 'Fuel Systems',
        $cnt$
# Fuel Systems

## General Requirements

The fuel system is one of the more complex aspects of the gas turbine engine. It must be possible to increase or decrease power at will to obtain the thrust required for any operating condition. In turbine-powered aircraft, this control is provided by varying the flow of fuel to the combustion chambers (some turboprop aircraft also use variable-pitch propellers, so thrust selection is shared between fuel flow and propeller blade angle).

The quantity of fuel supplied must be adjusted automatically to correct for changes in ambient temperature or pressure:

- If fuel quantity becomes **excessive** relative to mass airflow, the turbine blade limiting temperature can be exceeded, or **compressor stall** and **rich blowout** can occur. Rich blowout happens when the oxygen in the air supply is insufficient to support combustion and the mixture is cooled below combustion temperature by the excess fuel.
- If fuel quantity is reduced too far relative to air quantity, the opposite extreme — **lean flame-out** — occurs.

The engine must operate through acceleration and deceleration without fuel-control-related problems. The fuel system must also deliver fuel in the right condition (atomized/vaporized by the fuel nozzles) for satisfactory combustion, and must support easy starting both on the ground and in the air.

During a rapid acceleration, energy must be furnished to the turbine in excess of that needed to maintain a constant rpm; however, if fuel flow increases too rapidly, an over-rich mixture can result, with the possibility of rich blowout or compressor stall.

## Turbine Fuel Controls

Turbofan, turbojet, turboshaft and turboprop engines are equipped with a fuel control unit that automatically satisfies engine requirements. Gas turbine engine fuel controls fall into three basic groups:

| Group | Description |
|-------|-------------|
| **Hydromechanical** | No electronic interface; computing and metering are purely mechanical/hydraulic |
| **Hydromechanical/Electronic** | A hybrid — can function solely as a hydromechanical control, but in dual mode inputs/outputs are electronic and fuel flow is set by servo motors |
| **Full Authority Digital Engine (Electronics) Control (FADEC)** | Uses electronic sensors for inputs and controls fuel flow with electronic outputs; gives the electronic controller (computer) complete control |

Regardless of type, all fuel controls perform the same function: scheduling fuel flow to match the power required by the pilot. The fuel control can sense inputs such as power lever position, engine rpm for each spool, compressor inlet pressure and temperature, burner pressure, compressor discharge pressure, and other parameters as needed by the specific engine. Most turbine fuel controls are moving toward the FADEC type, which is very accurate in scheduling fuel by sensing many engine parameters.

## Hydromechanical Fuel Controls

Hydromechanical fuel controls were used, and are still used on many engines, but their use is becoming limited, giving way to electronic-based controls. Fuel controls have two sections — **computing** and **metering** — to provide correct fuel flow for the engine. A pure hydromechanical fuel control has no electronic interface assisting computing or metering, and is generally driven by the gas generator gear train of the engine to sense engine speed. Other mechanical parameters sensed include compressor discharge pressure, burner pressure, exhaust temperature, and inlet air temperature and pressure. Once the computing section determines the correct fuel flow, the metering section — through cams and servo valves — delivers fuel to the engine fuel system.

Fuel metering with a hydromechanical control is not as accurate as with an electronic interface. Early electronic controls used a hydromechanical control with an electronic system added to fine-tune fuel metering; this arrangement also used the hydromechanical system as a backup if the electronic system failed.

## Hydromechanical/Electronic Fuel Control

The basic function of the engine fuel system is to pressurize the fuel, meter fuel flow, and deliver atomized fuel to the combustion section. Fuel flow is controlled by a hydromechanical fuel control assembly containing a **fuel shutoff section** and a **fuel metering section**. This fuel control unit is sometimes mounted on the vane fuel pump assembly; it provides the power lever connection, the fuel shutoff function, and mechanical overspeed protection for the gas generator spool during normal (automatic mode) operation.

Key components and functions of a typical system:

- **Vane fuel pump assembly** — a fixed displacement fuel pump providing high-pressure fuel to the engine fuel control system.
- **Filter bypass valve** — allows fuel to bypass the fuel filter when the pressure drop across it is excessive; an integral differential pressure indicator visually flags the condition before bypassing occurs by extending a pin from the fuel filter bowl.
- **Hydromechanical fuel control assembly** — provides the fuel metering function of the electronic fuel control unit (EFCU). Fuel is supplied through a **200-micron** inlet filter screen and is metered by a servo-operated metering valve — a **fuel flow/compressor discharge pressure (Wf/P3) ratio device** that positions the metering valve in response to compressor discharge pressure (P3). Fuel pressure differential across the servo valve is maintained by a servo-operated bypass valve responding to EFCU commands.
- **Flow divider and drain valve assembly** — proportions fuel to the engine's primary and secondary fuel nozzles, drains the nozzles/manifolds at shutdown, and incorporates a solenoid for modifying fuel flow for cold starts. During start, the flow divider directs all flow through the primary nozzles; as fuel demand increases after start, the divider valve opens to allow secondary nozzles to function. A **74-micron, self-bypassing screen** located under the fuel inlet fitting provides last-chance filtration before the nozzles.
- **Fuel manifold assembly** — a matched set of primary and secondary manifolds and the fuel nozzle assemblies; twelve fuel nozzles direct primary and secondary fuel to cause the fuel to swirl and form a finely atomized spray.

The **manual mode solenoid valve** is energized in automatic mode, restricting the mechanical speed governor to a single overspeed setting above the electronically-controlled speed range. De-energizing it enables the mechanical speed governor to act as an all-speed governor in response to power lever angle (PLA).

The fuel control system includes a low-power-sensitive **torque motor** that may be activated (in automatic/EFCU mode) to increase or decrease fuel flow. It provides electromechanical conversion of an electrical signal from the EFCU. In **manual mode**, torque motor current is zero, establishing a fixed Wf/P3 ratio — set so the engine operates surge-free and is capable of producing a minimum of **90 percent thrust up to 30,000 feet** (for the example system).

All speed governing of the high-pressure spool (gas generator) is achieved by the **flyweight governor**, which modulates a pneumatic servo consistent with the speed set point determined by PLA. The pneumatic servo governs gas generator speed by bleeding down the P3 pressure acting on the metering valve servo. The **P3 limiter valve** bleeds down P3 acting on the metering valve servo when engine structural limits are encountered in either control mode. The **start fuel enrichment solenoid valve** provides additional fuel flow in parallel with the metering valve for cold starting or altitude restarts; it is energized by the EFCU when enrichment is required and always de-energized in manual mode to prevent high-altitude sub-idle operation.

Downstream of the metering valve are the **manual shutoff valve** (a rotary unit connected to the power lever, allowing the pilot to direct fuel manually) and the **pressurizing valve**, which acts as a discharge restrictor maintaining minimum operating pressures and provides a positive leak-tight fuel shutoff to the nozzles when the manual valve is closed.

The **EEC system** consists of the hydromechanical fuel control, the EFCU, and an aircraft-mounted power lever angle (PLA) potentiometer. Aircraft-generated control signals include inlet pressure, airstream differential pressure, and inlet temperature, plus pilot selection of manual or auto mode. Engine-generated control signals include fan spool speed, gas generator spool speed, inner turbine temperature, fan discharge temperature, and compressor discharge pressure. The PLA potentiometer, mounted in the throttle quadrant, transmits an electrical signal representing thrust demand to the EFCU; if a power change is required, the EFCU commands the torque motor to modulate differential pressure at the head sensor, moving the metering valve and varying fuel flow accordingly. The EFCU is remotely located and airframe mounted, interfaced through a branched wiring harness assembly.

## FADEC Fuel Control Systems

A **Full Authority Digital Electronic Control (FADEC)** has been developed to control fuel flow on most new turbine engine models. **A true FADEC system has no hydromechanical fuel control backup system.** It uses electronic sensors that feed engine parameter information into the electronic engine control (EEC). The EEC — the computing section — determines the required fuel flow and transmits it to a fuel metering valve, which simply reacts to the EEC's commands. FADEC systems are used on many turbine engines, from APUs to the largest propulsion engines.

### FADEC for an Auxiliary Power Unit

An example APU system uses the aircraft fuel system to supply fuel to the fuel control; an electric boost pump may supply pressurized fuel. Fuel usually passes through an aircraft shutoff valve tied to the fire detecting/extinguishing system, and may pass through an aircraft in-line fuel filter. Fuel entering the fuel control unit first passes through a **10-micron filter**; if this becomes contaminated, the resulting pressure drop opens the filter bypass valve, supplying unfiltered fuel to the APU. Fuel then enters a positive-displacement, gear-type pump; upon discharge, it passes through a **70-micron screen** to filter wear debris. Fuel then branches to the metering valve, differential pressure valve, and the **ultimate relief valve**, which opens to bypass excess fuel back to the pump inlet whenever system pressure exceeds a predetermined value (this occurs at each shutdown, since the shutoff valve stops all flow). The **differential pressure valve** maintains a constant pressure drop across the metering valve, modulated by a torque motor receiving variable current from the ECU, so metered flow is proportional to metering valve area. Fuel flows from the metering valve, through the solenoid shutoff valve, to the atomizer — initially through the primary nozzle tip only, with the flow divider opening at higher pressure to add flow through the secondary path.

### FADEC for a Propulsion Engine

Many large high-bypass turbofan engines use FADEC. The **EEC** is the primary component; its housing contains **two electronic channels** (two separate computers), physically separated internally and naturally cooled by convection, mounted in a cool area of the engine nacelle (typically shock-mounted to the lower-left fan case). Each channel is an independent computer capable of completely controlling engine operation. **Cross-talk logic** compares data from channels A and B to determine which channel is best to control the output driver for a given torque motor or solenoid bank; the primary channel normally controls all output drivers, but control of a specific bank can be transferred to the other channel if cross-talk logic finds it better suited. The EEC has both volatile and nonvolatile memory to store performance and maintenance data.

The EEC can control engine thrust in two modes, selected by a mode selection switch:

- **Normal mode** — thrust is set through **engine pressure ratio (EPR)**
- **Alternate mode** — thrust is set by **N1**

When the fuel control switch is moved from run to cutoff, the EEC resets, recording all fault data in nonvolatile memory. The EEC controls the metering valve in the **fuel metering unit (FMU)** — mounted on the front face of the gearbox, attached to the front of the fuel pump — to supply fuel flow for combustion. The EEC also sends a signal to the minimum pressure and shutoff valve in the FMU to start or stop fuel flow, and receives position feedback via rotary differential transformers, linear variable differential transformers, and thermocouples. A **fuel temperature sensor thermocouple** on the fuel outlet line of the fuel/oil cooler feeds fuel temperature data to the EEC. Besides fuel metering, the EEC also controls other subsystems — fuel and air/oil coolers, bleed valves, variable stator vanes, turbine cooling air valves, and the turbine case cooling system — via torque motors and solenoids.

Each EEC channel has seven electrical connections (three per side, one on the bottom); both channels share two top connections — the **programming plug** (selects the correct software for the engine's thrust rating, remaining with the engine when the EEC is removed) and the **test connector**. Each channel also has three pneumatic connections reading ambient pressure, burner pressure, LPC exit pressure, and fan inlet pressure. Each channel uses its own sensor wire colour — **Channel A is blue**, **Channel B is green**, non-EEC circuit wiring is **grey**, and thermocouple signals are **yellow**.

## Fuel System Operation

The fuel pump receives fuel from the airplane fuel system. The **low-pressure boost stage** of the pump pressurizes fuel and sends it to the **fuel/oil cooler (FOC)**. Fuel then flows through the fuel pump filter element to the **high-pressure main stage**, which increases pressure and sends fuel to the **fuel metering unit (FMU)** (and also supplies servo fuel to the servo fuel heater and other engine components). Metered fuel for combustion passes through the **fuel flow transmitter** to the **fuel distribution valve**, which supplies metered fuel to the fuel supply manifolds. The **fuel injectors** then draw metered fuel from the manifolds and spray it into the engine for combustion. The fuel pump housing contains a disposable fuel filter element; a **fuel filter differential pressure switch** signals the EEC of an almost-clogged filter condition, and unfiltered fuel can bypass the element if it becomes clogged.

## Engine Fuel System Components

### Main Fuel Pumps (Engine-Driven)

Main fuel pumps must deliver a continuous supply of fuel at the proper pressure at all times, including the maximum flow needed at appropriate pressure for satisfactory nozzle spray and accurate fuel regulation. Engine-driven fuel pumps fall into two categories:

1. **Constant displacement**
2. **Non-constant displacement**

Generally, a **non-positive displacement (centrifugal) pump** — sometimes called the **boost stage** — is used at the inlet to provide positive flow to the second stage; its output can be varied as needed. The second (main) stage is generally a **positive displacement** pump: the gear supplies a fixed quantity of fuel per revolution. Gear-type pumps have approximately straight-line flow characteristics, whereas fuel requirements fluctuate with flight/ambient conditions, so a pump sized for all operating conditions has excess capacity over most of its range — hence the need for a **pressure relief valve** to bypass excess fuel back to the inlet.

The impeller (boost element), driven faster than the high-pressure elements, increases fuel pressure with engine speed. Fuel discharged from the boost element goes to two high-pressure gear elements; a relief valve in the discharge port opens at a predetermined pressure and can bypass total fuel flow, recirculating excess fuel to the inlet of the second-stage pump. The fuel pump is lubricated by the fuel passing through it and should never be turned without fuel flow to its inlet; as the engine coasts down at shutdown, fuel should be supplied to the pump until it stops.

### Fuel Heater

Gas turbine fuel systems are very susceptible to ice formation in the fuel filters. When fuel in the tanks cools to **32°F (0°C)** or below, residual water tends to freeze into ice crystals that, when trapped in the filter, block fuel flow — a serious problem. To prevent this, fuel is kept above freezing (warmer fuel also improves combustion). A **fuel heater** operates as a heat exchanger, using either engine bleed air (an **air-to-liquid exchanger**) or engine lubricating oil (a **liquid-to-liquid heat exchanger**) as the heat source. Should ice form despite this, the heater can also thaw ice already on the fuel screen. Fuel filters are typically fitted with a pressure-drop warning switch that illuminates a cockpit warning light if ice begins collecting on the filter surface. Fuel deicing systems are designed for intermittent use; control may be manual (cockpit switch) or automatic (a thermostatic sensing element opening/closing the air or oil shutoff valve). In a FADEC system, the computer controls fuel temperature by sensing it directly and heating as needed.

### Fuel Filters

A **low-pressure filter** is installed between the supply tanks and the engine fuel system to protect the engine-driven fuel pump and control devices; a **high-pressure filter** is installed between the fuel pump and fuel control to protect the control from contaminants originating at the low-pressure pump.

The three most common filter types are:

| Filter type | Notes |
|-------------|-------|
| **Micron filter** | Greatest filtering action of any current filter type, rated in microns; porous cellulose material removes particles of 10–25 microns; also absorbs water. A bypass valve is a necessary safety factor because the minute openings are prone to clogging. |
| **Wafer screen filter** | Replaceable element made of layers of screen disks of bronze, brass, steel or similar material; capable of removing micronic particles and withstanding high pressure. |
| **Plain screen mesh filter** | Used where the filtering treatment required is less demanding. |

The most widely used filters are the **200-mesh** and **35-mesh** micron filters, usually made of fine-mesh steel wire, used in fuel pumps, fuel controls, and between the pump and control. For reference: a **micron is one thousandth of a millimetre**; human hair is about **100 microns** in diameter, and **25,400 microns = 1 inch**.

Because the micron filter removes foreign matter and water so thoroughly, it is especially valuable between the fuel tank and engine — water that seeps through a saturated filter element can quickly damage pump and control unit components, since these depend solely on fuel for lubrication. Periodic servicing/replacement of filter elements and daily draining of fuel tank sumps and low-pressure filters greatly reduces filter trouble and pump/control unit maintenance.

### Fuel Spray Nozzles and Fuel Manifolds

Although an integral part of the fuel system, nozzle design is closely related to the type of combustion chamber. Fuel nozzles inject fuel in a highly atomized, precisely patterned spray so combustion is completed evenly, quickly, and within the smallest space, avoiding hot spots and flame burn-through on the liner.

The two general nozzle types are **simplex** and **duplex**. Duplex nozzles usually require a dual manifold and a pressurizing valve or flow divider to divide primary/secondary (main) fuel flow; simplex nozzles require only a single manifold. Nozzles may be mounted:

1. **Externally** — via a mounting pad on the case or inlet air elbow, nozzle near the dome
2. **Internally** — at the liner dome, requiring chamber cover removal for maintenance

Nozzles in a given engine are matched to flow equal amounts of fuel, which is important for efficient combustion.

#### Simplex Fuel Nozzle

The **simplex** nozzle was the first type used in turbine engines and was replaced in most installations by the duplex nozzle, which gives better atomization at starting and idling speeds — though simplex nozzles are still used in some installations. Each consists of a nozzle tip, an insert, and a strainer of fine-mesh screen with a support.

#### Duplex Fuel Nozzle

The **duplex** nozzle is widely used in present-day gas turbine engines. It requires a flow divider but offers a desirable spray pattern over a wide range of operating pressures.

#### Airblast Nozzles

**Airblast** nozzles provide improved mixing of fuel and airflow for an optimum combustion spray; squirrel vanes mix air and fuel at the nozzle opening. By using a proportion of the primary combustion airflow in the fuel spray, locally rich fuel concentrations are reduced. Airblast nozzles can be either simplex or duplex, can operate at lower working pressures (allowing lighter pumps), and help reduce the nozzle's tendency to carbon up, which can disturb the flow pattern.

### Flow Divider

A **flow divider** creates separate primary and secondary fuel supplies discharged through separate manifolds. Metered fuel enters the divider inlet, passes through an orifice, and goes on to the primary nozzles. A passage directs fuel flow from both sides of the orifice to a chamber containing differential pressure bellows, a **viscosity compensated restrictor (VCR)**, and a surge dampener. During start, unequal pressure on the bellows keeps the flow divider valve closed, so fuel passes only through the primary line. As fuel flow increases, differential pressure on the bellows increases; at a predetermined pressure the bellows compresses, opening the flow divider valve and starting flow to the secondary manifold — at maximum flow, the secondary line passes approximately **90 percent** of the fuel. A flow divider performs essentially the same function as a pressurizing valve — dividing flow to duplex nozzles — though nomenclature varies between manufacturers.

### Fuel Pressurizing and Dump Valves

A **fuel pressurizing valve** is usually required on engines with duplex nozzles to divide flow into primary and secondary manifolds; at flows required for starting and altitude idling, all fuel passes through the primary line, and as flow increases the valve opens the main line until the secondary line carries approximately 90 percent of fuel at maximum flow. Pressurizing valves usually trap fuel forward of the manifold, giving a **positive cutoff** that prevents fuel from dribbling into the manifold/nozzles, limiting afterfires and nozzle carbonization (which occurs because lowered combustion chamber temperatures prevent complete fuel burn).

### Combustion Drain Valves

**Drain valves** drain fuel from engine components where accumulated fuel could cause operating problems — notably the risk of combustion chamber fire, and the deposit of lead/gum residue in fuel manifolds and nozzles after evaporation. Fuel manifolds may be drained by an individual **drip or dump valve**, which may be pressure-differential or solenoid operated. The **combustion chamber drain valve** drains fuel accumulated after each shutdown or during a false start. In can-type combustion chambers, fuel drains by gravity through the flame tubes/interconnector tubes to the lower chambers, which have drain lines to the drain valve; in basket or annular-type chambers, fuel drains through the liner air holes into a trap connected to the drain line. The drain valve opens once pressure in the manifold/burners has been reduced to near atmospheric — a small spring holds the valve off its seat until combustion chamber pressure overcomes it and closes the valve during operation. It is imperative this valve works correctly, or a hot start on the next attempt, or an afterfire after shutdown, is likely.

### Fuel Quantity Indicating Units

Fuel quantity units vary between installations. A **fuel counter (totalizer)**, mounted on the instrument panel, is electrically connected to a flowmeter in the fuel line to the engine. When the aircraft is fuelled, the counter is manually set to the total pounds of fuel in all tanks; as fuel passes through the flowmeter's measuring element, electrical impulses actuate the counter mechanism, subtracting the pounds delivered from the original reading, so the counter continually shows total fuel remaining. Certain conditions make the counter inaccurate: **jettisoned fuel** is still indicated as available, and fuel that **leaks upstream of the flowmeter** is not counted at all.
        $cnt$,
        11
    ) RETURNING id INTO s11_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 15.12: Air Systems
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m15_id, 'M15.12', 'Air Systems',
        $cnt2$
# Air Systems

## Turbine Engine Cooling

The intense heat generated when fuel and air are burned requires cooling for all internal combustion engines. Reciprocating engines are cooled by passing air over cylinder fins or by circulating liquid coolant through cylinder jackets; the cooling problem is eased because combustion occurs only during every fourth stroke of a four-stroke-cycle engine.

In a gas turbine engine, burning is **continuous**, and nearly all of the cooling air must pass through the inside of the engine. If only enough air were admitted to give an ideal air/fuel ratio of **15:1**, internal temperatures would increase to more than **4,000°F**. In practice, a large surplus of air beyond the ideal ratio is admitted, cooling the hot sections to acceptable temperatures ranging from **1,500° to 2,100°F**.

Because of this cooling effect, the outside of the case runs considerably cooler than the interior. The **hottest area occurs in and around the turbines** — although the gases have begun to cool slightly by this point, the conductivity of the case metal carries heat directly to the outside skin.

**Secondary air** passing through the engine cools the combustion-chamber liners. Liners are constructed to induce a thin, fast-moving film of air over both inner and outer liner surfaces. Can-annular-type burners frequently have a centre tube to lead cooling air into the centre of the burner, promoting high combustion efficiency and rapid dilution of hot combustion gases while minimizing pressure losses. In all gas turbine types, large amounts of relatively cool air join and mix with the burned gases aft of the burners to cool the hot gases just before they enter the turbines.

The **exhaust turbine bearing** is the most critical lubricating point in a gas turbine engine because of the high temperature normally present. In some engines, **air cooling is used in addition to oil cooling** for this bearing, which supports the turbine. Secondary airflow for this cooling is provided by bleeding air from the early stages of the compressor; this air is used to cool the turbine disk, vanes and blades as well as the exhaust bearing. Additionally, some turbine wheels may have bleed air flowing over the turbine disk, reducing heat radiation to the bearing surface.

Cooling-air inlets are frequently provided around the exterior of the engine to admit air that cools the turbine case, bearings, and turbine nozzle. Internal air bled from the compressor section is vented to the bearings and other parts, then ejected into the exhaust stream. Where the case is located on the side of the engine, it is cooled by outside air flowing around it. The engine exterior and nacelle are cooled by fan air passed around the engine and nacelle. The engine compartment is frequently divided into two sections:

- **Cold section** — the forward section
- **Hot section (turbine)** — the aft section

Case drains route most potential leaks overboard to prevent fluid buildup in the nacelle.

## Accessory Zone Cooling

Turbine powerplants can be divided into primary zones isolated from each other by fireproof bulkheads and seals: the **fan case compartment**, the **intermediate compressor case compartment**, and the **core engine compartment**. Calibrated airflows are supplied to each zone to keep temperatures at acceptable levels and to ventilate against the buildup of harmful vapours.

| Zone | Coverage | Cooling/ventilation |
|------|----------|----------------------|
| **Zone 1** | Around the fan case, containing the accessory case and the electronic engine control (EEC) | Vented by ram air through a nose cowl inlet, exhausted through a louvered vent in the right fan cowling; a pressure relief door opens if pressure exceeds a set limit |
| **Zone 2** | Contains fuel and oil lines | Cooled by fan air from the upper part of the fan duct, exhausted at the lower end back into the fan air stream |
| **Zone 3** | Area around the high-pressure compressor to the turbine cases; also contains fuel and oil lines and other accessories | Air enters from the exhaust of the precooler and other areas, exhausted through the aft edge of the thrust reverser inner wall and the turbine exhaust sleeve |

## Compressor Bleed Air

A secondary function of the compressor is to supply air for various purposes on the aircraft. Bleed air can be taken from any of the various compressor pressure stages — the exact bleed port location depends on the pressure or temperature required for the job. Ports are small openings in the compressor case adjacent to the stage being bled, so varying degrees of pressure are available by tapping into the appropriate stage. Air is often bled from the **final (highest) pressure stage**, since pressure and temperature are at a maximum there. At times this high-pressure air must be cooled — for example, if used for cabin pressurization or another purpose where excess heat would be uncomfortable or detrimental, it is passed through an air conditioning unit before entering the cabin.

Bleed air is used in a wide variety of ways. Common external air services include:

1. **Cabin pressurization, heating, and cooling**
2. **Deicing and anti-icing equipment**
3. **Pneumatic starting of engines**
4. **Auxiliary drive units (ADU)**

## Anti-Ice Control Systems

An anti-ice control system is a particularly important use for bleed air — both the engine and the airframe require anti-icing. Electrical and chemical anti-ice systems are common and well-suited to small aircraft, but the size of transport category aircraft makes these methods impractical. Instead, bleed air is routed through a shutoff valve controlled from the flight deck and ducted to areas of the aircraft prone to icing. The warm air flowing just behind surfaces such as the engine inlet and wing leading edges provides enough heat to prevent ice from forming.
        $cnt2$,
        12
    ) RETURNING id INTO s12_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M15.11 Fuel Systems (18 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s11_id, 'In turbine-powered aircraft, engine power (thrust) is primarily controlled by:',
     '[{"id":"a","text":"Varying the flow of fuel to the combustion chambers","correct":true},{"id":"b","text":"Varying the compressor inlet guide vane angle only","correct":false},{"id":"c","text":"Varying the exhaust nozzle area only","correct":false}]',
     '{"B1"}'),

    (s11_id, '"Rich blowout" occurs when:',
     '[{"id":"a","text":"Fuel quantity is reduced too far below the air quantity","correct":false},{"id":"b","text":"Oxygen in the air supply is insufficient to support combustion and the mixture is cooled below combustion temperature by excess fuel","correct":true},{"id":"c","text":"The fuel nozzles become completely blocked by ice","correct":false}]',
     '{"B1"}'),

    (s11_id, 'Gas turbine engine fuel controls can be divided into which three basic groups?',
     '[{"id":"a","text":"Hydromechanical, Hydromechanical/Electronic, and FADEC","correct":true},{"id":"b","text":"Centrifugal, Axial, and Mixed-flow","correct":false},{"id":"c","text":"Simplex, Duplex, and Airblast","correct":false}]',
     '{"B1"}'),

    (s11_id, 'A true FADEC (Full Authority Digital Engine/Electronics Control) system is characterized by:',
     '[{"id":"a","text":"Having no hydromechanical fuel control backup system","correct":true},{"id":"b","text":"Always retaining a full hydromechanical backup control","correct":false},{"id":"c","text":"Using only mechanical flyweight governors for all functions","correct":false}]',
     '{"B1"}'),

    (s11_id, 'A pure hydromechanical fuel control performs its functions using two sections, namely:',
     '[{"id":"a","text":"Computing and metering","correct":true},{"id":"b","text":"Ignition and starting","correct":false},{"id":"c","text":"Bleed and cooling","correct":false}]',
     '{"B1"}'),

    (s11_id, 'In a hydromechanical/electronic fuel control system, the vane fuel pump assembly is best described as:',
     '[{"id":"a","text":"A non-positive displacement centrifugal pump only","correct":false},{"id":"b","text":"A fixed displacement fuel pump that provides high-pressure fuel to the engine fuel control system","correct":true},{"id":"c","text":"A purely electrically driven metering device with no mechanical pumping element","correct":false}]',
     '{"B1"}'),

    (s11_id, 'The servo-operated metering valve in a hydromechanical/electronic fuel control positions itself in response to a ratio of fuel flow to:',
     '[{"id":"a","text":"Compressor discharge pressure (P3)","correct":true},{"id":"b","text":"Ambient outside air temperature only","correct":false},{"id":"c","text":"Exhaust gas temperature only","correct":false}]',
     '{"B1"}'),

    (s11_id, 'All speed governing of the high-pressure spool (gas generator) in the example hydromechanical/electronic system is achieved by the:',
     '[{"id":"a","text":"Flyweight governor","correct":true},{"id":"b","text":"Start fuel enrichment solenoid","correct":false},{"id":"c","text":"Fuel counter/totalizer","correct":false}]',
     '{"B1"}'),

    (s11_id, 'During an engine start, the flow divider directs fuel flow:',
     '[{"id":"a","text":"Equally through both primary and secondary nozzles from the first instant","correct":false},{"id":"b","text":"Entirely through the primary nozzles, opening to the secondary nozzles as fuel demand increases","correct":true},{"id":"c","text":"Entirely through the secondary nozzles only","correct":false}]',
     '{"B1"}'),

    (s11_id, 'The EEC housing on a FADEC-equipped propulsion engine contains two electronic channels. "Cross-talk logic" is used to:',
     '[{"id":"a","text":"Compare data from channels A and B to determine which channel should control a given torque motor or solenoid bank","correct":true},{"id":"b","text":"Transmit fuel quantity data to the cockpit fuel counter","correct":false},{"id":"c","text":"Synchronize ignition timing between two igniter plugs","correct":false}]',
     '{"B1"}'),

    (s11_id, 'On a FADEC-controlled propulsion engine, when the mode selection switch is in normal mode, engine thrust is set through:',
     '[{"id":"a","text":"N1 only","correct":false},{"id":"b","text":"Engine pressure ratio (EPR)","correct":true},{"id":"c","text":"Exhaust gas temperature (EGT) only","correct":false}]',
     '{"B1"}'),

    (s11_id, 'Engine-driven main fuel pumps for turbine engines are generally divided into which two system categories?',
     '[{"id":"a","text":"Constant displacement and non-constant displacement","correct":true},{"id":"b","text":"Centrifugal and reciprocating","correct":false},{"id":"c","text":"Primary and tertiary","correct":false}]',
     '{"B1"}'),

    (s11_id, 'A centrifugal (non-positive displacement) pump used at the inlet of an engine-driven fuel pump is often referred to as the:',
     '[{"id":"a","text":"Boost stage","correct":true},{"id":"b","text":"Metering stage","correct":false},{"id":"c","text":"Flow divider stage","correct":false}]',
     '{"B1"}'),

    (s11_id, 'A fuel heater is primarily installed to:',
     '[{"id":"a","text":"Increase maximum fuel flow rate at high power settings","correct":false},{"id":"b","text":"Protect the engine fuel system from ice formation caused by residual water freezing in cold fuel","correct":true},{"id":"c","text":"Reduce the volatility of the fuel prior to combustion","correct":false}]',
     '{"B1"}'),

    (s11_id, 'Residual water in aircraft fuel tends to freeze into ice crystals when fuel temperature cools to approximately:',
     '[{"id":"a","text":"32°F (0°C) or below","correct":true},{"id":"b","text":"50°F (10°C) or below","correct":false},{"id":"c","text":"0°F (−18°C) or below","correct":false}]',
     '{"B1"}'),

    (s11_id, 'The three most common types of fuel filters used in turbine engine fuel systems are the micron filter, the plain screen mesh filter, and the:',
     '[{"id":"a","text":"Wafer screen filter","correct":true},{"id":"b","text":"Cyclonic separator filter","correct":false},{"id":"c","text":"Electrostatic precipitator filter","correct":false}]',
     '{"B1"}'),

    (s11_id, 'Compared with the older simplex nozzle, the duplex fuel nozzle became widely used because it offers:',
     '[{"id":"a","text":"A desirable spray pattern over a wide range of operating pressures, with better atomization at starting and idling speeds","correct":true},{"id":"b","text":"The ability to operate without any manifold at all","correct":false},{"id":"c","text":"Elimination of the need for a flow divider","correct":false}]',
     '{"B1"}'),

    (s11_id, 'It is imperative that the combustion chamber drain valve function correctly after each shutdown, because a faulty valve is likely to cause:',
     '[{"id":"a","text":"A hot start on the next starting attempt, or an afterfire after shutdown","correct":true},{"id":"b","text":"Immediate compressor stall during the next takeoff roll","correct":false},{"id":"c","text":"Permanent loss of fuel counter/totalizer accuracy","correct":false}]',
     '{"B1"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M15.12 Air Systems (9 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s12_id, 'If only enough air were admitted to a gas turbine engine to give the ideal air/fuel ratio of 15:1, internal temperatures would increase to more than approximately:',
     '[{"id":"a","text":"1,000°F","correct":false},{"id":"b","text":"4,000°F","correct":true},{"id":"c","text":"10,000°F","correct":false}]',
     '{"B1"}'),

    (s12_id, 'The large surplus of air admitted beyond the ideal air/fuel ratio in a gas turbine engine serves primarily to:',
     '[{"id":"a","text":"Increase combustion pressure only","correct":false},{"id":"b","text":"Cool the hot sections of the engine to acceptable temperatures","correct":true},{"id":"c","text":"Reduce compressor rotational speed","correct":false}]',
     '{"B1"}'),

    (s12_id, 'The hottest area of a gas turbine engine occurs:',
     '[{"id":"a","text":"At the compressor inlet","correct":false},{"id":"b","text":"In and around the turbines","correct":true},{"id":"c","text":"At the fuel nozzles","correct":false}]',
     '{"B1"}'),

    (s12_id, 'The exhaust turbine bearing is considered the most critical lubricating point in a gas turbine engine because of:',
     '[{"id":"a","text":"The high temperature normally present there","correct":true},{"id":"b","text":"Its exposure to fuel contamination","correct":false},{"id":"c","text":"Its location forward of the compressor","correct":false}]',
     '{"B1"}'),

    (s12_id, 'An engine compartment is frequently divided into a forward section and an aft section, respectively referred to as the:',
     '[{"id":"a","text":"Wet section and dry section","correct":false},{"id":"b","text":"Cold section and hot section","correct":true},{"id":"c","text":"Primary section and auxiliary section","correct":false}]',
     '{"B1"}'),

    (s12_id, 'On a turbine powerplant with accessory zone cooling, Zone 1 — which contains the accessory case and the electronic engine control (EEC) — is ventilated primarily by:',
     '[{"id":"a","text":"Ram air through an inlet in the nose cowl, exhausted through a louvered vent in the fan cowling","correct":true},{"id":"b","text":"Engine bleed air ducted from the highest compressor pressure stage only","correct":false},{"id":"c","text":"Recirculated cabin air from the environmental control system","correct":false}]',
     '{"B1"}'),

    (s12_id, 'A secondary function of the compressor is to supply bleed air for various aircraft purposes. Air is often bled from the final (highest) pressure stage because at that point:',
     '[{"id":"a","text":"Pressure and air temperature are at a maximum","correct":true},{"id":"b","text":"Pressure and air temperature are at a minimum","correct":false},{"id":"c","text":"The air is coolest and driest","correct":false}]',
     '{"B1"}'),

    (s12_id, 'Which of the following is NOT listed as a common external use of engine bleed air?',
     '[{"id":"a","text":"Cabin pressurization, heating, and cooling","correct":false},{"id":"b","text":"Pneumatic starting of engines","correct":false},{"id":"c","text":"Primary hydraulic system pressurization","correct":true}]',
     '{"B1"}'),

    (s12_id, 'For transport category aircraft, engine inlet and wing leading edge anti-icing is typically provided by:',
     '[{"id":"a","text":"Electrical and chemical anti-ice systems, as used on small aircraft","correct":false},{"id":"b","text":"Bleed air routed through a flight-deck-controlled shutoff valve and ducted to areas prone to icing","correct":true},{"id":"c","text":"Fuel heater exhaust air vented externally","correct":false}]',
     '{"B1"}');

END $$;
