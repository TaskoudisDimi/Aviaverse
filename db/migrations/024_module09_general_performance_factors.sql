-- Module 09: Human Factors (Common B1/B2) — General, Human Performance and Limitations, Factors Affecting Performance
-- Source: EASA Part-66 Module 9A official textbook (IKAROS Aviation Training Centre, IK M9A, Issue Oct.2012)

DO $$
DECLARE
    m09_id INT;
    s1_id  INT;
    s2_id  INT;
    s3_id  INT;
BEGIN
    SELECT id INTO m09_id FROM easa_modules WHERE code = 'M09';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M09.1') THEN
        RAISE NOTICE 'M09.1-M09.3 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 09.1: General
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m09_id, 'M09.1', 'General',
        $cnt$
# General

## Why Human Factors Training Matters

Many people in the aviation industry wonder why Human Factors training is seen as a vital element of their overall training syllabus. The answer is simple: **we kill people**. Anybody with any connection to the aviation industry — flight crew, engineers, baggage handlers, stores people, admin staff — plays a vital part in flight safety. We all have the potential to make mistakes that can ultimately lead to an aircraft accident.

By understanding how mistakes are made and how they can be avoided, we can go a long way to reducing the number of accidents. To gain this understanding, we must know a little of how the human body works, how the brain processes information received, a little psychology, how we interact with others through effective communication, and then learn the types of human error and ways of avoiding these errors.

All elements within aviation must work together to achieve the ultimate goal — safe and efficient flight operations — to minimise accidents and incidents, and when these do happen, to investigate the causes (including the underlying hidden causes) and put in place procedures to minimise the risk of the accident or incident happening again.

## The Need to Take Human Factors into Account

Where human beings are involved in work, the possibility of error is always present. This factor must be recognised and dealt with in aircraft operation and maintenance by every person who contributes to airworthiness and safety.

The early pioneers in aviation were motivated by the challenge of flight and were prepared to take risks with perhaps little regard for the safety of others — flying was seen as a sport. As aircraft designs improved and transport services and routes grew, owners and customers wanted a successful outcome to the venture, and so started the philosophy of flight safety. It was soon discovered that, after mechanical problems, the human error problem was the next biggest factor in flight safety. Better design has given reliability, and air transport has a very good safety record compared to other modes of transport — the human problem has been more difficult to solve.

Recent statistics show that about **70–80% of aviation accidents are caused by human error**, with the pilot error problem having a higher profile. However, maintenance-induced accidents are growing in number year on year and are causing concern.

### Future Predictions

The world wide commercial aviation major accident rate has been nearly constant over the past two decades. While the rate is low, increasing traffic over the years has resulted in the absolute number of accidents also increasing. Air travel is expected to increase over the coming decades, **doubling by 2017**. Without improvement in the accident rate, such volume in traffic would lead to **50 or more major accidents a year** — one a week, which would have an unacceptable impact on public confidence in the aviation industry.

### Who Makes Mistakes?

- Flight crews
- Maintenance crews
- Ground crews
- ATC
- Designers
- Manufacturers
- Regulators

**Everyone makes inadvertent mistakes.**

## Incidents Attributable to Human Factors / Human Error

Maintenance errors are not a new phenomenon, but with the advent of more reliable aircraft and human factors training for aircrew, the maintenance component as a cause of aircraft accidents has become more noticeable.

### Aloha Airlines B737 (28 April 1988)

The first prominent and major investigation in recent times to cite engineering maintenance and human factors was the accident to the Aloha Airlines Boeing 737, in which the top of the forward cabin came away in flight. Flight 243 was en route from Hilo to Honolulu at **24,000 ft** with 95 passengers and crew when an explosive decompression occurred, causing the crown of the forward fuselage to break away. A stewardess was sucked out and never found, and there were seven serious injuries, but because passengers were belted in there were no other fatalities. The flight crew carried out an emergency descent and landed safely at Kahului, Maui.

The investigation determined that the probable cause was the **failure of the maintenance programme to detect significant disbonding and fatigue damage of the fuselage lap joints**. Repeated inspections had failed to observe obvious corrosion around the rivets forming the fuselage lap joints, and the lap joints eventually failed due to multiple site initiated damage. Contributory factors included major inspections being "equalised" over **50 weeks** (preventing in-depth examination), the quality of FAA oversight of the maintenance programme, and the failure of the FAA to require implementation of a Boeing Alert Service Bulletin. As a result of this accident the FAA began to look at human factors in aircraft maintenance.

### BAC One-Eleven, G-BJRT (10 June 1990)

During the climb to cruising altitude, passing through **17,300 ft**, there was an explosive decompression caused by the release of the left-hand windscreen. The Commander, who had released his shoulder harness and loosened his lap strap, was partially sucked out of the windscreen aperture; the flight deck door was blown onto the flight deck. A steward grasped the Commander to prevent him being completely pulled out, assisted by another steward. The co-pilot regained control and made a successful landing at Southampton. The Commander suffered a broken right arm and frostbite.

Of the 90 bolts retaining the windscreen, only one had remained in the airframe. The windscreen had been replaced on the previous night shift, 27 hours before the accident flight, with **84 bolts (A211-8C) whose diameter was approximately 0.026 inch below** the specified bolts (A211-8D), and 6 bolts (A211-7D) of the correct diameter but **0.1 inch too short**. This investigation, in the opinion of Gordon Dupont (System Safety Services, Canada), was the first human factors investigation to look beyond the man to find "why" he had committed the error, determining how a simple error could be made by a very experienced person.

### Airbus A320, G-KMAM (26 August 1993)

An Airbus A320 commenced its takeoff roll from London Gatwick with 185 passengers and 7 crew, configured for FLAP 1+F at a weight of **66,803 kg** (MTOW approximately 75,500 kg). Immediately after rotation the handling pilot noticed a marked roll to the right despite almost full left sidestick. Control was handed to the Captain, who confirmed the roll problem; the takeoff was continued, but the aircraft could not turn left. After a go-around, the Captain successfully landed using FLAP 1 configuration. Examination found four of the five right-hand spoilers selected to Maintenance Mode, free to move under aerodynamic loads and isolated from the hydraulic systems.

This was the first flight following an overnight change of the right-hand outboard flap sub-part, which required isolation of the four spoilers found in Maintenance Mode. Had the aircraft taken off in FLAP 3, the remaining roll authority would not have been sufficient to overcome the adverse roll moment from the free-floating spoilers.

## Murphy's Law

If anything can be done incorrectly, then someone will do it incorrectly. Even the best motivated, enthusiastic engineer may fall foul of Murphy's Law. We must always be on guard against it to minimise possible errors so that accidents can be reduced.

