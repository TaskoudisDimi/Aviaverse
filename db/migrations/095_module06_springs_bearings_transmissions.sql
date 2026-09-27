-- Module 06: Materials and Hardware — Springs, Bearings, Transmissions
-- Source: EASA Part-66 Module 6 official study notes, Sub-Modules 6.7, 6.8, 6.9

DO $$
DECLARE
    m06_id INT;
    s7_id  INT;
    s8_id  INT;
    s9_id  INT;
BEGIN
    SELECT id INTO m06_id FROM easa_modules WHERE code = 'M06';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M06.7') THEN
        RAISE NOTICE 'M06.7-M06.9 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 06.7: Springs
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m06_id, 'M06.7', 'Springs',
        $cnt$
# Springs

## What a Spring Is For

A spring is a component designed to deflect elastically under load and to return to its original shape when the load is removed. What it is really doing is storing energy and releasing it in a controlled way. Springs are used for:

- **Applying and releasing a force** — valve springs, brake return, servo centring.
- **Absorbing shock and damping vibration** — undercarriage, engine mounts, seat cushions.
- **Measuring force** — spring balance, tensiometer, pressure relief valve.
- **Maintaining contact and taking up slack** — cable tension regulators, cam followers, electrical contacts.
- **Providing a fail-safe** — a spring that returns a valve or actuator to a safe position when power is lost.

## Types of Spring

| Type | Description | Typical Application |
|------|-------------|----------------------|
| **Helical compression** | Coil of round or square wire with open coils; shortens under load | Valve springs, undercarriage, mechanical linkages, relief valves |
| **Helical tension (extension)** | Coils closed together, usually with hooks or loops at the ends | Return springs, brake linkages, control system centring |
| **Helical torsion** | Coil loaded by twisting about the coil axis; the ends form legs | Hinges, access door mechanisms, clothes-peg action |
| **Flat (leaf/clip)** | A flat strip formed to shape; deflects by bending | Retaining clips, brushes, contacts, latch springs, tab washers |
| **Leaf (laminated)** | Several flat strips stacked; strong and damped by inter-leaf friction | Light aircraft undercarriage legs, tail springs |
| **Spiral (clock)** | Flat strip wound in a flat spiral; stores energy through many turns | Clocks, instruments, recoil mechanisms, cable drums, inertia reels |
| **Belleville (coned disc)** | A dished washer; very high load, very small deflection; stackable in series or parallel to tune rate | Clutch packs, high-load bolted joints, valve seats |
| **Torsion bar** | A straight bar loaded in torsion; one end fixed, one end twisted | Undercarriage torsion suspension, door and control mechanisms |
| **Wave / garter / constant force** | Specialised forms | Bearing preload, seals, spring drives |

## Materials

A spring material needs a high elastic limit, high fatigue strength and, usually, corrosion resistance.

| Material | Why It Is Chosen |
|----------|-------------------|
| High carbon / music (piano) wire, SAE 1095 | Cheap, very high tensile strength, excellent for small springs. Not corrosion resistant |
| Chrome-vanadium SAE 6150 | Tough, resists shock and fatigue, works at moderately elevated temperature. Valve and heavy-duty springs |
| Chrome-silicon | High strength and shock resistance at higher temperature |
| Stainless steel (302, 17-7 PH) | Corrosion resistant; used where the spring is exposed |
| Inconel / Nimonic | Retains spring properties at high temperature — engines |
| Phosphor bronze / beryllium copper | Non-magnetic, non-sparking, corrosion resistant, good conductor — instruments, electrical contacts |

Springs are formed cold (small sizes) or hot (large sizes) and are then heat treated and stress relieved. Many are shot peened to improve fatigue life, and given a protective finish (cadmium, zinc, epoxy paint).

## Spring Terms and Characteristics

- **Free length** — length with no load applied.
- **Solid (compressed) length** — the length when all coils are touching.
- **Pitch** — the distance between adjacent coil centres.
- **Coil (mean) diameter and wire diameter**; spring index = coil diameter / wire diameter.
- **Number of active coils** — the coils that actually deflect.
- **Spring rate (stiffness)** — the load required per unit of deflection, e.g. N/mm or lb/in. A "stiff" spring has a high rate.

