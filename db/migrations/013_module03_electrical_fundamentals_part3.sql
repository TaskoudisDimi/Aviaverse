-- Module 03: Electrical Fundamentals — Part 3 (Magnetism, Inductance, DC Generators, DC Motors)
-- Source: EASA Part-66 Module 03 official textbook

DO $$
DECLARE
    m03_id INT;
    s9_id  INT;
    s10_id INT;
    s11_id INT;
    s12_id INT;
BEGIN
    SELECT id INTO m03_id FROM easa_modules WHERE code = 'M03';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M03.9') THEN
        RAISE NOTICE 'M03.9-M03.12 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 03.9: Magnetism
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m03_id, 'M03.9', 'Magnetism',
        $cnt9$
# Magnetism

## Introduction to Magnetism

Magnetism has been known and used by mankind for longer than electricity. It occurs naturally in certain minerals — the best known is **lodestone**, a naturally occurring form of magnetic iron ore that attracts and picks up iron or steel.

If a piece of lodestone is freely suspended, it comes to rest pointing in a north-south direction. This is because the **Earth itself behaves as a huge natural magnet**, and this property is the basis of the magnetic compass, used for navigation for many centuries.

## Artificial Magnets

Naturally occurring magnetic material is irregular in shape and impractical to use, so other materials — chiefly iron and steel — are shaped as required and made into magnets. There are three ways a piece of iron or steel can become magnetised:

1. **Magnetisation by induction** — iron placed near a natural (or existing) magnet develops magnetic properties of its own.
2. **Magnetisation by stroking** — an unmagnetised piece of iron is repeatedly stroked with one end (one pole) of a magnet.
3. **Magnetisation by electric current** — iron is magnetised by the magnetic field produced by a current flowing through a coil of wire around it (the basis of electromagnetism).

Any magnet produced by one of these methods is called an **artificial magnet**.

- **Soft iron** is easily magnetised but also **loses its magnetism easily** — it makes a good **temporary magnet**.
- **Hard iron / steel** is difficult to magnetise, but once magnetised it **retains its magnetism** well — it makes a good **permanent magnet**.

## Permanent Magnets

The most common form is the **bar magnet**. The force of attraction is greatest at the two ends of the magnet (the **poles**) and is negligible at the middle.

If a bar magnet is freely suspended, it takes up a fixed position aligned north-south:
- The end pointing north = the **North-seeking pole (N pole)**
- The end pointing south = the **South Pole (S pole)**

Materials that exhibit strong magnetic effects are called **ferromagnetic materials** — the main examples are **iron, cobalt and nickel**. The two poles of any single magnet are always of equal strength, are complementary, and cannot exist in isolation from each other (cutting a magnet in half produces two new, weaker magnets, each with its own N and S pole).

### The Magnetic Field

The region around a magnet in which magnetic forces can be detected is called the **magnetic field**. It is convenient to imagine this field as a pattern of **lines of force**, also called **lines of magnetic flux**.

**Properties of magnetic field lines:**
- Lines of force tend to contract to the shortest possible length, as though they were stretched elastic bands.
- Lines of force running side by side (in the same direction) repel one another laterally, causing the field to spread out.
- Outside the magnet, lines of force run from the North pole to the South pole. They form complete closed loops by continuing through the body of the magnet itself, from South to North internally.
- Lines of force never cross one another.

Magnetic force is actually present at every point in the field, not just literally "on" a line — the lines are simply a convenient way of visualising the field: where lines are drawn close together the field is strong, where they are spread out the field is weak.

The lines of force, taken collectively, are called the **magnetic flux**, given the symbol **Φ** (phi), measured in **Weber (Wb)**.

### Laws of Magnetism

When two magnets are brought close together:
- **Like poles repel** (N-N or S-S)
- **Unlike poles attract** (N-S)

This is combined into two formal laws:
1. The force between two magnetic poles at a fixed distance apart is **proportional to the product of their pole strengths**.
2. The force between two magnetic poles of constant strength is **inversely proportional to the square of the distance between them**.

Combined into a single equation:

**Force = (P₁ × P₂) / d² Newtons**

where P₁ and P₂ are the pole strengths in Weber, and d is the distance between the poles in metres.

### Flux Density

The magnetic strength at any point is related to the concentration of flux lines there. **Flux density** is the amount of flux per unit of cross-sectional area, measured at right angles to the lines of force:

**B = Φ / A**

where B = flux density in **Tesla (T)**, Φ = flux in Weber, and A = area in square metres.

Permanent magnets have a practical limit on the field strength they can produce (the material eventually saturates). To obtain much stronger, controllable fields, an **electromagnet** is used instead.

## Principles of Electromagnetism

A magnetic field can be created simply by passing a direct current through a wire. The shape of the field around a straight conductor is **circular**, and concentric with the conductor. This can be demonstrated by passing a wire through a piece of cardboard sprinkled with iron filings — when current flows, the filings arrange themselves into concentric circles around the wire.

The field is strongest close to the conductor (where the flux lines are most concentrated) and weakens with distance.

**Direction of the field — the Corkscrew Rule:**
> "The direction of the magnetic field surrounding a long straight conductor carrying an electric current is that in which a right-handed corkscrew must be turned in order to move it in the direction of the current."

By convention (viewing the conductor end-on): current flowing *away* from the viewer (into the page) is shown by a **+** sign; current flowing *towards* the viewer (out of the page) is shown by a **•** (dot).

### Magnetic Effects of Parallel Conductors

Two straight parallel conductors, viewed end-on:
- If the currents flow in the **same direction**, the conductors are drawn **towards** one another (they attract, if free to move).
- If the currents flow in **opposite directions**, the conductors are pushed **apart** (they repel).

### The Solenoid

When a current-carrying conductor is wound into a coil, it is called a **solenoid**. The corkscrew rule still applies to each individual turn, but the lines of flux produced by neighbouring turns combine (since flux lines cannot cross), producing an overall field pattern very similar to that of a bar magnet — with a distinct N pole at one end and S pole at the other.

Outside the coil the flux spreads out and is of low density; inside the former, the flux is very concentrated (high density).

### Right Hand Grasp Rule

To determine which end of a solenoid is the North pole:
> "If the right hand is laid on the outside of the coil so that the fingers line up with the direction of current flow in the turns of wire, the extended thumb points in the direction of the North pole."

## Magnetic Terms

| Quantity | Symbol | Unit |
|---|---|---|
| Flux | Φ | Weber (Wb) |
| Flux density | B | Tesla (T) |
| Magnetomotive force | mmf | Ampere-turn (At) |
| Magnetising force | H | Ampere-turn per metre (At/m) |
| Permeability | µ | (no unit) |

### Magnetomotive Force (MMF)

The MMF is the force that establishes the magnetic flux, and is measured in **Ampere-turns (At)**:

**mmf = I × N**

where I = current in Amperes, N = number of turns of the coil.

### Magnetising Force (H)

The magnetising force is the mmf per metre length (l) of the magnetic circuit:

**H = mmf / l = N × I / l** (unit: At/m)

### The Magnetic Circuit

A magnetic circuit is analogous to an electric circuit — just as current cannot flow without a closed electrical circuit, lines of magnetic flux always form closed loops. Using the electrical analogy: a ferrite (iron) core is like the low-resistance conductor of an electric circuit; an air gap behaves like a resistance; and the coil turns act like the power source (battery).

**Reluctance** is the opposition to the establishment of flux in a magnetic medium, measured in Amperes per Weber. A ferrite core has much lower reluctance than an equivalent air gap. Where a magnetic circuit contains more than one reluctance in the flux path, the total reluctance is the **sum of the individual reluctances** — exactly as resistances add in a series electrical circuit.

### The Electricity / Magnetism Analogy

| Electrical Quantity | Unit | ↔ | Magnetic Quantity | Unit |
|---|---|---|---|---|
| EMF | Volt | ↔ | MMF | Ampere-turn |
| Current | Ampere | ↔ | Flux | Weber |
| Resistance | Ohm | ↔ | Reluctance | Ampere-turn/Weber |

Just as **I = EMF / Resistance**, so **Φ = MMF / Reluctance**.

### Permeability

The flux produced by a given MMF depends on the medium through which it is established. An air-cored solenoid carrying a given current produces a certain field strength. If an iron core is inserted (same current, same MMF), the field strength increases greatly — the flux density rises even though the magnetising force is unchanged.

