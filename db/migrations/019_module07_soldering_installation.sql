-- Module 07: Maintenance Practices — Soldering, Coaxial Cables, Wiring Installation Practices,
-- and Cable Performance & Failure Modes
-- Source: EASA Part-66 Module 7 official course text (IK MOD 7A), "M7 B1/B2 - 7.7 Electrical
-- Cables and Connectors" chapter — Soldering, Coaxial Cables, Wiring Installation, and Cable
-- Performance sections.

DO $$
DECLARE
    m07_id INT;
    s5_id  INT;
    s6_id  INT;
    s7_id  INT;
BEGIN
    SELECT id INTO m07_id FROM easa_modules WHERE code = 'M07';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M07.5') THEN
        RAISE NOTICE 'M07.5 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 07.5: Soldering & Coaxial Cables
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m07_id, 'M07.5', 'Soldering & Coaxial Cables',
        $cnt5$
# Soldering & Coaxial Cables

## Soldering — General Principles

**Soldering** is the process of joining metallic surfaces using **solder**, without directly fusing the base metals themselves. Solder is a non-ferrous, fusible tin alloy that melts when sufficient heat is applied and solidifies again once the heat is removed.

On modern aircraft, **crimped connections are the standard method** for joining wires to contacts and terminals — soldering is comparatively rare in primary EWIS (Electrical Wiring Interconnect System) splices, because vibration in service causes rigid solder joints to crack over time. Soldering is still used, however, for specific applications such as connector solder-cup pins, coaxial cable terminations, printed circuit board (PCB) work, and certain equipment repairs where the manufacturer specifies it.

### Key Definitions

| Term | Meaning |
|------|---------|
| **Wetting** | Adhesion of liquid solder to a solid surface |
| **De-wetting** | A soldered area where the liquid solder has not adhered closely |
| **Cold solder connection ("dry joint")** | An unsatisfactory connection caused by de-wetting, showing an abrupt rise of solder away from the surface |
| **Disturbed solder connection** | An unsatisfactory connection caused by movement of the conductor while the solder was hardening |
| **Flux** | A substance (e.g. borax or rosin) that prevents oxidation during soldering and helps the metals fuse |
| **Resin-soldered connection** | An unsatisfactory connection in which flux has become trapped in the joint |
| **Overheated joint** | An unsatisfactory connection with a rough solder surface, caused by excessive heat |
| **Heat sink** | A thermal shunt with good heat-dissipation properties, used to draw heat away from the component being soldered |
| **Tinning** | Coating a surface with a uniform, thin layer of solder |
| **Wicking** | A technique where copper braid is applied to melted solder; the braid absorbs the solder by capillary action, removing it |

A poor solder joint — cold, disturbed, resin-trapped, or overheated — is a rejectable defect and must be re-made.

## Soldering Irons

Soldering irons used on aircraft wiring and electronic assemblies must meet specific requirements:

1. **Constant-temperature soldering iron with an isolation transformer** in its power supply — this prevents stray magnetic fields, which can damage sensitive electrical components.
2. For **electrostatic discharge sensitive (ESDS)** devices, a **potential-free solder station with a temperature regulator** must be used, and the ground of the soldering station must be connected to the ground of the PCB, so the component and the iron share the same ground potential.
3. A **solder bit (tip) appropriate to the heat required** for the job must be fitted — the wrong bit can severely damage electronic components or the PCB itself.
4. The **cleaning sponge** for the tip must be kept wet (using **distilled water only**) and cleaned regularly.

## Soldering Tools

### Heat Sinks
Semiconductors, fine resistors, capacitors, and similar heat-sensitive components can be damaged by the heat of soldering. A heat sink — typically made from a good heat-conducting material such as copper — is clamped onto the conductor between the component and the point being soldered, to draw heat away and largely prevent it reaching the component. Where a dedicated heat sink is not available, the tip of a pair of long-nose pliers may be used instead, but only as a fallback.

### Anti-Wicking Pliers
Anti-wicking pliers are used to prevent thermal damage to the wire insulation and to stop molten solder from flowing (wicking) up underneath the insulation during soldering.

### Solder Removal Guns
When a soldered component must be replaced — particularly on a PCB — all the old solder is first removed from the connection using a **solder removal gun**. It consists of a spring-loaded plunger in a sealed tube: the plunger is pressed down and held by a release knob; pressing the knob releases the plunger, which snaps upward and creates suction at the tip, sucking the molten solder into the gun.

**Procedure for removing solder with a solder removal gun:**
1. Push the plunger to the down (cocked) position.
2. Heat the connection until the solder becomes liquid — do not overheat.
3. Hold the tip of the gun close to the melted solder and press the release knob.
4. Repeat steps 1–3 until all the solder has been removed.

## Soldering Method

### Tinning a Wire
Strip the wire, then heat it until solder flows freely into the strands. Remove the iron's heat immediately once this happens, to avoid damaging the insulation. A correctly tinned wire shows the individual strands still clearly visible, following their original lay/routing — the solder must not extend beyond the stripped area or wick up under the insulation.

### Soldering Preparation
1. Carry out tinning and soldering in a **clean area** to avoid contaminating components.
2. Ensure **sufficient ventilation** — soldering produces harmful metal vapours.
3. Keep tools and equipment **free of oil, grease, and other impurities**.
4. Fit the **correct solder bit** to the iron.
5. Switch the iron on and **do not use it until it has reached its operating temperature**.
6. Once the surfaces to be joined have reached the correct temperature, apply a small amount of solder and let it distribute evenly over the parts.
7. Withdraw the iron and allow the joint to **cool slowly without disturbing the parts** — never force the cooling.
8. Excess solder can be removed with the solder removal gun.
9. Clean the finished connection as soon as possible.

### Soldering of Connectors (Solder-Cup Pins)
1. Slide a suitable heat-shrink sleeve onto the wire first (before making the joint).
2. Heat the connector's solder cup and fill it with solder, working from the bottom of the connector upward.
3. Strip the wire to the required length.
4. Tin the wire as described above.
5. Heat the solder cup until the solder melts, tilt the iron to allow the wire to enter, and slowly insert the wire.
6. Hold the wire firmly in place and withdraw the iron.
7. Check that the finished connection is sound and correctly formed.
8. Slide the heat-shrink sleeve (if fitted) over the soldered joint and shrink it.

