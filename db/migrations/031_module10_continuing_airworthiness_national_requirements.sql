-- Module 10: Aviation Legislation (Common) — Continuing Airworthiness, Applicable National and International Requirements
-- Source: EASA Part-66 Module 10 official textbook (IKAROS Aviation Training Centre, IK02R5, Issue Nov.18)

DO $$
DECLARE
    m10_id INT;
    s6_id  INT;
    s7_id  INT;
BEGIN
    SELECT id INTO m10_id FROM easa_modules WHERE code = 'M10';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M10.6') THEN
        RAISE NOTICE 'M10.6/M10.7 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 10.6: Continuing Airworthiness
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m10_id, 'M10.6', 'Continuing Airworthiness',
        $cnt$
# Continuing Airworthiness

## Annex I to Regulation (EC) No. 1321/2014 (Part-M)

Part-M deals with the **airworthiness management** of aircraft registered in an EU member state. All applicable aircraft have been subject to its provisions since **28 September 2008**. Prior to this date, JAR-OPS Sub Part M contained much of this detail. Where Part-M differs is that it now also contains regulations for independent **Continuing Airworthiness Management Organisations (CAMO)** and introduces the concept of the **non-expiring Certificate of Airworthiness** and the **Airworthiness Review Certificate (ARC)**.

ARO.OPS now contains a much reduced Sub Part-M — all previous contents of Sub Part-M have been transferred to Part-M.

## Part-M In Relation To Maintenance of Aircraft

Part-M is **Annex I to EASA Regulation (EC) No. 1321/2014**. It regulates the matters required for aircraft to remain continuously airworthy. In particular, it manages maintenance with special regard to contracts for maintenance to Part-145 companies.

The Part-M Sub Part G **Continuing Airworthiness Management Organisation (CAMO)** is the interface between the owner and any Part-145 organisation that it may let a contract to. If the Part-145 organisation is internal, a service level agreement must be included within the Part-M Exposition. For one-off tasks (e.g. to recover an aircraft), individual work orders can be used.

## Relationship between CAMO, Operator and Maintenance Organisation

- If an operator seeks an ARO.OPS approval, they must simultaneously submit a Part-M exposition. **CAT operators cannot have ARO.OPS without Part-M.**
- **The CAT operator must have his own CAMO.**
- Private owners of large aircraft (**> 5700 kg MTOW**) can contract a CAMO to act on their behalf. The CAMO will be approved under Part-M Sub Part G.
- All CAT aircraft, twin-engine helicopters and large aircraft must be managed by a CAMO approved in accordance with Part-M Sub Part G.
- Light non-CAT aircraft must be managed for airworthiness in accordance with Part-M Sub Part C — this can be carried out by the owner, a licensed engineer, or a CAMO.
- The owner or operator of an aircraft is responsible for its airworthiness, but it is acceptable for contracts to be raised showing that the licensed engineer (for light aircraft) or the CAMO is assuming responsibility for airworthiness.

## Relationship between Part-21 Design/Production Organisations and the Operator/Part-M/Part-145 Organisation

Part-21 requires that Design Organisation Approval (DOA) and Production Organisation Approval (POA) holders design and build in accordance with the certification standards within Part-21 (Certification Specifications (CS) "codes"). In addition, they are also required to provide sufficient information and support to the operator to ensure continued airworthiness.

### Instructions for Continued Airworthiness

The holder of the type-certificate or restricted type-certificate shall furnish at least one set of complete instructions for continued airworthiness (descriptive data and accomplishment instructions) to each known owner of an aircraft, engine or propeller, upon delivery or upon issue of the first certificate of airworthiness, whichever occurs later, and thereafter make those instructions available on request.

The availability of some manuals dealing with overhaul or other heavy maintenance may be delayed until after the product enters service, but must be available before the product reaches the relevant age or flight-hours/cycles. Changes to the instructions for continued airworthiness shall be made available to all known operators, and a programme showing how such changes are distributed shall be submitted to the Agency.

## Sub Part B — Accountability

**M.A.201 — Responsibilities**

The owner is responsible for the continuing airworthiness of an aircraft and shall ensure that no flight takes place unless:
- The aircraft is in an airworthy condition
- Operational and emergency equipment is installed and serviceable
- The airworthiness certificate remains valid
- Maintenance is performed in accordance with the maintenance programme

When an aircraft is leased, the owner's responsibility transfers to the lessee if the lessee is stipulated on the registration document, or it is detailed in the leasing contract. Any person or organisation performing maintenance is responsible for the tasks performed.

### Pre-flight Servicing

The pilot-in-command or, for commercial air transport, the operator, is responsible for the satisfactory accomplishment of the pre-flight inspection. It must be carried out by the pilot or another qualified person, but **need not** be carried out by an approved maintenance organisation or by Part-66 certifying staff.

### Contracting of CAMO Organisations by Owners

The owner of an aircraft may contract continuing-airworthiness tasks to an approved CAMO (Sub Part G) — the CAMO then assumes responsibility for proper accomplishment of these tasks. For **large aircraft**, a written contract shall be made in accordance with **Appendix I to Part-M**.

**AMC M.A.201 (h) — additional points:**
- Reference to "aircraft" includes components fitted or intended to be fitted to it.
- Ground de-icing and anti-icing activities do **not** require a Part-145 approval.
- The operator is responsible for determining what maintenance is required, when, by whom and to what standard.
- An operator should have adequate knowledge of design status (type specification, options, ADs, modifications) and required/performed maintenance, adequately documented to support the Compliance Monitoring System.
- Sub-contracted continuing airworthiness management tasks remain an integral part of the operator's M.A. Sub Part G approval — the operator remains ultimately accountable.
- Sub-contracted tasks should normally be limited to: AD analysis and planning; service bulletin analysis; planning of maintenance; reliability/engine health monitoring; maintenance programme development and amendments; and other activities agreed by the competent authority.
- With the exception of engines and APUs, contracts would normally be limited to **one organisation per aircraft type** for any combination of activities.

### M.A.202 — Occurrence Reporting

Occurrence reporting requirements under Part-M are the same as for Part-145:
- Any person/organisation responsible under M.A.201 shall report to the State of registry, the organisation responsible for type design (or supplemental type design) and, if applicable, the Member State of the operator, any identified condition of an aircraft or component that **seriously hazards flight safety**.
- Where a contracted maintenance organisation identifies such a condition, it must also report it to the owner, operator or CAMO.
- Reports shall be made **as soon as practicable, but within 72 hours** of the condition being identified.

## Sub Part C — Continuing Airworthiness

### M.A.301 — Continuing Airworthiness Tasks

