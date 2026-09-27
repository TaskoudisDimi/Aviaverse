-- Module 06: Materials and Hardware (B1) — Composite and Non-Metallic Materials, Corrosion
-- Source: EASA Part-66 Module 06 Study Notes (Sub-Modules 6.3 and 6.4) + associated question bank

DO $$
DECLARE
    m06_id INT;
    s3_id  INT;
    s4_id  INT;
BEGIN
    SELECT id INTO m06_id FROM easa_modules WHERE code = 'M06';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M06.3') THEN
        RAISE NOTICE 'M06.3/M06.4 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 06.3: Composite and Non-Metallic Materials
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m06_id, 'M06.3', 'Composite and Non-Metallic Materials',
        $cnt$
# Composite and Non-Metallic Materials

## Plastics — The Two Families

| | Thermoplastic | Thermosetting |
|---|---|---|
| **Structure** | Long chains, not cross-linked | Chains cross-linked into one rigid network during cure |
| **Effect of heat** | Softens and can be reshaped repeatedly; melts | Does not soften; chars and decomposes if overheated |
| **Reworkable?** | Yes — can be welded, formed, recycled | No — cure is a one-way chemical change |
| **Examples** | Acrylic (Perspex/Plexiglas), polycarbonate, nylon, PVC, PTFE, PEEK | Epoxy, polyester, vinyl ester, phenolic, polyimide, bismaleimide |
| **Aircraft use** | Windows, canopies, ducts, fairings, insulation, bushings | Matrix of nearly all composites, adhesives, laminates |

### Transparent Plastics — Handling Matters

- **Acrylic** — light, optically excellent, easy to form and polish. Stretched acrylic is biaxially stretched to greatly improve resistance to crazing and crack propagation.
- **Polycarbonate** — far tougher and more impact resistant (bird strike, canopies) but softer, scratches easily and is attacked by more solvents.
- Store flat, with the masking paper on, away from sunlight, heat and solvent fumes.
- Clean with plenty of clean water and the bare hand or a soft clean cloth, then mild soap. Never use petrol, methylated spirits, thinners, acetone, de-icing fluid, glass cleaner or a dry cloth.
- **Crazing** = a network of fine surface cracks caused by solvent attack or internal stress. It scatters light, weakens the panel and grows.
- When cutting or drilling: sharp tools, slow feed, no heat build-up, and never clamp tightly — allow for the very high thermal expansion.

## What a Composite Is

A composite is two or more materials combined so that the result is better than either alone, while each keeps its identity. In aviation that means fibres carrying the load and a matrix holding them.

- **Reinforcement (fibre)** — carries the tensile load. Very strong and stiff along its length, useless across it.
- **Matrix (resin)** — bonds the fibres together, transfers load between them, keeps them aligned, resists compression and shear, and protects them from the environment.
- **Core** (in a sandwich) — separates the two skins to create bending stiffness at almost no weight.

The fibre gives the strength; the resin decides the service temperature, the environmental resistance and how the part is processed.

### Advantages

- Very high strength-to-weight and stiffness-to-weight ratios (a 20–30% weight saving is typical).
- Tailorable — the engineer can put fibre exactly where the load is and in the direction the load acts.
- No corrosion; excellent fatigue resistance; good vibration damping.
- Complex shapes made in one piece = fewer joints, fewer fasteners, fewer leak paths.
- Transparent to radar/radio — hence radomes and antenna fairings.

### Disadvantages

- Damage is often invisible from the outside (**BVID** — barely visible impact damage) yet extensive inside.
- Poor through-thickness and interlaminar strength; brittle, with little warning before failure.
- Expensive material and tooling; strict storage, cleanliness, temperature and humidity control.
- Repairs need heat, vacuum, controlled cure and trained staff; inspection needs NDT rather than the eye.
- **Carbon is cathodic to aluminium** — a serious galvanic corrosion problem at every mixed joint. Isolate with a glass ply or sealant.
- Conducts lightning poorly — needs a bonded mesh, foil or wire in the surface ply.

## Reinforcing Fibres

| Fibre | Colour / feel | Strengths | Weaknesses / notes |
|---|---|---|---|
| **E-glass** | White, soft | Cheap, good tensile strength, electrically insulating, transparent to radio — radomes | Heavy and not very stiff; loses strength if the surface is damaged |
| **S-glass** | White | About 30% stronger and stiffer than E-glass | More expensive |
| **Aramid (Kevlar)** | Golden yellow, tough, fluffy when cut | Extremely tough, excellent impact and abrasion resistance, very light | Poor in compression, absorbs moisture, very hard to cut and machine cleanly, difficult to sand |
| **Carbon / graphite** | Black, stiff | Highest stiffness and strength/weight, low expansion, fatigue resistant | Brittle, expensive, electrically conductive → galvanic corrosion with aluminium and lightning issues |
| **Boron** | Grey, wire-like | Very high stiffness and compressive strength | Very expensive, tungsten core, hard to cut, largely superseded |
| **Ceramic** | White | Retains strength at very high temperature | Used in hot-section and specialist parts |

- Fibres are supplied as rovings, yarn, tape (unidirectional), woven cloth, chopped strand mat and as prepreg.
- A sizing or finish is applied to the fibre to make the resin wet it properly — handle cloth with clean gloves, because skin oil defeats it.

### Weave Styles

- **Plain weave** — one over, one under. Most stable, least drapeable, most crimp (so slightly lower strength).
- **Twill** — over two, under two, giving a diagonal line. Drapes better over curves, smoother surface.
- **Satin** (4, 5 or 8 harness) — one over, several under. Best drape and highest strength (least crimp) but least stable and slightly unbalanced.
- **Unidirectional** — nearly all fibres one way, held by a light cross thread. Maximum strength in one direction only.
- **Bi-directional / bias** — cut or laid at 45 degrees to carry shear.

**Warp** runs the length of the roll (the strong, straight direction and the reference for orientation). **Weft (fill)** runs across it. The **selvedge** is the finished edge that stops the cloth fraying.

### Ply Orientation

- Orientation is quoted relative to the warp: 0°, +45°, −45°, 90°.
- A laminate is normally **balanced and symmetrical** about its mid-plane, or it will warp on cure and distort under load.
- Repair plies must reproduce the original orientation, ply for ply. Getting the angle wrong is the commonest way to make a legal-looking repair that is structurally worthless. Tolerance is typically only a few degrees.

