-- Module 11A (Turbine Aeroplane, B1): Electrical Power — Distribution and Protection
-- Source: EASA Part-66 Module 11A official textbook (IKAROS Aviation Training Centre, IK01, Issue Oct.2012)

DO $$
DECLARE
    m11_id INT;
    s1_id  INT;
BEGIN
    SELECT id INTO m11_id FROM easa_modules WHERE code = 'M11';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M11A.9') THEN
        RAISE NOTICE 'M11A.9 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module M11A.9: Electrical Power — Distribution and Protection
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m11_id, 'M11A.9', 'Electrical Power — Distribution and Protection',
        $cnt$
# Electrical Power — Distribution and Protection

## Busbars

In most aircraft types the output from the generating sources is coupled to one or more low-impedance conductors called **busbars**. These are usually situated in junction boxes or distribution panels at central points in the aircraft, providing a convenient means of connecting positive supplies to the various consumer circuits.

In a very simple system a busbar may be a strip of interlinked terminals; in more complex systems main busbars are thick metal (usually copper) strips or rods to which input and output supplies are connected. The strips or rods are insulated from the main structure and normally provided with a protective covering.

### Function of a Distribution System

A distribution system must meet three main requirements:

1. Power-consuming equipment must not be deprived of power in the event of power source failure, unless total power demand exceeds available supply.
2. Faults on the distribution system (fault currents, grounding of busbars) should have minimum effect on system function and constitute minimum fire risk.
3. Power-consuming equipment faults must not endanger the supply of power to other equipment.

These requirements are met by paralleling generators where appropriate, providing adequate circuit protection devices, and arranging for faulted generators to be isolated from the distribution system.

### Categories of Consumer Services

Consumer services are categorised, in order of importance, as:

| Category | Description |
|---|---|
| **Vital Services** (Hot Battery Busbar) | Required after an emergency wheels-up landing, e.g. emergency lighting and crash-switch operation of fire extinguishers. Connected directly to the battery. |
| **Essential Services** | Required to ensure safe flight in an in-flight emergency. Connected to D.C. and A.C. busbars so they can always be supplied from a generator or from batteries. |
| **Non-Essential Services** | Can be isolated in an in-flight emergency for load-shedding purposes. Connected to D.C. and A.C. busbars, supplied from a generator. |

In a typical two-D.C.-generator system, each generator feeds its own busbar carrying the non-essential loads; both busbars connect to a single busbar supplying the essential loads. The essential busbar is also connected to the battery busbar to keep the batteries charged. If one generator fails it is automatically isolated from its busbar and all busbar loads are taken over by the operative generator. If both generators fail, non-essential services lose power, and the batteries automatically supply the essential busbar (A.C. essential services via an inverter) for a period determined by consumer load and battery state of charge.

## Distribution System Architectures

### Split Busbar A.C. Generation System

Generators supply three-phase power through separate channels to their own main busbar, which in turn supplies non-essential consumer loads and Transformer Rectifier Units (TRUs). Essential A.C. loads are supplied from the essential busbar, connected under normal conditions via a change-over relay to the No. 1 main busbar. The main busbars are normally isolated from each other (generators not paralleled). If one generator fails, the busbars are automatically interconnected by energising the **Bus-Tie Breaker (BTB)**, maintaining supplies to all A.C. consumers and both TRUs.

If power from both generators fails, non-essential services are isolated, the change-over relay de-energises and connects the essential A.C. busbar to an emergency static inverter, and the main D.C. busbar is isolated from the essential D.C. busbar (isolation relay de-energised), with the essential D.C. busbar then deriving supply directly from the battery busbar. External power can also be connected to supply both A.C. and D.C. to the whole system.

### Parallel Electrical System

All A.C. generators are connected to one distribution bus, the **Tie-Bus**, maintaining equal load sharing for three or more generators. Because the generators are connected in parallel to a common bus, all generator **voltages, frequencies and phase sequence must be within very strict limits** to ensure proper system operation.

