-- Module 09: Human Factors (B1/B2 Common) — Tasks, Human Errors, Hazards in the Workplace
-- Source: EASA Part-66 Module 9A official textbook (IKAROS Aviation Training Centre, IK M9A, Issue Oct.2012)

DO $$
DECLARE
    m09_id INT;
    s7_id  INT;
    s8_id  INT;
    s9_id  INT;
BEGIN
    SELECT id INTO m09_id FROM easa_modules WHERE code = 'M09';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M09.7') THEN
        RAISE NOTICE 'M09.7-M09.9 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 09.7: Tasks
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m09_id, 'M09.7', 'Tasks',
        $cnt$
# Tasks

## Physical Work

### Introduction

Many of the tasks of the aircraft engineer require physical effort, ranging from visual inspections to more complex tasks such as engine installation and testing. The task may require standing, sitting or some other body position, and will require the use of the senses with correct body movements as commanded by the brain.

### Clothing

Before commencing work the engineer should be correctly dressed for the task in hand.

- Overalls should be of a good fit and comfortable whilst working in odd body positions, and should only have pockets that can be secured.
- Pockets should be empty except for essential work items — loose personal items are a **FOD hazard**. After working on an aircraft, a check should be made that all items in the pockets are accounted for.
- The amount and type of clothing depends on temperature and the nature of the task; as more clothing is worn, movement of the torso, arms and legs is restricted.
- Boots/shoes should be non-slip, unaffected by fuels/oils, non-spark-making, and should not scratch aircraft structures. Ideally footwear incorporates a safety toe cap.

### Body Posture

- The height of the vice/bench should relate to the worker's **elbow height**: for filing/machinery work the work piece should be **5 cm lower than elbow height**; for visual inspections the work piece should be **between elbow height and 25 cm above**.
- The floor should be firm and level; if standing for long periods, duckboarding is advantageous.
- Standing on the outside of an aircraft can be hazardous due to shape and slippery surfaces (oil, water, ice); be aware of designated walk zones. If also working at height, consider a safety harness and site warning notices below (in case tools/equipment fall and injure someone). Avoid overstretching and ensure guard rails are in position on platforms.
- An unsuitable workbench height causes musculoskeletal problems: too high forces an unnatural posture (elbows away from body, shoulders raised), causing discomfort in the shoulders and neck; too low forces the operator to lean forward, causing neck and lower back problems. Repetitive motions requiring force or unnatural motion can lead to **repetitive strain injury**.
- When lying on your back under an aircraft, use a crawler board if possible; when lying on your side, use a cushion for the head to reduce straining the neck muscles.
- When kneeling, use kneepads or other suitable padded material, supported by the full length of the lower leg.

### Body Movements

**Lifting and Carrying** — Always try to avoid strain. If an item is too heavy or too bulky to lift without strain, get assistance or use lifting equipment. When lifting an item from floor level, always bend the knees with the legs slightly apart, and lift using the muscles in the legs, trying to keep the back reasonably straight. The back muscles are very powerful, and if the back is bent to lift a heavy object, their power can put considerable strain on the spinal column and cause injury. When straightening up, keep the arms bent and the item as close to the body as possible — holding the item away from the body produces a moment which the back muscles have to counteract. When carrying anything heavy, keep it close to the body and restrict the time it is held; strain from a prolonged carry (even of an item such as a battery, which is reasonably easy to lift despite being heavy) may not be immediately apparent, but may show up some time later.

**Twisting** — Whilst carrying a load or applying a force (e.g. drilling and hammering), twisting should be avoided, as it can also lead to back problems.

**Pulling and Pushing** — NEVER pull anything (e.g. an aircraft) which could run you over (roll-over) once it gets moving, and never strain when pulling or pushing. A wheeled vehicle being moved must have a serviceable brake system or other means of stopping its movement; if it will not move with a reasonable push/pull, get help from a colleague or mechanical means. DO NOT STRAIN. If the item moves unexpectedly, make sure you are in no danger from roll-over or overbalance.

**Reaching** — Ideally, whatever you are working on should be no more than a forearm's length away from the body torso. NEVER over-reach yourself on any job, particularly at height, as this may cause overbalance with possible serious consequences.

**Hands** — It is important to hold tools correctly to avoid injury such as vibration white finger. When drilling, riveting or using any tools, the best position for the wrist/hand is the fingers closed around a handle of **1 to 1½ in. (25 to 38 mm) in diameter**, with the thumb going in the opposite direction, and the handle at right angles to the forearm.

**Working at Height** — Depending on aircraft type/size, equipment such as ladders, adjustable work platforms, aircraft docking systems and safety harnesses may be required. In the UK, the design of this equipment is governed by local regulations, with the **British Standards Institute (BSI)** ensuring the equipment used is safe and conforms to regulations. Most firms maintain a maintenance programme for the equipment, with a recording and identification system confirming service history.

Precautions when using height-adjustable work platforms:

- Steady feet in position before raising (if fitted)
- Never overload the platform — the **safe working load (SWL)** will be indicated on the side of the platform
- Never overbalance the platform — load evenly, distributed on top
- Always ensure guardrails are in position
- When raising/lowering, ensure personnel and aircraft structures are clear
- Protect structure from platform damage using fender cushions (rubber protective fenders)
- Keep the gap between structure and platform as narrow as possible
- Use safety locks when raised into position

Docking systems have similar considerations to working platforms, but are far more extensive, purpose-built for the specific aircraft type. Guardrails around working platforms should be approximately **waist height**, with a low-level screen to prevent small objects (e.g. sockets) from falling off.

Working at height outside the aircraft, on a ladder or platform **3 metres or more** from the ground, a safety harness of an approved type should be worn and secured to the platform (or, when working on a ladder, secured to a strong point on the aircraft). A person suffering from **acrophobia** (fear of heights) should only work at a height at which they feel comfortable.

**Working in Enclosed Spaces** — Engineers can sometimes be asked to work in very small areas, such as aircraft fuel tanks; company procedures lay down specific rules and safety precautions that must be followed. A person suffering from **claustrophobia** (fear of enclosed spaces) should not be expected to undertake this kind of work.

## Repetitive Tasks

Tasks are normally classed as repetitive if task duration is comparatively short and task frequency is high — it also relates to how often the task is performed. Fitting 5 rivets could hardly be classed as repetitive, but fitting the same rivets day after day for months on end would constitute a repetitive task. Larger tasks (e.g. a turnaround inspection carried out several times a day, over several months) can also become repetitive.

If a task becomes repetitive, boredom starts to creep in, arousal level is low, motivation is reduced and mistakes are more likely to be made. After the initial stages of perception and using the central processor with long and short-term memory, the **MOTOR MEMORY** is likely to take over, with only an occasional monitoring function from the central processor. The person carrying out a repetitive task can do so without putting in much real thought — the mind can wander, and mistakes can happen.

Once a task is recognised as repetitive, management should be informed and the person moved into another job if possible. If a job change is not always possible, four ways to prevent boredom and complacency are:

- Take regular short breaks — a few minutes will help
- Try to break the work pattern with a different task if possible
- Change positions
- Check manuals from time to time to confirm you are following the correct procedure

Repetitive tasks can also be reduced by moving people around within a team, so each person has a variety of tasks to do.

## Visual Inspection

