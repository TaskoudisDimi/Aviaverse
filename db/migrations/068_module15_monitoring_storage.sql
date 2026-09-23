-- Module 15: Gas Turbine Engine (B1) — Engine Monitoring and Ground Operation, Engine Storage and Preservation
-- Source: EASA Part-66 Module 15 official textbook (Gas Turbine Engine), Sub-Modules 21 and 22

DO $$
DECLARE
    m15_id INT;
    s21_id INT;
    s22_id INT;
BEGIN
    SELECT id INTO m15_id FROM easa_modules WHERE code = 'M15';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M15.21') THEN
        RAISE NOTICE 'M15.21-M15.22 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 15.21: Engine Monitoring and Ground Operation
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m15_id, 'M15.21', 'Engine Monitoring and Ground Operation',
        $cnt$
# Engine Monitoring and Ground Operation

## Turbine Engine Starting

The engine operating procedures presented here apply generally to turbofan, turboprop, turboshaft, and auxiliary power units (APU). The procedures, pressures, temperatures, and rpm involved are intended primarily as a guide and do not have general application — the manufacturer's operating instructions should always be consulted before starting and operating any turbine engine.

A turbofan engine has only one power control lever. Adjusting the power (throttle) lever sets up a thrust condition for which the fuel control meters fuel to the engine. Engines equipped with thrust reversers go into reverse thrust at throttle positions below idle, and a separate fuel shutoff lever is usually provided on such engines.

Prior to start, particular attention should be paid to the engine air inlet, the visual condition and free movement of the compressor and turbine assembly, and the parking ramp area fore and aft of the aircraft. The engine is started using an external air power source, an APU, or an already-operating engine. On multi-engine aircraft, engines are usually started by an onboard APU supplying air pressure for a pneumatic starter on each engine.

During the start, it is necessary to monitor the **tachometer**, the **oil pressure**, and the **exhaust gas temperature (EGT)**. The normal starting sequence is:

1. Rotate the compressor with the starter;
2. Turn the ignition on; and
3. Open the engine fuel valve, either by moving the throttle to idle or by moving a fuel shutoff lever or turning a switch.

Adherence to the prescribed procedure is necessary as a safety measure and to avoid a hot or hung start. A successful start is noted first by a rise in EGT.

- A **hot start** occurs when the engine does not light off within a prescribed period, or the EGT starting temperature limit is exceeded — the starting procedure should be aborted. If necessary, the engine is cleared of trapped fuel or gases by continuing to rotate the compressor with the starter, but with ignition and fuel turned off. If the engine did not light off after the allotted time — about **10 seconds**, although this varies engine to engine — the fuel must be shut off, since the engine is being filled with unburned fuel.
- A **hung start** is when the engine lights off but will not accelerate to idle rpm.

## Ground Operation Engine Fire

If an engine fire occurs, or the fire warning light illuminates during the starting cycle, move the fuel shutoff lever to OFF and continue cranking or motoring the engine until the fire has been expelled. If the fire persists, CO₂ can be discharged into the inlet duct while it is being cranked. **Do not discharge CO₂ directly into the engine exhaust**, because it may damage the engine. If the fire cannot be extinguished, secure all switches and leave the aircraft. If the fire is on the ground under the engine overboard drain (or at the tailpipe with fuel dripping and burning on the ground), discharge the CO₂ on the ground rather than on the engine.

## Engine Checks and Takeoff Thrust

Checking turbofan engines for proper operation consists primarily of reading the engine instruments and comparing observed values with those known to be correct for the given operating condition. After start, once idle rpm has been attained and readings have stabilized, the engine should be checked for satisfactory operation at idling speed: the **oil pressure indicator**, **tachometer**, and **EGT** readings should be compared with the allowable ranges.

**Takeoff thrust** is checked by adjusting the throttle to obtain a single, predicted reading on the **Engine Pressure Ratio (EPR)** indicator. The EPR value representing takeoff thrust for the prevailing ambient conditions is calculated from a takeoff thrust setting curve or, on newer aircraft, by an onboard computer. The curve is computed for **static conditions**, so for precise thrust checking the aircraft should be stationary with stable engine operation established. If an engine develops the predicted thrust and all other engine instruments read within their proper ranges, engine operation is considered satisfactory. **Full Authority Digital Engine Controls (FADEC)** also provide means of checking the engine, with results displayed on the flight deck.

### Ambient Conditions

The sensitivity of gas turbine engines to compressor inlet air temperature and pressure requires considerable care in obtaining correct ambient values when computing takeoff thrust:

1. The engine senses air temperature and pressure at the compressor inlet — the actual air temperature just above the runway surface. When the aircraft is stationary, the pressure at the compressor inlet is the **static field (true barometric) pressure**, *not* the barometric pressure corrected to sea level normally reported as the altimeter setting. On FADEC engines, the computer reads this information directly.
2. The temperature sensed is the **Total Air Temperature (TAT)**, used by several onboard computers; engine controls set the engine computers according to TAT.
3. **Relative humidity**, which appreciably affects reciprocating engine power, has a **negligible effect** on turbine engine thrust, fuel flow, and rpm, and is therefore not usually considered when computing takeoff thrust or determining fuel flow/rpm for routine operation.

## Engine Shutdown

On a turbine engine without a thrust reverser, retarding the throttle to idle or power lever to OFF cuts fuel supply and shuts the engine down. Engines with thrust reversers use a separate fuel shutoff lever or switch. After operation at high power levels for extended periods, a **cool-down period** should be allowed — it is recommended the engine be operated at or below a low power setting, preferably idle, for about **5 minutes** before shutdown, to prevent possible seizure of the rotors. This applies particularly to prolonged high-rpm ground operation such as engine trimming.

