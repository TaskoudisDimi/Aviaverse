-- Module 17: Propeller (B1/B2) — Propeller Synchronization, Propeller Ice Protection
-- Source: EASA Part-66 Module 17 official textbook (IKAROS Aviation Training Centre, IK M17, Issue Oct.2012)

DO $$
DECLARE
    m17_id INT;
    s3_id  INT;
    s4_id  INT;
BEGIN
    SELECT id INTO m17_id FROM easa_modules WHERE code = 'M17';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M17.3') THEN
        RAISE NOTICE 'M17.3/M17.4 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 17.3: Propeller Synchronization
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m17_id, 'M17.3', 'Propeller Synchronization',
        $cnt$
# Propeller Synchronization

## Synchronizing and Synchrophasing

A **synchronizing** (or **synchrophasing**) function provides automatic control of the relative RPM of all the propellers on an aeroplane and the rotational positions of their respective sets of blades. Maintaining the same RPM and a constant blade phase relationship within close limits reduces vibration ("beat") and noise in the cabin.

## Hydromechanical Controlled Engines

Vibration has always been a problem with aircraft because the lightweight structure does not have sufficient mass to absorb it. Some annoying and harmful vibration in multi-engine aeroplanes is caused by the propellers being slightly out of synchronization — that is, not turning at exactly the same speed. This type of vibration has a **low fundamental frequency**, approximately equal to the **difference between the RPM of the engines**. To prevent this vibration, the propellers can be synchronized with an electronic synchronizer system. Several types of synchronizer system are in use.

### One-Engine Master System

Synchronizer systems are also installed in light twin-engine aircraft. Typically, such a system consists of:
- A special propeller **governor on the left-hand (master) engine**
- A **slave governor** on the right-hand engine
- A **synchronizer control unit**
- An **actuator** in the right-hand engine nacelle

The propeller governors are equipped with **magnetic pick-ups** that count propeller revolutions and send a signal to the synchronizer unit. The synchronizer — usually a transistorised unit — compares the signals from the two propeller governor pick-ups. If the two signals are different, the propellers are out of synchronization, and the synchronizer control generates a **DC pulse**, which is sent to the slave propeller unit.

The control signal is sent to an actuator consisting of **two rotary solenoids mounted on a common shaft**:
- A signal to **increase** the RPM of the slave propeller rotates the shaft **clockwise**
- A signal to **decrease** RPM moves the shaft in the **opposite direction**

Each pulse signal rotates the shaft a fixed amount, called a **"step."** A flexible cable is attached to the shaft and connected at its other end to a **trimming unit**; the vernier action of the trimming unit regulates the governor arm.

## Synchrophasing

**Synchrophasing** is a refinement of synchronization which allows the pilot to set the blades of the slave engines a number of degrees in rotation **behind** the blades of the master engine. It is used to further reduce the noise created by the engines. The synchrophase angle can be varied by the pilot to adjust for different flight conditions while still achieving a minimum noise level.

### System Components

