-- Module 03: Electrical Fundamentals — Alternating Current, Transformers,
-- Filters, AC Generators, AC Motors, Starter/Generator
-- Source: EASA Part-66 Module 03 official textbook (Sections 3.14–3.20)
-- Scope: Sub-Modules M03.13 – M03.16 (final batch)

DO $$
DECLARE
    m03_id INT;
    s13_id INT;
    s14_id INT;
    s15_id INT;
    s16_id INT;
BEGIN
    SELECT id INTO m03_id FROM easa_modules WHERE code = 'M03';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M03.13') THEN
        RAISE NOTICE 'M03.13 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 03.13: Alternating Current Fundamentals
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m03_id, 'M03.13', 'Alternating Current Fundamentals: Sine Wave, Phase & 3-Phase Systems',
        $cnt13$
# Alternating Current Fundamentals: Sine Wave, Phase & 3-Phase Systems

## DC vs AC

In a **DC** circuit, current always flows in one direction only. In an **AC** circuit, current flows in one direction for half of the time and in the opposite direction for the other half. The voltage polarity at the AC source constantly changes in step with the changing current direction. These repeating, reversing waveforms most commonly take the shape of a **sine wave**.

## The Sine Wave

A sine wave can be derived geometrically from a rotating radius sweeping around a circle:

1. Draw a circle of radius Vm (Vm = the maximum, or peak, voltage the wave will reach).
2. Draw a horizontal reference line through the centre of the circle, extended outward to form the zero (X) axis, graduated from 0° to 360° (equivalently 0 to 2π radians).
3. Draw a radius at angle θ from the reference line.
4. Project a horizontal line from the tip of that radius, and a vertical line up from position θ on the X-axis — their intersection is one point on the sine curve.

Repeating this for every value of θ and joining the points traces out the sine curve. From the right-angled triangle formed by the radius: sinθ = (vertical side)/(radius), so the vertical side = radius × sinθ. Since the radius represents Vm, the **instantaneous value** v of the wave at angle θ is:

**v = Vm × sinθ**

The instantaneous value is simply the value of voltage or current at any single moment in time.

## Period and Frequency

An AC sine wave rises from zero to a maximum in one direction, falls back to zero, reverses, rises to a maximum in the other direction, and falls back to zero again. This complete sequence is **one cycle**, and it repeats continuously.

| Term | Symbol | Definition | Unit |
|------|--------|------------|------|
| **Period** | T | Time taken for one complete cycle | seconds |
| **Frequency** | f | Number of cycles occurring in one second | hertz (Hz) |

Period and frequency are reciprocals of each other:

**f = 1/T** and **T = 1/f**

Multiples of the hertz:

| Unit | Symbol | Value |
|------|--------|-------|
| Kilohertz | kHz | 10³ Hz |
| Megahertz | MHz | 10⁶ Hz |
| Gigahertz | GHz | 10⁹ Hz |
| Terahertz | THz | 10¹² Hz |

## Peak, Peak-to-Peak, Average and RMS Values

A sine wave can be described by several different "characteristic" values, each useful in a different context.

### Peak Value

The **peak value** (Vm or Im) is the maximum value reached by the waveform — also called the **maximum value** or **amplitude**. It may refer to either the positive or the negative peak.

### Peak-to-Peak Value

The **peak-to-peak value** spans both the positive and negative peaks. For a symmetrical sine wave, the two peaks are equal, so:

**Peak-to-peak = 2 × peak value**

Note that the two peaks never occur at the same instant, and for some non-sinusoidal waveforms the positive and negative peaks are *not* equal.

### Average Value

The **average value** is the average of all the instantaneous values taken over one alternation (half-cycle) of the wave, since averaging over a full cycle would give zero (positive and negative halves cancel). For a sine wave:

**Average value = 0.637 × peak value**

Example: a wave with a peak of 340 V has an average value of 0.637 × 340 ≈ 217 V.

### RMS (Root-Mean-Square) / Effective Value

The most common way of specifying an AC voltage or current is by relating it to the DC value that would produce the *same heating effect* in a resistor. This is the **root-mean-square (rms)** or **effective** value:

**Vrms = 0.707 × Vmax** and **Irms = 0.707 × Imax**

Example: a wave with a peak of 340 V has an rms value of 0.707 × 340 ≈ 240 V — approximately the UK domestic mains voltage, which (like all AC ratings) is always quoted as an rms value.

Converting the other way (rms → peak), since 1/0.707 = 1.414:

**Vmax = 1.414 × Vrms** and **Imax = 1.414 × Irms**

And for peak-to-peak in terms of rms:

**Peak-to-peak value = 2.828 × rms value**

Unless stated otherwise, *all* sine-wave AC voltage and current values quoted are rms values — which is why the same symbols V and I used for DC are used for AC rms values.

### Summary Table (Sine Wave)

| Quantity | Formula | Example (peak = 340 V) |
|----------|---------|------------------------|
| Peak (Vm) | — | 340 V |
| Peak-to-peak | 2 × Vm | 680 V |
| Average | 0.637 × Vm | ≈ 217 V |
| RMS (effective) | 0.707 × Vm | ≈ 240 V |

## Phase

When two alternating quantities of the **same frequency** pass through corresponding points in their cycle at the **same instant**, they are said to be **in phase**. If they pass through corresponding points at *different* instants, they are **out of phase**, and a **phase difference** exists between them — usually expressed as an angle, the **phase angle**, rather than as a time.

## Power in AC Circuits

The power dissipated in an AC circuit is the average of all the instantaneous power values over a complete cycle. Instantaneous power at any moment is simply the instantaneous voltage multiplied by the instantaneous current at that moment.

In a **purely resistive** circuit, voltage and current are always in phase, so their product is always positive — the instantaneous power curve never goes below the axis. This power curve fluctuates at **twice** the supply frequency, but when averaged over a complete cycle, the **average power is exactly half the peak power**.

Average power in a resistive circuit:

**Paverage = Vrms × Irms**

which is usually just written **P = IV** (I and V being rms values). The familiar DC power relationships also hold, using rms values throughout:

- P = IV
- P = I²R
- P = V²/R

Nameplate ratings on electrical equipment quote voltage/current as rms values and power as average power. AC power is customarily quoted in **volt-amperes (VA)** — the "apparent power" — rather than watts, since the plate current does not account for power factor (covered in the next sub-module).

## Non-Sinusoidal Waveforms

Not every AC waveform is a sine wave. Common **non-sinusoidal** waveforms include the **square wave**, **triangular wave**, and **sawtooth (ramp) wave**.

For these waveforms:
- **Period (T)** and **frequency (f = 1/T)** still apply, measured the same way.
- **Peak value** is still measured from the zero axis to the maximum — but because non-sinusoidal waveforms can have unsymmetrical peaks, **peak-to-peak** is a more reliable measurement for these shapes.
- The **0.707 rms factor does NOT apply** — it is derived specifically from the sine function and only holds for true sine waves.
- The concept of **phase angle also does NOT apply** — it too is an angular measure specific to sinusoidal waveforms.

The sawtooth wave (also called a "ramp" or "time base" voltage) rises at a uniform, linear rate to its peak, then drops sharply back to its starting value.

## Three-Phase AC — Symmetry and Balance

**Symmetry** and **balance** are two important concepts in three-phase AC generation and distribution.

- **Symmetry**: a 3-phase system is voltage-symmetrical when its three voltage waveforms are of **equal magnitude**, the **same frequency**, and **equally phase-displaced** from one another.
- **Balance**: a 3-phase system is **balanced** when the currents in the three line conductors are **equal in magnitude** and their **phasor sum is zero**. Balance is achieved by equally loading each phase of a symmetrical system. Three-phase distribution is most efficient when balanced.

The UK electricity supply industry adopted **50 Hz**; other countries use different frequencies (e.g. 60 Hz in the USA). Aircraft three-phase generators, valued for their robust construction and excellent power-to-weight ratio, most commonly use **400 Hz**, with some installations using **1600 Hz** — much higher than either mains frequency.

### Phase Sequence

By convention, individual phases are identified by letters (a, b, c) or by colours — **red, yellow, blue**. In a voltage-symmetrical system:

- Red = reference phase
- Yellow **lags** red by 120°
- Blue **lags** yellow by 120°

If the phases reach their maximum values in the order red → yellow → blue, this is a **positive phase sequence**. If the order is red → blue → yellow, it is a **negative phase sequence**.

## Star (Wye) and Delta Connections

