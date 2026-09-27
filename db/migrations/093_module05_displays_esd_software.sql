-- Module 05: Digital Techniques / Electronic Instrument Systems (B1/B2 Common)
-- Sub-Modules 11-13: Electronic Displays, Electrostatic Sensitive Devices, Software Management Control
-- Source: EASA Part-66 Module 5 Study Notes

DO $$
DECLARE
    m05_id INT;
    s11_id INT;
    s12_id INT;
    s13_id INT;
BEGIN
    SELECT id INTO m05_id FROM easa_modules WHERE code = 'M05';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M05.11') THEN
        RAISE NOTICE 'M05.11-M05.13 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 05.11: Electronic Displays
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m05_id, 'M05.11', 'Electronic Displays',
        $cnt$
# Electronic Displays

## Overview

Three principal display technologies are used in modern aircraft: the cathode ray tube (CRT), the light emitting diode (LED), and the liquid crystal display (LCD). The exam requires a clear physical explanation of the principle of operation of each, not a circuit diagram.

## Cathode Ray Tube (CRT)

A CRT is an evacuated glass tube. At the narrow end a heater warms a cathode until it emits electrons. A control grid regulates how many electrons get through, and this sets the brightness. An anode at a high positive potential — which can be up to about 20,000 volts — accelerates the electrons into a beam through a hole in its centre. Focusing coils squeeze the beam to a fine point.

The beam is then steered by deflection plates or coils, one pair for horizontal and one for vertical. Wherever the beam lands, the phosphor coating on the inside of the screen fluoresces and that point glows. Varying the anode voltage varies the intensity.

### Colour

A colour tube has three electron guns, one each for red, green and blue, and the screen carries phosphor dots doped to emit those three colours. A thin foil shadow mask with precisely aligned holes ensures each gun can only strike its own colour of dot. One triad of red, green and blue dots forms a pixel. Varying the intensity of the three beams can produce any colour.

### Raster and Stroke

There are two ways to write a picture on a CRT:

- **Raster** — the beam sweeps left to right, line after line, all the way down the screen, exactly as a television does. It is efficient for filling in large areas, so it is used for the blue-over-brown of the artificial horizon, the moving map background and weather radar returns.
- **Stroke**, also called vector or cursive — the beam is sent directly from point to point, drawing each line in one movement. The display processor generates the coordinate pairs and a DAC turns them into deflection voltages. It is much sharper and brighter for line work, so it is used for the symbology drawn on top of the raster background: the aircraft symbol, the flight director bars, the scales and the text.

A typical aircraft CRT display uses both, alternately, in the same frame. Resolution is quoted as pixels across by pixels down, so 1024 by 768 gives 786,432 pixels in total. Refresh must be fast enough that the eye does not see flicker — the image needs to be renewed at least every 30 milliseconds, so 60 Hz, or one refresh every 16.7 milliseconds, is typical.

### Handling a CRT

Even with power removed, the tube and its EHT circuit can hold a lethal charge for a long time. CRT displays are not line-maintenance items — they go to a workshop. The tube is also under vacuum. A damaged tube can implode, throwing glass. Handle removed units with the face protected.

## Light Emitting Diodes (LED)

An LED is a semiconductor diode that emits light when forward biased. The physical process is called electroluminescence. When a free electron from the N-type material crosses the junction and drops into a hole in the P-type material, it loses energy. In most semiconductors that energy appears as heat; in certain compound materials it appears as a photon of visible light.

The colour is determined by the band gap of the semiconductor material, not by the colour of the plastic lens — gallium arsenide gives infrared, gallium arsenide phosphide gives red and amber, gallium nitride and indium gallium nitride give blue and green. Reverse bias the device and no light is produced at all.

LEDs are simple, robust, long-lived and draw little current. Their weakness as a display is resolution — only about 64 cells per inch — which is fine for annunciators, digital readouts and warning captions but useless for a map. Their main roles on an aircraft are indicator and annunciator lamps, seven-segment numeric readouts, the backlight of LCD panels, and the light source in a fibre optic transmitter.

### The Photodiode

A photodiode is a reverse-biased PN junction. When a photon strikes it, it gives an electron enough energy to break free, creating a current in a circuit that would otherwise be blocked. That is how the receiver at the far end of a fibre turns light back into electricity.

## Liquid Crystal Displays (LCD)

CRTs and LEDs are emissive — they generate their own light. An LCD is non-emissive. It generates no light at all. It works entirely by controlling light that comes from somewhere else, normally a fluorescent or LED backlight behind the panel.