### Soldered Pin/Socket Connections (MIL-type Connectors)
Some MIL-type and other connectors are designed with a small **solder pocket** at the rear of the pin or socket for the wire. Enough insulation must be removed so that **none of it extends into the solder pocket**. With the wire seated in the pocket, **resin-core solder** is applied with a small pointed iron or soldering gun as the pocket is heated. As soon as the solder flows smoothly into the pocket and penetrates the wire, the iron is removed immediately, to avoid burning the insulation of that wire or adjacent wires. Only enough solder should be used to fill the pocket, and any stray drops between pins must be cleaned away.

After each pin is soldered, a **plastic sleeve insulator** is pushed down over the soldered joint and pin to prevent short-circuiting, and the sleeves are tied or clamped to stop them slipping off.

**Important notes on soldered connectors:**
- The **flux used is corrosive** and can weaken the joint over time if not properly cleaned off.
- Common errors — too much heat, too much solder, too little heat, or poor cleanliness — are difficult to fully eliminate and must be guarded against.
- The soldering process **can destroy gold-plated contacts**.
- Solder wicking into the wire strands (beyond the intended tinned area) creates a stiff point and **additional mechanical stress** in the wire, a common cause of later fatigue failure.

## Coaxial Cables

### Description
Antennas are connected to most radio receivers and transmitters using a special type of shielded wire called **coaxial cable**. A coaxial cable contains two or more concentric (co-axial) conductors:
- The **innermost conductor** may be solid or stranded copper, and may be plain, tinned, silver-plated, or gold-plated.
- The **outer conductor(s)** take the form of a tube, usually a fine braid, surrounding the inner conductor.
- The **insulation (dielectric)** separating the conductors is usually **Teflon (PTFE) or polyethylene**.
- An **outer jacket** weatherproofs the cable and protects it from fluids and mechanical/electrical damage.

Coaxial cable has several advantages over ordinary two-wire cable:
1. **Shielding** — it is shielded against electrostatic and magnetic fields: an electrostatic field does not extend beyond the outer conductor, and the magnetic fields produced by current in the inner and outer conductors cancel each other out.
2. **No radiation / no pickup** — because it does not radiate energy, it likewise does not pick up stray energy or get influenced by external magnetic fields.
3. **Defined electrical characteristics** — coaxial cable has specific, known values of impedance, capacitance per unit length, and attenuation per unit length, which is essential for RF applications.

### Coaxial Stripping Procedures
A coaxial cable must be stripped back in **stages**, exposing the jacket, then the shield/braid, then the dielectric, then the centre conductor — each layer checked before moving to the next.

**1. Outer jacket** — once removed, check that:
- It is **not chafed or incised**.
- It has been **cut off flat, all round, and at right angles** to the length of the cable.
- It is **not frayed**.
- The underlying shield strands are **not notched or cut**.

**2. Shield (braid)** — after stripping, check that:
- It has been **cut off evenly all round**.
- The **braiding is not damaged**.
- The underlying dielectric is **not chafed, compressed, or incised**.

**3. Dielectric** — after stripping, check that:
- It is **not chafed, incised, or compressed**.
- It has been **cut off flat all round** the cable.
- It is **not frayed**.
- The **core (centre) conductor wires are not notched or cut**.

Each type and size of coaxial cable must be terminated exactly as specified by the connector manufacturer. **BNC connectors** are among the most widely used. A typical BNC termination sequence is:

1. Fit the nut over the cable and cut the cable end square.
2. Remove **half an inch (1/2")** of the outer jacket.
3. Push the braid back and remove **one-eighth inch (1/8")** of the dielectric insulation.
4. Taper the braid back over the end of the remaining insulation.
5. Slide the sleeve over the cable end, seating its inner shoulder square against the jacket end.
6. Comb the braid back over the taper of the sleeve.
7. Strip the centre conductor, leaving 1/8" of insulation showing beyond the sleeve and 1/8" of bare conductor beyond that.
8. Solder the contact to the centre conductor.
9. Push the connector body over the contact and the cable end.
10. Hold the cable and body together and screw the coupling nut onto the body.

### Coaxial Cable Testing
Coaxial cable impedance and length are closely related to how well it performs. If a cable's impedance does not match the load impedance, not all the energy sent down the line reaches the load — some reflects back toward the source, forming **standing waves**. The ratio of the voltage at the resulting high-voltage points to the voltage at the low-voltage points is the **Voltage Standing-Wave Ratio (VSWR)**.

If a coaxial cable is damaged — crushed, pinched, or cut — its impedance changes at that point, which shows up as reduced (low-power) transmission performance and an increased VSWR.

**Time Domain Reflectometer (TDR)**: the standard tool for locating impedance discontinuities is a **Time Domain Reflectometer**, essentially a sampling oscilloscope that applies Time Domain Reflectometry. It sends a narrow pulse down the cable and measures the time taken for a reflection to return from any anomaly (crush, pinch, cut, water ingress, poor installation, or even a manufacturing flaw). That time is converted into a distance, pinpointing the fault.

- **Waveform TDRs** display the actual reflected waveform/"signature" of the cable on a CRT or LCD screen, showing the outgoing pulse and any reflections.
- **Numeric TDRs** simply display the distance (in feet or metres) to the first major reflection, and may also indicate whether the fault is an **open** (high impedance change) or a **short** (low impedance change), or whether power is present on the line.

**Good testing practice with a TDR:**
- Get as close to the fault as practicable.
- Make a good-quality connection between the TDR and the cable.
- Enter the correct **Velocity of Propagation (VOP)** for the cable type being tested — this is the speed (as a fraction of the speed of light) at which a signal travels through that particular cable, and it varies between cable types and even between manufacturing batches.
- Start testing with the **shortest available pulse width**, since a fault may be close to the instrument; if not found, progressively increase the pulse width. A larger pulse width sends more energy and reaches farther, but also creates a larger "blind spot" near the instrument where a nearby fault is harder to resolve.
- **Test from both ends** of the cable — this helps refine the VOP setting and reveals faults that a numeric TDR (which stops at the first major fault) would otherwise hide.
- Where practical, leave the far end of the cable **unterminated/disconnected** during test, since a termination absorbs the pulse and returns no reflection; a cable does not have to be disconnected to be tested, but a genuine fault will still produce a reflection before reaching the termination.
- Always **retest** the cable after a fault has been repaired, to confirm the repair.
        $cnt5$,
        5
    ) RETURNING id INTO s5_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 07.6: Wiring Installation Practices
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m07_id, 'M07.6', 'Wiring Installation Practices',
        $cnt6$
# Wiring Installation Practices

## Made-Up Cabling

Cable looms and cabling that has been made up on the bench must be **inspected before installation** in the aircraft, to verify:

- All cables, fittings, and materials have been obtained from an **approved source**, have been satisfactorily tested, and have **not deteriorated in storage or been damaged in handling**.
- All **crimped and soldered joints** have been made in accordance with the relevant drawings, are clean and sound, and that insulating materials have not been damaged by heat.
- All connectors and cable looms **conform to the drawing** in respect of materials, terminations, length, angle of outlets, orientation of contact assemblies, identification, and protection of connections.
- **Cable-loom binding is secure.**
- **Continuity, resistance, and insulation tests** have been carried out in accordance with the drawing requirements.

## Installation of Electrical Wiring — General Principles

The aircraft's own Maintenance Manual (AMM) must always be used for the specific requirements of the aircraft type; the following are general principles.

- Cable bundles are normally fixed directly to the structure with **cable clamps**, without any extra protection needed.
- **Conduits** are used **only** where additional protection of the bundle is required.
- Install and protect cable bundles so that they remain **accessible for inspection and maintenance**.
- Install and protect cable bundles so as to prevent damage from: **touching, chafing, hammering, sliding, kinking**, and **high ambient temperatures**.
- Cable bundles, including their fastenings and protection, must be **resistant to the conditions and substances** present in their surroundings (fluids, heat, vibration, etc.).

### Installation of Cable Bundles — Clearances

Cables are assembled into bundles with bundle ties or bundle lacing tape, and sufficient space must be kept between the bundle and surrounding parts to prevent damage. The following minimum clearances apply as general guidance (always confirmed against the AMM):

| Adjacent item | Minimum clearance |
|---|---|
| Sharp edges (general chafing protection) | 1 cm (0.4 in) |
| Fuel or oxygen lines | 15 cm (6 in) |
| Control cables | 7.5 cm (3 in) |
| Water lines, pitot-static lines | 13 mm (0.5 in) — may be reduced where mechanical support prevents actual contact |
| Insulated bleed-air ducts | 5 cm (2 in), with mechanical support provided to prevent any possible contact |

## Cable Clamps

Cable clamps are the primary means of securing bundles to the aircraft structure.

- **Metal cable clamps** must have a **flexible rubber cushion** lining to protect the cable insulation from the metal.
- **Plastic cable clamps** may only be used **inside the pressure cabin**, in locations where the load on the clamp is minimal — for example in cable trays, on panels, and in Electrical Power Centre (EPC) areas.

### Correct Clamp Installation

- The **ends of the flexible rubber cushion must be linked together** — this prevents the metal body of the clamp from contacting and damaging the cable.
- The **mounting bolt is installed on top** of the clamp.
- After mounting, the clamp must **fully enclose** the bundle, so the bundle cannot slide inside the clamp.
- The **maximum outer diameter of the bundle must not exceed the inner diameter** of the clamp.
- Cables must be mounted at the **correct angle**, laid **parallel and tightly together** inside the clamp.
- Clamps must be spaced at the **correct interval** — inside the pressure cabin, this is typically **10 to 30 cm (4–12 inches)** apart, the exact spacing depending on the routing, thickness, and stiffness of the bundle.

A clamp that is the wrong size is a defect: too large and the bundle can move and chafe; too small and the cushion will compress and eventually damage the insulation.

## Conduit — Metallic and PVC

Conduit is used purely as **protection** for cable bundles, not as a primary support method. Where fitted, conduit must be installed so it **cannot be used as a handhold or foothold** by passengers or maintenance personnel.

| Type | When used |
|---|---|
| **Metallic conduit** | Preferred/default choice; ends must be **flared and smooth** to avoid damaging cable insulation |
| **PVC (plastic) conduit** | Used **only when metallic conduit cannot be used**; ends must be fitted with **adapters** to prevent damage to the cables |

**Sizing rule**: the **inner diameter of the conduit must be at least 25% larger** than the maximum outer diameter of the cable bundle it carries, to avoid the bundle being squeezed and to allow it to be drawn through without damage.

### Conduit Drainage
Where tubing/conduit is used, a **drainage hole of 1/8 inch diameter** should be provided at the **lowest point** of the run, to let condensed moisture escape rather than run along the cables and into electrical equipment. Where a drain hole is not possible, the cable should include a **downward loop** immediately after leaving the equipment, so moisture drains away from it rather than into it. Conduits, tubes, and ducts should always be arranged so accumulated moisture drains away harmlessly, and the cables used inside them must be able to tolerate the moisture they may encounter.

## Interference

Cables must be installed to keep **electrical interference to a minimum** and to avoid confusion between circuits serving different systems. As a general rule, the spacing between any **unscreened aircraft cable and an unscreened radio aerial lead** should be **not less than 18 inches**, to limit coupling/crosstalk between the two.

## Protection of Cabling

Cables must be protected from **abrasion, mechanical strain, excessive heat**, and from **fuel, oil, water** (liquid or vapour), and the weather generally.

- Cables should be spaced from the **skin of the aircraft by at least half an inch (0.5 in)**, to avoid damage from high skin temperatures that can be reached in tropical conditions.
- Cables must **not** be routed near a hot engine or other hot components **unless a cooled air space or heat barrier** is placed between them.
- Cables must **never bear on sharp edges** — such as screw heads/ends, panel edges, metal fittings, or bulkheads.
- Where cables pass through **metal fittings or bulkheads**, the edges of the hole must be **radiused and smoothed**, and fitted with an **insulating bush or sleeve**.
- Cables drawn through holes or tubes must be an **easy fit**, requiring only a moderate, steady pull — cables should be kept parallel to each other and kinks (which can fracture the conductor) avoided.
- Conduits, ducts, and trays carrying cable should have **smooth internal surfaces**; rigid ducts should be adequately **flared at the outlets or bushed** with insulating material.

## Spiral Binding

**Spiral binding** ("Spi-wrap") is used to form and protect cable looms. It is supplied as a continuous helical strip — for example, 12 inches of 1-inch-inside-diameter binding will cover a 1-inch bundle for a 12-inch length. Some types have **beaded edges** to prevent the binding itself from damaging the cable.

**Fitting spiral binding:**
- No special tooling is required.
- Select the **correct size** of binding for the loom.
- Ensure the cables lie **straight in the bundle with no cross-overs** before wrapping.
- Wrap the binding along the required length; on large bundles it can be secured at each end by fitting the last loop of the spiral into the bundle itself.
- Cut ends so that **no sharp edges** are left.
- Normally the binding is fitted **"butted"** — each turn close against the next.

Spiral binding materials are chosen for the temperature range of the installation, for example:

| Material | Typical temperature range |
|---|---|
| Nylon (e.g. "Nylowrap") | −20°C to +105°C |
| PTFE (e.g. "Efwrap") | −20°C to +105°C |

## Support of Cabling

Cabling must be **adequately supported along its full length**, with enough clips/supports for each run so unsupported lengths cannot vibrate unduly — vibration of unsupported spans can fracture conductors or damage insulation.

- Cables must be fitted and clipped so that **no tension** is applied under any circumstance of flight, adjustment, or maintenance.
- **Loops or slack** must not be left where they could be caught and strained by normal movement of people in the aircraft, or during normal flight, maintenance, or adjustment.

## Tywraps

**Tywraps** (nylon or PVC cable ties) are used to tie cable looms. Once tightened around a loom they **lock and cannot be unlocked/reused**. Their inner surface grips the loom so it will not slip, and because of their wide gripping surface, **fewer ties are needed** than with traditional lacing/whipping methods. They are also available in colours for loom identification.

**Caution**: some Tywraps use a **metal locking insert** integral to the tie. Experience has shown that **over-tightening** can allow this metal insert to cut into and damage the cable — in some cases creating a dangerous condition. Because of this, **all-plastic Tywraps** (no metal insert) are specified for use in some areas.

## Cable Conduits (Superflexit)

"Superflexit"-type flexible conduit is chosen by operating temperature range:

| Conduit material | Operating temperature range |
|---|---|
| **PTFE** | −70°C to +240°C |
| **PVC** | −20°C to +70°C |

The conduit is normally supplied plain, but is also available with internal or external **tinned copper braid** (stainless steel braided conduit is not suitable for this style of attachment). It is attached to the connector/end fitting using a stainless steel **Isoclip**. A **Viton sleeve** fits over the end-fitting spigot before the conduit is fitted, to prevent the conduit being cut by the metal spigot and to form a seal rated up to **30 PSI (207 kN/m²)**.

Whether **continuity** is required between the braid and the connector shell determines the fitting sequence:
- **For continuity**: the braid is fitted onto the spigot first, then the Viton sleeve over the braid, then the conduit over the sleeve, all retained by the Isoclip.
- **For insulation** (no continuity through the braid): the braid is fitted onto the spigot **after** the Viton sleeve is already in place.

**Fitting procedure:**
1. Cut the conduit cleanly and squarely.
2. Using the approved Superflexit tool and spigots, **deconvolute** 14.5 mm (0.57 in) ± 1 mm (0.040 in) of the conduit — this is the length needed to fit over the Viton sleeve and end termination.
3. Push the Viton sleeve onto the spigot, leaving about 1.5 mm (0.062 in) protruding beyond the spigot end, to act as a resilient buffer and form the seal.
4. Slide the outer Viton sleeve over the conduit/braid, back far enough to leave room for the Isoclip.
5. Place the Isoclip onto the conduit, push the deconvoluted end over the inner Viton sleeve, and bring the Isoclip forward into position.
6. Fit the Isoclip assembly tool over the Isoclip, with the tensioner engaging the twisted end of the clip.
7. Wind the tool's knob until a gap appears in the shaft, aligning the gap edges with a pair of markings — this sets the correct clip tension.
8. Compress the tool's lever to cut off the excess Isoclip wire, then bend the cut end down flat so it does not protrude.
9. Slide the outer Viton sleeve forward over the Isoclip and the deconvoluted conduit end.

After assembly, the conduit must be checked against the drawing requirements, and normal electrical safety precautions observed throughout.

## Heat Shrink Tubing and Heat Shrinkable Sleeves

Heat-shrink tubing is supplied in many sizes and temperature ratings. A typical general-purpose, self-extinguishing type has:

| Characteristic | Typical value |
|---|---|
| Continuous operating temperature | −55°C to +135°C |
| Short-duration rating | up to 300°C for 1 hour |
| Minimum shrink temperature | 121°C (recommended 250–300°C) |
| Shrink factor | 50% of supplied diameter |
| Fluid resistance | Skydrol 500, kerosene, hydraulic fluid |
| Available colours | Yellow, black, red, white, blue |
| Supply length | 4-foot lengths |

**Selection rule**: always select the **largest size that will still fit snugly** over the item being covered — the resulting wall thickness after shrinking will be greater if the tubing's recovery is restricted (i.e., if it is oversized for the item), and less if it is allowed to shrink fully.

### Applying Heat-Shrinkable Sleeves
- Use the **smallest size that slides easily** over the assembly.
- Cut the sleeve to a length such that, once shrunk, it **fully covers the connection** and extends approximately **10 mm (0.4 in)** beyond the insulation on each side.

### Thermoguns (Heat Guns)
Dedicated **thermoguns** are used to shrink the sleeving, ranging from general-purpose self-contained hot-air guns (with several fixed temperature settings) up to high-power models capable of several hundred degrees Celsius for larger or higher-temperature sleeves. Interchangeable **reflectors** fit the gun nozzle to direct and concentrate heat:

| Reflector | Recommended use |
|---|---|
| Small reflector (e.g. PR13-type) | Smaller sizes of all sleeve types, including solder sleeves |
| Medium/large reflector | Moulded parts and larger-bore tubes |
| Low-temperature type | Low-temperature solder sleeves and smaller products |
| Miniature type | Miniature solder-sleeve terminations and small products |

A **low-temperature thermopistol** (distinguished by a green handle) is intended for general-purpose work on small sleeves and parts, and is **not** suitable for solder sleeves or high-temperature sleeves. A **high-temperature thermopistol** (yellow handle) is the preferred tool for solder sleeves and high-temperature sleeving.
        $cnt6$,
        6
    ) RETURNING id INTO s6_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 07.7: Cable Performance & Failure Modes
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m07_id, 'M07.7', 'Cable Performance & Failure Modes',
        $cnt7$
