-- Module 13: Aircraft Aerodynamics (B2) — Electrical Power, Equipment and Furnishings
-- Source: EASA Part-66 Module 13 official textbook (IKAROS Aviation Training Centre, IK01, Issue Oct.2012)

DO $$
DECLARE
    m13_id INT;
    s5_id  INT;
    s6_id  INT;
BEGIN
    SELECT id INTO m13_id FROM easa_modules WHERE code = 'M13';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M13.5') THEN
        RAISE NOTICE 'M13.5-M13.6 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 13.5: Electrical Power
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m13_id, 'M13.5', 'Electrical Power',
        $cnt$
# Electrical Power (ATA 24)

## Electricity Generation Fundamentals

There are two types of electricity: **static** and **current**. Static electricity produces electrical fields caused by an accumulation of electrons that are not moving. Current electricity, a more useful type, is caused by the movement of electrons. In **DC (direct current)** electricity, the electrons move through the circuit in one direction. In **AC (alternating current)**, the electrons periodically reverse their direction of flow.

There are five ways current electricity can be generated: the conversion of **chemical energy, heat, light, pressure and magnetism**.

All electrical energy used in an aircraft comes from two sources — the conversion of chemical energy and magnetism. **Storage batteries** convert chemical energy into electricity for starting the engine and for use in emergencies, but the electricity for normal operation is produced by **magnetism in a generator or alternator**.

## Generator Principles

### AC Generator Principles

AC is easier to produce than DC. A loop of wire rotates in the magnetic field, caused by lines of magnetic flux between two pole pieces. The two ends of the loop terminate in **slip rings** connected to the external circuit through carbon brushes.

### DC Generators and Alternators

All electricity produced by magnetic generators is AC; the output is rectified, or changed into DC. There are two types of rectifiers: **mechanical and semiconductor**. The pole pieces and rotating coil are similar to an AC generator, but the ends of the coil terminate in the two segments of a **split ring commutator**. Carbon brushes ride on the commutator to connect the coil to the external circuit.

The output waveform is low-frequency pulsating DC. By adding a second coil at right angles to the first, the frequency of the pulsations — called the **ripple frequency** — is doubled, and the terminal voltage is much smoother than that produced by a single coil. By adding even more coils, the ripple frequency is further increased and the output voltage becomes smoother.

### Field Magnets, Armature and Carbon Brushes

In practical generators, the magnetic field is produced by electromagnets. The frame of a typical aircraft DC generator has **four electromagnetic poles**. The strength of the magnetic field, and thus the voltage produced by the generator, are determined by the **voltage regulator**, which controls the amount of current flowing in the field coils.

Practical generators have a number of coils wound in slots around a drum-like core of laminated soft iron on the armature shaft. The ends of the coils are soldered into copper commutator segments, insulated from each other and from the armature shaft. A pair of carbon brushes picks off the output current from the rotating armature.

### Generator Circuit and Excitation

Generator fields are **self-excited** — the field current comes from the armature. As the voltage produced in the armature rises, the field current rises and causes the armature voltage, and consequently the load current, to increase even more. All generators must use some type of **current limiter** as well as a **voltage regulator**.

- **A-circuit**: the field coils are connected to the insulated brush inside the generator; the voltage regulator acts as a variable resistor between the generator field and ground.
- **B-circuit**: the field coils are connected to the grounded brush; the voltage regulator acts as a variable resistor between the generator field and the armature.

The generator control unit contains three units: a **voltage regulator**, a **current limiter**, and a **reverse-current cutout relay**.

- The voltage regulator senses generator output voltage; its normally closed contacts vibrate open and closed many times a second, limiting the current that can flow through the field.
- The current limiter is actuated by a coil in series with the armature output. When the generator puts out more than its rated current, the current limiter's contacts open and put a resistance in the field circuit to lower generator output voltage.
- The reverse-current cutout disconnects the generator from the aircraft bus when generator voltage drops below battery voltage, and automatically reconnects the generator when its voltage rises above battery voltage.

In the typical A-circuit generator system, the armature terminal connects to the G terminal of the control unit, and the reverse-current cutout contacts sit between the G and B terminals. A **Zero-Centre ammeter** shows current flowing either from the battery to the main bus (discharge, −) or from the generator through the main bus into the battery to charge it (+).

## DC Alternators

As semiconductor diodes able to withstand temperature and vibration were developed, the far more practical **alternator** replaced the generator for producing almost all automotive and aircraft electricity. DC alternators have three primary advantages over generators:

- They have many more sets of field poles, so they can produce current at a lower speed
- The high current is produced in the **stationary** component and rectified by semiconductor diodes
- An alternator system is **lighter in weight** than a generator system

The rotor is made of two end pieces of iron forming the magnetic poles (some rotors have four pairs of poles, others as many as seven pairs). The voltage regulator supplies current through brushes and slip rings to a coil of insulated copper wire between the two end pieces to control magnet strength.

The stator windings, in which output current is produced, consist of coils wound in slots in a laminated soft iron frame, arranged in a **three-phase Y-connected circuit**. The AC output of the stator is converted to DC by a **six-diode, three-phase rectifier**.

### Solid-State Voltage Regulator

Most modern systems use a solid-state voltage regulator. When the alternator switch is turned on, the field relay closes and current flows through transistor T1 and the rotor field coil. As soon as the engine starts and the alternator's voltage rises to the regulating value, a zener diode (ZD) begins to conduct; through transistor T2, T1 then shuts off the field current and output voltage drops. As voltage across ZD drops below its zener voltage, T1 turns back on and field current flows again — providing smooth, consistent voltage control with **no moving parts**.

The solid-state rectifier prevents current flow from the load bus back to the stator winding, so **no reverse-current relay is needed** with an alternator. Field current is taken from the regulated bus voltage rather than directly from the alternator output, making the alternator **self-limiting** with regard to current output, so **no current limiter is needed** either. A relay or switching transistor (typically in the voltage regulator or alternator control unit) is still needed to prevent field current flow when the engine is not running.

### Twin-Engine Alternator Load Sharing

Both alternator voltage regulators are connected through their **P (paralleling) terminals**. If one alternator produces more current than the other, its field voltage is higher; this difference is sensed electronically, and the regulator decreases field current to the high-output alternator and increases it to the other, so the alternators **share the load equally**. An over-voltage protector senses alternator output voltage; if it gets too high, it opens the field circuit and stops further output (a red panel light may illuminate to warn the pilot).

