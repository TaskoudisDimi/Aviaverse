-- Module 17: Propeller (B1/B2) — Constant Speed Propeller (Pitch Control)
-- Source: EASA Part-66 Module 17 official textbook (IKAROS Aviation Training Centre, IK M17, Issue Oct.2012)

DO $$
DECLARE
    m17_id INT;
    s1_id  INT;
BEGIN
    SELECT id INTO m17_id FROM easa_modules WHERE code = 'M17';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M17.2') THEN
        RAISE NOTICE 'M17.2 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 17.2: Constant Speed Propeller (Pitch Control)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m17_id, 'M17.2', 'Constant Speed Propeller (Pitch Control)',
        $cnt$
# Constant Speed Propeller (Pitch Control)

## Single Acting Propeller (McCauley)

This propeller is an all metal, two or three bladed, constant speed, fully feathering type.

- **Hydraulic pressure from the governor (CSU)** urges the blades to **fine pitch** (increase RPM).
- The **feathering spring and counterweights** urge the blades to **coarse pitch** (decrease RPM).
- When the engine is not operating, a **latch mechanism** prevents the blades from moving to the feather position.

### Construction — Blade and Hub Assembly

- The blades are of forged solid aluminium alloy construction, retained in the aluminium alloy hub by a **ferrule, ball bearing and retention nut**.
- The blade root is tapered and threaded, onto which a steel alloy **ferrule** is screwed and shrunk. The ferrule supports the inner race of the blade ball bearing; the outer race is located by an aluminium alloy **blade retention nut**, which screws into the blade socket in the hub. **30 steel balls and 30 plastic ball separators** complete the ball bearing.
- The ferrule is drilled to accept the **blade actuating pin**, which connects the blade to the pitch change mechanism through a laminated steel alloy connecting rod.
- The **retention nut is shimmed** to take up clearance in the blade bearing, thereby reducing blade shake and adjusting blade turning torque. The nut is locked by a locking ring deformed into grooves in both the retention nut and hub socket.
- The hub is a forged aluminium alloy component, bored and flanged to accept the blades, pitch change mechanism and propeller mounting to the crankshaft.
- Grease is retained in the bearing by an 'O' ring fitted in the blade retaining nut, which is itself located on the ferrule by a spring steel retaining ring.
- A **counterweight assembly** is attached to the bladed ferrules outboard of the retaining ring. Counterweights are fitted in matched sets, each half of a set bearing the same serial number. Propeller balancing weights are attached to the counterweight brackets as required.

## The Constant Speed Unit (CSU)

The purpose of the CSU is to **maintain the RPM of the engine that has been selected by the pilot**, by directing oil to or from the propeller to alter blade pitch.

- **Underspeed:** if engine speed drops below the RPM for which the CSU is set, the rotational force on the engine-driven CSU flyweights becomes less. The control spring moves the control valve down, allowing oil from the gear-type pump to flow through passages in the propeller and move the piston, changing the blade angle so that RPM rises back to the ON SPEED condition.
- **Overspeed:** if RPM increases above the RPM for which the CSU is set, the flyweights move out against the force of the control (overspeed) spring, moving the control valve up to permit oil in the propeller to drain out through the CSU drive shaft. As oil leaves the propeller, spring pressure and the counterweights turn the blades to a **greater angle**, which increases the load on the engine so that RPM decreases back to the ON SPEED condition.
- **On speed:** when the engine is exactly at the RPM set by the propeller lever, the centrifugal force produced by the flyweights balances the force of the control spring. The control valve is positioned so that oil is neither supplied nor drained from the propeller, and the blade angle does not change.
- The RPM setting is made by **varying the amount of compression on the control spring**.

### Feathering / Unfeathering (Single Acting)

- **Feathering** is achieved by moving the RPM lever back to the limit of its travel, which opens an oilway in the CSU allowing oil from the propeller to drain back to the engine. The blades then turn to the feather position under the action of the counterweights and feathering spring.
- **Unfeathering** requires a separate source of oil under pressure. On light aircraft this is provided by an **accumulator**, charged during normal operation. To unfeather, the RPM lever is moved into the constant speed range (lowering the control valve) and the unfeathering switch is pressed, releasing oil from the accumulator to the propeller. Once the propeller starts to windmill, the normal oil supply completes the operation.