Within the elastic range the relationship is linear: **load = rate × deflection (Hooke's Law)**. Double the load, double the deflection — until the elastic limit.

- **Initial tension** — the built-in tension in a close-coiled extension spring that must be overcome before the coils start to separate.
- **End types on compression springs** — plain, plain ground, closed (squared), closed and ground. Ground ends sit square and load evenly.
- **Hand** — right-hand or left-hand coiling. Springs nested inside each other are wound in opposite hands so their coils cannot interlock.
- **Set** — permanent shortening or lengthening after use; measured by comparing free length with the specification.
- **Fatigue** — the usual failure mode of a spring, always starting at a surface defect, a nick or a corrosion pit.

## Inspection

- Check free length and, where specified, the load at a given length on a spring tester — a spring that has taken a set is scrap.
- Check squareness of the ends and any bow in the body.
- Look for cracks, nicks, scores, wear at the ends and coil-to-coil rubbing.
- Look for corrosion — a pit on a spring is a fatigue crack starter, and a spring works at high stress by definition.
- Check the ends, hooks and loops carefully — that is where extension springs break.
- Never stretch, shorten, grind or heat a spring to "adjust" it; and never substitute a spring by appearance. Two identical-looking springs can have completely different rates.

## Fast Revision

- Spring rate = load per unit deflection. Belleville = huge load, tiny deflection.
- Nested springs are wound opposite hands so they cannot interlock.
        $cnt$,
        7
    ) RETURNING id INTO s7_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 06.8: Bearings
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m06_id, 'M06.8', 'Bearings',
        $cnt2$
# Bearings

## Purpose and Loads

A bearing supports a moving part and reduces the friction between it and its housing, so that the load is carried with the least wear, the least heat and the least power loss. It also locates the shaft accurately — a bearing that has worn is a bearing that has stopped locating.

| Load Type | Direction | Example |
|-----------|-----------|---------|
| **Radial** | At right angles to the shaft axis | A shaft in a plain bush; a wheel on its axle |
| **Axial (thrust)** | Along the shaft axis | Propeller thrust, turbine shaft thrust |
| **Combined (radial + thrust)** | Both together | Wheel bearings in a turn, angular contact bearings, gearbox shafts |
| **Reversing / oscillating** | Load or motion changes direction | Control surface hinges, rod ends |

Friction is roughly proportional to load and to the coefficient of friction. Rolling friction is far lower than sliding friction — that is the entire argument for a ball bearing.

## Plain Bearings

The simplest form — a shaft sliding directly in a bearing surface. Also called a **journal bearing** (the shaft area is the journal) or a **bush/bushing** in small sizes.

- They carry radial loads mainly, but thrust washers and flanged bushes deal with axial loads.
- **Advantages**: cheap, compact, quiet, tolerant of shock and dirt, can take very high loads over a large area.
- **Disadvantages**: higher friction, needs a proper lubricant supply, and it wears rather than fails suddenly.

### Materials

- **White metal (babbitt)** — a soft tin or lead based alloy on a steel backing. Soft enough to embed dirt and to conform to the shaft; melts and smears before it destroys the shaft, which is a design feature.
- **Lead-bronze, copper-lead on a steel shell** — engine main and big-end bearings; often silver plated and lead-tin flashed.
- **Aluminium-tin** — modern engine bearing material.
- **Sintered bronze ("Oilite")** — a porous bronze bush impregnated with oil. The heat of friction draws the oil to the surface. Self-lubricating; used in accessory drives, and must not be reamed (it closes the pores).
- **PTFE / fabric lined** — a self-lubricating liner bonded into a metal shell; used for control surface hinges, rod ends and anywhere greasing is impractical.
- **Spherical (self-aligning) plain bearings and rod ends** — a ball inside a race, allowing angular misalignment; found throughout flight control linkages.

### Lubrication Regimes

- **Hydrodynamic** — rotation drags oil into a converging wedge, lifting the shaft off the surface completely. The ideal condition; metal never touches metal.
- **Hydrostatic** — the oil film is created by external pressure, so it works at zero speed.
- **Boundary** — only a thin adsorbed film; occurs at start-up, at low speed and at very high load. Most wear happens here, which is why engine wear happens on starting.

## Rolling Element Bearings

### Construction

- Inner race (cone), outer race (cup), the rolling elements (balls or rollers), and a **cage** (retainer/separator) which keeps the elements evenly spaced and stops them rubbing each other.
- May be **shielded** (metal shield, keeps dirt out) or **sealed** (rubber seal, keeps grease in — usually lubricated for life).
- Races are made of hard, clean bearing steel (SAE 52100, or corrosion resistant/ceramic in special cases), heat treated and ground to a mirror finish.

