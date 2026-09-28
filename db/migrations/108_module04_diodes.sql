-- Module 04: Electronic Fundamentals (B1/B2 Common) — Diodes
-- Source: EASA Part-66 Module 04 B1 official textbook (Aircraft Technical Book Company); IK Module 4 B2 course notes (IKAROS)

DO $$
DECLARE
    m04_id INT;
    s1_id  INT;
BEGIN
    SELECT id INTO m04_id FROM easa_modules WHERE code = 'M04';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M04.1') THEN
        RAISE NOTICE 'M04.1 already seeded, skipping.';
        RETURN;
    END IF;

    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m04_id, 'M04.1', 'Diodes',
        $cnt$
# Diodes

## 1. Atomic Structure and Energy Bands

Every atom has a nucleus (protons and neutrons) surrounded by electrons arranged in orbital shells. Under normal conditions the number of electrons equals the number of protons, so the atom is electrically neutral. Each shell can hold only a fixed maximum number of electrons:

| Shell | 1 | 2 | 3 | 4 | 5 |
|-------|---|---|---|---|---|
| Maximum electrons | 2 | 8 | 18 | 32 | 50 |

The outermost occupied shell is the **valence shell**, and its electron count determines the material's electrical behaviour:

- A **full valence shell** (8 electrons) binds electrons strongly to the nucleus — the material is chemically stable and resists current flow. These materials are **insulators**.
- An **incomplete valence shell** allows electrons to move relatively freely between atoms — these free electrons carry **electric current**, and the material is a **conductor**. Common conductors (aluminium, copper, silver, gold) have one or three valence electrons.

In solids, the interaction between neighbouring atoms splits and overlaps individual electron energy levels into continuous **energy bands**. The two bands that matter electrically are:

- The **valence band** — normally full of electrons.
- The **conduction band** — empty or partially filled; electrons here are free electrons.

Between the two lies the **forbidden gap**. An electron can jump from the valence band to the conduction band only if it gains enough energy to cross this gap.

- **Conductor**: the conduction band is partially filled, or the valence and conduction bands overlap (forbidden gap = zero).
- **Insulator**: the conduction band is empty and the forbidden gap is so large that electrons essentially never acquire enough energy to cross it.
- **Semiconductor**: at absolute zero the conduction band is empty (behaves as an insulator), but as temperature rises more electrons gain enough energy to cross the forbidden gap — so a semiconductor behaves like an insulator when cold and like a conductor when hot.

Approximate forbidden-gap energies: **diamond 7 eV** (nearly an insulator), **silicon 1.2 eV**, **germanium 0.78 eV**. Typical resistivity: conductor ≈ 10⁻⁶ ohm-cm, insulator ≈ 10⁷ ohm-cm, semiconductor ≈ 10⁻³ to 10¹⁰ ohm-cm.

## 2. Semiconductor Materials

**Silicon** (14 electrons, 4 in the valence shell) and **germanium** (32 electrons, 4 in the outer shell) are the two semiconductor materials used in electronic devices. Silicon is the primary material used in modern semiconductor manufacture.

### Crystal Lattice and Covalent Bonds

Silicon atoms share their four valence electrons with four neighbouring silicon atoms, forming **covalent bonds**. This sharing gives every atom eight electrons in its effective valence shell, producing a stable, symmetric **crystal lattice**. In this pure (undoped) state, silicon is a good insulator — there are no free electrons and no vacancies to accept one.

### Hole-Electron Pairs and Intrinsic Semiconductors

If an electron absorbs enough energy to break free of its covalent bond and jump into the conduction band, it leaves behind a vacancy called a **hole**, which behaves as a positive charge. The free electron and the hole it left behind are called a **hole-electron pair**. Because the free electron tends to fall back into a hole, a hole-electron pair has only a limited average lifetime, called the **mean free time**.

Pure, undoped silicon or germanium is called an **intrinsic semiconductor** — for every free electron there is exactly one hole. With no external field applied, holes and electrons move randomly with no net current. Under an applied field, holes drift toward the negative terminal and electrons toward the positive terminal; this is **intrinsic conduction**, heavily dependent on temperature, and normally very small in magnitude.

### Doping — Extrinsic Semiconductors

The number of free electrons or holes can be greatly increased by adding a small, controlled amount of impurity to the crystal — a process called **doping**. The doped material is an **extrinsic semiconductor**.

- **Donor impurities** (N-type): elements with **five valence electrons** — arsenic, phosphorus, antimony. Four of the five electrons form covalent bonds within the lattice; the fifth is free to enter the conduction band. Each donor atom becomes a fixed, positively-charged ion (it cannot move, and is therefore not a hole). The doped material is called **N-type** or **donor material** — it is negatively charged overall due to the surplus free electrons, though the material as a whole remains electrically neutral (equal positive and negative charge).
- **Acceptor impurities** (P-type): elements with **three valence electrons** — boron, gallium, indium. Each impurity atom leaves an electron vacancy (a hole) in the lattice. The doped material is called **P-type** or **acceptor material**, since it accepts electrons into these holes.

## 3. P-Type and N-Type Materials — Majority and Minority Carriers