## Turbine-Engine Starter-Generator System

Smaller turbine engines in business jets often have a combination **starter-generator** rather than separate units. An extra set of series windings (series motor windings) is switched into the circuit when the engine is started, and switched out once running. When the start switch is set to START, the starter relay closes and current flows to the starter-generator through its C+ terminal, the series motor windings and the armature, to ground; simultaneously current flows through the ignition-cutoff switch to the igniter unit. Once ignition is achieved, the start switch is moved to RUN; the generator-field relay closes, connecting the generator field to the voltage regulator, and as voltage builds to the specified value, the reverse-current cutout contacts close, feeding current from the B+ terminal to the bus. Moving the start switch to OFF opens the generator-field relay and stops generator output.

## AC Generation on Larger Aircraft

A typical AC alternator for a jet aircraft is rated between **40 and 120 kVA**, with a three-phase output, phases normally Y-connected, producing **400 Hz** current. There are two basic types: **brushless** and **brush type**; modern aircraft typically use the brushless type, employing an integrated oil cooler to help remove operating heat.

A brushless alternator has three separate fields: a **permanent magnetic field**, an **exciter field**, and a **main output field**. The permanent magnets provide flux to start the generator producing output before field current flows; this induces voltage into an armature carrying current to a **Generator Control Unit (GCU)**, where the AC is rectified and sent to the exciter field winding. The exciter field induces voltage into the exciter output winding, whose output is rectified by six diodes; the resulting DC flows through the output field winding, inducing voltage into the main output coils. The permanent magnet, exciter output winding, six diodes and output field winding rotate together on the generator shaft.

The three-phase output windings typically produce **120 volts** across each phase winding; with the windings Y-connected, the output between terminals is **208 volts**. The common end of the three windings connects to the aircraft structure, and neutral current flows via the structure.

### AC Voltage Regulator

AC power systems require more complex voltage regulation than DC systems: the control circuit must sense the voltage of all three phases and adjust them if unequal or out of limits, reduce alternator voltage if frequency drops below a specified level, and equalise real and reactive loads among generators. Many aircraft use a **Generator Control Unit (GCU)** to perform these functions plus system testing and fault isolation.

## Constant Speed Drive (CSD)

It is essential that alternator output have a nominal frequency of **400 hertz**, with a tolerance usually from **380 to 420 hertz**. This is achieved throughout the engine speed range using a hydraulically operated **constant-speed drive (CSD)** unit between the engine and the alternator — a variable hydraulic pump and motor arranged so the CSD output is constant regardless of engine speed. Many modern aircraft use an **Integrated Drive Generator (IDG)**, combining the alternator and CSD in one compact unit; if a generator or CSD failure occurs, the pilot may disconnect the input shaft from the drive to prevent damage.

Three CSD/generator configurations exist:
1. The CSD located between the engine-driven gearbox and the generator (the generator must be removed to replace the CSD)
2. The CSD located on the opposite side of the gearbox, with input/output via coaxial shafts (each component replaceable separately)
3. The **IDG**, reducing the arrangement to a single component

The CSD converts variable engine input speed to a constant output speed by adding to or subtracting from it through controlled differential action. A **governor assembly** senses output speed and regulates supply pressure to the control cylinder of the variable pump; flyweights connected to the rotating shaft pivot with changing centrifugal force as output speed changes, positioning a stem that meters the supply pressure. When proper output speed is achieved, a balance exists between spring and flyweight force.

### Integrated Drive Generator (IDG) Example (A320)

The IDG converts varying engine accessory gearbox speeds (approximately **4,500 to 9,120 rpm**) to a constant generator speed of approximately **12,000 rpm**, giving the generator a constant output frequency around **400 Hz**.

| Characteristic | Typical Value |
|---|---|
| Voltage | 115/200 VAC |
| Power | 90 kVA |
| Frequency | 400 Hz (± a few Hz) |
| Input speed | 4,500–9,120 RPM |
| Generator speed | 12,000 RPM |
| Oil temperature | < 127°C |
| Oil pressure | 220–280 PSI |
| Weight | 56 kg |

The generator is controlled by its generator pushbutton: if generator speed is high enough and delivered parameters are correct, the **Generator Line Contactor (GLC)** closes to supply its network. The Generator Fault light illuminates when a generator parameter is incorrect or the GLC is open. If oil overheats or oil pressure drops, the amber **IDG FAULT** light illuminates and the ECAM system is triggered; pressing the IDG pushbutton disconnects the IDG from the accessory gearbox. In flight, IDG disconnection is **irreversible** — the system can only be reconnected on the ground with engines shut down, using a mechanical reset handle (ring), to avoid damage to the drive shaft clutch device. The IDG must **not** be reconnected while the engine is windmilling, as this will damage the disconnection mechanism.

### Brushless Generator Components

The brushless generator consists of three co-axial components: a **Permanent Magnet Generator (PMG)**, a **rotating diode pilot exciter**, and the **generator itself**. It is driven at constant speed and cooled by air or oil spraying. The PMG supplies the exciter field through the Generator Control Relay (GCR) and the GCU through a rectifier unit. The excitation control and regulation module keeps voltage at the nominal value at the **Point Of Regulation (POR)**.

## Variable Speed Constant Frequency (VSCF) Alternators

VSCF systems represent the latest attempt to eliminate moving parts from aircraft electrical components. This system uses a large DC alternator that is **not** reliant on a constant input speed, so the mechanically complex CSD unit is not required. The DC output from the alternator is sent to a solid-state device (an **inverter**) which converts it to AC at a constant 400 Hz. The electronic control circuitry is complex, but VSCF system reliability should outperform the CSD needed for a typical AC alternator.

## Batteries

The battery, or electro-chemical cell, is an important device for producing electricity. When atoms of some chemical elements react with atoms of other elements, electrons are released from one and attracted to the other; the force of attraction for these electrons is an electrical pressure called **voltage**.

### Primary Cells

Primary cells release electrons when the anode is oxidized; the electro-chemical action is **non-reversible**.