The ratio of flux density (B) to the magnetising force (H) that produces it is called the **permeability** of the medium, symbol **µ** (no units):

**µ = B / H**, or **B = µH**

Typical values: air and other non-magnetic materials, µ ≈ 1; iron, µ ≈ 2,000–3,000; special nickel-iron alloys, as high as 100,000.

### Variation of Permeability with Flux Density

An iron core can be pictured as containing enormous numbers of tiny, randomly-oriented magnets called **domains**. As a magnetising force is applied, it progressively lines up more and more of the domains in the direction of the force (their individual fields then combine). As the magnetising force continues to increase, more domains align until **all** are perfectly lined up — at this point the core is said to be **saturated**, and no further increase in flux density is possible, however much the magnetising force is further increased.

## Eddy Current Loss

If a sheet of metal (a conductor) is placed between two coils, it modifies and reduces the field that penetrates the second coil, reducing the EMF/current induced in it. This happens because eddy currents are induced within the metal sheet, and by Lenz's Law these eddy currents produce their own opposing magnetic field, reducing the net field reaching the second coil. A sheet of plastic (a non-conductor), by contrast, carries no eddy currents and has no effect on the induced EMF in the second coil.

## Types of Magnetic Materials

Materials are classified into three categories according to how they respond to a magnetic field:

| Category | Effect | Permeability | Examples |
|---|---|---|---|
| **Ferromagnetic** | Very pronounced magnetic effect; concentrates flux lines | µ >> 1 | Iron, nickel, cobalt |
| **Paramagnetic** | No appreciable effect; essentially non-magnetic | µ slightly > 1 | Platinum, manganese, chromium, aluminium, copper |
| **Diamagnetic** | Minimum effect; slightly *anti*-magnetic | µ < 1 | Bismuth |

## Magnetic Shielding

No known insulator exists for magnetic flux. Placing a non-magnetic material (e.g. glass) in a magnetic field has virtually no effect on the flux — it passes straight through, even though glass is an excellent *electrical* insulator. Placing a magnetic material (e.g. soft iron) in the field, however, redirects the flux, since it offers a path of much greater permeability.

Sensitive instrument mechanisms can be adversely affected by stray magnetic fields, causing reading errors. Since magnetic flux cannot be insulated against, it is instead **directed around** the instrument using a case made of soft iron (a magnetic screen or shield). Flux is more readily established through the iron case — even though this path is physically longer — than through the air inside the case, so the instrument mechanism is effectively shielded from the stray field.

## Care of Magnets

Magnetised steel can lose much of its magnetism through improper handling. Jarring (mechanical shock) or heating causes the domains within the material to become misaligned, resulting in a loss of effective magnetism. Instruments containing magnets must be handled with care — severe jarring or exposure to high temperature can damage the device.

A magnet can also weaken through loss of flux by excessive leakage into the surrounding space when stored incorrectly:
- A **horseshoe magnet** should be stored with a **keeper** — a soft iron bar joining the two poles — so that flux continuously circulates through the magnet and keeper rather than leaking into free space.
- **Bar magnets** should be stored in **pairs**, with a North pole and a South pole placed together, providing a complete flux path with minimal leakage.
        $cnt9$,
        9
    ) RETURNING id INTO s9_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 03.10: Inductance / Inductors
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m03_id, 'M03.10', 'Inductance / Inductors',
        $cnt10$
# Inductance / Inductors

## The Hysteresis Loop

**Inductance** describes the behaviour of a coil of wire (often wound around an iron core) that resists any change in the current flowing through it. This behaviour arises because the coil's magnetic field **lags behind** the change in current — a property demonstrated graphically by the **hysteresis loop**.

Tracing the loop as current is varied:
- As the magnetising force (proportional to current, since N is constant) rises from zero, the flux density B rises with it, up to a **saturation point** — beyond this, further increases in current produce no further increase in flux density.
- As the current is then reduced back to zero, the flux density falls, but **does not return to zero** — at zero current, some flux density (magnetism) remains in the core. This retained flux density is called the **Remanence**.
- If the current is then driven negative, the flux density continues to fall, passes through zero, and becomes negative. The point at which the flux density crosses zero going negative is called the **Coercive Force**.
- The cycle repeats for each positive and negative current excursion, tracing out the closed hysteresis loop.

The ability of a material to retain magnetism depends on both the remanence and the coercive force, combined as the **Retentivity**:

**Retentivity = Coercive Force / Remanence**

Materials that are easy to magnetise generally have **low** retentivity (a thin hysteresis loop). Materials that are hard to magnetise (good **permanent magnet** materials) have very **high** retentivity — for example, a cobalt-iron alloy has a retentivity of around **25,000**, compared with only about **4** for permalloy, an easily-magnetised alloy used in electromagnetic machines (because a low-retentivity material needs only a small current to produce enough coercive force to change its flux density).

## Electromagnetic Induction

Consider a coil of many turns connected to a centre-zero galvanometer. If a permanent magnet is moved towards and along the axis of the coil, the galvanometer shows a current flowing — even though there is no battery in the circuit. An EMF must therefore have been *induced*. When the magnet stops moving, the current falls to zero.

The moving magnetic field (moving with the magnet) cuts across the coil's conductors, generating an EMF. The same effect occurs if the coil itself is moved towards or away from a stationary magnet — flux is still being cut, and an EMF is still induced. The direction of the induced current depends on the relative direction of movement.

The size of the induced EMF depends on:
- The number of turns in the coil (fixed)
- The strength of the magnetic field (fixed)
- The **speed** at which the magnet (or coil) is moved — faster movement produces a greater EMF, and vice versa.

### Faraday's Law

> When the magnetic flux through a coil is made to vary, an EMF is induced in the coil, and the magnitude of this EMF is proportional to the **rate of change of flux**.

### Lenz's Law

> The direction of an induced EMF is always such that it tends to set up a current **opposing** the motion, or the change of flux, that is responsible for inducing it.

## Induction in DC Circuits

A coil can induce a voltage in *itself*. When a switch controlling current through a coil is opened, the current (and hence the magnetic flux) falls rapidly to zero. Since the flux is changing, Faraday's Law tells us there must be an induced voltage across the coil — this is called the **self-induced voltage**, or **self-induction**. With the coil now open-circuited, this induced voltage cannot drive a current anywhere else, so it appears across the open switch contacts, and can be large enough to spark across the gap.

A similar effect occurs the instant the switch closes and current begins to grow: by Lenz's Law, the induced effect **opposes** the change (it opposes the current growing) — this opposing voltage is called a **back EMF**.

### Growth and Decay of Current in an RL Circuit

Consider a coil (inductance L) in series with a resistor (R), connected to a supply voltage V via a switch:

**On closing the switch:** current begins to rise from zero, producing a back EMF (Vl) across the coil. At the instant of closing, this back EMF equals the *whole* of the supply voltage V (so the voltage across R, Vr, is momentarily zero). At all times while the switch is closed:

**V = Vr + Vl**

As current builds up (exponentially), Vr rises with it (by Ohm's Law), while Vl falls (to keep the sum equal to V). Eventually Vr reaches its maximum value (= V) and Vl falls to zero — current is then constant and steady, and there is no further back EMF.

**On opening the switch** (removing the supply): the voltage equation becomes Vr + Vl = 0, i.e. Vl = −Vr. The current "wants" to fall to zero instantly, but this rapid change induces a back EMF which, by Lenz's Law, acts to **keep the current flowing** (in the same direction as before). This back EMF starts at a maximum and, with no source to sustain the current, decays exponentially to zero, with Vr following it down (Ohm's Law) and Vl also decaying towards zero.

## Inductance and the Henry

The ability of a conductor (or coil) to induce a voltage in itself when its current changes is called **self-inductance**, or simply **inductance**, symbol **L**, unit the **henry (H)**.

**A current change of 1 amp per second (1 A/s) that induces 1 volt (1 V) across the coil defines an inductance of 1 henry.**

**L = VL / (di/dt)**

where VL = induced voltage in volts, di/dt = rate of change of current in amps per second.

Rearranged, the self-induced voltage is:

**VL = L × (di/dt)**

### Worked Examples

**Example 1** — Current in an inductor changes from 12 A to 16 A in 1 second.
di/dt = 4 A / 1 s = **4 A/s**

