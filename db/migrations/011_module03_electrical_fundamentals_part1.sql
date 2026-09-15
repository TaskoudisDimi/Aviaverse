-- Module 03: Electrical Fundamentals — Part 1 (Electron Theory, Static Electricity, DC Sources)
-- Source: EASA Part-66 Module 03 official textbook (Electrical Fundamentals)

DO $$
DECLARE
    m03_id INT;
    s1_id  INT;
    s2_id  INT;
    s3_id  INT;
    s4_id  INT;
BEGIN
    SELECT id INTO m03_id FROM easa_modules WHERE code = 'M03';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M03.1') THEN
        RAISE NOTICE 'M03 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 03.1: Electron Theory & Structure of Matter
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m03_id, 'M03.1', 'Electron Theory & Structure of Matter',
        $cnt$
# Electron Theory & Structure of Matter

## Elements, Compounds and Molecules

All pure substances are built from a relatively small number of basic substances called **elements**, of which 92 occur naturally. An element may exist alone or combined with other elements to form a **compound**.

- The ultimate particle an element can be reduced to is the **atom**.
- The smallest part of an element or compound that normally exists in a free state is the **molecule**.
- The molecule of an element may consist of one or more atoms of that element (e.g. oxygen, O₂, is 2 oxygen atoms).
- The molecule of a compound consists of 2 or more atoms of *different* elements (e.g. water, H₂O, is 2 hydrogen atoms + 1 oxygen atom).

In a pure compound every molecule contains the same number of atoms of each element — elements can only combine to form compounds in fixed proportions. Many everyday substances are simply **mixtures** of elements or compounds, not pure substances.

## Atomic Structure

Below the atomic level, every atom (except hydrogen) is built from three particles:

| Particle | Location | Charge | Relative mass |
|----------|----------|--------|----------------|
| **Proton** | Nucleus | Positive | Heavy (≈ same as neutron) |
| **Neutron** | Nucleus | None (neutral) | Heavy (≈ same as proton) |
| **Electron** | Orbiting the nucleus | Negative | Very light |

Hydrogen is the exception — its atom contains no neutrons.

Like charges **repel**, unlike charges **attract**. Under normal conditions the number of electrons equals the number of protons in an atom, so the atom is **electrically neutral**. Because protons and neutrons are far heavier than electrons, almost all the mass of an atom is concentrated in the nucleus, while electrons — being light — can be relatively easily displaced from their orbit.

## Electron Shells

Electrons orbit the nucleus in layers called **shells**, conventionally labelled K, L, M, N, O, P, Q working outward from the nucleus. Each shell can only hold a limited number of electrons:

| Shell | Maximum electrons |
|-------|--------------------|
| K (innermost) | 2 |
| L | 8 |
| M | 18 |
| N | 32 |

Electrons fill the innermost shells first. For example, copper has 29 protons and 29 orbiting electrons, arranged as: K = 2, L = 8, M = 18, N = 1.

### Example shell configurations

| Element | Protons | K | L | M | N | O | P |
|---------|---------|---|---|---|---|---|---|
| Hydrogen (H) | 1 | 1 | – | – | – | – | – |
| Helium (He) | 2 | 2 | – | – | – | – | – |
| Lithium (Li) | 3 | 2 | 1 | – | – | – | – |
| Carbon (C) | 6 | 2 | 4 | – | – | – | – |
| Oxygen (O) | 8 | 2 | 6 | – | – | – | – |
| Sodium (Na) | 11 | 2 | 8 | 1 | – | – | – |
| Aluminium (Al) | 13 | 2 | 8 | 3 | – | – | – |
| Silicon (Si) | 14 | 2 | 8 | 4 | – | – | – |
| Chlorine (Cl) | 17 | 2 | 8 | 7 | – | – | – |
| Copper (Cu) | 29 | 2 | 8 | 18 | 1 | – | – |
| Silver (Ag) | 47 | 2 | 8 | 18 | 18 | 1 | – |
| Gold (Au) | 79 | 2 | 8 | 18 | 32 | 18 | 1 |

## Valency Electrons

The electrons in an atom's **outermost** shell are called **valency electrons**. Atoms combine with each other by sharing these outer-shell electrons, and it is the number and behaviour of valency electrons that determines an element's chemical and electrical properties.

## Ions

An atom can lose or gain electrons through interaction with other atoms:

- If an atom **loses** an electron, it now has more protons than electrons and becomes a **positive ion**.
- If an atom **gains** an electron, it now has more electrons than protons and becomes a **negative ion**.

## Electric Current at the Atomic Level

An **electric current** is a flow of electric charge. Current flows readily through **conductors** and with great difficulty (or not at all) through **insulators**.

### Conductors

Most conductors are metals — copper, silver, gold. Metallic atoms have less than a full complement of electrons in their outer shell, and those outer electrons are only loosely bound to the parent atom. These are called **free electrons**.

If a free electron leaves its atom, it carries its negative charge away, leaving behind a **positive ion**. The interior of a metal can therefore be pictured as a rigid framework (crystal lattice) of positive ions, through which a "cloud" of free electrons drifts randomly. In a neutral, unconnected piece of metal there is no *net* movement of electrons — the random drift cancels out.