| Cell Type | Open-Circuit Voltage | Notes |
|---|---|---|
| Carbon-zinc | 1.5 V | Low-cost, low-voltage; flashlights, portable radios |
| Alkaline-manganese | 1.5 V | Active elements zinc and manganese dioxide; lower internal resistance, higher voltage during discharge than carbon-zinc |
| Mercury | 1.4 V | Large capacity/long life for small size; voltage stays almost constant until nearly used up |
| Silver oxide | 1.55 V | Voltage drops very little until almost fully discharged; long life; used in hearing aids, calculators, watches |
| Lithium | 2.8–3.6 V (depending on cathode material) | Lightest known metal; longest shelf life of any primary cell |

### Secondary Cells

In a secondary cell, the electro-chemical action is **reversible**: discharging removes electrons from the negative plates (changing, not destroying, the active material); recharging (putting electrons back in the opposite direction) restores the plates. The two most commonly used secondary cells are the **lead-acid cell** and the **sintered-plate nickel-cadmium cell**.

#### Lead-Acid Cells

Almost all automobiles and many aircraft use lead-acid batteries to store energy for starting engines. Cells have positive and negative plates covered by an acid electrolyte (a mixture of sulfuric acid and water) that changes chemical composition — and therefore specific gravity — as the state of charge changes, allowing specific gravity to indicate state of charge.

- Fully charged: specific gravity approximately **1.285**
- Fully discharged: specific gravity drops to approximately **1.150**

Lead-acid batteries used in light general aviation aircraft are made of a number of cells with an open-circuit voltage of about **2.1 volts** each.

**Battery charging**: batteries may be charged by the **constant-current** or **constant-voltage** method. The positive lead of the charger connects to the positive terminal of the battery, and the negative lead to the negative terminal. Sulfuric acid electrolyte will burn skin, damage clothing, and corrode aircraft structure; spilled electrolyte must be neutralized with a solution of **baking soda (sodium bicarbonate) and water**, and the battery box area should be protected with chemical-resistant paint.

**Battery installation**: a battery should be firmly secured in a clean, corrosion-free compartment. Connect the positive ("hot") lead first, so there are no sparks if a wrench contacts the aircraft structure, then connect the ground lead. The battery box must be adequately ventilated as recommended by the manufacturer.

#### Nickel-Cadmium Cells

Nickel-cadmium cells can furnish high rates of current flow without voltage drop, and operate over an extremely wide temperature range. The positive plate's active material is **nickel hydroxide**; the negative plate's is **cadmium hydroxide**; plates are separated by a thin strip of special plastic, and the electrolyte is a solution of **potassium hydroxide and water**. Cell voltage is about **1.25 volts**, maintained until the cell is almost completely discharged.

**Thermal runaway**: if subjected to an excessively high charging rate, a nickel-cadmium cell can overheat; internal resistance then drops, allowing the cell to take more current from the charger and generate more heat — a condition that can destroy the cell. Sealed cells are vented to relieve pressure buildup under thermal runaway. The problem is minimized by using a constant-current charger limiting the current delivered.

**Cell memory**: repeated discharge/charge to only a small percentage of capacity causes a cell to lose capacity and never accept a full charge (e.g. if 20% of capacity is repeatedly used and recharged). A cell affected this way can be restored by completely discharging it and overcharging it to approximately **140%** of its rated ampere-hour capacity — known as **deep cycling**.

**Voltage vs. state of charge**: a nickel-cadmium cell keeps its full voltage until nearly totally discharged, so cell voltage gives no indication of remaining charge; specific gravity does not change with state of charge either. The only way to know the charge remaining is to completely discharge the cell and then measure the amount of charge put back into it.

**Aircraft nickel-cadmium batteries** are used for their ability to produce large currents for starting turbine engines. They must **not** be serviced in the same area as lead-acid batteries (cross-contamination risk), and tools for one type should not be used on the other. Cells are connected together with cell links and installed in an insulated steel case; corrosion or loose links can cause overheating and burn marks. In the aircraft, nickel-cadmium batteries typically receive a **constant-voltage** charge; in the shop, they are usually given a **constant-current** charge. The constant-current method is slower but preferred when time and equipment permit, as it is more effective at maintaining cell balance and capacity, and permits easy computation of charge input in ampere-hours; the constant-potential (constant-voltage) method charges more quickly but charging time depends on the charger's current delivery capability.

**Handling and charging cautions**: do not add water to adjust the electrolyte level of discharged cells (spewing will occur during subsequent charging). The potassium hydroxide electrolyte is caustic and will cause serious burns on contact with skin — rubber gloves, apron and goggles must be worn; skin contact should be washed with large quantities of water and neutralized with 3% acetic acid, vinegar or lemon juice, and eye contact requires flushing with water and immediate medical attention. Rings, metal watch bands and identification bracelets should be removed, as metal articles can fuse to intercell connectors of opposite polarity and cause severe burning. When connecting a battery to a bus or charger, always double-check: connect the charger's minus pole to the battery's minus pole, and the charger's plus pole to the battery's plus pole.

## Transformer-Rectifiers

The primary electrical power sources of larger aircraft are AC generators producing **115/200 volts, 400 hertz**; many aircraft systems use **28 volt DC**. Transformers convert the high-voltage AC into lower voltage, and rectifiers change AC into DC — both devices are built into the same unit, the **Transformer-Rectifier Unit (TRU)**.

The three-phase AC is routed to the primary side of the transformer (coils connected in star/Y). The transformer has two secondary sides: **SEC 1** in star order, **SEC 2** in delta order; output from each secondary is rectified by full-wave rectifier circuits. Using two differently-arranged secondary windings with separate rectification reduces the power ripple of the rectified 28 VDC output.

If rectifier temperature exceeds a certain limit, overheat switches signal the TRU's monitor circuit, opening the TRU contactor at the DC output. Rectifier current is also monitored; overcurrent, or current below a certain minimum, likewise opens the TRU contactor.

## Inverters

Small aircraft with DC systems as their primary electrical power still require AC for certain instrument and electronic systems, and use inverters to provide it. Emergency power systems of larger aircraft use inverters to convert battery DC power into **115 volt, 400 hertz** AC to supply the most important systems in case of complete power failure.