It is wrong to think that accidents can be eliminated altogether — with the safest of procedures carried out in the strictest way there is always the possibility of an accident. However, the right person, correctly trained, with the right attitude, correct equipment, and working within a framework dedicated to safe practices, can reduce accidents dramatically.

Consider a bolt with seven nuts and washers, labelled and assembled: the bolt, nuts and washers can only be assembled correctly **one way**, but can be assembled incorrectly **many different ways** — illustrating how much more likely it is for components to be incorrectly assembled than correctly. One of the major causes of human error in maintenance is the **incorrect installation or omission of aircraft parts and components**.

Accidents can occur because of one error, or as the result of several quite unrelated errors, where people/organisations may have contributed to the accident many years prior to it happening. Recording and signing for all work on an aircraft means that at any time records can show who has been involved — from the production of the raw metal, to the designer, to the draftsman, to the manufacturer, to the maintenance engineer. The whole history of the aircraft and its components can be traced back to the smallest rivet, so that if anything goes wrong, records will show the history and, hopefully, where the error lies — not for punishment purposes, but to learn and put procedures in place to help prevent recurrence.
        $cnt$,
        1
    ) RETURNING id INTO s1_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 09.2: Human Performance and Limitations
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m09_id, 'M09.2', 'Human Performance and Limitations',
        $cnt2$
# Human Performance and Limitations

## Introduction

Human performance can be affected by physical condition and psychological condition. Physical condition relates to the health of the person's body and the environment of home and workplace. The mental state of the person (the psychology condition) can be due to hereditary factors, historical factors, and mental pressures. We may not be able to do much about hereditary factors, but historical factors such as education due to a poor early environment can be worked on and improved. The factors affecting human performance mentally and physically that will be covered are those directly affecting a person's ability to perform maintenance tasks, namely **vision** and **hearing**.

## Vision

Of the senses, vision is the most useful to man — we are more aroused to anger or passion by visual inputs than by feel or smell. The eye receives light information from the outside world and passes it to the brain, acting very similarly to a camera. Light is taken in through the **cornea** and lens, a clear window at the front of the eyeball. The cornea acts as a focusing device and is responsible for between **70–80% of the total focusing ability of the eye**.

The **iris** controls the amount of light entering the eye by altering the size of the pupil hole, and can change shape quickly to cater for changing light levels — a luminance range of up to **5 times (5:1)**. This 5:1 factor is not sufficient to cope with the difference between full daylight and a dark night. In reduced light levels a chemical change takes place in the light-sensitive cells of the retina (the rods and cones), enabling them to react to much lower light levels. This change — for example from daylight to an NDT dark room — takes time: about **7 minutes for the cones and 30 minutes for the rods**. When complete, the chemical change can cope with large changes in luminance level (**150,000:1 for the rods**). Light then passes through the lens, which achieves final focusing onto the **retina**.

The retina is a light-sensitive screen at the back of the eyeball. Light-sensitive cells on it generate a small electrical charge when light falls on them, passed to the brain via the **optic nerve**.

### Rods and Cones

The retina's light-sensitive cells are of two types:

| Cell type | Characteristics |
|-----------|------------------|
| **Rods** | Low intensity threshold, sensitive to low illumination; detect movement and direction of movement; achromatic (respond to intensity, not wavelength) — black, white and shades of grey |
| **Cones** | High intensity threshold, less sensitive, require higher light intensity; three types responding to different wavelengths of light in the range approximately **400 to 700 nm**; output feeds four chromatic colour channels; higher visual acuity than rods |

The cones are the only cells that detect colours; the rods can only detect black and white but are much more sensitive at lower light levels — so in poor light we see only in black, white, or shades of grey. At night, with a dimly lit flight deck, colour coding of instruments must be bright enough for cone vision to be used.

There is an absence of rods and cones between −15 and −19 degrees (to nasal) — the area where the optic nerve leaves the retina, known as the **blind spot**.

### Visual Acuity

The central part of the retina, the **fovea**, is composed only of cone cells, and only at this part of the retina is vision **20/20 (or 6/6)**. An individual with 20/20 vision should be able to see at 20 feet what a so-called normal person is capable of seeing at that range. Resolving power at the fovea drops rapidly as angular distance from the fovea increases: at as little as **5° from the fovea, acuity drops to 20/40** (half as good); at **20° displacement, visual acuity falls to 20/200** (one tenth). Anything needing detailed examination is automatically brought to focus on the fovea; the rest of the retina attracts attention to movement and change. The image is focused on the retina upside down; the brain turns it the correct way up.

### Visual Problems

**Blind Spots** — The blind spot where the optic nerve enters the eyeball has no light-detecting cells, so an image falling there will not be detected. This is significant when detecting objects on a constant bearing from the observer, unless a scanning technique with frequent eye movement is used during visual inspections.

**Empty Field Myopia** — In the absence of anything to focus on, the natural focus point of the eye is not at infinity as long assumed, but on average at a distance of just under **one metre**, with wide variation between individuals. This is significant when searching for distant targets with weak visual cues, as the eye will not be adjusted to detect them. The condition is aggravated by other objects close to the empty field range (e.g. rain spots on a windscreen), as the eye is naturally drawn to them.

**High Light Levels** — Too much light can damage the eye. High intensity light contains more high-energy blue and ultra-violet wavelengths, and retinal damage can accumulate over a long period. Sunglasses should be impact resistant, of appropriate filtration characteristics, and have a **luminance transmittance of 10–15%**. Engineers should be aware of UV light exposure during certain non-destructive testing processes.

**Binocular Vision (Stereopsis)** — Because both eyes see much of the same overlapping scene, a stereoscopic effect is created, assisting depth appreciation. If one eye is slightly out of alignment, two images are seen (**diplopia**). The binocular effect is important as objects get closer to the eyes; **above 200 ft, stereopsis is not important for depth perception**. Closer objects produce larger retinal images, and moving parallax can also be used to judge distances.

**Visual Defects** — In **long sightedness (hypermetropia)** the eyeball may be shorter than normal along the visual axis, forming the image behind the retina and blurring close vision; correctable with a **convex lens**. Age-related loss of lens elasticity producing long sightedness is called **presbyopia**. In **short sightedness (myopia)** the eyeball is larger than normal and the image forms in front of the retina, blurring distant objects; correctable with a **concave lens**.

**Eye Protection** — When carrying out tasks involving flying debris (drilling, grinding, wire cutting) or hazardous chemicals/fluids, protective goggles to British Standards must be worn. When welding, brazing, or using ultra-violet light, the correct shade of light filter should be used.

## Hearing

The human ear is a specialised receptor organ that responds to sound waves and also provides the body with a sense of orientation and balance.

### Physical Properties of Sound

Sound waves have three major properties: **amplitude, frequency and timbre (quality)**. Amplitude is responsible for loudness, expressed in **decibels (dB)**; an increase of 1 dB means loudness has increased by **1.26 times**.