Running three phases fully separately would need six conductors (two per phase). Interconnecting them saves considerable conductor material. The two standard interconnection methods are **Star** and **Delta**.

### Star Connection

One end of each phase winding (either all "starts" or all "finishes") is joined at a common terminal — the **star point**. The other end of each phase is brought out to its own terminal, giving a phase line for each phase plus (optionally) a **neutral line** connecting the generator's star point to the load's star point.

- A star-connected system needs a **maximum of 4 conductors** (3 phase lines + 1 neutral).
- In the **balanced** condition, **no current flows in the neutral** line. In practice some imbalance is tolerated, so a small neutral current is normal.
- If a single phase carries the full load alone (severe imbalance), the neutral conductor must carry the **full load current** — so in a simple distribution network the neutral must be rated for full load current.

### Delta Connection

The **finish** of each phase winding is connected to the **start** of the next phase in sequence, forming the three windings into a closed **ring**. Each junction point is brought out to its own terminal.

- Only **3 terminals** are needed, so a delta-connected system needs only **3 conductors** to transfer energy from source to load.
- Only **line voltage** is available from a delta connection — there is no separate phase voltage output (unlike star, which offers both).

### Line and Phase Values

| Quantity | Definition |
|----------|------------|
| **Phase voltage** | Voltage measured between a phase line and the neutral (the voltage induced in one winding) |
| **Line voltage** | Voltage measured between two phase lines (the phasor sum of two phase winding voltages) |
| **Phase current** | Current in one phase winding |
| **Line current** | Current in one phase line conductor |

### Balanced System Summary

| System | Voltage relationship | Current relationship |
|--------|----------------------|----------------------|
| **Star (Wye)** | VLine = √3 × VPhase | ILine = IPhase |
| **Delta** | VLine = VPhase | ILine = √3 × IPhase |

The delta connection's higher line current (relative to phase current) is used to advantage in high-current supplies, since it **reduces the current-carrying requirement of the individual windings**.

### Practical Values

A star-connected, voltage-symmetrical system with a 240 V phase voltage gives a line voltage of √3 × 240 ≈ 415 V — the standard UK consumer supply values (240 V / 415 V).

The most common aircraft AC three-phase values are **115 V phase voltage** and **200 V line voltage**.

## Summary: Power in a Balanced N-Phase System

In a balanced, symmetrical 3-phase system, the **total power = 3 × the power in one phase**. This is a special case of the general rule:

**In a balanced, symmetrical N-phase system, total power = N × the power in one phase.**
        $cnt13$,
        13
    ) RETURNING id INTO s13_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 03.14: Resistive, Capacitive & Inductive AC Circuits, Resonance
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m03_id, 'M03.14', 'Resistive, Capacitive & Inductive AC Circuits, Resonance',
        $cnt14$
# Resistive, Capacitive & Inductive AC Circuits, Resonance

## Pure Inductance in AC Circuits

There is no such thing as a truly "pure" inductance in practice (every real coil has some resistance), but the ideal case is a useful starting point. The voltage across an inductor is a reaction against the *change* in current through it: instantaneous voltage is **zero** whenever current is at a peak (momentarily not changing), and voltage is at its **peak** whenever current is changing fastest (crossing zero).

The result is a voltage waveform that is 90° out of phase with the current waveform, with voltage appearing to have a "head start" — in a purely inductive circuit, **voltage LEADS current by 90° (π/2 radians)**.

**Memory aid — "CIVIL":**
- In a **C**apacitor, **I** leads **V**.
- **V** **L**eads I in an **I**nductor.

### Inductive Reactance

Just as V/I = R for a pure resistance, the ratio V/I for a pure inductance is the **inductive reactance, XL**, measured in ohms:

**XL = V/I** (V, I in rms values)

**XL = 2πfL**

where f = frequency (Hz) and L = inductance (henrys).

### Power in an Ideal Inductive Circuit

The instantaneous power curve for a pure inductor runs at *twice* the supply frequency, and averages to **zero** over a complete cycle. During the quarter-cycle while current rises to its peak, the magnetic field builds and the source supplies energy that is stored in the field. During the next quarter-cycle, as current falls back to zero, the field collapses and that same energy is **returned** to the source (the inductor briefly acts as a generator).

No net work is done and no energy is dissipated — yet voltage was applied and current genuinely flowed. This is called **reactive power** or "wattless power", measured in **VAR** (volt-amperes-reactive) rather than watts.

## Pure Capacitance in AC Circuits

In a capacitor, charge and voltage are related by Q = CV. Since instantaneous current is the rate of change of charge (I = dQ/dt), and dQ/dt = C×(dV/dt):

**I = C × dV/dt**

The rate of change of a sinusoidal quantity is itself a sine wave that **leads** the original by 90°. So the current in a capacitor leads the voltage across it by 90° — current reaches its peak a quarter-cycle *before* voltage does. This is the "C" half of the CIVIL mnemonic: in a **C**apacitor, **I** leads **V**.

### Capacitive Reactance

**XC = V/I** (rms values, ohms)

**XC = 1 / (2πfC)**

where f = frequency (Hz) and C = capacitance (farads). As frequency **increases**, XC **decreases** (more current flows for the same applied voltage). Similarly, for a fixed frequency, increasing C decreases XC.

### Power in an Ideal Capacitive Circuit

As with the ideal inductor, average power dissipated in an ideal capacitor is **zero** — power alternates equally between being absorbed from the source and returned to it, as the electric field charges and discharges. No useful work is done, even though current genuinely flows. This is again reactive/wattless power.

## Series AC Circuits

In any series circuit there is only one current path, so the same current flows through every component with the same phase everywhere. For this reason, **current is used as the reference phasor** for series-circuit phasor diagrams.

### Resistance and Inductance in Series (RL)

- Current (I) — the reference phasor, drawn horizontal.
- VR = IR, **in phase** with current.
- VL = IXL, **leads** current by 90°.
- Applied voltage: **V = √(VR² + VL²)**

The applied voltage leads the current by the **phase angle φ**, where:

**tanφ = VL/VR = XL/R**

**Phase angle convention:** if supply current **lags** applied voltage, the phase angle is *lagging* and the circuit behaves **inductively**. If supply current **leads** applied voltage, the phase angle is *leading* and the circuit behaves **capacitively**.

### Impedance

**Impedance (Z)** is the total opposition to current flow in an AC circuit:

**Z = V/I** (ohms, rms values)

Dividing each voltage phasor of the RL circuit by I gives an **impedance triangle**, with R as the base and XL as the vertical side:

**Z = √(R² + XL²)**

### Active (Real) Power

Because current and voltage are not necessarily in phase in a circuit with reactance, the simple product V×I is *not* the true (active) power. Active power can always be found from the resistive component:

**Active power = I²R**

or equivalently, multiplying V×I by the cosine of the phase angle θ:

**Active power = VI × cosθ** (watts)

**Worked example:** a circuit has I = 2 A through R = 100 Ω, with XL = 173 Ω, giving a phase angle of 60°. Active power = I²R = 2² × 100 = **400 W**. Checking with the alternative formula, applied voltage = 400 V, cos60° = 0.5: Active power = VI×cosθ = 400 × 2 × 0.5 = **400 W** — the two methods agree. A pure reactance dissipates no power at all; only the resistive component converts electrical energy to heat.

### Power Factor

The **power factor (PF) = cosθ**, a dimensionless number between 0 and 1 (not an angle) that indicates what fraction of the apparent power is actually doing useful work:

| Circuit type | Series formula | Parallel formula |
|--------------|-----------------|-------------------|
| Power factor | cosθ = R/Z | cosθ = IR/IT |

- **Unity power factor (PF = 1)**: purely resistive circuit.
- **Zero power factor (PF = 0)**: purely reactive circuit.

**Worked examples:** Series — R = 100 Ω, Z = 200 Ω → PF = 100/200 = **0.5**. Parallel — IR = 4 A, IT = 5 A → PF = 4/5 = **0.8**.

### Apparent Power and the VAR

When V and I are out of phase, the plain product V×I is the **apparent power**, measured in **volt-amperes (VA)** — not watts.

**Worked example:** 400 V, 2 A, phase angle 60° → apparent power = VI = 400 × 2 = **800 VA**. Power factor = active power / apparent power = 400/800 = 0.5 = cos60° ✓.

The **VAR** (volt-ampere-reactive) is the reactive component: multiplying VI by **sinθ** gives the VARs.

**Worked example:** VI × sin60° = 800 × 0.866 ≈ **692.8 VAR**.

