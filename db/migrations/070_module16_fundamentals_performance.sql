-- Module 16: Piston Engines (B1) — Fundamentals, Engine Performance
-- Source: EASA Part-66 Module 16 official textbook (IKAROS Aviation Training Centre, IK01, Issue Oct.2012)

DO $$
DECLARE
    m16_id INT;
    s1_id  INT;
    s2_id  INT;
BEGIN
    SELECT id INTO m16_id FROM easa_modules WHERE code = 'M16';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M16.1') THEN
        RAISE NOTICE 'M16.1-M16.2 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 16.1: Fundamentals
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m16_id, 'M16.1', 'Fundamentals',
        $cnt$
# Fundamentals

## Work, Power and Horsepower

Work is force times distance: **Work (W) = Force (F) x Distance (D)**. The common unit of work is the foot-pound (ft-lb) — if a 1-pound mass is raised 1 foot, 1 ft-lb of work has been performed.

Late in the 18th century, James Watt (inventor of the steam engine) found that a workhorse could work at the rate of **550 ft-lb per second, or 33,000 ft-lb per minute**, for a reasonable length of time. This became the standard unit of power in the English system, the **horsepower (hp)**:

- **hp = (ft-lb per min) / 33,000**
- **hp = (ft-lb per sec) / 550**

## Mechanical Efficiency

Mechanical efficiency is the ratio that shows how much of the power developed by the expanding gases in the cylinder is actually delivered to the output shaft. It compares brake horsepower (bhp) — the useful power delivered to the propeller shaft — to indicated horsepower (ihp) — the total power developed in the cylinders:

**Mechanical efficiency = bhp / ihp**

The difference between ihp and bhp is **fhp (friction horsepower)**, the power lost overcoming internal friction. Friction within an engine remains practically constant throughout its speed range, so mechanical efficiency is highest at the rpm where maximum bhp is developed. Mechanical efficiency of the average aircraft reciprocating engine approaches **90%**.

## Thermal Efficiency

The **Btu (British thermal unit)** is the quantity of heat required to raise the temperature of 1 lb of water by 1°F, and is equivalent to **778 ft-lb** of mechanical work. A pound of petroleum fuel, burned with enough air to consume it completely, gives up about **20,000 Btu** — the equivalent of about 15,560,000 ft-lb of mechanical work.

**Thermal efficiency** is the ratio of useful work done by an engine to the heat energy of the fuel it uses. A higher thermal efficiency means: more power from the same fuel, less waste heat to dispose of, and lower specific fuel consumption.

Of the total heat produced by combustion:

| Destination | Approximate share |
|---|---|
| Utilised for power output | **25% to 30%** |
| Lost in cooling (radiated from cylinder head fins) | **15% to 20%** |
| Lost overcoming friction of moving parts | **5% to 10%** |
| Lost through the exhaust | **40% to 50%** |

The portion of combustion heat turned into mechanical work depends largely on **compression ratio** — the higher the compression ratio, the larger the proportion of heat energy converted to useful work. However, increasing compression ratio also increases cylinder head temperature, which is a limiting factor because it can cause material deterioration and fuel detonation.

**Worked example:** an engine delivers 85 bhp for 1 hour, consuming 50 lb of fuel with a heat content of 18,800 Btu/lb. Working through the brake thermal efficiency formula (ihp x 33,000 divided by weight of fuel burned per minute x heat value x 778, using bhp in place of ihp) gives a brake thermal efficiency of **0.23, or 23%**.

Reciprocating engines overall are only about **34%** thermally efficient — the rest is lost through exhaust gases, the cooling system, and internal friction.

## Volumetric Efficiency

Volumetric efficiency is a comparison, expressed as a percentage, of the volume of fuel/air charge (corrected for temperature and pressure) actually inducted into the cylinders to the total piston displacement:

**Volumetric efficiency = Volume of charge (corrected for temperature and pressure) / Piston displacement**

