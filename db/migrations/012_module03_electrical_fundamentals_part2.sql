-- Module 03: Electrical Fundamentals — DC Circuits, Resistance, Power, Capacitance
-- Source: EASA Part-66 Module 03 official textbook (Sections 3.6–3.9)
-- Scope: Sub-Modules M03.5 – M03.8

DO $$
DECLARE
    m03_id INT;
    s5_id  INT;
    s6_id  INT;
    s7_id  INT;
    s8_id  INT;
BEGIN
    SELECT id INTO m03_id FROM easa_modules WHERE code = 'M03';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M03.5') THEN
        RAISE NOTICE 'M03.5 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 03.5: DC Circuits — Ohm's Law, Series & Parallel
    -- Resistance, Kirchhoff's Laws
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m03_id, 'M03.5', 'DC Circuits: Ohm''s Law, Series & Parallel Resistance, Kirchhoff''s Laws',
        $cnt5$
# DC Circuits: Ohm's Law, Series & Parallel Resistance, Kirchhoff's Laws

## Ohm's Law

Ohm's Law describes the fundamental relationship between voltage, current, and resistance in an electrical circuit. It is named after the German physicist Georg Ohm.

The **volt** is formally defined as: *the potential difference between two points in a circuit having a resistance of 1 ohm between them and carrying a current of 1 ampere, provided the temperature remains constant.*

Ohm's Law can be written in three equivalent forms:

| Form | Used to find |
|------|--------------|
| **V = I × R** | Voltage, when current and resistance are known |
| **I = V / R** | Current, when voltage and resistance are known |
| **R = V / I** | Resistance, when voltage and current are known |

### The Ohm's Law Triangle

A simple memory aid is to arrange V, I and R in a triangle with **V at the top (apex)**, and I and R side by side underneath. To find any one quantity, cover it with a finger — the triangle shows the other two either multiplied together (side by side) or divided (one above the other):

```
        V
       ---
      I | R
```

- Cover **V** → left with **I × R**
- Cover **I** → left with **V / R**
- Cover **R** → left with **V / I**

V always sits at the apex, regardless of where I and R are placed.

### Worked Example

A current of 10 amperes flows through a resistance of 5 ohms. Find the potential difference (voltage).

> V = I × R = 10 × 5 = **50 volts**

### Statement of Ohm's Law

*"In a uniform wire, at a constant temperature, the current flowing will be directly proportional to the voltage applied, and inversely proportional to the resistance."*

## Voltage

Voltage (electromotive force, EMF) is the electrical force that pushes electrons through a conductor — it is the "electrical pressure" of a circuit. The greater the difference in electrical potential between two points, the greater the voltage.

- **Measured with**: a **voltmeter**, connected **across** (in parallel with) the component or circuit being measured.
- Voltage can exist between two points even when no current is flowing (an open circuit still has a measurable potential difference).

**Units of voltage:**

| Unit | Symbol | Multiplier |
|------|--------|-----------|
| Millivolt | mV | ×0.001 |
| Volt (base unit) | V | ×1 |
| Kilovolt | kV | ×1,000 |

## Resistance

Resistance is the property of a circuit that opposes and reduces the flow of electrons. The higher the resistance, the lower the current flow for a given voltage; the lower the resistance, the higher the current flow.

- **Measured with**: an **ohmmeter**. Important safety note — no voltage may be applied to a circuit while an ohmmeter is connected, or the meter will be damaged.
- Analogy: resistance is like the constriction placed on a garden hose — the tighter the constriction, the less water (current) flows for the same pressure (voltage).

**Units of resistance:**

| Unit | Symbol | Multiplier |
|------|--------|-----------|
| Ohm (base unit) | Ω | ×1 |
| Kilohm | KΩ | ×1,000 |
| Megohm | MΩ | ×1,000,000 |

**Factors that affect resistance:**
- **Length** of the conductor — a longer conductor has higher resistance
- **Diameter** of the conductor — a narrower conductor has higher resistance
- **Temperature** — most materials increase in resistance as temperature increases
- **Physical damage** — nicks, corrosion, and cracks increase resistance
- **Type of material** — different materials have different inherent resistive properties

## Current (Amperes)

Current is the rate of flow of electrons past a point in a circuit, measured in amperes. A higher applied voltage produces a higher current; a lower voltage produces a lower current.

- **Measured with**: an **ammeter**, connected **in series** (in-line) with the circuit, so that all the current being measured must flow through the meter.

**Units of current:**

| Unit | Symbol | Multiplier |
|------|--------|-----------|
| Microamp | µA | ×0.000001 |
| Milliamp | mA | ×0.001 |
| Amp (base unit) | A | ×1 |

**Effects of current flow:**
- **Heat generation** — higher current produces more heat (e.g., a light bulb filament glowing)
- **Electromagnetism** — higher current produces a stronger magnetic field (used in alternators and ignition systems)

## Multiples and Sub-Multiples

Electrical quantities span an enormous range, so standard prefixes are used to keep numbers manageable:

| Prefix | Symbol | Multiplier |
|--------|--------|-----------|
| Tera | T | ×10¹² |
| Giga | G | ×10⁹ |
| Mega | M | ×10⁶ |
| Kilo | k | ×10³ |
| *(base unit)* | — | ×10⁰ |
| Milli | m | ×10⁻³ |
| Micro | µ | ×10⁻⁶ |
| Nano | n | ×10⁻⁹ |
| Pico | p | ×10⁻¹² |

**Examples:** 1 mA = 0.001 A, so in an Ohm's Law equation 35 mA is written as 35 × 10⁻³ A. Similarly, 5 kV is written as 5 × 10³ V.

**Worked examples using I = V/R:**
- I = V/R = 12/6 = **2 amps**
- V = I × R = 4 × 3 = **12 volts**
- R = V/I = 12/3 = **4 ohms**

## Resistance in a Series Circuit

In a series circuit, components are connected end-to-end, forming a single path for current.

If a circuit has an applied voltage of 24 V and a measured current of 2 A, the total circuit resistance is:

> Rt = V / I = 24 / 2 = **12 Ω**

If this total resistance is made up of three resistors — R1 = 2 Ω, R2 = 4 Ω, R3 = 6 Ω — their sum equals the total resistance:

> **Rt = R1 + R2 + R3 = 2 + 4 + 6 = 12 Ω**

Since the same 2 A flows through every resistor in series, the voltage drop across each can be found with Ohm's Law:

| Resistor | Value | Voltage drop (V = I × R) |
|----------|-------|---------------------------|
| R1 | 2 Ω | 2 × 2 = 4 V |
| R2 | 4 Ω | 2 × 4 = 8 V |
| R3 | 6 Ω | 2 × 6 = 12 V |
| **Total** | **12 Ω** | **24 V** |

**Key rules for series circuits:**
- Total resistance = the **sum** of all individual resistances: **Rt = R1 + R2 + R3 + …**
- The sum of the individual voltage drops always equals the applied (supply) voltage
- The potential difference progressively decreases from the supply voltage down to zero as you move around the circuit
- **Current is the same at every point** in a series circuit

## Resistance in a Parallel Circuit

In a parallel circuit, components are connected across common points, so there are multiple paths for current, and each branch experiences the full supply voltage.

If the supply voltage is 12 V across three parallel resistors, R1 = 3 Ω, R2 = 12 Ω, R3 = 4 Ω, the current in each branch (by Ohm's Law) is:

| Resistor | Value | Current (I = V/R) |
|----------|-------|-------------------|
| R1 | 3 Ω | 12/3 = 4 A |
| R2 | 12 Ω | 12/12 = 1 A |
| R3 | 4 Ω | 12/4 = 3 A |

The **total current** is the sum of the branch currents:

> It = I1 + I2 + I3 = 4 + 1 + 3 = **8 A**

Since It = V/Rt, dividing through by V gives the reciprocal formula for total resistance:

> **1/Rt = 1/R1 + 1/R2 + 1/R3**

### Worked Example

R1 = 3 Ω, R2 = 12 Ω, R3 = 4 Ω:

> 1/Rt = 1/3 + 1/12 + 1/4 = 4/12 + 1/12 + 3/12 = 8/12
>
> Rt = 12/8 = **1.5 Ω**

Check: Rt = V/It = 12/8 = **1.5 Ω** ✓ — confirms the calculation.

**Key rules for parallel circuits:**
- The **voltage is the same** across every branch (equal to the supply voltage)
- The **total current is the sum** of the individual branch currents
- Total resistance is always **less** than the smallest individual resistor
- At any junction, the current flowing in equals the current flowing out (e.g., the 8 A leaving the supply splits into 4 A + 1 A + 3 A across the three branches, and recombines to 8 A on the return path)

## Kirchhoff's Laws

Gustav Kirchhoff formalised the two relationships observed above into two general laws that apply to any DC circuit:

### Kirchhoff's Voltage Law (KVL)

*"The voltage drops in a series circuit will always equal the voltage applied — the sum of the potential differences (p.d.s) around a closed loop equals the EMF."*

In other words, energy is conserved: everything the source supplies is accounted for by the drops across the components.

### Kirchhoff's Current Law (KCL)

*"The algebraic sum of the currents at a junction will always be zero."*

In other words, the total current flowing **into** a junction must equal the total current flowing **out** of it — current cannot accumulate or disappear at a junction.

Together, KVL and KCL are the foundation for analysing more complex circuits that cannot be reduced to simple series or parallel combinations.
        $cnt5$,
        5
    ) RETURNING id INTO s5_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 03.6: Resistance & Resistors — Colour Coding,
    -- Types, Wheatstone Bridge
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m03_id, 'M03.6', 'Resistance & Resistors: Colour Coding, Types, Wheatstone Bridge',
        $cnt6$
# Resistance & Resistors: Colour Coding, Types, Wheatstone Bridge

## What Determines Resistance?

The current that flows in a circuit depends not only on the applied voltage but also on the resistance of the conductor. Three physical factors govern the resistance of a conductor:

| Factor | Symbol | Relationship |
|--------|--------|-------------|
| Material (specific resistance / resistivity) | ρ (rho) | Resistance is **directly proportional** to ρ |
| Length | l | Resistance is **directly proportional** to length |
| Cross-sectional area | a | Resistance is **inversely proportional** to area |

Combining these three factors gives the resistance formula:

> **R = ρl / a** (ohms)

Where l is in metres, a is in square metres, and ρ (found from material tables) is in ohm-metres.

### Worked Example

If the length of a conductor is doubled **and** its cross-sectional area is halved, what happens to its resistance?

> Doubling l multiplies R by 2. Halving a multiplies R by another 2 (since R ∝ 1/a).
> Combined effect: R is multiplied by 2 × 2 = **4 — the resistance quadruples.**

Two common resistor materials are used in practice: **carbon composition** and **special resistance wire** wound onto a ceramic former. A wire-wound resistor can be made physically larger to handle high current — its **physical size indicates its heat-dissipation capability, not its resistance value**. Wire-wound resistors typically have their ohmic value printed directly in numbers, while carbon resistors use a colour code.

## Effect of Temperature on Resistance

Temperature has a significant effect on resistance. A classic illustration is a tungsten filament lamp (e.g., 240 V, 100 W): its resistance when cold is roughly **10 times lower** than its resistance at normal operating temperature.

| Material type | Effect of rising temperature | Called |
|----------------|-------------------------------|--------|
| Pure metals (copper, iron, tungsten) | Resistance **increases** | **Positive** temperature coefficient |
| Carbon, electrolytes, insulating materials (rubber, paper, semiconductors) | Resistance **decreases** | **Negative** temperature coefficient |
| Certain alloys (e.g., manganin — copper + manganese + nickel) | Resistance stays **practically constant** over a wide range | Near-zero temperature coefficient |

### Temperature Coefficient of Resistance (α)

The resistance of copper wire increases uniformly with temperature. If the resistance at 0 °C is taken as 1 Ω, it rises to 1.426 Ω at 100 °C — an increase of 0.426 Ω over 100 °C, or **0.00426 Ω per °C rise**.

This ratio — the increase in resistance per degree rise, relative to the resistance at a standard temperature — is the **temperature coefficient of resistance**, symbol **α** (alpha).

For a material with resistance R0 at 0 °C and temperature coefficient α0 at 0 °C:
- Increase in resistance for a 1 °C rise = R0α0
- Increase in resistance for a rise to temperature t = R0α0t