### Split Parallel Electrical System

A split parallel system allows flexibility in load distribution while maintaining isolation between systems when required. A **Split System Breaker (SSB)**, when closed, connects all generators together (fully paralleled); when open, it isolates the right and left systems, creating a more flexible parallel arrangement.

## Generator Control Units (GCU) and the BPCU

Aircraft electrical power control systems provide voltage regulation, current limiting, protection for out-of-tolerance voltages and frequencies, and crew alerting. The major component performing these functions is the **Generator Control Unit (GCU)**. It regulates generator output by sensing system voltage, comparing it with a reference signal, and sending an adjusted current to the exciter field of the main generator, which in turn controls the generator's output voltage.

Protection circuitry within the GCU monitors over-voltage, over-current, frequency, phase sequence and current-differential conditions. If a fault occurs, the protection circuitry operates relays to isolate the defective components. In a generator failure, the GCU senses partial loss of power and signals the **Bus Power Control Unit (BPCU)**, which automatically isolates the defective generator and reconnects the load bus to another power source.

On aircraft with parallel or split-bus systems, the BPCU provides centralised control of power distribution between load busbars, setting bus-ties and generator circuit breakers correctly if a generator fails or a bus shorts to ground. In an overload, the BPCU reduces electrical load to an acceptable level — **load shedding** — with the aircraft's galley power normally the first non-essential load to be disconnected. This must happen within a fraction of a second to avoid an interruption to flight.

The BPCU also receives data from the GCU, the Ground Power Control Unit (GPCU), bus ties and circuit breakers, and from **Load Controllers**, which sense real system current (via current transformers) and provide control signals to the generator's constant speed drive unit (CSDU) governor, which in turn affects generator output frequency.

### Current Transformers

Current transformers consist of three inductive pick-up coils that provide current-sensing signals. The main power leads carrying the three-phase A.C. supply from each generator are routed through corresponding holes in the current transformer; the alternating current induces a voltage in the transformer. These signals, together with the GCU and BPCU, control protection circuitry and supply load meters on the flight-deck overhead panel.

## GCU Protection Functions and Typical Trip Values

Each GCU contains a Field Power Supply, a Control D.C. Power Supply, a transistor voltage regulator, a **Generator Control Relay (GCR)** — a double-coil magnetic latching relay connecting the field power supply to the generator exciter — and transistorised protection circuits for:

| Function | Abbreviation |
|---|---|
| Over-voltage | OV |
| Under-voltage | UV |
| Over-current | OC |
| Differential Current Protection | DP |
| Over-frequency | OF |
| Under-Frequency | UF |

The GCR can be tripped **manually** by: generator switch to OFF, CSD disconnect switch activated, or fire handle pulled. It can be tripped **automatically** by five faults: OV, UV, OC, DP and OF. Under-frequency does **not** trip the GCR — instead, the GCR having tripped, or a UF condition, will trip the **Generator Circuit Breaker (GCB)**.

Typical (illustrative) trip values quoted for a 200 V, 3-phase, 400 Hz generating system:

| Protection | Typical Operating Point | Notes |
|---|---|---|
| Over-voltage Unit (OV) | Above approximately **220 V** (220 V ± 6 V) | Time delay inversely proportional to the magnitude of the over-voltage — e.g. approx. 10 s at 220 V, 0.7–1.6 s at 225 V, 0.35–0.65 s at 250 V |
| Under-voltage & Reverse Phase Sequence Unit (UV) | Falls to approximately **173 V** (173 V ± 6 V) | Also protects against incorrect phase rotation if the generator is wrongly connected |
| Over-current (OC) | Approximately **170 A** (typical B737 value) | — |
| Differential Protection (DP) | Typically **20–30 A** difference | See Differential Current Protection below |
| Over-frequency (OF) | Above **430 Hz ± 5 Hz** | Trips GCB |
| Under-Frequency (UF) | Below **365 Hz ± 5 Hz** | Trips GCB only, inhibits UV tripping the GCR during engine shutdown |

