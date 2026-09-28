-- Module 04: Electronic Fundamentals (B1/B2 Common) — Transistors
-- Source: EASA Part-66 Module 04 B1 official textbook (Aircraft Technical Book Company); IK Module 4 B2 course notes (IKAROS)

DO $$
DECLARE
    m04_id INT;
    s2_id  INT;
BEGIN
    SELECT id INTO m04_id FROM easa_modules WHERE code = 'M04';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M04.2') THEN
        RAISE NOTICE 'M04.2 already seeded, skipping.';
        RETURN;
    END IF;

    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m04_id, 'M04.2', 'Transistors',
        $cnt$
# Transistors

## 1. Transistor Basics (Bipolar Junction Transistors)

### Construction

A bipolar junction transistor is a three-layer sandwich of semiconductor material with two P-N junctions. There are two possible arrangements:

- **NPN transistor** — a thin region of **P-type** material sandwiched between two regions of **N-type** material.
- **PNP transistor** — a thin region of **N-type** material sandwiched between two regions of **P-type** material.

The three regions are called the **Emitter**, the **Base** and the **Collector**. The emitter and collector are the outer layers; the base is the thin centre layer. In a circuit diagram, the direction of conventional current flow through the device is shown by the **arrowhead on the emitter lead** — this is the only visual difference between the NPN and PNP symbols.

Like a diode, every P-N junction in the transistor has a depletion area that creates a potential barrier to the flow of charge carriers.

### Transistor Action and Biasing

For normal transistor action (taking an NPN device as the example):

- The **emitter-base junction is Forward Biased** (approximately **0.6 to 0.7 V**).
- The **base-collector junction is Reverse Biased** (the collector is several volts positive with respect to the base).

The forward bias at the emitter-base junction allows a large number of electrons to cross into the base region. Because the base is made extremely thin (as little as **10 microns**) and lightly doped, the great majority of these electrons diffuse straight across the base to the base-collector junction, where the high reverse-bias potential sweeps them into the collector. This gives a collector current that is almost equal to the emitter current.

**Currents:** IE = IB + IC

The base current is small, and a relatively small change in the base voltage/current produces a much larger change in collector current — this is the basis of transistor amplification. Because IE and IC are virtually equal, but the collector-base voltage is many times larger than the emitter-base voltage, the device can also be viewed as a **power amplifier** (Power in = VEB × IE; Power out = VCB × IC).

At the base-collector junction a small reverse (leakage) current also flows, carried by minority carriers. This current cannot be controlled and does not contribute to useful transistor action — it merely adds to the power dissipated in the device. Because more power is dissipated in the collector region than the emitter, the collector region is made physically larger, and a heat sink is often fitted.

### Configurations

A transistor has only three terminals, but needs an input circuit (two wires) and an output circuit (two wires) — so one terminal must always be common to both. This gives three possible configurations: **common base**, **common emitter**, and **common collector**. Common base and common collector are used in special circumstances, but **common emitter is the main configuration used, since it provides the highest gain**.

### Current and Voltage Amplification

With both junctions correctly biased and a sinusoidal signal applied to the base:

- On the **positive half-cycle**, the forward bias of the emitter-base junction increases, causing a large increase in collector current.
- On the **negative half-cycle**, base-emitter voltage falls and the transistor tends to switch off.

To make the transistor respond to *both* half-cycles, the standing (quiescent) forward bias must already be somewhat above the 0.7 V turn-on point (e.g. 0.75 V), so that base current — and hence collector current — can both increase and decrease around the operating point as the input swings positive and negative.

**Current amplification:**

**h_FE = (peak-to-peak variation of I_C) / (peak-to-peak variation of I_B)**

In practice, **voltage** amplification is usually what is required. A load resistor (RL) is inserted in the collector lead, converting changes in IC into a changing voltage. The transistor and RL then form a potential divider: the supply voltage (Vs) splits between the voltage dropped across RL and the voltage across the transistor (Vout). As base current rises (positive half-cycle), collector current rises, the drop across RL increases, and Vout **falls**. On the negative half-cycle the reverse happens and Vout **rises**.

**Voltage gain:**

**A_V = (peak-to-peak V_out) / (peak-to-peak V_in)**

A key point: this common-emitter voltage amplifier stage introduces a **180° phase shift** between input and output.

### Biasing and Thermal Runaway

It is common to derive both the forward bias (emitter-base) and reverse bias (base-collector) from a single supply, using a potential-divider network of two resistors (R1 and R2).

Silicon has a **negative temperature coefficient of resistance** — as the device heats up (due to current flow), its resistance falls, which allows more current to flow, causing more heating still. This runaway cycle is called **thermal runaway**.