Aircraft continuing airworthiness and serviceability of operational/emergency equipment shall be ensured by:
1. Accomplishment of pre-flight inspections
2. Rectification, to an officially recognised standard, of any defect/damage affecting safe operation, taking into account the Minimum Equipment List (MEL) and Configuration Deviation List (CDL) where applicable
3. Accomplishment of all maintenance in accordance with the M.A.302 approved maintenance programme
4. For large aircraft/CAT aircraft: analysis of the effectiveness of the approved maintenance programme and amendment as necessary
5. Accomplishment of any applicable airworthiness directive, operational directive with continuing airworthiness impact (e.g. ETOPS, RVSM, AWOPS), continued airworthiness requirement established by the Agency, or measure mandated by the competent authority
6. Accomplishment of modifications and repairs in accordance with M.A.304
7. For large aircraft/CAT aircraft: establishment of an embodiment policy for non-mandatory modifications/inspections
8. Maintenance check flights when necessary

**Pre-flight is a Part-M function.** It may be carried out by the flight crew or persons nominated by the CAMO; training procedures should be described in the operator's Continuing Airworthiness Management Exposition (CAME).

### M.A.302 — Maintenance Programme

Every aircraft shall be maintained in accordance with a **maintenance programme approved by the competent authority**, periodically reviewed and amended. Where the aircraft's continuing airworthiness is managed by a Part-M Sub Part G CAMO, the maintenance programme and amendments may instead be approved through the CAMO's own maintenance programme procedure (**indirect approval**).

The maintenance programme must establish compliance with, in order of precedence:
1. Instructions for continuing airworthiness issued by TC/STC holders (or any Part-21 data-publishing organisation), or
2. Instructions issued by the competent authority where these differ, or in the absence of specific recommendations, or
3. Instructions defined by the owner/operator and approved by the competent authority, where they differ from 1 and 2

The programme must contain details, including frequency, of all maintenance to be carried out, and must include a reliability programme when based mainly on Maintenance Steering Group logic or condition monitoring.

**AMC M.A.302 key points:**
- "Maintenance programme" includes scheduled maintenance tasks, associated procedures and standard maintenance practices; "maintenance schedule" embraces the scheduled tasks alone.
- An aircraft should only be maintained to **one** approved maintenance programme at a time.
- Programme details should be reviewed **at least annually**.
- The programme should normally be based on the Maintenance Review Board (MRB) report, the Maintenance Planning Document, and relevant maintenance manual chapters.

### M.A.304 — Data for Modifications and Repairs

Damage shall be assessed and modifications/repairs carried out using data approved by the Agency, or by an approved Part-21 design organisation, as appropriate.

### M.A.305 — Aircraft Continuing Airworthiness Record System

- On completion of any maintenance, the M.A.801 certificate of release to service shall be entered in the aircraft continuing airworthiness records, **within 30 days** of the maintenance action.
- Records consist of, as appropriate: aircraft logbook, engine logbook(s)/module log cards, propeller logbook(s)/log cards for service-life-limited components, and the operator's technical log.
- Records must contain the current status of: airworthiness directives; modifications and repairs; compliance with the maintenance programme; service-life-limited components; mass and balance report; and a list of deferred maintenance.
- Component records (identification, aircraft fitted to, accumulated flight time/cycles/calendar time) must be entered in the appropriate engine/propeller logbook or component log card, alongside the authorised release document (**EASA Form-1** or equivalent).

**Record retention periods:**
- All detailed maintenance records: at least **36 months** after permanent withdrawal from service
- Total time/flight cycles of aircraft and life-limited components: at least **12 months** after withdrawal
- Time/cycles since last scheduled maintenance of a life-limited component: until superseded by equivalent-scope maintenance
- Status of compliance with the maintenance programme: until superseded
- Status of applicable ADs: at least **12 months** after withdrawal
- Details of current modifications/repairs: at least **12 months** after withdrawal

### M.A.306 — Operator's Technical Log System

For commercial air transport, in addition to M.A.305, the operator shall use an aircraft technical log system containing: flight information necessary for continued flight safety; the current certificate of release to service; the current maintenance statement of scheduled/out-of-phase maintenance due; outstanding deferred defect rectifications; and maintenance support guidance. The system and any amendment must be approved by the competent authority, and the technical log must be **retained for 36 months** after the date of the last entry.

### M.A.307 — Transfer of Aircraft Continuing Airworthiness Records

When an aircraft is permanently transferred between owners/operators, the M.A.305 continuing airworthiness records (and M.A.306 technical log, if applicable) shall transfer with it, and the prescribed retention periods continue to apply to the new owner, operator or CAMO.

## Sub Part D — Maintenance Standards

This sub-part identifies maintenance standards for all EU aircraft (excluding historic, military, police and homebuilt aircraft). Note that the **CAMO does not carry out the maintenance itself** — it ensures that contracted Part-145 companies comply with these standards.

### M.A.401 — Maintenance Data

The person/organisation maintaining an aircraft shall have access to and use only applicable current maintenance data, including: any requirement/procedure/standard issued by the competent authority; any applicable AD; applicable instructions for continuing airworthiness from TC/STC holders; and any applicable locally approved data issued under 145.A.45(d). Data must be current and available before maintenance begins, either transcribed onto work sheets or precisely referenced.

### M.A.402 — Performance of Maintenance

All maintenance shall be performed by qualified personnel following the M.A.401 maintenance data, using the specified tools, equipment and materials, within specified environmental limitations. An **independent inspection shall be carried out after any flight safety sensitive maintenance task**, unless otherwise specified by Part-145 or agreed by the competent authority. After completion, a general verification must confirm the aircraft/component is clear of tools and extraneous material, with all access panels refitted.

**Independent Inspections:** In the absence of manufacturer's instructions, an independent check is required after maintenance tasks involving the assembly or disturbance of a control system where errors could result in a failure, malfunction or defect endangering safe operation. It comprises a first inspection made by the authorised person signing the maintenance release (who assumes full responsibility), followed by a second inspection by an independent, competent person who attests satisfactory completion. The second person is **not** issuing a maintenance release and so is not required to hold certification privileges, but must be suitably qualified.

### M.A.403 — Aircraft Defects

Any aircraft defect that **seriously hazards flight safety shall be rectified before further flight**. Only authorised certifying staff (M.A.801(b)1, M.A.801(b)2, or Part-145) may decide — using M.A.401 data — whether a defect seriously hazards flight safety, unless the approved Minimum Equipment List is used by the pilot, or the defect is defined as acceptable by the competent authority. Defects not hazarding flight safety shall be rectified as soon as practicable and any unrectified defect recorded in the M.A.305 record system or technical log.

## Sub Part E — Components

Identifies component standards for all EU aircraft. Main headings: **M.A.501** (Classification and installation), **M.A.502** (Component maintenance), **M.A.503** (Service life limited components), **M.A.504** (Segregation of components). Part 145.A.42 provides equivalent information.

## Sub Part F — Non-Commercial Air Transport Maintenance Organisations

Covered under Part-145 (Approved Maintenance Organisations).

## Sub Part G — Continuing Airworthiness Maintenance Organisation (CAMO)