Liquid crystals are rod-shaped molecules that flow like a liquid but line up like a crystal. Laid on a surface scored with fine parallel grooves, they align themselves with the grooves. A cell is built from two grooved glass plates with the crystals between them, with the grooves on the top plate at ninety degrees to those on the bottom. The molecules are forced to twist progressively through a right angle from one plate to the other.

That cell is sandwiched between two polarising filters, also set at ninety degrees to each other. With no voltage applied, light passes the first polariser, is rotated through ninety degrees by the twisted crystals, and therefore lines up with the second polariser and passes through. The pixel is bright.

Apply a voltage across the cell and the molecules untwist and stand on end. Light is no longer rotated, so it arrives at the second polariser still at ninety degrees to it — and is blocked. The pixel goes dark.

### Passive and Active Matrix

A passive matrix addresses cells by energising a row and a column and relying on the cell at the intersection to respond. It is simple but slow, the contrast is poor, and neighbouring cells are partially driven too, which smears the image.

An active matrix — AMLCD — places a thin film transistor and a small capacitor at every single pixel. The transistor switches that pixel and the capacitor holds its state until the next refresh. The result is far higher contrast, much faster response and no crosstalk between pixels. Every modern aircraft flat panel display is an AMLCD.

### Comparison

| | CRT | LED | LCD |
|---|---|---|---|
| Emissive? | Yes | Yes | No — needs a backlight |
| Depth and weight | Large and heavy | Small | Very thin and light |
| Power | High, plus EHT | Low | Low, but backlight consumes most of it |
| Resolution | Good | Poor, ~64 cells/in | Excellent |
| Typical failure | Dim tube, EHT failure, defocus | Individual lamp out | Backlight failure, stuck pixels |
| Aircraft use | Older glass cockpits | Annunciators, readouts, backlights | All modern displays |

### Reading the Failure

An LCD panel that is black but still responds to a brightness change is usually a backlight failure, not a display failure — the picture is still being formed, there is simply nothing illuminating it. Shining a torch at the screen at an angle can often reveal the image faintly. That single check saves a great many unnecessary display unit removals.
        $cnt$,
        11
    ) RETURNING id INTO s11_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 05.12: Electrostatic Sensitive Devices
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m05_id, 'M05.12', 'Electrostatic Sensitive Devices',
        $cnt2$
# Electrostatic Sensitive Devices

## Where the Charge Comes From

Static electricity is generated by friction — two dissimilar materials rubbing together and separating, one taking electrons from the other. Most work environments have non-conductive flooring and no humidity control, and that is all it takes.

Humidity is the critical variable. Above about 60 per cent relative humidity, a thin film of moisture on surfaces conducts the charge away almost as fast as it is generated. Below about 20 per cent, nothing bleeds away and the charge accumulates.

Walking across a carpet at 20 per cent humidity can put 35,000 volts on a person. An EPROM can be destroyed by 100 volts — a person can be carrying three hundred times more than it takes to destroy one, and a discharge cannot be felt until about 3,000 volts, so every damaging event below that level happens without the person noticing anything at all.

## How the Damage Happens

Electrostatic discharge (ESD) is defined as the transfer of electrostatic charge between bodies at different potentials, either by direct contact or induced by an electrostatic field. Two mechanisms matter:

- **Conduction** — touching the component allows the charge to flow through it to ground. The current density through the microscopically thin insulating layers inside the device is enormous, the dielectric breaks down, and heat punches a hole through it.
- **Induction** — no contact is needed. A charged body brought near a component redistributes the charges within it. Sitting down at a bench with a charge on the body creates a field sufficient to damage a device lying on the mat.

### Latent Damage

Some ESD events destroy a device outright and this is found out immediately — the good outcome, because the device is simply replaced. Many events only partially puncture the insulation: the device still works, it passes test, it goes on the aircraft, and then it fails weeks or months later in service for no apparent reason. This is called latent or walking wounded damage, and it is the reason ESD procedures are mandatory rather than advisory.

## Sensitivity Classes

The US military standard MIL-STD-1686C recognises two classes of ESD-sensitive item: Class I, covering devices damaged between 100 and 1000 volts, and Class II, covering 1001 to 4000 volts. Most electronic components fall into Class I.

| Device | Damaged by as little as |
|---|---|
| EPROM | 100 V |
| CMOS | 250 V |
| Bipolar transistor | 380 V |
| MOSFET and VLSI devices | Comparable or lower |