The turbine case and turbine wheels operate at approximately the same temperature while running, but the turbine wheels are relatively massive compared with the case and do not cool as readily. The case, exposed to cooling air both inside and outside the engine, cools faster and tends to **shrink upon the still-rotating wheels**. Under extreme conditions the turbine blades may squeal or seize; a cooling period is required after prolonged high-speed operation. Should the turbine wheels seize, no harm normally results provided no attempt is made to turn the engine over until it has cooled sufficiently to free the wheels — but every effort should be made to avoid seizure.

To ensure fuel remains in the lines and engine-driven fuel pumps (which are lubricated by fuel) are not starved, the aircraft fuel boost pump must be turned off **after**, not before, the throttle or fuel shutoff lever is placed OFF. Generally, an engine should not be shut down by the fuel shutoff lever until after the throttle has been retarded to idle — because the fuel shutoff valve is located on the fuel control discharge, a shutdown from high thrust settings results in high fuel pressures within the control that can harm fuel system parts.

When an accurate oil level reading is needed following shutdown, the engine should be operated and shut down with the oil check taking place within not more than **30 minutes** after shutdown (consult engine manuals for the specific procedure).

## Turboprop Operation

Turboprop engine operation closely resembles turbojet operation, except for the added feature of a propeller. The turboprop chiefly requires attention to engine operating limits, the throttle/power lever setting, and the **torquemeter pressure gauge**. Torquemeters indicate only the power supplied to the propeller, not the equivalent shaft horsepower, but torquemeter pressure is approximately proportional to the **total power output** and is thus used as a measure of engine performance. The torquemeter pressure reading during the takeoff engine check is important, and the takeoff power computation determines the maximum allowable EGT and torquemeter pressure a normally functioning engine should produce for the prevailing ambient temperature and barometric pressure.

## Troubleshooting Turbine Engines

Only the most common malfunctions can practically be listed; a thorough knowledge of engine systems combined with logical reasoning solves most problems. Typical indicated malfunctions and their probable causes include:

| Indicated Malfunction | Probable Cause |
|---|---|
| Low rpm, EGT, and fuel flow at expected EPR | High reading error in EPR indication (e.g. leaking inlet pressure line) |
| High rpm, EGT, and fuel flow at expected EPR | Low reading error in EPR indication (misaligned/cracked discharge probe, line leak, carbon in line) |
| High EGT, low rpm, high fuel flow at all EPR settings | Possible turbine damage / loss of turbine efficiency |
| Engine vibrates throughout rpm range, amplitude reduces as rpm reduced | Turbine damage |
| Engine vibrates at high rpm and fuel flow (constant EPR) | Damage in compressor section |
| Engine vibrates throughout rpm range, more pronounced at cruise/idle | Engine-mounted accessory fault (constant-speed drive, generator, hydraulic pump, etc.) |
| High oil temperature, no change in power parameters | Engine main bearings (check scavenge oil filters and magnetic plugs) |
| High EGT during takeoff/climb/cruise, high rpm and fuel flow | Bleed-air valve malfunction, or discharge pressure probe/line leaking |
| High EGT at target EPR for takeoff | Engine out of trim — check with jetcal and re-trim |

For turboprop engines, troubleshooting the reduction gear, torquemeter, and power section is combined because of their interrelationships. Examples include: a power unit failing to turn over may be due to no air to the starter or a locked propeller brake; engine speed cycling after start indicates unstable fuel control governor operation; oil leakage at accessory drive seals indicates seal failure; inability to reach maximum controlled speed may indicate a faulty propeller governor or faulty fuel control/air-sensing tip; high vibration indication should first be checked against a possible faulty vibration pickup or meter before removing the power unit for overhaul.

## Spectrometric Oil Analysis Program (SOAP)

The Spectrometric Oil Analysis Program allows an oil sample to be analyzed for the presence of minute metallic elements. Because oil circulates throughout the engine, every lubricant in service accumulates microscopic **wear metal** particles. Oil analysis programs identify and measure these particles in **parts per million (PPM)** by weight; an increase in PPM of certain materials can signal component wear or impending failure, allowing repair or inspection to be ordered before a small problem becomes a large one or leads to complete engine failure. The procedure is used for both turbine and reciprocating engines.

Typical wear metals and their sources:

| Metal | Typical Source |
|---|---|
| Iron | Rings, shafts, gears, valve train, cylinder walls, pistons |
| Chromium | Chromed parts (rings, liners) and some coolant additives |
| Nickel | Secondary indicator — certain bearings, shafts, valves, valve guides |
| Aluminum | Pistons, rod bearings, certain bushings |
| Lead | Mostly tetraethyl lead contamination |
| Copper | Bearings, bushings, thrust washers, bronze/brass parts, additives |
| Tin | Bearings |
| Silver | Silver-containing bearings; secondary indicator of oil cooler problems |
| Titanium | Alloy in high-quality steel gears and bearings |
| Molybdenum | Gear or ring wear; also an oil additive |
| Phosphorous | Antirust agents, spark plugs, combustion chamber deposits |

## Vibration Monitoring

Monitoring turbine engine spools for vibration can be part of the on-board aircraft monitoring capability, or an independent vibration monitoring device can be used. Always follow the manufacturer's instructions for any vibration monitoring device, and consult the engine maintenance manual for acceptable limits.

## Borescope Inspection

A **borescope** is an optical viewing device inserted through a small opening in an engine case to view the interior of the engine. A simple borescope has a rigid or flexible fiber optic wand: light is projected into the wand and shines on the area where the tip is positioned, with an eyepiece at the other end for viewing. Some borescopes magnify; more modern borescopes are digital cameras capable of capturing still and video images.