When an external charge (e.g. a battery) is connected across the metal, the free electrons are all forced to drift in the same direction — toward the positive terminal — and this **ordered** movement of electrons is the electric current. Because the free electrons are already present throughout the conductor, current begins to flow at (almost) the instant the circuit is completed.

### Insulators

Non-metallic materials such as rubber, ceramics, glass and PVC have outer-shell electrons that are strongly bound to their parent atoms. With no free electrons available, these materials strongly oppose current flow and are called **insulators**.

### Semiconductors

Materials such as **silicon** and **germanium** fall between conductors and insulators. Normally they behave as insulators, but they can be made to conduct by the application of a voltage, and can be switched between conducting and non-conducting states hundreds of thousands of times per second. This switching behaviour is the foundation of the entire electronic age (diodes, transistors, integrated circuits).

| Material class | Outer-shell electrons | Conducting behaviour | Examples |
|-----------------|------------------------|------------------------|----------|
| Conductor | Loosely bound, free to move | Conducts readily | Copper, silver, gold |
| Insulator | Strongly bound | Effectively does not conduct | Rubber, ceramic, glass, PVC |
| Semiconductor | Intermediate | Switchable between insulating/conducting | Silicon, germanium |
        $cnt$,
        1
    ) RETURNING id INTO s1_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 03.2: Static Electricity, Conduction & Electrical Terminology
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m03_id, 'M03.2', 'Static Electricity, Conduction & Electrical Terminology',
        $cnt2$
# Static Electricity, Conduction & Electrical Terminology

## Static Electricity

**Static electricity** is electricity that is "standing still" — a voltage potential exists but there is no continuous electron flow. It arises from the attraction of unlike charges, classically demonstrated by rubbing a glass rod with silk: electrons are transferred from one material to the other, leaving one object positively charged and the other negatively charged.

### Coulomb's Law

The force between two point charges:
- Varies **inversely as the square of the distance** between them, and
- Varies **directly with the magnitude** (product) of the charges.

## Conduction Through Different Media

Electrical conduction can occur through solids, liquids, gases, and even a vacuum — though the mechanism differs in each case.

| Medium | Conduction mechanism | Typical example |
|--------|------------------------|-------------------|
| **Solid** | A potential difference applied across a conductor attracts/repels free electrons, which drift to equalise the potential | Current flowing along a metal bar |
| **Liquid** | A liquid that conducts is called an **electrolyte**; with two electrodes immersed and a PD applied, ions (not free electrons) flow through the liquid | An electrolytic cell |
| **Gas** | Gases are normally good insulators (dielectrics) — they have no free electrons — but a sufficiently high PD can strip electrons from gas molecules, ionising the gas and allowing conduction | A lightning strike |
| **Vacuum** | A vacuum is normally an excellent insulator (no charged particles present at all), but a heated metal electrode can release electrons into the vacuum by **thermionic emission**, which then move under the influence of an applied field | Cathode ray tube (CRT) |

## The Coulomb and the Ampere

A current of electricity is a flow of electrons. The practical unit of electrical *quantity* is the **Coulomb (C)**:

> **1 Coulomb = 6.28 × 10¹⁸ electrons**

This quantity of electricity is given the symbol **Q**, and it is used to define the **Ampere (A)**: when a current of 1 ampere flows, 1 coulomb of charge passes a given point every second.

**I = Q / t**

where I = current (amperes), Q = charge (coulombs), t = time (seconds).

A current of 1 ampere flowing for 1 hour transfers 3600 coulombs of charge — this quantity is also called 1 **ampere-hour**.

If two oppositely charged bodies are joined by a conductor, electrons flow from the negatively charged body to the positively charged body until both are equally charged. The difference in charge that drives this flow is the **potential difference (PD)**, measured in **Volts (V)**.

## Conventional Current vs Electron Current

- **Electron theory**: current is a flow of *electrons*, from the negative terminal, through the external circuit, to the positive terminal.
- **Conventional current theory** (the "hole theory", adopted before electrons were discovered): current is treated as a flow of *positive* charge, from the positive terminal to the negative terminal — the exact opposite direction to electron flow.

Both descriptions do the same amount of useful work and both are still used today. Aircraft DC circuit diagrams are conventionally drawn using **conventional current** flow, while electronic circuit analysis may use either convention depending on context.

## Electrical Terminology

| Term | Definition | Unit |
|------|------------|------|
| **Potential Difference (PD)** | The difference between the charge values, at atomic level, of two points in a material with free electrons | Volt (V) — "the difference of potential across a 1 ohm resistor carrying a current of 1 ampere" |
| **Electro-Motive Force (EMF)** | The ability (force) to cause a current to flow around a complete circuit | Volt (V) |
| **Voltage** | The general term used to express the value/quantity of a PD or an EMF | Volt (V) |
| **Current** | The flow, through a conductor, of electric charge (electrons) | Ampere (A) — 1 coulomb (6.28 × 10¹⁸ electrons) passing a point per second |
| **Resistance** | A material's opposition to the flow of current when an EMF is applied | Ohm (Ω) |
| **Conductance** | The reciprocal of resistance: G = 1/R | Siemen (S) |
| **Charge** | The state of imbalance of an atom (or body) that has gained or lost electrons | Coulomb (C) |

