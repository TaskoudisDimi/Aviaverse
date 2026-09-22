-- Module 09: Human Factors (B1/B2 Common) — Social Psychology, Communication, The Physical Environment
-- Source: EASA Part-66 Module 9A official textbook (IKAROS Aviation Training Centre, IK M9A, Issue Oct.2012)

DO $$
DECLARE
    m09_id INT;
    s4_id  INT;
    s5_id  INT;
    s6_id  INT;
BEGIN
    SELECT id INTO m09_id FROM easa_modules WHERE code = 'M09';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M09.4') THEN
        RAISE NOTICE 'M09.4-M09.6 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 09.4: Social Psychology
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m09_id, 'M09.4', 'Social Psychology',
        $cnt$
# Social Psychology

## Individual Personality

Each of us — even identical twins — is psychologically different in one way or another from our fellow man. This variation constitutes what we recognise in each other as differences in personality. Our personal differences are believed to be affected by our **genes**, our **environment** and our **social interaction**. Our schemata (previous experience stored in memory) lead us to assume certain things about other people, which may be biased.

### Character and Temperament

Two terms often used interchangeably with "personality":

- **Character** — has two related meanings: one moral (describing behaviour as good or bad — e.g. a weak character being "someone with poor impulse control"), the other concerned with strength or quality.
- **Temperament** — used to describe emotional disposition, e.g. a person being "hot tempered" or "sweet tempered".

**Personality** is the term used to embrace all those stable behavioural characteristics associated with an individual, and it is extremely important in determining relationships with others. Everyday descriptive phrases ("a jolly chap", "a daredevil", "a good listener") are unscientific and too general for accurately assessing personality.

### Assessing Personality

Quick first impressions are formed from appearance, dress and physical build:

- Short, fat people are perceived as easy going, sociable and self-indulgent
- Tall, thin people are perceived as fragile, introspective, sensitive and nervous
- Muscular, square-shouldered people are perceived as restless, energetic and insensitive

These are prelearned preconceptions from long-term memory that "colour" the true assessment of an individual's personality. Personality should properly be assessed by techniques such as **interviews, projective tests and questionnaires**.

### Classification of Personality

The early Greeks placed people into four temperamental groups:

| Type | Characteristics |
|------|------------------|
| **Melancholic** | Sad, doleful |
| **Phlegmatic** | Slow, stolid |
| **Choleric** | Easily moved to anger |
| **Sanguine** | Confident, cool |

Personality traits are deep-seated characteristics, largely innate and acquired very early in life. They are **stable and very resistant to change** — psychotherapy attempts to modify personality distortions have had very limited success even over many years.

### The Two-Dimensional Model of Personality

The major dimensions of personality are **extraversion** and **anxiety**. These two traits are not related to one another, so some people may be anxious and extroverted, others anxious and introverted. Plotting test/questionnaire results on a two-dimensional graph (extraversion vs. anxiety) shows most people cluster around the average; as deviation from average increases, personality characteristics become more pronounced:

- **Anxious extravert** — aggressive and changeable; likely to be a risk taker
- **Anxious introvert** — sober and pessimistic; more rigid and, when confronted with an emergency, may not be able to perform
- **Stable introvert** — thoughtful and controlled
- **Stable extravert** — responsive and easy going

**On average, the aircraft engineer has been found to be a stable introvert** — thoughtful and controlled, and not likely to take risks.

**Dysthymia** refers to a prevalent form of subthreshold depressive pathology, with gloominess, anhedonia, low drive and energy, low self-esteem and a pessimistic outlook.

## Interaction Between Individuals

The **Authoritarian** individual is often arrogant and will not easily tolerate dissent from subordinates, but can become extremely submissive when confronted by someone of perceived higher status. Other interaction styles include **Paternalistic, Interactive** and **Submissive** — an individual's style may change over time (e.g. an apprentice can become an authoritarian Chief Engineer).

### The Two-Dimensional Model of Interactive Style

Two characteristics are required of an individual within a team:

- **Goal directed style (G+/G-)** — a G+ individual has a keen desire to complete the designated task; a G- individual cares little for the job and will not exert themselves unduly.
- **Person directed style (P+/P-)** — a P+ individual has concern for team members and will consult with them; a P- individual couldn't care less about other team members.

The required interactive style depends on circumstances. A **shift leader should have a P+ G+ style**, balancing production with the morale and wellbeing of shift members — but in an emergency (e.g. a hangar fire) an autocratic G+ approach may be necessary.

Team and individual effectiveness is determined by **Ability, Status and Role**:

- **Ability** — perceived competence, combined with interactive style, determines what other team members think of an individual. People more readily accept deficiencies in personality and interactive style if they perceive the individual is good at his job. A competent autocratic leader obtains a better result than a low-ability autocrat, who may be regarded with distaste and derision — other team members may even let him proceed on an incorrect course of action to "bring him down a peg". Conversely, high perceived ability has a negative side: a P+ G- team member may let a colleague perceived as competent proceed too far on an inappropriate course of action, assuming "he probably knows what he is doing".
- **Status** — shown by position in a hierarchy (rank) or **achieved status**, gained by demonstrating professional knowledge, leadership and management ability. Subordinates follow a leader with achieved status far better than one who relies only on rank.
- **Role** — confusion results if a team has more than one leader giving conflicting instructions of equal status; it must be clear to everybody who is in charge, usually shown by line management flowcharts and the management engineering exposition.