**Example 2** — Current changes by 50 mA in 2 µs.
di/dt = (50 × 10⁻³) / (2 × 10⁻⁶) = **25,000 A/s**

**Example 3** — A coil induces 40 V when current changes at 4 A/s. Find L.
L = VL / (di/dt) = 40 / 4 = **10 H**

**Example 4** — A coil induces 1000 V for a current change of 50 mA in 2 µs. Find L.
di/dt = 25,000 A/s (from Example 2)
L = VL / (di/dt) = 1000 / 25,000 = **0.04 H**
(Note that this inductance is much smaller than in Example 3, yet produces a far greater induced voltage — because the current is changing very much faster.)

**Example 5** — Find the self-induced voltage across a 4 H inductance from a current change of 12 A/s.
VL = L × (di/dt) = 4 × 12 = **48 V**

**Example 6** — Current through a 200 mH inductor changes from 0 to 100 mA in 2 µs. Find VL.
di/dt = (100 × 10⁻³) / (2 × 10⁻⁶) = 50,000 A/s
VL = L × (di/dt) = 0.2 × 50,000 = **10,000 V**
(A very high voltage is induced because of the extremely fast current change — this is why opening an inductive circuit abruptly can produce dangerous voltage spikes.)

The induced voltage is a real, measurable voltage — but VL only exists while the current is actually changing; a very brief di/dt produces VL as a short voltage **pulse**.

To increase the inductance of a conductor, it is formed into a loop or coil (making an **inductor**). Current in one loop produces a magnetic field that encircles it; as current increases, the expanding field cuts through *all* the loops of the coil, so the current in each loop affects every other loop, increasing the opposition to any change of current.

Inductors are classified by core type: an **air-core inductor** uses a hollow, non-magnetic former (such as cardboard) purely to hold the coil's shape; a **soft-iron-core inductor** uses a magnetic core to greatly increase the inductance for a given number of turns.

## Factors Affecting Coil Inductance

Five physical factors determine the inductance of a coil:

1. **Number of turns** — inductance varies as the **square** of the number of turns. Doubling the turns doubles the field strength at the same current, which in turn induces twice the voltage while also cutting twice as many turns — an overall factor of **4** increase in inductance.
2. **Diameter of the coil** — inductance increases directly with the cross-sectional area of the core (A = πr²). Doubling the coil radius increases the inductance by a factor of **4**.
3. **Coil length** — a long coil with widely-spaced turns has fewer flux linkages and **low** inductance; a short coil with closely-spaced turns has more flux linkage and **higher** inductance. Doubling the coil length (same number of turns) **halves** the inductance.
4. **Core material** — a high-permeability, low-reluctance core (e.g. soft iron) allows more lines of force to cut each turn than an air core, increasing inductance. Inductance increases **directly** with the permeability of the core material.
5. **Number of winding layers** — a single layer of widely-spaced turns links flux poorly (low inductance). A closely-wound, multi-layer winding links more flux between layers, giving a much better inductor.

## Inductances in Series and Parallel

**Series (no mutual coupling):** total inductance adds, just as resistances add in series:

**LT = L1 + L2 + L3 + …**

*Example*: L1 = 5 mH, L2 = 10 mH → LT = 5 + 10 = **15 mH**

**Parallel (no mutual coupling):** the reciprocal method, exactly as for parallel resistors:

**1/LT = 1/L1 + 1/L2 + 1/L3 + …**

## Mutual Inductance (M)

When two coils are positioned so that the flux from one links the turns of the other, a change of flux in one coil induces an EMF in the other. Energy is coupled between the coils via their **mutual inductance (M)**.

The amount of mutual inductance depends on the relative position of the coils — greater separation gives lower M; coils close together (so most of the flux of one links the other) give higher M. M is greatly increased by mounting both coils on a common iron core.

The effect on total inductance also depends on whether the coils are connected **series-aiding** (the common current produces fields in the same direction in both coils) or **series-opposing** (fields in opposite directions). This depends on the winding sense and how the coils are connected — reversing either coil's connections reverses its field.

For two coils in series with mutual coupling:

**LT = L1 + L2 ± 2M**

M is added (series-aiding) when the fields aid one another, and subtracted (series-opposing) when they oppose.

**Dot notation** is a convenient way of showing winding sense on a diagram without needing to draw the physical construction: coils with dots marked at corresponding ends have the same winding direction; if current enters both dotted ends, the fields aid, and M is added.

**Measuring M**: measure the total inductance with the coils connected series-aiding (LTa), then reverse one coil's connections and measure the series-opposing total (LT0):

**M = (LTa − LT0) / 4**

## Power Loss in an Inductor

Every practical inductor has some resistance, from the wire used to wind it — usually small (and often negligible in AC calculations, since the reactance is far larger than the resistance). However, inductors carrying large currents can still dissipate significant power even with a small resistance. This wasted power is the **copper loss**:

**Copper Loss = I² × R**

Iron-core inductors also suffer two additional losses:
- **Hysteresis Loss** — power consumed reversing the magnetisation of the core each time the current direction changes.
- **Eddy-Current Loss** — heating of the core caused by circulating currents induced within the core material itself by the coil's changing magnetic field.

All of these losses appear as heat and are wasted — the energy cannot be returned to the circuit.

## Inductive Time Constant

In a DC circuit with L and R in series, the time taken for the current to reach **63.2%** of its final (maximum) value is called the **Inductive Time Constant, T**:

**T = L / R** (seconds, with L in Henrys and R in Ohms)

In practice, the current is considered to reach its maximum value (or fall to zero, after the switch opens) after about **5 × T** — because of the exponential nature of the growth/decay curve.

*Worked Example*: A 25 mH inductor is connected in series with a 5 kΩ resistor. Find the time constant and the approximate time to reach maximum current.

T = L / R = (25 × 10⁻³) / (5 × 10³) = **5 µs**

Time to reach maximum current ≈ 5T = 5 × 5 µs = **25 µs**

## Uses of Inductors

| Type | Typical Use |
|---|---|
| Air core | Concentrating a magnetic field, or controlling radio frequencies (RF chokes / tuning) |
| Iron core | 60 Hz and audio-frequency applications |
| Variable powdered-iron core | Variable inductor for tuning purposes |
| Iron core transformer | Increasing or decreasing an AC voltage from primary to secondary |
        $cnt10$,
        10
    ) RETURNING id INTO s10_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 03.11: DC Motor/Generator Theory & DC Generators
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m03_id, 'M03.11', 'DC Motor/Generator Theory & DC Generators',
        $cnt11$
# DC Motor/Generator Theory & DC Generators

## Basic Generator Theory

If a loop of wire is rotated within a magnetic field, the flux passing through the loop is continually changing — so long as the rotation continues, an EMF is induced and maintained. The magnitude of the induced voltage depends on the **rate of change of flux**. This principle is the basis of every rotating electrical generator, whether it ultimately produces AC or DC.

A generator converts mechanical energy into electrical energy by producing relative motion between loops of wire and a magnetic field, thereby inducing a voltage in the loops. The method by which the generated electricity is picked off and connected to the external circuit determines the type of machine:
- **Commutator** → DC generator
- **Slip rings** → AC generator

In both cases, the actual "collection" from the rotating machine is provided by **carbon brushes**.

**Important point:** any rotating generator, taken in isolation, always initially generates an alternating voltage in its rotating loop — it is the *method used to pick off the output* (commutator or slip rings) that determines whether the final output delivered to the external circuit is AC or DC.

### The Simple Single-Loop DC Generator

The simplest possible DC generator consists of a single loop of wire, rotating freely between the poles of a magnet. Connection to the external circuit ("load") is made through carbon brushes bearing on a **commutator** — a set of segments connected to the ends of the loop and rotating with it.

### Production of Direct Current — Commutator Action

Direct current is obtained in the external circuit by replacing the slip rings of an AC machine with an automatic reversing switch — the **commutator**. The commutator automatically reverses the connection between the loop and the external circuit at exactly the moment the loop's induced voltage itself reverses, so that current in the load always flows in the same direction.

Each end of the loop connects to one commutator segment; the load is connected via two brushes bearing on opposite sides of the commutator. As the loop rotates, an alternating voltage is induced within it, but the switching action of the commutator means that current in the external circuit is always in the same direction — described as **unidirectional**, or **"rippled DC"**. This is *not* a true, smooth DC waveform (as from a battery) but it is a significant first step towards one.