## Constant Speed Propeller and CSU — Ground Operation Check

These checks must be made before the first flight after replacing the propeller and/or CSU, with the RPM lever in the maximum (fine pitch) position, engine started and warmed up, and DEAD, LIVE and SINGLE ignition checks carried out.

- **Exercising the propeller:** with the throttle open (not exceeding economical cruise manifold pressure), the propeller is exercised from maximum to minimum (fine to coarse) and back a number of times. This expels any air that may be in the oil and circulates warm oil to the working parts of the propeller. When exercising, RPM should decrease smoothly on the max-to-min movement and increase smoothly by the correct amount (**400 RPM to 600 RPM, depending on model**) on the min-to-max movement.
- **Constant speed check:** with cruise manifold pressure set, moving the propeller lever into the governing range should produce a reduction of approximately **200 RPM**. Opening and closing the throttle a small amount should then produce no undue variation in engine RPM, showing that propeller pitch changes follow changes in engine power (i.e. constant speeding).
- **Reference RPM check:** with the propeller lever at the maximum RPM position, reference RPM is checked under static conditions in accordance with the manual.
- **Feathering check:** a feathering and unfeathering operation is carried out, and the system is then checked for oil leaks.

### Instrument Indications — RPM and Manifold Pressure

A fixed pitch propeller aircraft uses the tachometer to indicate throttle setting (RPM rises with throttle advance, falls with throttle retard). A constant speed system instead uses the **manifold pressure gauge** to indicate throttle setting, and the **tachometer** to indicate the setting of the propeller control — although some interaction between the two occurs when changing RPM with the throttle setting fixed, because the throttle directly controls horsepower and, with a fixed throttle setting, engine horsepower output is constant.

| Control Setting | Horsepower | Manifold Pressure | RPM |
|---|---|---|---|
| Throttle set, propeller control increased | Unchanged | Decreased | Increased |
| Throttle set, propeller control decreased | Unchanged | Increased | Decreased |
| Propeller control set, throttle increased | Increased | Increased | Unchanged |
| Propeller control set, throttle decreased | Decreased | Decreased | Unchanged |

With a fixed propeller control setting, manifold pressure can be changed with the throttle while RPM remains constant, because the governor adjusts blade angle to maintain the set RPM. Care must be taken not to create too high a manifold pressure for a given RPM, as this can damage the engine: when increasing power, raise RPM first, then advance the throttle; when decreasing power, reduce the throttle first, then reduce RPM.

## Double Acting Propellers

Construction is similar to a single acting propeller, except that the cylinder is closed at both ends and oil pressure acts on **both sides** of the piston. Two types of mechanism link the piston to the blade roots:

- Links connected to the piston pass through seals in the rear of the cylinder and are connected by pins to the individual blade roots (**Rotol propellers**).
- The piston moves a **bevel gear**, which is meshed to gear segments attached to the root of each blade; movement of the piston alters the blade angle via the bevel gear.

Propeller operating oil is conveyed to the mechanism through concentric tubes in the reduction gear shaft.

### Hydraulic Pitch Change Mechanism — Three Main Types

**1. Moving Piston** — a cylinder and piston are mounted on the front of the hub; the piston is linked to the blade roots so that piston movement changes blade angle.
   - Small propellers use a **single acting unit**, using oil pressure on one side of the piston to move blades to fine pitch, with **CTM (centrifugal twisting moment)** acting on counterweights to coarsen the pitch.
   - Large propellers use **double acting mechanisms**, using oil pressure on both sides of the piston to change blade angle.

**2. Moving Cylinder** — operation is similar to the moving piston type, but a fixed piston divides the coarse and fine oil pressure supplies. As oil pressure is fed to one side of the (fixed) piston, oil on the other side returns to the PCU; the oil pressure moves the cylinder which, being linked to the blade roots, changes blade angle.

**3. Geared or 'Hydromatic'** — the dome is a stationary cylinder. The piston is U-shaped and contains a pair of co-axial cylindrical cams: the **outer cam is fixed** relative to the hub, while the **inner cam is free to turn** and carries a bevel gear meshing with bevel gear segments on the blade roots. Shafts and rollers translate piston movement into rotational movement of the inner cam. The 'dog leg' slots in the cams are cut in opposite directions **to double the movement of the inner cam**. Cam rotation is transmitted to the blades through the bevel gears to produce a pitch change proportional to piston movement. Blade angle in this system results from the combined action of centrifugal twisting moment, engine oil pressure and governor oil pressure.

