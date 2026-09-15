-- Migration 009: Enrich M03 (EWIS) with Small Transport Aircraft (STA) / Business Aviation content
-- Source: IKAROS Aviation Training Center, IK M7A EWIS Presentation (ATSRAC HWG-10 STA study)
-- Idempotent: adds subject M03.5 only if it does not already exist

DO $$
DECLARE
    m03_id INT;
    s5_id  INT;
BEGIN
    SELECT id INTO m03_id FROM easa_modules WHERE code = 'M03';

    IF m03_id IS NULL THEN
        RAISE NOTICE 'M03 module not found – run earlier migrations first.';
        RETURN;
    END IF;

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M03.5') THEN
        RAISE NOTICE 'M03.5 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 03.5: Business Aviation (STA) EWIS Findings & Maintenance Philosophy
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m03_id, 'M03.5', 'Business Aviation (STA) EWIS Findings & Maintenance Philosophy',
        $cnt5$
# Business Aviation (STA) EWIS Findings & Maintenance Philosophy

## Why a Separate STA Study?

After the **Payne Stewart accident** (a Learjet 35 that suffered a cabin depressurisation event, killing all aboard), the NTSB recommended that **all** transport category aircraft — not just large airliners — be included in the ATSRAC wiring study. This extended the ATSRAC programme to **Small Transport Aircraft (STA)**: business jets and smaller commercial aircraft, evaluated by **Harmonisation Working Group 10 (HWG-10)**.

STA operations differ fundamentally from large transport (airline) operations, which changes how EWIS risk and maintenance must be approached.

## STA Wiring Evaluation Findings — By Aircraft Model

HWG-10 inspected 39 aircraft across 8 different STA models (labelled A–H in the study), aged 10–32 years with 3,258–17,389 flight hours. Findings were broken down into four Appendix A categories:

| Category | Description |
|---|---|
| **Connectors** | Cannon plugs, backshells, contact condition |
| **Terminations** | Crimped/soldered wire ends, terminal lugs |
| **Installations (General)** | Clamping, routing, clearance — this category dominated findings (roughly **80–97%** of findings per model) |
| **Wiring Condition** | Insulation condition, chafing, contamination |

Across all models, **Installations (General)** was by far the largest finding category — confirming that installation workmanship (clamping and clearance), not wire or insulation ageing, was the primary driver of discrepancies. This matches the overall ATSRAC conclusion (43% clamp issues + 29% clearance issues = 72% of all findings).

## Representative Field Defects (with Zone References)

The HWG-10 evaluators photographed and logged specific defects during the intrusive inspections. Examples include:

| Defect | Location (Zone) |
|---|---|
| Damaged clamp | Zone 310 — aft equipment compartment, below APU |
| Oxygen line installed with an inverted Teflon shim, tied to an environmental duct | Zone 140 — under-floor area above wing box |
| Conduit rubbing on connector hardware | Zone 140 — under-floor area above wing box |
| Improperly installed clamp, pinching the wire | Zone 220 — flight compartment above floor, behind circuit breaker panel (co-pilot's feet) |
| Insulation chafed through | Zone 220 — flight compartment above floor |
| Improper bend radius on installation | Zone 114/115 — flight compartment under-floor, bottom of fuselage |
| Inadequate clearance to structure | Zone 143/144 — main landing gear wheel well |
| Damaged conduit | Zone 143/144 — main landing gear wheel well |
| Power cable outer jacket pulled back, wires exposed | Zone 310 — aft equipment bay (APU compartment) |
| Improper repair | Zone 310 — aft equipment bay (APU compartment) |
| Contaminated wires — metal shaving debris on power wires | Zone 240/250 — cabin area above floor |

These examples reinforce that real-world EWIS defects are concentrated around **equipment bays, wheel wells, and under-floor routing** — areas with high vibration, limited access, and frequent maintenance disturbance.

## Aircraft Maintenance Program Philosophy: STA vs Large Transport

Large transport (airline) fleets and STA (business aviation) fleets follow very different maintenance program models:

| Aspect | Large Transport (Airline) | STA (Business Aviation) |
|---|---|---|
| Program development | OEM develops and maintains the maintenance program; FAA approves Ch. 4/5 and accepts the ICA | Owner/Operator typically follows OEM recommendations, but with far more variation |
| Aircraft-to-operator ratio | Many aircraft per operator, standardised fleet configuration | Approximately **1 to 1.4 aircraft per owner/operator** — each aircraft is essentially unique |
| Configuration variability | Low — fleet-standardised cabin and avionics | High — avionics packages and corporate interiors vary aircraft to aircraft, driven by owner preference |

This variability is a key reason generic, one-size-fits-all EWIS maintenance guidance is harder to apply directly to STA — each aircraft's wiring modifications must be evaluated on its own configuration.

## Organizational Differences

STA operators tend to run **smaller organisations** with fewer dedicated departments compared to airlines:
- **Dispatch**
- **Flight**
- **Maintenance** (roughly 35% of STA organisational structure, per HWG-10 demographic data)

Because STA organisations are smaller, they are typically **more interdependent with Type Certificate (TC) and Supplemental Type Certificate (STC) holders** — relying on outside OEMs and modification houses for engineering support that a large airline might perform in-house.

NBAA (National Business Aviation Association) operator demographic data reviewed by HWG-10 showed that the majority of business aircraft operators fly a single aircraft without a dedicated maintenance department, reinforcing the need for OEM/TC/STC support and clear, accessible EWIS guidance rather than assuming in-house engineering capability.

## HWG-10 Recommendations to the FAA (Specific)

1. Revise **FAR Part 147 Appendix E** (the A&P school curriculum standard) to include EWIS concepts from AC 120-YY — Detailed Inspection (DET), General Visual Inspection (GVI), and Special Detailed Inspection (SDI) — so future technicians are trained on EWIS from day one ("ground up" culture change).
2. Revise the following Advisory Circulars to include standardized EWIS concepts and language:
   - **AC 43.13** (Acceptable Methods, Techniques, and Practices)
   - **AC 43.204**
   - **AC 65-9A**
   - **AC 65-11B**
   - **AC 65-12A**
   - **AC 65-15A**

These ACs form the basis for certification, maintenance, and training of industry personnel — revising them spreads EWIS awareness to a large existing and future population of approvers, designers, installers, and technicians.

## Installation Guidelines — A Standardisation Problem

HWG-10 found that installation guidance for STA wiring was inconsistent because it was drawn from multiple, sometimes conflicting, sources:
- **AC 43.13** — considered outdated; non-turbine STA now carry more advanced technology than the AC anticipated
- **ATA Spec 117** — an industry wiring standard, but not universally referenced
- **ANM-104** — a policy memo that, in practice, **created confusion** across FAA Aircraft Certification Offices (ACOs) and, subsequently, across industry

The recommendation was that installation guidance standardisation must be **jointly FAA/industry driven** to eliminate these inconsistencies.

## What's Next — HWG-13

ATSRAC's follow-on working group, **HWG-13**, was tasked to further define and develop STA-specific requirements:
- Criteria for enhanced wiring inspection procedures
- Defining acceptable **means of compliance** for STA EWIS programmes

## Key Takeaway

Before 2002, most of the ATSRAC working group itself was **not aware of EWIS as a distinct discipline** — wiring was treated as an afterthought to system installation, not a system in its own right. The STA study confirmed the same core lesson found in the large-transport study: **installation workmanship (clamping and clearance) — not component ageing — is the dominant driver of EWIS discrepancies**, and this holds true regardless of aircraft size or operator type.
        $cnt5$,
        5
    ) RETURNING id INTO s5_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M03.5 Business Aviation (STA) EWIS (12 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s5_id, 'The ATSRAC study was extended to include Small Transport Aircraft (STA) following which event?',
     '[{"id":"a","text":"The TWA Flight 800 accident","correct":false},{"id":"b","text":"The Payne Stewart accident","correct":true},{"id":"c","text":"The Gore Committee report","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s5_id, 'Which Harmonisation Working Group was specifically responsible for the STA wiring evaluation study?',
     '[{"id":"a","text":"HWG-6","correct":false},{"id":"b","text":"HWG-10","correct":true},{"id":"c","text":"HWG-13","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s5_id, 'In the STA evaluation findings, which Appendix A category accounted for the large majority (roughly 80–97%) of findings across most models?',
     '[{"id":"a","text":"Connectors","correct":false},{"id":"b","text":"Terminations","correct":false},{"id":"c","text":"Installations (General)","correct":true}]',
     '{"B1.1","B1.3","B2"}'),

    (s5_id, 'A field example from the HWG-10 study found a damaged clamp in Zone 310. What is Zone 310?',
     '[{"id":"a","text":"Main landing gear wheel well","correct":false},{"id":"b","text":"Aft equipment compartment below the APU","correct":true},{"id":"c","text":"Flight compartment under-floor","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s5_id, 'An improperly installed clamp pinching a wire, found behind the circuit breaker panel near the co-pilot''s feet, was located in which zone?',
     '[{"id":"a","text":"Zone 220","correct":true},{"id":"b","text":"Zone 143/144","correct":false},{"id":"c","text":"Zone 240/250","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s5_id, 'Contaminated wires with metal shaving debris were found in which zone during the STA field evaluations?',
     '[{"id":"a","text":"Zone 114/115","correct":false},{"id":"b","text":"Zone 240/250 — cabin area above floor","correct":true},{"id":"c","text":"Zone 310","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s5_id, 'Compared to large transport aircraft, the typical aircraft-to-owner/operator ratio in STA (business aviation) is approximately:',
     '[{"id":"a","text":"1 to 1.4 — each aircraft essentially unique","correct":true},{"id":"b","text":"20 to 1 — highly standardised fleets","correct":false},{"id":"c","text":"1 to 50","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s5_id, 'Why is EWIS maintenance guidance harder to apply generically to STA aircraft compared to airline fleets?',
     '[{"id":"a","text":"STA aircraft fly fewer hours per year","correct":false},{"id":"b","text":"STA avionics packages and interiors vary significantly aircraft to aircraft, driven by owner preference","correct":true},{"id":"c","text":"STA aircraft are not subject to FAA oversight","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s5_id, 'STA operators tend to have smaller organisations and are typically more interdependent with:',
     '[{"id":"a","text":"Air traffic control authorities","correct":false},{"id":"b","text":"Type Certificate (TC) and Supplemental Type Certificate (STC) holders","correct":true},{"id":"c","text":"Competing operators in the same region","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s5_id, 'HWG-10 recommended revising which FAA regulatory document to embed EWIS concepts into the A&P technician training curriculum from the start?',
     '[{"id":"a","text":"14 CFR Part 43","correct":false},{"id":"b","text":"FAR Part 147 Appendix E","correct":true},{"id":"c","text":"AC 25-27","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s5_id, 'HWG-10 found that ANM-104, one of the sources of installation guidance for STA wiring, had the effect of:',
     '[{"id":"a","text":"Providing clear, unified guidance across all FAA offices","correct":false},{"id":"b","text":"Creating confusion across FAA Aircraft Certification Offices (ACOs) and industry","correct":true},{"id":"c","text":"Replacing the need for AC 43.13 entirely","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s5_id, 'The follow-on working group tasked with further developing STA-specific inspection criteria and means of compliance after HWG-10 was:',
     '[{"id":"a","text":"HWG-6","correct":false},{"id":"b","text":"HWG-9","correct":false},{"id":"c","text":"HWG-13","correct":true}]',
     '{"B1.1","B1.3","B2"}');

END $$;
