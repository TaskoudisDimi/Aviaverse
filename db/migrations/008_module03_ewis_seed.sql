-- Module 03: Electrical Fundamentals — EWIS (Electrical Wiring Interconnect System)
-- Source: IKAROS Aviation Training Center, IK M7A EWIS Presentation; EASA Part-66 M03 / FAA AC 25-27

DO $$
DECLARE
    m03_id INT;
    s1_id  INT;
    s2_id  INT;
    s3_id  INT;
    s4_id  INT;
BEGIN
    SELECT id INTO m03_id FROM easa_modules WHERE code = 'M03';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M03.1') THEN
        RAISE NOTICE 'M03 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 03.1: EWIS — Definition and Components
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m03_id, 'M03.1', 'EWIS — Definition and Components',
        $cnt$
# EWIS — Definition and Components

## What is EWIS?

**EWIS** stands for **Electrical Wiring Interconnect System**. It is the complete network of electrical wiring and associated components installed in an aircraft that carry electrical energy or signals between two or more termination points.

EWIS includes all the wiring, connections and associated items that form the interconnect system for the aircraft. It is not limited to power wiring — it also covers data bus cables, coaxial cables, fibre optic cables, and control cables.

### EWIS Components

| Component | Description |
|-----------|-------------|
| **Wire / Cable** | The conductor that carries electrical current or signal |
| **Cannon Plugs (Connectors)** | Multi-pin circular connectors used to join wiring harnesses |
| **Modular Blocks (Terminal Blocks)** | Fixed connection points where individual wires terminate |
| **Clamps** | Secure wire bundles to aircraft structure at regular intervals |
| **Terminal Strips** | Strip-mounted connection points; distribute power or signal to multiple circuits |
| **Conduit / Sleeving** | Protective covering over wire runs exposed to abrasion or heat |
| **Circuit Breakers** | Overcurrent protection devices; also serve as isolation means |
| **Ground Points** | Bonding points that provide a return path for current |

### Wiring Harnesses

Individual wires are typically grouped into **harnesses** (looms). A harness:
- Is bound together with lacing cord, cable ties, or expandable sleeving
- Follows a predetermined route through the aircraft structure
- Is supported at defined intervals by **clamps** (typically every 8–12 inches on large-diameter bundles)

### Connector Types

**Cannon plugs** (MIL-DTL-38999 or similar) are the most common aircraft connector:
- Circular, screw-coupled or push-pull
- Contain male (pins) and female (sockets) contacts
- Rated for vibration, temperature extremes, and fluid contamination
- Individual contacts are crimped to wire ends — soldering is generally avoided in modern aircraft

**Modular blocks** allow discrete wire-to-wire connections without unplugging a whole harness. They are used where individual circuits must be isolated for testing or replacement.

## Wire Identification

Each wire in an aircraft EWIS is marked with a **wire number** (part of the aircraft's wiring diagram) at intervals of approximately 15 inches or at each connector. The wire number encodes:
- The system it belongs to (e.g., E = electrical power)
- The circuit number
- The wire segment number
- The wire gauge (AWG)

## Wire Materials and Gauges

Most aircraft wiring uses **copper** conductors (pure copper or copper alloys) with insulation rated for the operating environment:
- **PTFE (Teflon)** — high temperature, chemical resistant; used in engine zones
- **Polyimide (Kapton)** — very light and thin; found on older aircraft, prone to cracking
- **XLETFE (Tefzel)** — common modern aircraft standard; good balance of weight and durability
- **PVC** — low cost; only in benign environments (ground support equipment)

Wire gauges follow AWG (American Wire Gauge). Smaller AWG number = thicker wire = higher current capacity.

| AWG | Approx Diameter (mm) | Typical Use |
|-----|---------------------|-------------|
| 22  | 0.64 | Signal circuits, avionics buses |
| 20  | 0.81 | Light loads, instrumentation |
| 16  | 1.29 | Medium loads, lighting |
| 12  | 2.05 | High-current feeders |
| 4   | 5.19 | Bus bars, engine starters |
        $cnt$,
        1
    ) RETURNING id INTO s1_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 03.2: EWIS History and the ATSRAC Programme
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m03_id, 'M03.2', 'EWIS History and the ATSRAC Programme',
        $cnt2$