> **Rt = R0 + R0α0t = R0(1 + α0t)**

For annealed copper (α0 = 0.00426): **Rt = R0(1 + 0.00426t)**

### Worked Example

A copper wire has R0 = 1 Ω at 0 °C. What is its resistance at 100 °C?

> Rt = R0(1 + α0t) = 1 × (1 + 0.00426 × 100) = 1 × (1 + 0.426) = **1.426 Ω**

## Specific Resistance and Conductance

**Specific resistance (resistivity, ρ)** is the resistance offered by a standard cube of a material at 0 °C — it is a way of comparing the resistive properties of different materials, from which the resistance of any non-uniform conductor made of that material can be calculated (via R = ρl/a).

**Conductance (G)** is the reciprocal of resistance: **G = 1/R**, measured in **siemens (S)**.

## Resistor Colour Coding

The most common way of marking a fixed resistor's value is a series of coloured bands around its body, which encode:

1. **Value** (significant digits)
2. **Multiplier**
3. **Tolerance**
4. **Reliability** (optional, on some military-spec resistors)

**Preferred values**: to keep manufacturing costs down, resistors are only made in a standard range of "preferred values." If a specific value outside this range is required, it can be built up from a network of preferred-value resistors connected in series, parallel, or series-parallel.

### Colour Code Examples

| Bands | Reading | Value |
|-------|---------|-------|
| Yellow, Violet, Orange, Gold (4-band) | 47 × 10³, ±5% | **47 kΩ ±5%** |
| Yellow, Violet, Black, Red, Gold (5-band) | 470 × 10², ±5% | **47 kΩ ±5%** |

(Both examples above represent the same resistance value — the 5-band code simply gives one extra significant digit of precision.)

### Tolerance in Practice

A 47 kΩ resistor with a ±10% tolerance could actually measure anywhere within:

> Maximum: 47,000 + 4,700 = **51,700 Ω**
> Minimum: 47,000 − 4,700 = **42,300 Ω**

Despite this individual tolerance, resistor **networks** (series/parallel combinations) can achieve very accurate overall resistance values, because tolerances partially average out across multiple components.

**Resistor networks in series-parallel**: when analysing a network, it is essential to correctly identify which components are truly in series and which are in parallel branches — any point shared by two or more current paths breaks the simple "series" relationship at that point. The standard approach: find the total resistance RT first (starting with branches furthest from the source and working back toward the supply), then find the total current with IT = VT/RT.

## The Wheatstone Bridge

The Wheatstone Bridge is a series-parallel arrangement of four resistors used to measure an unknown resistance very accurately. It consists of two potential dividers connected between a supply potential and ground:

- One divider: resistors **RB** and **RC**
- The other divider: the **unknown resistor RX** and a known resistor **RA**

The voltage at the midpoint of each divider varies with the resistor values. When the two midpoint voltages are equal, there is **no potential difference across the bridge output** — the bridge is said to be **balanced**. Balance is achieved by adjusting the variable resistor RC until a galvanometer connected across the bridge output reads zero.

**Balance condition:**

> **RX = (RA × RB) / RC**  — equivalently, RX/RA = RB/RC

### Worked Example

RA = 25 kΩ, RB = 5 kΩ, RC = 20 kΩ. Find RX at balance.

> RX = (RA × RB) / RC = (25 × 5) / 20 = 125 / 20 = **6.25 kΩ**

## Fixed Resistors — Three General Types

| Type | Construction | Ohmic value marking | Typical range | Characteristics |
|------|--------------|---------------------|----------------|-----------------|
| **Wire wound** | Resistance wire wound on an insulating rod (usually porcelain), covered with insulation (e.g., epoxy) | Usually printed directly in numbers | Low ohmic value, high wattage | Excellent heat dissipation; used for controlling large currents; physical size indicates power rating, not resistance |
| **Composition** | Granulated carbon mixed with a powdered resin binder, fused together; wire leads at each end | Colour code | <10 Ω to >20 MΩ | Inexpensive, low power dissipation, common in low-current electronic circuits; small size |
| **Deposited film** | Glass core sprayed with a resistive film (metal oxide or carbon) — the film thickness sets the resistance | Colour code | 10 Ω to 1 MΩ, power range 0.125 W to 1 W | Inexpensive, common in electronic circuits |

## Variable Resistors

Both wire-wound and composition resistors are also made in variable form. A conductive arm (wiper) moves along the resistive element, increasing or decreasing the length of resistive material in the circuit — this alters the resistance value.

### The Potentiometer

Uses **all three terminals** of the resistive element. As the wiper moves, the resistance on one side of it increases while the other side decreases, dividing (varying) the voltage delivered to a load. Note that four wires are typically connected to the three terminals (two to the ends, two to the wiper for redundancy/monitoring in some designs). Because it is a high-resistance component taking only a small current, it has a low wattage rating.

### The Rheostat

Uses only **two terminals**. This reduces its flexibility to a single increase/decrease action, and it varies the **current** flowing through a load rather than dividing voltage. Only two wires are connected. Because it is a low-resistance component carrying the **full circuit current**, it has a high wattage rating and may require cooling.

**Key distinction:** a potentiometer is a voltage-dividing, 3-terminal, low-current device; a rheostat is a current-limiting, 2-terminal, high-current device.

## Thermistors

Thermistors are semiconductor devices whose resistance **decreases** as temperature **increases** (a strongly negative temperature coefficient). The change in resistance is **not linear**, so a thermistor can only be used for accurate temperature indication over a small range. Because they are highly sensitive to temperature change, thermistors are ideal for **switching applications** — for example, over-temperature or under-temperature switching in air-conditioning systems.

## Voltage Dependent Resistors (VDR / Varistor)

A **Voltage Dependent Resistor**, commonly called a **varistor**, is a two-electrode semiconductor device whose resistance drops **abruptly** at a specific voltage. Varistors are connected as a **shunt component** across a circuit to short-circuit (suppress) voltage transients that could otherwise damage sensitive electronic circuitry.
        $cnt6$,
        6
    ) RETURNING id INTO s6_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 03.7: Electrical Power & Maximum Power Transfer
    -- Theorem
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m03_id, 'M03.7', 'Electrical Power & Maximum Power Transfer Theorem',
        $cnt7$