To stabilise the device against thermal runaway, a resistor **RE** is placed in the emitter lead. If collector/emitter current increases, the volt-drop across RE increases, which reduces the net forward bias to the base-emitter junction and so reduces current — a self-correcting (negative feedback) action. However, because RE responds to signal current as well as bias current, it would also reduce the AC signal gain of the stage. To prevent this, a **decoupling capacitor** is placed in parallel with RE: it presents a low impedance to changing (signal) conditions but a high impedance to the steady (bias) conditions, so RE continues to stabilise the bias point without reducing the amplifier's signal gain.

### The Transistor as a Switch

When used as a switch, a transistor operates in one of two states only:

- **On** — behaving approximately as a short circuit, with output voltage almost zero.
- **Off** — behaving approximately as an open circuit, with output voltage equal to the supply voltage.

The collector load resistor used in switching applications is much higher in value (several kilohms) than that typically used in a linear amplifier stage. The collector current does not respond instantly to a change in base drive; switching is delayed by three processes:

1. The time needed to charge the base-emitter junction capacitance.
2. The time needed for charge carriers to cross the base region to the collector.
3. The time for collector current to rise, which is affected by collector capacitance, the collector load, and the current gain (hFE).

Typical rise and fall times are of the order of **10 to 100 nanoseconds**.

### Class A, B and C Bias

Plotting collector current (IC) against collector-emitter voltage (VCE) for a given load resistance produces a straight line called the **load line** — the only combinations of IC and VCE possible for that circuit. The quiescent point (Q-point), set by the bias network, is the standing operating point on this load line.

| Bias class | Quiescent point | Output behaviour |
|------------|------------------|-------------------|
| **Class A** | Set mid-way along the load line | Output current/voltage follows the *complete* input sine wave |
| **Class B** | Set at a cut-off point (edge of conduction) | Output changes during only **one half-cycle** of the input |
| **Class C** | Set beyond (outside) the cut-off point | Output changes for only **part of one half-cycle** of the input |

## 2. Field Effect Transistors (FET)

### Operation

A **Field Effect Transistor (FET)** is a semiconductor device in which current flow through a conduction channel is controlled by a voltage applied to a terminal called the **gate**. In an n-channel FET, current flows through a bar of n-type material by the drift of electrons: the terminal through which the majority carriers *enter* the bar is the **source**, and the terminal through which they *leave* is the **drain**.

On both sides of the channel, heavily doped p-type regions are formed and connected together to the **gate** terminal. Reverse biasing the gate-channel P-N junction widens the depletion layer, which extends further into the channel and **reduces its effective width** — this reduces the current that can flow from source to drain. By varying the (small) reverse bias voltage applied to the gate, the current through the device can be controlled.

### Symbol

In the standard FET symbol, the source is drawn in line with the gate, and the arrow direction shows the direction gate current would flow if the gate-channel junction were forward biased. A device with a solid vertical channel line and a gate line going *into* the channel is a **junction-gate FET (JUGFET/JFET)**, operating in **depletion mode** — meaning it is normally conducting, and a gate bias voltage is needed to cut it off.

### FET as an Amplifier

The DC supply voltage is kept fairly high to ensure the FET operates in saturation. Bias is typically applied so the gate is negative with respect to the source, often achieved with a resistor in the source lead (decoupled from signal frequencies by a capacitor). The input signal is applied to the gate and varies the current through the FET; this current flows through a drain resistor, and the output voltage is measured at the drain.

### Insulated Gate FET (IGFET / MOSFET)

A drawback of the JUGFET is that its gate-channel junction must always remain **reverse biased** — if it were ever forward biased, gate current would flow and the device would be destroyed. The **Insulated Gate FET (IGFET)**, more commonly known as the **MOSFET** (Metal Oxide Semiconductor FET), overcomes this by electrically insulating the gate from the channel — typically with a layer of oxide. An electric field is produced in this insulating layer by the gate voltage, and this field controls the current between source and drain, without any gate current flowing in either bias direction.

MOSFETs can be manufactured as N-channel or P-channel devices, and as **depletion mode** or **enhancement mode** devices:

- **Depletion mode:** current flows in the channel at zero gate bias. Applying reverse bias *reduces* channel current (as in the JUGFET). Because the gate is insulated, forward bias can also be applied (without gate current) — this draws additional charge carriers into the channel and *increases* current.
- **Enhancement mode:** the device is normally **off**. The gate must be forward biased to draw charge carriers into the channel and create conduction; there is no conduction at zero or reverse gate bias.

| Feature | JUGFET (JFET) | MOSFET (IGFET) |
|---------|----------------|------------------|
| Gate insulation | None — gate is a P-N junction | Insulated (oxide layer) |
| Bias | Reverse bias only (forward bias destroys it) | Forward or reverse bias possible |
| Modes | Depletion mode only | Depletion mode or enhancement mode |

### Advantages of FETs

- Current is carried only by **majority carriers**, making the FET less prone to random current fluctuations and therefore **less noisy** than a bipolar transistor.
- **Very high input impedance** — typically many megohms.
- Relatively **immune to nuclear radiation**, an advantage for space/satellite applications.
- IGFET bias arrangements are **not affected by gate leakage currents**, making them thermally stable.