As devices shrink to achieve higher speeds and greater functionality, their internal geometries get smaller and their insulating layers get thinner. Sensitivity is increasing with every generation.

## Controlling It

Static electricity cannot be eliminated, only controlled. The whole approach rests on one principle: bring everything to the same potential, slowly. Nothing should be at a different voltage from anything else, and any charge that does arise should bleed away gently rather than jump.

### The Controlled Area

- Signage at the entrance warns that special precautions apply before entering.
- Insulating materials are kept out — nylon, mylar, vinyl, rubber, mica, ceramics, fibreglass, wood, polystyrene and ordinary plastics all store charge and have no place on an ESD bench.
- Personnel wear anti-static smocks, typically containing a steel mesh, and conductive footwear. If heel straps are used instead of conductive shoes, the grounding tab must go inside the sock so it contacts skin.

### The Workstation

- A static dissipative table mat and floor mat, with a surface resistivity in the range 10^5 to 10^12 ohms per square. The word is dissipative, not conductive — it must remove the charge from anything placed on it, but slowly.
- Both mats are bonded through a 1 megohm resistor to a common ground point.
- An anti-static wrist strap, worn tight enough against bare skin to make good contact, with its coil cord clipped to a receptacle that also contains a 1 megohm resistor to the same common ground point.

The 1 megohm resistor does two jobs. It limits the rate at which charge bleeds away, so the wearer gets a gentle drain rather than a spark. And, more importantly, it protects the wearer: if the bench or the equipment becomes electrically live, one megohm in series limits the current through the body to a safe value. Without it, the wrist strap would be a direct short to earth through the arm.

### Ionisers

Some insulating items cannot be removed and cannot be grounded — a plastic component housing, for instance. Charge on an insulator will not flow to earth no matter what is connected to it. The answer is an ioniser: a blower that fills the air with both positive and negative ions. A charged surface attracts ions of the opposite polarity until it is neutralised, and stays neutral for as long as the ion stream continues.

Ionisers come as hand-held air guns for localised work and as wall or ceiling units mounted about 30 to 36 inches above the bench, giving a balanced ionised pattern of roughly 36 by 48 inches. Raising the humidity would do a similar job, but it is impractical — it makes operators uncomfortable and it rusts tooling.

An ioniser must be verified working with an electrostatic field meter before it is relied on. If it is not working, a topical anti-static spray can be applied to control charge generation in the work area.

### Grounding Test Station

Every anti-static device is tested before entering the controlled area. A grounding test station checks wrist straps, footwear, heel straps and coil cords, and gives a green indication when the item is working and correctly worn. A wrist strap is a consumable — the cord breaks internally long before it looks broken.

## Handling and Packaging

- Transport ESD-sensitive items in a closed conductive container — a tote box or the LRU's own case. Store the container on a grounded rack.
- When it arrives at the bench, place the container so that it makes contact with the grounded table mat, allowing it to equalise.
- Fit and test the wrist strap and discharge before opening the container.
- Only then open it and handle the device — by the body or the edges of the board, never by the pins or the edge connector.
- Use a grounded soldering iron. An ungrounded iron tip can carry enough potential to destroy the device being fitted.
- Package for storage or return in an electrostatic shielded bag: a laminate of an outer metallised or aluminium foil layer, a middle insulating layer and an inner anti-static layer. Seal it and label it as containing an ESD-sensitive item.

The bag is not a wrapper — it is a Faraday cage. Its shielding only works when it is sealed. A part left in an open bag is unprotected. A pink poly bag is anti-static — it stops charge being generated by the bag itself. It is not shielding and does not replace a metallised bag. A card removed and put down on an aircraft seat, on a toolbox lid, or in a pocket has been out of control and must be treated as suspect.
        $cnt2$,
        12
    ) RETURNING id INTO s12_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 05.13: Software Management Control
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m05_id, 'M05.13', 'Software Management Control',
        $cnt3$
# Software Management Control

## Why It Matters

A modern airliner runs many millions of lines of code across dozens of computers, all executing simultaneously. The autopilot, the flight controls, the engine controls, the displays, the warning system and the braking are all governed by software. Consider an unapproved change loaded into the flight control computers, during an instrument approach in zero visibility, with the software failing at two hundred feet. That is the reason the entire apparatus of software control exists. The message is a single sentence: software is an aircraft part, and it is controlled exactly like any other aircraft part.

## The Standard: DO-178

