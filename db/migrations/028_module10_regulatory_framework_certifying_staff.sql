-- Module 10: Aviation Legislation (B1/B2 Common) — Regulatory Framework, Certifying Staff - Maintenance
-- Source: EASA Part-66 Module 10 official textbook (IKAROS Aviation Training Centre, IK02R5, Issue Nov.2018)

DO $$
DECLARE
    m10_id INT;
    s1_id  INT;
    s2_id  INT;
BEGIN
    SELECT id INTO m10_id FROM easa_modules WHERE code = 'M10';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M10.1') THEN
        RAISE NOTICE 'M10.1-M10.2 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 10.1: Regulatory Framework
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m10_id, 'M10.1', 'Regulatory Framework',
        $cnt$
# Regulatory Framework

## Key References

- **EASA Regulation (EC) No. 2018/1139** — Basic Regulation
- **EASA Regulation (EC) No. 1321/2014** — Part-M / Part-66 / Part-145 / Part-147
- **EASA Regulation (EC) No. 748/2012** — Part-21
- **EASA Regulation (EC) No. 965/2012** — Air Operations

## International Civil Aviation Organisation (ICAO)

After the Second World War, international air travel was in its infancy but developing rapidly — not least because of the Gas Turbine Engine — yet there were no common standards between countries. The American Government recognised this and brought together the allied nations in **1944** to discuss the issue. **52 of 55 invited nations** attended the talks in **Chicago in November 1944**. After **5 weeks** of discussion, the outcome was the **Convention on International Civil Aviation**, consisting of a preface and **96 Articles**.

An organisation was needed to develop these Articles, and as a result **ICAO** came into existence in **1947**, based in **Montreal, Canada**. ICAO is one of the many agencies of the **United Nations (UN)**. Each member country of ICAO is known as a **Contracting State**, due to its contractual commitment to the Chicago Convention.

### ICAO Aims and Objectives

In promulgating safety and airworthiness information internationally, the aims and objectives of ICAO are to develop the principles and techniques of international air navigation and to foster the planning and development of international air transport so as to:

1. Ensure the safe and orderly growth of international civil aviation throughout the world.
2. Encourage the arts of aircraft design and operation for peaceful purposes.
3. Encourage the development of airways, airports and air navigation facilities for international civil aviation, and meet the needs of the peoples of the world for safe, regular, efficient and economical air transport.
4. Prevent economic waste caused by unreasonable competition.
5. Ensure that the rights of the Contracting States are fully respected and that every Contracting State has a fair opportunity to operate international airlines.
6. Avoid discrimination between Contracting States.
7. Promote safety of flight in international air navigation.
8. Promote generally the development of all aspects of international civil aeronautics.

### How ICAO Works

The constitution of ICAO is the **Convention on International Civil Aviation**, drawn up in Chicago in November/December 1944. According to the Convention, the Organisation is made up of an **Assembly**, a **Council** of limited membership with various subordinate bodies, and a **Secretariat**. The chief officers are the **President of the Council** and the **Secretary General**.

| Body | Composition | Role |
|------|-------------|------|
| **Assembly** | Representatives of all Contracting States | The sovereign body of ICAO. Meets every **three years**, reviews the work of the Organisation, sets policy, and votes a triennial budget. |
| **Council** | **36 States**, elected by the Assembly for a three-year term | The governing body — gives continuing direction to ICAO's work. Adopts Standards and Recommended Practices as Annexes to the Convention. Assisted by the Air Navigation Commission (technical matters), the Air Transport Committee (economic matters), the Committee on Joint Support of Air Navigation Services, and the Finance Committee. |
| **Secretariat** | Headed by the Secretary General; recruited on a broad geographical basis | Divided into five main divisions: the Air Navigation Bureau, the Air Transport Bureau, the Technical Co-operation Bureau, the Legal Bureau, and the Bureau of Administration and Services. |

The Assembly chooses the Council Member States under three headings: States of chief importance in air transport, States which make the largest contribution to the provision of facilities for air navigation, and States whose designation will ensure that all major areas of the world are represented.

ICAO works in close co-operation with other UN family members such as the World Meteorological Organization, the International Telecommunication Union, the Universal Postal Union, the World Health Organization and the International Maritime Organization. Non-governmental organisations that also participate include the International Air Transport Association, the Airports Council International, the International Federation of Air Line Pilots' Associations, and the International Council of Aircraft Owner and Pilot Associations.

## The International Standards

Since its creation, ICAO's main achievement has been to establish a set of standards for a safe, regular and efficient service. Standardisation has been achieved through **19 Annexes** to the Convention, known as **International Standards and Recommended Practices**. The difference between the two: a **standard is essential**, a **recommended practice is desirable**. If a member state has a standard different from ICAO's, it must inform ICAO of the difference.

| Annex | Title | Subject |
|-------|-------|---------|
| 1 | Personnel Licensing | Licensing of flight crews, air traffic controllers, and aircraft maintenance personnel, including medical standards for flight crews and air traffic controllers |
| 2 | Rules of the Air | Rules relating to visual and instrument-aided flight |
| 3 | Meteorological Service for International Air Navigation | Meteorological services and reporting of observations from aircraft |
| 4 | Aeronautical Charts | Specifications for charts used in international aviation |
| 5 | Units of Measurement to be used in Air and Ground Operations | Dimensional systems for air and ground operations |
| 6 | Operation of Aircraft | Level of safety above a prescribed minimum. Part I: International Commercial Air Transport – Airplanes; Part II: International General Aviation – Airplanes; Part III: International Operations – Helicopters |
| 7 | Aircraft Nationality and Registration Marks | Requirements for registration and identification of aircraft |
| 8 | Airworthiness of Aircraft | Uniform procedures for certification and inspection of aircraft |
| 9 | Facilitation | Standardisation and simplification of border crossing formalities |
| 10 | Aeronautical Telecommunications | Vol.1 communications equipment/systems; Vol.2 communications procedures |
| 11 | Air Traffic Services | Establishing and operating ATC, flight information and alerting services |
| 12 | Search and Rescue | Organisation and operation of SAR facilities and services |
| 13 | Aircraft Accident and Incident Investigation | Uniformity in notifying, investigating and reporting on accidents |
| 14 | Aerodromes | Design and equipment of aerodromes |
| 15 | Aeronautical Information Services | Collecting and disseminating aeronautical information |
| 16 | Environmental Protection | Vol.1 aircraft noise certification/monitoring; Vol.2 aircraft engine emissions |
| 17 | Security | Safeguarding international civil aviation against acts of unlawful interference |
| 18 | The Safe Transport of Dangerous Goods by Air | Safe transport of hazardous materials in aircraft |
| 19 | Safety Management | Responsibilities of Contracting States for safe operation of aircraft |