Because the commutator rotates with the loop, the brushes always contact the segment carrying the positive half of the cycle — the changeover between segments happens exactly when the loop's induced voltage passes through zero.

The output voltage of a single-loop DC generator falls to **zero twice per revolution**, producing a pronounced "ripple" in the output.

### Reducing Ripple: Multi-Loop Generators

As the number of loops in the armature is increased, the variation between the maximum and minimum output voltage is reduced, and the output approaches a steady DC value. The number of commutator segments increases in direct proportion to the number of loops: **2 segments per loop** (2 for 1 loop, 4 for 2 loops, 8 for 4 loops, and so on).

Each loop is connected between two adjacent commutator segments, so that the end of one loop shares a segment with the start of the next. With this arrangement, the EMF in each loop reaches its maximum just as the EMF of the preceding loop is beginning to fall, and that of the following loop is still rising. The voltage measured at the brushes is the sum of the EMFs of all the loops connected in series between the brushes (i.e. two parallel branches, each a series string of loops).

As the number of loops increases: the **ripple decreases**, and the **magnitude of the DC output voltage increases**.

The output voltage of a practical DC generator is determined, within narrow limits, by:

**Output Voltage ∝ (turns per loop) × (total flux per pole-pair) × (speed of rotation)**

Increasing the number of loops does not, by itself, increase the maximum generated voltage — it is increasing the **turns per loop** that does that; increasing the number of loops mainly reduces ripple.

AC and DC generators are identical in *how* voltage is generated in the rotating loop — they differ only in the method of collection: slip rings for AC, commutator for DC.

## The Practical DC Generator

High output voltages in a practical DC generator are obtained by: using many coils, each of many turns (rather than a single loop); rotating the coils at high speed; using electromagnets to produce a strong field; and mounting the coils on a soft iron core with a very small air gap to the pole pieces. Because electromagnets require a DC current to excite them, small aircraft generators commonly use their own output voltage to supply this exciting current — a technique called **self-excitation**.

### Construction — Two Main Assemblies

| Assembly | Function | Carries |
|---|---|---|
| **Stator** (fixed portion) | Provides the magnetic field and support | Field magnet system, brush gear, bearings |
| **Rotor / Armature** | Rotates within the field | Coils, commutator, (often) a cooling fan |

The **yoke** (or frame) forms the main chassis of the machine and completes the magnetic circuit between the pole pieces — normally made of **cast or rolled steel**.

### Field Magnet System

Except in the smallest machines (which may use permanent magnets), the field is produced by electromagnets, so that the armature conductors pass under alternating North and South poles. Poles may be:
- **Salient poles** — produce a flat-topped armature EMF waveform. This is by far the **most common** arrangement in aircraft DC generators.
- **Flush / low-reluctance poles** — produce a near-sinusoidal waveform.

### Brush Gear

Brushes are usually made of specially-treated **carbon** (self-lubricating, causes little commutator wear), held in open-ended **brush holders**, with contact pressure maintained by **springs**, and connected to the external circuit via flexible copper braid **pigtails**.

**High-Altitude Brush Wear:** electro-graphitic brushes can wear very rapidly at high altitude (rates of up to 12 mm per hour have been recorded), for two related reasons:
1. At low altitude, atmospheric moisture lubricates the brush/commutator interface. At high altitude there is negligible moisture, so friction (and therefore wear) increases sharply.
2. Normally, a thin resistive film forms on the commutator/slip-ring surface from the electrolytic decomposition of atmospheric moisture, giving a fairly high, stable contact resistance. At high altitude this film is worn away by friction and cannot reform in the dry atmosphere — contact resistance drops sharply, causing heavy **reactive sparking**, which accelerates brush erosion still further.

**High-altitude brushes** are specially developed to address this, in two categories:
- **Film-forming brushes** — contain chemicals (e.g. barium fluoride) that progressively build up a constant-resistance, semi-lubricating film on the commutator surface. These brushes do not wear abnormally up to around 35,000 ft, *provided* the generator has first been run at low altitude for a specified period to allow the film to form. This film looks very dark and can easily be mistaken for a dirty commutator.
- **Non-film-forming brushes** — contain a lubricating ingredient (e.g. molybdenum disulphide) packed into longitudinal cores through the brush body. They are self-lubricating and need no run-in period before high-altitude operation, but have a **shorter service life** than film-forming brushes.

**Critical precaution:** film-forming and non-film-forming brushes must **never be mixed** in the same machine, and non-film-forming brushes must never be run on a film created by film-forming brushes. Changing brush type requires the existing film to be completely removed from the commutator first.

### The Armature

The armature comprises a shaft, an iron core, output windings and a commutator. The core is a **laminated soft iron drum** (laminated to reduce eddy-current losses), providing a low-reluctance path that increases flux density. Output windings sit in longitudinal slots in the core, and the whole assembly is **vacuum-impregnated with silicone varnish** (to maintain insulation resistance in all conditions) with coils also insulated with **PTFE**. Windings are wedged in place to resist ejection by centrifugal force, and all coil connections are **silver-soldered** to withstand local hot-spot temperatures.

### Wave Winding vs Lap Winding

| Winding | Connection | Best For | Notes |
|---|---|---|---|
| **Wave winding** | Coils connected so voltages from each pole-pair *add* in series | High output **VOLTAGE** | Output taken across only one pair of brushes; voltage = N× that of an equivalent 2-pole machine |
| **Lap winding** | Groups of series coils connected in **parallel** via additional brushes | High output **CURRENT** | 4-pole machine gives 4 parallel current paths (2+2 brushes); 6-pole gives 6 paths (3+3 brushes) |

### Generator Cooling

The maximum output of a generator (given unlimited mechanical input) is largely limited by its ability to dissipate heat. Natural radiative cooling is hopelessly inadequate for a lightweight, high-output aircraft generator, so forced cooling is used. Most current aircraft generators are **blast-cooled** by slipstream air; generators on more modern aircraft are commonly **oil-cooled**.

### Generator Drives — Quill Drives

The drive connecting the generator to its prime mover (usually the engine) must: transmit torque effectively up to a specified maximum; **interrupt** torque transmission if the demand exceeds that maximum (e.g. if the rotor seizes); and be quick and simple to remove and replace.

This is achieved with a **quill drive** — a "necked" (deliberately reduced-diameter) shaft with splines at one or both ends. The necked section is designed as a **weak link**, engineered to **shear** in the event of a rotor seizure, protecting the rest of the drive train from damage.

## Commutation Problems

Commutator/brush gear performs two distinct functions:
- **Collection** — transferring current between the rotating armature and the fixed external circuit.
- **Commutation** — the periodic reversal of current during that transfer, which produces DC.

Although independent, faulty collection and incorrect commutation produce similar symptoms: destructive sparking and arcing at the trailing edge of the brushes. **Faulty collection** is normally the result of poor brush fitting or maintenance.

### Armature Reaction

Current flowing in the armature windings sets up its own magnetic field (the **armature flux**), at right angles to the main field flux — this is called **cross-magnetisation**. The armature flux distorts the field flux, shifting the **Magnetic Neutral Axis (MNA)** — the effect known as **armature reaction**, which is proportional to the armature current.

The **Geometric Neutral Axis (GNA)** is the axis running through the centre of the poles. Brushes must be positioned on the **MNA**, so that they contact segments connected to armature coils that have no induced EMF at that instant. If the brushes are outside the MNA, they short-circuit "live" coils, causing arcing and power loss — **reactive sparking**.

In an ideal machine the MNA would coincide with the GNA at all times (no field distortion). No such machine exists, so armature reaction must be compensated for. Three principal remedies:

1. **Repositioning the brushes** to sit on the MNA for the *normal* load current — satisfactory only for machines with a fairly **constant load** (typically 1000 W or less), since the MNA shifts with varying load and the brushes cannot follow it dynamically. Most common on smaller generators.
2. **Interpoles** — additional field poles, wound with windings in **series with the load**, so their effect is proportional to load current. Their polarity is arranged to oppose the effect of armature reaction, "pulling" the field back into the correct position. A very efficient way of maintaining a constant MNA, and used on larger generators.
3. **Compensating windings** — windings embedded in the main pole faces, carrying current in the direction **opposite** to the armature current, connected in series with the armature so their current always equals the armature current. This **cancels** the armature flux under all load conditions, keeping MNA = GNA at all times.