The document titled *Software Considerations in Airborne Systems and Equipment Certification* was published jointly in 1992 by RTCA in the United States as DO-178B and by EUROCAE in Europe as ED-12B. Both the FAA and EASA use it as the certification basis for deciding whether software will behave reliably in an aircraft system.

It was replaced by DO-178C in 2011, which the FAA recognised through Advisory Circular 20-115C in July 2013. The revision was needed because software is no longer hand-written — model-based design tools now generate code automatically, and the standard had to say how such code is verified. DO-178C therefore comes with supplements covering tool qualification (DO-330), model-based development and verification (DO-331), object-oriented technology (DO-332) and formal methods (DO-333).

## Design Assurance Levels

The core idea of DO-178 is proportionate rigour. The same effort is not applied to the in-flight entertainment as to the flight controls. A safety assessment and hazard analysis is carried out on each aircraft system, asking one question: what is the effect on the aircraft and its occupants if this software fails and the failure is not detected? The answer sets the design assurance level, and the level sets how much evidence must be produced.

| Level | Failure Condition |
|---|---|
| A | Catastrophic — prevents continued safe flight and landing |
| B | Hazardous / severe — large reduction in safety margins, serious or fatal injury to a few |
| C | Major — significant reduction in safety margins and increased crew workload |
| D | Minor — slight reduction in margins, well within crew capability |
| E | No effect on safety or operation |

The level is not determined by how large, complex or clever the software is. A ten-line routine that could prevent continued safe flight is Level A. A hundred-thousand-line entertainment system is Level E. It is decided solely by the severity of the failure condition it could cause.

## Partitioning: ARINC 653

Historically, software of different criticality levels was not run on the same processor — the risk of a low-level function corrupting a high-level one was unacceptable. Integrated modular avionics (IMA) changes that, because the whole point of IMA is to share hardware.

The answer is ARINC 653, the Avionics Application Standard Software Interface. It defines a real-time operating system that provides space and time partitioning: each application gets a guaranteed slice of processor time and a protected region of memory that no other application can touch. A Level D application that hangs or overruns cannot steal time or memory from the Level A application in the next partition. This is what makes it acceptable to run mixed criticality on one processor.

## What Has to Be Produced

Approved software is not just source code and object code. The standard requires a body of documented life-cycle evidence, including:

- Plan for software aspects of certification
- Software development plan, verification plan, configuration management plan and quality assurance plan
- Software requirements standard, design standard and code standard
- Software requirements document and design document
- Traceability from system requirements through to code and test cases
- Test cases, test procedures and verification results
- Configuration management records, problem reports and quality assurance records
- Software accomplishment summary

Traceability is the thread running through all of it: every line of code must trace back to a requirement, and every requirement must trace forward to a test that demonstrates it. DO-178C requires progressively more of this tracing as the level rises — Level E requires none at all, and Level A requires the most, including a requirement that the executable object code be robust enough to respond correctly to abnormal inputs and conditions.

## What This Means in Practice

Software fitted to an aircraft must be an approved standard, identified by part number and controlled under the type certificate or an approved modification.

Loading software is a maintenance task. It requires an approved procedure, the correct approved media, a competent authorised person, and an entry in the aircraft technical record. It is not a computer operation and it is not a housekeeping activity.

Software must never be loaded if it was obtained from an unapproved source, downloaded from anywhere unofficial, copied from another aircraft, or modified in any way however trivial.

After loading, the loaded part number must be verified against the approved configuration and recorded. A load that appears to complete is not proof that the correct standard is on board. An incorrect or corrupted load must be treated as a defect, recorded, and rectified before flight — never simply reloaded and forgotten.

