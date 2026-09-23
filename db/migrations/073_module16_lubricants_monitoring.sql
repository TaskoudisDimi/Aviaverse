-- Module 16: Piston Engines (B1) — Lubricants and Fuels, Engine Monitoring Instruments
-- Source: EASA Part-66 Module 16 official textbook (IKAROS Aviation Training Centre, IK01, Issue Oct.2012)

DO $$
DECLARE
    m16_id INT;
    s7_id  INT;
    s8_id  INT;
BEGIN
    SELECT id INTO m16_id FROM easa_modules WHERE code = 'M16';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M16.7') THEN
        RAISE NOTICE 'M16.7/M16.8 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 16.7: Lubricants and Fuels
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m16_id, 'M16.7', 'Lubricants and Fuels',
        $cnt$
# Lubricants and Fuels

## Section 1: Properties and Specification of Fuels

### Aviation Fuel

Aviation fuels are classified into two groups: **aviation gasolene** for reciprocating piston engines, and **aviation turbine fuels** for use in turbo-propeller and turbo-jet engines.

### Aviation Gasolene (Avgas)

Aviation gasolene consists almost entirely of **hydrocarbons** — compounds of hydrogen and carbon. It is a blend of many compounds with a wide range of boiling points and vapour pressures, which contributes to its vaporisation characteristics needed for good starting, acceleration and power.

- If a gasolene vaporises **too readily**, fuel pipes may fill with vapour, decreasing fuel flow.
- If the fuel does **not vaporise readily**, it leads to poor starting and acceleration.

Aviation gasolene is used in all spark ignition piston engines.

### Fuel Terminology

| Term | Definition |
|------|------------|
| **Specific Gravity** | The ratio of the weight of a substance to the weight of an equal volume of water at 4°C. One imperial gallon of water weighs 10 lb; Avgas has an SG of **0.72**, so one imperial gallon of Avgas weighs **7.2 lb**. |
| **Vapour Pressure** | The pressure acting on a liquid to prevent further evaporation of the liquid — the higher the vapour pressure, the higher the volatility. |
| **Volatility** | The capability of a liquid to change readily from the liquid state to the vapour state. |
| **Calorie** | The amount of heat required to raise one gramme of water one degree centigrade. |
| **Calorific Value** | A measure of the amount of heat obtainable from a given weight of fuel, given in BTUs. |
| **British Thermal Unit (BTU)** | The amount of heat required to raise the temperature of 1 lb of water one degree Fahrenheit. One BTU produces 778 ft/lb of work; aviation gasolene produces **19,000–20,000 BTUs per lb**. |
| **Flash Point** | The temperature at which the vapour will ignite and then extinguish. |
| **Octane Rating** | A fuel's ability to resist detonation — the higher the number, the greater the fuel's resistance to detonation. |

### Octane Rating and Performance Number

The octane rating standard uses **iso-octane** (excellent resistance to detonation) blended with **heptane** (little or no resistance to detonation). During testing, the engine is run under specified conditions and the compression ratio is raised until detonation occurs. Blends of iso-octane and heptane are then made up until one is found that matches the same resistance to knocking as the fuel under test. The fuel is allocated an octane number equal to the **percentage of iso-octane** in that matching blend.

*Example: a fuel of 95 octane rating has the same resistance to detonation as a blend of 95% iso-octane and 5% heptane.*

*Note: there is no iso-octane, no octane and no heptane actually present in aviation gasolene — it is purely a reference standard.*

Some aviation fuels possess greater anti-knock qualities than 100 octane or pure iso-octane. These are classified by a **Performance Number**, based on 100% iso-octane with measured quantities of tetraethyl lead added. Because anti-knock qualities vary with the fuel/air ratio, performance numbers are expressed as **two figures** — one for weak mixture, one for rich mixture — e.g. **100/130**.

### Tetraethyl Lead (TEL)

TEL is used in small quantities with gasolene to improve anti-knock rating. Used alone it would form lead oxide, a solid with a very high boiling point that would leave lead residue in the cylinders. To prevent this, **ethylene dibromide** is added to the TEL — the mixture forms **lead bromide**, which has a much lower boiling point than lead oxide and so is mostly removed from the cylinders with the exhaust gases.