| Decibel rating | Sound | Increase in relative energy |
|-----------------|-------|------------------------------|
| 0 | Hearing threshold | 0 |
| 30 | Whisper (library) | 1,000 fold |
| 50–60 | Normal conversation (office noise) | 1,000,000 fold |
| 90 | Shouting | 1 billion fold |
| 120 | Gunshot (nearby) / large jet | 1 trillion fold |

Sound levels above **90 dB** can cause hearing damage, and the longer the exposure the greater the damage: **90 dB – 8 hrs, 103 dB – 30 mins, 116 dB – 1 minute**. Ear protection should always be worn near running jet aircraft or noisy machinery — hearing damage is not yet treatable.

**Frequency** gives a sound its pitch or tone, measured in hertz (Hz). The human ear can detect frequencies between **15 Hz and 20,000 Hz**; dogs can hear up to 50,000 Hz and bats above 100,000 Hz. **Timbre** depends on the complexity of the wave forms from the sound source — the same amplitude and frequency can still sound different (e.g. piano vs. violin) due to timbre.

### Anatomy of the Ear

The ear converts sound waves into nerve impulses via mechanical stimulation, and is grouped into three divisions: **external, middle and inner**.

- The **external ear** consists of the auricle (pinna), which directs sound into the external auditory canal (about **2.5 cm** long), ending at the **tympanic membrane (eardrum)**.
- The **middle ear** is an air-filled cavity, connected to the outside air via the **Eustachian tube**. It contains three small bones — the **hammer (malleus), anvil (incus) and stirrup (stapes)** — which transmit eardrum movement to the membrane of the inner ear's **cochlea**.
- The vibrating membrane causes fluid in the cochlea to vibrate, moving tiny hair-like cells depending on volume and pitch. The cochlea has three internal chambers serving different pitch levels; loudness is served by the number of cells stimulated. Nerves from the hair cells lead to the brain, where electrical currents are decoded as sound patterns.

### Hearing Damage

Hearing difficulties fall into three categories:

- **Conductive deafness** — damage to the ossicles or eardrum (e.g. perforation/scarring) degrades hearing.
- **Noise Induced Hearing Loss (NIHL)** — loud noises damage the cochlea's sensitive membrane; loss may start temporary but continued exposure causes permanent loss, with early symptoms being an inability to hear high-pitched notes.
- **Presbycusis** — hearing loss with age; higher frequencies are lost first.

### Balance

Besides the cochlea (hearing), the inner ear's **vestibule** and **semi-circular canals** participate in the sense of balance. The three semi-circular canals are fluid-filled and arranged in three planes, **90° to each other**, containing fine hairs that bend as fluid moves. Linear acceleration is detected by the **otoliths** at the base of each canal — fleshy stalks topped by a small stone/crystal that bend under acceleration, interpreted by the brain to determine head position. The semi-circular canals and otoliths together form the **vestibular apparatus**, helping maintain spatial orientation and, for example, controlling eye movement to keep a stable retinal image when the head moves.

### Eustachian Tubes

The Eustachian tube connects the middle ear cavity to the outside air (via the nose) to equalise pressure in the middle ear with ambient pressure. If blocked (e.g. by a heavy cold), an increase in ambient pressure is not effectively opposed, and the tympanic membrane is pushed inward and stretched, becoming tighter and less sensitive — which is why sounds appear muffled during a severe cold.

### Motion Sickness

Motion sickness is caused by a mismatch between visual and balance signals to the brain. Symptoms are nausea, vomiting, hyperventilation, pallor and cold sweating. To help overcome it: keep the head stiff, shut the eyes if possible, and try to reduce the motion causing the sickness. Seek professional medical advice regarding medication side effects.

### Effect of Alcohol

Alcohol has a lower specific gravity than water. Alcohol in the middle ear may dilute the liquids, causing unfamiliar results for certain movements and leading to disorientation. Alcohol in the otolith's fleshy stalk may persist for **days** after all traces have vanished from the blood — even small head movements can cause disorientation or motion sickness **up to three days** after alcohol was last consumed.

## Information Processing

The brain receives information from the eyes (vision), ears (sound and balance), nose (smell), skin/fingers (touch) and mouth (taste), as well as information about blood oxygen/CO₂, hunger and bladder pressure. The brain has developed from early vertebrates in areas such as the **cerebellum, thalamus and cerebrum** — different in chemistry and structure but extensively interconnected. Outputs from the brain can be **automatic** (breathing, heart rate, balance, temperature control) or **non-automatic** (eating, talking, running).

### Central Decision Making

When information is received, the brain's central processor decides what to do — it may require immediate action, or information may be stored in short/working memory while a cause is worked out, drawing on long-term memory.

### Response

Response to stimuli depends on the speed of perception, decision making, and finally motor control. In general terms, **response time and accuracy are inversely proportional**. If a known stimulus is expected and the person is prepared, the response is likely to be quick and accurate; if the expected stimulus does not occur, a predetermined response could produce the wrong (unsafe) result. Response times are affected by poor nutrition, dehydration, focusing from near to far, empty field myopia, distraction and fatigue, and also reduce with age and alcohol.

## Learning and Memory

Learning is the acquisition of knowledge or skill through instruction or experience, involving storage of information within memory. The brain stores information for as long as several decades (**Long Term Memory**) or as short a time as several seconds (**Short Term Memory**), transferring information between the two via **memory consolidation**.

### Short Term (Working) Memory

Unless actively rehearsed, information in working memory is **lost in about 20 to 30 seconds**. Acoustic information is easier to remember than visual because it is easier to rehearse a sound than memorise written data.

### Long Term Memory (LTM)

LTM divides into **Semantic Memory** (general meaning retained long term) and **Episodic Memory** (specific events/episodes in life). Information transferred to LTM is never lost — if we cannot remember it, it is because we cannot retrieve (recall) it. Confusions in LTM are more likely to involve mixing up words than similar meanings. Episodic memory retention decreases over time — approximately only **35% is remembered after one day and 22% after 31 days** — meaning two witnesses to an accident will often give conflicting reports, so evidence should be written down (or photographed) immediately. Of the two types, semantic memory lasts longer, whereas episodic memory is more accurate.

### Motor Memory

Motor memory is associated with the skill of controlling hand, feet and leg movements, learned through three stages: the **Cognitive Stage** (understanding what each control does), the **Associative Stage** (elements learnt with practice), and the automatic stage (all elements become automatic, requiring little conscious thought).

### Short Term Memory Aid

Breaking a long number down into manageable "chunks" (e.g. 1939 = start of WW2, 1914 = start of WW1, 999 = UK emergency number, 365 = days in a year) makes larger numbers far easier to remember.

### Memory Summary