Interpoles and compensating windings are sometimes used **together**, giving the most efficient reduction of both armature reaction and reactive sparking — producing "sparkless commutation," extending brush/commutator life, reducing radio interference, and improving efficiency.

## Types of DC Generators and Their Characteristics

DC generators are classified by how their magnetic field is excited:

- **Permanent Magnet Generators**
- **Separately Excited Generators**
- **Self-Excited Generators** (series, shunt, or compound wound)

### Permanent Magnet Generators

The simplest general-purpose DC generator (e.g. certain insulation testers). Field flux comes from high-grade permanent magnets. Open-circuit EMF is **proportional to speed** (field strength is fixed). Under load, terminal voltage falls slightly — a **falling characteristic** — due to (a) weakening of the main flux by armature reaction, and (b) IR voltage drop in the armature winding and brushes.

### Separately Excited Generators

The field winding is connected to an **independent DC source** (a battery, or a small DC generator called "the exciter"), usually with a variable resistor to regulate excitation current. Connecting a load does not affect the field current — it stays constant, so terminal voltage falls only slightly with load (IR drop in armature/brushes/compensating windings). At a constant speed, terminal voltage is fully controllable over a **wide range**, from near-zero up to a maximum limited by field saturation. Particularly suitable where **complete control of voltage over a wide range** is required.

### Self-Excited Generators — Residual Magnetism and "Flashing the Field"

Self-excited machines rely on **residual magnetism** left in the pole pieces to start the excitation process: as soon as a small armature current flows, the field builds up progressively until full output is reached. Mishandling a generator off the aircraft (excessive heat, vibration, dropping, or prolonged storage on metal racks) can cause this residual magnetism to be **lost**.

If lost, it can be restored by **"flashing" the field** — briefly connecting a DC supply, equivalent to the generator's rated output, directly across the field winding (with the generator itself disconnected), then removing it. The rapid collapse of this "flashing" field induces a small amount of permanent magnetism in the pole pieces — the new residual magnetism.

### Series Wound Generators

Field current equals (or is proportional to) load current — the field coils are a few turns of heavy, low-resistance wire in series with both armature and load. With no external load, there is no field current, so open-circuit EMF comes from residual magnetism alone. As load resistance falls, more current flows through both armature and field, raising flux density and generated EMF — until magnetic saturation limits further rise, at which point terminal voltage begins to **fall** with further load increase (increasing winding IR drop). Series generators have **very limited application** and are **not used** for aircraft main power supplies.

### Shunt Wound Generators

The field winding is connected in **parallel** with the armature — armature current divides between the field winding and the external load. The shunt field is deliberately **high resistance** (many turns of fine wire) to keep its current, and hence wasted power, small.

**Voltage build-up**: as the armature rotates, it initially cuts only the weak residual flux, inducing a small EMF; this is applied to the field winding, causing a small current to flow that reinforces the flux — this progressively increases both induced EMF and field current until the open-circuit maximum voltage is reached.

**Load characteristic**: terminal voltage falls somewhat as load increases (IR drop in the armature, plus flux weakening from armature reaction if not compensated). This voltage fall reduces field current, which further weakens the flux — a self-reinforcing effect. If a normally-excited field is well saturated, this overall voltage drop stays small and roughly constant across the working load range; but if loading is pushed beyond the rated maximum, terminal voltage collapses steeply and the generator eventually **shuts down** (voltage and current both fall to zero).

**Critical operating rule**: if a shunt generator is started with the load *already connected*, the initial excitation (from residual magnetism alone, typically under 5% of normal) is too weak to sustain even a modest load current — the voltage never builds beyond the collapse point, and the **generator fails to excite**. Shunt generators **must therefore always be allowed to build up to their correct voltage before the load is connected**.

**Voltage regulation**: terminal voltage at a given speed can be controlled by varying a resistance in series with the field winding — increasing this resistance reduces field current, flux, and hence generated EMF and terminal voltage.

**Uses**: extensively used for **general power supply** purposes on aircraft — simple voltage control, good parallel-operation performance, and well suited to **battery charging**.

### Compound Wound Generators

Each pole piece carries **both** a shunt winding and a series winding, which may assist or oppose each other:

- **Cumulative Compound** — the series field (few turns) assists the shunt field. If the series turns are chosen so terminal voltage at no-load equals that at full load, the machine is **level compounded**; if terminal voltage actually rises with load, it is **over compounded**.
- **Differential Compound** — the series field is wound to **oppose** the shunt field, giving a volts/load characteristic that falls steeply with load, producing an approximately **constant-current** output.

**Uses**: level-compounded machines suit constant-voltage supply over **short feeders**; over-compounded machines suit constant-voltage supply over **long feeders**; differential-compounded machines are used for **lighting**, where constant current matters more than constant voltage.

## Typical Generator Fault Chart

| Defect | Possible Cause | Corrective Action |
|---|---|---|
| Failure to excite | Loss of residual magnetism | Remagnetise ("flash" the field) |
| Voltage fails to build up | Dirty commutator, glazed brushes, brush not in contact, incorrect brush position, field circuit fault | Clean commutator; clean/replace brushes; check brush position; check/repair field circuit |
| Reversed polarity | Residual magnetism reversed | Remagnetise |
| Insufficient voltage | Excessive load, weak field, insufficient speed | Reduce load; reduce shunt field rheostat resistance; increase prime mover speed |
| Excessive voltage | Excessive field strength, excessive speed | Increase shunt field rheostat resistance; reduce prime mover speed |
| Uniform sparking at all brushes | Dirty commutator, excessive load, incorrect brush position | Clean commutator; reduce load; correct brush position |
        $cnt11$,
        11
    ) RETURNING id INTO s11_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 03.12: DC Motors
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m03_id, 'M03.12', 'DC Motors',
        $cnt12$
# DC Motors

## Introduction

An electric motor converts electrical energy into mechanical energy — the **reverse function of a generator**. There is very little constructional difference between a DC motor and a DC generator; they use essentially the same parts and look alike. In fact, a given DC machine can often be used as either a motor or a generator.

### The Current-Carrying Conductor in a Magnetic Field

A current flowing through a wire placed in a magnetic field causes the wire to move — this is the working principle of the motor. The reaction between the two interacting magnetic fields (the main field, and the field around the current-carrying wire) produces the motion, i.e. **torque**, which is the motor's mechanical output. The force is directly proportional to the strengths of the two interacting fields.

Where the wire's own field reinforces the main field on one side of the conductor and opposes it on the other, the resultant field pattern effectively "pushes" the wire towards the weaker-field side. The magnitude of this force is given by:

**F = B × I × L**

where F = force (Newtons), B = flux density of the main field (Tesla), I = current in the conductor (Amperes), L = length of conductor in the field (metres).

### Fleming's Left Hand Rule (Motors)

The direction of conductor movement depends on both the current direction and the field direction, and is given by **Fleming's Left Hand Rule**:

> The First finger, Second finger and Thumb of the **left** hand are held mutually at right angles.
> - **First finger** = direction of the Field (N → S)
> - **Second finger** = direction of the (conventional) Current
> - **Thumb** = direction of Motion (thrust)

(Note the distinction: Fleming's *Left* Hand Rule applies to motors; Fleming's *Right* Hand Rule applies to generators — a different subject area, but worth remembering that the two are not interchangeable.)

### Reversing a Motor's Direction

To reverse the direction of rotation of an electromagnetic-field DC motor, the current must be reversed in **either** the armature **or** the field winding — **not both**. Simply reversing the supply connections to the whole motor has **no effect**, because doing so reverses the current in both the armature and the field simultaneously, and the motor continues to rotate the same way.

**Permanent magnet motors** are the exception — since there is no field winding to reverse, they can be reversed simply by swapping the supply connections (this reverses only the armature field).

## Principles of Operation