For identification purposes, dye is added to fuel containing TEL:

| Colour | Grade | TEL (ml/imp gal) |
|--------|-------|-------------------|
| Purple | 115/145 | 5.5 |
| Green | 100/130 | 3.6 |
| Blue | 100LL | 2.4 |

### Current Grades

In recent years, diminishing demand for aviation gasolene has reduced the number of grades produced, lowering manufacturing, storage and handling costs. At present, three grades are covered in the most widely recognised international specifications:

| Colour | Grade | TEL (ml/imp gal) |
|--------|-------|-------------------|
| Red | 80 | 0.09 |
| Green | 100 | 0.77 |
| Blue | 100LL | 0.52 |

- **Avgas 80** — suitable only for small, low-compression, low-power-output aero engines.
- **Avgas 100** — required for higher-compression, higher-power-output engines, especially those with a supercharger or turbocharger.
- **Avgas 100LL** — now the most widely available gasolene, having replaced Avgas 80 and Avgas 100 in most areas of the world. It has the same anti-knock performance as 100/130 grade but with much lower TEL content, and is approved for use in all piston engines previously operated on 80, 87 and 100/130 grades.

### Motor Gasolene (Mogas)

Mogas can be used in certain light aircraft piston engines, per the limitations and applications set out in AWNs 98, 98A, 98B and 98C. When operating with more than **25% mogas in the tank**, the following precautions apply:

- The fuel must not be rendered unfit by storage, contamination, etc.
- Use only freshly obtained supplies; avoid long storage in the aircraft fuel tank.
- Check for the presence of water if the aircraft has stood for 24 hours or longer.
- During the daily check and other routine inspections, pay particular attention to non-metallic fuel pipes and seals for leaks or deterioration.
- Verify the ability to maintain Take-Off power before committing to a take-off.

## Section 2: Properties and Specification of Oils

### Properties of Oils

- **Reduces friction** — oil placed between working surfaces reduces friction to that between layers of oil. The oil's viscosity must be high enough to prevent breakdown of this film.
- **Provides cooling** — oil in contact with moving engine parts absorbs heat from the combustion chamber, given up to the outside air by the oil cooler. The piston is cooled almost entirely by oil sprayed onto its underside.
- **Seals** — the oil's ability to wet the surfaces it contacts makes it a good sealing liquid between moving parts, e.g. sealing the piston to the cylinder, and cushioning the rocker pad/valve stem contact.
- **Corrosion protection** — a film of oil coating metal surfaces prevents oxygen reacting with the metal. Contaminants from combustion and other sources can also react chemically with engine materials to cause corrosion.
- **Cleansing effect** — oil picks up dirt, dust, carbon and other contaminants and deposits them in the filter.

### Types of Engine Oil

| Type | Characteristics |
|------|------------------|
| **Straight Mineral Oil** | Tends to oxidise when exposed to high temperatures or when aerated; sludge forms from partly-burned fuel by-products, water vapour and lead compounds, tending to block filters. |
| **Detergent Oil** | Mineral oil with additives to increase oxidation stability; has a cleaning effect, loosening sludge and carbon deposits which then tend to block filters. Not usually recommended for aircraft engines. |
| **Ashless-Dispersant (AD) Oil** | Does not share the disadvantages of mineral or detergent oil — dispersant additives cause sludge particles to repel each other and stay in suspension until picked up by the filters. |
| **Synthetic Oil** | Used extensively in gas turbine engines but not in piston engines, due to lack of experience and other problems. Its main advantage is less oxidisation at high temperature than other oils, and its viscosity at −20°F equals that of AD oil at 0°F. Wear characteristics are about the same as AD oil, better than straight mineral oil. Disadvantages: softening effect on rubber components and resins, and higher cost than mineral oil. |

New engines are normally operated on **mineral oil for the first fifty hours**, or until oil consumption has stabilised, before changing to AD oil. This is because AD oil has much better lubricating characteristics and would not allow enough wear to properly seat the piston rings if used from new.

### Engine Oil Ratings