If an engine draws in a volume of charge, at standard sea-level density (59°F / 14.69 lb/sq in / 29.92 in Hg), exactly equal to its piston displacement, it is operating at 100% volumetric efficiency. An engine fitted with a high-speed internal or external blower (supercharger) may exceed 100% volumetric efficiency.

Factors that **decrease** volumetric efficiency include:

- Part-throttle operation
- Long intake pipes of small diameter
- Sharp bends in the induction system
- Carburettor air temperature too high
- Cylinder-head temperature too high
- Incomplete scavenging
- Improper valve timing

## Propulsive Efficiency

The engine supplies bhp through a rotating shaft; the propeller absorbs the bhp and converts it into thrust hp, with some power wasted in the process. **Propulsive (propeller) efficiency = thrust hp / bhp**. On average, thrust hp constitutes approximately **80%** of bhp, the other 20% being lost in friction and slippage. Controlling propeller blade angle (as with a constant-speed propeller) is the best method of obtaining maximum propulsive efficiency across all flight conditions — a low blade angle for takeoff/low-speed maximum thrust, an increased blade angle for high-speed flight.

## Operating Cycles — the Four-Stroke (Otto) Cycle

Most aircraft reciprocating engines operate on the **four-stroke cycle**, also called the **Otto Cycle**. Four strokes are required to complete the operating cycle of each cylinder, requiring **two complete revolutions of the crankshaft (720°)** — each cylinder fires once every two revolutions.

**Bore** is the cylinder's inside diameter. **Stroke** is the distance the piston travels from TDC (Top Dead Centre) to BDC (Bottom Dead Centre), or vice versa.

**Intake stroke.** The piston moving down reduces cylinder pressure, drawing the fuel/air mixture through the carburettor and intake valve. The intake valve opens before TDC on the exhaust stroke (**valve lead**), and the exhaust valve closes after the piston has started the intake stroke (**valve lag**) — together this is **valve overlap**, which aids internal cylinder cooling, increases the charge induced, and assists scavenging. The intake valve is timed to close about **50° to 75° past BDC** on the compression stroke, using the momentum of the incoming gases to more fully charge the cylinder.

**Compression stroke.** With the intake valve closed, the piston's continued upward travel compresses the fuel/air mixture. The charge is fired by an electric spark **20° to 35° before TDC**, timed so combustion completes just after TDC.

**Power stroke.** The rapidly expanding burning gases push the piston down with a force that can exceed **15 tons (30,000 psi)** at maximum power, at gas temperatures between **3,000°F and 4,000°F**. The exhaust valve opens well before BDC (on some engines 50° to 75° before BDC) while cylinder pressure is still present, using that pressure to help scavenge the cylinder and avoid overheating.

**Exhaust stroke.** The piston travelling up from BDC pushes the burnt gases out through the exhaust port. The intake valve begins opening **8° to 55° before TDC** on the exhaust stroke (part of valve overlap), with the low pressure created by the escaping exhaust gases helping to draw in the fresh charge.

## Piston Displacement & Compression Ratio

**Piston displacement** is the volume displaced by the piston moving from BDC to TDC, expressed in cubic inches (or cubic centimetres). For one cylinder: **V = A x H** (area of the cylinder cross-section x stroke length); for the whole engine, this is multiplied by the number of cylinders. The area of a circle is **A = π x R²** (π ≈ 3.1416).

**Worked example:** a PWA 14-cylinder engine with a 5.5 in bore and 5.5 in stroke: R = 2.75 in, A = π x 2.75² ≈ 23.7584 sq in, V (one cylinder) = A x H ≈ 130.67 cu in, Total V = 130.67 x 14 ≈ **1,830 cu in** (rounded).

**Compression ratio** compares the volume of space in the cylinder with the piston at the bottom of the stroke to the volume of space with the piston at the top of the stroke. Example: 140 cu in at the bottom, 20 cu in at the top → 140/20, or **7:1**. Compression ratio is a controlling factor in maximum horsepower but is limited by fuel grade and by the high engine speeds/manifold pressures needed for takeoff.

