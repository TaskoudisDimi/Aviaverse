-- Module 10: Aviation Legislation (Common) — Air Operations, Certification of Aircraft, Parts and Appliances
-- Source: EASA Part-66 Module 10 official textbook (IKAROS Aviation Training Centre, IK02R5, Issue Nov.18)

DO $$
DECLARE
    m10_id INT;
    s4_id  INT;
    s5_id  INT;
BEGIN
    SELECT id INTO m10_id FROM easa_modules WHERE code = 'M10';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M10.4') THEN
        RAISE NOTICE 'M10.4/M10.5 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 10.4: Air Operations
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m10_id, 'M10.4', 'Air Operations',
        $cnt$
# Air Operations

**References:** Regulation 965/2012 and its AMC/GM

## General — Regulation History

In June 2008 the original EASA Basic Regulation (EC) 1592/2002 was replaced by Basic Regulation (EC) 216/2008, and in 2018 by Basic Regulation 2018/1139. In 2008, amongst other things, a new Annex IV was included and legislated for operation of aircraft under the name **Air Operations** or "**EU-OPS**".

EU-OPS 1 superseded JAR-OPS 1, though the content of EU-OPS 1 was at the time the same as JAR-OPS 1. JAR-OPS 3 (Helicopters) continued to be valid at the time. As per the EU effort to standardize Aviation Regulation, the Flight Operations Regulation was initially referenced to JAR-OPS 1 and later to EU-OPS 1.

As of October 2012, the Flight Operations Regulation came into full EASA force, in four main Parts:

1. **PART.ARO** — Authority Requirements for Air Operators
2. **PART.ORO** — Organization Requirements for Air Operators
3. **PART.CAT** — Commercial Air Transport Operations
4. **PART.SPA** — Specific Approvals

## Air Operators Certificate (AOC)

An operator shall operate an aircraft for the purpose of Commercial Air Transportation (CAT) only if it has been issued with an AOC by its Competent Authority and in compliance with **ORO.AOC.100**.

### ORO.GEN.110 Operator Responsibilities

- The operator is responsible for the operation of the aircraft in accordance with Annex IV to Regulation (EC) No 2018/1139, the relevant requirements of this Annex, and its certificate.
- Every flight shall be conducted in accordance with the provisions of the operations manual.
- The operator shall establish and maintain a system for exercising operational control over any flight operated under its certificate.
- The operator shall ensure that its aircraft are equipped and its crews are qualified as required for the area and type of operation.
- All personnel assigned to, or directly involved in, ground and flight operations shall be properly instructed, have demonstrated their abilities, and be aware of their responsibilities.
- The operator shall establish procedures and instructions for the safe operation of each aircraft type, containing ground staff and crew member duties. These procedures shall not require crew members to perform any activities during critical phases of flight other than those required for safe operation.
- The operator shall establish a **checklist system** for each aircraft type, to be used by crew members in all phases of flight under normal, abnormal and emergency conditions, observing human factors principles.
- The operator shall specify flight planning procedures, included in the operations manual.
- The operator shall establish and maintain **dangerous goods training programmes** for personnel, subject to review and approval by the competent authority.

### ORO.AOC.100 Application for an Air Operator Certificate

Prior to commencing commercial air operations, the operator shall apply for and obtain an AOC issued by the competent authority. The operator shall provide:

1. Official name and business name, address, and mailing address of the applicant;
2. A description of the proposed operation, including the type(s) and number of aircraft to be operated;
3. A description of the management system, including organisational structure;
4. The name of the accountable manager;
5. The names of the nominated persons required by ORO.AOC.135(a), with qualifications and experience;
6. A copy of the operations manual required by ORO.MLR.100;
7. A statement that all documentation sent to the competent authority has been verified by the applicant.

Applicants shall demonstrate to the competent authority that: they comply with all applicable requirements of Annex IV to Regulation (EC) No 2018/1139; all aircraft operated have a Certificate of Airworthiness (CofA) in accordance with Regulation (EC) No 1321/2014; and their organisation and management are suitable and properly matched to the scale and scope of the operation.

**Special limitations** (examples): CAT II/CAT III (all weather operation), Extended Range Twin Operation (ETOPS), Reduced Vertical Separation Minimum (RVSM), Transportation of Dangerous Goods.

## Compliance

### ORO.GEN.135 Continued Validity

The operator's certificate remains valid subject to: the operator remaining in compliance with Regulation (EC) No 2018/1139 and its Implementing Rules (taking into account provisions on handling of findings under ORO.GEN.150); the competent authority being granted access as defined in ORO.GEN.140; and the certificate not being surrendered or revoked. Upon revocation or surrender the certificate shall be returned to the competent authority without delay.

### ORO.GEN.140 Access

For determining compliance, the operator shall grant access at any time to any facility, aircraft, document, records, data, procedures or other material relevant to its activity, to persons authorised by the competent authority. Access to the aircraft includes the possibility to enter and remain in the aircraft during flight operations, unless otherwise decided by the commander for the flight crew compartment (per CAT.GEN.MPA.135) in the interest of safety.