## Differential Current Protection

A **Differential Current Protection** system detects a short-circuited feeder line or generator busbar, which could otherwise draw very high current from the generator and risk an electrical fire. The difference between the current leaving the generator and the current arriving at the busbar is called a **Differential Fault** or **Feeder Fault**.

In an A.C. system, current comparisons are made phase-for-phase using two three-phase current transformers: one on the neutral side of the generator (**Ground DPCT**) and one on the upstream side of the busbar (**Load DPCT**). If the generator current is I and a fault current If flows between generator and busbar, the Ground DPCT detects the generator's total current (I − If) + If = I, while the Load DPCT detects I − If. The difference between the two current transformer readings — the fault current — is sensed against a specified limit (typically 20–30 A); if exceeded, a protector circuit within the GCU trips the Generator Control Relay.

## Over-Current Protection

A very heavy load placed on a generator can create three simultaneous faults: over-current (OC), under-frequency (UF) and under-voltage (UV). If the underlying cause is OC, it will itself cause voltage to drop and possibly the generator shaft to slow. In this case the OC detector sends **'OC LOCKOUT'** signals to inhibit UF tripping of the GCB and UV tripping of the GCR — the OC fault takes priority and trips the GCR itself.

## Transformers

A transformer converts A.C. at one voltage to A.C. at the same frequency but a different voltage. It has three main parts: an **iron core** (a low-reluctance circuit for the alternating magnetic field), a **primary winding** connected to the power source, and a **secondary winding** that receives energy by mutual induction and delivers it to the secondary circuit.

There are two classes of transformer:

1. **Voltage (or Power) Transformers** — the primary winding is connected in **parallel** with the supply voltage.
2. **Current Transformers** — the primary winding is connected in **series** with the supply voltage.

Three-phase transformers can use various combinations of star and delta connections. A neutral wire is provided when a single-phase load must be powered from a three-phase supply, since it is otherwise difficult to keep loads balanced.

### Transformer Ratings

Transformers are rated in Volt-Amperes or Kilovolt-Amperes. The difference between output terminal voltage at full load and no-load (with constant input voltage) is called the **regulation** of the transformer, expressed as a percentage of full-load voltage. Regulation depends on actual losses (eddy current, magnetic leakage, hysteresis) and on the power factor of the load:

- An **inductive (lagging power factor) load** gives rise to a **high percentage regulation**.
- A **capacitive (leading power factor) load** can give a **negative regulation** — a higher output voltage at full load than at no-load.

If a transformer is operated at a frequency **lower** than its design frequency, primary current rises (bringing the core nearer to saturation, decreasing effective inductance, causing still larger current), risking excessive heat and burn-out of the primary windings. A transformer designed for low frequency can safely be used at a **higher** frequency, since primary current is then reduced.

## Transformer Rectifier Units (TRU)

A TRU combines a static transformer with rectifiers, used in A.C. systems as secondary supply units, or as the main conversion units in aircraft with rectified A.C. power systems. A typical TRU is designed to operate on a regulated three-phase input of 200 V at 400 Hz and to provide a continuous output of **110 A at approximately 26 V**.

The unit consists of a transformer (star-wound primary, secondary windings in both star and delta) feeding two three-phase bridge rectifier assemblies (six silicon diodes each, connected in parallel). An ammeter shunt (dropping 50 mV at 100 A) allows output current to be measured at auxiliary terminals. Cooling is by convection through gauze-covered ventilation panels; thermal switches at the transformer and rectifier assemblies close their contacts (to independent warning lights) when temperature reaches approximately **150°C and 200°C** respectively.

## Rotary Inverters