Sub Part G contains the requirements for an organisation to qualify for approval to manage aircraft continuing airworthiness.

### Commercial Air Transport (CAT) Operator and Sub Part G

An **Air Operator's Certificate (AOC) holder must have his own CAMO**; it cannot be contracted in its entirety to an independent organisation (although certain tasks of the CAMO can be contracted out). To obtain an AOC, the operator's application must contain: the Continuing Airworthiness Management Exposition (CAME); the aircraft maintenance programmes; the aircraft technical log; and maintenance contracts.

### Independent CAMO

Application is made on **EASA Form 2** and consists of an Exposition (CAME) containing: a statement signed by the accountable manager confirming compliance with Part-M; the organisation's scope of work; the names of persons referenced in M.A.706(b)/(c); an organisation chart; a list of M.A.707 airworthiness review staff; a description and location of facilities; procedures ensuring compliance; and amendment procedures. The CAME and its amendments must be approved by the competent authority — minor amendments may use an indirect-approval exposition procedure.

### Privileges of a CAMO (M.A.711)

A CAMO may:
- Manage continuing airworthiness of non-commercial air transport aircraft listed on its approval certificate
- Manage continuing airworthiness of commercial air transport aircraft listed on its AOC
- Arrange for a subcontracted organisation working under its Compliance Monitoring System to carry out any continuing airworthiness task

**M.A.711(b) — Additional privileges:** an EU-registered CAMO may additionally issue an Airworthiness Review Certificate (ARC), or make a recommendation for the ARC to the Member State of Registry Competent Authority. There is no obligation on a CAMO to take on this extra task.

### M.A.705 — Facilities

Suitable office accommodation at appropriate locations must be provided for the CAMO staff.

### M.A.706 — Personnel Requirements

The Accountable Manager (for CAT, the operator's Accountable Manager) shall designate a nominated post-holder responsible for continuing airworthiness activities. **This nominated post-holder shall not be employed by a contracted Part-145 organisation.** The CAMO management group should have practical experience/expertise in aviation safety standards, knowledge of compliance monitoring systems, and **at least five years' relevant work experience**, of which at least two years in the aeronautical industry in an appropriate position.

### M.A.708 — Continuing Airworthiness Management

The CAMO must, for each managed aircraft, apply Sub Part D maintenance standards and ensure Sub Part C tasks are carried out, including: developing and gaining NAA approval of an AMP; copying the AMP to the operator; managing approval of modifications and repairs; ensuring maintenance is carried out per the AMP and CRS issued; ensuring ADs are complied with; ensuring defects are rectified; ensuring the aircraft is taken to a Part-145 organisation when necessary; coordinating scheduled maintenance and ADs; managing and archiving records; and ensuring accuracy of the mass and balance statement. **All maintenance is ultimately completed by a Part-145 approved organisation** — the CAMO monitors compliance, it does not itself perform the maintenance.

## Sub Part H — Certificate of Release to Service

This sub-part details CRS requirements for small aircraft serviced by a Sub Part F organisation, a licensed engineer, or the pilot-owner.

### M.A.801 — Aircraft Certificate of Release to Service

A certificate of release to service (CRS) shall be issued **before flight**, at the completion of any maintenance, by: certifying staff on behalf of the M.A. Sub Part F approved maintenance organisation; or (except for complex maintenance tasks listed in Appendix VII) certifying staff in compliance with Part-66. The CRS shall contain basic details of the maintenance carried out, the completion date, and the identity (and licence number, if applicable) of the certifying staff. In the case of incomplete maintenance, that fact must be entered before the CRS is issued. A CRS shall **not** be issued where there is any known non-compliance that seriously hazards flight safety.

### M.A.802 — Component Certificate of Release to Service

A CRS shall be issued at completion of any maintenance on a component whilst off the aircraft. The authorised release certificate, **EASA Form-1**, constitutes the component CRS.

### M.A.803 — Pilot-owner Authorisation

A pilot-owner may only issue a CRS for maintenance they themselves performed, on a privately operated aircraft. For jointly-owned aircraft, the maintenance programme should list the names of all pilot-owners competent and designated to perform pilot-owner maintenance (per Appendix VIII to Part-M) and the limited tasks they may perform. Not holding a valid medical examination does not invalidate the pilot licence for the purpose of Pilot-owner authorisation.

## Sub Part I — Aircraft Airworthiness Review and Airworthiness Review Certificate (M.A.901)

For an aircraft's Certificate of Airworthiness (C of A) to be valid, a current **Airworthiness Review Certificate (ARC)** must be attached. To satisfy the airworthiness review requirement, the approved CAMO shall carry out a full documented review of the aircraft records, confirming (among other things): flying hours/cycles properly recorded; flight manual applicable and current; all due maintenance carried out; known defects corrected or carried forward in a controlled manner; ADs applied and registered; modifications/repairs registered and Part-21 approved; life-limited components identified and within limits; mass and balance statement valid; and compliance with the latest approved type design.

Airworthiness review staff shall also carry out a **physical survey** of the aircraft (assisted by Part-66 qualified personnel if not themselves so qualified), checking markings/placards, compliance with the approved flight manual and documentation, absence of unaddressed defects, and no inconsistencies with the records review. The review may be **anticipated by a maximum of 90 days** without loss of continuity, to allow the physical review to coincide with maintenance.

### Issue of the ARC

If privileged under M.A.711(b), the CAMO may issue an ARC or recommend one to the Competent Authority. While the aircraft remains under continuous control of a CAMO, the ARC may be **renewed twice at intervals of 1 year** without a further physical survey (paperwork review still required each time).
- If maintained in a **controlled environment**: the CAMO issues the ARC (Form 15b) and may extend it twice.
- If **not** in a controlled environment: the CAMO issues a recommendation to the Competent Authority for issue of the ARC (Form 15a) **annually**.

### Airworthiness Review Staff (M.A.707)

Must be: formally accepted by the competent authority prior to authorisation (EASA Form 4); have satisfactorily carried out a review under supervision; have **5 years' continuing airworthiness experience**; hold an appropriate Part-66 licence or aeronautical degree/equivalent plus formal aeronautical engineering training; hold an appropriate position within the organisation; and be listed in the CAME. **Airworthiness Review Staff must be independent from the airworthiness management process.**

### The Controlled Environment

Defined as an environment that is: continuously managed by a CAMO; has not changed during the previous 12 months; and where maintenance is carried out by approved AMOs (including maintenance by the pilot-owner with release to service by the pilot-owner or independent licensed engineer under M.A.801(b)2).

### Initial Issue of a C of A

Requires an airworthiness review by a CAMO, followed by a recommendation that the ARC and C of A be issued; issue of the documents is carried out by the NAA.

### ARC Validity

The ARC is invalidated when: it is suspended or revoked; the Airworthiness Certificate is suspended or revoked; the aircraft is not on the register of an EU member state; or the Type Certificate is suspended or revoked. The **C of A itself is valid indefinitely**, provided a valid ARC remains attached.
        $cnt$,
        6
    ) RETURNING id INTO s6_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 10.7: Applicable National and International Requirements
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m10_id, 'M10.7', 'Applicable National and International Requirements',
        $cnt2$