## Matrix (Resin) Systems

| Resin | Cure | Character |
|---|---|---|
| **Polyester** | Catalyst (MEKP) at room temperature | Cheap, easy, big shrinkage, moderate strength, strong smell. Boats and non-structural parts |
| **Vinyl ester** | Similar to polyester | Better toughness and chemical resistance than polyester |
| **Epoxy** | Two part — resin + hardener, exact ratio, room or elevated temperature | The aviation standard. Best adhesion, low shrinkage, high strength, good environmental resistance. Sensitised skin reaction is common — wear gloves |
| **Phenolic** | Heat and pressure | Excellent fire, smoke and toxicity performance — cabin interior panels, ducting |
| **Bismaleimide (BMI)** | High temperature cure | Serves to ~230°C — engine and high-speed structure |
| **Polyimide** | High temperature cure | Highest service temperature (~300°C+), difficult to process |
| **Thermoplastic (PEEK, PPS)** | Melted and consolidated | Tough, unlimited shelf life, reformable, weldable, but needs high processing temperature |

- Mixing ratio is by weight or volume as specified, not by eye. Too much hardener does not cure faster or better — it cures wrong.
- **Pot life** — working time after mixing. **Gel time** — when it stops flowing. **Cure time** — full strength. All shorten with temperature and with the size of the mixed batch.

### Prepreg

- Cloth or tape pre-impregnated with exactly the right amount of partly cured (B-staged) resin. Gives consistent, high fibre-to-resin ratio and repeatable quality.
- Stored in a freezer at about −18°C, sealed against moisture. Two clocks run: **Shelf life** — total time in the freezer. **Out-time (mechanical life)** — the accumulated time out of the freezer at room temperature. Both are logged and both are limiting.
- Always thaw the sealed bag to room temperature before opening it, or condensation will form on the cold material and ruin the bond.

## Manufacture and Cure

- **Wet (hand) lay-up** — resin brushed or squeegeed into dry cloth. Simplest, but the highest resin content and the most variable.
- **Vacuum bagging** — the lay-up is sealed under a film and the air pumped out. Atmospheric pressure (up to about 1 bar / 14.7 psi) compacts the plies, squeezes out excess resin and air, and holds everything against the tool.
- **Autoclave** — vacuum bag plus external pressure and heat in a pressure vessel. The best quality and lowest voids — factory process.
- **Oven / heat blanket cure** — the usual field repair method, with thermocouples controlling the ramp, hold (dwell) and cool-down rates.
- **Resin transfer moulding (RTM)**, filament winding, pultrusion — production processes worth recognising by name.

### The Bagging Stack (bottom to top)

1. Tool or parent structure, prepared and release-treated.
2. The lay-up (plies in the correct orientation and sequence).
3. **Peel ply** — a fabric that is stripped off after cure, leaving a clean, textured surface ready to bond.
4. **Release film** — perforated or solid, controls how much resin can escape.
5. **Bleeder** — absorbs the excess resin.
6. **Breather** — keeps a continuous air path to the vacuum port over the whole part.
7. **Vacuum bag film**, sealed at the edges with sealant tape, with the vacuum port and thermocouples.

Check the bag holds vacuum (a leak-down test) before applying heat. Too much bleeder = resin starvation; too little = a resin-rich, heavy laminate.

## Sandwich Construction

- Two thin, strong facings bonded to a thick, light core. Exactly like an I-beam: the skins take tension and compression, the core takes shear and holds the skins apart.
- Doubling the core thickness can raise bending stiffness roughly sevenfold for almost no weight.
- **Cores**: honeycomb (aramid/Nomex, aluminium, glass), foam (PVC, polyurethane, PMI), balsa end grain.
- Honeycomb terms: **cell size**, **ribbon direction** (the direction of the bonded foil, and the stiff direction), density, node.
- Aluminium honeycomb is strong but corrodes and takes a permanent dent; **Nomex** is corrosion free and the normal choice for control surfaces and floors.
- The classic failure is **water ingress** — water enters through a puncture or unsealed fastener, sits in the cells, adds weight, freezes and expands, and destroys the bond. Any repair must reseal the structure completely.

## Defects and Damage

| Defect | Cause | Consequence |
|---|---|---|
| **Delamination** | Impact, over-torqued fastener, edge damage, freeze-thaw of trapped water | Plies separated — loss of bending and compression strength |
| **Disbond** | Skin-to-core or skin-to-doubler bond failure; contamination | Skin no longer works with the core |
| **Resin starvation** | Too much pressure/bleeder, too little resin | Dry, dull fibres — low strength, poor environmental protection |
| **Resin richness** | Too little pressure or too much resin | Heavy, brittle, weak in compression |
| **Porosity / voids** | Trapped air or volatiles, poor vacuum, wrong cure | Reduced interlaminar strength, moisture path |
| **BVID** | Low-energy impact — a dropped tool, hail, ground equipment | Little or no external mark, extensive internal delamination |
| **Crushed core** | Impact or over-clamping | Loss of stiffness, skins can buckle |
| **Water ingress** | Punctures, unsealed fasteners, failed seals | Weight, freeze damage, disbond, corrosion of Al core |
| **Heat / fire damage** | Overheat, exhaust, lightning | Resin discoloured, charred, soft; strength gone even if shape is intact |
| **Lightning strike** | Direct attachment | Burned/eroded surface, delamination, blown fasteners, damaged mesh |
| **Erosion / UV** | Rain, sand, sunlight | Loss of surface resin, exposed fibre — protect with paint or erosion shield |

## Inspecting Composites

- **Visual** — the first and most productive method. Look for dents, blisters, resin cracks, paint cracking, fastener depression, weeping fluid, discolouration. Use raking light across the surface.
- **Tap test (coin tap)** — the classic quick check on thin skins. A sharp, clear ring = sound; a dull, flat thud = disbond or delamination. Only valid on thin laminates and it will not find deep defects.
- **Ultrasonic** — pulse-echo or through-transmission; finds delaminations, disbonds, porosity and gives depth. The workhorse of composite NDT.
- **Thermography** — heat the part and film the cooling; defects show as thermal anomalies. Fast over large areas.
- **Radiography (X-ray)** — excellent for water in honeycomb, core crushing and node failure; poor at flat delaminations.
- Bond testers, shearography, eddy current (for the lightning mesh), moisture meters — all in use.