## Teamworking

### Group Decision Making

The decision reached by a group is generally better than the average decision of individuals within the group (though it may take longer), but a group decision will seldom improve on the problem-solving ability of the **ablest group member**.

Factors affecting group decisions:

- **Conformity** — people like to conform; non-conformity is stress inducing. Individuals will accept group opinions and attitudes even against their better judgement, feeling pressurised — this is known as **Peer Pressure**. Readiness to conform differs between sexes, nationalities and cultures. Peer pressure is helped by a team that is motivated, close-knit, well managed and supportive of the individual.
- **Compliance** — an individual's likelihood of complying with a request. A large, unreasonable request is more likely to be complied with if preceded by an even more outrageous (denied) request, or if a smaller, more reasonable request has already been accepted.
- **Risky Shift** — a group asked to consider a problem will usually reach a decision that is more risky than the average of individual decisions; bold, daring individual personalities make an unduly bold outcome even more likely.
- **Group Duration** — a long-standing team comes to know each other's habits, strengths and weaknesses. This can be an advantage, but if a team member falls ill, a new member will be unaware of signals or shortened procedures the team has adopted — potentially leading to misunderstanding and an accident.

### Improving Group Decision Making

- Avoid arguing for your personal judgements — approach the task on the basis of logic
- Avoid changing your mind only to reach agreement or avoid conflict — support only solutions you actually agree with
- Avoid conflict-reducing techniques such as a majority vote or a middle-course strategy
- View differences of opinion as helpful rather than a hindrance to decision making

## Management, Supervision, Leadership, Motivation and Peer Pressure

The team should include everyone from cleaners to top management — the shared objective is a safe aircraft with fare-paying passengers on time. Team meetings should discuss working conditions, past problems, company/team performance, future plans and anticipated problems (private matters kept in confidence).

Principles for a leader running a decision-making meeting while maintaining team morale:

- Avoid giving any indication of your own opinion at the outset, so team members with a different idea are not reluctant to air it
- Solicit the ideas of other members openly, especially doubts or objections, ensuring potential problems or dangers are fully aired
- When a decision is made, explain the reasons if there is time — otherwise crew members will feel their ideas were ignored and become reluctant to put forward proposals in future

### Motivation Factors

- **Expectations** — realistic promotion/progression opportunities are important motivators; firms should have a worker/supervisor/management structure to allow progression
- **Salary package** — money is a good motivator; the package can include basic salary, overtime rates, pension schemes, relocation expenses, share schemes, private health care and perks such as free flights
- **Shifts** — shift work disrupts Circadian rhythms and sleeping patterns, leading to fatigue, stress and long-term health problems: a strong **de-motivator**
- **Teamwork** — a close-knit, well managed, motivated team with supportive management has high morale

## Responsibilities — Individual and Group

### Individual Responsibilities

The engineer has a loyalty to passengers (aircraft safety), maintaining standards under Airworthiness Notice No 3 and the Air Navigation Order. A problem that cannot be resolved by studying the Company's Engineering Maintenance Exposition should be raised with Management; where there is a direct effect on aircraft safety, the engineer should consider **Mandatory Occurrence Reporting** under ANO Article 117/1.

If a safety concern within the Company cannot be resolved through every internal avenue, the engineer has a **Moral Obligation to Take It Further** — for example writing to the **Confidential Human Factors Incident Reporting Programme (CHIRP)**, a Charitable Trust publishing a quarterly periodical called **FEEDBACK** containing details of accidents/incidents. "Whistle blowing" is a very big step, but should be taken if it is the only resource left to correct an unsafe situation — the Public Order Disclosure Act in the UK allows whistle blowers to sue for unlimited compensation if the Company penalises them for public-spirited action.

### Company/Employer Responsibilities

The Company disseminates information to ensure safe operation, devolving responsibility to the Aircraft/Equipment Manufacturer, the Regulatory Authority (CAA & EASA in the UK), licensed and unlicensed engineers, related organisations (Health & Safety), and all others involved with aircraft operations, manufacture and maintenance. In a large company, a **Human Factors Manager** will be nominated.

The Company meets its requirements by: having accessible Company Procedures; running courses for new employees and updates on new procedures/legislation; having a QA and control system to verify procedures are followed; meeting Health and Safety/Factories Act requirements (heating, light, clean air, noise control); having correct equipment, hangarage and tools; adequately trained manpower; regularly reviewing pay and conditions; holding minuted staff meetings; highlighting Human Performance related incidents; and keeping records of such incidents so adverse trends can be noted and acted upon.

## Culture Issues