# Electrical Power & Maximum Power Transfer Theorem

## Electrical Energy

**Electrical energy** is the ability of an electrical system to do work. Its SI unit is the **joule (J)**.

One joule of work is done when one coulomb of charge is moved through a potential difference of one volt:

> 1 joule = 1 volt × 1 coulomb

Since 1 coulomb = 1 ampere-second, electrical energy can be expressed as:

> **Electrical energy (E) = Voltage (V) × Current (I) × Time (T)**, in joules

## Electrical Power

**Electrical power** is the *rate* at which an electrical system can perform work. Its SI unit is the **watt (W)**, defined as a rate of work of one joule per second:

> 1 watt = 1 joule/second = 1 volt × 1 ampere

Electrical power (symbol P) is therefore:

> **P = V × I**, in watts

By substituting Ohm's Law (V = IR) into this relationship, power can also be expressed in two other equally useful forms:

| Formula | Use when you know |
|---------|--------------------|
| **P = V × I** | Voltage and current |
| **P = I² × R** | Current and resistance |
| **P = V² / R** | Voltage and resistance |

### Worked Example

Calculate the power dissipated in a 40 Ω resistor connected to a 200 V supply.

**Step 1** — find the current: I = V/R = 200/40 = **5 A**

**Step 2** — find the power, three equivalent ways:
- P = V × I = 200 × 5 = **1000 W**
- P = I² × R = 5 × 5 × 40 = **1000 W**
- P = V² / R = (200 × 200) / 40 = **1000 W**

All three formulas agree, as they must — they are algebraically identical, just rearranged for whichever two quantities are known.

## The Maximum Power Transfer Theorem

Every practical power source (such as a battery or generator) has some **internal resistance**. This internal resistance drops part of the source's EMF before it ever reaches the load — the actual voltage available to the load depends on the ratio of the load resistance to the internal resistance.

**Statement of the theorem:**

> *"Maximum power can be developed in a load resistance only when the value of the load resistance equals the internal resistance of the source."*

### Worked Examples

Consider a source with EMF = 12 V and internal resistance = 3 Ω, connected to three different load resistances:

| Load resistance | Total resistance | Current (I = V/Rtotal) | Power in load (P = I²Rload) |
|-------------------|--------------------|---------------------------|--------------------------------|
| 1 Ω | 3 + 1 = 4 Ω | 12/4 = 3 A | 3² × 1 = **9 W** |
| **3 Ω** (= internal resistance) | 3 + 3 = 6 Ω | 12/6 = 2 A | 2² × 3 = **12 W (maximum)** |
| 9 Ω | 3 + 9 = 12 Ω | 12/12 = 1 A | 1² × 9 = **9 W** |

Plotting power delivered to the load against load resistance produces a curve that peaks exactly where **load resistance = internal (source) resistance** — 3 Ω in this example, giving the maximum possible power of 12 W. Loads either smaller or larger than the internal resistance both deliver **less** power than this maximum, as the 1 Ω and 9 Ω rows above confirm.

### Why This Matters — and Where It Doesn't Apply

The Maximum Power Transfer Theorem is important for **"matching"** a load to a source in circuits where the goal is to transfer signal power efficiently — for example, matching an audio amplifier's output resistance to a loudspeaker's impedance, or matching a transmission line to an antenna.

**Important caveat for power systems:** batteries, generators, and aircraft electrical power supply systems are **never** designed to be operated under maximum power transfer conditions. At the maximum-power-transfer point, exactly **half** the total power generated is dissipated inside the source itself (as heat in its internal resistance) — the other half reaches the load. This is extremely wasteful of energy and would cause excessive heating within the source.

For this reason, real power supply systems (including all aircraft electrical generation and distribution systems) are deliberately designed with the **minimum possible internal resistance**, to minimise internal losses and deliver as much of the generated power as possible to the connected loads. The Maximum Power Transfer Theorem is a tool for **signal/impedance matching in electronic and audio circuits** — it is **not** a design goal for aircraft power distribution systems.
        $cnt7$,
        7
    ) RETURNING id INTO s7_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 03.8: Capacitors & Capacitance
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m03_id, 'M03.8', 'Capacitors & Capacitance',
        $cnt8$
# Capacitors & Capacitance

## What Is a Capacitor?

A **capacitor** is a component with two terminals connecting to two metal **plates**, separated by an insulating material called a **dielectric** (which may be air, paper, plastic, or any other non-conducting material that keeps the plates apart while still allowing an electric field to act between them).

A capacitor is similar to a battery in that both store electrical energy, but they work in fundamentally different ways: a battery **produces** new electrons through a chemical reaction, whereas a capacitor **cannot produce** new electrons — it can only **store** electrons that are pushed onto it by an external source.

When a capacitor is connected to a battery:
- The plate connected to the battery's **negative terminal** accepts electrons the battery is producing
- The plate connected to the **positive terminal** loses electrons to the battery
- Once fully charged, the capacitor holds the **same voltage** as the battery

A small capacitor has a small capacity to store charge; a large capacitor can hold much more charge for the same voltage.

**Demonstration:** in a circuit with a battery, a bulb, and a capacitor, the bulb lights as current flows to charge the capacitor, then dims and goes out once the capacitor reaches full charge (current stops flowing). If the battery is then replaced with a plain wire, current flows from plate to plate as the capacitor discharges, and the bulb lights again briefly before dimming and going out once the capacitor is fully discharged (equal charge restored on both plates).

## Capacitance — the Farad

**Capacitance (symbol C)** is a measure of a capacitor's ability to store charge — the larger the capacitance, the more charge it can store for a given voltage.

Capacitance is measured in **farads (F)**. One farad is a very large unit for practical circuits, so capacitors are normally specified using sub-units:

| Unit | Symbol | Value | Conversion |
|------|--------|-------|------------|
| Farad | F | base unit | 1 F = 1,000,000 µF |
| Microfarad | µF | 10⁻⁶ F | 1,000,000 µF = 1 F |
| Nanofarad | nF | 10⁻⁹ F | 1,000 nF = 1 µF |
| Picofarad | pF | 10⁻¹² F | 1,000 pF = 1 nF |