### Correcting the Power Factor

Inductive loads such as motors commonly give a lagging power factor around 0.7 (phase angle ≈45°). To correct this toward unity, a **capacitor** is connected across the line, drawing a leading current that offsets the inductive lag. The capacitance is sized to draw voltamperes (VARs) equal to the load's own lagging VARs.

### Resistance and Capacitance in Series (RC)

Similar to the RL case, but VC **lags** current by 90° (instead of VL leading), so the phase angle is **leading** — supply current leads applied voltage.

| Quantity | Formula |
|----------|---------|
| VR | IR |
| VC | IXC = I/(2πfC) |
| Applied voltage | V = √(VR² + VC²) |
| Impedance | Z = √(R² + XC²) |
| Phase angle | tanφ = VC/VR = XC/R |
| Power factor | cosφ = R/Z = VR/V |
| Active power | IV × cosφ (watts) |
| Apparent power | IV (voltamperes) |

### Inductance and Capacitance in Series (LC)

VL leads current by 90°, VC lags current by 90° — so VL and VC are **180° out of phase with each other**, and the total circuit voltage is their **difference**.

- If VL > VC, the resultant voltage leads current by 90° → circuit behaves **inductively**.
- If VC > VL (equivalently XC > XL), the circuit behaves **capacitively**.

Since VL = IXL and VC = IXC, whichever reactance is larger determines the circuit's overall behaviour.

## Resistance, Inductance and Capacitance in Series (RLC) — Resonance

With R, L and C all in series: VR is in phase with I; VL leads I by 90° and grows with frequency; VC lags I by 90° and shrinks with frequency. The supply voltage is the phasor resultant of all three.

As frequency rises, **XC falls** and **XL rises**. At one particular frequency, XC and XL become **equal and opposite** — they cancel completely, leaving only the resistive component. This condition is called **resonance**, and the frequency at which it occurs is the **resonant frequency, f0**:

**f0 = 1 / (2π√(LC))**

(L in henrys, C in farads, f0 in Hz — the frequency at which XL = XC)

At resonance:
- The circuit behaves as a pure resistance of value R.
- Applied voltage and current are **in phase** — phase angle = 0°, power factor = **unity**.
- Current is at its **maximum** value: I = V/R.

At any other frequency, impedance is found from Z = √(R² + XT²), where XT is the net (unequal) reactance.

## Parallel AC Circuits

In a parallel circuit, components provide alternative current paths but share a **common voltage** — so for parallel circuits, **applied voltage is used as the reference phasor** (the opposite convention to series circuits). Branch currents must be added **vectorially** to find the total supply current.

### Resistance and Inductance in Parallel (Low-Pass Behaviour)

- IR = V/R, in phase with V.
- IL = V/XL, lags V by 90°, and **decreases** as frequency rises (XL increases).
- Total current: I = √(IR² + IL²), lagging V by φ where tanφ = R/XL.

Impedance (= V/I) is always *less* than R, but approaches R as frequency → ∞. At very low frequencies, impedance is low (low XL), approaching zero as frequency → 0. The circuit therefore passes low frequencies more readily than high ones — a **low-pass filter**.

### Resistance and Capacitance in Parallel (High-Pass Behaviour)

- IR = V/R, in phase with V.
- IC = V/XC, leads V by 90°, and **increases** as frequency rises (XC decreases).
- Total current: I = √(IR² + IC²), leading V by φ where tanφ = R/XC.

Impedance = R at zero frequency, approaching zero as frequency rises. This circuit passes high frequencies more readily than low ones — a **high-pass filter**.

### Ideal Inductance and Capacitance in Parallel

- At **low frequencies**, XC >> XL, so most current flows through L — the branch currents (in anti-phase) sum in the same phase as IL, so the circuit behaves as an **inductance**.
- At **high frequencies**, XL >> XC — the circuit behaves as a **capacitance**.
- At the frequency where **XL = XC**, the two branch currents are equal and opposite and **cancel**: supply current is **zero**, and the circuit presents (ideally) **infinite impedance**. This is **parallel resonance**.

## The Resonance Effect and Q Factor

Because XL rises with frequency and XC falls with frequency, any LC combination has exactly one frequency where XL = XC — the resonant frequency, **f0 = 1/(2π√(LC))**. Larger L and C values give a lower f0; smaller values give a higher f0. Resonance is heavily used at radio frequencies (with µH inductors and pF capacitors) for **tuning**, since an LC circuit gives maximum voltage output at f0 compared to any other frequency.

### Series Resonance

In a series LC circuit, XL and XC are 180° out of phase and cancel completely at resonance, leaving only the coil's own small series resistance, rs, to limit current. The smaller rs is, the sharper the current rise at resonance.

**Series resonant circuit — key characteristics:**

| Quantity | At resonance |
|----------|---------------|
| Current I | **Maximum**, = V/rs |
| Phase | I in phase with V (phase angle 0°) |
| Voltage across L or C alone | **Maximum** |
| Impedance | **Minimum**, = rs only |

This is sometimes called the **"acceptor"** circuit (maximum current condition).

### Parallel Resonance

In a parallel LC circuit, at resonance the two reactive branch currents are equal and opposite, cancelling in the main line.

**Parallel resonant circuit — key characteristics:**

| Quantity | At resonance |
|----------|---------------|
| Line current IT | **Minimum** (ideally zero) |
| Phase | IT in phase with VA (phase angle 0°) |
| Impedance ZT (= VA/IT) | **Maximum** |

This is sometimes called the **"rejector"** circuit — the opposite behaviour to series resonance.

### Q (Quality / Magnification) Factor

The "quality" or sharpness of a resonant circuit is given by its **Q factor**. For a series resonant circuit:

**Q = XL / rs**

(XL = inductive reactance at resonance, rs = the coil's own series resistance)

Q is a pure ratio with no units. A **higher Q** means a **sharper** resonance peak.

| Q value | Description |
|---------|--------------|
| Below 10 | Low Q |
| ≈ 50 – 250 | Typical Q |
| Above 300 | Very high Q |

**Worked example:** XL = 1500 Ω, rs = 10 Ω → Q = 1500/10 = **150** (a high Q).

Q can also be measured experimentally by comparing the voltage developed across L or C at resonance to the generator voltage:

**Q = Vout / Vin**

For a parallel resonant circuit (assuming the coil's resistance dominates over the capacitor's much smaller losses, and a high generator source resistance), Q is calculated the same way, Q = XL/rs, and the coil's own Q effectively sets the whole circuit's Q.
        $cnt14$,
        14
    ) RETURNING id INTO s14_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 03.15: Transformers
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m03_id, 'M03.15', 'Transformers',
        $cnt15$
# Transformers

## Purpose

A transformer is an important application of **mutual inductance**. Its primary winding connects to an AC source; its secondary winding connects across the load. Power transfers from primary to secondary purely through the **magnetic field** linking the two windings — there is **no direct electrical connection** between them. Because the number of turns can differ between primary and secondary, a transformer can step voltage **up or down**. A steady DC voltage cannot be transformed, since a steady current produces no changing flux and therefore no induced voltage.

## Turns Ratio

**Turns ratio = NS/NP** (secondary turns ÷ primary turns)

By convention, the primary figure is shown on the left of the ratio. Example: 500 primary turns and 50 secondary turns gives a turns ratio of 50/500, written **1:10** — this represents a step-up winding arrangement (as written); the same physical windings used the other way round would step down and could be written 10:1.

## Voltage Ratio

With unity (ideal) magnetic coupling, the voltage induced per turn in the secondary equals the self-induced voltage per turn in the primary, so voltage ratio follows turns ratio directly:

**VS/VP = NS/NP**

More secondary turns than primary means a higher secondary voltage — the voltage is **stepped up**. (This relationship applies to iron-core transformers with unity coupling.)

**Worked example:** LP has 100 turns, LS has 600 turns → turns ratio = 600/100 = **6:1** (step-up). With 120 V applied to the primary: VS = 6 × 120 = **720 V**.

## Secondary Current

By Ohm's law, secondary current is found from the secondary voltage and the secondary-circuit resistance: **IS = VS/RL**.

**Example:** with a secondary voltage of 100 V across a 100 Ω load resistance (negligible coil resistance assumed): IS = 100/100 = **1 A**.

## Power in the Secondary

Power dissipated in the secondary load = IS² × RL, or VS × IS. Importantly, drawing current in the secondary sets up a magnetic field that **opposes** the varying flux of the primary current — so the generator must supply **more** primary current to maintain the required voltages. If secondary current doubles, primary current also doubles.