**Viscosity** is a measure of a liquid's internal friction, or its resistance to flow. A liquid that flows freely has a low viscosity; a sluggish liquid has a high viscosity. Engine oils are graded using SAE (Society of Automotive Engineers) numbers and separate Aviation numbers; the SAE numbers are purely arbitrary and bear no relationship to SSU.

The instrument used to measure oil viscosity is the **Saybolt Universal II Viscometer**. Commercial aviation numbers relate to the time taken for 60cc of oil at 210°F to pass an accurately calibrated orifice — this measurement is known as **SSU (Saybolt Second Universal Viscosity)**.

- **Pour Point** — the lowest temperature at which the oil will flow or can be poured.
- **Flashpoint** — the temperature to which oil must be raised before it will momentarily flash, but not sustain combustion, when a small flame is passed above its surface.

## Section 3: Fuel Additives

Aviation fuel additives are compounds added to fuels in very small quantities to impart special or improved characteristics. Their use is rigorously controlled — only those listed in the relevant specifications may be used.

| Additive | Purpose |
|----------|---------|
| **Tetraethyl Lead (TEL)** | Added to aviation gasolenes to improve anti-knock rating, avoiding detonation/knock in the combustion chambers. |
| **Anti-oxidants** | Prevent oxidation of the fuel during storage — oxidation would form peroxides that could attack fuel system rubber components and form gum deposits. |
| **Metal De-activators** | Depress the catalytic effect that some metals, particularly copper, have on fuel oxidation. |
| **Static Dissipator Additives** | Increase the fuel's electrical conductivity, speeding up dissipation of static electricity generated by fuel movement through fuelling systems. |
| **Fuel System Icing Inhibitor** | Prevents freezing of water precipitated out of fuel due to cooling at high altitude. The approved additives are also biostats and can be used continuously to inhibit microbiological growth in aircraft fuel systems. |
| **Corrosion Inhibitors** | Protect ferrous metals in fuel pipelines and equipment; may also improve the fuel's lubricating properties. |

## Section 4: Safety Precautions

- **Fire extinguishing** — in the event of fire, extinguish using dry powder, foam, or, for small fires, carbon dioxide.
- **Avgas spillage** — when Avgas is spilled in a confined space, dangerously high concentrations of vapour are produced. Any spillage on a hangar floor must be cleaned up immediately.
- **Bonding** — correct bonding to earth must be carried out whenever transferring or refuelling an aircraft.
- **Health** — exposure to Avgas that can affect the skin, eyes or by inhalation must be minimised. Barrier cream can protect the hands to a degree but must be washed off before handling food.

## Section 5: System Operation

### Oil Distribution

The primary purpose of a lubrication system is to lubricate the internal engine components, distributing oil throughout the engine by pressure, splash and spray techniques.

- **Pressure Lubrication** — the primary lubrication method in reciprocating engines. Relies on a **positive displacement**, engine-driven pump — meaning the pump moves a specific amount of fluid for each revolution. Oil passes through crankcase passages to reach plain bearings, crankshaft and camshaft main bearings, lower connecting rod bearings, and valve assemblies.
- **Splash Lubrication** — produced by the movement of internal components splashing oil around; effective where oil is stored in the crankcase. As a piston reaches the bottom of its stroke, the crank throw partially submerges in oil and splashes it onto other components — cylinder walls, camshaft lobes, upper connecting rod bearings, piston pins, and accessory gears.
- **Spray Lubrication** — used on large reciprocating engines too big for effective splash lubrication. Uses the same pressurised oil as a pressure system, but sprays it onto a component through a nozzle rather than routing it through a passage — used for some cylinder walls and camshaft lobes.

### System Classification

Reciprocating engine lubrication systems are classified as either **wet-sump** or **dry-sump**.

- **Wet-Sump** — all oil is carried in the engine crankcase. Oil is picked up by a pump, distributed through the engine, and drains back to the sump for recirculation. Advantages: relative simplicity and light weight. Disadvantages: oil capacity limited by sump size, and harder to cool since the oil is contained within the engine — itself a source of heat.
- **Dry-Sump** — oil is stored in a separate oil tank, typically allowing a larger oil quantity, making dry-sump systems well suited to large radial engines. An oil pump pulls oil from the tank and circulates it through the engine; oil then accumulates in the bottom of the crankcase, where a **scavenge pump** picks it up and returns it to the tank. If the oil tank is installed higher than the engine oil inlet, check valves must be installed to prevent oil draining back into the crankcase.