Because turbine engines require relatively little maintenance despite providing hours of reliable service, borescoping allows a technician to inspect the interior gas path without the lengthy process of disassembling the engine. Many engines have ports plugged during normal operation that can be removed to give borescope access to important internal areas; periodic borescope inspections may be required on some engines.

## Turbine Engine Maintenance

Turbine powerplant maintenance procedures vary widely with engine design and construction; the manufacturer's recommended detailed procedures should always be followed. For inspection purposes, the turbine engine is divided into two main sections: the **cold section** (compressor) and the **hot section** (combustion and turbine).

### Compressor Section

Damage to compressor blades can cause engine failure, and much of this damage arises from foreign matter drawn into the air intakes. The atmosphere near the ground is filled with tiny particles of dirt, oil, soot, and other matter; a large volume of air enters the compressor, and centrifugal force throws dirt particles outward to coat the casing, vanes, and blades. This dirt accumulation reduces blade aerodynamic efficiency — similar to the effect of icing on an aircraft wing — causing unsatisfactory acceleration and high EGT. Periodic inspection, cleaning, and repair of compressor components remedies the condition.

**Compressor blade inspection and repair:** Minor damage may be repaired if it can be removed without exceeding manufacturer-established limits. Well-rounded leading/trailing edge damage in the outer half of the blade only, within specified indentation limits, is usually acceptable without rework; damage on the inner half must be treated with extreme caution. Repaired blades are inspected by magnetic particle or fluorescent penetrant methods to confirm all damage traces are removed, and repairs must be well blended with a smooth surface finish — no cracks of any extent are tolerated. Rework should be performed by hand (stones, files, emery cloth) parallel to the blade length; **a power tool must not be used to buff the entire area of the blade**. Typical repair limit areas (A–E) are specified separately for steel and titanium blades and by compressor stage; for example, in blade Area D (a depth-limited area), typical repair limits allow up to .008 in for steel blades in stages 1–4 (.005 in in stages 5–9), while **titanium blades permit no repair at all in Area D**.

On centrifugal-flow engines, the compressor inducer is inspected (after removing the air-inlet screen) with a strong light while slowly turning the compressor; a crack in the leading edge is usually cause for component rejection. Inducers are repaired by stoning out and blending nicks and dents in the critical band, with a generous radius applied at blend edges and smoothing with crocus cloth.

Air intake guide vanes, swirl vanes, and screens on centrifugal-flow engines are inspected with a strong light for breaks, rips, holes, looseness, cracks, and dents from foreign-particle impingement; the downstream edge of guide vanes is inspected very closely, since cracks are more prevalent there. Cracks that branch or fork, risking a piece breaking free into the compressor, are cause for vane rejection. Vanes must never be repaired by straightening, brazing, welding, or soldering — only blending with crocus cloth, fine files, and stones (to minimize stress concentration at dents, scratches, or cracks). Trailing edge damage may be blended if one-third of the weld seam remains after repair.

### Blade Damage Terminology

| Term | Description | Usual Cause |
|---|---|---|
| Blend | Smooth repair of a ragged edge/surface into the surrounding contour | — |
| Bow | Bent blade | Foreign objects |
| Burning | Discoloration, or in severe cases flow of material | Excessive heat |
| Burr | A ragged or turned-out edge | Grinding or cutting operation |
| Corrosion (pits) | Breakdown of the surface; pitted appearance | Corrosive agents, moisture |
| Cracks | A partial fracture | Excessive stress, defective material, overheating |
| Dent | Small, smoothly rounded hollow | Striking by a dull object |
| Gall | Transfer of metal from one surface to another | Severe rubbing |
| Gouging | Displacement of material; cutting/tearing effect | Large foreign body between moving parts |
| Growth | Elongation of the blade | Continued/excessive heat and centrifugal force |
| Score | Deep scratches | Chips between surfaces |
| Scratch | Narrow, shallow marks | Sand/fine particles, careless handling |

**Causes of blade damage — FOD:** Loose objects (pencils, tools, flashlights) often enter an engine accidentally or through carelessness and can damage fan blades; **never carry objects in pockets** when working around operational turbine engines. A compressor rotor can be damaged beyond repair by tools left in the air intake and drawn in on subsequent starts — checking tools against a tool checklist and inspecting inlet ducts before starting (for nuts, bolts, lock wire, or tools left behind) are simple preventive measures. Corrosion pitting on compressor stator vanes of axial-flow engines is not considered serious if within allowed tolerance.

### Combustion Section Inspection

Inspection and cleaning of the **hot section** (combustion and turbine) is one of the controlling factors in turbine engine service life. Before the combustion case is opened, the external case is inspected for hotspots, exhaust leaks, and distortion; once opened, combustion chambers are inspected for localized overheating, cracks, or excessive wear, and the first-stage turbine blades, nozzle guide vanes, combustion chamber outlet ducts, and turbine nozzle are inspected for cracks, warping, or FOD. **Cracking is one of the most frequent discrepancies** detected during hot-section inspection; acceptable limits must always be referred to the applicable manufacturer's manual.

Cleaning the hot section is not usually necessary for a field repair, except in areas of high salt water or other chemicals, where a turbine rinse should be performed. Engine parts can be degreased using emulsion-type cleaners (safe for all metals, neutral and non-corrosive) or chlorinated solvents (which leave parts absolutely dry — parts not undergoing further cleaning should then be sprayed with a corrosion-preventive solution). Most engines require the combustion case to be opened to inspect the hot section, and during reassembly extreme care must be taken to prevent dirt, dust, cotter pins, lock wire, nuts, washers, or other foreign material from entering the engine.

### Marking Materials for Combustion Section Parts

