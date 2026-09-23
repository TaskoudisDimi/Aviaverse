-- Module 15: Gas Turbine Engine (B1) — Bearings and Seals, Lubricants and Fuels, Lubrication Systems
-- Source: EASA Part-66 Module 15 official textbook (Gas Turbine Engine, Sub-Modules 08-10)

DO $$
DECLARE
    m15_id INT;
    s8_id  INT;
    s9_id  INT;
    s10_id INT;
BEGIN
    SELECT id INTO m15_id FROM easa_modules WHERE code = 'M15';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M15.8') THEN
        RAISE NOTICE 'M15.8-M15.10 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 15.8: Bearings and Seals
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m15_id, 'M15.8', 'Bearings and Seals',
        $cnt$
# Bearings and Seals

## Function of the Main Bearings

The main bearings of a turbine engine have the critical function of **supporting the main engine rotor**. The number of bearings necessary for proper engine support is, for the most part, determined by the **length and weight of the engine rotor**. Length and weight are directly affected by the type of compressor used in the engine — naturally, a **two-spool compressor requires more bearing support** than a single-spool arrangement.

The minimum number of bearings required to support one shaft is:

- **One deep groove ball bearing** — supports both thrust (axial) and radial loads
- **One straight roller bearing** — radial load only

Sometimes more than one roller bearing is necessary if the shaft is subject to **vibration** or its **length is excessive**.

## Ball and Roller (Antifriction) Bearings

Gas turbine rotors are supported by ball and roller bearings, which are **antifriction bearings**. Many newer engines use **hydraulic bearings**, in which the outside race is surrounded by a thin film of oil; this reduces vibrations transmitted to the engine.

In general, antifriction bearings are preferred largely because they:

- Offer little rotational resistance
- Facilitate precision alignment of rotating elements
- Are relatively inexpensive
- Are easily replaced
- Withstand high momentary overloads
- Are simple to cool, lubricate, and maintain
- Accommodate both radial and axial loads
- Are relatively resistant to elevated temperatures

The main disadvantages of antifriction bearings are their **vulnerability to foreign matter** and their **tendency to fail without appreciable warning**.

Usually the **ball bearings** are positioned on the compressor or turbine shaft so that they can absorb any axial (thrust) loads or radial loads. Because **roller bearings** present a larger working surface, they are better equipped to support **radial loads** than thrust loads, and are therefore used primarily for this purpose.

A typical ball or roller bearing assembly includes a **bearing support housing**, which must be strongly constructed and supported in order to carry the radial and axial loads of the rapidly rotating rotor. Figure 8-1 in the source text depicts three bearing locations on a typical engine: a front bearing chamber, a center bearing chamber, and a rear bearing chamber (roller bearings forward and aft of the compressor, with a ball "location" bearing forward of the turbine section).

## Bearing Mounting and Self-Alignment

The ball or roller bearing is fitted into the bearing housing and may have a **self-aligning feature**. If a bearing is self-aligning, it is usually seated in a **spherical ring**, which allows the shaft a certain amount of radial movement without transmitting stress to the bearing inner race.

The bearing surface is usually provided by a **machined journal** on the appropriate shaft, and the bearing is usually locked in position by a **steel snap ring** or other suitable locking device. The rotor shaft also provides the matching surface for the oil seals in the bearing housing; these machined surfaces are called **lands** and fit in rather close to the oil seal.

## Oil Seals

The bearing housing usually contains oil seals to prevent oil leaking from its normal path of flow, and it also delivers oil to the bearing for lubrication, usually through **spray nozzles**.

Oil seals may be one of the following types:

- **Labyrinth seal** — usually pressurized
- **Thread (helical) seal** — depends solely on reverse threading to stop oil leakage

These two types of seals are very similar, differing only in thread size and the fact that the labyrinth seal is pressurized. Both types may be pressurized to minimize oil leaking along the compressor shaft.

### Carbon Seals

Another type of oil seal used on some later engines is the **carbon seal**. These seals are usually **spring loaded** and are similar in material and application to the carbon brushes used in electrical motors. Carbon seals rest against a surface provided to create a **sealed bearing cavity or void**, preventing oil from leaking out along the shaft into the compressor airflow or the turbine section.
        $cnt$,
        8
    ) RETURNING id INTO s8_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 15.9: Lubricants and Fuels
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m15_id, 'M15.9', 'Lubricants and Fuels',
        $cnt2$
# Lubricants and Fuels

## Requirements for Turbine Engine Lubricants

There are many requirements for turbine engine lubricating oils. Due to the **absence of reciprocating motion** and the presence of ball and roller bearings (antifriction bearings), the turbine engine uses a **less viscous lubricant** than a reciprocating engine.

Gas turbine engine oil must have:

- A **high viscosity** for good load-carrying ability
- A sufficiently **low viscosity** to provide good flowability
- **Low volatility** to prevent loss by evaporation at the high altitudes at which the engines operate

In addition, the oil should **not foam** and should be essentially nondestructive to natural or synthetic rubber seals in the lubricating system. With high-speed antifriction bearings, the formation of **carbons or varnishes must be held to a minimum**. Synthetic oil for turbine engines is usually supplied in sealed one-quart cans.

### Synthetic Oil

The many requirements for lubricating oils are met in synthetic oils developed specifically for turbine engines. Synthetic oil has two principal advantages over petroleum oil: it has a **lower tendency to deposit lacquer and coke** (solids left after solvents have been evaporated), because it does not evaporate the solvents from the oil at high temperature.

Oil grades used in some turbine engines normally contain thermal and oxidation preventives, load-carrying additives, and substances that lower the pour point, in addition to synthetic chemical-base materials.

- **MIL-L-7808** — a military specification for turbine oil, designated **Type I** turbine oil
- Turbine synthetic oil with a viscosity of around **5 to 5.5 centistokes at 210°F**, approved against military specification **MIL-PRF-23699F**, is referred to as **Type II** turbine oil

### Characteristics of Type II Turbine Oil

Most turbine oils meet the Type II specification and are made with the following characteristics:

| # | Characteristic | Description |
|---|-----------------|-------------|
| 1 | **Vapor phase deposits** | Carbon deposits formed from oil mist and vapor contact with hot engine surfaces |
| 2 | **Load-carrying ability** | Provides for heavy loads on the bearing systems of turbine engines |
| 3 | **Cleanliness** | Minimum formation of sludge deposits during severe operation |
| 4 | **Bulk stability** | Resistance to physical or chemical change from oxidation; permits long periods of severe operation without significant increase in viscosity or total acidity (the main indicators of oxidation) |
| 5 | **Compatibility** | Most turbine oil is compatible with other oils meeting the same military specification, but most engine manufacturers do not recommend indiscriminate mixing of approved oil brands |
| 6 | **Seal wear** | Lubricant properties essential to prevent wear of the carbon at the carbon seal face, for the life of engines with carbon seals |

## Turbine Oil Health and Safety Precautions

Under normal conditions, the use of turbine oil presents a **low health risk** for humans, though each person reacts somewhat differently to exposure. Contact with liquids, vapors, and mist of turbine oil should be minimized. Established exposure limits are generally found in the **material safety data sheets (MSDS)**.

- Prolonged breathing of hydrocarbon vapor concentrations in excess of prescribed limits may result in **lightheadedness, dizziness, and nausea**
- If turbine oil is ingested, **call a doctor immediately** and identify the product and how much was ingested; petroleum products should **never be siphoned by mouth**
- Prolonged or repeated skin contact can cause **irritation and dermatitis** — wash the skin thoroughly with soap and warm water, and promptly remove oil-soaked clothing
- If turbine oil contacts the eyes, **flush the eyes with fresh water** until irritation subsides
- Protective clothing, gloves, and eye protection should be used when handling turbine oil
- During operation, oil can be subjected to very high temperatures that break it down and produce a product of **unknown toxicity** — precautions against explosion should be taken
- Spilled turbine oil can blister, discolor, or remove paint; painted surfaces should be wiped clean with a petroleum solvent after spillage

## Turbine Engine Fuels

Aircraft with turbine engines use a type of fuel different from that of reciprocating aircraft engines — commonly known as **jet fuel**. Jet fuel should never be mixed with aviation gasoline (AVGAS) or introduced into a reciprocating engine's fuel system.

Compared with AVGAS, turbine engine fuels are hydrocarbon compounds of:

- **Higher viscosity**
- **Much lower volatility**
- **Higher boiling points**

In the distillation process from crude oil, the **kerosene cut** from which jet fuel is made condenses at a higher temperature than the naphtha or gasoline cuts. The hydrocarbon molecules of turbine engine fuels are composed of **more carbon** than those in AVGAS. Turbine engine fuels also typically have a **higher sulfur content** than gasoline, and various inhibitors are commonly added to control corrosion, oxidation, ice, and microbial/bacterial growth.

### Turbine Fuel Volatility

The choice of turbine engine fuel reflects conflicting factors: low volatility is desirable to resist vapor lock and evaporation in the fuel tanks, but turbine engine aircraft must be able to **start readily and restart in flight**, which is easier with a fuel of higher volatility.

| Fuel | Maximum vapor pressure |
|------|--------------------------|
| AVGAS | **7 psi** |
| Jet A | **0.125 psi** (at standard atmospheric conditions) |
| Jet B (blend of Jet A and gasoline) | **Between 2 and 3 psi** |

### Turbine Engine Fuel Types

Three basic turbine engine fuel types are available worldwide, although some countries have their own unique fuels:

- **Jet A** — the most common turbine engine fuel in the continental United States. Fractionally distilled in the kerosene range, with low volatility and low vapor pressure. Flash points range between **110°F and 150°F**. Freezes at **−40°F**.
- **Jet A-1** — globally the most popular turbine fuel. Freezes at **−52.6°F**. Most engine operations manuals permit the use of either Jet A or Jet A-1.
- **Jet B** — a wide-cut fuel, basically a blend of kerosene and gasoline. Its volatility and vapor pressure fall between Jet A and AVGAS. Primarily available in Alaska and Canada due to its low freezing point of approximately **−58°F**, and its higher volatility yields better cold-weather performance.

### Fuel Identification

Aircraft and engine manufacturers designate approved fuels for each aircraft and engine, and only those specified fuels should be used. The use of **dyes** helps aviators monitor fuel type:

- **AVGAS** is dyed various colors for use in different parts of the world (e.g. AVGAS 82UL — purple, AVGAS 100 — green, AVGAS 100LL — blue)
- **Jet fuel is not dyed** — all grades of jet fuel are colorless or straw colored

Delivery trucks, hoses, aircraft tank fuel caps, and fill areas are marked with color-coded decals matching the AVGAS colors. Jet fuel fill hose nozzles are sized too large to fit into an AVGAS tank fill opening. An aircraft should never be released for flight with unknown fuel onboard.

### Purity

Filters used at various stages of transfer and storage remove most foreign sediment from jet fuel; remaining debris settles into the fuel tank drain sumps to be removed before flight, and filters/strainers in the aircraft fuel system capture any remaining sediment.

The purity of aviation fuel is compromised **most often by water**. Water is not removed by filters and strainers as easily as solid particles, and can enter the fuel even when the aircraft is parked with the fuel caps in place — temperature fluctuations cause water vapor in the tank airspace to condense on the tank's inner surface and settle into the fuel.

The proper procedure for minimizing water entering aircraft fuel is to **fill the aircraft fuel tanks immediately after each flight**, minimizing the size of the vapor space (and therefore the amount of water vapor) above the liquid fuel.

If water is entrained or dissolved in the fuel, it cannot be removed by draining the sumps before flight. As the aircraft climbs and the fuel supply cools, entrained/dissolved water is forced out of solution and becomes free water; if cool enough, **ice crystals** form rather than liquid water, which can clog filters and disrupt fuel flow to the engines. Both AVGAS and jet fuel are subject to this type of water/icing issue.

### Microbes

