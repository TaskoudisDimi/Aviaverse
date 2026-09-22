-- Module 10.3: Approved Maintenance Organizations (Part-145 / Part-M Subpart F)
-- Source: EASA Part-66 Module 10 official textbook (IKAROS Aviation Training Centre, Issue IK02R5, Nov 2018)

DO $$
DECLARE
    m10_id INT;
    s3_id  INT;
BEGIN
    SELECT id INTO m10_id FROM easa_modules WHERE code = 'M10';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M10.3') THEN
        RAISE NOTICE 'M10.3 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 10.3: Approved Maintenance Organizations
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m10_id, 'M10.3', 'Approved Maintenance Organizations',
        $cnt$
# Approved Maintenance Organizations

**Reference:** Regulation (EC) 1321/2014, Annex II (IR Part-145)

## General

An organization can be approved to maintain Aircraft, Engines or Components, or any combination of the three. Annex II to Regulation (EC) No. 1321/2014 — **Part-145** — details the requirements.

Aircraft Maintenance Organizations are approved for either **Line** or **Base** maintenance, or both.

**Part-145** came into effect:
- **29 November 2003** — for the maintenance of all EASA aircraft when used for Commercial Air Transport (CAT)
- **28 September 2008** — extended to include all large aircraft, regardless of use

The **Certificate of Release to Service (CRS)** required after maintenance of an aircraft or an aircraft component used on a large aircraft, or any aircraft used for Commercial Air Transport, can only be issued by an organization appropriately approved in accordance with Part-145.

Organizations outside the EU can gain a Part-145 approval either directly from EASA or via a Competent Authority (CA).

## Competent Authority (CA)

For the purpose of Part-145, the competent authority shall be:

1. For organizations having their principal place of business in a Member State — the authority designated by that Member State.
2. For organizations having their principal place of business located in a country other than an EASA state — **EASA (the Agency)**.

## Applicability

Part-145 covers the approval of organizations engaged in the maintenance of aircraft or aircraft components used for Commercial Air Transport, and applies to **all large aircraft, regardless of use**.

For the purpose of this regulation, a **"large aircraft"** means an airplane with a Maximum Take-off Mass (MTOM) exceeding **5,700 kg**, or a **multi-engine helicopter**.

Organizations engaged in the maintenance of aircraft with an MTOM not exceeding 5,700 kg, and single-engine helicopters not engaged in Commercial Air Transport, need to be approved in accordance with **Part-M Subpart F**.

## Airships

Airships are not yet covered by Part-145. Organizations holding or applying for approval for the maintenance of airships must meet the relevant requirements. Certification authorisations will, until appropriate provision for Airship licences has been incorporated into Part-66, be based upon BCAR Section L, Category "A" and "C" airship LWTRs. Unless agreed otherwise by the NAA, type training will be required to be conducted by a suitably approved Part-147 organisation.

## Non-EASA Aircraft

Organizations solely engaged in the maintenance of aircraft and/or components of EASA-exempt aircraft, which are NOT used for Commercial Air Transport, may continue to be approved, or may apply for the grant or variation of an approval, in accordance with the relevant requirements. An approval granted under this requirement would be a **NAA "National" approval**, and has no relation to EASA Part-145 whatsoever.

## Components Fitted to EASA Aircraft

Aircraft on the EU Register, which are NOT used for Commercial Air Transport, may only have maintained components fitted which have been released to service in accordance with **Part-145 or Part-M Subpart F**. The person issuing the Certificate of Release to Service for fitting a component to such an aircraft is responsible for ensuring the component's records are sufficient to establish its maintenance and operating history, including embodiment of modifications, mandatory ADs, and service life used.

## Application

Application for Part-145 approval is made to the Competent Authority on **EASA Form-2**. The organisation's **Maintenance Organisation Exposition (MOE)** forms part of the application.

## 145.A.10 — Scope

### Maintenance Organisation Exposition (MOE)

To be approved, the Approved Maintenance Organisation (AMO) must submit to the Competent Authority a document known as the **Maintenance Organisation Exposition (MOE)**. It contains full details of how the AMO intends to comply with Part-145, and the classes and types of equipment it is applying for approval to service.

### Line Maintenance Definition

**Line Maintenance** is any maintenance carried out before flight to ensure the aircraft is fit for the intended flight. It may include:
- Trouble shooting
- Defect rectification
- Component replacement (with use of external test equipment if required), which may include components such as engines and propellers
- Scheduled maintenance and/or checks, including visual inspections that detect obvious unsatisfactory conditions/discrepancies but do not require extensive in-depth inspection — including internal structure, systems and powerplant items visible through quick-opening access panels/doors
- Minor repairs and modifications not requiring extensive disassembly, accomplished by simple means

For temporary or occasional cases (ADs, SBs), the **Compliance Monitoring Manager** may accept base maintenance tasks to be performed by a line maintenance organisation, provided all requirements defined by the CA are fulfilled.