Because aeronautical technology continuously develops, the Annexes are constantly reviewed and updated. The typical content of an Annex is based upon: (1) **Standards** — specifications considered necessary for the safety and regularity of international air navigation; (2) **Recommended Practices** — specifications considered a recommendation in the interest of safety, regularity and efficiency; (3) **Appendices** dealing with the preceding points; (4) **Definitions** of the terminology used.

Contracting States issue their own national requirements, which state the principles/objectives to attain rather than strictly copying the Annex content; these are influenced by the state of the art (technical evolution, new technology, acquired experience) and are amended accordingly.

The applicable EASA airworthiness standards for internationally-recognised aircraft certification are issued in accordance with the ICAO Annexes; in practice, the certification process is based on these EASA airworthiness standards rather than directly on the ICAO International Standards. For the licensed engineer, **Annex 6 (Operation of Aircraft)**, **Annex 8 (Airworthiness of Aircraft)** and **Annex 16 (Environmental Protection)** are particularly relevant.

## European Aviation Safety Agency (EASA)

Prior to 2003, control of the aviation industry in an ICAO member state was executed by the **National Aviation Authority (NAA)** of that state — each Member State had its own NAA.

EASA was created by **European Parliament and Council Regulation (EC) No. 1592/2002** of 15 July 2002, which put in place a European Community system of air safety and environmental protection. This regulation was amended by **Regulation (EC) No. 216/2008**, and is now superseded by **Regulation (EC) No. 2018/1139**, known as the **Basic Regulation**. EASA is the agency that creates implementing regulations satisfying the requirements of the Basic Regulation.

Prior to EASA there was a European organisation called the **Joint Aviation Authorities (JAA)**, which standardised regulations of various European states in accordance with the ICAO Annexes. EASA took over all functions of the JAA; the JAA was **dissolved in June 2009**, and all Joint Aviation Regulations (JARs) have been superseded by equivalent EASA Regulations. The major difference between the JAA and EASA is that **JAA regulations were not legally binding** on NAAs, whereas **EASA regulations are part of the legally binding law of the European Parliament**, formed by the Treaty of Rome — all EU members are signed up to this treaty, so EASA regulations have the force of law within member states. EASA is based in **Cologne, Germany**.

### Purpose of EASA

EASA is the centrepiece of the European Union's strategy for aviation safety. Its mission is to **promote the highest common standards of safety and environmental protection in civil aviation**. EASA's tasks are:

1. To assist the European Commission in preparing legislation, and support Member States and industry in putting the legislation into effect.
2. To assist the European Commission in monitoring the application of European Community legislation.
3. To adopt its own certification specifications and guidance material, conduct technical inspections, and issue certificates where centralised action is more efficient.

The Agency develops its know-how across all fields of aviation safety and environmental protection to assist Community legislators in issuing common rules for: the certification of aeronautical products, parts and appliances; the approval of organisations and personnel engaged in maintenance; the approval of air operations; the licensing of aircrew; and the safety oversight of airports and air traffic services operators.

### EASA Structure