# Applicable National and International Requirements

**References:** based on Regulations 2018/1139, 965/2012 and 1321/2014; EASA Part-21 and Part-M and their associated AMC/GM

## General

This section discusses national and international requirements that have not yet come under the auspices of EASA.

## Classification of Aircraft as "EASA Aircraft" and "Non-EASA Aircraft"

Regulation (EC) No. 2018/1139 transferred to the **European Aviation Safety Agency (EASA)** responsibility for the regulation of airworthiness of the majority of civil aircraft registered in EU Member States. However, the regulation stipulates that certain classes of aircraft remain subject to **national** regulations, dividing EU-registered aircraft into two categories:

- **EASA Aircraft** — subject to regulation of airworthiness by EASA under Regulation (EC) No. 2018/1139
- **Non-EASA Aircraft** — subject to regulation of airworthiness at a national level

**Non-EASA aircraft** are those within Annex II to Regulation (EC) No. 2018/1139, including:
- Aircraft used by Military, Customs, Police (Government Aircraft) — "**State Aircraft**"
- Historic aircraft (or aircraft of historical significance — participation in a notable historical event, a major step in aviation development, or a major armed-forces role)
- Aircraft specifically designed or modified for research, experimental or scientific purposes, likely to be produced in very limited numbers
- Aircraft of which at least **51%** is built by an amateur (or non-profit association of amateurs) for their own, non-commercial purposes
- Aircraft that have been in military service, unless a design standard has been adopted by the Agency for that type
- Aeroplanes, helicopters and powered parachutes with no more than two seats and a maximum take-off mass (MTOM) of between **300–495 kg**, depending on type
- Aeroplanes with a stall speed or minimum steady flight speed in landing configuration not exceeding **35 knots CAS**
- Single and two-seater gyroplanes with a maximum take-off mass not exceeding **560 kg**
- Gliders with a maximum empty mass of no more than **80 kg** (single-seater) or **100 kg** (two-seater), including foot-launched types

Aircraft with type certificates issued before **28 September 2003** by a National Aviation Authority (NAA) continue to be certified under national certification standards rather than EASA Part-21.

Aircraft engaged in military, customs, police or similar services are considered "**State Aircraft**" and are not subject to EASA Regulations — it is the responsibility of the state of registration to decide how to treat them.

## Approved Maintenance Programs, Checks and Inspections

The Approved Maintenance Programme (AMP — also known as MS, Maintenance Schedule, or MP, Maintenance Program) is structured with respect to **FH** (flight-hours), **FC** (flight-cycles) and time/calendar-controlled maintenance tasks; one or more of these parameters can apply to aircraft, engine and component tasks.

**Aircraft checks divide into:**

*Line maintenance checks:*
- Pre-flight inspection (PFI) or Pre-Departure Inspection (PDI)
- Daily check
- Weekly check
- A-check

*Base maintenance checks:*
- C-checks
- D-checks
- Special structural inspections
- Major modifications

*Note: different manufacturers may use different designators for checks and inspections.*

## System of Maintenance

For Commercial Air Transport operating to EASA requirements, **Regulation 1321/2014 Annex I (Part M.A.302)** requires aircraft to be maintained in accordance with an Approved Maintenance Programme. For aircraft operating on a Permit to Fly, maintenance arrangements must be agreed with the NAA — meaning a schedule is required.

- **Maintenance Programme** — embraces both scheduled maintenance tasks and the associated procedures (including reliability monitoring)
- **Maintenance Schedule** — embraces the maintenance tasks alone, normally without maintenance procedures

## Maintenance Schedule Contents

The MS/MP, derived from the Maintenance Planning Document (MPD) issued by the manufacturer and modified by the organisation's Part-M, is submitted to the NAA for approval and shall contain:

**General information:**
- Reference number, issue number and date
- Registered name(s) and address(es) of owner(s)/operator(s)
- Type and model(s) of aircraft, engines, APUs and propellers where applicable
- Areas of operation
- Class of work in relation to areas of operation
- Registration marks of aircraft maintained under the schedule
- Details of arrangements involving cooperation between more than one operator, or combination of information from other fleets for statistical/sampling purposes

**Primary maintenance processes**, for each part of the aircraft, engines, APUs, propellers, components, accessories and systems:
1. Cross-reference to the source of the task (e.g. MRB report, MPD)
2. Periods at which the item shall be inspected, and the type/degree of inspection
3. Periods at which the item shall be checked, cleaned, lubricated, adjusted and tested
4. Periods at which the item shall be overhauled or replaced, expressed as a usage criterion (time, cycles, landings) or a condition criterion (wear limits, limiting dimensions)
5. **Mandatory Life Limitations**, for parts whose failure could have a hazardous effect on the aircraft
6. Other processes agreed by the NAA, e.g. condition monitoring

The schedule must also provide for a **record of amendments**, reference to the source of its content (e.g. MRB, MPD, AMM), and **check cycle criteria** describing how checks are "packaged" (e.g. A-check — 400 FH, B-check — 800 FH, etc.).

## Safety Critical Maintenance Tasks

A factor in a serious incident involving oil leakage on a large twin-engine Commercial Air Transport aircraft was the **failure to re-install the drive cover plate on both engines** following maintenance. A potential safety benefit lies in companies choosing to apply aspects of **ETOPS maintenance philosophy** to multi-system aircraft, to avoid simultaneous incorrect maintenance on two or more safety-critical systems (systems having a fundamental influence on safe operation — engines and their systems being a case in point).

Operators and maintenance organisations should, when planning and accomplishing scheduled and non-scheduled maintenance on multi-system aircraft:
- **Stagger** scheduled maintenance tasks on essential/primary systems so that similar critical tasks on two or more systems are segregated — ideally by at least **one flight cycle**. Where staggering is impractical, inspections and functional checks should be performed independently.
- Where staggering is impractical during Base Maintenance or rectification, use **separate work teams** together with appropriate functional checks to verify system serviceability.
- Establish procedures giving planning/maintenance personnel guidance on identifying safety-critical tasks; routine task documentation should identify tasks with a critical safety effect and their individual stages.
- Ensure initial and continuation training highlights the critical nature of maintenance on essential/primary systems, using feedback from maintenance experience.

## Inspections

### Pre-Flight Inspections (AMC to Part-M.A.301(1))

Pre-flight inspections are carried out in accordance with the aircraft flight/operations manual, or as specified in the manufacturer's maintenance schedule. They are regulated in Part-M as a **Continued Airworthiness task** and are **not** released to service by a CRS under Part-145. Part-M states that the pilot, flight crew, or a nominated person may carry out the flight check.