### Base Maintenance Definition

**Base maintenance** is defined as scheduled maintenance not included in the line maintenance definition above.

### Small Part-145 Organizations

The requirements for a small organisation approved under Part-145 are reduced to account for, for example, a light aircraft maintenance hangar or a small radio repair workshop. Where only one person is employed, the advice given in GM 145.A.10 is acceptable. Note: **Category A1 aircraft and Category B1/B3 (Gas Turbine Engines and APUs) cannot be maintained under this reduced scheme.**

### Part-M Subpart F Maintenance Organisation

Aircraft less than 5,700 kg and not used for Commercial Air Transport are not required to be maintained by a Part-145 organisation. Instead they can be maintained by an organisation approved under **Part-M Subpart F** — essentially a scaled-down version of a Part-145 organisation.

## 145.A.20 — Terms of Approval

When an organisation applies for a Part-145 approval, it must state which category of repair it is applying for — these categories are known as **ratings**, grouped into **classes**. After approval is granted, the Competent Authority awards a **Certificate of Approval**. Where EASA itself is the awarding authority, the reference format is e.g. **EASA.145.007**, with the last three-digit number being a sequential number applied by the awarding authority. Details of approved classes and ratings are found on Page 2 (the Approval Schedule) of the EASA approval certificate, **EASA Form-3**.

### Classes and Ratings

| Class | Scope |
|-------|-------|
| **A — Aircraft** | Includes engines/APU/components whilst fitted to the aircraft. May be approved for "Base" or "Line" maintenance, or both. A "Line" facility located at a main base facility requires a "Line" maintenance approval. |
| **B — Engines** | Maintenance on an uninstalled engine or APU, and on components only whilst fitted to the engine/APU (unless the AMM expressly permits removal to improve access). |
| **C — Components** | Maintenance on uninstalled components (excluding engines and APUs). The MOE and approval certificate limitation section specify the scope. A C-rated organisation may also carry out maintenance on an installed component during base maintenance or at an engine/APU facility, subject to a control procedure detailed in the MOE. |

**C ratings** are grouped by ATA Chapter — for example, **C7 is engine components**. The complete listing of approved components is held in the organisation's capability list, referred to in the MOE. Amendment of the capability list is the responsibility of the **Compliance Monitoring Manager**.

## 145.A.25 — Facility Requirements

The organisation must ensure facilities are appropriate for all planned work, with particular protection from weather elements. Specialised workshops and bays are segregated to prevent environmental and work-area contamination.

### The Working Environment

- Aircraft hangars must be large enough to accommodate aircraft on planned base maintenance; component workshops large enough for components on planned maintenance. Where the hangar is not owned by the organisation, proof of tenancy may be necessary.
- Office accommodation must be provided for management of planned work and for certifying staff.
- Temperatures must be maintained so personnel can work without undue discomfort.
- Dust and airborne contamination must be kept to a minimum; where visible surface contamination results, susceptible systems must be sealed until acceptable conditions are re-established.
- Lighting must ensure each inspection/maintenance task can be carried out effectively.
- Noise must not distract personnel; where the noise source cannot be controlled, personal protective equipment must be provided.

For **line maintenance**, where the working environment deteriorates to an unacceptable level (temperature, moisture, hail, ice, snow, wind, light, dust/contamination), the maintenance or inspection task must be **suspended** until satisfactory conditions are re-established. For line maintenance, hangars are not essential, but access to hangar accommodation is recommended for inclement weather and lengthy defect rectification.

### Storage Facilities

Secure storage facilities must be provided for components, equipment, tools and material, ensuring **segregation of serviceable from unserviceable** items. Storage conditions must follow manufacturer's instructions to prevent deterioration and damage. Access is restricted to authorised personnel. Storage racks must be strong enough to support components without distortion. Components should, wherever practicable, remain packaged in protective material to minimise damage and corrosion.

## 145.A.30 — Personnel

### The Accountable Manager

The organisation shall appoint an **Accountable Manager** with corporate authority for ensuring that all maintenance required by the customer can be financed and carried out to the required standard. The Accountable Manager shall:
- Ensure necessary resources are available
- Establish and promote the safety and Compliance Monitoring policy specified in 145.A.65(a)
- Demonstrate a basic understanding of the Part

Note: as the Accountable Manager signs the front page of the Exposition, they do **not** require approval via the EASA Form-4 procedure — however, the NAA can refuse to accept an Accountable Manager on receipt of the exposition if there is evidence of unacceptable performance in a previous position.

### The Management Team

The organisation shall nominate a person or group of persons responsible for ensuring compliance with the Part, ultimately responsible to the Accountable Manager. These posts are notified for approval to the CA on **EASA Form-4**.

### The Compliance Monitoring Manager

The Accountable Manager shall appoint a person responsible for monitoring the organisation's continued compliance with Part-145, including the feedback system required by 145.A.65(c). This person shall have direct access to the Accountable Manager.