**Manifold pressure** is the average absolute pressure of the charge in the intake manifold, measured in inches of mercury (in Hg), and depends on throttle setting and supercharging. Compression ratio and manifold pressure together determine cylinder pressure before ignition (manifold pressure x compression ratio). Example: at 30 in Hg manifold pressure with a 7:1 compression ratio, pressure just before ignition is approximately **210 in Hg**; at 60 in Hg manifold pressure, approximately **420 in Hg**.

High compression ratios improve fuel economy (more heat converted to useful work, less absorbed by cylinder walls, cooler operation, higher thermal efficiency) but are limited by detonation/knock. Some high-compression engines suppress knock at high manifold pressures by injecting an anti-knock fluid (acting mainly as a coolant), allowing more power for short periods such as takeoff and emergencies.

## Two-Stroke & Four-Stroke Diesel Engine Operating Cycles

The **diesel engine** is a compression-ignition engine — fuel is ignited by the heat of a compressed gas rather than a spark plug. It was invented and patented by **Rudolf Diesel in 1892**; he demonstrated it at the **1900 World's Fair using peanut oil**. Air is compressed to a much higher compression ratio than in a spark-ignition engine; at the top of the stroke, fuel is injected at high pressure through an atomizing nozzle into the hot, high-pressure air, where it ignites and burns rapidly. Diesel engines may use **glow plugs** or resistive grid heaters in the intake manifold to aid cold starting.

There are two classes of diesel engine — **two-stroke** and **four-stroke**. Many larger diesels operate on the two-stroke cycle; smaller engines generally use the four-stroke cycle.

**Four-stroke diesel strokes:**

1. **Inlet stroke** — inlet valve open, exhaust closed; piston TDC to BDC; cylinder fills with clean air.
2. **Compression stroke** — both valves closed; piston BDC to TDC; air heats to a temperature sufficient to ignite fuel.
3. **Power stroke** — near TDC, fuel is injected into the hot compressed air, ignites, burns and expands, forcing the piston down.
4. **Exhaust stroke** — near BDC the exhaust valve opens; the piston drives the burnt gas out.

Because there are three non-working strokes to one working stroke, a heavy **flywheel** is fitted to keep the engine turning, particularly on single-cylinder engines. In the four-stroke diesel, valve overlap occurs only at TDC; supercharged engines usually have more valve overlap than naturally-aspirated engines.

**Two-stroke (Clerk cycle) diesel:** one crankshaft revolution per complete cycle, giving twice as many working strokes per minute as a comparable four-stroke at the same speed. Theoretically this should give twice the power of a comparable four-stroke, but due to scavenging difficulties, actual output is nearer **one-and-a-half times** that of a comparable four-stroke. A **scavenge blown** two-stroke uses an engine-driven air pump/blower and an inlet port (instead of an inlet valve) together with an exhaust port or overhead exhaust valve.

**Scavenging methods** used in two-stroke diesels:

- **Cross scavenging** — the simplest system, with inlet and exhaust ports on opposite sides of the cylinder; relatively inefficient and increasingly rare.
- **Uniflow scavenging** — considered the **most efficient** system; incoming air enters at one end of the cylinder and spirals the entire length before passing out through the exhaust port/valve at the other end.
- **Loop scavenging** — incoming air moves from the inlet port to the top of the cylinder and back down to the exhaust port, forming a loop; more efficient than cross scavenging. The **Schnuerle loop** is a specific loop-scavenging arrangement with two inlet ports, one on each side of a single exhaust port.

## Engine Configuration & Firing Order

**In-line engines** usually have four or six cylinders in an upright or inverted row; rarely more than six, due to the difficulty of cooling rear cylinders and crankshaft length. Firing order for a four-cylinder in-line engine is typically **1, 3, 4, 2** (or 1, 2, 4, 3); for a six-cylinder in-line engine, typically **1, 4, 2, 6, 3, 5**. British engines are usually numbered from the propeller end; American engines are often numbered in the opposite direction.

