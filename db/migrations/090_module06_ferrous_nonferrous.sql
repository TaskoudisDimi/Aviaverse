-- Module 06: Materials and Hardware (B1) — Ferrous and Non-Ferrous Aircraft Materials
-- Source: EASA Part-66 Module 06 Study Notes (Sub-Modules 6.1 and 6.2) + associated question bank

DO $$
DECLARE
    m06_id INT;
    s1_id  INT;
    s2_id  INT;
BEGIN
    SELECT id INTO m06_id FROM easa_modules WHERE code = 'M06';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M06.1') THEN
        RAISE NOTICE 'M06.1/M06.2 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 06.1: Ferrous Aircraft Materials
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m06_id, 'M06.1', 'Ferrous Aircraft Materials',
        $cnt$
# Ferrous Aircraft Materials

## Why a Mechanic Cares About Materials

An airframe is a compromise. The designer wants strength, but every gram of strength costs weight, and the part must survive vibration, salt, heat and 30 years of service. When a part is replaced or a repair is made, the mechanic is stepping into that compromise.

- **Never substitute a material** unless the manufacturer's data (SRM / IPC / AMM) allows it.
- "Same size and shape" is **not** "same material". Strength, ductility, corrosion behaviour and thermal expansion all change.
- An inferior material can erase the finest workmanship — the joint looks perfect and fails anyway.

## Properties of Metals

Exam questions in this module are very often nothing more than a definition — learn these word-perfect.

| Property | Meaning | Where it matters |
|----------|---------|-------------------|
| **Hardness** | Resistance to abrasion, penetration, cutting or permanent indentation | Bearing races, gear teeth, cams |
| **Strength** | Ability to resist deformation / to carry stress without breaking | All structure — quoted as UTS, yield, proof |
| **Density** | Mass (weight) of unit volume | Weight & balance; choice of aluminium over steel |
| **Malleability** | Can be hammered, rolled or pressed into shape without cracking | Sheet work — cowlings, fairings, wing tips |
| **Ductility** | Can be permanently drawn, bent or twisted without breaking | Wire, tubing, extrusions, rivets |
| **Elasticity** | Returns to original size/shape when the load is removed | Springs; all structure below elastic limit |
| **Toughness** | Resists tearing and shear; deforms a lot before breaking | Anything shock loaded — landing gear |
| **Brittleness** | Breaks with little or no deformation | Cast iron, cast aluminium, very hard steel — avoid |
| **Fusibility** | Can be melted / joined by fusion | Welding. Steel 2,600°F, aluminium alloy 1,100°F |
| **Conductivity** | Carries heat or electricity | Welding heat input, bonding & EMI |
| **Thermal expansion** | Grows when heated, shrinks when cooled | Jigs, tolerances, welded assemblies |

**Easy trap:** *Malleability* = shaped by compression (hammering, rolling). *Ductility* = shaped by tension (drawing into wire). They are similar but not the same word — lead is malleable but not very ductile.

## Iron, Carbon and Steel

"Ferrous" simply means iron is the main constituent. Pure iron is soft and of little structural use. Add carbon and everything changes.

- **Carbon steel** = iron + up to about 1% carbon (plus small residuals).
- **Alloy steel** = carbon steel + deliberate additions (Ni, Cr, Mo, V, W, Si, Mn).
- **Cast iron** = above about 2% carbon. Hard, brittle, good in compression, poor in tension. Not used for aircraft structure.

Carbon is the cheapest way to buy strength and hardness, but it is paid for in ductility and weldability. That trade-off is the whole story of steel.

| Class | Carbon % | SAE numbers | Typical aircraft use |
|-------|----------|-------------|------------------------|
| **Low carbon (mild)** | 0.10 – 0.30 | 1010 – 1030 | Locking wire, cable bushings, some nuts, threaded rod ends, clamps, secondary structure |
| **Medium carbon** | 0.30 – 0.50 | 1035 – 1045 | Machined parts, light forgings, rod ends — takes surface hardening well |
| **High carbon** | 0.50 – 1.05 | 1050 – 1095 | Springs (1095 sheet = flat springs, wire = coil springs), cutting tools. Very hard, limited aircraft use |

### The SAE / AISI Four-Digit Index

Read the number left to right:

1. **1st digit** — the main alloying class (1 = carbon, 2 = nickel, 3 = Ni-Cr, 4 = Mo, 5 = Cr, 6 = Cr-V, 8 = Ni-Cr-Mo, 9 = Si-Mn).
2. **2nd digit** — usually the approximate percentage of the principal alloying element.
3. **Last two digits** — the carbon content in hundredths of a percent (points of carbon).

So **4130** = chrome-molybdenum steel with about 0.30% carbon. **1095** = plain carbon steel with 0.95% carbon. **2330** = nickel steel, 3% Ni, 0.30% C.

An "X" or "E" prefix sometimes seen (X4130, E4340) refers to the melting practice or a permitted variation, not to the chemistry class.

**Memory hook:** the last two digits are always carbon, in hundredths of a percent. If nothing else about SAE numbers is remembered, remember that — it answers a lot of questions on its own.

## What Each Alloying Element Does

| Element | Effect |
|---------|--------|
| **Carbon (C)** | Hardness and tensile strength up; ductility, toughness and weldability down. Makes the steel hardenable. |
| **Nickel (Ni)** | Hardness, tensile strength and elastic limit up with very little loss of ductility. Intensifies the effect of heat treatment; improves toughness at low temperature. |
| **Chromium (Cr)** | Hardness, wear resistance, hardenability and corrosion resistance. The key element in stainless. |
| **Molybdenum (Mo)** | Raises ultimate strength without hurting ductility or workability; deep hardening; resists creep at high temperature; keeps grain fine. |
| **Vanadium (V)** | Fine grain, toughness, fatigue and shock resistance. Chrome-vanadium for springs and bearings. |
| **Manganese (Mn)** | Deoxidiser; increases strength, hardenability and wear resistance. |
| **Silicon (Si)** | Deoxidiser; raises elastic limit — used in spring steels. |
| **Tungsten (W)** | Retains hardness at red heat — tool steels, exhaust valves. |
| **Cobalt (Co)** | High-temperature strength; used in turbine hot-section alloys. |
| **Sulphur / Phosphorus** | Normally impurities (brittleness). Added deliberately only to free-machining steels (11xx, 12xx) — not for highly stressed parts. |