### ORO.GEN.150 Findings

After receipt of notification of findings, the operator shall: identify the root cause of the non-compliance; define a corrective action plan; and demonstrate corrective action implementation to the satisfaction of the competent authority within an agreed period.

### ORO.GEN.155 Immediate Reaction to a Safety Problem

The operator shall implement any safety measures mandated by the competent authority, and any relevant mandatory safety information issued by the Agency, including airworthiness directives.

### ORO.GEN.160 Occurrence Reporting

The operator shall report to the competent authority any accident, serious incident and occurrence, and any incident, malfunction, technical defect or exceeding of technical limitations that has or may have endangered safe operation. **Reports shall be made as soon as practicable, but in any case within 72 hours** of the operator identifying the condition, unless exceptional circumstances prevent this.

## Documents to be Carried (CAT.GEN.MPA.180)

The following documents, manuals and information shall be carried on each flight (as originals or copies unless otherwise specified):

- The aircraft flight manual (AFM), or equivalent document(s)
- The original certificate of registration
- The original certificate of airworthiness (CofA)
- The noise certificate (with English translation where provided)
- A certified true copy of the air operator certificate (AOC)
- The operations specifications relevant to the aircraft type
- The original aircraft radio licence, if applicable
- The third party liability insurance certificate(s)
- The journey log, or equivalent
- The aircraft technical log, in accordance with Annex I (Part-M) to Regulation (EC) No 1321/2014
- Details of the filed Air Traffic Services (ATS) flight plan, if applicable
- Current and suitable aeronautical charts for the route and diversion routes
- Procedures and visual signals information for intercepting/intercepted aircraft
- Search and rescue services information, easily accessible in the flight crew compartment
- The current parts of the operations manual relevant to crew duties
- The MEL
- Appropriate NOTAMs and AIS briefing documentation
- Appropriate meteorological information
- Cargo and/or passenger manifests, if applicable
- Mass and balance documentation
- The operational flight plan, if applicable
- Notification of special categories of passenger (SCPs) and special loads, if applicable

## Master Minimum Equipment List (MMEL), MEL and CDL — ORO.MLR.105

MMEL, MEL and CDL are documents used by the operator to perform commercial flight operations even when some systems, components or requirements do not function to the defined standard. They define the required system function, operational limitations and rectification intervals.

### Master Minimum Equipment List (MMEL)

The MMEL is a master list appropriate to an aircraft type, determining those instruments, items of equipment or functions that, while maintaining the intended level of safety, may temporarily be inoperative — due to inherent design redundancy and/or specified procedures. Items related to airworthiness and not included in the list are automatically required to be operative. Non-safety-related equipment (e.g. galley equipment, passenger convenience items) need not be listed. **Only the type certificate holder may apply for MMEL approval.**

### Minimum Equipment List (MEL)

The MEL provides for operation of aircraft, under specified conditions, with particular instruments, equipment or functions inoperative at commencement of flight. It is prepared by the operator for its own aircraft. An operator shall establish, for each aircraft, an MEL approved by the authority. **The MEL shall be based upon, but no less restrictive than, the relevant MMEL.** The MEL may not be less stringent than the MMEL. A one-time extension of the rectification interval for MEL categories B, C and D may be permitted (same duration as specified in the MMEL); the authority must be notified within **ten days** of any extension authorised. Dispatch is not allowed after expiry of the rectification interval (and any extension).

### Configuration Deviation List (CDL)

Unlike the MEL (which is associated with inoperative equipment defining a safe deviation from certified configuration), items listed in the CDL define a **new certificated airplane configuration** — the airplane may be flown indefinitely without replacing a qualified missing part, remaining airworthy regardless of flight time with an open CDL item.

### MMEL/MEL Category Definitions

| Category | Rectification Interval |
|----------|------------------------|
| **A** | No standard interval specified; rectified per conditions stated in the MEL |
| **B** | Within 3 consecutive calendar days, excluding day of discovery |
| **C** | Within 10 consecutive calendar days, excluding day of discovery |
| **D** | Within 120 consecutive calendar days, excluding day of discovery |

Symbols: **m** = a maintenance action is required when operating with item inoperative; **o** = a specific operating procedure must be accomplished by the flight crew; ***** = the inoperative equipment must be indicated by a placard in the cockpit.

## Information to be Retained on the Ground (CAT.GEN.MPA.185)

The operator shall ensure that, for at least the duration of each flight or series of flights, information relevant to the flight is preserved on the ground (or carried in a fireproof container in the aircraft if impracticable). This includes: a copy of the operational flight plan; copies of the relevant part(s) of the aircraft technical log; route-specific NOTAM documentation if edited by the operator; mass and balance documentation if required; and special loads notification.

## Ground Operations

### Authority to Taxi an Aeroplane