**Horizontally-opposed engines** (usually four or six cylinders) have individual connecting rods on separate, staggered crankpins, with a single camshaft operating both banks. Firing order for a four-cylinder horizontally-opposed engine is normally **1, 3, 4, 2**; for a six-cylinder, normally **1, 4, 5, 2, 3, 6**.

**Radial engines** have an odd number of cylinders (usually not more than nine) arranged radially around the crankcase, with all connecting rods attached to a single crankpin via a master rod (one throw per bank of cylinders). On a seven-cylinder radial, the firing order can only be alternate cylinders in the direction of rotation: **1, 3, 5, 7, 2, 4, 6**, with the angle between adjacent cylinders being 360°/7 (approximately 51 3/7°). Counterweights and vibration dampers are fitted to balance the heavy master-rod assembly.

Except on sleeve-valve engines, radial engine valves are operated by a **cam drum** concentric with, and driven by, the crankshaft, carrying separate rows of cams for inlet and exhaust valves:

- Seven- and nine-cylinder radials: **four** equally-spaced cams per row, drum rotating at **1/8 engine speed**.
- Three- and five-cylinder radials: **two** equally-spaced cams per row, drum rotating at **1/4 engine speed**.

## Power Calculation & Measurement

**Indicated horsepower (ihp)** is the power developed in the combustion chambers, calculated from **indicated mean effective pressure (IMEP)** — the average of the varying cylinder pressure over the operating cycle. For a four-stroke engine:

**Indicated horsepower = PLANK / 33,000**

where P = IMEP (psi), L = stroke length (ft), A = piston cross-sectional area (sq in), N = power strokes per minute (= rpm / 2 for a four-stroke), K = number of cylinders.

**Worked example:** P = 165 lb/sq in, L = 0.5 ft (6 in stroke), A ≈ 23.76 sq in (5.5 in bore), N = 1,500 (half of 3,000 rpm), K = 12 cylinders → Indicated hp ≈ **1,069.2**.

**Brake horsepower (bhp)** is the actual power delivered to the propeller shaft — the indicated horsepower minus the power lost to friction. Bhp is measured via **torque** (Force x Distance), using devices such as the **Prony brake**, dynamometer, or torquemeter. The Prony brake consists of a hinged collar/brake clamped to a drum on the propeller shaft, with an arm bearing on a scale; torque = scale force x arm length.

**Worked example (Prony brake):** scale reading 200 lb, arm length 3.18 ft → torque = 200 x 3.18 = **636 lb-ft**.

From torque, bhp = (2π x torque x rpm) / 33,000. **Worked example:** force 200 lb, arm 3.18 ft, rpm 3,000 → bhp ≈ **363.2**.

**Friction horsepower (fhp)** is indicated horsepower minus brake horsepower — the power used overcoming friction of moving parts, drawing in fuel, expelling exhaust, and driving accessories. On modern aircraft engines this may be as high as **10% to 15%** of indicated horsepower.

**IMEP, BMEP and FMEP:** IMEP is the theoretical, frictionless average cylinder pressure. That portion of IMEP producing brake horsepower is **BMEP (brake mean effective pressure)**; the remainder, used overcoming internal friction, is **FMEP (friction mean effective pressure)**. **BMEP = (bhp x 33,000) / (LANK)**.

**Worked example:** bhp = 1,000, L = 0.5 ft, A ≈ 23.76 sq in, N = 1,500, K = 12 → BMEP ≈ **154.32 lb/sq in**.

**Thrust horsepower (thp)** results from the engine and propeller working together: thp = bhp x propeller efficiency. **Worked example:** an engine developing 1,000 bhp with a propeller of 85% efficiency gives thrust horsepower of 1,000 x 0.85 = **850 thp**. Of the four types of horsepower, it is thrust horsepower that determines the actual performance of the engine-propeller combination.
        $cnt$,
        1
    ) RETURNING id INTO s1_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 16.2: Engine Performance
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m16_id, 'M16.2', 'Engine Performance',
        $cnt2$
