-- Module 11A: Aeroplane Structures and Systems (B1-only) — Electrical Power: Batteries and
-- Generation
-- Source: EASA Part-66 Module 11A official textbook (IKAROS Aviation Training Centre, Turbine
-- Aeroplane, Issue IK01 - Oct 2012). Source title page: "Part 66 Module 11A for B1" — this module
-- is B1-only content, not common to B2.

DO $$
DECLARE
    m11_id INT;
    s1_id  INT;
BEGIN
    SELECT id INTO m11_id FROM easa_modules WHERE code = 'M11';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M11A.8') THEN
        RAISE NOTICE 'M11A.8 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 11A.8: Electrical Power — Batteries and Generation
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m11_id, 'M11A.8', 'Electrical Power — Batteries and Generation',
        $cnt$
# Electrical Power — Batteries and Generation

## Battery Functions and Cell Types

In almost all aircraft electrical systems a battery has three principal functions:

- To help maintain the DC system voltage under transient high load current
- To supply power for short-term heavy loads when generator, or ground power, is not available — e.g. engine starting
- To supply power for essential services, under emergency conditions

A battery is a device for converting chemical energy into electrical energy, made up of a number of **primary** or **secondary** cells.

- As a **primary cell** discharges, the chemical action destroys the cell and it cannot be re-formed (charged).
- As a **secondary cell** discharges, the chemical action converts the cell material into other forms which can be converted back into the original material — i.e. it can be charged. Secondary cells can therefore be discharged and charged repeatedly during the 'life' of a battery.

Secondary cells are used in aircraft batteries, of which there are two types:

1. **Lead-Acid (L/A)**
2. **Nickel-Cadmium (Ni/Cd)**

### Cell Voltage and Capacity

Each cell gives a nominal voltage:

- **Lead-Acid cell: 2 volts**
- **Nickel-Cadmium cell: 1.2 volts**

Each cell also has a **capacity** — a measure of the current it is capable of delivering over 1 hour, measured in **Ampere-Hours (AH)**.

- If cells are connected in **series**, the total voltage across the arrangement is the sum of each cell voltage; the capacity remains as for one cell.
- If cells are connected in **parallel**, the total voltage is as for one cell; the total capacity of the arrangement is the sum of each cell's capacity.

## Lead-Acid Batteries

The lead-acid cell consists of a positive electrode and a negative electrode, each made up of a group of lead-antimony alloy grid plates. The positive plates have lead peroxide paste (PbO₂) forced in as the active material, and the negative plates have pure spongy lead (Pb) forced into them.

There are more negative plates than positive plates in a cell. This is because positive plates may buckle under discharge, while negative plates do not; when the cell is complete, the positive plates are completely enclosed by negative plates, keeping buckling to a minimum.

The electrolyte consists of sulphuric acid (H₂SO₄) and water (H₂O), mixed so that the relative density (RD) is generally about **1.25 to 1.27 for a charged cell**.

### Chemical Action

During discharge, electrons are transferred through the external circuit from lead (negative plates) to lead peroxide (positive plates). The result of the chemical reaction is that **lead sulphate (PbSO₄) forms on both plates**, and molecules of water are formed, weakening the electrolyte. The cell is considered discharged when both plates are covered with lead sulphate and the electrolyte has become weaker.

The cell may be recharged by connecting the positive and negative plates to the positive and negative terminals of a DC source of slightly higher voltage than the cell. All the reactions are then reversed.

| Battery Type | State of Charge | Positive Plate | Negative Plate | Electrolyte |
|---|---|---|---|---|
| Lead-Acid | Charged | PbO₂ (Lead Dioxide) | Pb (Lead) | H₂SO₄, Concentrated Sulphuric Acid |
| Lead-Acid | Discharged | PbSO₄ (Lead Sulphate) | PbSO₄ (Lead Sulphate) | H₂SO₄, Weak Sulphuric Acid |

**Cell voltages:**
- Fully charged cell voltage = **2.2 volts (approx), 2.0 volts (nominal)**
- Discharged cell voltage = **1.8 volts**

**Relative Density (RD) of electrolyte:**
- Charged = **1.25 – 1.27**
- Discharged = **1.150**

*Note: the solution becomes weaker on discharge, and SG figures may vary — manufacturer's instructions should always be referred to.*

### Capacity of Batteries