### Man-hour Plan

The organisation shall have a maintenance man-hour plan showing sufficient staff to plan, perform, supervise, inspect and quality-monitor the organisation, plus a procedure to reassess work when actual staff availability is less than planned.

### Personnel Competence

The organisation shall establish and control personnel competence, including an understanding of **human factors and human performance** issues. Human factors training can be carried out by the organisation itself, or by a Part-147 approved or independent training organisation acceptable to the competent authority. All maintenance, management and Compliance Monitoring audit personnel should receive human factors continuation training, covering (at minimum): post-holders/managers/supervisors; certifying staff, technicians and mechanics; technical support personnel; compliance monitoring staff; specialised services staff; human factors staff/trainers; store and purchasing staff; ground equipment operators; and contract staff in these categories.

## 145.A.35 — Certifying Staff and Support Staff

### Definitions

- **Certifying Staff**: Category A, B1, B2 or B3 Part-66 authorized personnel for Line Maintenance approved organizations.
- **Support Staff**: B1, B2 or B3 staff holding a Part-66 AML with the appropriate aircraft rating or endorsement, who — while not necessarily holding certification privileges — sign off tasks in Base Maintenance, supporting the Base Maintenance "C" licence holder.

Separate records for base and line maintenance authorised staff must be kept. A staff member may be approved to certify line maintenance **and** act as Support Staff, provided the organization holds both line and base maintenance approval.

Certifying Staff and Support Staff need:
- An **adequate understanding of the aircraft**
- **Recency**
- **Continuation training**

They must also be competency assessed through 145.A.30(e).

### Adequate Understanding of the Aircraft

The person must have received training and relevant maintenance experience on the product type and associated organisation procedures, such that they understand how the product functions and the more common defects with their consequences.

### Recency

All Certifying Staff and Support Staff must have ongoing aircraft or component maintenance experience — **6 months in the past 2 years is the norm**. The organisation must ensure sufficient continuation training in each 2-year period to keep certifying staff up to date on relevant technology, organisation, procedures and human factors.

### Style and Scope of Authorization Document

A clear authorisation document must be issued to the individual, and code translation must be readily available if used.

## 145.A.40 — Equipment and Tools

### Approved Tooling

The organisation shall have available and use the necessary equipment and tools to perform the approved scope of work:
- Where the manufacturer specifies a particular tool or equipment, the organisation shall use it, unless alternative tooling is agreed by the competent authority via procedures specified in the exposition.
- Equipment and tools must be **permanently available**, except tools so infrequently used that permanent availability is unnecessary (detailed in an exposition procedure).
- An organisation approved for base maintenance shall have sufficient aircraft access equipment and inspection platforms/docking.

### Calibration

All tools, equipment and particularly test equipment must be controlled and **calibrated** to an officially recognised standard, at a frequency ensuring serviceability and accuracy. A clear labelling system must indicate whether an item is within its inspection/service/calibration time-limit, and when the next one is due. Records of calibrations and traceability to the standard used must be kept.

## 145.A.42 — Acceptance of Components

### Component Classification

All components shall be classified into the following categories:
1. Components in satisfactory condition, released on an EASA Form-1 or equivalent, marked per Subpart Q of Part-21.
2. Unserviceable components, maintained in accordance with the Regulation.
3. Components categorised as **unsalvageable** — because they have reached their certified life limit or contain a non-repairable defect.
4. Standard parts used on an aircraft, engine, propeller or other component when specified in the maintenance data, accompanied by evidence of conformity traceable to the applicable standard.

Organizations disposing of unsalvageable aircraft components should ensure they are disposed of in a manner that does not allow them to be returned to service — misrepresentation of unsalvageable items as serviceable has resulted in non-conforming components re-entering the supply system.

### Eligibility to be Fitted

Prior to installation, the organisation must ensure a component is eligible to be fitted, given differing modification/AD standards. This is typically found on **EASA Form-1, Block 13**, but it remains the installing organisation's certifying staff's responsibility to determine eligibility.

### Locally Manufactured Parts

The organisation may fabricate a **restricted range of parts** for use in work within its own facilities, provided procedures are identified in the exposition. Examples include: bushes, sleeves and shims; secondary structural elements and skin panels; control cables; flexible and rigid pipes; electrical cable looms and assemblies; formed or machined sheet metal panels for repairs.

All such fabricated parts must be in accordance with data provided in overhaul/repair manuals, modification schemes, service bulletins, drawings, or otherwise approved by the competent authority. It is **not acceptable** to fabricate any item to pattern unless an engineering drawing (including any necessary fabrication processes) is produced and acceptable to the competent authority.

Items fabricated under a Part-145 approval may **only** be used by that organisation in the course of work on aircraft/components within its own facility. The permission to fabricate does **not** constitute approval for manufacture or external supply, and such parts **do not qualify for certification on EASA Form-1**. Fabrication for onward supply/sale is not permitted under a Part-145 approval.