### Double Acting Constant Speed Unit

In a double acting propeller fitted to piston engines, the centrifugal force acting on a rotating blade must be overcome using **governor oil pressure from the CSU, approximately 350 PSI**, to rotate the blade toward coarse pitch. To rotate the blade into fine pitch, **engine oil pressure assisted by CTM**, approximately **60 PSI**, is sufficient.

- **Underspeed:** as RPM drops, the flyweights move inwards, assisted by the governor spring, lowering the control valve. This closes off the governor pump supply and allows oil trapped in the front of the piston to drain back to the sump, while opening an engine oil supply to the rear of the piston. This pushes the piston forward, rotating the blades into a **finer pitch**. As blade angle decreases, load on the propeller decreases, allowing the engine to turn the propeller faster and RPM to rise back to the ON SPEED setting; the resulting rise in flyweight centrifugal force then pulls the control valve back up until it blocks off all oil passages, maintaining the set RPM.
- **Overspeed:** as RPM increases above the set value, the flyweights move outwards due to increased centrifugal force, pulling the control valve upwards. This opens the governor oil supply to the front of the piston and allows oil to drain from the rear, increasing blade angle, which increases load on the propeller and reduces RPM. As RPM reduces, governor spring pressure moves the control valve back down, resetting it to the ON SPEED position.

### Feathering and Unfeathering (Double Acting)

**To feather:** with the throttle closed to idle, the RPM lever is pulled to minimum, rocked through the gate, and pulled rearwards into the feather position. This pulls the control valve upwards, draining oil from the rear of the piston and opening delivery of governor oil to the front of the piston. As the blades coarsen, the engine slows and reduces the oil supply, so an additional oil supply — from the **feathering pump**, started by pressing the feathering/unfeathering button — delivers oil to the front of the piston to turn the blades to the fully feathered position. This oil comes from a reservoir (oil tank) unusable by the engine's lubrication system. When the blades reach the fully feathered position, oil pressure builds up in the delivery line and operates a **Pressure Operated Cut Out Switch (POCOS)**, which de-energises the feathering pump.

**To unfeather:** the RPM lever is pushed into minimum position through the gate, then forward into maximum. This pushes the control valve downwards, draining oil from the front of the piston. Operating the feathering/unfeathering button supplies oil from the feathering pump to the rear of the piston, rotating the blades into the fine pitch position.

## Propeller Control Unit (PCU) — Turbo-Propeller Engines

Similar in operation to the CSU, but used with some turbo-propeller engines. A **single lever** is connected to both the PCU and the fuel control unit, so that RPM and fuel flow are selected together — enabling the engine to overcome the combined inertia of the propeller and compressor, which would otherwise impair engine acceleration. The single power lever selects propeller RPM for the particular power setting.

**PCU construction:** mounted on and driven by the engine, the drive operates a spur gear pump that boosts engine oil pressure to system operating pressure. Maximum system pressure is governed by a relief valve, which also provides an idling circuit for the pump when the control valve is in neutral. Through gears, the drive rotates governor weights that tend to fly outwards as engine speed increases; these weights are linked to the control valve and move it upwards as they fly out. A linkage from the power lever loads the governor (speeder) spring, which tries to push the control valve downwards. A further connection to the HP fuel cock allows the control valve to be lifted when 'Feather' is selected, and solenoid valves direct oil pressure to lift the control valve for automatic feathering and to withdraw the pitch lock for ground operating range.

### PCU Operation

- **On Speed:** the speeder spring setting balances the centrifugal force acting through the governor weights; engine RPM equals that selected by the power lever; the control valve is in a neutral position, hydraulically locking the pitch change piston.
- **Overspeed:** centrifugal force of the governor weights overcomes the speeder spring load, the control valve moves **UP**, and propeller blades move to a **COARSER PITCH** to decrease RPM.
- **Underspeed:** speeder spring load is greater than the force of the governor weights, the valve is pushed **DOWN**, and propeller blades move to a **FINER PITCH** to increase RPM.

