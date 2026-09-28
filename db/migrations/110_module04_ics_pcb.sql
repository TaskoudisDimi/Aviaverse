-- Module 04: Electronic Fundamentals (B1/B2 Common) — Integrated Circuits, Printed Circuit Boards
-- Source: EASA Part-66 Module 04 B1 official textbook (Aircraft Technical Book Company); IK Module 4 B2 course notes (IKAROS)

DO $$
DECLARE
    m04_id INT;
    s3_id  INT;
    s4_id  INT;
BEGIN
    SELECT id INTO m04_id FROM easa_modules WHERE code = 'M04';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M04.3') THEN
        RAISE NOTICE 'M04.3/M04.4 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 04.3: Integrated Circuits
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m04_id, 'M04.3', 'Integrated Circuits',
        $cnt3$
# Integrated Circuits

## Digital Building Blocks

Transistors are used in digital electronics to construct circuits that act as digital logic gates. The purpose and task of a device is achieved by manipulating electric signals through these logic gates. Thousands, and even millions, of tiny transistors can be placed on a chip to create the digital logic landscape through which a component's signals are processed.

Digital logic is based on the **binary number system**. There are only two conditions that may exist: **1** or **0**. In a digital circuit, these two conditions are equivalent to **voltage** or **no voltage**. Within the binary system, the two conditions are called **Logic 1** and **Logic 0**. Using just these two conditions, gates can be constructed to manipulate information. By combining any number of these tiny solid-state gates, significant memorisation, manipulation, and calculation of information can be performed.

When using transistors to build logic gates, the primary design concern is to operate the transistors so that they are either **fully OFF (not conducting)** or **fully ON (saturated)**. In this manner, reliable logic functions can be performed. The variable voltage and current conditions present during the transistor's *active* (linear) mode are of comparatively little importance in a digital gate — only the two saturated states matter.

To understand the behaviour of a logic gate, a **truth table** is used. A truth table lists, in binary terms, every possible combination of inputs and the resulting output for a given gate. When examining and discussing digital electronic circuits, the internal transistor-level circuit diagram of a gate is not normally shown — a **logic symbol** is used instead, so the technician can concentrate on how the gates are configured in relation to one another rather than on their internal construction.

## Logic Gates

### NOT Gate

The NOT gate is the simplest of all gates. It has a single input and a single output. If the input to the gate is Logic 1, the output is NOT Logic 1 — i.e. it is Logic 0 (there are only two possible conditions in the binary world). In an electronic circuit, a NOT gate inverts the input signal: if there is voltage at the input, there is no voltage at the output, and vice versa. The gate is constructed from transistors, resistors and (in some designs) diodes to reliably produce this inversion every time.

| A (in) | B (out) |
|--------|---------|
| 0 | 1 |
| 1 | 0 |

### Buffer Gate

The buffer is another single-input, single-output gate — but unlike the NOT gate, its output equals its input. While this might seem redundant, a buffer performs a genuinely useful function as an **amplifier**: if there is voltage present at the input, there is an output voltage; if there is no voltage at the input, there is no output voltage. As an amplifier, the buffer can restore or stabilise the values of a weak or varying signal. A buffer is, in fact, two consecutive NOT gates, and one of its common applications is to electrically **isolate** one portion of a circuit from another while preserving the logic level.

| A (in) | Output |
|--------|--------|
| 0 | 0 |
| 1 | 1 |

### AND Gate

Most common logic gates have two inputs (three or more are possible on some gates). For an AND gate to produce a Logic 1 output, **both inputs must be Logic 1**. In an actual electronic circuit, this means voltage must be present at both inputs before there is voltage at the output. There is only one combination of inputs that produces a Logic 1 output.

| A | B | Output |
|---|---|--------|
| 0 | 0 | 0 |
| 0 | 1 | 0 |
| 1 | 0 | 0 |
| 1 | 1 | 1 |

### OR Gate

For an OR gate to have a Logic 1 output, **at least one** of the inputs must be Logic 1. Only one input needs to be Logic 1 for the output to be Logic 1; when both inputs are Logic 1, the output is still Logic 1 because the condition ("at least one input is Logic 1") is still satisfied.

| A | B | Output |
|---|---|--------|
| 0 | 0 | 0 |
| 0 | 1 | 1 |
| 1 | 0 | 1 |
| 1 | 1 | 1 |

### NAND Gate

The AND, OR and NOT gates are the three basic logic gates; a few other useful gates can be derived by combining them. The **NAND gate is an AND gate followed by a NOT gate** — the AND condition must first be met, and the result is then inverted. For a Logic 1 output to exist, inputs A and B must **not both** be Logic 1; if both inputs are Logic 1, the output is Logic 0. The output column of the NAND truth table is the exact opposite of the AND gate's output column.

| A | B | Output |
|---|---|--------|
| 0 | 0 | 1 |
| 0 | 1 | 1 |
| 1 | 0 | 1 |
| 1 | 1 | 0 |

### NOR Gate

The NOR gate is similarly derived, but as an **inverted OR gate**. For a Logic 1 output, neither input can be Logic 1. This is equivalent to satisfying the OR gate condition and then passing the result through a NOT gate. The NOR truth table's output values are the exact opposite of the OR gate's.

| A | B | Output |
|---|---|--------|
| 0 | 0 | 1 |
| 0 | 1 | 0 |
| 1 | 0 | 0 |
| 1 | 1 | 0 |

### NAND and NOR as Universal Gates

The NAND gate and the NOR gate each have a unique distinction: either one, used exclusively, can be arranged in circuitry to reproduce the output of any of the other logic gate types. Although it may be inefficient to do so, this flexibility is why NAND and NOR gates in particular are valued by circuit designers.

### Exclusive OR (XOR) Gate

The EXCLUSIVE OR gate behaves like an OR gate **except** for the case where both inputs are Logic 1. In a plain OR gate, both inputs being Logic 1 still gives a Logic 1 output; in an EXCLUSIVE OR gate this case is specifically excluded, and the output is Logic 0. Whenever *either* (but not both) of the inputs is Logic 1, the output is Logic 1.

| A | B | Output |
|---|---|--------|
| 0 | 0 | 0 |
| 0 | 1 | 1 |
| 1 | 0 | 1 |
| 1 | 1 | 0 |

### Negative Logic Gates

Negative AND and negative OR gates invert the **inputs** rather than the output, which produces a unique set of output values. A negative OR gate is **not** the same thing as a NOR gate, and a negative AND gate is **not** the same thing as a NAND gate — although, by coincidence, the truth table of a negative AND gate turns out identical to that of a NOR gate, and the truth table of a negative OR gate turns out identical to that of a NAND gate.

| Negative AND: A | B | Output |
|---|---|--------|
| 0 | 0 | 1 |
| 0 | 1 | 0 |
| 1 | 0 | 0 |
| 1 | 1 | 0 |

| Negative OR: A | B | Output |
|---|---|--------|
| 0 | 0 | 1 |
| 0 | 1 | 1 |
| 1 | 0 | 1 |
| 1 | 1 | 0 |