Certain materials may be used for temporary marking during assembly/disassembly (always per manufacturer information): **layout dye (lightly applied) or chalk** may mark parts directly exposed to the gas path (turbine blades and disks, turbine vanes, combustion chamber liners). A **wax marking pencil** may be used for parts not directly exposed to the gas path, but must never be used on a liner surface or turbine rotor. **Carbon alloy or metallic pencils are not recommended**, due to the possibility of causing intergranular corrosion attack that could reduce material strength and cause cracking.

### Inspection and Repair of Combustion Chambers

Combustion chambers and covers are inspected for cracks using visible dye or **fluorescent penetrant inspection**; cracks, nicks, or dents are usually cause for rejection. Covers are checked around the fuel drain bosses for pits or corrosion. If there is doubt that a liner is serviceable, it should be replaced. Chambers should be replaced or repaired if two cracks progressing from a free edge are close to meeting (risking a piece breaking loose that could damage the turbine); separate baffle cracks are acceptable, but cracks in the cone or swirl vanes are cause for liner rejection (loose swirl vanes may be repaired by silver brazing). Moderate buckling and associated cracks are acceptable in the row of cooling holes; more severe buckling causing pronounced shortening or tilting of the liner is cause for rejection. Fretting on external liner location pads after long operation is acceptable provided no resultant cracks or perforation appear.

### Fuel Nozzle and Support Assemblies

Carbon deposits are cleaned from nozzles by washing with an approved cleaning fluid and removing softened deposits with a soft bristle brush, with filtered air passed through during cleaning. **Nozzles must not be cleaned by scraping with a hard implement or rubbing with a wire brush**, since this can impair spray characteristics. Each fuel nozzle component is inspected for nicks and burrs; many nozzles can be checked by flowing fluid through under pressure and examining the flow pattern.

### Turbine Section

**Turbine disk inspection:** crack detection is mostly visual, aided by penetrant and other structural inspection methods. **Cracks on the disk are not normally allowed** and necessitate rejection of the disk and replacement of the turbine rotor. Slight pitting from foreign-matter impingement may be blended by stoning and polishing.

**Turbine blade inspection:** turbine blades are inspected and cleaned similarly to compressor blades but, due to the extreme heat they operate under, are more susceptible to damage. Using a strong light and magnifying glass, blades are inspected for **stress rupture cracks** (minute hairline cracks, usually on or across the leading/trailing edge at a right angle to the edge, ranging from one-sixteenth inch upward) and deformation (waviness, or varying airfoil thickness along the leading edge, caused by over-temperature). When such cracks or deformation are found on first-stage blades, an over-temperature condition must be suspected, and individual blades should be checked for stretch and the disk for hardness and stretch. The outer shroud is checked for air seal wear; if the remaining radial thickness is below specification, the stretched blade must be replaced. Blade tip curling within a one-half-inch square area on the leading edge is usually acceptable if not sharp; any sharp bend risking cracking or a piece breaking out is cause for rejection even within otherwise allowable limits.

**Turbine blade replacement:** blades are generally replaceable subject to moment-weight limitations in the manufacturer's technical instructions. If several blades are broken, cracked, or eroded, replacing the entire turbine assembly may be more economical than replacing individual blades. In an initial buildup, a complete set of **54 blades**, made in coded pairs, is laid out in order of diminishing moment-weight: the heaviest pair is numbered 1 and 28, the next heaviest 2 and 29, the third heaviest 3 and 30, and so on. Blade number 1 is installed adjacent to a number-1 mark on the disk hub, with remaining blades installed consecutively in a **clockwise direction viewed from the rear face of the turbine disk**. If a blade requires replacement, the diametrically opposite blade must also be replaced.

**Turbine nozzle inlet guide vane inspection:** performed after removing required components to access the first-stage turbine blades and nozzle vanes. Slight nicks and dents are permissible within limits, and small nicks that blend out smoothly are not cause for vane rejection. Nozzle vane supports are inspected for foreign-particle impingement defects. A maximum number of turbine nozzle vanes may be replaceable in some engines; if more than that maximum are damaged, **a new turbine nozzle vane assembly must be installed**.

**Clearances:** checking turbine section clearances is part of turbine maintenance; the manufacturer's service and overhaul manual gives procedures and tolerances, and special tools provided by the manufacturer must be used for accurate readings.

### Exhaust Section

The exhaust section is susceptible to heat cracking and must be thoroughly inspected along with the combustion and turbine sections. The exhaust cone and nozzle are inspected for cracks, warping, buckling, or hotspots. **Hotspots on the tail cone are a good indication of a malfunctioning fuel nozzle or combustion chamber.**

## Turbine Engine Accessories

Turbine engine accessories should be inspected and maintained in accordance with the engine or aircraft manufacturer's maintenance manual, following all instructions for proper servicing. Overhaul of turbine engine accessories is typically performed at an overhaul shop per the component manufacturer's specification.

## Compressor Washing and Cleaning

Gradual accumulation of dirt and contaminants on rotor and stator blades changes blade shape and reduces efficiency, adversely affecting engine performance. Airborne contaminants — dust, soot, smoke, salt, or chemical emissions — build up on internal engine surfaces over time; much of this can be removed with a **compressor wash**, in which the entire engine gas path is washed with water or a water/cleaning-solution mixture as recommended by the manufacturer. Since the compressor is where contaminants enter, it benefits most from the wash. Generally the engine is rotated with the starter while wash solution is sprayed into the first-stage compressor blades, with a soaking period specified and the procedure repeated; water used should be relatively free from solids and salt, and only the specified cleaning agent should be used.

**Grit blasting** is another compressor cleaning procedure, in which walnut shell grit or apricot pit grit is introduced into the operating engine at specified power settings. This abrasive more effectively cleans the compressor, but the grit is burned in the combustion section, leaving the turbine untreated. Extreme caution must be exercised near an operating turbine engine — never stand directly in the intake air path, since severe injury or death can result from being ingested.

## Foreign Object Damage (FOD)