A 1-farad capacitor stores 1 coulomb (Q) of charge at 1 volt (V). Because a full farad is physically very large, most practical capacitors are rated in microfarads, nanofarads, or picofarads.

### Charge–Voltage Relationship

There is a direct relationship between the voltage (V) across a capacitor's plates and the charge (Q) it holds: doubling the voltage doubles the stored charge; halving the charge halves the voltage. The ratio of charge to voltage is a constant for a given capacitor — this constant **is** its capacitance:

> **C = Q / V**

## Capacitors in Series

When capacitors are connected in series, the same charging current flows through each one, so each capacitor accumulates the **same charge, Q**, when fully charged.

If V1 and V2 are the final voltages across C1 and C2 respectively:

> Q = C1V1 and Q = C2V2

Replacing the series combination with a single equivalent capacitor C, where V = Q/C, and since the applied voltage V = V1 + V2:

> Q/C = Q/C1 + Q/C2

Dividing through by Q:

> **1/C = 1/C1 + 1/C2 + 1/C3 + …**

**Important:** the total capacitance of capacitors in series is always **less** than the smallest individual capacitor — the opposite of series resistors. All capacitance values must be expressed in the same units before combining.

### Worked Example 1

Three capacitors, 4 µF, 6 µF, and 12 µF, connected in series. Find the total capacitance.

> 1/C = 1/4 + 1/6 + 1/12 = 3/12 + 2/12 + 1/12 = 6/12
>
> C = 12/6 = **2 µF**

### Worked Example 2

Using the same three capacitors (C = 2 µF total) with a supply voltage of 30 kV, find the charge and the voltage across each capacitor.

> Q = C × V = 2×10⁻⁶ × 30×10³ = 60×10⁻³ C (the same charge on every capacitor in series)
>
> V1 = Q/C1 = 60×10⁻³ / 4×10⁻⁶ = **15 kV**
> V2 = Q/C2 = 60×10⁻³ / 6×10⁻⁶ = **10 kV**
> V3 = Q/C3 = 60×10⁻³ / 12×10⁻⁶ = **5 kV**

Check: V1 + V2 + V3 = 15 + 10 + 5 = **30 kV** — matches the supply voltage, confirming the calculation.

## Capacitors in Parallel

When capacitors are connected in parallel, the voltage across each one is the **same** — equal to the supply voltage V — but each accumulates its own charge according to its own capacitance:

> Q1 = VC1, Q2 = VC2

Replacing the parallel combination with a single equivalent capacitor C, the total charge is the sum of the individual charges:

> Q1 + Q2 = VC → V·C1 + V·C2 = V·C

Cancelling V from both sides:

> **C = C1 + C2 + C3 + …**

This is the opposite pattern to resistors: capacitors **add directly in parallel**, just as resistors add directly in series.

### Worked Example 1

Three capacitors, 8 µF, 10 µF, and 2 µF, connected in parallel. Find the total capacitance.

> C = C1 + C2 + C3 = 8 + 10 + 2 = **20 µF**

### Worked Example 2

Using the same three capacitors with a supply voltage of 20 kV, find the charge on each.

> Q1 = C1V = 8×10⁻⁶ × 20×10³ = 160×10⁻³ = **0.16 coulomb**
> Q2 = C2V = 10×10⁻⁶ × 20×10³ = 200×10⁻³ = **0.2 coulomb**
> Q3 = C3V = 2×10⁻⁶ × 20×10³ = 40×10⁻³ = **0.04 coulomb**

## Factors Affecting Capacitance

Three physical factors determine a capacitor's capacitance:

- **Plate area (a)** — capacitance **increases** as the total area of the opposing plate surfaces increases (a larger plate area can hold more charge)
- **Plate distance (d)** — capacitance **increases** as the distance between the plates **decreases** (the electric field becomes more concentrated)
- **Dielectric material** — capacitance depends on the insulating material between the plates, described by its **dielectric constant (K)**, also called relative permittivity (symbol εr or K) — a measure of how well the material concentrates electric flux compared to air or a vacuum

### Dielectric Constant of Common Materials

| Material | Dielectric Constant K (approx.) | Dielectric Strength (V/mil) |
|----------|----------------------------------|-------------------------------|
| Air or vacuum | 1 | 20 |
| Plastic film | 2–3 | — |
| Oil | 2–5 | 275 |
| Paper | 2–6 | 1250 |
| Mica | 3–8 | 600–1500 |
| Glass | 8 | 335–2000 |
| Aluminium oxide | 7 | — |
| Tantalum oxide | 25 | — |
| Ceramics | 80–1200 | 600–1250 |

**Capacitance formula:**

> **C = K·a / d** (farads), where a = plate area (m²), d = plate separation (m)

(In full SI form this is C = ε0·K·a/d, where ε0 = 8.854×10⁻¹² F/m is the permittivity of free space; K expresses how many times more capacitance the dielectric gives compared to a vacuum of the same dimensions.)

### Safe Working Voltage

Every capacitor has a **maximum DC voltage** it can withstand before the dielectric breaks down (dielectric breakdown permanently damages the capacitor, often destroying it). A large-value capacitor typically has a very thin dielectric, so it can usually only be used at **low voltages**; a high-voltage, high-value capacitor is correspondingly bulky. Capacitor values are always stated as capacitance **plus** maximum working voltage, e.g. "1 µF, 750 V DCW (DC working)" — this rating must never be exceeded.

**Polarised electrolytic capacitors** can only be used in **DC circuits** and **must** be connected with the correct polarity — connecting one backwards can cause the capacitor to fail, overheat, or (in extreme cases) rupture.

## Types of Capacitors

| Type | Notes |
|------|-------|
| **Paper** | Dielectric is waxed or oil-impregnated paper; low cost, moderate values |
| **Mica** | Very stable, low-loss dielectric; used where precision and stability matter |
| **Ceramic** | Wide range of dielectric constants (see table above); compact, widely used in electronics |
| **Electrolytic** | Polarised; achieves very high capacitance in a small size using a thin oxide-layer dielectric; DC only, correct polarity essential |

## Capacitor Colour Code

Like resistors, some capacitors use a **colour-code system** of bands or dots to indicate their capacitance value, tolerance, and voltage rating. The exact format varies by capacitor type and manufacturer, so the printed markings or manufacturer's datasheet should always be consulted to confirm a specific capacitor's rating.