| | N-Type Material | P-Type Material |
|---|---|---|
| Dopant | Donor (5 valence electrons: As, P, Sb) | Acceptor (3 valence electrons: B, Ga, In) |
| Majority carrier | Free electrons | Holes |
| Minority carrier | Holes (from thermal bond breakdown) | Electrons (from thermal bond breakdown) |
| Overall charge | Electrically neutral | Electrically neutral |

At normal temperatures, conduction in either material is dominated by its majority carriers — this is called **extrinsic conduction**. As temperature rises, more covalent bonds break down thermally, increasing the number of minority carriers, and conduction becomes progressively more **intrinsic**.

## 4. The PN Junction Diode

When a piece of P-type material and a piece of N-type material are joined, the boundary is called the **PN junction**, and the combined two-element device is a basic **diode** — a device that allows current to flow easily in one direction but not the other.

### Unbiased PN Junction

With no external voltage applied, majority carriers **diffuse** across the junction: holes move from the P side into the N side and recombine with electrons there; electrons move from the N side into the P side and recombine with holes there. As electrons leave the N side, they leave behind fixed positive ions; as holes are filled on the P side, fixed negative ions are created. This forms a narrow, carrier-free region around the junction called the **depletion zone** (also depletion layer or space-charge region), inside which an **electrostatic field** — the **potential barrier** or **potential hill** — builds up.

The diffusion continues only until the barrier becomes strong enough to oppose further majority-carrier movement. At that point the junction reaches **equilibrium**: majority-carrier diffusion is exactly balanced and there is no net current across the junction. Outside the depletion zone, both materials remain electrically neutral.

At room temperature and normal doping levels, the potential barrier is approximately:
- **≈ 0.3 V for germanium**
- **≈ 0.7 V for silicon**

### Forward Bias

Connecting the battery's **positive terminal to the P-type material** and its **negative terminal to the N-type material** forward-biases the junction. The applied voltage opposes the internal electrostatic field and **reduces the potential barrier**. Holes in the P material and free electrons in the N material are pushed toward the junction, the **depletion zone narrows**, and once the barrier voltage is overcome, majority carriers cross freely and recombine — current flows. A forward-biased junction behaves approximately as a low resistance (on the order of 1 kΩ). Current increases roughly linearly with voltage once conduction begins, and increases further as the applied voltage (and hence carrier density) increases.

### Reverse Bias

Reversing the battery connections — **negative to the P-type, positive to the N-type** — reverse-biases the junction. Holes and electrons are pulled away from the junction, the **depletion zone widens**, and the potential barrier **increases**. Majority carriers no longer have enough energy to cross the barrier, so majority-carrier current effectively stops; the junction behaves as a very high resistance (on the order of 1 MΩ). A small **reverse (leakage) current** still flows, carried by minority carriers — typically in the microamp range, e.g. roughly 10–100 µA for germanium and 0.01–0.02 µA for silicon. This current depends on the thermal generation rate of hole-electron pairs and is fairly constant for a given temperature (the **reverse saturation current**); it does not increase significantly as reverse voltage increases further, but it does increase with rising temperature.

### Breakdown

If reverse voltage is increased far enough, the minority carriers accelerate until they collide with valence electrons hard enough to break more covalent bonds, generating still more free carriers — a cascading effect called **avalanche breakdown**, which destroys an ordinary junction diode. (A diode specifically designed to operate safely in this region is the **Zener diode**, covered below.)

## 5. Diode Symbols and Identification

The diode symbol is a triangle with a bar. The end where conventional current enters — the base of the triangle — is the **anode** (the P-type material); the end where current leaves — the point of the triangle, marked by the bar — is the **cathode** (the N-type material). The arrow points in the direction of **conventional current flow** (opposite to electron flow). Because electron-flow convention is also used in some texts, current-flow arrows are sometimes added to diagrams to avoid ambiguity.

Manufacturers identify the cathode end with a "k", "+", "cath", a colour dot or band, or a distinctive shape (raised edge or taper).

### Identification Codes

Two main systems are used:

- **American system**: begins with **1N** followed by a serial number, e.g. **1N4001**. The leading digit indicates the number of junctions (one less than the number of active elements): **1 = diode**, 2 = transistor, 3 = tetrode. A suffix letter may follow — e.g. "A" for an improved/modified version, "M" for matched pairs, "R" for reverse polarity.
- **Continental (European) system**: the **first letter** gives the semiconductor material — **A = germanium**, **B = silicon**. The **second letter** gives the use — **A = signal diode**, **Y = rectifier diode**, **Z = Zener diode**.

### Colour Code

Where colour bands are used on the cathode end, each colour represents a digit (the same code used for resistors):

| Colour | Digit |
|--------|-------|
| Black | 0 |
| Brown | 1 |
| Red | 2 |
| Orange | 3 |
| Yellow | 4 |
| Green | 5 |
| Blue | 6 |
| Violet | 7 |
| Gray | 8 |
| White | 9 |

Example: brown, orange, white bands read as digits 1, 3, 9 — identifying the device as type **1N139**.

## 6. Diode Parameters and Ratings

Manufacturers publish diode ratings — limiting values outside of which the diode may be damaged — including:

- **Maximum Average Forward Current** — the maximum average current permitted in the forward direction (usually quoted at 25 °C); exceeding it can cause structural breakdown.
- **Peak Recurrent Forward Current** — the maximum peak current allowed in the forward direction as recurring pulses.
- **Maximum Surge Current** — the maximum forward current allowed as a brief, non-recurring pulse (only for a few milliseconds).
- **Peak Reverse Voltage (PRV)**, also called **Peak Inverse Voltage (PIV)** — the maximum reverse-bias voltage the diode can withstand without junction breakdown.
- **Reverse Current (I_R)** — the small leakage current that flows under reverse bias.
- **Maximum Forward Voltage Drop at Indicated Forward Current (V_F @ I_F)**.
- **Reverse Recovery Time (T_RR)** — the time taken for a diode to stop conducting after switching from forward to reverse bias.

All ratings vary with **temperature and frequency** — ratings must be reduced if the diode operates above its rated temperature, and switching-related parameters (such as reverse recovery time) determine the maximum usable frequency.

## 7. Functional Testing and Maintenance of Diodes

A diode can be checked quickly with an **ohmmeter**. Disconnect one lead from the circuit and take two resistance readings — once with the test leads one way round, once reversed:

- A **normal** diode shows **high resistance in one direction (reverse) and low resistance in the other (forward)**.
- **Two high readings** suggest the diode is open, or has excessively high forward resistance.
- **Two low readings** suggest the diode is shorted.

The ratio between the reverse and forward resistance readings is the **front-to-back (or back-to-front) ratio** — the higher this ratio, the more efficient the diode. As a rule of thumb, a small signal diode should show a ratio of several hundred to one, while a power rectifier can operate satisfactorily with a ratio as low as 10 to 1. The ohmmeter test is not fully conclusive, because the ohmmeter applies a much lower voltage than the diode sees in normal operation — a diode can test "good" yet fail once back in circuit. The only fully valid test is a dynamic electrical test of forward and reverse current/resistance using a proper diode test set.

**Safety precautions**: never insert or remove a diode with voltage applied; never pry a diode from its mounting; avoid overheating the junction while soldering; never exceed the diode's maximum rated test voltage; avoid touching a signal diode's leads directly, since static discharge from the body can damage it; always replace with a direct equivalent, fitted the correct way round.

**Thermal runaway**: heat generates more hole-electron pairs, which increases current flow; the increased current generates more heat, and the cycle repeats until the diode draws excessive current and is destroyed. This is a key reason diode circuits must be kept within their rated operating temperature.

## 8. Diodes in Series and Parallel — Half-Wave, Full-Wave and Bridge Rectification

A single diode placed in series with an AC source and a load conducts only during the half-cycle that forward-biases it; during the other half-cycle it is reverse biased and blocks. This is **half-wave rectification** — only half of the AC waveform is used.

Rectifier diodes need **low resistance in the forward direction** and **high resistance in the reverse direction**; because of the need for very low reverse leakage and high reverse breakdown voltage, almost all rectifier diodes are silicon.

### Half-Wave Rectifier

A single diode conducts on alternate half-cycles, producing a **pulsating DC** output through the load.

- Peak output voltage = peak value of the transformer secondary voltage.
- **Mean (average) output value ≈ 32% of the peak value.**
- Ripple frequency = same as the input (supply) frequency.
- The pulsating output is of little use for most electronic equipment; the basic half-wave circuit is mainly used for simple battery charging.

### Centre-Tapped Full-Wave Rectifier

Two diodes are fed from opposite ends of a centre-tapped transformer secondary and conduct on alternate half-cycles, so current flows through the load in the same direction on both halves of the AC cycle.

- Peak output voltage = peak amplitude across **half** the secondary winding.
- **Mean output value ≈ 64% of the peak value.**
- **Ripple frequency = twice the input frequency.**
- Current in the transformer secondary flows in opposite directions on alternate half-cycles, so there is no net polarisation of the transformer core, giving lower transformer losses.
- Output current is shared between the two diodes, so this circuit suits higher load currents than a simple half-wave circuit.

### Full-Wave Bridge Rectifier

Four diodes are arranged so that one diode pair conducts on the positive half-cycle and the other pair conducts on the negative half-cycle, and no centre-tapped transformer is required — making the bridge circuit **lighter and cheaper** than the centre-tap version.

- Peak output voltage = peak amplitude across the **whole** of the secondary winding.
- The output waveform is the same shape as the centre-tapped full-wave rectifier's.

## 9. Three-Phase Rectification

Using three separate AC phases for rectification (rather than a single phase) gives, for a given transformer secondary voltage: a **higher DC output voltage**, a **higher ripple frequency** (which is easier to smooth), **lower-amplitude ripple**, and **higher overall efficiency**.

### Three-Phase Half-Wave Rectifier

Typically uses a delta-connected primary and star-connected secondary. At any instant only the diode with the highest anode potential conducts, so each diode conducts for one-third of a cycle.

- DC output varies between a maximum of E_max (peak phase voltage) and a minimum of half E_max.
- **Average DC output ≈ 0.826 × E_max.**
- **Ripple frequency = three times the supply frequency**, and ripple amplitude is roughly a third of that from an unsmoothed single-phase circuit.

### Three-Phase Full-Wave Bridge Rectifier

The most widely used circuit for high-power semiconductor rectification. Load current always flows through **two diodes in series** across the transformer's line voltage; the conducting diode pair changes every sixth of a cycle.

- **Ripple frequency = six times the supply frequency**, giving small ripple amplitude.
- **Average DC output ≈ 0.955 × E_max** — a high DC output for a given transformer voltage.

