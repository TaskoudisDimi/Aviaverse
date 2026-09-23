-- Module 17: Propeller (B1/B2) — Propeller Maintenance
-- Source: EASA Part-66 Module 17 official textbook (IKAROS Aviation Training Centre, IK M17, Issue IK01 - Oct 2012), Chapter 5 Section 1

DO $$
DECLARE
    m17_id INT;
    s1_id  INT;
BEGIN
    SELECT id INTO m17_id FROM easa_modules WHERE code = 'M17';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M17.5') THEN
        RAISE NOTICE 'M17.5 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 17.5: Propeller Maintenance
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m17_id, 'M17.5', 'Propeller Maintenance',
        $cnt$
# Propeller Maintenance

## Propeller Balancing — Introduction

A propeller is a large rotating mass and any imbalance will be felt as vibration. Propeller balance is **very important** — even the slightest imbalance will cause vibration, which could possibly lead to engine failure or extensive damage to the propeller. Apart from the dangers of damage to the aircraft, vibrations make the environment inside the aircraft uncomfortable for passengers and crew and can affect sensitive or delicate instruments.

The notes address propeller balance under three headings:
- **Static imbalance**
- **Dynamic imbalance**
- **Aerodynamic correction**

Propellers are balanced both statically and dynamically:
- A propeller is **statically balanced** when the propeller's centre of gravity coincides with its axis of rotation.
- A propeller is **dynamically balanced** when the centre of gravity of the blades rotates in the same plane of rotation.

## Static Balance

Static balance is achieved by using either the **knife edge method** or the **suspension method**. Of the two static balancing methods, the knife edge method is simpler and more accurate.

To balance a propeller using the knife edge method, a test stand consisting of two hardened steel edges must be used. The test stand must be located in a room or area that is **free from any air motion or heavy vibration**.

Before checking a propeller's balance, it is essential to verify that the **blade angles are all the same**. If the blade angles are correct, the propeller's balance is checked by:
- Inserting a bushing in the propeller hub bore hole.
- Inserting a mandrel or arbour through the bushing to support the propeller on the balance knives.
- Placing the propeller assembly so the ends of the arbour are supported on the test stand, free to rotate.

Once mounted, the propeller should be checked for both **horizontal** and **vertical** balance.

### Vertical Balance Check (Two-Bladed Propeller)

- Position one blade in the vertical position, then repeat with the blade positions reversed.
- If the propeller is balanced vertically, it will remain in the vertical position regardless of which blade is pointing up.
- If a vertical imbalance exists, the propeller will tend to come to rest in a **horizontal position**.

### Horizontal Balance Check (Two-Bladed Propeller)

- Position the propeller horizontally with both blades sticking straight out. Any rotation from this position indicates a heavy blade.
- If the propeller is horizontally balanced, it will remain in the horizontal position.
- If a horizontal imbalance exists, one blade will tend to move downward, causing the propeller to come to rest in a **vertical position**.

A properly balanced two-bladed propeller has no tendency to rotate in any of the test positions, and if it balances perfectly in all described positions it should also balance perfectly in all intermediate positions — these may be checked to verify the original result.

### Static Balancing of a Three-Bladed Propeller

A three-bladed propeller requires three basic test positions and is properly balanced when **each blade can be placed in the 6 o'clock position with no tendency to rotate**:
- Rotate the propeller until blade No.1 is pointing downward.
- Place blade No.2 in the downward position.
- Place blade No.3 in the downward position.

A properly balanced three-bladed propeller has no tendency to rotate from any of the three positions.

### Out-of-Balance Repairs

If, during a static balance check, a propeller shows a definite tendency to rotate, certain corrections are allowed:
- The **addition of permanent fixed weights** is permitted at acceptable locations when the total weight of the propeller assembly is under allowable limits.
- The **removal of weight** is permitted from acceptable locations when the total weight of the propeller assembly is equal to the allowable limit.

The location for removal or addition of weight is determined by the propeller manufacturer in the relevant Propeller Maintenance Manual. Usually:
- **Vertical imbalance** is corrected by adding a metal weight on the light side of the hub, 90° from the propeller's horizontal centreline.
- **Horizontal imbalance** on a wooden propeller is corrected by adding or removing solder at the propeller blade tip.
- **Horizontal balance corrections on an aluminium propeller** often involve the removal of metal by filing.