An operator shall take all reasonable steps to ensure an aeroplane is not taxied by a person other than a flight crew member unless that person is duly authorised and competent to: taxi the aeroplane and use the radio telephone; and has received instruction on aerodrome layout, routes, signs, markings, lights, ATC signals and phraseology.

### Refuelling/Defuelling with Passengers (CAT.OP.MPA.195)

An aircraft shall **not** be refuelled/defuelled with Avgas or wide-cut type fuel (or a mixture) when passengers are embarking, on board or disembarking. For all other fuel types, necessary precautions shall be taken and the aircraft properly manned by qualified personnel ready to direct an evacuation.

### Push Back and Towing

The operator shall ensure push back and towing procedures comply with appropriate standards. Pre- or post-taxi positioning shall not be executed by towbarless towing unless the aeroplane is protected by design from nose wheel steering damage, a system/procedure alerts the flight crew to possible damage, or the towbarless vehicle is designed to prevent damage.

## Mass & Balance

### CAT.POL.MAB.100 Mass and Balance, Loading

During any phase of operation, loading, mass and CG shall comply with the limitations specified in the AFM (or the operations manual if more restrictive). The operator shall establish the mass and CG of any aircraft by **actual weighing** prior to initial entry into service and thereafter at intervals of **four years** if individual aircraft masses are used, or **nine years** if fleet masses are used. Weighing shall be accomplished by the aircraft manufacturer or an approved maintenance organisation. Aircraft shall be reweighed if the effect of modifications on mass and balance is not accurately known.

### CAT.POL.MAB.105 Mass and Balance Data and Documentation

The operator shall produce mass and balance documentation prior to each flight, specifying the load and distribution, and containing: aircraft registration and type; flight identification, number and date; name of the commander; name of the preparer; dry operating mass and corresponding CG; mass of fuel at take-off and trip fuel; mass of consumables other than fuel; load components (passengers, baggage, freight, ballast); take-off mass, landing mass and zero fuel mass; applicable CG positions; and limiting mass and CG values. The person supervising loading, and the commander, shall each confirm acceptance by hand signature or equivalent.

## Aircraft Maintenance Programs

The Operator has the responsibility to implement a **Maintenance Program (MP)** for its aircraft — normally one MP per aircraft type. The MP contains details of what is to be maintained and how often, published by the Original Equipment Manufacturer (OEM), who may also be the Type Certificate Holder (TCH). This document is commonly known as the **MPD (Maintenance Planning Document)**.

Under its **Part-M CAMO** capability, the Operator assesses and customises the MPD to its needs — but is **not allowed to reduce** any planned maintenance items, only to retain the same or increase them. The resulting document is the **MS (Maintenance Schedule)** — a dynamic, live document approved by the Operator's Competent Authority and run by dedicated software.

The department within Part-M responsible for implementing the MP is known as **"Planning"**, which generates paperwork for planned maintenance including: PDI (Pre-Departure Inspections), Daily Checks, Weekly Checks, A-Checks and C-Checks. Larger checks (weekly upwards) take the form of "Packages" including a summary of tasks, a Block CRS, and the tasks themselves.

The effectiveness of the MS is reviewed under a **Reliability process**, formal and conducted **quarterly** over a year, culminating in a formal meeting with responsible personnel (normally including the Competent Authority). Factors considered include: area of operation (e.g. salt water operations may require more frequent engine compressor washes; sandy areas or rough strips may affect required tasks); age of the aircraft (ageing structural inspections, significant repairs); and significant parts (make/type of engines, propellers, APU).

Some MPs are developed via an **MSG (Maintenance Steering Group) Analysis** — a process driven by logic diagrams followed by the MRB and Working Groups to determine task types and frequency, based on component/system failure modes and their visibility to the operating crew. The main elements of consideration when forming the MS are: **Zonal**, **Systems**, and **Corrosion Prevention**.
        $cnt$,
        4
    ) RETURNING id INTO s4_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 10.5: Certification of Aircraft, Parts and Appliances
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m10_id, 'M10.5', 'Certification of Aircraft, Parts and Appliances',
        $cnt2$
# Certification of Aircraft, Parts and Appliances

**References:** Regulation (EC) No. 748/2012, Implementing Rule (IR) Part-21 and its AMC/GM

## General

### Regulation (EC) No. 748/2012 — Initial Airworthiness

Commission Regulation (EC) No. 748/2012 lays down the implementing rules for the airworthiness and environmental certification of aircraft and related products, parts and appliances, and for the certification of design and production organisations. This regulation is part of the set of regulations governing airworthiness and environmental certification for the entire life of a product (alongside Regulation 1321/2014).

In accordance with Article 5(4) and 6(3) of the Basic Regulation, it specifies:

- The issue of type-certificates, restricted type-certificates, supplemental type-certificates and changes to those certificates
- The issue of certificates of airworthiness, restricted certificates of airworthiness, permits to fly and authorised release certificates
- The issue of repair design approvals
- The showing of compliance with environmental protection requirements
- The issue of Noise Certificates
- The identification of products, parts and appliances
- The certification of certain parts and appliances
- The certification of design and production organisations
- The issue of airworthiness directives