The simplest DC motor is a single loop of wire, free to rotate between the poles of a magnet, with a DC supply connected via brushes bearing on a two-segment commutator. Current flowing through the loop, combined with the field, produces a force on each side of the loop (by Fleming's Left Hand Rule) — these two forces combine to produce a torque, turning the loop.

As the loop rotates past the vertical position, the current direction in it must reverse to keep the torque acting in the same rotational sense — this is exactly what the commutator does automatically (as one segment leaves a brush, the other comes into contact). Rotation therefore continues steadily in the same direction, with the current reversing every half-revolution. This process is directly analogous to commutator action in a generator, except that current now flows **into** the loop from the supply, rather than being induced by rotation.

A single-loop motor cannot turn any significant load. Practical motors use a laminated iron core carrying a number of armature coils (with a corresponding number of commutator segments), a field produced by an electromagnet, and a very small air gap between armature and pole pieces, for smooth running and useful mechanical output.

## DC Motor Construction

The principal sections of a practical DC motor:

- **Armature** — a standard drum-type winding, on a laminated soft-iron core, with a commutator and (often) a brake disc mounted at either end.
- **Field** — provided by two poles formed around the armature; the field coils are **double-wound**, so the polarity (and hence direction of rotation) can be reversed.
- **Thermal protectors** — connected in circuit to prevent overheating.
- **Brake assembly** — a coil, a brake armature, and brake lining, mounted on a disc at one end of the motor armature.

## Types of DC Motor and Their Characteristics

There are three basic types, differing in how the field and armature windings are connected.

### Series DC Motor

The field winding (few turns of heavy wire) is connected in **series** with the armature — the **same current** flows through both, so any increase in current strengthens both the field and armature magnetism together. The low winding resistance allows a large starting current to flow, giving a **high starting torque** — the series motor's principal advantage.

Speed is **heavily dependent on load**: high speed with light loads, low speed with heavy loads. If the load is removed entirely, the motor can accelerate to a dangerously high speed and the armature can break apart — a series motor **must never be run unloaded**. Best suited to applications needing **high starting torque under heavy load**.

### Shunt DC Motor

The field winding is connected in **parallel** with the armature. Field winding resistance is high and connected directly across the supply, so field current — and hence field strength — remains **constant**, independent of motor speed or load; torque therefore varies only with armature current. Starting torque is **lower** than an equivalent series motor.

Speed varies **very little** with load — if the load is removed, speed rises only slightly. Particularly suited to applications where **constant speed** is required and a high starting torque is not essential.

### Compound DC Motor

A combination of both — the field carries **both** a shunt winding (many turns of fine wire, parallel with the armature) and a series winding (few turns of heavy wire, in series with it). Starting torque is **higher than a shunt motor but lower than a series motor**; speed variation with load is likewise **between** the two.

### Continuous vs Intermittent Duty

Many aircraft motors are not required to run continuously; because the heat generated in a short period is not enough to cause damage, such motors can deliver more power for their weight than a true continuous-duty motor — but would overheat and destroy their insulation if run continuously.

| Duty | Usually Wound | Typical Applications |
|---|---|---|
| **Continuous duty** | Shunt | Cooling fans, blowers, fuel pumps |
| **Intermittent duty** | Series | Landing gear, flaps, cowls, trim tabs, valves |

A **reversible** intermittent-duty motor is called an **actuator**.

## Motor Control — Back EMF

As a current-carrying conductor moves through a magnetic field, it also has an EMF induced in it (exactly as in a generator) — and by Lenz's Law, this induced EMF **opposes** the applied supply voltage that is driving the current. This opposing EMF is called the **Back EMF**.

**Effective Voltage = Applied Voltage − Back EMF**

### Worked Example — Shunt Motor Back EMF

A 24 V shunt motor has an armature resistance of 0.25 Ω and a field resistance of 12 Ω.

**No-load condition** — total supply current = 6 A.

Field current: If = V / Rf = 24 / 12 = **2 A**
Armature current: Ia = total current − If = 6 − 2 = **4 A**
Back EMF: Eb = V − (Ia × Ra) = 24 − (4 × 0.25) = 24 − 1 = **23 V**

**On-load condition** — total supply current increases to 52 A.

Field current (unchanged, since field is a fixed parallel branch): If = 2 A
Armature current: Ia = 52 − 2 = **50 A**
Back EMF: Eb = 24 − (50 × 0.25) = 24 − 12.5 = **11.5 V**

As load increases, the back EMF **falls** — this is because, as the motor is loaded, it tends to slow down slightly, reducing the rate of flux linkage change (Faraday's Law) and hence the induced back EMF. The falling back EMF increases the *effective* voltage across the armature, which increases armature current and restores torque to match the load. This self-correcting behaviour — speed and armature current continually adjusting to balance the load — is what makes the **DC motor a self-regulating machine**.

## Motor Speed Control

Because back EMF governs armature current, the motor automatically balances speed against load. At light load, shaft torque exceeds load torque, the armature accelerates, back EMF rises, armature current falls, and torque falls back into balance at a stable (higher) speed. When load torque increases, the armature slows, back EMF falls, armature current rises, torque increases, and balance is restored at a stable (lower) speed. This relationship between speed and armature current is the motor's **speed characteristic**.

Speed can deliberately be varied by adjusting the **field current**:
- Increasing field current → increases field strength → increases back EMF → motor **slows down**.
- Decreasing field current → decreases field strength → reduces back EMF → motor **speeds up**.

For a **shunt motor**, speed is controlled by a rheostat in series with the field winding: **increasing** rheostat resistance **decreases** field current and field strength (and momentarily reduces back EMF), which momentarily increases armature current and torque — the motor speeds up automatically until back EMF rises again and armature current falls back to its earlier value, settling at a new, **higher, stable speed**. Decreasing the rheostat resistance has the opposite effect.

## Reversible DC Motors

Motors driving landing gear, flaps and similar mechanisms must be able to run in either direction. As established earlier, this requires reversing current in *either* the field or the armature — but not both. Rather than use a complex reversing circuit, a **split field** (double field winding) is normally used, controlled by an **SPDT switch** that selects which winding is energised for clockwise or anticlockwise rotation. Reversible motors drawing **more than about 20–30 A** are typically controlled via a **relay**, rather than switched directly, since direct switching becomes impractical at higher currents.

Some light-duty DC motors use a **permanent magnet** instead of field coils — for these, reversing rotation only requires reversing the applied supply polarity (which reverses the armature field).

## Brakes and Clutches

Many motor-driven aircraft mechanisms must stop at a precise point — landing gear must stop instantly on completing extension or retraction. A direct connection between motor and mechanism would impose severe strain on the motor from the momentum of the armature and moving parts when forced to stop suddenly, so a **clutch and brake assembly** is used to prevent damage.

The clutch's two faces are magnetised with opposite polarities and drawn firmly together when the clutch coil is **energised**, so friction carries the mechanism with the motor. When power is removed, a **spring** separates the faces, **disengaging** the drive — preventing mechanism overrun and strain on the motor when it stops.

## Limit Switches and Thermal Protectors

Because the driven mechanism (landing gear, flaps, etc.) has limited travel, reversible actuating motors are fitted with **limit switches**, actuated by cams or levers linked to the mechanism, that cut power once the mechanism reaches the end of its travel in each direction. Adjustment of limit switches is **critical** — if misadjusted, the motor may continue running after the mechanism reaches its limit, risking stripped gears or a broken shaft. Correct practice is to run the mechanism to its travel limit and adjust the switch so it opens just **slightly before** the extreme limit is reached.

**Thermal protectors** (a thermal circuit breaker) mounted on the motor frame protect against overheating: when the motor temperature reaches a predetermined limit, the breaker opens, cutting power; after the motor has cooled sufficiently, the breaker **automatically resets**, permitting normal operation to resume.
        $cnt12$,
        12
    ) RETURNING id INTO s12_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M03.9 Magnetism (14 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s9_id, 'The Earth behaves as a huge natural magnet — this fact is the basis of:',
     '[{"id":"a","text":"The magnetic compass","correct":true},{"id":"b","text":"Eddy current damping","correct":false},{"id":"c","text":"The commutator","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s9_id, 'A material that is easily magnetised but also loses its magnetism easily makes a good:',
     '[{"id":"a","text":"Permanent magnet","correct":false},{"id":"b","text":"Temporary magnet","correct":true},{"id":"c","text":"Diamagnetic shield","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s9_id, 'Outside a bar magnet, lines of magnetic force run:',
     '[{"id":"a","text":"From South pole to North pole","correct":false},{"id":"b","text":"From North pole to South pole","correct":true},{"id":"c","text":"Randomly, with no fixed direction","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s9_id, 'Two magnetic poles have pole strengths P1 and P2 and are separated by distance d. The force between them is given by:',
     '[{"id":"a","text":"F = (P1 + P2) × d","correct":false},{"id":"b","text":"F = (P1 × P2) / d²","correct":true},{"id":"c","text":"F = (P1 × P2) × d²","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s9_id, 'Flux density B is defined as:',
     '[{"id":"a","text":"B = Φ × A","correct":false},{"id":"b","text":"B = Φ / A","correct":true},{"id":"c","text":"B = A / Φ","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s9_id, 'The direction of the magnetic field around a straight current-carrying conductor is found using:',
     '[{"id":"a","text":"The Corkscrew Rule","correct":true},{"id":"b","text":"Fleming''s Left Hand Rule","correct":false},{"id":"c","text":"Lenz''s Law","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s9_id, 'Two parallel conductors carry current in the SAME direction. The conductors will:',
     '[{"id":"a","text":"Attract each other","correct":true},{"id":"b","text":"Repel each other","correct":false},{"id":"c","text":"Have no force between them","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s9_id, 'The direction of the North pole of a solenoid can be found using:',
     '[{"id":"a","text":"The Right Hand Grasp Rule","correct":true},{"id":"b","text":"Fleming''s Right Hand Rule","correct":false},{"id":"c","text":"The Corkscrew Rule applied end-on only","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s9_id, 'Magnetomotive force (MMF) is calculated using:',
     '[{"id":"a","text":"MMF = I / N","correct":false},{"id":"b","text":"MMF = I × N","correct":true},{"id":"c","text":"MMF = N / I","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s9_id, 'In the electricity/magnetism analogy, magnetic Reluctance corresponds to which electrical quantity?',
     '[{"id":"a","text":"Current","correct":false},{"id":"b","text":"EMF","correct":false},{"id":"c","text":"Resistance","correct":true}]',
     '{"B1.1","B1.3","B2"}'),

    (s9_id, 'Permeability (µ) of a medium is defined as:',
     '[{"id":"a","text":"µ = H / B","correct":false},{"id":"b","text":"µ = B / H","correct":true},{"id":"c","text":"µ = B × H","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s9_id, 'When an iron core has all of its magnetic domains aligned and further magnetising force produces no further increase in flux density, the core is said to be:',
     '[{"id":"a","text":"Demagnetised","correct":false},{"id":"b","text":"Saturated","correct":true},{"id":"c","text":"Diamagnetic","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s9_id, 'A sensitive instrument is protected from stray magnetic fields by enclosing it in a soft iron case. This works because:',
     '[{"id":"a","text":"Soft iron insulates against magnetic flux","correct":false},{"id":"b","text":"Soft iron redirects the flux around the instrument via a lower-reluctance path","correct":true},{"id":"c","text":"Soft iron cancels the flux by generating an opposing field","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s9_id, 'A horseshoe magnet should be stored with:',
     '[{"id":"a","text":"A soft iron keeper joining its poles","correct":true},{"id":"b","text":"Its poles left completely exposed to maximise field strength","correct":false},{"id":"c","text":"A copper bar joining its poles","correct":false}]',
     '{"B1.1","B1.3","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M03.10 Inductance / Inductors (14 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s10_id, 'On a hysteresis loop, the flux density remaining in a core after the magnetising current has been reduced to zero is called the:',
     '[{"id":"a","text":"Coercive force","correct":false},{"id":"b","text":"Remanence","correct":true},{"id":"c","text":"Retentivity","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s10_id, 'Retentivity is defined as:',
     '[{"id":"a","text":"Remanence / Coercive Force","correct":false},{"id":"b","text":"Coercive Force / Remanence","correct":true},{"id":"c","text":"Coercive Force × Remanence","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s10_id, 'According to Faraday''s Law, the magnitude of an induced EMF is proportional to:',
     '[{"id":"a","text":"The total flux linking the coil","correct":false},{"id":"b","text":"The rate of change of flux","correct":true},{"id":"c","text":"The resistance of the coil","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s10_id, 'Lenz''s Law states that the direction of an induced EMF always:',
     '[{"id":"a","text":"Aids the change of flux that produced it","correct":false},{"id":"b","text":"Opposes the change of flux that produced it","correct":true},{"id":"c","text":"Is unrelated to the direction of flux change","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s10_id, 'One henry is defined as the inductance that induces:',
     '[{"id":"a","text":"1 volt for a current change of 1 amp per second","correct":true},{"id":"b","text":"1 amp for a voltage change of 1 volt per second","correct":false},{"id":"c","text":"1 watt for a current change of 1 amp per second","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s10_id, 'Current in an inductor changes from 10 A to 14 A in 2 seconds. What is di/dt?',
     '[{"id":"a","text":"2 A/s","correct":true},{"id":"b","text":"4 A/s","correct":false},{"id":"c","text":"7 A/s","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s10_id, 'A coil induces 60 V when its current changes at a rate of 12 A/s. What is its inductance?',
     '[{"id":"a","text":"0.2 H","correct":false},{"id":"b","text":"5 H","correct":true},{"id":"c","text":"72 H","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s10_id, 'A 2 H inductor has a current changing at 15 A/s through it. What is the self-induced voltage?',
     '[{"id":"a","text":"7.5 V","correct":false},{"id":"b","text":"17 V","correct":false},{"id":"c","text":"30 V","correct":true}]',
     '{"B1.1","B1.3","B2"}'),

    (s10_id, 'Doubling the number of turns on a coil (all else unchanged) changes its inductance by a factor of:',
     '[{"id":"a","text":"2","correct":false},{"id":"b","text":"4","correct":true},{"id":"c","text":"8","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s10_id, 'Two inductors, 8 mH and 12 mH, are connected in series with no mutual coupling. What is the total inductance?',
     '[{"id":"a","text":"4.8 mH","correct":false},{"id":"b","text":"20 mH","correct":true},{"id":"c","text":"96 mH","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s10_id, 'Two coils, L1 = 6 mH and L2 = 4 mH, are connected series-aiding with a mutual inductance M = 2 mH. What is the total inductance?',
     '[{"id":"a","text":"8 mH","correct":false},{"id":"b","text":"10 mH","correct":false},{"id":"c","text":"14 mH","correct":true}]',
     '{"B1.1","B1.3","B2"}'),

    (s10_id, 'A 25 mH inductor is connected in series with a 5 kΩ resistor. What is the inductive time constant?',
     '[{"id":"a","text":"5 µs","correct":true},{"id":"b","text":"5 ms","correct":false},{"id":"c","text":"125 µs","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s10_id, 'In an RL circuit, current is considered to have reached its maximum value after approximately:',
     '[{"id":"a","text":"1 time constant","correct":false},{"id":"b","text":"2.5 time constants","correct":false},{"id":"c","text":"5 time constants","correct":true}]',
     '{"B1.1","B1.3","B2"}'),

    (s10_id, 'The power lost in an inductor due to I²R heating in its winding resistance is called:',
     '[{"id":"a","text":"Hysteresis loss","correct":false},{"id":"b","text":"Eddy-current loss","correct":false},{"id":"c","text":"Copper loss","correct":true}]',
     '{"B1.1","B1.3","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M03.11 DC Motor/Generator Theory & DC Generators (18 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s11_id, 'Whether a rotating machine produces AC or DC output is determined by:',
     '[{"id":"a","text":"The direction of rotation of the armature","correct":false},{"id":"b","text":"The method used to collect the output — slip rings for AC, commutator for DC","correct":true},{"id":"c","text":"The material used for the field poles","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s11_id, 'A single-loop DC generator with a two-segment commutator produces an output that:',
     '[{"id":"a","text":"Is smooth, ripple-free DC","correct":false},{"id":"b","text":"Falls to zero twice per revolution (rippled DC)","correct":true},{"id":"c","text":"Is a true sine wave AC output","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s11_id, 'As the number of loops (and corresponding commutator segments) in a DC generator armature is increased:',
     '[{"id":"a","text":"Output ripple increases","correct":false},{"id":"b","text":"Output ripple decreases and output approaches steady DC","correct":true},{"id":"c","text":"Output becomes pure AC","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s11_id, 'The output voltage of a DC generator is determined, within narrow limits, by turns per loop, total flux per pole-pair, and:',
     '[{"id":"a","text":"Number of commutator segments alone","correct":false},{"id":"b","text":"Speed of rotation of the armature","correct":true},{"id":"c","text":"Diameter of the brushes","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s11_id, 'In a practical DC generator, the STATOR (fixed) assembly carries the field magnet system, bearings, and:',
     '[{"id":"a","text":"The commutator","correct":false},{"id":"b","text":"The brush gear","correct":true},{"id":"c","text":"The armature windings","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s11_id, 'Salient pole construction in a DC generator produces an armature EMF waveform that is:',
     '[{"id":"a","text":"Flat-topped","correct":true},{"id":"b","text":"A perfect sine wave","correct":false},{"id":"c","text":"A square wave","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s11_id, 'At high altitude, electro-graphitic brushes wear rapidly mainly because:',
     '[{"id":"a","text":"Atmospheric pressure crushes the brush material","correct":false},{"id":"b","text":"Lack of atmospheric moisture removes lubrication and the protective resistive film","correct":true},{"id":"c","text":"Cold temperatures make carbon brittle","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s11_id, 'Film-forming and non-film-forming high-altitude brushes:',
     '[{"id":"a","text":"May always be freely mixed in the same generator","correct":false},{"id":"b","text":"Must never be mixed in the same machine","correct":true},{"id":"c","text":"Are identical in composition","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s11_id, 'A wave-wound DC generator armature is used mainly to obtain:',
     '[{"id":"a","text":"High output current","correct":false},{"id":"b","text":"High output voltage","correct":true},{"id":"c","text":"Reduced armature reaction","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s11_id, 'A lap-wound DC generator armature is used mainly to obtain:',
     '[{"id":"a","text":"High output voltage","correct":false},{"id":"b","text":"High output current","correct":true},{"id":"c","text":"Reduced brush wear","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s11_id, 'Aircraft generator drives typically incorporate a quill drive because it:',
     '[{"id":"a","text":"Increases the maximum torque the generator can produce","correct":false},{"id":"b","text":"Acts as a weak link, shearing to protect the drive train if the rotor seizes","correct":true},{"id":"c","text":"Reduces the generator''s operating speed","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s11_id, 'Armature reaction is caused by:',
     '[{"id":"a","text":"The armature''s own magnetic flux distorting the main field flux","correct":true},{"id":"b","text":"Excessive brush spring pressure","correct":false},{"id":"c","text":"Incorrect commutator segment insulation","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s11_id, 'Interpole windings in a DC generator are connected:',
     '[{"id":"a","text":"In series with the load, so their effect is proportional to load current","correct":true},{"id":"b","text":"In parallel with the field winding only","correct":false},{"id":"c","text":"Directly across the supply, independent of load","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s11_id, 'Compensating windings are placed in the pole faces and carry current in a direction:',
     '[{"id":"a","text":"The same as the armature current, to reinforce armature flux","correct":false},{"id":"b","text":"Opposite to the armature current, to cancel armature flux","correct":true},{"id":"c","text":"Perpendicular to the armature current","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s11_id, 'Brush repositioning as a remedy for armature reaction is only satisfactory for:',
     '[{"id":"a","text":"Machines with fairly constant load, typically 1000 W or less","correct":true},{"id":"b","text":"Large generators with widely varying load","correct":false},{"id":"c","text":"Any size of generator under any load condition","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s11_id, 'A shunt-wound DC generator is started with the load already connected. The most likely result is:',
     '[{"id":"a","text":"The generator will build up voltage more quickly than normal","correct":false},{"id":"b","text":"The generator will fail to excite","correct":true},{"id":"c","text":"The generator polarity will automatically reverse","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s11_id, 'Residual magnetism lost from a self-excited generator''s pole pieces can be restored by:',
     '[{"id":"a","text":"Increasing the generator''s rotational speed only","correct":false},{"id":"b","text":"\"Flashing\" the field with a DC supply across the field winding","correct":true},{"id":"c","text":"Running the generator at reduced load for an extended period","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s11_id, 'A generator shows uniform sparking at all brushes and is on excessive load. According to the typical fault chart, the appropriate action is:',
     '[{"id":"a","text":"Reduce the load","correct":true},{"id":"b","text":"Remagnetise the field","correct":false},{"id":"c","text":"Reverse the direction of rotation","correct":false}]',
     '{"B1.1","B1.3","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M03.12 DC Motors (14 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s12_id, 'An electric motor converts:',
     '[{"id":"a","text":"Mechanical energy into electrical energy","correct":false},{"id":"b","text":"Electrical energy into mechanical energy","correct":true},{"id":"c","text":"Electrical energy into magnetic energy only, with no mechanical output","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s12_id, 'The force on a current-carrying conductor in a magnetic field is given by:',
     '[{"id":"a","text":"F = B / (I × L)","correct":false},{"id":"b","text":"F = B × I × L","correct":true},{"id":"c","text":"F = B + I + L","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s12_id, 'Fleming''s LEFT Hand Rule is used to determine motor action. The First finger represents:',
     '[{"id":"a","text":"Current","correct":false},{"id":"b","text":"Motion","correct":false},{"id":"c","text":"Field (N to S)","correct":true}]',
     '{"B1.1","B1.3","B2"}'),

    (s12_id, 'To reverse the direction of rotation of a DC motor with an electromagnetic field, you should:',
     '[{"id":"a","text":"Reverse the supply connections to the whole motor","correct":false},{"id":"b","text":"Reverse the current in either the armature or the field winding, but not both","correct":true},{"id":"c","text":"Reverse the current in both the armature and the field winding simultaneously","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s12_id, 'A permanent magnet DC motor is reversed by:',
     '[{"id":"a","text":"Swapping the supply connections","correct":true},{"id":"b","text":"Reversing only the field winding connections","correct":false},{"id":"c","text":"Physically rotating the permanent magnet 180°","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s12_id, 'A series-wound DC motor is best suited to applications requiring:',
     '[{"id":"a","text":"Constant speed regardless of load","correct":false},{"id":"b","text":"High starting torque under heavy load","correct":true},{"id":"c","text":"Operation with no load connected","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s12_id, 'A series DC motor must never be run:',
     '[{"id":"a","text":"At reduced voltage","correct":false},{"id":"b","text":"Unloaded, as it may overspeed and the armature may break apart","correct":true},{"id":"c","text":"At high starting current","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s12_id, 'A shunt-wound DC motor is characterised by:',
     '[{"id":"a","text":"Speed varying very little with load","correct":true},{"id":"b","text":"Very high starting torque compared to a series motor","correct":false},{"id":"c","text":"Danger of overspeeding when run unloaded","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s12_id, 'Continuous-duty aircraft motors, such as those driving cooling fans and fuel pumps, are usually:',
     '[{"id":"a","text":"Series wound","correct":false},{"id":"b","text":"Shunt wound","correct":true},{"id":"c","text":"Permanent magnet only","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s12_id, 'A reversible intermittent-duty motor used to actuate a mechanism such as landing gear is called a(n):',
     '[{"id":"a","text":"Exciter","correct":false},{"id":"b","text":"Actuator","correct":true},{"id":"c","text":"Interpole motor","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s12_id, 'A 24 V shunt motor has armature resistance 0.25 Ω and field resistance 12 Ω. On no-load it draws 6 A total. What is the armature current?',
     '[{"id":"a","text":"2 A","correct":false},{"id":"b","text":"4 A","correct":true},{"id":"c","text":"6 A","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s12_id, 'Using the same motor as above (24 V, Ra = 0.25 Ω, armature current 4 A on no-load), what is the back EMF?',
     '[{"id":"a","text":"11.5 V","correct":false},{"id":"b","text":"23 V","correct":true},{"id":"c","text":"24 V","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s12_id, 'As load on a DC motor increases, the back EMF:',
     '[{"id":"a","text":"Increases, since the motor speeds up","correct":false},{"id":"b","text":"Falls, since the motor slows down slightly, which increases armature current and restores torque","correct":true},{"id":"c","text":"Remains completely unaffected by load","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s12_id, 'In a shunt motor, increasing the resistance of a rheostat in series with the field winding causes the motor to:',
     '[{"id":"a","text":"Slow down permanently until stalled","correct":false},{"id":"b","text":"Speed up and settle at a new, higher stable speed","correct":true},{"id":"c","text":"Reverse direction of rotation","correct":false}]',
     '{"B1.1","B1.3","B2"}');

END $$;