Pre-flight inspection covers actions necessary to ensure the aircraft is fit for the intended flight, typically including:
1. A walk-around inspection of the aircraft and emergency equipment for condition, including signs of wear, damage or leakage, and presence of required equipment
2. Inspection of the continuing airworthiness record system/technical log, to confirm no outstanding deferred defect adversely affects the flight and no required maintenance is overdue or due during the flight
3. Confirming consumable fluids/gases uplifted before flight are of correct specification, uncontaminated and correctly recorded
4. Confirming all doors are/will be securely fastened
5. Confirming control surface and landing gear locks, pitot/static covers, restraint devices and engine/aperture blanks have been removed
6. Confirming external surfaces and engines are free from ice, snow, sand, dust, etc.

Oil/hydraulic fluid uplift and tyre inflation may be considered part of the pre-flight inspection, with procedures to identify abnormal consumption requiring further maintenance action. For CAT, the operator should publish guidance on responsibilities and demonstrate to the competent authority that pre-flight personnel have received appropriate training, described in the operator's CAME.

### Duplicate Inspection

Applied following initial assembly or any disturbance of a **Vital Point**.

- **Control System** — a system by which the flight path, attitude, or propulsive force of an aircraft is changed, including flight, engine and propeller controls, related system controls and operating mechanisms.
- **Duplicate Inspection** — an inspection first made and certified by one qualified person (certifying staff), then made and certified by a second qualified person (not necessarily holding certification privileges).

A duplicate inspection of all Vital Points/Control Systems shall be made after initial assembly and before a CRS is issued after overhaul, repair, replacement, modification or adjustment, and in any case before the first flight; it may be limited to the disturbed part of a Control System. The first and second inspections must cover the full extent of the work, not just the immediate area of disturbance, to catch remote parts of the system that may have been affected. Where sections cannot be inspected fully assembled (e.g. routed through conduits, boxed-in, pre-sealed), the certifying person must be satisfied that a prior duplicate inspection of those units/sections was made and that sealed units are acceptable for use.

Vital Points/Control Systems subject to duplicate inspection must **not** be disturbed or re-adjusted after the first certified inspection, and the second part must follow the first as closely as possible. If disturbed after completion, the disturbed part must again be inspected in duplicate and a CRS issued before flight. An additional inspection is made, once all covers and fairings are finally secured, to confirm full, free and correct movement of the controls.

Persons qualified to make the first and/or second part of a duplicate inspection:
- Aircraft engineers appropriately licensed in Categories A, B and C
- Persons employed by Approved Organisations, appropriately authorised per company procedures (for Commercial Air Transport, the organisation must hold Part-145 approval)

### Independent Checks

EASA uses the term **Independent Check** to describe the second-person checks known as Duplicate Checks in EU Member States — **Part M.A.402** describes this requirement, which is, in all essential respects, the same as the Duplicate Check requirement described above.

## Airworthiness Directives (ADs)

ADs consist of particular airworthiness requirements, mandatory for specific aircraft, engines and components, issued either by the civil aviation authority of the manufacturer's state or by the national authority of the registered aircraft. The authority of the manufacturer's certification state is obliged to transmit any mandatory airworthiness information to the NAA — an AD falls under the heading of **Mandatory Airworthiness Information**. NAA Airworthiness Directives, wherever possible, adopt advice promulgated by the Type Design Organisation or Type Responsibility Agreement holder through Service Bulletins and Flight Manual amendments.

**Part 21.A.38** — an airworthiness directive is a document issued or adopted by the Agency which mandates actions on an aircraft to restore an acceptable level of safety, when evidence shows the safety level may otherwise be compromised. The Agency shall issue an AD when an unsafe condition has been determined to exist as a result of a deficiency (in the aircraft, engine, propeller, part or appliance), and that condition is likely to exist or develop in other aircraft.

An AD shall contain at least: identification of the unsafe condition; identification of the affected aircraft; the action(s) required; the compliance time for the required action(s); and the date of entry into force.

### Emergency and Mandatory ADs — Notification

When urgency precludes consultation, priority publication of mandatory continuing airworthiness information is by means of an **Emergency AD**.

## Service Bulletins, Manufacturers Service Information

Despite maintenance being carried out to approved documents and programmes, incidents, damages, malfunctions and defects still occur. To inform and prevent recurrence, the Type Certificate Holder informs operators and Part-145/Part-M organisations, normally through **Service Letters (SL)**, **Service Bulletins (SB)** or **Alert Service Bulletins (ASB)**. These are selected and evaluated for modification by the responsible operator and/or Part-M CAMO and/or Part-145 organisation.

A Service Bulletin or Alert Service Bulletin generally contains: a transmittal/cover sheet, planning information, compliance, approval, references, publication affected, material information, accomplishment instructions, and appendices as required.

## Modifications and Repairs (Part-21 Sub Part D/E/J)

Modifications and repairs must always be accomplished using approved maintenance data, to ensure the airworthiness of the aircraft, engines and components is assured. Modifications and repairs defined in the manufacturer's approved maintenance data may be accomplished as shown, without further approvals. **Approved maintenance data** means: the AMM; Structure Repair Manual; Component Maintenance Manual; Engine Manual; Wiring Diagram; Non-Destructive Testing Manual; Service Bulletin; Alert Service Bulletin; or Airworthiness Directive.

Modifications and repairs not included in approved data may not be performed without approval from the responsible authority — an organisation wishing to design its own modifications/repairs must hold Part-21 approval, defining policies and procedures in a design organisation handbook. Modifications and repairs are treated the same as changes to the relevant type certificate/STC and must be approved under Part-21 Sub Part D and Sub Part E respectively. After every maintenance action, a **Certificate of Release to Service (CRS)**, per **Part-145.A.50**, must be issued and signed by appropriately authorised certifying staff.

## Maintenance Documentation

Includes all registered instructions held as approved data, which must be available at the Part-145 organisation, which must ensure all requirements can be fulfilled during maintenance work. Documentation may be in the form of manuals, microfiches, microfilms, CD-ROM, web-based or other computer-based data, and is classified using the standardised **ATA-100** code. Compliance is established through the independent Compliance Monitoring System, auditing processes per Part-145.A.65.

**Common maintenance documentation:**

| Abbreviation | Document |
|---|---|
| CAME | Continuous Airworthiness Management Exposition |
| AFM | Aircraft Flight Manual |
| RFM | Rotorcraft Flight Manual |
| EMPM | ETOPS Maintenance Procedure Manual |
| MP | Maintenance Program |
| MEL | Minimum Equipment List |
| AD | Airworthiness Directive |
| SB / ASB | Service Bulletin / Alert Service Bulletin |
| MOE | Maintenance Organisation Exposition |
| AMM | Aircraft Maintenance Manual |
| SID | Supplemental Inspection Document |
| WM/WDM | Wiring (Diagram) Manual |
| IPC | Illustrated Parts Catalogue |
| SRM | Structure Repair Manual |
| CMM | Component Maintenance Manual |
| EM | Engine Manual |
| NDTM | Non-Destructive Test Manual |
| SL | Service Letter |