Disharmony from differences in cultural background can be the most difficult workplace conflict to rectify, as people bring deep-rooted ideologies from childhood. Group members perceive "out of group" members as different, and the group will perceive those differences as being **greater than they really are** — this categorisation leads to **stereotyping**, where strong positive or negative attitudes toward the out-group develop.

**Stereotyping has three main characteristics:**

- People are categorised on the basis of very visible characteristics (race, sex, nationality, body appearance, dress, disability, etc.)
- All members of a particular group are assumed to have the same characteristics
- Anybody seen to belong to a group is automatically assumed to have the group's characteristics

**Prejudice** can be positive or negative; treating a group badly because of a negative attitude is **discrimination**. Prejudice and discrimination are caused by:

- **Historical/Economic Causes** — e.g. discrimination traceable to colonial history, where colonised peoples were viewed as inferior yet exploited as a cheap labour supply; Marxist sociologists see prejudice as a way ruling classes justify exploiting a group or its resources.
- **Cultural Causes** — urbanisation, mechanisation, unemployment and job competition, growing importance of qualifications, the increasing power of the media, changes in family structure and morality, and upward mobility of some groups are all thought to increase prejudice.
- **Situational/Interpersonal Causes** — conformity to group norms; a non-prejudiced individual may conform to a prejudiced group's attitude and behave in prejudiced ways (e.g. the "I'm not prejudiced, but my customers wouldn't like it" excuse used by some restaurant owners in the Southern USA in the 1960s).
- **Individual Causes** — two main theories: the **frustration/aggression hypothesis** (a person prevented from reaching a goal experiences increased aggression, redirected onto a "scapegoat" if the original source is not attackable), and a theory of personality flaw arising from strict, rigid, punishment-centred upbringing by parents the child believes are wholly good but who are in fact deeply prejudiced.

Prejudice can lead to **harassment** in the workplace, causing stress — it can take the form of touching and bodily contact, the spoken word, the written word, drawings and gestures. Where any of these become a nuisance, management should help the individual tackle the problem.
        $cnt$,
        4
    ) RETURNING id INTO s4_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 09.5: Communication
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m09_id, 'M09.5', 'Communication',
        $cnt2$
# Communication

## Communication Within and Between Teams

Every organisation depends upon a communication network — the bigger the organisation, the more elaborate the communication system, generally following the lines of Management and Organisation within the company.

- **Downward communication** — from the accountable manager to the shop-floor engineer, usually passing several managerial levels; each superior level must pass information down fully, accurately, and with full understanding to the next subordinate level. Downward communications are usually **"directives"** intended to produce actions by subordinates.
- **Upward communication** — equally important, since shop-floor workers, being in direct contact with the actual work, can often see ways of improving methods, eliminating processes, or identifying cost savings. This flow should reach supervisors at each level as soon as available, otherwise supervisors develop feelings of loss of status/control. Upward communications are usually **"non-directive"** — reporting results or genuine information, not necessarily to prompt action.

The amount of downward communication generally **exceeds** that going up. A good communication system both up and down creates an atmosphere of co-operation and goodwill between employees and management.

Information communicated within or between departments at the same level (mere transfer of data or professional advice) is **horizontal** flow, used when co-ordinated effort is required on a task or project. The vital factor of good communication is **FEEDBACK** — it informs the sender that the message has been understood and acted upon, hopefully producing the expected result.

### Methods of Communication

**Spoken communication:**

| Type | Example |
|------|---------|
| One to one directive | "do it this way" |
| One to one discussion | appraisals and interviews |
| One to group | lecture |
| Group discussions | project teams, task groups |

**Written communication** the engineer works with includes Maintenance Manuals, Company Engineer Expositions, Service Bulletins and Company Memos (received); and Aircraft Maintenance records, Hand Over Reports at shift change, and Mandatory Occurrence Reports (produced).

**Directions of communication with examples:**

- **Downwards** — Company Exposition, House Magazine, Bulletin Boards, Pay-Packet Notices, Meetings, Public Address Announcements, Manuals & Service Bulletins
- **Downwards and upwards** — Joint Consultation, Social Gatherings, Conferences, the "Grapevine" (an informal, occasionally unreliable, but sometimes speedier source of information)
- **Upwards** — Suggestion Schemes, Opinion Polls, Grievance Investigations, Incident reporting (CHIRP, Mandatory Occurrence Reports)
- **Horizontal** — Co-ordinating Committees, Head Office Conferences, Circulating Files
- **Inwards** — Personal Calls, Telephone Calls, Correspondence
- **Outwards** — Advertising & Promotions, Annual Reports & Shareholders' Meetings

### Communication Problems

The most important distortions and misunderstandings occur in **vertical communications**, especially where messages change from oral to written and vice versa. Barriers to successful communication include:

- **Perception** — if a transmitter wrongly perceives the receiver, the wrong language/medium may be used; if a receiver has a poor perceived image of the sender, the message may not be treated with the urgency intended.
- **Jargon** — words, phrases and acronyms specific to one group can cause problems when communicating with members of another group.
- **Technical words** — using technical language with a non-technical audience causes the message's sense to become difficult or lost.
- **Process difficulties** — without feedback, a problem may exist where a message is not correctly transmitted or understood.