## The Steels You Will Actually Meet

**Chrome-molybdenum — 4130 / 4140 (the classic):** about 0.30% C, 0.50–1.10% Cr, 0.15–0.25% Mo. Deep hardening, easily machined, readily welded by gas or electric methods, good at elevated temperature. Used for engine mounts, welded fuselage tube structure, landing gear legs, fittings, bolts, tubing. A heat-treated 4130 tube is roughly **four times as strong** as an SAE 1025 tube of the same size and weight — that is why it displaced plain carbon steel for tubular structure.

**Nickel-chrome-molybdenum — 4340, 300M:** very high strength after heat treatment; used for landing gear main fittings, high-strength bolts, gears, shafts. 300M is a modified 4340 with silicon added — the classic ultra-high-strength undercarriage steel. Extremely notch sensitive; a scratch or careless grind can start a crack.

**Nickel steel — 2330:** nickel raises hardness, tensile strength and elastic limit without much loss of ductility. Used widely for bolts, terminals, keys, clevises and pins.

**Chrome-vanadium — 6150 / 6195:** strength, toughness, wear and fatigue resistance after heat treatment; can be folded flat without cracking in special sheet grades. 6150 — springs. 6195 (higher carbon) — ball and roller bearings.

### Corrosion-Resistant Steels (CRES / "Stainless")

Chromium is the key: above roughly 11% Cr a tough, self-healing chromium-oxide film forms and protects the surface. Nickel is added to make the steel austenitic, which improves formability and toughness.

| Family | Typical | Magnetic? | Notes |
|--------|---------|-----------|-------|
| **Austenitic** (300 series) | 304, 316, 321, "18-8" (18% Cr, 8% Ni) | No (non-magnetic when annealed) | Best corrosion resistance; cannot be hardened by heat treatment — only by cold work. Firewalls, exhaust, control cables, tie rods, clamps |
| **Ferritic** (400 series) | 430 | Yes | Moderate corrosion resistance, not hardenable by heat treatment. Trim, cowl parts |
| **Martensitic** (400 series) | 410, 416, 440 | Yes | Hardenable by heat treatment. Fasteners, valve parts, cutlery-type hardness |
| **Precipitation hardening** | 17-4 PH, 17-7 PH | Yes | Formed soft, then aged at low temperature to very high strength with little distortion |
| **Maraging** | 18Ni (250/300) | Yes | Very high strength + toughness, minimal distortion on ageing. Special applications |

- 18-8 expands about 50% more than mild steel and conducts heat only about 40% as well, so it distorts badly and is harder to weld. Use low heat input and clamp/jig the job.
- Its strength can be raised by cold working — which is also why it work-hardens under a blunt drill and becomes almost impossible to cut. Sharp tools, slow speed, firm feed, no dwelling.

### Inconel and Nickel Alloys (strictly non-ferrous, but always compared here)

- **Inconel** = nickel-chromium-iron. Looks just like CRES and is used interchangeably in exhaust systems, but retains strength far better above 800°C.
- Distinguish them with the **electrochemical test**: a drop of dimethylglyoxime in ethyl alcohol on filter paper after passing a small current through the sample. **Bright pink spot = Inconel. Brown spot = stainless steel.** (A very light pink can occur on some CRES — Inconel is unmistakably strong pink.)

## Identifying Steels on the Shop Floor

- **Part number / paperwork first.** Everything else is a cross-check, never a substitute.
- Colour codes on bar stock ends, and the mill certificate.
- **Magnet test** — austenitic CRES is non-magnetic, most other steels are magnetic. Cold work can make austenitic slightly magnetic, so it is only a guide.
- **Spark test** — hold the sample lightly on a grinding wheel and read the spark stream:

| Material | Spark appearance |
|----------|-------------------|
| Wrought iron | Long straw-coloured shafts, turning white at the end |
| Cast iron | Short red sparks near the wheel turning to straw |
| Low carbon steel | Long straight shafts with a few white sprigs |
| High carbon steel | Many bushy sprigs, whiter and brighter — more carbon = more bursts |
| Nickel steel | Small white blocks of light inside the main burst |
| Stainless / non-ferrous | Few or no sparks — the test does not work |

Spark testing is inexact unless done by an experienced person on samples that differ appreciably in carbon content.

## Heat Treatment of Steel — The Theory

Heat treatment works because steel changes its internal crystal structure at particular temperatures. Everything else — hardening, tempering, annealing — is just a way of choosing which structure to finish with.

| Structure | What it is | Character |
|-----------|------------|-----------|
| **Ferrite** | Almost pure iron (BCC) | Soft, ductile, magnetic |
| **Cementite** | Iron carbide Fe3C | Very hard, very brittle |
| **Pearlite** | Alternate layers of ferrite + cementite | Good strength with reasonable ductility — the normal room-temperature structure |
| **Austenite** | Face-centred cubic iron holding carbon in solution, above the upper critical point | Non-magnetic, soft at temperature, the starting point for hardening |
| **Martensite** | Austenite quenched so fast the carbon cannot escape | Very hard, very brittle, highly stressed — must be tempered |
| **Bainite** | Formed at intermediate cooling rates | Tough, between pearlite and martensite |