Purity issues related to turbine engine fuels are unique. Jet fuel, being more viscous than AVGAS, retains water in two ways: **dissolved** in the fuel and **entrained** in the fuel. The greater presence of water in jet fuel allows microbes to assemble, grow, and live on the fuel.

Since turbine engine fuels always contain water, **microbial contamination is always a threat**. Large tanks provide numerous areas where water can settle and microbes can flourish, forming a **bio-film** that can clog filters, corrode tank coatings, and degrade the fuel. Microbial growth can be controlled somewhat with the addition of **biocides** to the fuel; anti-ice additives are also known to inhibit bacterial growth.

Best practices to minimize water (and therefore microbial growth) include: avoiding prolonged fuel storage, draining sumps and monitoring for settled water, and investigating all incidents of water discovered in the fuel.

### Anti-Ice Additives

Fuel anti-ice additives can be added to the bulk fuel or directly into the aircraft fuel tank, usually during refueling. These are basically **diethylene glycol solutions** that act as antifreeze — they dissolve in free water as it comes out of the fuel and lower its freezing point.
        $cnt2$,
        9
    ) RETURNING id INTO s9_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 15.10: Lubrication Systems
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m15_id, 'M15.10', 'Lubrication Systems',
        $cnt3$
# Lubrication Systems

## Turbine Engine Lubrication Systems — General

Both **wet-sump** and **dry-sump** lubrication systems are used in gas turbine engines:

- **Wet-sump** engines store the lubricating oil in the engine proper
- **Dry-sump** engines utilize an external tank mounted on the engine or somewhere in the aircraft structure near the engine

Turbine engine oil systems can also be classified as a **pressure relief system**, which maintains a somewhat constant pressure, the **full flow type** of system, in which pressure varies with engine speed, or the **total loss system**, used in engines intended for short-duration operation (target drones, missiles, etc.). The most widely used system is the **pressure relief system**, with the full-flow type used mostly on large fan-type engines.

One of the main functions of the oil system in turbine engines is **cooling the bearings** by carrying heat away as oil circulates around the bearing. The **exhaust turbine bearing is the most critical lubricating point** in a gas turbine engine because of the high temperature normally present.

In some engines, **air cooling** (secondary air flow — bleed air from early compressor stages) is used in addition to oil cooling to support the turbine bearing. This internal air flow cools the turbine disk, vanes, and blades, and may reduce heat radiation to the bearing surface. The use of cooling air substantially reduces the quantity of oil necessary for adequate bearing cooling. Since cooling is a major function of turbine oil, the lubricating oil normally requires an **oil cooler**; oil is routed through air-cooled and/or fuel-cooled oil coolers, which also serves to heat (regulate) the fuel to prevent ice in the fuel.

## Turbine Lubrication System Components

### Oil Tank

Although dry-sump systems use an oil tank containing most of the oil supply, a small sump is usually included on the engine, containing the oil pump, scavenge and pressure inlet strainers, scavenge return connection, pressure outlet ports, an oil filter, and mounting bosses for the oil pressure gauge and temperature bulb connections.

The oil tank is designed to furnish a constant supply of oil during any aircraft attitude, using:

- A **swivel outlet assembly**, controlled by a weighted end free to swing below the baffle
- A **horizontal baffle** mounted in the center of the tank
- **Two flapper check valves** mounted on the baffle — normally open, closing only when oil in the bottom of the tank tends to rush to the top during decelerations, trapping the oil at the bottom for pickup by the swivel fitting
- A **positive vent system**, arranged so the airspace is vented at all times even if oil is forced to the top by deceleration
- A **sump drain** located in the bottom of the tank

All oil tanks are provided with **expansion space**, allowing expansion of the oil after it absorbs heat from the bearings and gears and after it foams from circulating through the system. Some tanks incorporate a **deaerator tray** (usually can-type, with oil entering at a tangent) for separating air from the oil returned by the scavenger system; the released air is carried out through the vent system.

A **pressure buildup** within the tank is usually desired to ensure positive flow of oil to the oil pump inlet. This is achieved by routing the vent line through an **adjustable check relief valve**, usually set to relieve at about **4 psi**. If air temperature is abnormally low, the oil may be changed to a lighter grade; some engines provide for an **immersion-type oil heater**.

### Oil Pump

The oil pump supplies oil under pressure to the parts of the engine requiring lubrication, circulates the oil through coolers as needed, and returns it to the oil tank. Many oil pumps consist of a **pressure supply element** plus **scavenge elements** (as in a dry-sump system), though some pumps serve only a single function. The number of pumping elements depends largely on the type and model of engine. **Scavenge elements have a greater pumping capacity than the pressure element**, to prevent oil from collecting in the bearing sumps.

The two most common oil pump types are **gear** and **gerotor**, with the **gear-type being the most commonly used**.

- **Gear-type pump** — has two elements (one for pressure oil, one for scavenging), though some pumps may have several pressure and/or scavenge elements. Clearances between the gear teeth and the pump wall/plate are critical to correct output. A **regulating (relief) valve** on the discharge side limits output pressure by bypassing oil to the pump inlet once outlet pressure exceeds a predetermined limit; the valve can be adjusted to bring oil pressure within limits. A **shaft shear section** causes the shaft to shear if the pump gears should seize.
- **Gerotor pump** — usually contains a single element for oil pressure and several for scavenging; the elements are almost identical in shape, but capacity is controlled by varying element size. For example, a pressure element may have a pumping capacity of **3.1 gallons per minute (gpm)** compared to **4.25 gpm** for the scavenge elements. Pressure is determined by engine rpm, with minimum pressure at idle and maximum pressure at intermediate and maximum engine speeds. Each set of gerotors is separated by a steel plate; the small star-shaped inner element (external lobes) is keyed to the pump shaft and drives the outer free-turning element (internal lobes) within a steel plate having an eccentric bore. Configurations vary by engine model — for example, one model uses four elements (one feed, three scavenge), while another uses six elements (one feed, five scavenge).

### Turbine Oil Filters