Interrupting a data load — pulling power, disconnecting the loader, a ground power transient — can leave a computer with a partial program in memory. Some units are then unrecoverable on aircraft and become a workshop item. The electrical supply must be secured before beginning a load. Loading media must be kept controlled — an uncontrolled USB stick or memory card in a toolbox is a configuration control failure waiting to happen.
        $cnt3$,
        13
    ) RETURNING id INTO s13_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M05.11 Electronic Displays (15 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s11_id, 'In a CRT, which component regulates how many electrons pass through the electron gun and thereby sets the brightness?',
     '[{"id":"a","text":"The control grid","correct":true},{"id":"b","text":"The focusing coils","correct":false},{"id":"c","text":"The shadow mask","correct":false}]',
     '{"B1","B2"}'),

    (s11_id, 'In a CRT, the anode accelerates the electron beam using a potential of up to approximately:',
     '[{"id":"a","text":"20,000 volts","correct":true},{"id":"b","text":"2,000 volts","correct":false},{"id":"c","text":"200 volts","correct":false}]',
     '{"B1","B2"}'),

    (s11_id, 'What is the purpose of the shadow mask in a colour CRT?',
     '[{"id":"a","text":"It focuses the electron beam to a fine point","correct":false},{"id":"b","text":"It ensures each electron gun can only strike its own colour of phosphor dot","correct":true},{"id":"c","text":"It generates the deflection voltages","correct":false}]',
     '{"B1","B2"}'),

    (s11_id, 'On an aircraft CRT display, which writing method is used to fill in large areas such as the artificial horizon background, the moving map and weather radar returns?',
     '[{"id":"a","text":"Stroke (vector) writing","correct":false},{"id":"b","text":"Raster writing","correct":true},{"id":"c","text":"Shadow-mask writing","correct":false}]',
     '{"B1","B2"}'),

    (s11_id, 'On an aircraft CRT display, which writing method is used for the sharp symbology drawn over the background, such as the flight director bars and text?',
     '[{"id":"a","text":"Raster writing","correct":false},{"id":"b","text":"Stroke (vector) writing","correct":true},{"id":"c","text":"Interlace writing","correct":false}]',
     '{"B1","B2"}'),

    (s11_id, 'A CRT display with a resolution of 1024 by 768 has a total pixel count of:',
     '[{"id":"a","text":"786,432 pixels","correct":true},{"id":"b","text":"1,792 pixels","correct":false},{"id":"c","text":"78,643 pixels","correct":false}]',
     '{"B1","B2"}'),

    (s11_id, 'For a CRT image to appear flicker-free, it must be renewed at least every:',
     '[{"id":"a","text":"30 milliseconds","correct":true},{"id":"b","text":"300 milliseconds","correct":false},{"id":"c","text":"3 milliseconds","correct":false}]',
     '{"B1","B2"}'),

    (s11_id, 'Why are CRT displays not normally treated as line-maintenance items?',
     '[{"id":"a","text":"Because the tube and its EHT circuit can hold a lethal charge for a long time after power is removed, and a damaged tube can implode","correct":true},{"id":"b","text":"Because they require a clean-room environment to open","correct":false},{"id":"c","text":"Because they contain radioactive phosphor","correct":false}]',
     '{"B1","B2"}'),

    (s11_id, 'An LED produces light through a physical process called:',
     '[{"id":"a","text":"Electroluminescence","correct":true},{"id":"b","text":"Photoconduction","correct":false},{"id":"c","text":"Thermionic emission","correct":false}]',
     '{"B1","B2"}'),

    (s11_id, 'What determines the colour of light emitted by an LED?',
     '[{"id":"a","text":"The colour of the plastic lens","correct":false},{"id":"b","text":"The band gap of the semiconductor material","correct":true},{"id":"c","text":"The forward current only","correct":false}]',
     '{"B1","B2"}'),

    (s11_id, 'What happens when an LED is reverse biased?',
     '[{"id":"a","text":"It produces no light at all","correct":true},{"id":"b","text":"It produces light of a different colour","correct":false},{"id":"c","text":"It produces brighter light than when forward biased","correct":false}]',
     '{"B1","B2"}'),

    (s11_id, 'The resolution limitation that makes an LED display useless for a map but suitable for annunciators and readouts is approximately:',
     '[{"id":"a","text":"64 cells per inch","correct":true},{"id":"b","text":"640 cells per inch","correct":false},{"id":"c","text":"6,400 cells per inch","correct":false}]',
     '{"B1","B2"}'),

    (s11_id, 'A photodiode, used at the receiving end of a fibre optic link, is best described as:',
     '[{"id":"a","text":"A forward-biased PN junction that emits light","correct":false},{"id":"b","text":"A reverse-biased PN junction that generates a current when struck by a photon","correct":true},{"id":"c","text":"An unbiased junction that stores charge","correct":false}]',
     '{"B1","B2"}'),

    (s11_id, 'CRTs and LEDs are described as emissive, while an LCD is described as non-emissive. This means an LCD:',
     '[{"id":"a","text":"Generates no light of its own and only controls light from a backlight","correct":true},{"id":"b","text":"Generates more light than a CRT or LED","correct":false},{"id":"c","text":"Emits light only at the edges of the panel","correct":false}]',
     '{"B1","B2"}'),

    (s11_id, 'In a twisted nematic LCD cell with no voltage applied, the state of the pixel is:',
     '[{"id":"a","text":"Dark, because the crystals block the first polariser","correct":false},{"id":"b","text":"Bright, because the twisted crystals rotate the light so it passes the second polariser","correct":true},{"id":"c","text":"Half-bright, regardless of the polarisers","correct":false}]',
     '{"B1","B2"}'),

    (s11_id, 'What is the key advantage of an active matrix (AMLCD) over a passive matrix LCD?',
     '[{"id":"a","text":"A thin film transistor and capacitor at every pixel give higher contrast, faster response and no crosstalk between pixels","correct":true},{"id":"b","text":"It removes the need for any backlight","correct":false},{"id":"c","text":"It uses electron guns instead of liquid crystals","correct":false}]',
     '{"B1","B2"}'),

    (s11_id, 'An LCD panel appears completely black but still responds when the brightness control is adjusted. This most likely indicates:',
     '[{"id":"a","text":"A backlight failure, not a display failure","correct":true},{"id":"b","text":"A shadow mask failure","correct":false},{"id":"c","text":"An electron gun failure","correct":false}]',
     '{"B1","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M05.12 Electrostatic Sensitive Devices (15 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s12_id, 'Static electricity is generated primarily by:',
     '[{"id":"a","text":"Friction between two dissimilar materials rubbing together and separating","correct":true},{"id":"b","text":"Exposure to ultraviolet light","correct":false},{"id":"c","text":"A drop in ambient temperature","correct":false}]',
     '{"B1","B2"}'),

    (s12_id, 'Above approximately what relative humidity does a thin film of moisture conduct static charge away almost as fast as it is generated?',
     '[{"id":"a","text":"60 per cent","correct":true},{"id":"b","text":"10 per cent","correct":false},{"id":"c","text":"90 per cent","correct":false}]',
     '{"B1","B2"}'),

    (s12_id, 'Below approximately what relative humidity does static charge accumulate because nothing bleeds it away?',
     '[{"id":"a","text":"20 per cent","correct":true},{"id":"b","text":"50 per cent","correct":false},{"id":"c","text":"80 per cent","correct":false}]',
     '{"B1","B2"}'),

    (s12_id, 'Walking across a carpet at 20 per cent relative humidity can generate a static voltage on a person of approximately:',
     '[{"id":"a","text":"35,000 volts","correct":true},{"id":"b","text":"350 volts","correct":false},{"id":"c","text":"3,500 volts","correct":false}]',
     '{"B1","B2"}'),

    (s12_id, 'A person typically cannot feel an electrostatic discharge until the voltage reaches approximately:',
     '[{"id":"a","text":"3,000 volts","correct":true},{"id":"b","text":"30 volts","correct":false},{"id":"c","text":"300 volts","correct":false}]',
     '{"B1","B2"}'),

    (s12_id, 'ESD damage caused by directly touching a component, allowing charge to flow through it to ground, is called:',
     '[{"id":"a","text":"Induction","correct":false},{"id":"b","text":"Conduction","correct":true},{"id":"c","text":"Ionisation","correct":false}]',
     '{"B1","B2"}'),

    (s12_id, 'ESD damage that occurs without any physical contact, where the field around a charged body redistributes charge within a nearby component, is called:',
     '[{"id":"a","text":"Induction","correct":true},{"id":"b","text":"Conduction","correct":false},{"id":"c","text":"Dissipation","correct":false}]',
     '{"B1","B2"}'),

    (s12_id, 'Why is "latent" or "walking wounded" ESD damage considered more serious than an outright failure?',
     '[{"id":"a","text":"Because the device still works and passes test, then fails unpredictably later in service","correct":true},{"id":"b","text":"Because it always destroys more than one device at a time","correct":false},{"id":"c","text":"Because it cannot be prevented by any procedure","correct":false}]',
     '{"B1","B2"}'),

    (s12_id, 'Under MIL-STD-1686C, a Class I ESD-sensitive device is one that can be damaged by a voltage in the range:',
     '[{"id":"a","text":"100 to 1000 volts","correct":true},{"id":"b","text":"1001 to 4000 volts","correct":false},{"id":"c","text":"10 to 100 volts","correct":false}]',
     '{"B1","B2"}'),

    (s12_id, 'Of the devices listed in the study material, an EPROM can be destroyed by as little as:',
     '[{"id":"a","text":"100 volts","correct":true},{"id":"b","text":"250 volts","correct":false},{"id":"c","text":"380 volts","correct":false}]',
     '{"B1","B2"}'),

    (s12_id, 'The static dissipative table and floor mats used on an ESD-safe workstation have a surface resistivity in the range:',
     '[{"id":"a","text":"10^5 to 10^12 ohms per square","correct":true},{"id":"b","text":"0 to 1 ohm per square","correct":false},{"id":"c","text":"10^20 to 10^25 ohms per square","correct":false}]',
     '{"B1","B2"}'),

    (s12_id, 'On an ESD workstation, both the bench mats and the wrist strap are bonded to a common ground point through a resistor of:',
     '[{"id":"a","text":"1 megohm","correct":true},{"id":"b","text":"1 ohm","correct":false},{"id":"c","text":"1 kilohm","correct":false}]',
     '{"B1","B2"}'),

    (s12_id, 'What are the two purposes served by the 1 megohm resistor in the wrist strap earth path?',
     '[{"id":"a","text":"It amplifies the discharge current and speeds up charge removal","correct":false},{"id":"b","text":"It limits the discharge rate to a gentle drain and limits the current through the operator if the bench becomes electrically live","correct":true},{"id":"c","text":"It stores charge for later release and insulates the wearer completely","correct":false}]',
     '{"B1","B2"}'),

    (s12_id, 'An ioniser is required at an ESD-safe workstation because:',
     '[{"id":"a","text":"Charge on an insulating item cannot flow to earth no matter what it is connected to","correct":true},{"id":"b","text":"Wrist straps are unreliable and need a backup","correct":false},{"id":"c","text":"It replaces the need for a grounded table mat","correct":false}]',
     '{"B1","B2"}'),

    (s12_id, 'Before an ioniser is relied upon, it must be verified as working using a:',
     '[{"id":"a","text":"Electrostatic field meter","correct":true},{"id":"b","text":"Megohmmeter","correct":false},{"id":"c","text":"Grounding test station only, with no field verification","correct":false}]',
     '{"B1","B2"}'),

    (s12_id, 'An electrostatic shielded bag used to package an ESD-sensitive device is constructed as:',
     '[{"id":"a","text":"A single layer of plain pink polyethylene","correct":false},{"id":"b","text":"A laminate of an outer metallised or foil layer, a middle insulating layer and an inner anti-static layer","correct":true},{"id":"c","text":"A single layer of aluminium foil with no inner lining","correct":false}]',
     '{"B1","B2"}'),

    (s12_id, 'When removing an ESD-sensitive device from its packaging, it should be handled by:',
     '[{"id":"a","text":"The pins or the edge connector, for a secure grip","correct":false},{"id":"b","text":"The body of the device or the edges of the board, never the pins or edge connector","correct":true},{"id":"c","text":"Any part, provided gloves are worn","correct":false}]',
     '{"B1","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M05.13 Software Management Control (15 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s13_id, 'The document "Software Considerations in Airborne Systems and Equipment Certification" was published in 1992 by RTCA in the United States as DO-178B, and by which organisation in Europe, under what designation?',
     '[{"id":"a","text":"EUROCAE, as ED-12B","correct":true},{"id":"b","text":"ICAO, as Annex 178","correct":false},{"id":"c","text":"EASA, as CS-178","correct":false}]',
     '{"B1","B2"}'),

    (s13_id, 'DO-178B was replaced by DO-178C in:',
     '[{"id":"a","text":"2011","correct":true},{"id":"b","text":"1992","correct":false},{"id":"c","text":"2013","correct":false}]',
     '{"B1","B2"}'),

    (s13_id, 'The FAA formally recognised DO-178C through:',
     '[{"id":"a","text":"Advisory Circular 20-115C, in July 2013","correct":true},{"id":"b","text":"Advisory Circular 25-7, in 1992","correct":false},{"id":"c","text":"A direct amendment to Part 66","correct":false}]',
     '{"B1","B2"}'),

    (s13_id, 'DO-178C was given supplements because:',
     '[{"id":"a","text":"Software is no longer hand-written; model-based design tools now generate code automatically and the standard had to address how such code is verified","correct":true},{"id":"b","text":"DO-178B was found to be legally invalid in Europe","correct":false},{"id":"c","text":"All aircraft software moved to open-source code","correct":false}]',
     '{"B1","B2"}'),

    (s13_id, 'The DO-178C supplement covering tool qualification is:',
     '[{"id":"a","text":"DO-330","correct":true},{"id":"b","text":"DO-331","correct":false},{"id":"c","text":"DO-333","correct":false}]',
     '{"B1","B2"}'),

    (s13_id, 'What actually determines the design assurance level assigned to a piece of aircraft software?',
     '[{"id":"a","text":"The severity of the effect on the aircraft and occupants if the software fails undetected, as established by a safety assessment and hazard analysis","correct":true},{"id":"b","text":"The number of lines of code it contains","correct":false},{"id":"c","text":"How technically complex or clever the software is","correct":false}]',
     '{"B1","B2"}'),

    (s13_id, 'A software failure condition that would prevent continued safe flight and landing is assigned design assurance:',
     '[{"id":"a","text":"Level A, Catastrophic","correct":true},{"id":"b","text":"Level C, Major","correct":false},{"id":"c","text":"Level E, No effect","correct":false}]',
     '{"B1","B2"}'),

    (s13_id, 'A software failure condition that has no effect on safety or operation is assigned design assurance:',
     '[{"id":"a","text":"Level B","correct":false},{"id":"b","text":"Level D","correct":false},{"id":"c","text":"Level E","correct":true}]',
     '{"B1","B2"}'),

    (s13_id, 'A ten-line routine whose failure could prevent continued safe flight would be assigned:',
     '[{"id":"a","text":"Level A, despite its small size, because the level depends on failure severity, not code size","correct":true},{"id":"b","text":"Level E, because it is very short","correct":false},{"id":"c","text":"Level C, as a compromise for simple code","correct":false}]',
     '{"B1","B2"}'),

    (s13_id, 'ARINC 653 is best described as:',
     '[{"id":"a","text":"The Avionics Application Standard Software Interface, a real-time operating system specification providing space and time partitioning","correct":true},{"id":"b","text":"A data bus standard for engine parameter transmission","correct":false},{"id":"c","text":"A software configuration management filing system","correct":false}]',
     '{"B1","B2"}'),

    (s13_id, 'What problem does ARINC 653 partitioning solve in integrated modular avionics?',
     '[{"id":"a","text":"It prevents a lower design-assurance-level application that hangs or overruns from stealing time or memory from a higher-level application sharing the same processor","correct":true},{"id":"b","text":"It increases the processor clock speed for critical applications","correct":false},{"id":"c","text":"It removes the need for a safety assessment on shared hardware","correct":false}]',
     '{"B1","B2"}'),

    (s13_id, 'Under DO-178C, how does the traceability requirement change with design assurance level?',
     '[{"id":"a","text":"It increases with level; Level E requires none at all, and Level A requires the most","correct":true},{"id":"b","text":"It is identical at every level","correct":false},{"id":"c","text":"It decreases with level; Level A requires none at all","correct":false}]',
     '{"B1","B2"}'),

    (s13_id, 'Loading software onto an aircraft is best described as:',
     '[{"id":"a","text":"A routine computer operation that any crew member may perform","correct":false},{"id":"b","text":"A maintenance task requiring an approved procedure, correct approved media, a competent authorised person, and an entry in the aircraft technical record","correct":true},{"id":"c","text":"A housekeeping activity not requiring any record entry","correct":false}]',
     '{"B1","B2"}'),

    (s13_id, 'After software has been loaded onto an aircraft system, what must be done?',
     '[{"id":"a","text":"The loaded part number must be verified against the approved configuration and recorded","correct":true},{"id":"b","text":"Nothing further, provided the load appeared to complete successfully","correct":false},{"id":"c","text":"The previous software version must be immediately deleted from all records","correct":false}]',
     '{"B1","B2"}'),

    (s13_id, 'If a software load onto an aircraft system is found to be incorrect or corrupted, the correct action is to:',
     '[{"id":"a","text":"Simply reload it and continue, since reloading resolves the issue","correct":false},{"id":"b","text":"Treat it as a defect, record it, and rectify it before flight","correct":true},{"id":"c","text":"Ignore it unless the aircraft fails a subsequent flight test","correct":false}]',
     '{"B1","B2"}'),

    (s13_id, 'Interrupting a software data load, for example by pulling power or disconnecting the loader, can result in:',
     '[{"id":"a","text":"A computer left with a partial program in memory, which some units cannot recover from on the aircraft, becoming a workshop item","correct":true},{"id":"b","text":"No consequence, since the load simply restarts automatically","correct":false},{"id":"c","text":"An automatic rollback to a certified backup version with no further action needed","correct":false}]',
     '{"B1","B2"}');

END $$;