### Handling Precautions

All MOS devices, and some other FETs, are **susceptible to damage from static electrical charges**. The gate lead of a MOSFET is particularly sensitive — its thin insulating layer can easily be punctured by excessive voltage. All standard precautions for static-sensitive devices must be observed when handling equipment or circuit boards containing FETs/MOSFETs.

## 3. Amplifiers

### Frequency Classification

Amplifiers may be classified by the frequency of the signal they are designed to amplify:

| Class | Frequency range |
|-------|-------------------|
| Audio frequency | 200 Hz – 20 kHz |
| Video | 20 Hz – 6 MHz |
| Radio frequency (RF) | 20 kHz upwards |
| Direct coupled | Very low frequencies |

Amplifiers may also be classified by function:

- **Voltage amplifiers** — amplify voltage, usually dealing with small signals.
- **Power amplifiers** — produce the power needed to drive an output device (e.g. a loudspeaker); larger output voltage and current, but often need a voltage amplifier ahead of them to drive them.

### Gain and Symbols

The gain of a single amplifier stage is given the symbol **A**. Voltage gain: **AV = Vout / Vin**.

### Cascading

If a single stage does not give enough gain, two or more stages may be connected in **cascade**. The overall gain is the product of the individual stage gains: **Total gain = A1 × A2 × A3**. This formula only holds true if one stage does not "load" (draw significant current from) the stage before it — so the input and output impedance of each stage matters.

**Typical low-frequency impedance values:**

| Device | Zin | Zout |
|--------|-----|------|
| Bipolar transistor | 1 kΩ | 20 kΩ |
| Valve | 1 MΩ | 50 kΩ |
| JUGFET | 100 MΩ | 100 kΩ |
| MOSFET | 1000 MΩ | 100 MΩ |

Both Zin and Zout contain capacitance, which reduces their effective value as operating frequency increases.

For maximum voltage transfer between cascaded stages, the **Zin of the following stage must be much greater than the Zout of the stage feeding it**. Using typical bipolar transistor figures (Zout = 20 kΩ, Zin = 1 kΩ), only about 1/21 of the first stage's output voltage reaches the second stage — so the overall gain of the two-stage amplifier will be considerably less than A1 × A2.

### Coupling

A coupling circuit is needed between cascaded stages to:

1. Couple the AC signal from one stage to the next.
2. Prevent DC conditions in the first stage from upsetting the bias of the second stage.

A **coupling capacitor** performs this role; it must present a low reactance compared with the input impedance of the following stage at the lowest frequency to be amplified — otherwise, signal is lost across the capacitor itself, reducing gain.

### Frequency Response

Gain varies with frequency because of capacitances in the amplifier circuit:

- **At low frequencies**, gain falls because the reactance of the **coupling** and **decoupling** capacitors increases — coupling capacitors "lose" more signal voltage across themselves, and decoupling capacitors no longer decouple their associated resistors effectively, introducing unwanted negative feedback.
- **At high frequencies**, gain falls because the reactance of the amplifying device's own **input capacitance (Cin)**, **output capacitance (Cout)**, and **stray wiring capacitance (Cstray)** all decrease, which reduces the effective input voltage developed and reduces the effective collector/anode load.

**General rule:** capacitors in **series** with the signal path reduce low-frequency (LF) gain; capacitors in **parallel** with the signal path reduce high-frequency (HF) gain.

### Transformer-Coupled Amplifier

A transformer can couple the output of one stage to the input of the next without needing a coupling capacitor, since the transformer itself blocks DC. The transformer is arranged as a **step-down** transformer to match the high Zout of the first stage to the low Zin of the second stage. Although voltage is stepped down, current is stepped up — and since transistors have low Zin (they are effectively current-operated devices), this can achieve a greater overall voltage gain than simple RC coupling.

**Disadvantages of transformer coupling:** narrower bandwidth, uneven frequency response, severe distortion if the transformer core saturates, and the extra size, weight and cost of an audio-frequency transformer.

### Decoupling Circuits

When two stages share the same power supply, variations in current drawn by one stage can develop unwanted signal voltages across the supply's internal impedance, coupling unintentionally into the other stage. A decoupling network (Rd, Cd) reduces the effective power-supply impedance to near zero for AC signals, while retaining the DC supply voltage — preventing this unwanted inter-stage coupling.

## 4. Power Amplifiers

Voltage amplifiers aim to produce a signal *voltage* across the load, with output current being small and of little importance. **Power amplifiers**, by contrast, must produce a large swing of both output current and output voltage, since their purpose is to develop real power in a load (e.g. a loudspeaker). Power amplifiers are therefore large-signal amplifiers.

### Basic Single-Ended Power Amplifier

- Must operate in **Class A** bias to avoid distortion.
- Power transistors are usually physically larger than voltage-amplifier types, to dissipate the extra power.
- Operated with lower values of load impedance than voltage amplifiers.
- Require a larger input voltage drive.