## Digital Circuits

Electronic circuits use transistors to build logic gates that produce outputs consistent with the truth tables above. These gates are then assembled with other components into digital circuits that manipulate, compute and store data, using series of voltage / no-voltage representations of Logic 1 and Logic 0. An advantage of digital components and circuits is that the exact value of the voltage and current flow does not need to be precise — only whether it falls into the "Logic 1" band or the "Logic 0" band matters.

As a typical example: a positive voltage between **2.6 and 5.0 volts** at the input of a gate is considered an input signal of Logic 1. Any voltage less than **2.5 volts** at the gate input is considered no voltage, i.e. an input of Logic 0.

There are two major families of logic circuit: **TTL (Transistor-Transistor Logic)** and **CMOS (Complementary Metal Oxide Semiconductor)**.

### TTL (Transistor-Transistor Logic)

TTL logic circuit elements are primarily bipolar semiconductor components connected together to produce a consistent output, which may be combined with the outputs of other TTL elements to perform a task. TTL circuits operate from a **+5-volt** power source and use **positive logic**: Logic 1 corresponds to +5 volts, and Logic 0 corresponds to ground (0 volts). Different TTL circuit families exist with differing power requirements.

### CMOS (Complementary Metal Oxide Semiconductor)

CMOS logic circuits are built from **metal oxide semiconductor (MOS) transistors** rather than the bipolar junction transistors used in TTL. Because CMOS gates (and the digital circuits built from them) are constructed from fewer elements, CMOS logic circuits use less power. CMOS transistor output is triggered by a lower voltage and does not rely on current flow through the base-emitter junction the way TTL does. CMOS achieves the same logical results as TTL, but is **less susceptible to electrical interference** and operates over a **wider range of voltages** (Logic 1 is typically anywhere between roughly +3 and +18 volts, depending on the supply). CMOS technology is predominant in modern integrated circuits.

## Integrated Circuits

Integrated circuits (ICs) are nothing more than many complete digital (or analogue) electronic circuits constructed together in the same location — known as a **chip**, **processor**, **microchip** or **microprocessor**. TTL or CMOS circuits are miniaturised and manufactured on tiny, thin silicon semiconductor wafers; assemblies containing billions of transistors can fit on a chip the size of a fingernail. With so many transistors and logic gates available, a "yes/no" (binary) system of computing can be applied to virtually any task.

Integrated circuits are used in nearly every modern computing and electronic device, including the many electronic devices found on aircraft. The microscopic circuits are constructed directly on the silicon chip during manufacture and **cannot be removed or separated** from it.

A **microprocessor** contains one, or more, integrated-circuit microchips at the core of its processing unit. It responds to input in accordance with instructions held in its own memory, and is **programmable** to accomplish different tasks with little or no change to the physical processor — only the stored instructions need to change. Where the physical limitations of fitting circuitry onto a single chip are reached, designers combine more than one chip in the processor's architecture; this enables 64-bit (and wider) processing, with very fast processing times resulting from the close physical proximity of the integrated circuits within the assembly.

### Dual In-Line Package (DIP)

To facilitate the use of integrated circuits and other electronic components, packaging standards have been developed. The **Dual In-Line Package (DIP)** standard is one such standard, allowing microelectronic components to be mounted onto printed circuit boards. It calls for **two rows of connecting terminals**, equally spaced along each edge of the IC housing. The terminals' dimensions, as well as their functional use (e.g. power, ground, output), are standardised. DIP packages are produced in a variety of sizes with different numbers of terminals. Inside a DIP package there may be simple transistor circuits, logic circuits, or even complete integrated circuits and microprocessors.

## Linear Circuits and the Operational Amplifier

### Linear Circuits

A **linear circuit** is one in which the output is directly proportional to the input; if graphed, the circuit's transfer characteristic is a straight line. A circuit composed exclusively of ideal resistors, capacitors, inductors, transformers and other linear elements — components whose values remain constant regardless of the applied voltage or current — is linear. Linear circuits are comparatively easy to analyse mathematically: the sum of the inputs to a linear circuit equals the output. Linear circuits are widely used in small-signal amplifiers, differentiators and integrators.

Diodes and transistors are, by contrast, inherently **non-linear**; however, non-linear components are frequently combined into circuits that behave *approximately* linearly over their intended operating range.

### The Operational Amplifier — Overview

An **operational amplifier (op-amp)** is an electronic, high-gain **differential voltage amplifier**: its output is proportional to the *difference* between the voltages at its two inputs, and this output can be hundreds of thousands of times greater than that input difference. The output remains linear with the difference between the input potentials. Op-amps are integrated circuits, usually packaged as a DIP for easy integration into a wide variety of electronic circuits, including signal-processing circuits, control circuits, instrumentation, and even circuits used to drive small motors.

Functionally, an op-amp is a **direct-coupled amplifier with a very high open-loop voltage gain (A)**. It is normally built as an integrated circuit, and feedback techniques are used to control both its operating characteristics and its overall function; besides general-purpose amplification, it can also be arranged to carry out a number of mathematical operations (summation, differentiation, integration).

### Properties of an Ideal Op-Amp

Although unattainable in practice, modern IC op-amps closely approximate the following ideal characteristics:

- **Infinite open-loop voltage gain (A)**
- **Infinite bandwidth**, i.e. 0 Hz to infinity
- **Infinite input resistance**
- **Zero output resistance**
- **Zero offset**, i.e. output should be zero when the input is zero

### Properties of a Practical Op-Amp

A practical op-amp only approaches these ideals. As an illustration, a typical general-purpose op-amp (the type used in many laboratory experiments) has characteristics of this order:

- Open-loop gain **A₀ ≈ 200,000**
- Bandwidth depends on the amount of negative feedback applied, but the gain falls to 0 dB at just under 1 MHz
- Input resistance **Rin ≈ 2 MΩ**
- Output resistance **Rout ≈ 75 Ω**
- **Input offset voltage ≈ 1 mV** — the voltage that must be applied between the two input terminals (via two equal resistors) to obtain zero quiescent output voltage

More modern op-amp ICs, particularly those using FET input stages, approximate the ideal properties even more closely (notably far higher input resistance).

### Equivalent Circuit

The op-amp's first stage is a **differential amplifier** with two inputs, so the output voltage is proportional to the *difference* between the voltages applied to the two input terminals:

- If a signal is applied to the **inverting input** (with the non-inverting input grounded), the output is in **antiphase** with the input.
- If a signal is applied to the **non-inverting input** (with the inverting input grounded), the output is **in phase** with the input.

### Pin-Outs and Offset Null

A typical op-amp package provides terminals for the two inputs, the output, the dual power supply, and two additional **offset null** terminals. If the same input signal is applied to both input terminals, the output should theoretically be zero — in practice it is not exactly zero. For d.c. amplification this residual offset is unacceptable, so it is corrected by connecting a variable resistor (potentiometer) between the two offset-null terminals and adjusting it until the output falls to zero. For a.c. amplification, an unwanted d.c. offset can instead simply be removed with a coupling capacitor placed in series with the output.