The process of inspection using our eyes, supported by visual aids and backed up by test equipment, is the main process by which we ascertain the serviceability of an aircraft and its equipment. We use our senses of feel, smell and hearing, but vision is the sense we mostly rely on. Engineers should be aware of their eyesight limitations and the need for glasses or contact lenses to correct focusing defects.

Ideally, the physical environment for visual inspection provides adequate lighting, heating, ventilation and low noise levels. Distractions that disturb short-term memory and concentration — such as visitors talking directly to the engineer, or disrupting noises such as telephone calls — should be prevented or minimised.

Lighting for visual inspections should be sufficient and of the correct type; the wrong type of light source can cause problems with colour perception. Engineers should inform management of any colour perception (colour blindness) problems, so they can be assigned only to tasks that are not colour dependent for satisfactory completion — for example, colour identification of cables and flight deck instrument decals. If in doubt about colour, assistance should be sought for confirmation.

Whilst reading instruments and gauges, always hold the scale so it is parallel to a centre line running through the eyes of the observer — this helps prevent **PARALLAX ERROR**. A light held at head height, at 90° to the scale, is also an aid to preventing parallax error. Some instruments have mirrors behind the pointer, so that when the mirror image is in line with the pointer there is no error.

Be aware of the effects caused by the **blind spot** in the eye, particularly important when examining a row of rivets. To minimise the effects of the blind spot, keep eye movements short and frequent, and try to avoid staring at one area for too long.

Light and the physical limitations of the human eye can be overcome by using visual aids, such as:

- Magnifying glasses
- Mirrors
- Boroscopes/Intrascopes
- Fibre optics
- Video cameras
- Colour television monitors

## Complex Systems

Modern aircraft, fixed and rotary wing, have many systems which combine mechanical and electronic features, so more than one trade/licence category is required to maintain them. On large pressurised aircraft, data from various systems is recorded for the Flight Data Recorder and also linked to computers — a good example is the **Air Data Computer**. The **Digital Air Data Computer (DADC)** takes pitot and static pressures and converts them into a digital signal for the flight data recorder and other computers to use. This air data can then be used by the **Full Authority Engine Control computer (FADEC)** to control engine performance and by the cabin pressurisation computer to control cabin altitude pressure.

This requires mechanical and avionics engineers (under **PART 66**) and Electrical, Instrument, Aeroplanes and Engines licensed engineers (under **BCAR Sub-Part L**). It is important that all engineers know the exact extent of their responsibilities applicable to their licence/approval, and should have some knowledge of systems beyond their own certification responsibilities so they understand consequences occurring to other systems. In the UK, the Duties and Responsibilities of a Licensed Engineer are laid down by the CAA publication **CAP 455 Airworthiness Notices numbers 3 and 12**, amplifying certification responsibilities relative to the Air Navigation Order and the Joint Airworthiness Regulations 145. Airworthiness Notice No. 3 specifies areas of trade responsibility, exclusions and limitations, and highlights the "overlap" of responsibilities between trade categories and the need for good handovers at shift changes.

The overlap of responsibilities occurs when two or more trades are involved in a task (e.g. an engine change) — the trade mainly involved is the engine/mechanical category, supported by the electrical/avionic engineer. Each trade signs a **Certificate of Release to Service (CRS)** when satisfied their part of the task is complete. The mechanical engineer's duty is to oversee the task, ensure the avionic engineer has signed his CRS, before signing himself to complete the work and release the aircraft to service.

When a task is long and/or complex, the job card should be broken down into stages, each signed and dated on completion, maintaining a continuous record of the task's status — most important during shift working and when handing over an incomplete task. Shift handovers are a problem area where mistakes are made due to communication failures; a **DEBRIEFING** should occur between the off-going and on-coming engineer, including:

- Checking the cards are signed and up to date
- A verbal explanation of the progress of the job to date
- An indication of any possible problems that may arise
- A situation report
- A progress report on the spares situation
- Expected completion date and time
- Possible exchange of telephone numbers for liaison purposes

The certifying engineer should be aware of his Duties, Responsibilities and Limitations, ensuring drawings and manuals are up to date and all work correctly documented. Certain vital points, engine and flying controls are subject to **duplicate inspection** and certification by appropriately licensed engineers — a Flight Safety Net system to help prevent many errors due to human performance.
        $cnt$,
        7
    ) RETURNING id INTO s7_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 09.8: Human Errors
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m09_id, 'M09.8', 'Human Errors',
        $cnt2$
# Human Errors

## Error Models and Theories

### Background

Maintenance errors are not a new phenomenon, but with more reliable aircraft and Cockpit Resource Management for pilots, the maintenance component as a cause of aircraft accidents has become more noticeable. On **25 May 1979**, as an American Airlines DC10 rotated to lift off at Chicago's O'Hare Airport, the left engine fell off and crashed back onto the runway; 31 seconds later, 273 persons would be dead from maintenance error. The accident was directly attributed to **improper maintenance procedures**: engines were being fitted with a fork lift as a "short cut," damaging the pylon structure, and management were aware this procedure was being used. Accidents involving the Hawaiian Islands Boeing 737 fuselage rupture and the BAC1-11 cockpit window blow-out in England helped make human factors part of accident investigation. In Canada, on **10 March 1989**, an F-28 crashed, killing 24 people; maintenance did not directly cause the accident but was determined to be a contributing factor. As a result, **Gordon Dupont**, then working for Transport Canada, was tasked with developing a training programme to help reduce maintenance errors.

### Company Culture

**Company Culture** is defined as the reflections of the values and styles of the leaders of the company, interpreted by middle management and acted upon by the remaining employees. It is a powerful motivator in reducing maintenance error. Management has **PRIME RESPONSIBILITY FOR SAFETY**, a fundamental that dictates the culture of the entire company. This safety culture should start with a **SAFETY POLICY**, displayed on bulletin boards, signed by the Chief Executive Officer (and revised/resigned by each new CEO), spelling out that every single employee is responsible for the company's safety policy — not only to adhere to it, but also to report anything that could improve safety.

### Active and Latent Errors

**Active errors** are made by the person at the end of a line of contributory circumstances — for example, a pilot's failure to set flaps, a mechanic's failure to replace 'O' rings, a baggage handler's failure to check a cargo door, or an air traffic controller forgetting an aircraft waiting on the runway. In a ten-year study of a large number of accidents, Boeing identified some 37 contributory causes that occurred repeatedly; pilots not following standard operating procedures was the most frequent factor, and maintenance and inspection actions were present in **18%** of occurrences.

**Latent errors** are mistakes made by people not directly connected with line operation — design or production errors by the manufacturer, management mistakes in planning or resource allocation, or mistakes by regulatory bodies in monitoring the system. These may be hidden in the system, far removed in time and space from the moment they combine with active errors to create an accident. **Latent failures** are due to management failing to recognise and deal with inadequate selection, training, facilities, equipment or resources, and poor communication, planning, inspection, oversight or motivation. Statistics show there are perhaps **three times as many latent failures as active failures**, so seeking them out has great potential for safety improvement.

A **latent failure** can be described as an error in a component, piece of equipment or system which is not yet manifested, but is the result of a hidden flaw. Latent failures must combine with active failures and local triggering events (such as local environmental conditions) for an incident to occur; a latent failure always pre-exists the active failure, and — because it is precipitated by management and organisational processes — it can potentially be corrected before it happens.

### The Iceberg Model (Heinrich's Ratio)