- There are three parts to memory: **encoding, storage and retrieval**.
- Most forgotten material is lost in the first few hours after learning; if still remembered after a few days, it is unlikely to be forgotten.
- STM has a very small capacity, increased by chunking; material is lost within 20–30 seconds if not rehearsed.
- LTM has a more-or-less unlimited capacity, but the problem is retrieval.
- Memory is not like a video recording — we reconstruct events from schemata, and material can be distorted.
- Physical shock can disturb memory, especially for events up to half an hour before the shock.
- Highly emotionally charged material might be repressed, not totally lost.
- Acoustic information is easier to remember than a visual image.

## Attention and Perception

Information sent to the brain via the senses is held briefly in the sensory store before being sent to the attentional mechanism.

### External Stimuli / Causes of Attention

Some stimuli almost force attention: **size and intensity, contrast/change, repetition, and movement**.

### Internal Causes of Attention

Some stimuli gain attention more readily than others even at low intensity (e.g. noticing cars like your own). There are limits on the capacity of working memory and on the number of "channels" the system can process at once.

**Selective Attention** — inputs are sampled and the central processor concentrates on the task in hand, while other inputs are still monitored subtly (the "**cocktail party effect**" — hearing your name mentioned in another group's conversation).

**Divided Attention** — if a task is not complex enough to require single-channel monitoring, attention can be divided between two or more channels (e.g. driving while talking to a friend).

### Factors Affecting Attention

- **Stress** — increases arousal; with high stress, sampling rate increases but over a narrower range of stimuli, so important information is more likely to be missed.
- **Mental Workload** — increased by stress levels, task complexity, time constraints, available skills, and mental attitude; it is the relationship between the imposed demands of a task and the availability of channel capacity to meet those demands.

### Perception

Perception is a complex process involving concepts in memory, optical illusions, colour, size, and hearing what we want to hear — what we perceive is often conditioned on what we expect to perceive. Depth is perceived via binocular vision and known height/size comparison, with the brain unconsciously scaling image size with distance cues (e.g. why the moon looks larger near the horizon). Illusions such as the **Ponzo illusion**, **Orbison illusion**, **Necker Cube**, and **figure-ground illusion** demonstrate how the brain can misjudge size, shape and ambiguous images; shape constancy means objects (e.g. trapezoidal doors) are still perceived as rectangular.

**Subliminal Perception** — an advertising agency flashed a 3-millisecond "Buy Coca-Cola" message every five seconds during a film; the audience did not consciously notice it, but the firm claimed a **56% increase** in Coca-Cola sales during the intermission.

**Speech Perception** — the ability to hear separate words in continuous speech is called **speech (auditory) segmentation**; in a foreign language it is difficult to tell where one word ends and another begins.

### Perception Summary

- Perception is the organisation, translation and reconstruction of information from the senses.
- Binocular and monocular depth cues turn two-dimensional retinal images into three-dimensional perception.
- Size, shape, brightness and colour help produce the final perception.
- External stimuli (size, contrast, repetition, movement) and internal factors (mind-sets, previous experience, instruction, emotion) attract attention.
- Information can possibly be obtained subliminally.
- Speech segmentation is our ability to hear separate words in continuous speech.

## Models Describing Human Factors

Several models simplify the relationship between engineers and the factors affecting their working lives:

1. **The SHEL Model** — shows the interfaces between the human ("**L**", liveware, in the centre) and: **S**oftware (procedures, manuals, checklists, regulation, computer software), **H**ardware (tools, equipment, aircraft design for maintainability), **E**nvironment (workplace comfort, hangar space, temperature, noise), and **L**iveware (morale, relationships, manpower, supervision, management support). The model also accepts that the central "L" can stand alone, with problems related to a single individual not necessarily tied to any L-S, L-H, L-E, L-L interface.

2. **The British Airways "PEEP" Model** — an integrated approach emphasising the interfaces and integration between the engineer and the aspects affecting his/her performance.

3. **Reason's "Swiss Cheese" Model** — each slice of cheese represents an organisation or activity/department; the holes represent inadequate defences allowing errors through. Errors not caught at source are usually picked up by subsequent "slices," but occasionally an error finds its way straight through the system, resulting in an accident. The aim of each department is to turn its slice of "Swiss Cheese" into a slice of best "Farmhouse Cheddar."

4. **The Weakest Link** — an aircraft flies courtesy of many people's skills across many tasks; a chain is as strong as its weakest link. For an incident to occur, **latent failures must combine with active failures and local triggering events** — there must be a precise "alignment" of all the "holes" in all the defensive layers of a system. Example: rain wets an engineer's foot, causing it to slip off a worn brake pedal on a pushback tug while the engineer is distracted, and the tug contacts a parked aircraft — the latent failure (no anti-slip surface) only becomes an issue when the local trigger (wet conditions) occurs. A similar real incident at **Edinburgh Airport** resulted in the loss of life of an engineer who manoeuvred within the rotating propeller arc during removal of a ground power unit following engine start. A large number of unsafe acts occur daily, but it is rare that a situation escalates into a serious, reportable incident, because the unsafe acts are usually caught immediately or the system's defences prevent propagation.
        $cnt2$,
        2
    ) RETURNING id INTO s2_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 09.3: Factors Affecting Performance
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m09_id, 'M09.3', 'Factors Affecting Performance',
        $cnt3$
# Factors Affecting Performance

## Fitness and Health

To feel fit and healthy, humans have basic needs that must be supplied or relieved. Every human is a composite of **physical, social, emotional and intellectual needs**:

- **Physical needs** — physiological processes, e.g. breathing, circulation, movement.
- **Social needs** — interaction with others, e.g. communication, sense of belonging.
- **Emotional needs** — feelings experienced throughout life, e.g. joy, fear, happiness, anxiety, loneliness.
- **Intellectual needs** — thoughts and rationality, e.g. learning, reasoning, problem solving.

**Maslow's Hierarchy of Needs**, in ascending order:

1. **Survival** — air, food, water, temperature, rest, pain avoidance
2. **Stimulation** — sex, activity, exploration, manipulation, novelty
3. **Safety** — security, protection
4. **Love** — love, belonging, closeness, intimacy
5. **Esteem** — value and respect from others and self
6. **Self actualisation** — making the most of one's abilities
7. **Cognitive needs** — seeking knowledge, understanding, discovery
8. **Aesthetic needs** — desire for beauty, worship

A person attempts to satisfy needs on the lower hierarchy first before focusing on higher needs. Not meeting these needs will eventually lead to physical and mental health problems that greatly affect performance in the workplace.

### Personal Health

Good physical health requires a good diet, plenty of sleep, exercise, hygiene and relaxation. A regular, well-balanced diet of meat, fish, fruit, vegetables and plenty of water provides needed vitamins and energy — avoid too much alcohol and "snacking" on sweet foods (disrupted by shift working), which can cause an imbalance in blood sugar levels and make you feel faint from increased insulin levels.