**Critical points:**
- Heating through the **lower critical point** (~723°C) pearlite begins to change to austenite.
- At the **upper critical point** (varies with carbon, ~750–900°C) the change to austenite is complete.
- **Decalescence** — the metal absorbs heat and briefly stops rising in temperature while it changes on heating.
- **Recalescence** — on cooling it gives that heat back and momentarily brightens.
- Steel loses its magnetism at the **Curie point** (~768°C) — the old workshop check for "hot enough".

## Heat Treatment of Steel — The Four Operations

Every heat treatment is the same three-part recipe: **heat – soak – cool**. Only the temperature and the cooling rate change.

**Hardening**
1. Heat slowly and uniformly to just above the upper critical point.
2. Soak — roughly one hour per inch (25 mm) of thickness — so the whole section becomes austenite.
3. Quench rapidly. The trapped carbon forms martensite = maximum hardness.

- Quench media, fastest to slowest: **brine – water – oil – air**. Faster quench = harder but more distortion and greater risk of cracking.
- Quench with the long axis vertical and the heavy section entering first; agitate the part, not the bath, to break the vapour blanket.
- Plain carbon steel below about 0.30% C will not harden appreciably by quenching — it must be case hardened instead.

**Tempering (drawing back)**
- Always follow hardening. As-quenched martensite is glass-hard, brittle and full of internal stress — it can crack on the bench overnight.
- Reheat below the lower critical point (typically 150–650°C), soak, then cool (usually in still air).
- Effect: hardness and tensile strength come down a little, toughness and ductility go up a lot, internal stresses are relieved. Higher tempering temperature = softer and tougher — this is how the designer dials in a specified UTS.

**Annealing**
- Purpose: maximum softness and ductility, refine the grain, remove all internal stress, make the part machinable or formable.
- Heat to just above upper critical, soak, then cool as slowly as possible — in the switched-off furnace or buried in lime, ash or vermiculite.
- Sub-types: process/stress-relief annealing (below critical, to remove work-hardening between forming stages) and spheroidise annealing (for machinability of high-carbon steel).

**Normalising**
- Heat to slightly above upper critical (a little higher than for annealing), soak, then cool in still air.
- Result: fine, uniform grain, relieved rolling/welding/forging stresses, slightly stronger and harder than annealed.
- Standard treatment after welding a steel structure and before final machining or hardening.

**The one-line comparison to remember:**
- Hardening — quench fast → hard + brittle.
- Tempering — reheat below critical → gives back toughness.
- Annealing — cool very slowly in the furnace → softest possible.
- Normalising — cool in still air → fine uniform grain, stress free.
- **The only difference between annealing and normalising is the cooling rate.**

## Case (Surface) Hardening

Sometimes a hard wearing skin is wanted over a tough, shock-absorbing core — a gear tooth, a cam, a bearing journal. Low-carbon steel is tough but will not harden, so carbon or nitrogen is added to the surface only.

| Process | How | Notes |
|---------|-----|-------|
| **Carburising** | Soak the part in a carbon-rich medium (charcoal pack, cyanide salt bath, or carburising gas) at 900–950°C so carbon diffuses into the surface, then harden and temper | Case 0.005–0.060 in. Areas that must stay soft are copper plated or left with machining allowance. Requires re-hardening afterwards |
| **Nitriding** | Hold at about 500–550°C in ammonia gas for up to ~90 hours; nitrogen forms very hard nitrides in the surface | Lowest distortion, hardest case, good corrosion and fatigue resistance. No quench needed. Needs special steels (Nitralloy — contains aluminium). Crankshafts, cylinder barrels, gears |
| **Cyaniding** | Dip in molten sodium cyanide, then quench | Fast, thin case. Cyanide is extremely toxic — now rare |
| **Flame / induction hardening** | Heat the surface only, very quickly, and quench immediately | Used on medium-carbon steel; no change of chemistry, only of structure. Gear teeth, journals |

## Shaping Metal

**Hot working** (above the recrystallisation temperature) — large shape changes, low forces, no work hardening because the grain re-forms as fast as it is distorted.
- **Rolling** — ingot to sheet, plate, bar, sections.
- **Forging** — pressing or hammering hot metal in dies. Grain flow follows the shape, so a forging is far stronger than the same shape machined from bar. Used for spars, undercarriage parts, crankshafts, discs.
- **Extrusion** — forcing hot metal through a die like toothpaste to make stringers, channels, T and Z sections. Aluminium extrudes beautifully; steel much less easily.
- Down-side: scale, oxidation, decarburisation, poor surface finish and looser tolerances.

**Cold working** (below recrystallisation) — good surface finish and close tolerance; the metal work hardens: strength and hardness up, ductility down.
- Processes: cold rolling, drawing (wire and tube), pressing, deep drawing, spinning, stretch forming, shot peening.
- If forming continues, the metal must be process annealed between stages or it will crack.

**Casting**
- **Sand casting** — cheap, any size, rough finish, some porosity from mould gas.
- **Permanent (gravity die) mould** — metal mould, better finish, fewer voids, closer tolerance.
- **Die casting** — metal forced in under pressure; excellent finish, thin sections, high volume.
- **Investment ("lost wax")** — wax pattern melted out of a ceramic shell; near-net-shape precision parts such as turbine blades.
- Castings are inherently weaker and more brittle than forgings of the same alloy — they have no directional grain flow.

## Testing Ferrous Materials

**(a) Hardness Testing**

| Test | Indenter | How it is read | Comment |
|------|----------|------------------|---------|
| **Brinell** | Hardened steel or tungsten carbide ball, usually 10 mm | Measure the diameter of the impression with a microscope; BHN = load / spherical area of indentation | Big impression — good for coarse, non-uniform material (castings, forgings). Destructive on finished parts |
| **Rockwell** | Diamond cone ("brale") or 1/16 in ball | Machine reads depth difference between minor (10 kg) and major load directly on a dial — no optics | Fast, direct reading. Scale C (diamond, 150 kg) for hard steel; Scale B (ball, 100 kg) for soft steel and non-ferrous |
| **Vickers** | Square-based diamond pyramid, 136° | Measure the diagonals of the square impression | One continuous scale for everything from soft to very hard; very accurate; small impression |
| **Shore scleroscope** | Diamond-tipped hammer dropped down a tube | Height of rebound | Portable, essentially non-destructive — can be used on an installed part |
| **Barcol** | Spring-loaded sharp point, hand held | Direct dial reading | Portable; used on soft metals and on composites to check cure |