# Engine Performance

## Factors Affecting Engine Power

The power produced by an engine results from burning a fuel/air mixture in the cylinders — the greater the weight of mixture burnt, the greater the energy released. Power produced in the cylinders is first used to overcome internal friction and drive accessories (pumps, generators); the remainder drives the propeller.

There are three main methods of increasing engine power output:

1. **Increasing the volume of the cylinders**
2. **Increasing combustion pressure**
3. **Increasing engine speed**

In each case, the strength and weight of the engine's components are the main limiting factors.

**Increased volume:** cylinder size can be increased directly, but this increases the weight of reciprocating and rotating parts, raising stresses (piston acceleration, inertia forces on the crankshaft) toward material strength limits. Beyond this limit, the usual method is to increase the **number of cylinders**, though this increases complexity and can affect reliability.

**Increased pressure:** there are two ways to raise cylinder pressure —

- Increasing the **compression ratio** (the ratio of total cylinder volume with the piston at BDC to volume with the piston at TDC), which produces higher pressure at the end of compression and greater force on the piston during combustion.
- Increasing **volumetric efficiency** — the weight of charge filling the swept volume at standard temperature and pressure — either by mechanically raising the pressure of the mixture fed to the inlet valve (**supercharging**), or to a lesser extent through careful design of induction passages, ports and valves.

Both compression ratio and manifold (induction pipe) pressure are limited by the strength of engine materials and by **detonation** and **pre-ignition**.

**Increased speed:** burning a greater weight of fuel per unit time by running the engine faster also increases power, but higher centrifugal forces and other stresses require stronger (and disproportionately heavier) components. Again, material strength is the limiting factor.

## Mixture Requirements / Leaning

Air and fuel vapour will burn when mixed in ratios of approximately **8:1 to 20:1** by weight. Complete combustion — using up all the hydrogen and carbon in the fuel and all the oxygen in the air — occurs only at approximately **15:1**, known as the **chemically-correct** or **stoichiometric** mixture, which produces the highest combustion temperatures.