Assuming **zero losses**, power in the secondary equals power in the primary:

**VS × IS = VP × IP**, i.e. **IP/IS = VS/VP**

The **current ratio is the inverse of the voltage ratio**: a voltage step-up in the secondary means a current step-**down**, and vice versa. (Remember: the side with the **higher** voltage carries the **lower** current.)

**Worked example 1:** a 1:6 turns-ratio transformer produces 720 V across a 7200 Ω secondary load. IS = VS/RL = 720/7200 = **0.1 A**. Since the turns ratio is 6:1, current ratio is 1:6, so IP = 6 × IS = 6 × 0.1 = **0.6 A**.

**Worked example 2:** a 20:1 step-down transformer produces 6 V across a 0.6 Ω secondary load. IS = VS/RL = 6/0.6 = **10 A**. IP = (1/20) × IS = (1/20) × 10 = **0.5 A**.

## Total Secondary Power Equals Primary Power (Multiple Secondaries)

Any number of secondary windings can share unity coupling with the primary, provided all windings are wound on the same iron core. Each secondary has its own induced voltage, set by its own turns ratio with the primary, and can drive its own separate load.

**Worked example:** a power transformer has two secondary windings, L1 and L2, fed from a 120 V primary.

| Winding | Turns ratio | VS | RL | IS = VS/RL | PS = VS×IS |
|---------|-------------|-----|--------|------------|-------------|
| L1 | 6:1 step-up | 720 V | 7200 Ω | 0.1 A | 72 W |
| L2 | 1:20 step-down | 6 V | 0.6 Ω | 10 A | 60 W |

Total secondary power = 72 + 60 = **132 W**. Since all secondary power is supplied by the primary, primary power = 132 W too, so:

**IP = PP / VP = 132/120 = 1.1 A**

This checks out by summing the two individual primary-current contributions found earlier: 0.6 A (for L1) + 0.5 A (for L2) = 1.1 A total.

**Calculation sequence to remember:** find VS from the turns ratio → find IS = VS/RL → find PS = VS×IS → (zero-loss assumption) PP = ΣPS → find IP = PP/VP.

## Autotransformers

An **autotransformer** has a single continuous coil with a tapped connection between its ends, rather than two separate isolated windings.

- One configuration **steps up**: the primary voltage is applied across only part of the winding, while the secondary voltage is taken across the whole winding.
- The other configuration **steps down**: the primary voltage is applied across the whole winding, with the secondary tapped off part of it.

The same turns-ratio and voltage-ratio relationships apply as for a conventional isolated-winding transformer.

**Advantages:** compact, efficient, and usually cheaper, since only one winding is needed, with only **3 leads** (vs 4 for an isolated-secondary transformer).

**Disadvantage:** the single wire must be sized to suit **both** the primary and secondary current requirements.

## The Current Transformer

A **current transformer (CT)** measures circuit current *without* breaking into the circuit — unlike an ammeter or its shunt, which require an in-line connection. Its construction and operation are very different from a power transformer, although it still works on mutual inductance.

The **Bar-Primary** type is the most widely used on aircraft: the load's own supply cable *is* the primary winding, effectively a **single turn**. The secondary winding is toroidally wound on a ring-shaped former surrounding this cable.

**Design note:** unlike a power transformer (designed just for a given supply, output voltage and maximum current), a current transformer is designed to work with **one specific load/burden**. A different secondary load gives inaccurate readings. A "400:1" current transformer passes 1 A in its secondary for every 400 A in the primary cable.

### Critical Safety Rule

**NEVER operate the primary with the secondary open-circuited.** With no secondary load connected, there is no secondary current to produce the opposing flux that normally keeps core flux low. This causes:

- High core flux
- Increased eddy currents and heating in the core
- Possible burnout of the CT
- Permanent pre-magnetisation/bias of the core, degrading future accuracy — even if switched off before actual burnout occurs

If the primary circuit must remain energised while the secondary load is disconnected, **short the secondary terminals together** to provide a path for secondary current and keep core flux to a minimum.

Secondary connection **polarity** does not matter much for a simple ammeter, but is critical when the CT feeds a control circuit — reversed connections turn the output phase through 180°, causing incorrect control-circuit behaviour.

## Three-Phase Transformers

Aircraft AC supplies are usually 3-phase. Individual single-phase transformers can be used, one per phase, but a dedicated **3-phase transformer** significantly reduces size and weight. The most common design uses a laminated soft-iron core with three limbs of equal cross-sectional area, each limb carrying the primary and secondary windings of one phase. Primary and secondary can each be connected in **star or delta**, in any combination.

## Isolation of the Secondary

A transformer with a separate (isolated) secondary winding has **no direct electrical connection** between the secondary load and the AC power line — this reduces the risk of electric shock, and also **blocks any DC** present in the primary from reaching the secondary. An **autotransformer does NOT provide this isolation**, since it uses a single continuous winding. Sometimes a 1:1 turns-ratio transformer is used purely for isolation purposes.

## Transformer Efficiency

**Efficiency = (Pout / Pin) × 100%**

In a transformer, Pout is secondary power and Pin is primary power. With zero losses, efficiency would be 100% — but real transformers are always somewhat less efficient, typically **80–90%** for ordinary power transformers (50–300 W rating). Higher-power transformers tend to be **more** efficient, since they use heavier, lower-resistance windings. Whatever power is "missing" from the output compared to the input is dissipated as heat.

## Dot Notation

**Dot notation** is a polarity marking system showing which terminals are positive at the same instant, without needing to draw the actual physical winding direction. By definition: *instantaneous currents entering the windings at the dotted terminals produce aiding (reinforcing) magnetic fluxes.* Terminals marked with dots at corresponding positions have **in-phase** induced voltages.

## Core Losses

A transformer core that becomes warm shows that some supplied energy is lost as heat within the core. There are two main mechanisms:

### Eddy Currents

Alternating flux in an iron core induces a voltage **within the core itself**; since the core is a conductor, this drives circulating currents — **eddy currents** — that dissipate power as I²R heat. Eddy-current flux **opposes** the coil's own flux, requiring extra coil current to compensate. Eddy-current losses increase with frequency.

**RF shielding** uses the same eddy-current principle deliberately: a metal (copper or aluminium) shield/cover around a coil, made from a good conductor, generates opposing eddy currents that block external varying flux from reaching the coil and vice versa.

### Hysteresis Losses

A smaller (but still present) loss mechanism — extra power is needed each cycle to reverse the magnetic field within the core material.

### Core Types (to minimise these losses)

| Core type | Construction | Typical use |
|-----------|--------------|-------------|
| **Laminated core** | Thin, individually insulated sheet laminations | Audio-frequency and 60 Hz power transformers |
| **Powdered-iron core** | Insulated granules pressed into a solid "slug" | Radio-frequency inductor cores |
| **Ferrite core** | Synthetic ceramic, ferromagnetic AND an insulator | High-frequency use, minimal eddy-current loss; often a tunable slug |
| **Air core** | No core material | Essentially zero eddy-current/hysteresis loss, but limited inductance (µH–mH range) |

## Transformer Rating

Ratings are given as **rms** values unless stated otherwise.

- **Rated Voltage**: the no-load voltage assigned between the terminals of a single winding (for the terminal pair spanning the greatest number of turns, where several terminals share one winding).
- **Rated Power**: the **apparent power** the transformer can handle, in **voltamperes (VA)** — not watts — since VA accounts for both the active and the reactive components of the loading.
        $cnt15$,
        15
    ) RETURNING id INTO s15_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 03.16: Filters, AC Generators, AC Motors & Starter/Generator
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m03_id, 'M03.16', 'Filters, AC Generators, AC Motors & Starter/Generator',
        $cnt16$
# Filters, AC Generators, AC Motors & Starter/Generator

## Part 1: Filters

### Harmonics

A repetitive non-sinusoidal waveform (e.g. a 100 Hz square wave) has a **fundamental** repetition rate (100 Hz here) plus exact whole-number multiples of it, called **harmonics**: the 2nd harmonic = 200 Hz, the 3rd = 300 Hz, and so on. Multiples of even order are **even harmonics**, multiples of odd order are **odd harmonics**. Any distorted or non-sinusoidal waveform can be thought of as a pure fundamental sine wave plus a mixture of harmonic components — it is this harmonic content that lets us distinguish two sound sources even when they share the same fundamental frequency.

- **Non-symmetrical** waveforms = fundamental + **even** harmonics.
- **Symmetrical** waveforms = fundamental + **odd** harmonics.