FOD is an ongoing issue for the safe operation of aircraft engines, especially turbine engines with intake airflow powerful enough to lift objects off the ramp and feed them into the engine. Ingestion of foreign matter causes damage or degrades performance, ultimately shortening engine life. All technicians must be vigilant for foreign objects on hangar floors and ramp surfaces; ramp and run-up areas must be regularly swept to remain clear of foreign objects. Nuts, bolts, trash, safety wire, and rags should never be cast on the ground when working around aircraft; where this is unavoidable during extensive maintenance, a thorough clean-up including sweeping should occur before engines are operated. Maintenance tools are a very significant FOD threat — technicians must develop good working practices, including accounting for all tools before a job is considered complete, and a neatly organized toolbox with a returned-tools check is highly recommended.
        $cnt$,
        21
    ) RETURNING id INTO s21_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 15.22: Engine Storage and Preservation
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m15_id, 'M15.22', 'Engine Storage and Preservation',
        $cnt2$
# Engine Storage and Preservation

## General

An engine awaiting overhaul or return to service must be given careful attention, since it does not receive the daily care needed to detect and correct early stages of corrosion. Engines that are not flown regularly may not achieve normal service life because of corrosion: the normal combustion process creates moisture and corrosive by-products that attack unprotected surfaces once the engine is inactive. Under favorable atmospheric conditions, engines can remain inactive for several weeks without evidence of corrosion damage — the best-case scenario. Aircraft that operate close to oceans, lakes, rivers, and humid regions have a greater need for engine preservation than those operated in dry, low-humidity areas; in areas of high susceptibility, corrosion formation can occur in a matter of days.

## Corrosion-Preventive Materials

An engine in service is, in a sense, self-purging of moisture: the heat of combustion evaporates surrounding moisture, and circulating lubricating oil temporarily forms a protective coating on the metal it contacts. When engine operation is limited or suspended, the engine is preserved to a varying extent depending on how long it will be inoperative. There are three types of engine storage:

| Storage Type | Definition |
|---|---|
| **Active storage** | At least one continuous hour of operation with oil temperature of **165 °F to 200 °F**; storage time not to exceed **30 days** |
| **Temporary storage** | Aircraft/engine not flown for **30 to 90 days** |
| **Indefinite storage** | Aircraft not flown for **over 90 days**, or engine removed from the aircraft for extended time |

## Corrosion-Preventive Compounds

Corrosion-preventive compounds are petroleum-based products that form a wax-like film over the metal to which they are applied, manufactured to different specifications for various aviation needs. The type mixed with engine oil to form a corrosion-preventive mixture is a relatively light compound that readily blends with engine oil when heated to the proper temperature. This light mixture is available in three forms per MIL-C-6529C:

- **Type I** — a concentrate, blended with three parts of MIL-L-22851 or MIL-L-6082C (SAE J1966) grade 1100 oil to one part concentrate
- **Type II** — a ready-mixed material with MIL-L-22851 or grade 1100 oil, requiring no dilution
- **Type III** — a ready-mixed material with grade 1010 oil, for use in **turbine engines only**

The light mixture is intended for use when a preserved engine is to remain inactive for **less than 30 days**, and is also used to spray cylinders and other designated areas. The desired proportions of lubricating oil and corrosion-preventive compound must **not** be obtained by adding the compound to the oil already in the engine — the mixture must be prepared separately before application. A heavy compound is used for dip-treating metal parts and surfaces and must be heated to a high temperature to be sufficiently liquid to effectively coat the objects. A commercial solvent or kerosene spray is used to remove corrosion-preventive compounds when preparing an engine for return to service.

Although corrosion-preventive compounds act as a moisture insulator, in the presence of excessive moisture they eventually break down and corrosion begins; the compounds also eventually dry out as their oil base evaporates, allowing moisture to reach the metal. Therefore, when an engine is stored in a shipping case or container, a **dehydrating (moisture-removing) agent** must also be used.

## Dehydrating Agents

Substances referred to as **desiccants** can absorb moisture from the atmosphere in sufficient quantities to be useful as dehydrators. One of these is **silica gel**, an ideal dehydrating agent since it does not dissolve when saturated. Bags of silica gel are placed around and inside various accessible parts of a stored engine as a corrosion preventive.

## Engine Shipping Containers

For protection, engines are sealed in plastic or foil envelopes and packed in a wooden shipping case or pressurized metal container. The engine is lowered into the shipping container so the mounting plate can be bolted into position, with the protective envelope attached directly to the base of the shipping case.

Before the protective envelope is sealed, silica gel is placed around the engine to dehydrate the sealed air; the amount used depends on engine size. The envelope is gathered around the engine and partially sealed, leaving an opening at one end from which as much air as possible is exhausted — a **vacuum** applied to the container is useful for this and also aids in detecting leaks. The envelope is then completely sealed, usually by pressing the edges together and fusing them with heat. Before lowering the shipping case cover, a quick inventory should be made, the **humidity indicator card** positioned to be visible through the inspection window, and the cover secured with the date of preservation stenciled or marked on the case, along with whether the engine is repairable or serviceable.

Another type of container allows horizontal installation of an engine, eliminating the need for an extra hoist. Silica gel bags are packed into the container, usually in a special section; the amount of silica gel required in a **metal container is generally greater** than in a wooden shipping case, since the volume of air in the metal container is much greater, and the silica gel must dehydrate the interior of the engine itself (ventilatory plugs, rather than dehydrator plugs, are normally installed in the engine openings). All records of the engine should be enclosed inside the container or attached outside for accessibility. After the container top is secured to the base, **dehydrated air at approximately 5 psi** is forced into the container, which should be checked for leaks by occasional rechecks of air pressure, since radical temperature changes affect the pressure reading.

## Inspection of Stored Engines