# Cable Performance & Failure Modes

## Cable Performance — Overview

As aircraft cable insulation has become thinner and lighter, the definition of "cable performance" has grown more complex and demanding. Some airframe cables now have as little as **0.006 inches** of total insulation thickness, leaving very little margin for error in either manufacture or installation. Operating temperature largely dictates the materials and construction used, but installation requirements must also be satisfied — properties such as resistance to insulation **"cut-through"** and abrasion are critical. Cables must therefore be selected carefully, considering all of the factors below in relation to their intended duty.

### Temperature
A cable's **temperature rating** must be known and compared against the worst-case conditions of its application — this means knowing the cable's location relative to hot-air ducts and local hot spots such as power transformers or filament lighting. A cable's maximum continuous operating temperature is a combination of:
- **Ambient temperature**, plus
- **Temperature rise due to I²R losses** (resistive heating from current flow)

As a general rule, it is undesirable for electrical heating alone to contribute **more than a 40°C rise**, since operating temperature and installed service life are directly related — hotter cables age faster. Airframe cable is classified by construction into one of several standard temperature ratings:

| Rating | Notes |
|---|---|
| 105°C | Obsolescent cable types |
| 135°C | |
| 150°C | |
| 210°C | |
| 260°C | |

### Cable Size
Cable is usually identified by a size number approximating its **AWG (American Wire Gauge)** size, though some cables are instead numbered by **conductor cross-sectional area in mm²** (common for commercial/European cable). Cable size is the primary factor setting the level of electrical protection (circuit breaker or fuse rating) for a circuit, and this size **must never be reduced** below the level set by proper protection co-ordination data. Manufacturers publish current-rating data both for a single cable in free air and for bundles of three cables in free air; this data is normally based on a **40°C temperature rise** above ambient, and conductor resistance is typically quoted in ohms per km at 20°C (a correction may be needed for accurate voltage-drop calculations at other temperatures).