**Exercise** — does not need to be severe or prolonged; **20 minutes of daily exercise** (without strain) causing the heart to beat faster is good, ideally first thing in the morning.

**Personal Hygiene and Care** — daily showering and dental hygiene help prevent bad odours and reduce stress; regular medical and dental check-ups maintain physical health; wear hats, sunglasses, long sleeves and sunblock in strong sunlight.

**Personal Habits** — avoid excessive alcohol (a depressant that dehydrates the body) and smoking (carcinogenic); only take drugs prescribed by a doctor or bought over the counter, as instructed.

**Relaxation** — good for mind and body; set aside daily/weekly time for a hobby, sport or relaxation event to relieve stress.

## Sleep and Fatigue, Shiftwork

Sleep is essential to well-being; not getting enough of the right type results in fatigue. For man, sleep is usually around **8 hours in every 24 hours**, though needs vary. Sleep has a cycle within each period, from drowsiness through light and deep sleep to **rapid eye movement (REM)** sleep.

### Biological Clocks

Physiological processes undergo rhythmic fluctuations, whether awake or asleep. Rhythms with a periodicity of about 24 hours are called **circadian rhythms** (from Latin *circa* = about, *dies* = day). These are normally locked to 24 hours by external time cues ("**Zeitgebers**," German for "time givers") such as light/darkness, meal times, and clock times. If isolated from all zeitgebers, circadian rhythms will **"free run" to a periodicity of about 25 hours** — extending the average day to 17 hours awake, 8 hours sleep instead of 16/8. This affects air travellers who cross several time zones in a short time.

### Body Temperature

The sleep/wake cycle and body temperature cycle run together. The **highest temperature occurs around 1800 hours and the lowest at 0500 hours**. We find it hardest to stay awake when body temperature is lowest, feel drowsy when temperature is falling, and are most alert when temperature is rising — which may explain difficulty sleeping after crossing time zones (jet lag). The temperature rhythm is unaffected even if sleep is not taken.

### Sleep Credit/Debit

The sleep/awake system is often considered a credit/debit system: **8 hours of sleep credits 16 hours of active/waking time**. However, sleep cannot be "stored" in anticipation of a long waking period — a sleep of 10–12 hours after strenuous activity will still only credit the body with 8 hours, and the individual will feel sleepy again after 16 hours. Sleep taken when body temperature is falling is more refreshing than sleep taken when temperature is rising; a nap can help put the body "in credit."

### Shift Work

Moving a shift **backwards** (e.g. from a dayshift toward a night shift) is generally preferred, as it follows the body's natural tendency to free-run when there are no time cues. **Compressed shift patterns** may be used — for example, 4 days of 10–12 hour shifts followed by 3 days off.

### Time of Day and Performance

Performance on different tasks is affected differently by time of day. Short-term memory tasks decline throughout the day, while verbal reasoning and mental arithmetic skills are best around midday. When body temperature is low, reaction times, vigilance and manual dexterity are all affected. Notable early-morning accidents include **Chernobyl, Three Mile Island, Challenger**, and the BAC One-Eleven windscreen, which was fitted in the period **0300–0500 hours** the night before that accident. Driving accidents have also shown a statistical peak around **1500 hours**, possibly due to overconfidence at the height of the circadian rhythm.

### Dangers of Sleep Deprivation

Research by the University of South Australia found that body reaction times slow appreciably with sleep deprivation. A **2-hour sleep deficit** produces reaction times similar to those after drinking **one pint of beer**; a **4-hour sleep debit** is equivalent to **2 pints of beer** — impairing the body to a dangerous degree.

### Sleep Phases

Arousal levels are characterised by different patterns of electrical brain activity, recorded as an **electroencephalogram (EEG)**; eye movement is measured by an **electroculogram (EOG)** and muscle tension by an **electromyogram (EMG)**. When awake with eyes open, the EEG shows rapid, low-amplitude **beta waves** (approaching 20 Hz); with eyes closed in a restful state, **alpha waves** (approximately 10 Hz) appear; in deep sleep, **delta waves** (slow wave sleep) are recorded. Sleep is classified into **5 stages** — Stage 1 is the transitional phase from waking to sleeping, Stages 3 and 4 are light to deep sleep, and the fifth stage is **REM sleep**.

REM sleep shows an EEG trace similar to a fully awake individual, while other measurements (e.g. muscle activity) show the individual is asleep — hence REM sleep is also called **paradoxical sleep**. REM sleep is associated with complex, bizarre, emotionally coloured dreams.

A normal night's sleep operates on an approximate **90-minute cycle**: about 10 minutes of Stage 1, then about 15 minutes of Stage 2, before Stages 3 and 4; the first REM stage occurs later in the first 90-minute cycle and lasts 10–20 minutes. After the second 90-minute cycle there is usually no more slow wave sleep; about **50% of total sleep is Stage 2**, and REM period duration increases later in the sleep pattern. Slow wave sleep is believed necessary for body tissue restoration, while REM sleep may be for organising memory — after strenuous physical activity the body needs more slow wave sleep, and after a period of learning there is an observed increase in REM sleep.

**Naps** — after waking from a nap, responses and reactions are slower for approximately **5 minutes**; habitual nappers gain more benefit than non-habitual nappers when the nap lasts at least 10 minutes.

### Sleep Disorders

- **Narcolepsy** — an inability to stop falling asleep even when in sleep credit; undesirable as the sufferer may fall asleep even in a dangerous situation.
- **Apnoea** — cessation of breathing while asleep; becomes serious when stoppages last up to a minute and increase in frequency, disturbing sleep and causing excessive daytime sleepiness.
- **Sleepwalking (Somnambulism)** — commoner in childhood but occurs later in life, more frequently under irregular hours or stress.
- **Insomnia** — divided into **clinical insomnia** (unable to sleep when one should be asleep) and **situational insomnia** (inability to sleep due to disrupted work/rest patterns or circadian disrhythmia).
- **Fatigue** — associated with heavy physical and/or mental workload together with sleep deprivation and lack of rest periods; increased by working during sleep periods, working longer hours, rotating shift patterns, task complexity and environmental factors such as excessive heat and humidity. A fatigued person is more likely to make errors that can result in an aircraft accident or incident.

## Stress — Domestic and Work Related

Stress is people's natural reaction to excessive loads (mental and physical), while strain is seen in alteration of blood pressure, pulse rate, weight change, and mood swings. Mental stress is difficult to measure, and each person reacts differently. If excessive and prolonged, stress can lead to mental and physical ill health — but a degree of stress is natural and can actually improve performance; too little stimulation can lead to boredom, irritability and illness. It is the person's **interpretation of demands and perception of their own abilities**, rather than the actual demands and abilities, that determine the amount of stress experienced.