### Verbal Reports

Suited to straightforward, simple messages where the recipient is easily reached. A short briefing can be passed to a group for onward relay to subordinates, but the message can change as it is conveyed down the line — the classic example being the army message "Send reinforcements, we're going to advance" becoming, by the time it reached headquarters, "Send three and fourpence, we're going to a dance" (whispered words perceived by sound rather than sense). Communications also fail when a party is not listening or is distracted.

### Written Reports

Where distance, time, or complexity is involved, a **written report** should be made — it can be referred back to and forms a record that may be a basis for other actions. Reports should be written as clearly and concisely as possible for the intended reader.

### News Summaries

Used to inform employees of changes in company performance, safety issues and training course information, via Newsletter, Magazine, or bulletin board notice.

### Body Language

Eye contact, facial expression, body orientation, hand/head movement and physical separation all communicate without speech. Prolonged staring is seen as threatening. Facial expressions convey emotions such as sadness, delight, disgust, contempt and boredom. Touch (beyond a brief handshake) is not welcome in western society. Posture and body movement guide the listener's interest — we lean toward those we agree with and away from those we dislike; boredom is shown by avoiding eye contact or fidgeting. People guard personal space jealously. Verbal delivery itself communicates: a rising voice and rapid speech may portray anxiety, short clipped speech may express urgency, and rambling speech indicates uncertainty. An interruption is generally taken as a threat and seen as rude and domineering.

### Non-Verbal Communication (NVC)

Signals through posture, facial expression and gestures are sometimes less clear than speech and must be interpreted in context. Certain signals have **different meanings in different cultures** — for example, sticking your tongue out is regarded as rude in Britain, is an expression of apology or surprise in China, a sign of respect in Tibet, and means "NO" on the Marquesan Islands. Non-verbal aspects of speech (pitch, tone, speed of delivery) can reveal anxiety or confidence — for example, too many "ums" may show lack of knowledge. We have more control over our facial muscles than over our voice and hands when trying to conceal emotions.

### Function of Communications (as a Manager)

- Motivate people and get them going
- Instruct people in the task to be done
- Explain any problems that might be met
- Advise on the control and correction of others' activities
- Know what is going on
- Listen to other's ideas and opinions

### Communication Failures Occur

- When the technique of communication and the objectives become confused
- If there is too much talking and not enough listening by managers
- When there is a lack of definition in the management structure, leading to difficulties in responsibilities
- When Human Behaviour is misunderstood — believing man to be purely logical and independent, not appreciating emotional, social and group needs
- When insincerity is shown
- If there is ambiguity in the message
- Through inattention — not focusing fully on the person's message
- When there is a lack of **follow-up actions** to verify the instructions given
- Through overconfidence that information is fully understood — **70% of communication is misunderstood, rejected, distorted or forgotten**
- When information is left out, so a meaning is abstracted rather than received

## Worklogging and Recording

English is the international language of the aeroplane, but manuals may be provided in the country of manufacture's national language. When such equipment is used on the British register, written information and log books must be in English — foreign-language log books are closed and retained with the records. Work instructions must be received in writing, usually from maintenance control in the form of workpacks, and progress accounted for only by strict adherence to the rules in company manuals.

**Documentation:** Job Cards and Work Sheets should be designed so work can be signed for as it progresses, with full instructions on completion, avoiding ambiguity, with letters and numbers of a size that is easily read. Work must be recorded in accordance with the approved maintenance manual text and numbering system (also applying to Service Bulletins, Airworthiness Directives and Airworthiness Notices) — **there should be no relying on memory** or referring to unauthorised books such as training notes. Non-routine tasks rely on the licensed engineer completing work sheets progressively with duplicate inspections as required.

**"DO NOT ASSUME — CHECK!!"**

## Keeping Up to Date, Currency

All aircraft engineers must stay up to date with the latest service bulletins, letters and manual amendments — companies use safety notices and circulated amendment copies, with the Quality Assurance Department often requiring signed proof of reading. One of the biggest causes of aircraft accidents/incidents attributed to engineers is **incorrect assembly of components**, often due to carrying out work without reading the manuals and reverting to memory. The correct approach is to **read the manuals FIRST** — Aircraft Maintenance Manuals, Service Bulletins, Illustrated Parts Catalogue and pre-printed job cards — before starting the job. If the correct information cannot be found straight away, work on the aircraft/equipment should **STOP** until it is available.

## Dissemination of Information

Information passes between Manufacturers, Regulatory Bodies, Operators and Licensed Aircraft Engineers, and may be general or technical. The Civil Aviation Authority disseminates airworthiness technical and general information to pilots, airfield operators and licensed engineers via **CAP 455 Airworthiness Notices**. Where information requires certification action, it will be written in a format the individual engineer can understand (Service Bulletins, Letters, Manual Amendments). If information is important and safety-related, feedback is required, confirmed by those who need to know signing an attached action slip.