## Dynamic Balance

A propeller exhibits dynamic balance when the centres of gravity of similar propeller elements (such as the blades) rotate in the same plane of rotation. A dynamic imbalance resulting from improper mass distribution is usually negligible if the blades on a propeller track are within limits — the length of the propeller assembly along the engine crankshaft is very short compared to its diameter, and the blades track the same plane perpendicular to the axis of the crankshaft.

Modern methods of checking dynamic balance require the propeller, spinner and related equipment to be **installed on the aircraft**. With the engine running, electronic equipment senses and pinpoints the location of an imbalance, and typically also determines the amount of weight required to correct the condition.

## Aerodynamic Balance

When all the blades of a propeller are producing equal thrust it is said to possess **aerodynamic balance**. To achieve this it is necessary to adjust the blade angles relative to one another, by a few minutes of a degree, when setting the initial blade angles on assembly.

Slight differences in blade shape produce unequal aerodynamic forces on the propeller. These inequalities are corrected by slight adjustments to the individual blade angles to produce a specific thrust. The adjustment, or index, is termed the **Aerodynamic Correction Factor (ACF)** and is usually painted on the blade root. The ACF is the amount to be added or subtracted from the basic setting when assembling the propeller. This process is sometimes referred to as **indexing**.

**Note:** Balancing can only be carried out by approved propeller repair organisations using approved balancing test apparatus.

## Blade Tracking

Propeller blade tracking is a procedure which enables the engineer to check the track of each propeller blade tip as it travels through its arc of rotation — a comparison of the position of the blade tips relative to each other. It is frequently used during diagnosis of a vibration problem, or as a final check after balancing and refitting a propeller to the engine.

- **Metal propellers** up to 6 ft in diameter on light aircraft must track within **1/16 in** of each other.
- The track of a **wooden propeller** should not be out more than **1/8 in** before it can be tracked.
- The aircraft must be chocked in a stationary position, with the brakes applied, before tracking.

A propeller can be tracked by placing a board (or using a fixed reference point on the ground) within **1/4 in** of the propeller arc, then rotating the propeller and marking the path each blade tip follows as it passes the reference. Alternatively, a board on blocks under the propeller with a sheet of paper carrying a reference line may be used. With the reference line in place, the propeller is rotated and the track of each blade marked. The maximum difference in track between all the blades must not exceed the limits above.

## Assessment of Blade Damage

If damage has occurred to a propeller blade, a licensed aircraft engineer of the appropriate category must assess and establish whether the location of the damage is such that it can be repaired with the propeller attached to the propeller shaft. The relevant Propeller Maintenance Manual (under Servicing — Damaged Blades) illustrates the repair limits allowed and details where such repairs can be carried out.

The blade is divided into **checking stations** using an alpha-numeric coding system to give the precise location of the damaged area (the Blade Station Identification diagram). A reference table below the repair station diagram gives the **minimum blade thickness allowed** at any particular repair location — used like a graph, with the crossing point between the alpha and numeric axes giving the minimum thickness allowed. If a repair would take the blade thickness below that limit, the repair cannot be carried out. Extra notes on the table cover exceptions and other limitations at each station.

Because of the immense stresses imposed on the **blade root**, removal of material there is **not allowed**, as this area of the blade is crucial to its strength.

## Blade Repairs — General

Before any repair is attempted, reference must be made to the appropriate procedures and limitations detailed in the relevant manufacturer's documents. In all cases where there is an element of doubt, the damaged blade (or the propeller) should be removed for investigation.

Repairs to propellers are usually classified as:
- **Major repairs** — normally beyond the scope of the operator, such as straightening steel blades after impact damage; these require the propeller or blades to be returned to the manufacturer or an approved repair organisation.
- **Minor repairs** — within the scope of the operator; they include small dents, nicks and light corrosion removal.