**Rules for a valid hardness test:** surface flat, clean and smooth, specimen properly supported; indentations at least 3 diameters apart, and not close to an edge; section thick enough that the impression does not show on the back face; right scale for the material — a diamond in soft metal or a ball in hard metal both give nonsense.

**(b) Tensile Testing**

A prepared specimen of known gauge length is pulled slowly to destruction while load and extension are recorded. The stress/strain diagram it produces tells almost everything about the material.

- **Limit of proportionality** — up to here stress is proportional to strain (Hooke's Law). The slope is Young's Modulus (E) = stiffness.
- **Elastic limit** — the last point from which the specimen still returns to its original length.
- **Yield point** — stress suddenly gives; a sharp yield appears in mild steel only.
- **Proof stress** — for materials with no clear yield (aluminium, CRES) the stress that leaves a stated permanent strain is quoted, e.g. 0.1% or 0.2% proof stress. Found by drawing a line parallel to the elastic slope, offset by that strain.
- **Ultimate Tensile Strength (UTS)** — the maximum stress the specimen carries. After this the specimen necks.
- **Breaking / fracture stress** — lower than UTS because the area has reduced.
- **Ductility** is reported as % elongation and % reduction of area.
- Stress = load / original area (N/mm², MPa or psi). Strain = extension / original length (no units).

**(c) Fatigue Testing**

- **Fatigue** = failure under repeated or fluctuating loads at a stress far below the UTS. It is the number one cause of structural failure in service.
- Tested by rotating-bending (Wohler) or push-pull machines; results plotted as an **S-N curve** (stress against number of cycles to failure, log scale).
- **Endurance limit / fatigue limit** — the stress below which steel will endure an unlimited number of cycles. **Steels have one; aluminium alloys do not**, so aluminium structure always has a finite life.
- A fatigue fracture shows a smooth, burnished area with beach marks growing from an origin, then a rough, crystalline final overload zone.
- Fatigue starts at stress raisers: sharp corners, tool marks, scratches, corrosion pits, poor drilled holes. Hence "blend out scratches", "no sharp radii", "deburr every hole".
- Shot peening, cold expansion of holes and polishing all improve fatigue life by putting the surface into compression.

**(d) Impact Testing**

- Measures **toughness** — resistance to a sudden shock load — by the energy absorbed in breaking a notched specimen with a swinging pendulum. Result in joules or ft-lb.
- **Izod** — specimen clamped vertically as a cantilever, V-notch facing the pendulum, struck above the notch.
- **Charpy** — specimen laid horizontally as a simply supported beam, struck on the face opposite the notch.
- Used to find the ductile-brittle transition temperature — many steels become brittle when cold, which matters at altitude.

**(e) Creep**

- Slow, permanent extension under a steady load at high temperature over a long time.
- Three stages: **primary** (decreasing rate), **secondary** (steady, longest — this rate is the design figure), **tertiary** (accelerating, necking, then rupture).
- Critical for turbine discs and blades — it is why turbine blade tip clearances open up over the engine life.

## Fast Revision

- Last two digits of an SAE number = carbon in hundredths of a percent.
- 4130 = chrome-moly, the welded-structure steel. 18-8 = 18% Cr, 8% Ni, non-magnetic.
- Harden → quench (brine/water/oil/air) → always temper afterwards.
- Anneal = furnace cool (softest). Normalise = air cool (fine grain).
- Nitriding = lowest distortion case hardening, no quench, needs Nitralloy.
- Brinell measures the width of the dent; Rockwell measures its depth.
- Steel has an endurance limit — aluminium alloy does not.
- Izod = vertical cantilever. Charpy = horizontal beam.
        $cnt$,
        1
    ) RETURNING id INTO s1_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 06.2: Non-Ferrous Aircraft Materials
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m06_id, 'M06.2', 'Non-Ferrous Aircraft Materials',
        $cnt2$
# Non-Ferrous Aircraft Materials

## Aluminium — Why the Airframe Is Made of It

- Density about **one third of steel** (2.7 vs 7.8 g/cm³), so a thicker, stiffer section can be used for the same weight.
- Pure aluminium is weak (90 MPa) but alloyed and heat treated it reaches steel-like strength (2024-T3 470 MPa, 7075-T6 ~570 MPa) at a third of the weight.
- Excellent corrosion resistance from a self-forming oxide film; excellent conductor; easily formed, machined, extruded and riveted; non-magnetic; not brittle at low temperature.
- Weak points: low melting point (660°C) so no good above 150°C; difficult to weld in the high-strength grades; no fatigue endurance limit; galvanic corrosion when coupled to steel.

## The Wrought Aluminium Four-Digit System

First digit = principal alloying element. Second digit = modification of the original alloy (0 = original, no special impurity control). Last two digits = in the 1xxx series, the purity above 99%; in all other series, simply identify the individual alloy.