### Applications

Power amplifiers supply signal power to devices such as loudspeakers, relays, motors (via a speed-control circuit), and electromagnetic CRT deflection coils.

### Impedance Matching

For maximum power transfer from a transistor to its load, the output impedance of the device must be matched to the load impedance (for maximum power transfer, r = R — this differs from the conditions for maximum voltage or current transfer). Audio-frequency loads such as loudspeakers typically present only a few ohms (e.g. 8 Ω), while a transistor's Zout is of the order of tens of kΩ — so a step-down transformer is needed to match them.

**Turns ratio:**

**T² = impedance of secondary / impedance of primary**

*Worked example:* if the primary (device) impedance is 10 kΩ and the loudspeaker impedance is 10 Ω: T² = 10,000/10 = 1000, so T = 31.62 — the primary winding needs about 3,162 turns to the secondary's 100 turns.

**Power output:** Pout = IC × VC watts (using rms values of the signal output current and voltage).

**Advantages of single-ended PAs:** good for high-quality reproduction where plenty of DC power is available (e.g. the AF output stage of a mains-powered radio).

**Disadvantages:** the transformer primary carries both DC and AC — if the collector current swings enough to saturate the core, severe distortion results; efficiency is poor, since DC power is dissipated at the collector even with no signal present.

### Push-Pull Amplifier

Two matched transistors connected in **push-pull** can produce more than twice the power output of a single transistor for the same amount of distortion. Key features:

- The two transistors should be a **matched pair**.
- Two equal-amplitude, antiphase input signals are required.
- Class A bias is provided by resistors R1 and R2.
- Bias stabilisation is achieved *without* needing a decoupling capacitor across the emitter resistor, since signal fluctuations cancel at the junction of the two emitters.

With no signal applied, the two collector currents are equal and flow in opposite directions through the two halves of the output transformer primary, so their magnetic fluxes cancel. With a signal applied, one collector current increases as the other decreases by the same amount, producing a net flux (and hence output) proportional to the *difference* between the two collector currents.

**Advantages of Class A push-pull over a single-ended stage:**

- More than twice the power output for the same distortion.
- Distortion caused by the curvature of each transistor's characteristic cancels out.
- Little risk of distortion from output transformer core saturation.
- No feedback through the shared power supply, since the two outputs cancel in the common supply lead.
- Ripple on the DC supply is cancelled in the output transformer primary.

### Class B Push-Pull and Crossover Distortion

In a **Class B push-pull amplifier**, both transistors are biased to Class B, so only **one transistor conducts at a time**: on the first half-cycle, one transistor conducts (producing current in one half of the transformer primary) while the other is cut off; on the second half-cycle, the roles reverse. Each transistor thus supplies one half-cycle of output, and the transformer secondary sees a complete cycle.

This basic circuit suffers from **crossover distortion**, which occurs during the handover as one transistor switches off and the other switches on, caused by the curvature of the transistors' characteristics near cut-off. Crossover distortion can be reduced by applying a small amount of standing bias so that the curved (non-linear) part of the characteristic is avoided — this bias point is called **projected cut-off**.

### Complementary Pair Push-Pull

This configuration exploits the fact that transistors are available in complementary types — **NPN and PNP**. The positive half-cycle of the input cuts one transistor (T1) off and turns the other (T2) on, giving a positive half-cycle at the emitter output; the negative half-cycle does the reverse. Each transistor therefore supplies half of each output cycle.

**Advantages:** no phase-splitting transformer or amplifier is needed for the input signal, and no matching output transformer is required if the loudspeaker impedance is similar to the transistors' Zout. (Note: this circuit uses transistors connected as emitter followers.)

### Darlington Pair

A convenient way to obtain a higher current gain than a single transistor can provide is to combine two transistors as a **compound pair**, known as a **Darlington pair**. The emitter current of the first transistor supplies the base current of the second, so the overall current gain of the pair is (approximately) the *product* of the two individual gains: **hFE(combined) = hFE1 × hFE2** (less any loading effect).

## 5. Oscillators

An **oscillator** is a circuit that generates a continuously repetitive output signal *without* requiring an input signal — it uses only the DC power supplied to it. An oscillator can therefore be thought of as a circuit that converts DC power into an AC (fluctuating) output.

### Conditions for Oscillation

A sinusoidal oscillator is essentially an amplifier in which a small amount of the output is fed back to the input, so the circuit provides its own input signal as well as a usable output. Four conditions must be met:

1. **Amplification** must be present.
2. **Feedback** must be present.
3. The feedback voltage must be **positive** — in phase with the original signal at the input.
4. The feedback must be of **sufficient amplitude** to replace any losses in the input circuit.

### LC Oscillator