### Life Expired Parts

Components that have reached their certified life limit or contain a non-repairable defect shall be classified as **unsalvageable** and shall not re-enter the component supply system, unless the certified life limits have been extended or a repair solution approved under Part-21.

## 145.A.45 — Maintenance Data

### General

The organisation must hold and use up-to-date maintenance data applicable to its scope of work and capability list. If maintenance data is provided by an operator or customer, the organisation shall hold it while work is in progress.

**Applicable maintenance data** is defined as:
- Any applicable requirement, procedure, standard or information issued by the competent authority
- Any applicable airworthiness directive
- Applicable instructions for continuing airworthiness issued by type certificate holders, STC holders, and other organisations publishing such data per Part-21
- Any applicable data issued in accordance with 145.A.45(d)

**145.A.45(d):** the organisation may only modify maintenance instructions in accordance with a procedure specified in the MOE, must demonstrate that changes result in equivalent or improved maintenance standards, and must inform the type-certificate holder of such changes. "Maintenance instructions" here excludes the engineering design of repairs and modifications. The organisation shall have a procedure to report bad (inaccurate, incomplete or ambiguous) data to the author.

### Examples of Applicable Data

AMM/CMM/WDM/SRM, Service Bulletins, Service Information Letters, Illustrated Parts Catalogues, Drawings, Standard Practices Manuals, Structural Repair Manuals, Modifications, Wiring Diagram Manuals, Airworthiness Directives, Airworthiness Notices, Part-145, Company Exposition & Procedures, Work Orders.

### CDCCL Modifications

**Critical Design Configuration Control Limitations (CDCCL)** are airworthiness limitations. Any modification of maintenance instructions linked to a CDCCL constitutes an aircraft modification requiring approval under Part-21.

### Work Cards

The AMO must provide a common work-card or worksheet system across all relevant parts of the organisation, transcribing maintenance data onto the cards (or making precise reference to it). Complex tasks are transcribed onto work cards and subdivided into clear stages to enable a record of accomplishment.

### Electronic Recording

Work cards may be computer generated; the database must be protected against deterioration and unauthorised alteration, with a back-up database **updated within 24 hours** of any main-database entry. Maintenance data must be readily available and kept up to date, with a procedure ensuring currency of amendment status. Data must be available close to the aircraft being maintained.

## 145.A.47 — Production Planning

The Part-145 AMO must have a system to plan the availability of all necessary personnel, tools, equipment, material, maintenance data and facilities, to ensure safe completion of maintenance. Production planning includes:
- **Scheduling** the work ahead, so it does not adversely interfere with other work
- **Organizing** maintenance teams and shifts during the work, ensuring completion without undue time pressure

### Planning for Human Performance Limitation

Planning must take into account human performance limitations (upper/lower limits and variations, including Circadian rhythm / 24-hour body cycle).

### Shift/Task Handover

A procedure must define how relevant information is communicated at shift or task handover, documented within the MOE. A planned overlap of shifts and a place for handover is required. The handover must be written and, where possible, verbal — the **written record is mandatory**.

## 145.A.50 — Certification of Maintenance

### Certificate of Release to Service for Class "A" Approved Organizations

A CRS shall be issued by appropriately authorised certifying staff on behalf of the organisation when it has been verified that all ordered maintenance has been properly carried out per the MOE, and there are no known non-compliances that seriously hazard flight safety. For maintenance to a fuel system feature classified as a CDCCL, the maintenance records shall reflect that correct configuration is maintained, marked as "CDCCL task" on the CRS.

A CRS shall be issued before flight at the completion of any maintenance — it may be written on the Technical Log-book (line/base maintenance) or on a specific form for heavy maintenance.

**AMC 145.A.50(b)** states the CRS should contain the statement: *"That the work specified except as otherwise specified was carried out in accordance with Part-145, and in respect to that work the aircraft/aircraft component is considered ready for release to service."*

New defects or incomplete work orders identified during maintenance must be brought to the operator's attention to obtain agreement to rectify them. If the operator declines, the organisation may issue a CRS within approved aircraft limitations, but must enter this fact in the CRS before issue.

### The Certificate of Release to Service for Class "B" and "C" Approved Organisations

The **EASA Form-1** (authorised release certificate/airworthiness approval tag) constitutes the component CRS, issued at completion of any maintenance on a component off the aircraft. When an organisation maintains a component for its own use, an EASA Form-1 may not be necessary, depending on the internal release procedures defined in the exposition.

If an aircraft is grounded away from the main line station/base due to non-availability of a component with the appropriate release certificate, it is permissible to temporarily fit a component **without** the appropriate release certificate for a maximum of **30 flight hours**, or until the aircraft first returns to the main base — whichever is sooner — subject to operator agreement and the component otherwise complying with applicable requirements.