### Power Requirements

An op-amp is most conveniently operated from a **dual, balanced d.c. power supply**, giving equal positive and negative supply voltages (±Vs), typically in the range of roughly ±5 V to ±15 V. The centre point of the supply (0 V) is common to both the input and output circuits and serves as their voltage reference. (Note: the "+" and "−" input signs on an op-amp's circuit symbol denote the non-inverting and inverting inputs — they must not be confused with the polarity signs of the power supply.)

An op-amp can also be run from a **single power supply** — the voltage difference available is the same whether it comes from, say, a 0 V-to-18 V single supply or a +9 V/0 V/−9 V dual supply — but additional components are required to bias the circuit correctly when only a single supply rail is used.

#### Output Voltage Limits

The output voltage of an amplifier can never exceed the supply voltage. If the op-amp's output is required to swing both positive and negative, the op-amp must be supplied with both positive and negative voltage rails; these rails set the limits of the output voltage, and if the output attempts to exceed them, the result is distortion (clipping).

### Operation

An op-amp has one output and two inputs: the **non-inverting input** (marked +) and the **inverting input** (marked −).

- If the voltage at the non-inverting input is positive relative to the other input, the output is positive; if negative relative to the other input, the output is negative — the non-inverting input and the output are **in phase**.
- If the voltage at the inverting input is positive relative to the other input, the output is negative; if negative relative to the other input, the output is positive — the inverting input and the output are **in antiphase**.

Basically, an op-amp is a differential amplifier: it amplifies the *difference* between the two input voltages. There are three general cases:

- If **V+ > V−**, the output is positive
- If **V+ < V−**, the output is negative
- If **V+ = V−**, the output is zero

In general terms, the output is given by:

**V₀ = A₀ × (V+ − V−)**

where A₀ is the open-loop gain.

### Negative Feedback

Because the open-loop gain of an op-amp is so extremely high, only a tiny range of input values produces an output that is directly (linearly) proportional to the input before the amplifier saturates. For example, with a gain of 10⁵ and a 9 V supply, the maximum input swing for linear amplification would be only 9 V / 10⁵ = 90 μV — of little practical use on its own.

To reduce the effective gain to a usable level and allow larger input signals to be amplified linearly, **negative feedback** is used: part of the output is fed back to the input in such a way that it produces a voltage opposing the one from which it was taken. This is done by feeding part of the output back to the **inverting** input (feedback applied to the non-inverting input would instead be *positive* feedback, and would increase rather than reduce the output).

Besides making the gain predictable, applying negative feedback also gives:
- Greater stability
- Less distortion
- Increased bandwidth

The relatively small loss in raw gain is far outweighed by these advantages.

In a simple **inverting amplifier** configuration, the signal to be amplified is applied to the inverting input through an input resistor (R1); the output is therefore in antiphase with the input. The non-inverting input is grounded. Negative feedback is supplied by a **feedback resistor (Rf)**, which feeds back a proportion of the output voltage to the inverting input. With this arrangement, the closed-loop gain can be calculated from:

**A = −Rf / R1**

For example, if Rf = 1 MΩ and R1 = 10 kΩ, the gain A = −1,000,000 / 10,000 = **−100**, so an input of 0.01 V produces an output change of 1.0 V. Crucially, the gain depends **entirely** on the values of Rf and R1, and is **totally independent** of the op-amp's own internal parameters (such as its open-loop gain A₀) — this is the key practical benefit of negative feedback.

### The Comparator

If both inputs of an op-amp are used together, **with no feedback applied**, the output voltage is given by:

**Vout = A₀ × (V2 − V1)**

where V1 is the non-inverting input and V2 is the inverting input. The difference in voltage between the two inputs is amplified, but because the open-loop gain is so large, only a very small voltage difference between the inputs (on the order of tens of microvolts) is enough to drive the output fully to one supply rail or the other. The op-amp therefore behaves like a **two-state switch**, switching high or low depending on which input is larger.

By connecting a fixed reference voltage to the inverting input, the output will swing to **+Vs** when the signal (applied to the non-inverting input) is greater than the reference, and to **−Vs** when the signal is smaller than the reference. This comparator function is widely used to detect when a signal crosses a threshold.

### The Summing Amplifier

When connected as a multi-input inverting amplifier, an op-amp can be used to **add** a number of voltages, whether a.c. or d.c. In a typical summing circuit, three input voltages (Vin1, Vin2, Vin3) are each applied through their own input resistor (R1, R2, R3 respectively) to a common summing junction. Because an ideal op-amp has infinite input impedance, no current flows into the amplifier itself, so — by Kirchhoff's current law — the currents from the three inputs must all flow through the feedback resistor Rf: I1 + I2 + I3 = If.

The output is therefore proportional to the (negative) weighted sum of the input voltages, and if Rf is greater than each input resistor, the summed inputs are also amplified. If R1 = R2 = R3 = Rin, the three inputs are summed with equal weighting; and if, in addition, Rf = Rin, the output voltage is simply the (inverted) sum of the input voltages:

**Vout = −(Vin1 + Vin2 + Vin3)**

A summing amplifier of this type can also be arranged as a simple **digital-to-analogue converter**: by making R2 twice the value of R1, and R3 twice the value of R2 (i.e. binary-weighted resistors), and applying a 3-bit digital word to the inputs (least significant bit to R1, most significant bit to R3), the output becomes the analogue equivalent of the binary word.

### The Differentiator

A basic resistor-capacitor (CR) circuit will act as a differentiating circuit, provided it has a very **short** time constant compared with the rate of change at the input; the output of a passive CR differentiator is taken from across the resistor. Using an op-amp in the circuit instead keeps the current charging the capacitor constant, which removes the exponential "droop" that would otherwise distort the output waveform of a purely passive CR circuit.

### The Integrator

A basic CR circuit will act as an **integrating** circuit, provided it has a very **long** time constant compared with the rate of change at the input; the integrating output is taken from across the capacitor. Using an op-amp, a constant input voltage produces a linear **ramp** output, because the charging current into the capacitor is held constant by the op-amp — there is no exponential curve. If the input voltage swings equally positive and negative about 0 V, the output becomes a **sawtooth** waveform, since the output at any instant is equivalent to the area under the input curve up to that point.

Differentiators and integrators are commonly used in **inertial navigation and autopilot equipment**. If the output of an accelerometer (which measures acceleration, a) is integrated once, the result represents **velocity**; if integrated a second time, the result represents **distance**:

**a = m/s² = V/s, so V = ∫a·dt**

Conversely, if distance is known and differentiated once, the result is velocity; differentiated a second time, the result is acceleration:

**ds/dt = V (velocity)**, and **dv/dt = a (acceleration)**
        $cnt3$,
        3
    ) RETURNING id INTO s3_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 04.4: Printed Circuit Boards
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m04_id, 'M04.4', 'Printed Circuit Boards',
        $cnt4$