Filters are an important part of the lubrication system because they remove foreign particles that may damage the antifriction (ball and roller) bearings, especially at the very high speeds attained in gas turbines. Numerous drilled or core oil passages are usually rather small and easily clogged.

Filter mesh sizes are measured in **microns** (one millionth of a meter). Filtering element interiors are made of varying materials, including **paper and metal mesh**, with oil normally flowing through the element from the outside into the filter body. One type uses a replaceable laminated paper element; others use a very fine stainless steel mesh of about **25–35 microns**.

Most filters, located close to the pressure pump, consist of a filter body/housing, filter element, a **bypass valve**, and a **check valve**:

- The **bypass valve** prevents oil flow from being stopped if the filter element becomes clogged, opening at a certain pressure. This means filtering action is lost and unfiltered oil is pumped to the bearings — but this prevents the bearings from receiving no oil at all. Many engines have a mechanical indicator that pops out to show the filter is in bypass mode (a visual indication only, seen by direct engine inspection).
- An **antidrain check valve** prevents oil in the tank from draining down into the engine sumps when the engine is not operating; it is normally spring loaded closed, requiring **4 to 6 psi** to open.

In addition to main oil filters, secondary filters are used throughout the system:

- **Finger screen filters** — large-mesh screens sometimes used for straining scavenged oil, trapping larger contaminants
- **Last-chance filters** — fine-mesh screens located at each bearing, straining the oil just before it passes from the spray nozzles onto the bearing surfaces, helping screen out contaminants that could plug the nozzle

### Oil Pressure Regulating Valve

Most turbine engine oil systems are the pressure-regulating type, keeping pressure fairly constant. The regulating valve, included on the pressure side of the pressure pump, is more of a **regulating valve than a relief valve**, because it keeps system pressure within certain limits rather than only opening when an absolute maximum is exceeded.

The valve is held against a seat by a spring; a screw adjusts spring tension — increasing the tension raises both the pressure at which the valve opens and the system pressure.

### Oil Pressure Relief Valve

Some large turbofan oil systems do not have a regulating valve; system pressure instead varies with engine rpm and pump speed across a wide range. A **relief valve** relieves pressure only if it exceeds the maximum limit for the system, bypassing oil back to the **inlet side of the oil pump**. This is especially important when oil coolers are incorporated, since their thin-wall construction is easily ruptured. Under normal operation, this valve should **never open**.

### Oil Jets

Oil jets (nozzles) are located in the pressure lines adjacent to, or within, the bearing compartments and rotor shaft couplings, delivering oil as an **atomized spray**. Some engines use an air-oil mist spray, produced by tapping high-pressure bleed air from the compressor to the oil nozzle outlet — considered adequate for ball and roller bearings. However, the **solid oil spray method is considered the better of the two methods**.

Oil jets are easily clogged because of the small orifice in their tips, so the oil must be free of foreign particles. If the last-chance filters in the oil jets become clogged, **bearing failure usually results**, since the nozzles are not accessible for cleaning except during engine maintenance. To prevent this, main oil filters are checked frequently for contamination.

### Lubrication System Instrumentation

Gauge connection provisions are incorporated for: **oil pressure, oil quantity, low oil pressure, oil filter differential pressure**, and **oil temperature**.

- The oil pressure transmitter, located between the pump and the lubrication points, sends a signal to the FADEC control unit and, through the EICAS computers, to flight deck displays
- The **tank quantity transmitter** sends information to the EICAS computers
- The **low oil pressure switch** alerts the crew if oil pressure falls below a certain level during engine operation
- The **differential oil pressure switch** alerts the flight crew of an impending oil filter bypass because of a clogged filter
- Oil temperature is sensed at one or more points and displayed on the lower EICAS display

### Lubrication System Breather Systems (Vents)

Breather subsystems remove excess air from the bearing cavities and return it to the oil tank, where the **deaerator** separates it from any oil mixed in the vapor; the air is then vented overboard. All engine bearing compartments, oil tanks, and accessory cases are vented together so pressure remains the same throughout the system.

The oil tank vent keeps tank pressure from rising above or falling below outside atmospheric pressure, though it may be routed through a check relief valve preset to maintain a slight (approximately **4 psi**) pressure, assuring positive flow to the oil pump inlet.

In the accessory case, the vent (or breather) is a **screen-protected opening** allowing accumulated air pressure to escape to atmosphere — this is necessary because scavenged oil carries air into the accessory case; otherwise pressure buildup would stop oil draining from the bearing, forcing oil past the bearing oil seals into the compressor housing, which (in sufficient quantity) could cause burning and seal/bearing malfunction. Screened breathers are usually located in the front center of the accessory case to prevent oil leakage in unusual flight attitudes, and some breathers have a baffle to prevent leakage during flight maneuvers.

### Lubrication System Check Valve

Check valves are sometimes installed in the oil supply lines of dry-sump systems to prevent reservoir oil from **seeping by gravity** through the oil pump elements and high-pressure lines into the engine after shutdown. By stopping flow in the opposite direction, they prevent oil accumulations in the accessory gearbox, compressor rear housing, and combustion chamber — accumulations that could cause excessive loading of accessory drive gears during starts, contamination of cabin pressurization air, or internal oil fires. These check valves are usually the spring-loaded **ball-and-socket type**, generally requiring **2 to 5 psi** to open.

### Lubrication System Thermostatic Bypass Valves

Thermostatic bypass valves are included in oil systems using an oil cooler, to maintain proper oil temperature by varying the proportion of total oil flow through the cooler. The valve consists of a valve body with two inlet ports and one outlet port, and a spring-loaded thermostatic element valve. It is spring loaded because the pressure drop through the oil cooler could become too great due to denting or clogging of the cooler tubing — in which case the valve opens, bypassing the oil around the cooler.

### Air Oil Coolers

Two basic types of oil coolers are in general use: **air-cooled** and **fuel-cooled** (many engines use both). The air-cooled oil cooler, normally installed at the forward end of the engine, is similar in construction and operation to the air-cooled cooler used on reciprocating engines, and is usually included in a dry-sump oil system.