## 145.A.55 — Maintenance Records

### General

The organisation shall record all details of maintenance work, retaining records necessary to prove all requirements were met for CRS issuance, including subcontractors' release documents. A copy of each CRS must be provided to the aircraft operator, together with any specific approved repair/modification data used.

### Retention

The organization shall retain copies of all detailed maintenance records and associated maintenance data for **three years** from the date the aircraft/component was released from the organisation. Records must be stored to ensure protection from damage, alteration and theft; computer backups must be stored in a different location from working discs. If an organisation terminates operations, retained records covering the last two years shall be distributed to the last owner/customer, or stored as specified by the competent authority.

### Record Keeping for Modular Engines

Records for gas turbine engines made of several modules shall be kept for each module, including: total time and cycles in-service; maintenance records; records of mandatory maintenance requirements; engine manual life-limited parts replacements.

## 145.A.60 — Occurrence Reporting

### External Occurrence Reporting

The organisation shall report to the Competent Authority, the state of registry, and the design organisation, any condition of the aircraft/component that has resulted or may result in an unsafe condition seriously hazarding flight safety (Mandatory Occurrence Reporting) — as soon as practicable, but in any case within **72 hours** of the condition being found. Examples: structural cracks; distortion, corrosion or defect to primary structure; significant hydraulic leaks; traces of burn on electrical systems; emergency system failure; AD not carried out.

### Internal Occurrence Reporting

The organisation shall establish an internal occurrence reporting system to enable collection and evaluation of reports, identify trends, and take corrective actions — reports made within 72 hours. The system should be **closed-loop**, facilitated by a "just culture" where personnel are not inappropriately punished for reporting.

## 145.A.65 — Safety and Compliance Monitoring Policy, Maintenance Procedures and Compliance Monitoring Systems

### Compliance Monitoring Policy Contents

The safety and Compliance Monitoring policy, included in the MOE, must commit the AMO to:
- Recognise safety as a prime consideration
- Apply human factors principles
- Encourage employees to report errors/incidents/failures (hazards)
- Recognise that compliance with procedures, quality and safety standards, and regulation is the duty of all personnel
- Recognise the need for all maintenance staff to co-operate with quality auditors

### Critical Systems

Procedures must minimise the risk of multiple errors on critical systems — no person shall be required to carry out and inspect components of the same type fitted to more than one system on the same aircraft during a particular maintenance check. When only one person is available, the work card must include an additional stage for re-inspection.

### Signoffs

A **sign-off** is a statement by the competent person performing or supervising the work that the task (or group of tasks) has been correctly performed — it relates to one step in the maintenance process and differs from release to service of the aircraft. "Authorised personnel" (formally authorised to sign off tasks) are **not necessarily** "certifying staff."

### CDCCL Tasks

The exposition should state how completion of CDCCL is traced. **Currently, the only CDCCL task is Fuel Tank Safety.**

### Compliance Monitoring System

The AMO must establish a Compliance Monitoring System including independent audits (monitoring compliance with required standards and procedure adequacy) and a feedback reporting system to management and ultimately the Accountable Manager, ensuring timely corrective action. **Product sampling** should be completed on each product line every **12 months**. For example, an organisation with capability to maintain aircraft, repair engines, brakes and autopilots would need to carry out **4** complete audit sample checks each year.

### Who Can Carry Out Audits?

- **Large AMO**: a dedicated compliance monitoring audit group.
- **Medium AMO** (less than 500 employees): audits conducted by competent personnel not responsible for the function/procedure/process.
- **Smallest organisations** (less than 10 employees): audits may be contracted — **2 audits in 12 months**.

The Accountable Manager shall hold regular meetings with senior staff to check progress; in large organizations this may be delegated to the Compliance Monitoring Manager, subject to the AM meeting at least **twice per year** with senior staff and receiving at least a half-yearly report. All audit records shall be retained for at least **2 years** after clearance of the finding.

## Administration of Part-145

### 145.A.70 — Maintenance Organisation Exposition (MOE)

The MOE is the document (or documents) specifying the scope of work constituting approval and showing how the organisation intends to comply with the Part. The MOE may be electronically processed; minor amendments may be approved through **indirect approval** — delegated from the CA to the Compliance Monitoring Manager, with limits contained in an MOE procedure.

### 145.A.75 — Privileges of the Organisation

The AMO may, as permitted by the MOE:
- Maintain any aircraft/component for which it is approved at locations identified in the approval certificate and MOE
- Arrange for maintenance at another organisation working under its quality system (excluding a base maintenance check of an aircraft, or a complete workshop check/overhaul of an engine or engine module)
- Maintain any aircraft/component at any location, subject to unserviceability or occasional line maintenance support needs
- Carry out aircraft line maintenance at locations listed in the MOE
- Issue certificates of release to service on completion of maintenance per 145.A.50

### 145.A.80 — Limitations of the Organisation