- **Rotary inverter**: used in older aircraft; primarily a motor-generator unit — a DC motor with the armature of an AC generator mounted on its shaft. A typical rotary inverter has a 14- or 28-volt DC input and a 115 volt single- or three-phase, 400 Hz output.
- **Static inverter**: the newer, solid-state approach; an oscillator converts DC into 400 Hz AC with the proper waveform, which is then passed through a transformer to obtain the proper voltage. An input filter eliminates interference back to the DC power distribution system.

### Switching Power Supply

A regular transformer will not work with direct current. To change DC into another voltage, the DC input must first be "chopped" (switched at high frequency, e.g. around 1 kHz) so the transformer can work, and the output can then be rectified to give DC again. Because of the high chopper-oscillator frequency, the transformer needs less iron for the necessary magnetic field, so the unit can be built much smaller — a lightweight, efficient design used in computers, televisions and other electronic equipment.

## Emergency Power Generation

If normal electrical power generation fails, other means supply the most essential systems:

- **Air Driven Generator (ADG)**: the pilot extends the ADG into the airstream; the turbine rotates and drives the generator directly on its shaft. A built-in governor in the propeller adjusts blade angle to keep generator speed constant.
- **Constant Speed Motor/Generator (Ram Air Turbine)**: a ram air turbine drives a hydraulic pump on its shaft; if normal power sources fail, it deploys automatically into the airstream. The pump provides hydraulic pressure for essential systems, and a hydraulic motor within the same unit drives a generator, providing enough electrical power for safe flight in emergency configuration.

## External Power

On the ground with no engines running, only the aircraft battery provides electric energy, which is insufficient for extended use of all systems. An external electrical connector outside the fuselage feeds power into the aircraft network; this power is generated by rotary or static inverters on ground installations, or mobile generator systems driven by a combustion engine (small aircraft may use a cart carrying batteries or a transformer-rectifier). Switching power between aircraft, external and APU sources produces short power transients of about **100 ms**.

**No-Break Power Transfer** avoids bus-bar power interruption during a supply-source transfer on the ground, by briefly connecting two sources simultaneously (external power with APU, external power with an engine-driven generator, or APU generator with an engine-driven generator). The sources are synchronized on a frequency reference signal — synchronization may take up to **15 seconds** for APU generator with GPU, and only milliseconds in other cases. For paralleling, the frequency difference must be less than **0.5 Hz** and the phase angle less than **15°**. If synchronization is not achieved within the allowed time, the transfer is performed anyway, without simultaneous connection of the two sources.

## Power Distribution

There are two basic types of large-aircraft power distribution systems: the **split-bus** system and the **parallel** system.

- **Split-bus**: typically found on twin-engine aircraft. Each engine's AC generator supplies only its own distribution bus, isolated from the other bus by bus tie breakers (BTB). If a generator fails, it is isolated by its generator breaker (GB), and BTB 1 and 2 close to connect the isolated bus to the healthy one. The APU generator may be started in flight to carry the load of a failed generator, after which the buses are again isolated.
- **Parallel**: typically used on three- or four-engine aircraft. All generators connect to a common bus and share electrical loads equally. If a generator fails, it is isolated by its generator breaker and the flight continues on the remaining generators; loads are supplied from the individual buses, not from the tie bus.

### Typical Power Source Ratings

| Source | Typical Rating |
|---|---|
| Main generator | 90–120 kVA, 400 Hz, 260–350 A |
| External power | 115/200 VAC 3-phase, 90–120 kVA, 260–350 A |
| Transformer-Rectifier | 28 VDC output, 100–200 A |
| Aircraft battery | 24–28 VDC, 20–50 Ah capacity, 400 A fused current |
| Instrument transformer | 26–28 VAC instrument excitation, 2 A nominal |

### AC and DC Distribution

The three-phase network of commercial aircraft feeds symmetrical loads (three-phase heaters and motors) and asymmetrical loads (single-phase 115V and 200V consumers). Because of asymmetrical loading, a neutral current flows through the aircraft structure — meaning the metallic structure carries high currents — so low-resistance connections to structure (**electrical bonding**) must be assured.

For DC distribution, the positive pole of DC sources (transformer-rectifiers, batteries) is routed by wiring to the DC loads, and the aircraft structure is used as the return conductor for the negative pole — the same arrangement as in cars.

### A320 Example System

Electrical power is provided by two three-phase AC engine generators, each driven by an integrated drive (GEN 1, GEN 2), rated at 90 kVA, 115/200 V, 400 Hz. A third, equal APU generator, driven directly by the APU, can replace either or both engine generators. One engine generator, the APU generator, or external power may supply the complete AC and DC system.

An emergency generator (AC three-phase, **5 kVA**, 115/200 V, 400 Hz), driven by the hydraulic system, automatically provides emergency power if all generators fail. A **1 kVA static inverter** transforms DC from battery 1 into single-phase 115 V, 400 Hz AC to supply the AC ESS bus; it activates automatically once aircraft speed exceeds **50 kts** if only batteries are supplying the aircraft.

Two main Transformer-Rectifiers (TR1, TR2) permanently provide DC power; a third, identical ESS (essential) TR supplies the DC ESS bus from the emergency generator if both engine and APU generators are lost, or if TR1 or TR2 fails. Two main batteries, each of **23 Ah** normal capacity, are permanently connected to the two hot buses; each has an associated **Battery Charge Limiter (BCL)** that monitors charging and controls the battery contactor.

## Electrical Protection

Aviation regulations require that all circuits, other than the main starter circuit, be protected by a device that opens the circuit in the event of excessive current flow — a current limiter, fuse, or circuit breaker. The primary function of a circuit protection device is to protect the wiring, opening the circuit before enough current flows to smoke the wire's insulation.

### Fuses

Two types are used in aircraft circuits:
- **Regular (glass tubular) fuse**: a narrow strip of low-melting-point material that melts as soon as excess current flows
- **Slow-blow fuse**: a larger fusible element held under tension by a small coil spring; it passes a momentary surge of high current (such as when a lighting-circuit switch closes) but softens under sustained excess current, letting the spring pull the link apart

Regulations require aircraft equipped with fuses to carry spares equal to at least **50%** of any one fuse type installed (e.g. one spare for one installed fuse of a given rating). Fuses accessible to maintenance personnel only are commonly called **current limiters** and are often used to isolate a complete distribution bus in the event of a short, allowing the pilot to continue the flight without that bus.