Always follow the SRM: it tells you the allowable damage limits, the inspection method, the zone and the repair scheme.

## Repair Principles

1. Assess and map the damage with NDT; compare with the SRM allowable damage limits. Some damage is "no action", some needs only sealing.
2. Remove all moisture — a heat-dry cycle before repair. Water in the laminate turns to steam at cure temperature and blows the repair apart.
3. Remove the damage completely back to sound material — round or oval shape, no sharp corners.
4. Prepare the bond area: strip the paint mechanically (never chemically), then taper sand the laminate.
5. Lay up the repair plies, matching the material, ply count and orientation, largest ply first or last as the SRM specifies.
6. Cure under vacuum with a controlled ramp, dwell and cool-down; record the thermocouple trace.
7. Inspect the finished repair, then restore paint, sealing, erosion and lightning protection.

- **Scarf repair** — the laminate is sanded to a shallow taper, typically about 1:20 to 1:60 per ply, giving the smoothest load path and best aerodynamic finish. Preferred but demanding.
- **Step (lap) repair** — each ply is removed a set distance beyond the one below, so the plies can be matched one for one.
- **Potted / injection repair** — a resin-filled plug for small core damage or fastener holes.
- **Bolted (doubler) repair** — a metal or composite plate bolted over the damage; used for thick, highly loaded laminates and where heat cure is impractical.

### Golden Rules for Bonding

A bond is only as good as the surface preparation. Contamination is the number one cause of repair failure. No silicone, no oil, no release agent, no bare fingers on a prepared surface. Sand with the correct grit, remove dust with clean, dry compressed air or a vacuum, then wipe with the approved solvent — and let it flash off. Solvent-wipe with a clean cloth every time; wipe one way and turn the cloth. A dirty cloth just redistributes contamination.

## Health and Safety with Composites

- Dust from cutting and sanding carbon and glass is a respiratory and skin irritant — use extraction, a proper respirator, gloves and long sleeves.
- Carbon dust is electrically conductive — it will short out electrical equipment and connectors. Bag or mask nearby avionics.
- Epoxy resins and amine hardeners are sensitisers: repeated skin contact can cause a permanent allergy. Barrier cream is not a substitute for gloves.
- Solvents — ventilation, no naked flames, correct disposal. Read the safety data sheet, every time.
- Curing resin is exothermic; a large mixed batch left in the pot can smoke and catch fire.

## Wooden Structure

Wood is a natural composite — cellulose fibres in a lignin matrix. It is light, strong along the grain, cheap and repairable, and it is found on vintage, homebuilt and some light aircraft.

- **Softwoods** (conifers) — **Sitka spruce** is the standard against which all others are compared: excellent strength-to-weight, straight grain, uniform. Douglas fir (stronger, heavier, splits more), pine, hemlock, poplar (substitutes with conditions).
- **Hardwoods** (broadleaf) — ash, birch, mahogany, walnut — used for highly loaded fittings, propellers, plywood faces and skids.

### Structure and Terms

- **Grain** — the direction of the fibres. Wood is far stronger along the grain than across it, so grain direction is a structural specification, not a cosmetic one.
- **Annual rings** — one year of growth: light earlywood (spring) and dark latewood (summer). Rings per inch is a quality measure (typically at least 6 per inch for spruce).
- **Heartwood** (dead, central, more durable) and **sapwood** (outer, living, more permeable).
- **Conversion** — plain (flat/tangential) sawn is cheaper but cups and shrinks more; quarter sawn (rift/radial) is more stable and preferred for spars.
- **Moisture content** — aircraft timber is used at about 8–12%, seasoned by air drying or kiln. Wet wood is weak; over-dry wood is brittle. Wood moves with humidity, so it is never truly finished moving.

### Defects — Accept or Reject

| Defect | What it is | General rule |
|---|---|---|
| **Knots** | Where a branch grew | Small, sound, tight knots away from edges may be acceptable; loose, spike or cluster knots reject |
| **Cross grain / slope of grain** | Fibres not parallel to the member | Usually limited to about 1 in 15 — a common exam figure |
| **Shakes** | Splits along the annual rings | Reject |
| **Checks** | Splits across the rings, from drying | Reject in structural members |
| **Splits / compression failures** | Ruptured fibres — a fine line across the grain, often from mishandling | Always reject — the most dangerous and the hardest to see |
| **Decay / dry rot / fungus** | Discoloured, soft, musty; probes easily | Reject and find the moisture source |
| **Pitch pockets, wane, bark** | Natural inclusions and missing edges | Limits given in the maintenance manual / CS-23 guidance |

Inspecting wooden structure: look for glue-line cracks, dark stains around fittings (water), fastener movement, "drumming" when tapped, distortion, and always inspect near bolts, fittings and the underside where water sits. A probe or a moisture meter helps.

### Plywood and Glue

- Aircraft plywood is made of an odd number of thin veneers with the grain of each at 90° (or 45°) degrees to its neighbour, so it is strong in both directions and stable. Birch faces are common.
- Glues: casein (old, moisture sensitive — largely obsolete), urea-formaldehyde, resorcinol-formaldehyde (dark purple line, waterproof, the traditional aircraft glue), phenol-formaldehyde, epoxy (gap filling, no clamping pressure needed to the same degree).
- A glued joint depends on: clean, freshly prepared surfaces; correct mix and temperature; correct open and closed assembly time; and even clamping pressure (typically 100–200 psi for softwood) held for the full cure.
- Do not glue at low temperature or high humidity. A starved or over-clamped joint is as bad as a dry one.

### Preservation and Repair

- Protect with varnish, dope or paint; seal end grain; keep drain holes clear; ventilate the structure; treat with preservative where specified.
- Splices are made with a long taper — typically 10:1 to 15:1 in the member, reinforced with plywood plates as the manual requires.
- Never repair a spar with a scarf across a bolt hole or fitting; follow the approved repair scheme.

## Fabric Covering