Annex I to this regulation is known as **"Part-21"** — a designation carried over from JAR-21, which was superseded by Regulation 1702/2003.

## Part-21: Certification of Aircraft and Related Products, Parts and Appliances, and of Design and Production Organisations

### Part-21 Contents by Section

- **Subpart A** — General provision
- **Subpart B** — Type-certificates and restricted type-certificates
- **Subpart D** — Changes to type-certificates and restricted type-certificates
- **Subpart E** — Supplemental type-certificates
- **Subpart F** — Production without Production Organisation Approval
- **Subpart G** — Production Organisation Approval
- **Subpart H** — Airworthiness Certificates
- **Subpart I** — Noise Certificates
- **Subpart M** — Repairs
- **Subpart O** — European Technical Standard Order Authorisations
- **Subpart Q** — Identification of Products, Parts and Appliances

## Certification Specifications (CS) and Airworthiness Codes

Certification Specifications are those specifications to which designers are required to demonstrate that their new products comply. All such "airworthiness codes" are directly derived from the JARs — the JAR denomination has been changed to **Certification Specification (CS)**.

Currently, the airworthiness codes include:

| Code | Applicability |
|------|----------------|
| CS-Definitions | Definitions |
| CS-22 | Sailplanes and Powered Sailplanes |
| CS-23 | Normal, Utility, Acrobatic and Commuter Aeroplanes |
| CS-25 | Large Aeroplanes |
| CS-27 | Small Rotorcraft |
| CS-29 | Large Rotorcraft |
| CS-VLR | Very Light Rotorcraft |
| CS-VLA | Very Light Aeroplanes |
| CS-E | Engines |
| CS-P | Propellers |
| CS-34 | Aircraft Engine Emission and Fuel Venting |
| CS-36 | Aircraft Noise |
| CS-APU | Auxiliary Power Units |
| CS-ETSO | European Technical Standard Orders |
| CS-AWO | All Weather Operations |

## Certification of Parts

Some parts are made for fitment to various aircraft and equipment (e.g. a hydraulic non-return valve), but only need be certified once. These parts may be certified in one of three ways:

1. **European Technical Standard Order authorization (ETSO)** (Part-21 Subpart Q)
2. Specifications written in the aircraft certification process
3. Standard parts in accordance with officially recognized standards

## Structure of Aircraft Certification Specifications

Airworthiness standards for aircraft certification (e.g. CS-23, 25, 27, 29) share a common structure:

- **Subpart A: General** — types and categories of aircraft to which the standard applies
- **Subpart B: Flight** — flight tests for performance, controllability, manoeuvrability, stability, etc.
- **Subpart C: Structure** — flight/ground load assessment, structural design of airframes, control systems, landing gears; crashworthiness and fatigue
- **Subpart D: Design and Construction** — design technique, materials, safety factors, structural tests, cockpit/cabin design, fire protection, flutter
- **Subpart E: Power Plant** — power plant installations, fuel/oil/exhaust systems, controls, accessories, fire protection
- **Subpart G: Operating Limitations and Information** — information for the pilot and personnel, from markings/placards to flight manual content
- **Appendices** — simplified design load criteria, material flammability test procedures, instructions for continued airworthiness, etc.

## Sub Part J — Design Organisation Approval (DOA)

DOA is controlled by Part-21 Subpart J. The main duties and responsibilities of a design organisation are: to design; to demonstrate compliance with applicable requirements; to independently check statements of compliance; to provide items for continued airworthiness; to check the work of partners/subcontractors; and to independently monitor these functions.

A crucial element is the institution of a **Design Assurance System (DAS)** for control and supervision of the design and design changes, covering the achievement of the type certificate, approval of changes, and continued airworthiness. The DAS should include an organisational structure to control the design; show compliance with certification and environmental requirements; independently check compliance; liaise with the Agency; continuously evaluate the design organisation; and control subcontractors.

A DOA is granted for a particular part or product. An aircraft or engine manufacturer will normally hold both DOA and POA approvals.

## Sub Part G — Production Organisation Approval (POA)

Part-21 Subpart G details the issuance of a production organisation approval, showing conformity of products, parts and appliances with applicable design data.

### POA Compliance Monitoring System

The production organisation must demonstrate an established, documented **Compliance Monitoring System**, ensuring each product, part or appliance produced (or subcontracted) conforms to applicable design data and is in condition for safe operation, with specific provisions for critical parts. An independent compliance assurance function monitors compliance, feeding back to the Accountable Manager for corrective action.

### Approval Requirements

The production organisation must demonstrate that facilities, working conditions, equipment/tools, processes, staff competence and organisation are adequate; and that it receives, correctly incorporates, and keeps up to date all necessary airworthiness, noise, fuel venting and exhaust emissions data.

## Sub Part F — Production Without Production Organisation Approval

Subpart F establishes the procedure for demonstrating conformity of a product, part or appliance manufactured without a POA under Subpart G. Any person may apply to show conformity if it holds (or has applied for) a design approval, or has ensured satisfactory coordination between production and design.