## 10. Power Supplies: Smoothing, Ripple, PIV and Regulation

A power supply unit (PSU) converts the AC mains supply into a form suitable for electronic equipment, in the following stages: **input transformer → rectifier → smoothing (filter) → stabiliser (regulator)**.

- The **input transformer** steps the AC voltage up or down to whatever value is needed and isolates the rectifier from the mains.
- The **rectifier** converts the transformer's AC output into pulsating DC. An ideal rectifier has zero forward resistance and infinite reverse resistance.
- The **smoothing/filter** stage converts the pulsating DC into a steadier DC voltage.
- The **stabiliser/regulator** keeps the output DC voltage steady despite variations in mains input or load current.

### Smoothing with a Reservoir Capacitor

A capacitor placed across the load charges through the diode toward the peak of the input voltage whenever the input exceeds the capacitor voltage (diode conducting); when the input falls below the capacitor voltage, the diode cuts off and the capacitor discharges slowly through the load resistor. This produces a mean DC level **below** the input peak, with a **ripple** component superimposed at the input (half-wave) or twice the input (full-wave) frequency.

- The **higher the load current** (lower load resistance), the **higher the ripple amplitude**.
- The **larger the ripple amplitude**, the **lower the mean DC output level**.
- At zero load current, the mean output equals the peak of the input AC voltage.
- A full-wave rectifier with a reservoir capacitor has its charge topped up **twice** per input cycle, giving **lower ripple**, a **higher ripple frequency (2× input)**, and a **higher mean DC output** than an equivalently loaded half-wave circuit.

### Ripple Factor

**Ripple Factor = (RMS ripple voltage / DC output voltage) × 100%**

*Example*: a 3 V rms ripple superimposed on an 80 V DC output gives a ripple factor of (3 / 80) × 100 = **3.75%**.

### Peak Inverse Voltage (PIV)

The **Peak Inverse Voltage** is the peak reverse voltage appearing across a rectifier diode during its non-conducting half-cycle; the diode must be rated to withstand this without breakdown. In a **half-wave rectifier with a reservoir capacitor**, the PIV is **twice the peak amplitude of the applied AC voltage**, because the capacitor's stored peak charge adds to the reverse AC swing across the non-conducting diode.

### Voltage Regulation

Voltage regulation measures a PSU's ability to hold its output voltage steady as load current increases:

**Regulation = (Off-load volts − On-load volts) / Off-load volts × 100%**

*Example*: a PSU supplies 360 V off-load; at a load current of 1.5 A the output falls to 295 V. Regulation = (360 − 295) / 360 × 100 = **18.1%**. A smaller percentage indicates better (tighter) regulation.

### Ripple Filters

Beyond a simple reservoir capacitor, dedicated ripple filters give a smoother DC output:

- **RC filter**: adds a series resistor R_F and shunt capacitor C_F after the reservoir capacitor. DC is divided between R_F and R_L (little DC is dropped across R_F if R_F ≪ R_L); AC ripple is divided between R_F and the reactance of C_F, with most of the ripple dropped across R_F (if R_F ≫ X_Cf). Ripple is reduced, but there is a DC voltage drop across R_F and **regulation is poor**.
- **LC filter**: replaces the resistor with an inductor, which presents high series impedance to the ripple frequency **without** the DC voltage drop of an RC filter. DC output equals the average of the rectified pulses (lower than with a capacitor-input filter). The LC filter gives **good regulation at high load currents**; a bleeder resistor is often added to keep the minimum current at least about 10% of full-load current.
- **π-section (capacitor-input) filter**: a reservoir capacitor followed by an LC filter section. The AC ripple divides between the high reactance of L and the low reactance of the second capacitor, with most ripple dropped across L — giving a substantial reduction in ripple without losing mean DC level, and **better regulation than an RC filter**.

### Voltage Doublers and Triplers

A **voltage doubler** connects the outputs of two half-wave rectifiers in series, both fed from the same transformer secondary winding: on the positive half-cycle one diode conducts and charges its capacitor to the peak supply voltage; on the negative half-cycle the second diode conducts and charges its own capacitor. The output is the **sum of the two capacitor voltages**. Under load, one capacitor discharges while the other charges, so the output falls significantly — **regulation is very poor**.

A **voltage tripler** (for information only) extends the doubler with an additional diode, capacitor and resistor. In one worked example: during the positive alternation, the added diode charges its capacitor to the peak input voltage (e.g. 200 V) while the first doubler capacitor also charges to 200 V; during the negative alternation, the second doubler capacitor is charged to twice the input voltage (400 V) by the doubling action; the two later capacitors then act in series-aiding, giving an output equal to the sum of their voltages (e.g. 400 V + 200 V = 600 V).

## 11. Clamping and Limiting Circuits

### Clamping (DC Restorer) Circuits

A **clamping circuit**, also called a **DC restorer**, shifts the reference (DC) level of a waveform **without** changing its amplitude or significantly altering its shape. This is needed because passing a waveform through a capacitor removes or alters its DC component. The simplest clamping circuit is a single diode with a resistor and capacitor. Diode-clamping circuits rely on three principles: when the diode is **cut off**, the CR circuit has a **long time constant**; when the diode **conducts**, the CR circuit has a **short time constant**; and Kirchhoff's voltage law (V_in = V_C + V_R) must be satisfied at all times. The reference (bias) voltage to which the circuit is returned may be of either polarity, including zero.