The simplest oscillator uses a parallel tuned (LC) circuit. A charged capacitor discharges through the coil, setting up a magnetic field; as the field collapses, the resulting back-emf recharges the capacitor, and the cycle repeats. Losses in the circuit mean the oscillation would naturally decay unless these losses are replaced. In a practical LC oscillator, the tuned circuit is placed in the collector circuit, and feedback is provided through transformer coupling, which also supplies the necessary **180° phase shift** so the feedback is positive — the feedback pulses onto the base replace the circuit's losses and sustain oscillation.

### Phase-Shift Oscillator

A phase-shift oscillator is an amplifier with feedback that includes a deliberate phase shift, usually introduced with RC networks. A common-emitter transistor amplifier already provides 180° of phase shift between base and collector; if the collector is fed back to the base through a network that itself introduces a further 180° of phase shift, the total feedback will be in phase (positive) and oscillation will occur. A typical arrangement uses a three-stage RC filter, each stage contributing 60° of phase shift (3 × 60° = 180° total). The filter also attenuates the fed-back signal to offset the transistor's own voltage gain. Output amplitude is limited by the transistor reaching saturation and cut-off.

### Crystal Oscillator

LC and phase-shift oscillators have a frequency that depends on circuit component values and is affected by changes in temperature and supply voltage — outside the direct control of the designer. Where a very tight frequency specification is required, a **quartz crystal oscillator** is used. Quartz crystals vibrate at a frequency determined by how they are cut, and via the **piezoelectric effect** develop an alternating voltage across their opposite faces. This emf is amplified, and feedback is applied (typically via a capacitor) back to the base to sustain oscillation. Common circuit types include the **Pierce oscillator** and the **Miller oscillator**. Crystal oscillators can achieve stability of around 1 part in 10⁸, and — with temperature-controlled ovens — up to 1 part in 10¹⁰.

### Multivibrators

| Type | Stable states | Behaviour |
|------|-----------------|-----------|
| **Astable** | None | Free-running; continually switches between the two states on its own, generating a rectangular waveform |
| **Monostable** | One | Requires a trigger pulse to flip to the unstable state; automatically returns to its stable state afterwards ("one-shot"/flip-flop) |
| **Bistable** | Both | Requires a trigger pulse to switch state; remains in either state until the next trigger pulse — widely used in digital computer logic circuitry |

The **astable multivibrator** consists of two common-emitter amplifiers, each with its output coupled to the other's input via an RC network, giving antiphase outputs at the two collectors. On power-up, whichever transistor conducts fractionally faster switches on, its collector voltage falls, and — because a capacitor cannot change its charge instantly — this drives the other transistor's base negative, switching it off. That coupling capacitor then discharges at a time constant set by its own R and C, until the off transistor's base reaches cut-on voltage and it starts to conduct — reversing the cycle. This repeats continuously.

The **monostable multivibrator** is stable with one transistor off and the other in saturation. A trigger pulse switches the off transistor on; via the coupling capacitor, this switches the other off, and the circuit remains in this (temporary) state until the capacitor discharges enough for the original transistor to switch on again, returning the circuit to its stable state.

The **bistable multivibrator** is stable in either state — one transistor is on, the other is off — and stays there until a trigger pulse forces a change of state.

### The Voltage Follower

The **voltage follower** is a common application of a non-inverting amplifier with 100% negative feedback, so that Vout equals Vin. Because of its very high input impedance and very low output impedance, it isolates the load from the signal source (e.g. a potentiometer), drawing only a few nanoamperes from the source and giving a linear output characteristic — useful for isolating low-level signals and linearising transducer outputs, for both DC and AC signals.

### Testing Transistors

Since a bipolar transistor has two P-N junctions, it can be treated (for testing) as two diodes connected back-to-back, each showing a low resistance when forward biased and a high resistance when reverse biased — measured with an ohmmeter, whose internal battery provides the bias.

- **Testing an NPN transistor:** connect the ohmmeter's positive lead to the base and the negative lead to the emitter, then to the collector — both junctions should show a relatively **low** forward resistance (typically several hundred ohms or less). Reversing the leads should then show a relatively **high** reverse resistance (typically several hundred kilohms or more) at both junctions.
- **Testing a PNP transistor:** the same procedure is used, but with the ohmmeter connections exactly reversed compared with the NPN test.

A junction with very low resistance in **both** directions (particularly if the two readings are equal) is effectively **shorted** and the transistor is defective. A junction with extremely high resistance in **both** directions is effectively **open**, and the transistor is again defective. Both the forward and reverse resistance of a junction must be checked to properly assess its condition. As a general rule, silicon transistors show higher forward and reverse junction resistances than germanium transistors.

## 6. Feedback

**Feedback** occurs whenever part or all of the output of an amplifier is fed back to its input.

- **Positive feedback (PFB)** — the fed-back signal is *in phase* with (assists) the input. It increases gain but can lead to instability/oscillation, so it is rarely used deliberately in amplifiers.
- **Negative feedback (NFB)** — the fed-back signal is *in antiphase* with (opposes) the input. It reduces gain, but improves performance in several ways:
  - Increases stability.
  - Modifies gain and frequency response.
  - Reduces noise and distortion generated within the feedback loop.
  - Modifies input and output impedance.