### Attention / Motivation / Performance — The Inverted U

Performance depends on arousal state, shown as an inverted U curve:

- **Low arousal** — not expecting difficult tasks; motivation and information processing are very low; attention is dull; performance capability is low.
- **Optimal arousal** — most efficient state; enough demands to keep attention and alertness; capable of dealing with complex tasks.
- **High arousal** — performance deteriorates, errors are made, information may be missed; a narrowing of attention onto a limited number of tasks; may become emotionally disturbed.

Arousal operates through the **autonomic nervous system**, divided into the **sympathetic system** (prepares the body for physical activity — fight or flight — in response to new/sudden stress) and the **parasympathetic system** (restores the body to normal functioning once stress has abated).

### Physiological Responses to Stress

- Pupils of the eye dilate
- Flow of saliva is inhibited
- Heartbeat rate increases
- Bronchi in the lungs dilate
- Adrenalin is secreted
- Glycogen is released into the blood
- Bladder contraction is inhibited
- Peristalsis is inhibited

These reactions can occur without the actual event happening — anticipation of a perceived demand or threat is enough to trigger them. Repeated exposure to moderate environmental stress causes the body to adapt and reduce the impact of the stress (e.g. no longer noticing noise from a nearby railway line).

### Environmental / Physical Stress

| Factor | Effect |
|--------|--------|
| **Temperature** | Comfortable temperature is about **20°C**. Above 30°C, heart rate, blood pressure and sweating increase, and attention becomes restricted/focused. Below 15°C, the individual becomes uncomfortable, with possible loss of feeling and fine motor control in the hands. |
| **Noise** | In low arousal states, some noise can improve performance toward the optimum, preventing boredom and fatigue. Excessive noise disrupts performance, causes annoyance/irritability, raises heart rate, and can cause loss of attention. |
| **Vibration** | 1–4 Hz interferes with breathing; 4–10 Hz can cause chest and abdominal pains; 8–12 Hz causes backache; 10–20 Hz causes headache, eyestrain, throat pains, speech difficulties and muscular tension — possibly why helicopter flight is tiring and stressful. |
| **Humidity** | Comfort requires **40–60% relative humidity**. Low humidity dries mucous membranes of the nose/throat and causes sore eyes (can occur in pressurised high-flying aircraft); high humidity makes the body less able to cool by sweating. |

### The Stress (Life Events) Table

A scoring table of life events (e.g. death of spouse/partner = 100, divorce = 73, marital separation = 65, personal injury or illness = 53, marriage = 50) is used to assess stress load:

| Score | Interpretation |
|-------|-----------------|
| Below 60 | A life unusually free of stress |
| 60–80 | Normal amount of stress |
| 80–100 | Stress in life is rather high |
| 100+ | Under serious amount of stress |

### Domestic and Work Stress

Domestic stress can arise from relationship problems with spouse or family (sex, money, health worries, housing). When a person is under such high stress (e.g. bereavement, scored 100), performance and reactions are severely degraded, and they should not be asked to perform duties until able to perform normally.

Work stress may arise from high workload (over a long period, or total overload short-term), the physical environment (temperature, noise, hazards from dust/chemicals/working at height), boredom or repetitiveness, or a feeling of lacking necessary knowledge/skill. If management pressures staff toward short-term monetary gain over safety and good engineering practice, the whole company develops **organisational stress**, demonstrated by staff illness, poor industrial relations, absenteeism, and a high accident/incident rate.

### Effects of Stress on Health

Long-term physiological stress responses (high blood pressure, sweating, etc.) affect health over time — early physical signs appear in the gastro-intestinal system (indigestion, nausea, diarrhoea, eventually ulcers). There is evidence linking permanently raised blood pressure with coronary heart disease, heart attacks and strokes. People under stress have a higher incidence of asthma, headaches, sleep disorders, neuroses, and are more susceptible to colds and influenza.

### Signs of Stress

Under stress, a person may become restless, tremble, laugh nervously, behave impulsively and excitably, or take longer over routine tasks; smoking/drinking habits may change; accident likelihood increases; thought processes are affected, leading to forgetfulness, reduced concentration, and impaired ability to prioritise and make decisions. Anxiety and aggression (irritability, threat, bad temper) may appear, with mood swings toward apathy, fatigue and low self-esteem.

## Alcoholism, Medication and Drug Abuse

Alcohol requires no digestion and is absorbed readily by the stomach and small intestine; water speeds absorption while high-protein foods slow it. Once in the blood it passes immediately through the liver. Alcohol is a sedative-hypnotic drug; excessive consumption over time can lead to **cirrhosis of the liver**, and can prevent the liver from metabolising thiamine, leading to loss of brain neurons and eventually amnesia. The earliest and most common signs of alcohol withdrawal are **anxiety, anorexia, insomnia and tremors**; withdrawal may also lead to disorientation and hallucinations.

### Tolerance

A male weighing **150 lb (68.2 kg)** metabolises alcohol at approximately **one drink per hour**, a "drink" being **25 ml of pure alcohol** (e.g. one measure of spirits — 30 ml of 40–50% alcohol; a glass of wine — 150 ml of 12% alcohol; a pint of beer — 400 ml of 5% alcohol).

### Blood Alcohol Levels and Behaviour (Naïve Drinker)

| Blood level (%) | Behaviour |
|------------------|-----------|
| **0.05** | Perceptible changes in mood and behaviour; judgement and restraint loosened; feels carefree |
| **0.10** | Voluntary motor action becomes clumsy; legal evidence of intoxication in most states |
| **0.20** | Entire motor area of the brain measurably depressed, causing staggering; may be easily angered, shout or weep |
| **0.30** | Confusion; stupor |
| **0.40** | Coma |
| **0.50** | Death, due to respiratory blocking effects on the medulla |

Early significant landmarks of ensuing alcoholism include constant drinking for relief of tension/anxiety, psychological dependence, onset of memory blackouts, surreptitious drinking, urgent need to drink, and increased tolerance. The **chronic stage** includes inability to stop drinking, loss of outside interests, work and money troubles, neglect of food, personal relationship difficulties, guilt, remorse, depression and loneliness. Continued drinking damages the liver (cirrhosis, alcoholic hepatitis) and causes muscle, skeletal, pancreas, heart and brain disorders.

### Drugs

Drugs may be prescribed or purchased over the counter, with warnings given for adverse side effects — if drowsiness or inability to concentrate occurs, do not drive, work on aircraft, or carry out certification. New prescribed medicines should be "trialled" several days before returning to work. Recreational (non-prescribed) drug abuse is characterised by personality features including **emotional immaturity, a strong wish to turn one's back on reality, low frustration tolerance, unwillingness or inability to cope with tension, and a lack of staying power**. Drinking problems or use of illicit/non-prescribed drugs are unacceptable where aircraft maintenance safety is concerned, and once identified lead to suspension of licence or company authorisation and possible further licensing action (**Airworthiness Notice 47**).