### Limiting (Clipping) Circuits

A **limiting** or **clipping circuit** removes ("slices off") the part of a waveform that lies above or below a specified reference level — used when an unwanted part of a waveform must be removed before it reaches later circuit stages. Limiters are named by which part of the waveform is removed and by the diode's position in the circuit:

- **Positive limiter** — removes parts of the input above the reference level.
- **Negative limiter** — removes parts of the input below the reference level.
- **Series limiter** — the diode is connected in series between input and output.
- **Parallel (shunt) limiter** — the diode is connected in parallel with the output.
- **Combined limiter** — uses a positive and a negative limiter together, to slice a section out of both ends of a waveform.

The basic principle assumes an ideal diode: zero resistance when forward biased, infinite resistance when reverse biased. A fixed series resistor is chosen to be large compared with the diode's forward resistance but small compared with its reverse resistance, so that nearly all the input voltage appears across the diode when it is not conducting, and across the resistor when it is.

## 12. Zener Diode

The Zener diode is deliberately manufactured (always in silicon, to meet temperature requirements) to operate safely in the **reverse breakdown region** — unlike an ordinary diode, which is destroyed by avalanche breakdown. Two related but distinct devices share this name:

- **Voltage Reference Diode** — develops and holds a very stable reference voltage across its terminals when conducting within a narrow current range; has a very low temperature coefficient so the reference voltage stays essentially constant with temperature. Typical operating range: about **4 V to 75 V**; maximum current on the order of 40 mA.
- **Voltage Regulator Diode** — the voltage across its terminals stays within a defined range over fairly wide variations in current through it, making it useful for holding a supply voltage reasonably constant as circuit conditions change. Some voltage regulator (Zener) diodes can handle currents in excess of 15 A.

Both types are also known as **breakdown diodes** or **avalanche diodes**. Manufactured breakdown voltages range from about 2 V to 100 V, and this range can be extended by connecting diodes in series. In a basic voltage-reference circuit, a series resistor R is chosen so the diode operates in its breakdown region — for example, with a 6.2 V breakdown diode at a working current of 7.5 mA fed from a 28 V supply, R = (28 − 6.2) / 7.5 mA ≈ 2,906 Ω.

## 13. Light Emitting Diode (LED)

An LED is a diode specially doped so that, when **forward biased**, electrons crossing the junction fall into holes in the valence band and **radiate energy as light** rather than as heat (as happens in an ordinary diode). The colour emitted depends on the semiconductor material — for example gallium arsenide phosphide produces red light and gallium phosphide produces green light; other materials produce colours from infrared through visible light to ultraviolet.

- Unless it is a constant-current type with a built-in regulator, an LED needs an **external series resistor** to limit forward current — typically around 10 mA.
- Typical forward voltage drop across a conducting LED is around 1.7 V.
- No light is emitted when the diode is reverse biased.
- Advantages over incandescent lamps: **longer life, lower operating voltage, faster on/off switching, and less heat generated.**
- LEDs are widely used as indicator lights and in **seven-segment displays** (common-anode or common-cathode types) for digital readouts — a replacement display must match the type (common-anode or common-cathode) of the original.

## 14. Photoconductive Cells, Photovoltaic Cells and Photodiodes

**Photocells** convert light into an electrical signal; there are two basic types:

- **Photoconductive cells** — the resistance of certain semiconductors **decreases** as light intensity **increases**; also known as **light-dependent resistors**.
- **Photovoltaic cells** — produce a voltage when illuminated, and will drive current through an external circuit; the available voltage depends on the material, light intensity, and current drawn. A silicon cell in full sunlight gives roughly **0.45 V open-circuit**, with a maximum current of about 35 mA per square centimetre, and typically converts only around 10% of incident light into electrical energy.

A **photodiode** is operated under **reverse bias**. Light falling on the depletion region generates electron-hole pairs, and the diode's leakage (reverse) current increases in proportion to the amount of light falling on it. Photodiodes are used in light-detecting circuits, as fast counters, and as light meters.

## 15. Varactor Diode (Varicap)

The varactor (or varicap) diode is operated under **reverse bias** and used as a **voltage-controlled variable capacitor**. The PN junction acts like the dielectric of a capacitor, and the P and N regions act like the two plates — the same formula used for an ordinary capacitor (C = A·K / d) applies, with the depletion-zone width acting as the plate separation "d".

- **Increasing reverse bias widens the depletion zone**, which **reduces capacitance** — capacitance is inversely proportional to the applied reverse bias.
- The ratio of capacitance change to reverse-bias change can be as high as 10 to 1.
- Uses include: remotely-controlled capacitors in RF tuned circuits, variable capacitors in amplifiers, and variable capacitors in frequency-modulator circuits.
- Testing: a normal varactor shows high resistance under reverse bias and low resistance under forward bias, with roughly a 10-to-1 ratio between the two.

## 16. Varistor