The AMO shall only maintain an aircraft/component for which it is approved when all required facilities, equipment, tooling, material, maintenance data and certifying staff are available.

### 145.A.85 — Changes to the Organisation

The organisation shall notify the competent authority, **before** the change takes place, of: change of name; main location; additional locations approved in the MOE; change of Accountable Manager or Form-4 post holder; or changes in facilities, material, tools, procedures, scope of work or certifying staff that could affect the approval.

### 145.A.90 — Continued Validity of Approval

An EASA Part-145 approval is issued for an **unlimited duration**, subject to the authority being satisfied the organisation remains compliant, keeping open access to the organisation, and the certificate not being surrendered or revoked.

### 145.A.95 — Findings

- **Level 1 finding**: any significant non-compliance with Part-145 which lowers the safety standard and seriously hazards flight safety — immediate action shall be taken to revoke, limit or suspend the approval (in whole or part) until successful corrective action is taken.
- **Level 2 finding**: any non-compliance which could lower the safety standard and possibly hazard flight safety — the corrective action period granted must not initially be more than **three months** (may be extended in certain circumstances, subject to a satisfactory corrective action plan). Failure to comply within the granted timescale leads to suspension of the approval in whole or part.

Note: **Level 3 comments are no longer permitted.**

## Annex 1 — Class Rating Limitation (Table 1)

- A category **A** class rating: maintenance on the aircraft and any component (including engines/APUs) only whilst fitted, except where temporary removal is expressly permitted by the AMM to improve access.
- A category **B** class rating: maintenance on the uninstalled engine/APU and components only whilst fitted to the engine/APU (with the same removal exception). A category B organisation may also maintain an installed engine during base/line maintenance, subject to a control procedure in the MOE.
- A category **C** class rating: maintenance on uninstalled components (excluding engines/APUs). May also maintain an installed component during base/line maintenance, or at an engine/APU facility, subject to a control procedure.
- A category **D** class rating is self-contained, not necessarily related to a specific aircraft/engine/component — the **D1 Non-Destructive Testing (NDT)** rating is only necessary for an organisation carrying out NDT as a particular task for another organisation. An organisation already rated A, B or C may carry out NDT on its own products without a D1 rating, provided the MOE contains NDT procedures.

Category A class ratings are subdivided into "Base" or "Line" maintenance; an organisation may be approved for either or both. The limitation section gives the Member State flexibility to customise the approval. Table 1 references **series** (e.g. Airbus 300/310/319, or Boeing 737-300 series), **type** (e.g. Airbus 310-240), and **group** (e.g. Cessna single-piston-engined aircraft).

## Annex II — The EASA Form-1

The EASA Form-1 (authorised release certificate/airworthiness approval tag) must comply with the standard format, including block layout, though block sizes and overall certificate size may vary as long as it remains recognisable and legible. Printing must be clear and legible; abbreviations restricted to a minimum. The original certificate must accompany the items, with a copy retained by the organisation that manufactured or maintained the item.

Key blocks include:
- **Block 1**: name and country of the Member State under whose approval the certificate was issued
- **Block 2**: pre-printed "Authorised Release Certificate/EASA Form 1"
- **Block 3**: unique certificate number for control and traceability
- **Block 4**: name and address of the approved organisation releasing the items
- **Block 7–10**: item name/description, part number, quantity, serial/batch number
- **Block 11**: status of the item — one or a combination of: **OVERHAULED**, **INSPECTED/TESTED**, **MODIFIED**, **REPAIRED**, **RETREADED**, **REASSEMBLED**
- **Block 12**: information/limitations necessary for the user/installer to make the final airworthiness determination (e.g. maintenance documentation used, ADs carried out, repairs/modifications carried out, life-limited parts history)
- **Block 13**: reserved for release/certification of newly manufactured items under Part-21
- **Block 14**: the required release-to-service statement, including the certifying staff's signature (14b), the organisation's reference number (14c), the signatory's printed name (14d), and the date of signing (14e), in d/m/y format with the month in letters (e.g. Jan, Feb, Mar)

## Part-M Subpart F — Non-Commercial Air Transport Maintenance Organizations

This Sub-Part of Part-M establishes requirements for an organisation to qualify for approval to maintain aircraft and components **not** listed in M.A.201(f) and (g) — i.e. large aircraft, CAT aircraft and their components must be maintained by a Part-145 organisation instead. The requirements mirror Part-145, adjusted to reflect the complexity of the equipment and scale of operations. Application for Part-M Subpart F approval is made on **EASA Form-2**. Appendix IV to Part-M defines all classes and ratings possible under Subpart F. A Subpart F organisation may also fabricate, in conformity with maintenance data, a restricted range of parts for use within its own facilities, identified in the maintenance organisation manual.

### M.A.604 — Maintenance Organisation Manual