A **pulse generator** is keyed to the same blade of each propeller (e.g. the #1 blade), and the signal it generates is used to determine whether all #1 blades are in the same relative position at the same instant. The pulse generator serves the same function as a tacho-generator in the synchronization system. By comparing when the signals from the slave pulse generators occur in relation to the master engine pulse, the mechanism synchronizes the phase relationship of the slaves to the master engine.

The **synchrophaser electronic unit** receives the signals from the pulse generators, compares them to the master engine signal, and sends a correcting signal to the governors, adjusting the control of the slave engines to establish the phase angle selected by the pilot. A **propeller manual phase control** in the cockpit allows the pilot to select the phase angle that gives minimum vibration.

### System Operation

When the engines are operating at nearly the same RPM, the system is turned on and the slave engine synchronizes with the master engine. The electronic control unit adjusts the governor(s) to set the propellers at the same phase angle selected on the pilot's control panel.

## FADEC Controlled Engines

On FADEC-controlled engines, propeller synchronization is calculated by the engine control computer. As with hydromechanical systems, there is a **master engine (normally engine #1)** which sends signals to the other engine control computer(s) to adjust propeller speed and phase. FADEC-controlled engines operate in different modes depending on flight configuration and power lever setting. Propeller synchronization is normally an **automatic function**, performed during propeller forward thrust, constant speed operation modes, when all engines are working normally.

The left-hand (LH) and right-hand (RH) propeller systems automatically enter synchronization mode when:
- They are in **constant speed mode**, AND
- There is **less than typically 1% RPM difference** between the speed of the two propellers and the speed the engine control computers have set

In synchronization mode, the LH and RH engine control computers use signals from **pulse probes**, which identify the position of the blades on each propeller. The RH engine control computer compares the master pulse signals (from the LH propeller) with its own pulse signals. If there is a difference in blade phase angle, the RH engine control computer sends adjusting signals to its own propeller control unit until the difference in phase angle between both propellers is correct. The RH engine control computer continuously adjusts its propeller control unit to keep its pulse signals in the correct relation with the master pulse signals.

The propeller control systems **go out of synchronization mode** when the RH engine control computer cannot maintain the same speed and correct phase angle compared to the master engine. If an engine is shut down, the propeller control system will also go out of synchronization mode.
        $cnt$,
        3
    ) RETURNING id INTO s3_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 17.4: Propeller Ice Protection
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m17_id, 'M17.4', 'Propeller Ice Protection',
        $cnt2$
# Propeller Ice Protection

## Ice Elimination Systems

Propeller ice elimination systems are used to prevent or remove ice formation on propeller blades during flight. If ice is allowed to remain on the blades, the efficiency of the aerofoil is reduced, the propeller becomes heavier, and develops an **out-of-balance condition**. These conditions can generate vibrations and cause damage to the engine and airframe.

Two types of ice elimination are used:
- **Fluid De-Icing**
- **Electrical De-Icing**

## Fluid De-Icing

The least commonly used type of de-icing system employs a fluid which is delivered along the leading edge of the propeller. During flight this fluid mixes with water or ice and reduces the freezing point of the mixture. Where ice has already formed on the blades, the fluid penetrates under the ice and loosens it sufficiently for it to be thrown off by centrifugal action.

### System Components

- **Fluid**: must readily combine with water and have a very low freezing point, so the fluid/water mixture will not freeze in flight. The most commonly used fluid is **isopropyl alcohol**, because of its low cost and availability — its main disadvantage is **flammability**. A phosphate-compound fluid is used in some systems; it is less flammable than alcohol but not widely used because of its high cost.
- **Fluid tank**: usually located in the fuselage; vented to atmosphere; fitted with a quantity indicator; positioned to gravity-feed the fluid pump. Tank size ranges from a few quarts to several gallons, depending on the aircraft.
- **Fluid filter**: fitted between the tank and pump, to prevent contamination entering the system.
- **Fluid pump**: moves fluid from the tank to the propeller feed lines. Pump pressure is no more than about **10 PSI**, since there is very little resistance other than a check valve, which opens at **3 to 5 PSI**. Pump speed is controlled from the cockpit by a rheostat, varying flow from less than a quart per hour to more than a gallon per hour. Usually one pump supplies no more than two engines. Air pressure can also be used.
- **Check valve**: located between the fluid pump and the slinger ring feed tube; prevents syphoning of fluid in flight when the system is not operating, and reduces fluid evaporation from the system.
- **Slinger ring**: mounted on the rear of the propeller hub; holds fluid in its curved channel by centrifugal force, feeding it out to the blades through blade feed tubes welded onto the slinger ring.
- **Rubber feed shoes (de-icing boots)**: attached to the leading edge of the blades by adhesive; optional and not fitted on all systems. They direct fluid along the leading edge and provide an even distribution. Shoes do not extend more than **1/3 of blade length**.

### System Operation

When the system rheostat is turned on, the fluid pump operates at the rate set by the pilot. Fluid is drawn from the tank, through the filter, and forced to the slinger feed tube. It flows from the stationary feed tube to the rotating slinger ring, then through the blade feed tubes to the leading edge of the blades at the shank. Fluid flows out onto the blade surface (or boot) and moves along the leading edge by centrifugal force, combining with moisture, and the mixture flows off the blades as a liquid.

### Inspection

- After each flight in which the system was operated, the blades should be cleaned with methylated spirits in soapy water, and the tank replenished with the specified fluid.
- Overshoes should be examined for adhesion failure at edges and tips (they may lift in flight), blisters and cuts; the longitudinal grooves should be free of damage or gummy deposits.
- The feed pipe and slinger ring should be checked for damage and cleanliness.
- Filters, pump and check valve should be removed and cleaned at intervals laid down in the Approved Maintenance Schedule.
- If the system will not be used for a long period, drain it and refill with **95% methylated spirits and 5% distilled water**, then operate the system (with the propeller turning) until the tank is empty.

### Testing

**Flow Test**: clean the pump filter and check the tank vent valve for obstruction. Fit an ammeter to check the pump's rated current and confirm the voltage supply is at the correct level. Disconnect the delivery pipe near the slinger ring and direct it into a calibrated container; operate the pump and note the fluid delivery rate and ammeter reading. On multi-engine aircraft, all propellers should be checked simultaneously, and the delivery rate must be within the limits specified by the manufacturer at each rheostat setting. If the amperage required exceeds the rated value, or the delivery rate is too low, the slinger ring and pipes should be checked for obstruction — if they are clear, the pump is defective.

**Functional Testing**: the propeller is painted with commercial whitewash and allowed to dry; a suitable dye is added to the fluid. With the engine running and the system operating, the dye stains the whitewash, showing how evenly the fluid is distributed over the blades. Uneven distribution may be caused by an eccentrically fitted slinger ring, incorrectly located feed pipes, or obstruction in the lines.

## Electrical De-Icing

**De-icing** refers to a system which allows ice to form and then removes it, rather than preventing it forming. Electrical de-icing systems use electrical heating elements on the blades to melt the layer of ice next to the blade, and centrifugal force then throws the ice off. The system heats the blades for a short period, then the current is turned off and ice again forms on the blades; once ice re-forms, the system again heats and melts it. **Electrical de-icing is the preferred method of ice control on propellers**, due to the abundant supply of electrical power available during flight.

### System Components

- **ON/OFF switch**: included in all systems, to supply power for operation.
- **Selector switch** (some systems): selects one of **two cycling speeds** to adjust for heavy or light icing conditions.
- **Full De-Ice Mode switch** (some systems): sprung off and must be held on, to de-ice all the propellers at the same time. It can only be used for short periods, and only if ice has already built up on the propeller before the system is turned on.
- **Loadmeter**: indicates the amount of current drawn by the de-icing system — one meter may be used for all engines, or one for each engine; calibrated in amps or in percent of rated current.
- **Timer**: a DC motor in the timer runs a sequencing mechanism which switches each propeller de-icing circuit on and off in the correct sequence, and maintains the heating interval for each propeller. **At any one instant, only one propeller is de-iced.**
- **Power relays**: used to keep high-current-carrying wires to a minimum.
- **Brush block**: mounted on the engine front case, just behind the propeller; contains brushes used to transfer electrical power from the power relays to the propeller slip ring.
- **Slip ring**: mounted on the rear of the propeller; contains at least two contact bars, which align with the brush block and transfer the electrical power to the blade roots.
- **Rubber de-icing boots**: contain the heating elements, attached to the blade leading edge with adhesive. Some boots contain **two heating elements**, for the inboard and outboard sections, which reduces the current required and allows a greater concentration of heat; the two elements are heated in sequence by the action of the timer.

### System Operation

When the de-icing system is switched on, the timer starts to run, sequencing the de-icing operation and delivering power to each power relay in turn. The high current released by the power relay is directed to the blade roots through the brush block and slip ring assembly — each propeller is de-iced in turn. To prevent more than one propeller de-icing at any one time during normal operation, a **null period of about one second** is set in the timer; during the null period no blades are being de-iced and the loadmeter indicates zero current flow. As the timer operates, the loadmeter indicates a current flow for the heating time (**approximately 30 seconds**), then returns to zero for about 1 second (the null period) before returning to the current flow reading. If a loadmeter is used for each engine, only one meter will indicate current flow at any one instant, and during the null period all meters indicate zero.

### Two-Speed Cycling System

A two-speed cycling system is used to accommodate the propeller and spinner requirements in icing conditions:
- **Fast Cycle**: used at the higher air temperatures, when the water concentration is usually greater.
- **Slow Cycle**: used when the temperature is in the lower range.

### Inspection

- Overshoes (boots) should be examined for splits, wrinkles, tears, discoloration as a result of overheating, security of attachment to the blades and general condition. If the heater element is exposed as a result of damage, or if the rubber is tacky, swollen or deteriorating, the overshoe must be replaced.
- Cables should be examined for signs of cracking or fretting, and security.
- Brushes and slip rings should be checked for wear, damage, cleanliness and freedom of movement in their holders.

### Tests

- **Continuity/Resistance**: of individual heater elements, must be carried out before installation, at prescribed inspection periods, and following any repair to the overshoes.
- **Insulation/Resistance**: checks are necessary to determine any breakdown between heater elements, between heater element and blades, and between brush gear and propeller/spinner heater, where appropriate.
- **Functional Testing**: of the complete system is carried out periodically per the maintenance schedule, and when a new or overhauled propeller has been fitted, or after replacement of the cyclic timer, heater element, brush pack, or repair to an overshoe. It consists of checking that the heating current is applied to the blade and spinner elements for the correct periods, governed by the timer and indicated by the ammeter in the circuit. This test must be carried out during a **ground run**, to avoid overheating of the elements.

## Repairs to Damaged De-Icing Overshoes

Damage to an overshoe (cuts, nicks, tears, lifting edges) may be rectified as a **minor repair**, provided the overshoe remains electrically serviceable and the blade beneath has not suffered damage. **Cutting back or cropping a worn or damaged overshoe tip is not permissible.** Damaged, worn or missing anti-erosion strips fitted along the overshoe or blade leading edge must be renewed as a minor repair, and any damage to the blade leading edge beneath a strip must be repaired before fitting a new strip. Where a metal guard is fitted along the leading edges of an overshoe and blade, only local lifting at the edges of the guard should be re-bonded as a minor repair.

### Repair Methods and Precautions

- Repair schemes, the materials required and procedures are detailed in the relevant maintenance and overhaul manuals, which must be referred to; necessary primers, cements, sealing paints and anti-erosion strips are in some cases available in kit form.
- Chemical cleanliness of surfaces is essential for good adhesion. Cleaning is carried out with a clean, lint-free cloth moistened in the approved cleansing agent, e.g. **methyl ethyl ketone or acetone**, avoiding swabbing or excessive quantities, with adequate masking to protect adjacent serviceable parts.
- Cleaning agents are highly flammable and some may be toxic — cleaning should be carried out in a well-ventilated area, free from excessive heat, sparks or open flames, avoiding prolonged exposure to fumes.
- All damaged areas must be completely dried out before repairing, so that moisture is not trapped under the repair (failure to do so may lead to corrosion under the repair). After cleaning, sufficient time must elapse for the cleaning agent to evaporate before applying the bonding cement.
- Where an overshoe has split, worn or lifted at its edges or tip, it should be carefully peeled back at the damaged portion, the exposed blade inspected for corrosion, any light corrosion cleaned out and blended per the blade repair procedures, then the surfaces cleaned and the overshoe re-bonded. If corrosion is excessive, the overshoe should be removed, the blade reworked and cleaned, a primer applied, and a new overshoe bonded.

### Cement Bonding Test

A typical test used to check the bonding efficiency of the cement before final application: one surface of a duralumin test plate is prepared like a blade surface, and a one-inch-wide strip of rubber cut from an old overshoe is similarly prepared. Cement is applied to both surfaces and allowed to dry for the specified period; the surfaces are pressed into contact, the test plate mounted with the test strip in the vertical position, and a **ten-pound weight** attached to the upper end of the strip. The rate at which the strip separates from the plate is noted — it **should not exceed 1 inch per minute over a distance of 6 inches**.

Small slits or nicks are repaired by applying cement to the edges and, once tacky, pressing the edges firmly together (a bandage of thin rubber strip and a soft pliable pad may be used to apply local pressure). Where small portions of rubber are missing, repairs are carried out using a **filler paste**, made by mixing rubber dust with an epoxy resin adhesive; this is worked into the cleaned area with a spatula, allowed to cure until hard, blended into the overshoe surface with a medium-grade file, and finished with fine-grade silicone carbide paper.

### Fitting a New Overshoe

Where an overshoe is to be bonded to a blade without a leading-edge rebate, a template of the overshoe is prepared first and used to mark out the bonding area on the cleaned blade. The bonding surface of the overshoe is brushed with a fine steel wire brush and cleaned with the specified cleaning agent — **no significant quantity of rubber should be removed during brushing, as a reduction in rubber thickness may lead to electrical failure of the heating element.** A coat of cement is evenly applied by brush to both prepared surfaces and allowed to dry; masking tape is placed around the outer edges of the overshoe to prevent curling while the cement is applied, then removed before installation. **Polyvinylchloride (PVC) sheeting** is interposed between the flanks of the overshoe and the blade, to prevent premature adhesion of the bonding surfaces. Working from the leading edge towards the flanks, a rubber roller is used to press the overshoe into contact with the blade, progressively removing the PVC sheeting (**metal or wooden rollers must not be used**, as they could damage the wire heating elements). Cement is allowed sufficient time to cure — a typical period is **24 hours at a minimum temperature of 20°C** — after which adhesion is checked per the maintenance manual, followed by an insulation resistance check.

Reference should be made to the maintenance manual for any requirement to rebalance the propeller after a new overshoe has been fitted. Some propellers have **moment-balanced overshoes**, which avoid the need to rebalance the hub and blade assembly after a new overshoe is fitted.

## Brushes and Slip Rings

Brushes are checked for wear, damage, cleanliness and freedom of movement in their holders, against the permissible wear limits given in the maintenance manuals, often using special measuring gauges. Brushes worn beyond limits must be replaced by new ones together with new brush springs. Before fitting a brush, the brush holder must be thoroughly cleaned with a dry cloth or small spiral hair brush — **solvents must not be used**. Brushes are fragile and care must be taken to avoid placing any side loads on them during installation.

When a new brush has been fitted, **at least 80% of the face must make contact with the slip ring**. This is checked by inspecting the brush surface, ensuring the brush is correctly and securely positioned, turning the propeller by hand for several revolutions, then removing the brush and examining the contact area from the changed appearance of the brush face. Following the installation of a new brush, functional testing of the complete de-icing system should be delayed until other engine ground-running checks have been completed, allowing brush bedding to take place before heating current is applied.

Slip rings are checked for security of attachment, signs of scoring, discoloration from burning, and deposits of oil, grease or dirt. Insulation filling fitted between the slip rings on some propellers is also inspected for separation, flaking and localised damage. After any repair to the insulation, an insulation resistance test must be carried out. Dirty slip rings are cleaned by wiping with a lint-free cloth moistened with white spirit, or by spraying with a specified cleaning fluid.

## Electrical Checks and Tests

- **Continuity and Heater Resistance Checks**: carried out before installation of a propeller, at prescribed inspection periods, and following any repairs to overshoes; resistance values must be within the limits specified for the type of propeller.
- **Insulation Resistance Checks**: determine whether there is any breakdown of insulation between heater elements, blades and, where appropriate, the propeller spinner, including between brush gear and earth. Insulation resistance may vary in service due to moisture absorption caused by atmospheric conditions, so checks are also carried out at prescribed inspection periods to ensure resistance has not fallen below the specified minimum "in-service" value — **typically 2 to 4 Megohms**. The specification of the cement used to bond the elements to the blades also has a direct bearing on the resistance obtained, with the relevant limits usually presented as graphs in the maintenance manual.
- **Voltage Proof Check**: required for some propellers following repairs to the heater element overshoes. The leads from all the heater elements are connected together, and a high voltage — **typically 1360 volts DC or 960 volts AC** — is applied between the leads and the blade, increased gradually and maintained for **not less than one minute**, while a check is made that there is no breakdown of insulation resistance.
        $cnt2$,
        4
    ) RETURNING id INTO s4_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M17.3 Propeller Synchronization (8 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s3_id, 'A synchronizing or synchrophasing function provides automatic control of:',
     '[{"id":"a","text":"The relative RPM of all propellers and the rotational position of their blade sets","correct":true},{"id":"b","text":"Only the fuel flow to each engine","correct":false},{"id":"c","text":"The pitch of the blades on the master engine only","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'In multi-engine aeroplanes, vibration caused by propellers being slightly out of synchronization has a low fundamental frequency approximately equal to:',
     '[{"id":"a","text":"The sum of the RPM of the engines","correct":false},{"id":"b","text":"The difference between the RPM of the engines","correct":true},{"id":"c","text":"Twice the RPM of the fastest engine","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'In a typical One-Engine Master synchronizer system on a light twin, the master (special) propeller governor is fitted on:',
     '[{"id":"a","text":"The right-hand engine only","correct":false},{"id":"b","text":"The left-hand engine, with a slave governor on the right-hand engine","correct":true},{"id":"c","text":"Both engines simultaneously, with no master/slave relationship","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'In the One-Engine Master synchronizer system, the propeller governors are fitted with magnetic pick-ups whose purpose is to:',
     '[{"id":"a","text":"Count propeller revolutions and send a signal to the synchronizer unit","correct":true},{"id":"b","text":"Measure oil pressure at the governor","correct":false},{"id":"c","text":"Detect propeller blade ice accretion","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'In the One-Engine Master synchronizer actuator, which consists of two rotary solenoids on a common shaft, a signal to increase RPM of the slave propeller:',
     '[{"id":"a","text":"Rotates the shaft clockwise","correct":true},{"id":"b","text":"Rotates the shaft anticlockwise","correct":false},{"id":"c","text":"Has no effect on the shaft, only on the trimming unit directly","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'Synchrophasing is a refinement of synchronization that:',
     '[{"id":"a","text":"Allows the pilot to set the blades of the slave engines a number of degrees behind the master engine blades, to further reduce noise","correct":true},{"id":"b","text":"Automatically shuts down the slave engine when out of synchronization","correct":false},{"id":"c","text":"Increases propeller RPM above governed limits for short bursts","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'On FADEC controlled engines, the LH and RH propeller systems automatically enter synchronization mode when they are in constant speed mode AND:',
     '[{"id":"a","text":"There is less than typically 1% RPM difference between the speed of the two propellers and the speed the engine control computers have set","correct":true},{"id":"b","text":"The aircraft is above 10,000 ft","correct":false},{"id":"c","text":"Both throttles are at flight idle","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'On FADEC controlled engines, the propeller control system will go out of synchronization mode when:',
     '[{"id":"a","text":"The rh engine control computer cannot maintain the same speed and correct phase angle as the master engine, or an engine is shut down","correct":true},{"id":"b","text":"The aircraft descends below 5,000 ft","correct":false},{"id":"c","text":"The pilot selects flaps down","correct":false}]',
     '{"B1","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M17.4 Propeller Ice Protection (22 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s4_id, 'Two types of propeller ice elimination system are described in this module. They are:',
     '[{"id":"a","text":"Fluid de-icing and electrical de-icing","correct":true},{"id":"b","text":"Pneumatic de-icing and chemical anti-icing","correct":false},{"id":"c","text":"Hot-air de-icing and weeping-wing de-icing","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'If ice is allowed to remain on propeller blades, the result is:',
     '[{"id":"a","text":"No measurable effect below 10,000 ft","correct":false},{"id":"b","text":"Reduced aerofoil efficiency, increased weight, and an out-of-balance condition that can cause vibration and damage","correct":true},{"id":"c","text":"An increase in propeller RPM governed automatically by the overspeed system","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'The most commonly used fluid in propeller fluid de-icing systems is:',
     '[{"id":"a","text":"Isopropyl alcohol, chosen for its low cost and availability, though it is flammable","correct":true},{"id":"b","text":"A phosphate compound, chosen because it is the cheapest available fluid","correct":false},{"id":"c","text":"Distilled water only, with no additive","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'In a typical fluid de-icing system, the fluid pump develops a pressure of no more than about 10 PSI because the only significant resistance is a check valve, which opens at:',
     '[{"id":"a","text":"3 to 5 PSI","correct":true},{"id":"b","text":"15 to 20 PSI","correct":false},{"id":"c","text":"50 to 60 PSI","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'Rubber feed shoes (de-icing boots) used in a fluid de-icing system do not extend more than:',
     '[{"id":"a","text":"1/3 of the blade length","correct":true},{"id":"b","text":"The full length of the blade","correct":false},{"id":"c","text":"2/3 of the blade length","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'If a fluid de-icing system is not going to be used for a long period, it should be drained and refilled with:',
     '[{"id":"a","text":"95% methylated spirits and 5% distilled water, and the system operated (propeller turning) until the tank is empty","correct":true},{"id":"b","text":"Pure isopropyl alcohol only, left standing in the tank","correct":false},{"id":"c","text":"Engine oil, to prevent corrosion of the pump","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'The functional test of a fluid de-icing system is carried out by:',
     '[{"id":"a","text":"Painting the propeller with commercial whitewash, adding dye to the fluid, and observing the staining pattern when the system is operated","correct":true},{"id":"b","text":"Weighing the propeller before and after a flight in icing conditions","correct":false},{"id":"c","text":"Measuring propeller RPM drop with the system on versus off","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'Electrical de-icing is the preferred method of ice control on propellers mainly because of:',
     '[{"id":"a","text":"The abundant supply of electrical power available during flight","correct":true},{"id":"b","text":"Its lower installed weight compared with any fluid system","correct":false},{"id":"c","text":"It requires no scheduled maintenance","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'The Full De-Ice Mode switch, fitted on some electrical de-icing systems, is:',
     '[{"id":"a","text":"Sprung off and must be held on, used for short periods only if ice has already built up before the system is switched on","correct":true},{"id":"b","text":"A permanent ON position used throughout every flight in icing conditions","correct":false},{"id":"c","text":"Only fitted to test the system on the ground, and disabled in flight","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'In a typical electrical propeller de-icing system, at any one instant:',
     '[{"id":"a","text":"All propellers are de-iced together, continuously","correct":false},{"id":"b","text":"Only one propeller is de-iced, with a null period of about one second between propellers","correct":true},{"id":"c","text":"Only the outboard blade sections are ever heated","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'In a typical electrical de-icing system, the loadmeter indicates a current flow for a heating time of approximately:',
     '[{"id":"a","text":"3 seconds","correct":false},{"id":"b","text":"30 seconds","correct":true},{"id":"c","text":"5 minutes","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'In a two-speed cycling system for electrical de-icing, the Fast Cycle is used:',
     '[{"id":"a","text":"At lower air temperatures, when ice is driest","correct":false},{"id":"b","text":"At higher air temperatures, when water concentration is usually greater","correct":true},{"id":"c","text":"Only during engine start-up","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'In an electrical de-icing system, the brush block and slip ring assembly serve to:',
     '[{"id":"a","text":"Transfer electrical power from the power relays, through the brushes, to the blade roots","correct":true},{"id":"b","text":"Filter the de-icing fluid before it reaches the slinger ring","correct":false},{"id":"c","text":"Provide the null-period timing signal to the loadmeter","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'Some electrical de-icing boots contain two heating elements, for the inboard and outboard sections of the boot. The benefit of this arrangement is:',
     '[{"id":"a","text":"It reduces the current required at any one time and allows a greater concentration of heat","correct":true},{"id":"b","text":"It removes the need for a timer, since both elements run continuously","correct":false},{"id":"c","text":"It doubles the heating time available in the null period","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'Functional testing of a complete electrical propeller de-icing system must be carried out:',
     '[{"id":"a","text":"During a ground run, to avoid overheating of the elements","correct":true},{"id":"b","text":"Only in flight, above the freezing level","correct":false},{"id":"c","text":"With the propeller removed from the aircraft","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'When a de-icing overshoe tip is worn or damaged, an acceptable minor repair is to:',
     '[{"id":"a","text":"Cut back or crop the tip to remove the damage","correct":false},{"id":"b","text":"Rectify cuts, nicks, tears or lifting edges provided the overshoe remains electrically serviceable and the blade beneath is undamaged; cropping the tip is not permissible","correct":true},{"id":"c","text":"Replace the entire propeller, since overshoe damage is never repairable","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'When preparing surfaces for bonding a repaired de-icing overshoe, the specified cleansing agent is typically:',
     '[{"id":"a","text":"Methyl ethyl ketone or acetone","correct":true},{"id":"b","text":"Engine oil","correct":false},{"id":"c","text":"Undiluted household bleach","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'In the typical bonding-efficiency test for overshoe repair cement, a ten-pound weight is hung from a vertically mounted test strip. The rate at which the strip separates from the test plate should not exceed:',
     '[{"id":"a","text":"1 inch per minute over a distance of 6 inches","correct":true},{"id":"b","text":"1 foot per minute over a distance of 6 inches","correct":false},{"id":"c","text":"1 inch per hour over a distance of 1 foot","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'Where a small portion of rubber is missing from a de-icing overshoe, the repair is carried out using a filler paste made by mixing:',
     '[{"id":"a","text":"Rubber dust with an epoxy resin adhesive","correct":true},{"id":"b","text":"Zinc chromate primer with talcum powder","correct":false},{"id":"c","text":"Silicone carbide grit with engine oil","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'When fitting a new de-icing overshoe, PVC sheeting is interposed between the flanks of the overshoe and the blade in order to:',
     '[{"id":"a","text":"Prevent premature adhesion of the bonding surfaces while the overshoe is positioned","correct":true},{"id":"b","text":"Electrically insulate the heating element from the blade permanently","correct":false},{"id":"c","text":"Act as the final erosion-resistant outer surface of the overshoe","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'When brushing the bonding surface of an overshoe with a fine steel wire brush before applying cement, no significant quantity of rubber should be removed because:',
     '[{"id":"a","text":"Excess brushing has no real consequence and is simply discouraged for speed","correct":false},{"id":"b","text":"A reduction in rubber thickness may lead to electrical failure of the heating element","correct":true},{"id":"c","text":"It would void the fluid de-icing system warranty","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'When fitting a new brush to an electrical de-icing brush block, the minimum area of the brush face that must make contact with the slip ring is:',
     '[{"id":"a","text":"80%","correct":true},{"id":"b","text":"25%","correct":false},{"id":"c","text":"100%, with zero tolerance","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'A Voltage Proof Check on a propeller de-icing system, required for some propellers after overshoe repairs, involves applying a high voltage (typically 1360 volts DC or 960 volts AC) between the connected heater element leads and the blade, and maintaining it for:',
     '[{"id":"a","text":"Not less than one minute, with the voltage increased gradually","correct":true},{"id":"b","text":"Exactly 5 seconds","correct":false},{"id":"c","text":"At least 24 hours","correct":false}]',
     '{"B1","B2"}');

END $$;