### Circuit Breakers

There are two basic operating types: those that work on **heat** (a bimetallic strip warps and snaps the contacts open) and those opened by the pull of a **magnetic field**. Most breakers work on the heat principle. Three basic configurations are used:

- **Push-pull type**: normally in; pops out (with a visible white band) when overloaded; can be pulled out to switch the circuit for maintenance purposes only
- **Toggle type**: used as a control switch as well as a circuit breaker; when up, the circuit is closed, and on overload the breaker pops partially down — restoring requires moving the toggle all the way down, then back up
- **Push-to-reset type**: normally in; pops out only on overload; cannot be used as a switch, as there is no way to grip the button to pull it out

### Induced Current Protection

When a contactor coil's circuit is opened, the collapsing magnetic field produces a short high-voltage spike of opposite polarity to the battery, which can damage connected electronic equipment or the switch itself (arcing). To prevent this, a reverse-biased **freewheel diode** is connected across the contactor coil: it carries no current in normal operation, but the voltage spike forward-biases it, allowing the induced current to flow back through the coil and dissipate, in the same direction as the current that produced the magnetic field.

### Split-Bus Circuits for Avionics Protection

To prevent damage to radio equipment, all radio equipment should be turned off before the engine is shut down, and checked off before the engine is started. Modern practice connects all voltage-sensitive electronic and avionics equipment to a separate avionics bus, joined to the main bus by a switch-type circuit breaker or relay, so the pilot can isolate the avionics bus before starting or stopping the engine — any voltage spikes are then absorbed by the battery with no danger to the avionics equipment.

### Differential Current Protection

Differential protection guards against a short circuit between two generator lines, between a generator line and ground, or an insulation failure of the generator feeders. A three-phase current transformer inside the generator reads its current; if the current from the generator differs from the current flowing to the power consumers by a certain amount, this indicates a fault inside the generator windings or feeder cables, and the Generator Line Contactor opens while the generator excitation field is turned off. The three-hole current transformer contains three toroid transformers (one per feeder cable), sending a signal proportional to feeder current to the Generator Control Unit.

**Other protections** used on commercial aircraft generator and power-supply systems include: over/under frequency, over/under voltage, incorrect phase sequence, open phase, and generator overload.

## Avionics Equipment Ventilation

Heat produced by avionics systems must be removed from temperature-sensitive electronics to maintain reliability. Equipment ventilated includes, in the cockpit: display units, overhead panel, pedestal; and in the avionics compartment: electronics racks, forward shelf, ADIRUs, weather radar shelf, batteries, and the AC/DC power center.

The ventilation system has two sub-systems:
- **Blowing sub-system**: bleeds the required airflow from the cabin air conditioning system or recirculation fans
- **Extract sub-system**: an extract fan removes the air, ducted through either the under-floor extract valve or the overboard extract valve

The avionics ventilation system must be kept operating as long as the aircraft is powered, to avoid damage to expensive components or fire.
        $cnt$,
        7
    ) RETURNING id INTO s5_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 13.6: Equipment and Furnishings
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m13_id, 'M13.6', 'Equipment and Furnishings',
        $cnt2$
# Equipment and Furnishings (ATA 25)

## Passenger Address (PA) System

Passengers are informed about a variety of matters on board via the PA system, which also supplies boarding music. The system consists of an **amplifier**, a **loudspeaker system** and a number of **microphones**, and is used by both cockpit and cabin crew. Announcements can be made from the cockpit or from cabin attendant stations, and a tape reproducer allows recorded announcements and boarding music to be broadcast through the PA system. Loudspeakers are distributed overhead of the passenger seats, in toilets, and at the flight attendants' working stations.

The PA system has several levels of priority:
1. Cockpit
2. Cabin attendants
3. Prerecorded announcements
4. Boarding music

Depending on aircraft type, up to **3 amplifier units** may be needed to drive all the speakers. From the cockpit, handsets, hand-, boom- or mask microphones are used (1st priority); from the cabin, handsets or hand microphones are used (2nd priority).

### Tape Reproducer and Chimes

Prerecorded announcements usually consist of spoken text, available in various languages, selected and started by the cabin attendant. The tape reproducer **starts automatically if cabin pressure is lost**. Boarding music plays while passengers are embarking or disembarking, creating a relaxed atmosphere.

An electronic chime, produced by the PA amplifier, has three possibilities:
- **High chime**: passenger call to the cabin crew
- **Low chime**: "no smoking" / "fasten seat-belt" signs
- **High/low chime**: call on the cabin interphone, or lavatory smoke warning

**Volume control**: PA volume is automatically increased when engines are on, to compensate for engine noise, and is also automatically increased during cabin decompression, so the emergency announcement is better understood.

### Amplifier

The microphone and audio signals feed an input circuit; a priority circuit uses PTT signals to allow only the highest-priority signal through to the amplifier. Microphone signals pass through an amplifier/compressor circuit that turns a variable input into a signal of almost constant amplitude, feeding a main preamplifier (with engine- and decompression-driven gain adjustment), then the main power amplifier. The master gain potentiometer adjusts the input of the power amplifier, and the PA GAIN input further adjusts the power amplifier. The main power amplifier's output is **30 W continuous or 120 W peak**. Prerecorded announcements go straight to the main preamplifier, while boarding music passes through a low-pass filter first.

The chime generator produces a chime sound from a high or low tone: the low tone is **491 Hz**, the high tone **586 Hz**. The auxiliary amplifier has no external adjustments, delivers **5 W continuous or 20 W peak**, and receives all chime signals but only audio input from cockpit microphones.

### Prerecorded Announcement and Music Reproducer (PRAM)

The recorder plays music, pre-recorded announcements (on request of a cabin attendant), and a pre-recorded emergency announcement (automatically). It has **4 cassette decks** — 2 for music, 2 for pre-recorded announcements — using standard audio cassettes played in mono, one direction only, with 4 channels per tape read by a 4-track playback head. When one music deck plays, the other rewinds on standby. The two announcement cassettes can hold up to **126 announcements** on channels 1 and 2; channel 3 carries the emergency announcement at intervals; channel 4 carries signals marking the start position of each announcement. Newer reproducers store the emergency announcement in **EPROMs** (solid-state stored voice) for faster access in an emergency. An **oxygen-in-use signal** starts the emergency announcement automatically.