# Printed Circuit Boards

## Introduction

An electric circuit is typically made up of various components connected together by wire. Assembling the components used in aircraft electronic systems requires the interconnection of many components by electrical conductors. Before the introduction of printed wiring, these conductors were formed from individual wires connected to components by soldering, or by screw and crimped-terminal methods.

As circuit technology developed, micro-miniaturisation, rationalisation of component layout and mounting, weight saving, and simplification of installation and maintenance all became essential design factors — and, as a result, the technique of **printing** the required circuits was adopted. In this technique, a metallic foil is first bonded to a base board made of insulating material, and a pattern is then printed and etched onto the foil to form a series of current-conducting paths, replacing the older method of discrete wiring. Connecting points and mounting pads for the soldering of components are also formed on the board, so that the board — as a single assembly — satisfies both the structural and electrical requirements of the unit it forms part of.

Printed circuit boards (PCBs) are building blocks of nearly all electronic devices, from a simple computer mouse to complex avionics radio and navigation equipment. A PCB is constructed from a thin sheet of non-conductive material, often only about **1/16 inch (1.5 mm)** thick, sized as needed to contain the required circuit(s) or to fit the housing it is to be installed in. Development of solid-state devices and transistors has allowed many required aircraft electrical functions to be carried out with small electronic circuits, saving both space and weight.

If a circuit is simple, its wiring may be formed on **one side** of the board only; where a more complex circuit is required, wiring continues onto the **reverse side**, which also serves as a mounting surface for components. Complex circuits may additionally be incorporated into **multi-layer** assemblies.

Typically, copper foil is bonded to the surface of the board in a heat-press operation, and the unwanted copper is then etched away, leaving only the conductive pathways ("traces") of the circuit. Early PCBs commonly had holes drilled at component connection points; conductive traces were formed on one side of the board, with components on the opposite side, and component leads were passed through the holes to be soldered to the traces on the reverse. Modern PCBs, by contrast, commonly **surface mount** components on the same side as the copper traces.

Circuit boards may be **single-sided**, or (more often for denser circuits) **double-sided** or **multi-layered**, with copper traces and components on both sides. Surface-mounted components allow more components and circuits to be fitted on the same board, since components can be attached on both sides. In multilayer PCBs, several layers of board are stacked and joined electrically by a hollow, rivet-like conductive path called a **via**, which resembles the through-holes of early PCBs but is itself a conductive path connecting the layers.

The circuit(s) to be placed on a board are typically designed using computer software and transferred to the bonded copper surface by various techniques; unwanted copper is then etched away, leaving only the circuit traces. Very complex circuits are possible, allowing attachment of resistors, transistors, integrated circuits and microprocessors of every type.

The soldering process required to attach components to a PCB requires special equipment with precise heat control, and is not normally performed "in the field." Removable PCBs, commonly called **cards**, allow a defective unit to be replaced, or repaired in an equipped shop by knowledgeable technicians. Boards with components already attached are often coated with a protective substance that must be removed before repairs can be carried out.

## Base Material

The base material, sometimes called the **laminate**, is the insulating material to which the conducting material is bonded; it also serves as the mounting surface for the components that make up the circuit. Base material is commonly made either of layers of **phenolic resin-impregnated paper**, or of **epoxy resin-impregnated fibreglass cloth**, bonded together to form a rigid sheet that can be readily sawn, cut, punched or drilled. The thickness of the base material is governed by the strength and stiffness required of the finished board, which in turn depend on the weight of the components to be carried and the size of the printed conductor area.

## Conductor Material

The most commonly used conducting material is **copper foil**, with a minimum purity value of **99.5%**.

## Bonding of Conductor Material

To manufacture a typical circuit board, the base material and copper foil are cut into sheets, inspected, and assembled inside a clean room in alternate layers, with stainless-steel separator plates (known as **cauls**) interposed between the layers. These steel plates are very hard, with a delicately grained surface that is imparted to the finished boards.

The layered assembly is then passed out of the clean room to be bonded in a **hot press**. During pressing, heat melts the resin in the base material so that it flows and fully wets the base material and the copper foil; pressure is applied so as to exclude all air and vapour from residual volatiles. As the resin mix polymerises, each layer of base material reaches a fully cured state with the copper foil firmly bonded to it. After cooling, the individual copper-clad boards are trimmed to size, inspected, and packed in sealed polythene bags.

## Inspections and Tests

After manufacture, all boards are inspected, and tests are carried out on selected samples in accordance with the relevant specifications.

### Appearance

The copper surface should be free from resin and defects such as blisters, wrinkles, pinholes, bumps, deep scratches and pits. Discolouration or surface contamination is removed with an aqueous solution of hydrogen chloride, or a suitable organic solvent.

### Thickness

Board thickness is checked to ensure it does not depart from the specified nominal thickness at any point. A typical thickness range is 0.031 to 0.125 in, with preferred tolerances of 0.0035 to 0.008 in for paper-base material, and 0.006 to 0.012 in for glass-cloth base material.

### Bow and Twist

**Bow** is measured parallel to the edges of the board: the board is laid concave-side up on a flat horizontal surface, and a straight edge is offered to the upper surface along the direction of maximum curvature — the maximum clearance between the board and the straight edge is the measure of bow.

**Twist** is measured with the predominantly concave side of the board face-down on a flat horizontal surface, and is taken as the separation of one corner of the board (on the concave side) from the surface, while the other three corners are held lightly in contact with it.

### Peel Strength

Peel strength is the minimum load required to pull a strip of foil away from the base material. The foil is detached at one end of the specimen and pulled perpendicular to the plane of the board, peeling off a specified length of foil at a steady rate, with load measured by a suitable device (e.g. a spring balance). Typical minimum values are not less than **12 ozf per inch width** for phenolic-paper base material, and not less than **24 ozf per inch width** for epoxy-glass base material.

### Heat Resistance by Solder

A one-inch-square specimen of the board is floated, copper face downward, on the surface of clean molten solder at a temperature of approximately **250°C ± 2°C**, and left in contact with the solder for **10 seconds**. At the end of this time the copper should show no signs of blistering or delamination. For double-clad boards, a fresh specimen is used to test each side.

### Pull-Off Strength

A specimen is printed with a test pattern of up to ten "lands." A hole is drilled through the centre of each land and, after tinning, a short length of hard-drawn brass wire is passed through each hole and soldered at right angles to the land. A load is then applied to the free end of each wire, perpendicular to the board surface, using a tensile testing machine, and increased until the land is pulled from the base material. The minimum acceptable pull-off force is typically **7 lbf** for phenolic-paper base materials and **15 lbf** for epoxy-glass base materials.

### Electrical Tests

On each batch of boards, certain electrical properties are also investigated using specimens printed with specific circuit patterns:

- **Surface resistance** — ascertains the insulation resistance (in megohms) between adjacent printed conductors when a test voltage of either 85 or 500 volts d.c. is applied for one minute.
- **Loss tangent** (also called dissipation factor or power factor) — a measure of a material's insulating characteristics in an alternating electric field; the lower the loss tangent, the smaller the power wasted as heat.
- **Foil resistance** — the resistance of a strip cut from a board, measured with a suitable electrical bridge, taking care that the bridge current used is not so high as to cause appreciable heating of the strip.

## Machining of Boards

All boards require machining operations, which include:
- Guillotining
- Sawing
- Punching
- Drilling

## Circuit Artwork

The quality of a printed wiring board depends on the production of a **master artwork**, which must precisely show the circuit conductor pattern, component locations, circuit-module designations, and other essential references — because a printed wiring board is an actual reproduction of the original artwork produced for it. Artwork is normally prepared under controlled temperature and humidity conditions, using materials that exhibit minimal dimensional change, since dimensional stability is of great importance.

Materials in common use for artwork include:
- Polyester film
- Optical glass plate
- Foil card (aluminium sheet with a white paper surface on each side)
- Aluminium sheet coated with several coats of white enamel

Optical glass plate is the most dimensionally stable of these materials, but is difficult to work on directly, so two methods are generally recommended: preparing the artwork initially on polyester film and then photographically transferring it to the glass under controlled conditions; or preparing the artwork directly onto the glass using a numerically controlled drafting machine.

Circuit patterns may be drawn in ink, but more usually are laid out using self-adhesive black tape produced specifically to represent conductors, terminal points, edge-connector contacts, drilling points and connector pads, in a range of sizes to suit the drawing scale and the photographic reduction ratio required.

The accuracy of the finished artwork depends on the draftsman's skill and on the environmental conditions at the photographic stage matching those under which the artwork was produced (to correctly normalise the photographic film). Other factors that can cause inaccurate reproduction include damage during handling and storage, shrinkage of tapes causing breaks in connections, tape overlaps distorting sharp edges, and inadequate temperature stabilisation of the artwork before photography.

For circuits printed on **both** sides of a board, accurate registration during the photographic stage is essential. One technique for this is to draft both circuit patterns on a single piece of artwork using tapes of different colours: **red** tape for one pattern, **blue** tape for the other, and **black** tape for conducting paths common to both patterns (which must appear on both sides of the finished board). During the photographic process, colour filters eliminate the red and blue tape images in turn, producing two negatives, each showing one side of the board in perfect register with the other.

## Printing of Circuits

Circuits are printed using either an **etching process** or an **additive process**.

### Etching Process

The copper foil is first cleaned (chemically or mechanically) and then coated with a photo-sensitive coating known as a **resist**, such as dichromate glues, which become soluble when exposed to strong light. A photographic positive of the circuit artwork is placed over the sensitised board and time-exposed in a special printing machine. After exposure, the resist is washed away, leaving unprotected copper around the circuit pattern; the board is then dried with a clean, oil- and water-free air blast. The board is placed in a bath of etching solution (such as **ferric chloride**), which etches away all unprotected copper. To minimise "undercutting" by the etching solution, the solution is agitated over the board, or directed onto its surface by spray jets. Once etching is complete, the board is thoroughly washed to remove all traces of etching solution, dried, and given a final inspection.

### Additive Process

In the additive process, copper is deposited **only** in the areas where conductors are required. The base material is pre-coated with a suitable adhesive, circuit holes are pre-fabricated, and the board is sensitised with a photo-resist. A **negative** of the circuit pattern is screen-printed onto the board so that the exposed areas define the conductor network; these areas are chemically activated, and the board is immersed in an **electroless copper plating** solution until the required thickness of copper has been deposited, at which point the board is removed from the bath.

### Inspection After Printing

Printed circuit patterns are inspected, with particular attention paid to: dimensional accuracy and condition of the edges of conductors; condition of the pattern surfaces; particles of copper in unwanted areas; insulation areas; and lack of resin bond in etched areas.

## Soldering Methods

There are two main methods of soldering used with PCBs: **hand soldering** and **mass soldering**.

### Mass Soldering

In mass soldering, all joints of a fully assembled board are soldered **simultaneously**, by bringing the board into contact with an oxide-free surface of molten solder contained in a special bath. Mass soldering can be carried out in any of five ways:

- **Flat or static dipping** — one edge of the board is lowered onto the solder first, and the other edge lowered slowly, allowing flux and solvent vapour to escape; the board is withdrawn at an angle to assist solder drainage and prevent "icicling." This can be automated for production-line use by conveying boards across the solder surface.
- **Wave soldering** — the solder surface is kept free of dross by pumping solder from the bottom of the bath through a narrow slot, producing a symmetrical "standing wave" of solder across the bath. Wave shapes may be varied to assist drainage. The board, after fluxing, is passed against the crest of the wave by a conveyor, with each joint area in contact with the solder for only a few seconds to avoid distortion or damage. The wave's width limits the maximum board width that can be treated, but there is no limit to board length, since it is drawn through continuously by the conveyor.
- **Weir and cascade soldering** — both are "moving solder" systems in which solder flows down a trough by gravity and is returned to the main bath by a pump. In **weir soldering**, a board is lowered onto the solder; in **cascade soldering**, a board is conveyed across the crests of the solder waves in a direction opposite to the solder flow.
- **Reflow soldering** — also called "heat cushion" soldering, this automated process is applied particularly to boards carrying microcircuits and similar sensitive devices, allowing their full potential as surface-mounted devices to be realised. It is generally regarded as the best method: joints are easier to inspect and to rework, soldering time and the risk of overheating sensitive components are reduced, and lead distortion is prevented. The leads and the pre-tinned lands they are to be joined to (tinned by, e.g., wave or dip soldering) are brought into contact and accurately aligned; a heated electrode is then lowered onto the lead under a gradually increasing load until a preset value is reached. The solder melts and reflows to form a "cushion" through which the lead is pressed against its land; once formed, a timer cuts the heating supply, and an air blast cools the joint, speeding completion and improving joint quality.

## Solder Resists

Solder resists are organic coatings applied to rigid and flexible printed circuits to mask off areas where soldering is not required. Their advantages include:

- Elimination of bridging and icicling between closely spaced conductors and mountings
- Protection against corrosion and contamination during storage, handling and subsequent service life
- Maintained flexibility, since the resist flexes together with the conducting material
- Improved surface resistance values of the circuit pattern
- Minimised solder contamination from large areas of exposed copper and other plated materials, preserving solder purity and extending bath life
- Minimised heat distortion, since the resist acts as a heat barrier

## Plating of Printed Wiring Circuits

Plating finishes for printed wiring circuits are functional, not decorative — they aid the circuit's performance under specific service conditions. The choice of finish is governed strictly by the functional and environmental conditions the circuit will encounter.

### Plating Materials

The material and thickness specified for a circuit depend on factors including environmental conditions, durability (for edge-connector finger contacts), contact resistance, solderability, metallic migration, alloying, and cost.