- **Natural** — Grade A cotton, linen and Irish linen; degrade with UV, moisture and mould.
- **Synthetic** — polyester (Ceconite, Dacron) is now the standard: far more durable, does not rot, heat shrunk to tension. Glass cloth is also used.
- Fabric is classified by its breaking strength when new and condemned when it falls below a set proportion (commonly 70% of the original required strength) — checked with a Maule fabric punch tester or by cutting a sample for laboratory test.
- **Attachment**: rib stitching, lacing cord, screws and rivets, or clips — spacing tighter in the slipstream. Covered with surface tape, reinforcing tape under the stitching, inspection rings and drain grommets.
- **Seams**: sewn (French fell, folded fell, plain overlap) or doped/cemented overlap; overlap dimensions are specified.
- **Dope** — cellulose nitrate (flammable, older) or cellulose acetate butyrate; it tautens natural fabric and seals it. Aluminium-pigmented dope blocks UV. Polyester is tautened by heat, not by dope.
- **Defects**: UV degradation, tears, chafe at ribs and fittings, ringworm/dope cracking, loose fabric ("drumming"), water in the bottom of the structure, corrosion or rot of the frame underneath — which is the real reason for inspection panels.

## Fast Revision

Fibre carries the load; resin transfers it and sets the temperature limit; core provides stiffness. Thermoplastic softens with heat, thermoset does not. Epoxy is the aviation standard. Prepreg lives in a freezer at about −18°C — watch shelf life AND out-time, and thaw before opening the bag. Warp = along the roll = the reference direction. Repair plies must match original orientation. Tap test: sharp ring = good, dull thud = disbond. X-ray is the one for water in honeycomb. Dry the part before repair, prepare the surface properly, control the cure ramp. Carbon is cathodic to aluminium — isolate it, or corrosion follows at every joint. Wood: Sitka spruce is the reference; grain slope limit about 1 in 15; moisture content 8–12%. Fabric is condemned at about 70% of new required strength — Maule punch tester.
        $cnt$,
        3
    ) RETURNING id INTO s3_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 06.4: Corrosion
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m06_id, 'M06.4', 'Corrosion',
        $cnt2$
# Corrosion

## The Chemistry

Corrosion is metal returning to the state it was mined in. Refining an ore into metal pumps energy in; corrosion is that energy leaking back out. It is an electrochemical process, and like any electrical circuit it needs four things.

### The Four Requirements — Remove Any One and Corrosion Stops

1. **An anode** — the area that corrodes, losing electrons (oxidation).
2. **A cathode** — the area that does not corrode, receiving the electrons (reduction).
3. **An electrolyte** — a conductive liquid: water with salt, exhaust residue, cleaning agents, spilt drink, even condensation.
4. **A conductive path** between anode and cathode — usually the metal itself.

- At the anode, metal atoms give up electrons and go into solution as ions — that is where the metal is lost.
- The greater the difference in electrical potential between the two metals, the more vigorous the attack.
- A **small anode with a large cathode** is the worst possible combination — all the attack is concentrated in a tiny area. This is why a steel fastener in an aluminium panel is acceptable, but an aluminium fastener in a steel panel is not.

### The Galvanic Series

Metals ranked by their electrical potential in seawater. The further apart two metals are in the list, the more energetically the more anodic one corrodes when they are coupled.

**More anodic — corrodes (least noble) → More noble — protected**

| Rank | Metal / group | Note |
|---|---|---|
| 1 | Magnesium and magnesium alloys | Most active — sacrificial |
| 2 | Zinc, cadmium (plating) | Used deliberately as sacrificial coatings |
| 3 | Aluminium alloys (5056, 7079, 2024, 7075, 6061, 1100...) | Airframe skins |
| 4 | Steel, cast iron | |
| 5 | Lead, tin, solder | |
| 6 | Chromium and nickel plate, brass, copper, bronze | |
| 7 | Stainless steel (passive), Monel, Inconel, titanium | |
| 8 | Silver, graphite/carbon fibre, gold | Most noble — protected |

Note where carbon fibre sits — right at the noble end. That is why a carbon-fibre panel bolted straight onto an aluminium fitting eats the fitting.

## Types of Corrosion

### Uniform / Surface (Direct Chemical) Attack

Even attack over a whole exposed surface: dulling, etching, a general powdery film. Caused by direct chemical action — battery acid, spilt alkaline cleaner, exhaust gas, caustic residues — or simple oxidation. The most benign type, because it is visible and predictable.

### Galvanic (Dissimilar Metal) Corrosion

Two different metals in electrical contact with an electrolyte present. The more anodic one is eaten away, usually right at the joint line. Prevent by: choosing compatible metals; isolating with sealant, primer, insulating washers or tape; keeping water out; using a sacrificial coating (cadmium plated fasteners, zinc chromate primer).

### Pitting

Small, deep holes with very little surface evidence — a white or grey powder over a pinhole that goes deep. Typical on aluminium, magnesium and stainless steel where the passive film breaks down locally (chlorides are the classic cause). Dangerous out of all proportion to its appearance: each pit is a stress raiser and a fatigue crack starter.

### Intergranular Corrosion

Attack along the grain boundaries, caused by a difference in composition between the grain boundary and the grain body — usually from improper heat treatment (or from welding, giving "weld decay" in stainless). Little or no surface evidence until it is advanced. Detected by ultrasonic or radiographic inspection. Common in high-strength 2xxx and 7xxx aluminium forgings and extrusions.

### Exfoliation

The advanced form of intergranular corrosion in wrought, rolled or extruded material, where the grains are flattened and layered. Corrosion products occupy more volume than the metal, forcing the layers apart — the metal lifts, flakes and leafs like the pages of a book. Look along edges, around fastener holes and at the ends of extrusions. It is easy to see once it starts, and by then a lot of metal is already gone.

### Stress Corrosion Cracking (SCC)

Needs three things together: a **susceptible material**, a **sustained tensile stress** (often residual, from a press fit, over-torque, or an interference bolt) and a **corrosive environment**. Produces branching cracks with little or no visible corrosion and no warning deformation. Susceptible: high-strength 7xxx and 2xxx aluminium in the short-transverse direction, some stainless steels (chlorides), magnesium, high-strength steel. Prevented by shot peening, stress-relieving, correct temper (7075-T73 instead of T6), avoiding over-torque and force-fitting parts.

### Fretting Corrosion