The licensed engineer has a duty to share knowledge of problems with peers and management, and — where a problem could possibly result in an aircraft accident — to inform the Airworthiness Authorities and Manufacturers under the **Mandatory Occurrence Reporting Scheme** (Air Navigation Order Article 117, Air Navigation (General) Regulations Article 17, CAAIP Leaflet BL/1-13, and CAP 382). Sensitive information can be passed on anonymously through **CHIRP**, whose periodical **FEEDBACK** omits all identifying details of operator, registration and persons concerned.

### Case Study: Absence of Communication in the Hangar Kills 14

An Embraer 120 with 14 persons on board broke up in flight over Eagle Lake, TX on 11 September 1991 at 24,000 feet, following a violent five-G nose-down pitch caused by loss of the left horizontal stabiliser leading edge, which had **47 screws missing**. The night before, a second shift had removed the leading edge to change de-ice boots but did not complete the left side; a third shift reinstalled the right leading edge (in the dark, without direct light) and signed off only that side. There was **no verbal changeover** between shifts and the worksheets did not indicate the left, top screws had been removed, and no independent inspection was called for. The conclusion drawn: "Assuming has no place in our business" (Gordon Dupont, systems safety co-ordinator, Transport Canada) — any work not covered on a workcard must be written up, and greater awareness of communication (verbal and written) is essential to prevent recurrence.

## The Rule of a Successful Communication

To achieve better communication, information transmitted between managerial levels must be **complete, accurate, and understandable** to the next subordinate level. Upward communication begins at lower levels and ends at higher levels; it complements downward communication by enabling subordinates to convey what they want and feel satisfied, and by allowing bosses to control the fate of their own messages and better understand the situation. The main modes of upward communication are meetings between bosses and subordinates, and letters. Together, these forms of communication improve relationships between employers and employees and the general climate of the company.
        $cnt2$,
        5
    ) RETURNING id INTO s5_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 09.6: The Physical Environment
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m09_id, 'M09.6', 'The Physical Environment',
        $cnt3$
# The Physical Environment

## Heating and Lighting

Human Performance is affected by the Physical Environment. Actual working conditions are affected by: **Heat, Light, Ventilation, Noise, Space, Vibration**. Adjacent to the work area there should be facilities for changing into work/protective clothing, washing, rest, eating, and toilets (kept clean and tidy). Companies have responsibilities under the **Workplace (Health and Safety and Welfare) Regulations 1992** to have a duty of care to employees regarding the physical working environment. (The figures quoted are relevant for the UK — other countries may have different laws.)

### Heating

The aircraft engineer often carries out line work and must wear clothing appropriate to temperature, relative humidity and wind chill. For indoor work:

- **Non-physical work**: temperature should be between **16°C and 21°C**
- **Manual work**: a minimum of **13°C** is allowed

In warmer climates, air conditioning and relative humidity control may be needed. In general, the higher the relative humidity, the lower the temperature can be for comfort; the more physical the work, the lower the temperature should be. **Relative humidity should be in the range of 20% to 85%.**

Where a comfortable temperature cannot be achieved throughout a workroom, local heating or cooling should be provided. Fans help ventilation and cooling in hot weather; cold floors should be insulated with duckboards or special footwear; draughts should be minimised. **Thermometers** should be available at a convenient distance throughout the workplace.

### Lighting

Every workplace should have suitable and sufficient lighting, as far as reasonably practicable by **natural light**, sufficient to work safely without eyestrain.

- **Facility Lighting** — ordinary hangar/workshop fixed lighting, evenly distributed without dazzling or annoying glare
- **Task Lighting** — specialist lighting (fixed, adjustable or portable) for better illumination at a particular task

Light intensity is measured in **candela** (SI) or **lux**. An exit sign is about **50 lux**; fine bench work requires about **5000 lux**. The light source should be positioned so it does not shine into the eyes and does not cause glare from reflective surfaces. Lights and fittings must not cause a hazard (fire, radiation, electrical short circuits) and should be replaced, repaired and cleaned before lighting becomes insufficient.

**Colour Rendition** — if lighting levels/type of artificial light are incorrect, the colour of an object can appear different from how it appears in natural light (the best light for good colour rendition). For example, red wire insulation will appear red in natural light but orange or even black under a mercury vapour lamp. **The more efficient a light source is, the poorer it tends to be at colour rendition:**

| Light Source | Colour Rendition | Efficiency |
|---|---|---|
| Incandescent bulb | Good | Poor |
| Fluorescent tubes | Good | Poor |
| Mercury vapour lamps | Poor | Good |

Fluorescent tubes flickering near rotating machinery can produce a **stroboscopic effect**, making a rotating part appear stationary — a very dangerous effect. Multi-tube fluorescent fittings should be used to help prevent this.

**Natural Lighting** — people prefer working in natural light; windows and skylights should be cleaned regularly and kept free of unnecessary obstructions.

**Emergency Lighting** — essential to prevent falls and dangers around operating machinery if normal lighting fails. It should be powered by an independent source, operate automatically on failure of normal lighting, and provide sufficient light for people to take necessary safety action.

## Ventilation