The capacity of a battery (total energy available) depends on the size and number of plates. Capacity is rated in Ampere-Hours, based on the maximum current, in amps, that it will deliver for a known time period until discharged to a permissible minimum voltage per cell. The time taken to discharge is the "discharge rate," and rated capacity is the product of this rate and duration of discharge in hours — e.g. a battery discharging 5A for 5 hours is rated at 25 Ampere-Hours.

### State of Charge

When a lead-acid battery is fully charged, each cell displays three distinct indications:

1. Terminal voltage reaches its maximum value and remains steady
2. Relative density of the electrolyte ceases to rise and remains steady
3. The plates gas freely

The relative density is the sole reliable guide to the electrical condition of a cell that is neither fully charged nor completely discharged. If the RD is midway between normal maximum (1.25–1.27) and minimum (1.150), the cell is approximately half discharged.

## Lead-Acid Battery Charging and Testing (Workshop)

### Charging

The charging rate (current) is specified by the manufacturer's instructions — a typical figure is **3.5 amps**. The larger the AH rating, the higher the current required to charge a battery. The charge must be monitored at frequent intervals to adjust charging current, ensure electrolyte remains above the plates, monitor electrolyte temperature (stopping the charge if it rises above approximately **60°C**, until it drops to approximately **12°C**), and record terminal voltage and RD.

### Relative Density Temperature Correction

RD figures given by manufacturers refer to a standard temperature of **15°C (60°F)**. A correction must be made to the actual RD reading:

- For every 4°C **above** 15°C, **add 0.003** to RD
- For every 4°C **below** 15°C, **subtract 0.003** from RD
- (For 60°F, use 0.001 per 2.5°F in the same manner)

### Completion of Charge

Completion of charge is indicated by all three of the following conditions:

1. Constant terminal voltage, with charging current flowing, for **three hours**
2. Constant RD, within the manufacturer's limit (after temperature correction)
3. Cells gassing freely

The final "on charge" voltage is normally between **30 and 32.4 volts** (2.5V to 2.7V per cell), with RD approximately **1.260 at 15°C**. Following a charge, the voltage immediately falls; if it falls below **28.5 volts** the battery must be rejected for service.

### Capacity Test

A capacity test determines whether the battery can perform its function as an emergency power source. It is carried out after initial charge, at routine maintenance periods (e.g. every 3 months), or if capacity is in doubt. A fully charged battery is discharged at its rated current while the time to discharge is recorded (e.g. a 30AH battery at the one-hour rate is discharged at 30 amps).

**Fully discharged condition** is reached when either:

1. The first cell reaches **1.8 volts** (or, for block construction where individual cells can't be read, the battery voltage — e.g. a 24V battery reads 21.6V, i.e. 12 × 1.8V), OR
2. The first cell reaches the discharge level of RD

## Nickel-Cadmium Batteries

The Ni/Cd cell is one of three possible alkaline cells: Nickel-Cadmium, Nickel-Iron, and Silver-Zinc. Of these, **Nickel-Cadmium has become the preferred type for aircraft batteries**.

The case is made of plastic/nylon, allowing for slight expansion of the cell when fully charged; it insulates between cells and is impervious to electrolyte. The electrolyte is an alkaline — **Potassium Hydroxide** — which may be topped up with distilled or de-ionized water. Its relative density is normally between **1.240 and 1.300**, depending on manufacturer's instructions.

The plates are wire screens sintered with nickel powder, impregnated with active plate material:

- **Positive Plate — Nickel**
- **Negative Plate — Cadmium**

### Chemical Action

During charging, the negative plates lose oxygen and become metallic cadmium, while the positive plates are oxidised until only cadmium remains on the negative plates and nickel oxides form on the positive plates. The cell emits gas towards the end of charging and during overcharging, caused by decomposition of the water component of the electrolyte. During discharge, the reverse chemical action occurs and there is **no gassing on normal discharge**. The electrolyte does not take an active part in the chemical reaction — it only provides a path for current flow.

| Battery Type | State of Charge | Positive Plate | Negative Plate | Electrolyte |
|---|---|---|---|---|
| Nickel-Cadmium | Charged | Ni₂O₂ & Ni₂O₃ (Nickel Oxides) | Cd (Cadmium) | KOH, unaffected by state of charge |
| Nickel-Cadmium | Discharged | Ni(OH)₂ (Nickel Hydroxide) | Cd(OH)₂ (Cadmium Hydroxide) | KOH, unaffected by state of charge |

**Cell voltages:**
- Fully charged cell voltage = **1.55 volts (approx), 1.2 volts (nominal)**
- Discharged cell voltage = **1.1 volts**
- Relative Density (RD) of electrolyte: **1.24 – 1.30**

## Thermal Runaway

**Thermal runaway** (more appropriately termed overcharge runaway) is a condition of overcharge instability, occurring in the later part of the charge cycle.

In a normal charge cycle, heat generated by the charging current is dissipated within the battery and its temperature does not rise appreciably. All power sources, including batteries, have **internal resistance**. If cell temperature is allowed to rise, internal resistance and terminal voltage fall; as internal resistance falls, charging current increases, which in turn causes more heat. This chain reaction builds up rapidly and leads to destruction of the gas barrier, then the cell, and finally a fire or explosion. Thermal runaway takes place very rapidly and is a danger to aircraft.

**Causes of thermal runaway include:**

- Aircraft battery location, poor ventilation
- Higher than normal charging current
- Frequent or lengthy engine starts (electric starter)
- Loose cell connection
- Low electrolyte
- Damaged gas barrier
- Unbalanced cells

Although Ni/Cd batteries are more susceptible to thermal runaway, the process can also occur in Lead-Acid batteries.

## Nickel-Cadmium Battery Charging and Testing

### Voltmeter and Cell Shorting Links

Voltages are critical when servicing Ni/Cd batteries. Because measurements are required to two decimal places (e.g. 1.24V, 1.55V, 0.04V), a **Digital Voltmeter** must be used.

If a single cell discharges to 0.0 volts while current is still flowing, the cell will suffer reversed charge and reversed polarity, which can damage it. A preventative measure is to short the cell, when discharged or nearly discharged, with a **shorting link**. Sometimes a 1 ohm, 2 watt resistor is used to compensate for internal resistance lost in shorting out the cell.

### Constant Current Charging

Constant current charging is always used in the battery workshop. Its advantage over constant potential (voltage) charging is that **constant current charging maintains cell balance and capacity**.

The charge current is expressed in multiples of "C" amps (based on the AH rating) — e.g. for a 40AH battery: **0.1C = 4 amps, 0.5C = 20 amps**.

**Two basic methods of constant charging (24V / 20-cell battery example):**

- **Method 1**: Charge at 0.1C amps until battery voltage reaches an average of 1.5 volts per cell (20 cells = 30 volts), then continue the charge for a further four hours. Total time: **14–15 hours**.
- **Method 2**: Charge at 0.5C amps for two hours (battery should reach an average of 1.55 volts per cell, 20 cells = 31 volts; if not, charge a further half hour at this rate), then continue at 0.1C amps for a further four hours.

At completion of charge, cell voltages should be between **1.5 and 1.7 volts**.

### Capacity Test

Start with a fully charged battery, then stand for 15 to 24 hours. Discharge at 1.0C amps (e.g. 36AH = 36 amps) and record the time, stopping when battery voltage reaches an average of **1.0 volts per cell**. The **minimum acceptable capacity is 80%** of the stated (or authorized) capacity — applicable to both L/A and Ni/Cd batteries. If a battery fails to achieve 80%, it is not immediately rejected — a cell balancing procedure is carried out first, followed by a further capacity test.

*Exceptions: after discharge–charge–capacity test, White Ni/Cd cells must reach at least 85% capacity, and Blue Ni/Cd cells at least 100%.*

### Cell Balancing and Voltage Recovery

**Cell balancing** is used if a battery fails to give 80% capacity, or cells are out of balance. The battery is discharged at 1.0C amps until battery voltage falls to 20V, then discharge continues at 0.1C amps while the time for each cell to fall to 1.0V is recorded; a zero-volt cell indicates a shorted cell, a reversed cell indicates a weak cell.

**Voltage recovery check** detects high resistance connections and short circuits inside cells: after a deep discharge and standing period with shorting links on, followed by standing for 24 hours without shorting links, cell voltages should recover to above **1.08 volts** — below this indicates high internal resistance or an open circuit inside the cell.

### Storage and Readiness

Ni/Cd batteries should be stored in a clean, dry, well-ventilated room, separate from L/A batteries. For readiness, they are stored in a charged condition; since Ni/Cd batteries self-discharge if left standing, a trickle charge (approximately **1 mA per AH**) is required. For long-term storage, batteries are deep discharged and stored with main terminals shorted.

During emergency use (e.g. main power failure), batteries must be able to sustain essential services for at least **30 minutes**.

## Typical Aircraft Battery System

In a typical battery system, batteries connected in parallel are directly connected to a **battery busbar**, which, in an emergency, supplies power for a limited period to essential services (radio, fire warning systems, navigation systems, etc.). Direct connections ensure battery power is always available to the busbar.

The batteries are also connected to the main DC busbar via a **battery relay**, power selector switch, and a **reverse current circuit breaker**, so they are kept charged by the aircraft's generators. Under emergency conditions (e.g. generator/busbar failure), the batteries must be isolated from the main busbar, since their total capacity is insufficient to keep all aircraft services running; the power selector switch is set to "OFF," de-energising the battery relay. If battery current attempts to flow up to the main DC busbar (e.g. following a main busbar failure), the reverse current coil reverses polarity, opening the reverse current circuit breaker and isolating the battery.

### Parallel/Series Battery Switching

On some turboprop aircraft, batteries can be switched from a parallel configuration (normal operation) to a series configuration for engine starting from battery power. For example, two 24-volt Ni/Cd batteries in parallel can be switched, via a battery switching relay energised during starter operation, into series, supplying **48V** to the busbar and starter motor for the start. After the engine reaches self-sustaining speed, the starter relay de-energises and the batteries return automatically to their normal parallel configuration.

## DC Power Generation and Voltage Regulation

Although most modern aircraft use AC generation systems, DC generation systems remain in use. The efficient operation of DC electrical equipment depends on the generator voltage at the distribution busbar being maintained constant under all conditions of load and varying speed, within a prescribed range. Of the factors affecting a DC generator's output voltage, the one that can be most effectively controlled is the **Field Circuit current**, which in turn controls flux density.

### Vibrating Contact Type Regulator

This regulator has two armatures — one for current regulation, one for voltage regulation. When the generator is operating, the contacts of both regulators are closed, supplying excitation current to the generator field winding. As the output voltage reaches the pre-adjusted regulator setting, the electromagnetic field of the voltage regulator becomes strong enough to open the contacts, inserting a resistor into the field circuit and reducing generator output. As output falls, the contacts close again to restore the regulated voltage — the cycle repeats, with the operating frequency dependent on electrical load, typically **between 50 and 200 times a second**.

### Carbon Pile Voltage Regulator

The regulating element is a stack (pile) of carbon disks in a ceramic tube, compressed by leaf springs. While compressed, the pile's resistance is very low; if pressure on the pile is reduced, resistance increases. An electromagnet releases the spring pressure on the disks as voltage rises above a predetermined value, giving a stable, efficient voltage regulator. The carbon pile is connected in series with the generator field; the voltage coil is shunted across the generator output. A small manually operated rheostat, in series with the voltage coil, provides adjustment — necessary where two or more generators are connected in parallel.

### Transistorised Voltage Regulation

Used on larger aircraft (vibrating contact and carbon pile types are mainly used on light aircraft). These regulators use a **Zener diode** to regulate field current. When the zener diode conducts, it switches the control transistor "ON," which switches the power transistor "OFF," cutting current flow to the generator field winding; as generator output falls, the zener diode closes, switching the control transistor "OFF" and the power transistor back "ON," restoring field current. As with the vibrating contact regulator, this cycle repeats typically **between 50 and 200 times a second**.

## Reverse Current Cutout Relay and Current Limiter

### Reverse Current Cutout Relay

Where a generator charges a battery as well as supplying operating power, an automatic means must disconnect the generator from the battery whenever generator voltage is lower than battery voltage — otherwise the battery would discharge through the generator and could burn out the armature. This is prevented by a **Reverse Current Cutout Relay**.

The relay has a voltage coil (many turns of fine wire, connected in parallel with the generator output) and a current coil (few turns of heavy wire, connected in series with the generator, carrying its full load current), both on a common soft-iron core. When generator voltage exceeds battery voltage, the voltage coil magnetises the core enough to close the contacts, connecting the generator to the load; current flow through the current coil then aids the voltage coil's field, keeping the contacts closed. When generator voltage falls below battery voltage, current flows from the battery back toward the generator through the current coil, creating an opposing field that weakens the relay's total field, allowing the spring to open the contacts and disconnect the generator. The contact points are typically set to close at approximately **13.5V in a 12V system**, or **26.6–27V in a 24V system**.

### Current Limiter

Some generator systems include a **Current Limiter**, which reduces generator voltage whenever the maximum safe load is exceeded, protecting the generator from overheating. It operates similarly to the vibrating contact regulator, but with a current coil (instead of a voltage coil) connected in series with the generator load circuit. When load current becomes excessive, the current coil opens the contact points, inserting a resistor into the generator field circuit and reducing generator voltage and current; as current falls, the coil's magnetism weakens, the contacts close, and voltage rises again. Under sustained excessive load, the contacts continue to vibrate, holding output at or below the safe limit. **The contact points are normally set to open when current flow is 10% above the generator's rated capacity.**

## Three-Unit Generator Control Panel

A **three-unit control panel** consists of:

1. **Voltage Regulator**
2. **Current Limiter**
3. **Reverse Current Cutout Relay**

This combination provides both voltage regulation and protection from excessive loads, and has proved very successful for controlling 12- and 24-volt generator systems.

## Parallel Operation and Load Sharing

In a multi-engine aircraft, it is generally desirable that generators driven by each engine operate in parallel, so that in the event of an engine or generator failure there is no interruption of the primary power supply. Parallel operation requires generators to carry equal shares of the system load, so their output voltages must be as near equal as possible under all conditions. Since variations in output and load can still occur, additional regulation circuits are needed to maintain balanced outputs and load sharing.

A common method uses a **Load-Equalising circuit** to control generator output via the voltage regulators. When load currents from paralleled generators are equal, the voltage drops across each generator's interpole are equal, and no current flows in the equalising coils. When there is a current imbalance, the generator supplying the larger current develops a larger voltage drop across its interpole, causing equalising current to flow from the lightly loaded generator toward the overloaded one; this causes the regulator of the lightly loaded generator to increase its output, while the regulator of the overloaded generator reduces its output, restoring balance.

Paralleling/load sharing can similarly be achieved using vibrating contact voltage regulators with an additional equalising coil ("Eq") in each regulator's voltage regulation section and a paralleling relay unit, or, in solid-state regulation systems, via two additional paralleling transistors interconnecting the regulators.

## AC Power Generation — Brushless Generators

AC generators are used as the primary source of electric power in almost all transport category aircraft. **Brushless generators** were developed to eliminate the problems of generators that use slip-rings and brushes to carry exciter current to the rotating field. Advantages of brushless generators:

1. **Lower maintenance cost**, since there is no brush or slip-ring wear
2. **High stability and consistency of output**, because variations of resistance and conductivity at brushes/slip-rings are eliminated
3. **Better performance at high altitudes**, because arcing at the brushes is eliminated

A brushless generator uses electromagnetic induction to transfer current from stationary to rotating components, and a three-phase star-connected armature. A permanent magnet (connected to the rotor) induces AC into a stationary PMG three-phase armature winding; the Generator Control Unit (GCU) rectifies this to DC and applies it to the exciter field winding; the exciter field induces AC into the exciter armature, which is connected to a rotating rectifier that converts it to DC for the main generator field winding; the main field then induces AC voltage into the main generator stator windings. The stator fields are induced with **115V phase voltage**, giving **200V between two phases**.

## Constant Speed Drive (CSD) Unit

Numerous AC consumer services depend on a **constant frequency**, which is inherent only if the generator is driven at constant speed. Since aircraft engine speed varies, a transmission device with a variable-ratio drive — the **Constant-Speed Drive (CSD) unit** — is interposed between the engine and generator.

The CSD comprises a fixed displacement unit and a variable displacement unit (each a hydraulic unit with reciprocating pistons and a wobble/swash plate), a differential gear unit, and a governor. The variable displacement unit is driven directly by the input gear; its wobble plate angle (set by a control cylinder, itself controlled by the governor) determines how much charge oil is pumped to the fixed displacement unit, which then functions as a hydraulic motor. The differential gear unit's output ring gear "housing" serves as the continuous drive link between engine and generator.

- **Underdrive phase**: when input speed exceeds that needed for the required output speed, the governor causes oil to flow away from the control cylinder; the resulting hydromechanical process subtracts speed until the required generator drive speed is attained.
- **Overdrive phase**: when input speed is lower than required, the governor supplies charge oil to the control cylinder; the resulting process adds speed until the required generator drive speed is attained.

**CSD disconnection**: the drive from the engine is transmitted to the CSD via a dog-tooth clutch. Disconnection is initiated by a solenoid, controlled from the flight deck, which moves a spring-loaded pawl into the threads of the input shaft, separating the clutch dogs. Resetting the disconnect mechanism can only be done on the ground, after shutting down the appropriate engine.

## Integrated Drive Generator (IDG)

The **IDG** is a state-of-the-art means of producing AC electrical power, containing both the generator and the CSD unit in one unit — reducing both weight and size compared with the traditional two-unit system. Its CSD section contains a hydraulic trim unit and differential assembly, converting variable engine RPM to a generator input speed of **12,000 RPM**.

A typical IDG (as used on the Boeing 757) is capable of producing:

- **90 kVA continuously**
- **112.5 kVA for a 5-minute overload**
- **150 kVA for a 5-second overload**

Output voltage is **115V AC at 400 Hz**.

## AC Generator Voltage Regulation

Field excitation for any generator requires a magnetic field to excite the windings; for AC generators, the arrangement varies with type, but all share the common feature of supplying DC to the field windings to maintain the desired AC output.

Regulation of a constant-frequency generator system is based on controlling field excitation. In a brushless generator's regulation circuit, three main sections are involved:

1. **Error Detection**
2. **Pre-Amplification**
3. **Power Amplification**

The error detector monitors generator output voltage, compares it with a fixed reference voltage (established by gas-filled regulator tubes that maintain an essentially constant voltage drop), and passes any error to the pre-amplifier and then the power amplifier (both three-phase magnetic amplifiers); the power amplifier output feeds the shunt windings of the generator's AC exciter stator. When line voltage rises above or falls below the fixed nominal value, the resulting bridge imbalance produces an error signal: for a positive error (voltage above nominal) the exciter current is decreased, and for a negative error (voltage below nominal) it is increased.

## Variable-Speed Constant-Frequency (VSCF) Systems

To simplify AC power production and move away from hydro-mechanical constant-speed drives, systems have been developed to produce 400 Hz three-phase power through electronic circuitry — referred to variously as **VSCF, VASCOF, CFG (constant-frequency generator), or ECEPS (electronic converter, electric power supply)**. A brushless generator, driven directly by the engine, produces variable-speed, variable-frequency power; this is rectified to DC and filtered, then chopped by conversion circuitry into square-wave outputs that are separated and summed to produce three-phase 400 Hz AC. Such systems can be built with separate components, or as an integrated unit with the generator and static inverter mounted on the engine while the GCU (containing the voltage regulator) is mounted in the aircraft.

## Frequency-Wild Systems

A **frequency-wild system** is one in which generator output frequency is permitted to vary with generator speed. While unsuitable for direct operation of most AC consumer equipment, such output (after constant voltage regulation) can be applied directly to resistive loads such as **electrical de-icing systems**, or transformed and rectified to DC for feeding a static inverter to produce frequency-controlled AC.

A typical frequency-wild generator, used to supply heating current to a turbo-propeller engine de-icing system, has a three-phase output of **22 kVA at 208 volts**, supplying full load at this voltage through a frequency range of **280 to 400 Hz** (below 280 Hz, field current is limited and output is reduced). It consists of a fixed stator assembly (star-connected winding) and a rotating rotor assembly with six salient poles, series-connected field windings terminating at two slip rings. Excitation is provided initially by DC from the aircraft's main busbar; once the generator becomes self-excited (rectified AC through the rotor winding sufficient at a pre-determined "off-load" value), it becomes independent of the main busbar supply. A compounding transformer and rectifier supplement the voltage regulator, ensuring excitation current is proportional to load current.

## Three-Phase Generators — Star and Delta Connections

The output terminals of a three-phase generator are marked to show phase sequence and connected to correspondingly identified busbars. Bringing each phase out to separate terminals for separate consumer groups is rarely used in practice, since it would require uneconomic use of cable; instead, phases are interconnected using one of two methods:

1. **Star connection**
2. **Delta connection**

### Star Connection

The **Star connection** is commonly used in generators. One end of each phase winding is connected to a common **"Neutral"** point, while the opposite ends are connected to three separate lines; two phase windings are connected between each pair of lines. In a worked example given in the source, phase voltage is **115V** and line voltage is **200V** — i.e. line voltage is greater than phase voltage.

### Delta Connection

In the **Delta connection**, the windings are connected in series to form a closed "mesh," with the lines connected at the junction points. Since only one phase winding is connected between each pair of lines, **phase voltage is always equal to line voltage** in a delta connection. In a worked example given in the source, phase current is **100A** and line current is **173A** — i.e. line current is greater than phase current.
        $cnt$,
        8
    ) RETURNING id INTO s1_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M11A.8 Electrical Power — Batteries and Generation (20 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s1_id, 'Which of the following is NOT listed as a principal function of an aircraft battery?',
     '[{"id":"a","text":"To help maintain the DC system voltage under transient high load current","correct":false},{"id":"b","text":"To supply power for essential services under emergency conditions","correct":false},{"id":"c","text":"To act as the sole permanent power source for all aircraft systems in normal flight","correct":true}]',
     '{"B1"}'),

    (s1_id, 'What is the key difference between a primary cell and a secondary cell?',
     '[{"id":"a","text":"A secondary cell can be recharged after discharge, whereas a primary cell cannot be re-formed","correct":true},{"id":"b","text":"A primary cell produces AC, while a secondary cell produces DC","correct":false},{"id":"c","text":"A secondary cell has no chemical electrolyte","correct":false}]',
     '{"B1"}'),

    (s1_id, 'The two types of secondary cell used in aircraft batteries are:',
     '[{"id":"a","text":"Lead-Acid and Nickel-Cadmium","correct":true},{"id":"b","text":"Silver-Zinc and Lithium-Ion","correct":false},{"id":"c","text":"Nickel-Iron and Alkaline-Manganese","correct":false}]',
     '{"B1"}'),

    (s1_id, 'What are the approximate nominal cell voltages of a Lead-Acid cell and a Nickel-Cadmium cell respectively?',
     '[{"id":"a","text":"2 volts and 1.2 volts","correct":true},{"id":"b","text":"1.2 volts and 2 volts","correct":false},{"id":"c","text":"12 volts and 24 volts","correct":false}]',
     '{"B1"}'),

    (s1_id, 'In a lead-acid cell, there are more negative plates than positive plates because:',
     '[{"id":"a","text":"Positive plates may buckle under discharge, so they are enclosed by negative plates to minimise buckling","correct":true},{"id":"b","text":"Negative plates are cheaper to manufacture","correct":false},{"id":"c","text":"Negative plates carry no current and are purely structural","correct":false}]',
     '{"B1"}'),

    (s1_id, 'For a lead-acid cell electrolyte, the approximate relative density (RD) values are:',
     '[{"id":"a","text":"1.25–1.27 when charged, 1.150 when discharged","correct":true},{"id":"b","text":"1.150 when charged, 1.25–1.27 when discharged","correct":false},{"id":"c","text":"2.0 when charged, 1.0 when discharged","correct":false}]',
     '{"B1"}'),

    (s1_id, 'When correcting a lead-acid electrolyte RD reading to the standard temperature of 15°C, the rule is:',
     '[{"id":"a","text":"Add 0.003 to RD for every 4°C above 15°C, subtract 0.003 for every 4°C below 15°C","correct":true},{"id":"b","text":"Add 0.03 to RD for every 1°C above 15°C","correct":false},{"id":"c","text":"No correction is ever required for RD readings","correct":false}]',
     '{"B1"}'),

    (s1_id, 'In a Nickel-Cadmium cell, the positive plate, negative plate and electrolyte are respectively:',
     '[{"id":"a","text":"Nickel, Cadmium, and Potassium Hydroxide (KOH)","correct":true},{"id":"b","text":"Cadmium, Nickel, and Sulphuric Acid","correct":false},{"id":"c","text":"Lead Peroxide, Lead, and Potassium Hydroxide","correct":false}]',
     '{"B1"}'),

    (s1_id, 'Which statement about a Ni/Cd cell''s chemical action is correct?',
     '[{"id":"a","text":"There is normally no gassing on a normal discharge, but the cell gasses towards the end of charge and during overcharge","correct":true},{"id":"b","text":"The electrolyte is actively consumed in the chemical reaction, similar to a lead-acid cell","correct":false},{"id":"c","text":"Gassing only occurs during discharge, never during charging","correct":false}]',
     '{"B1"}'),

    (s1_id, 'Thermal runaway in a Ni/Cd battery is best described as:',
     '[{"id":"a","text":"A stable equilibrium reached automatically at full charge","correct":false},{"id":"b","text":"A rapid chain reaction in which falling internal resistance increases charging current, generating more heat, which further reduces internal resistance","correct":true},{"id":"c","text":"A condition that can only occur if the battery is fully discharged","correct":false}]',
     '{"B1"}'),

    (s1_id, 'Why are cell shorting links used on a Ni/Cd cell during workshop discharge procedures?',
     '[{"id":"a","text":"To increase the cell''s discharge rate for faster testing","correct":false},{"id":"b","text":"To prevent a fully discharged cell from suffering reversed charge and reversed polarity if current continues to flow","correct":true},{"id":"c","text":"To permanently disable a faulty cell","correct":false}]',
     '{"B1"}'),

    (s1_id, 'What is the main advantage of constant current charging over constant potential (voltage) charging for Ni/Cd batteries in the workshop?',
     '[{"id":"a","text":"Constant current charging maintains cell balance and capacity","correct":true},{"id":"b","text":"Constant current charging is always faster","correct":false},{"id":"c","text":"Constant current charging eliminates the need for a fully charged initial state","correct":false}]',
     '{"B1"}'),

    (s1_id, 'According to the source, what is the minimum acceptable battery capacity, as a percentage of stated/authorized capacity, for an aircraft battery to remain in service?',
     '[{"id":"a","text":"50%","correct":false},{"id":"b","text":"80%","correct":true},{"id":"c","text":"95%","correct":false}]',
     '{"B1"}'),

    (s1_id, 'For a DC generator, which factor is described as the one that can be most effectively controlled to regulate output voltage?',
     '[{"id":"a","text":"The Field Circuit current, which controls flux density","correct":true},{"id":"b","text":"The armature winding resistance","correct":false},{"id":"c","text":"The battery temperature","correct":false}]',
     '{"B1"}'),

    (s1_id, 'What is the purpose of a Reverse Current Cutout Relay in a DC generator system?',
     '[{"id":"a","text":"To automatically disconnect the generator from the battery when generator voltage falls below battery voltage, preventing the battery discharging through the generator","correct":true},{"id":"b","text":"To limit the maximum current the generator can supply to the busbar","correct":false},{"id":"c","text":"To reverse the polarity of the generator output during engine start","correct":false}]',
     '{"B1"}'),

    (s1_id, 'A DC generator current limiter''s contact points are normally set to open when current flow reaches:',
     '[{"id":"a","text":"10% above the generator''s rated capacity","correct":true},{"id":"b","text":"50% above the generator''s rated capacity","correct":false},{"id":"c","text":"Exactly the generator''s rated capacity, with no margin","correct":false}]',
     '{"B1"}'),

    (s1_id, 'A three-unit generator control panel consists of which three components?',
     '[{"id":"a","text":"Voltage Regulator, Current Limiter, and Reverse Current Cutout Relay","correct":true},{"id":"b","text":"Voltage Regulator, Battery Charger, and Current Transformer","correct":false},{"id":"c","text":"Current Limiter, Frequency Regulator, and Load Equaliser","correct":false}]',
     '{"B1"}'),

    (s1_id, 'Which of the following is listed as an advantage of a brushless AC generator over a generator using slip-rings and brushes?',
     '[{"id":"a","text":"Better performance at high altitude because arcing at the brushes is eliminated","correct":true},{"id":"b","text":"It requires no field excitation of any kind","correct":false},{"id":"c","text":"It can operate without any form of voltage regulation","correct":false}]',
     '{"B1"}'),

    (s1_id, 'What is the purpose of a Constant Speed Drive (CSD) unit interposed between an aircraft engine and its AC generator?',
     '[{"id":"a","text":"To convert the engine''s varying speed into a constant generator drive speed, since a constant frequency AC output requires constant generator speed","correct":true},{"id":"b","text":"To increase engine power output during takeoff","correct":false},{"id":"c","text":"To convert AC generator output into DC for battery charging","correct":false}]',
     '{"B1"}'),

    (s1_id, 'An Integrated Drive Generator (IDG), as described for the Boeing 757, is rated to produce which continuous output?',
     '[{"id":"a","text":"90 kVA continuously, at 115V AC 400 Hz","correct":true},{"id":"b","text":"9 kVA continuously, at 28V DC","correct":false},{"id":"c","text":"900 kVA continuously, at 230V AC 50 Hz","correct":false}]',
     '{"B1"}'),

    (s1_id, 'In the Star connection worked example given in the source, phase voltage is 115V and line voltage is 200V. In the Delta connection, by contrast:',
     '[{"id":"a","text":"Phase voltage is always equal to line voltage, since only one phase winding is connected between each pair of lines","correct":true},{"id":"b","text":"Phase voltage is always double the line voltage","correct":false},{"id":"c","text":"There is no distinction between phase and line voltage in either connection","correct":false}]',
     '{"B1"}');

END $$;