## Section 6: Oil System Components

A typical pressure lubrication system consists of an oil reservoir, oil pump, oil pressure relief valve, oil filter, oil cooler, vent lines, and all necessary piping and connections. Dry-sump engines additionally require a scavenge pump. Most systems include an oil temperature and oil pressure gauge for monitoring.

- **Oil Reservoir** — must be large enough to hold an adequate oil supply, based on the aircraft's maximum endurance and maximum acceptable oil consumption rate, plus a margin for adequate circulation, lubrication and cooling. On wet-sump engines the reservoir is part of the crankcase, typically cast aluminium alloy; on dry-sump systems the reservoir is also typically aluminium alloy, positioned close to and high enough above the oil pump inlet to ensure reliable gravity feed.
- **Oil Level** — most aircraft use a dipstick-type quantity gauge. Some large aircraft use an oil quantity indicating system with a float mechanism riding on the oil surface, actuating an electric transmitter that sends a signal to a cockpit gauge indicating quantity in gallons.
- **Breather System** — the oil reservoir must be vented to atmosphere to prevent pressure build-up in all flight attitudes. On a wet-sump system, the vent is a crankcase breather. On a dry-sump system, a vent line runs from the reservoir to the engine crankcase to prevent oil loss, indirectly venting to atmosphere through the crankcase breather.
- **Oil Dilution** — during winter, "oil drag" causes difficult starting. This is overcome by temporarily reducing oil viscosity, diluting it with gasolene: at a specified engine temperature and rpm, fuel is injected into the inlet side of the oil pressure pump for a stated period. After dilution, the engine may be left without re-running for up to **three days**. Fuel flow into the oil system is controlled by a solenoid valve and a metering jet; oil circulates and returns via the filter and scavenge pump to a hot-pot inside the oil tank. At the next engine run, once warmed up, the fuel is "boiled off," usually by running the engine at or about **2,000 rpm** for a specified time. Because oil dilution has a scouring effect on oil sludge, filters need to be examined and cleaned more frequently than usual.
- **Oil Pumps** — all lubrication systems use constant-displacement pumps, which move a fixed volume of fluid per revolution. Two types are used:
  - **Gear Pump** — the most common type; two meshed gears rotate inside a precisely-machined housing. Oil is picked up at the inlet, trapped between the teeth and housing, and released at the outlet as the gears rotate.
  - **Gerotor Pump** — an engine-driven spur gear rotates within a free-spinning rotor housing; the rotor and drive gear ride inside a housing with two oblong openings, one the oil inlet and the other the oil outlet.
  - **Scavenge Pump** — used in dry-sump systems to return oil to the reservoir; may be gear-type or gerotor-type. Scavenge pumps have a **greater capacity than the pressure pump**, because oil flowing through the engine has a greater volume due to foaming and thermal expansion, so the scavenge pump must move more oil than the pressure pump to prevent oil collecting in the sump.
        $cnt$,
        7
    ) RETURNING id INTO s7_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 16.8: Engine Monitoring Instruments
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m16_id, 'M16.8', 'Engine Monitoring Instruments',
        $cnt2$
# Engine Monitoring Instruments

## General

Present-day piston engine instruments used in typical general aviation aircraft are **not precision laboratory instruments**. If an irregular reading is observed on one engine instrument, it calls for a **cross-check on all other instruments**, rather than relying on a single instrument as the basis for a flight-affecting decision.

Since the engine depends on fuel, the fuel gauge is considered a related engine instrument. Some modern single-engine aircraft have shown fuel gauges reading several gallons remaining when the tank was actually empty, or indicating a specific quantity when filled that was actually several gallons less than indicated. When planning a flight, remember that general aviation engine instruments are not precision laboratory types — cross-check readings and allow an extra margin for safety.

More aircraft are being fitted with digital readouts. Some digital equipment can automatically monitor engine functions and sound an alarm if a value goes outside preset limits. Digital instruments can be harder and slower to read than traditional analogue instruments, as the brain must take additional steps to interpret them. An instrument reading, of whatever type, is only as good as its sender unit.