### Ball Bearings

- **Deep groove (Conrad)** — radial load plus some thrust in either direction. The general-purpose bearing.
- **Angular contact** — the races are shouldered so the load line runs at an angle; takes a heavy thrust in one direction plus radial. Usually fitted in opposed pairs and preloaded. Used for propeller thrust and gearbox shafts.
- **Self-aligning** (double row on a spherical outer race) — tolerates shaft misalignment.
- **Thrust ball bearing** — flat washer-like races; pure axial load only, at low speed.
- **Advantages**: very low friction, minimal maintenance, high speed capability, takes combined loads. **Disadvantages**: point contact means high local stress, low tolerance of shock and dirt, and it can fail suddenly.

### Roller Bearings

- **Cylindrical (straight) roller** — line contact instead of point contact, so a much higher radial load capacity, but essentially no thrust capacity. Used for heavily loaded shafts and crankshafts in radial engines.
- **Tapered roller** — the rollers and races are conical, so the bearing takes heavy radial and axial loads together. The classic aircraft wheel bearing, fitted in opposed pairs and adjusted for the correct preload/end float.
- **Needle roller** — long, small-diameter rollers; very high radial capacity in a very small radial space. Rocker arms, universal joints, gudgeon pins.
- **Spherical roller** — barrel-shaped rollers on a spherical race; heavy loads with self-alignment.

## Handling, Fitting and Inspection

**The four commandments of bearing handling:**

1. Keep them clean, in their sealed packaging until the moment of fitting. A bearing is a precision instrument, and grit is the enemy.
2. Keep them dry and corrosion protected — never leave a washed bearing on the bench uncoated.
3. Never spin a bearing with compressed air. It will overspeed with no lubrication, damage the races, and can throw the elements out at lethal speed.
4. Fit with the correct pullers, drifts and presses — push on the race that is an interference fit, never through the rolling elements.

- The rotating race normally has the interference (tight) fit, and the stationary race a transition or clearance fit. Heat the housing or chill the bearing where the manual calls for it — never heat a bearing with a flame.
- Preload and end float are specified and must be set with the correct method — rolling the bearing while torquing, then backing off to the specified figure and locking.
- Lubricate with the correct grease or oil only. Mixing greases can turn them liquid or solid.

### Inspection — What the Damage Tells You

| Defect | Appearance | Cause |
|--------|------------|-------|
| Brinelling | Evenly spaced dents in the race at the element spacing | Static shock load, or hammering the bearing on/off through the elements |
| False brinelling | Polished or fretted marks at element spacing | Vibration while stationary — typically during transport or long storage |
| Spalling / flaking | Metal flaking out of the race surface | Normal fatigue at end of life, or overload |
| Galling / smearing | Metal transferred and torn | Skidding elements, insufficient preload or lubrication |
| Discolouration (blue/brown) | Heat tint on races and elements | Overheating — loss of lubrication or excessive preload |
| Corrosion / staining | Rust pitting on races | Water ingress, condensation, storage without protection |
| Cage damage | Worn, cracked or distorted separator | Misalignment, overspeed, contamination |
| Contamination | Gritty feel, scoring | Dirty assembly or a failed seal |

The **field check**: clean, dry, then rotate slowly by hand under light axial load. It should feel smooth and continuous. Any roughness, catching, notchiness or unusual noise = reject.

Also check the shaft and housing — a bearing that has spun in its housing has damaged the housing, and a new bearing alone will not fix it.
        $cnt2$,
        8
    ) RETURNING id INTO s8_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 06.9: Transmissions
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m06_id, 'M06.9', 'Transmissions',
        $cnt3$
# Transmissions

## Why Gears

A gear train exists to change speed, torque, direction or plane of rotation between a driving and a driven shaft — and it does it positively, with no slip.

- Speed and torque trade against each other: if you halve the speed you roughly double the torque (less losses). Power in = power out, minus friction.
- That is why a propeller reduction gearbox exists — the engine is efficient at high rpm, the propeller is efficient (and stays subsonic at the tip) at low rpm.

## Gear Types