| Series | Main alloying element | Heat treatable? | Typical alloys and use |
|--------|--------------------------|-------------------|---------------------------|
| **1xxx** | None — 99%+ pure aluminium | No | 1100 (99.0%) — ducting, non-structural sheet, cooking-pot soft |
| **2xxx** | Copper | Yes | 2017, 2024 — the classic structural sheet, skins, ribs, spars. Poor corrosion resistance → usually clad |
| **3xxx** | Manganese | No | 3003 — ducting, cowling, tanks, oil lines |
| **4xxx** | Silicon | No (mostly) | 4043 — welding and brazing filler rod |
| **5xxx** | Magnesium | No | 5052, 5056 — hydraulic and fuel lines, rivets for magnesium, marine environments |
| **6xxx** | Magnesium + silicon | Yes | 6061 — general purpose, structural tube, fittings, easily welded |
| **7xxx** | Zinc | Yes | 7075, 7178 — highest strength; upper wing skins, spar caps, forgings. More notch and stress-corrosion sensitive |
| **8xxx** | Other (Li, Fe, Sn) | Varies | Al-Li alloys — lighter and stiffer again |
| **9xxx** | — | — | Not currently used |

**The two you must never mix up:**
- **2024** — copper based, "duralumin" family, workhorse of the fuselage skin. Good fatigue and damage tolerance.
- **7075** — zinc based, higher static strength but less tolerant of notches, and needs careful temper (T73/T76) to resist stress-corrosion cracking.

Cast alloys use a different system (e.g. 356.0) with a decimal point — do not confuse them with wrought numbers.

## Temper Designations — The Bit After the Dash

The alloy number tells the chemistry. The temper tells what has been done to it, and that decides the strength. Written after a dash: 2024-T3, 7075-T6, 5052-O.

| Temper | Meaning |
|--------|---------|
| **F** | As fabricated — no special control over properties |
| **O** | Annealed — softest, most ductile, lowest strength |
| **H** | Strain hardened (cold worked). Applies to non-heat-treatable alloys only |
| **H1x** | Strain hardened only |
| **H2x** | Strain hardened then partially annealed |
| **H3x** | Strain hardened then stabilised |
| **..x2 / x4 / x6 / x8** | Degree of hardness: 2 = quarter hard, 4 = half hard, 6 = three-quarter hard, 8 = full hard, 9 = extra hard |
| **W** | Solution heat treated — an unstable temper, still naturally ageing. Quoted with a time, e.g. 7075-W (1/2 hr) |
| **T2** | Annealed (cast products) |
| **T3** | Solution heat treated, then cold worked |
| **T4** | Solution heat treated and naturally aged to a stable condition |
| **T5** | Artificially aged only (from the as-cast/as-extruded hot condition) |
| **T6** | Solution heat treated then artificially aged |
| **T7** | Solution heat treated then stabilised / overaged |
| **T8** | Solution heat treated, cold worked, then artificially aged |
| **T9** | Solution heat treated, artificially aged, then cold worked |
| **T10** | Artificially aged then cold worked |

So **3003-H14** = manganese alloy, strain hardened, half hard. **2024-T3** = solution treated, cold worked, naturally aged. **7075-T6** = solution treated and artificially aged — the strongest common condition.

## Heat Treatment of Aluminium Alloys

Steel hardens by trapping carbon. Aluminium hardens by a completely different mechanism — **precipitation**. Do not carry over steel thinking.

**Step 1 — Solution heat treatment**
1. Heat to a closely controlled temperature (typically 495–540°C, tolerance only a few degrees) so the alloying constituents dissolve into solid solution.
2. Soak long enough for the section — roughly 30 min for thin sheet, up to an hour or more for thick material.
3. Quench immediately in cold water. The delay between furnace and quench must be minimal (a few seconds for thin sheet) or the properties and corrosion resistance are ruined.

The alloy is now supersaturated and unstable — soft, very workable, and in the **"W" condition**. This is the moment to form it.

- Overheating is unforgivable. Aluminium gives no colour warning before it melts. Exceed the temperature and eutectic melting occurs at the grain boundaries — permanently destroyed material that cannot be recovered.
- Quench media: cold water for thin sheet (fastest, best properties), hot water or spray for heavy forgings and castings to limit distortion and residual stress.

**Step 2 — Ageing (precipitation)**
- **Natural ageing** — at room temperature. 2017 and 2024 reach full strength in about 4 days; roughly half the gain appears in the first hour. Result = T3 / T4.
- **Artificial ageing** (precipitation heat treatment) — held at a low temperature (typically 120–190°C) for several hours. Needed by 2014, 6061 and all 7xxx alloys. Result = T6.
- Over-age (too hot or too long) and strength falls again — though controlled overageing (T73) is used deliberately to buy stress-corrosion resistance at the cost of a little strength.

**Annealing aluminium**
- Heat to about 340–410°C, soak, then cool slowly (controlled rate, often furnace cooled to ~260°C).
- Gives maximum softness for severe forming. The part must be re-heat-treated afterwards to restore strength — annealed 2024 is not airworthy structure.

**Reheat treatment and the "icebox" trick**
- Solution-treated alloy can be kept soft by refrigeration below 0°C, which almost stops natural ageing. This is how 2017 and 2024 rivets ("icebox rivets") are stored.
- Once out of the freezer: drive **2017-T within about 1 hour**, and **2024-T within 10–20 minutes**. After that they must go back for re-heat treatment.
- Never return warmed rivets to the cold store mixed with fresh ones.
- Repeated re-heat treatment of clad sheet is limited (usually **3 times**) because the pure cladding diffuses into the core and loses its protection.

## Alclad

- A high-strength alloy core (2024, 7075) rolled with a coating of pure aluminium on each face, about **5% of the thickness per side**.
- Double protection: the pure aluminium is corrosion resistant itself, and it is anodic to the core, so it protects the core electrolytically even where a scratch exposes it.
- Practical consequences: never sand or scrape through the cladding; deep scratches must be treated as damage; watch out on countersinks and drilled holes, which expose bare core.

## The Other Non-Ferrous Metals