### Loop Gain and Closed-Loop Gain

Let **A₀** be the open-loop gain of the amplifier (gain without feedback), and **β** the feedback fraction (positive for PFB, negative for NFB). The input to the amplifier becomes (Vin + βVout), which is amplified A₀ times:

Vout = A₀(Vin + βVout) ⟹ Vout(1 − A₀β) = A₀Vin

**Closed-loop gain:**

**A_C = A_0 / (1 − A_0·β)**

**Loop gain** is defined as the product A₀ × β — it represents the amplitude of the feedback voltage relative to the external input. Positive feedback corresponds to a positive loop gain; negative feedback corresponds to a negative loop gain.

### Effect on Gain Stability

NFB significantly improves gain stability. Worked example: suppose open-loop gain A₀ falls from 1000 to 500 (a 50% drop), due to some change such as supply voltage variation. With 10% NFB applied (β = 0.1):

- For A₀ = 1000: AC = 9.9
- For A₀ = 500: AC = 9.8

The closed-loop gain falls by only about **1%**, compared with the original 50% fall in open-loop gain — a large improvement in gain stability.

### Effect on Frequency Response

Applying NFB widens the amplifier's bandwidth (the range between its -3 dB points), because a given frequency-dependent fall in open-loop gain produces a much smaller fall in closed-loop gain. This improvement in bandwidth is obtained at the cost of reduced overall gain — in general, the **gain-bandwidth product remains approximately constant**.

### Effect on Distortion and Noise

Distortion generated *within* the feedback loop is reduced by the same factor as the gain. Extra amplifying stages may be needed to restore the overall gain lost to NFB, and these added stages will introduce some distortion of their own — but it is still generally possible to achieve a net improvement in distortion by using NFB. Noise generated within the feedback loop is similarly reduced, by a factor of (1 + A₀β). However, NFB does **not** improve the signal-to-noise ratio itself — it simply degrades it less than an amplifier without NFB would.

### Types of Negative Feedback

- **Voltage NFB** — the feedback voltage is proportional to the *voltage* across the load, typically derived from a divider connected across RL.
- **Current NFB** — the feedback voltage is proportional to the *current* through the load, typically developed across a feedback resistor placed in series with the load.

Each type is further classified by how it is *applied* at the input:

| Type | Also known as |
|------|-----------------|
| Series Voltage NFB | Series Applied, Shunt Derived |
| Shunt Voltage NFB | Shunt Applied, Shunt Derived |
| Series Current NFB | Series Applied, Series Derived |
| Shunt Current NFB | Shunt Applied, Series Derived |

### Effect on Input and Output Impedance

**Output impedance** depends on how the feedback is *derived*:

- **Voltage NFB** uses a feedback network in shunt (parallel) with the output, so it **reduces** output impedance.
- **Current NFB** uses a feedback resistor in series with the output, so it **increases** output impedance.

**Input impedance** depends on how the feedback is *applied* at the input:

- Feedback applied in **series** with the input **increases** input impedance.
- Feedback applied in **parallel (shunt)** with the input **reduces** input impedance.
        $cnt$,
        2
    ) RETURNING id INTO s2_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — Transistor Basics (6)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s2_id, 'An NPN bipolar junction transistor is constructed as:',
     '[{"id":"a","text":"A thin layer of P-type material sandwiched between two N-type regions","correct":true},{"id":"b","text":"A thin layer of N-type material sandwiched between two P-type regions","correct":false},{"id":"c","text":"Two layers of N-type material with no P-type material present","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'For normal transistor action in an NPN device, the emitter-base and base-collector junctions are biased as follows:',
     '[{"id":"a","text":"Both junctions are reverse biased","correct":false},{"id":"b","text":"Emitter-base forward biased (approx. 0.6-0.7 V); base-collector reverse biased","correct":true},{"id":"c","text":"Emitter-base reverse biased; base-collector forward biased","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'The relationship between the three currents in a bipolar transistor is:',
     '[{"id":"a","text":"IC = IE + IB","correct":false},{"id":"b","text":"IE = IB + IC","correct":true},{"id":"c","text":"IB = IE + IC","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'Of the three transistor configurations, the one mainly used because it provides the highest gain is:',
     '[{"id":"a","text":"Common base","correct":false},{"id":"b","text":"Common emitter","correct":true},{"id":"c","text":"Common collector","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'The base region of a bipolar transistor is made extremely thin (as low as 10 microns) so that:',
     '[{"id":"a","text":"The base-emitter junction can be reverse biased more easily","correct":false},{"id":"b","text":"Charge carriers injected from the emitter can reach the collector before recombining, giving good transistor action","correct":true},{"id":"c","text":"The base can dissipate more heat than the collector region","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'When a transistor is used as a switch, in its "on" state it behaves approximately as:',
     '[{"id":"a","text":"An open circuit, with output voltage equal to the supply voltage","correct":false},{"id":"b","text":"A short circuit, with output voltage almost at zero volts","correct":true},{"id":"c","text":"A fixed resistance equal to the collector load resistor","correct":false}]',
     '{"B1","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — Field Effect Transistors (5)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s2_id, 'In a field effect transistor (FET), current flowing through the conduction channel is controlled by:',
     '[{"id":"a","text":"A voltage applied to a terminal called the gate","correct":true},{"id":"b","text":"The forward voltage applied across the source and drain only","correct":false},{"id":"c","text":"The temperature of the channel material","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'In an FET, the terminal through which majority carriers leave the channel is called the:',
     '[{"id":"a","text":"Source","correct":false},{"id":"b","text":"Gate","correct":false},{"id":"c","text":"Drain","correct":true}]',
     '{"B1","B2"}'),

    (s2_id, 'In a JUGFET (junction-gate FET), reverse biasing the gate-channel junction:',
     '[{"id":"a","text":"Narrows the depletion layer and increases channel current","correct":false},{"id":"b","text":"Widens the depletion layer, reducing the effective channel width and current","correct":true},{"id":"c","text":"Has no effect on the channel or current flow","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'A key advantage of the IGFET (MOSFET) over the JUGFET is that:',
     '[{"id":"a","text":"Its insulated gate allows forward or reverse gate bias without gate current flowing","correct":true},{"id":"b","text":"It can only be operated in depletion mode","correct":false},{"id":"c","text":"It requires no bias voltage at all to operate","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'Compared with a bipolar transistor, one advantage of a FET is:',
     '[{"id":"a","text":"A much lower input impedance, typically only a few ohms","correct":false},{"id":"b","text":"A very high input impedance, typically many megohms, since current is carried only by majority carriers","correct":true},{"id":"c","text":"Complete immunity to damage from static electrical charges","correct":false}]',
     '{"B1","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — Amplifiers (5)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s2_id, 'Amplifiers classified as "audio frequency" typically operate over the range:',
     '[{"id":"a","text":"200 Hz to 20 kHz","correct":true},{"id":"b","text":"20 Hz to 6 MHz","correct":false},{"id":"c","text":"20 kHz and upwards","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'When amplifier stages are connected in cascade, the total gain (A1 x A2 x A3) formula is only valid if:',
     '[{"id":"a","text":"Each stage has an identical individual gain","correct":false},{"id":"b","text":"No stage significantly loads the stage feeding it","correct":true},{"id":"c","text":"All stages use the same type of coupling capacitor","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'For maximum voltage transfer between two cascaded amplifier stages:',
     '[{"id":"a","text":"The Zin of the following stage should be much greater than the Zout of the stage feeding it","correct":true},{"id":"b","text":"The Zin of the following stage should be much less than the Zout of the stage feeding it","correct":false},{"id":"c","text":"Zin and Zout of adjacent stages should always be made equal","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'The purpose of a coupling capacitor connecting two cascaded amplifier stages is to:',
     '[{"id":"a","text":"Pass the AC signal from one stage to the next while blocking DC from upsetting the next stage''s bias","correct":true},{"id":"b","text":"Pass DC between stages while blocking the AC signal completely","correct":false},{"id":"c","text":"Provide the entire voltage gain of the two-stage amplifier","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'A transformer-coupled amplifier stage is typically arranged as a step-down transformer because it must:',
     '[{"id":"a","text":"Match the high Zout of the driving stage to the low Zin of the following stage","correct":true},{"id":"b","text":"Match the low Zout of the driving stage to the high Zin of the following stage","correct":false},{"id":"c","text":"Increase the DC supply voltage available to the following stage","correct":false}]',
     '{"B1","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — Power Amplifiers (6)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s2_id, 'A basic single-ended power amplifier must operate in which bias class to avoid distortion?',
     '[{"id":"a","text":"Class A","correct":true},{"id":"b","text":"Class B","correct":false},{"id":"c","text":"Class C","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'A step-down transformer is normally needed to couple a power transistor to a loudspeaker because:',
     '[{"id":"a","text":"The loudspeaker impedance (a few ohms) is far lower than the transistor''s output impedance (tens of kilohms)","correct":true},{"id":"b","text":"The loudspeaker impedance is far higher than the transistor''s output impedance","correct":false},{"id":"c","text":"Loudspeakers cannot accept any DC component in the signal","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'A properly designed push-pull amplifier, using a matched pair of transistors with antiphase inputs, can produce:',
     '[{"id":"a","text":"Less than half the power output of a single transistor, for the same distortion","correct":false},{"id":"b","text":"More than twice the power output of a single transistor, for the same amount of distortion","correct":true},{"id":"c","text":"Exactly the same power output as a single transistor, but with lower distortion","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'In a Class B push-pull amplifier:',
     '[{"id":"a","text":"Both transistors conduct simultaneously throughout the whole cycle","correct":false},{"id":"b","text":"Only one transistor conducts at a time, each supplying one half-cycle of the output","correct":true},{"id":"c","text":"Neither transistor conducts unless a trigger pulse is applied","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'Crossover distortion in a Class B push-pull amplifier occurs because:',
     '[{"id":"a","text":"Of the curvature of the transistors'' characteristics during the handover as one switches off and the other switches on","correct":true},{"id":"b","text":"The output transformer core is permanently saturated","correct":false},{"id":"c","text":"Both transistors are biased into Class A simultaneously","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'In a Darlington pair, where the emitter current of the first transistor supplies the base current of the second, the overall current gain of the pair is approximately:',
     '[{"id":"a","text":"The sum of the two individual current gains, hFE1 + hFE2","correct":false},{"id":"b","text":"The product of the two individual current gains, hFE1 x hFE2","correct":true},{"id":"c","text":"Equal to the current gain of whichever transistor has the lower hFE","correct":false}]',
     '{"B1","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — Oscillators (5)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s2_id, 'An oscillator differs from a normal amplifier in that:',
     '[{"id":"a","text":"It generates a continuously repetitive output without needing an input signal, converting DC power into an AC output","correct":true},{"id":"b","text":"It requires a much larger input signal than an equivalent amplifier","correct":false},{"id":"c","text":"It can only operate from an AC power supply","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'For a sinusoidal oscillator to start and sustain oscillation, the feedback signal must be:',
     '[{"id":"a","text":"Negative (in antiphase) and of any amplitude","correct":false},{"id":"b","text":"Positive (in phase) and of sufficient amplitude to replace circuit losses","correct":true},{"id":"c","text":"Applied only during the first half-cycle after power-up","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'A crystal oscillator is used in preference to a simple LC or RC oscillator mainly because:',
     '[{"id":"a","text":"It is far cheaper to construct than an LC oscillator","correct":false},{"id":"b","text":"It provides a much higher, more stable operating frequency, unaffected by temperature and supply variations to the same degree as an LC/RC oscillator","correct":true},{"id":"c","text":"It requires no DC power supply to operate","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'An astable multivibrator is described as "astable" because:',
     '[{"id":"a","text":"It has no stable state and continually switches between its two states on its own","correct":true},{"id":"b","text":"It has two stable states and never changes state without a trigger pulse","correct":false},{"id":"c","text":"It produces a pure sine wave output rather than a rectangular waveform","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'What is the key difference between a monostable and a bistable multivibrator?',
     '[{"id":"a","text":"A monostable has one stable state and automatically returns to it after a trigger pulse; a bistable has two stable states and stays in either until the next trigger","correct":true},{"id":"b","text":"A monostable has two stable states while a bistable has only one","correct":false},{"id":"c","text":"A bistable requires no trigger pulses at all, while a monostable requires continuous triggering","correct":false}]',
     '{"B1","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — Feedback (5)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s2_id, 'Positive feedback (PFB) in an amplifier:',
     '[{"id":"a","text":"Is in antiphase with the input and reduces gain","correct":false},{"id":"b","text":"Is in phase with the input, increases gain, but can cause instability/oscillation, so is rarely used deliberately in amplifiers","correct":true},{"id":"c","text":"Has no effect on gain, stability or frequency response","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'Negative feedback (NFB), although it reduces gain, generally improves an amplifier''s performance by:',
     '[{"id":"a","text":"Increasing stability, modifying gain/frequency response, and reducing noise and distortion generated within the feedback loop","correct":true},{"id":"b","text":"Increasing distortion and noise while stabilising gain","correct":false},{"id":"c","text":"Eliminating the need for any DC bias in the amplifier","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'The closed-loop gain (AC) of an amplifier with open-loop gain A0 and feedback fraction beta is given by:',
     '[{"id":"a","text":"AC = A0 x beta","correct":false},{"id":"b","text":"AC = A0 / (1 - A0 x beta)","correct":true},{"id":"c","text":"AC = A0 + beta","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'Negative feedback derived from the output voltage (voltage NFB), applied in shunt with the output, has what effect on output impedance?',
     '[{"id":"a","text":"It reduces the output impedance","correct":true},{"id":"b","text":"It increases the output impedance","correct":false},{"id":"c","text":"It has no effect on output impedance","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'How is an amplifier''s input impedance affected by the way negative feedback is applied at the input?',
     '[{"id":"a","text":"Feedback applied in series with the input increases input impedance; feedback applied in shunt (parallel) with the input reduces it","correct":true},{"id":"b","text":"Feedback applied in series with the input reduces input impedance; feedback applied in shunt increases it","correct":false},{"id":"c","text":"The method of applying feedback at the input has no effect on input impedance","correct":false}]',
     '{"B1","B2"}');

END $$;