### Issue of a Letter of Agreement

The applicant is entitled to a **letter of agreement** issued by the Competent Authority, after establishing a production inspection system and providing a manual describing that system, determination means, and conformance tests. The letter of agreement is issued for a **limited duration not exceeding one year**, and remains valid unless compliance fails, control cannot be maintained, requirements are no longer met, or it is surrendered, revoked or expired.

## Sub Part B — Type Certification

Type certification is required for any Aircraft, Engine (including APUs) or Propeller. Upon certification, the **Type Certificate** is issued. Note that a type certificate is **not** authority to fly — a valid Certificate of Airworthiness is required for each aircraft before it can enter service; the type-certificate is a pre-requisite for each series aircraft's CofA issue.

The manufacturer is normally the applicant for a type certificate; any EU manufacturer must apply directly to EASA. Where the manufacturer is no longer the certificate owner (e.g. out of business), the owner is generally referred to as the **Type-Certificate Holder (TCH)**.

### Type Certificates and Restricted Type Certificates

This Subpart establishes the procedure for issuing type certificates for products and restricted type certificates for aircraft, and the rights/obligations of applicants and holders.

### Demonstration of Capability

Any organisation applying for a type-certificate or restricted type-certificate shall demonstrate its capability by holding a **Part-21 Subpart J Design Organisation Approval**.

### Compliance with the Type-Certification Basis and Environmental Protection Requirements

The applicant shall show compliance with the applicable type certification basis and environmental protection requirements, and declare that it has done so — this declaration is made per Subpart J provisions where the applicant holds an appropriate DOA.

### Issue of a Type Certificate

The applicant is entitled to have a type certificate issued by EASA after: demonstrating capability (21A.14); submitting the declaration (21A.20(b)); showing the product meets the applicable type certification basis and environmental protection requirements (usually via a Certificate of Design issued by the design organisation); that any non-compliant airworthiness provisions are compensated by an equivalent level of safety; that no feature makes it unsafe for its intended use; and that the applicant has expressly stated it is prepared to comply with **21A.44**. Where an engine or propeller is installed, it must also have a type certificate issued or determined accordingly.

### Issue of a Restricted Type-Certificate

For an aircraft not of normal design (per 21A.21(c)), the applicant is entitled to a restricted type certificate after complying with the appropriate type certification basis ensuring adequate safety, and expressly stating compliance with 21A.44. The installed engine or propeller must have a type-certificate, or be shown to comply with certification specifications necessary to ensure safe flight.

### Type Design

Type design consists of: the drawings and specifications (and a listing of them) defining configuration and design features; information on materials, processes, manufacture and assembly; an approved airworthiness limitations section of the instructions for continued airworthiness; and other data allowing determination of airworthiness, noise, fuel venting and exhaust emissions of later products of the same type.

### Type Certificate

The type-certificate and restricted type certificate include the type design, operating limitations, the type certificate data sheet for airworthiness and emissions, the applicable certification basis, and other conditions/limitations. The aircraft type certificate additionally includes the type certificate data sheet for noise; the engine type certificate data sheet includes the record of emission compliance.

### Manuals / Instructions for Continued Airworthiness

The holder of a type-certificate or restricted type-certificate shall produce, maintain and update master copies of all required manuals, providing copies to the Agency on request. The holder shall furnish at least one set of complete instructions for continued airworthiness to each known owner, upon delivery or issue of the first certificate of airworthiness (whichever occurs later), and thereafter make changes available to all known operators.

### Changes in Type Design

- **Minor changes** are those with no appreciable effect on mass, balance, structural strength, reliability, or operational characteristics (noise, fuel venting, exhaust emission) — approved by the Agency or an appropriately approved design organisation.
- **Major changes** are all other changes and must be approved by the Agency. A new Type Certificate is required if the proposed change is: for aircraft, in the number of engines/rotors or their operating principle; for an engine, in the principle of operation; for a propeller, in the number of blades or principle of pitch change operation.

## Sub Part E — Supplemental Type Certification

Where a person alters a product by introducing a major change not sufficient to require a new type certificate application, they shall apply for a **Supplemental Type Certificate (STC)** (e.g. a crop-spraying system installed on a certificated aircraft, or converting a passenger aeroplane to cargo). Any organisation applying for an EASA STC shall demonstrate capability by holding a DOA (or, by derogation, alternative approved procedures). A person may change an aircraft, engine, propeller or appliance based on an existing STC only if they are the STC holder or have permission from the holder.

## (b) Documents

### Certificate of Registration (C of R)

Issued by the EU State's National Aviation Authority (each EU state has its own register). It must be accessible and stored with other airworthiness certificates in the cockpit, per Part CAT.GEN. An aircraft shall not fly in a country unless registered in a Contracting State party to ICAO. The certificate is **not subject to renewal** and remains valid unless there is a change in ownership, the aircraft is destroyed, or permanently withdrawn from use.