All severe surface damage must be reworked at the earliest opportunity. Minor flaws such as flecking are normally left to a blade overhaul period, when a complete blade rework is carried out. Sharp indentations, scores and deep nicks can lead to crack propagation; these defects must be smoothed or blended out until removed, and crack detection by non-destructive test methods must be carried out after blending to confirm no cracks remain. Repair limitations depend on which surface of the blade is damaged.

### Face and Camber Repairs

- Rework depth on the face or camber side of a blade is limited to **0.040 in**.
- The reduction of blade thickness must not exceed **25%** of the reworked area, or the limitation in the reference table, whichever is the least.
- Damage must be blended out in all directions over **at least 30 times the depth of the indentation**.
- The final blended-out area should not exceed more than **25% of the blade chord, or 4 in** in any direction (whichever applies).
- If blending extends to within close proximity of the de-icing overshoe (about 1 in or less), the shoe must be removed to prevent damage.
- After removing the visible damage, a further **0.002 in** is usually removed to ensure removal of any residual stresses.
- Later indentations found in an already-blended area do not automatically permit removal of a further 0.040 in — the reference tables must be re-checked at each repair.
- A series of multiple repairs forming a continuous line of weakness across the chord is not permitted, and the opposite side of a blade station should be examined before removing metal to confirm no prior repair exists there.

### Leading and Trailing Edge Repairs

- Damage must be blended out over **at least ten times the depth of the indentation**.
- This is subject to a maximum combined blend length of **7 in**. If two indentations are close together, they can be blended as one provided the combined length stays within the 7 in limit.
- The reference table must still be consulted, especially where leading and trailing edges fall on the same blade station; the minimum chord width must be maintained, and narrow tip chords need particular attention as they are especially prone to damage.
- Where the leading edge has a rebate for a de-icing overshoe, damage in the run-out of that rebate must not be blended out in the normal manner — the manufacturer's Maintenance Manual must be consulted.

### Lightning Strikes

If lightning strikes a propeller, the blade metal may be burnt over a small area. Repair is similar to a face or camber repair, except that a further **0.020 in** of extra metal is removed after the indentation is eliminated. The final depression after blending, including the 0.020 in, must not exceed the reference table limits.

## Aluminium Blade Inspection, Repair and Protective Finish

An advantage of aluminium propellers is low maintenance cost, due to their one-piece construction and the hardness of the metal — however, any damage that does occur is critical and may result in blade separation, so blades must be inspected carefully and repaired as soon as possible.

Before inspection, a propeller should be cleaned with a mild soap-and-water solution to remove dirt and grass stains. Blades should be inspected for pitting, nicks, dents, cracks and corrosion, especially on the leading edge face, aided by a powerful magnifying glass; a dye penetrant inspection should be carried out if cracks are suspected, and the condition of the paint noted. Minor surface defects can be repaired by a B1 engineer; major repairs must be carried out by the propeller manufacturer.

Defects on leading and trailing edges may be dressed out with fine blade files, blending smoothly with the edge and leaving no sharp edges or angles. The approximate maximum allowable size of a repaired edge defect is **1/8 in deep and no more than 1.5 in long**. Repairs to the face and back are carried out with a half-round riffler file to dish out the damaged area, observing the thickness/width reductions stated in the manufacturer's reference table.

If etching compound is used to remove metal, it is afterwards removed by applying a mixture of **20% nitric acid** in water. Repairs are finished by polishing with fine abrasive cloth/sandpaper, moving along the length of the blade.

After repair, the surfaces are repainted: the face of each blade with one coat of zinc chromate primer and two coats of flat black lacquer from the six-inch station to the tip; the back of the blade has the last four inches of the tip painted with one coat of zinc chromate and two coats of high-visibility colour. The original colour scheme may be duplicated if desired. When repairing bent blades, the thickness of the blade and the position of the damage must be taken into consideration.

## Composite Propeller Blades

### Construction