The manual must contain, at minimum: a statement signed by the accountable manager confirming continuous compliance with Part-M and the manual; the organisation's scope of work; the titles/names of persons referred to in M.A.606(b); an organisation chart of chains of responsibility; a list of certifying staff; a description and location of facilities; procedures ensuring compliance with the Part; and the manual's amendment procedure(s). The manual and its amendments must be approved by the competent authority, though minor amendments may be approved through **indirect approval**.

### M.A.606 — Personnel Requirements

The organisation shall appoint an **Accountable Manager** and nominate a **Compliance Monitoring Manager** (ultimately responsible to the Accountable Manager). The organisation must have appropriate staff for the normal contracted work (temporary subcontracted staff permitted for higher-than-expected work, but not for personnel issuing a CRS). The organisation must have sufficient certifying staff to issue M.A.612 and M.A.613 certificates of release to service.

### M.A.607 — Certifying Staff

Certifying staff can only exercise their privileges if the organisation ensures they have, in the preceding two-year period, either had **six months** of relevant maintenance experience or met the provision for the issue of the appropriate privileges, and have an adequate understanding of the relevant aircraft/component. Where an aircraft is grounded at a location with no appropriate certifying staff, the contracted organisation may issue a **one-off certification authorisation**, to one of its own employees holding type qualifications on similar aircraft, or to any person with **not less than five years** of maintenance experience holding a valid ICAO licence rated for the aircraft type — all such cases must be reported to the competent authority within **seven days**.

### M.A.608 — Components, Equipment and Tools

The organisation shall hold the equipment and tools specified in the M.A.609 maintenance data (or verified equivalents), and demonstrate access to other equipment used only occasionally. Tools and equipment shall be controlled and calibrated to an officially recognised standard, with calibration records kept. Incoming components must be inspected, classified and appropriately segregated.

### M.A.609 — Maintenance Data

The organisation shall hold and use applicable current maintenance data specified in M.A.401, including for modifications and repairs. Customer-provided data need only be held while work is in progress.

### M.A.610 — Maintenance Work Orders

Before commencement of maintenance, a **written work order** shall be agreed between the organisation and the customer, clearly establishing the maintenance to be carried out.

### M.A.611 — Maintenance Standards

All maintenance shall be carried out in accordance with the requirements of M.A. Subpart D.

### M.A.612 / M.A.613 — Certificates of Release to Service

