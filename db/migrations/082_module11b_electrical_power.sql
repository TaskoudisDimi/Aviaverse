-- Module 11B: Piston Aeroplane Structures and Systems (B1) — Electrical Power: Batteries, Generation and Distribution
-- Source: EASA Part-66 Module 11B official textbook (IKAROS Aviation Training Centre, IK01, Issue Oct.2012)

DO $$
DECLARE
    m11_id INT;
    s7_id  INT;
    s8_id  INT;
BEGIN
    SELECT id INTO m11_id FROM easa_modules WHERE code = 'M11';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M11B.7') THEN
        RAISE NOTICE 'M11B.7/M11B.8 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module M11B.7: Electrical Power — Batteries
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m11_id, 'M11B.7', 'Electrical Power — Batteries',
        $cnt$
# Electrical Power — Batteries

## Functions of a Battery

In almost all aircraft electrical systems, a battery has the following principal functions:

- To help maintain the DC system voltage under transient high load current
- To supply power for short-term heavy loads when the generator, or ground power, is not available (e.g. engine starting)
- To supply power for essential services under emergency conditions

## Primary and Secondary Cells

A battery is a device for converting chemical energy into electrical energy, made up of a number of primary or secondary cells.

- **Primary cell** — as it discharges, the chemical action destroys the cell and it cannot be re-formed (charged)
- **Secondary cell** — as it discharges, the chemical action converts the cell material into other forms which can be converted back into the original material (charged). Secondary cells can therefore be discharged and charged repeatedly during the "life" of a battery

Secondary cells are used in aircraft batteries, of which there are two types:

1. **Lead-Acid (L/A)**
2. **Nickel-Cadmium (Ni/Cd)**

## Cell Voltage and Capacity

Each cell gives a nominal voltage:

- The nominal voltage of an L/A cell is **2 volts**
- The nominal voltage of a Ni/Cd cell is **1.2 volts**

Each cell also has a **capacity** — a measure of the current it is capable of delivering over 1 hour. The unit is the **Ampere-Hour (AH)**.

## Cell Connections — Series and Parallel

- **Series connection** — the total voltage across the arrangement is the sum of each cell voltage; the capacity is as for one cell
- **Parallel connection** — the total voltage is as for one cell; the total capacity of the arrangement is the sum of each cell's capacity

## Lead-Acid Cell Construction

The cell consists of a positive electrode and a negative electrode, each made up of a group of lead-antimony alloy grid plates:

- The **positive plates** have lead peroxide paste (PbO2) forced in as the active material
- The **negative plates** have pure spongy lead (Pb) forced into them

There are more negative plates than positive plates. Positive plates may buckle under discharge; negative plates do not buckle, so when the cell is complete the positive plates are completely enclosed by negative plates, keeping buckling to a minimum.

The electrolyte consists of sulphuric acid (H2SO4) and water (H2O), mixed so that the **relative density (RD)** is generally about **1.25 to 1.27** for a charged cell.

## Lead-Acid Chemical Action

During discharge, when an external circuit is completed between the positive and negative plates, electrons transfer through the circuit from lead (negative plates) to lead peroxide (positive plates). The net result is that **lead sulphate (PbSO4)** forms on both plates, and molecules of water form, weakening the electrolyte. The cell is discharged when both plates are covered with lead sulphate and the electrolyte has become weaker.

The cell may be recharged by connecting the positive and negative plates to the positive and negative terminals of a DC source of slightly higher voltage than the cell. All the reactions are then reversed: lead sulphate on the positive plate is restored to lead peroxide, the negative plate is restored to lead, and the electrolyte is restored to its original relative density.

## Lead-Acid Battery Voltage — Worked Example

A typical lead-acid battery is made up of two blocks, each containing six cells of 2 volts per cell, connected in series. Each block therefore delivers 6 × 2 volts = **12 volts**. With two 12-volt blocks in series, **Battery Voltage = 24V**.

## Lead-Acid Cell Characteristics

| State of Charge | Positive Plate | Negative Plate | Electrolyte |
|---|---|---|---|
| Charged | PbO2 (Lead Dioxide) | Pb (Lead) | H2SO4, concentrated sulphuric acid |
| Discharged | PbSO4 (Lead Sulphate) | PbSO4 (Lead Sulphate) | H2SO4, weak sulphuric acid |

- Fully charged cell voltage = **2.2 volts (approx.)**, **2.0 volts (nominal)**
- Discharged cell voltage = **1.8 volts**
- Relative Density (RD): Charged = **1.25 – 1.27**; Discharged = **1.150**

*Note: SG figures may vary — manufacturer's instructions should always be referred to.*

## Capacity of Batteries

The capacity of a battery — the total amount of energy available — depends upon the size and number of plates. Capacity is measured in **Ampere-Hours**, based on the maximum current a battery will deliver for a known time period until discharged to a permissible minimum voltage per cell.

The time taken to discharge is called the **"Discharge rate"**, and the rated capacity of the battery is the product of this rate and the duration of discharge (in hours). Thus a battery which discharges **5A for 5 hours is rated at 25 Amperes-Hours** capacity.

## State of Charge — Lead-Acid

When a lead-acid battery is fully charged, each cell displays three distinct indications:

1. Terminal voltage reaches its maximum value and remains steady
2. Relative density of the electrolyte ceases to rise and remains steady
3. The plates gas freely

The **relative density** is the sole reliable guide to the electrical condition of a cell that is neither fully charged nor completely discharged — a **hydrometer** is used to check it. If the RD is midway between normal maximum (1.25–1.27) and minimum (1.150), the cell is approximately half discharged.

## Battery Charging (Workshop) — Preparation for Charge

1. Unscrew the vent plugs but leave them in the vent holes, to allow the cell to gas freely during charge
2. Adjust the electrolyte level, if required, to the level specified in the manufacturer's instructions by adding distilled water — plates must always be covered, do not over-fill; record the amount of distilled water added
3. Connect to the charging board

## Charging the Battery

The charging rate (current) is the value specified in the manufacturer's instructions — a typical figure is **3.5 amps**. The larger the ampere-hour rating, the higher the current required to charge a battery.

The charge must be monitored at frequent intervals to:

1. Adjust the charging current, as cell voltage will increase during the charge
2. Ensure electrolyte remains above the plates and cells are gassing — if a battery is always requiring distilled water, it must be rejected
3. Monitor electrolyte temperature; stop the charge if the value rises above that specified by the manufacturer (approximately **60°C**) until the temperature has dropped sufficiently
4. Record terminal voltage to determine when the battery is fully charged
5. Record the RD — this indicates when the battery is fully charged, but the reading must be corrected relative to a temperature of 15°C

## Relative Density Temperature Correction

Manufacturer's RD figures are given at a **standard temperature of 15°C (60°F)**. Correction figures:

- For every 4°C **above** 15°C, **add 0.003** to the RD reading
- For every 4°C **below** 15°C, **subtract 0.003** from the RD reading

(For 60°F, use 0.001 per 2.5°F in the same manner.) Without this correction, the true state of charge of the cell cannot be known. Any RD reading taken immediately after adding distilled water will also be incorrect, since the electrolyte is only mixed by gassing while still on charge.

## Completion of Lead-Acid Charge

Completion of charge is indicated by:

1. Constant terminal voltage, with charging current flowing, for **three hours**
2. Constant RD, within the manufacturer's limit (after temperature correction)
3. Cells gassing freely

The final "on charge" voltage is normally between **30 and 32.4 volts** (2.5V to 2.7V per cell); the RD is approximately **1.260 at 15°C**.

Following a charge, the voltage immediately falls. **If it falls below 28.5 volts, the battery must be rejected for service.**

## Capacity Test (Lead-Acid)

Reasons for a capacity test:

1. After initial charge
2. Routine maintenance at specified periods, e.g. every 3 months
3. If the capacity of the battery is in doubt

To measure capacity, a fully charged battery is discharged at the battery rating while the time to discharge is recorded — e.g. a **30AH battery at the one-hour rate is discharged at 30 amps**.

## Fully Discharged Condition

There are two conditions to check:

1. First cell to reach **1.8 volts**, or — if cell voltage cannot be read (block construction) — read battery voltage; a **24V battery reads 21.6V (12 × 1.8)**
2. First cell to reach discharge level of RD

## Nickel-Cadmium (Ni/Cd) Cell

The Ni/Cd cell is one of three possible alkaline cells: Nickel-Cadmium, Nickel-Iron, and Silver-Zinc. Of the three, **Ni/Cd has become the preferred cell for aircraft batteries**.

The case is made of a plastic/nylon material, allowing for slight expansion of the cell when fully charged; it insulates between cells and is impervious to electrolyte.

The electrolyte is an alkaline — **Potassium Hydroxide** — which may be topped up with distilled or de-ionised water. Its relative density is normally between **1.240 and 1.300**.

The plates are wire screens sintered with nickel powder, impregnated with active plate material:

- **Positive plate** — Nickel
- **Negative plate** — Cadmium

### Chemical Action

During charging, the negative plates lose oxygen and become metallic cadmium; the positive plates are brought to a higher state of oxidation. The cell emits gas towards the end of charging and during overcharging (decomposition of water into hydrogen at the negative plates and oxygen at the positive plates). The reverse reaction occurs on discharge, and there is no gassing on a normal discharge. The electrolyte does not take an active part in the chemical reaction — it only provides a path for current flow.

## Ni/Cd Cell Characteristics

| State of Charge | Positive Plate | Negative Plate | Electrolyte |
|---|---|---|---|
| Charged | Ni2O2 & Ni2O3 (Nickel Oxides) | Cd (Cadmium) | KOH — unaffected by state of charge |
| Discharged | Ni(OH)2 (Nickel Hydroxide) | Cd(OH)2 (Cadmium Hydroxide) | KOH — unaffected by state of charge |

- Fully charged cell voltage = **1.55 volts (approx.)**, **1.2 volts (nominal)**
- Discharged cell voltage = **1.1 volts**
- Relative Density (RD): **1.24 – 1.30**

A Ni/Cd battery construction includes a **thermostat** to give warning of thermal runaway.

## Thermal Runaway

Thermal runaway (more appropriately termed overcharge runaway) is a condition of overcharge instability occurring in the later part of the charge cycle. In a normal charge cycle, heat generated by the charging current is dissipated and battery temperature does not rise appreciably.

All power sources, including batteries, have **internal resistance**. If cell temperature is allowed to rise, the internal resistance and terminal voltage fall; a falling internal resistance causes charging current to increase, which causes more heat. This chain reaction builds up rapidly and leads to destruction of the gas barrier, then the cell, and finally a fire or even an explosion. Thermal runaway takes place very rapidly and is a danger to aircraft.

### Causes of Thermal Runaway

- Aircraft battery location / poor ventilation
- Higher than normal charging current
- Frequent or lengthy engine starts
- Loose cell connection
- Low electrolyte
- Damaged gas barrier
- Unbalanced cells

Ni/Cd batteries are more susceptible to thermal runaway, but the process can also occur in lead-acid batteries.

## Ni/Cd Battery Charging — Cell Caps

All batteries give off gas during charging.

- Lead-acid battery cell caps are **open** and can vent at all times
- Ni/Cd cell caps are **semi-open**, fitted with a non-return valve to allow gas to vent but not allow air to enter (carbon dioxide in the atmosphere contaminates the electrolyte and reduces its RD)

Semi-open caps are susceptible to being blocked by potassium crystals, so they are removed during charge and may be cleaned with warm water then rinsed in de-mineralised or distilled water.

## Voltmeter Accuracy

Voltages are critical in servicing Ni/Cd batteries. Measurements are required to two decimal places (e.g. 1.24V, 1.55V, 0.04V), so a **Digital Voltmeter** must be used.

## Cell Shorting Links

If a single cell discharges to 0.0 volts while current is still flowing, the cell will have a reversed charge and reversed polarity, which can damage it. A preventative measure is to short the cell, when discharged or nearly discharged, with a **shorting link**. Sometimes a **1 ohm, 2 watt resistor** is used to compensate for the internal resistance lost in shorting out the cell.

## Charging Rate — the "C" Notation

Constant current charging is always used in the battery workshop; its advantage over constant potential (voltage) charging is that it maintains cell balance and capacity. The charge current is expressed in multiples of "C" amps. For a battery rated at **24V, 40AH at the 1-hour rate**:

- **0.1C = 4 amps**
- **0.5C = 20 amps**

## Methods of Constant Current Charging

**Method 1:** Charge at 0.1C amps until battery voltage reaches an average of **1.5 volts per cell** (20 cells = 30 volts), then continue the charge for a further four hours. Total charge time should be between **fourteen and fifteen hours**.

**Method 2:** Charge at 0.5C amps for **two hours** — battery voltage should reach an average of **1.55 volts per cell** (20 cells = 31 volts). If not up to 31 volts, charge for a further half-hour at this rate. Continue the charge at 0.1C amps for a further **four hours**.

At completion of charge, the cells' voltages should be between **1.5 and 1.7 volts**.

## Ni/Cd Battery Testing — Capacity Test

Start the capacity test with a fully charged battery, then stand for **fifteen to twenty-four hours**. Discharge at 1.0C amps (e.g. 36 amps for a 36AH battery) and record the time; stop when battery voltage reaches an average of 1.0 volts per cell.

The **minimum acceptable capacity is 80%** of the stated (or authorised) capacity. If a battery fails to achieve 80%, it is not immediately rejected — a cell balancing procedure is carried out, followed by a further capacity test.

## Capacity Recycling and Cell Balancing

**Capacity recycling** helps prevent premature damage and failure by discharging then charging the battery — cells are shorted as they approach zero volts, the battery stands for sixteen to twenty-four hours, then is charged for twenty-four hours at the recommended recycling rate.

**Cell balancing** is similar to capacity recycling but uses a normal charge, not the long twenty-four-hour charge. It is used if the battery fails to give 80% capacity, or cells are out of balance.

Certain cell types do not need to meet the 80% rule after a discharge–charge–capacity test:

- **White Ni/Cd cell — minimum 85%**
- **Blue Ni/Cd cell — minimum 100%**

## Voltage Recovery Check

Used to detect high-resistance connections and short circuits inside cells: after a deep discharge (standing with shorting links on, then removed and standing a further twenty-four hours), cell voltages should have recovered to **above 1.08 volts**. Below this indicates high internal resistance or an open circuit inside the cell.

## Storage and Readiness for Service

Ni/Cd batteries should be stored in a clean, dry, well-ventilated room, **separate from lead-acid batteries**. For readiness, they should be stored in a charged condition; since Ni/Cd batteries self-discharge if left standing, a **trickle charge of approximately 1 mA per AH** is required. For long-term storage, batteries should be deep discharged and stored with the main terminals shorted.

## Facts and Figures

- Batteries (L/A or Ni/Cd) proved to have less than **80% capacity** should be rejected for aircraft use
- During emergency use (e.g. main power failure), batteries must be able to sustain essential services for **at least 30 minutes**

## Aircraft Charging Systems — Constant Current / Constant Voltage Mode

Aircraft battery chargers generally charge in a **constant current mode** or **constant voltage mode**.

- **Constant current mode** — supplies a constant current (e.g. 38 amps, depending on battery capacity). As the battery charges, terminal voltage rises to a predetermined value (approximately **31 to 32 volts**, giving 1.55V per cell), at which point constant current mode switches off and constant voltage mode switches on
- **Constant voltage mode** — the charger holds a constant voltage (TR mode, as in TRU) at **27.5V or 28V**. Since battery terminal voltage is higher than charger voltage, no charging current flows

## Typical Aircraft Battery System

A typical arrangement has four batteries, in parallel, directly connected to a **battery bus bar**, which supplies power for a limited period to essential services (radio, fire warning, navigation) in an emergency. The power selector switch is normally set to the "Battery" position (termed "Flight" on modern aircraft), energising the battery relay to connect the batteries to the main DC bus bar via a reverse current circuit breaker, so the generators can also supply charging current.

Under emergency conditions (e.g. generator/bus bar failure), the power selector switch is put to "OFF", de-energising the battery relay and isolating the batteries so they can supply essential services for a pre-calculated period.

## Parallel/Series Battery Switching

On certain turboprop aircraft, two 24-volt Ni/Cd batteries can be switched from a parallel configuration (normal operation) to a **series configuration** for engine starting. When starting, a battery switching relay is energised, connecting both batteries in series so that **48V** is supplied to the bus bar and starter motor. After the engine reaches self-sustaining speed, the starter relay de-energises and the batteries return to their normal parallel configuration.

## Aircraft Battery Charger Units

Many modern transport aircraft incorporate a separate battery charger unit, with a **TRU** providing DC for charging in two modes: **High Charge** and **Low Charge**. The charger normally operates in high mode; once battery voltage rises above charger voltage, current falls to zero, and the charger repeats pulsed charging until control circuits switch to low mode (approximately **2 minutes** after pulse charging commences).

Three protective factors can force a low charge mode:

1. The battery thermal switch opening if battery temperature exceeds **46°C**
2. Loss of DC power from the designated TRU
3. External AC power being connected to the aircraft (via the fuelling panel power select relay)

An APU start interlock relay prevents the APU starter motor from drawing part of its heavy starting current through the battery charger; it releases automatically once the APU engine reaches **35% rev/min**.
        $cnt$,
        7
    ) RETURNING id INTO s7_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module M11B.8: Electrical Power — Generation and Distribution
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m11_id, 'M11B.8', 'Electrical Power — Generation and Distribution',
        $cnt2$
# Electrical Power — Generation and Distribution

## DC Power Generation

The majority of today's aircraft are equipped with AC generation systems; however, DC generation systems are still in use. A basic DC generator consists of a field winding, laminated armature, pole pieces, a drive shaft, frame and end housing.

A basic self-excited four-pole DC generator's fixed armature circuit consists of four brushes, links connecting brushes of like polarity, and cables to terminals A and A1. The four field coils are of high resistance and connected in series to form the field winding, wound to produce alternate North and South polarities, with ends brought out to terminals Z and Z1.

## Voltage Regulation — General

Efficient operation of aircraft equipment requiring DC depends on the generator voltage at the distribution bus bar being maintained constant under all conditions of load and varying speed, within a prescribed range. Of the factors affecting output voltage, the one most effectively controlled is the **"Field Circuit" current**, which in turn controls the flux density.