### Aircraft Maintenance Manual (AMM)

Contains information necessary for mechanics to service, functionally check and repair all systems/equipment installed in the aircraft, as delivered to the customer. It does not cover work normally performed on units/assemblies away from the aircraft.

### Illustrated Parts Catalogue (IPC)

Used for identification and requisition of replaceable aircraft parts and units. It is a companion document to the AMM and contains all parts information for which maintenance-practices coverage has been provided.

### Structural Repair Manual (SRM)

Contains descriptive information for identification and repair of the aircraft's primary and secondary structure, advising operators of repair procedures developed by the manufacturer or by operators.

### Component Maintenance Manual (CMM)

Intended for work on applicable components in a workshop environment, with sufficient detail to return the component to a serviceable condition.

### Engine Manual (EM)

Provides the technical data needed to maintain the engine, including interrelated parts (e.g. thrust reverser, cowling, mounts, electrical looms) removed with the engine at the time the Quick Engine Change (QEC) unit is dropped. May be offered as a double-document "EM/CIR (Cleaning-Inspection-Repair)" set, also applicable to Auxiliary Power Units.

### Wiring (Diagram) Manual (WM/WDM)

Illustrates all aircraft, engine and component electrical/electronic circuits, with wiring/schematic diagrams, lists and location charts sufficient to enable fault isolation and servicing during maintenance.

## Continuing Airworthiness Oversight — "State Aircraft"

**EU 2018/1139 Article 1** states the Regulation applies to the design, production, maintenance and operation of aeronautical products, parts and appliances, and related personnel/organisations, but does **not** apply to aircraft (and their engines, propellers, parts, equipment) while carrying out military, customs, police, search and rescue, firefighting, border control, coastguard or similar activities/services under the control and responsibility of a Member State.

It is each state's responsibility to interpret this clause and set appropriate structures to secure the airworthiness of State aircraft. Since 2008, a forum set up by the **European Defence Agency (EDA)** has worked to establish a common system for State aircraft airworthiness across Europe, resulting in the **European Military Airworthiness Requirements (EMAR)**, derived from EASA regulations and similar to them by more than **95%**.

## Test Flights

### Full Flight Tests

Airworthiness Flight Tests are made periodically on aircraft holding a Certificate of Airworthiness requiring continued certification, to ensure handling characteristics are satisfactory and undeteriorated, performance remains as scheduled, and the aircraft/equipment function correctly. Test flights are a mandatory requirement before issuing a C of A for an aircraft being imported into an EASA Member State. All flight tests follow the applicable Aircraft Flight Manual (AFM) and the manufacturer's production flight test manual, performed under the authority of the operator by specially qualified crew. A full flight test may be necessary after major maintenance work or important work following an incident/accident.

### Maintenance Check Flights

Identified in **M.A.301(8)** as part of the continuing airworthiness tasks necessary to ensure serviceability of operational/emergency equipment. The manufacturer's Maintenance Manual may prescribe the need for check flights after certain maintenance tasks; for other tasks affected by flight dynamics, air loads, airflows or temperature/pressure, the certifying engineer determines whether a check flight is required. Before any test flight it must be positively assured, through investigation, inspection, corrective work or ground testing, that the complained condition/function has been corrected as far as possible. A CRS must be provided before a test flight, and a copy of the flight test report kept by the CAMO and Part-145 organisation.

### Check Flights for Continuing Airworthiness Management

Per the **ICAO Airworthiness Manual, Volume 1**, the purpose of airworthiness check flights is to ensure flight characteristics and in-flight functioning do not differ significantly from the type's normal characteristics, and to check performance against the flight manual, in accordance with schedules approved by the State's competent authority. Schedules require handling tests (take-off, climb, cruise, max/min speed, descent, landing, hover for helicopters), performance tests (rate-of-climb, low-speed warning/stall speeds), and functional/back-up-system tests. After each flight, the pilot completes a post-flight certificate listing defects found, together comprising the Check Flight Report.

## Extended Range Twin Operations (ETOPS)

**ETOPS** (EU SPA.ETOPS) is defined as an operation for two-engine aircraft over a route containing a point further than the approved threshold time, at the approved one-engine-out cruise speed (standard conditions), from an adequate airport. There are two operational criteria: **60–120 minutes** and **120–180 minutes**. ETOPS requirements are integrated into: the AMM, AFM, MEL, Route Manual and ETOPS Manual.

ETOPS requires special maintenance attention: certain tasks may not be performed during the same ground time on ETOPS-related systems, and if similar tasks are needed on equal aircraft systems/components, the **same person must not perform both**. If this cannot be assured, a verification flight is planned as a non-ETOPS flight. ETOPS-related maintenance work must be marked as such on the work paper; it is defined in the ETOPS Manual, which is approved by the responsible authority.

### ETOPS Maintenance Programme

Based on the operator's currently approved continuous airworthiness maintenance schedule for the make/model airframe-engine combination, reviewed to ensure it adequately supports ETOPS requirements — including procedures to preclude identical action being applied to multiple similar elements in any ETOPS-critical system (e.g. a fuel control change on both engines). ETOPS tasks should be identified on routine work forms; an **ETOPS service check**, signed off by an ETOPS-qualified maintenance person immediately prior to an ETOPS flight, verifies aircraft status and critical items.

### ETOPS Manual

Developed by the operator for personnel involved in ETOPS, referencing the maintenance programme and other requirements, submitted to the Authority before ETOPS flights begin.

### Oil Consumption Programme

Should reflect manufacturer recommendations and be sensitive to consumption trends, considering oil added at ETOPS departure stations against running average consumption, continuously up to and including departure. If the APU is required for ETOPS, it too must be included.

### Engine Condition Monitoring

Describes parameters monitored, data collection methods and corrective-action processes, to detect deterioration early and ensure engine limit margins are maintained so a prolonged single-engine diversion can be conducted without exceeding approved limits.

### Reliability Programme

Designed for early identification/prevention of ETOPS-related problems, event-orientated, with reporting for significant events — the Authority should be notified **within 96 hours** of reportable events, including: in-flight shutdowns; diversion/turn-back; uncommanded power changes/surges; inability to control the engine or obtain desired power; and problems with ETOPS-critical systems.

### Propulsion System Monitoring, Maintenance Training and ETOPS Parts Control

Propulsion system reliability assessments should be made available to the Authority **at least monthly**. Maintenance training should focus on the special nature of ETOPS, for personnel who have completed the operator's extended-range training programme and satisfactorily performed tasks under supervision. A parts control programme ensures correct ETOPS parts/configuration is maintained, including for parts borrowed, pooled, or returned after repair/overhaul.

## All Weather Operations