A rotary inverter is used to produce 26 V or 115 V, 400 Hz A.C. from a D.C. source. It consists of a **D.C. motor driving an A.C. generator**. Since many of the systems operated from it depend on constant voltage and frequency, the A.C. supply must be regulated.

When switched on, D.C. is supplied to the motor armature and shunt field, and to the generator's excitation field winding; the motor drives the generator, producing a three-phase A.C. output at 115 V. Voltage is controlled by passing the D.C. supply through a pre-set resistor in series with the generator field. Frequency (dependent on motor speed) is controlled by another pre-set resistor in series with the motor shunt field, providing sufficient excitation current to run the motor/generator at the speed needed for a 400 Hz output.

An alternative (older) type shares a common armature and field system between motor and generator, using a **carbon pile regulator** to control both voltage and frequency. The D.C. section is a four-pole compound-wound machine; the A.C. section is a star-wound generator with its winding in the armature slots, connected via a triple slip-ring and brush-gear assembly — so the three-phase output is induced in a **rotating** winding rather than a fixed stator winding as in a conventional A.C. generator. The rectified A.C. output feeds back to the regulator's voltage coil, which varies carbon-pile resistance to keep voltage and frequency within limits.

## Static Inverters

Static inverters perform the same conversion function as rotary inverters but using solid-state circuits. They are used in some aircraft as the normal source of A.C., but are **more commonly used to supply emergency A.C.** to essential A.C. systems when the normal A.C. source has failed.

The basic conversion chain: D.C. is filtered and smoothed, then fed to a **400 Hz square-wave generator** (establishing the operating frequency), whose output passes to a **pulse shaper** (controlling pulse width, delayed by a turn-on delay circuit so it only outputs once the voltage has stabilised), then to a **power driver stage** (a pulse-width-modulated symmetrical square-wave output, which shorts itself out at each zero-voltage "notch time"), then to the **output stage** (a variable-pulse-width square wave), and finally through a filter that reduces the odd harmonics to produce a **sine wave** output at the required voltage and frequency. Output is held within limits by voltage and current sensors controlling the notch time via a regulator and notch control circuit.

## DC External (Ground) Power

Aircraft batteries can supply limited ground power for turn-rounds, engine starting and lighting, but should be conserved for emergencies — a separate circuit is therefore provided for external power supplies.

A basic D.C. external power connection uses a **3-pin receptacle**: two large pins carry the main busbar load, and one small pin carries the supply to the coil of the external power relay. When the external power plug is withdrawn, the **small pin leaves the receptacle first**, breaking the supply to the external power relay and opening its contacts — de-energising the main busbar load **before** the two large pins separate, so preventing arcing. A **Reverse Current Circuit Breaker** is also incorporated in the external power circuit, in series with the main D.C. bus.

In aircraft with a multiple D.C. busbar system, bus-tie contactors and magnetic indicators are used to tie busbars together and confirm connections when external power is applied.

## AC External Power

The A.C. external power receptacle has four large pins (three phases and neutral) and two small pins carrying D.C. for operating a ground power contactor — the small pins perform the same function as in the D.C. receptacle, ensuring the load-bearing pins are open-circuited before the plug can be disconnected, preventing arcing.

Three-phase, 400 Hz, 115 V A.C. power is supplied through the receptacle. Before connection to the aircraft systems, a **Ground Power Control Unit (GPCU)** monitors the supply. Parameters generally monitored include:

- Over voltage
- Under voltage
- Phase sequence
- Phase imbalance
- Over current
- Over frequency
- Under frequency
- Open phase

Only when these parameters are within specified limits is ground power allowed to feed the aircraft systems. In the external power circuit, the TRU provides a 28 V D.C. feedback supply to a hold-in circuit; a phase-sequence protection unit completes the circuit to the control relay coil only if phase sequence is correct. The external power switch (Close/Trip positions) controls the closing and tripping coils of the external power breaker.

## Fuses and Current Limiters