### Octave and Decade

| Term | Frequency ratio | Example |
|------|-------------------|---------|
| **Octave** | 2:1 | 100 Hz → 200 Hz is one octave up |
| **Decade** | 10:1 | 100 Hz → 1 kHz is one decade up |

### The Filter

A **filter** is a network of inductors and capacitors (a reactive, frequency-dependent network) designed to attenuate different frequencies by different amounts, while also providing a correct impedance match between source and load.

| Term | Meaning |
|------|---------|
| **Pass-band** | Range of frequencies where attenuation is ideally zero |
| **Stop-band** (attenuation-band) | Range of frequencies where attenuation is maximum (ideally infinite) |
| **Cut-off frequency (fc)** | The frequency separating a pass-band from a stop-band |

### The Four Types of LC Filter

| Filter type | Behaviour |
|-------------|-----------|
| **Low-pass** | Attenuates frequencies **above** fc, passes those **below**. At low f: XL small, XC large → large output across C. At high f: reverse → small output. |
| **High-pass** | Attenuates frequencies **below** fc, passes those **above** — the reactive components are swapped relative to a low-pass filter. |
| **Band-pass** | Passes only a band around a resonant frequency f0. Uses a series-tuned circuit (low impedance at f0) plus a parallel-tuned circuit (high impedance at f0), both tuned to f0 — giving large output only near f0. |
| **Band-stop** | Attenuates only a band around f0, passes everything else. The series/parallel tuned circuit positions are swapped relative to a band-pass filter (sometimes called a "T-type" filter). |

## Part 2: AC Generators

### Basic Principle

Electromagnetic induction underlies both DC and AC generators: a voltage is induced in a conductor when it is cut by magnetic lines of force. In a simple AC generator demo, a bar magnet rotates between the pole faces of a soft-iron yoke wound with a coil — as it rotates, the field builds first in one direction then the other, producing an alternating voltage roughly approximating a sine wave.

- **Rotor** = the rotating assembly.
- **Stator** = the stationary assembly.

### Fleming's Right-Hand Rule (Generators)

Used to find the direction of induced EMF:

- **First finger** = Field (North to South)
- **Second finger** = Current
- **Thu­mb** = Motion