## Vibrating Contact Type Voltage Regulator

The regulator consists of two armatures — one for current regulation, one for voltage regulation.

- The **shunt winding** consists of many turns of fine gauge wire, connected in series with the current regulator winding and in parallel with the generator
- The **series winding** consists of a few turns of heavy gauge wire, connected in series with the generator's shunt field winding

When the generator is operating, the regulator contacts are closed so a positive supply flows through the generator field winding, providing excitation. Current through the shunt winding increases the electromagnetic field until, at the pre-adjusted setting, it opposes the armature spring and opens the contacts — this reduces field current (via a resistor) and generator output. The reduced output then allows the spring to close the contacts again, and the cycle repeats. The **frequency of operation is typically between 50 and 200 times a second**, dependent on the electrical load.

## Carbon Pile Voltage Regulator

The carbon pile voltage regulator derives its name from a stack (pile) of carbon disks contained in a ceramic tube, with leaf springs keeping the disks pressed firmly together.

- While the disks are compressed, the **resistance of the pile is very low**
- If pressure on the pile is reduced, **resistance increases**

An electromagnet releases spring pressure on the disks as voltage rises above a predetermined value. The carbon pile is in series with the generator field; the voltage coil is shunted across the generator output. A small manually operated rheostat, connected in series with the voltage coil, provides limited adjustment — necessary where two or more generators are connected in parallel.

## Transistorised Voltage Regulation

Larger aircraft use transistorised voltage regulators, which use a **"Zener Diode"** to regulate the field current. When the zener diode conducts, it switches the control transistor "ON", which switches the power transistor "OFF" — cutting current flow to the generator field winding. As generator output starts to fall, the zener diode closes, the control transistor switches "OFF", and the power transistor switches "ON" again, restoring field current. As with the vibrating contact type, the operating frequency is typically **50 to 200 times a second**.

## Reverse Current Cut-out Relay

In any system where the generator charges a battery and supplies operating power, an automatic means must disconnect the generator from the battery whenever generator voltage falls below battery voltage — otherwise the battery discharges through the generator and may burn out the armature.

The relay has a **voltage coil** (many turns of fine wire, in parallel with the generator output) and a **current coil** (few turns of heavy wire, in series with the generator, carrying the full load current), both wound on a common soft-iron core. When generator voltage is higher than battery voltage, the voltage coil's field is aided by the current coil, keeping the contacts closed. When generator voltage falls below battery voltage, current flows toward the generator, creating an opposing field that weakens the total field and allows the spring to open the contacts, disconnecting generator and battery.

The spring tension is adjusted so the contacts close at approximately:

- **13.5V** in a 12V system
- **26.6 – 27V** in a 24V system

## Current Limiter

A current limiter reduces generator voltage whenever the maximum safe load is exceeded, protecting the generator from overheating. It operates like the vibrator-type voltage regulator, but uses a current coil (in series with the generator load circuit) instead of a voltage coil. When load current becomes excessive, the current coil opens the contact points, adding a resistor to the field circuit and reducing generator voltage and current; as current falls the contacts re-close, and if the excessive load remains, the contacts continue to vibrate to hold output at or below the safe limit.

The contact points are normally set to open when current flow is **10% above the rated capacity** of the generator.

## Three Unit Control Panel

A three-unit control panel combines:

1. Voltage Regulator
2. Current Limiter
3. Reverse Current Cut-out Relay

This combination provides both voltage regulation and protection from excessive loads, and has proved very successful for the control of **12- and 24-volt generator systems**.

## Parallel Operation and Load Sharing

In multi-engine aircraft, generators driven by each engine should operate in parallel so an engine/generator failure does not interrupt the primary power supply. Parallel operation requires generators to carry equal shares of system load, with output voltages as near equal as possible.

The most common method uses a **"Load-Equalising" circuit** controlling generator output via the voltage regulators. Example: both generators feed 150 amps each to a common bus bar; equal load currents produce equal voltage drops across each generator's interpole, so no current flows in the equalising coils. When currents are unbalanced (e.g. 100 amps from one generator and 200 amps from the other), the larger voltage drop drives an equalising current that increases the output of the lightly loaded generator and reduces the output of the overloaded generator.

Load sharing can also be controlled using **vibrating contact voltage regulation**, via an additional "Eq" coil in each regulator's voltage section and a paralleling relay unit — an unbalanced condition causes an unbalanced flow through the equalising circuit that adjusts each regulator's field excitation to restore balance. In systems using **solid state regulation**, unbalanced conditions are detected and adjusted via two additional paralleling transistors, one in each regulator.

## Transformers

A transformer converts AC at one frequency and voltage to AC at the same frequency but a different voltage level. It has three main parts:

1. **Iron Core** — provides a circuit of low reluctance for an alternating magnetic field
2. **Primary Winding** — connected to the main power source
3. **Secondary Winding** — receives energy by mutual induction from the primary and delivers it to the secondary circuit

There are two classes of transformer:

1. **Voltage (Power) Transformers** — primary windings connected in parallel with the supply voltage
2. **Current Transformers** — primary windings connected in series with the supply voltage

Transformers may be single-phase or three-phase, and three-phase transformers can use combinations of **star and delta** connections. A neutral wire may be provided so single-phase loads can be balanced from a three-phase supply.

## Transformer Ratings

Transformers are usually rated in **Volt-Amperes or Kilovolt-Amperes**. The difference between output terminal voltage at full load and no-load, with constant input voltage, is called the **regulation** of the transformer, expressed as a percentage of full-load voltage. It depends on actual losses (eddy current, magnetic leakage, hysteresis) and the power factor of the load — an inductive (lagging) load gives high percentage regulation, while a capacitive (leading) load may give negative regulation (higher output voltage on full load than no-load).

If a transformer is operated at a frequency **lower** than designed, current rises, bringing the core nearer magnetic saturation and risking excessive heat and burn-out at the primary windings. A transformer designed for low frequency can safely be used at higher frequencies, since primary current is then reduced.

## Transformer Rectifier Units (TRU)

A TRU combines a static transformer and rectifiers, used in some AC systems as secondary supply units and as the main conversion unit in aircraft with rectified AC power systems. A typical example is designed to operate on a regulated three-phase input of **200V at 400Hz**, providing a continuous output of **110A at approximately 26V**.