Because certification, documentation and recording have made component histories very traceable, human factors have become one of the most likely causes of failure to come to the foreground. **Heinrich's Ratio**, also known as the **Iceberg Model**, tells us that there are about **600 incidents for every fatal accident**. Accidents are the logical result of many incidents, so if incidents are recorded and reduced, accidents (especially fatal ones) will also reduce. A threshold must be set to trigger a human factors investigation of significant incidents, and the instigator of an incident should be part of the solution.

### Discipline

The CAA normally investigates about **200 cases a year**, of which about **35 are taken to prosecution**, with a similar number dealt with by formal cautions or warning letters; most prosecutions relate to airlines and operators, while those involving maintenance personnel more usually involve falsification of records or forged documents. Under the **MOR Scheme**, the CAA has given assurance that proceedings will not be instituted for unpremeditated or inadvertent breaches disclosed to them — unless there is Dereliction of Duty amounting to Gross Negligence — in order to encourage free reporting of incidents.

Three important questions determine whether discipline is required: Was the act deliberate? Does the person accept responsibility for his action? Is he likely to do it again? If discipline is not applied correctly and fairly, an excellent, motivated employee may become bitter and stop putting in extra effort — moving the situation from a potential WIN/WIN to a LOSE/LOSE.

### Incident Data Analysis and Feedback

Without data, changes cannot be made with confidence to the way aircraft are maintained and operated. Feedback — positive or negative — is something everyone needs (a test on mice showed that mice kept in total isolation consistently died first). Positive feedback pays dividends: company newsletters serve to inform, educate and motivate, including statistics on how the company is doing.

### James Reason's Model and the Dirty Dozen

**James Reason's Model of Accident Causes** views every level of management and every department as a barrier with the ability to prevent an accident opportunity slipping through. Each barrier occasionally fails, with a hole forming — if the next layer is working effectively it stops the accident opportunity, but if it also has a hole, the opportunity continues on. If holes align throughout every layer, the accident opportunity passes through all of them and causes an accident. This is likened to a mouse nibbling at a slice of Swiss cheese, making the holes larger and larger over time — creating a **"Limited Window of Accident Opportunity."**

**Gordon Dupont** identified the Latent Conditions/Preconditions known as **THE DIRTY DOZEN** — the 12 most common causes of latent failures (Common Causes of Judgement Interference):

| # | Dirty Dozen Item |
|---|-------------------|
| 1 | Lack of Communication |
| 2 | Complacency |
| 3 | Lack of Knowledge |
| 4 | Distraction |
| 5 | Lack of Teamwork |
| 6 | Fatigue |
| 7 | Lack of Resources |
| 8 | Pressure |
| 9 | Lack of Assertiveness |
| 10 | Stress |
| 11 | Lack of Awareness |
| 12 | Norms |

People do not commit errors intentionally, unless suffering from a psychological disorder — all errors are the result of mistakes that occur naturally in humans. Recognising these factors and providing **SAFEGUARDS (SAFETY NETS)** helps reduce the frequency of errors. Selected examples:

- **Complacency** — a frequent routine inspection that never finds a fault leads the engineer to believe "I have never ever come across a fault on that inspection"; next time, he may look and not see the fault, or be tempted to "sign up" without actually carrying out the inspection. The safety net is to always expect to find a fault, and never sign for anything not actually done.
- **Distraction** — interruption of a flow of well thought out actions; the "Interrupter" is any factor causing judgement interference, and the "Interrupted" should, on returning to a task after an interruption, **GO BACK THREE STEPS BEFORE GOING FORWARD AGAIN**.
- **Norms** — experienced engineers develop unapproved "short cuts" which get passed on to others as the normal ("Norm") way to do the task; the safety net is to always work to the maintenance manual and nothing else. The DC10 crash at Chicago's O'Hare Airport in 1979 was due to an incorrect (short-cut) method of engine installation.

### Active Failure — CAA Mandatory Occurrence Report (MOR) Analysis

In the CAA's analysis of **230 Mandatory Occurrence Reports**, the fundamental causes of occurrence were:

| Cause | % (Operational Limitations) |
|-------|------------------------------|
| Incorrect installation | **49%** |
| Inadequate servicing | **31%** |
| Non-compliance with requirements | 7.3% |
| Component overhaul error | 6.3% |
| Damage during maintenance | 4.5% |
| Consequence of recording error | 1.8% |

When analysed for occurrences causing a **Significant Reduction in Safety**, incorrect installation rises to **80%**. Not fitting the correct seal, part or locking device — or not fitting it in accordance with the approved maintenance manual/service bulletin — is the active failure, and the engineer who brings his latent failures to the "sharp end" of the business will ultimately be given the blame.

### Inadequate Safety Nets / Defences

Wherever people are performing tasks, however skilled and conscientious, errors will still occur, so measures are needed to protect from the consequences of human error:

- Built-in redundancy and damage tolerance
- Special checks — duplicates
- Functional checks

**Tolerance/Redundancy** — modern aircraft structures and systems are built to be failsafe, with multiple load paths and redundancy by duplicating (even triplicating) important systems. Critical components without a duplicate to take up the load on failure are given a **Safe Life** (probability of failure around one in tens of millions), subject to stringent checks and tests. Semi Monocoque Construction (frames, longerons, spars, ribs, intercostals and stringers, with the stressed skin) provides multi-load paths, and together with tear stoppers produces a structure resistant to crack growth and damage tolerant.

**Checks/Duplicate Inspections** — ideally no one works alone or certifies alone; working in pairs brings two pairs of eyes and two brains, checking each other's work for possible errors. Most complex tasks involve stage inspections, with an inspector supervising the mechanics and signing "over him" for the work carried out. When working on critical systems, flying and engine controls, regulating bodies such as the CAA require **DUPLICATE INSPECTIONS**, and also require them on certain designated **VITAL POINTS**. A duplicate inspection, ideally independent, is an inspection first made by a qualified type-rated engineer and subsequently repeated by a second qualified type-rated engineer, designed to prevent incorrect installation of components after dismantling, reconnection and adjustment.

**Functional Checks** — carried out after a component change, no matter how simple the changing procedure or how high the skill of the engineer, unless the maintenance manual says otherwise. A functional check reveals, for example, whether a non-return valve in the hydraulic system is fitted correctly, or whether flying controls have the correct range of movement. Functional tests do not always verify workmanship quality (a dry soldered joint might not fail initially), but remain a very important part of verifying serviceability.

## Types of Error in Maintenance Tasks

The UK Safety Regulation Group identified **Crew & Human Factors** as the most significant, by a large margin, of the Top Ten Safety Risks currently in Aviation. Crew and Human Factors breaks down into six subheadings: Maintenance Human Factors; Omission of Action/Inappropriate Action; Flight Handling; Poor Professional Judgement/Airmanship; Failure in Crew Resource Management; Lack of Positional Awareness.

From data analysed by the **CAA in 1992**, Human Error in Aircraft Maintenance was due to:

- Incorrect installation of components
- Fitting of wrong parts
- Electrical wiring discrepancies
- Loose objects left in aircraft
- Inadequate lubrication
- Access panels/fairings/cowlings not secured
- Fuel/oil caps and fuel panels not secured
- Gear pins not removed before departure