Note that cable "size" refers only to the **conductor**, so the overall diameter and surface finish of a given size can vary between cable types — this can affect cable sealing in connectors/pressure bungs and the choice of crimp terminal.

### Voltage Rating
All cables carry a rated voltage, and some (such as equipment wiring) may be specified by voltage rather than size alone. Extra care is needed with cables exposed to higher-than-normal potentials, such as discharge-lamp circuits and windscreen heating circuits.

### Flammability and Toxicity
All aircraft cable must meet defined resistance-to-burning requirements under standard flame tests, and airworthiness codes (BCARs, EASA CS, FARs) also impose requirements relating to smoke and toxicity hazards. Newer cable types are generally more thoroughly investigated for these characteristics than older ones.

### Mechanical Properties
Cable insulation is assessed for its ability to withstand a sharp edge pressing into it (**cut-through resistance**) and for resistance to scraping with a defined blade — these controlled tests have replaced older informal methods such as scraping with a thumbnail. Different cable constructions vary significantly in stiffness and "springiness" — stiffer, thin-wall/hard-dielectric cable looms resist being formed and held ("set") in position, especially on flimsy supporting structure. Apparent mechanical stiffness must **not** be assumed to equal resistance to physical abuse.

### Fluid Contamination
Cables must show a defined level of resistance to common aircraft fluids, but this does not mean they can withstand **continuous** contamination — pooling of fluid on cable should always be avoided. Sealing compounds are a related hazard, since some contain agents aggressive to cable insulation; compatibility should be checked whenever a new cable type or a new aircraft fluid (e.g. a new hydraulic fluid type) is introduced.

## Cable Construction

### Conductors
Equipment-interconnect and airframe cable conductors are normally **stranded**, usually made from **plated copper**. Conductor sizes of **24 AWG and smaller** are typically made from a **copper alloy** for higher tensile strength; fire-resistant cables may use copper alloy or plain copper throughout all sizes. The conductor is built up from plated circular strands laid up into one of several stranded forms.

**Aluminium conductors** are available for cable sizes 8 AWG and larger, but have a history of installation and termination problems. Any modification converting a circuit from copper to aluminium conductor should be classed as a **major modification** and investigated thoroughly, particularly regarding termination technique — aluminium cable must be significantly larger in cross-section than copper for the same current-carrying capacity, because aluminium has higher electrical resistance.

### Conductor Plating
Plating is applied to copper, copper-alloy, and aluminium conductors to improve corrosion resistance and assist termination. The plating type is often what actually determines the cable's temperature rating:

| Plating | Maximum continuous temperature |
|---|---|
| Tin-plated copper | 135°C |
| Silver-plated copper | 200°C |
| Nickel-plated copper | 260°C |
| Nickel-clad copper | 260°C |

**Nickel-clad** copper (a thicker nickel layer than plating) is used instead of nickel plating on fire-resistant cable. Note that the actual usable temperature may be limited further by the cable's insulation rather than the plating itself, and the plating on a crimped terminal end must be **compatible** with the conductor plating of the cable being terminated — this should be confirmed with the termination manufacturer.

## Dielectric Materials / Cable Types

There is **no single "best" cable type** overall — every insulation material studied has both advantages and disadvantages, which is part of why cable selection is a more difficult judgement than it first appears.