The unit consists of a transformer (star-wound primary, secondary windings in both star and delta configurations) and two three-phase bridge rectifier assemblies, each made up of six silicon diodes connected in parallel. An **ammeter shunt** (dropping 50mV at 100A) enables output current to be measured. Cooling is by convection through ventilation panels; thermal switches at the transformer and rectifier assemblies give overheating warning, closing their contacts at approximately **150°C and 200°C** respectively.

## Rotary Inverter

Used to produce **26V or 115V at 400Hz** from a DC source, a rotary inverter consists of a DC motor driving an AC generator. When switched on, DC is supplied to the motor armature and shunt field winding and to the generator's excitation field winding; the motor drives the generator to produce a three-phase AC output at 115V. Voltage is controlled by a resistor in series with the generator field; frequency (400Hz) is controlled by another pre-set resistor in series with the motor shunt field.

An older type of rotary inverter shares a common armature and field system between motor and generator, with voltage/frequency controlled by a **carbon pile regulator** system, and the AC output taken from a rotating winding via a triple slip ring and brush-gear assembly.

## Static Inverter

Static inverters perform the same conversion function as rotary machines, but using solid-state circuit principles. They are more commonly used to supply **emergency sources of AC** to essential AC systems when the normal AC source has failed. DC is supplied to a square-wave generator (establishing the 400Hz operating frequency), then a pulse shaper, power driver and output stage, with a filter reducing odd harmonics to produce a sine wave output. Output is maintained within limits by voltage and current sensors controlling the "notch time" of the pulse width shaper via a regulator and notch control circuit.

## Circuit Protection — Short Circuits

A **short circuit** exists when an accidental contact between conductors allows current to return to the source through a short, low-resistance path. If unchecked, the heat generated can melt the cable (opening the circuit) or, worse, char and burn insulation of other cables in the loom, causing further short circuits and setting the stage for an electrical fire. This is prevented by sound insulation, secure wiring, and protective devices such as **fuses** and **circuit breakers**.

## Fuses

A fuse is a thermal device designed to protect circuit cables against short-circuit and overload currents. It consists of a low melting-point fusible element or link, enclosed in a glass or ceramic casing (which also localises any flash on fusing). The element is made of lead, lead/tin, tin/bismuth, or another low melting-point alloy. It must have low resistance yet melt at a comparatively low temperature, and must not give off vapour/gas that could conduct and cause arcing when it melts.

Aircraft fuses are classified as:

1. Cartridge Type
2. Plug-in Type
3. Clip Type

## Current Limiters (Fuse Type)

A current limiter is essentially a **"slow-blow" fuse** — when a circuit is overloaded there is a short delay before the metal link melts and disconnects the circuit, because the link is made of **copper**, which has a higher melting point than the alloys used in other fuses. Current limiters carry more than their rated capacity, and a heavy overload for a short time, and are used in heavy-power circuits where short-duration loads would not otherwise damage the circuit.

## Circuit Breakers

Unlike fuses or current limiters, circuit breakers isolate faulted circuits by means of a mechanical trip device actuated by a **bi-metallic element** through which current passes to a switch unit. Because they can be reset after clearance of a fault, they avoid some of the replacement problems of fuses and current limiters. The mechanism is of the **"Trip-Free" type** — it will not allow the switch contacts to be held closed while fault current exists.

A circuit breaker generally consists of three main assemblies:

1. A bi-metallic element
2. A contact-type switch unit
3. A mechanical latching mechanism

A push-pull button provides manual resetting after thermal tripping, and manual tripping when required. In the closed condition, current passes through the switch contacts and the thermal element; if current exceeds the normal operating value, the thermal element distorts until it releases the latch mechanism, opening the main contact and isolating the load — the push-pull button extends, exposing a white band to indicate the circuit breaker has operated. In a three-phase AC circuit, **triple-pole circuit breakers** are used so that a fault on any one (or all three) phases trips all three poles simultaneously, via a common push-pull button.

## Reverse Current Circuit Breaker

A reverse current cut-out relay is used principally in a DC generating system, either as a separate unit or as part of a voltage regulator. It is designed to protect power supply systems against fault currents greater than those at which cut-outs normally operate, and remains "locked-out" until the fault is cleared. It consists of a magnetic unit whose field strength and direction are controlled by a single-turn coil connected between the generator's positive output and the bus bar, plus an auxiliary contact assembly in series with the generator's shunt-field winding. Under normal current flow, the magnetic field set up by the current assists the magnetic unit, keeping the breaker contacts closed; when reverse current flows (e.g. on generator shutdown or failure), the increasing magnetic field eventually opens the latch mechanism, isolating both main and auxiliary contacts. The breaker must be reset after the fault has been cleared.

## Overvoltage Protection

Overvoltage can arise from a fault in the field excitation circuit — internal grounding of the field windings, or an open circuit in the voltage regulator sensing lines. Protective devices guard consumer equipment against voltages higher than their design limits.

In a relay-based overvoltage protection system for a DC system, a **sensing coil** is connected in the generator's shunt field circuit in series with a resistor. Under normal regulated voltage, the sensing coil circuit resistance is high enough to prevent shunt-field current from releasing the relay latch, so contacts remain closed. If an open circuit occurs in the regulator's voltage coil sensing line, shunt field current increases; because of the inverse characteristic of the sensing coil resistor, the resulting electromagnetic field releases the latch mechanism, opening all relay contacts and isolating the system from the bus bar. After the fault is cleared, contacts are reset by depressing a push button.

## Solid State Overvoltage Protection