Composite propeller blade construction can take several forms:
- A **solid aluminium alloy spar** around which a fibreglass shell with the correct aerofoil shape is placed, the space between spar and shell filled with a plastic foam for firm support.
- A **Kevlar shell** (modified monocoque) with unidirectional and multidirectional layers bonded with epoxy; leading and trailing edges reinforced with solid unidirectional Kevlar; two unidirectional Kevlar shear webs between camber and face surfaces resist flexing and buckling; polyurethane foam fills the shell for additional resistance to distortion.
- A **carbon fibre spar** with polyurethane foam filling and a glass-fibre-reinforced resin aerofoil shell, covered with a tough polyurethane coating for erosion protection; further protection is provided by replaceable erosion fibre near the blade root and nickel sheaths on the outer leading edges.

Other features can include braid-type lightning conductors and electrical de-icing elements, either replaceable or built into the construction.

### Repairs and Inspection

**No repairs are allowed on composite propellers**, due to the technique required to competently carry out a satisfactory repair — all damaged composite blades must be returned to the manufacturer.

Inspection is visual, checking for nicks, cracks, worn erosion strip, damaged sheath, electrical de-icing boots and lightning damage. Using a **round-edged coin**, a tap test is carried out to detect damaged fibreglass delamination or internal separation from the foam.

### Shock Load Check (Run-Out)

A shock load check is a concentricity check of the propeller shaft, carried out after a heavy landing or impact. The propeller is removed from the shaft; a weight is hung on the shaft to take up backlash in the reduction gear. A Dial Test Indicator (DTI), attached to a fixture bolted to the front engine casing, is set to run on a smooth portion of the shaft. The propeller is rotated through 360° and the DTI readings noted, repeated with the DTI at a different position on the shaft. The amount of eccentricity is calculated and checked against Maintenance Manual limitations.

**The amount of eccentricity is HALF the total DTI reading.**

## Repairs to Damaged De-Icing Overshoes

Damage to an overshoe (cuts, nicks, tears, lifting edges) may be rectified as a **minor repair**, provided the overshoe is electrically serviceable and the blade beneath it is undamaged. Cutting back or cropping a worn or damaged overshoe tip is **not permissible**. Damaged, worn or missing anti-erosion strips must be renewed as a minor repair, with any blade leading-edge damage beneath a strip repaired first. Where a metal guard is fitted, only local lifting at its edges should be re-bonded as a minor repair.

Repair schemes, materials and procedures depend on the extent of damage and are detailed in the relevant maintenance/overhaul manuals; necessary primers, cements, sealing paints and anti-erosion strips are sometimes available in kit form. Chemical cleanliness of surfaces is essential for good adhesion — cleaning is carried out with a clean, lint-free cloth moistened with an approved cleansing agent (e.g. methyl ethyl ketone or acetone), avoiding swabbing or excessive quantities, and masking adjacent serviceable parts as needed. Cleansing agents are highly flammable and some are toxic, so cleaning must be done in a well-ventilated area, free from heat, sparks and open flames.

All damaged areas must be completely dried out before repair, since trapped moisture can start corrosion beneath the repair. Sufficient time must elapse after cleaning for the cleaning agent to evaporate before applying the bonding medium.

**Bonding cement test:** the bonding efficiency of the cement should be tested before final application — one surface of a duralumin test plate is prepared like a blade surface, along with a one-inch-wide strip of rubber cut from an old overshoe. Cement is applied to both surfaces, allowed to dry, then pressed into contact; the plate is mounted with the test strip vertical, and a **10 lb weight** is attached to the upper end of the strip. The rate at which the strip separates from the plate is noted, and **should not exceed 1 in per minute over a distance of 6 in**. Prepared cements have a certain "life" after mixing (e.g. 2 hours).

Small slits or nicks are repaired by applying cement to the edges and pressing them together once tacky; a bandage of thin rubber strip and a soft pliable pad may apply local pressure. Where small portions of rubber are missing, a filler paste (rubber dust mixed with epoxy resin adhesive) is used, worked in with a spatula, cured until hard, then blended with a medium file and finished with fine silicone carbide paper.

Before fitting a new overshoe, the bonding area is masked off, old cement and primer removed with a stiff brush and cleaning agent (MEK), then finally cleaned with a lint-free cloth soaked in the agent and allowed to dry. A template is used to mark the bonding area with a soft crayon, with its centre line coincident with the blade leading edge. PVC sheeting is interposed between the overshoe flanks and blade to prevent premature adhesion, and a rubber roller (never metal or wooden — this could damage the wire heating elements) is used to press the overshoe into contact, working from the leading edge towards the flanks while removing the PVC sheeting.