# EWIS History and the ATSRAC Programme

## Background: Why EWIS Became a Priority

For many decades, aircraft electrical wiring received relatively little regulatory attention. Wiring was considered a secondary system — reliable once installed and rarely modified. This view changed dramatically in the 1990s following a series of fatal accidents with wiring as a contributing factor.

### TWA Flight 800 (1996)

On 17 July 1996, TWA Flight 800, a Boeing 747-100, crashed into the Atlantic Ocean off Long Island, New York, shortly after departure from JFK. All 230 people on board were killed.

The National Transportation Safety Board (NTSB) determined that the probable cause was an **explosion of the centre-wing fuel tank (CWT)**, most likely ignited by a short circuit that introduced excessive voltage into the fuel quantity indication system (FQIS) wiring running through the tank.

Key findings:
- Ageing wiring had degraded insulation
- Wires were routed through the fuel tank (an inherently hazardous location)
- The FQIS wiring was not adequately separated from higher-voltage sources

This accident forced regulators and industry to re-evaluate how aging aircraft wiring was inspected, maintained, and modified.

## The Gore Committee and ATSRAC

Following TWA 800, the White House Commission on Aviation Safety and Security (the **Gore Committee**) recommended a comprehensive study of wiring in ageing transport aircraft.

In response, the FAA established the **Aging Transport Systems Rulemaking Advisory Committee (ATSRAC)** in 1998. ATSRAC's mandate was to:
1. Survey the condition of wiring in in-service ageing aircraft
2. Identify systemic problems
3. Recommend regulatory and industry changes

### The ATSRAC Intrusive Inspection Programme

ATSRAC conducted **intrusive inspections** of **39 aircraft** (a mix of models from major carriers). These aircraft were chosen because they were representative of the ageing fleet in service at the time.

#### Findings Summary

| Statistic | Value |
|-----------|-------|
| Total aircraft inspected | 39 |
| Total discrepancies found | 2,256 |
| Significant discrepancies | 73 |
| Average discrepancies per aircraft | ~58 |

**Most common defects found:**

| Category | Percentage of Discrepancies |
|---------|-----------------------------|
| Bad clamp conditioning / sizing / spacing | **43%** |
| Inadequate wire bundle clearance | **29%** |
| Missing or improper wire bundle support | ~12% |
| Contamination (fluid intrusion, corrosion) | ~8% |
| Damaged or chafed insulation | ~5% |
| Other | ~3% |

These findings showed that even aircraft that had passed routine maintenance checks harboured significant wiring deficiencies — deficiencies that were invisible without intrusive access.

### HWG-10 Recommendations

ATSRAC formed several Harmonisation Working Groups. **HWG-10** specifically addressed EWIS. Its recommendations led to:

**For the FAA:**
- Mandate enhanced zonal analysis of EWIS during design (requires manufacturers to identify all EWIS in each zone and assess failure consequences)
- Issue Airworthiness Directives (ADs) for specific ageing wire issues on in-service aircraft
- Require maintenance review boards (MRBs) to include EWIS inspection tasks

**For industry / maintenance organisations:**
- Adopt enhanced maintenance procedures (task-card driven EWIS checks)
- Train maintenance personnel on EWIS-specific skills (correct wire repair techniques, harness inspection, connector servicing)
- Ensure proper documentation of all wiring modifications

**For training:**
- Develop dedicated EWIS training modules (leading directly to the content you are studying now)
- Ensure all certifying staff who work on aircraft wiring understand EWIS principles and the consequences of poor EWIS maintenance

## Outcome: Regulatory Changes

ATSRAC's work culminated in:
- **FAA Final Rule: Enhanced Airworthiness Programme for Airplane Systems (EAPAS)** — mandating EWIS-specific maintenance programme items for transport category aircraft (14 CFR Part 25, Subpart H — Subpart added specifically for EWIS)
- **EASA CS-25 Subpart H** — the European equivalent, requiring all new large aircraft designs to comply with EWIS standards
- **AC 25-27** (FAA Advisory Circular) and **AMC 25.1701** (EASA) — providing acceptable means of compliance for EWIS design and maintenance
        $cnt2$,
        2
    ) RETURNING id INTO s2_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 03.3: EWIS Inspection, Defects, and Maintenance
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m03_id, 'M03.3', 'EWIS Inspection, Defects, and Maintenance',
        $cnt3$