Instruments on all aircraft operate within a "normal" range, and operators become adjusted to seeing these. The pilot should remain vigilant that engine functions stay within these ranges — an abnormal indication on any instrument is immediate cause for concern.

## Ammeter

The ammeter indicates whether the engine alternator and its circuit are operational. If a **continuous discharge** is shown during normal flight, it is prudent to **land as soon as possible**, since it suggests the battery will shortly become too depleted to operate normal aircraft systems. Aircraft engines will continue to operate even in this case, because their ignition spark is created by **magnetos**, which are independent of the aircraft electrical system.

Aircraft are usually also fitted with a **low voltage warning light** in a prominent position. If a problem arises with the charging circuit, the light will begin to flicker and then show red — though it may normally flicker or show dull red at very low RPM.

## Cylinder Head Temperature Gauge (CHT)

Most engines are fitted with a CHT sensor on **one cylinder only** — every engine design has a cylinder that runs slightly hotter than the rest. If the temperature climbs towards the red line, it may indicate a serious problem.

## Exhaust Gas Temperature Gauge (EGT)

The EGT is the **primary instrument** used to help regulate the fuel/air mixture. The red cursor on the gauge indicates the temperature that must never be exceeded.

## Oil Pressure Gauge

This is the primary indicator that all is well with the engine. A **cold engine** will always show a very high oil pressure. Once hot, pressure should remain in the green arc under normal RPMs. **Low pressure** may indicate a serious problem with the oil pump or engine bearings — acceptable pressure ranges are stated in the aircraft operating manual. Oil pressure will **diminish if the engine becomes overheated**, as the viscosity of the oil becomes too thin and begins to break down.

## Oil Temperature Gauge

Also a very important device for monitoring engine wellbeing. High power should not be used until the temperature has climbed into the operating range, as damage can occur to the engine. If the temperature climbs into the red sector, it indicates a serious problem may have developed.

## Vacuum Gauge

Usually situated at the lower left of the panel, the vacuum gauge monitors the condition of the vacuum system, which is driven from the engine. The vacuum system drives the **gyros for the attitude indicator and direction indicator**.

## Fuel Flow

This instrument measures fuel flow to the engine, usually in **US gallons per hour**. It is often combined with the manifold pressure gauge. Manifold pressure is used on complex aircraft to monitor the engine's power setting.

## Fuel Gauge

Aircraft fuel gauges are **notorious for their unreliability**. Pilots should calculate fuel used, and if possible never fly unless the fuel can actually be seen through the filler cap.

## Combination Instruments

Aircraft instruments come in a profusion of designs and combinations, but all fulfil the same common purpose: to give the pilot as much notice as possible that something is going wrong.

## Instrumentation on Small Two-Stroke (Rotax) Engines

Some of these instruments are required to ensure proper performance, some are used to tune the engine, and others are used to watch for problems such as overheating.