### Personal Responsibility When Medically Unfit

ICAO has amended Annex 1 to extend standards on medical fitness and use of alcohol/drugs to all licence holders. EASA states a person should not exercise the privileges of their licence/authorisation if their mental condition renders them unfit — it is the individual's responsibility not to work or certify if they feel unfit in any way. Gradual changes in behaviour (e.g. stress-related conditions) may be noticed by family, friends or colleagues before the individual notices them.

Examples of Fit for Work considerations:

- **Stress** — some stress is essential for good performance; excessive stress causes adverse mental and physical effects.
- **Eyesight** — a reasonable standard of vision (with glasses/contact lenses if necessary) is required for near and far vision tasks; colour perception should be tested where relevant (e.g. colour-coded wiring).
- **Drug and Alcohol Abuse** — unacceptable where aircraft safety is concerned.
- **Alcohol** — has a similar effect to tranquillisers and can still be circulating in the blood **up to 8 hours** after consumption.
- **Anaesthetics** — after a general, local or dental anaesthetic, a period of **up to 48 hours** must elapse before going on duty (actual time varies).

### Medicines in Common Use That May Impair Work Performance

| Medicine | Effect |
|----------|--------|
| **Sleeping tablets** | Dull the senses, cause mental confusion, slow reaction times; duration variable and may be unduly prolonged |
| **Tranquillisers** | Anti-depressants and sedatives depress the alerting system; a contributory cause of mistakes leading to fatal accidents — should not work when taking them |
| **Antibiotics** | May have short-term or delayed effects on performance; the underlying infection itself will almost always render an individual unfit for work |
| **Anti-histamines** | Used in cold cures, hay fever, asthma, allergic skin conditions; tend to cause drowsiness |
| **Pep pills** | May contain caffeine, benzedrine, dexedrine; keep the user awake but may be habit-forming and create dangerous over-confidence; over-dosage causes headaches, dizziness and mental disturbances; **NOT permitted while working** |
| **Sudafed** | May cause anxiety, headache and affect performance; **NOT to be used** while making engineering decisions or performing licensed duties |
        $cnt3$,
        3
    ) RETURNING id INTO s3_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M09.1 General (10 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s1_id, 'Recent statistics show that approximately what percentage of aviation accidents are caused by human error?',
     '[{"id":"a","text":"70-80%","correct":true},{"id":"b","text":"20-30%","correct":false},{"id":"c","text":"95-99%","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'According to the module, if air travel doubles by 2017 without improvement in the accident rate, this could lead to approximately how many major accidents a year?',
     '[{"id":"a","text":"5 or more","correct":false},{"id":"b","text":"50 or more","correct":true},{"id":"c","text":"500 or more","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'In the Aloha Airlines Boeing 737 accident (28 April 1988), the investigation determined the probable cause was:',
     '[{"id":"a","text":"Failure of the maintenance programme to detect significant disbonding and fatigue damage of fuselage lap joints","correct":true},{"id":"b","text":"Incorrect fitting of undersized windscreen retaining bolts","correct":false},{"id":"c","text":"Spoilers left selected to Maintenance Mode after a flap change","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'In the Aloha Airlines accident, one contributory factor was that major inspections were being "equalised" over what period, preventing in-depth examination?',
     '[{"id":"a","text":"12 weeks","correct":false},{"id":"b","text":"50 weeks","correct":true},{"id":"c","text":"100 weeks","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'In the BAC One-Eleven windscreen accident (10 June 1990), the replacement windscreen bolts (A211-8C) were found to be:',
     '[{"id":"a","text":"Approximately 0.026 inch below the specified diameter","correct":true},{"id":"b","text":"Approximately 0.026 inch above the specified diameter","correct":false},{"id":"c","text":"The exact correct diameter but the wrong material","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'Regarding the BAC One-Eleven windscreen accident, Gordon Dupont considered this investigation significant because it was the first to:',
     '[{"id":"a","text":"Recommend grounding the entire BAC One-Eleven fleet","correct":false},{"id":"b","text":"Look beyond the man to find why he had committed the error","correct":true},{"id":"c","text":"Introduce mandatory drug testing for maintenance engineers","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'In the Airbus A320 Gatwick incident (26 August 1993), the cause of the roll problem after takeoff was:',
     '[{"id":"a","text":"Four right-hand spoilers left selected to Maintenance Mode, free to move under aerodynamic loads","correct":true},{"id":"b","text":"A sidestick failure caused by a wiring fault","correct":false},{"id":"c","text":"Incorrect flap setting selected by the co-pilot","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'The bolt-and-seven-nuts exercise used to illustrate Murphy''s Law shows that:',
     '[{"id":"a","text":"The components can be assembled correctly in several different ways","correct":false},{"id":"b","text":"The components can only be assembled correctly one way, but incorrectly in many ways","correct":true},{"id":"c","text":"Incorrect assembly is impossible if washers are used","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'One of the major causes of human error in maintenance, illustrated by Murphy''s Law, is:',
     '[{"id":"a","text":"Incorrect installation or omission of aircraft parts and components","correct":true},{"id":"b","text":"Excessive use of written work records","correct":false},{"id":"c","text":"Over-inspection of completed tasks","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'Recording and signing for all work carried out on an aircraft allows the history of a component to be traced back to:',
     '[{"id":"a","text":"The smallest rivet","correct":true},{"id":"b","text":"Only the last three maintenance events","correct":false},{"id":"c","text":"Only the original manufacturer, not subsequent maintenance","correct":false}]',
     '{"B1.1","B1.3","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M09.2 Human Performance and Limitations (14 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s2_id, 'The cornea of the eye is responsible for approximately what percentage of the total focusing ability of the eye?',
     '[{"id":"a","text":"10-20%","correct":false},{"id":"b","text":"70-80%","correct":true},{"id":"c","text":"95-100%","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'The chemical change in the retina that allows adaptation to low light levels (dark adaptation) takes approximately how long to complete for the rods?',
     '[{"id":"a","text":"30 seconds","correct":false},{"id":"b","text":"7 minutes","correct":false},{"id":"c","text":"30 minutes","correct":true}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'Which retinal cells are responsible for detecting colour?',
     '[{"id":"a","text":"Rods","correct":false},{"id":"b","text":"Cones","correct":true},{"id":"c","text":"Both rods and cones equally","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'The area of the retina where the optic nerve leaves the eyeball, containing no light-detecting cells, is known as the:',
     '[{"id":"a","text":"Fovea","correct":false},{"id":"b","text":"Blind spot","correct":true},{"id":"c","text":"Cornea","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'In the absence of anything to focus on (empty field), the natural resting focus point of the eye is, on average, at a distance of approximately:',
     '[{"id":"a","text":"Infinity","correct":false},{"id":"b","text":"Just under one metre","correct":true},{"id":"c","text":"200 feet","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'Short sightedness (myopia), where the image forms in front of the retina, is corrected by fitting glasses with a:',
     '[{"id":"a","text":"Convex lens","correct":false},{"id":"b","text":"Concave lens","correct":true},{"id":"c","text":"Flat (plano) lens","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'An increase in sound intensity of 1 decibel represents an increase in loudness of approximately:',
     '[{"id":"a","text":"1.26 times","correct":true},{"id":"b","text":"2 times","correct":false},{"id":"c","text":"10 times","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'The frequency range of sound normally detectable by the human ear is approximately:',
     '[{"id":"a","text":"15 Hz to 20,000 Hz","correct":true},{"id":"b","text":"1 Hz to 1,000 Hz","correct":false},{"id":"c","text":"100 Hz to 100,000 Hz","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'The three small bones (ossicles) of the middle ear, which transmit eardrum movement to the inner ear, are the:',
     '[{"id":"a","text":"Hammer, anvil and stirrup","correct":true},{"id":"b","text":"Cochlea, vestibule and canal","correct":false},{"id":"c","text":"Pinna, tragus and lobule","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'The function of the Eustachian tube is to:',
     '[{"id":"a","text":"Transmit nerve impulses from the cochlea to the brain","correct":false},{"id":"b","text":"Equalise pressure in the middle ear with ambient (outside) pressure","correct":true},{"id":"c","text":"Detect linear and rotational acceleration for balance","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'Unless actively rehearsed, information held in short term (working) memory is typically lost within:',
     '[{"id":"a","text":"20 to 30 seconds","correct":true},{"id":"b","text":"20 to 30 minutes","correct":false},{"id":"c","text":"20 to 30 hours","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'Regarding episodic long term memory retention, approximately what percentage of an incident is remembered after 31 days?',
     '[{"id":"a","text":"22%","correct":true},{"id":"b","text":"75%","correct":false},{"id":"c","text":"100%","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'The phenomenon whereby a person deep in conversation at a party immediately notices their own name mentioned by another group is known as the:',
     '[{"id":"a","text":"Empty field effect","correct":false},{"id":"b","text":"Cocktail party effect","correct":true},{"id":"c","text":"Subliminal perception effect","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'In Reason''s "Swiss Cheese" Model, an accident occurs when:',
     '[{"id":"a","text":"A single slice of cheese fails completely","correct":false},{"id":"b","text":"The holes (inadequate defences) in successive slices align, allowing an error straight through the system","correct":true},{"id":"c","text":"The liveware (human) interface is removed from the model entirely","correct":false}]',
     '{"B1.1","B1.3","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M09.3 Factors Affecting Performance (14 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s3_id, 'In Maslow''s Hierarchy of Needs as described in the module, which need is placed at the base of the pyramid?',
     '[{"id":"a","text":"Survival","correct":true},{"id":"b","text":"Esteem","correct":false},{"id":"c","text":"Self actualisation","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'For man, sleep is usually required for approximately how many hours in every 24-hour period?',
     '[{"id":"a","text":"4 hours","correct":false},{"id":"b","text":"8 hours","correct":true},{"id":"c","text":"12 hours","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'If an individual is isolated from all external time cues (Zeitgebers), the circadian rhythm will "free run" to a periodicity of approximately:',
     '[{"id":"a","text":"20 hours","correct":false},{"id":"b","text":"25 hours","correct":true},{"id":"c","text":"36 hours","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'According to the module, body temperature is normally at its highest and lowest at approximately:',
     '[{"id":"a","text":"Highest around 1800 hours, lowest around 0500 hours","correct":true},{"id":"b","text":"Highest around 0500 hours, lowest around 1800 hours","correct":false},{"id":"c","text":"Highest at noon, lowest at midnight","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'When shift patterns must be moved, which direction is generally preferred because it follows the body''s natural tendency to free-run?',
     '[{"id":"a","text":"Forwards (e.g. dayshift moved to earlier start)","correct":false},{"id":"b","text":"Backwards (e.g. dayshift moved later towards night shift)","correct":true},{"id":"c","text":"Direction makes no difference to the circadian rhythm","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'Research cited in the module found that a 2-hour sleep deficit produces body reaction times similar to those experienced after drinking:',
     '[{"id":"a","text":"Half a pint of beer","correct":false},{"id":"b","text":"One pint of beer","correct":true},{"id":"c","text":"A whole bottle of wine","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'The EEG wave pattern characterised by rapid, low-amplitude oscillations approaching 20 Hz, seen when a person is awake with eyes open, is known as:',
     '[{"id":"a","text":"Alpha wave","correct":false},{"id":"b","text":"Beta wave","correct":true},{"id":"c","text":"Delta wave","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'REM sleep is also known as "paradoxical sleep" because:',
     '[{"id":"a","text":"The EEG trace resembles that of a fully awake person while other measurements show the individual is asleep","correct":true},{"id":"b","text":"It only occurs during daytime naps","correct":false},{"id":"c","text":"It is the deepest and longest stage of sleep","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'A normal night''s sleep pattern operates on an approximate sleep cycle length of:',
     '[{"id":"a","text":"30 minutes","correct":false},{"id":"b","text":"90 minutes","correct":true},{"id":"c","text":"4 hours","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'A comfortable ambient temperature for most people in normal clothing, as stated in the module, is approximately:',
     '[{"id":"a","text":"10°C","correct":false},{"id":"b","text":"20°C","correct":true},{"id":"c","text":"35°C","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'For comfort, the module states that a human being requires a relative humidity level of approximately:',
     '[{"id":"a","text":"5-10%","correct":false},{"id":"b","text":"40-60%","correct":true},{"id":"c","text":"90-100%","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'Using the Stress (Life Events) Table described in the module, a total score of 100 or more indicates:',
     '[{"id":"a","text":"A life unusually free of stress","correct":false},{"id":"b","text":"A normal amount of stress","correct":false},{"id":"c","text":"Being under a serious amount of stress","correct":true}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'According to the Blood Alcohol Levels and Behaviour table, a blood alcohol level of 0.40% is associated with:',
     '[{"id":"a","text":"Perceptible changes in mood only","correct":false},{"id":"b","text":"Coma","correct":true},{"id":"c","text":"No measurable effect","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'Following a general, local or dental anaesthetic, the module states that a period of up to how many hours must elapse before going on duty?',
     '[{"id":"a","text":"12 hours","correct":false},{"id":"b","text":"48 hours","correct":true},{"id":"c","text":"96 hours","correct":false}]',
     '{"B1.1","B1.3","B2"}');

END $$;