**Magnesium**
- The lightest structural metal in use — about two thirds the weight of aluminium (1.74 g/cm³).
- Used for gearbox and engine casings, nose-wheel doors, flap skins, instrument panels, wheels, brackets.
- Very poor corrosion resistance — it is the **most anodic** common structural metal, so it corrodes sacrificially wherever it touches almost anything else. Must be kept sealed, painted and chromate treated; use magnesium-compatible 5056 rivets.
- Burns fiercely once ignited (grinding dust and swarf are a real fire hazard) and water or CO2 must not be used on a magnesium fire — use dry powder (class D) or dry sand.
- Heat treatable by solution treatment and ageing, similar in principle to aluminium.

**Titanium**
- Density between aluminium and steel (4.5 g/cm³), strength comparable to steel, so the **best strength-to-weight ratio** of the common metals.
- Outstanding corrosion resistance (immune to salt water and most acids) and useful up to about 400–500°C — hence firewalls, engine nacelles, exhaust shrouds, pylons, hydraulic tubing (3AL-2.5V) and highly loaded fittings.
- Structures: **alpha** (weldable, tough, not heat treatable), **beta** (formable, heat treatable), **alpha-beta** (e.g. Ti-6Al-4V — the workhorse).
- Difficult to work: low thermal conductivity, work hardens, galls and seizes, and burns/ignites when finely divided. Machine slow with sharp tools, heavy feed and plenty of coolant.
- Do not touch it with cadmium-plated tools or leave chlorinated solvent or fingerprints on hot parts — both cause embrittlement/stress corrosion.
- Heat treatment: stress relieving (480–600°C), annealing (700–800°C), solution treating and ageing for alpha-beta alloys.

**Copper and Copper Alloys**
- **Copper** — highest practical electrical and thermal conductivity, very ductile; electrical cable, bus bars, lock wire, small tubing (now largely obsolete for fluid lines because it work hardens and cracks with vibration).
- **Brass** (Cu + Zn) — fittings, bushings, plumbing. Muntz metal and red brass for corrosion-critical parts.
- **Bronze** (Cu + Sn) — bushings, bearings, valve guides. Aluminium bronze is strong and used for bushings and pump parts. Phosphor bronze for springs and diaphragms.
- **Beryllium copper** — the best copper alloy spring material; high fatigue strength and non-sparking. Its dust is toxic.

**Nickel Alloys**
- **Monel** (~68% Ni, 30% Cu) — very strong and corrosion resistant, non-magnetic; gears, chains, linkages, fasteners in a marine environment, and rivets for stainless.
- **K-Monel** — Monel + aluminium, precipitation hardenable, non-magnetic; used near compasses and for high-strength corrosion-resistant parts.
- **Inconel / Nimonic** — nickel-chromium; retain strength and resist oxidation at very high temperature; exhaust systems, firewalls, turbine cases, combustion liners, turbine blades.

**Others in passing**
- **Lead** — shielding, balance weights, solder. **Tin** — plating and solder. **Zinc** — galvanising and plating. **Cadmium** — plating on steel fasteners (toxic; do not use above 235°C or in contact with titanium).

## Identifying and Testing Non-Ferrous Materials

- Part number and paperwork first, then colour codes and stamped markings on the stock.
- **Aluminium**: light, non-magnetic, dull ring when tapped; clad sheet shows a bright core if an edge is filed.
- **Magnesium**: lighter still, and a drop of a suitable test solution or a spark-free scraping check distinguishes it — a tiny sliver burns with a brilliant white flame (do this only under controlled conditions).
- **Hardness**: Brinell and Rockwell B (ball indenter) are the normal choice for soft non-ferrous metals; Barcol for portable checks on soft alloys and composites. A Rockwell C diamond in soft aluminium gives meaningless numbers.
- Tensile, fatigue, impact and creep testing are done exactly as for steel — but remember **aluminium and magnesium have no fatigue endurance limit**, so components are given a safe life instead.
- **Conductivity (eddy current) testing** is a genuinely useful field check on aluminium — it detects incorrect heat treatment and heat damage, because conductivity changes with temper.

## Fast Revision