- **Tachometer** — plays a very important role in ensuring proper engine cooling and performance. An engine allowed to over-rev will run a lean fuel mixture and can overheat or seize; an engine not allowed to reach its proper RPM can also overheat, or fail because it cannot burn fuel as designed. The tachometer is used to properly pitch the propeller — correct pitching gives the best available climb, cruise and engine performance.
- **Exhaust Gas Temperature Gauge (EGT)** — a separate gauge and probe should be fitted for each cylinder. An EGT shows whether the combustion chamber is running too hot or cold, too lean or too rich, and can indicate problems such as a cracked intake manifold (lean mixture, higher EGT), carburettor wear, an incorrect fuel/oil mixture, or ignition faults (a bad spark plug or faulty ignition components shows as a colder EGT reading, since fuel is not being burned properly). The proper EGT reading for two-stroke Rotax engines is **1,000 to 1,200 degrees Fahrenheit**.
- **Cylinder Head Temperature (CHT) Gauge** — on air-cooled two-stroke engines, experience has shown CHTs to be of limited value, as by the time the gauge reacts, a problem has usually already stopped the propeller. On a liquid-cooled engine, the reading is affected (lowered) by the coolant circulating through the cylinder head; CHT will read higher when coolant is low, though pilots often smell the coolant before noticing the gauge.
- **Water Temperature Gauge** — mandatory on liquid-cooled engines. Rotax liquid-cooled two-stroke engines are designed to run between **140 and 180 degrees Fahrenheit**, with the optimum temperature at around **160 degrees Fahrenheit**. The engine must be brought up to operating temperature before full power is applied; failure to do so can result in a "cold" seizure, where sudden full power forces cold coolant into the water jackets, shrinking the cylinders while the piston is under load and expanding rapidly.
- **Hour Meter** — provides an accurate engine hour log. All new dual-CDI two-stroke Rotax engines require rebuilding, including crankshaft replacement, at **300 hours or 5 years**.
        $cnt2$,
        8
    ) RETURNING id INTO s8_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M16.7 Lubricants and Fuels (18 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s7_id, 'One imperial gallon of water weighs 10 lb. Given that Avgas has a specific gravity of 0.72, approximately how much does one imperial gallon of Avgas weigh?',
     '[{"id":"a","text":"7.2 lb","correct":true},{"id":"b","text":"10 lb","correct":false},{"id":"c","text":"13.9 lb","correct":false}]',
     '{"B1"}'),

    (s7_id, 'The octane rating of a fuel is a measure of:',
     '[{"id":"a","text":"Its calorific value","correct":false},{"id":"b","text":"Its ability to resist detonation","correct":true},{"id":"c","text":"Its vapour pressure at sea level","correct":false}]',
     '{"B1"}'),

    (s7_id, 'A fuel with a 95 octane rating has the same resistance to detonation as a blend of:',
     '[{"id":"a","text":"95% heptane and 5% iso-octane","correct":false},{"id":"b","text":"95% iso-octane and 5% heptane","correct":true},{"id":"c","text":"50% iso-octane and 50% heptane","correct":false}]',
     '{"B1"}'),

    (s7_id, 'A fuel with a Performance Number of 100/130 is expressed as two figures because:',
     '[{"id":"a","text":"One figure is for weak mixture and the other for rich mixture","correct":true},{"id":"b","text":"One figure is for summer use and the other for winter use","correct":false},{"id":"c","text":"One figure is the SG and the other is the flash point","correct":false}]',
     '{"B1"}'),

    (s7_id, 'Ethylene dibromide is added to tetraethyl lead (TEL) in aviation gasolene in order to:',
     '[{"id":"a","text":"Increase the fuel''s octane rating further","correct":false},{"id":"b","text":"Form lead bromide, which is largely removed from the cylinders with the exhaust gases","correct":true},{"id":"c","text":"Reduce the fuel''s vapour pressure","correct":false}]',
     '{"B1"}'),

    (s7_id, 'Under the aviation gasolene colour-coding scheme, Avgas 100LL is identified by which dye colour?',
     '[{"id":"a","text":"Red","correct":false},{"id":"b","text":"Green","correct":false},{"id":"c","text":"Blue","correct":true}]',
     '{"B1"}'),

    (s7_id, 'Avgas 100LL has become the most widely available aviation gasolene because it:',
     '[{"id":"a","text":"Has the same anti-knock performance as 100/130 grade but with much lower TEL content","correct":true},{"id":"b","text":"Is suitable only for low-compression, low-power engines","correct":false},{"id":"c","text":"Contains no tetraethyl lead at all","correct":false}]',
     '{"B1"}'),

    (s7_id, 'When operating on mogas, the precautions set out in the relevant AWNs apply once mogas exceeds what proportion of the fuel in the tank?',
     '[{"id":"a","text":"10%","correct":false},{"id":"b","text":"25%","correct":true},{"id":"c","text":"75%","correct":false}]',
     '{"B1"}'),

    (s7_id, 'A film of engine oil coating metal surfaces protects against corrosion primarily by:',
     '[{"id":"a","text":"Increasing the metal''s electrical conductivity","correct":false},{"id":"b","text":"Preventing oxygen reacting with the metal surface","correct":true},{"id":"c","text":"Raising the local surface temperature","correct":false}]',
     '{"B1"}'),

    (s7_id, 'A key limitation of straight mineral oil is that it:',
     '[{"id":"a","text":"Tends to oxidise at high temperature or when aerated, forming sludge that blocks filters","correct":true},{"id":"b","text":"Cannot be used in any reciprocating engine","correct":false},{"id":"c","text":"Softens rubber seals more than any other oil type","correct":false}]',
     '{"B1"}'),

    (s7_id, 'Ashless-dispersant (AD) oil differs from straight mineral or detergent oil in that its additives:',
     '[{"id":"a","text":"Cause sludge particles to repel each other and remain in suspension until picked up by the filter","correct":true},{"id":"b","text":"Dissolve sludge completely so no filtration is required","correct":false},{"id":"c","text":"Prevent the oil from being used at low temperatures","correct":false}]',
     '{"B1"}'),

    (s7_id, 'Engine manufacturers typically recommend that a new engine be run on mineral oil for the first fifty hours, rather than AD oil, because:',
     '[{"id":"a","text":"AD oil is significantly more expensive to produce","correct":false},{"id":"b","text":"AD oil''s superior lubricating characteristics would not allow enough wear to properly seat the piston rings","correct":true},{"id":"c","text":"AD oil is only approved for gas turbine engines","correct":false}]',
     '{"B1"}'),

    (s7_id, 'Compared with other engine oils, a stated disadvantage of synthetic oil is that it:',
     '[{"id":"a","text":"Has a softening effect on rubber components and resins","correct":true},{"id":"b","text":"Oxidises more readily at high temperature","correct":false},{"id":"c","text":"Cannot maintain adequate viscosity at low temperature","correct":false}]',
     '{"B1"}'),

    (s7_id, 'The pour point of an oil is defined as:',
     '[{"id":"a","text":"The temperature at which the oil vapour will ignite and extinguish","correct":false},{"id":"b","text":"The lowest temperature at which the oil will flow or can be poured","correct":true},{"id":"c","text":"The temperature at which the oil sustains combustion","correct":false}]',
     '{"B1"}'),

    (s7_id, 'The flashpoint of an oil is defined as the temperature at which it must be raised before it will:',
     '[{"id":"a","text":"Momentarily flash, but not sustain combustion, when a small flame is passed above its surface","correct":true},{"id":"b","text":"Permanently ignite and sustain combustion indefinitely","correct":false},{"id":"c","text":"Lose all lubricating properties","correct":false}]',
     '{"B1"}'),

    (s7_id, 'A fuel system icing inhibitor additive serves to:',
     '[{"id":"a","text":"Increase the fuel''s resistance to detonation","correct":false},{"id":"b","text":"Prevent freezing of water precipitated from the fuel at high altitude, and also act as a biostat","correct":true},{"id":"c","text":"Protect ferrous fuel system components from corrosion","correct":false}]',
     '{"B1"}'),

    (s7_id, 'In a pressure lubrication system, the term "positive displacement," as applied to the oil pump, means that the pump:',
     '[{"id":"a","text":"Moves a specific amount of fluid for each revolution","correct":true},{"id":"b","text":"Can only operate when oil pressure exceeds a set threshold","correct":false},{"id":"c","text":"Is driven electrically rather than by the engine","correct":false}]',
     '{"B1"}'),

    (s7_id, 'On a dry-sump lubrication system, the scavenge pump is required to have a greater capacity than the pressure pump because:',
     '[{"id":"a","text":"Oil returning from the engine has a greater volume due to foaming and thermal expansion","correct":true},{"id":"b","text":"The oil tank is always located below the level of the engine","correct":false},{"id":"c","text":"Scavenge pumps are always less efficient than pressure pumps","correct":false}]',
     '{"B1"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M16.8 Engine Monitoring Instruments (12 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s8_id, 'If an irregular reading is observed on one engine instrument, the correct practice is to:',
     '[{"id":"a","text":"Immediately shut down the affected system without further checks","correct":false},{"id":"b","text":"Cross-check all other instruments rather than rely on one instrument alone","correct":true},{"id":"c","text":"Ignore it unless it persists for more than ten minutes","correct":false}]',
     '{"B1"}'),

    (s8_id, 'If the ammeter shows a continuous discharge during normal flight, the prudent action is to:',
     '[{"id":"a","text":"Land as soon as possible, since the battery will shortly become too depleted to operate normal aircraft systems","correct":true},{"id":"b","text":"Continue the flight as planned, since the engine cannot be affected","correct":false},{"id":"c","text":"Switch off the magnetos to conserve electrical power","correct":false}]',
     '{"B1"}'),

    (s8_id, 'Even with a continuous ammeter discharge indicating an electrical system problem, the engine will continue to run because:',
     '[{"id":"a","text":"The fuel pump is mechanically driven","correct":false},{"id":"b","text":"Ignition spark is created by magnetos, which are independent of the aircraft electrical system","correct":true},{"id":"c","text":"The oil pump supplies backup electrical power","correct":false}]',
     '{"B1"}'),

    (s8_id, 'On most piston engines, a Cylinder Head Temperature (CHT) gauge is fitted to:',
     '[{"id":"a","text":"Every cylinder, without exception","correct":false},{"id":"b","text":"Only one cylinder — the one that characteristically runs hottest","correct":true},{"id":"c","text":"Only the cylinder nearest the propeller","correct":false}]',
     '{"B1"}'),

    (s8_id, 'The Exhaust Gas Temperature (EGT) gauge is described as the primary instrument for:',
     '[{"id":"a","text":"Helping regulate the fuel/air mixture","correct":true},{"id":"b","text":"Indicating oil pump serviceability","correct":false},{"id":"c","text":"Monitoring vacuum system condition","correct":false}]',
     '{"B1"}'),

    (s8_id, 'On the oil pressure gauge, a cold engine will typically show:',
     '[{"id":"a","text":"No reading at all until warm","correct":false},{"id":"b","text":"A very high oil pressure","correct":true},{"id":"c","text":"A reading fixed in the middle of the green arc","correct":false}]',
     '{"B1"}'),

    (s8_id, 'If an engine becomes overheated, oil pressure will tend to diminish because:',
     '[{"id":"a","text":"The oil filter automatically restricts flow above a set temperature","correct":false},{"id":"b","text":"The oil''s viscosity becomes too thin and begins to break down","correct":true},{"id":"c","text":"The scavenge pump shuts down automatically","correct":false}]',
     '{"B1"}'),

    (s8_id, 'The vacuum gauge monitors a system that is used to drive:',
     '[{"id":"a","text":"The gyros for the attitude indicator and direction indicator","correct":true},{"id":"b","text":"The fuel flow transmitter","correct":false},{"id":"c","text":"The alternator and battery charging circuit","correct":false}]',
     '{"B1"}'),

    (s8_id, 'The fuel flow instrument typically measures fuel flow to the engine in:',
     '[{"id":"a","text":"US gallons per hour","correct":true},{"id":"b","text":"Litres per minute","correct":false},{"id":"c","text":"Pounds per second","correct":false}]',
     '{"B1"}'),

    (s8_id, 'According to guidance on aircraft fuel gauges, pilots should:',
     '[{"id":"a","text":"Trust the fuel gauge reading exactly, since it is a precision instrument","correct":false},{"id":"b","text":"Calculate fuel used and, if possible, never fly unless the fuel can actually be seen through the filler cap","correct":true},{"id":"c","text":"Disregard the fuel gauge entirely and rely solely on the hour meter","correct":false}]',
     '{"B1"}'),

    (s8_id, 'On two-stroke Rotax engines, the proper Exhaust Gas Temperature (EGT) reading is stated as approximately:',
     '[{"id":"a","text":"200 to 400 degrees Fahrenheit","correct":false},{"id":"b","text":"1,000 to 1,200 degrees Fahrenheit","correct":true},{"id":"c","text":"2,500 to 3,000 degrees Fahrenheit","correct":false}]',
     '{"B1"}'),

    (s8_id, 'Rotax liquid-cooled two-stroke engines are designed to run at a water temperature of between 140 and 180 degrees Fahrenheit, with an optimum temperature of approximately:',
     '[{"id":"a","text":"100 degrees Fahrenheit","correct":false},{"id":"b","text":"160 degrees Fahrenheit","correct":true},{"id":"c","text":"220 degrees Fahrenheit","correct":false}]',
     '{"B1"}');

END $$;