As an illustration of mistakes made by maintenance engineers on the shop floor, with an operational impact estimated at approximately **£5m**, the following Maintenance Errors occurred at **Britannia Airways**: nosewheel axle washers omitted during a double nosewheel change at Line Maintenance Base (delay, rework); a brake unit locking bolt omitted during a brake change at Line Base (diversion, delay, rework); aircraft flaps damaged during a hangar 'C' check (rework); a landing gear functional check not carried out following maintenance (diversion, delay, rework); leading edge slats damaged during a hangar 'A' check (delay, ferry flight, 3 sub-charters); and an engine boroscope plug not replaced during a hangar check (rework).

The company found the most common contributory factors for Human Error in these examples to be: lack of resource planning, job distraction, lack of communication, inadequate shift handover, lack of assertiveness, aircraft design, perceived pressure, inadequate maintenance aids, and Christmas.

## Implications of Errors

From Heinrich's Ratio of 600 incidents to **1 fatal accident**, the cause of an accident results in a huge cost to the owner/operator and the insurance companies. **Insured (recoverable) costs** are for hull loss, property damage and personal liability for passengers and crew. There are also costs which are **not recoverable**, including: insurance deductibles, insurance premiums, loss of use of the aircraft and equipment, the cost of the accident investigation, disruption to schedules, disruption to servicing and maintenance, and the hire and training of new personnel. It is difficult to measure the loss of the company's reputation and future business in money terms — following several DC10 crashes in the late 1970s, passengers would telephone airlines to find out the aircraft type and would frequently choose a different airline if it was a DC10.

## Avoiding and Managing Errors

The accident rate per million flight hours has flattened out; by the year 2010, ICAO predicted a major airliner accident a week without further improvement. A new systematic approach — the **Safety Management System (SMS)** — is required to manage and assess potential risk. Safe and efficient operation depends on: Safety Management System, Safety Culture, Responsibility, Motivation, Team Work, Trust, Leadership, Justice, Respect, and Management and Workforce Commitment — "if one block is removed, the tower will collapse."

- **Regulations** establish only the minimum requirements for safe operation; since human performance cannot always be 100%, where significant risk is identified the company should set standards above the regulatory minimum.
- **Procedures** do not, by themselves, solve problems unless used systematically, and should be routinely reviewed to ensure they are correct, achievable and add to safety.
- **Systems** to investigate, record and monitor trends from incidents/accidents are needed, or a company is likely to suffer the same problem more than once.
- **Human Error** is now undoubtedly the largest problem in flight safety, arising from a combination of company system errors and the individual's cognitive shortfall, often under perceived pressure.
- **Liability** — Company Chief Executives and Board Members must be aware of their Corporate Liability (even Corporate Manslaughter charges); Boards must recognise the need to introduce an SMS and reduce identified risks to **As Low As Reasonably Practicable (ALARP)**.

The company's risks/hazards are studied and documented in a **SAFETY CASE**, listing safety-critical activities, who is accountable, and the hazards pertaining to each activity, with a feedback loop to keep it current. The prime tools used (borrowed from the oil and nuclear industries) are a **bow-tie analysis model** and a **risk matrix**.

**Proactive measures** (Bow-Tie): identify the hazard; identify the threats that could release the hazard; identify the threat controls (measures ensuring the threat cannot release the hazard); identify the escalation factors (conditions preventing threat controls being effective); assess the escalation controls (further measures needed); identify the hazardous event (the initial release of the hazard).

**Reactive measures** (Bow-Tie): assess the recovery measures that would return the situation to normal; identify escalation factors that could prevent recovery action being effective; identify escalation controls needed to maintain control; assess the consequences that may occur if control fails; apply damage limitation to reduce the effect of the consequences.

Findings from Shell Aviation included: management needed to be more active in remedial actions; competencies and accountabilities needed to be defined from the Chief Executive Officer down to the shop floor; management training was required; the workforce was not fully compliant with laid-down procedures, despite working with the best intentions; procedures were not used systematically and not audited, with work often carried out from memory; there was a lack of supervision, poor change management and poor auditing; and incident investigation often addressed the effect, not the cause.

From investigations of many accidents where a human failure in maintenance was identified, the **Air Accident Investigation Branch (AAIB)** concluded: well-trained, experienced and knowledgeable engineers made errors by not following company procedures/manuals, while the company required them to perform close to optimum in a procedural manner; critical maintenance tasks should be protected from any **single path to failure**; the current philosophies of self-certification and company approvals assume that a suitably selected, trained and equipped individual will not make any significant errors; Quality Systems tend to monitor paperwork rather than the complete, actual task (QA might not be carried out during the night shift); and the increasing complexity of modern aircraft requires a "by the numbers" approach, which might be resented by present engineers.

**Prognosis** — avoiding future unnecessary accidents depends on an attitude of total compliance being fostered, since maintenance staff cannot have enough information to understand the consequences of any deviation from Approved Data. This requires a major cultural change, including re-evaluating the wisdom of self-certification.
        $cnt2$,
        8
    ) RETURNING id INTO s8_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 09.9: Hazards in the Workplace
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m09_id, 'M09.9', 'Hazards in the Workplace',
        $cnt3$
# Hazards in the Workplace

## General Safe Practice for Engineers and Trainees

Genuine safety comes from developing **"safety awareness"** — the same as "road sense" when driving.

**Basic points of safety:**

- Learn the safe way of doing each task
- If you do not understand, ASK for an explanation
- If you are not taught, ASK for instruction
- Use the safe method in practice
- Be constantly on guard against careless actions by yourself or others
- Practise good housekeeping at all times
- Co-operate promptly in the event of an accident or fire
- Report all accidents to an instructor
- Draw your instructor's attention to any potential hazard

**Think!** — the causes of most accidents are not difficult to understand: sharp edges cut; heat or flames burn; acid destroys; gears, power-driven rollers or other revolving parts can trap fingers or clothing; anything moving or anything heavy can be dangerous; electricity can burn or destroy; falls can injure; anything incorrectly supported may fall.

**Action** — identify which dangers are present and take necessary precautions; make sure guards are in position and correctly adjusted; check your instructions. Not all dangers are immediately obvious — for instance, a damaged or improperly mounted grinding wheel can burst at speed, so the mounting of grinding wheels by persons other than those trained and appointed is prohibited by the **Abrasive Wheels Regulations**.

**Dealing with Emergencies** — the first person to become aware of an emergency is responsible for giving the alarm; it is essential to know the position and method of operating the fire alarm and the machinery emergency stop system, which shuts down all machinery in the area and is used whenever a person is trapped in a machine and time would be lost reaching its own switch. **THE FIRST OBJECTIVE IN ANY EMERGENCY IS TO PREVENT LOSS OF LIFE, FURTHER INJURY TO A VICTIM, OR INJURY TO OTHER PERSONNEL.** Where a victim is trapped, shut down the cause of the accident (e.g. the machine, power supply, gas or compressed air), then summon assistance. Know who is qualified to render first aid; report any injury, however minor, to the first aider, and report any hazard that could cause an accident.

**The Training Centre** — safety is based largely on "a place for everything and everything in its place": gangways clear of obstacles; guards protecting moving machinery parts; not treading on or sitting on sharp-edged or pointed tools left lying around. Spilt liquids or grease splashes should be cleaned up immediately — in an emergency, rapid movement means a fall on a patch of oil could cause a disastrous delay to others.

**Hand Tools** — injury from hand tools is frequently caused by stupidity, carelessness or distraction.

**Horseplay** — a most dangerous practice, often resulting in injury or death, and strictly forbidden; for example, a compressed air gun can be as lethal as a revolver and should never be playfully used.