- 2xxx = copper, 5xxx = magnesium, 6xxx = Mg+Si, 7xxx = zinc. Heat treatable: 2, 6, 7 (and some 4, 8).
- O = annealed, H = strain hardened, T = heat treated. T3 natural age after cold work, T6 artificially aged.
- Solution treat → quench fast → age. Overheating aluminium is unrecoverable and gives no colour warning.
- Alclad = pure aluminium ~5% per side, protects the core both as a barrier and sacrificially.
- Icebox rivets: 2017 within 1 hour, 2024 within 10–20 minutes of leaving the freezer.
- Magnesium: lightest, most anodic, burns — never fight the fire with water or CO2.
- Titanium: best strength/weight, hates cadmium, chlorine and fingerprints when hot.
        $cnt2$,
        2
    ) RETURNING id INTO s2_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M06.1 Ferrous Aircraft Materials (21 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s1_id, 'A ferrous metal is one whose main constituent is:',
     '[{"id":"a","text":"Aluminium","correct":false},{"id":"b","text":"Iron","correct":true},{"id":"c","text":"Magnesium","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'With respect to ferrous metals, which statement is true?',
     '[{"id":"a","text":"Iron is not an element of ferrous metals","correct":false},{"id":"b","text":"Iron is a main element and most ferrous metals are magnetic","correct":true},{"id":"c","text":"Iron is a main element and ferrous metals are not magnetic","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'The addition of chromium to steel primarily produces:',
     '[{"id":"a","text":"Increased resistance to corrosion","correct":true},{"id":"b","text":"Reduced hardness","correct":false},{"id":"c","text":"A non-ferrous alloy","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'At normal temperatures, high carbon steel is harder than low carbon steel because:',
     '[{"id":"a","text":"It has more austenite","correct":false},{"id":"b","text":"Of the percentage of carbon present in the grain structure","correct":true},{"id":"c","text":"It has less austenite","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'Nitriding is a form of:',
     '[{"id":"a","text":"Tempering","correct":false},{"id":"b","text":"Anodising","correct":false},{"id":"c","text":"Case hardening","correct":true}]',
     '{"B1","B2"}'),

    (s1_id, 'The purpose of case hardening a steel component is to:',
     '[{"id":"a","text":"Produce a hard case over a tough core","correct":true},{"id":"b","text":"Reduce the carbon content of the steel","correct":false},{"id":"c","text":"Introduce carbon uniformly through the whole section","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'The difference between annealing and normalising is that:',
     '[{"id":"a","text":"Both are heated above the upper critical point; annealing cools slowly in the furnace, normalising cools in air","correct":true},{"id":"b","text":"Both are heated below the upper critical point; annealing cools in air, normalising cools slowly","correct":false},{"id":"c","text":"Annealing is heated above the upper critical point and normalising below it","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'Annealing of steel:',
     '[{"id":"a","text":"Toughens the metal without affecting ductility","correct":false},{"id":"b","text":"Makes the metal soft and malleable","correct":true},{"id":"c","text":"Makes the metal brittle","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'Tempering of hardened steel is carried out to:',
     '[{"id":"a","text":"Retain surface hardness but soften the core","correct":false},{"id":"b","text":"Retain core hardness but soften the surface","correct":false},{"id":"c","text":"Significantly reduce brittleness without a major drop in strength","correct":true}]',
     '{"B1","B2"}'),

    (s1_id, 'Steel is tempered:',
     '[{"id":"a","text":"After hardening","correct":true},{"id":"b","text":"Before hardening","correct":false},{"id":"c","text":"Instead of hardening","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'A low carbon steel would normally be case hardened using:',
     '[{"id":"a","text":"The nitriding process","correct":false},{"id":"b","text":"Flame or induction hardening","correct":false},{"id":"c","text":"Pack or gas carburising","correct":true}]',
     '{"B1","B2"}'),

    (s1_id, 'High speed steel relies heavily on which metallic element for its ability to keep cutting other metals even when the tool edge becomes red hot?',
     '[{"id":"a","text":"Tungsten","correct":true},{"id":"b","text":"Nickel","correct":false},{"id":"c","text":"Manganese","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'Which of the following are all hardness-testing machines?',
     '[{"id":"a","text":"Rockwell, Brinell and Izod","correct":false},{"id":"b","text":"Rockwell, Vickers and Izod","correct":false},{"id":"c","text":"Rockwell, Brinell and Vickers","correct":true}]',
     '{"B1","B2"}'),

    (s1_id, 'The proof stress of a material is the stress at which:',
     '[{"id":"a","text":"The material reaches its ultimate tensile strength","correct":false},{"id":"b","text":"A small, stated amount of permanent set (strain) takes place","correct":true},{"id":"c","text":"Necking of the material begins","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'Using the SAE/AISI four-digit index, what do the last two digits of a steel designation such as 4130 always represent?',
     '[{"id":"a","text":"The carbon content, in hundredths of a percent","correct":true},{"id":"b","text":"The percentage of the principal alloying element","correct":false},{"id":"c","text":"The melting practice used to produce the steel","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'A heat-treated 4130 chrome-molybdenum tube, compared with an SAE 1025 plain carbon tube of the same size and weight, is:',
     '[{"id":"a","text":"About the same strength","correct":false},{"id":"b","text":"Roughly four times as strong","correct":true},{"id":"c","text":"Roughly half as strong","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'Austenitic (300 series) corrosion-resistant steel is:',
     '[{"id":"a","text":"Magnetic and hardenable by heat treatment","correct":false},{"id":"b","text":"Non-magnetic when annealed, and cannot be hardened by heat treatment — only by cold work","correct":true},{"id":"c","text":"Magnetic but cannot be hardened at all","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'The electrochemical spot test used to distinguish Inconel from stainless steel uses a drop of dimethylglyoxime in ethyl alcohol after passing a small current through the sample. A bright pink spot indicates:',
     '[{"id":"a","text":"Inconel","correct":true},{"id":"b","text":"Stainless steel","correct":false},{"id":"c","text":"Plain carbon steel","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'When hardening steel, quench media, ordered from fastest to slowest cooling rate, are:',
     '[{"id":"a","text":"Air, oil, water, brine","correct":false},{"id":"b","text":"Brine, water, oil, air","correct":true},{"id":"c","text":"Oil, brine, air, water","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'Compared with a forging of the same alloy and shape, a casting is generally:',
     '[{"id":"a","text":"Stronger, because it has directional grain flow","correct":false},{"id":"b","text":"Weaker and more brittle, because it has no directional grain flow","correct":true},{"id":"c","text":"Identical in strength, since both use the same alloy","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'In an impact test, how are the Izod and Charpy specimens mounted?',
     '[{"id":"a","text":"Izod is clamped vertically as a cantilever; Charpy is laid horizontally as a supported beam","correct":true},{"id":"b","text":"Izod is laid horizontally as a supported beam; Charpy is clamped vertically as a cantilever","correct":false},{"id":"c","text":"Both are clamped vertically as cantilevers","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'Regarding the fatigue (endurance) limit:',
     '[{"id":"a","text":"Steel has an endurance limit; aluminium alloys do not, so aluminium structure always has a finite life","correct":true},{"id":"b","text":"Aluminium alloys have an endurance limit; steel does not","correct":false},{"id":"c","text":"Neither steel nor aluminium alloys have an endurance limit","correct":false}]',
     '{"B1","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M06.2 Non-Ferrous Aircraft Materials (21 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s2_id, 'In the wrought aluminium four-digit system, the 5xxx series has which main alloying element?',
     '[{"id":"a","text":"Copper","correct":false},{"id":"b","text":"Magnesium","correct":true},{"id":"c","text":"Zinc","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'In an aluminium alloy designation such as 2024, what does a second digit of "0" indicate?',
     '[{"id":"a","text":"The percentage of impurities in the alloy","correct":false},{"id":"b","text":"The alloy has not been modified from the original","correct":true},{"id":"c","text":"The alloy has been modified from the original","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'In the designation 2024-T36, which part of the code indicates the heat treatment / temper condition?',
     '[{"id":"a","text":"T36","correct":true},{"id":"b","text":"20","correct":false},{"id":"c","text":"24","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'The temper symbol "W" on an aluminium alloy indicates that it:',
     '[{"id":"a","text":"Is for workshop use only","correct":false},{"id":"b","text":"Has been solution heat treated and will respond effectively to precipitation (ageing) treatment","correct":true},{"id":"c","text":"Has been fully annealed","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'The effect of precipitation heat treatment (artificial ageing) on a solution-treated aluminium alloy is to make it:',
     '[{"id":"a","text":"Softer and more ductile","correct":false},{"id":"b","text":"Less strong and less hard","correct":false},{"id":"c","text":"Harder, stronger and less ductile","correct":true}]',
     '{"B1","B2"}'),

    (s2_id, 'Repeated re-solution-heat-treatment of clad (Alclad) aluminium sheet is normally limited to about:',
     '[{"id":"a","text":"1 time","correct":false},{"id":"b","text":"3 times","correct":true},{"id":"c","text":"As many times as required","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'On an Alclad sheet, the pure aluminium cladding on each face is approximately what proportion of the total sheet thickness?',
     '[{"id":"a","text":"0.2%","correct":false},{"id":"b","text":"1%","correct":false},{"id":"c","text":"5%","correct":true}]',
     '{"B1","B2"}'),

    (s2_id, 'Alclad material consists of:',
     '[{"id":"a","text":"A high-strength alloy core with a pure aluminium coating","correct":true},{"id":"b","text":"Pure aluminium with a duralumin coating","correct":false},{"id":"c","text":"A high-strength alloy core with a magnesium coating","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'If a test piece of an aluminium material turns black when treated with caustic soda, the material is:',
     '[{"id":"a","text":"An aluminium alloy","correct":true},{"id":"b","text":"Pure Alclad cladding","correct":false},{"id":"c","text":"Commercially pure aluminium","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'The main constituent metal of Monel is:',
     '[{"id":"a","text":"Aluminium","correct":false},{"id":"b","text":"Nickel","correct":true},{"id":"c","text":"Chromium","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'Compared with the other common structural metals, titanium alloys offer:',
     '[{"id":"a","text":"A low cost of manufacture above all else","correct":false},{"id":"b","text":"The best strength-to-weight ratio","correct":true},{"id":"c","text":"Good corrosion resistance but a poor strength-to-weight ratio","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'Which metal must never be heated in a molten salt bath?',
     '[{"id":"a","text":"Magnesium alloy","correct":true},{"id":"b","text":"Duralumin","correct":false},{"id":"c","text":"Titanium","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'Magnesium alloys used on aircraft can usually be recognised by:',
     '[{"id":"a","text":"A bright, unfinished metallic surface","correct":false},{"id":"b","text":"A yellowish surface, due to a protective chromate treatment","correct":true},{"id":"c","text":"A dull black anodised surface","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'Aluminium is used in preference to pure aluminium (i.e. as an alloy) mainly because the alloy is:',
     '[{"id":"a","text":"Stronger","correct":true},{"id":"b","text":"Lighter","correct":false},{"id":"c","text":"A better electrical conductor","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'Compared with steel, the density of aluminium is approximately:',
     '[{"id":"a","text":"The same as steel","correct":false},{"id":"b","text":"One third that of steel (2.7 vs 7.8 g/cm3)","correct":true},{"id":"c","text":"Twice that of steel","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'Which of the following correctly distinguishes 2024 from 7075 aluminium alloy?',
     '[{"id":"a","text":"2024 is copper based with good fatigue/damage tolerance; 7075 is zinc based, higher static strength but more notch and stress-corrosion sensitive","correct":true},{"id":"b","text":"2024 is zinc based; 7075 is copper based","correct":false},{"id":"c","text":"Both alloys have identical corrosion and fatigue behaviour","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, '"Icebox" aluminium rivets (2017 and 2024) are kept soft by refrigeration below 0°C. Once removed from the freezer, 2024-T rivets must be driven within approximately:',
     '[{"id":"a","text":"10-20 minutes","correct":true},{"id":"b","text":"6 hours","correct":false},{"id":"c","text":"24 hours","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'The three structural types of titanium alloy are:',
     '[{"id":"a","text":"Alpha, beta and alpha-beta (e.g. Ti-6Al-4V)","correct":true},{"id":"b","text":"Austenitic, ferritic and martensitic","correct":false},{"id":"c","text":"Wrought, cast and clad","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'When working with titanium, why must cadmium-plated tools and chlorinated solvents be avoided?',
     '[{"id":"a","text":"They discolour the surface finish only","correct":false},{"id":"b","text":"They can cause embrittlement / stress corrosion of the titanium","correct":true},{"id":"c","text":"They reduce the electrical conductivity of the part","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'Bronze, a copper-tin alloy, is typically used on aircraft for:',
     '[{"id":"a","text":"Bushings, bearings and valve guides","correct":true},{"id":"b","text":"Electrical cable and bus bars","correct":false},{"id":"c","text":"Turbine blades and combustion liners","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'Which copper alloy is prized as the best copper-based spring material, offering high fatigue strength and being non-sparking?',
     '[{"id":"a","text":"Brass","correct":false},{"id":"b","text":"Beryllium copper","correct":true},{"id":"c","text":"Phosphor bronze","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'A genuinely useful field test for detecting incorrect heat treatment or heat damage in an aluminium component is:',
     '[{"id":"a","text":"Magnetic particle inspection","correct":false},{"id":"b","text":"Conductivity (eddy current) testing, since conductivity changes with temper","correct":true},{"id":"c","text":"The spark test","correct":false}]',
     '{"B1","B2"}');

END $$;