### EMF vs PD — the key distinction

- **EMF** is the *off-load* voltage — the force available to do work, measured with no current flowing.
- **PD** is the *on-load* voltage — the volts actually developed/dropped as a result of current flowing through a circuit or component.

### Current: DC and AC

- **Direct Current (DC)**: flows in one direction only.
- **Alternating Current (AC)**: continuously reverses direction.

Symbols: charge = **Q**, current = **I**.

### Resistance Formula

Resistance depends on the conductor's dimensions and material:

**R = ρl / a**

where:
- **R** = resistance (ohms, Ω)
- **ρ** (rho) = resistivity of the material (ohm-metres, Ω·m)
- **l** = length of the conductor (metres)
- **a** = cross-sectional area of the conductor (metres²)

A longer conductor has more resistance; a thicker (larger cross-section) conductor has less resistance.

### Charging

"Charging" a battery refers to the chemical changes produced within it by the displacement of electrons — restoring the imbalance of charge between its plates.
        $cnt2$,
        2
    ) RETURNING id INTO s2_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 03.3: Generation of Electricity & DC Sources: Batteries
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m03_id, 'M03.3', 'Generation of Electricity & DC Sources: Batteries',
        $cnt3$
# Generation of Electricity & DC Sources: Batteries

## Six Ways to Generate Electricity

| # | Method | Principle | Example |
|---|--------|-----------|---------|
| 1 | **Chemical Action** | Two dissimilar metals immersed in an electrolyte liquid form a **cell**; several cells grouped together form a **battery** | Dry cell, lead-acid battery |
| 2 | **Friction (Static Electricity)** | Rubbing two materials together transfers electrons from one to the other | Comb through hair; static charge build-up on aircraft in flight |
| 3 | **Pressure (Piezoelectric Effect)** | Certain crystals (notably quartz) produce a PD across opposite faces when mechanically deformed, and deform when a PD is applied | Crystal-controlled oscillators |
| 4 | **Light (Photovoltaic Effect)** | Light energy striking certain materials directly produces electricity | Solar panel battery chargers |
| 5 | **Heat (Thermoelectric/Seebeck Effect)** | A PD exists at the junction of two dissimilar metals, dependent on junction temperature; completing the circuit with a second junction at a different temperature drives current flow | Thermocouple |
| 6 | **Magnetism and Motion** | A conductor moving through a magnetic field (or vice versa) has an EMF induced in it | The generator (covered elsewhere in this Module) |

Aircraft build up a significant static charge in flight through friction with the air (method 2) — this is undesirable but unavoidable, and its effects are minimised through bonding and static dischargers.

## DC Sources of Electricity

There are three principal sources of stable DC supply: **batteries**, **thermocouples**, and **photocells**. This section covers batteries.

## Primary and Secondary Cells

| Cell type | Can be recharged? | Notes |
|-----------|--------------------|-------|
| **Primary cell** | No | The chemical reaction that produces the current is extremely difficult or impossible to reverse |
| **Secondary cell** | Yes | The chemical reaction is reversible, allowing repeated charge/discharge cycles |

### The Dry Primary Cell (Zinc-Carbon)

- **Positive pole (cathode)**: a carbon rod at the centre.
- **Negative pole (anode)**: the zinc casing itself, which also serves as the cell's container and connects to a steel disc at the base.
- **Electrolyte**: ammonium chloride (sal-ammoniac), mixed with wheat flour into a thick paste — hence "dry" cell (it does not contain free liquid).
- **EMF**: approximately **1.5 volts**.

Two disadvantages and their fixes:
1. **Polarisation** — hydrogen bubbles form around the carbon rod during discharge, increasing internal resistance. Fixed by adding manganese dioxide to the electrolyte to absorb the hydrogen.
2. **Case corrosion/leakage** — since the zinc casing itself is the negative electrode and container, it is prone to corroding and leaking. Fixed by thickening the electrolyte into a paste with wheat flour rather than leaving it as a free liquid.

## Secondary Cells (Batteries)

There are two types commonly used in aircraft: **lead-acid** and **alkaline**. Unlike the primary cell, the case material of a secondary cell plays no part in the electrochemical output.

### Lead-Acid Battery

**Construction:**
- Case: impact- and acid-resistant polystyrene compound, per cell, with moulded terminal post outlets.
- A vent valve in each cell allows gas to escape while preventing electrolyte leakage.
- Internal **positive** and **negative lead plates**.
- **Porous synthetic separators** between plates, to prevent internal short-circuits while allowing ion flow.
- **Electrolyte**: dilute sulphuric acid in water ("battery acid").
- Lead terminals.

**Electrolyte handling:** When making up electrolyte, **acid must always be added to water**, never the reverse — adding water to concentrated acid can cause a violent, explosive reaction.