Dry-sump lubrication systems require coolers for two main reasons:

1. Air cooling of bearings using compressor bleed-air is not sufficient to cool the turbine bearing cavities, because of the heat present in that area
2. Large turbofan engines normally require a greater number of bearings, meaning more heat is transferred to the oil — the oil coolers are the only means of dissipating this heat

### Fuel Oil Coolers

The fuel-cooled oil cooler acts as a fuel/oil heat exchanger: the fuel cools the hot oil, and the oil heats the fuel for combustion. Fuel flowing to the engine must pass through the heat exchanger; a thermostatic valve controls the oil flow, and the oil may bypass the cooler if no cooling is needed. The heat exchanger consists of a series of joined tubes with an inlet and outlet port — oil enters the inlet port, moves around the fuel tubes, and exits the oil outlet port.

### Deoiler

The deoiler removes oil from the breather air. Breather air enters an **impeller** that turns in the deoiler housing; **centrifugal force** drives the oil toward the outer wall of the impeller, and the oil drains into a sump or oil tank. Because air is much lighter than oil, it passes through the center of the impeller and is vented overboard.

### Magnetic Chip Detectors

Magnetic chip detectors detect and catch **ferrous (magnetic) particles** present in the oil. Scavenge oil generally flows past chip detectors so magnetic particles are attracted and stick to the detector. Chip detectors are placed in several locations, generally in the scavenge lines for each scavenge pump, in the oil tank, and in the oil sumps. During maintenance, chip detectors are removed and inspected for metal — if none is found, the detector is cleaned, replaced, and safety wired; if metal is found, an investigation should be made to find its source.

## Typical Dry-Sump Pressure Regulated Turbine Lubrication System

This representative system consists of the **pressure, scavenge, and breather subsystems**. The pressure system supplies oil to the main engine bearings and accessory drives; the scavenger system returns oil to the engine oil tank (usually mounted on the compressor case) and completes the oil flow cycle; the breather system connects the individual bearing compartments and the oil tank with the breather pressurizing valve. With a dry-sump system, a larger oil supply can be carried and oil temperature can be readily controlled.

**Pressure system:** A gear-type pressure pump, located in the oil pump and accessory drive housing, receives engine oil at its lower (inlet) side and discharges pressurized oil to an oil filter (equipped with a bypass valve). The pressurized oil then reaches a **pressure regulating (relief) valve** downstream of the pump, which maintains system pressure and is adjusted to maintain proper pressure to the oil metering jets (and is usually easily accessible for adjustment). Oil then flows through the fuel oil cooler, to the bearing cavities through last-chance filters, and out spray nozzles. Fixed-orifice nozzles provide a relatively constant oil flow at all engine operating speeds.

**Scavenge system (example):** This system includes **five gear-type scavenge pumps**:

- The No. 1 bearing oil scavenge pump scavenges the front bearing case, directing oil through an external line to a central collecting point in the main accessory gearbox
- Oil from the No. 2 and 3 bearings returns through internal passages to a central collecting point in the main accessory case
- The accessory gearbox oil suction pump scavenges oil from the gearbox housing to the oil tank
- Oil from the No. 4, 4½, and 5 bearings accumulates in the bearing cavity and is scavenged to the accessory gearbox
- The turbine rear bearing oil suction pump scavenges oil from the No. 6 bearing compartment through a passage in the turbine case strut, joining the No. 4/4½/5 bearing oil before returning to the tank

Scavenge oil passes through the **deaerator** as it enters the oil tank, which separates the air mixed in the return oil; the air flows into the accessory gearbox and enters the deoiler.

**Breather pressurizing system:** Ensures a proper oil spray pattern from the main bearing oil jets and furnishes a pressure head to the scavenge system. Breather tubes in the compressor inlet case, oil tank, diffuser case, and turbine exhaust case connect to external tubing at the top of the engine, bringing the vapor-laden atmospheres of the various bearing compartments and oil tank together in the **deoiler** in the accessory gearbox, which separates oil from the air/oil mist and vents the air to atmosphere.

## Typical Dry-Sump Variable Pressure Lubrication System

This system uses the same basic subsystems (pressure, scavenge, breather) as the regulated system. The main difference is that pressure is **not regulated by a regulating bypass valve** — most large turbofan engine pressure systems are variable-pressure systems in which **pump outlet pressure is proportional to engine rpm**. Oil pressure can vary widely, for example from **100 psi to over 260 psi**, with the relief valve opening at about **540 psi**.

**Pressure subsystem:** Oil flows from the tank to the pressure stage of the pump (a slight tank pressure assures continuous flow into the pump). After pressurization, oil moves to the oil filter; if the filter is clogged, a bypass valve sends oil around it. There is no regulating valve, but a **relief valve** prevents system pressure from exceeding maximum limits, usually set to open well above normal operating pressure. Oil then flows to the engine air/oil cooler (bypassing it when cold, or passing through when hot) and on to the fuel oil cooler, which adjusts fuel temperature. Some oil passes through a classified **oil pressure trim orifice** that helps adjust oil pressure at low speeds. Oil then flows through last-chance oil filters (strainers) that remove particles if the main filter has been bypassed, before passing through nozzles to lubricate bearings, gearboxes, seals, and accessory drive splines.

**Scavenger subsystem:** The scavenger oil pump has several stages that pull oil from the bearing compartments and gearboxes and send it to the tank. At the tank, oil enters the deaerator, which separates the air; oil returns to the tank and air is vented through a check valve overboard. Each stage of the scavenge pump has a magnetic chip detector that can be removed for inspection.

**Breather subsystem:** Removes air from the bearing compartments, separates it from oil, and vents it overboard. Breather air is drawn to the gearbox by the deoiler (turned at high speed to separate oil from air); the air is then vented, along with air from the deaerator, overboard. The deaerator is located in the oil tank; the deoiler is located in the main gearbox.

## Turbine Engine Wet-Sump Lubrication System