**Power lever position:** with the aircraft stationary and the engine idling, fuel flow is insufficient to obtain the selected RPM; the governor valve is in an underspeed condition and the propeller sits in fine pitch against the stops, behaving like a fixed pitch propeller (RPM varies with fuel flow).

- **Moving from A to B:** no effect on the speeder spring; pitch stays fully fine; RPM increases with fuel flow. At B, **minimum constant speed** is attained and the propeller moves off the fine pitch stop. *Minimum constant speed* is the minimum RPM selected by the PCU, allowing rapid acceleration.
- **Moving from B to C:** the PCU is governing — as fuel flow increases, blade angle increases to absorb the additional power.
- **Moving from C to D:** a greater RPM increase is required as fuel steadily increases toward take-off power; the PCU reduces blade angle to obtain the required RPM.

### Rotol Propeller System

The power control lever is connected to both the fuel control unit and the propeller control unit (PCU), where the PCU is basically a CSU with additional features. The requirements of the system are met as follows:

- **Constant speed control** — provided by the PCU.
- **Minimal rotational drag** during starting and ground-idle acceleration — provided by the **ground fine pitch stop** (fixed).
- **Limiting the degree of fine pitch** available in flight — provided by the **flight fine pitch stop** (withdrawable).
- **Safety against excessive RPM and propeller drag** from engine, propeller or control-unit failures — provided by the hydraulic pitch lock, the electro-hydraulic stop and the auto-feathering system.
- **Manual feathering and unfeathering** — provided by the cockpit HP cock lever, the feathering switch and the feathering pump.

In operation, the pilot's throttle lever moves both the fuel throttle valve lever and the RPM selector lever together, ensuring the correct air-to-fuel ratio at any throttle position. The pitch change mechanism is a hydraulically operated piston moving in a fixed cylinder, linked to each blade root: oil pressure applied to the **front** of the piston coarsens pitch, while oil pressure applied to the **rear** of the piston fines it off.

## Free Turbine Turbo Propeller

A single acting, engine-driven governor controls oil flow from the servo piston in the propeller dome, while a power turbine governor and an overspeed governor provide additional control (including reverse and forward thrust protection) should the normal governor fail. Centrifugal counterweights on each blade, together with a feathering spring in the propeller dome, act to bring the propeller to high blade angles and feather; oil pressure from the governor's internal pump decreases blade angle and also allows the blades to enter negative angles for reverse (**beta**) thrust.

The cockpit controls are a **power lever** and an **RPM lever**. In the **Beta range**, the power lever controls both fuel flow and propeller blade angle (through a cam box between the cockpit control and the propeller governor); in the **Flight range**, it controls fuel only. The RPM lever controls propeller RPM only, and only in the Flight range. This propeller has a lengthened piston cylinder to provide additional movement beyond the low-pitch position for the reverse-pitch angle; unusually, the **piston is outside the cylinder**. Three co-axial springs inside the piston-cylinder assembly form the feathering/coarse-pitch assembly.

### Low Pitch Stop Control (Flight Idle)

Virtually every constant-speed reversible propeller has a design low-pitch setting that prevents blade angle decreasing too far — important because if blade angle approaches zero degrees, blade drag increases significantly, producing both a higher stall speed and rate of descent, which would be particularly critical on final approach. The system uses a **hydraulic low pitch stop**, with the primary governor (CSU), a **beta valve** and mechanical connections to the propeller as principal components.

The **design low pitch stop blade angle is +17°**. With the propeller in feather (which it always reaches on loss of servo-piston oil pressure or a mechanical connection failure) and the engine ready to start, the propeller control lever is pushed to the full forward (MAX) stop to reach this position — though it is also possible to start the engine with the propeller control lever in feather. With the power lever at Flight Fine, maximum propeller RPM of **2000 RPM NF** (free turbine / propeller shaft speed) is requested, deliberately inducing a severe underspeed condition on the CSU so it decreases blade angle toward the Flight Idle Low Pitch Stop.