**Electricity (introduction)** — its power is well known, but it is invisible, and its invisibility is often forgotten because its presence is sometimes made obvious by lights or dials. NEVER assume that equipment fed by an electric cable is dead; even this precaution is insufficient with equipment heated by electricity, as it still takes time to cool down. Do NOT meddle with electrical matters — leave them to the electrician.

**Safety pictorial signs:**

| Sign type | Appearance | Example |
|-----------|-----------|---------|
| Prohibitive | Black pictorial signs on white background, inside a red circle with a red diagonal | "No smoking" |
| Safety instruction | Pictures, usually white, on a blue disc | "Wear goggles," "Wear hard hat," "Wear ear muffs" |
| Caution | Signs, usually black, contained in an orange/yellow triangle | "Flammable material" |
| Safety information | Rectangular sign, green background, usually in white | Location/direction of first aid or an emergency exit |

**General workshop safety precautions:**

- Wear overalls buttoned up and sleeves buttoned at the wrist; overalls MUST be in good repair
- Do NOT wear loose clothing such as scarves and ties, or loose bandages, as they can catch in machinery
- Do NOT wear rings, watches or necklaces
- Hair must be short or covered with a cap
- Wear strong boots or shoes, preferably with strengthened toe caps — trainers and the like must not be worn
- Rub barrier cream into the hands before starting work and wash with cleaning gel on completion (never use abrasive powders or solvents)
- Do NOT run or shout (except in an emergency) in the workshop
- Keep the workshop tidy; return tools to their stowage after use
- Mop up any spilt water or oil — you could slip on it
- Keep all gangways clear
- Do NOT skylark or play around in the workshop

**Remember — ACCIDENTS DO NOT HAPPEN, THEY ARE CAUSED!**

## Electrical Safety

- No defective electrical equipment may be used; any faulty equipment must be reported immediately
- Electrical equipment must never be touched with wet hands
- Do NOT use electrical equipment with frayed wires — they are dangerous and must be reported
- Electrical connections must always be made by an authorised person
- Electrically driven hand tools must be earthed — if the earth is not connected to the earth pin, the body of the tool can become live and give a fatal shock
- Power tools must not be connected to a lamp socket, as these have no earth connection
- Electrical hand tools must be properly insulated
- Correct voltage must be used

## Compressed Air

Compressed air is very powerful and its misuse can be very dangerous.

- Never direct compressed air at yourself or any other person — it can drive particles of dust and dirt under the skin and **kill, at as low a pressure as 5 psi**
- Ensure all connections are tight
- Wear gloves and goggles
- Ensure all pipelines are free from splits or damage

## Acids, Chemicals and Solvents

- Use in a well-ventilated area
- Wear breathing apparatus when necessary
- Wear protective clothing — i.e. rubber gloves, rubber apron and rubber boots

**Working with Sheet Metal** — sheet metal stock and material that has been sheared has sharp edges that will easily cut bare flesh; gloves should always be worn when handling sheet metal. Stacks of metal sheets should not be placed near machines, as vibration can cause the stack to creep and eventually collapse, with the risk of injury. Safety footwear should be worn to prevent serious injury to feet.

## Machine Safety

Machines in motion are always a hazard and a trap for the unwary — compared with man they are very powerful, so no risks must ever be taken when operating them. Untidy hair or clothing is easily caught by unguarded moving parts; the first line of defence is to ensure the guard is always in position and properly adjusted for the work.

**DO:** keep machines and equipment clean and in good condition; before starting a machine, ensure you know how to stop it; switch off the machine immediately if anything goes wrong; keep the machine and surrounding area tidy; check oil levels before first starting machines; switch off the machine at the mains at the end of each day; check that chucks/cutters rotate in the correct direction before commencing cutting; use the correct tool or cutter for the job; replace worn or damaged tools; keep tools and cutters in boxes or racks when not in use; report immediately any mechanical or electrical fault; ensure all machine guards are in position before starting; check the work area is clear before starting; ensure feed mechanisms are not engaged before starting.

**DO NOT:** attempt to operate a machine until you know how to use it correctly; tamper with a machine; remove stops to obtain a greater cutting range; try to reverse the direction of a spindle while it is in motion; try to change a spindle speed while it is in motion; throw things; walk away and leave a machine running; direct compressed air at yourself or workmates (it can kill); leave a crane hook over a machine or the surrounding area after use; interrupt anyone operating a machine.

## Protective Clothing

| Item | Purpose |
|------|---------|
| **Overalls** | Protection from normal dirt, dust and oil |
| **Aprons** | RUBBER for protection from acids, or LEATHER for protection from heat |
| **Safety footwear** | Boots/shoes with steel toe-caps, protecting the toes from falling objects |
| **Gauntlets** | Rubber gauntlets when handling acids; leather gauntlets when handling hot or very cold objects |
| **Goggles and face shields** | Protect the eyes from metal particles, molten metal, acids and glare — when welding, use goggles/a face shield with the correct filter |
| **Hard hats** | Must be worn when there is a danger of tools/equipment being dropped during overhead working |

## Aircraft Safety

**Security of Cowlings, Panels and Door Fasteners** — it is of extreme importance that these are serviceable, fitting securely and flush with the aircraft contours. A panel coming undone or falling off in flight could increase the aircraft's stalling speed, or be sucked down a jet engine intake, causing engine failure and a possible crash. When a panel, hatch or cowling is removed, it and the surrounding structure should be examined (particular attention to fasteners); before refitting, carry out a **LOOSE ARTICLE CHECK**, then refit ensuring a flush fit. Removed panels should be marked (on the inside, to avoid damaging high-speed finishes) with the aircraft's number and removal position, and stored on racks to avoid damage/distortion.

Precautions to avoid damaging aircraft surfaces:

- DO NOT lean ladders or trestles against any part of the aircraft
- DO NOT forcibly lever off cowlings or cover plates with a screwdriver
- DO NOT use a hammer to assist in locking or unlocking cowling fasteners
- DO NOT throw detached cowlings onto the ground, or allow them to blow away
- DO NOT throw chocks in front of the wheels — place them carefully
- AVOID treading where "NO STEP" is stencilled
- DO NOT place weatherproof covers on wet or muddy ground
- ALWAYS keep the surface finish scrupulously clean

**Danger Notices** are displayed for servicing operations such as pressure testing of aircraft/air conditioning systems, NDT using X-ray equipment, testing of special radio equipment, and running engines (with safety men also posted). **Propeller and rotor blade tips** are painted red/white/red to highlight the increased hazard of an aircraft with engines running.

**Entrances and Exits** — normal, emergency and break-in methods, with controls and instructions clearly marked inside and outside the aircraft. Controls for emergency entrance and exits are identified by **black and yellow diagonal stripes** (sometimes with arrows pointing to them); "Break In" markings are identified by a broken coloured line defining the break-in area. Warning of explosive danger is marked with an **INVERTED RED TRIANGLE** with the word "DANGER" printed in red.

**Working on Aircraft** — work often means working in a limited space, so care is needed with tools, as a slipping tool can cause damage to surrounding equipment; any damage must be reported. When it is necessary to walk on aircraft surfaces, keep to clearly defined walkways, use the rubber mats supplied, and wear only the correct footwear.

## Aircraft Danger Zones