### Speakers

Some aircraft have more than 100 loudspeakers, divisible into groups so announcements can target certain passenger groups; some speakers are muted to prevent acoustic feedback. To match speaker impedance (**8 Ohm**) to the amplifier output (**125 Ohm**), each speaker normally has its own impedance-matching transformer with tapped secondary coils for level adjustment. For weight saving, some installations use a higher-impedance speaker (**2500 Ohm**) that needs no matching transformer.

- **Main speakers**: installed in the passenger cabin and toilets, connected to the amplifier's main output; passengers hear all crew announcements plus prerecorded announcements and boarding music. Turning cabin signs (FASTEN SEATBELTS, NO SMOKING) on or off generates a low chime.
- **Auxiliary speakers**: installed at attendant stations, door areas and galleys; reproduce only cockpit announcements and all chime sounds (high chime = passenger-to-attendant call; low chime = seatbelt/no-smoking signs; high/low chime = lavatory smoke warning or crew call).

## Passenger Entertainment and Information Systems

### Video Entertainment System

Installed on short- and medium-range aircraft, this system provides: passenger visual emergency instruction (oxygen mask, life-vest), tax-free shopping advertising, flight information maps, arrival information, and short movies. Prerecorded video is shown on LCD monitors mounted as headrack display units, with sound via the cabin loudspeakers.