- **Copper** — normally restricted to circuits with plated-through holes, since this gives durability to the holes; surface plating thickness is governed by the thickness required for the hole walls. Because of its poor resistance to climatic change, copper plating is usually followed by a further protective plating.
- **Solder** — the standard finish over copper for circuits requiring environmental protection combined with good solderability; a disadvantage is that solder plating causes greater growth in conductor width during plating than other finishes.
- **Nickel** — usually applied as an undercoat for rhodium or gold, providing a hard base for edge-connector fingers and switching contacts, and reducing the thickness of rhodium or gold needed for minimum porosity.
- **Rhodium** — the hardest noble metal in common use as a plating material; because of its excellent resistance to wear and corrosion, it is applied mainly to switching contact surfaces, either plated directly onto copper or (more usually) over a nickel undercoat, which avoids the higher internal stress of thicker rhodium deposits.
- **Silver** — particularly suited to power switching, where low contact resistance is important; thicknesses up to 0.0005 in are common for good solderability with reasonable corrosion resistance, though under certain humidity/d.c. conditions silver can migrate between unconnected conductors.
- **Gold** — gives a durable, low-resistance, corrosion-resistant finish with a long service life, commonly used for edge-connector finger contacts even when other parts of the circuit use a different finish; good solderability, but risks forming a brittle gold/tin alloy that can cause "dry joints" under extreme service conditions (minimised by restricting plating thickness).
- **Palladium** — of the noble metals, offers the most useful overall combination of properties: least costly, comparatively free of internal stress, and completely impermeable at thicknesses of 0.0002 in and above.

### Through-Hole Plating

Through-hole plating provides a conducting surface within the holes of single- and double-sided boards, and also forms a land/pad for component connection. It is generally used with **epoxy/glass laminates**, which plate more easily than phenolic/paper types. After holes are punched or drilled, the board is pre-treated and a thin layer of copper is deposited on its surfaces by an **electroless copper plating** process; the desired copper thickness, both through the holes and on the board's other surfaces, is then built up by normal electrolytic deposition of copper pyrophosphate. A photo-sensitive resist is then applied, and the circuit pattern exposed and etched.

## Organic Protective Coatings

After manufacture, organic coatings are applied to PCB surfaces to protect them from oxidation and contamination. Coatings vary according to whether **temporary** or **permanent** protection is required. Temporary-protection coatings are usually resin-based and need not be removed before soldering, since they also serve as a flux. Permanent protective coatings are usually **epoxide** or **polyurethane**-based resins, chosen for exceptionally low oxygen absorption, high humidity resistance, and resistance to cracking and discolouration.

## Multi-Layer Circuits

To save weight and space, and to allow the interconnection of multiple integrated circuits, relevant circuits are assembled as a **multi-layer moulded package** consisting of three or more single and/or double-sided printed boards, interleaved with insulating layers of **"prepreg"** material.

- **Registration jig** — individual boards and prepreg material are cleaned to exclude extraneous particles, then assembled in sequence on the polished surface of a steel plate forming the bottom of a registration jig; locating pins passing through holes around the periphery of the boards ensure accurate registration of the individual circuit layers. A second polished steel plate is then fitted on top of the assembly.
- **Moulding and curing** — the loaded jig is placed in a hydraulically operated laminating press with heated platens (up to 175°C) under a controlled hydraulic pressure (in the range 10–500 lbf/in²). Initial pressure is held between 10 and 30 lbf/in²; as the assembly's internal temperature rises to 110–120°C (typically after 3 to 7 minutes), the prepreg resin begins to flow, and gels after a further 1–3 minutes. Immediately before gelling, pressure is increased to between 250 and 300 lbf/in² and held for the remainder of the cycle. The platens are then cooled under pressure, and the assembly is removed once its internal temperature has fallen below 50°C.
- **Thickness of layers** — a more economical design results when all layers use the same thickness of laminate. The number and thickness of layers are limited by the required overall thickness, the minimum board thickness available, the thickness allowance needed for prepreg material, and the smallest required hole diameter.
- **Interconnection between layers** — normally achieved by connecting through-hole plating to the thin rim of copper exposed where the hole passes through each copper layer. In some designs, interconnection is instead made using solid copper pillars, which — unlike plated-through holes — need not extend through the entire board and can be routed around intermediate-layer conductors, emerging at any convenient point.

## Flexible Printed Wiring Circuits

Unlike rigid PCBs, **flexible** printed circuits serve only as a means of interconnecting units — particularly units that move relative to one another, or that are mounted in different planes — and also allow easier assembly and higher-density packaging. Flexible circuits are of laminated construction: a flexible base insulation material (e.g. polyester, epoxy-glass cloth, or polyimide), copper foil, and an insulating coverlay of the same material as the base. Three basic production methods are used: **die stamping**, **fusion bonding**, and **etched foil**.

### Die Stamping

Copper foil is coated with a heat-sensitive adhesive and brought into contact with the base material. A heated metal cutting die cuts the copper foil into the required conductor pattern, its stroke controlled to avoid damaging the base material; heat from the die simultaneously activates the adhesive, bonding the copper pattern to the base. A pre-punched, adhesive-coated coverlay is then laid over the exposed copper and thermally bonded to it, and the finished circuit is blanked into its final shape, fully encapsulated except for exposed contacts and termination pads.

### Fusion Bonding

The base material is heated almost to its melting point so that it fuses onto the copper foil. The conductor pattern is then etched in a manner similar to rigid PCBs. A coverlay is applied and the whole assembly placed in a heated platen press; as the platen temperature approaches the base material's melting point, pressure is applied to bond the three layers together. After cooling and removal from the press, the pads and terminations needed for soldering are exposed by abrading away the coverlay and copper oxide at those points, and the circuit is blanked into its final shape.

### Etched Foil