Most maintenance shops provide a scheduled inspection system for engines in storage:

- The humidity indicator on engines stored in **wooden shipping cases** is normally inspected every **30 days**. If the protective envelope must be opened to inspect the indicator, the inspection period may be extended to every **90 days**, if local conditions permit.
- The humidity indicator of a **metal container** is inspected every **180 days** under normal conditions.

If the humidity indicator in a wooden shipping case shows more than **30 percent relative humidity** present in the air around the engine, all desiccants should be replaced. If more than half of the dehydrator plugs installed in the spark plug holes indicate excessive moisture, the interior of the cylinders should be re-sprayed. If the humidity indicator in a metal container gives a safe (blue) indication but air pressure has dropped below **1 psi**, the container needs only to be brought back to proper pressure with dehydrated air. However, if the humidity indicator shows an unsafe (**pink**) condition, the engine should be **represerved**.

## Preservation and Depreservation of Gas Turbine Engines

The procedures for preserving and depreserving gas turbine engines vary depending on the length of inactivity, the type of preservative used, and whether the engine may be rotated during the inactive period. Much of the general corrosion-control information above applies to gas turbine engines, but the required types of preservatives and their use are normally different. The lubrication system is usually drained and may or may not be flushed with preservative oil. The engine fuel system is generally filled with preservative oil, including the fuel control. Before the engine can be returned to service, the preservative oil must be **completely flushed from the fuel system by motoring the engine and bleeding the fuel system**. The manufacturer's instructions must always be followed when performing preservation or depreservation of gas turbine engines.

## Preservation and Depreservation of Engine Accessories