Cement is allowed to cure for a typical period of **24 hours at a minimum temperature of 20°C**. When cured, an adhesion check and an **insulation resistance check** are carried out. Some propellers have moment-balanced overshoes to obviate rebalancing of the hub and blade assembly after a new overshoe is fitted; where this is not the case, reference must be made to the maintenance manual regarding rebalancing requirements.

## Brushes and Slip Rings

Brushes are checked for wear, damage, cleanliness and freedom of movement in their holders; permissible wear limits (related to the length of brush extending beyond the brush block housing) and measurement methods are given in the aircraft/propeller maintenance manuals, with special gauges provided for some assemblies. Brushes worn beyond limits must be replaced together with new brush springs.

Before fitting a brush, the holder must be thoroughly cleaned with a dry cloth or small spiral hair brush — solvents must not be used. Brushes are fragile, and side loads must be avoided during installation. Some installations use a positive identification feature, such as a chamfered corner that must face the centre of the brush holder.

When a new brush is fitted, **at least 80% of the face must make contact with the slip ring**. A typical check: inspect the brush surface, ensure correct positioning and a secure holder, turn the propeller by hand for several revolutions, then remove the brush and examine the contact area (visible from the changed appearance of the brush face).

Whenever a brush block or pack assembly is fitted, the alignment of brushes with the slip ring surfaces, and the clearance between the brush block body and slip rings, should be checked through a complete revolution of the propeller; shims (where provided) must be retained with the assembly if it is removed. Brush packs used with certain turbopropeller engines are individually weight-balanced on initial assembly, so components must not be interchanged between packs or rebalancing will be necessary. After fitting a new brush, functional testing of the de-icing system should be delayed until other ground running checks are complete, to allow brush bedding before heating current is applied.

Slip rings are checked for security, scoring, discolouration from burning, and deposits of oil, grease or dirt; insulation filling between slip rings (where fitted) is checked for separation, flaking and localised damage. Dirty slip rings are cleaned by wiping with a lint-free cloth moistened with white spirit, or by spraying with a specified cleaning fluid.

## Electrical Checks and Tests

The checks needed to ensure correct functioning of a complete propeller de-icing system include:

- **Continuity and Heater Resistance Checks** — carried out before propeller installation, at prescribed inspection periods, and after any overshoe repairs; resistance values must be within specified limits.
- **Insulation Resistance Checks** — determine any breakdown of insulation between heater elements, blades and (where appropriate) the propeller spinner, and between brush gear and earth. Moisture absorption during service can vary insulation resistance, so checks are repeated at prescribed inspection periods to ensure resistance has not fallen below the specified minimum in-service value — **typically 2 to 4 megohms**. The cement specification used for bonding elements to blades also affects the resistance obtained, and relevant limits are usually presented as graphs in the maintenance manual.
- **Voltage Proof Check** — required for some propellers following repairs to heater element overshoes. Leads from all heater elements are connected together and a high voltage (typical values quoted are **1360 volts DC or 960 volts AC**) is applied between the leads and the blade, increased gradually and maintained for **not less than one minute**, checking for any breakdown of insulation resistance.

## Ground Running

### Safety Precautions — Aircraft

Where work (other than engine starting) requires the HP cock to be opened, ensure:
- Booster pumps are OFF.
- At least 15 minutes have elapsed since engine shutdown, OR rotation has ceased and at least 5 minutes have been allowed for the engine drains system to clear.
- The aircraft is headed into wind, clear of other aircraft and buildings, with the ground around it clear of debris.

### Safety Precautions — Personnel

- All personnel not engaged in the ground run must keep a safe distance: at least **50 feet from the front** of the aircraft and at least **150 feet from the rear**.
- All personnel working near running engines must wear ear defenders.
- Where checks involve an operator standing in the propeller slipstream, engine RPM must not exceed normal (high) ground idle.
- No loose clothing may be worn in the vicinity of running engines.

### Points to be Observed Prior to Ground Running