- **Video Tape Reproducer (VTR)**: plays video cassettes, with repeat and random-access presentation controls
- **Video System Control Unit**: manages power switching, signal source selection (VTR or information system), monitor selection, and previewing
- **Headrack Mounted Display Units**: retractable TFT screens (about 20 per aircraft) located overhead the passenger; they stow automatically if not in use or if an unexpected force is applied (e.g. a passenger's head touching the screen)

### Passenger Visual Information System (PVIS)

Supplies passengers with information on ambient flight data, times and aircraft position along the flight plan, displayed on the Passenger Entertainment System monitors. It receives data from navigation systems and ACARS. The **RCU** is the input unit, with four switches under an LCD for control, used to select menus. The **DIU computer** processes data for the stored menus and converts it into video signals for the monitors, drawing on input buses such as altitude, static air temperature, heading and drift angle, and ground speed and position.

Information that can be shown to passengers includes: airline logo/symbols, present ground speed, time to destination, present altitude, outside air temperature, local time at destination, completed flight route on scaled maps, present position on scaled maps, and points of interest along the route.

### Passenger Entertainment System (PES) and Passenger Service System (PSS)

Long-haul aircraft carry more complex systems, which may include video on individual screens, music and film soundtracks, interactive games, and in-seat telephones. Passenger Control Units and/or handsets control the PES/PSS (the reverse side of the handset is used for a satellite telephone system, where fitted). The PA system must interrupt all other inputs to loudspeakers, displays and earphones, to guarantee it captures passengers' attention.

The Passenger Service System provides reading-light control and attendant call, reducing wiring compared with conventional installations. A reading-light command from a seat's passenger control unit/handset passes through the passenger entertainment system controller to the **CIDS**, which addresses the correct passenger service unit and reading light above the seat. The CIDS and PES must work correctly together for all functions to be available.

### Matsushita System 2000E (Example PES)

System 2000E is an interactive, fully integrated passenger entertainment system with a modular design supporting overhead and in-seat video, audio, telephone and interactive services:

- **Audio**: up to 96 channels of Hi-Fi audio (up to 48 digital inputs, up to 72 analog inputs, up to 6 PA inputs)
- **Video**: up to 24 video channels, supporting video cassette players, TV tuners, passenger video information systems, video cameras and video-on-demand
- **Telephone**: air-to-ground calls, seat-to-seat calling, fax and data transmission
- **Interactive**: video games, shopping and business services, passenger information services
- **Passenger Service System interface**: reading lights, attendant call lights

**In-seat audio** is digitized using **Adaptive Differential Pulse Code Modulation (ADPCM)** techniques for data compression, giving better audio quality (especially low-frequency dynamic range) at lower bit rates than uncompressed 16-bit audio — ADPCM compresses the signal to 4 bits, allowing faster transmission.

Audio quality specifications:

| Parameter | Value |
|---|---|
| Frequency response (Hi-Fi) | 40 Hz – 15 kHz |
| Dynamic range | > 70 dB |
| Signal-to-noise ratio | > 60 dB |
| Crosstalk | > 60 dB |
| Total harmonic distortion | < 1% at 1 kHz |

Analog audio from Compact Disk Reproducers (CDRs) and Audio Reproducers (ARs), plus the aircraft PA audio, is digitized and combined with RF video signals for distribution. Key line-replaceable units include the **EVSCU** (Enhanced Video System Control Unit), **EPESC** (Enhanced Passenger Entertainment System Controller), **EADB** (Enhanced Area Distribution Box) and **IVASEB** (Integrated Video Audio Seat Electronics Box); each IVASEB demodulates the RF video signal, de-multiplexes the audio, converts it to analog, and supplies video to the seat LCD while audio goes to the remote jack module or headset. In-seat video games and interactive programs are transmitted by the **CMEU** (Cabin Passenger Management System Memory Expansion Unit) over a Token Ring LAN rather than an RF video channel.

**RF distribution** works like a home cable-TV system, supporting up to **27 channels** of modulated video plus audio on the same coaxial cable(s), combined and split out to the seat columns via EADBs.

**Network (LAN) distribution**: most System 2000E line-replaceable units communicate over a **16 Mbps Token Ring Network**, similar to an office-building LAN, carrying command/control data and requests for data, files or BITE. It must remain a closed loop (a circle) to operate correctly.

## Cabin Intercommunication Data System (CIDS)

The CIDS integrates most cabin systems for communications, indications and calls, including: passenger address, cabin and flight crew interphone, cabin illumination, evacuation signalling, lavatory smoke indication, passenger lighted signs, passenger call, service interphone, emergency lighting test, passenger reading lights/attendant work light test, pre-recorded announcement and boarding music control, passenger entertainment system, and air conditioning system controls.

The CIDS provides control, monitoring and data processing of the various cabin systems through data bus lines. Its major components are:

- **Directors**: interface between aircraft/cabin systems and the cockpit controls and indications, processing control of the cabin systems
- **Forward Attendant Panel (FAP)**: installed at the forward attendant station; controls and monitors the various cabin systems. The **Cabin Assignment Module (CAM)** plugs into the FAP and stores the cabin layout and programmable information used by the Directors
- **Decoder Encoder Unit A (DEU A)**: interfaces between the Directors and cabin systems dedicated to passenger use, connected to the Directors via data bus lines
- **Decoder Encoder Unit B (DEU B)**: interfaces between the Directors and cabin systems dedicated to cabin attendant use, connected to the Directors via data bus lines
        $cnt2$,
        8
    ) RETURNING id INTO s6_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M13.5 Electrical Power (17 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s5_id, 'Of the two sources of electrical energy used on an aircraft, magnetism (via a generator or alternator) and chemical energy (via storage batteries), storage batteries are principally used for:',
     '[{"id":"a","text":"Starting the engine and for use in emergencies","correct":true},{"id":"b","text":"Continuous normal-operation electrical supply only","correct":false},{"id":"c","text":"Powering only the cabin lighting system","correct":false}]',
     '{"B2"}'),

    (s5_id, 'In a DC generator, the ends of the rotating coil terminate in the two segments of a:',
     '[{"id":"a","text":"Split ring commutator","correct":true},{"id":"b","text":"Slip ring","correct":false},{"id":"c","text":"Zener diode assembly","correct":false}]',
     '{"B2"}'),

    (s5_id, 'Adding a second coil at right angles to the first in a DC generator, and continuing to add more coils, has the effect of:',
     '[{"id":"a","text":"Increasing the ripple frequency and smoothing the output voltage","correct":true},{"id":"b","text":"Reducing the ripple frequency and making the output rougher","correct":false},{"id":"c","text":"Converting the generator output from DC to AC","correct":false}]',
     '{"B2"}'),

    (s5_id, 'Generator fields are described as "self-excited" because:',
     '[{"id":"a","text":"The field current comes from the generator''s own armature","correct":true},{"id":"b","text":"The field current is supplied entirely by an external battery","correct":false},{"id":"c","text":"No field current is required at all","correct":false}]',
     '{"B2"}'),

    (s5_id, 'In an A-circuit generator system, the reverse-current cutout relay disconnects the generator from the aircraft bus when:',
     '[{"id":"a","text":"Generator voltage drops below battery voltage","correct":true},{"id":"b","text":"Generator voltage rises above battery voltage","correct":false},{"id":"c","text":"The engine reaches idle speed","correct":false}]',
     '{"B2"}'),

    (s5_id, 'Compared with a DC generator, a DC alternator produces its high current in the:',
     '[{"id":"a","text":"Stationary component, which is then rectified by semiconductor diodes","correct":true},{"id":"b","text":"Rotating armature, which is then rectified mechanically","correct":false},{"id":"c","text":"Field coil circuit only, with no rectification needed","correct":false}]',
     '{"B2"}'),

    (s5_id, 'The AC output of a DC alternator''s stator, arranged in a three-phase Y-connected circuit, is converted to DC by:',
     '[{"id":"a","text":"A six-diode, three-phase rectifier","correct":true},{"id":"b","text":"A single split-ring commutator","correct":false},{"id":"c","text":"A mechanical vibrating contact regulator only","correct":false}]',
     '{"B2"}'),

    (s5_id, 'A key advantage of the solid-state alternator system is that, because field current is taken from the regulated bus voltage rather than directly from the alternator output, the alternator becomes self-limiting with regard to current output, meaning that:',
     '[{"id":"a","text":"No separate current limiter is needed","correct":true},{"id":"b","text":"A reverse-current cutout relay becomes essential","correct":false},{"id":"c","text":"The alternator requires a mechanical vibrating voltage regulator","correct":false}]',
     '{"B2"}'),

    (s5_id, 'On a twin-engine aircraft with two alternators connected through their P (paralleling) terminals, if one alternator produces more current than the other, the voltage regulators respond by:',
     '[{"id":"a","text":"Decreasing field current to the high-output alternator and increasing it to the other, so the load is shared equally","correct":true},{"id":"b","text":"Shutting down the lower-output alternator completely","correct":false},{"id":"c","text":"Disconnecting both alternators from the bus simultaneously","correct":false}]',
     '{"B2"}'),

    (s5_id, 'A typical jet-aircraft AC alternator produces three-phase current normally connected in a Y-arrangement at a frequency of approximately:',
     '[{"id":"a","text":"400 Hz","correct":true},{"id":"b","text":"60 Hz","correct":false},{"id":"c","text":"1,000 Hz","correct":false}]',
     '{"B2"}'),

    (s5_id, 'The purpose of a Constant Speed Drive (CSD), or the CSD portion of an Integrated Drive Generator (IDG), is to:',
     '[{"id":"a","text":"Convert varying engine input speed into a constant output speed so the generator produces a constant frequency","correct":true},{"id":"b","text":"Increase generator output voltage as engine speed decreases","correct":false},{"id":"c","text":"Convert the generator''s AC output into DC","correct":false}]',
     '{"B2"}'),

    (s5_id, 'On the A320 example IDG, engine accessory gearbox speeds of approximately 4,500 to 9,120 RPM are converted to a constant generator speed of approximately:',
     '[{"id":"a","text":"12,000 RPM","correct":true},{"id":"b","text":"4,500 RPM","correct":false},{"id":"c","text":"24,000 RPM","correct":false}]',
     '{"B2"}'),

    (s5_id, 'If an IDG is disconnected in flight (e.g. due to oil overheat or low oil pressure), it can be reconnected:',
     '[{"id":"a","text":"Only on the ground with the engine shut down, using a mechanical reset handle","correct":true},{"id":"b","text":"Immediately in flight by pressing the IDG pushbutton again","correct":false},{"id":"c","text":"Automatically once oil temperature falls, even while the engine is windmilling","correct":false}]',
     '{"B2"}'),

    (s5_id, 'A Variable Speed Constant Frequency (VSCF) alternator system differs from a conventional CSD-driven alternator in that:',
     '[{"id":"a","text":"It uses a large DC alternator not reliant on constant input speed, converting DC to constant-frequency AC via a solid-state inverter, eliminating the need for a mechanical CSD","correct":true},{"id":"b","text":"It still requires a hydraulically operated constant speed drive between engine and generator","correct":false},{"id":"c","text":"It produces only DC output for the aircraft bus","correct":false}]',
     '{"B2"}'),

    (s5_id, 'Which pair of secondary aircraft battery types is correctly matched to its property, as described in the source text?',
     '[{"id":"a","text":"Lead-acid: specific gravity of electrolyte indicates state of charge; nickel-cadmium: cell voltage stays constant until almost fully discharged, so voltage does not indicate state of charge","correct":true},{"id":"b","text":"Lead-acid: cell voltage indicates state of charge; nickel-cadmium: specific gravity indicates state of charge","correct":false},{"id":"c","text":"Both lead-acid and nickel-cadmium cells use specific gravity as their sole state-of-charge indicator","correct":false}]',
     '{"B2"}'),

    (s5_id, 'A nickel-cadmium cell that has lost capacity due to repeated shallow discharge/recharge cycles ("cell memory") can be restored by:',
     '[{"id":"a","text":"Completely discharging it and then overcharging it to approximately 140% of its rated ampere-hour capacity (deep cycling)","correct":true},{"id":"b","text":"Adding distilled water to the electrolyte while the cell is discharged","correct":false},{"id":"c","text":"Storing the cell fully charged for several months without use","correct":false}]',
     '{"B2"}'),

    (s5_id, 'A Transformer-Rectifier Unit (TRU) on a larger aircraft typically converts:',
     '[{"id":"a","text":"115/200 volt, 400 Hz AC into 28 volt DC","correct":true},{"id":"b","text":"28 volt DC into 115/200 volt AC","correct":false},{"id":"c","text":"400 Hz AC into 60 Hz AC","correct":false}]',
     '{"B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M13.6 Equipment and Furnishings (11 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s6_id, 'In the passenger address (PA) system priority hierarchy described, which source has the highest priority?',
     '[{"id":"a","text":"Cockpit","correct":true},{"id":"b","text":"Cabin attendants","correct":false},{"id":"c","text":"Boarding music","correct":false}]',
     '{"B2"}'),

    (s6_id, 'A key safety feature of the tape reproducer in the PA system is that it:',
     '[{"id":"a","text":"Starts automatically if cabin pressure is lost","correct":true},{"id":"b","text":"Can only be started manually by the cabin attendant","correct":false},{"id":"c","text":"Shuts down automatically whenever engines are running","correct":false}]',
     '{"B2"}'),

    (s6_id, 'In the PA system''s electronic chime scheme, the "high chime" is used for:',
     '[{"id":"a","text":"A passenger call to the cabin crew","correct":true},{"id":"b","text":"The fasten seat-belt or no-smoking signs","correct":false},{"id":"c","text":"A lavatory smoke warning only","correct":false}]',
     '{"B2"}'),

    (s6_id, 'The main PA power amplifier output rating described in the source text is:',
     '[{"id":"a","text":"30 W continuous or 120 W peak","correct":true},{"id":"b","text":"5 W continuous or 20 W peak","correct":false},{"id":"c","text":"300 W continuous or 1200 W peak","correct":false}]',
     '{"B2"}'),

    (s6_id, 'The Prerecorded Announcement and Music Reproducer (PRAM) uses standard audio cassettes with 4 channels per tape; channel 3 is dedicated to:',
     '[{"id":"a","text":"The emergency announcement, repeated at intervals","correct":true},{"id":"b","text":"Boarding music only","correct":false},{"id":"c","text":"Signals marking the start position of each announcement","correct":false}]',
     '{"B2"}'),

    (s6_id, 'To match a cabin loudspeaker''s impedance to the amplifier output, each speaker is typically fitted with:',
     '[{"id":"a","text":"An impedance-matching transformer with a tapped secondary coil","correct":true},{"id":"b","text":"A second independent amplifier","correct":false},{"id":"c","text":"A freewheel diode across its terminals","correct":false}]',
     '{"B2"}'),

    (s6_id, 'Compared with main speakers in the passenger cabin, auxiliary speakers at attendant stations and galleys:',
     '[{"id":"a","text":"Reproduce only cockpit announcements and all chime sounds, not prerecorded announcements or boarding music","correct":true},{"id":"b","text":"Reproduce every announcement and boarding music exactly like the main speakers","correct":false},{"id":"c","text":"Are used exclusively for boarding music","correct":false}]',
     '{"B2"}'),

    (s6_id, 'The Headrack Mounted Display Units of a video entertainment system are designed to stow automatically when:',
     '[{"id":"a","text":"The system is not in use, or an unexpected force (such as a passenger''s head) is applied to the screen","correct":true},{"id":"b","text":"The aircraft descends below 10,000 feet","correct":false},{"id":"c","text":"The cabin lighting is dimmed for a movie","correct":false}]',
     '{"B2"}'),

    (s6_id, 'The Passenger Visual Information System (PVIS) derives its displayed data (such as altitude, ground speed, and position) from:',
     '[{"id":"a","text":"Various navigation systems and the Aircraft Communication Addressing and Reporting System (ACARS)","correct":true},{"id":"b","text":"The passenger address amplifier only","correct":false},{"id":"c","text":"The nickel-cadmium battery monitoring circuit","correct":false}]',
     '{"B2"}'),

    (s6_id, 'In the Matsushita System 2000E in-seat audio system, ADPCM is used to:',
     '[{"id":"a","text":"Digitize and compress the audio signal (e.g. from 16 bits down to 4 bits) for more efficient transmission","correct":true},{"id":"b","text":"Convert AC power into regulated DC for the seat electronics","correct":false},{"id":"c","text":"Provide the video modulation for the RF distribution system","correct":false}]',
     '{"B2"}'),

    (s6_id, 'Within the Cabin Intercommunication Data System (CIDS) architecture, the Forward Attendant Panel (FAP) is used to:',
     '[{"id":"a","text":"Control and monitor the various cabin systems from the forward attendant station","correct":true},{"id":"b","text":"Rectify AC power for the passenger entertainment system","correct":false},{"id":"c","text":"Provide the only interface between the Directors and passenger-use cabin systems","correct":false}]',
     '{"B2"}');

END $$;