As the engine's power section rotates, the CSU picks up engine oil, increasing pressure and routing it through the beta valve and pilot valve to the servo piston. As the servo piston moves forward on three **beta rods**, connected to a **feedback ring** (low pitch stop collar) carrying a carbon block linked through a reversing lever to the CSU/beta valve and, via a control run and reversing cam, to the cockpit power lever, blade pitch decreases via the linkage to each blade. As the piston reaches the forward point of travel, it contacts three nuts on the rods; further forward motion moves the feedback ring and carbon block, which — through the reversing lever — pulls the beta valve forward, restricting oil flow to the servo piston so it stops moving and the blades rest on the flight idle low pitch stop of +17°. The CSU cannot satisfy the 2000 RPM NF request because the increase in NG (gas generator speed) is enough to bring the CSU into operation, controlling blade angle and NF. The **normal CSU governing range is 1700 to 2000 RPM NF**.

### Reversing Operation

Moving the propeller blades into a negative (beta) angle permits partial or full reversing of thrust on landing, significantly decreasing landing distance. Since the propeller is on the low pitch stop at landing, the hydraulic low pitch stop must be removed to select blade angles below +17°. As the power lever is raised from flight-idle and moved aft into the reverse range, a control run from the beta cam box to the beta valve assembly shifts the beta valve aft, rerouting CSU oil around the beta valve to the propeller servo-piston. This decreases blade angle, and the propeller enters the low idle position of **+11°**; further movement brings on the Beta Range indicator and increases NG to **85%–88%**. In full reverse, blade angle is approximately **−15°**.

### Power Turbine Governor

To protect the power turbine from possible overspeeding during forward thrust operation, the CSU governor features a power turbine (reset governor) section within the CSU housing. A pneumatic orifice and line connect the power turbine and the fuel control unit, controlled by the CSU flyweight head. Should NF enter an overspeed condition and the power turbine approach an undesirable rotational speed, since this governor is set to **6% above the maximum N2 RPM**, the flyweight head opens the orifice at that speed, venting modified P3 air and causing the fuel control unit's metering section to decrease fuel flow to the engine.

### Overspeed Governor

The overspeed governor controls propeller RPM should the CSU fail. It has no cockpit connections, as its speed setting is bench-set at **2080 RPM, or 104% NF**. Located on the left-hand side of the gearbox, it has its own flyweights and pilot valve, and regulates oil flow to the propeller servo-piston. Should the primary CSU governor fail, the overspeed unit senses propeller condition and routes oil flow from the servo-piston to the reduction gear housing, restricting NF from increasing further.

Because the overspeed governor is set 4% above maximum NF RPM, it cannot be tested under normal running conditions; instead, an electric solenoid mounted on the forward surface of the unit permits a test of its approximate setting only (not a guarantee of correct operation under real conditions). A cockpit switch energises the test solenoid, admitting oil to the unit's upper housing and decreasing spring pressure on the flyweight assembly; NG is then increased and the propeller tachometer observed — if NF RPM rises to approximately **1870+ RPM** and remains there while NG continues rising, the overspeed governor is assumed correctly set. Releasing the switch drains the oil and re-establishes speeder spring tension at the 2080 RPM setting.

### Auto-Feather System

In addition to manual feathering, the **auto-feather system** reduces the risk of feathering the operative engine/propeller — a critical mistake if the aircraft is climbing out after take-off and one engine fails. The sensing system for auto-feather is **torquemeter oil pressure**, present in the torque manifold, on which three components are mounted: the torque transmitter, the auto-ignition pressure switch, and the auto-feather pressure switch.

- The **auto-feather pressure switch** is set for approximately **200 foot-pounds** of torque.
- The **auto-ignition pressure switch** activates at approximately **400 foot-pounds** of torque.

A select switch on the pilot's panel and a microswitch in the power lever pedestal (closed when the power lever moves beyond **85%–90% NG**) arm the system: with the select switch at ARM and the power lever advanced beyond that range, current flows to the auto-ignition pressure switch contacts, illuminating a green auto-feather light to show the system is operational.

If an engine fails and torque drops below 400 ft-lbs, the auto-ignition pressure switch automatically selects the combustion igniters on the failing engine and gives continuity to the auto-feather dump solenoid valve (located on the overspeed governor); the serviceable engine's green indicator extinguishes and that engine is isolated from auto-feather. If torque continues to fall below 200 ft-lbs, the auto-feather pressure switch closes, completing the ground path for the auto-feather valve. When the valve opens, servo-piston oil dumps into the reduction gearbox sump and the propeller rapidly feathers; the failing engine's indicator light goes out, signifying auto-feather is occurring.