Insulation is applied to conductors by one of two basic methods:

| Method | Characteristics |
|---|---|
| **Extrusion** | Extrudable materials are "heat-meltable" and generally unsuitable for higher-temperature applications; toward the top of their rated temperature range, mechanical strength (abrasion/cut-through resistance) can be significantly lower than at room temperature. Airframe cable typically uses a **double extrusion** (often two different materials), which also gives "crack-stopping" properties. |
| **Wrapping (tape)** | Single or double tape layers are spirally wound around the conductor to build up the required insulation thickness. |

**Radiation cross-linking** of the insulation is used on high-performance cable: it eliminates the melting point of the material, increases mechanical strength, and allows a thinner wall thickness; such cable also performs well on wet arc-tracking tests.

The most common wrapped insulation material is **Kapton** (a DuPont trademark for an aromatic polyimide). It is naturally copper-coloured, so a coloured top coat is normally applied for printing and added protection. Kapton is often combined with other materials in a "hybrid" construction. It is technically incorrect to refer generically to "Kapton cable" without specifying the full construction, since hybrid types can perform very differently from pure Kapton constructions — some early single-material Kapton constructions (e.g. to certain US military specifications) attracted adverse comment regarding wet arc tracking, but this does not reflect on Kapton hybrid constructions generally, which offer good overall performance and excellent mechanical strength.

Wrapped construction gives good control of wall thickness — some cable types use as few as **4 layers of Kapton tape**, achieving a total wall thickness of around **0.006 inches**.

**PVC-insulated cable** (e.g. "Minyvin") is now classed as **obsolescent — unsuitable for new designs**.

## Cable Failures

Several recurring cable failure modes and quality defects are found in service:

### Arc Tracking (Wet Arc Tracking)
Occurs when leakage current across a **wet insulation surface** is high enough to vaporise the moisture at points on the surface, creating dry spots. These dry spots present high resistance to current flow; an induced voltage develops across them, producing small surface **discharges (scintillations)**. These discharges generate highly localised temperatures on the order of **1000°C**, thermally degrading the insulation. An aircraft wire's resistance to wet arc tracking and possible flashover depends heavily on the composition of its insulation, and the conductivity of the contaminating electrolyte affects both the speed and the type of resulting failure (arc-track or open circuit). Good control of **hot-stamp printing** on cable is important, since poorly controlled printing can initiate arc tracking; interconnect and equipment wire should not be hot-stamp printed.

### Abrasion
Some cable types show a tendency to **wear through** their insulation where cable rubs against cable, or cable rubs against structure — typically in areas of high vibration. Stiffer cable constructions can produce greater contact force and transmit more vibration than a cable they replace. Careful **loom tying and clipping** is the main defence against this failure mode.

### Conductor "Knuckling Through"
Some older cable constructions could exhibit **"knuckling"** of individual conductor strands severe enough to penetrate the insulation, typically caused by **excessive pulling force** during installation. Cables must never be put under tension during installation; obsolescent constructions requiring particular manufacturing and installation care to avoid this defect are still occasionally encountered.

### Red Plague
**Silver-plated conductors** can develop "red plague" corrosion if the plating is damaged and then exposed to moisture. For this reason, silver-plated conductors are generally considered **unsuitable for unpressurised areas** of the aircraft.

### Glycol Fires
If **de-icing fluid** contaminates silver-plated conductors, an electrical fire can result. Silver-plated conductors should therefore not be used in areas where de-icing fluid may be present.