Most hangars and workshops have good ventilation (hangars are draughty places anyway), so air quality is not usually a problem. An enclosed workplace should be ventilated with fresh air at a rate of at least **5 to 8 litres per second per occupant**, free of impurities (inlets sited away from heating exhausts and vehicle manoeuvre areas), filtered where necessary. Air-conditioning systems should be regularly cleaned, tested and maintained.

Special precautions are needed for: paint removal (chemical or blasting), paint spraying, grit blasting, sweeping hangar floors, removing cabin insulation/carpets, and chemical processes such as degreasing. **Personal breathing masks/hoods should be worn to ensure a clean air supply and prevent lung damage.**

**Carbon monoxide (CO)** — care is needed working in enclosed spaces with ground equipment powered by internal combustion engines, due to build-up of dangerous CO. It is a poisonous gas, a product of incomplete combustion, found in varying degrees in all smoke and fumes from burning carbonaceous substances, and is **colourless, odourless and tasteless**. Symptoms of poisoning: nausea, headaches, vomiting leading to unconsciousness, and death depending on concentration and exposure time.

## Noise

Noise is a continual problem for the aircraft engineer (jet engine, propeller, pneumatic equipment). Statistical analysis has shown that the **higher the noise level, the higher the accident rate**. If conversation is difficult at 2 metres in an area, there is a noise hazard, and a specific noise assessment should be carried out.

- Employees in areas where noise exceeds **85 dB** (averaged over an eight-hour period) should be offered hearing protection appropriate to the hazard
- Areas where noise exceeds **90 dB** (averaged over an eight-hour period) are designated **Ear Protection Zones**, where hearing protection must be worn by all employees, and the zone marked with warning signs complying with the Health and Safety (Safety Signs and Signals) Regulations 1996

## Vibration

**Hand Arm Vibration Syndrome (HAVS)** is the name for a group of diseases, the most widely known being **Vibration White Finger**. Workers using hand-held tools such as pneumatic riveting guns are at risk. Vibration of the whole body through a seat or platform is associated with **lower back pain**.

A Health and Safety Executive (HSE) report found **4.9 million** people were usually exposed to hand-transmitted vibration in a one-week period, of which **1.2 million** were exposed above the HSE-recommended level, and **242,000** cases of Vibration White Finger are likely attributable to hand arm vibration.

Methods of reducing vibration-induced problems:

- Reducing the exposure time of the operator
- Manufacturing equipment so frequencies are outside the critical range
- Reducing the amplitude of vibration by increasing tool weight or reducing the forcing function
- Providing damping material between the object/tool and the operator

## The Working Environment

**Workspace** — workrooms should have enough free space for people to move to, from and within work stations. The **minimum workspace is 11 cubic metres per person**, and this may be insufficient once furniture etc. is accounted for.

**Ergonomics** is the study of the relationship between workers and their environment — ensuring a good "fit" between people and the machines/equipment they use. Ergonomics should mean **"fitting the task to the man"** rather than "fitting the man to the task". It encompasses work study and work measurement, during which poorly designed equipment and unsafe practices can also be addressed.

The skills of an ergonomist include:

- **Anthropometry** — the study of human measurements (shape, size, range of joint movement); machines are designed to suit a wide range of body sizes using statistical analysis
- **Physiology** — the study of the calorific requirements of work, body functions, and the reception/processing/response to stimuli; man and machine must be complementary
- **Psychology** — including distraction and fatigue
- **Engineering** — the design of tools and machines so the user can apply necessary force naturally; standardisation is also an engineering concern (e.g. the identical flight deck layouts of the Boeing 757 and 767, which make it easier for engineers and pilots to transfer between the two types — good design can reduce operational errors)

### Summary