| Type | Description | Character and Use |
|------|-------------|---------------------|
| **Spur** | Straight teeth, parallel shafts | Simplest and most efficient; noisy at speed, no end thrust. Accessory drives, general gearing |
| **Helical** | Teeth cut at an angle, parallel shafts | More teeth in mesh — stronger, smoother, quieter, but generates axial thrust that must be taken by a thrust bearing |
| **Double helical / herringbone** | Two opposing helices | All the benefits of helical with the thrust cancelled out |
| **Internal (annulus)** | Teeth on the inside of a ring | Compact, same direction of rotation; the outer member of an epicyclic train |
| **Bevel (straight)** | Cone-shaped, shafts at an angle (usually 90 deg) | Changes the plane of drive. Differentials, accessory drives |
| **Spiral bevel** | Curved bevel teeth | Smoother and stronger than straight bevel |
| **Hypoid** | Bevel-like but the axes do not intersect | Allows an offset shaft; strong, but needs special extreme-pressure oil |
| **Worm and wheel** | A screw driving a wheel, shafts at 90 deg | Very large reduction in one step; can be made self-locking (the wheel cannot drive the worm) — flap and trim actuators |
| **Rack and pinion** | A gear driving a toothed bar | Converts rotation to straight-line motion, and vice versa |
| **Epicyclic (planetary)** | Sun, planets in a carrier, and an annulus | Large reduction in a compact, coaxial, well-balanced package — propeller and turbine reduction gearboxes |

## Gear Terms

- **Pitch circle** — the imaginary circle at which two gears effectively roll together without slipping. All gear geometry is quoted from it.
- **Addendum** — the tooth height above the pitch circle. **Dedendum** — the depth below it. **Clearance** is the small gap at the bottom of the mesh.
- **Module** (metric) = pitch circle diameter / number of teeth. **Diametral pitch** (inch) = number of teeth / pitch circle diameter. Two gears can only mesh if they have the same module or diametral pitch and the same pressure angle.
- **Pressure angle** — the angle of the line of action, commonly 14.5 or 20 degrees.
- **Backlash (lash)** — the small deliberate clearance between the mating tooth flanks. Necessary for lubrication and thermal expansion; measured with a dial gauge or feeler and lead wire. Too little = binding and overheating; too much = shock loading, noise and wear.
- **Pinion** — the smaller of two meshing gears. **Wheel** — the larger.
- **Idler gear** — a gear between the driver and driven gear. It changes the direction of the output but has no effect on the overall gear ratio.
- **Compound gear** — two gears of different sizes fixed on the same shaft, so they turn together; used to get a large ratio in stages.
- **Layshaft (countershaft)** — an intermediate shaft carrying compound gears.
- **Step-down drive** — output slower than input (reduction, torque up). **Step-up drive** — output faster (torque down).

## Gear Ratios

**The one formula to remember:** Gear ratio = teeth on the DRIVEN gear / teeth on the DRIVING gear (equivalently: driving speed / driven speed). Ratio greater than 1 = a reduction (slower, more torque). Less than 1 = step-up.

- **Example**: driving pinion 20 teeth, driven wheel 60 teeth. Ratio = 60/20 = 3:1 reduction. If the input runs at 2,400 rpm the output runs at 800 rpm, and the torque is roughly tripled.
- **Compound train**: multiply the ratios of each stage. Two 3:1 stages give 9:1 overall.
- **Idler**: 20T driver, 35T idler, 60T driven. The overall ratio is still 60/20 = 3:1. The idler only reverses the direction (and can bridge a distance).
- **Direction**: two external gears in mesh turn in opposite directions; an external gear inside an internal gear turns in the same direction.
- **Epicyclic ratios** depend on which member is held: hold the annulus and drive the sun, and the carrier output ratio is (annulus teeth + sun teeth) / sun teeth.

## Mesh, Wear Patterns and Maintenance

- Tooth contact (mesh) pattern is checked by coating a few teeth with engineer's marking compound, rotating the gears under a light braking load, and examining the transferred pattern.
- The pattern should sit in the centre of the tooth flank, slightly toward the toe on bevel gears, and cover most of the profile without running out to the edges.
- A pattern high, low, at the toe or at the heel indicates incorrect shimming or backlash — corrected by moving the pinion or the wheel as the manual directs.
- Wear you should be able to name: normal (polished) wear, pitting (fatigue of the surface), spalling, scoring/scuffing (lubrication breakdown), abrasive wear (contamination), tooth-end chipping, and root fatigue cracks — which are the ones that matter, because a broken tooth destroys the gearbox.
- Gearbox health is monitored by magnetic chip detectors, oil filter inspection and spectrometric oil analysis (SOAP). Metal in the oil tells you what is failing before it lets go.
- Gears are lubricated to carry away heat, prevent metal contact and flush away debris — and to prevent corrosion when parked. Use only the specified oil, especially for hypoid gears.