# EWIS Inspection, Defects, and Maintenance

## Why EWIS Inspection is Difficult

Unlike a cracked structural member or a leaking hydraulic line, EWIS defects are often:
- **Hidden** — wire bundles are routed behind panels, under floors, and inside conduits
- **Gradual** — insulation degradation takes years before it causes a fault
- **Intermittent** — a chafe fault may only manifest under vibration or thermal cycling
- **Multiple-fault dependent** — in many designs, a single fault is tolerable; only certain combinations produce a hazardous condition

This is why routine visual checks have historically missed significant wiring problems, and why **intrusive inspections** are now mandated.

## Common EWIS Defects

### 1. Clamp Defects (43% of ATSRAC findings)

Clamps secure wire bundles to aircraft structure. Defects include:
- **Wrong size clamp**: a clamp too large allows the bundle to move (chafing against structure); too small crushes the insulation
- **Poor spacing**: clamps more than 24 inches apart allow a bundle to sag and contact hot pipes, sharp edges, or moving parts
- **Missing cushion liner**: the rubber/neoprene liner inside the clamp prevents wire insulation damage; a missing liner causes direct metal-to-insulation contact
- **Incorrect positioning**: clamps mounted at an angle allow bundles to twist and chafe at the clamp edge

**Correct practice**: clamps should be selected for the bundle diameter (with light grip — the bundle should not be compressed), lined with appropriate grommet edging, and spaced no more than the AMM-specified interval.

### 2. Inadequate Clearance (29% of ATSRAC findings)

Wire bundles must maintain minimum clearance from:
- **Moving parts** (control cables, actuators, flight control rods): typically ≥ 0.5 inch minimum; bundles must not contact under any operating condition
- **Hot surfaces** (hydraulic lines, pneumatic ducts, engine bleed air): minimum clearance per AMM, often 3–6 inches; insulation breaks down rapidly when in contact with heat
- **Sharp edges**: edges of structure must be deburred and covered with grommet edging; a single sharp edge can penetrate wire insulation within a few hundred flight hours of vibration

### 3. Insulation Damage

- **Chafing**: continuous contact with a surface gradually wears through insulation → arc fault potential
- **Cracking (Kapton)**: Kapton (polyimide) insulation becomes brittle with age and may crack under flexing even without physical contact; this is why many operators have proactively replaced Kapton-insulated harnesses
- **Fluid contamination**: hydraulic fluid, coolant, and water degrade insulation; fluid should never be allowed to pool in wire routing zones

### 4. Connector Defects

- **Moisture intrusion**: connectors not properly backshelled or potted allow moisture wicking up wire strands (capillary action) and into the connector, causing corrosion and increased resistance
- **Bent/pushed-back pins**: incorrect mating of a connector can push contacts back into the shell, causing intermittent open circuits
- **Pin-to-socket resistance**: high resistance in a contact joint causes local heating; should be checked with a milliohm meter

## EWIS Inspection Techniques

### Visual Inspection
All EWIS maintenance starts with a thorough visual inspection:
1. Remove access panels and open wire bundle supports
2. Check clamp sizing, spacing, liner condition, and mounting
3. Check bundle clearances from all adjacent structure, pipes, and moving parts
4. Check insulation for chafing, cracks, heat damage, or fluid contamination
5. Check connector backshells for tightness and absence of corrosion; check strain relief

### Continuity and Insulation Resistance Tests

- **Continuity test** (low resistance measurement): confirms the wire is intact end-to-end
- **Insulation resistance (IR) test** (megohmmeter, typically 500 V DC): measures resistance between conductors and from conductors to aircraft ground; typical minimum acceptable value ≥ 1 MΩ (per AMM; often much higher for critical circuits)
- **High-potential (HiPot) test**: applies voltage above operating voltage to stress insulation; used after major wire bundle replacement

### Arc Fault Circuit Interrupters (AFCIs)