**Specific gravity and voltage:**
- Fully charged specific gravity: **1.270**.
- Only **distilled water** should be used to top up cells — tap-water impurities shorten cell life.
- Immediately after charging, cell voltage may exceed **2.5 V**; after standing for about 1 hour it settles to around **2.2 V**.
- The **nominal voltage** of a lead-acid cell is **2 V**, and it remains close to this value for most of its discharge.
- A cell is considered **discharged** once its voltage falls to **1.8 V**.

**Capacity:**
The **capacity** of a cell is the quantity of electricity it can deliver, from a fully charged state at a specified discharge rate (amps), before its voltage drops from the nominal 2 V to the defined discharge end-point (1.8 V). Capacity is measured in **ampere-hours (Ah)**.

Factors affecting capacity:
- Area and number of plates.
- Strength (concentration) of the electrolyte.
- Temperature.

**Voltage behaviour under discharge:** at a small, steady current draw the cell voltage stays close to 2 V for a long period before falling away. At a larger current draw the voltage falls more rapidly and more linearly through the discharge. Because of this, **terminal voltage alone is not a reliable indicator of charge state** — the near-linear change in electrolyte **specific gravity** during charge/discharge is a much better indicator, and is measured using a **hydrometer**.

**Chemical action (lead-acid):**

| State | Positive plate | Negative plate | Electrolyte |
|-------|-----------------|------------------|-------------|
| Charged | PbO₂ (lead dioxide) | Pb (lead) | H₂SO₄ — strong solution |
| Discharged | PbSO₄ (lead sulphate) | PbSO₄ (lead sulphate) | H₂SO₄ — weak solution |

### Alkaline Batteries (Nickel-Cadmium)

Alkaline batteries are named after their plate metal; the most common type used in aircraft is **Nickel-Cadmium (NiCd)**.

- **Electrolyte**: potassium hydroxide, specific gravity **1.24 – 1.30** (typically quoted as 1.3).
- **EMF**: as low as **1.2 V** per cell, depending on cell size and material.
- Plates are formed on a woven wire mesh by heating: **cathode** from nickel salts, **anode** from cadmium salts.
- A **nylon cloth separator** plus a **cellophane gas barrier** separate the plates.

**Construction types:**

| Type | Construction | Behaviour |
|------|--------------|-----------|
| **Semi-sealed** | Steel container fitted with a safety valve | Low maintenance (periodic capacity checks only), but can be damaged by overcharging at a high rate, causing gas build-up, overheating, and risk of thermal meltdown |
| **Semi-open** | Similar construction, but deliberately allowed to "gas" to atmosphere during charging | Gassing helps with temperature control and can be used to monitor/switch the charger on and off by temperature; recharges faster than a semi-sealed cell, but needs more frequent electrolyte top-up per the aircraft manual |

**Chemical action (NiCd):**

| State | Positive plate | Negative plate | Electrolyte |
|-------|-----------------|------------------|-------------|
| Charged | Ni₂O₂ / Ni₃O₃ (nickel oxides) | Cd (cadmium) | KOH |
| Discharged | Ni(OH)₂ (nickel hydroxide) | Cd(OH)₂ (cadmium hydroxide) | KOH (specific gravity/structure unchanged — it acts purely as a conduction medium) |

Because the electrolyte's specific gravity does **not** change appreciably in a NiCd cell (unlike a lead-acid cell), specific gravity cannot be used to judge state of charge — instead, NiCd charge state is monitored via **temperature**.

## Connection of Cells and Batteries

Every cell has some **internal resistance**, determined by the plate material and cross-sectional area:
- Primary cells generally have **high** internal resistance.
- Secondary cells, with larger plate area, have **lower** internal resistance.

| Connection | Effect on voltage | Effect on current capacity | Effect on internal resistance | Requirement |
|------------|---------------------|-------------------------------|-------------------------------|-------------|
| **Series** | Cell voltages add (e.g. 6 × 2 V cells in series = 12 V EMF, open circuit) | Unchanged (limited by weakest cell) | Internal resistances add — high EMF but current output falls off under heavy load | All cells should have the **same ampere-hour rating** (the lowest-rated cell limits the whole string) |
| **Parallel** | Stays at the individual cell voltage | Currents add — greatly increases current capacity, and voltage stays more stable under load | Combined plate surface area reduces overall internal resistance | All cells must have the **same voltage rating** (the lowest-voltage cell sets the string's EMF); ampere-hour ratings need not match |
| **Series-Parallel** | Combines both benefits | High voltage **and** high current capacity | Lower overall internal resistance | Used where maximum power output is required |
        $cnt3$,
        3
    ) RETURNING id INTO s3_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 03.4: EMF, Internal Resistance, Thermocouples & Photocells
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m03_id, 'M03.4', 'EMF, Internal Resistance, Thermocouples & Photocells',
        $cnt4$
# EMF, Internal Resistance, Thermocouples & Photocells

## EMF, Terminal Voltage and Internal Resistance

Every battery (or other electrical source) has some **internal resistance**, arising mainly from the resistance of the electrolyte and the cross-sectional area of the plates.