All Weather Operations (AWOPS), Reduced Vertical Separation Minima (RVSM) etc. are operational issues, not used by every operator, but carry specific maintenance requirements that must be included in the Maintenance Schedule.

### Category II/III Operations and Minimum Equipment Requirements (SPA.LVO)

An aeroplane with basic IFR airworthiness approval is eligible for ILS precision approaches down to a decision height of **60 m (200 ft)**, given approved ILS receivers/instruments.

**Category II** — supplementary airworthiness requirements for ILS precision approaches with decision heights below 60 m (200 ft) down to **30 m (100 ft)**, RVR not less than 300 m. Required equipment (CS-AWO 221) includes: two ILS glide path/localiser receivers; an automatic approach coupler or flight director system; a radio altimeter displaying radio altitude and selected decision height; a clear visual alert at decision height; automatic/flight-director go-around capability; audible autopilot-failure warning; automatic throttle where necessary; equipment failure warning; and excess-ILS-deviation alert.

**Category III** — supplementary criteria for decision heights below **100 ft** or no decision height. Requirements scale with the decision height band (below 100 ft; 50 ft or greater; below 50 ft; no decision height), progressing from fail-passive to fail-operational automatic landing systems, automatic throttle control, automatic ground roll control/head-up guidance, and (for no-DH operations) anti-skid braking.
        $cnt2$,
        7
    ) RETURNING id INTO s7_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M10.6 Continuing Airworthiness (18 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s6_id, 'Part-M is which Annex to Regulation (EC) No. 1321/2014?',
     '[{"id":"a","text":"Annex I","correct":true},{"id":"b","text":"Annex II","correct":false},{"id":"c","text":"Annex IV","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'All applicable aircraft have been subject to Part-M provisions since:',
     '[{"id":"a","text":"29 November 2003","correct":false},{"id":"b","text":"28 September 2008","correct":true},{"id":"c","text":"1 January 2014","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'Compared with the previous JAR-OPS Sub Part M, Part-M newly introduces:',
     '[{"id":"a","text":"Regulations for independent Continuing Airworthiness Management Organisations (CAMO) and the non-expiring Certificate of Airworthiness with Airworthiness Review Certificate (ARC)","correct":true},{"id":"b","text":"The requirement for annual renewal of the Certificate of Airworthiness","correct":false},{"id":"c","text":"The abolition of the certificate of release to service","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'Within the relationship between CAMO, operator and maintenance organisation, which statement is correct?',
     '[{"id":"a","text":"A CAT operator must have his own CAMO","correct":true},{"id":"b","text":"A CAT operator may operate under ARO.OPS without submitting a Part-M exposition","correct":false},{"id":"c","text":"Private owners of large aircraft may never contract a CAMO","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'Private owners of large aircraft above what mass may contract a CAMO, approved under Part-M Sub Part G, to act on their behalf?',
     '[{"id":"a","text":"2730 kg MTOW","correct":false},{"id":"b","text":"5700 kg MTOW","correct":true},{"id":"c","text":"20000 kg MTOW","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'Light non-CAT aircraft must be managed for airworthiness in accordance with:',
     '[{"id":"a","text":"Part-M Sub Part C, which may be carried out by the owner, a licensed engineer, or a CAMO","correct":true},{"id":"b","text":"Part-M Sub Part G exclusively","correct":false},{"id":"c","text":"Part-145 exclusively","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'According to M.A.201, the pre-flight inspection:',
     '[{"id":"a","text":"Must always be carried out by an approved maintenance organisation or Part-66 certifying staff","correct":false},{"id":"b","text":"Must be carried out by the pilot or another qualified person, but need not be by an approved maintenance organisation or Part-66 certifying staff","correct":true},{"id":"c","text":"Is only required for aircraft operated commercially","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'Under M.A.202, occurrence reports concerning a condition that seriously hazards flight safety must be made:',
     '[{"id":"a","text":"Within 24 hours","correct":false},{"id":"b","text":"As soon as practicable, but within 72 hours","correct":true},{"id":"c","text":"Within 30 days","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'According to M.A.301, which of the following is one of the continuing airworthiness tasks listed?',
     '[{"id":"a","text":"Accomplishment of pre-flight inspections","correct":true},{"id":"b","text":"Issue of the operator''s Air Operator Certificate","correct":false},{"id":"c","text":"Type certification of new aircraft designs","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'Under M.A.302, when an aircraft is managed by a CAMO approved under Part-M Sub Part G, the maintenance programme and its amendments may be approved through:',
     '[{"id":"a","text":"An indirect approval, via a maintenance programme procedure established by the CAMO","correct":true},{"id":"b","text":"The Type Certificate Holder only","correct":false},{"id":"c","text":"Self-declaration by the owner without any competent authority involvement","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'An aircraft maintenance programme should be based, in order of precedence, first on:',
     '[{"id":"a","text":"Instructions for continuing airworthiness issued by TC/STC holders (or a Part-21 data-publishing organisation)","correct":true},{"id":"b","text":"Instructions defined solely by the owner or operator","correct":false},{"id":"c","text":"Recommendations from any Part-145 organisation, regardless of TC holder data","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'Under M.A.305, an entry recording the M.A.801 certificate of release to service must be made in the aircraft continuing airworthiness records within:',
     '[{"id":"a","text":"24 hours","correct":false},{"id":"b","text":"30 days","correct":true},{"id":"c","text":"6 months","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'How long must an operator retain the aircraft technical log after the date of the last entry, per M.A.306?',
     '[{"id":"a","text":"12 months","correct":false},{"id":"b","text":"36 months","correct":true},{"id":"c","text":"5 years","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'Under M.A.402, an independent inspection shall be carried out:',
     '[{"id":"a","text":"After any flight safety sensitive maintenance task, unless otherwise specified by Part-145 or agreed by the competent authority","correct":true},{"id":"b","text":"Only when specifically requested by the aircraft owner","correct":false},{"id":"c","text":"Only after engine overhaul","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'In an independent inspection, the second independent competent person who attests satisfactory completion:',
     '[{"id":"a","text":"Must hold a valid Part-66 certifying licence at all times","correct":false},{"id":"b","text":"Is not issuing a maintenance release and so is not required to hold certification privileges, but must be suitably qualified","correct":true},{"id":"c","text":"Must be the same person who signed the original maintenance release","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'Under Sub Part D, the role of the CAMO with respect to maintenance standards is to:',
     '[{"id":"a","text":"Carry out the maintenance itself in every case","correct":false},{"id":"b","text":"Ensure that contracted Part-145 companies are complying with the standards, without itself carrying out the maintenance","correct":true},{"id":"c","text":"Have no responsibility for maintenance standards once a Part-145 contract is signed","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'An Air Operator''s Certificate (AOC) holder''s CAMO requirement is that:',
     '[{"id":"a","text":"The AOC holder must have his own CAMO, which cannot be contracted in its entirety to an independent organisation","correct":true},{"id":"b","text":"The entire CAMO function can always be outsourced to any independent organisation","correct":false},{"id":"c","text":"An AOC holder does not require a CAMO if it uses only Part-145 organisations","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'While an aircraft remains under the continuous control of a CAMO, and provided it is maintained in a controlled environment, the ARC may be renewed:',
     '[{"id":"a","text":"Twice, at intervals of 1 year, without a further physical survey","correct":true},{"id":"b","text":"An unlimited number of times without any further paperwork review","correct":false},{"id":"c","text":"Only once, after which a new physical survey is always mandatory","correct":false}]',
     '{"B1","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M10.7 Applicable National and International Requirements (18 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s7_id, 'Under Regulation (EC) No. 2018/1139, EU-registered aircraft are divided into two categories, namely:',
     '[{"id":"a","text":"EASA Aircraft and Non-EASA Aircraft","correct":true},{"id":"b","text":"Commercial Aircraft and Private Aircraft only","correct":false},{"id":"c","text":"Part-145 Aircraft and Part-M Aircraft","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, 'Which of the following is classified as a Non-EASA (Annex II) aircraft?',
     '[{"id":"a","text":"Aircraft used by Military, Customs or Police (State Aircraft)","correct":true},{"id":"b","text":"Any newly type-certificated large commercial jet transport","correct":false},{"id":"c","text":"Any aircraft used for Commercial Air Transport regardless of size","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, 'For an aircraft to qualify as Annex II amateur-built and thus a Non-EASA aircraft, at least what percentage must be built by amateurs for their own, non-commercial purposes?',
     '[{"id":"a","text":"25%","correct":false},{"id":"b","text":"51%","correct":true},{"id":"c","text":"75%","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, 'Gliders remain within the Annex II (Non-EASA) exemption if their maximum empty mass does not exceed:',
     '[{"id":"a","text":"80 kg single-seater / 100 kg two-seater","correct":true},{"id":"b","text":"300 kg single-seater / 495 kg two-seater","correct":false},{"id":"c","text":"560 kg regardless of seating","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, 'Aircraft with type certificates issued before what date by an NAA continue to be certified under national certification standards rather than EASA Part-21?',
     '[{"id":"a","text":"28 September 2003","correct":true},{"id":"b","text":"28 September 2008","correct":false},{"id":"c","text":"1 January 2014","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, 'Line maintenance checks include which of the following?',
     '[{"id":"a","text":"Pre-flight inspection, daily check, weekly check, A-check","correct":true},{"id":"b","text":"C-check and D-check","correct":false},{"id":"c","text":"Special structural inspections and major modifications","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, 'For Commercial Air Transport operating to EASA requirements, Regulation 1321/2014 Annex I (Part M.A.302) requires aircraft to be maintained in accordance with:',
     '[{"id":"a","text":"An Approved Maintenance Programme","correct":true},{"id":"b","text":"Whatever schedule the operator chooses, without NAA involvement","correct":false},{"id":"c","text":"The manufacturer''s production flight test manual","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, 'The distinction between a "Maintenance Programme" and a "Maintenance Schedule" is that:',
     '[{"id":"a","text":"The Maintenance Programme embraces scheduled tasks and associated procedures (including reliability monitoring), while the Maintenance Schedule embraces the tasks alone","correct":true},{"id":"b","text":"They are two different names for exactly the same document with no distinction","correct":false},{"id":"c","text":"The Maintenance Schedule always includes reliability monitoring while the Maintenance Programme does not","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, 'Within the primary maintenance processes of a Maintenance Schedule, parts whose failure could have a hazardous effect on the aircraft are covered under:',
     '[{"id":"a","text":"Mandatory Life Limitations","correct":true},{"id":"b","text":"Check cycle criteria only","correct":false},{"id":"c","text":"The record of amendments","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, 'A serious incident involving oil leakage on a large twin-engine aircraft, used as an example of the need for safety critical maintenance task procedures, was caused by:',
     '[{"id":"a","text":"Failure to re-install the drive cover plate on both engines following maintenance","correct":true},{"id":"b","text":"Incorrect fuel grade being uplifted","correct":false},{"id":"c","text":"An undetected bird strike","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, 'To reduce the risk of simultaneous incorrect maintenance on two or more safety-critical systems, operators should stagger similar critical tasks on essential/primary systems by at least:',
     '[{"id":"a","text":"One flight cycle","correct":true},{"id":"b","text":"One calendar year","correct":false},{"id":"c","text":"Ten flight hours","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, 'Pre-flight inspections are regulated in Part-M as a Continued Airworthiness task, and are:',
     '[{"id":"a","text":"Released to service by a CRS under Part-145","correct":false},{"id":"b","text":"Not released to service by a CRS under Part-145","correct":true},{"id":"c","text":"Only valid if performed by a licensed Part-66 engineer","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, 'A Duplicate Inspection is defined as an inspection:',
     '[{"id":"a","text":"Made and certified by one qualified person only, checked twice","correct":false},{"id":"b","text":"First made and certified by one qualified person, then made and certified by a second qualified person, not necessarily holding certification privileges","correct":true},{"id":"c","text":"Carried out exclusively by the aircraft manufacturer''s own staff","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, 'After completion of a duplicate inspection, if the Vital Point/Control System is subsequently disturbed:',
     '[{"id":"a","text":"No further action is required provided the original inspection was properly certified","correct":false},{"id":"b","text":"The disturbed part must again be inspected in duplicate and a CRS issued before the aircraft flies","correct":true},{"id":"c","text":"Only a single inspection by any qualified person is required before flight","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, 'EASA uses which term to describe the second-person checks known in EU Member States as Duplicate Checks?',
     '[{"id":"a","text":"Independent Check","correct":true},{"id":"b","text":"Compliance Check","correct":false},{"id":"c","text":"Reliability Check","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, 'An Airworthiness Directive shall contain at least which of the following?',
     '[{"id":"a","text":"An identification of the unsafe condition, the affected aircraft, the action(s) required and the compliance time","correct":true},{"id":"b","text":"Only the name of the aircraft manufacturer","correct":false},{"id":"c","text":"The purchase price of any replacement part required","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, 'When the urgency of a situation precludes consultation, priority publication of mandatory continuing airworthiness information is made by means of:',
     '[{"id":"a","text":"A routine Service Bulletin","correct":false},{"id":"b","text":"An Emergency Airworthiness Directive","correct":true},{"id":"c","text":"An informal notice to the operator only","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, 'Extended Range Twin Operations (ETOPS) is defined for aircraft with how many engines, conducted over a route containing a point beyond the approved threshold time from an adequate airport?',
     '[{"id":"a","text":"Two engines","correct":true},{"id":"b","text":"Three or four engines","correct":false},{"id":"c","text":"Any number of engines","correct":false}]',
     '{"B1","B2"}');

END $$;