During engine starting and while an engine is running, it is dangerous to approach an aircraft from the front or side where a propeller is fitted — always keep clear. A turbo-prop aircraft may not have its engine running, but care is still necessary, as wind can, under certain circumstances, start to rotate the propeller at a dangerous speed. With gas turbine aircraft, keep well outside the danger zones both fore and aft of the engine nacelles.

If surface wind is more than **25 knots**, the dangerous area at the engine inlet must be increased by **20%**. The ramp should be cleaned of snow, ice, water, oil or other contamination (or the aircraft moved to a clean location) before engine operation, and persons in the flight compartment must be able to speak to persons near the dangerous area.

Approach to a helicopter about to start, or with the engine running, also requires caution: when the rotor is revolving slowly, the blades may suddenly drop (**blade sailing**), and under certain conditions (low rotor speed, high wind) the drop may increase enough for the blades to strike the fuselage; blade sailing is dangerous to personnel, as the blades may also touch the ground and disintegrate. If power is applied to lift the aircraft, the fuselage may swing, taking the tail rotor around with it. Rules for helicopters:

- DO NOT stand within the rotor disc area — vital in gusty weather, when blade sailing may occur
- DO NOT approach the helicopter unless requested by the pilot or occupant
- Approach the helicopter ONLY from the recognised safe direction — normally the **advancing blade side**

## Loose Articles in Aircraft

It is dangerous to leave tools and other loose articles in an aircraft, as they may foul the controls; if a loose item changes position while the aircraft is manoeuvring in the air, it can lock the controls and cause a crash. Use only the tools supplied, and check the full tool kit before starting and after completing work — each tool should be marked so it can be identified as belonging to that tool kit, and **shadow boards** allied with a number tag system help quickly assess whether tools are missing. Never enter an aircraft with articles carried in the flapless pockets of overalls — empty pockets before entering, and it is usual to remove patch pockets from new overalls before use. NEVER leave cleaning rags in the aircraft; after any repair work, the repair area should be completely cleaned of swarf, rivet heads, broken mandrels, locking wire and rag, and surplus rivets, nuts, bolts and washers must be removed. NEVER consider a missing item too small to cause an accident — a vacuum cleaner is often useful to retrieve an item dropped behind a fairing or stringer; if an item is lost and cannot be found, report the fact.

Litter or loose articles must never be left on servicing or parking areas, as they may blow about and be sucked into jet engine air intakes during ground running. Intake guards, painted a distinctive colour (to prevent the aircraft inadvertently taking off with them fitted), may be used during ground servicing, but care should be taken not to fit them when icing conditions are likely. Standard airborne equipment (fire axes, first aid kits, aircraft documents, control locks etc.) should be securely stowed.

**Foreign Object Damage (FOD)** costs millions of pounds each year, and often also results in loss of lives. FOD is anything alien to the efficient operation of the engines or controls of an aircraft — ranging from a piece of locking wire or a split pin, up to spanners, hammers, cutlery, buttons and pens. Such items sucked into a jet engine can completely destroy it; jammed in the controls, they can make the aircraft unmanageable. To prevent FOD: develop a clean and tidy attitude in your work, picking up dropped locking wire, nuts, bolts or split pins; know where the FOD box or litter bin is located; check tools and equipment before AND after performing a task; and be honest — if you accidentally drop an object in an aircraft and cannot locate it, REPORT IT.

## Fire Precautions

The hazards of fire can only be reduced by efficient servicing methods and observing fire regulations, backed by the prompt and effective use of fire-fighting equipment.

**Fire prevention:**

- Any spillage or leakage of fuel must be investigated and cleared up immediately
- Power-driven ground equipment should not be operated where there is a risk of fire
- During fuel transfer, ALL unnecessary electrical supplies and engine-driven ground equipment MUST BE SWITCHED OFF (including adjacent equipment being refuelled)
- Grease and oils must not come into contact with any part of an oxygen system — the result is very explosive
- Personnel working in or near explosive buildings must acquaint themselves with the fire-fighting needs indicated by the sign displayed outside
- Waste oils/grease should be removed at the end of the day to a disposal pit or incinerated; oil-soaked rags must be stored in a metal bin with a lid
- Matches and cigarette lighters MUST NOT BE CARRIED where there is a fire risk
- **SMOKING IS FORBIDDEN IN OR NEAR AIRCRAFT FUEL AREAS OR EXPLOSIVES**
- Grease, oil, paints etc. must be stored in an approved store, not left in the workshop
- Electrical equipment that is NOT of the flame-proof pattern MUST NOT be used in the presence of combustible vapours

## Manual Lifting Techniques

Correct lifting techniques must always be used — the human spine is not an efficient weight-lifting machine, and can be easily damaged if incorrect techniques are used.

**Correct manual lifting technique:**

- The lift should start with the lifter in a balanced squatting position, legs hip-width apart, one foot ahead of the other, and the load held close to the body, with a safe secure hand grip obtained
- Before the weight is taken, the back should be straightened and held as near the vertical position as possible; the chin should be drawn in with the head up — this helps keep the spine rigid
- To raise the load, first straighten the legs — this ensures the lifting strain is correctly transmitted and taken by the powerful thigh muscles and bones
- To complete the lift, raise the upper part of the body to the vertical position

**Principal rules for holding and carrying:**

- Keep the body upright when carrying a load, and hold the load close to the body
- Distribute the weight of the load evenly
- Let the bone structure of the body support the load
- Use aids such as harness, straps and yokes