- With **no load connected** (switch open), a voltmeter across the terminals reads the source's **EMF** — the full off-load voltage.
- With a **load connected** (switch closed), current flows through the internal resistance as well as the external circuit. This produces a voltage drop across the internal resistance, so the voltmeter now reads the **terminal voltage (PD)** — which is *lower* than the EMF.

If the internal resistance is constant, the fall in terminal voltage is **proportional to the load current**: the larger the current drawn, the larger the internal voltage drop, and the lower the terminal voltage available to the external circuit.

**V(terminal) = EMF − (I × R(internal))**

## Thermoelectricity and Thermocouples

A **thermocouple** is one of the simplest temperature sensors available: two wires of dissimilar metals are joined together near the point where temperature is to be measured. This junction produces a small voltage — **thermoelectricity** — that can be measured between the free ends of the two wires. This voltage-from-heat phenomenon is the **Seebeck effect**, and it is the same underlying principle described in the "generation by heat" method above.

Common thermocouple metals include: aluminium, chromium, copper, magnesium, molybdenum, nickel, platinum, rhenium, rhodium, silicon and tungsten (used in various dissimilar-metal pairings).

### Thermocouple Theory

A thermocouple circuit always contains **at least two junctions**:
1. The **measurement junction** — at the point where temperature is being sensed.
2. The **reference junction** — where the thermocouple wires connect to the measuring instrument (traditionally made of copper).

The voltage output relates to the **temperature difference** between the measurement junction and the reference junction — not to the absolute temperature of the measurement junction alone.

Traditionally the reference junction was held at a fixed, known temperature (0 °C) using an ice bath. Modern instruments instead use **reference junction compensation**: the reference junction's own temperature is measured (e.g. with a thermistor) and a correcting voltage is applied before the signal is scaled to a temperature reading. This compensation can be implemented electrically, but is more commonly (and more accurately) done **mathematically in software**, which also corrects for the small non-linearity common to all thermocouple types.

### Advantages and Disadvantages

| Advantages | Disadvantages |
|------------|-----------------|
| Rugged construction | Relatively low output signal |
| Immune to shock and vibration | Non-linear output — needs a sensitive, stable measuring device |
| Wide temperature range | Requires reference junction compensation and linearisation |
| Simple to manufacture | Low signal level demands care to minimise electrical noise during installation |
| No excitation power required | |
| No self-heating | |
| Can be made very small | |

### Thermocouple Construction Types

All four common construction types use a stainless steel or Inconel sheath, insulated internally with mineral oxides:

| Type | Construction | Typical time constant | Notes |
|------|---------------|--------------------------|-------|
| **Sealed and isolated from sheath** | Junction fully enclosed and electrically isolated from the outer sheath | ~75 seconds | Trouble-free but the slowest to respond |
| **Sealed and grounded to sheath** | Junction enclosed and bonded electrically to the sheath | ~40 seconds | Reasonable response, but can introduce ground loops/electrical noise |
| **Exposed bead** | Junction bead protrudes from the insulating sheath | ~15 seconds | Faster response, but lacks mechanical/chemical protection and electrical isolation; the porous mineral-oxide insulation must be sealed |
| **Exposed fast-response** | Junction protrudes with light, minimal construction (fine-gauge wire) | ~2 seconds (as low as 10–100 ms with very fine wire) | Fastest response but the most prone to physical damage |

## Photocells (Photovoltaic Cells)

A **photovoltaic (PV) cell**, or solar cell, converts photons of light directly into electricity — a virtually limitless and environmentally friendly energy source.

### Solar Cell Structure

Working from the outer (light-facing) surface inward, a typical solar cell is layered as:

1. **Encapsulate** — protective outer covering.
2. **Contact grid** — metal grid on the surface that collects current; must be large enough to efficiently collect electrons yet cover the minimum surface area needed, since the metal is opaque and blocks photons from reaching the silicon beneath it.
3. **Antireflective (AR) coating** — reduces reflection and channels photons down into the active silicon layers.
4. **N-type silicon** — the upper active semiconductor layer.
5. **P-type silicon** — the lower active semiconductor layer.

### The Photoelectric Effect

A photon passes through the encapsulate and antireflective coating and strikes the silicon (or is lost if it strikes the opaque contact grid). If the photon has enough energy, it transfers that energy to a valence electron in the n-type silicon layer, freeing the electron from its atom and leaving behind a **hole**.

- In the **n-type** layer: free **electrons** are the **majority carriers**; holes are the **minority carriers** (both types remain mobile).
- In the **p-type** layer: **holes** are the **majority carriers**; electrons are the **minority carriers** (both types remain mobile).

### The pn-Junction and Depletion Zone

The **pn-junction** is the region where the n-type and p-type silicon layers meet.
- The p-type side has an excess of holes (positive charge carriers).
- The n-type side has an excess of electrons (negative charge carriers).

When the two layers are placed in contact, current flows readily across the junction in one direction (**forward biased**) but is blocked in the other (**reverse biased**) — the junction behaves like a one-way valve for charge.

In darkness (no illumination), some of the extra valence electrons on the n-type side migrate across the junction into the p-type side, filling holes there. This creates a **depletion zone** at the junction — a region containing no mobile positive or negative charge carriers, which acts as a barrier preventing further charge from crossing.