At completion of all required aircraft maintenance, a certificate of release to service shall be issued according to **M.A.801**. At completion of component maintenance, a certificate shall be issued according to **M.A.802** — an **EASA Form-1** shall be issued, except for components fabricated in accordance with M.A.603(b); it may be generated from a computer database.
        $cnt$,
        3
    ) RETURNING id INTO s3_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M10.3 Approved Maintenance Organizations (21 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s3_id, 'Part-145 came into effect on 29 November 2003 for the maintenance of all EASA aircraft used for Commercial Air Transport, and was extended on 28 September 2008 to cover:',
     '[{"id":"a","text":"All large aircraft, regardless of use","correct":true},{"id":"b","text":"Only helicopters used for Commercial Air Transport","correct":false},{"id":"c","text":"Only aircraft registered outside the EU","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'For the purpose of Part-145, an aeroplane is classed as a "large aircraft" when its Maximum Take-off Mass exceeds:',
     '[{"id":"a","text":"2,730 kg","correct":false},{"id":"b","text":"5,700 kg","correct":true},{"id":"c","text":"20,000 kg","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'Organizations engaged in maintaining aircraft with an MTOM not exceeding 5,700 kg, and single-engine helicopters not used for Commercial Air Transport, need to be approved in accordance with:',
     '[{"id":"a","text":"Part-145 only","correct":false},{"id":"b","text":"Part-M Subpart F","correct":true},{"id":"c","text":"Part-21","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'For an organization whose principal place of business is located in a country other than an EASA state, the competent authority for Part-145 purposes is:',
     '[{"id":"a","text":"EASA (the Agency)","correct":true},{"id":"b","text":"ICAO","correct":false},{"id":"c","text":"The manufacturer''s national authority","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'Application for a Part-145 approval is made to the Competent Authority on:',
     '[{"id":"a","text":"EASA Form-1","correct":false},{"id":"b","text":"EASA Form-2","correct":true},{"id":"c","text":"EASA Form-4","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'The document that an AMO must submit to the Competent Authority, containing full details of how it intends to comply with Part-145 and the classes/types of equipment it seeks approval to service, is the:',
     '[{"id":"a","text":"Maintenance Organisation Exposition (MOE)","correct":true},{"id":"b","text":"Certificate of Release to Service","correct":false},{"id":"c","text":"Capability List","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'Which of the following is an example of Line Maintenance, as defined in Module 10.3?',
     '[{"id":"a","text":"Scheduled maintenance not included in the line maintenance definition","correct":false},{"id":"b","text":"Trouble shooting and defect rectification carried out before flight","correct":true},{"id":"c","text":"A complete workshop overhaul of an engine module","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'Under Part-145 class ratings, maintenance carried out on an uninstalled engine or APU, and on components only whilst fitted to that engine/APU, falls under class rating:',
     '[{"id":"a","text":"A — Aircraft","correct":false},{"id":"b","text":"B — Engines","correct":true},{"id":"c","text":"C — Components","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'C ratings under Part-145 are grouped by ATA Chapter; for example, engine components fall under rating:',
     '[{"id":"a","text":"C7","correct":true},{"id":"b","text":"A1","correct":false},{"id":"c","text":"D1","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'The Accountable Manager of a Part-145 organisation, who signs the front page of the Exposition:',
     '[{"id":"a","text":"Must be separately approved by the EASA Form-4 procedure before appointment","correct":false},{"id":"b","text":"Does not require approval by the EASA Form-4 procedure, though the NAA can refuse to accept them","correct":true},{"id":"c","text":"Requires no qualifications or corporate authority whatsoever","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'The recency requirement for Part-145 Certifying Staff and Support Staff is normally:',
     '[{"id":"a","text":"6 months of relevant maintenance experience in the past 2 years","correct":true},{"id":"b","text":"12 months of relevant maintenance experience in the past 5 years","correct":false},{"id":"c","text":"1 month of relevant maintenance experience in the past year","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'Under 145.A.42, a component that has reached its certified life limit or contains a non-repairable defect shall be classified as:',
     '[{"id":"a","text":"Serviceable, pending further inspection","correct":false},{"id":"b","text":"Unsalvageable","correct":true},{"id":"c","text":"Standard part","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'A Part-145 organisation that fabricates a restricted range of locally manufactured parts (e.g. bushes, sleeves, shims) for use within its own facilities:',
     '[{"id":"a","text":"May certify those parts on EASA Form-1 for external sale","correct":false},{"id":"b","text":"May only use those parts on aircraft/components undergoing work within its own facility, and they do not qualify for EASA Form-1 certification","correct":true},{"id":"c","text":"Automatically gains a Part-21 manufacturing approval by doing so","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'A Part-145 organisation must report an occurrence to the Competent Authority, state of registry, and design organisation as soon as practicable but, in any case, within:',
     '[{"id":"a","text":"24 hours","correct":false},{"id":"b","text":"72 hours","correct":true},{"id":"c","text":"30 days","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'A Part-145 approved organisation shall retain copies of detailed maintenance records and associated maintenance data for:',
     '[{"id":"a","text":"One year from completion of the maintenance","correct":false},{"id":"b","text":"Three years from the date the aircraft or component was released from the organisation","correct":true},{"id":"c","text":"Indefinitely, with no minimum or fixed retention period","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'Currently, according to Module 10.3, the only task classified as a Critical Design Configuration Control Limitation (CDCCL) task is:',
     '[{"id":"a","text":"Fuel Tank Safety","correct":true},{"id":"b","text":"Flight control rigging","correct":false},{"id":"c","text":"Landing gear retraction testing","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'Regarding Part-145 findings, a Level 1 finding is:',
     '[{"id":"a","text":"Any significant non-compliance which lowers the safety standard and seriously hazards flight safety, requiring immediate action to revoke, limit or suspend the approval","correct":true},{"id":"b","text":"A minor administrative comment with no safety implication and no longer permitted under the current scheme","correct":false},{"id":"c","text":"A finding that only applies to Part-M Subpart F organisations, never to Part-145","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'On the EASA Form-1, the status of a released item is indicated in Block 11 using one or a combination of specific terms; which of the following is one of them?',
     '[{"id":"a","text":"AIRWORTHY","correct":false},{"id":"b","text":"OVERHAULED","correct":true},{"id":"c","text":"CERTIFIED","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'Part-M Subpart F establishes the requirements for an organisation to be approved to maintain aircraft and components:',
     '[{"id":"a","text":"That are large aircraft or used for Commercial Air Transport","correct":false},{"id":"b","text":"Not listed in M.A.201(f) and (g), essentially small aircraft not used for Commercial Air Transport","correct":true},{"id":"c","text":"Exclusively airships","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'Within a Part-M Subpart F organisation, before the commencement of maintenance, M.A.610 requires that:',
     '[{"id":"a","text":"A written work order is agreed between the organisation and the customer","correct":true},{"id":"b","text":"An EASA Form-3 approval certificate is re-issued for each job","correct":false},{"id":"c","text":"The Accountable Manager personally certifies every task","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'Besides Subpart F, Part-M also contains Subpart G, which refers to an organization qualifying for approval to manage:',
     '[{"id":"a","text":"The continuing airworthiness of aircraft","correct":true},{"id":"b","text":"Only the manufacture of new aircraft components","correct":false},{"id":"c","text":"Air traffic control services","correct":false}]',
     '{"B1","B2"}');

END $$;