**Protection Against Injury** — before lifting and manhandling operations begin, the area of operation should be clear of obstructions, and all movable objects that could be considered obstructions should be moved to a safe place.
        $cnt3$,
        9
    ) RETURNING id INTO s9_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M09.7 Tasks (16 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s7_id, 'Why should overalls only have pockets that can be secured, and be kept empty except for essential work items?',
     '[{"id":"a","text":"Loose personal items on the person can form a FOD hazard","correct":true},{"id":"b","text":"It is a legal requirement under the Air Navigation Order","correct":false},{"id":"c","text":"It reduces the weight the engineer has to carry","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s7_id, 'For filing/machinery work at a bench, the work piece should ideally be positioned:',
     '[{"id":"a","text":"5 cm lower than elbow height","correct":true},{"id":"b","text":"25 cm above elbow height","correct":false},{"id":"c","text":"At shoulder height","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s7_id, 'For visual inspections, the work piece should ideally be positioned:',
     '[{"id":"a","text":"5 cm below elbow height only","correct":false},{"id":"b","text":"Between elbow height and 25 cm above","correct":true},{"id":"c","text":"At floor level","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s7_id, 'When lifting an item from floor level, the correct technique is to:',
     '[{"id":"a","text":"Bend the knees, legs slightly apart, and lift using the leg muscles, keeping the back reasonably straight","correct":true},{"id":"b","text":"Bend from the waist keeping the legs straight, using the back muscles to lift","correct":false},{"id":"c","text":"Twist at the hips while lifting to reduce strain on the arms","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s7_id, 'Twisting whilst carrying a load or applying a force such as drilling or hammering should be avoided because it can:',
     '[{"id":"a","text":"Lead to back problems","correct":true},{"id":"b","text":"Cause vibration white finger","correct":false},{"id":"c","text":"Cause parallax error","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s7_id, 'When moving a wheeled vehicle by pushing or pulling, an engineer should:',
     '[{"id":"a","text":"Strain as hard as necessary to get it moving quickly","correct":false},{"id":"b","text":"Ensure it has a serviceable brake system and never strain — get help if it will not move with a reasonable push/pull","correct":true},{"id":"c","text":"Always pull it rather than push it, regardless of layout","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s7_id, 'As a general rule, whatever an engineer is working on should ideally be no more than:',
     '[{"id":"a","text":"A forearm''s length away from the body torso","correct":true},{"id":"b","text":"Two arm''s lengths away from the body torso","correct":false},{"id":"c","text":"Whatever distance is most convenient at the time","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s7_id, 'When drilling or riveting, the best position for the wrist/hand is the fingers closed around a handle of diameter:',
     '[{"id":"a","text":"1 to 1½ in. (25 to 38 mm)","correct":true},{"id":"b","text":"3 to 4 in. (75 to 100 mm)","correct":false},{"id":"c","text":"Less than ½ in. (12 mm)","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s7_id, 'When working at height outside the aircraft, on a ladder or platform, a safety harness should be worn if the height is:',
     '[{"id":"a","text":"1 metre or more from the ground","correct":false},{"id":"b","text":"3 metres or more from the ground","correct":true},{"id":"c","text":"10 metres or more from the ground","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s7_id, 'Guardrails around working platforms should be approximately:',
     '[{"id":"a","text":"Knee height","correct":false},{"id":"b","text":"Waist height","correct":true},{"id":"c","text":"Head height","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s7_id, 'An engineer who suffers from claustrophobia (fear of enclosed spaces) should:',
     '[{"id":"a","text":"Be expected to work in enclosed spaces such as fuel tanks regardless","correct":false},{"id":"b","text":"Not be expected to undertake work in enclosed spaces","correct":true},{"id":"c","text":"Only be permitted to work in enclosed spaces at night","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s7_id, 'If a task becomes repetitive, what typically takes over from the central processor, with only occasional monitoring?',
     '[{"id":"a","text":"The motor memory","correct":true},{"id":"b","text":"The short-term sensory store","correct":false},{"id":"c","text":"The long-term declarative memory only","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s7_id, 'Which of the following is one of the four recommended ways to prevent boredom and complacency when a task becomes repetitive?',
     '[{"id":"a","text":"Take regular short breaks","correct":true},{"id":"b","text":"Work through without stopping to finish faster","correct":false},{"id":"c","text":"Avoid checking the manual so as not to slow down","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s7_id, 'Holding an instrument scale parallel to a centre line through the observer''s eyes, or using a light at 90 degrees to the scale, helps to prevent:',
     '[{"id":"a","text":"Parallax error","correct":true},{"id":"b","text":"Colour blindness","correct":false},{"id":"c","text":"FOD","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s7_id, 'To minimise the effects of the eye''s blind spot when carrying out a visual inspection (e.g. examining a row of rivets), an engineer should:',
     '[{"id":"a","text":"Stare fixedly at one area for as long as possible","correct":false},{"id":"b","text":"Keep eye movements short and frequent, avoiding staring at one area too long","correct":true},{"id":"c","text":"Close one eye throughout the inspection","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s7_id, 'Each trade involved in a task such as an engine change signs which document to show they are satisfied their part of the work is complete?',
     '[{"id":"a","text":"A Certificate of Release to Service (CRS)","correct":true},{"id":"b","text":"A Mandatory Occurrence Report (MOR)","correct":false},{"id":"c","text":"A Safety Case","correct":false}]',
     '{"B1.1","B1.3","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M09.8 Human Errors (18 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s8_id, 'The 25 May 1979 American Airlines DC10 accident at Chicago''s O''Hare Airport, in which the left engine fell off during take-off rotation, was directly attributed to:',
     '[{"id":"a","text":"Improper maintenance procedures, including fitting engines with a fork lift as a short cut","correct":true},{"id":"b","text":"A design fault in the wing spar undetectable by any inspection","correct":false},{"id":"c","text":"Bird strike damage to the pylon structure","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s8_id, 'Following the 1989 F-28 accident in Canada in which maintenance was found to be a contributing factor, who was tasked with developing a training programme to help reduce maintenance errors?',
     '[{"id":"a","text":"James Reason","correct":false},{"id":"b","text":"Gordon Dupont","correct":true},{"id":"c","text":"Heinrich","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s8_id, 'An active error is best described as:',
     '[{"id":"a","text":"An error made by the person at the end of a line of contributory circumstances","correct":true},{"id":"b","text":"A hidden management or organisational failure removed in time and space from the accident","correct":false},{"id":"c","text":"An error that can only be made by regulatory bodies","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s8_id, 'According to the module, statistics show there are approximately how many latent failures for every active failure?',
     '[{"id":"a","text":"About the same number of each","correct":false},{"id":"b","text":"About three times as many latent failures as active failures","correct":true},{"id":"c","text":"About ten times as many active failures as latent failures","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s8_id, 'A latent failure always:',
     '[{"id":"a","text":"Pre-exists the active failure it later combines with","correct":true},{"id":"b","text":"Occurs after the active failure that triggers it","correct":false},{"id":"c","text":"Is committed intentionally by the person involved","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s8_id, 'Heinrich''s Ratio, also known as the Iceberg Model, indicates that there are approximately how many incidents for every fatal accident?',
     '[{"id":"a","text":"60 incidents","correct":false},{"id":"b","text":"600 incidents","correct":true},{"id":"c","text":"6,000 incidents","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s8_id, 'Of the roughly 200 cases the CAA investigates each year, approximately how many are taken to prosecution?',
     '[{"id":"a","text":"About 5","correct":false},{"id":"b","text":"About 35","correct":true},{"id":"c","text":"About 150","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s8_id, 'Which of the following is one of the three important questions used to determine whether discipline is required following an error?',
     '[{"id":"a","text":"Was the act deliberate?","correct":true},{"id":"b","text":"Was the person on a night shift?","correct":false},{"id":"c","text":"Was the aircraft insured?","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s8_id, 'In James Reason''s model of accident causation, each level of management/department acting as a barrier with holes (which can align to allow an accident opportunity through) is likened to:',
     '[{"id":"a","text":"A mouse nibbling at a slice of Swiss cheese","correct":true},{"id":"b","text":"A house of cards","correct":false},{"id":"c","text":"A chain with a single weak link","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s8_id, 'The "Dirty Dozen," identified by Gordon Dupont, refers to:',
     '[{"id":"a","text":"The 12 most common causes of latent failures (Common Causes of Judgement Interference)","correct":true},{"id":"b","text":"12 mandatory duplicate inspection points on every aircraft","correct":false},{"id":"c","text":"12 categories of aircraft licence under EASA Part-66","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s8_id, 'A person returning to a task after being interrupted by a distraction should:',
     '[{"id":"a","text":"Continue exactly from where they think they left off","correct":false},{"id":"b","text":"Go back three steps before going forward again","correct":true},{"id":"c","text":"Restart the entire job card from the beginning regardless of progress","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s8_id, 'The 1979 DC10 crash at Chicago''s O''Hare Airport is used as an example of which of the Dirty Dozen items?',
     '[{"id":"a","text":"Norms — an unapproved short-cut method of engine installation had become the accepted way of doing the job","correct":true},{"id":"b","text":"Lack of Teamwork","correct":false},{"id":"c","text":"Lack of Awareness","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s8_id, 'In the CAA''s analysis of 230 Mandatory Occurrence Reports, which fundamental cause of occurrence was the most frequent, at 49%?',
     '[{"id":"a","text":"Incorrect installation","correct":true},{"id":"b","text":"Inadequate servicing","correct":false},{"id":"c","text":"Component overhaul error","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s8_id, 'When analysed for occurrences causing a Significant Reduction in Safety (rather than just Operational Limitations), incorrect installation as a cause rises to approximately:',
     '[{"id":"a","text":"20%","correct":false},{"id":"b","text":"49%","correct":false},{"id":"c","text":"80%","correct":true}]',
     '{"B1.1","B1.3","B2"}'),

    (s8_id, 'A duplicate inspection, as required by regulating bodies such as the CAA on critical systems and vital points, is best described as:',
     '[{"id":"a","text":"A single inspection carried out twice as quickly as possible by the same engineer","correct":false},{"id":"b","text":"An inspection made first by one qualified type-rated engineer and subsequently repeated by a second qualified type-rated engineer","correct":true},{"id":"c","text":"A functional test performed instead of a physical inspection","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s8_id, 'According to the UK Safety Regulation Group''s Top Ten Safety Risks in Aviation, which category is identified as the most significant by a large margin?',
     '[{"id":"a","text":"Design Related risks","correct":false},{"id":"b","text":"Crew & Human Factors","correct":true},{"id":"c","text":"Non JAA/FAA Operator Safety","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s8_id, 'The maintenance errors described at Britannia Airways, including omitted nosewheel axle washers and an omitted brake unit locking bolt, carried an estimated operational impact cost of approximately:',
     '[{"id":"a","text":"£5,000","correct":false},{"id":"b","text":"£500,000","correct":false},{"id":"c","text":"£5 million","correct":true}]',
     '{"B1.1","B1.3","B2"}'),

    (s8_id, 'Which of the following is described in the module as a recoverable (insured) cost following an aircraft accident?',
     '[{"id":"a","text":"Hull loss, property damage and personal liability for passengers and crew","correct":true},{"id":"b","text":"Disruption to schedules and servicing","correct":false},{"id":"c","text":"Loss of the company''s reputation and future business","correct":false}]',
     '{"B1.1","B1.3","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M09.9 Hazards in the Workplace (17 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s9_id, 'Genuine safety awareness in the workshop is described in the module as being the same as:',
     '[{"id":"a","text":"Road sense when driving","correct":true},{"id":"b","text":"Common law negligence standards","correct":false},{"id":"c","text":"Basic first aid training","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s9_id, 'The mounting of grinding wheels is prohibited to untrained/unappointed persons under which regulations?',
     '[{"id":"a","text":"The Abrasive Wheels Regulations","correct":true},{"id":"b","text":"The Air Navigation Order","correct":false},{"id":"c","text":"The Health and Safety at Work Order","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s9_id, 'The machinery emergency stop system should be used whenever:',
     '[{"id":"a","text":"A person is trapped in a particular machine and time would be lost reaching its own switch","correct":true},{"id":"b","text":"A machine simply needs to be switched off at the end of the working day","correct":false},{"id":"c","text":"A fire alarm test is scheduled","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s9_id, 'The first objective in any emergency is to:',
     '[{"id":"a","text":"Prevent loss of life, further injury to a victim, or injury to other personnel","correct":true},{"id":"b","text":"Identify who is at fault","correct":false},{"id":"c","text":"Complete the job card before dealing with the emergency","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s9_id, 'Horseplay in the workshop, such as playfully using a compressed air gun, is dangerous because such a gun:',
     '[{"id":"a","text":"Can be as lethal as a revolver","correct":true},{"id":"b","text":"Only causes minor bruising at typical workshop pressures","correct":false},{"id":"c","text":"Is banned only in electrical workshops","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s9_id, 'A prohibitive safety sign (such as "No Smoking") is displayed as:',
     '[{"id":"a","text":"A black pictorial symbol on white, inside a red circle with a red diagonal","correct":true},{"id":"b","text":"A white picture on a blue disc","correct":false},{"id":"c","text":"A black symbol in an orange/yellow triangle","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s9_id, 'A safety instruction sign, such as "Wear Goggles" or "Wear Hard Hat," is displayed as:',
     '[{"id":"a","text":"A rectangular green sign with white lettering","correct":false},{"id":"b","text":"A white picture on a blue disc","correct":true},{"id":"c","text":"A red circle with a diagonal line","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s9_id, 'Electrically driven hand tools must be earthed because:',
     '[{"id":"a","text":"If the earth is not connected to the earth pin, the body of the tool can become live and give a fatal shock","correct":true},{"id":"b","text":"Earthing improves the tool''s cutting performance","correct":false},{"id":"c","text":"It is only a cosmetic requirement with no safety benefit","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s9_id, 'Misuse of compressed air directed at a person can kill at a pressure as low as:',
     '[{"id":"a","text":"5 psi","correct":true},{"id":"b","text":"50 psi","correct":false},{"id":"c","text":"500 psi","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s9_id, 'When working with acids, chemicals and solvents, the recommended protective clothing includes:',
     '[{"id":"a","text":"Rubber gloves, rubber apron and rubber boots","correct":true},{"id":"b","text":"Leather gauntlets and a leather apron only","correct":false},{"id":"c","text":"Standard cotton overalls with no additional protection","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s9_id, 'Which of the following is listed as a "DO NOT" when operating machines and powered tools?',
     '[{"id":"a","text":"Try to reverse the direction of a spindle while it is in motion","correct":true},{"id":"b","text":"Check that chucks or cutters rotate in the correct direction before cutting","correct":false},{"id":"c","text":"Ensure the work area is clear before starting the machine","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s9_id, 'Rubber gauntlets and leather gauntlets are used, respectively, to protect the hands when:',
     '[{"id":"a","text":"Handling acids (rubber) and handling hot or very cold objects (leather)","correct":true},{"id":"b","text":"Welding (rubber) and handling acids (leather)","correct":false},{"id":"c","text":"Both are used interchangeably for any hazard","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s9_id, 'Before refitting a panel, hatch or cowling that has been removed for servicing, the engineer must first carry out:',
     '[{"id":"a","text":"A loose article check","correct":true},{"id":"b","text":"A duplicate inspection by a second engineer only","correct":false},{"id":"c","text":"A functional check of the hydraulic system","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s9_id, 'Controls for emergency entrances and exits on an aircraft are identified by:',
     '[{"id":"a","text":"Black and yellow diagonal stripes","correct":true},{"id":"b","text":"A plain red circle","correct":false},{"id":"c","text":"An inverted green triangle","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s9_id, 'If the surface wind is more than 25 knots during engine operation, the dangerous area at the engine inlet must be increased by:',
     '[{"id":"a","text":"5%","correct":false},{"id":"b","text":"20%","correct":true},{"id":"c","text":"50%","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s9_id, 'When approaching a helicopter that is about to start or has its engine running, the recognised safe direction of approach is normally:',
     '[{"id":"a","text":"From directly behind the tail rotor","correct":false},{"id":"b","text":"From the advancing blade side","correct":true},{"id":"c","text":"From directly underneath the main rotor disc","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s9_id, 'Foreign Object Damage (FOD) is best described as:',
     '[{"id":"a","text":"Anything alien to the efficient operation of the engines or controls of an aircraft","correct":true},{"id":"b","text":"Damage caused only by bird strikes during flight","correct":false},{"id":"c","text":"A category of authorised airborne equipment such as fire axes and first aid kits","correct":false}]',
     '{"B1.1","B1.3","B2"}');

END $$;