Modern aircraft (and retrofit programmes for older types) use AFCIs. Unlike conventional circuit breakers that trip on sustained overcurrent, an AFCI detects the characteristic waveform of an arcing fault and opens the circuit within milliseconds — before a fire can start. This technology directly addresses the type of fault that contributed to TWA 800.

## Wire Repair

When wire damage is found:
- **Splice connectors** (environmental splices) are used to repair damaged wire segments; must be rated for the environment
- A splice introduces a potential weak point and must be documented in the aircraft's wiring record
- No more than one splice per wire segment between connectors (per most AMMs)
- Soldered joints are generally prohibited on aircraft (vibration causes solder to crack and fail); crimped connections are standard

## Documentation

Every EWIS modification or repair must be:
- Recorded on the aircraft's technical record / work order
- Cross-referenced to the relevant Aircraft Wiring Manual (AWM) or Aircraft Maintenance Manual (AMM)
- Reflected in updated wiring diagrams if permanent
        $cnt3$,
        3
    ) RETURNING id INTO s3_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 03.4: EWIS Regulations and Future Requirements
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m03_id, 'M03.4', 'EWIS Regulations and Future Requirements',
        $cnt4$
# EWIS Regulations and Future Requirements

## Current Regulatory Framework

### FAA (USA)

| Regulation | Scope |
|-----------|-------|
| 14 CFR Part 25 Subpart H (§§25.1701–25.1733) | Design requirements for EWIS in new type certificated aircraft |
| 14 CFR Part 121.1109 | Enhanced Airworthiness Programme for Airplane Systems (EAPAS) — operators must have an approved EWIS maintenance programme |
| 14 CFR Part 129.109 | Foreign operators using US-registered aircraft — same EAPAS requirement |
| AC 25-27 | Acceptable means of compliance for 14 CFR Part 25 Subpart H |

**Key 14 CFR §25.1703 definitions:**
- EWIS encompasses wiring, cables, connectors, and associated components that form the interconnection between two or more termination points
- The definition specifically **excludes** main structural components (wings, fuselage) that happen to carry electrical bonding, but **includes** bonding jumpers and ground straps

### EASA (Europe)

| Regulation | Scope |
|-----------|-------|
| CS-25 Subpart H (25.1701–25.1733) | Mirrors FAA Subpart H for EASA type-certificated aircraft |
| AMC 25.1703 | Acceptable means of compliance defining EWIS components |
| Part-M / Part-145 | Maintenance organisations must ensure their EWIS procedures are approved and staff are trained |

Under **Part-145**, maintenance organisations working on EWIS must:
1. Have approved procedures in their MOE (Maintenance Organisation Exposition) for EWIS repairs and modifications
2. Ensure certifying staff hold an appropriate Part-66 licence and type training that includes EWIS

### Relationship to Ageing Aircraft Programmes

Aircraft beyond a certain age or number of flight cycles are subject to **Supplemental Structural Inspection Documents (SSIDs)** and **Corrosion Prevention and Control Programmes (CPCPs)**. EWIS inspection tasks are integrated into these programmes as part of the **Maintenance Review Board (MRB) process**.

## Enhanced Zonal Analysis Procedure (EZAP)

The **Enhanced Zonal Analysis Procedure** is a structured method introduced after ATSRAC to evaluate every zone of an aircraft for EWIS risks. For each zone, the operator/manufacturer must:

1. Identify all EWIS components present
2. Identify all potential ignition sources (hot parts, sparks) and flammable materials (fuel vapour, hydraulic fluid) in the zone
3. Assess whether any single EWIS failure could create an ignition source near a flammable material
4. Add or modify maintenance tasks to reduce the risk to an acceptable level

EZAP applies to all large transport aircraft undergoing major modification and to all new type certifications after the rule was introduced.

## Future Requirements and Trends

### More Electric Aircraft (MEA) / All Electric Aircraft (AEA)

Modern aircraft (Boeing 787, Airbus A350) and future designs replace pneumatic and hydraulic systems with electrically powered equivalents. This dramatically **increases** the amount of EWIS on board:
- Higher voltages (270 V DC, 540 V DC, ±270 V DC) compared to traditional 28 V DC / 115 V AC systems
- Higher currents in power feeders
- More complex data bus and fibre optic networks (AFDX, ARINC 664)