### The Registration Plate

Every aircraft shall have a **fireproof Registration Plate** bearing the aircraft's nationality and registration mark, name and address of owner, and the manufacturer's designation and serial number — mounted on a major structural part, usually near the front door.

## Sub Part H — Certificate of Airworthiness (C of A)

The C of A must be accessible and stored with other airworthiness certificates in the cockpit, per Regulation 965/2012. It is valid for an **unlimited period**, subject to a valid Airworthiness Review Certificate (ARC), issued by a Part-M organisation, being attached.

Airworthiness certificates are classified as:

- **Certificates of Airworthiness** — for aircraft conforming to a type-certificate issued per Part-21
- **Restricted Certificates of Airworthiness** — for aircraft conforming to a restricted type-certificate, or shown to comply with specific certification specifications
- **Permits to Fly** — for aircraft not meeting applicable certification specifications but capable of safe flight under defined conditions

Basic documents required for a C of A: Certificate of Registration; Type Certificate (including type certificate data sheet); approved AFM; Weight and Balance Report with loading schedule; Radio License and installation approval; and a recommendation for the issue of an ARC. **Note: a C of A is not valid if a valid ARC is not attached** (see Part-M Subpart I).

## Sub Part J — Noise Certificate

The Noise Certificate must be accessible and stored with other airworthiness certificates in the cockpit, per Part CAT.GEN. Any aircraft registered in an EU Member State shall have a Noise Certificate; an aeroplane, flight-tested per CS-36 and operated within its type certificate limits, shall not exceed the noise levels specified in **CS-36.140**.

A Noise Certificate is issued by the competent authority of the Member State of registry, normally in conjunction with the C of A. It shall be issued for an **unlimited duration**, remaining valid subject to compliance with applicable requirements, the aircraft remaining on the same register, and the underlying type-certificate not being invalidated, surrendered or revoked. If ownership changes on the same register, the Noise Certificate transfers with the aircraft; if the aircraft moves register, a new Noise Certificate is issued upon presentation of the former one.

## Weight and Balance

### Weight and Balance Schedule

An operator shall specify, in the operations manual, the principles and methods of the mass and balance system meeting Part-CAT requirements. Each weight change must be recorded in the weight and balance sheet; a scheduled aircraft weighing must be established; and for every flight a weight calculation (load sheet) must be performed and signed by the pilot.

### Weight and Centre-of-Gravity Schedule

Details the Basic Weight and CG position, and the weight/lever arms of load items (fuel, oil, other fluids). It is divided into **Part A — Basic Weight**, **Part B — Variable Load**, and **Part C — Loading Information (Disposable Load)**.

A Weight and Centre-of-Gravity Schedule shall be provided for each aircraft whose MTWA exceeds **2730 kg (6000 lb)**. For aircraft not exceeding 2730 kg MTWA, either a Weight and Centre of Gravity Schedule, or alternatively a Load and Distribution Schedule, shall be provided.

### Weight and Centre-of-Gravity Definitions

- **Basic Weight** — the weight of the aircraft and all basic equipment, plus declared unusable fuel and unusable oil (for turbine-engine aircraft not exceeding 5700 kg MTWA, may also include usable oil)
- **Basic Equipment** — inconsumable fluids and equipment common to all roles for which the operator intends to use the aircraft
- **Variable Load** — weight of the crew, crew's baggage, removable units and other equipment depending on the role of the particular flight
- **Disposable Load** — weight of all persons and items of load (including fuel and consumable fluids) other than Basic Equipment and Variable Load
- **Total Loaded Weight** — the sum of Basic Weight and the Variable/Disposable Load items carried for the particular role (also known as **APS Weight** — Aircraft Prepared for Service Weight)

## Aircraft Radio Station License and Approval