The preservation and depreservation of engine accessories is done independently of the engine, following the component manufacturer's instructions on how to store components safely for a long period of time. As with the engine itself, the basic concern is the threat of **corrosion** while in storage.
        $cnt2$,
        22
    ) RETURNING id INTO s22_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M15.21 Engine Monitoring and Ground Operation (23 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s21_id, 'During a typical turbine engine start, what three parameters must be monitored?',
     '[{"id":"a","text":"Tachometer, oil pressure, and exhaust gas temperature","correct":true},{"id":"b","text":"Fuel flow, cabin altitude, and hydraulic pressure","correct":false},{"id":"c","text":"Oil temperature, N2 only, and vibration","correct":false}]',
     '{"B1"}'),

    (s21_id, 'The normal turbine engine starting sequence is:',
     '[{"id":"a","text":"Rotate compressor with the starter, turn ignition on, then open the fuel valve","correct":true},{"id":"b","text":"Open the fuel valve, turn ignition on, then rotate compressor with the starter","correct":false},{"id":"c","text":"Turn ignition on, open the fuel valve, then rotate the compressor","correct":false}]',
     '{"B1"}'),

    (s21_id, 'A hot start during engine starting should be aborted if:',
     '[{"id":"a","text":"The engine does not light off within the prescribed time, or the EGT starting limit is exceeded","correct":true},{"id":"b","text":"The tachometer briefly fluctuates during rotation","correct":false},{"id":"c","text":"Oil pressure is slightly above the normal idle range","correct":false}]',
     '{"B1"}'),

    (s21_id, 'A "hung start" is defined as a condition where:',
     '[{"id":"a","text":"The engine lights off but will not accelerate to idle rpm","correct":true},{"id":"b","text":"The engine fails to light off at all within the allotted time","correct":false},{"id":"c","text":"The starter motor fails to engage the compressor","correct":false}]',
     '{"B1"}'),

    (s21_id, 'If an engine fire occurs during starting and CO2 is used to fight it, the CO2 should:',
     '[{"id":"a","text":"Be discharged into the inlet duct while cranking continues, never directly into the exhaust","correct":true},{"id":"b","text":"Always be discharged directly into the engine exhaust for fastest effect","correct":false},{"id":"c","text":"Only be used after the aircraft has been fully evacuated","correct":false}]',
     '{"B1"}'),

    (s21_id, 'Checking turbofan engines for proper operation at idle consists primarily of comparing observed readings against allowable ranges for which instruments?',
     '[{"id":"a","text":"Oil pressure indicator, tachometer, and exhaust gas temperature","correct":true},{"id":"b","text":"Cabin pressure, fuel quantity, and hydraulic pressure","correct":false},{"id":"c","text":"Airspeed indicator, altimeter, and vertical speed indicator","correct":false}]',
     '{"B1"}'),

    (s21_id, 'Takeoff thrust on a turbofan is normally checked by adjusting the throttle to obtain a predicted reading on the:',
     '[{"id":"a","text":"Engine Pressure Ratio (EPR) indicator","correct":true},{"id":"b","text":"Oil pressure indicator only","correct":false},{"id":"c","text":"Fuel flow indicator only","correct":false}]',
     '{"B1"}'),

    (s21_id, 'For precise takeoff thrust checking using the thrust setting curve, the aircraft should be:',
     '[{"id":"a","text":"Stationary, with stable engine operation established, since the curve is computed for static conditions","correct":true},{"id":"b","text":"Taxiing at a steady groundspeed","correct":false},{"id":"c","text":"Airborne at a stabilized climb speed","correct":false}]',
     '{"B1"}'),

    (s21_id, 'When the aircraft is stationary, the pressure sensed at the compressor inlet for thrust computation purposes is:',
     '[{"id":"a","text":"The static field (true barometric) pressure, not the sea-level-corrected altimeter setting","correct":true},{"id":"b","text":"Always the standard sea-level pressure of 1013.25 mb regardless of field elevation","correct":false},{"id":"c","text":"The barometric pressure corrected to sea level, as reported by the control tower","correct":false}]',
     '{"B1"}'),

    (s21_id, 'Compared with its effect on reciprocating engine power, relative humidity''s effect on turbine engine thrust, fuel flow, and rpm is:',
     '[{"id":"a","text":"Negligible, so it is not usually considered for takeoff thrust or routine fuel flow/rpm calculations","correct":true},{"id":"b","text":"Just as significant, and must always be included in EPR calculations","correct":false},{"id":"c","text":"More significant than on a reciprocating engine","correct":false}]',
     '{"B1"}'),

    (s21_id, 'Before shutting down a turbine engine that has been operated at high power for an extended period, it is recommended that the engine be operated at or below a low power setting, preferably idle, for approximately:',
     '[{"id":"a","text":"5 minutes, to help prevent possible seizure of the rotors","correct":true},{"id":"b","text":"30 minutes, to allow the oil to fully cool","correct":false},{"id":"c","text":"No cool-down period is ever required","correct":false}]',
     '{"B1"}'),

    (s21_id, 'After a turbine engine is shut down, the turbine case tends to cool faster than the turbine wheels because:',
     '[{"id":"a","text":"The wheels are relatively massive and are not cooled as readily as the case, which is exposed to cooling air on both sides","correct":true},{"id":"b","text":"The wheels are made of a material with much higher thermal conductivity than the case","correct":false},{"id":"c","text":"The case continues to receive combustion heat after shutdown while the wheels do not","correct":false}]',
     '{"B1"}'),

    (s21_id, 'The aircraft fuel boost pump should be turned off:',
     '[{"id":"a","text":"After, not before, the throttle or fuel shutoff lever is placed in the OFF position","correct":true},{"id":"b","text":"Before the throttle or fuel shutoff lever is placed in the OFF position","correct":false},{"id":"c","text":"At the same instant as the fuel shutoff lever, simultaneously","correct":false}]',
     '{"B1"}'),

    (s21_id, 'On a turboprop engine, torquemeter pressure indicates:',
     '[{"id":"a","text":"Only the power supplied to the propeller, but is approximately proportional to total power output","correct":true},{"id":"b","text":"The equivalent shaft horsepower directly, with no need for further computation","correct":false},{"id":"c","text":"Exhaust gas temperature only, unrelated to power output","correct":false}]',
     '{"B1"}'),

    (s21_id, 'According to typical turbine engine troubleshooting guidance, an engine that vibrates throughout the rpm range but with amplitude reducing as rpm is reduced most likely indicates:',
     '[{"id":"a","text":"Turbine damage","correct":true},{"id":"b","text":"A faulty airspeed indicator","correct":false},{"id":"c","text":"Normal operation requiring no action","correct":false}]',
     '{"B1"}'),

    (s21_id, 'The Spectrometric Oil Analysis Program identifies and measures microscopic wear metal particles in an oil sample in units of:',
     '[{"id":"a","text":"Parts per million (PPM) by weight","correct":true},{"id":"b","text":"Percent by volume","correct":false},{"id":"c","text":"Grams per litre","correct":false}]',
     '{"B1"}'),

    (s21_id, 'In spectrometric oil analysis, an elevated level of silver in the sample is most typically associated with wear of:',
     '[{"id":"a","text":"Silver-containing bearings, and secondarily can indicate an oil cooler problem","correct":true},{"id":"b","text":"Combustion chamber deposits only","correct":false},{"id":"c","text":"Spark plug electrodes only","correct":false}]',
     '{"B1"}'),

    (s21_id, 'A borescope is best described as:',
     '[{"id":"a","text":"An optical viewing device inserted through a small opening in the engine case to inspect the interior without disassembly","correct":true},{"id":"b","text":"An electrical device that measures vibration amplitude across the engine spool","correct":false},{"id":"c","text":"A chemical test kit used to analyze oil samples for wear metals","correct":false}]',
     '{"B1"}'),

    (s21_id, 'When reworking (blending) minor damage on a compressor blade, the correct method is to:',
     '[{"id":"a","text":"Work by hand with stones, files, or emery cloth, parallel to the blade length, never buffing the entire area with a power tool","correct":true},{"id":"b","text":"Always use a power buffing tool over the entire blade surface for a uniform finish","correct":false},{"id":"c","text":"Weld or braze the damaged area before smoothing it with emery cloth","correct":false}]',
     '{"B1"}'),

    (s21_id, 'For a titanium compressor blade, typical repair limits for blade Area D specify:',
     '[{"id":"a","text":"No repair is permitted in Area D on titanium blades, regardless of stage","correct":true},{"id":"b","text":"Up to 0.5 inch of material may be removed in Area D","correct":false},{"id":"c","text":"Titanium blades allow deeper repairs in Area D than steel blades","correct":false}]',
     '{"B1"}'),

    (s21_id, 'When marking turbine blades and disks or combustion chamber liners (parts directly exposed to the gas path) for temporary identification during assembly, the appropriate materials are:',
     '[{"id":"a","text":"Layout dye (lightly applied) or chalk","correct":true},{"id":"b","text":"Carbon alloy or metallic pencils, for durability","correct":false},{"id":"c","text":"Any indelible ink marker","correct":false}]',
     '{"B1"}'),

    (s21_id, 'Cracks found on a turbine disk during inspection are treated as:',
     '[{"id":"a","text":"Not normally allowed — cause for rejection of the disk and replacement of the turbine rotor","correct":true},{"id":"b","text":"Acceptable, provided they are blended smooth with a stone","correct":false},{"id":"c","text":"Acceptable up to a length of one-sixteenth inch","correct":false}]',
     '{"B1"}'),

    (s21_id, 'Hotspots observed on the exhaust tail cone during inspection are a good indication of:',
     '[{"id":"a","text":"A malfunctioning fuel nozzle or combustion chamber","correct":true},{"id":"b","text":"Normal wear that requires no further investigation","correct":false},{"id":"c","text":"An overfilled engine oil tank","correct":false}]',
     '{"B1"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M15.22 Engine Storage and Preservation (14 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s22_id, 'An engine in active service is, in a sense, self-purging of moisture because:',
     '[{"id":"a","text":"The heat of combustion evaporates moisture and circulating oil forms a temporary protective coating on the metal","correct":true},{"id":"b","text":"The fuel control automatically injects a desiccant into the oil system","correct":false},{"id":"c","text":"Ambient humidity always decreases while the engine is running","correct":false}]',
     '{"B1"}'),

    (s22_id, 'Which type of aircraft operating environment creates the greatest need for engine corrosion preservation?',
     '[{"id":"a","text":"Operation close to oceans, lakes, rivers, and humid regions","correct":true},{"id":"b","text":"Operation exclusively in dry, low-humidity desert regions","correct":false},{"id":"c","text":"Operation at high altitude cruise only","correct":false}]',
     '{"B1"}'),

    (s22_id, 'Under the three engine storage categories described, "active storage" is defined as:',
     '[{"id":"a","text":"At least one continuous hour of operation with oil temperature of 165 to 200 degF, and storage time not exceeding 30 days","correct":true},{"id":"b","text":"Any storage period regardless of oil temperature, provided the engine runs briefly once a week","correct":false},{"id":"c","text":"Storage time not to exceed 90 days with no minimum operating requirement","correct":false}]',
     '{"B1"}'),

    (s22_id, '"Temporary storage" describes an aircraft and engine that is not flown for:',
     '[{"id":"a","text":"30 to 90 days","correct":true},{"id":"b","text":"0 to 10 days","correct":false},{"id":"c","text":"Over one year","correct":false}]',
     '{"B1"}'),

    (s22_id, 'Corrosion-preventive compounds used to protect stored engines are generally described as:',
     '[{"id":"a","text":"Petroleum-based products that form a wax-like film over the metal to which they are applied","correct":true},{"id":"b","text":"Water-based solutions that must be kept refrigerated","correct":false},{"id":"c","text":"Dry powders applied directly to bare metal with no liquid carrier","correct":false}]',
     '{"B1"}'),

    (s22_id, 'Per MIL-C-6529C, which type of light corrosion-preventive mixture is intended for use in turbine engines only, ready-mixed with grade 1010 oil?',
     '[{"id":"a","text":"Type III","correct":true},{"id":"b","text":"Type I","correct":false},{"id":"c","text":"Type II","correct":false}]',
     '{"B1"}'),

    (s22_id, 'The correct method of preparing a lubricating oil and corrosion-preventive compound mixture is to:',
     '[{"id":"a","text":"Prepare the mixture separately, never by adding the compound directly to the oil already in the engine","correct":true},{"id":"b","text":"Add the compound directly to the oil already present in the engine tank","correct":false},{"id":"c","text":"Mix it directly in the fuel tank before spraying the engine","correct":false}]',
     '{"B1"}'),

    (s22_id, 'A commonly used desiccant for dehydrating stored engines, valued because it does not dissolve when saturated, is:',
     '[{"id":"a","text":"Silica gel","correct":true},{"id":"b","text":"Table salt","correct":false},{"id":"c","text":"Baking soda","correct":false}]',
     '{"B1"}'),

    (s22_id, 'When sealing an engine in a protective envelope prior to shipping, applying a vacuum to the container serves what purpose?',
     '[{"id":"a","text":"Exhausts as much air as possible from the envelope and helps detect leaks","correct":true},{"id":"b","text":"Sterilizes the interior of the engine to prevent bacterial growth in fuel","correct":false},{"id":"c","text":"Cools the engine to a specified storage temperature","correct":false}]',
     '{"B1"}'),

    (s22_id, 'Compared with a wooden shipping case, the amount of silica gel required in a pressurized metal shipping container is generally:',
     '[{"id":"a","text":"Greater, because the volume of air inside the metal container is much larger","correct":true},{"id":"b","text":"Less, because metal containers are perfectly airtight","correct":false},{"id":"c","text":"Exactly the same regardless of container type","correct":false}]',
     '{"B1"}'),

    (s22_id, 'After the top of a metal shipping container is secured to its base, dehydrated air is typically forced into the container to a pressure of approximately:',
     '[{"id":"a","text":"5 psi","correct":true},{"id":"b","text":"50 psi","correct":false},{"id":"c","text":"500 psi","correct":false}]',
     '{"B1"}'),

    (s22_id, 'The humidity indicator on an engine stored in a wooden shipping case is normally inspected every:',
     '[{"id":"a","text":"30 days (extendable to 90 days if the envelope need not be opened)","correct":true},{"id":"b","text":"180 days, the same interval as a metal container","correct":false},{"id":"c","text":"7 days without exception","correct":false}]',
     '{"B1"}'),

    (s22_id, 'If the humidity indicator in a metal shipping container shows a safe (blue) condition, but the internal air pressure has dropped below 1 psi, the appropriate action is to:',
     '[{"id":"a","text":"Bring the container back to proper pressure with dehydrated air","correct":true},{"id":"b","text":"Immediately represerve the entire engine regardless of the blue indication","correct":false},{"id":"c","text":"Take no action, since pressure loss below 1 psi requires no correction","correct":false}]',
     '{"B1"}'),

    (s22_id, 'Before a preserved gas turbine engine is returned to service, preservative oil must be removed from the fuel system by:',
     '[{"id":"a","text":"Motoring the engine and bleeding the fuel system to completely flush it out","correct":true},{"id":"b","text":"Draining the fuel tanks only, with no need to motor the engine","correct":false},{"id":"c","text":"Running the engine at full power immediately after depreservation with no flushing","correct":false}]',
     '{"B1"}');

END $$;