### Poor Solderability
The amount of free tin available on a plated conductor **reduces over time**, starting from the moment the cable is manufactured. This means conductors may need to be re-tinned as part of any soldered-connection repair, and **prolonged storage of cable should be avoided** to keep good solderability.
        $cnt7$,
        7
    ) RETURNING id INTO s7_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M07.5 Soldering & Coaxial Cables (14 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s5_id, 'A soldered connection that shows an abrupt rise of solder away from the surface being soldered, caused by de-wetting, is known as a:',
     '[{"id":"a","text":"Resin-soldered connection","correct":false},{"id":"b","text":"Cold solder connection (dry joint)","correct":true},{"id":"c","text":"Overheated joint","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s5_id, 'A disturbed solder connection results from:',
     '[{"id":"a","text":"Movement of the conductor while the solder was hardening","correct":true},{"id":"b","text":"Trapped flux inside the joint","correct":false},{"id":"c","text":"Using too little solder","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s5_id, 'The purpose of flux during soldering is to:',
     '[{"id":"a","text":"Increase the melting point of the solder","correct":false},{"id":"b","text":"Prevent oxidation and help the metals fuse together","correct":true},{"id":"c","text":"Act as a heat sink","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s5_id, 'Why must a soldering iron used on aircraft wiring have an isolation transformer in its power supply?',
     '[{"id":"a","text":"To increase the tip temperature","correct":false},{"id":"b","text":"To prevent stray magnetic fields from damaging electrical components","correct":true},{"id":"c","text":"To allow use on ESDS devices only","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s5_id, 'What must the cleaning sponge for a soldering iron tip be kept wet with?',
     '[{"id":"a","text":"Isopropyl alcohol","correct":false},{"id":"b","text":"Tap water","correct":false},{"id":"c","text":"Distilled water","correct":true}]',
     '{"B1.1","B1.3","B2"}'),

    (s5_id, 'The purpose of a heat sink when soldering a component is to:',
     '[{"id":"a","text":"Conduct heat away from the component being soldered","correct":true},{"id":"b","text":"Increase the flow rate of the solder","correct":false},{"id":"c","text":"Remove excess flux from the joint","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s5_id, 'Anti-wicking pliers are used during soldering to:',
     '[{"id":"a","text":"Hold the wire in tension while it cools","correct":false},{"id":"b","text":"Prevent solder from flowing under the wire insulation and causing thermal damage","correct":true},{"id":"c","text":"Strip the insulation from the wire","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s5_id, 'A correctly tinned wire should show:',
     '[{"id":"a","text":"The strands completely hidden under a thick layer of solder","correct":false},{"id":"b","text":"The strands clearly visible, following their original routing, with solder not extending beyond the stripped area","correct":true},{"id":"c","text":"Solder wicked well up under the adjacent insulation for strength","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s5_id, 'When soldering a connector pin with a solder pocket, the soldering iron should be removed as soon as:',
     '[{"id":"a","text":"The pocket first starts to warm up","correct":false},{"id":"b","text":"The solder flows smoothly into the pocket and penetrates the wire","correct":true},{"id":"c","text":"Ten seconds have elapsed, regardless of solder flow","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s5_id, 'Which statement about soldering aircraft connectors is correct?',
     '[{"id":"a","text":"The soldering process can destroy gold-plated contacts","correct":true},{"id":"b","text":"Flux used for soldering has no long-term effect on the joint","correct":false},{"id":"c","text":"Solder wicking into wire strands reduces mechanical stress in the wire","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s5_id, 'When stripping the outer jacket of a coaxial cable, the cut must be:',
     '[{"id":"a","text":"Angled to match the cable lay","correct":false},{"id":"b","text":"Flat, all round, and at right angles to the cable''s length","correct":true},{"id":"c","text":"Tapered gradually over several centimetres","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s5_id, 'What is the primary purpose of the outer braid (shield) on a coaxial cable?',
     '[{"id":"a","text":"To carry the return signal current only","correct":false},{"id":"b","text":"To provide shielding against electrostatic and magnetic fields","correct":true},{"id":"c","text":"To increase the cable''s voltage rating","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s5_id, 'The instrument used to locate the position of a fault (crush, pinch, or cut) in a coaxial cable is a:',
     '[{"id":"a","text":"Megohmmeter","correct":false},{"id":"b","text":"Time Domain Reflectometer (TDR)","correct":true},{"id":"c","text":"Clamp meter","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s5_id, 'When fault-finding a coaxial cable with a TDR, the correct starting point is to:',
     '[{"id":"a","text":"Use the largest available pulse width first, then reduce it","correct":false},{"id":"b","text":"Use the shortest available pulse width first, then increase it if needed","correct":true},{"id":"c","text":"Test only from one end of the cable to avoid conflicting readings","correct":false}]',
     '{"B1.1","B1.3","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M07.6 Wiring Installation Practices (17 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s6_id, 'Before installation in the aircraft, made-up cable looms must be inspected to verify that:',
     '[{"id":"a","text":"Crimped and soldered joints conform to the relevant drawings and are clean and sound","correct":true},{"id":"b","text":"Only crimped joints have been used, with no soldered joints permitted","correct":false},{"id":"c","text":"The loom has been pre-stretched to remove slack","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s6_id, 'As a general principle, cable bundles are normally fixed to the aircraft structure using:',
     '[{"id":"a","text":"Conduit only","correct":false},{"id":"b","text":"Cable clamps, without extra protection","correct":true},{"id":"c","text":"Adhesive bonding directly to the skin","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s6_id, 'The minimum recommended separation between a cable bundle and a fuel or oxygen line is:',
     '[{"id":"a","text":"1 cm (0.4 inch)","correct":false},{"id":"b","text":"7.5 cm (3 inches)","correct":false},{"id":"c","text":"15 cm (6 inches)","correct":true}]',
     '{"B1.1","B1.3","B2"}'),

    (s6_id, 'The minimum recommended separation between a cable bundle and a control cable is:',
     '[{"id":"a","text":"7.5 cm (3 inches)","correct":true},{"id":"b","text":"15 cm (6 inches)","correct":false},{"id":"c","text":"1 cm (0.4 inch)","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s6_id, 'Metal cable clamps must be fitted with:',
     '[{"id":"a","text":"A flexible rubber cushion to protect the cable insulation","correct":true},{"id":"b","text":"A layer of PTFE tape only","correct":false},{"id":"c","text":"No liner, provided the clamp edges are deburred","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s6_id, 'Plastic cable clamps are only permitted:',
     '[{"id":"a","text":"On unpressurised external areas of the aircraft","correct":false},{"id":"b","text":"Inside the pressure cabin, where the load on the clamp is minimal","correct":true},{"id":"c","text":"In engine bays only","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s6_id, 'Inside the pressure cabin, the typical spacing between cable clamps supporting a bundle is:',
     '[{"id":"a","text":"1 to 2 cm","correct":false},{"id":"b","text":"10 to 30 cm (4 to 12 inches)","correct":true},{"id":"c","text":"60 to 90 cm (24 to 36 inches)","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s6_id, 'When installing a cable clamp, the flexible rubber cushion ends must be:',
     '[{"id":"a","text":"Left slightly separated for ventilation","correct":false},{"id":"b","text":"Linked together, to prevent the metal clamp body damaging the cable","correct":true},{"id":"c","text":"Trimmed flush with the clamp opening","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s6_id, 'PVC (plastic) conduit for cable protection should be used:',
     '[{"id":"a","text":"As the first choice on all new installations","correct":false},{"id":"b","text":"Only where the use of metallic conduit is not possible","correct":true},{"id":"c","text":"Only in unpressurised bays","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s6_id, 'The inner diameter of a conduit used to protect a cable bundle should be:',
     '[{"id":"a","text":"Equal to the bundle''s outer diameter for a snug fit","correct":false},{"id":"b","text":"At least 25% larger than the bundle''s maximum outer diameter","correct":true},{"id":"c","text":"At least double the bundle''s outer diameter","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s6_id, 'A drainage hole in a cable conduit is provided at the lowest point mainly to:',
     '[{"id":"a","text":"Reduce the weight of the conduit","correct":false},{"id":"b","text":"Allow condensed moisture to escape rather than reach electrical apparatus","correct":true},{"id":"c","text":"Allow inspection of the cables without removing the conduit","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s6_id, 'To reduce electrical interference, the minimum spacing between an unscreened aircraft cable and an unscreened radio aerial lead should normally be:',
     '[{"id":"a","text":"6 inches","correct":false},{"id":"b","text":"12 inches","correct":false},{"id":"c","text":"18 inches","correct":true}]',
     '{"B1.1","B1.3","B2"}'),

    (s6_id, 'Cables should be spaced from the skin of the aircraft by at least:',
     '[{"id":"a","text":"1/4 inch","correct":false},{"id":"b","text":"1/2 inch","correct":true},{"id":"c","text":"2 inches","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s6_id, 'Where a cable passes through a hole in a metal bulkhead, the edge of the hole must be:',
     '[{"id":"a","text":"Left sharp to grip the cable in place","correct":false},{"id":"b","text":"Radiused, smoothed, and fitted with an insulating bush or sleeve","correct":true},{"id":"c","text":"Sealed with structural adhesive only","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s6_id, 'Compared with traditional lacing/whipping, Tywraps require fewer ties on a loom because:',
     '[{"id":"a","text":"They stretch to accommodate a larger bundle diameter","correct":false},{"id":"b","text":"Their wide gripping surface secures the loom more effectively per tie","correct":true},{"id":"c","text":"They are designed to be reused and retightened repeatedly","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s6_id, 'Over-tightening a metal-insert Tywrap can be hazardous because:',
     '[{"id":"a","text":"The metal insert can cut into and damage the cable","correct":true},{"id":"b","text":"The tie will melt from friction heat","correct":false},{"id":"c","text":"It reduces the current rating of the cable it secures","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s6_id, 'Superflexit conduit made from PTFE is suitable for an operating temperature range of approximately:',
     '[{"id":"a","text":"-20°C to +70°C","correct":false},{"id":"b","text":"-70°C to +240°C","correct":true},{"id":"c","text":"0°C to +100°C","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s6_id, 'When selecting heat-shrink tubing to cover a component, the correct rule is to select:',
     '[{"id":"a","text":"The smallest size that can be forced over the item","correct":false},{"id":"b","text":"The largest size that will still fit snugly over the item to be covered","correct":true},{"id":"c","text":"Any size, since shrink factor makes size irrelevant","correct":false}]',
     '{"B1.1","B1.3","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M07.7 Cable Performance & Failure Modes (13 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s7_id, 'As a general rule, electrical (I²R) heating alone should not contribute more than a temperature rise of:',
     '[{"id":"a","text":"10°C","correct":false},{"id":"b","text":"40°C","correct":true},{"id":"c","text":"100°C","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s7_id, 'Cable size (conductor size) should never be reduced below the level set by:',
     '[{"id":"a","text":"The aircraft''s paint scheme requirements","correct":false},{"id":"b","text":"Proper electrical protection co-ordination data (circuit breaker/fuse rating)","correct":true},{"id":"c","text":"The cable manufacturer''s minimum order quantity","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s7_id, 'Cable insulation "cut-through" resistance testing has largely replaced which older informal assessment method?',
     '[{"id":"a","text":"Scraping the insulation with a thumbnail","correct":true},{"id":"b","text":"Measuring insulation resistance with a megohmmeter","correct":false},{"id":"c","text":"Bending the cable through 180°","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s7_id, 'Most equipment-interconnect and airframe cable conductors are:',
     '[{"id":"a","text":"Solid aluminium wire","correct":false},{"id":"b","text":"Stranded, plated copper","correct":true},{"id":"c","text":"Solid, unplated copper","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s7_id, 'Converting a cable circuit from copper to aluminium conductor should be classed as:',
     '[{"id":"a","text":"A minor modification requiring no special review","correct":false},{"id":"b","text":"A major modification, requiring thorough investigation especially of termination technique","correct":true},{"id":"c","text":"A routine repair under standard practices","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s7_id, 'The maximum continuous operating temperature of tin-plated copper conductor is approximately:',
     '[{"id":"a","text":"135°C","correct":true},{"id":"b","text":"200°C","correct":false},{"id":"c","text":"260°C","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s7_id, 'Nickel-clad (rather than nickel-plated) copper conductor is used on fire-resistant cable because it provides:',
     '[{"id":"a","text":"A lower overall conductor resistance","correct":false},{"id":"b","text":"A thicker nickel layer for greater protection","correct":true},{"id":"c","text":"Easier solderability than plated conductor","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s7_id, 'Kapton insulation is best described as:',
     '[{"id":"a","text":"A registered trade name for an aromatic polyimide, applied by wrapping tape around the conductor","correct":true},{"id":"b","text":"An extruded PVC compound used only on ground equipment","correct":false},{"id":"c","text":"A ceramic-based coating applied by dipping","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s7_id, 'PVC-insulated aircraft cable (e.g. Minyvin type) is currently classed as:',
     '[{"id":"a","text":"The preferred insulation for new high-temperature designs","correct":false},{"id":"b","text":"Obsolescent — unsuitable for new designs","correct":true},{"id":"c","text":"Mandatory for all fuel-tank wiring","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s7_id, 'Wet arc tracking begins when:',
     '[{"id":"a","text":"Leakage current across a wet insulation surface vaporises moisture, creating high-resistance dry spots","correct":true},{"id":"b","text":"A cable is exposed to prolonged direct sunlight","correct":false},{"id":"c","text":"Insulation resistance exceeds 1000 MΩ","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s7_id, 'Why should interconnect and equipment wire not be hot-stamp printed?',
     '[{"id":"a","text":"Hot-stamp printing is too expensive for small production runs","correct":false},{"id":"b","text":"Poorly controlled hot-stamp printing can initiate wet arc tracking","correct":true},{"id":"c","text":"It prevents the wire number from being read under UV light","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s7_id, 'Conductor "knuckling through" the insulation is typically caused by:',
     '[{"id":"a","text":"Excessive pulling force applied to the cable during installation","correct":true},{"id":"b","text":"Under-tightened cable clamps","correct":false},{"id":"c","text":"Use of silver-plated conductors","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s7_id, 'Silver-plated conductors are generally considered unsuitable for unpressurised areas of the aircraft because of the risk of:',
     '[{"id":"a","text":"Red plague corrosion if the plating is damaged and exposed to moisture","correct":true},{"id":"b","text":"Excessive weight compared to tin-plated conductors","correct":false},{"id":"c","text":"Reduced current-carrying capacity at altitude","correct":false}]',
     '{"B1.1","B1.3","B2"}');

END $$;