## Charge and Discharge Behaviour

With the switch open and the capacitor uncharged, there is no voltage across the plates, no electric field, and no energy stored.

**On closing the switch:**
- Current flows at its **maximum** value instantly, and charge begins to build on the plates
- **Important principle:** a capacitor **cannot change its charge instantaneously** — however, if there is negligible resistance in the circuit, this charging current only flows for a very short time, so the capacitor becomes fully charged almost immediately
- The battery removes electrons from one plate and delivers electrons to the other — this movement of electrons **is** the charging current
- As charge builds up, the voltage across the plates rises (since Q/V is constant) until it equals the battery voltage, at which point **no further current flows** — the capacitor is fully charged, with equal and opposite charges on the two plates
- The final amount of charge stored depends on both the battery voltage and the capacitance

**On opening the switch:**
- The capacitor cannot change its charge instantaneously, and with the switch open there is no complete path for current to flow anyway
- The capacitor **continues to store** its electrical energy, and the voltage between its plates **remains** at the value it was charged to

This means a capacitor that has been **isolated from the circuit** can still present a full voltage across its terminals — it behaves like a small battery, storing electrical energy indefinitely (subject only to slow leakage). **This is exactly why a fully charged capacitor is a safety hazard** and must never be assumed to be "safe" simply because it has been disconnected from its power source — it should be properly discharged before being handled.

**If the applied voltage is suddenly reversed** while the capacitor is fully charged, the plates first discharge back through the source and then charge up again in the opposite polarity — producing a momentary current flow in the opposite direction to the original charging current.