- Chock the aircraft wheels fore and aft.
- Ensure adequate fire-fighting equipment and crew are in position.
- Check engine oil, fuel and hydraulic oil contents are adequate.
- Ensure the tech log is available.
- Obtain OAT and QFE from the Tower or aircraft instrumentation.
- Establish intercom contact between ground crew and flight deck before starting.

### Engine Limitations During Power Check

- TGT must not exceed the alert (or corrected) figure if ambient conditions are below ISA sea level.
- Torque pressure must be above the minimum acceptable figure.
- LP speed must be within laid-down limits.
- High power running must be kept to a minimum.
- After a power check, the engine must be run at ground idle RPM for **at least two minutes** to ensure adequate and even cooling before shutdown.
- Engine thermal anti-icing must be OFF during running at take-off throttle settings.

### Engine Starting Procedure

Ground running should be kept to a minimum, with throttles and controls operated slowly and smoothly to avoid rapid temperature changes; prolonged running at maximum conditions should be avoided. In the event of a sudden TGT increase, abnormal instrument readings or unusual noise, the engine must be stopped and the cause investigated. Cowlings are left closed except when leak checking or making adjustments, and control locks must be on for all ground running to ensure ground fine pitch is available and pitch coarsening is isolated on all engines. If the engine has been running at high RPM before shutdown, it should be allowed a short cooling period first.
        $cnt$,
        5
    ) RETURNING id INTO s1_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M17.5 Propeller Maintenance (21 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s1_id, 'A propeller is said to be statically balanced when:',
     '[{"id":"a","text":"The propeller''s centre of gravity coincides with its axis of rotation","correct":true},{"id":"b","text":"The centre of gravity of the blades rotates in the same plane of rotation","correct":false},{"id":"c","text":"All blades produce exactly equal thrust","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'Of the two static balancing methods (knife edge and suspension), which is simpler and more accurate?',
     '[{"id":"a","text":"The suspension method","correct":false},{"id":"b","text":"The knife edge method","correct":true},{"id":"c","text":"Both are equally simple and accurate","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'When checking a two-bladed propeller for vertical balance on a knife-edge stand, a vertical imbalance is indicated if the propeller:',
     '[{"id":"a","text":"Remains in the vertical position regardless of which blade points up","correct":false},{"id":"b","text":"Tends to come to rest in a horizontal position","correct":true},{"id":"c","text":"Spins continuously in one direction","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'When checking a two-bladed propeller for horizontal balance, a horizontal imbalance (heavy blade) is indicated if the propeller:',
     '[{"id":"a","text":"Remains in the horizontal position","correct":false},{"id":"b","text":"Tends to come to rest in a vertical position, with one blade moving downward","correct":true},{"id":"c","text":"Immediately rises to a vertical position with both blades moving upward","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'A three-bladed propeller is considered properly statically balanced when:',
     '[{"id":"a","text":"Only blade No.1 shows no tendency to rotate when pointing downward","correct":false},{"id":"b","text":"Each blade in turn can be placed in the 6 o''clock position with no tendency to rotate","correct":true},{"id":"c","text":"The propeller is mounted vertically on the test stand","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'A propeller exhibits dynamic balance when:',
     '[{"id":"a","text":"The centres of gravity of the blades rotate in the same plane of rotation","correct":true},{"id":"b","text":"The propeller''s overall centre of gravity coincides with its axis of rotation","correct":false},{"id":"c","text":"All blades are set to the identical geometric pitch angle","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'Modern methods of checking dynamic balance require that:',
     '[{"id":"a","text":"The propeller be removed and mounted on a knife-edge test stand","correct":false},{"id":"b","text":"The propeller, spinner and related equipment be installed on the aircraft, with electronic equipment sensing the imbalance while the engine is running","correct":true},{"id":"c","text":"The propeller be submerged in a fluid bath to detect eccentricity","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'A propeller is said to possess aerodynamic balance when:',
     '[{"id":"a","text":"All the blades are producing equal thrust","correct":true},{"id":"b","text":"The hub weight equals the combined blade weight","correct":false},{"id":"c","text":"The propeller has no vertical or horizontal static imbalance","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'The adjustment applied to individual blade angles to achieve aerodynamic balance, usually painted on the blade root, is termed the:',
     '[{"id":"a","text":"Aerodynamic Correction Factor (ACF)","correct":true},{"id":"b","text":"Blade Pitch Deviation (BPD)","correct":false},{"id":"c","text":"Thrust Equalisation Index (TEI)","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'Metal propellers up to 6 ft in diameter on light aircraft must track within what distance of each other?',
     '[{"id":"a","text":"1/16 in","correct":true},{"id":"b","text":"1/8 in","correct":false},{"id":"c","text":"1/4 in","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'The track of a wooden propeller should not be out more than:',
     '[{"id":"a","text":"1/16 in","correct":false},{"id":"b","text":"1/8 in","correct":true},{"id":"c","text":"1/2 in","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'Why is removal of material not permitted at the blade root when repairing a propeller blade?',
     '[{"id":"a","text":"Because that area is crucial to the blade''s strength given the immense stresses it carries","correct":true},{"id":"b","text":"Because the root has no reference table entry","correct":false},{"id":"c","text":"Because the root is not accessible without removing the hub","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'On the face or camber side of a propeller blade, maximum rework (repair) depth is limited to:',
     '[{"id":"a","text":"0.004 in","correct":false},{"id":"b","text":"0.040 in","correct":true},{"id":"c","text":"0.400 in","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'For a face or camber repair, the damage must be blended out in all directions over a distance of at least:',
     '[{"id":"a","text":"3 times the depth of the indentation","correct":false},{"id":"b","text":"30 times the depth of the indentation","correct":true},{"id":"c","text":"300 times the depth of the indentation","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'For leading and trailing edge repairs, damage must be blended out over at least ten times the depth of the indentation, subject to a maximum combined blend length of:',
     '[{"id":"a","text":"1 in","correct":false},{"id":"b","text":"7 in","correct":true},{"id":"c","text":"17 in","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'On an aluminium propeller blade, the approximate maximum allowable size of a repaired leading/trailing edge defect is:',
     '[{"id":"a","text":"1/8 in deep and no more than 1.5 in long","correct":true},{"id":"b","text":"1 in deep and no more than 6 in long","correct":false},{"id":"c","text":"1/2 in deep with no length limitation","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'According to these notes, repairs to composite propeller blades are:',
     '[{"id":"a","text":"Permitted, provided a licensed B1 engineer carries them out","correct":false},{"id":"b","text":"Not allowed at all — damaged composite blades must be returned to the manufacturer","correct":true},{"id":"c","text":"Permitted only for damage on the trailing edge","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'When inspecting a composite propeller blade, a tap test using a round-edged coin is carried out to detect:',
     '[{"id":"a","text":"Fibreglass delamination or internal separation from the foam filling","correct":true},{"id":"b","text":"Incorrect blade angle setting","correct":false},{"id":"c","text":"Insulation resistance breakdown in the de-icing elements","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'During a shock load (run-out) check using a Dial Test Indicator on the propeller shaft, the amount of eccentricity is calculated as:',
     '[{"id":"a","text":"Equal to the total DTI reading","correct":false},{"id":"b","text":"Half the total DTI reading","correct":true},{"id":"c","text":"Twice the total DTI reading","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'In the bonding-cement adhesion test for a de-icing overshoe repair, a 10 lb weight is hung on a vertical test strip and the separation rate is checked. This rate must not exceed:',
     '[{"id":"a","text":"1 in per minute over a distance of 6 in","correct":true},{"id":"b","text":"10 in per minute over a distance of 1 in","correct":false},{"id":"c","text":"1 in per hour over a distance of 6 in","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'During a ground engine run, personnel not engaged in the run must keep a safe distance of at least:',
     '[{"id":"a","text":"50 ft from the front and 150 ft from the rear of the aircraft","correct":true},{"id":"b","text":"150 ft from the front and 50 ft from the rear of the aircraft","correct":false},{"id":"c","text":"10 ft from the front and 25 ft from the rear of the aircraft","correct":false}]',
     '{"B1","B2"}');

END $$;