(This is distinct from Fleming's **left**-hand rule, used for motors.)

### Two Basic Generator Types

| Type | Construction | Load current path |
|------|--------------|--------------------|
| **Rotating armature** | Armature rotates through a steady field (similar to a DC generator) | Slip rings carry the full load current |
| **Rotating field** | Field rotates; armature/output windings are stationary | Slip rings only carry the (much smaller) field excitation current |

The rotating field may be a **permanent magnet** (small output, e.g. a tacho-generator) or **DC-wound coils** requiring a separate DC excitation source — a basic AC generator cannot be truly self-excited.

**Advantages of the rotating-field type:**
1. The rotating excitation current is much smaller than the output, so slip rings can be smaller than would be needed for full output current.
2. More efficient cooling can be achieved on the stationary output windings, allowing higher loads.
3. The heavier high-current output windings, being stationary, are **not** subject to centrifugal force.

### Voltage and Frequency

**Voltage output** is proportional to rotor speed — the faster the field is cut, the higher the induced EMF. Voltage can also be increased by adding more rotor windings or strengthening the rotating field.

**Frequency** depends on rotor speed *and* the number of pole pairs:

**F (Hz) = P × N/60**

where P = number of pole pairs, N = rotor speed in RPM (divided by 60 to convert to revolutions per second).

**Worked examples:** at N = 60 RPM with **1 pole pair**: F = 1 × 60/60 = **1 Hz**. At the same 60 RPM with **2 pole pairs**: F = 2 × 60/60 = **2 Hz** — doubling the pole-pair count doubles the frequency at the same rotational speed.

### Effects of Applied Loads

**Resistive loads:** tend to reduce speed. To hold speed/frequency constant, the prime mover must supply more driving torque. Increased load slightly increases IR voltage drop (easily made up via a small increase in field excitation). The combined rotor+stator fields create a torque component opposing the shaft's input torque, proportional to load current.

**Inductive reactive loads:** the stator field directly opposes the rotor field, causing a considerable loss of field strength — made up by increasing field excitation (the voltage regulator senses the falling voltage). No effect on torque, but the increased rotor current produces extra heat.

**Capacitive reactive loads:** stator and rotor fields are **additive**, so voltage output tends to **rise**. The voltage regulator senses this and **reduces** excitation to compensate. No effect on torque.

### Power Factor

**PF = cosθ = R/Z**, and also identifies the proportion of apparent power doing useful work:

**Active Power = Apparent Power × Power Factor**

| Load type | Power factor | Terminal voltage tendency |
|-----------|----------------|-----------------------------|
| Resistive | Unity (1) | Slight fall (internal resistance only) |
| Capacitive | Leading | Tends to **rise** (additive fields) |
| Inductive | Lagging | Tends to **fall** (opposing fields) |

The purpose of a generator's power rating is to ensure it is not overheated when operated at its maximum real load, continuously or intermittently.

### The Brushless (Permanent Magnet) AC Generator

A permanent magnet (up to 18 pole pieces) is fitted to the drive shaft and rotated by the gearbox, producing a high-frequency signal (up to **1200 Hz**) sent to a **Generator Control Unit (GCU)**. The GCU processes this into a DC input for an **exciter generator** winding set, also mounted on the drive shaft. The resulting induced EMF is rectified by a **full-wave bridge** and fed as DC to the **main generator field**. This DC field cuts through the main generator's stator windings, producing the **3-phase AC output** supplied to the aircraft's AC busbar. The entire arrangement is brushless — no slip rings are needed for the main power path.

### Constant Frequency AC Systems

Most modern civil aircraft generate AC at a **constant frequency**, because:
- Generators can be operated **in parallel** with each other.
- Suitable for a **wider range** of load types than a variable-frequency supply.
- Generator loading does **not vary** with engine speed.
- Loads can be designed for **optimum efficiency** at one fixed frequency.
- Induction motors (e.g. fuel pumps, gyro motors) run at an almost **constant speed**, since their speed is frequency-locked.

## Part 3: AC Motors

### Production of a Rotating Field

Applying a 3-phase supply to a 3-phase stator produces a rotating magnetic field of unvarying strength; rotation speed depends on supply frequency. At any instant, the field produced by each phase is proportional to that phase's instantaneous current. Since the three phase currents are 120° apart, so are their individual fields — and the **resultant field rotates smoothly**, completing one full revolution per complete cycle of the AC supply (synchronous with the input).

**Example:** a 50 Hz supply produces a field rotating at 50 revolutions per second = **3000 rpm**.

### The Three Principal AC Motor Types

#### Synchronous Motor

Essentially a reverse-operated AC generator: the **stator** receives the AC supply and produces the rotating field; the **rotor** carries field windings supplied with DC from a separate source (or may be a permanent magnet). The rotor tries to align with — and then locks onto and rotates with — the stator's rotating field, at exactly synchronous speed.

- **Cannot self-start** — rotor inertia cannot follow the fast-moving field.
- Must be run up to near-synchronous speed by an auxiliary device (typically a small induction motor) before it "locks in".
- A **single-speed** machine — speed is fixed purely by supply frequency.
- Ideal for **constant-speed** loads: ventilation fans, gyroscopes.
- Best suited to **light** mechanical loads: excessive load breaks the "synchronous lock" and stops the motor.

#### Induction Motor

The **most common** AC motor on aircraft — robust, simple, cheaper than other types; available in 3-phase, 2-phase, or single-phase forms.

- **Stator**: similar to a synchronous motor's (produces the rotating field).
- **Rotor**: a **"squirrel cage"** — heavy copper bars joined by end rings, no external electrical connection, no insulation needed (rotor bar voltages are very low).

**Operating principle:** the rotating stator field induces a voltage in the rotor bars (relative motion between field and rotor). This drives current in the low-resistance bars, which sets up a rotor magnetic field. This field interacts with the stator field and the rotor is dragged around, trying to catch up — but it **never quite catches up** (if it did, there would be no relative motion, no induced voltage, no current, and no torque). The rotor always runs slightly **slower** than the rotating field.

- **Slip speed** = field speed − rotor speed.
- **Slip (%)** = (slip speed / field speed) × 100

**Example:** field at 1000 rpm, rotor at 960 rpm → slip speed = 40 rpm, slip = (40/1000) × 100 = **4%** (a typical value). Slip increases with load, but varies only slightly between no-load and full-load — so induction motors are essentially **constant-speed** drives.

**Starting current** is heavy — **4 to 6 times** running current — because slip (and induced rotor EMF) is at its maximum at standstill.

**Two-Phase Induction Motor:** a rotating field can also be produced from 2 phases 90° apart, though this is less efficient than 3-phase. Its main use is as a **servomotor** in synchro/servo control systems: one winding carries a constant-magnitude **reference** voltage, the other a variable **control** voltage (magnitude plus lead/lag phase) from a signal amplifier, controlling motor speed and direction.

**Single-Phase Induction Motor:** used extensively in low-power blowers and switch motors. A single stator winding produces only a **pulsating** field along one axis, not a rotating one — so it **cannot self-start** (no net torque on a stationary rotor), but *will* continue rotating once started manually, since the field keeps pulsing through the same magnetising cycle.

A starting device is needed: an **auxiliary winding** spaced 90° from the main winding, in series with an impedance chosen to create maximum phase displacement between the two winding currents, so the motor starts approximately as a 2-phase machine. The auxiliary winding is removed from circuit once about **75% of synchronous speed** is reached (via a centrifugal switch, or a current-sensing relay that drops out as starting current falls).

**Capacitor-Start Motor:** the auxiliary winding is in series with a capacitor and a starting switch, sized so auxiliary-winding current **leads** line voltage by about 45° while main-winding current **lags** by about 45° — a roughly 90° phase difference makes the two windings act like a 2-phase stator for starting. **"Capacitor-start, capacitor-run"** keeps a (usually smaller) capacitor permanently in the auxiliary circuit after starting, for improved running efficiency as a true 2-phase motor — using two parallel capacitors for starting, one of which drops out once up to speed. Disadvantage: **high starting current** (about 4× full-load current). Direction is reversed by swapping the connections to either stator winding.

**Shaded-Pole Induction Motor:** the simplest self-starting design — no centrifugal switch, capacitor, or separate starting winding. Special pole pieces carry a small segment wrapped by a short-circuited single-turn **shading coil**, which (by Lenz's law) delays the flux change in that segment relative to the main segment, creating a sweeping flux pattern across the pole face that acts like a slowly rotating field — enough to self-start the rotor and set its direction. Rugged, cheap, small, low-maintenance — but **low starting torque, low efficiency, low power factor**. Direction is fixed by the shading-coil's physical position; reversing requires physically flipping the pole structure.

**Hysteresis Motor:** the stator (small-hysteresis-loop material) receives a polyphase supply; the rotor (large-hysteresis-loop material, e.g. cobalt steel) has its flux **lag** the stator flux by nearly 90° due to hysteresis. The rotor tries to align with the stator field and is dragged around by it. Key advantage: it produces essentially **constant torque** all the way from standstill through to synchronous speed (unlike an induction motor, whose torque varies with slip) — well-suited to **autopilot servomotors** driving flight control surfaces. Once at synchronous speed, the rotor behaves like a simple permanent magnet.

**Single-Phase (Series) Commutator Motor:** unlike the synchronous and induction types (essentially constant/fixed speed), this is a **variable-speed** AC motor, used e.g. as blower motors in communication equipment. It is essentially a DC series motor adapted for AC: since armature and field current reverse together every half-cycle, torque direction stays consistent. The field winding has **fewer turns** than a DC series motor's field (to keep field reactance low enough for adequate current flow), which somewhat reduces torque. Characteristics mirror the DC series motor: **high starting torque**, and **large speed variation** with load (fast on light load, slow on heavy load).

The **"Universal Motor"** is a series motor purpose-built to run on **either AC or DC** — common in small electric appliances — but operates at somewhat **lower efficiency** than a pure AC or pure DC series motor.

## Part 4: Starter/Generator

On some aircraft engines, a single combined unit serves as **both** the engine starter motor (electrical → mechanical energy, to turn/start the engine) **and**, once running, the aircraft's generator (mechanical → electrical energy). Advantages: lighter and less bulky than separate starter and generator units, and needs only **one** engine gearbox drive pad, remaining permanently and directly connected to the engine at all times.

Basic construction resembles a **DC compound-wound** motor/generator, but with **separately switchable** field windings:

- **As a starter**, it operates as a **series-wound** motor (for high starting torque).
- **As a generator**, only the **shunt** winding is energised, under voltage-regulator control — the series winding is disconnected once switched to generator mode.

### Typical Operating Sequence

1. Selecting **START** energises a **starter relay**, which supplies power to run the unit as a series motor, and also connects power to the **ignition circuit** (through an ignition cut-off switch).
2. Once the engine is running and the generator is switched **ON**, the starter relay de-energises. This also de-energises a **changeover relay**, which disconnects the series field and instead connects the armature to the **voltage regulator** — the armature is also connected to the busbar through a **Reverse Current Relay**.
3. A separate **field relay** then connects the shunt field to the voltage regulator, letting the unit run as a voltage-regulated shunt-wound generator.

### Reverse Current Relay

Its job is to **operate (disconnect)** whenever generator output voltage drops below a preset value — this **prevents the battery from discharging back through the generator winding**, which would otherwise try to motor the generator backward, wasting battery power and risking damage.

Some circuit designs spring-load the start selection back to "generator on" automatically once released; others **latch** the start selection until a **speed switch** de-energises it once the engine reaches self-sustaining speed.
        $cnt16$,
        16
    ) RETURNING id INTO s16_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M03.13 AC Fundamentals (14 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s13_id, 'In a DC circuit, current flows:',
     '[{"id":"a","text":"In one direction only","correct":true},{"id":"b","text":"In alternating directions at a fixed frequency","correct":false},{"id":"c","text":"Only during the positive half of the supply cycle","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s13_id, 'The instantaneous value of a sine wave at angle θ is given by:',
     '[{"id":"a","text":"v = Vm × sinθ","correct":true},{"id":"b","text":"v = Vm / sinθ","correct":false},{"id":"c","text":"v = Vm × cosθ × 2","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s13_id, 'A sine wave has a frequency of 400 Hz. What is its period?',
     '[{"id":"a","text":"0.4 ms","correct":false},{"id":"b","text":"2.5 ms","correct":true},{"id":"c","text":"25 ms","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s13_id, 'A sine wave has a peak value of 340 V. What is its approximate RMS value?',
     '[{"id":"a","text":"217 V","correct":false},{"id":"b","text":"240 V","correct":true},{"id":"c","text":"340 V","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s13_id, 'A sine wave has an RMS value of 240 V. What is its approximate peak-to-peak value?',
     '[{"id":"a","text":"340 V","correct":false},{"id":"b","text":"480 V","correct":false},{"id":"c","text":"680 V","correct":true}]',
     '{"B1.1","B1.3","B2"}'),

    (s13_id, 'The average value of one alternation of a sine wave, relative to its peak value, is approximately:',
     '[{"id":"a","text":"0.5 × peak","correct":false},{"id":"b","text":"0.637 × peak","correct":true},{"id":"c","text":"0.707 × peak","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s13_id, 'The RMS (effective) value of an AC voltage is defined as:',
     '[{"id":"a","text":"The value that produces the same heating effect as an equal DC value","correct":true},{"id":"b","text":"The value halfway between zero and peak","correct":false},{"id":"c","text":"The average of all instantaneous values over a full cycle","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s13_id, 'In a purely resistive AC circuit, the average power over a complete cycle is:',
     '[{"id":"a","text":"Zero","correct":false},{"id":"b","text":"Equal to the peak power value","correct":false},{"id":"c","text":"Half of the peak power value","correct":true}]',
     '{"B1.1","B1.3","B2"}'),

    (s13_id, 'Which of the following does NOT apply to a non-sinusoidal (e.g. square) waveform?',
     '[{"id":"a","text":"Period and frequency","correct":false},{"id":"b","text":"Peak-to-peak amplitude","correct":false},{"id":"c","text":"The 0.707 RMS factor and phase angle","correct":true}]',
     '{"B1.1","B1.3","B2"}'),

    (s13_id, 'A 3-phase system is described as "balanced" when:',
     '[{"id":"a","text":"The line currents are equal in magnitude with a phasor sum of zero","correct":true},{"id":"b","text":"All three phase voltages are of different frequencies","correct":false},{"id":"c","text":"Only two of the three phases are carrying current","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s13_id, 'In a positive-sequence, voltage-symmetrical 3-phase system using red/yellow/blue phase identification:',
     '[{"id":"a","text":"Yellow leads red by 120°","correct":false},{"id":"b","text":"Yellow lags red by 120°, and blue lags yellow by 120°","correct":true},{"id":"c","text":"All three phases reach their peak at the same instant","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s13_id, 'In a balanced, star-connected 3-phase system with a phase voltage of 115 V, the approximate line voltage is:',
     '[{"id":"a","text":"115 V","correct":false},{"id":"b","text":"199 V","correct":true},{"id":"c","text":"345 V","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s13_id, 'In a balanced delta-connected 3-phase system, which relationship is correct?',
     '[{"id":"a","text":"Line voltage = phase voltage; line current = √3 × phase current","correct":true},{"id":"b","text":"Line voltage = √3 × phase voltage; line current = phase current","correct":false},{"id":"c","text":"Line voltage and phase voltage are both unavailable in a delta system","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s13_id, 'Aircraft 3-phase AC generation most commonly uses a frequency of:',
     '[{"id":"a","text":"50 Hz or 60 Hz, matching mains supplies","correct":false},{"id":"b","text":"400 Hz (with some systems using 1600 Hz)","correct":true},{"id":"c","text":"25 Hz","correct":false}]',
     '{"B1.1","B1.3","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M03.14 RLC AC Circuits & Resonance (18 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s14_id, 'In a purely inductive AC circuit:',
     '[{"id":"a","text":"Voltage leads current by 90°","correct":true},{"id":"b","text":"Current leads voltage by 90°","correct":false},{"id":"c","text":"Voltage and current are in phase","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s14_id, 'In a purely capacitive AC circuit:',
     '[{"id":"a","text":"Voltage leads current by 90°","correct":false},{"id":"b","text":"Current leads voltage by 90°","correct":true},{"id":"c","text":"Voltage and current are in phase","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s14_id, 'What is the inductive reactance of a 0.5 H inductor at 60 Hz? (use XL = 2πfL)',
     '[{"id":"a","text":"≈ 30 Ω","correct":false},{"id":"b","text":"≈ 188 Ω","correct":true},{"id":"c","text":"≈ 376 Ω","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s14_id, 'What happens to capacitive reactance XC as frequency increases?',
     '[{"id":"a","text":"It increases","correct":false},{"id":"b","text":"It decreases","correct":true},{"id":"c","text":"It remains constant","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s14_id, 'The power dissipated in an ideal (loss-free) inductor over a complete AC cycle is:',
     '[{"id":"a","text":"Zero — it is reactive/wattless power","correct":true},{"id":"b","text":"Equal to I²R","correct":false},{"id":"c","text":"Equal to VI at every instant","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s14_id, 'In a series RL circuit, the phase angle φ is found from:',
     '[{"id":"a","text":"tanφ = R/XL","correct":false},{"id":"b","text":"tanφ = VL/VR = XL/R","correct":true},{"id":"c","text":"tanφ = VR/V","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s14_id, 'A series circuit has R = 100 Ω and XL = 173 Ω. What is the impedance Z?',
     '[{"id":"a","text":"73 Ω","correct":false},{"id":"b","text":"200 Ω","correct":true},{"id":"c","text":"273 Ω","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s14_id, 'A circuit carries 2 A rms through a resistance of 100 Ω. What is the active power dissipated?',
     '[{"id":"a","text":"100 W","correct":false},{"id":"b","text":"200 W","correct":false},{"id":"c","text":"400 W","correct":true}]',
     '{"B1.1","B1.3","B2"}'),

    (s14_id, 'A series AC circuit has R = 100 Ω and Z = 200 Ω. What is its power factor?',
     '[{"id":"a","text":"0.25","correct":false},{"id":"b","text":"0.5","correct":true},{"id":"c","text":"2.0","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s14_id, 'A purely resistive AC circuit has a power factor of:',
     '[{"id":"a","text":"Zero","correct":false},{"id":"b","text":"0.5","correct":false},{"id":"c","text":"Unity (1)","correct":true}]',
     '{"B1.1","B1.3","B2"}'),

    (s14_id, 'An AC supply of 400 V provides a current of 2 A at a phase angle of 60° (cos60°=0.5). What is the apparent power?',
     '[{"id":"a","text":"400 VA","correct":false},{"id":"b","text":"800 VA","correct":true},{"id":"c","text":"1200 VA","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s14_id, 'A lagging power factor caused by an inductive load (e.g. a motor) can be corrected toward unity by:',
     '[{"id":"a","text":"Adding a capacitor across the line to draw a leading current","correct":true},{"id":"b","text":"Adding a second inductor in series","correct":false},{"id":"c","text":"Reducing the supply frequency","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s14_id, 'In a series LC circuit where XL is greater than XC, the circuit behaves:',
     '[{"id":"a","text":"As a pure resistance","correct":false},{"id":"b","text":"Inductively","correct":true},{"id":"c","text":"Capacitively","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s14_id, 'At the resonant frequency of a series RLC circuit:',
     '[{"id":"a","text":"XL and XC cancel, leaving only resistance, and current is maximum","correct":true},{"id":"b","text":"Impedance is at its maximum value","correct":false},{"id":"c","text":"The circuit behaves as a pure inductance","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s14_id, 'Calculate the resonant frequency of a series circuit with L = 100 µH and C = 100 pF (f0 = 1/(2π√(LC))).',
     '[{"id":"a","text":"≈ 159 kHz","correct":false},{"id":"b","text":"≈ 1.59 MHz","correct":true},{"id":"c","text":"≈ 15.9 MHz","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s14_id, 'A resistor and inductor connected in PARALLEL across an AC supply behave overall as a:',
     '[{"id":"a","text":"Low-pass filter","correct":true},{"id":"b","text":"High-pass filter","correct":false},{"id":"c","text":"Band-pass filter","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s14_id, 'At parallel resonance in an ideal L-C parallel circuit, the line current is:',
     '[{"id":"a","text":"Maximum","correct":false},{"id":"b","text":"Minimum (ideally zero)","correct":true},{"id":"c","text":"Unaffected by frequency","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s14_id, 'A series resonant circuit has XL = 1500 Ω at resonance and a coil series resistance rs = 10 Ω. What is its Q factor?',
     '[{"id":"a","text":"15","correct":false},{"id":"b","text":"150","correct":true},{"id":"c","text":"1500","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s14_id, 'A higher Q factor in a resonant circuit indicates:',
     '[{"id":"a","text":"A sharper, more selective resonance peak","correct":true},{"id":"b","text":"A broader, less selective resonance peak","correct":false},{"id":"c","text":"That the circuit is no longer resonant","correct":false}]',
     '{"B1.1","B1.3","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M03.15 Transformers (14 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s15_id, 'A transformer transfers power from primary to secondary via:',
     '[{"id":"a","text":"A direct electrical connection between the windings","correct":false},{"id":"b","text":"Mutual inductance / a shared magnetic field","correct":true},{"id":"c","text":"Capacitive coupling only","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s15_id, 'A transformer has 100 primary turns and 600 secondary turns. What is the turns ratio, and what type of transformer is it?',
     '[{"id":"a","text":"6:1, step-up","correct":true},{"id":"b","text":"1:6, step-down","correct":false},{"id":"c","text":"1:1, isolation only","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s15_id, 'A transformer with a 6:1 step-up turns ratio has 120 V applied to its primary. What is the secondary voltage?',
     '[{"id":"a","text":"20 V","correct":false},{"id":"b","text":"120 V","correct":false},{"id":"c","text":"720 V","correct":true}]',
     '{"B1.1","B1.3","B2"}'),

    (s15_id, 'A step-down transformer has a 20:1 voltage ratio and 6 V across a 0.6 Ω secondary load. What is the secondary current?',
     '[{"id":"a","text":"0.5 A","correct":false},{"id":"b","text":"10 A","correct":true},{"id":"c","text":"20 A","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s15_id, 'Assuming zero losses, if a transformer steps voltage up, the secondary current compared to the primary current is:',
     '[{"id":"a","text":"Stepped down by the same ratio","correct":true},{"id":"b","text":"Stepped up by the same ratio","correct":false},{"id":"c","text":"Unchanged","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s15_id, 'A transformer (assume zero losses) has two secondary windings delivering 72 W and 60 W respectively, from a 120 V primary. What is the primary current?',
     '[{"id":"a","text":"0.6 A","correct":false},{"id":"b","text":"1.1 A","correct":true},{"id":"c","text":"1.32 A","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s15_id, 'An autotransformer differs from a conventional isolated-winding transformer in that it:',
     '[{"id":"a","text":"Uses a single continuous tapped winding with no isolation between primary and secondary","correct":true},{"id":"b","text":"Can only be used to step voltage down, never up","correct":false},{"id":"c","text":"Requires four separate leads instead of three","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s15_id, 'The most widely used current transformer design on aircraft uses:',
     '[{"id":"a","text":"A many-turn wound primary winding","correct":false},{"id":"b","text":"The load''s own supply cable as a single-turn (bar) primary","correct":true},{"id":"c","text":"No secondary winding at all","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s15_id, 'If the primary of a current transformer must remain energised while its secondary load is disconnected, the secondary terminals should be:',
     '[{"id":"a","text":"Left open-circuited","correct":false},{"id":"b","text":"Shorted together","correct":true},{"id":"c","text":"Connected to a high-value resistor","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s15_id, 'Operating a current transformer primary with the secondary open-circuited can result in:',
     '[{"id":"a","text":"Reduced core flux and no adverse effects","correct":false},{"id":"b","text":"High core flux, overheating, and permanent core pre-magnetisation","correct":true},{"id":"c","text":"Automatic disconnection of the primary current","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s15_id, 'An isolated secondary winding, compared to an autotransformer connection, provides:',
     '[{"id":"a","text":"No particular safety advantage","correct":false},{"id":"b","text":"Reduced shock risk and blocking of DC from the primary","correct":true},{"id":"c","text":"A higher voltage step-up ratio","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s15_id, 'Typical power transformers (50–300 W rating) have an efficiency of approximately:',
     '[{"id":"a","text":"50–60%","correct":false},{"id":"b","text":"80–90%","correct":true},{"id":"c","text":"99.9%","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s15_id, 'Eddy current losses in a transformer core increase with:',
     '[{"id":"a","text":"Increasing frequency","correct":true},{"id":"b","text":"Decreasing frequency","correct":false},{"id":"c","text":"Core temperature only, independent of frequency","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s15_id, 'A ferrite core is preferred over a laminated iron core for high-frequency applications because it:',
     '[{"id":"a","text":"Has higher electrical conductivity than iron","correct":false},{"id":"b","text":"Is ferromagnetic but also an insulator, minimising eddy-current loss","correct":true},{"id":"c","text":"Cannot support any magnetic flux","correct":false}]',
     '{"B1.1","B1.3","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M03.16 Filters, AC Generators, AC Motors & Starter/Generator (20 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    -- Filters (5)
    (s16_id, 'An octave represents a frequency ratio of:',
     '[{"id":"a","text":"2:1","correct":true},{"id":"b","text":"10:1","correct":false},{"id":"c","text":"3:1","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s16_id, 'A decade represents a frequency ratio of:',
     '[{"id":"a","text":"2:1","correct":false},{"id":"b","text":"10:1","correct":true},{"id":"c","text":"100:1","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s16_id, 'The cut-off frequency (fc) of a filter is defined as:',
     '[{"id":"a","text":"The frequency of maximum attenuation within the stop-band","correct":false},{"id":"b","text":"The frequency separating the pass-band from the stop-band","correct":true},{"id":"c","text":"The resonant frequency of the power supply","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s16_id, 'A filter that attenuates frequencies above fc while passing frequencies below fc is a:',
     '[{"id":"a","text":"Low-pass filter","correct":true},{"id":"b","text":"High-pass filter","correct":false},{"id":"c","text":"Band-stop filter","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s16_id, 'A band-pass filter is constructed using:',
     '[{"id":"a","text":"A single resistor only","correct":false},{"id":"b","text":"A series-tuned circuit and a parallel-tuned circuit, both tuned to the same f0","correct":true},{"id":"c","text":"Two identical low-pass filters in series","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    -- AC Generators (6)
    (s16_id, 'Fleming''s Right-Hand Rule (used for generators) assigns the THUMB to represent:',
     '[{"id":"a","text":"The direction of current","correct":false},{"id":"b","text":"The direction of the magnetic field","correct":false},{"id":"c","text":"The direction of motion","correct":true}]',
     '{"B1.1","B1.3","B2"}'),

    (s16_id, 'In a rotating-field type AC generator, the slip rings carry:',
     '[{"id":"a","text":"The full output load current","correct":false},{"id":"b","text":"Only the (smaller) DC field excitation current","correct":true},{"id":"c","text":"No current at all","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s16_id, 'A key advantage of the rotating-field generator over the rotating-armature type is that:',
     '[{"id":"a","text":"The heavy output windings, being stationary, are not subject to centrifugal force","correct":true},{"id":"b","text":"It requires no DC excitation source at all","correct":false},{"id":"c","text":"It produces DC output directly without rectification","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s16_id, 'A generator rotor has 2 pole pairs and turns at 3000 RPM. Using F = P × N/60, what is the output frequency?',
     '[{"id":"a","text":"50 Hz","correct":false},{"id":"b","text":"100 Hz","correct":true},{"id":"c","text":"200 Hz","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s16_id, 'An AC generator supplying a capacitive reactive load will tend to see its terminal voltage:',
     '[{"id":"a","text":"Rise, due to additive rotor and stator fields","correct":true},{"id":"b","text":"Fall, due to opposing rotor and stator fields","correct":false},{"id":"c","text":"Remain completely unaffected","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s16_id, 'In the brushless (permanent magnet) AC generator, the main generator field DC current is derived from:',
     '[{"id":"a","text":"A direct connection to the aircraft battery","correct":false},{"id":"b","text":"An exciter generator output, rectified by a full-wave bridge","correct":true},{"id":"c","text":"Slip rings connected to the main output busbar","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    -- AC Motors (6)
    (s16_id, 'A 3-phase stator is supplied at 50 Hz. At what speed does the resulting rotating field turn?',
     '[{"id":"a","text":"1500 rpm","correct":false},{"id":"b","text":"3000 rpm","correct":true},{"id":"c","text":"6000 rpm","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s16_id, 'A synchronous AC motor cannot start on its own because:',
     '[{"id":"a","text":"It has no rotor winding","correct":false},{"id":"b","text":"Rotor inertia cannot respond to the rapidly rotating stator field","correct":true},{"id":"c","text":"It only operates on DC","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s16_id, 'An induction motor''s rotating field turns at 1000 rpm while the rotor turns at 960 rpm. What is the slip?',
     '[{"id":"a","text":"0.4%","correct":false},{"id":"b","text":"4%","correct":true},{"id":"c","text":"40%","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s16_id, 'The starting current of a squirrel-cage induction motor, compared to its running current, is typically:',
     '[{"id":"a","text":"About the same","correct":false},{"id":"b","text":"4 to 6 times higher","correct":true},{"id":"c","text":"Lower than running current","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s16_id, 'A capacitor-start single-phase induction motor achieves an approximate 90° phase difference between winding currents by:',
     '[{"id":"a","text":"Using two identical resistive windings","correct":false},{"id":"b","text":"Sizing the capacitor so the auxiliary current leads while the main (inductive) winding current lags","correct":true},{"id":"c","text":"Running the motor at exactly synchronous speed","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s16_id, 'A hysteresis motor is particularly well suited to autopilot servomotor applications because it:',
     '[{"id":"a","text":"Produces essentially constant torque from standstill up to synchronous speed","correct":true},{"id":"b","text":"Has the highest possible starting current of any AC motor type","correct":false},{"id":"c","text":"Cannot operate at synchronous speed","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    -- Starter/Generator (3)
    (s16_id, 'When operating as a STARTER, an aircraft starter/generator unit is connected as a:',
     '[{"id":"a","text":"Series-wound motor, for high starting torque","correct":true},{"id":"b","text":"Shunt-wound motor, for constant speed","correct":false},{"id":"c","text":"Permanent-magnet synchronous motor","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s16_id, 'When operating as a GENERATOR, a starter/generator unit uses:',
     '[{"id":"a","text":"Only the series field winding","correct":false},{"id":"b","text":"Only the shunt field winding, under voltage regulator control","correct":true},{"id":"c","text":"Neither winding — it free-wheels","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s16_id, 'The purpose of the Reverse Current Relay in a starter/generator circuit is to:',
     '[{"id":"a","text":"Boost generator output during heavy electrical loads","correct":false},{"id":"b","text":"Disconnect the generator when its output drops below a preset value, preventing battery discharge back through it","correct":true},{"id":"c","text":"Reverse the direction of the starter motor for engine shutdown","correct":false}]',
     '{"B1.1","B1.3","B2"}');

END $$;