**Except for these momentary charge/discharge currents, a capacitor does not allow continuous DC current to flow through a circuit** — once fully charged, a capacitor acts as a **block** to steady DC current. This blocking behaviour is deliberately exploited in many electronic circuits, for example to block a DC component while still allowing an AC signal to pass (DC blocking / AC coupling).
        $cnt8$,
        8
    ) RETURNING id INTO s8_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M03.5 DC Circuits: Ohm's Law, Series & Parallel,
    -- Kirchhoff's Laws (14 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s5_id, 'Ohm''s Law is correctly expressed as:',
     '[{"id":"a","text":"V = I × R","correct":true},{"id":"b","text":"V = I + R","correct":false},{"id":"c","text":"V = R / I","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s5_id, 'A current of 10 amperes flows through a resistance of 5 ohms. What is the potential difference?',
     '[{"id":"a","text":"2 volts","correct":false},{"id":"b","text":"15 volts","correct":false},{"id":"c","text":"50 volts","correct":true}]',
     '{"B1.1","B1.3","B2"}'),

    (s5_id, 'A circuit has a supply of 24 volts and a resistance of 6 ohms. What current flows?',
     '[{"id":"a","text":"4 amps","correct":true},{"id":"b","text":"6 amps","correct":false},{"id":"c","text":"144 amps","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s5_id, 'A circuit carries 3 amps and has a voltage drop of 12 volts across a resistor. What is the resistor''s value?',
     '[{"id":"a","text":"4 ohms","correct":true},{"id":"b","text":"9 ohms","correct":false},{"id":"c","text":"36 ohms","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s5_id, 'A voltmeter is correctly connected to a circuit:',
     '[{"id":"a","text":"In series with the component","correct":false},{"id":"b","text":"In parallel (across) the component","correct":true},{"id":"c","text":"Only after removing power from the circuit","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s5_id, 'An ammeter is correctly connected to a circuit:',
     '[{"id":"a","text":"In parallel with the component","correct":false},{"id":"b","text":"In series (in-line) with the circuit","correct":true},{"id":"c","text":"Across the supply terminals only","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s5_id, 'When using an ohmmeter to measure resistance, it is essential that:',
     '[{"id":"a","text":"The circuit is at its normal operating voltage","correct":false},{"id":"b","text":"No voltage is applied to the circuit while the meter is connected","correct":true},{"id":"c","text":"The ammeter is connected in series with the ohmmeter","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s5_id, 'The prefix "kilo" represents a multiplier of:',
     '[{"id":"a","text":"×1,000","correct":true},{"id":"b","text":"×1,000,000","correct":false},{"id":"c","text":"×0.001","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s5_id, 'Three resistors of 2 Ω, 4 Ω and 6 Ω are connected in series. What is the total resistance?',
     '[{"id":"a","text":"8 Ω","correct":false},{"id":"b","text":"12 Ω","correct":true},{"id":"c","text":"48 Ω","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s5_id, 'In a series circuit, the current at any point in the circuit is:',
     '[{"id":"a","text":"Different at each resistor, proportional to its value","correct":false},{"id":"b","text":"The same at every point in the circuit","correct":true},{"id":"c","text":"Zero at the midpoint of the circuit","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s5_id, 'Three resistors, 3 Ω, 12 Ω and 4 Ω, are connected in parallel. What is the total resistance?',
     '[{"id":"a","text":"1.5 Ω","correct":true},{"id":"b","text":"6.33 Ω","correct":false},{"id":"c","text":"19 Ω","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s5_id, 'In a parallel circuit, the voltage across each branch is:',
     '[{"id":"a","text":"Equal to the supply voltage divided by the number of branches","correct":false},{"id":"b","text":"The same as the supply voltage, across every branch","correct":true},{"id":"c","text":"Proportional to each branch''s resistance","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s5_id, 'Kirchhoff''s Voltage Law states that:',
     '[{"id":"a","text":"The sum of the p.d.s around a series circuit equals the applied EMF","correct":true},{"id":"b","text":"Current entering a junction is always greater than current leaving it","correct":false},{"id":"c","text":"Total resistance in a parallel circuit equals the sum of the branch resistances","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s5_id, 'Kirchhoff''s Current Law states that:',
     '[{"id":"a","text":"The algebraic sum of the currents at a junction is always zero","correct":true},{"id":"b","text":"Voltage is always the same at every junction in a circuit","correct":false},{"id":"c","text":"Current always increases after passing through a junction","correct":false}]',
     '{"B1.1","B1.3","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M03.6 Resistance & Resistors: Colour Coding,
    -- Types, Wheatstone Bridge (14 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s6_id, 'In the formula R = ρl/a, the symbol ρ (rho) represents:',
     '[{"id":"a","text":"The cross-sectional area of the conductor","correct":false},{"id":"b","text":"The specific resistance (resistivity) of the material","correct":true},{"id":"c","text":"The temperature coefficient of the material","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s6_id, 'If a conductor''s length is doubled and its cross-sectional area is halved, its resistance will:',
     '[{"id":"a","text":"Double","correct":false},{"id":"b","text":"Stay the same","correct":false},{"id":"c","text":"Quadruple (× 4)","correct":true}]',
     '{"B1.1","B1.3","B2"}'),

    (s6_id, 'Pure metals such as copper and tungsten have a temperature coefficient of resistance that is:',
     '[{"id":"a","text":"Positive — resistance increases with temperature","correct":true},{"id":"b","text":"Negative — resistance decreases with temperature","correct":false},{"id":"c","text":"Zero — resistance is unaffected by temperature","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s6_id, 'Carbon, electrolytes, and most insulating materials have a temperature coefficient of resistance that is:',
     '[{"id":"a","text":"Positive","correct":false},{"id":"b","text":"Negative — resistance decreases as temperature increases","correct":true},{"id":"c","text":"Always exactly zero","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s6_id, 'A copper wire has a resistance of 1 Ω at 0°C and a temperature coefficient α0 of 0.00426 per °C. What is its resistance at 100°C?',
     '[{"id":"a","text":"1.00426 Ω","correct":false},{"id":"b","text":"1.426 Ω","correct":true},{"id":"c","text":"4.26 Ω","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s6_id, 'The alloy manganin (copper, manganese and nickel) is notable because its resistance:',
     '[{"id":"a","text":"Increases rapidly with temperature","correct":false},{"id":"b","text":"Remains practically constant over a wide temperature range","correct":true},{"id":"c","text":"Decreases to zero at high temperature","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s6_id, 'A resistor is marked with the colour bands Yellow, Violet, Orange, Gold. Its value is:',
     '[{"id":"a","text":"4.7 kΩ ±10%","correct":false},{"id":"b","text":"47 kΩ ±5%","correct":true},{"id":"c","text":"470 kΩ ±5%","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s6_id, 'For a wire-wound resistor, the physical size of the component primarily indicates:',
     '[{"id":"a","text":"Its resistance value","correct":false},{"id":"b","text":"Its heat dissipation (power) capability","correct":true},{"id":"c","text":"Its tolerance rating","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s6_id, 'A composition resistor''s ohmic value is typically found in the range:',
     '[{"id":"a","text":"Less than 10 Ω to greater than 20 MΩ","correct":true},{"id":"b","text":"1 MΩ to 100 MΩ only","correct":false},{"id":"c","text":"Fixed at exactly 1 kΩ","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s6_id, 'What is the key difference between a potentiometer and a rheostat?',
     '[{"id":"a","text":"A potentiometer uses 2 terminals to vary current; a rheostat uses 3 terminals to divide voltage","correct":false},{"id":"b","text":"A potentiometer uses all 3 terminals to divide voltage; a rheostat uses only 2 terminals to vary current","correct":true},{"id":"c","text":"There is no functional difference between them","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s6_id, 'A thermistor is a device whose resistance:',
     '[{"id":"a","text":"Increases linearly with temperature","correct":false},{"id":"b","text":"Decreases non-linearly as temperature increases","correct":true},{"id":"c","text":"Is completely unaffected by temperature","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s6_id, 'A Voltage Dependent Resistor (VDR / varistor) is typically used to:',
     '[{"id":"a","text":"Measure small changes in current precisely","correct":false},{"id":"b","text":"Suppress voltage transients by shunting them away from sensitive circuitry","correct":true},{"id":"c","text":"Provide a stable reference voltage at all temperatures","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s6_id, 'In a Wheatstone Bridge at balance, the unknown resistance RX is given by:',
     '[{"id":"a","text":"RX = RA + RB − RC","correct":false},{"id":"b","text":"RX = (RA × RB) / RC","correct":true},{"id":"c","text":"RX = RC / (RA × RB)","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s6_id, 'In a Wheatstone Bridge, RA = 25 kΩ, RB = 5 kΩ, and RC = 20 kΩ. At balance, what is RX?',
     '[{"id":"a","text":"6.25 kΩ","correct":true},{"id":"b","text":"100 kΩ","correct":false},{"id":"c","text":"125 kΩ","correct":false}]',
     '{"B1.1","B1.3","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M03.7 Electrical Power & Maximum Power Transfer
    -- Theorem (14 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s7_id, 'The SI unit of electrical energy is the:',
     '[{"id":"a","text":"Watt","correct":false},{"id":"b","text":"Joule","correct":true},{"id":"c","text":"Ohm","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s7_id, 'Electrical energy can be calculated using the formula:',
     '[{"id":"a","text":"E = V × I × T","correct":true},{"id":"b","text":"E = V / (I × T)","correct":false},{"id":"c","text":"E = I / (V × T)","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s7_id, 'One joule of electrical work is equivalent to:',
     '[{"id":"a","text":"1 volt divided by 1 coulomb","correct":false},{"id":"b","text":"1 volt multiplied by 1 coulomb","correct":true},{"id":"c","text":"1 ampere multiplied by 1 ohm","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s7_id, 'The SI unit of electrical power is the:',
     '[{"id":"a","text":"Watt","correct":true},{"id":"b","text":"Joule","correct":false},{"id":"c","text":"Coulomb","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s7_id, 'Which formula correctly expresses electrical power in terms of current and resistance only?',
     '[{"id":"a","text":"P = V × R","correct":false},{"id":"b","text":"P = I² × R","correct":true},{"id":"c","text":"P = I / R","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s7_id, 'A 40 Ω resistor is connected to a 200 V supply. What current flows?',
     '[{"id":"a","text":"0.2 A","correct":false},{"id":"b","text":"5 A","correct":true},{"id":"c","text":"8000 A","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s7_id, 'A 40 Ω resistor is connected to a 200 V supply. What power is dissipated?',
     '[{"id":"a","text":"40 W","correct":false},{"id":"b","text":"200 W","correct":false},{"id":"c","text":"1000 W","correct":true}]',
     '{"B1.1","B1.3","B2"}'),

    (s7_id, 'Using P = V²/R, the power dissipated by a 40 Ω resistor connected to a 200 V supply is:',
     '[{"id":"a","text":"1000 W","correct":true},{"id":"b","text":"500 W","correct":false},{"id":"c","text":"2000 W","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s7_id, 'The Maximum Power Transfer Theorem states that maximum power is delivered to a load when:',
     '[{"id":"a","text":"The load resistance is as small as possible","correct":false},{"id":"b","text":"The load resistance equals the internal resistance of the source","correct":true},{"id":"c","text":"The load resistance is as large as possible","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s7_id, 'A 12 V source with 3 Ω internal resistance is connected to a 3 Ω load. What power is delivered to the load?',
     '[{"id":"a","text":"9 W","correct":false},{"id":"b","text":"12 W","correct":true},{"id":"c","text":"24 W","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s7_id, 'A 12 V source with 3 Ω internal resistance is connected to a 1 Ω load. What power is delivered to the load?',
     '[{"id":"a","text":"9 W","correct":true},{"id":"b","text":"12 W","correct":false},{"id":"c","text":"36 W","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s7_id, 'A 12 V source with 3 Ω internal resistance is connected to a 9 Ω load. What power is delivered to the load?',
     '[{"id":"a","text":"1 W","correct":false},{"id":"b","text":"9 W","correct":true},{"id":"c","text":"12 W","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s7_id, 'Aircraft electrical power supply systems are NOT designed to operate under maximum power transfer conditions because:',
     '[{"id":"a","text":"It is technically impossible to achieve in a DC system","correct":false},{"id":"b","text":"Half of the total power generated would be wasted as heat inside the source itself","correct":true},{"id":"c","text":"It would cause the load voltage to exceed the source voltage","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s7_id, 'The Maximum Power Transfer Theorem is most directly applied in practice to:',
     '[{"id":"a","text":"Designing aircraft generators for minimum internal resistance","correct":false},{"id":"b","text":"Impedance matching in signal/audio circuits, such as an amplifier driving a loudspeaker","correct":true},{"id":"c","text":"Sizing circuit breakers for overcurrent protection","correct":false}]',
     '{"B1.1","B1.3","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M03.8 Capacitors & Capacitance (14 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s8_id, 'A capacitor is constructed from:',
     '[{"id":"a","text":"Two plates separated by a dielectric","correct":true},{"id":"b","text":"A coil of wire wound around an iron core","correct":false},{"id":"c","text":"A single conductor with high resistivity","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s8_id, 'Unlike a battery, a capacitor:',
     '[{"id":"a","text":"Produces new electrons through a chemical reaction","correct":false},{"id":"b","text":"Cannot produce new electrons — it can only store them","correct":true},{"id":"c","text":"Cannot store any electrical charge at all","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s8_id, 'The SI unit of capacitance is the:',
     '[{"id":"a","text":"Farad","correct":true},{"id":"b","text":"Henry","correct":false},{"id":"c","text":"Coulomb","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s8_id, 'How many microfarads (µF) are there in 1 farad?',
     '[{"id":"a","text":"1,000","correct":false},{"id":"b","text":"1,000,000","correct":true},{"id":"c","text":"1,000,000,000","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s8_id, 'The relationship between charge, capacitance and voltage is expressed as:',
     '[{"id":"a","text":"C = Q / V","correct":true},{"id":"b","text":"C = V / Q","correct":false},{"id":"c","text":"C = Q × V","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s8_id, 'For capacitors connected in series, the total capacitance is found using:',
     '[{"id":"a","text":"C = C1 + C2 + C3","correct":false},{"id":"b","text":"1/C = 1/C1 + 1/C2 + 1/C3","correct":true},{"id":"c","text":"C = C1 × C2 × C3","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s8_id, 'Three capacitors of 4 µF, 6 µF and 12 µF are connected in series. What is the total capacitance?',
     '[{"id":"a","text":"2 µF","correct":true},{"id":"b","text":"11 µF","correct":false},{"id":"c","text":"22 µF","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s8_id, 'For capacitors connected in parallel, the total capacitance is found using:',
     '[{"id":"a","text":"C = C1 + C2 + C3","correct":true},{"id":"b","text":"1/C = 1/C1 + 1/C2 + 1/C3","correct":false},{"id":"c","text":"C = C1 / (C2 + C3)","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s8_id, 'Three capacitors of 8 µF, 10 µF and 2 µF are connected in parallel. What is the total capacitance?',
     '[{"id":"a","text":"1.4 µF","correct":false},{"id":"b","text":"20 µF","correct":true},{"id":"c","text":"160 µF","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s8_id, 'The total capacitance of capacitors connected in series is always:',
     '[{"id":"a","text":"Greater than the largest individual capacitor","correct":false},{"id":"b","text":"Less than the smallest individual capacitor","correct":true},{"id":"c","text":"Equal to the average of all the capacitors","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s8_id, 'Capacitance can be increased by:',
     '[{"id":"a","text":"Increasing the plate area and decreasing the distance between the plates","correct":true},{"id":"b","text":"Decreasing the plate area and increasing the distance between the plates","correct":false},{"id":"c","text":"Using a dielectric material with a lower dielectric constant","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s8_id, 'The dielectric constant (K) of air or a vacuum, used as the reference value, is:',
     '[{"id":"a","text":"0","correct":false},{"id":"b","text":"1","correct":true},{"id":"c","text":"10","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s8_id, 'A polarised electrolytic capacitor must be:',
     '[{"id":"a","text":"Used only in AC circuits","correct":false},{"id":"b","text":"Connected with the correct polarity, and used only in DC circuits","correct":true},{"id":"c","text":"Connected in reverse polarity to charge correctly","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s8_id, 'A capacitor that has been fully charged and then disconnected from its circuit:',
     '[{"id":"a","text":"Immediately loses all of its charge and is safe to handle","correct":false},{"id":"b","text":"Can still retain a dangerous voltage across its terminals and must be discharged before handling","correct":true},{"id":"c","text":"Automatically reverses its polarity","correct":false}]',
     '{"B1.1","B1.3","B2"}');

END $$;