### Flight Range, Manual Feathering and Unfeathering

In the **Flight range**, system RPM is high enough for the propeller governor to operate in constant speed mode: advancing the power lever increases fuel flow, and the propeller governor increases blade angle to absorb the power increase and maintain selected RPM (coarsening the blade also pushes the beta valve into the governor, rendering it out of control); retarding the power lever has the opposite effect.

**Manual feathering** is achieved by moving the RPM lever rearwards through the minimum RPM position into feather, raising the pilot valve to dump servo piston oil; the feathering spring completes the operation. Because of the free turbine's characteristics, the engine continues to run when the propeller is feathered. **Unfeathering** only requires returning the RPM lever to the MAX position, lowering the pilot valve so oil is directed to the servo piston; since the engine is still running, servo oil compresses the feathering spring and the propeller returns to fine pitch and rotates.
        $cnt$,
        2
    ) RETURNING id INTO s1_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M17.2 Constant Speed Propeller (Pitch Control) (22 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s1_id, 'On the single acting (McCauley) constant speed propeller, hydraulic pressure from the governor (CSU) urges the blades toward:',
     '[{"id":"a","text":"Fine pitch, increasing RPM","correct":true},{"id":"b","text":"Coarse pitch, decreasing RPM","correct":false},{"id":"c","text":"The feather position only","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'On the single acting (McCauley) propeller, what prevents the blades from moving to the feather position when the engine is not operating?',
     '[{"id":"a","text":"A centrifugal latch mechanism","correct":true},{"id":"b","text":"The pressure operated cut out switch (POCOS)","correct":false},{"id":"c","text":"The beta valve","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'The purpose of the Constant Speed Unit (CSU) is to:',
     '[{"id":"a","text":"Maintain the RPM of the engine selected by the pilot, by directing oil to or from the propeller","correct":true},{"id":"b","text":"Directly control fuel flow to the engine at all times","correct":false},{"id":"c","text":"Maintain a fixed manifold pressure regardless of RPM setting","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'In a single acting propeller CSU, if RPM increases above the set value, the flyweights move out, the control valve moves up, and oil drains from the propeller through the CSU drive shaft. The result is that:',
     '[{"id":"a","text":"Spring pressure and the counterweights turn the blades to a greater angle, increasing load and decreasing RPM","correct":true},{"id":"b","text":"The blades immediately move to the feather position","correct":false},{"id":"c","text":"The blade angle is unaffected and RPM continues to rise","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'To feather a single acting propeller, the RPM lever is moved:',
     '[{"id":"a","text":"To the limit of its travel, opening an oilway that allows oil to drain from the propeller back to the engine","correct":true},{"id":"b","text":"Into the constant speed governing range","correct":false},{"id":"c","text":"To the maximum RPM position","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'On light aircraft with single acting propellers, the separate source of oil under pressure needed to begin unfeathering is provided by:',
     '[{"id":"a","text":"An accumulator, charged during normal operation","correct":true},{"id":"b","text":"The overspeed governor","correct":false},{"id":"c","text":"The feathering pump used on double acting propellers","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'During the ground operation check, the propeller is exercised from maximum to minimum and back a number of times mainly in order to:',
     '[{"id":"a","text":"Expel any air that may be in the oil and circulate warm oil to the working parts of the propeller","correct":true},{"id":"b","text":"Test the auto-feather pressure switches","correct":false},{"id":"c","text":"Calibrate the manifold pressure gauge","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'During the constant speed check, moving the propeller lever from maximum into the governing range (with cruise manifold pressure set) should produce an RPM reduction of approximately:',
     '[{"id":"a","text":"50 RPM","correct":false},{"id":"b","text":"200 RPM","correct":true},{"id":"c","text":"600 RPM","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'With the throttle setting fixed, if the propeller control is advanced to increase RPM, manifold pressure will:',
     '[{"id":"a","text":"Increase","correct":false},{"id":"b","text":"Decrease","correct":true},{"id":"c","text":"Remain completely unchanged","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'In double acting propellers, one type of mechanism connects the piston to the blade roots directly by links through seals in the cylinder (used on Rotol propellers). The other type uses:',
     '[{"id":"a","text":"A bevel gear meshed to gear segments attached to the root of each blade","correct":true},{"id":"b","text":"A rack and pinion assembly on each blade root","correct":false},{"id":"c","text":"A cable and pulley arrangement","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'The three main types of hydraulic pitch change mechanism described are moving piston, moving cylinder, and:',
     '[{"id":"a","text":"Geared or ''Hydromatic''","correct":true},{"id":"b","text":"Beta valve type","correct":false},{"id":"c","text":"Free turbine type","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'In the geared (Hydromatic) pitch change mechanism, the ''dog leg'' slots in the cams are cut in opposite directions in order to:',
     '[{"id":"a","text":"Double the movement of the inner cam","correct":true},{"id":"b","text":"Lock the blades automatically in the feather position","correct":false},{"id":"c","text":"Reduce the oil pressure required to change pitch","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'In a double acting propeller fitted to a piston engine, approximately what governor oil pressure from the CSU is needed to overcome centrifugal twisting moment and coarsen the blades?',
     '[{"id":"a","text":"Approximately 60 PSI","correct":false},{"id":"b","text":"Approximately 350 PSI","correct":true},{"id":"c","text":"Approximately 1,000 PSI","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'In a double acting CSU, during an underspeed condition the control valve closes the governor pump supply, drains oil from the front of the piston, and opens an engine oil supply to the rear of the piston. This pushes the piston forward and:',
     '[{"id":"a","text":"Rotates the blades into a finer pitch, allowing RPM to increase","correct":true},{"id":"b","text":"Rotates the blades directly into the feather position","correct":false},{"id":"c","text":"Has no effect on blade angle until the engine is shut down","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'On a double acting propeller, when the blades reach the fully feathered position, rising oil pressure in the delivery line operates a device that de-energises the feathering pump. This device is the:',
     '[{"id":"a","text":"Beta valve","correct":false},{"id":"b","text":"Pressure Operated Cut Out Switch (POCOS)","correct":true},{"id":"c","text":"Overspeed governor","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'On a turbo-propeller engine fitted with a Propeller Control Unit (PCU), a single power lever is connected to both the PCU and the fuel control unit primarily in order to:',
     '[{"id":"a","text":"Select RPM and fuel flow together, helping the engine overcome the combined inertia of the propeller and compressor during acceleration","correct":true},{"id":"b","text":"Allow the propeller pitch to be changed without affecting fuel flow at all","correct":false},{"id":"c","text":"Eliminate the need for governor weights in the PCU","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'In PCU operation, if the governor weights fly out and overcome the speeder spring load, moving the control valve UP, the propeller blades move to:',
     '[{"id":"a","text":"A coarser pitch, to decrease RPM","correct":true},{"id":"b","text":"A finer pitch, to increase RPM","correct":false},{"id":"c","text":"The full feather position immediately","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'On the free turbine turbo propeller system described, the design (hydraulic) low pitch stop blade angle is:',
     '[{"id":"a","text":"+11 degrees","correct":false},{"id":"b","text":"+17 degrees","correct":true},{"id":"c","text":"-15 degrees","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'On the free turbine turbo propeller system described, in full reverse the blade angle reaches approximately:',
     '[{"id":"a","text":"+17 degrees","correct":false},{"id":"b","text":"+11 degrees","correct":false},{"id":"c","text":"-15 degrees","correct":true}]',
     '{"B1","B2"}'),

    (s1_id, 'For the free turbine propeller system described, the normal CSU governing range is:',
     '[{"id":"a","text":"1700 to 2000 RPM NF","correct":true},{"id":"b","text":"0 to 1700 RPM NF","correct":false},{"id":"c","text":"2000 to 2080 RPM NF","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'The overspeed governor on the free turbine turbo propeller system is bench-set at:',
     '[{"id":"a","text":"1700 RPM (85% NF)","correct":false},{"id":"b","text":"2000 RPM (100% NF)","correct":false},{"id":"c","text":"2080 RPM (104% NF)","correct":true}]',
     '{"B1","B2"}'),

    (s1_id, 'The auto-feather system on the free turbine turbo propeller senses an engine/propeller problem through:',
     '[{"id":"a","text":"Torquemeter oil pressure","correct":true},{"id":"b","text":"Manifold pressure","correct":false},{"id":"c","text":"Exhaust gas temperature","correct":false}]',
     '{"B1","B2"}');

END $$;