The National Aviation Authorities of the EU member states are known as EASA **Competent Authorities (CAs)**. The Competent Authorities are responsible for administering and enforcing the Rules and Regulations produced by EASA, and are also responsible for maintaining an individual register of aircraft for their state, and a register of organisations (such as airline companies operating under an Air Operator's Certificate) situated in their territories.

### Aircraft Regulated by EASA

All aircraft are covered by Regulation (EC) 2018/1139 except those excluded by **Article 1** of 2018/1139, which comprises aircraft engaged in military, customs, police or similar services. **Appendix II** of the regulation also excludes historical, experimental, homebuilt and microlight aircraft, very light gliders and very light unmanned aircraft. The definition of "aircraft" is found in Article 2 of Regulation (EC) No. 1321/2014:

> **'Aircraft' means any machine that can derive support in the atmosphere from the reactions of the air other than reactions of the air against the earth's surface.**

**Excluded Aircraft:**

- Aircraft used by the Military, Customs, Police (Government Aircraft)
- Aircraft of which at least **51%** is built by an amateur, or a non-profit-making association of amateurs, for their own purposes and without any commercial objective
- Aircraft that have been in the service of military forces, unless the aircraft is of a type for which a design standard has been adopted by the Agency
- Aeroplanes, helicopters and powered parachutes having no more than two seats, with a Maximum Take-Off Mass (MTOM) of between **300–495 kg**, depending on type
- Aeroplanes with a stall speed or minimum steady flight speed in landing configuration not exceeding **35 knots** calibrated air speed (CAS)
- Single- and two-seater gyroplanes with a maximum take-off mass not exceeding **560 kg**
- Gliders with a maximum empty mass of no more than **80 kg** (single-seat) or **100 kg** (two-seat), including those which are foot-launched

### Membership of EASA

EASA comprises the **28** European Union (EU) States (Austria, Belgium, Bulgaria, Croatia, Cyprus, Czech Republic, Denmark, Estonia, Finland, France, Germany, Greece, Hungary, Ireland, Italy, Latvia, Lithuania, Luxembourg, Malta, Netherlands, Poland, Portugal, Romania, Slovakia, Slovenia, Spain, Sweden, United Kingdom), plus **4 additional European states**: **Iceland, Liechtenstein, Norway and Switzerland**.

### Relationships with Other Organisations

- **Interested parties in industry**, subject to EASA rules, assist in drafting and correct application of European Community and EASA rules.
- **International aviation organisations** such as EUROCONTROL and ICAO work with EASA to promote international civil aviation standards.
- **International aviation authorities** such as the FAA, Transport Canada, DAC/CTA (Brazil), and the Interstate Aviation Committee (Russia) work with EASA to ensure compliance with international standards and facilitate trade in aeronautical products.
- A **trilateral agreement** between EASA, FAA and Transport Canada allows the release to service of components certified by these organisations in each other's country, without a dual release requirement on the Form 1 (or 8130-3).
- **Accident investigation bodies** issue safety recommendations and analysis that guide EASA's safety strategy.

## Principal EASA Regulations

EASA Regulations are written and issued by EASA, for and on behalf of the EU Parliament, and are published in the **Official Journal of the European Union** (viewable online at eur-lex.europa.eu). The drafting and approval of rules ("rulemaking") is a lengthy process, and involvement of the EU National Aviation Authorities is maintained throughout via the **Advisory Group of National Authorities (AGNA)**.

### EASA Regulation Parts

Each Part consists of two sub-sections:

- **Sub-section A** — contains the implementing rules for personnel and organisations.
- **Sub-section B** — contains implementing rules enabling the Competent Authorities of EASA to carry out their duties.

Sub-section paragraphs are recognised by the inclusion of "A" or "B" in the paragraph number, e.g. **66.A.20 Privileges**, **66.B.20 Record Keeping**.

### Regulation (EC) No. 2018/1139 — Basic Regulation

Establishes common essential requirements to provide for a high uniform level of civil aviation safety, and establishes EASA. Article 1 and Annex II define those aircraft (types and roles) not covered by this regulation.

### Regulation (EC) No. 748/2012 — Implementing Regulation for Certification

Contains **Part-21**, the implementing rules for certification of aircraft and environmental standards. Detailed assistance to manufacturers is provided via **Certification Specifications (CS)**, currently including: CS-22 (Sailplanes and Powered Sailplanes), CS-23 (Normal, Utility, Aerobatic and Commuter Aeroplanes), CS-25 (Large Aeroplanes), CS-27 (Small Rotorcraft), CS-29 (Large Rotorcraft), CS-31HB (Hot Air Balloons), CS-34 (Aircraft Engine Emissions and Fuel Venting), CS-36 (Aircraft Noise), CS-APU (Auxiliary Power Units), CS-AWO (All Weather Operations), CS-E (Engines), CS-ETSO (European Technical Standard Orders), CS-Definitions (Definitions and Abbreviations), CS-P (Propellers), CS-VLA (Very Light Aeroplanes), and CS-VLR (Very Light Rotorcraft), plus AMC-20 (General Acceptable Means of Compliance). These are also known as **"airworthiness codes"**, based upon (and in most cases identical to) the JAA codes they replaced.

### Regulation (EC) No. 1321/2014 — Implementing Regulation for Continued Airworthiness

Consists of **4 Annexes**:

| Annex | Part | Subject |
|-------|------|---------|
| I | Part-M | Management of Continuing Airworthiness |
| II | Part-145 | Approval of Maintenance Organisations Commercial and Large Aircraft |
| III | Part-66 | Licensing of Aircraft Maintenance Engineers and Certifying Staff |
| IV | Part-147 | Approval of Training Organisations |

### Acceptable Means of Compliance (AMC) and Guidance Material (GM)

AMC, as referred to in Articles 18 and 19 of the Basic Regulation and its implementing rules, is primarily used to qualify technical interpretative material used in the EASA certification process — it is a means by which certification requirements can be met by the applicant. AMC/GM illustrate **a means, but not the only means**, of meeting a requirement: an applicant correctly implementing published AMC/GM is assured of acceptance of compliance. If an organisation wishes to comply by an alternative means, it may do so provided it can demonstrate the alternative is acceptable to the relevant National Aviation Authority — it need not justify why the alternative is used, but the **burden of proof that the requirement is met rests entirely with the applicant**.

### Role of the Member States

Each member state has a National Aviation Authority (NAA) — for example, in the UK it is the **Civil Aviation Authority (CAA)**, in Cyprus the **DCA**, in Greece the **HCAA**, and in France the **DGCA**.

### Relationship between the Parts of Regulation (EC) No. 1321/2014

An owner or lessor must have a management organisation approved under **Part-M Subpart G** to manage the airworthiness of their aircraft. The Part-M organisation is responsible for contracting and monitoring the activities of Part-145 or Part-M Subpart F approved organisations that carry out maintenance on the aircraft and its components. Part-145 organisations require **licensed engineers** (licensed under Part-66) to carry out release-to-service functions; to achieve Part-66 standards, engineers attend training courses at **Part-147** approved training schools. Part-145 and Part-M organisations also require liaison with **Part-21** design organisations to enable repairs to be approved in accordance with Certification Specifications (e.g. CS-25). Flight crews also have an airworthiness responsibility under Part-M, in that they can be trained to carry out pre-flight checks.

If the owner conducts business in commercial air transport, they must hold an EU-OPS approval (**Air Operator's Certificate, AOC**); the Part-M approval is issued in conjunction with the AOC, and an AOC cannot exist without Part-M. Loss of any associated approval (e.g. Part-145) under Part-M entails loss of Part-M and the AOC, effectively grounding the business.

### Management of Airworthiness (Part-M)

All EASA-regulated aircraft must comply with conditions for continued airworthiness:

- **All large aircraft and multi-engine helicopters** must be managed by a Part-M Subpart G **Continuing Airworthiness Management Organization (CAMO)**.
- For **Commercial Air Transport (CAT)**, the AOC holder must be Part-M Subpart G approved, in addition to EU-OPS approved.
- For **small aircraft (General Aviation)**, there is a choice: the owner may manage it themselves, a licensed engineer contracted by the owner may do it, or the owner may contract a Part-M Subpart G (CAMO) organisation to do it.
        $cnt$,
        1
    ) RETURNING id INTO s1_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 10.2: Certifying Staff - Maintenance
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m10_id, 'M10.2', 'Certifying Staff - Maintenance',
        $cnt2$
# Certifying Staff - Maintenance

## Introduction

**Part-66** is the name given to **Annex III of Regulation (EC) 1321/2014**, and is concerned with the licensing of Aircraft Maintenance Engineers (AMEs). Part-66 came into force on **29 November 2003**, but various derogations allowed the regulation not to be mandatory until **September 2006 for large aircraft (MTOW > 5,700 kg)**, or **September 2008 for light aircraft (MTOW < 5,700 kg)**. Part-66 is the Aircraft Maintenance Licence (AML) requirement for all EASA member States.

All staff issuing Certificates of Release to Service in accordance with **Part 145.A.50** are required to be licensed in accordance with Part-66; they must hold a Basic Licence and a type-specific licence. In addition there are experience and age requirements. An AME can hold multiple categories of licence, and multiple types.

### Age Limitation

- Minimum age to **hold** a Part-66 licence: **18**
- Minimum age to **certify** with it: **21**

### Experience Requirements

Experience requirements are many and varied, depending on the type of basic training and previous experience gained — from as little as **1 year** to as much as **5 years**. Detailed requirements are specified under EASA Part-66 or the relevant NAA.

## Categories of Licence

| Category | Title | Subcategories |
|----------|-------|----------------|
| **A** | Maintenance Certifying Mechanic | A1 Aeroplanes Turbine; A2 Aeroplanes Piston; A3 Helicopters Turbine; A4 Helicopters Piston |
| **B1** | Maintenance Certifying Technician (Mechanical) | B1.1 Aeroplanes Turbine; B1.2 Aeroplanes Piston; B1.3 Helicopters Turbine; B1.4 Helicopters Piston |
| **B2** | Maintenance Certifying Technician (Avionic) | Applicable to all aircraft |
| **B2L** | Maintenance Certifying Technician (Avionic) | Applicable to all aircraft other than Group 1 (66.A.5(1)); divided into system ratings: com/nav, instruments, autoflight, surveillance, airframe systems — must contain at least one system rating |
| **B3** | Maintenance Certifying Technician (Light Aircraft) | Applicable to piston-engine non-pressurised aeroplanes of 2,000 kg MTOM and below |
| **C** | Base Maintenance Certifying Engineer | Applicable to aeroplanes and helicopters |
| **L** | Maintenance Certifying Technician | L1C composite sailplanes; L1 sailplanes; L2C composite powered sailplanes and composite ELA1 aeroplanes; L2 powered sailplanes and ELA1 aeroplanes; L3H hot-air balloons; L3G gas balloons; L4H hot-air airships; L4G ELA2 gas airships; L5 gas airships other than ELA2 |

The wider privileges of the Category B licence, and the Technician's role in defect diagnosis, rectification and system inspection, require more detailed knowledge than Category A, requiring a longer period of experience and examination at a higher level.

Category C can be achieved via two routes: a graduate with a degree in Aeronautical Engineering (or similar discipline) recognised by the NAA, or a **B1 or B2 licence holder** with a prescribed period of certifying experience.

## Certification Privileges

**Category A** — Permits the holder to issue certificates of release to service following minor scheduled line maintenance and simple defect rectification, within the limits of tasks specifically endorsed on the authorisation. Privileges are restricted to maintenance the authorisation holder has personally performed in a **Part-145 organisation**.

**Category B1** — Permits the holder to issue certificates of release to service following maintenance, including aircraft structure, power plants, and mechanical and electrical systems. Authorisation to replace avionic line replaceable units (LRUs) requiring simple tests to prove serviceability is also permitted. *Compass compensation and adjustment certification privileges are contained within a Category B1 AML.*

**Category B2** — Permits the holder to issue certificates of release to service following maintenance on avionic and electrical systems. Category B2 certifying staff can qualify for **any A subcategory**, subject to compliance with the appropriate A subcategory requirements. *Compass compensation and adjustment certification privileges are contained within a Category B2 AML.*

**Category B2L** — Permits the holder to issue certificates of release to service, and to act as B2L support staff, for: maintenance performed on electrical systems; maintenance performed on avionics systems within the limits of the system ratings endorsed on the licence; and, when holding the 'airframe system' rating, performance of electrical and avionics tasks within power plant and mechanical systems requiring only simple tests to prove serviceability.

**Category B3** — Permits the holder to issue certificates of release to service, and to act as B3 support staff, for: maintenance performed on aeroplane structure, powerplant, and mechanical and electrical systems; work on avionic systems requiring only simple tests to prove serviceability and not requiring troubleshooting. The B3 licence does **not** include any A subcategory, but this does not prevent a B3 holder from releasing maintenance tasks typical of the A2 subcategory for piston-engine non-pressurised aeroplanes of 2,000 kg MTOM and below, within the limitations of the B3 licence.

**Category C** — Permits the holder to issue certificates of release to service following **base maintenance**. The privileges apply to the aircraft **in its entirety**.

**Category L** — Permits the holder to issue certificates of release to service, and to act as L support staff, for: maintenance on aircraft structure, power plant, and mechanical and electrical systems; work on radio, Emergency Locator Transmitter (ELT) and transponder systems; and work on other avionics systems requiring simple tests to prove serviceability. Subcategory **L2 includes L1** (any limitation to L2 per 66.A.45(h)(ii)(3) also applies to L1); subcategory **L2C includes L1C**.

## Limitation of Privileges

The holder of an aircraft maintenance licence may not exercise certification privileges unless:

1. They are in compliance with the applicable requirements of Part-M and/or Part-145.
2. In the preceding two-year period they have either had **six months** of maintenance experience in accordance with the privileges granted by the licence, or met the provision for the issue of the appropriate privileges.
3. They are able to read, write and communicate to an understandable level in the language(s) in which the technical documentation and procedures necessary to support the certificate of release to service are written.

## Medical

Certifying staff must not exercise the privileges of their certification authorisation if they know or suspect that their physical or mental condition renders them unfit to exercise such privileges. All engineering staff should be aware of the sanctions that can be applied if found unfit at their place of work.

## The Basic Licence - Knowledge and Experience Requirements

Basic Knowledge requirements are detailed in **Part-66.A.25**, and Basic Experience requirements in **Part-66.A.30**. Regardless of how a candidate learns the knowledge, they must pass an examination for the modules in the category applied for. Upon passing the first module, there is then a **10-year window** in which all modules must be passed. Module details, syllabus and knowledge levels are found in **Annex I to Part-66**.

**Extension to the Basic Licence** — A licence holder may extend their basic licence to include an additional category by passing the exams (or parts of exams) needed to satisfy the extra licence requirement, and showing proof of experience in the new category.

**Exemption from Knowledge Requirements** — Full or partial credit against the basic knowledge requirements and examination is given for any other technical qualification considered by the Competent Authority (CA) to be equivalent to the Part-66 knowledge standard. NAAs publish details of the exemptions they will consider, each assessed individually.

## Category A Basic Licence

Mechanically-based; permits release to service within endorsed task limits, following minor scheduled line maintenance and simple defect rectification. Typical Category A tasks are found in the **AMC to Part-145 A.30(g)**. There are **no type approvals** for the Category A Basic Licence.

**Category A Training Routes:**

1. **Part-147 approved course** of between **650 hours** (for A2) and **800 hours** (A1, A3, A4) duration, followed by a minimum of **1 year's** practical line maintenance experience.
2. **Self-Starter and Other Experienced Applicants** — at least **3 years'** practical maintenance experience on operating aircraft (a reduction may be considered per Part-66.A.30 and AMC 66.A.30(a) and (b)).
3. **Skilled Worker** — a person who has completed a course of training (acceptable to the competent authority) involving manufacture, repair, overhaul or inspection of mechanical, electrical or electronic equipment, including use of tools and measuring devices. Requires **2 years'** experience in this category.
4. **Other Experienced Applicants** — maintenance experience gained outside civil aircraft maintenance (e.g. armed forces, coast guards, police). At least **1 year's** civil experience on aircraft typical of the category/sub-category applied for is required.

## The Category B1 Basic Licence

Mechanically-based; permits release to service following line maintenance including aircraft structure, power plants, and mechanical and electrical systems, plus replacement of avionic LRUs requiring simple tests (without test equipment). A B1 holder also supports the Category C certifier in base maintenance. A full Part-66 B1 licence in a particular subcategory also entitles the holder to exercise Category A privileges for other aircraft types (not endorsed as type ratings), subject to task training and authorisation requirements.

**Category B1 Training Routes:**

- **Part-147 approved course**: minimum **2,400 hours** instruction (**2,000 hours** for B1.2). For **B1.1/B1.3**, the course must be followed by a minimum of **2 years'** practical maintenance experience; for **B1.2/B1.4**, a minimum of **1 year's**.
- Examination follows **Appendix I to Annex III (Part-66)**, conducted by a Part-147 organisation or the competent authority.
- **Time limitations and credits** — training courses/exams must be passed within **10 years** prior to licence application (otherwise, credits may be obtained per Part 66.B.405).
- **Recent Practical Maintenance Experience** — all applicants need at least **1 year's** experience typical of the category/sub-category applied for; of this, **6 months** must be within the **12 months** immediately before application, and the remainder within the **7 years** before application.
- **Self-Starter (B1.1/B1.3)** — without a Part-147 course, at least **5 years'** practical maintenance experience (reduction possible for Skilled Workers, Armed Forces, Coast Guards or Police).
- **Self-Starter (B1.2/B1.4)** — without a Part-147 course, at least **3 years'** practical maintenance experience (reduction possible).

## The Category B2 Basic Licence

Avionic-based; permits release to service following line maintenance on avionic systems. A B2 holder also supports the Category C certifier in base maintenance. Broadly covers: Instrument Systems; Automatic Pilot Systems (fixed and rotary wing) including Auto-throttle and Auto-land, Radio Communication, Navigation and Radar Systems; and Electrical Power Generation and Distribution to Avionic Systems. *A Part-66 B2 licence does not provide any Category A entitlement — the holder must obtain a Category A licence extension separately.*

**Category B2 Training Routes:**

- **Part-147 approved course**: minimum **2,400 hours** instruction, followed by a minimum of **2 years'** practical maintenance experience.
- Same Recent Practical Maintenance Experience rule as B1 (1 year typical, 6 months within the preceding 12 months, remainder within 7 years).
- **Self-Starter** — without a Part-147 course, at least **5 years'** practical maintenance experience (reduction possible for Skilled Workers, Armed Forces, Coast Guards or Police).
- **Time limits and credits** — same 10-year rule as B1 (credits per 66.B.405 otherwise).

## The Category B2L Basic Licence

Examination demonstrates knowledge of the appropriate subject modules per **Appendix I to Annex III (Part-66)**, for the specific 'system rating'.

- **Part-147 approved course**, followed by a minimum of **1 year's** practical maintenance experience.
- **Skilled worker** (no Part-147 course) — at least **2 years'** practical maintenance experience covering the corresponding system rating.
- **Self-Starter/Other Experienced** — at least **3 years'** practical maintenance experience (reduction possible).
- Adding a new system rating to an existing B2L licence requires **3 months'** relevant practical maintenance experience per new rating added.

## The Category B3 Basic Licence

Certifies piston-engine non-pressurised aircraft **below 2,000 kg MTOM**, not involved in Commercial Air Transport. There are **no B3 type approvals**. Mechanically-based; permits release to service following line maintenance including structure, power plants, and mechanical and electrical systems, plus simple testing (not troubleshooting) of avionic systems. A B3 holder also supports the Category C certifier in base maintenance.

- **Part-147 approved course**, followed by a minimum of **1 year's** practical maintenance experience.
- **Skilled worker** (no Part-147 course) — at least **2 years'** practical maintenance experience.
- **Self-Starter/Other Experienced** — at least **3 years'** practical maintenance experience (reduction possible).

## The Category L Basic Licence

Examination demonstrates knowledge per **Appendix VII to Annex III (Part-66)**.

**Experience requirements:**
- **2 years'** practical maintenance experience covering a representative cross-section of maintenance activities in the corresponding subcategory; OR
- **1 year's** practical maintenance experience, subject to the limitation under point **66.A.45(h)(ii)(3)**.

## The Category C Basic Licence

Obtained via one of two routes:

- **B1/B2/B3 Route** — requires **3 years** as a B1.1, B1.3 or B2 Certifying LAE on Large Aircraft, or **5 years** for B1.2 and B1.4; reduced to **3 years** for small aircraft categories (B3).
- **Graduate Route** — a graduate with a degree in Aeronautical Engineering (or similar discipline, NAA-accepted) must have at least **3 years'** experience in a civil aircraft maintenance environment, including **6 months** of observation of base maintenance tasks. A person qualifying via this route is **not entitled to a B1, B2 or B3 licence** unless the requirements for those categories are also met.

**Knowledge Requirements for Category C:**
- Mechanical background → meet Category **B1** basic knowledge level
- Avionic background → meet Category **B2** basic knowledge level
- Light aircraft → meet **B3** knowledge requirement

Graduate-route applicants must still pass the full B1, B2 or B3 examinations, unless the degree course qualifies for standard exemptions or agreed exemptions.

## Support Staff

B1, B2 and B3 type-qualified engineers (who may or may not hold certification privileges in their own right) are defined as **Support Staff** for certifying individual tasks during base maintenance. The Category C engineer can only certify the whole aircraft **after** Support Staff have signed off the individual tasks.

## Type Ratings

To exercise certification privileges on a specific aircraft type, an AML holder needs their licence endorsed with the relevant aircraft ratings:

- **B1, B2 or C**: Group 1 → aircraft type rating; Group 2 → aircraft type rating, manufacturer subgroup rating, or full subgroup rating; Group 3 → aircraft type rating or full group rating; Group 4 (Category B2 only) → full group rating.
- **B2L**: Group 2 → manufacturer subgroup or full subgroup rating; Group 3 → full group rating; Group 4 → full group rating.
- **B3**: the rating "piston-engine non-pressurised aeroplanes of 2,000 kg MTOM and below".
- **L**: rating per subcategory (e.g. L1 → "sailplanes"; L3H → "hot-air balloons").
- **Category A**: **no rating required**, subject to compliance with point 145.A.35 of Part-145.

Without the relevant type rating and authorisation, the licence holder **cannot** sign the Certificate of Release to Service for that aircraft.

## Type Training

Carried out by an approved Part-147 training organisation; each type course is approved by the NAA. For **B1/B2 categories**, completion of aircraft type training is achieved and demonstrated by a **theoretical element** (multi-choice written examination) and a **practical element** (assessments), both carried out by a Part-147 organisation. Typical training duration for a narrow-body aircraft is **35 days theory and 10 days practical**.

**Type Experience** — In addition to training, satisfactory experience (Task Card completion) is required for the **first** type endorsement — as a guide, **2–6 months**. Where a similar type is already held, experience is **not required** for the second and subsequent endorsements. Acceptable sources: experience gained on an approved Part-147 course (logbook + Part-147 certificate); experience in an approved Part-145 organisation (logbook, or worksheets certified by an Assessor and cross-referred on Form 19); or experience in an NAA-accepted organisation.

**Type Training for C Licence Holders** — must attend and pass **one** aircraft type course, typical of their certifying environment, to the same standard as B1/B2 certifying staff. There is **no practical training requirement**.

## Group Type Ratings

For Group 2 aircraft, a licence holder with **2 type ratings** from the same category and manufacturer can be awarded a manufacturer group rating; with **3 types** typical of the group (different manufacturers) they can be awarded a full group rating. Endorsement of the full Group 3 rating for B1, B2 and C requires demonstration of practical experience across a representative cross-section of maintenance activities relevant to Group 3.

**Category B3 Type Endorsement** — there is no aircraft type course requirement; just the general endorsement "Piston Engine Non-Pressurised Airplanes 2,000 kg MTOM and below".

## Aircraft Groups

| Group | Description |
|-------|-------------|
| **1** | Complex motor-powered aircraft, multi-engine helicopters, aeroplanes with maximum certified operating altitude exceeding FL290, aircraft equipped with fly-by-wire systems, gas airships other than ELA2, and other aircraft requiring a type rating as defined by the Agency |
| **2** | Subgroup 2a: single turboprop-engine aeroplanes and certain turbojet/multi-turboprop aeroplanes of lower complexity. Subgroup 2b: single turbine-engine helicopters and certain multi-turbine helicopters of lower complexity. Subgroup 2c: single piston-engine helicopters and certain multi-piston helicopters of lower complexity |
| **3** | Piston-engine aeroplanes other than those in Group 1 |
| **4** | Sailplanes, powered sailplanes, balloons and airships, other than those in Group 1 |

## Examination Standards and Requirements

Exams (except the essay module) are multiple choice, demonstrating knowledge per **Appendix I to Part-66**. Basic knowledge exams are conducted by a Part-147 organisation or the competent authority; type exams by approved Part-147 type training organisations.

**Examination by the Competent Authority (66.B.200):**
- Exam questions are kept secure so candidates cannot know which questions form the basis of the exam.
- The competent authority nominates those who control the questions, and appoints examiners present during all examinations.
- Basic exams follow the standard in Appendix I and II to Part-66; type exams follow Appendix III.
- New essay questions are raised at least **every six months**, with used questions withdrawn/rested.
- Exam papers are handed out at the start and returned at the end; none may be removed from the room during the exam.
- Candidates are separated so they cannot read each other's papers, and may not speak to anyone other than the examiner.
- Candidates proven to be cheating are **banned from taking any further examination within 12 months** of the exam in which they were found cheating.

**Examination by an Approved Part-147 Organisation** — exams are drawn from an NAA-approved database held by the organisation, using the same standards as CA exams. Examinations have a **75% pass mark**, with **no negative marking**.

## Applying for the Licence

- Pass the appropriate Basic Licence modules and collect certificates.
- Gain the required experience and record it in a logbook.
- Have the logbook/worksheets countersigned by an approved assessor from a Part-145 or Part-147 organisation.
- Provide proof of identity (passport or birth certificate preferred).
- Complete **Application Form 19**.
- Enclose the appropriate fee.

Some companies delegate screening of licence applications to approved Part-145 companies, so it is desirable to check with the Part-145 compliance monitoring department first — but in all instances, the **NAA issues the licence**.

To apply for a type endorsement, apply on Form 19 attaching a certificate (issued by a Part-147 organisation) showing a pass in the type course, plus worksheets/logbook evidence of experience and the appropriate fee.

**When You Have Your Licence** — it must be signed by the holder and kept with visual proof of identity. It is written in the language of the issuing CA, but if used in another state it must also have an English translation.

**Renewal** — The Part-66 Aircraft Maintenance Licence becomes invalid **5 years** after its last issue or amendment, unless the holder submits the licence to the issuing competent authority to verify the information it contains matches the CA's records.

## The Aircraft Maintenance Licence

The Licence is issued by the Competent Authority in a hard-bound A6-size booklet, officially known as **EASA Form 26**.

**Certifying Staff (CRS) B1/B2 – Maintenance — Need to Have:**

1. Basic Licence
2. Approved Type Training Course (Theoretical and Practical)
3. Endorsement of Type on Licence
4. Compliance Monitoring Authorisation – CRS
        $cnt2$,
        2
    ) RETURNING id INTO s2_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M10.1 Regulatory Framework (13 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s1_id, 'The Convention on International Civil Aviation, drawn up in Chicago in November 1944, was attended by how many of the 55 invited nations?',
     '[{"id":"a","text":"52","correct":true},{"id":"b","text":"28","correct":false},{"id":"c","text":"96","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'ICAO came into existence in 1947 and is based in:',
     '[{"id":"a","text":"Cologne, Germany","correct":false},{"id":"b","text":"Montreal, Canada","correct":true},{"id":"c","text":"Geneva, Switzerland","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'Each member country of ICAO is known as a:',
     '[{"id":"a","text":"Competent Authority","correct":false},{"id":"b","text":"Contracting State","correct":true},{"id":"c","text":"National Aviation Authority","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'Within the structure of ICAO, which body is the sovereign body, meeting every three years to set policy and vote the triennial budget?',
     '[{"id":"a","text":"The Council","correct":false},{"id":"b","text":"The Assembly","correct":true},{"id":"c","text":"The Secretariat","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'The ICAO Council, which adopts Standards and Recommended Practices as Annexes to the Convention, is composed of how many States?',
     '[{"id":"a","text":"19","correct":false},{"id":"b","text":"55","correct":false},{"id":"c","text":"36","correct":true}]',
     '{"B1","B2"}'),

    (s1_id, 'Standardisation by ICAO has been achieved through the creation of how many Annexes to the Convention?',
     '[{"id":"a","text":"19","correct":true},{"id":"b","text":"66","correct":false},{"id":"c","text":"96","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'Within an ICAO Annex, what is the essential difference between a Standard and a Recommended Practice?',
     '[{"id":"a","text":"A Standard is essential; a Recommended Practice is desirable","correct":true},{"id":"b","text":"A Standard applies only to EASA states; a Recommended Practice applies worldwide","correct":false},{"id":"c","text":"There is no difference — both terms are interchangeable","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'Which ICAO Annex covers the licensing of flight crews, air traffic controllers and aircraft maintenance personnel?',
     '[{"id":"a","text":"Annex 1 — Personnel Licensing","correct":true},{"id":"b","text":"Annex 8 — Airworthiness of Aircraft","correct":false},{"id":"c","text":"Annex 6 — Operation of Aircraft","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'EASA was created by European Parliament and Council Regulation (EC) No. 1592/2002, and is now governed by the Basic Regulation, which is:',
     '[{"id":"a","text":"Regulation (EC) No. 748/2012","correct":false},{"id":"b","text":"Regulation (EC) No. 2018/1139","correct":true},{"id":"c","text":"Regulation (EC) No. 1321/2014","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'Compared with the JAA (Joint Aviation Authorities), the key difference with EASA is that:',
     '[{"id":"a","text":"EASA regulations are legally binding on Member States; JAA regulations were not","correct":true},{"id":"b","text":"The JAA had more member states than EASA","correct":false},{"id":"c","text":"EASA only regulates military aircraft, whereas the JAA regulated civil aircraft","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'EASA is headquartered in:',
     '[{"id":"a","text":"Montreal, Canada","correct":false},{"id":"b","text":"Brussels, Belgium","correct":false},{"id":"c","text":"Cologne, Germany","correct":true}]',
     '{"B1","B2"}'),

    (s1_id, 'According to Article 2 of Regulation (EC) No. 1321/2014, an "aircraft" is defined as:',
     '[{"id":"a","text":"Any machine that can derive support in the atmosphere from the reactions of the air other than reactions of the air against the earth''s surface","correct":true},{"id":"b","text":"Any powered vehicle certified for commercial air transport","correct":false},{"id":"c","text":"Any machine with a Maximum Take-Off Mass exceeding 5,700 kg","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'Gliders are excluded from Regulation (EC) 2018/1139 when their maximum empty mass does not exceed:',
     '[{"id":"a","text":"80 kg single-seat / 100 kg two-seat","correct":true},{"id":"b","text":"300 kg single-seat / 495 kg two-seat","correct":false},{"id":"c","text":"560 kg single-seat / 2,000 kg two-seat","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'Regulation (EC) No. 1321/2014 consists of four Annexes. Which Part corresponds to Annex III?',
     '[{"id":"a","text":"Part-M","correct":false},{"id":"b","text":"Part-66","correct":true},{"id":"c","text":"Part-147","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'When an organisation wishes to show compliance by a means alternative to the published AMC/GM, who bears the burden of proof that the requirement has been met?',
     '[{"id":"a","text":"EASA","correct":false},{"id":"b","text":"The applicant","correct":true},{"id":"c","text":"ICAO","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'For Commercial Air Transport (CAT), all large aircraft and multi-engine helicopters must be managed by a:',
     '[{"id":"a","text":"Part-147 approved training organisation","correct":false},{"id":"b","text":"Part-M Subpart G Continuing Airworthiness Management Organization (CAMO)","correct":true},{"id":"c","text":"Part-21 design organisation","correct":false}]',
     '{"B1","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M10.2 Certifying Staff - Maintenance (16 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s2_id, 'Part-66 is the name given to which Annex of Regulation (EC) 1321/2014?',
     '[{"id":"a","text":"Annex I","correct":false},{"id":"b","text":"Annex III","correct":true},{"id":"c","text":"Annex IV","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'Under Part-66, what is the minimum age to hold an Aircraft Maintenance Licence, and the minimum age to certify with it?',
     '[{"id":"a","text":"Hold: 18; Certify: 21","correct":true},{"id":"b","text":"Hold: 16; Certify: 18","correct":false},{"id":"c","text":"Hold: 21; Certify: 25","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'A Category A certifying licence permits the holder to issue certificates of release to service for maintenance that:',
     '[{"id":"a","text":"Was personally performed by the holder within a Part-145 organisation, within endorsed task limits","correct":true},{"id":"b","text":"Was performed by any engineer, anywhere, regardless of licence category","correct":false},{"id":"c","text":"Involved base maintenance of the complete aircraft","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'A Category B2 certifying staff authorisation permits the holder to issue certificates of release to service following maintenance on:',
     '[{"id":"a","text":"Avionic and electrical systems","correct":true},{"id":"b","text":"Aircraft structure and power plants only","correct":false},{"id":"c","text":"Base maintenance of the complete aircraft","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'Category B2 certifying staff can qualify for any Category A subcategory, subject to:',
     '[{"id":"a","text":"Compliance with the appropriate A subcategory requirements","correct":true},{"id":"b","text":"Passing only the Category C examination","correct":false},{"id":"c","text":"No additional requirement — B2 automatically includes all A subcategories","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'The Category B3 licence applies to piston-engine non-pressurised aeroplanes of what maximum mass?',
     '[{"id":"a","text":"2,000 kg MTOM","correct":true},{"id":"b","text":"5,700 kg MTOM","correct":false},{"id":"c","text":"560 kg MTOM","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'A Category C aircraft maintenance licence permits the holder to issue certificates of release to service following base maintenance, with privileges that apply to:',
     '[{"id":"a","text":"Only the powerplant and mechanical systems","correct":false},{"id":"b","text":"The aircraft in its entirety","correct":true},{"id":"c","text":"Only avionic systems","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'In the preceding two-year period, to retain the right to exercise certification privileges, the holder of an aircraft maintenance licence must have had a minimum of:',
     '[{"id":"a","text":"Six months of maintenance experience in accordance with the licence privileges","correct":true},{"id":"b","text":"Two years of continuous type-specific experience","correct":false},{"id":"c","text":"One month of refresher training","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'Basic Knowledge requirements for a Part-66 licence are detailed in which reference, and Basic Experience requirements in which reference?',
     '[{"id":"a","text":"Knowledge: Part-66.A.25; Experience: Part-66.A.30","correct":true},{"id":"b","text":"Knowledge: Part-66.A.30; Experience: Part-66.A.25","correct":false},{"id":"c","text":"Knowledge: Part-145.A.50; Experience: Part-66.B.200","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'Once a candidate has passed the first module of a Part-66 basic licence examination, within how many years must all modules be passed?',
     '[{"id":"a","text":"5 years","correct":false},{"id":"b","text":"10 years","correct":true},{"id":"c","text":"2 years","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'Under the Category A training routes, a Part-147 approved course for subcategory A2 is of approximately what duration, followed by what minimum practical experience?',
     '[{"id":"a","text":"650 hours, followed by 1 year''s practical line maintenance experience","correct":true},{"id":"b","text":"2,400 hours, followed by 2 years'' practical experience","correct":false},{"id":"c","text":"3 years'' experience with no formal course required","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'For Category B1.1 and B1.3, a Part-147 approved course of at least 2,400 hours must be followed by a minimum practical maintenance experience of:',
     '[{"id":"a","text":"1 year","correct":false},{"id":"b","text":"2 years","correct":true},{"id":"c","text":"5 years","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'For Recent Practical Maintenance Experience under Category B1 or B2, of the one year''s experience required, how much must have been gained in the 12 months immediately before application?',
     '[{"id":"a","text":"1 month","correct":false},{"id":"b","text":"6 months","correct":true},{"id":"c","text":"12 months","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'Without the relevant aircraft type rating and authorisation, a Category B1 or B2 licence holder:',
     '[{"id":"a","text":"May still sign the Certificate of Release to Service on any aircraft type","correct":false},{"id":"b","text":"Cannot sign the Certificate of Release to Service for work carried out on that aircraft","correct":true},{"id":"c","text":"May sign the CRS only with Category A supervision","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'During base maintenance, B1, B2 and B3 type-qualified engineers who sign off individual tasks (but may not hold certification privileges in their own right) are defined as:',
     '[{"id":"a","text":"Type Rating Examiners","correct":false},{"id":"b","text":"Support Staff","correct":true},{"id":"c","text":"Competent Authority Inspectors","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'Examinations conducted by an approved Part-147 organisation have what pass mark, and what negative marking policy?',
     '[{"id":"a","text":"75% pass mark, with no negative marking","correct":true},{"id":"b","text":"50% pass mark, with negative marking for wrong answers","correct":false},{"id":"c","text":"100% pass mark, with no negative marking","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'A Part-66 Aircraft Maintenance Licence becomes invalid how many years after its last issue or amendment, unless submitted to the issuing Competent Authority for verification?',
     '[{"id":"a","text":"3 years","correct":false},{"id":"b","text":"5 years","correct":true},{"id":"c","text":"10 years","correct":false}]',
     '{"B1","B2"}');

END $$;