Two surfaces in contact with a very small repeated relative movement (vibration), under load, with restricted access for air. Debris is trapped and oxidises, producing a fine black or reddish-brown powder ("cocoa"), pitting and, ultimately, fatigue cracks. Classic sites: bolted joints that have gone slack, bearing outer races, splines, clamped skin laps, hoisting eyes.

### Crevice / Concentration Cell Corrosion

Occurs where the concentration of oxygen or ions differs between two areas of the same metal. The oxygen-starved area becomes anodic and corrodes. Found under gaskets, washers, seals, dirt, adhesive tape, in lap joints and under sitting water. A "metal ion" cell forms under a tight joint where ions build up. **Filiform corrosion** is a special case: fine worm-like tracks under a coating (especially polyurethane paint over poorly prepared aluminium) in humid conditions.

### Microbiological Corrosion

Bacteria, fungi and yeasts live in the water at the bottom of fuel tanks, feeding on the hydrocarbons. They produce dark brown/black slime mats and acidic waste that attack the tank structure and sealant beneath, and they clog filters and probes. Control: drain the water sumps regularly (that is the real defence), keep tanks full, use approved biocide additives, and clean/reseal infected tanks.

### Erosion and Cavitation

Mechanical removal of the protective film by high-velocity fluid, grit or droplets, exposing fresh metal continuously. Impellers, pump housings, leading edges, exhaust areas.

### Hydrogen Embrittlement

Not corrosion in itself, but the close relative that must be known. Atomic hydrogen from acid pickling, electroplating or cathodic protection diffuses into high-strength steel and makes it brittle, so it fails suddenly under load. Prevented by baking the part at about 190–200°C for several hours immediately after plating — which is why plating of high-strength steel fasteners is a controlled process.

## Recognising Corrosion by Its Product

| Metal | Appearance of the corrosion product |
|---|---|
| **Aluminium alloys** | White to grey powder, often with pitting and blistered/lifted paint. Larger volume than the metal removed |
| **Magnesium alloys** | White, snowy mounds and whitish spots; very rapid, deep, dark pitting under it |
| **Ferrous (steel)** | Reddish-brown rust, later flaking dark brown/black scale. Rust does not protect — it holds moisture |
| **Stainless steel** | Usually rust-coloured staining, pitting or crevice attack rather than general rust |
| **Copper alloys** | Blue-green powdery deposits (verdigris) |
| **Cadmium plating** | White to brown/black powder — the plating is doing its job sacrificially. Only worry when the steel beneath shows |
| **Titanium** | Very rarely corrodes at all; look instead for embrittlement or discolouration from heat/contamination |

## Where to Look

- Exhaust trail areas — hot, acidic gas deposits over skin and empennage.
- Battery compartments and vent trails — acid or alkaline electrolyte will destroy structure quickly and spread downstream in the airflow.
- Wheel wells and landing gear — the dirtiest area on the aircraft: mud, water, de-icing salt, brake dust, and a hundred fittings, bearings and switches.
- Bilges, floor areas under galleys and lavatories — spilt drinks, food, disinfectant, and everything that leaks collects here. Historically the worst corrosion found on transport aircraft.
- Engine intakes, cooling air inlets and cowlings — constant airflow, moisture and erosion.
- Wing and fuselage lap joints, skin seams, spot welds — water is drawn in by capillary action and held.
- Control cables, hinges, piano hinges, bellcranks — water sits in the hinge pin and between cable strands.
- Under insulation blankets, behind trim, in fuel tank sumps, under sealant, at every dissimilar-metal joint.
- External skin under paint — blisters, bubbles and lifting paint are the give-away.

## Prevention and Treatment

### Prevention — Design and Maintenance

- Correct material selection and isolation of dissimilar metals with primer, sealant, insulating tape or washers.
- Surface treatments: **anodising** (an artificially thickened oxide film — and note that it is non-conductive, so bonding surfaces must be masked), **chemical conversion coating** (alodine/chromate), cladding, plating (cadmium, zinc, nickel, chrome), phosphating on steel.
- Paint schemes — a wash primer or etch primer, an epoxy or zinc-chromate primer, and a polyurethane topcoat. The primer does the protecting; the topcoat protects the primer.
- Corrosion inhibiting compounds (CIC / LPS / water-displacing oils) sprayed into cavities, lap joints and wheel wells.
- Sealants at joints and fasteners; keep drain holes clear — a blocked drain hole is one of the commonest root causes of corrosion.
- Cleaning and washing on a scheduled basis, particularly for aircraft in coastal or industrial environments, and de-icing fluid must be washed off.
- Structured programmes: the **Corrosion Prevention and Control Programme (CPCP)** required for ageing aircraft.

### Treatment — The Sequence

1. Clean the area thoroughly and strip the paint back to sound coating.
2. Assess the severity and extent, and compare it against the SRM limits.
3. Remove all corrosion products — mechanically (abrasive mat, aluminium wool, non-woven pads, careful blending) or chemically where approved. Use the correct abrasive: never use steel wool or a steel brush on aluminium, and never use an abrasive that will embed a dissimilar metal.
4. Neutralise any remaining chemical residue and remove all traces.
5. Check the remaining thickness against the allowable material removal, blend out to a smooth taper with no sharp edges (a sharp step is a fatigue crack waiting to start).
6. Restore the protective finish: conversion coating, primer, topcoat, sealant, CIC.
7. Record it — location, extent, depth removed. That record is what lets the next inspection decide whether it is growing.

### Two Things That Get People into Trouble

Removing corrosion is removing structure. Blending beyond the allowable limit turns a corrosion finding into a repair — and it must be assessed against the SRM, not by feel. Corrosion always looks smaller than it is. What you see on the surface is the top of a hole, and intergranular attack may extend far beyond the visible area.

## Fast Revision