Setting up a hangar maintenance facility or workshop requires consideration of the physical effects, the ergonomics, and the psychological effects on employees. Heat, noise and similar factors cause fatigue over time, reducing performance and, in the long term, affecting physical health. Efficient ergonomic layout of aircraft, equipment and facilities also reduces fatigue. Distraction from noise, personnel movement and telephones can be alleviated by careful screening, soundproofing and regulated access to work areas, minimising maintenance errors due to unwarranted distraction.
        $cnt3$,
        6
    ) RETURNING id INTO s6_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M09.4 Social Psychology (11 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s4_id, 'Our personal differences, which constitute what we recognise as personality, are believed to be affected by:',
     '[{"id":"a","text":"Our genes, our environment and our social interaction","correct":true},{"id":"b","text":"Only our genetic inheritance","correct":false},{"id":"c","text":"Only the company we currently work for","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s4_id, 'The early Greeks classified the temperament of someone who is "easily moved to anger" as:',
     '[{"id":"a","text":"Phlegmatic","correct":false},{"id":"b","text":"Choleric","correct":true},{"id":"c","text":"Sanguine","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s4_id, 'Personality traits, once acquired very early in life, are generally:',
     '[{"id":"a","text":"Stable and very resistant to change","correct":true},{"id":"b","text":"Easily and permanently altered by short courses of psychotherapy","correct":false},{"id":"c","text":"Constantly changing on a weekly basis","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s4_id, 'On the two-dimensional model of personality (extraversion vs. anxiety), studies have found that, on average, the aircraft engineer is a:',
     '[{"id":"a","text":"Anxious extravert, prone to risk taking","correct":false},{"id":"b","text":"Stable introvert, thoughtful and controlled","correct":true},{"id":"c","text":"Anxious introvert, likely to freeze in an emergency","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s4_id, 'Dysthymia is best described as:',
     '[{"id":"a","text":"A prevalent form of subthreshold depressive pathology, with gloominess, low drive and pessimistic outlook","correct":true},{"id":"b","text":"A permanent state of extreme risk-taking behaviour","correct":false},{"id":"c","text":"A physical illness caused by exposure to vibration","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s4_id, 'In the two-dimensional model of Interactive Style, an individual described as "G+ P-" is one who:',
     '[{"id":"a","text":"Has a keen desire to complete the task but couldn''t care less about other team members","correct":true},{"id":"b","text":"Cares little for the job but has great concern for team members","correct":false},{"id":"c","text":"Cares about neither the task nor the team members","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s4_id, 'According to the text, the interactive style most appropriate for a shift leader is:',
     '[{"id":"a","text":"P+ G+, balancing production with morale and wellbeing of shift members","correct":true},{"id":"b","text":"P- G-, remaining detached from both the task and the team","correct":false},{"id":"c","text":"P+ G-, prioritising team morale over the flying programme at all times","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s4_id, 'Status gained through an individual demonstrating professional knowledge and leadership, which subordinates recognise as earned, is called:',
     '[{"id":"a","text":"Rank-based status","correct":false},{"id":"b","text":"Achieved status","correct":true},{"id":"c","text":"Ascribed status","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s4_id, 'A group decision, compared with the decision of an individual, will:',
     '[{"id":"a","text":"Generally be better than the average individual decision, but seldom improve on the ablest member''s ability","correct":true},{"id":"b","text":"Always be worse than any individual decision","correct":false},{"id":"c","text":"Always exceed the problem-solving ability of the ablest group member","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s4_id, 'The tendency for a group to reach a decision that is more risky than the average decision of its individual members is known as:',
     '[{"id":"a","text":"Peer pressure","correct":false},{"id":"b","text":"Risky shift","correct":true},{"id":"c","text":"Group duration effect","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s4_id, 'Categorising people by very visible characteristics (race, sex, nationality, dress) and assuming all group members share the same characteristics is known as:',
     '[{"id":"a","text":"Stereotyping","correct":true},{"id":"b","text":"Anthropometry","correct":false},{"id":"c","text":"Compliance","correct":false}]',
     '{"B1.1","B1.3","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M09.5 Communication (12 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s5_id, 'Communication passing from the accountable manager down through managerial levels to the shop-floor engineer is known as:',
     '[{"id":"a","text":"Downward communication, usually consisting of directives","correct":true},{"id":"b","text":"Upward communication, usually non-directive","correct":false},{"id":"c","text":"Horizontal communication between departments","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s5_id, 'The vital factor of good communication, which informs the sender that a message has been understood and acted upon, is called:',
     '[{"id":"a","text":"Feedback","correct":true},{"id":"b","text":"Jargon","correct":false},{"id":"c","text":"The grapevine","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s5_id, 'An informal, occasionally unreliable, but sometimes speedier source of information within a company is known as:',
     '[{"id":"a","text":"The grapevine","correct":true},{"id":"b","text":"Joint consultation","correct":false},{"id":"c","text":"A co-ordinating committee","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s5_id, 'Which of the following is a communication barrier described in the text, where words, phrases and acronyms specific to one group cause difficulty when communicating with another group?',
     '[{"id":"a","text":"Perception","correct":false},{"id":"b","text":"Jargon","correct":true},{"id":"c","text":"Process difficulty","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s5_id, 'According to the text, most distortions and misunderstandings in communication occur:',
     '[{"id":"a","text":"In vertical communications, especially where messages change from oral to written and vice versa","correct":true},{"id":"b","text":"Only in written communications","correct":false},{"id":"c","text":"Only when communicating with outside organisations","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s5_id, 'A prolonged period of eye contact between two people who are not intimate friends is generally interpreted as:',
     '[{"id":"a","text":"Friendly and reassuring","correct":false},{"id":"b","text":"Threatening","correct":true},{"id":"c","text":"A sign of boredom","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s5_id, 'Sticking your tongue out is regarded as rude in Britain, but in Tibet this same gesture is a sign of:',
     '[{"id":"a","text":"Respect","correct":true},{"id":"b","text":"Anger","correct":false},{"id":"c","text":"Agreement","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s5_id, 'According to the text, approximately what percentage of communication is misunderstood, rejected, distorted or forgotten?',
     '[{"id":"a","text":"10%","correct":false},{"id":"b","text":"70%","correct":true},{"id":"c","text":"25%","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s5_id, 'When aircraft equipment originally documented in a foreign language is used on the British register, the required rule regarding log books and written information is:',
     '[{"id":"a","text":"They may remain in the original language if the engineer understands it","correct":false},{"id":"b","text":"They must be in English; foreign-language log books are closed and retained with the records","correct":true},{"id":"c","text":"They must be translated into both English and the manufacturer''s language","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s5_id, 'One of the biggest causes of aircraft accidents/incidents attributed to engineers, according to the text, is:',
     '[{"id":"a","text":"Incorrect assembly of components, often from working without reading the manuals","correct":true},{"id":"b","text":"Excessive use of written work reports","correct":false},{"id":"c","text":"Overuse of Task Lighting during bench work","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s5_id, 'In the Eagle Lake, TX accident case study, the root cause identified for the loss of the horizontal stabiliser leading edge was:',
     '[{"id":"a","text":"A lack of communication between the two shifts, with no verbal changeover and worksheets not indicating the removed screws","correct":true},{"id":"b","text":"A design fault in the Embraer 120 stabiliser attachment","correct":false},{"id":"c","text":"Excessive vibration during the descent","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s5_id, 'For information transmitted between managerial levels to achieve a successful communication, it must be:',
     '[{"id":"a","text":"Complete, accurate and understandable to the next subordinate level","correct":true},{"id":"b","text":"As brief as possible, regardless of accuracy","correct":false},{"id":"c","text":"Delivered only in written form, never verbally","correct":false}]',
     '{"B1.1","B1.3","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M09.6 The Physical Environment (12 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s6_id, 'For indoor manual (physical) work, the minimum acceptable temperature is:',
     '[{"id":"a","text":"13°C","correct":true},{"id":"b","text":"16°C","correct":false},{"id":"c","text":"21°C","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s6_id, 'Relative humidity in the workplace should generally be kept within the range of:',
     '[{"id":"a","text":"20% to 85%","correct":true},{"id":"b","text":"5% to 30%","correct":false},{"id":"c","text":"50% to 100%","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s6_id, 'Approximately how much light intensity (in lux) is required for fine bench work?',
     '[{"id":"a","text":"About 50 lux","correct":false},{"id":"b","text":"About 5000 lux","correct":true},{"id":"c","text":"About 500,000 lux","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s6_id, 'Regarding colour rendition and efficiency of light sources, the text states that:',
     '[{"id":"a","text":"The more efficient a light source, the poorer it tends to be at colour rendition","correct":true},{"id":"b","text":"Colour rendition and efficiency always improve together","correct":false},{"id":"c","text":"Mercury vapour lamps give the best colour rendition","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s6_id, 'Flickering fluorescent tubes near rotating machinery can create a dangerous illusion known as the:',
     '[{"id":"a","text":"Colour rendition effect","correct":false},{"id":"b","text":"Stroboscopic effect","correct":true},{"id":"c","text":"Ergonomic effect","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s6_id, 'An enclosed workplace should be ventilated with fresh air at a rate of at least:',
     '[{"id":"a","text":"5 to 8 litres per second per occupant","correct":true},{"id":"b","text":"50 to 80 litres per second per occupant","correct":false},{"id":"c","text":"1 to 2 litres per minute per occupant","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s6_id, 'Carbon monoxide, a hazard when using internal combustion powered ground equipment in enclosed spaces, is best described as:',
     '[{"id":"a","text":"A colourless, odourless and tasteless poisonous gas produced by incomplete combustion","correct":true},{"id":"b","text":"A strongly pungent gas that is easily detected by smell","correct":false},{"id":"c","text":"A harmless by-product of complete combustion","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s6_id, 'A workplace area is designated an "Ear Protection Zone", where hearing protection must be worn, when noise (averaged over an eight-hour period) exceeds:',
     '[{"id":"a","text":"70 dB","correct":false},{"id":"b","text":"90 dB","correct":true},{"id":"c","text":"120 dB","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s6_id, 'Vibration White Finger is the most widely known disease within the group of conditions known as:',
     '[{"id":"a","text":"Hand Arm Vibration Syndrome (HAVS)","correct":true},{"id":"b","text":"Colour Rendition Syndrome","correct":false},{"id":"c","text":"Circadian Disruption Syndrome","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s6_id, 'The minimum recommended workspace, according to the text, is:',
     '[{"id":"a","text":"5 cubic metres per person","correct":false},{"id":"b","text":"11 cubic metres per person","correct":true},{"id":"c","text":"25 cubic metres per person","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s6_id, 'Ergonomics, the study of the relationship between workers and their environment, should aim to achieve:',
     '[{"id":"a","text":"Fitting the task to the man, rather than fitting the man to the task","correct":true},{"id":"b","text":"Fitting the man to the task, regardless of individual variation","correct":false},{"id":"c","text":"Standardising all workers to a single body size","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s6_id, 'The study of human measurements such as shape, size and range of joint movement, used by an ergonomist to design equipment for a range of body sizes, is called:',
     '[{"id":"a","text":"Anthropometry","correct":true},{"id":"b","text":"Physiology","correct":false},{"id":"c","text":"Psychology","correct":false}]',
     '{"B1.1","B1.3","B2"}');

END $$;