To further protect circuits, protective devices such as fuses and circuit breakers are used.

A **fuse** is a thermal device that protects the cables of a circuit against short-circuit and overload currents. It consists of a low-melting-point fusible element or link (lead, lead/tin, tin/bismuth, or another low-melting alloy) enclosed in a glass or ceramic casing, which protects the element and localises any flash. When current exceeds the fuse's capacity, the strip melts and breaks the circuit. The strip must have low resistance, melt at a comparatively low temperature, and must not give off vapour or gas that could conduct and cause arcing. Aircraft fuses are classified as **Cartridge**, **Plug-in**, or **Clip** type.

A **Current Limiter** is essentially a "slow-blow" fuse: when the circuit is overloaded there is a short delay before the metal link melts, because the link is made of **copper**, which has a higher melting point than fuse alloys. Current limiters are used in heavy-power circuits where short-duration overloads should not damage the equipment; their capacity is selected so they always interrupt the circuit before an overload has time to cause damage.

## Circuit Breakers

Unlike fuses or current limiters, circuit breakers isolate faulted circuits by means of a mechanical trip device actuated by a **bi-metallic element**. Because they can be **reset** after a fault is cleared, they avoid the replacement problems of fuses and current limiters.

The mechanism is of the **"Trip-Free"** type — it will not allow the switch contacts to be held closed while fault current exists. A circuit breaker generally consists of three main assemblies: a bi-metallic element, a contact-type switch unit, and a mechanical latching mechanism, plus a push-pull button for manual resetting or manual tripping.

In the closed condition, current passes through the switch contacts and the thermal element; at normal current, heat is radiated away and temperature stays constant. If current exceeds the normal value, the thermal element heats and distorts, eventually releasing the latch so the control spring opens the main contact, isolating the load; the push-pull button extends, exposing a white band to indicate the breaker has tripped. After tripping, the thermal element cools and reverts to its original state, and the circuit can then be reset once the fault is rectified.

In three-phase A.C. circuits, **triple-pole circuit breakers** are used: their mechanisms trip all three poles simultaneously if a fault current occurs in any one or all three phases, and also if an unbalanced phase condition develops from an open-circuited phase. A common push-pull button is actuated by all three trip mechanisms.

## Reverse Current Cut-Out Relay

A **reverse current cut-out relay** is used principally in a D.C. generating system, either as a separate unit or as part of a voltage regulator. These devices protect power supply systems and associated circuits against fault currents greater than those at which cut-outs normally operate, and are designed to remain in a **"locked-out"** condition to ensure complete circuit isolation until a fault has been cleared.

It consists of a magnetic unit whose field strength and direction are controlled by a single-turn coil connected between the generator's positive output and the busbar via a main contact assembly, and an auxiliary contact assembly connected in series with the generator's shunt-field winding. A latching mechanism, actuated by the magnet unit under heavy reverse-current conditions, opens both contact assemblies.

### Operation

Under normal current flow, closing the relay energises the **line contactor**, connecting the generator output to the busbar via the coil and the main contacts of the normally-closed reverse current circuit breaker; the magnetic field from this current flow assists the magnet unit, keeping the breaker contacts closed. When the generator shuts down or its output fails, and output drops below battery voltage, **reverse current** flows; the cut-out relay operates and de-energises the line contactor, taking the generator off-line. Under these conditions the reverse current circuit breaker **remains closed**, since the current magnitude is much lower than that at which it operates.

If the cut-out or line contactor failed to open, reverse current would continue to flow towards the generator — motoring it and reversing its field polarity. The increasing reverse current through the circuit breaker coil would increase its magnetic field strength until the latch mechanism opened, isolating both the main and auxiliary contacts. The breaker must then be **manually reset** once the fault has been cleared.

## Overvoltage Protection