A solid-state overvoltage detector senses all three phases of the generator output and is set to operate when voltage rises above approximately **130 volts**. The signal from an overvoltage condition passes through an **inverse time delay** to two solid-state switches: one completes a circuit through the generator control relay coil, opening the generator excitation field circuit and closing a circuit to the generator breaker trip relay (which disconnects the generator from the bus bar); the other energises a light relay to illuminate the annunciator light. The purpose of the inverse time delay is to **prevent nuisance tripping under transient conditions**.
        $cnt2$,
        8
    ) RETURNING id INTO s8_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M11B.7 Electrical Power — Batteries (24 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s7_id, 'Which of the following is NOT listed as a principal function of an aircraft battery?',
     '[{"id":"a","text":"To help maintain DC system voltage under transient high load current","correct":true},{"id":"b","text":"To supply power for short-term heavy loads such as engine starting when the generator is unavailable","correct":false},{"id":"c","text":"To supply power for essential services under emergency conditions","correct":false}]',
     '{"B1"}'),

    (s7_id, 'What is the key difference between a primary cell and a secondary cell?',
     '[{"id":"a","text":"A primary cell can be recharged indefinitely, a secondary cell cannot","correct":false},{"id":"b","text":"A secondary cell can be discharged and charged repeatedly during its life, whereas a primary cell is destroyed by discharge and cannot be re-formed","correct":true},{"id":"c","text":"There is no difference; both terms describe the same type of cell","correct":false}]',
     '{"B1"}'),

    (s7_id, 'The nominal cell voltages of Lead-Acid and Nickel-Cadmium cells are respectively:',
     '[{"id":"a","text":"2 volts and 1.2 volts","correct":true},{"id":"b","text":"1.2 volts and 2 volts","correct":false},{"id":"c","text":"1.5 volts and 1.2 volts","correct":false}]',
     '{"B1"}'),

    (s7_id, 'If cells are connected in parallel, the total capacity of the arrangement:',
     '[{"id":"a","text":"Is as for one cell","correct":false},{"id":"b","text":"Is the sum of each cell''s capacity","correct":true},{"id":"c","text":"Is halved compared with a single cell","correct":false}]',
     '{"B1"}'),

    (s7_id, 'In a lead-acid cell, why are there more negative plates than positive plates?',
     '[{"id":"a","text":"Positive plates may buckle under discharge, so negative plates enclose them to minimise buckling","correct":true},{"id":"b","text":"Negative plates conduct electricity more efficiently","correct":false},{"id":"c","text":"It reduces the overall weight of the battery","correct":false}]',
     '{"B1"}'),

    (s7_id, 'During discharge of a lead-acid cell, the net result of the chemical reaction is that:',
     '[{"id":"a","text":"Lead sulphate (PbSO4) forms on both plates","correct":true},{"id":"b","text":"Lead peroxide (PbO2) forms on both plates","correct":false},{"id":"c","text":"Pure spongy lead (Pb) forms on both plates","correct":false}]',
     '{"B1"}'),

    (s7_id, 'A typical 24V lead-acid battery is made up of:',
     '[{"id":"a","text":"Two blocks of six 2-volt cells in series (6 x 2V = 12V per block, two blocks in series)","correct":true},{"id":"b","text":"One block of twelve 1-volt cells in parallel","correct":false},{"id":"c","text":"Four blocks of three 2-volt cells in parallel","correct":false}]',
     '{"B1"}'),

    (s7_id, 'For a lead-acid cell, the fully charged and discharged cell voltages are approximately:',
     '[{"id":"a","text":"2.2V charged, 1.8V discharged","correct":true},{"id":"b","text":"1.8V charged, 2.2V discharged","correct":false},{"id":"c","text":"1.55V charged, 1.1V discharged","correct":false}]',
     '{"B1"}'),

    (s7_id, 'A battery which discharges at 5 amps for 5 hours is rated at:',
     '[{"id":"a","text":"1 Ampere-Hour","correct":false},{"id":"b","text":"25 Ampere-Hours","correct":true},{"id":"c","text":"10 Ampere-Hours","correct":false}]',
     '{"B1"}'),

    (s7_id, 'For a cell that is neither fully charged nor fully discharged, the sole reliable guide to its electrical condition is:',
     '[{"id":"a","text":"Terminal voltage alone","correct":false},{"id":"b","text":"The relative density (RD) of the electrolyte","correct":true},{"id":"c","text":"The colour of the plates","correct":false}]',
     '{"B1"}'),

    (s7_id, 'During lead-acid battery charging, if electrolyte temperature rises above the manufacturer''s specified limit (approximately 60°C), the correct action is to:',
     '[{"id":"a","text":"Increase the charging current to finish the charge more quickly","correct":false},{"id":"b","text":"Stop the charge until the temperature has dropped sufficiently","correct":true},{"id":"c","text":"Add sulphuric acid to cool the electrolyte","correct":false}]',
     '{"B1"}'),

    (s7_id, 'RD correction for lead-acid electrolyte is referenced to a standard temperature of 15°C. The correction is:',
     '[{"id":"a","text":"Add 0.003 to RD for every 4°C above 15°C, subtract 0.003 for every 4°C below","correct":true},{"id":"b","text":"Add 0.03 to RD for every 1°C above 15°C, subtract 0.03 for every 1°C below","correct":false},{"id":"c","text":"No correction is required as RD is unaffected by temperature","correct":false}]',
     '{"B1"}'),

    (s7_id, 'A lead-acid battery has just completed charge. If, following the charge, its terminal voltage falls below a certain value, the battery must be rejected for service. That value is:',
     '[{"id":"a","text":"28.5 volts","correct":true},{"id":"b","text":"24 volts","correct":false},{"id":"c","text":"20 volts","correct":false}]',
     '{"B1"}'),

    (s7_id, 'A 24V lead-acid battery, discharged to its minimum, reads a block voltage of approximately:',
     '[{"id":"a","text":"24V (no change from the charged state)","correct":false},{"id":"b","text":"21.6V (12 x 1.8V)","correct":true},{"id":"c","text":"18V (12 x 1.5V)","correct":false}]',
     '{"B1"}'),

    (s7_id, 'Of the three alkaline cell types mentioned (Nickel-Cadmium, Nickel-Iron, Silver-Zinc), which has become preferred for aircraft batteries?',
     '[{"id":"a","text":"Nickel-Iron","correct":false},{"id":"b","text":"Nickel-Cadmium","correct":true},{"id":"c","text":"Silver-Zinc","correct":false}]',
     '{"B1"}'),

    (s7_id, 'In a Ni/Cd cell, the positive and negative plate materials are respectively:',
     '[{"id":"a","text":"Nickel (positive) and Cadmium (negative)","correct":true},{"id":"b","text":"Cadmium (positive) and Nickel (negative)","correct":false},{"id":"c","text":"Lead (positive) and Nickel (negative)","correct":false}]',
     '{"B1"}'),

    (s7_id, 'Thermal runaway in a Ni/Cd battery is best described as:',
     '[{"id":"a","text":"A condition of overcharge instability where falling internal resistance causes increasing charge current, more heat, and a rapid destructive chain reaction","correct":true},{"id":"b","text":"A normal, controlled part of every charge cycle that requires no monitoring","correct":false},{"id":"c","text":"A condition that only occurs during deep discharge, never during charging","correct":false}]',
     '{"B1"}'),

    (s7_id, 'Compared with lead-acid battery cell caps, Ni/Cd battery cell caps are:',
     '[{"id":"a","text":"Fully sealed, with no venting at all","correct":false},{"id":"b","text":"Semi-open, fitted with a non-return valve to vent gas but exclude air","correct":true},{"id":"c","text":"Identical in construction to lead-acid cell caps","correct":false}]',
     '{"B1"}'),

    (s7_id, 'Because Ni/Cd battery voltages must be measured to two decimal places (e.g. 1.24V, 1.55V), servicing requires the use of a:',
     '[{"id":"a","text":"Standard analogue moving-coil voltmeter","correct":false},{"id":"b","text":"Digital Voltmeter","correct":true},{"id":"c","text":"Hydrometer","correct":false}]',
     '{"B1"}'),

    (s7_id, 'For a 24V, 40AH (1-hour rate) Ni/Cd battery, a charge rate of 0.5C corresponds to:',
     '[{"id":"a","text":"4 amps","correct":false},{"id":"b","text":"20 amps","correct":true},{"id":"c","text":"40 amps","correct":false}]',
     '{"B1"}'),

    (s7_id, 'The minimum acceptable capacity for a standard aircraft battery (lead-acid or Ni/Cd) in a capacity test is:',
     '[{"id":"a","text":"50% of stated capacity","correct":false},{"id":"b","text":"80% of stated capacity","correct":true},{"id":"c","text":"100% of stated capacity, with no tolerance","correct":false}]',
     '{"B1"}'),

    (s7_id, 'During an emergency (e.g. main power failure), aircraft batteries must be able to sustain essential services for at least:',
     '[{"id":"a","text":"5 minutes","correct":false},{"id":"b","text":"30 minutes","correct":true},{"id":"c","text":"2 hours","correct":false}]',
     '{"B1"}'),

    (s7_id, 'On a turboprop aircraft with two 24V Ni/Cd batteries switchable between parallel and series configuration, when the batteries are switched to series for engine starting, the bus bar and starter motor receive:',
     '[{"id":"a","text":"12V","correct":false},{"id":"b","text":"24V, unchanged from normal operation","correct":false},{"id":"c","text":"48V","correct":true}]',
     '{"B1"}'),

    (s7_id, 'In an aircraft battery charger unit, the battery thermal switch that forces the charger into low charge mode opens when battery temperature exceeds approximately:',
     '[{"id":"a","text":"25°C","correct":false},{"id":"b","text":"46°C","correct":true},{"id":"c","text":"90°C","correct":false}]',
     '{"B1"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M11B.8 Electrical Power — Generation and Distribution (25 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s8_id, 'In a DC generator system, the output voltage is most effectively controlled by regulating:',
     '[{"id":"a","text":"The armature drive shaft speed only","correct":false},{"id":"b","text":"The \"Field Circuit\" current, which controls flux density","correct":true},{"id":"c","text":"The frame temperature","correct":false}]',
     '{"B1"}'),

    (s8_id, 'In a basic self-excited four-pole DC generator, the field coils are:',
     '[{"id":"a","text":"Connected in series and wound to produce alternate North and South polarities","correct":true},{"id":"b","text":"Connected in parallel and all wound to produce the same polarity","correct":false},{"id":"c","text":"Not connected to each other at all","correct":false}]',
     '{"B1"}'),

    (s8_id, 'In a vibrating contact type voltage regulator, the shunt winding is:',
     '[{"id":"a","text":"A few turns of heavy gauge wire in series with the generator shunt field winding","correct":false},{"id":"b","text":"Many turns of fine gauge wire, connected in series with the current regulator winding and in parallel with the generator","correct":true},{"id":"c","text":"Not present in this type of regulator","correct":false}]',
     '{"B1"}'),

    (s8_id, 'The typical operating frequency of a vibrating contact or transistorised voltage regulator is:',
     '[{"id":"a","text":"Between 50 and 200 times per second, depending on electrical load","correct":true},{"id":"b","text":"A fixed 1 time per second regardless of load","correct":false},{"id":"c","text":"Between 1,000 and 2,000 times per second","correct":false}]',
     '{"B1"}'),

    (s8_id, 'In a carbon pile voltage regulator, when the pressure on the carbon disk pile is reduced:',
     '[{"id":"a","text":"The resistance of the pile decreases","correct":false},{"id":"b","text":"The resistance of the pile increases","correct":true},{"id":"c","text":"The resistance of the pile is unaffected","correct":false}]',
     '{"B1"}'),

    (s8_id, 'A transistorised voltage regulator uses which component to regulate the field current?',
     '[{"id":"a","text":"A carbon pile","correct":false},{"id":"b","text":"A Zener Diode","correct":true},{"id":"c","text":"A hydrometer","correct":false}]',
     '{"B1"}'),

    (s8_id, 'The purpose of a reverse current cut-out relay is to:',
     '[{"id":"a","text":"Disconnect the generator from the battery when generator voltage falls below battery voltage, preventing the battery discharging through and burning out the armature","correct":true},{"id":"b","text":"Increase generator output whenever battery voltage is low","correct":false},{"id":"c","text":"Prevent the generator from ever supplying the battery bus bar","correct":false}]',
     '{"B1"}'),

    (s8_id, 'In a reverse current cut-out relay, the spring tension is typically adjusted so the contacts close at approximately:',
     '[{"id":"a","text":"5V in a 12V system, 10V in a 24V system","correct":false},{"id":"b","text":"13.5V in a 12V system, 26.6-27V in a 24V system","correct":true},{"id":"c","text":"20V in a 12V system, 40V in a 24V system","correct":false}]',
     '{"B1"}'),

    (s8_id, 'A current limiter''s contact points are normally set to open when current flow reaches:',
     '[{"id":"a","text":"10% above the rated capacity of the generator","correct":true},{"id":"b","text":"Exactly the rated capacity of the generator, with no margin","correct":false},{"id":"c","text":"200% above the rated capacity of the generator","correct":false}]',
     '{"B1"}'),

    (s8_id, 'A three-unit generator control panel combines which three components?',
     '[{"id":"a","text":"Voltage regulator, current limiter, and reverse current cut-out relay","correct":true},{"id":"b","text":"Transformer, rectifier, and inverter","correct":false},{"id":"c","text":"Fuse, circuit breaker, and current limiter","correct":false}]',
     '{"B1"}'),

    (s8_id, 'When two generators are load-sharing on a common bus bar and one generator supplies more current than the other, the equalising circuit acts to:',
     '[{"id":"a","text":"Increase the output of the lightly loaded generator and reduce the output of the overloaded generator","correct":true},{"id":"b","text":"Shut down the overloaded generator completely","correct":false},{"id":"c","text":"Have no effect until the imbalance exceeds 50%","correct":false}]',
     '{"B1"}'),

    (s8_id, 'A voltage (power) transformer differs from a current transformer in that its primary winding is connected:',
     '[{"id":"a","text":"In parallel with the supply voltage, rather than in series","correct":true},{"id":"b","text":"In series with the supply voltage, rather than in parallel","correct":false},{"id":"c","text":"Neither in series nor parallel, but via a separate DC supply","correct":false}]',
     '{"B1"}'),

    (s8_id, 'Transformers are usually rated in:',
     '[{"id":"a","text":"Volt-Amperes or Kilovolt-Amperes","correct":true},{"id":"b","text":"Amperes only","correct":false},{"id":"c","text":"Ohms","correct":false}]',
     '{"B1"}'),

    (s8_id, 'If a transformer is operated at a frequency lower than that for which it was designed, at constant voltage:',
     '[{"id":"a","text":"Current falls, reducing the risk of overheating","correct":false},{"id":"b","text":"Current rises, bringing the core nearer saturation and risking excessive heat and burn-out","correct":true},{"id":"c","text":"There is no effect on current or heating","correct":false}]',
     '{"B1"}'),

    (s8_id, 'A typical Transformer Rectifier Unit (TRU) described in the text operates on a regulated three-phase input of 200V at 400Hz and provides a continuous output of approximately:',
     '[{"id":"a","text":"110A at approximately 26V","correct":true},{"id":"b","text":"10A at approximately 260V","correct":false},{"id":"c","text":"1100A at approximately 2.6V","correct":false}]',
     '{"B1"}'),

    (s8_id, 'In the TRU described, the ammeter shunt used to enable output current measurement is rated to drop:',
     '[{"id":"a","text":"50mV at 100A","correct":true},{"id":"b","text":"5V at 100A","correct":false},{"id":"c","text":"500mV at 10A","correct":false}]',
     '{"B1"}'),

    (s8_id, 'A rotary inverter is used to produce which typical outputs from a DC source?',
     '[{"id":"a","text":"12V or 24V DC","correct":false},{"id":"b","text":"26V or 115V at 400Hz","correct":true},{"id":"c","text":"440V at 50Hz","correct":false}]',
     '{"B1"}'),

    (s8_id, 'Static inverters, using solid state circuit principles, are more commonly used to:',
     '[{"id":"a","text":"Supply emergency sources of AC to essential AC systems when the normal AC source has failed","correct":true},{"id":"b","text":"Charge lead-acid batteries directly","correct":false},{"id":"c","text":"Replace all DC generators on an aircraft","correct":false}]',
     '{"B1"}'),

    (s8_id, 'A short circuit is defined as:',
     '[{"id":"a","text":"A deliberate low-resistance path installed to protect a circuit","correct":false},{"id":"b","text":"An accidental contact between conductors allowing current to return to the source through a short, low-resistance path","correct":true},{"id":"c","text":"Any circuit with more than one load connected","correct":false}]',
     '{"B1"}'),

    (s8_id, 'The fusible element/link of a typical aircraft fuse is made from a low melting-point alloy such as:',
     '[{"id":"a","text":"Lead, lead/tin, or tin/bismuth","correct":true},{"id":"b","text":"Pure tungsten","correct":false},{"id":"c","text":"Stainless steel","correct":false}]',
     '{"B1"}'),

    (s8_id, 'A current limiter (fuse type), essentially a "slow-blow" fuse, uses a link made of which material to give it a higher melting point and a short time delay before opening?',
     '[{"id":"a","text":"Lead","correct":false},{"id":"b","text":"Copper","correct":true},{"id":"c","text":"Tin/Bismuth alloy","correct":false}]',
     '{"B1"}'),

    (s8_id, 'Unlike fuses or current limiters, a circuit breaker isolates a faulted circuit by means of:',
     '[{"id":"a","text":"A mechanical trip device actuated by a bi-metallic element","correct":true},{"id":"b","text":"A fusible metal strip that permanently melts","correct":false},{"id":"c","text":"A chemical reaction inside the breaker casing","correct":false}]',
     '{"B1"}'),

    (s8_id, 'The "Trip-Free" design of an aircraft circuit breaker means that:',
     '[{"id":"a","text":"It will not allow the switch contacts to be held closed while fault current exists in the circuit","correct":true},{"id":"b","text":"It can never be reset once tripped","correct":false},{"id":"c","text":"It trips automatically every time the aircraft is powered up","correct":false}]',
     '{"B1"}'),

    (s8_id, 'In a solid-state overvoltage protection system, the purpose of the inverse time delay is to:',
     '[{"id":"a","text":"Prevent nuisance tripping under transient conditions","correct":true},{"id":"b","text":"Permanently disable the overvoltage detector after one trip","correct":false},{"id":"c","text":"Increase the generator field excitation current","correct":false}]',
     '{"B1"}'),

    (s8_id, 'A solid-state overvoltage detector described in the text senses all three phases of the generator output and is set to operate when voltage rises above approximately:',
     '[{"id":"a","text":"28 volts","correct":false},{"id":"b","text":"130 volts","correct":true},{"id":"c","text":"400 volts","correct":false}]',
     '{"B1"}');

END $$;