In practice, mixing and distribution are imperfect, so it is common to run engines somewhat richer than chemically-correct (about **12.5:1**) when maximum power is required, to ensure no single cylinder runs at severely reduced power from being unduly weak. A slight excess of fuel has little effect on power (all the oxygen is still consumed; the excess fuel's cooling effect can even be beneficial), whereas weak mixtures rapidly reduce power because some inspired oxygen goes unused — a much greater power penalty than slight richness.

A mixture weaker than chemically-correct burns at a lower temperature and a slower rate. Power output decreases as mixture is weakened, but specific fuel consumption decreases even more, so weakening below 15:1 improves fuel economy. For economical cruising at moderate power, air/fuel ratios of about **18:1** may be used, with advanced ignition timing to compensate for the slower rate of combustion.

At high power settings, increased engine speed and cylinder pressure raise mixture temperature and risk detonation; cooling is provided by using excess fuel, with air/fuel ratios as low as **10:1** sometimes used at maximum power — this excess fuel acts mainly as a coolant, since there is insufficient oxygen to burn it. A richer mixture is also needed at low engine speeds, because reduced exhaust gas velocity leaves more residual exhaust gas (diluting the incoming charge) during valve overlap.

## Normal and Abnormal Combustion

**Normal combustion** occurs when the fuel/air mixture ignites and burns progressively, producing maximum pressure shortly after the piston passes TDC on the compression stroke. The flame front starts at the spark plugs and travels across the combustion chamber at approximately **70 to 100 feet per second**, its velocity influenced by fuel type, mixture ratio, pressure and temperature.

When the mixture is ignited by means other than the normal spark, the result is **abnormal combustion**, of which there are two distinct types: **detonation** and **pre-ignition**.

### Detonation

Detonation occurs when the fuel/air mixture is subjected to a combination of excessively high temperature and pressure, reaching its spontaneous combustion point. Normal progressive combustion is then replaced by a sudden explosion. Because of the piston's position when the detonation wave starts, extremely high pressures result — tests have shown pressures **in excess of 4,000 psi** during detonation, with an effect on the piston equivalent to a sharp blow from a sledgehammer.

Detonation is more serious in aircraft engines than in automobile engines because it is difficult to hear above other aircraft noise, so corrective action may come too late. It causes a definite loss of power, engine overheating, and can lead to pre-ignition and physical engine damage. Indications include an otherwise-unexplained rise in cylinder head temperature, unexplained loss of power (especially at higher power settings), and a whitish-orange exhaust flame with puffs of black smoke.

### Pre-Ignition

Pre-ignition is ignition of the fuel/air mixture before normal ignition — before electrical arcing occurs at the spark plugs. It may be caused by excessively hot exhaust valves, carbon particles, or spark plug electrodes heated to an incandescent/glowing state — local "hot spots" often themselves caused by the high temperatures of detonation. Its effect on the engine resembles early or advanced ignition timing, and is harmful enough that an engine can only continue operating normally for a short period, especially if detonation and pre-ignition occur together.

A key difference from detonation: if conditions for detonation exist in one cylinder, they may exist in **all** cylinders, but pre-ignition may exist in **only one or two cylinders**, making it harder to detect (a cylinder-head-temperature thermocouple may not be located at the affected cylinder). The most reliable indication is a loss of power (difficult to determine without a torquemeter); another indication is glowing carbon particles observed being discharged from the exhaust system.
        $cnt2$,
        2
    ) RETURNING id INTO s2_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M16.1 Fundamentals (19 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s1_id, 'Work is defined as:',
     '[{"id":"a","text":"Force divided by distance","correct":false},{"id":"b","text":"Force multiplied by distance","correct":true},{"id":"c","text":"Force multiplied by time","correct":false}]',
     '{"B1"}'),

    (s1_id, 'The horsepower is derived from James Watt''s observation that a workhorse could work at the rate of:',
     '[{"id":"a","text":"33,000 ft-lb per minute (550 ft-lb per second)","correct":true},{"id":"b","text":"1,000 ft-lb per minute","correct":false},{"id":"c","text":"778 ft-lb per minute","correct":false}]',
     '{"B1"}'),

    (s1_id, 'Mechanical efficiency of an engine is expressed by the formula:',
     '[{"id":"a","text":"bhp / ihp","correct":true},{"id":"b","text":"ihp / bhp","correct":false},{"id":"c","text":"fhp / bhp","correct":false}]',
     '{"B1"}'),

    (s1_id, 'The difference between indicated horsepower and brake horsepower is known as:',
     '[{"id":"a","text":"Thrust horsepower (thp)","correct":false},{"id":"b","text":"Friction horsepower (fhp)","correct":true},{"id":"c","text":"Mean effective horsepower","correct":false}]',
     '{"B1"}'),

    (s1_id, 'The mechanical efficiency of the average aircraft reciprocating engine approaches:',
     '[{"id":"a","text":"50%","correct":false},{"id":"b","text":"90%","correct":true},{"id":"c","text":"99%","correct":false}]',
     '{"B1"}'),

    (s1_id, 'Of the total heat produced by combustion in a reciprocating engine, approximately how much is lost through the exhaust?',
     '[{"id":"a","text":"5% to 10%","correct":false},{"id":"b","text":"15% to 20%","correct":false},{"id":"c","text":"40% to 50%","correct":true}]',
     '{"B1"}'),

    (s1_id, 'Overall, aircraft reciprocating engines are approximately how thermally efficient?',
     '[{"id":"a","text":"34%","correct":true},{"id":"b","text":"60%","correct":false},{"id":"c","text":"90%","correct":false}]',
     '{"B1"}'),

    (s1_id, 'Volumetric efficiency of 100% is defined as an engine drawing in a volume of charge, at standard sea-level density, that is:',
     '[{"id":"a","text":"Exactly equal to its piston displacement","correct":true},{"id":"b","text":"Twice its piston displacement","correct":false},{"id":"c","text":"Half its piston displacement","correct":false}]',
     '{"B1"}'),

    (s1_id, 'Which of the following is listed as a factor that decreases volumetric efficiency?',
     '[{"id":"a","text":"Long intake pipes of small diameter","correct":true},{"id":"b","text":"Short intake pipes of large diameter","correct":false},{"id":"c","text":"Low cylinder-head temperature","correct":false}]',
     '{"B1"}'),

    (s1_id, 'On average, thrust horsepower constitutes approximately what proportion of brake horsepower?',
     '[{"id":"a","text":"50%","correct":false},{"id":"b","text":"80%","correct":true},{"id":"c","text":"100%","correct":false}]',
     '{"B1"}'),

    (s1_id, 'In a four-stroke (Otto cycle) engine, one complete operating cycle requires:',
     '[{"id":"a","text":"One revolution of the crankshaft (360°)","correct":false},{"id":"b","text":"Two revolutions of the crankshaft (720°)","correct":true},{"id":"c","text":"Four revolutions of the crankshaft (1440°)","correct":false}]',
     '{"B1"}'),

    (s1_id, 'The period during which both the intake and exhaust valves are off their seats together, near top dead centre, is called:',
     '[{"id":"a","text":"Valve lag","correct":false},{"id":"b","text":"Valve overlap","correct":true},{"id":"c","text":"Valve lead only","correct":false}]',
     '{"B1"}'),

    (s1_id, 'A PWA 14-cylinder engine has a 5.5 in bore and a 5.5 in stroke. Using V = A x H per cylinder and multiplying by the number of cylinders, the total piston displacement is approximately:',
     '[{"id":"a","text":"1,830 cu in","correct":true},{"id":"b","text":"130.7 cu in","correct":false},{"id":"c","text":"3,660 cu in","correct":false}]',
     '{"B1"}'),

    (s1_id, 'A cylinder has 140 cu in of space when the piston is at the bottom of its stroke, and 20 cu in of space when the piston is at the top. The compression ratio is:',
     '[{"id":"a","text":"7:1","correct":true},{"id":"b","text":"14:1","correct":false},{"id":"c","text":"2:1","correct":false}]',
     '{"B1"}'),

    (s1_id, 'The diesel engine, a compression-ignition engine, was invented and patented by Rudolf Diesel in:',
     '[{"id":"a","text":"1892","correct":true},{"id":"b","text":"1900","correct":false},{"id":"c","text":"1912","correct":false}]',
     '{"B1"}'),

    (s1_id, 'Of the scavenging methods used in two-stroke diesel engines, which is considered the most efficient?',
     '[{"id":"a","text":"Cross scavenging","correct":false},{"id":"b","text":"Uniflow scavenging","correct":true},{"id":"c","text":"Loop scavenging","correct":false}]',
     '{"B1"}'),

    (s1_id, 'On a seven-cylinder radial engine, the firing order (alternate cylinders in the direction of rotation) is:',
     '[{"id":"a","text":"1, 2, 3, 4, 5, 6, 7","correct":false},{"id":"b","text":"1, 3, 5, 7, 2, 4, 6","correct":true},{"id":"c","text":"1, 7, 6, 5, 4, 3, 2","correct":false}]',
     '{"B1"}'),

    (s1_id, 'The formula for indicated horsepower of a four-stroke engine uses the letters P, L, A, N, K (spelling ''PLANK''), where N represents:',
     '[{"id":"a","text":"The number of cylinders","correct":false},{"id":"b","text":"The number of power strokes per minute (rpm/2)","correct":true},{"id":"c","text":"The stroke length in feet","correct":false}]',
     '{"B1"}'),

    (s1_id, 'A typical device used to measure the torque, and hence the brake horsepower, of an engine on a test stand is the:',
     '[{"id":"a","text":"Manometer","correct":false},{"id":"b","text":"Prony brake","correct":true},{"id":"c","text":"Venturi tube","correct":false}]',
     '{"B1"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M16.2 Engine Performance (9 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s2_id, 'The three main methods of increasing an engine''s power output are:',
     '[{"id":"a","text":"Increasing cylinder volume, increasing combustion pressure, and increasing engine speed","correct":true},{"id":"b","text":"Increasing weight, increasing friction, and reducing cooling","correct":false},{"id":"c","text":"Reducing compression ratio, reducing volume, and reducing speed","correct":false}]',
     '{"B1"}'),

    (s2_id, 'Two ways of increasing the pressure in a cylinder are:',
     '[{"id":"a","text":"Increasing the compression ratio, and increasing volumetric efficiency (e.g. by supercharging)","correct":true},{"id":"b","text":"Reducing engine speed and increasing cylinder volume only","correct":false},{"id":"c","text":"Increasing valve overlap and reducing manifold pressure","correct":false}]',
     '{"B1"}'),

    (s2_id, 'Air and fuel vapour will burn when mixed, by weight, in ratios of approximately:',
     '[{"id":"a","text":"8:1 to 20:1","correct":true},{"id":"b","text":"1:1 to 5:1","correct":false},{"id":"c","text":"30:1 to 50:1","correct":false}]',
     '{"B1"}'),

    (s2_id, 'The chemically-correct, or stoichiometric, fuel/air mixture ratio, which produces the highest combustion temperature, is approximately:',
     '[{"id":"a","text":"8:1","correct":false},{"id":"b","text":"15:1","correct":true},{"id":"c","text":"20:1","correct":false}]',
     '{"B1"}'),

    (s2_id, 'When maximum power (rather than best fuel economy) is required, engines are commonly run at a mixture strength of about 12.5:1, which is:',
     '[{"id":"a","text":"Leaner than chemically-correct, to save fuel","correct":false},{"id":"b","text":"Richer than chemically-correct, to avoid any cylinder running unduly weak","correct":true},{"id":"c","text":"Exactly the chemically-correct ratio","correct":false}]',
     '{"B1"}'),

    (s2_id, 'For economical cruising at moderate power, air/fuel ratios of about 18:1 may be used, which requires:',
     '[{"id":"a","text":"Retarding the ignition timing","correct":false},{"id":"b","text":"Advancing the ignition timing, to allow for the slower rate of combustion","correct":true},{"id":"c","text":"No change to ignition timing","correct":false}]',
     '{"B1"}'),

    (s2_id, 'In normal combustion, the flame front starts at the spark plugs and travels across the combustion chamber at approximately:',
     '[{"id":"a","text":"7 to 10 feet per second","correct":false},{"id":"b","text":"70 to 100 feet per second","correct":true},{"id":"c","text":"700 to 1,000 feet per second","correct":false}]',
     '{"B1"}'),

    (s2_id, 'During detonation, tests have shown that cylinder pressures can reach:',
     '[{"id":"a","text":"In excess of 4,000 psi","correct":true},{"id":"b","text":"Approximately 500 psi","correct":false},{"id":"c","text":"Approximately 1,000 psi maximum","correct":false}]',
     '{"B1"}'),

    (s2_id, 'A key difference between detonation and pre-ignition is that:',
     '[{"id":"a","text":"Pre-ignition can only occur at low power, detonation only at high power","correct":false},{"id":"b","text":"If conditions for detonation exist, they may exist in all cylinders, whereas pre-ignition may exist in only one or two cylinders","correct":true},{"id":"c","text":"Detonation only ever affects a single cylinder, while pre-ignition always affects every cylinder","correct":false}]',
     '{"B1"}');

END $$;