The aircraft radio station license must be accessible and stored with other airworthiness certificates in the cockpit, per Part CAT.GEN. A radio installation license is issued following application, and only becomes valid when the appropriate State department has issued a "Certificate of Approval of Radio Installation." **The Radio License expires and needs to be renewed every year.**
        $cnt2$,
        5
    ) RETURNING id INTO s5_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M10.4 Air Operations (16 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s4_id, 'An operator may operate an aircraft for the purpose of Commercial Air Transportation (CAT) only if:',
     '[{"id":"a","text":"It has been issued with an Air Operators Certificate (AOC) by its Competent Authority, in compliance with ORO.AOC.100","correct":true},{"id":"b","text":"It holds a valid Certificate of Registration only","correct":false},{"id":"c","text":"The pilot in command personally holds a commercial operations licence","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'Under ORO.GEN.110, who is responsible for establishing a checklist system for each aircraft type?',
     '[{"id":"a","text":"The competent authority","correct":false},{"id":"b","text":"The operator","correct":true},{"id":"c","text":"The type certificate holder","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'Which of the following is required information in an application for an Air Operator Certificate under ORO.AOC.100?',
     '[{"id":"a","text":"The name of the accountable manager","correct":true},{"id":"b","text":"The registration numbers of all competitor aircraft","correct":false},{"id":"c","text":"A list of all previous owners of the operator company","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'Under ORO.GEN.160, occurrence reports relating to an incident or technical defect shall be made:',
     '[{"id":"a","text":"Within 30 days of the occurrence","correct":false},{"id":"b","text":"As soon as practicable, but in any case within 72 hours of the operator identifying the condition","correct":true},{"id":"c","text":"Only at the next scheduled maintenance check","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'Which document, among those to be carried on board per CAT.GEN.MPA.180, must be carried in accordance with Annex I (Part-M) to Regulation (EC) No 1321/2014?',
     '[{"id":"a","text":"The aircraft technical log","correct":true},{"id":"b","text":"The cargo manifest","correct":false},{"id":"c","text":"The noise certificate translation","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'Who is entitled to apply for MMEL approval for an aircraft type?',
     '[{"id":"a","text":"Any approved maintenance organisation","correct":false},{"id":"b","text":"Only the type certificate holder","correct":true},{"id":"c","text":"Any operator flying that aircraft type","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'Regarding the relationship between an operator''s MEL and the aircraft type''s MMEL:',
     '[{"id":"a","text":"The MEL must be based upon, and may not be less restrictive than, the relevant MMEL","correct":true},{"id":"b","text":"The MEL may be less restrictive than the MMEL if approved locally","correct":false},{"id":"c","text":"The MEL and MMEL are unrelated documents","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'Under MMEL/MEL rectification categories, an item classified in Category C must be rectified within:',
     '[{"id":"a","text":"3 consecutive calendar days, excluding the day of discovery","correct":false},{"id":"b","text":"10 consecutive calendar days, excluding the day of discovery","correct":true},{"id":"c","text":"120 consecutive calendar days, excluding the day of discovery","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'In the MMEL/MEL, an inoperative item marked with an asterisk (*) means:',
     '[{"id":"a","text":"A maintenance action is required when operating with the item inoperative","correct":false},{"id":"b","text":"A specific operating procedure must be accomplished by the flight crew","correct":false},{"id":"c","text":"The inoperative equipment, system or function must be indicated by a placard in the cockpit","correct":true}]',
     '{"B1","B2"}'),

    (s4_id, 'How does a Configuration Deviation List (CDL) item differ from a Minimum Equipment List (MEL) item?',
     '[{"id":"a","text":"A CDL item defines a new certificated aircraft configuration, whereas an MEL item defines a safe deviation from the certified configuration","correct":true},{"id":"b","text":"A CDL item always requires immediate rectification, while MEL items never do","correct":false},{"id":"c","text":"CDL and MEL items are identical in meaning and use","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'An aircraft shall not be refuelled/defuelled with Avgas or wide-cut type fuel:',
     '[{"id":"a","text":"When passengers are embarking, on board, or disembarking","correct":true},{"id":"b","text":"At any airport with fewer than two fuel trucks available","correct":false},{"id":"c","text":"Only at night","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'Under CAT.POL.MAB.100, if individual aircraft masses are used, the mass and centre of gravity of an aircraft must be re-established by actual weighing at intervals of:',
     '[{"id":"a","text":"Two years","correct":false},{"id":"b","text":"Four years","correct":true},{"id":"c","text":"Nine years","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'Weighing of an aircraft for mass and balance purposes shall be accomplished by:',
     '[{"id":"a","text":"Any licensed pilot","correct":false},{"id":"b","text":"The manufacturer of the aircraft or an approved maintenance organisation","correct":true},{"id":"c","text":"The competent authority exclusively","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'The document published by the OEM/TCH detailing what is to be maintained on an aircraft and how often is commonly known as the:',
     '[{"id":"a","text":"MPD (Maintenance Planning Document)","correct":true},{"id":"b","text":"ARC (Airworthiness Review Certificate)","correct":false},{"id":"c","text":"AOC (Air Operator Certificate)","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'When an operator customises the OEM''s MPD into its own Maintenance Schedule (MS) under its Part-M CAMO capability, it is:',
     '[{"id":"a","text":"Permitted to reduce planned maintenance items freely","correct":false},{"id":"b","text":"Not allowed to reduce any planned maintenance items, only to retain or increase them","correct":true},{"id":"c","text":"Required to double every task interval specified in the MPD","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'The effectiveness of an operator''s Maintenance Schedule (MS) is formally reviewed under a Reliability process:',
     '[{"id":"a","text":"Only once, at the time the MS is first approved","correct":false},{"id":"b","text":"Quarterly, over the course of a year","correct":true},{"id":"c","text":"Every five years","correct":false}]',
     '{"B1","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M10.5 Certification of Aircraft, Parts and Appliances (17 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s5_id, 'Commission Regulation (EC) No. 748/2012 lays down the implementing rules for:',
     '[{"id":"a","text":"The airworthiness and environmental certification of aircraft, related products, parts and appliances, and of design and production organisations","correct":true},{"id":"b","text":"Air traffic control procedures within controlled airspace","correct":false},{"id":"c","text":"Passenger rights and compensation for delayed flights","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'Annex I to Regulation (EC) No. 748/2012 is commonly known as:',
     '[{"id":"a","text":"Part-M","correct":false},{"id":"b","text":"Part-21","correct":true},{"id":"c","text":"Part-145","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'Which Part-21 Subpart deals with Production Organisation Approval?',
     '[{"id":"a","text":"Subpart F","correct":false},{"id":"b","text":"Subpart G","correct":true},{"id":"c","text":"Subpart H","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'Which Part-21 Subpart covers Supplemental Type Certificates?',
     '[{"id":"a","text":"Subpart D","correct":false},{"id":"b","text":"Subpart E","correct":true},{"id":"c","text":"Subpart Q","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'The airworthiness codes formerly known by the JAR denomination are now known as:',
     '[{"id":"a","text":"Certification Specifications (CS)","correct":true},{"id":"b","text":"Type Certificate Data Sheets (TCDS)","correct":false},{"id":"c","text":"Airworthiness Directives (AD)","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'Which Certification Specification applies to Large Aeroplanes?',
     '[{"id":"a","text":"CS-23","correct":false},{"id":"b","text":"CS-25","correct":true},{"id":"c","text":"CS-27","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'A part with wide applicability, such as a hydraulic non-return valve fitted to many aircraft types, may be certified by which of the following means?',
     '[{"id":"a","text":"European Technical Standard Order authorization (ETSO)","correct":true},{"id":"b","text":"A separate type certificate issued for the part alone under Subpart B","correct":false},{"id":"c","text":"An operator-issued Letter of Agreement only","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'In the standard structure of an aircraft Certification Specification (e.g. CS-25), which Subpart deals with flight and ground load assessment and structural design of airframes?',
     '[{"id":"a","text":"Subpart B: Flight","correct":false},{"id":"b","text":"Subpart C: Structure","correct":true},{"id":"c","text":"Subpart E: Power Plant","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'A Design Organisation Approval (DOA), issued under Part-21 Subpart J, is:',
     '[{"id":"a","text":"Issued to an entire nation''s aviation industry collectively","correct":false},{"id":"b","text":"Granted for a particular part or product","correct":true},{"id":"c","text":"Never held simultaneously with a Production Organisation Approval","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'Under Part-21 Subpart F, a Letter of Agreement permitting production without a Production Organisation Approval is issued for a limited duration not exceeding:',
     '[{"id":"a","text":"Six months","correct":false},{"id":"b","text":"One year","correct":true},{"id":"c","text":"Five years","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'A Type Certificate, once issued for an aircraft type, is:',
     '[{"id":"a","text":"In itself, authority for a specific aircraft to fly","correct":false},{"id":"b","text":"Not authority to fly — a valid Certificate of Airworthiness is still required for each individual aircraft","correct":true},{"id":"c","text":"Only required for aircraft manufactured outside the EU","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'Any organisation applying for a type-certificate or restricted type-certificate must demonstrate its capability by holding:',
     '[{"id":"a","text":"A Part-21 Subpart J Design Organisation Approval","correct":true},{"id":"b","text":"An Air Operator Certificate","correct":false},{"id":"c","text":"A Part-145 maintenance organisation approval","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'Under Part-21, a "minor change" to a type design is one that:',
     '[{"id":"a","text":"Has no appreciable effect on mass, balance, structural strength, reliability or operational characteristics","correct":true},{"id":"b","text":"Changes the number of engines fitted to the aircraft","correct":false},{"id":"c","text":"Always requires the issue of a new type certificate","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'A Supplemental Type Certificate (STC) is applied for when:',
     '[{"id":"a","text":"A person alters a product with a major change not sufficient to require a new type certificate application","correct":true},{"id":"b","text":"An aircraft is simply repainted in a new livery","correct":false},{"id":"c","text":"An operator wants to renew its Air Operator Certificate","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'The Certificate of Registration of an aircraft:',
     '[{"id":"a","text":"Must be renewed annually","correct":false},{"id":"b","text":"Is not subject to renewal and remains valid unless ownership changes or the aircraft is destroyed or permanently withdrawn from use","correct":true},{"id":"c","text":"Expires automatically after ten years","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'A Certificate of Airworthiness (C of A), once issued, is valid:',
     '[{"id":"a","text":"For an unlimited period, subject to a valid Airworthiness Review Certificate (ARC) being attached","correct":true},{"id":"b","text":"For exactly one year, renewable indefinitely","correct":false},{"id":"c","text":"Only for the duration of a single flight","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'A Weight and Centre-of-Gravity Schedule shall be provided for each aircraft whose MTWA exceeds:',
     '[{"id":"a","text":"1000 kg (2200 lb)","correct":false},{"id":"b","text":"2730 kg (6000 lb)","correct":true},{"id":"c","text":"5700 kg (12500 lb)","correct":false}]',
     '{"B1","B2"}');

END $$;