Relatively few engines use a wet-sump type of oil system. The components of a wet-sump system are similar to those of a dry-sump system; the major difference is the **location of the oil reservoir**, which may be the accessory gear case or a sump mounted on the bottom of the accessory case. Regardless of configuration, wet-sump reservoirs are an integral part of the engine and contain the bulk of the engine oil supply.

The wet-sump reservoir includes the following components:

1. A **sight gauge** indicates the oil level in the sump
2. A **vent or breather** equalizes pressure within the accessory casing
3. A **magnetic drain plug** drains the oil and traps ferrous metal particles; it should always be examined closely during inspections, since the presence of metal particles may indicate gear or bearing failure
4. Provision may also be made for a **temperature bulb** and an **oil pressure fitting**

The bearing and drive gears in the accessory drive casing are lubricated by a **splash system**. Oil for the remaining points of lubrication leaves the pump under pressure and passes through a filter to jet nozzles that direct oil into the rotor bearings and couplings, then returns to the reservoir by **gravity**. Oil from the compressor bearing and the accessories drive coupling shaft drains directly into the reservoir; turbine oil drains into a sump where the oil was originally pumped.

## Accessory Section

The accessory section of the gas turbine engine has various functions. Its primary function is to provide space for mounting accessories necessary for operation and control of the engine, generally including aircraft-related accessories such as electric generators and hydraulic pumps. Secondary functions include acting as an **oil reservoir and/or oil sump** and housing the accessory drive gears and reduction gears.

Driven accessories on turbofans are usually mounted on the accessory gearbox, on the bottom of the engine; most turboprops and turboshafts have the accessory case mounted to the back section of the engine.

The basic elements of the accessory section are:

1. The **accessory case**, which has machined mounting pads for the engine-driven accessories
2. The **gear train**, housed within the accessory case

The accessory case may be designed to act as an oil reservoir; if an oil tank is used, a sump is usually provided below the front bearing support for drainage and scavenging of oil used to lubricate bearings and drive gears. The accessory case is also provided with tubing or cored passages for spraying lubricating oil on the gear train and supporting bearings.