The circuit pattern is produced in the same way as for rigid printed wiring boards, and the three layers are thermally bonded together using adhesive coatings. Holes are drilled or pierced in the coverlay before bonding, to expose the connection and termination points on the finished circuit pattern.
        $cnt4$,
        4
    ) RETURNING id INTO s4_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M04.3 Integrated Circuits (23 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s3_id, 'In a digital circuit, the two binary conditions Logic 1 and Logic 0 are equivalent to:',
     '[{"id":"a","text":"Voltage or no voltage","correct":true},{"id":"b","text":"High frequency or low frequency","correct":false},{"id":"c","text":"AC or DC current","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'When transistors are used to build logic gates, the primary design concern is to operate them so that they are:',
     '[{"id":"a","text":"Always in their linear (active) region for maximum accuracy","correct":false},{"id":"b","text":"Either fully OFF (not conducting) or fully ON (saturated)","correct":true},{"id":"c","text":"Continuously switching between three distinct voltage levels","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'A NOT gate performs which logic function?',
     '[{"id":"a","text":"It inverts the input signal — a Logic 1 input produces a Logic 0 output","correct":true},{"id":"b","text":"It reproduces the input signal unchanged at the output","correct":false},{"id":"c","text":"It produces a Logic 1 output only when both inputs are Logic 1","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'A buffer gate is best described as:',
     '[{"id":"a","text":"A gate whose output is the inverse of its input","correct":false},{"id":"b","text":"A single-input, single-output gate whose output equals the input, effectively two consecutive NOT gates","correct":true},{"id":"c","text":"A gate requiring at least three inputs to operate","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'For an AND gate to produce a Logic 1 output:',
     '[{"id":"a","text":"At least one of the inputs must be Logic 1","correct":false},{"id":"b","text":"Both inputs must be Logic 1","correct":true},{"id":"c","text":"Both inputs must be Logic 0","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'For an OR gate to produce a Logic 1 output:',
     '[{"id":"a","text":"Both inputs must be Logic 1 simultaneously","correct":false},{"id":"b","text":"Neither input may be Logic 1","correct":false},{"id":"c","text":"At least one of the inputs must be Logic 1","correct":true}]',
     '{"B1","B2"}'),

    (s3_id, 'A NAND gate is functionally equivalent to:',
     '[{"id":"a","text":"An AND gate followed by a NOT gate","correct":true},{"id":"b","text":"An OR gate followed by a NOT gate","correct":false},{"id":"c","text":"Two AND gates in series","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'A NOR gate produces a Logic 1 output only when:',
     '[{"id":"a","text":"Both inputs are Logic 1","correct":false},{"id":"b","text":"Neither input is Logic 1","correct":true},{"id":"c","text":"Exactly one input is Logic 1","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'A distinguishing property of the NAND and NOR gates, not shared by AND, OR or NOT gates, is that:',
     '[{"id":"a","text":"They require no power supply to operate","correct":false},{"id":"b","text":"Either one, used exclusively, can be arranged to reproduce the output of any other logic gate type","correct":true},{"id":"c","text":"They can only be built using CMOS technology","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'An EXCLUSIVE OR (XOR) gate differs from a plain OR gate in that:',
     '[{"id":"a","text":"Its output is Logic 0 when both inputs are Logic 1","correct":true},{"id":"b","text":"Its output is Logic 1 only when both inputs are Logic 0","correct":false},{"id":"c","text":"It has only one input instead of two","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'Negative AND and negative OR gates differ from standard AND/OR gates in that:',
     '[{"id":"a","text":"Their outputs are inverted rather than their inputs","correct":false},{"id":"b","text":"Their inputs are inverted rather than their outputs","correct":true},{"id":"c","text":"They can accept only a single input","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'TTL (Transistor-Transistor Logic) circuits typically operate from a power source of:',
     '[{"id":"a","text":"+5 volts, using positive logic where Logic 1 = +5V and Logic 0 = 0V","correct":true},{"id":"b","text":"+12 volts, using negative logic where Logic 1 = 0V","correct":false},{"id":"c","text":"+28 volts DC, matching typical aircraft bus voltage","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'Compared with TTL, CMOS logic circuits:',
     '[{"id":"a","text":"Use bipolar junction transistors exclusively and consume more power","correct":false},{"id":"b","text":"Are built from metal oxide semiconductor transistors, use less power, and operate over a wider voltage range","correct":true},{"id":"c","text":"Cannot be used to build integrated circuits","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'An integrated circuit (IC) is best described as:',
     '[{"id":"a","text":"A single discrete transistor mounted on a printed circuit board","correct":false},{"id":"b","text":"Many complete electronic circuits constructed together on the same silicon chip","correct":true},{"id":"c","text":"A mechanical relay used to switch digital signals","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'The Dual In-Line Package (DIP) standard specifies:',
     '[{"id":"a","text":"A single row of terminals along one edge of the IC housing","correct":false},{"id":"b","text":"Two rows of connecting terminals, equally spaced along each edge of the IC housing","correct":true},{"id":"c","text":"A circular arrangement of terminals around the IC housing","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'A linear circuit is one in which:',
     '[{"id":"a","text":"The output is directly proportional to the input, giving a straight-line transfer characteristic","correct":true},{"id":"b","text":"The output only ever takes the values Logic 1 or Logic 0","correct":false},{"id":"c","text":"Diodes and transistors are the sole active components used","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'Among the ideal properties of an operational amplifier is:',
     '[{"id":"a","text":"Infinite open-loop voltage gain and infinite input resistance","correct":true},{"id":"b","text":"Zero open-loop gain and infinite output resistance","correct":false},{"id":"c","text":"A fixed voltage gain of exactly 100","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'If a signal is applied to an op-amp''s inverting input, with the non-inverting input grounded, the resulting output is:',
     '[{"id":"a","text":"In phase with the input","correct":false},{"id":"b","text":"In antiphase with the input","correct":true},{"id":"c","text":"Always zero regardless of input","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'The offset-null terminals on an op-amp package are used to:',
     '[{"id":"a","text":"Supply the dual DC power rails to the amplifier","correct":false},{"id":"b","text":"Allow the output to be adjusted to zero when the same signal is applied to both inputs","correct":true},{"id":"c","text":"Set the closed-loop gain of the amplifier","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'Applying negative feedback to an op-amp inverting amplifier gives all of the following benefits EXCEPT:',
     '[{"id":"a","text":"Greater stability and less distortion","correct":false},{"id":"b","text":"A predictable, calculable gain","correct":false},{"id":"c","text":"An increase in the amplifier''s open-loop gain A0","correct":true}]',
     '{"B1","B2"}'),

    (s3_id, 'For an inverting amplifier with feedback resistor Rf = 1 MΩ and input resistor R1 = 10 kΩ, the closed-loop gain is:',
     '[{"id":"a","text":"−100","correct":true},{"id":"b","text":"+100","correct":false},{"id":"c","text":"−10","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'When an op-amp is used as a comparator, with no feedback applied and a fixed reference voltage on the inverting input:',
     '[{"id":"a","text":"The output remains a linear function of the input difference at all times","correct":false},{"id":"b","text":"The output swings fully to +Vs or −Vs depending on whether the signal is above or below the reference","correct":true},{"id":"c","text":"The output is always exactly equal to the reference voltage","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'In an op-amp summing amplifier where R1 = R2 = R3 = Rin = Rf, the output voltage is:',
     '[{"id":"a","text":"The product of the three input voltages","correct":false},{"id":"b","text":"The inverted sum of the three input voltages","correct":true},{"id":"c","text":"Equal to only the largest of the three input voltages","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'A CR (resistor-capacitor) circuit acts as an integrator, with the output taken from the capacitor, when:',
     '[{"id":"a","text":"It has a very short time constant compared to changes at the input","correct":false},{"id":"b","text":"It has a very long time constant compared to changes at the input","correct":true},{"id":"c","text":"The resistor and capacitor values are exactly equal","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'If the output of an accelerometer is integrated once by an op-amp integrator, the resulting signal represents:',
     '[{"id":"a","text":"Velocity","correct":true},{"id":"b","text":"Distance","correct":false},{"id":"c","text":"Jerk (rate of change of acceleration)","correct":false}]',
     '{"B1","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M04.4 Printed Circuit Boards (23 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s4_id, 'A printed circuit board is constructed from a thin sheet of material that is typically:',
     '[{"id":"a","text":"Non-conductive, often about 1/16 inch (1.5 mm) thick","correct":true},{"id":"b","text":"A solid block of pure copper","correct":false},{"id":"c","text":"A flexible sheet of pure aluminium foil only","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'On a printed circuit board, a conductive path is referred to as a:',
     '[{"id":"a","text":"Via","correct":false},{"id":"b","text":"Trace","correct":true},{"id":"c","text":"Land","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'On a multilayer PCB, the hollow rivet-like conductive path that electrically joins stacked layers is called a:',
     '[{"id":"a","text":"Via","correct":true},{"id":"b","text":"Caul","correct":false},{"id":"c","text":"Prepreg","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'Modern PCBs typically mount their components:',
     '[{"id":"a","text":"On the opposite side of the board from the copper traces, with leads through drilled holes","correct":false},{"id":"b","text":"On the same side of the board as the copper traces (surface mount)","correct":true},{"id":"c","text":"Suspended above the board on wire standoffs","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'The insulating material to which the conducting foil is bonded on a PCB is known as the:',
     '[{"id":"a","text":"Resist","correct":false},{"id":"b","text":"Base material (laminate)","correct":true},{"id":"c","text":"Coverlay","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'The most commonly used PCB conductor material is copper foil, with a minimum purity of approximately:',
     '[{"id":"a","text":"99.5%","correct":true},{"id":"b","text":"75%","correct":false},{"id":"c","text":"50%","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'During the bonding of a PCB in a hot press, the stainless-steel separator plates interposed between layers of base material and copper foil are called:',
     '[{"id":"a","text":"Cauls","correct":true},{"id":"b","text":"Prepregs","correct":false},{"id":"c","text":"Resists","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'When checking the "bow" of a finished PCB:',
     '[{"id":"a","text":"The board is laid concave-side up and the maximum clearance to a straight edge is measured","correct":true},{"id":"b","text":"The board is floated on molten solder for 10 seconds","correct":false},{"id":"c","text":"A wire is soldered through a drilled hole and pulled until the land detaches","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'The "peel strength" test on a PCB measures:',
     '[{"id":"a","text":"The insulation resistance between adjacent printed conductors","correct":false},{"id":"b","text":"The minimum load required to pull a strip of copper foil away from the base material","correct":true},{"id":"c","text":"The board''s resistance to bending under mechanical load","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'In the heat resistance by solder test, a specimen is floated copper-face-down on molten solder at approximately 250°C and left in contact for:',
     '[{"id":"a","text":"10 seconds","correct":true},{"id":"b","text":"10 minutes","correct":false},{"id":"c","text":"60 seconds","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'The "pull-off strength" test on a PCB is used to verify:',
     '[{"id":"a","text":"The minimum force needed to pull a soldered land from the base material","correct":true},{"id":"b","text":"The maximum current the trace can carry before overheating","correct":false},{"id":"c","text":"The insulating properties of the board in an alternating electric field","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'The "loss tangent" (or dissipation factor) of a PCB base material is a measure of:',
     '[{"id":"a","text":"Its insulating characteristics in an alternating electric field — the lower the value, the less power wasted as heat","correct":true},{"id":"b","text":"Its resistance to solvent contamination","correct":false},{"id":"c","text":"The maximum bow and twist the board can tolerate","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'Which of the following is NOT one of the standard machining operations applied to PCBs?',
     '[{"id":"a","text":"Guillotining, sawing, punching and drilling","correct":false},{"id":"b","text":"Anodising the entire board surface","correct":true},{"id":"c","text":"All of the listed operations are standard PCB machining steps","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'Of the materials used for master circuit artwork, which is described as the most dimensionally stable, though difficult to work on directly?',
     '[{"id":"a","text":"Polyester film","correct":false},{"id":"b","text":"Optical glass plate","correct":true},{"id":"c","text":"Aluminium sheet coated with white enamel","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'When preparing artwork for a double-sided board using coloured tape, black tape represents:',
     '[{"id":"a","text":"Conducting paths that are common to both sides and must appear on both patterns","correct":true},{"id":"b","text":"Only the conductors on the top side of the board","correct":false},{"id":"c","text":"Areas to be left completely uncoated with copper","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'In the etching process for printing a circuit, the unwanted copper is typically removed using:',
     '[{"id":"a","text":"An etching solution such as ferric chloride","correct":true},{"id":"b","text":"A mechanical abrasive wheel only","correct":false},{"id":"c","text":"A high-pressure steam jet","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'The key difference between the etching process and the additive process for printing circuits is that in the additive process:',
     '[{"id":"a","text":"Copper is deposited only in the areas where conductors are required, rather than removed from unwanted areas","correct":true},{"id":"b","text":"No resist coating of any kind is used","correct":false},{"id":"c","text":"The board is not sensitised before printing","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'In wave soldering, the width of the solder wave determines:',
     '[{"id":"a","text":"The maximum length of board that can be processed","correct":false},{"id":"b","text":"The maximum width of board that can be treated","correct":true},{"id":"c","text":"The final colour of the solder joints","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'Reflow soldering is generally regarded as the best mass-soldering technique for boards carrying microcircuits because:',
     '[{"id":"a","text":"It requires no pre-tinning of the leads or lands","correct":false},{"id":"b","text":"Joints are easier to inspect and rework, and the risk of overheating sensitive components is reduced","correct":true},{"id":"c","text":"It is the only method that can be performed by hand","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'A benefit of applying a solder resist coating to a PCB is:',
     '[{"id":"a","text":"Elimination of bridging and icicling between closely spaced conductors","correct":true},{"id":"b","text":"An increase in the board''s overall electrical conductivity","correct":false},{"id":"c","text":"Elimination of the need for a base laminate material","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'Copper plating on a PCB is normally restricted to circuits with plated-through holes because:',
     '[{"id":"a","text":"It gives durability to the holes, and requires a further protective plating due to poor resistance to climatic change","correct":true},{"id":"b","text":"It is the only plating material that can be soldered at all","correct":false},{"id":"c","text":"It is more expensive than gold or rhodium plating","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'Which plating material is described as the hardest noble metal in common use, applied principally to switching contact surfaces for its wear and corrosion resistance?',
     '[{"id":"a","text":"Silver","correct":false},{"id":"b","text":"Rhodium","correct":true},{"id":"c","text":"Nickel","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'A known risk of gold plating on edge-connector contacts is:',
     '[{"id":"a","text":"Formation of a brittle gold/tin alloy that can cause dry joints under extreme service conditions","correct":true},{"id":"b","text":"Gold cannot be soldered under any circumstances","correct":false},{"id":"c","text":"Gold plating dramatically increases contact resistance","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'In the manufacture of multi-layer PCBs, the insulating layers interleaved between individual single- or double-sided boards are known as:',
     '[{"id":"a","text":"Cauls","correct":false},{"id":"b","text":"Prepreg material","correct":true},{"id":"c","text":"Coverlay","correct":false}]',
     '{"B1","B2"}');

END $$;