Consequence: EWIS maintenance becomes **even more safety-critical** and the consequences of EWIS failures more severe.

### High-Voltage DC Systems

With 270 V DC and higher architectures, arc flash energy is significantly higher than in legacy 28 V systems. Industry and regulators are developing:
- New AFCI standards for high-voltage DC arcs
- Enhanced PPE requirements for EWIS work on MEA aircraft
- Updated wire sizing standards that account for higher voltage stress on insulation

### EWIS Training Requirements

EASA and the FAA have both signalled that dedicated EWIS training (not just generic electrical training) will be expected for all Part-66 / Part-147 programmes:
- Understanding of EWIS principles, inspection, and repair
- Knowledge of the regulatory background (ATSRAC, EAPAS)
- Practical skills in connector servicing, wire splicing, and harness inspection

This module is a direct response to that requirement — the content here aligns with the IKAROS Aviation Training Centre M7A EWIS syllabus and the requirements of EASA Part-66 Module 7 (Maintenance Practices).

## Key Figures to Remember

| Fact | Value |
|------|-------|
| ATSRAC aircraft surveyed | 39 |
| Total discrepancies found | 2,256 |
| Significant discrepancies | 73 |
| Most common defect (clamps) | 43% of all findings |
| Second most common (clearance) | 29% of all findings |
| TWA 800 accident year | 1996 |
| ATSRAC established | 1998 |
| Typical insulation resistance minimum | ≥ 1 MΩ |
| Max clamp spacing (general guidance) | 24 inches |
        $cnt4$,
        4
    ) RETURNING id INTO s4_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M03.1 EWIS Definition and Components (12 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s1_id, 'EWIS stands for:',
     '[{"id":"a","text":"Electrical Wiring Inspection System","correct":false},{"id":"b","text":"Electrical Wiring Interconnect System","correct":true},{"id":"c","text":"Enhanced Wiring Integration Standard","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'Which of the following is NOT typically considered an EWIS component?',
     '[{"id":"a","text":"Circuit breaker","correct":false},{"id":"b","text":"Cannon plug connector","correct":false},{"id":"c","text":"Aircraft main structural spar","correct":true}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'Cannon plugs used in aircraft wiring are most commonly connected using:',
     '[{"id":"a","text":"Soldered joints","correct":false},{"id":"b","text":"Crimped contacts","correct":true},{"id":"c","text":"Welded contacts","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'What is the primary purpose of clamps in an EWIS installation?',
     '[{"id":"a","text":"To increase wire current capacity","correct":false},{"id":"b","text":"To secure wire bundles to aircraft structure at regular intervals","correct":true},{"id":"c","text":"To insulate wires from each other","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'A modular block (terminal block) is used to:',
     '[{"id":"a","text":"Measure insulation resistance","correct":false},{"id":"b","text":"Provide discrete wire-to-wire connection points","correct":true},{"id":"c","text":"Protect wires from electromagnetic interference","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'Which wire insulation material is associated with cracking in ageing aircraft?',
     '[{"id":"a","text":"PTFE (Teflon)","correct":false},{"id":"b","text":"XLETFE (Tefzel)","correct":false},{"id":"c","text":"Polyimide (Kapton)","correct":true}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'In the AWG (American Wire Gauge) system, a wire with a SMALLER gauge number has:',
     '[{"id":"a","text":"A smaller diameter and lower current capacity","correct":false},{"id":"b","text":"A larger diameter and higher current capacity","correct":true},{"id":"c","text":"The same current capacity regardless of diameter","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'EWIS includes which of the following cables?',
     '[{"id":"a","text":"Power cables only","correct":false},{"id":"b","text":"Data bus and fibre optic cables as well as power cables","correct":true},{"id":"c","text":"Hydraulic control cables","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'Wire identification markings on an aircraft EWIS should appear approximately every:',
     '[{"id":"a","text":"6 inches","correct":false},{"id":"b","text":"15 inches","correct":true},{"id":"c","text":"36 inches","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'PTFE (Teflon) insulated wire is preferred in engine zones because it:',
     '[{"id":"a","text":"Is the cheapest available insulation","correct":false},{"id":"b","text":"Offers high temperature resistance and chemical resistance","correct":true},{"id":"c","text":"Is the lightest insulation available","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'A terminal strip is used primarily to:',
     '[{"id":"a","text":"Test wire continuity","correct":false},{"id":"b","text":"Distribute power or signal to multiple circuits from a common connection point","correct":true},{"id":"c","text":"Protect wires from mechanical damage","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'Soldering is generally avoided in aircraft EWIS connections because:',
     '[{"id":"a","text":"Solder is too expensive for aircraft use","correct":false},{"id":"b","text":"Vibration causes solder joints to crack and fail","correct":true},{"id":"c","text":"Soldering cannot be done on copper wire","correct":false}]',
     '{"B1.1","B1.3","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M03.2 EWIS History and ATSRAC (14 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s2_id, 'The TWA Flight 800 accident occurred in:',
     '[{"id":"a","text":"1988","correct":false},{"id":"b","text":"1996","correct":true},{"id":"c","text":"2001","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'The probable cause of the TWA 800 accident was:',
     '[{"id":"a","text":"A bomb in the cargo hold","correct":false},{"id":"b","text":"An explosion in the centre-wing fuel tank ignited by a wiring short circuit","correct":true},{"id":"c","text":"Structural failure of the wing","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'ATSRAC stands for:',
     '[{"id":"a","text":"Aging Transport Systems Rulemaking Advisory Committee","correct":true},{"id":"b","text":"Aviation Transport Safety Review and Control","correct":false},{"id":"c","text":"Aircraft Technical Systems Regulatory Audit Committee","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'ATSRAC was established by the FAA in:',
     '[{"id":"a","text":"1994","correct":false},{"id":"b","text":"1998","correct":true},{"id":"c","text":"2002","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'How many aircraft were inspected in the ATSRAC intrusive inspection programme?',
     '[{"id":"a","text":"12","correct":false},{"id":"b","text":"39","correct":true},{"id":"c","text":"127","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'How many total discrepancies were found in the ATSRAC inspections?',
     '[{"id":"a","text":"256","correct":false},{"id":"b","text":"2,256","correct":true},{"id":"c","text":"22,560","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'How many SIGNIFICANT discrepancies did ATSRAC identify?',
     '[{"id":"a","text":"7","correct":false},{"id":"b","text":"73","correct":true},{"id":"c","text":"730","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'The most common discrepancy found in the ATSRAC inspections was:',
     '[{"id":"a","text":"Damaged wire insulation","correct":false},{"id":"b","text":"Bad clamp conditioning, sizing, or spacing","correct":true},{"id":"c","text":"Contaminated connectors","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'What percentage of ATSRAC discrepancies were related to clamp problems?',
     '[{"id":"a","text":"29%","correct":false},{"id":"b","text":"43%","correct":true},{"id":"c","text":"58%","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'What percentage of ATSRAC discrepancies were due to inadequate wire bundle clearance?',
     '[{"id":"a","text":"43%","correct":false},{"id":"b","text":"29%","correct":true},{"id":"c","text":"12%","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'The Gore Committee was formed to:',
     '[{"id":"a","text":"Investigate structural fatigue in ageing aircraft","correct":false},{"id":"b","text":"Review aviation safety and security, including aircraft wiring","correct":true},{"id":"c","text":"Establish new pilot training standards","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'HWG-10 was a working group within ATSRAC that specifically addressed:',
     '[{"id":"a","text":"Fuel system safety","correct":false},{"id":"b","text":"EWIS maintenance and training","correct":true},{"id":"c","text":"Structural inspection programmes","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'Following ATSRAC recommendations, the FAA introduced which programme for operators?',
     '[{"id":"a","text":"CAMP — Continuous Airworthiness Maintenance Programme","correct":false},{"id":"b","text":"EAPAS — Enhanced Airworthiness Programme for Airplane Systems","correct":true},{"id":"c","text":"SSID — Supplemental Structural Inspection Document","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'The ATSRAC inspection findings demonstrated that routine maintenance checks:',
     '[{"id":"a","text":"Were sufficient to detect all significant wiring problems","correct":false},{"id":"b","text":"Often missed significant wiring deficiencies not visible without intrusive access","correct":true},{"id":"c","text":"Were more thorough than intrusive inspections","correct":false}]',
     '{"B1.1","B1.3","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M03.3 EWIS Inspection and Maintenance (14 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s3_id, 'The minimum insulation resistance typically acceptable for aircraft wiring circuits is:',
     '[{"id":"a","text":"100 kΩ","correct":false},{"id":"b","text":"1 MΩ","correct":true},{"id":"c","text":"10 GΩ","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'An insulation resistance test is performed with a:',
     '[{"id":"a","text":"Multimeter on AC range","correct":false},{"id":"b","text":"Megohmmeter (typically 500 V DC)","correct":true},{"id":"c","text":"Oscilloscope","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'What is the main purpose of an Arc Fault Circuit Interrupter (AFCI)?',
     '[{"id":"a","text":"To protect wires from overcurrent by tripping at a set amperage","correct":false},{"id":"b","text":"To detect and interrupt an arcing fault before a fire can start","correct":true},{"id":"c","text":"To regulate voltage in power distribution systems","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'Clamp defects accounted for what percentage of the ATSRAC discrepancies?',
     '[{"id":"a","text":"12%","correct":false},{"id":"b","text":"29%","correct":false},{"id":"c","text":"43%","correct":true}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'A wire bundle clamp is selected that is too LARGE for the bundle. The primary risk is:',
     '[{"id":"a","text":"Crushing the wire insulation","correct":false},{"id":"b","text":"The bundle moving freely, causing chafing against aircraft structure","correct":true},{"id":"c","text":"Increased electrical resistance","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'Wire bundles must maintain a minimum clearance from moving parts (control cables, actuators). A typical minimum is:',
     '[{"id":"a","text":"0.1 inch","correct":false},{"id":"b","text":"0.5 inch","correct":true},{"id":"c","text":"3 inches","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'Kapton (polyimide) wiring is a concern in ageing aircraft because:',
     '[{"id":"a","text":"It catches fire easily","correct":false},{"id":"b","text":"It becomes brittle with age and may crack when flexed","correct":true},{"id":"c","text":"It has very high electrical resistance","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'When moisture enters a connector through capillary action, it causes:',
     '[{"id":"a","text":"Increased insulation resistance","correct":false},{"id":"b","text":"Corrosion and increased contact resistance","correct":true},{"id":"c","text":"Reduced conductor resistance","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'Which type of test applies a voltage above operating voltage to stress-test wire insulation?',
     '[{"id":"a","text":"Continuity test","correct":false},{"id":"b","text":"Insulation resistance test","correct":false},{"id":"c","text":"High-potential (HiPot) test","correct":true}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'How many splices are typically permitted per wire segment between connectors?',
     '[{"id":"a","text":"None","correct":false},{"id":"b","text":"One","correct":true},{"id":"c","text":"Three","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'The general maximum clamp spacing guidance is:',
     '[{"id":"a","text":"12 inches","correct":false},{"id":"b","text":"24 inches","correct":true},{"id":"c","text":"48 inches","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'Hydraulic fluid contamination on wire bundles is hazardous primarily because:',
     '[{"id":"a","text":"It increases wire weight excessively","correct":false},{"id":"b","text":"It degrades wire insulation over time","correct":true},{"id":"c","text":"It creates a short circuit immediately on contact","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'Pin-to-socket contact resistance in a connector is checked using:',
     '[{"id":"a","text":"A megohmmeter","correct":false},{"id":"b","text":"A milliohm meter","correct":true},{"id":"c","text":"A HiPot tester","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'After an EWIS repair, the work must be:',
     '[{"id":"a","text":"Left undocumented if the repair was minor","correct":false},{"id":"b","text":"Recorded in the aircraft technical records and cross-referenced to the AMM","correct":true},{"id":"c","text":"Reported only if the aircraft is returned to service overseas","correct":false}]',
     '{"B1.1","B1.3","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M03.4 EWIS Regulations and Future Requirements (12 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s4_id, 'The FAA regulation that introduced EWIS design requirements for new transport aircraft is:',
     '[{"id":"a","text":"14 CFR Part 25 Subpart H","correct":true},{"id":"b","text":"14 CFR Part 121.1109","correct":false},{"id":"c","text":"14 CFR Part 43","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s4_id, 'The EASA equivalent to FAA 14 CFR Part 25 Subpart H for EWIS design is:',
     '[{"id":"a","text":"CS-25 Subpart F","correct":false},{"id":"b","text":"CS-25 Subpart H (25.1701–25.1733)","correct":true},{"id":"c","text":"Part-M Subpart D","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s4_id, 'The Enhanced Zonal Analysis Procedure (EZAP) requires that for each aircraft zone:',
     '[{"id":"a","text":"EWIS components are listed and ignition/flammable material risks are assessed","correct":true},{"id":"b","text":"All wiring is replaced every 10 years","correct":false},{"id":"c","text":"AFCI devices are fitted to every circuit","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s4_id, 'Under Part-145, a maintenance organisation working on EWIS must:',
     '[{"id":"a","text":"Hold a specific EWIS licence separate from Part-145 approval","correct":false},{"id":"b","text":"Have approved EWIS procedures in their MOE and ensure staff are trained","correct":true},{"id":"c","text":"Use only the manufacturer''s own maintenance staff for any wiring work","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s4_id, 'In More Electric Aircraft (MEA) designs, the amount of EWIS on board compared to conventional aircraft is:',
     '[{"id":"a","text":"Significantly reduced","correct":false},{"id":"b","text":"About the same","correct":false},{"id":"c","text":"Dramatically increased","correct":true}]',
     '{"B1.1","B1.3","B2"}'),

    (s4_id, 'The Boeing 787 and Airbus A350 use high-voltage DC systems. The primary challenge for EWIS maintenance is:',
     '[{"id":"a","text":"Lower arc flash energy compared to legacy 28 V systems","correct":false},{"id":"b","text":"Significantly higher arc flash energy requiring updated AFCI standards and enhanced PPE","correct":true},{"id":"c","text":"Less wiring overall, making inspection easier","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s4_id, 'EAPAS (Enhanced Airworthiness Programme for Airplane Systems) applies to:',
     '[{"id":"a","text":"Only newly manufactured aircraft","correct":false},{"id":"b","text":"Operators of ageing transport category aircraft","correct":true},{"id":"c","text":"Only military aircraft","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s4_id, 'The wire range 270 V DC is associated with which type of aircraft architecture?',
     '[{"id":"a","text":"Legacy transport aircraft (pre-1980s)","correct":false},{"id":"b","text":"More Electric Aircraft (MEA) power distribution systems","correct":true},{"id":"c","text":"General aviation piston aircraft","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s4_id, 'Which regulatory document provides acceptable means of compliance for EWIS design requirements under EASA?',
     '[{"id":"a","text":"AMC 25.1703","correct":true},{"id":"b","text":"AD 2001-15-09","correct":false},{"id":"c","text":"Part-66 Appendix I","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s4_id, 'Under CS-25 Subpart H, the definition of EWIS specifically EXCLUDES:',
     '[{"id":"a","text":"Data bus cables","correct":false},{"id":"b","text":"Bonding jumpers","correct":false},{"id":"c","text":"Main structural components that carry electrical bonding (e.g. wing spar)","correct":true}]',
     '{"B1.1","B1.3","B2"}'),

    (s4_id, 'EWIS inspection tasks are integrated into the aircraft maintenance programme through:',
     '[{"id":"a","text":"The Maintenance Review Board (MRB) process","correct":true},{"id":"b","text":"The aircraft''s Flight Manual","correct":false},{"id":"c","text":"Annual airworthiness reviews only","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s4_id, 'Which data bus protocol is used in modern More Electric Aircraft such as the Airbus A380/A350 for avionics networking?',
     '[{"id":"a","text":"ARINC 429","correct":false},{"id":"b","text":"AFDX / ARINC 664","correct":true},{"id":"c","text":"RS-232","correct":false}]',
     '{"B1.1","B1.3","B2"}');

END $$;