## Chains and Sprockets

- A roller chain running on toothed sprockets transmits drive positively over a longer distance than gears, with no slip and less precision required in shaft alignment.
- Construction: pins, bushes, rollers, and inner and outer side plates. Types: simple, duplex and triplex (multiple strands), and silent (inverted tooth) chain.
- Used for flap and trim drives, cargo door mechanisms, engine timing and control runs.
- Maintenance: correct tension (a specified amount of sag or a spring tensioner), correct alignment of the sprockets, and lubrication.
- Chain "stretch" is really wear in the pins and bushes, which increases the effective pitch and makes the chain ride up the sprocket teeth. Checked by measuring a number of links against a limit, or by lifting the chain off the sprocket. Worn chains and worn sprockets are replaced together.
- Sprocket wear shows as hooked, thin teeth — a clear sign the chain has been run loose or worn.

## Belts and Pulleys

- **Flat belt** — simple, cheap, tolerant of misalignment, but relies on friction and will slip.
- **V-belt** — wedges into the groove, so a much greater friction grip for the same tension. Should ride on the sides of the groove and not touch the bottom — if it is bottoming, the belt or the pulley is worn.
- **Toothed (timing/synchronous) belt** — positive drive with no slip, so it can be used for timing and for accurate positioning. Light, quiet, needs no lubrication.
- Belt drives give quiet running and act as a shock absorber and slip clutch, protecting the driven unit — and this is why they are used for many accessory drives.
- Maintenance: correct tension (measured with a belt tension gauge — too slack slips and burns, too tight destroys the bearings), alignment of pulleys, and inspection for cracks, glazing, fraying, missing teeth, oil contamination and wear of the pulley grooves.
- Multiple belts on one drive are replaced as a matched set, never singly.
        $cnt3$,
        9
    ) RETURNING id INTO s9_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M06.7 Springs (14 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s7_id, 'What is a spring designed to do?',
     '[{"id":"a","text":"Deflect elastically under load and return to its original shape when the load is removed, storing and releasing energy","correct":true},{"id":"b","text":"Deform permanently under load to absorb a single shock only","correct":false},{"id":"c","text":"Increase the friction between two moving parts","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, 'Which type of spring has coils closed together, usually with hooks or loops at the ends?',
     '[{"id":"a","text":"Helical compression spring","correct":false},{"id":"b","text":"Helical tension (extension) spring","correct":true},{"id":"c","text":"Helical torsion spring","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, 'A helical torsion spring is loaded by:',
     '[{"id":"a","text":"Twisting about the coil axis, with the ends forming legs","correct":true},{"id":"b","text":"Straight-line compression along the coil axis","correct":false},{"id":"c","text":"Bending of a single flat strip only","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, 'A leaf (laminated) spring, used in light aircraft undercarriage legs, consists of:',
     '[{"id":"a","text":"Several flat strips stacked together, damped by inter-leaf friction","correct":true},{"id":"b","text":"A single coil of round wire wound in an open helix","correct":false},{"id":"c","text":"A flat strip wound into a flat spiral","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, 'A Belleville (coned disc) spring is characterised by:',
     '[{"id":"a","text":"Very high load with very small deflection, and can be stacked in series or parallel to tune the rate","correct":true},{"id":"b","text":"Very low load with very large deflection only","correct":false},{"id":"c","text":"A constant force output regardless of deflection","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, 'A torsion bar spring is:',
     '[{"id":"a","text":"A straight bar loaded in torsion, one end fixed and one end twisted","correct":true},{"id":"b","text":"A coil spring loaded purely in axial compression","correct":false},{"id":"c","text":"A dished washer stacked with others in series","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, 'Which spring material is cheap, has very high tensile strength, is excellent for small springs, but is not corrosion resistant?',
     '[{"id":"a","text":"High carbon / music (piano) wire, SAE 1095","correct":true},{"id":"b","text":"Stainless steel (302, 17-7 PH)","correct":false},{"id":"c","text":"Inconel / Nimonic","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, 'Which spring material is chosen because it retains its spring properties at high temperature, and is used in engines?',
     '[{"id":"a","text":"Phosphor bronze / beryllium copper","correct":false},{"id":"b","text":"Inconel / Nimonic","correct":true},{"id":"c","text":"Chrome-silicon","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, 'Phosphor bronze and beryllium copper are chosen as spring materials for instruments and electrical contacts because they are:',
     '[{"id":"a","text":"Non-magnetic, non-sparking, corrosion resistant, and good conductors","correct":true},{"id":"b","text":"The materials with the highest possible tensile strength","correct":false},{"id":"c","text":"Suitable only for very high-temperature valve springs","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, 'Spring rate (stiffness) is defined as:',
     '[{"id":"a","text":"The load required per unit of deflection, e.g. N/mm","correct":true},{"id":"b","text":"The total energy stored at the solid (compressed) length","correct":false},{"id":"c","text":"The number of active coils in the spring","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, 'Within the elastic range, Hooke''s Law states that:',
     '[{"id":"a","text":"Load = rate x deflection, a linear relationship, until the elastic limit","correct":true},{"id":"b","text":"Load is inversely proportional to deflection at all times","correct":false},{"id":"c","text":"Deflection is completely independent of the applied load","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, '"Initial tension" in a close-coiled extension spring refers to:',
     '[{"id":"a","text":"The built-in tension that must be overcome before the coils start to separate","correct":true},{"id":"b","text":"The tension applied during the heat treatment process","correct":false},{"id":"c","text":"The tension present only once the spring reaches its solid length","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, 'Why are springs that are nested inside each other wound in opposite hands (one right-hand, one left-hand)?',
     '[{"id":"a","text":"So their coils cannot interlock","correct":true},{"id":"b","text":"To double the combined spring rate","correct":false},{"id":"c","text":"To reduce the spring index of the inner spring","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, 'What is the usual failure mode of a spring, and where does it normally start?',
     '[{"id":"a","text":"Sudden brittle fracture, starting at the centre of the wire","correct":false},{"id":"b","text":"Fatigue, always starting at a surface defect, a nick or a corrosion pit","correct":true},{"id":"c","text":"Plastic yielding, starting only at the end hooks","correct":false}]',
     '{"B1","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M06.8 Bearings (14 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s8_id, 'What is the primary purpose of a bearing?',
     '[{"id":"a","text":"To support a moving part, reduce friction, and locate the shaft accurately with least wear, heat and power loss","correct":true},{"id":"b","text":"To increase friction so that a shaft cannot rotate accidentally","correct":false},{"id":"c","text":"To seal lubricant inside a housing only, with no load-carrying function","correct":false}]',
     '{"B1","B2"}'),

    (s8_id, 'A radial load on a bearing acts:',
     '[{"id":"a","text":"At right angles to the shaft axis, as in a shaft in a plain bush or a wheel on its axle","correct":true},{"id":"b","text":"Along the shaft axis, as in propeller thrust","correct":false},{"id":"c","text":"Only when the load or motion is reversing or oscillating","correct":false}]',
     '{"B1","B2"}'),

    (s8_id, 'An axial (thrust) load on a bearing acts:',
     '[{"id":"a","text":"At right angles to the shaft axis","correct":false},{"id":"b","text":"Along the shaft axis, as in propeller thrust or turbine shaft thrust","correct":true},{"id":"c","text":"In a direction that constantly reverses","correct":false}]',
     '{"B1","B2"}'),

    (s8_id, 'Why should a bearing never be spun with compressed air?',
     '[{"id":"a","text":"It will overspeed with no lubrication, damage the races, and can throw the elements out at lethal speed","correct":true},{"id":"b","text":"It will over-lubricate the races and cause them to seize","correct":false},{"id":"c","text":"It has no harmful effect, but wastes compressed air","correct":false}]',
     '{"B1","B2"}'),

    (s8_id, 'A plain bearing, where a shaft slides directly in a bearing surface, is also known as:',
     '[{"id":"a","text":"A journal bearing, or a bush/bushing in small sizes","correct":true},{"id":"b","text":"A deep groove (Conrad) bearing","correct":false},{"id":"c","text":"An angular contact bearing","correct":false}]',
     '{"B1","B2"}'),

    (s8_id, 'Which plain bearing material is soft enough to embed dirt and conform to the shaft, and is designed to melt and smear before it destroys the shaft?',
     '[{"id":"a","text":"Sintered bronze (Oilite)","correct":false},{"id":"b","text":"White metal (babbitt)","correct":true},{"id":"c","text":"PTFE / fabric lined material","correct":false}]',
     '{"B1","B2"}'),

    (s8_id, 'Sintered bronze ("Oilite") bearings:',
     '[{"id":"a","text":"Are self-lubricating porous bronze bushes impregnated with oil, and must not be reamed as this closes the pores","correct":true},{"id":"b","text":"Are silver plated and lead-tin flashed, used for engine big-end bearings","correct":false},{"id":"c","text":"Require continuous pressure lubrication and cannot be self-lubricating","correct":false}]',
     '{"B1","B2"}'),

    (s8_id, 'PTFE / fabric-lined plain bearings are typically used:',
     '[{"id":"a","text":"For control surface hinges, rod ends and anywhere greasing is impractical","correct":true},{"id":"b","text":"Only for engine main and big-end bearings under heavy pressure lubrication","correct":false},{"id":"c","text":"Only where the bearing must be regreased daily","correct":false}]',
     '{"B1","B2"}'),

    (s8_id, 'In the hydrodynamic lubrication regime:',
     '[{"id":"a","text":"Rotation drags oil into a converging wedge, lifting the shaft completely off the surface so metal never touches metal","correct":true},{"id":"b","text":"The oil film is created entirely by external pressure, so it works even at zero speed","correct":false},{"id":"c","text":"Only a thin adsorbed oil film is present, occurring at very high load","correct":false}]',
     '{"B1","B2"}'),

    (s8_id, 'Most bearing wear occurs during which lubrication regime, which is why engine wear happens on starting?',
     '[{"id":"a","text":"Hydrodynamic","correct":false},{"id":"b","text":"Hydrostatic","correct":false},{"id":"c","text":"Boundary","correct":true}]',
     '{"B1","B2"}'),

    (s8_id, 'In a rolling element bearing, the component that keeps the rolling elements evenly spaced and stops them rubbing each other is the:',
     '[{"id":"a","text":"Race","correct":false},{"id":"b","text":"Cage (retainer/separator)","correct":true},{"id":"c","text":"Shield","correct":false}]',
     '{"B1","B2"}'),

    (s8_id, 'A deep groove (Conrad) ball bearing is described as:',
     '[{"id":"a","text":"The general-purpose bearing, taking radial load plus some thrust in either direction","correct":true},{"id":"b","text":"Designed for pure axial load only, at low speed","correct":false},{"id":"c","text":"Used only where large shaft misalignment must be tolerated","correct":false}]',
     '{"B1","B2"}'),

    (s8_id, 'Angular contact ball bearings, used for propeller thrust and gearbox shafts, are typically fitted:',
     '[{"id":"a","text":"Singly, taking radial load only","correct":false},{"id":"b","text":"In opposed pairs and preloaded, taking a heavy thrust in one direction plus radial load","correct":true},{"id":"c","text":"In series of three or more with no preload","correct":false}]',
     '{"B1","B2"}'),

    (s8_id, 'Tapered roller bearings, the classic aircraft wheel bearing, are:',
     '[{"id":"a","text":"Fitted singly, taking radial load only, with no adjustment","correct":false},{"id":"b","text":"Fitted in opposed pairs and adjusted for correct preload/end float, taking heavy radial and axial loads together","correct":true},{"id":"c","text":"Sealed for life with no maintenance possible","correct":false}]',
     '{"B1","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M06.9 Transmissions (14 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s9_id, 'A gear train exists to:',
     '[{"id":"a","text":"Change speed, torque, direction or plane of rotation between a driving and driven shaft, positively with no slip","correct":true},{"id":"b","text":"Increase friction between two shafts to slow them down","correct":false},{"id":"c","text":"Convert rotary motion into heat for de-icing purposes","correct":false}]',
     '{"B1","B2"}'),

    (s9_id, 'Why does a propeller reduction gearbox exist?',
     '[{"id":"a","text":"Because the engine is efficient at high rpm, while the propeller is efficient (and stays subsonic at the tip) at low rpm","correct":true},{"id":"b","text":"Because gears are always cheaper to manufacture than a direct drive shaft","correct":false},{"id":"c","text":"Because propellers are structurally unable to exceed 800 rpm","correct":false}]',
     '{"B1","B2"}'),

    (s9_id, 'A worm and wheel gear set, used for flap and trim actuators, connects shafts at:',
     '[{"id":"a","text":"90 degrees, and can be made self-locking so the wheel cannot drive the worm","correct":true},{"id":"b","text":"Parallel, and can be made self-locking so the wheel cannot drive the worm","correct":false},{"id":"c","text":"90 degrees, and is always reversible in either direction","correct":false}]',
     '{"B1","B2"}'),

    (s9_id, 'An epicyclic (planetary) gear train, used in propeller and turbine reduction gearboxes, consists of:',
     '[{"id":"a","text":"A pinion and a rack only","correct":false},{"id":"b","text":"A sun gear, planets in a carrier, and an annulus, giving a large reduction in a compact, coaxial package","correct":true},{"id":"c","text":"Two straight bevel gears set at right angles","correct":false}]',
     '{"B1","B2"}'),

    (s9_id, 'What effect does an idler gear have on the overall gear ratio of a train?',
     '[{"id":"a","text":"It always increases the ratio","correct":false},{"id":"b","text":"None — it only changes the direction of the output and can bridge a distance","correct":true},{"id":"c","text":"It always halves the ratio","correct":false}]',
     '{"B1","B2"}'),

    (s9_id, 'Backlash (lash) in a gear mesh is:',
     '[{"id":"a","text":"The small deliberate clearance between mating tooth flanks, needed for lubrication and thermal expansion","correct":true},{"id":"b","text":"The total tooth height measured above the pitch circle","correct":false},{"id":"c","text":"Always a manufacturing fault that must be eliminated completely","correct":false}]',
     '{"B1","B2"}'),

    (s9_id, 'A driving pinion has 20 teeth and the driven wheel has 60 teeth. What is the gear ratio, and is it a reduction or a step-up?',
     '[{"id":"a","text":"3:1, a reduction","correct":true},{"id":"b","text":"1:3, a step-up","correct":false},{"id":"c","text":"3:1, a step-up","correct":false}]',
     '{"B1","B2"}'),

    (s9_id, 'A compound gear train has two stages, each with a ratio of 3:1. What is the overall ratio?',
     '[{"id":"a","text":"6:1","correct":false},{"id":"b","text":"3:1","correct":false},{"id":"c","text":"9:1","correct":true}]',
     '{"B1","B2"}'),

    (s9_id, 'When two external gears are in mesh, their directions of rotation are:',
     '[{"id":"a","text":"Opposite to each other","correct":true},{"id":"b","text":"The same as each other","correct":false},{"id":"c","text":"Dependent entirely on which gear has more teeth","correct":false}]',
     '{"B1","B2"}'),

    (s9_id, 'On bevel gears, the correct tooth-contact (mesh) pattern should sit in the centre of the tooth flank, slightly toward the:',
     '[{"id":"a","text":"Heel","correct":false},{"id":"b","text":"Root","correct":false},{"id":"c","text":"Toe","correct":true}]',
     '{"B1","B2"}'),

    (s9_id, 'Which gear tooth defect is considered the most significant during inspection, because it can lead to a broken tooth that destroys the gearbox?',
     '[{"id":"a","text":"Normal (polished) wear","correct":false},{"id":"b","text":"Root fatigue cracks","correct":true},{"id":"c","text":"Light surface pitting","correct":false}]',
     '{"B1","B2"}'),

    (s9_id, 'Gearbox health is monitored in service by:',
     '[{"id":"a","text":"Magnetic chip detectors, oil filter inspection, and spectrometric oil analysis (SOAP)","correct":true},{"id":"b","text":"Measuring backlash with a feeler gauge as the only method","correct":false},{"id":"c","text":"Listening for gear whine during ground runs as the only method","correct":false}]',
     '{"B1","B2"}'),

    (s9_id, 'What advantage does a toothed (timing/synchronous) belt have over a flat or V-belt?',
     '[{"id":"a","text":"It gives positive drive with no slip, so it can be used for timing and accurate positioning","correct":true},{"id":"b","text":"It provides more shock-absorbing capability than any other belt type","correct":false},{"id":"c","text":"It requires heavy lubrication to operate correctly","correct":false}]',
     '{"B1","B2"}'),

    (s9_id, 'Chain "stretch" is actually caused by:',
     '[{"id":"a","text":"Permanent elastic stretching of the side plates","correct":false},{"id":"b","text":"Wear in the pins and bushes, which increases the effective pitch and makes the chain ride up the sprocket teeth","correct":true},{"id":"c","text":"Thermal expansion of the rollers during operation","correct":false}]',
     '{"B1","B2"}');

END $$;