### Generating Current

When photons strike the cell and free electrons in the n-type layer, those electrons try to cross the junction to unite with holes on the p-type side. Because the pn-junction only allows movement in one direction, if an **external conductive path** is provided between the cell's front and back contacts, the freed electrons instead flow out through this external path and back around to the p-type side, where they recombine with holes.

- This ordered flow of electrons through the external circuit is the **current (I)**.
- The cell's internal electric field (set up at the pn-junction) produces the **voltage (V)**.
- **Current × Voltage = Power (P)**.

When an external load (e.g. an electric lamp) is connected between the front and back contacts, the flow of electricity through the cell does useful work in that load.
        $cnt4$,
        4
    ) RETURNING id INTO s4_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M03.1 Electron Theory & Structure of Matter (13 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s1_id, 'Approximately how many elements occur naturally?',
     '[{"id":"a","text":"29","correct":false},{"id":"b","text":"92","correct":true},{"id":"c","text":"118","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'The smallest part of an element or compound that normally exists in a free state is called:',
     '[{"id":"a","text":"An atom","correct":false},{"id":"b","text":"A molecule","correct":true},{"id":"c","text":"An ion","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'Which of the three basic atomic particles carries a negative charge?',
     '[{"id":"a","text":"Proton","correct":false},{"id":"b","text":"Neutron","correct":false},{"id":"c","text":"Electron","correct":true}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'Which element''s atom contains no neutrons?',
     '[{"id":"a","text":"Hydrogen","correct":true},{"id":"b","text":"Helium","correct":false},{"id":"c","text":"Carbon","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'An atom is described as electrically neutral when:',
     '[{"id":"a","text":"It has no neutrons","correct":false},{"id":"b","text":"The number of electrons equals the number of protons","correct":true},{"id":"c","text":"It has lost a valency electron","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'Working outward from the nucleus, what is the maximum number of electrons the K shell can hold?',
     '[{"id":"a","text":"2","correct":true},{"id":"b","text":"8","correct":false},{"id":"c","text":"18","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'Copper has 29 protons and 29 electrons. How are these electrons arranged in shells?',
     '[{"id":"a","text":"K2, L8, M18, N1","correct":true},{"id":"b","text":"K2, L8, M19","correct":false},{"id":"c","text":"K8, L8, M8, N5","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'Electrons in the outermost shell of an atom, which are shared when atoms combine, are called:',
     '[{"id":"a","text":"Free electrons","correct":false},{"id":"b","text":"Valency electrons","correct":true},{"id":"c","text":"Reference electrons","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'An atom that has LOST an electron becomes:',
     '[{"id":"a","text":"A negative ion","correct":false},{"id":"b","text":"A positive ion","correct":true},{"id":"c","text":"Electrically neutral","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'In a piece of metal conductor, the interior can be visualised as:',
     '[{"id":"a","text":"A crystal lattice of positive ions through which free electrons drift","correct":true},{"id":"b","text":"A vacuum containing only protons","correct":false},{"id":"c","text":"A fixed arrangement of neutrons with no mobile charge","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'Materials such as rubber, ceramics, glass and PVC are classed as:',
     '[{"id":"a","text":"Conductors","correct":false},{"id":"b","text":"Insulators","correct":true},{"id":"c","text":"Semiconductors","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'Silicon and germanium are examples of:',
     '[{"id":"a","text":"Insulators","correct":false},{"id":"b","text":"Conductors","correct":false},{"id":"c","text":"Semiconductors","correct":true}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'Most good electrical conductors (e.g. copper, silver, gold) share which characteristic at the atomic level?',
     '[{"id":"a","text":"A full complement of electrons in the outer shell","correct":false},{"id":"b","text":"Loosely bound free electrons in the outer shell","correct":true},{"id":"c","text":"No electrons at all in the outer shell","correct":false}]',
     '{"B1.1","B1.3","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M03.2 Static Electricity, Conduction & Electrical Terminology (14 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s2_id, 'According to Coulomb''s Law, the force between two point charges:',
     '[{"id":"a","text":"Varies directly with distance and inversely with charge","correct":false},{"id":"b","text":"Varies inversely as the square of the distance and directly with the magnitude of charge","correct":true},{"id":"c","text":"Is independent of both distance and charge magnitude","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'A liquid that conducts electricity via the movement of ions is called:',
     '[{"id":"a","text":"A dielectric","correct":false},{"id":"b","text":"An electrolyte","correct":true},{"id":"c","text":"A semiconductor","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'A gas normally acts as a good insulator because:',
     '[{"id":"a","text":"It has no free electrons available for conduction","correct":true},{"id":"b","text":"It always contains excess positive ions","correct":false},{"id":"c","text":"Its molecules are too heavy to move","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'A vacuum can be made to conduct electricity by:',
     '[{"id":"a","text":"Cooling it to near absolute zero","correct":false},{"id":"b","text":"Thermionic emission from a heated electrode","correct":true},{"id":"c","text":"Increasing the ambient air pressure","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'One Coulomb is equal to approximately:',
     '[{"id":"a","text":"6.28 x 10^15 electrons","correct":false},{"id":"b","text":"6.28 x 10^18 electrons","correct":true},{"id":"c","text":"6.28 x 10^21 electrons","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'A current of 1 ampere flowing for 1 hour represents a charge of:',
     '[{"id":"a","text":"60 coulombs","correct":false},{"id":"b","text":"3600 coulombs","correct":true},{"id":"c","text":"6.28 x 10^18 coulombs","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'In conventional current theory, current is treated as flowing:',
     '[{"id":"a","text":"From negative to positive","correct":false},{"id":"b","text":"From positive to negative","correct":true},{"id":"c","text":"Equally in both directions simultaneously","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'Electro-Motive Force (EMF) is best described as:',
     '[{"id":"a","text":"The on-load volt drop across a resistor","correct":false},{"id":"b","text":"The ability to cause current to flow around a complete circuit","correct":true},{"id":"c","text":"The reciprocal of resistance","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'What is the key difference between EMF and Potential Difference (PD)?',
     '[{"id":"a","text":"EMF is measured on-load, PD is measured off-load","correct":false},{"id":"b","text":"EMF is the off-load voltage, PD is the on-load voltage","correct":true},{"id":"c","text":"There is no difference; the terms are interchangeable in all cases","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'Conductance is defined as:',
     '[{"id":"a","text":"The product of resistance and current","correct":false},{"id":"b","text":"The reciprocal of resistance","correct":true},{"id":"c","text":"The reciprocal of voltage","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'The unit of conductance is the:',
     '[{"id":"a","text":"Ohm","correct":false},{"id":"b","text":"Coulomb","correct":false},{"id":"c","text":"Siemen","correct":true}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'Using the formula R = ρl/a, if the length (l) of a conductor is doubled and all else stays the same, resistance will:',
     '[{"id":"a","text":"Halve","correct":false},{"id":"b","text":"Double","correct":true},{"id":"c","text":"Stay the same","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'In the formula R = ρl/a, the symbol ρ (rho) represents:',
     '[{"id":"a","text":"The cross-sectional area of the conductor","correct":false},{"id":"b","text":"The resistivity of the material","correct":true},{"id":"c","text":"The current flowing through the conductor","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'Which statement about DC and AC current is correct?',
     '[{"id":"a","text":"DC flows in one direction only; AC continuously reverses direction","correct":true},{"id":"b","text":"AC flows in one direction only; DC continuously reverses direction","correct":false},{"id":"c","text":"Both DC and AC continuously reverse direction","correct":false}]',
     '{"B1.1","B1.3","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M03.3 Generation of Electricity & DC Sources: Batteries (14 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s3_id, 'The piezoelectric effect, used in crystal-controlled oscillators, generates electricity by which method?',
     '[{"id":"a","text":"Heat","correct":false},{"id":"b","text":"Pressure (mechanical deformation of a crystal)","correct":true},{"id":"c","text":"Light","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'A thermocouple generates electricity by which of the six basic methods?',
     '[{"id":"a","text":"Friction","correct":false},{"id":"b","text":"Heat","correct":true},{"id":"c","text":"Magnetism and motion","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'A primary cell is one that:',
     '[{"id":"a","text":"Can be recharged indefinitely","correct":false},{"id":"b","text":"Cannot be recharged because its chemical reaction is very difficult or impossible to reverse","correct":true},{"id":"c","text":"Uses only alkaline electrolyte","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'In a dry (zinc-carbon) primary cell, the positive pole (cathode) is:',
     '[{"id":"a","text":"The zinc casing","correct":false},{"id":"b","text":"The carbon rod","correct":true},{"id":"c","text":"The steel base disc","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'Polarisation in a dry cell (hydrogen bubbles forming around the carbon rod) is overcome by:',
     '[{"id":"a","text":"Adding manganese dioxide to the electrolyte","correct":true},{"id":"b","text":"Increasing the zinc casing thickness","correct":false},{"id":"c","text":"Using distilled water as the electrolyte","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'The nominal EMF of a dry (zinc-carbon) cell is approximately:',
     '[{"id":"a","text":"1.2 V","correct":false},{"id":"b","text":"1.5 V","correct":true},{"id":"c","text":"2.0 V","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'The specific gravity of a fully charged lead-acid cell electrolyte is approximately:',
     '[{"id":"a","text":"1.030","correct":false},{"id":"b","text":"1.270","correct":true},{"id":"c","text":"1.700","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'When preparing lead-acid battery electrolyte, the correct and safe procedure is to:',
     '[{"id":"a","text":"Add water to acid","correct":false},{"id":"b","text":"Add acid to water","correct":true},{"id":"c","text":"Mix acid and water simultaneously from separate containers","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'A lead-acid cell is considered discharged once its voltage falls to approximately:',
     '[{"id":"a","text":"1.8 V","correct":true},{"id":"b","text":"2.0 V","correct":false},{"id":"c","text":"2.2 V","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'In a fully charged lead-acid cell, the positive plate material is:',
     '[{"id":"a","text":"Pb (lead)","correct":false},{"id":"b","text":"PbO2 (lead dioxide)","correct":true},{"id":"c","text":"PbSO4 (lead sulphate)","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'The best indicator of a lead-acid battery''s state of charge is:',
     '[{"id":"a","text":"Terminal voltage alone","correct":false},{"id":"b","text":"Specific gravity of the electrolyte, measured with a hydrometer","correct":true},{"id":"c","text":"The colour of the plates","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'The electrolyte used in a nickel-cadmium (alkaline) battery is:',
     '[{"id":"a","text":"Dilute sulphuric acid","correct":false},{"id":"b","text":"Potassium hydroxide","correct":true},{"id":"c","text":"Ammonium chloride","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'In a NiCd battery, the state of charge is best determined by monitoring:',
     '[{"id":"a","text":"Electrolyte specific gravity","correct":false},{"id":"b","text":"Temperature","correct":true},{"id":"c","text":"Plate colour change","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'When cells are connected in PARALLEL to form a battery, which statement is correct?',
     '[{"id":"a","text":"Voltages add together while current capacity stays the same","correct":false},{"id":"b","text":"Currents add together, greatly improving current capacity, while voltage remains at the individual cell value","correct":true},{"id":"c","text":"Both voltage and internal resistance add together","correct":false}]',
     '{"B1.1","B1.3","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M03.4 EMF, Internal Resistance, Thermocouples & Photocells (12 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s4_id, 'With a battery''s switch open (no load connected), a voltmeter across its terminals reads:',
     '[{"id":"a","text":"Zero volts","correct":false},{"id":"b","text":"The EMF (off-load voltage)","correct":true},{"id":"c","text":"The short-circuit current","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s4_id, 'When a load is connected to a battery, the terminal voltage falls below the EMF because:',
     '[{"id":"a","text":"Current flowing through the internal resistance causes a volt drop","correct":true},{"id":"b","text":"The chemical reaction reverses instantly","correct":false},{"id":"c","text":"The electrolyte specific gravity increases under load","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s4_id, 'The voltage produced at the junction of two dissimilar metals due to temperature is known as the:',
     '[{"id":"a","text":"Photoelectric effect","correct":false},{"id":"b","text":"Seebeck effect","correct":true},{"id":"c","text":"Piezoelectric effect","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s4_id, 'A thermocouple circuit requires at least two junctions because:',
     '[{"id":"a","text":"The output relates to the temperature difference between the measurement junction and the reference junction","correct":true},{"id":"b","text":"A single junction produces alternating current only","correct":false},{"id":"c","text":"Two junctions are required purely for mechanical strength","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s4_id, 'Modern thermocouple instruments correct for reference junction temperature using:',
     '[{"id":"a","text":"An ice bath only, with no other correction","correct":false},{"id":"b","text":"Reference junction compensation, typically applied mathematically in software","correct":true},{"id":"c","text":"A second thermocouple wired in reverse polarity","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s4_id, 'Which thermocouple construction type typically has the SLOWEST response (longest time constant, ~75 seconds)?',
     '[{"id":"a","text":"Exposed fast response","correct":false},{"id":"b","text":"Sealed and isolated from sheath","correct":true},{"id":"c","text":"Exposed bead","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s4_id, 'Which thermocouple construction type typically has the FASTEST response, with a time constant as low as 2 seconds?',
     '[{"id":"a","text":"Sealed and grounded to sheath","correct":false},{"id":"b","text":"Sealed and isolated from sheath","correct":false},{"id":"c","text":"Exposed fast response","correct":true}]',
     '{"B1.1","B1.3","B2"}'),

    (s4_id, 'A disadvantage of the sealed-and-grounded-to-sheath thermocouple construction is that it:',
     '[{"id":"a","text":"Can introduce ground loops and electrical noise","correct":true},{"id":"b","text":"Cannot survive vibration","correct":false},{"id":"c","text":"Produces no measurable output signal","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s4_id, 'In a solar cell, the metal contact grid on the light-facing surface must be sized to balance:',
     '[{"id":"a","text":"Weight versus cost","correct":false},{"id":"b","text":"Collecting current efficiently versus allowing maximum photon penetration to the silicon","correct":true},{"id":"c","text":"Heat dissipation versus electrical isolation","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s4_id, 'In the n-type layer of a photovoltaic cell, the majority charge carriers are:',
     '[{"id":"a","text":"Holes","correct":false},{"id":"b","text":"Free electrons","correct":true},{"id":"c","text":"Protons","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s4_id, 'The depletion zone at a pn-junction is best described as a region that:',
     '[{"id":"a","text":"Contains a high concentration of free electrons only","correct":false},{"id":"b","text":"Contains no mobile positive or negative charge carriers and blocks further charge movement","correct":true},{"id":"c","text":"Only forms when the cell is illuminated","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s4_id, 'When light strikes a photovoltaic cell and an external load is connected, the flow of electrons through the external circuit represents:',
     '[{"id":"a","text":"Voltage","correct":false},{"id":"b","text":"Current","correct":true},{"id":"c","text":"Resistance","correct":false}]',
     '{"B1.1","B1.3","B2"}');

END $$;