The gear train is driven by the engine high-pressure compressor through an accessory drive shaft (**tower shaft**) gear coupling, which splines with a gearbox gear and the high-pressure compressor. The reduction gearing within the case provides suitable drive speeds for each engine accessory — because rotor operating rpm is so high, the accessory reduction gear ratios are relatively high. Accessory drives are supported by **ball bearings** assembled in the mounting pad bores of the accessory case.
        $cnt3$,
        10
    ) RETURNING id INTO s10_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M15.8 Bearings and Seals (9 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s8_id, 'What primarily determines the number of bearings necessary to properly support a gas turbine engine''s main rotor?',
     '[{"id":"a","text":"The length and weight of the engine rotor","correct":true},{"id":"b","text":"The number of fuel nozzles installed","correct":false},{"id":"c","text":"The maximum permitted EGT","correct":false}]',
     '{"B1"}'),

    (s8_id, 'The minimum bearing arrangement required to support one shaft consists of:',
     '[{"id":"a","text":"Two straight roller bearings only","correct":false},{"id":"b","text":"One deep groove ball bearing and one straight roller bearing","correct":true},{"id":"c","text":"Two deep groove ball bearings only","correct":false}]',
     '{"B1"}'),

    (s8_id, 'A bearing used to support a gas turbine rotor in which the outer race is surrounded by a thin film of oil to reduce vibration is called a:',
     '[{"id":"a","text":"Hydraulic bearing","correct":true},{"id":"b","text":"Plain journal bearing","correct":false},{"id":"c","text":"Needle bearing","correct":false}]',
     '{"B1"}'),

    (s8_id, 'Compared with roller bearings, ball bearings on a turbine engine shaft are primarily used to absorb:',
     '[{"id":"a","text":"Radial loads only, never thrust loads","correct":false},{"id":"b","text":"Axial (thrust) loads as well as radial loads","correct":true},{"id":"c","text":"Torsional loads only","correct":false}]',
     '{"B1"}'),

    (s8_id, 'Roller bearings are better equipped than ball bearings to support radial loads because:',
     '[{"id":"a","text":"They present a larger working surface","correct":true},{"id":"b","text":"They are always made from a harder steel alloy","correct":false},{"id":"c","text":"They are self-lubricating","correct":false}]',
     '{"B1"}'),

    (s8_id, 'The two main disadvantages of antifriction (ball and roller) bearings are:',
     '[{"id":"a","text":"High rotational resistance and difficulty of replacement","correct":false},{"id":"b","text":"Vulnerability to foreign matter and a tendency to fail without appreciable warning","correct":true},{"id":"c","text":"Poor resistance to elevated temperature and high cost","correct":false}]',
     '{"B1"}'),

    (s8_id, 'A self-aligning bearing is usually seated in a spherical ring so that:',
     '[{"id":"a","text":"The shaft can move radially without transmitting stress to the bearing inner race","correct":true},{"id":"b","text":"The bearing can be lubricated without an oil seal","correct":false},{"id":"c","text":"The bearing can absorb thrust loads only","correct":false}]',
     '{"B1"}'),

    (s8_id, 'The oil seal type that depends solely on reverse threading (rather than pressurization) to stop oil leakage is the:',
     '[{"id":"a","text":"Labyrinth seal","correct":false},{"id":"b","text":"Thread (helical) seal","correct":true},{"id":"c","text":"Carbon seal","correct":false}]',
     '{"B1"}'),

    (s8_id, 'Carbon seals used in some turbine engine bearing housings are usually:',
     '[{"id":"a","text":"Spring loaded, similar in material and application to carbon brushes used in electrical motors","correct":true},{"id":"b","text":"Bolted rigidly in place with no freedom of movement","correct":false},{"id":"c","text":"Made of the same helical thread design as a labyrinth seal","correct":false}]',
     '{"B1"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M15.9 Lubricants and Fuels (14 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s9_id, 'Compared with a reciprocating engine, a gas turbine engine uses a less viscous lubricant mainly because of:',
     '[{"id":"a","text":"The absence of reciprocating motion and the presence of antifriction (ball and roller) bearings","correct":true},{"id":"b","text":"The much lower operating temperatures of a turbine engine","correct":false},{"id":"c","text":"The use of a total-loss oil system on all turbine engines","correct":false}]',
     '{"B1"}'),

    (s9_id, 'The main advantage of synthetic turbine oil over petroleum oil is:',
     '[{"id":"a","text":"It is significantly cheaper to produce","correct":false},{"id":"b","text":"It has a lower tendency to deposit lacquer and coke","correct":true},{"id":"c","text":"It never requires filtration","correct":false}]',
     '{"B1"}'),

    (s9_id, 'MIL-L-7808 is the military specification associated with which grade of turbine oil?',
     '[{"id":"a","text":"Type I turbine oil","correct":true},{"id":"b","text":"Type II turbine oil","correct":false},{"id":"c","text":"Type III turbine oil","correct":false}]',
     '{"B1"}'),

    (s9_id, 'Turbine synthetic oil with a viscosity of around 5 to 5.5 centistokes at 210°F, approved against MIL-PRF-23699F, is referred to as:',
     '[{"id":"a","text":"Type I turbine oil","correct":false},{"id":"b","text":"Type II turbine oil","correct":true},{"id":"c","text":"AVGAS-compatible oil","correct":false}]',
     '{"B1"}'),

    (s9_id, '"Bulk stability" as a required characteristic of turbine oil refers to:',
     '[{"id":"a","text":"Resistance to physical or chemical change resulting from oxidation","correct":true},{"id":"b","text":"The ability of the oil to remain in the tank under high-G maneuvers","correct":false},{"id":"c","text":"The density of the oil at standard sea level conditions","correct":false}]',
     '{"B1"}'),

    (s9_id, 'Regarding mixing of approved turbine oil brands that meet the same military specification, most engine manufacturers:',
     '[{"id":"a","text":"Actively recommend mixing brands to improve seal wear characteristics","correct":false},{"id":"b","text":"Do not recommend indiscriminate mixing, even though the oils are generally compatible","correct":true},{"id":"c","text":"Prohibit the use of any oil not from a single approved brand for the life of the engine","correct":false}]',
     '{"B1"}'),

    (s9_id, 'If turbine oil is ingested by a person, the correct immediate action is to:',
     '[{"id":"a","text":"Induce vomiting immediately without delay","correct":false},{"id":"b","text":"Call a doctor immediately and identify the product and quantity ingested","correct":true},{"id":"c","text":"Drink large quantities of water and wait 24 hours before seeking help","correct":false}]',
     '{"B1"}'),

    (s9_id, 'Compared with AVGAS, turbine engine fuels (jet fuel) are hydrocarbon compounds with:',
     '[{"id":"a","text":"Lower viscosity, higher volatility, and lower boiling points","correct":false},{"id":"b","text":"Higher viscosity, much lower volatility, and higher boiling points","correct":true},{"id":"c","text":"Identical viscosity and volatility, differing only in color","correct":false}]',
     '{"B1"}'),

    (s9_id, 'Approximate maximum vapor pressures show that, among AVGAS, Jet A, and Jet B, volatility ranks from lowest to highest as:',
     '[{"id":"a","text":"Jet A, Jet B, AVGAS","correct":true},{"id":"b","text":"AVGAS, Jet B, Jet A","correct":false},{"id":"c","text":"Jet B, AVGAS, Jet A","correct":false}]',
     '{"B1"}'),

    (s9_id, 'Which turbine fuel type is a wide-cut blend of kerosene and gasoline, primarily used in Alaska and Canada because of its low freezing point?',
     '[{"id":"a","text":"Jet A","correct":false},{"id":"b","text":"Jet A-1","correct":false},{"id":"c","text":"Jet B","correct":true}]',
     '{"B1"}'),

    (s9_id, 'Regarding dye, how does jet fuel compare with AVGAS?',
     '[{"id":"a","text":"Jet fuel is dyed various colors like AVGAS, to distinguish grades","correct":false},{"id":"b","text":"Jet fuel is not dyed; it is colorless or straw colored, unlike dyed AVGAS","correct":true},{"id":"c","text":"Both jet fuel and AVGAS are always dyed the same standard color","correct":false}]',
     '{"B1"}'),

    (s9_id, 'The purity of aviation turbine fuel is most often compromised by:',
     '[{"id":"a","text":"Water","correct":true},{"id":"b","text":"Excess dye concentration","correct":false},{"id":"c","text":"Residual AVGAS contamination","correct":false}]',
     '{"B1"}'),

    (s9_id, 'The recommended procedure for minimizing water entering aircraft fuel tanks is to:',
     '[{"id":"a","text":"Leave the tanks as empty as possible between flights to maximize ventilation","correct":false},{"id":"b","text":"Fill the aircraft fuel tanks immediately after each flight, minimizing the vapor space above the fuel","correct":true},{"id":"c","text":"Add extra dye to the fuel to bind with any dissolved water","correct":false}]',
     '{"B1"}'),

    (s9_id, 'Since turbine engine fuels always contain some water, which of the following is always a threat and can form a bio-film that clogs filters and corrodes tank coatings?',
     '[{"id":"a","text":"Microbial contamination","correct":true},{"id":"b","text":"Excess sulfur precipitation","correct":false},{"id":"c","text":"Dye crystallization","correct":false}]',
     '{"B1"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M15.10 Lubrication Systems (17 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s10_id, 'Which type(s) of lubrication system are used on gas turbine engines?',
     '[{"id":"a","text":"Only wet-sump systems","correct":false},{"id":"b","text":"Only dry-sump systems","correct":false},{"id":"c","text":"Both wet-sump and dry-sump systems","correct":true}]',
     '{"B1"}'),

    (s10_id, 'In a dry-sump turbine lubrication system, where is the bulk of the oil supply stored?',
     '[{"id":"a","text":"In the engine proper, in an integral sump","correct":false},{"id":"b","text":"In an external tank mounted on the engine or nearby aircraft structure","correct":true},{"id":"c","text":"In the accessory gearbox only, with no separate tank","correct":false}]',
     '{"B1"}'),

    (s10_id, 'Why is the exhaust turbine bearing considered the most critical lubricating point in a gas turbine engine?',
     '[{"id":"a","text":"Because of the high temperature normally present at that location","correct":true},{"id":"b","text":"Because it is the only bearing that carries an axial (thrust) load","correct":false},{"id":"c","text":"Because it is the only bearing lubricated by a splash system","correct":false}]',
     '{"B1"}'),

    (s10_id, 'In an oil tank''s baffle assembly, the two flapper check valves normally remain open and close only when:',
     '[{"id":"a","text":"Oil in the bottom of the tank tends to rush to the top of the tank during decelerations","correct":true},{"id":"b","text":"The engine is shut down and cooling","correct":false},{"id":"c","text":"The oil quantity transmitter detects a low-level condition","correct":false}]',
     '{"B1"}'),

    (s10_id, 'The vent line from an oil tank is typically routed through an adjustable check relief valve, usually set to relieve at about:',
     '[{"id":"a","text":"4 psi, to keep positive pressure on the oil pump inlet","correct":true},{"id":"b","text":"50 psi, to prevent tank rupture","correct":false},{"id":"c","text":"0.5 psi, to avoid any pressure buildup at all","correct":false}]',
     '{"B1"}'),

    (s10_id, 'Of the two most common turbine engine oil pump types (gear and gerotor), which is the most commonly used?',
     '[{"id":"a","text":"The gerotor type","correct":false},{"id":"b","text":"The gear type","correct":true},{"id":"c","text":"Neither — centrifugal pumps are most common","correct":false}]',
     '{"B1"}'),

    (s10_id, 'In a turbine engine oil pump, why do the scavenge elements have a greater pumping capacity than the pressure element?',
     '[{"id":"a","text":"To prevent oil from collecting in the bearing sumps of the engine","correct":true},{"id":"b","text":"To increase the maximum oil pressure available to the metering jets","correct":false},{"id":"c","text":"To reduce wear on the pressure element gears","correct":false}]',
     '{"B1"}'),

    (s10_id, 'What is the purpose of the shaft shear section built into a turbine oil pump?',
     '[{"id":"a","text":"It causes the shaft to shear if the pump gears seize and stop turning","correct":true},{"id":"b","text":"It allows manual adjustment of oil pressure during maintenance","correct":false},{"id":"c","text":"It meters the exact ratio of pressure to scavenge oil flow","correct":false}]',
     '{"B1"}'),

    (s10_id, 'Turbine oil filter mesh sizes are measured in:',
     '[{"id":"a","text":"Microns","correct":true},{"id":"b","text":"Millibars","correct":false},{"id":"c","text":"Centistokes","correct":false}]',
     '{"B1"}'),

    (s10_id, 'What is the function of the bypass valve fitted to a turbine oil filter?',
     '[{"id":"a","text":"It prevents oil flow from being stopped if the filter element becomes clogged, at the cost of allowing unfiltered oil through","correct":true},{"id":"b","text":"It increases filtration efficiency by forcing oil through the element twice","correct":false},{"id":"c","text":"It shuts off all oil flow immediately if the filter clogs, to protect the bearings","correct":false}]',
     '{"B1"}'),

    (s10_id, 'Last-chance filters in a turbine lubrication system are located:',
     '[{"id":"a","text":"In the main tank, before the pressure pump inlet","correct":false},{"id":"b","text":"At each bearing, just before the spray nozzle","correct":true},{"id":"c","text":"In the accessory gearbox breather line only","correct":false}]',
     '{"B1"}'),

    (s10_id, 'A pressure-regulating valve in a turbine oil system differs from a simple relief valve in that it:',
     '[{"id":"a","text":"Only opens when the absolute maximum system pressure is exceeded","correct":false},{"id":"b","text":"Keeps system pressure within certain limits throughout normal operation, not just at an absolute maximum","correct":true},{"id":"c","text":"Cannot be adjusted once installed","correct":false}]',
     '{"B1"}'),

    (s10_id, 'On turbine oil systems that use a true relief valve instead of a regulating valve, excess pressure is bypassed to:',
     '[{"id":"a","text":"The inlet side of the oil pump","correct":true},{"id":"b","text":"Overboard, directly to atmosphere","correct":false},{"id":"c","text":"The fuel tank, to be burned with the fuel","correct":false}]',
     '{"B1"}'),

    (s10_id, 'Between the two oil spray methods used at turbine engine bearings, which is considered the better method?',
     '[{"id":"a","text":"The air-oil mist spray, using high-pressure bleed air","correct":false},{"id":"b","text":"The solid oil spray method","correct":true},{"id":"c","text":"Both methods are considered exactly equivalent","correct":false}]',
     '{"B1"}'),

    (s10_id, 'A deoiler separates oil from breather air by:',
     '[{"id":"a","text":"Passing the air/oil mist through a fine paper filter element","correct":false},{"id":"b","text":"Spinning the mixture in an impeller so centrifugal force drives the oil to the outer wall","correct":true},{"id":"c","text":"Cooling the mixture until the oil freezes and can be separated mechanically","correct":false}]',
     '{"B1"}'),

    (s10_id, 'Magnetic chip detectors in a turbine lubrication system are used to:',
     '[{"id":"a","text":"Detect and catch ferrous (magnetic) particles present in the oil","correct":true},{"id":"b","text":"Measure the exact oil flow rate through the scavenge system","correct":false},{"id":"c","text":"Regulate oil pressure at the bearing spray nozzles","correct":false}]',
     '{"B1"}'),

    (s10_id, 'In a wet-sump turbine lubrication system, what indicates the oil level in the sump?',
     '[{"id":"a","text":"A sight gauge","correct":true},{"id":"b","text":"The oil pressure regulating valve position","correct":false},{"id":"c","text":"The breather pressurizing valve setting","correct":false}]',
     '{"B1"}');

END $$;