Four requirements: anode, cathode, electrolyte, conductive path. Break one and it stops. Small anode + large cathode = rapid, concentrated attack. Exfoliation = leafing/flaking in rolled material. Intergranular = along grain boundaries, hidden. SCC needs susceptible material + sustained tensile stress + corrosive environment. Fretting = tiny repeated movement, black/red powder, leads to fatigue. Microbiological = water in fuel tanks; the cure is draining the sumps. Aluminium goes white/grey, steel goes red-brown, copper goes green, magnesium goes white and fast. Hydrogen embrittlement follows plating and pickling — the fix is baking straight afterwards.
        $cnt2$,
        4
    ) RETURNING id INTO s4_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M06.3 Composite and Non-Metallic Materials (29 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s3_id, 'What distinguishes a thermosetting plastic from a thermoplastic?',
     '[{"id":"a","text":"A thermosetting plastic cures through a one-way chemical change and does not soften with heat; a thermoplastic softens and can be reshaped repeatedly","correct":true},{"id":"b","text":"A thermoplastic cures with a catalyst and chars if overheated; a thermosetting plastic melts and can be welded","correct":false},{"id":"c","text":"There is no real difference — both families behave identically when heated","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'In a fibre-reinforced composite, what is the role of the matrix (resin)?',
     '[{"id":"a","text":"It carries almost all of the tensile load along the fibre direction","correct":false},{"id":"b","text":"It bonds the fibres together, transfers load between them, keeps them aligned, and resists compression and shear","correct":true},{"id":"c","text":"It has no structural function and exists only to give the part its colour","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'Why is carbon fibre considered a corrosion risk when bolted directly to an aluminium fitting?',
     '[{"id":"a","text":"Carbon fibre is highly anodic and corrodes itself, protecting the aluminium","correct":false},{"id":"b","text":"Carbon fibre sits at the noble end of the galvanic series, so it is cathodic to aluminium and drives galvanic attack of the aluminium fitting","correct":true},{"id":"c","text":"Carbon fibre absorbs moisture and swells, mechanically cracking the fitting","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'Which reinforcing fibre is golden yellow, extremely tough with excellent impact resistance, but poor in compression and hard to cut and sand?',
     '[{"id":"a","text":"E-glass","correct":false},{"id":"b","text":"Aramid (Kevlar)","correct":true},{"id":"c","text":"Boron","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'In a woven composite cloth, which direction runs the length of the roll and serves as the reference for ply orientation?',
     '[{"id":"a","text":"The weft (fill)","correct":false},{"id":"b","text":"The warp","correct":true},{"id":"c","text":"The bias","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'A satin weave, compared with a plain weave, gives:',
     '[{"id":"a","text":"The best drape and highest strength (least crimp), but is less stable and slightly unbalanced","correct":true},{"id":"b","text":"The most stable, least drapeable cloth with the most crimp","correct":false},{"id":"c","text":"Maximum strength in one direction only, held together by a light cross thread","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'Why must a laminate normally be balanced and symmetrical about its mid-plane?',
     '[{"id":"a","text":"Otherwise it will warp on cure and distort under load","correct":true},{"id":"b","text":"Otherwise the resin will not wet the fibres properly","correct":false},{"id":"c","text":"Otherwise the fibres will be electrically conductive","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'Which resin is described as the aviation standard, offering the best adhesion, low shrinkage, high strength and good environmental resistance?',
     '[{"id":"a","text":"Polyester","correct":false},{"id":"b","text":"Phenolic","correct":false},{"id":"c","text":"Epoxy","correct":true}]',
     '{"B1","B2"}'),

    (s3_id, 'Prepreg material is normally stored:',
     '[{"id":"a","text":"At room temperature, sealed against light only","correct":false},{"id":"b","text":"In a freezer at about −18°C, sealed against moisture, with shelf life and out-time both logged","correct":true},{"id":"c","text":"In an autoclave under constant vacuum until used","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'Before opening a sealed bag of cold prepreg material, it should be:',
     '[{"id":"a","text":"Thawed to room temperature first, to avoid condensation forming on the cold material","correct":true},{"id":"b","text":"Opened immediately while still cold, to save time","correct":false},{"id":"c","text":"Warmed in an oven above its cure temperature before opening","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'In the vacuum bagging stack, what is the purpose of the breather layer?',
     '[{"id":"a","text":"It absorbs excess resin squeezed out of the laminate","correct":false},{"id":"b","text":"It keeps a continuous air path to the vacuum port over the whole part","correct":true},{"id":"c","text":"It is stripped off after cure to leave a clean, textured bonding surface","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'In sandwich construction, what is the function of the core?',
     '[{"id":"a","text":"It carries the tension and compression loads, like the skins of an I-beam","correct":false},{"id":"b","text":"It separates the two facing skins and takes the shear, holding the skins apart to give bending stiffness at low weight","correct":true},{"id":"c","text":"It provides the electrical bonding path for lightning protection","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'Why is Nomex honeycomb preferred over aluminium honeycomb for control surfaces and floors?',
     '[{"id":"a","text":"Nomex is heavier but far stronger in bending","correct":false},{"id":"b","text":"Nomex is corrosion free, whereas aluminium honeycomb corrodes and takes a permanent dent","correct":true},{"id":"c","text":"Nomex conducts electricity, which aluminium honeycomb does not","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'BVID (barely visible impact damage) is a particular concern with composites because:',
     '[{"id":"a","text":"It always leaves an obvious external dent that is easy to find visually","correct":false},{"id":"b","text":"There is little or no external mark despite extensive internal delamination","correct":true},{"id":"c","text":"It only ever occurs on metallic structure, not composites","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'During a tap (coin tap) test on a thin composite skin, a dull, flat thud most likely indicates:',
     '[{"id":"a","text":"A sound, well-bonded laminate","correct":false},{"id":"b","text":"A disbond or delamination beneath the surface","correct":true},{"id":"c","text":"Correct resin content with no defects","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'Which NDT method is best suited to detecting water trapped in a honeycomb sandwich panel?',
     '[{"id":"a","text":"Radiography (X-ray)","correct":true},{"id":"b","text":"Coin tap test only","correct":false},{"id":"c","text":"Visual inspection alone","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'When preparing a composite bond area for repair, the old paint should be removed by:',
     '[{"id":"a","text":"Mechanical stripping, never chemical stripping","correct":true},{"id":"b","text":"Chemical stripping only, to avoid damaging the fibres","correct":false},{"id":"c","text":"Either method, since both give an identical result","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'A scarf repair on a composite laminate is preferred over a step (lap) repair mainly because it gives:',
     '[{"id":"a","text":"A faster cure time with no vacuum required","correct":false},{"id":"b","text":"The smoothest load path and the best aerodynamic finish","correct":true},{"id":"c","text":"A repair that needs no orientation matching to the original plies","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'What is the standard aircraft timber against which all other woods are compared, valued for its excellent strength-to-weight ratio and straight, uniform grain?',
     '[{"id":"a","text":"Sitka spruce","correct":true},{"id":"b","text":"Douglas fir","correct":false},{"id":"c","text":"Balsa","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'The normal moisture content for wood used in an aircraft structure is approximately:',
     '[{"id":"a","text":"0–2%","correct":false},{"id":"b","text":"8–12%","correct":true},{"id":"c","text":"20–30%","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'Aircraft fabric covering is condemned when its breaking strength falls below approximately what proportion of the original required strength?',
     '[{"id":"a","text":"70%","correct":true},{"id":"b","text":"25%","correct":false},{"id":"c","text":"95%","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'What tool is traditionally used to check fabric covering strength for condemnation without cutting a sample?',
     '[{"id":"a","text":"A Maule fabric punch tester","correct":true},{"id":"b","text":"A tensile test machine mounted in situ","correct":false},{"id":"c","text":"A moisture meter","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'Which type of aircraft dope tautens and seals natural fabric such as Grade A cotton or linen?',
     '[{"id":"a","text":"Cellulose nitrate or cellulose acetate butyrate dope","correct":true},{"id":"b","text":"Epoxy resin","correct":false},{"id":"c","text":"Zinc chromate primer","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'Which fibre to resin ratio for advanced composite wet lay-ups is generally considered the best?',
     '[{"id":"a","text":"40:60","correct":false},{"id":"b","text":"50:50","correct":false},{"id":"c","text":"60:40","correct":true}]',
     '{"B1","B2"}'),

    (s3_id, 'What is the material layer used within the vacuum bag pressure system to absorb excess resin during cure?',
     '[{"id":"a","text":"Release film","correct":false},{"id":"b","text":"Bleeder","correct":true},{"id":"c","text":"Breather","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'What material would be used where a high-temperature application is required, such as a firewall?',
     '[{"id":"a","text":"Aramid (Kevlar) fibres","correct":false},{"id":"b","text":"Carbon/graphite fibres","correct":false},{"id":"c","text":"Ceramic fibres","correct":true}]',
     '{"B1","B2"}'),

    (s3_id, 'Metal fasteners used with carbon/graphite composite structures must be made of:',
     '[{"id":"a","text":"Titanium or corrosion resistant steel","correct":true},{"id":"b","text":"High strength aluminium alloy","correct":false},{"id":"c","text":"Any metal commonly used in aircraft fasteners","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'Except where specified by the manufacturer, a wooden spar may be spliced:',
     '[{"id":"a","text":"At any point","correct":false},{"id":"b","text":"At any point except under the wing attachment fittings","correct":true},{"id":"c","text":"At no point","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'The maximum permissible grain deviation (slope of grain) in a wooden structural member is approximately:',
     '[{"id":"a","text":"1 in 8","correct":false},{"id":"b","text":"1 in 15","correct":true},{"id":"c","text":"1 in 20","correct":false}]',
     '{"B1","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M06.4 Corrosion (28 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s4_id, 'Corrosion is fundamentally best described as:',
     '[{"id":"a","text":"An electrochemical process in which metal returns to the state it was mined in","correct":true},{"id":"b","text":"A purely mechanical process caused by friction between two surfaces","correct":false},{"id":"c","text":"A change of colour only, with no loss of metal","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'The four requirements for a corrosion cell to exist are:',
     '[{"id":"a","text":"An anode, a cathode, an electrolyte and a conductive path between them","correct":true},{"id":"b","text":"Heat, pressure, moisture and time","correct":false},{"id":"c","text":"Two dissimilar metals, sunlight, oxygen and vibration","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'In a corrosion cell, which electrode loses electrons and corrodes?',
     '[{"id":"a","text":"The cathode","correct":false},{"id":"b","text":"The anode","correct":true},{"id":"c","text":"Either electrode, depending on the electrolyte used","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'Why is a small anode combined with a large cathode the worst possible galvanic combination?',
     '[{"id":"a","text":"Because the attack is concentrated into a tiny area, causing rapid, deep corrosion at that spot","correct":true},{"id":"b","text":"Because it prevents any electrolyte from forming","correct":false},{"id":"c","text":"Because it always produces uniform corrosion spread evenly over both metals","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'Why is a steel fastener in an aluminium panel generally acceptable, while an aluminium fastener in a steel panel is not?',
     '[{"id":"a","text":"In the first case the small fastener (anode) is the more resistant panel material, spreading any attack; in the second, the small aluminium fastener becomes a small anode facing a large steel cathode","correct":true},{"id":"b","text":"Steel and aluminium are never in electrical contact with each other","correct":false},{"id":"c","text":"Aluminium is always cathodic to steel, so there is never a risk either way","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'In the galvanic series, which of the following sits at the most noble (protected) end?',
     '[{"id":"a","text":"Magnesium and magnesium alloys","correct":false},{"id":"b","text":"Aluminium alloys","correct":false},{"id":"c","text":"Silver, graphite/carbon fibre and gold","correct":true}]',
     '{"B1","B2"}'),

    (s4_id, 'Uniform (surface) corrosion is considered the most benign form of attack because:',
     '[{"id":"a","text":"It is visible and predictable, spreading evenly over the exposed surface","correct":true},{"id":"b","text":"It only ever occurs on non-structural fittings","correct":false},{"id":"c","text":"It cannot be caused by chemical action, only by moisture","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'Pitting corrosion is particularly dangerous because:',
     '[{"id":"a","text":"It always produces a very obvious, large area of visible surface damage","correct":false},{"id":"b","text":"Each small, deep pit acts as a stress raiser and fatigue crack starter, despite little surface evidence","correct":true},{"id":"c","text":"It only occurs on non-metallic materials","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'Intergranular corrosion is usually caused by:',
     '[{"id":"a","text":"Improper or inadequate heat treatment, producing a difference in composition between the grain boundary and the grain body","correct":true},{"id":"b","text":"Contact with a highly noble metal such as gold","correct":false},{"id":"c","text":"Excessive vibration between two mating surfaces","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'Exfoliation corrosion is best described as:',
     '[{"id":"a","text":"An advanced form of intergranular corrosion in rolled/extruded material where the metal lifts, flakes and leafs like the pages of a book","correct":true},{"id":"b","text":"A form of galvanic attack that only occurs between two dissimilar metals","correct":false},{"id":"c","text":"Corrosion that occurs exclusively inside fuel tanks","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'Stress corrosion cracking (SCC) requires which three factors together?',
     '[{"id":"a","text":"A susceptible material, a sustained tensile stress, and a corrosive environment","correct":true},{"id":"b","text":"High temperature, high humidity, and a dissimilar metal joint","correct":false},{"id":"c","text":"Cyclic (fatigue) loading, a compressive stress, and an electrolyte","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'One recognised way to help prevent stress corrosion cracking in high-strength aluminium is to:',
     '[{"id":"a","text":"Use the T6 temper instead of T73","correct":false},{"id":"b","text":"Use shot peening, stress relieving, and a resistant temper such as 7075-T73 instead of T6","correct":true},{"id":"c","text":"Deliberately over-torque all fasteners to lock the structure rigid","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'Fretting corrosion is caused by:',
     '[{"id":"a","text":"Two surfaces in contact with a very small, repeated relative movement under load, with restricted air access","correct":true},{"id":"b","text":"A single large, sudden impact between two components","correct":false},{"id":"c","text":"Bacteria feeding on hydrocarbons in the bottom of a fuel tank","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'The characteristic sign of fretting corrosion is:',
     '[{"id":"a","text":"A fine black or reddish-brown powder, sometimes called ''cocoa''","correct":true},{"id":"b","text":"Blue-green powdery deposits (verdigris)","correct":false},{"id":"c","text":"Branching cracks with no powder or debris at all","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'Filiform corrosion is a special case of which type of attack?',
     '[{"id":"a","text":"Crevice / concentration cell corrosion, appearing as fine worm-like tracks under a coating","correct":true},{"id":"b","text":"Uniform surface corrosion","correct":false},{"id":"c","text":"Hydrogen embrittlement","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'What is the real, primary defence against microbiological corrosion in fuel tanks?',
     '[{"id":"a","text":"Regularly draining the water sumps","correct":true},{"id":"b","text":"Increasing the fuel temperature","correct":false},{"id":"c","text":"Applying cadmium plating to the tank interior","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'Hydrogen embrittlement is best described as:',
     '[{"id":"a","text":"A form of corrosion that produces a white powdery surface deposit on steel","correct":false},{"id":"b","text":"Atomic hydrogen from pickling, plating or cathodic protection diffusing into high-strength steel, making it fail suddenly and brittlely under load","correct":true},{"id":"c","text":"A coating defect that only affects aluminium alloys","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'Hydrogen embrittlement in high-strength steel fasteners is normally prevented by:',
     '[{"id":"a","text":"Baking the part at about 190–200°C for several hours immediately after plating","correct":true},{"id":"b","text":"Storing the part in a freezer immediately after plating","correct":false},{"id":"c","text":"Leaving the part unplated wherever possible","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'What colour corrosion product is typically found on aluminium alloys?',
     '[{"id":"a","text":"Blue-green powder (verdigris)","correct":false},{"id":"b","text":"White to grey powder","correct":true},{"id":"c","text":"Reddish-brown rust","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'Anodising forms a protective oxide film that is:',
     '[{"id":"a","text":"Electrically conductive, so it never needs to be masked before bonding","correct":false},{"id":"b","text":"Non-conductive, so bonding surfaces must be masked off before the anodising process","correct":true},{"id":"c","text":"A sacrificial metallic coating, similar to cadmium plating","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'In a properly designed paint scheme, what is the role of the primer relative to the topcoat?',
     '[{"id":"a","text":"The primer does the actual corrosion protecting; the topcoat protects the primer","correct":true},{"id":"b","text":"The topcoat does all the protecting; the primer is purely cosmetic","correct":false},{"id":"c","text":"Neither layer contributes to corrosion protection — only sealant does","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'When removing corrosion from an aluminium surface, why must steel wool or a steel brush never be used?',
     '[{"id":"a","text":"They are too soft to remove the corrosion products effectively","correct":false},{"id":"b","text":"They can embed steel particles in the aluminium, setting up a new galvanic corrosion cell","correct":true},{"id":"c","text":"They are far more expensive than approved aluminium wool or non-woven pads","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'After removing corrosion and blending out the affected area, why must the remaining material thickness be checked against the SRM allowable limits?',
     '[{"id":"a","text":"Because blending beyond the allowable limit turns a corrosion finding into a repair that must be properly assessed","correct":true},{"id":"b","text":"Because the SRM only applies to composite structure, not metal","correct":false},{"id":"c","text":"Thickness checks are unnecessary once all visible corrosion has been removed","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'A blocked drain hole is significant in corrosion prevention because it is:',
     '[{"id":"a","text":"Irrelevant, since drain holes have no effect on corrosion","correct":false},{"id":"b","text":"One of the commonest root causes of corrosion, allowing water to sit and collect","correct":true},{"id":"c","text":"Only a concern for composite structures, not metal ones","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'A blue-green powdery deposit (verdigris) on a metal fitting is characteristic of corrosion on:',
     '[{"id":"a","text":"Copper alloys","correct":true},{"id":"b","text":"Titanium","correct":false},{"id":"c","text":"Magnesium alloys","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'After welding, stainless steel becomes susceptible to a form of intergranular attack known as:',
     '[{"id":"a","text":"Weld decay","correct":true},{"id":"b","text":"Weld rot","correct":false},{"id":"c","text":"Weld exfoliation","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'Corrosion products should be removed from magnesium alloys using:',
     '[{"id":"a","text":"A steel wire brush","correct":false},{"id":"b","text":"A chromic acid based solution","correct":true},{"id":"c","text":"Neat hydrochloric acid","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'Which of the following is the best defence against corrosion overall, starting earliest in an aircraft''s life?',
     '[{"id":"a","text":"Corrosion control beginning at the design stage, through correct material selection and isolation of dissimilar metals","correct":true},{"id":"b","text":"Waiting until corrosion is visually detected before taking any action","correct":false},{"id":"c","text":"Relying solely on the topcoat paint layer, with no primer","correct":false}]',
     '{"B1","B2"}');

END $$;