Overvoltage can arise in a generating system from a fault in the field excitation circuit — such as internal grounding of the field windings, or an open-circuit in the voltage regulator sensing lines. Protective devices guard consumer equipment against voltages above their design limits; the methods used vary by aircraft and by whether the system is D.C. or A.C.

### Overvoltage Relay (D.C. System)

The relay has contacts connected in the generator system's essential circuits, mechanically coupled to a latching mechanism that is electromagnetically controlled by a sensing coil (connected in the generator's shunt field circuit, in series with a resistor whose resistance decreases — increasing coil current — as generator field current rises). Under normal regulated voltage, the sensing coil circuit resistance is high enough to prevent the shunt-field current from releasing the latch, so contacts remain closed. If an open circuit occurs in the regulator's voltage-sensing line, shunt field current increases; the resulting electromagnetic field releases the latch, opening all relay contacts and isolating the system from the busbar. Contacts are reset by a push-button once the fault is cleared.

### Solid-State Overvoltage Protection

A solid-state detector senses all three phases of the generator output and is set to operate when voltage rises above approximately **130 V**. The overvoltage signal passes through an **inverse time delay** to two solid-state switches: one interrupts the generator excitation field circuit and trips the generator breaker, disconnecting the generator from the busbar; the other illuminates an annunciator light. The purpose of the inverse time delay is to **prevent nuisance tripping under transient conditions** — as with the analogue Over-voltage Unit, the higher the overvoltage above the trip threshold, the shorter the time before the unit trips.
        $cnt$,
        9
    ) RETURNING id INTO s1_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M11A.9 Electrical Power — Distribution and Protection (24 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s1_id, 'Aircraft consumer services are categorised, in order of importance, into which three categories?',
     '[{"id":"a","text":"Vital, Essential and Non-Essential Services","correct":true},{"id":"b","text":"Primary, Secondary and Tertiary Services","correct":false},{"id":"c","text":"Battery, Generator and External Services","correct":false}]',
     '{"B1"}'),

    (s1_id, 'Vital services, such as emergency lighting and crash-switch operation of fire extinguishers, are connected:',
     '[{"id":"a","text":"Directly to the battery","correct":true},{"id":"b","text":"Only to the external power receptacle","correct":false},{"id":"c","text":"Only to the non-essential busbar","correct":false}]',
     '{"B1"}'),

    (s1_id, 'In an electrical system overload, when load shedding takes place, which load is normally the first non-essential load to be disconnected?',
     '[{"id":"a","text":"Galley power","correct":true},{"id":"b","text":"Flight instrument power","correct":false},{"id":"c","text":"Fuel pump power","correct":false}]',
     '{"B1"}'),

    (s1_id, 'In a Split Busbar A.C. Generation System, if one generator fails, the main busbars are automatically interconnected by energising the:',
     '[{"id":"a","text":"Bus-Tie Breaker (BTB)","correct":true},{"id":"b","text":"External power contactor only","correct":false},{"id":"c","text":"Battery isolation relay","correct":false}]',
     '{"B1"}'),

    (s1_id, 'In a Split Parallel Electrical System, when the Split System Breaker (SSB) is open, the effect is to:',
     '[{"id":"a","text":"Isolate the right and left generating systems from each other","correct":true},{"id":"b","text":"Connect all generators into one fully paralleled system","correct":false},{"id":"c","text":"Disconnect the batteries from all busbars","correct":false}]',
     '{"B1"}'),

    (s1_id, 'The Generator Control Unit (GCU) regulates generator output voltage primarily by:',
     '[{"id":"a","text":"Sensing system voltage, comparing it with a reference, and adjusting current to the generator exciter field","correct":true},{"id":"b","text":"Directly switching the generator''s output windings in and out of circuit","correct":false},{"id":"c","text":"Varying the generator''s rotational speed","correct":false}]',
     '{"B1"}'),

    (s1_id, 'On detecting a generator system failure, the GCU sends a signal to the Bus Power Control Unit (BPCU), which then:',
     '[{"id":"a","text":"Automatically isolates the defective generator and reconnects the load bus to another power source","correct":true},{"id":"b","text":"Shuts down all generators on the aircraft as a precaution","correct":false},{"id":"c","text":"Disconnects the battery from the essential busbar","correct":false}]',
     '{"B1"}'),

    (s1_id, 'Which of the following automatic fault conditions does NOT trip the Generator Control Relay (GCR) directly?',
     '[{"id":"a","text":"Under-Frequency (UF)","correct":true},{"id":"b","text":"Over-voltage (OV)","correct":false},{"id":"c","text":"Over-current (OC)","correct":false}]',
     '{"B1"}'),

    (s1_id, 'For a typical 200 V, 3-phase, 400 Hz generating system, the Over-voltage Unit is designed to disconnect the generator from its load when the voltage rises to approximately:',
     '[{"id":"a","text":"Above 220 volts","correct":true},{"id":"b","text":"Above 400 volts","correct":false},{"id":"c","text":"Above 115 volts","correct":false}]',
     '{"B1"}'),

    (s1_id, 'Besides protecting against under-voltage, the Under-voltage & Reverse Phase Sequence Unit also protects against:',
     '[{"id":"a","text":"Incorrect phase rotation if the generator has been wrongly connected","correct":true},{"id":"b","text":"Over-temperature of the generator windings","correct":false},{"id":"c","text":"Loss of oil pressure in the constant speed drive","correct":false}]',
     '{"B1"}'),

    (s1_id, 'The Abnormal Frequency Protection detectors within a GCU are typically set so that:',
     '[{"id":"a","text":"The over-frequency detector trips above approximately 430 Hz and the under-frequency detector trips below approximately 365 Hz","correct":true},{"id":"b","text":"Both detectors trip at exactly 400 Hz","correct":false},{"id":"c","text":"The over-frequency detector trips below 365 Hz and the under-frequency detector trips above 430 Hz","correct":false}]',
     '{"B1"}'),

    (s1_id, 'A Differential Current Protection system compares the currents sensed by the Ground DPCT and the Load DPCT in order to:',
     '[{"id":"a","text":"Detect a short-circuited feeder line or generator busbar","correct":true},{"id":"b","text":"Measure total aircraft fuel consumption","correct":false},{"id":"c","text":"Balance real load between paralleled generators","correct":false}]',
     '{"B1"}'),

    (s1_id, 'What is the fundamental difference between a Voltage (Power) Transformer and a Current Transformer?',
     '[{"id":"a","text":"A voltage transformer''s primary winding is connected in parallel with the supply, while a current transformer''s primary winding is connected in series with it","correct":true},{"id":"b","text":"A voltage transformer has no secondary winding","correct":false},{"id":"c","text":"A current transformer can only be used on D.C. supplies","correct":false}]',
     '{"B1"}'),

    (s1_id, 'A Transformer Rectifier Unit (TRU) designed to operate on a regulated 200 V, 400 Hz three-phase input is typically rated to provide a continuous output of approximately:',
     '[{"id":"a","text":"110 A at approximately 26 V","correct":true},{"id":"b","text":"10 A at approximately 115 V","correct":false},{"id":"c","text":"400 A at approximately 200 V","correct":false}]',
     '{"B1"}'),

    (s1_id, 'A rotary inverter used to produce A.C. from a D.C. source consists essentially of:',
     '[{"id":"a","text":"A D.C. motor driving an A.C. generator","correct":true},{"id":"b","text":"Two A.C. generators connected back to back","correct":false},{"id":"c","text":"A single solid-state semiconductor switching bridge","correct":false}]',
     '{"B1"}'),

    (s1_id, 'Compared with rotary inverters, static inverters are more commonly used to:',
     '[{"id":"a","text":"Supply an emergency source of A.C. to essential systems when the normal A.C. source has failed","correct":true},{"id":"b","text":"Provide the sole source of D.C. power on all aircraft","correct":false},{"id":"c","text":"Convert three-phase A.C. into single-phase D.C. only","correct":false}]',
     '{"B1"}'),

    (s1_id, 'In a basic 3-pin D.C. external power receptacle, why does the small pin leave the receptacle before the two large pins when the plug is withdrawn?',
     '[{"id":"a","text":"To break the supply to the external power relay coil first, de-energising the main busbar connection and preventing arcing at the large pins","correct":true},{"id":"b","text":"To allow the battery to take over the load before the generator disconnects","correct":false},{"id":"c","text":"To test the continuity of the earth connection before power is removed","correct":false}]',
     '{"B1"}'),

    (s1_id, 'Before allowing an external A.C. ground power supply to feed the aircraft systems, the Ground Power Control Unit (GPCU) monitors parameters that typically include:',
     '[{"id":"a","text":"Over/under voltage, over/under frequency, phase sequence, phase imbalance, open phase and over current","correct":true},{"id":"b","text":"Only the total weight of the ground power cart","correct":false},{"id":"c","text":"Only the ambient outside air temperature","correct":false}]',
     '{"B1"}'),

    (s1_id, 'The fusible link or element of an aircraft fuse must, among other requirements, melt in a way that:',
     '[{"id":"a","text":"Does not give off vapour or gas that could conduct and cause arcing","correct":true},{"id":"b","text":"Produces as much smoke as possible to alert the crew","correct":false},{"id":"c","text":"Welds the two ends of the strip together to maintain circuit continuity","correct":false}]',
     '{"B1"}'),

    (s1_id, 'A key advantage of a circuit breaker over a fuse or current limiter is that:',
     '[{"id":"a","text":"It can be reset after the fault has been cleared, rather than needing to be replaced","correct":true},{"id":"b","text":"It never needs to be manually reset or replaced under any circumstances","correct":false},{"id":"c","text":"It operates purely magnetically, with no thermal element at all","correct":false}]',
     '{"B1"}'),

    (s1_id, 'In a three-phase A.C. circuit, a triple-pole circuit breaker is arranged so that a fault current in any one phase will:',
     '[{"id":"a","text":"Trip all three poles simultaneously","correct":true},{"id":"b","text":"Trip only the affected phase, leaving the other two connected","correct":false},{"id":"c","text":"Have no effect until all three phases develop a fault","correct":false}]',
     '{"B1"}'),

    (s1_id, 'A reverse current cut-out relay used in a D.C. generating system is designed to remain in a "locked-out" condition, meaning that:',
     '[{"id":"a","text":"It ensures complete isolation of the circuit until the fault has been cleared","correct":true},{"id":"b","text":"It automatically re-closes every few seconds until the fault clears itself","correct":false},{"id":"c","text":"It only isolates the auxiliary contacts, leaving the main contacts closed","correct":false}]',
     '{"B1"}'),

    (s1_id, 'When a generator is shut down normally and its output drops below battery voltage, reverse current flows and the cut-out relay operates. Under these conditions, what happens to the separate reverse current circuit breaker?',
     '[{"id":"a","text":"It remains closed, since the reverse current magnitude is much lower than its own trip value","correct":true},{"id":"b","text":"It trips immediately, isolating the generator from the busbar","correct":false},{"id":"c","text":"It reverses its polarity to keep the generator connected","correct":false}]',
     '{"B1"}'),

    (s1_id, 'In the solid-state overvoltage protection system for A.C. generators, the purpose of the inverse time delay is to:',
     '[{"id":"a","text":"Prevent nuisance tripping under transient conditions","correct":true},{"id":"b","text":"Slow down the generator''s rotational speed after a fault","correct":false},{"id":"c","text":"Delay the illumination of the annunciator light indefinitely","correct":false}]',
     '{"B1"}');

END $$;