A **varistor** (voltage-dependent resistor) is not a conventional PN-junction semiconductor diode. It is typically a ceramic mass of zinc oxide grains (or silicon carbide) sandwiched between two metal-plate electrodes, forming numerous microscopic diode-like junctions between grains. It behaves as a **nonlinear resistor**: current is proportional to the applied voltage raised to a power n (n ≈ 2 to 6), rather than being directly proportional to voltage as in an ordinary (Ohm's-law) resistor.

- **High resistance at low voltage; resistance falls sharply (effectively "breaks down") at higher voltage**, allowing a large current to flow.
- Used for **transient/surge voltage protection**, shunting damaging currents away from sensitive components, and for generating non-sinusoidal waveforms.
- Can withstand very high voltages — up to around 10,000 V DC in some constructions.

## 17. Schottky Diode

A Schottky diode joins a **metal** (such as gold, silver or platinum) directly to **doped silicon** (usually N-type), rather than forming a true PN junction — so it is technically a **metal-semiconductor diode**, and is described as a **unipolar** device because free electrons are the majority carrier on both sides of the junction.

- It has **no depletion zone or charge storage**, so it can switch far faster than a conventional PN diode — switching speeds up to around 300 MHz, compared with much slower typical PN-junction switching.
- Its **forward voltage drop is very low** — around **0.15 V**, versus about 0.7 V for a silicon PN diode.
- Because of its short reverse recovery time and low forward drop, it is well suited to **high-frequency rectification**.

## 18. Power Rectifier Diodes

Rectifier diodes intended for power-supply applications are designed to carry high current — from about **1 A up to hundreds of amperes**. A common family is the **1N4001 to 1N4007** series, with an average current rating around 1 A and peak inverse voltages ranging from about **50 V to 1,000 V**. Larger rectifier diodes can carry currents up to about **300 A** with a peak inverse voltage around **600 V**; these larger types are typically encased in metal to act as a heat sink.

## 19. Silicon Controlled Rectifier (Thyristor), TRIAC and DIAC

A **thyristor** is a bistable semiconductor device with **four or more layers** and **three or more PN junctions**. "Thyristor" is a generic family name; several family members have their own common names.

### Reverse Blocking Diode Thyristor

Also known as a **PNPN switch**, **Shockley diode**, or **four-layer diode**. It is a two-terminal, four-layer (alternating P-N-P-N) device with three junctions; the anode is the outer P layer and the cathode is the outer N layer.

- **Reverse bias**: behaves as a reverse-biased junction diode — only a small leakage current flows (reverse blocking / OFF state).
- **Small forward bias**: one internal junction remains reverse biased and blocks conduction — this is the **forward blocking state**.
- **Breakover voltage**: if forward bias is increased enough, the blocking junction breaks down, the voltage across the device collapses to a small value, and the device switches **ON** — conducting with a small voltage drop (about 0.5–1.5 V) while carrying substantial forward current (amps rather than milliamps).
- **Switch off**: achieved by reducing device current below the **holding current** — the minimum current needed to keep the device in its ON state.

### Reverse Blocking Triode Thyristor (SCR)

This adds a third terminal, the **gate**, connected to one of the inner layers — allowing the device to be switched ON with a much smaller triggering voltage/current applied to the gate rather than relying solely on breakover voltage. If the gate connects to the inner P layer it is called a **P-gate (cathode-controlled)** device; if it connects to the inner N layer it is an **N-gate (anode-controlled)** device. This triode thyristor is what is most often called the **Silicon Controlled Rectifier (SCR)**, particularly in power applications — it gives a controllable, unidirectional (DC) output current from an AC waveform. It can only be switched off by reducing the device current/voltage to virtually zero (not by the gate). A common application is **phase control**: varying the timing of the gate trigger pulse (via an RC charging network) controls the point in each AC half-cycle at which the SCR switches on, thereby controlling the average power delivered to a load.

### Bi-Directional Triode Thyristor (TRIAC)

Equivalent to **two SCRs connected in inverse parallel**, so that both halves of an AC waveform can be used, sharing a **single gate terminal** for simplified triggering. Widely used in AC power control (e.g. motor speed control, solid-state relays/contactors). Advantages over electromechanical relays: no contact bounce at switch-on, no arcing at switch-off, small size, light weight, no moving parts, and no routine maintenance. Its main limitation is that it can only be used to control **AC loads**.

### Bi-Directional Breakdown Diode (DIAC)

A **two-terminal, three-layer device** — it is **not** a member of the thyristor family, but is closely associated with triacs in practical circuits. It is similar in construction to a PNP transistor without a base connection, with both P regions doped identically to give a symmetrical breakdown characteristic in either polarity. As an increasing voltage of either polarity is applied, only a small leakage current flows until a certain breakdown voltage is reached; the device then switches into conduction with a corresponding drop in voltage across it (current is limited by other series components). Its main application is generating the **gate triggering pulses for a TRIAC**: a capacitor charges through a resistor until it reaches the DIAC's breakdown voltage, at which point it discharges rapidly through the DIAC into the TRIAC's gate, switching the TRIAC on.

## 20. Summary — Diode Types at a Glance

| Type | Bias in normal use | Key characteristic | Typical use |
|------|--------------------|--------------------|-------------|
| Rectifier diode | Forward/reverse (switching) | High current capability (1 A–hundreds of A) | AC-to-DC power conversion |
| Zener diode | Reverse (breakdown region) | Stable reference/regulation voltage in breakdown | Voltage reference / regulation |
| LED | Forward | Emits light from electron-hole recombination | Indicators, displays |
| Photoconductive cell | N/A (passive) | Resistance falls as light increases | Light-dependent resistor |
| Photovoltaic cell | N/A (generates voltage) | Produces voltage when illuminated | Light/solar sensing |
| Photodiode | Reverse | Leakage current rises with light | Light detection, fast counters |
| Varactor (varicap) | Reverse | Capacitance varies with reverse bias | RF tuning |
| Varistor | Non-polarised, nonlinear | High R at low V, low R at high V | Transient/surge protection |
| Schottky diode | Forward/reverse (switching) | Very low V_F, no depletion zone, very fast switching | High-frequency rectification |
| SCR / thyristor | Forward (gate-triggered) | Latches ON above holding current | Phase control, pulse generation |
| TRIAC | Bi-directional (gate-triggered) | Two SCRs in inverse parallel | AC power/motor speed control |
| DIAC | Bi-directional breakdown | Symmetrical breakdown, no gate | Triggers a TRIAC's gate |
        $cnt$,
        1
    ) RETURNING id INTO s1_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M04.1 Diodes (29 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s1_id, 'A material whose valence shell contains the maximum possible number of electrons (a full valence shell) is generally:',
     '[{"id":"a","text":"A good conductor","correct":false},{"id":"b","text":"A good insulator","correct":true},{"id":"c","text":"A semiconductor at all temperatures","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'The energy region between the valence band and the conduction band, which an electron must cross to become a free electron, is called the:',
     '[{"id":"a","text":"Forbidden gap","correct":true},{"id":"b","text":"Depletion zone","correct":false},{"id":"c","text":"Doping region","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'Silicon and germanium are useful as semiconductors mainly because each atom has how many electrons in its valence shell?',
     '[{"id":"a","text":"Two","correct":false},{"id":"b","text":"Four","correct":true},{"id":"c","text":"Eight","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'Doping pure silicon with an element that has five valence electrons (such as arsenic or phosphorus) produces:',
     '[{"id":"a","text":"P-type material, with holes as the majority carrier","correct":false},{"id":"b","text":"N-type material, with free electrons as the majority carrier","correct":true},{"id":"c","text":"An intrinsic semiconductor with no majority carrier","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'Doping pure silicon with an element that has three valence electrons (such as boron, gallium or indium) produces:',
     '[{"id":"a","text":"N-type material, with free electrons as the majority carrier","correct":false},{"id":"b","text":"P-type material, with holes as the majority carrier","correct":true},{"id":"c","text":"A material with no minority carriers at all","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'When a PN junction is formed with no external voltage applied (unbiased), the narrow region around the junction that becomes free of mobile charge carriers is called the:',
     '[{"id":"a","text":"Valence band","correct":false},{"id":"b","text":"Depletion zone","correct":true},{"id":"c","text":"Doping region","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'To forward bias a PN junction diode, the battery connections must be:',
     '[{"id":"a","text":"Positive terminal to the N-type material, negative to the P-type material","correct":false},{"id":"b","text":"Positive terminal to the P-type material, negative to the N-type material","correct":true},{"id":"c","text":"Either polarity, since diodes are non-polarised","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'When a PN junction is forward biased, the depletion zone:',
     '[{"id":"a","text":"Widens, and the potential barrier increases","correct":false},{"id":"b","text":"Narrows, and the potential barrier is reduced","correct":true},{"id":"c","text":"Is unaffected by the applied voltage","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'When a PN junction is reverse biased, majority-carrier current:',
     '[{"id":"a","text":"Increases sharply with applied voltage","correct":false},{"id":"b","text":"Effectively stops, leaving only a small minority-carrier leakage current","correct":true},{"id":"c","text":"Flows exactly as it does under forward bias","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'The approximate potential barrier (turn-on) voltage of a silicon PN junction diode at room temperature is:',
     '[{"id":"a","text":"Approximately 0.3 V","correct":false},{"id":"b","text":"Approximately 0.7 V","correct":true},{"id":"c","text":"Approximately 5 V","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'If reverse voltage across an ordinary PN junction diode is increased far enough, minority carriers gain enough energy to break more covalent bonds in a cascading effect that destroys the junction. This is known as:',
     '[{"id":"a","text":"Thermal runaway","correct":false},{"id":"b","text":"Avalanche breakdown","correct":true},{"id":"c","text":"Ripple breakdown","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'On a standard diode symbol, the arrow points in the direction of:',
     '[{"id":"a","text":"Conventional current flow, from anode to cathode","correct":true},{"id":"b","text":"Electron flow, from anode to cathode","correct":false},{"id":"c","text":"Heat dissipation only","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'When checking a diode with an ohmmeter, a normal (healthy) diode should show:',
     '[{"id":"a","text":"Low resistance in both directions","correct":false},{"id":"b","text":"High resistance in both directions","correct":false},{"id":"c","text":"High resistance in one direction (reverse) and low resistance in the other (forward)","correct":true}]',
     '{"B1","B2"}'),

    (s1_id, '"Thermal runaway" in a diode describes a condition where:',
     '[{"id":"a","text":"Heat generates more hole-electron pairs, increasing current, which generates more heat, until the diode is destroyed","correct":true},{"id":"b","text":"The diode cools down as current increases, stabilising operation","correct":false},{"id":"c","text":"The diode automatically switches from forward to reverse bias at high temperature","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'In a simple half-wave rectifier circuit, the mean (average) value of the output voltage is approximately:',
     '[{"id":"a","text":"32% of the peak value","correct":true},{"id":"b","text":"64% of the peak value","correct":false},{"id":"c","text":"100% of the peak value","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'Compared with a half-wave rectifier, a centre-tapped full-wave rectifier gives a mean output value of approximately:',
     '[{"id":"a","text":"16% of the peak value","correct":false},{"id":"b","text":"32% of the peak value","correct":false},{"id":"c","text":"64% of the peak value","correct":true}]',
     '{"B1","B2"}'),

    (s1_id, 'A key practical advantage of a full-wave bridge rectifier over a centre-tapped full-wave rectifier is that the bridge circuit:',
     '[{"id":"a","text":"Requires only one diode","correct":false},{"id":"b","text":"Does not need a centre-tapped transformer, making it lighter and cheaper","correct":true},{"id":"c","text":"Produces a higher ripple frequency than the centre-tap circuit","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'In a three-phase full-wave bridge rectifier, the output ripple frequency is:',
     '[{"id":"a","text":"Equal to the supply frequency","correct":false},{"id":"b","text":"Three times the supply frequency","correct":false},{"id":"c","text":"Six times the supply frequency","correct":true}]',
     '{"B1","B2"}'),

    (s1_id, 'The ripple factor of a DC power supply is defined as:',
     '[{"id":"a","text":"(RMS ripple voltage / DC output voltage) x 100%","correct":true},{"id":"b","text":"(DC output voltage / RMS ripple voltage) x 100%","correct":false},{"id":"c","text":"Peak ripple voltage divided by supply frequency","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'In a half-wave rectifier circuit fitted with a reservoir (smoothing) capacitor, the Peak Inverse Voltage across the diode is approximately:',
     '[{"id":"a","text":"Equal to the peak of the applied AC voltage","correct":false},{"id":"b","text":"Twice the peak of the applied AC voltage","correct":true},{"id":"c","text":"Half the peak of the applied AC voltage","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'A clamping (DC restorer) circuit is used to:',
     '[{"id":"a","text":"Slice off part of a waveform above or below a reference level","correct":false},{"id":"b","text":"Shift the reference (DC) level of a waveform without significantly changing its amplitude or shape","correct":true},{"id":"c","text":"Convert a sine wave into a square wave","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'A Zener diode used as a voltage regulator is normally operated:',
     '[{"id":"a","text":"In forward bias only","correct":false},{"id":"b","text":"In its reverse breakdown region","correct":true},{"id":"c","text":"With no bias applied at all","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'In a forward-biased LED, visible (or infrared/ultraviolet) light is produced because:',
     '[{"id":"a","text":"Electrons crossing the junction fall into holes and radiate energy as light instead of heat","correct":true},{"id":"b","text":"The reverse leakage current heats the case until it glows","correct":false},{"id":"c","text":"The depletion zone acts as a small incandescent filament","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'A photodiode used for light detection is normally operated:',
     '[{"id":"a","text":"Forward biased, so that light increases the forward current","correct":false},{"id":"b","text":"Reverse biased, so that light increases the leakage (reverse) current","correct":true},{"id":"c","text":"Unbiased, relying purely on the photovoltaic effect","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'A varactor (varicap) diode is used in RF tuning circuits because:',
     '[{"id":"a","text":"Its forward voltage drop varies linearly with frequency","correct":false},{"id":"b","text":"Its capacitance changes with the applied reverse-bias voltage","correct":true},{"id":"c","text":"It emits light proportional to the applied voltage","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'A varistor is best described as a device that:',
     '[{"id":"a","text":"Is a true PN-junction diode used only for rectification","correct":false},{"id":"b","text":"Is a nonlinear resistor with high resistance at low voltage and low resistance at high voltage, used for surge protection","correct":true},{"id":"c","text":"Only conducts when illuminated by light","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'Compared with a conventional silicon PN-junction diode, a Schottky diode is characterised by:',
     '[{"id":"a","text":"A much higher forward voltage drop and much slower switching","correct":false},{"id":"b","text":"A very low forward voltage drop and very fast switching, due to having no depletion zone","correct":true},{"id":"c","text":"Operation exclusively under reverse bias for voltage regulation","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'A Silicon Controlled Rectifier (SCR) is switched OFF by:',
     '[{"id":"a","text":"Applying a negative pulse to the gate terminal","correct":false},{"id":"b","text":"Reducing the device current below its holding current","correct":true},{"id":"c","text":"Increasing the anode voltage above the breakover voltage","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'A TRIAC can be considered functionally equivalent to:',
     '[{"id":"a","text":"Two SCRs connected in inverse parallel, sharing a single gate","correct":true},{"id":"b","text":"A single Zener diode operated in forward bias","correct":false},{"id":"c","text":"A varactor diode combined with an LED","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'The main function of a DIAC in a practical triac control circuit is to:',
     '[{"id":"a","text":"Rectify the AC supply to DC before it reaches the triac","correct":false},{"id":"b","text":"Provide the triggering current pulse that switches on the triac''s gate","correct":true},{"id":"c","text":"Regulate the DC output voltage of the power supply","correct":false}]',
     '{"B1","B2"}');

END $$;
