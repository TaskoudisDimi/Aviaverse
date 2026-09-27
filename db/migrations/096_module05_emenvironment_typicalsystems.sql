-- Module 05: Digital Techniques / Electronic Instrument Systems (B1/B2 Common)
-- Sub-Modules 14-15: Electromagnetic Environment, Typical Electronic/Digital Aircraft Systems
-- Source: EASA Part-66 Module 5 Study Notes

DO $$
DECLARE
    m05_id INT;
    s14_id INT;
    s15_id INT;
BEGIN
    SELECT id INTO m05_id FROM easa_modules WHERE code = 'M05';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M05.14') THEN
        RAISE NOTICE 'M05.14-M05.15 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 05.14: Electromagnetic Environment
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m05_id, 'M05.14', 'Electromagnetic Environment',
        $cnt$
# Electromagnetic Environment

## Four Acronyms, Fixed First

Students routinely muddle EMI, HIRF, lightning and EMC. Fix the definitions first and the rest of the sub-module falls into place.

| Term | What it means |
|------|---------------|
| **EMI — electromagnetic interference** | The unwanted energy itself. The problem. |
| **HIRF — high intensity radiated field** | A specific, severe external source of EMI — powerful ground transmitters, radars, broadcast masts, ships. |
| **Lightning** | A single enormous transient — an electromagnetic pulse plus a very large current through the structure. |
| **EMC — electromagnetic compatibility** | The goal. The state in which everything works together without interfering, and without being interfered with. |

Say it like this and you will not forget it: **EMI, HIRF and lightning are the threats. EMC is the objective.**

## How Interference Gets In

There are four coupling routes. Break any one of them and the interference does not arrive.

- **Conduction** — the interference travels along a wire that the source and the victim share, most often a common power feed or a common earth return.
- **Capacitive coupling** — an electric field between two conductors running close together. The two wires form a small capacitor, and fast-changing voltages couple across it.
- **Inductive coupling** — a magnetic field around a current-carrying conductor links a nearby loop and induces a voltage in it. Remember the right-hand grip rule: grip the conductor with the right hand, thumb pointing in the direction of current flow, and the fingers indicate the direction of the magnetic field, which circles the conductor at right angles to the current.
- **Radiation** — free-space electromagnetic waves. This is HIRF, and it is also how a lightning discharge affects equipment it never physically touches.

## Why It Has Become a Bigger Problem

This is worth understanding rather than memorising, because it explains everything that follows.

- **Voltages have fallen.** An old analogue system worked at 115 V AC. CMOS logic works at 3 V or less. An interference spike that was irrelevant against 115 volts is very significant against three.
- **Speeds have risen.** Clock rates of tens of megahertz and pulse rise times of a few nanoseconds. Fast edges radiate strongly and couple readily into adjacent tracks and wires — this is crosstalk.
- **Structure has changed.** An aluminium airframe is a superb natural Faraday cage. Carbon composite is far less conductive, so the free shielding that metal aircraft always enjoyed has largely gone.
- **Passengers bring transmitters.** Laptops, phones and tablets in the cabin are radiating sources a few feet from avionics wiring.

## Lightning

An aircraft in flight is struck reasonably often, and it is designed to be. The energy attaches at an extremity, travels through or across the structure, and leaves from another extremity. **Zone 1** areas are where an initial attachment is likely — nose, wingtips, tail extremities, engine nacelles. **Zone 2** is where the attachment point is swept back over the surface as the aircraft moves through the strike.

### Protection

- **Bonding.** Every panel, every component and every structural element must be electrically bonded to its neighbours, usually with metal braid straps, so the current has a continuous low-resistance path and never has to jump a gap. A spark near a fuel tank is the outcome being designed against.
- **Static wicks (static dischargers).** Fitted at the trailing edges of the wings, ailerons, elevators, rudder and wingtips. They allow precipitation static and accumulated charge to bleed off the airframe back into the atmosphere in a controlled way, at a point far from the radio antennas. Without them, the discharge happens at random points and generates radio noise.
- **Conductive layers in composites.** Because carbon composite conducts poorly, a conductive ply is built into the lay-up — nickel-coated graphite cloth, metal mesh, aluminised fibreglass or conductive paint.

### Composite Repairs — Read This Twice

After a structural repair to a composite panel you have restored the strength. You have not automatically restored the electrical conductivity, and the aircraft's lightning protection depends on it. The repair scheme will require the conductive layer to be re-established and all components bonded together, and it will call for a **conductivity check with an ohmmeter** across the repair to prove a minimum resistance is not exceeded. Skipping that check leaves an aircraft that looks repaired and is not protected.

### Lightning Detection

Because a discharge emits a distinctive electromagnetic signal, it can be located. An **ADF receiver with a loop antenna** determines the azimuth of the discharge, and the field strength or power density of the received signal indicates roughly how far away it is. The result is displayed as symbology overlaid on the weather radar page of the multifunction display, giving the crew a picture of dangerous weather to avoid.

## Achieving Electromagnetic Compatibility

EMC works on both ends of the problem at once: quieten the sources and harden the victims.

### On Emission

Equipment that generates interference is kept within specified limits by filtering and shielding. Switching power supplies, motors, relays and high-speed digital circuits are the usual offenders.

### On Susceptibility

Equipment is designed to tolerate the residual interference that cannot be removed. Requirements are placed on both the equipment and its installation:

- **Segregation of wiring** — power, signal and sensitive low-level looms are routed separately, with specified minimum separations, and crossings are made at right angles.
- **Screening and bonding of racks**, and RF sealing of equipment enclosures.
- **Faraday cage construction inside the LRU.** Following MIL-STD-461, an LRU is laid out with the sensitive electronics in a shielded compartment on one side of the enclosure and the noisy items — the power supply above all — isolated on the other. Every signal entering the clean side is filtered to remove spikes and surges.
- **Shielded and grounded cabling** throughout, protecting the wiring from cabin electronics, from HIRF and from lightning transients.

### In the Hangar — The Part That Is Genuinely Yours

When you open an LRU, you break its Faraday cage. When you close it, every screw, every gasket, every internal shield and every bonding strap must go back exactly as it was. A single missing screw on a shielded lid changes the enclosure from a shield into a slot antenna.

Do not re-route a loom to make it tidier or easier. The separation between that loom and the one next to it was calculated. Restore wiring to the routing shown in the manual, in the same clamps, in the same order.

Bonding straps are not earthing straps you can substitute at will. Length, material and termination all matter. Replace like for like.

Corrosion under a bonding point defeats it completely while looking perfectly serviceable. Clean to bright metal and re-protect.

Ultimately EMC is maintained, not just designed. It is the technician who determines whether the aircraft still meets the standard it was certified to.
        $cnt$,
        14
    ) RETURNING id INTO s14_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 05.15: Typical Electronic/Digital Aircraft Systems
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m05_id, 'M05.15', 'Typical Electronic/Digital Aircraft Systems',
        $cnt2$
# Typical Electronic/Digital Aircraft Systems

## Introduction

This is the sub-module where everything else pays off. You are not expected to be a specialist on any one of these systems — that is what the type course is for. You are expected to know, for each one, what it does, roughly how it does it, and what feeds it.

## Engine Indication and Crew Alerting

Both EICAS and ECAM present engine parameters and system status, and both raise and prioritise alerts. Both use two display units and two independent computers with automatic changeover if one fails. The difference is in what happens after the message appears.

On a **Boeing with EICAS**, the message tells the crew what has happened; they then go to a checklist to find out what to do. Synoptic pages showing hydraulics, electrics, fuel and so on are called up manually. Alerts are graded **warning, caution and advisory**.

On an **Airbus with ECAM**, the message is the checklist. The failure title appears on the engine/warning display with the required actions listed underneath, item by item, and lines are removed as each is completed. The relevant synoptic page appears automatically on the system display. Alerts are graded by **level 3, 2 and 1** according to urgency. When the drill is complete, a **STATUS page** summarises the remaining limitations.

## Electronic Flight Instrument System

Recall the chain: sensors feed symbol generators, symbol generators drive display units, and the display control panel tells the symbol generator what format to produce. Remember the comparator function, and remember that a symbol generator failure typically affects more than one screen.

## Inertial Reference System

An inertial system measures the aircraft's own motion and works out where it must therefore be. Three accelerometers measure acceleration along three axes and three gyros measure rotation about them. Integrate acceleration once and you have velocity; integrate again and you have distance travelled. Add that to a known starting position and you have present position.

Modern units are **strapdown** — the sensors are bolted to the airframe and the levelling is done mathematically, rather than physically on a gimballed stable platform. The rate sensors are usually **ring laser gyros**: two laser beams travel in opposite directions around a triangular cavity in a block of glass. Rotation makes one path effectively longer than the other and the resulting fringe shift is a direct measure of turn rate. There are no moving parts, so reliability is excellent and warm-up is short.

Smaller aircraft increasingly use **MEMS** — micro-electro-mechanical systems — where tiny vibrating piezoelectric structures only a few millimetres across are integrated onto a chip, giving accelerometer and rate outputs at very low weight and cost.

### Two Things About IRS That Get Examined

- **Alignment.** The system must be aligned on the ground, stationary, for typically seven to ten minutes while it finds true north from the earth's rotation and levels itself. The aircraft must not be moved. Interrupt the alignment and it starts again.
- **Drift.** Errors accumulate with time, typically in the order of a couple of nautical miles per hour of flight. This is not a fault; it is inherent. The FMS therefore mixes IRS position with GPS and DME/DME fixes to keep the computed position accurate.

## Global Positioning System

A constellation of at least twenty-four satellites in six orbital planes at around 20,200 km ensures that at least four are in view from anywhere on earth at any time. Each broadcasts its identity, its precise position and an extremely accurate time signal.

The receiver measures how long each signal took to arrive and multiplies by the speed of light to get the range to that satellite. Three ranges would fix a position in three dimensions if the receiver's own clock were perfect — but a receiver cannot carry an atomic clock, so its clock error is a fourth unknown. That is why a fourth satellite is needed: four measurements solve for latitude, longitude, altitude and clock error together.

Accuracy is improved further by augmentation — SBAS systems such as WAAS in America and EGNOS in Europe broadcast correction data from geostationary satellites, and GBAS provides local corrections from a ground station at an airfield, which is what permits GPS-based precision approaches.

## Flight Management System

The flight management computer is the aircraft's navigator and performance engineer combined. It holds a **navigation database** of waypoints, airways, airfields, procedures and navigation aids, updated on a 28-day cycle, and a **performance database** describing how this particular aircraft type flies.

From those, plus position data from the IRS, GPS and radio aids, plus air data, fuel and engine parameters, it computes the lateral route (LNAV) and the vertical profile (VNAV), including the most economical speeds and the top-of-descent point. It then commands the autopilot and autothrottle to fly that profile and paints the plan on the navigation display.

The crew interface is the **control display unit (CDU or MCDU)** — the keyboard and screen on the centre pedestal. The FMS never moves a control surface itself; it tells the autoflight system what to do.

## Traffic Alert and Collision Avoidance System

TCAS works by interrogating the transponders of other aircraft. It transmits on 1030 MHz and listens on 1090 MHz, exactly like a ground secondary radar. From the reply timing it derives range, from the reply's altitude report it derives relative altitude, and from the rate of change of both it computes the time to the closest point of approach.

Warnings come in two grades. A **traffic advisory (TA)** appears roughly 20 to 48 seconds before the closest point of approach; it is amber, it is information only, and the crew must not manoeuvre on it. A **resolution advisory (RA)** follows at roughly 15 to 35 seconds; it is red and it commands a vertical manoeuvre — climb, descend, or maintain vertical speed. Two TCAS II units in conflicting aircraft coordinate with each other so that one is told to climb and the other to descend.

### The Limitation That Matters

TCAS can only see aircraft carrying an operating transponder. An aircraft with no transponder, or with it switched off or failed, is completely invisible to TCAS. TCAS II gives vertical guidance only — it never commands a turn.

## Fly by Wire

In a conventional aircraft, cables or pushrods run from the control column to the surfaces. In a fly-by-wire aircraft they do not. A transducer converts the pilot's input into an electrical signal, flight control computers process it, and actuator control electronics drive hydraulic or electro-hydrostatic actuators at the surfaces.

The immediate advantages are weight, and the removal of friction and backlash. The real advantage is **flight envelope protection**: because a computer sits between the pilot and the surface, it can decline to do something damaging. The aircraft can be prevented from stalling, from exceeding its speed limits and from being over-stressed, whatever the pilot demands.

The obvious risk is equally clear, and the design answers it with redundancy: multiple computers, often of dissimilar design and written by separate teams so that a common software error cannot affect them all, multiple independent electrical supplies, physically segregated wiring routes, and a back-up mode — either a direct law with protections removed, or on some types a limited mechanical reversion.

## Integrated Modular Avionics and BITE

In an IMA installation, generic processing modules in a shared cabinet host many different functions as software partitions, using common power supplies, cooling and a common backplane. **ARINC 653** provides the time and memory partitioning that makes mixed criticality acceptable. The result is a very large saving in weight, wiring and spares, at the cost of much greater dependence on the integrity of the partitioning.

### Built-In Test Equipment

BITE is the aircraft's own diagnostic capability, and it is what makes modern maintenance possible. Each computer monitors itself and its inputs continuously, and stores fault data in non-volatile memory along with the flight leg and the time it occurred. A central maintenance computer on larger aircraft correlates reports from every system, so that one root cause does not appear as fifteen separate snags.

You interrogate BITE through a maintenance page on the CDU or a dedicated maintenance terminal, and it will normally identify the suspect LRU and often the specific interface or parameter.

### BITE — Use It, But Do Not Trust It Blindly

BITE reports what a computer believes. A box reporting "no data from ADC 2" may have a fault of its own, a wiring fault, or a genuinely failed ADC 2. The message narrows the search; it does not end it. Always note the sequence and flight leg of stored faults — the first fault in a cascade is usually the real one and everything after it is a consequence. Clear the BITE memory after rectification and run a system test, or the next engineer will chase your fault.

## ACARS, Cabin Systems and Information Systems

**ACARS** — the Aircraft Communications Addressing and Reporting System — is a datalink for short text messages between the aircraft and the airline, sent over VHF where coverage allows and over satcom or HF elsewhere. It carries the automatic **OOOI** reports (out of the gate, off the ground, on the ground, into the gate), position and fuel reports, load sheets, weather, clearances, and — importantly for maintenance — automatic fault reports from the aircraft's BITE, so that the engineering department knows what is wrong before the aircraft lands.

**Cabin systems** cover the cabin interphone, passenger address, passenger service units, lighting, the cabin management terminal used by the crew, and in-flight entertainment. The entertainment system is Level E software and is typically the largest single computer network on the aircraft, physically separated from the avionics networks — which is precisely the point.

**Information systems** cover the electronic flight bag, the onboard network server holding manuals, charts and performance data, and the electronic logbook. The certification boundary between these and the flight-critical systems is deliberately and rigorously enforced: an aircraft information domain may read data from the avionics domain but must never be able to write to it.
        $cnt2$,
        15
    ) RETURNING id INTO s15_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M05.14 Electromagnetic Environment (15 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s14_id, 'EMI (electromagnetic interference) is best described as:',
     '[{"id":"a","text":"The unwanted electromagnetic energy itself — the problem","correct":true},{"id":"b","text":"The state in which equipment neither causes nor suffers interference","correct":false},{"id":"c","text":"A severe external radiated source such as a ground radar","correct":false}]',
     '{"B1","B2"}'),

    (s14_id, 'HIRF (high intensity radiated field) refers specifically to:',
     '[{"id":"a","text":"A single enormous transient with a very large current through the structure","correct":false},{"id":"b","text":"A specific, severe external source of EMI, such as powerful ground transmitters, radars, broadcast masts or ships","correct":true},{"id":"c","text":"The general background noise generated inside an LRU","correct":false}]',
     '{"B1","B2"}'),

    (s14_id, 'EMC (electromagnetic compatibility) is:',
     '[{"id":"a","text":"A threat alongside EMI and HIRF","correct":false},{"id":"b","text":"The goal — the state in which everything works together without interfering and without being interfered with","correct":true},{"id":"c","text":"Another name for a lightning transient","correct":false}]',
     '{"B1","B2"}'),

    (s14_id, 'Regarding the relationship between the four key terms of this sub-module, it is correct to say that:',
     '[{"id":"a","text":"EMI, HIRF and lightning are the threats; EMC is the objective","correct":true},{"id":"b","text":"EMC, HIRF and lightning are the threats; EMI is the objective","correct":false},{"id":"c","text":"All four terms describe the same phenomenon","correct":false}]',
     '{"B1","B2"}'),

    (s14_id, 'The four routes by which electromagnetic energy couples into a victim circuit are:',
     '[{"id":"a","text":"Conduction, capacitive coupling, inductive coupling and radiation","correct":true},{"id":"b","text":"Bonding, screening, filtering and earthing","correct":false},{"id":"c","text":"Reflection, refraction, diffraction and absorption","correct":false}]',
     '{"B1","B2"}'),

    (s14_id, 'Conduction, as a coupling route for interference, occurs when:',
     '[{"id":"a","text":"An electric field couples across two conductors running close together","correct":false},{"id":"b","text":"The interference travels along a wire shared by the source and the victim, such as a common power feed or earth return","correct":true},{"id":"c","text":"Free-space electromagnetic waves strike the victim equipment directly","correct":false}]',
     '{"B1","B2"}'),

    (s14_id, 'The right-hand grip rule, used to explain inductive coupling, states that if the thumb points in the direction of current flow:',
     '[{"id":"a","text":"The fingers indicate the direction of the magnetic field circling the conductor","correct":true},{"id":"b","text":"The fingers indicate the direction of the electric field along the conductor","correct":false},{"id":"c","text":"The palm indicates the point of maximum capacitive coupling","correct":false}]',
     '{"B1","B2"}'),

    (s14_id, 'Radiation, as a coupling route, is significant because it is:',
     '[{"id":"a","text":"Only relevant to conducted interference on shared power feeds","correct":false},{"id":"b","text":"The mechanism of HIRF, and also how a lightning discharge can affect equipment it never physically touches","correct":true},{"id":"c","text":"Eliminated entirely by segregating wiring looms","correct":false}]',
     '{"B1","B2"}'),

    (s14_id, 'One reason EMC has become harder to achieve on modern aircraft is that:',
     '[{"id":"a","text":"CMOS logic operating at 3 V or less is far more easily upset by a given interference spike than older 115 V AC systems","correct":true},{"id":"b","text":"Modern aircraft no longer carry any digital equipment","correct":false},{"id":"c","text":"Aluminium structure has replaced composite structure on modern aircraft","correct":false}]',
     '{"B1","B2"}'),

    (s14_id, 'Compared with an aluminium airframe, carbon composite structure is a poorer natural shield because:',
     '[{"id":"a","text":"It is far less electrically conductive, so the free shielding aluminium provided has largely gone","correct":true},{"id":"b","text":"It attracts lightning strikes more frequently than aluminium","correct":false},{"id":"c","text":"It cannot carry any conductive layer at all","correct":false}]',
     '{"B1","B2"}'),

    (s14_id, 'Zone 1 areas of an aircraft, in the context of lightning strikes, are:',
     '[{"id":"a","text":"Areas where the attachment point is swept back over the surface as the aircraft moves","correct":false},{"id":"b","text":"Areas where an initial lightning attachment is likely, such as the nose, wingtips, tail extremities and engine nacelles","correct":true},{"id":"c","text":"Areas that are entirely immune to lightning attachment","correct":false}]',
     '{"B1","B2"}'),

    (s14_id, 'Static wicks are fitted at the trailing edges of the wings, ailerons, elevators, rudder and wingtips in order to:',
     '[{"id":"a","text":"Increase the aircraft''s natural radio transmission range","correct":false},{"id":"b","text":"Allow precipitation static to bleed off the airframe in a controlled way, away from the radio antennas","correct":true},{"id":"c","text":"Provide the initial attachment point for a lightning strike","correct":false}]',
     '{"B1","B2"}'),

    (s14_id, 'After a structural repair to a composite panel, in addition to restoring the mechanical strength, the repair scheme must:',
     '[{"id":"a","text":"Re-establish the conductive layer and bonding, verified by a conductivity check with an ohmmeter","correct":true},{"id":"b","text":"Increase the panel thickness to compensate for lost conductivity","correct":false},{"id":"c","text":"Remove any static wicks in the vicinity of the repair","correct":false}]',
     '{"B1","B2"}'),

    (s14_id, 'A lightning discharge can be located for display to the flight crew by:',
     '[{"id":"a","text":"An ADF receiver with a loop antenna, which determines azimuth, with received field strength indicating distance, overlaid on the weather radar display","correct":true},{"id":"b","text":"Measuring the resistance of the airframe bonding straps in real time","correct":false},{"id":"c","text":"A dedicated lightning transponder fitted only to Zone 2 areas","correct":false}]',
     '{"B1","B2"}'),

    (s14_id, 'Inside an LRU built to MIL-STD-461 principles, the Faraday cage construction typically places:',
     '[{"id":"a","text":"The power supply and sensitive electronics together in one unshielded compartment","correct":false},{"id":"b","text":"Sensitive electronics in a shielded compartment on one side, with noisy items such as the power supply isolated on the other, and filtering on signals entering the clean side","correct":true},{"id":"c","text":"All components unshielded, relying entirely on external airframe bonding","correct":false}]',
     '{"B1","B2"}'),

    (s14_id, 'When an LRU with a shielded lid is reassembled in the hangar and a single screw is left out, the effect is that:',
     '[{"id":"a","text":"There is no measurable effect on the enclosure''s shielding","correct":false},{"id":"b","text":"The enclosure is changed from a shield into a slot antenna","correct":true},{"id":"c","text":"Only the equipment''s susceptibility to lightning, not HIRF, is affected","correct":false}]',
     '{"B1","B2"}'),

    (s14_id, 'When restoring a wiring loom after maintenance, a technician should:',
     '[{"id":"a","text":"Re-route the loom to whatever path is tidier or easier to work with","correct":false},{"id":"b","text":"Restore the wiring to the routing shown in the manual, in the same clamps and in the same order, since the separation from adjacent looms was calculated","correct":true},{"id":"c","text":"Combine it with any nearby loom to reduce the number of clamps required","correct":false}]',
     '{"B1","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M05.15 Typical Electronic/Digital Aircraft Systems (24 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s15_id, 'The principal philosophical difference between EICAS and ECAM is that:',
     '[{"id":"a","text":"EICAS tells the crew what has happened and they refer to a separate checklist, whereas an ECAM message is itself the checklist with actions listed underneath","correct":true},{"id":"b","text":"EICAS is fitted only to Airbus aircraft and ECAM only to Boeing aircraft","correct":false},{"id":"c","text":"ECAM uses a single display unit and computer, while EICAS uses two of each","correct":false}]',
     '{"B1","B2"}'),

    (s15_id, 'On a Boeing aircraft with EICAS, alerts are graded as:',
     '[{"id":"a","text":"Warning, caution and advisory","correct":true},{"id":"b","text":"Level 3, 2 and 1","correct":false},{"id":"c","text":"Red, amber and status only","correct":false}]',
     '{"B1","B2"}'),

    (s15_id, 'On an Airbus with ECAM, once the failure drill is complete, the STATUS page:',
     '[{"id":"a","text":"Clears automatically without displaying any information","correct":false},{"id":"b","text":"Summarises the remaining limitations","correct":true},{"id":"c","text":"Repeats the original failure title only","correct":false}]',
     '{"B1","B2"}'),

    (s15_id, 'In the EFIS chain described for this sub-module, the correct sequence is:',
     '[{"id":"a","text":"Sensors feed symbol generators, which drive the display units, with the display control panel telling the symbol generator what format to produce","correct":true},{"id":"b","text":"Display units feed symbol generators, which drive the sensors","correct":false},{"id":"c","text":"The display control panel feeds the sensors directly, bypassing the symbol generators","correct":false}]',
     '{"B1","B2"}'),

    (s15_id, 'An inertial reference system determines present position by:',
     '[{"id":"a","text":"Comparing GPS satellite ranges only, without any onboard sensors","correct":false},{"id":"b","text":"Integrating measured acceleration once to get velocity and again to get distance travelled, then adding this to a known starting position","correct":true},{"id":"c","text":"Directly measuring distance travelled with a mechanical odometer linked to the wheels","correct":false}]',
     '{"B1","B2"}'),

    (s15_id, 'A modern IRS is described as "strapdown" because:',
     '[{"id":"a","text":"The sensors are bolted directly to the airframe and levelling is done mathematically, rather than on a gimballed stable platform","correct":true},{"id":"b","text":"It is physically strapped to the pilot''s seat for portability","correct":false},{"id":"c","text":"It uses a mechanical gimballed platform rather than mathematical levelling","correct":false}]',
     '{"B1","B2"}'),

    (s15_id, 'In a ring laser gyro, rotation is detected because:',
     '[{"id":"a","text":"Two laser beams travelling in opposite directions around a cavity develop a path-length difference, producing a fringe shift that is a direct measure of turn rate","correct":true},{"id":"b","text":"A single spinning mechanical rotor precesses under an applied torque","correct":false},{"id":"c","text":"A piezoelectric crystal vibrates at a frequency proportional to rotation rate","correct":false}]',
     '{"B1","B2"}'),

    (s15_id, 'MEMS inertial sensors, increasingly used on smaller aircraft, are based on:',
     '[{"id":"a","text":"Large mechanical gyroscopes mounted on a gimballed platform","correct":false},{"id":"b","text":"Tiny vibrating piezoelectric structures integrated onto a chip","correct":true},{"id":"c","text":"Two counter-rotating laser beams in a triangular cavity","correct":false}]',
     '{"B1","B2"}'),

    (s15_id, 'IRS alignment, performed on the ground before flight, typically takes:',
     '[{"id":"a","text":"Seven to ten minutes, during which the aircraft must remain stationary","correct":true},{"id":"b","text":"Less than thirty seconds, and the aircraft may taxi during the process","correct":false},{"id":"c","text":"Several hours, and can only be performed in a hangar","correct":false}]',
     '{"B1","B2"}'),

    (s15_id, 'IRS position drift, which accumulates at roughly a couple of nautical miles per hour of flight, is corrected in practice by:',
     '[{"id":"a","text":"Shutting the IRS down and realigning it in flight","correct":false},{"id":"b","text":"The FMS mixing IRS position with GPS and DME/DME fixes","correct":true},{"id":"c","text":"Doubling the number of accelerometers fitted","correct":false}]',
     '{"B1","B2"}'),

    (s15_id, 'The GPS constellation is arranged so that:',
     '[{"id":"a","text":"At least twenty-four satellites in six orbital planes ensure at least four are visible from anywhere on earth at any time","correct":true},{"id":"b","text":"A single geostationary satellite provides continuous global coverage","correct":false},{"id":"c","text":"Only three satellites are ever required to be in view simultaneously","correct":false}]',
     '{"B1","B2"}'),

    (s15_id, 'A GPS receiver needs a signal from a fourth satellite, beyond the three needed to fix a three-dimensional position, because:',
     '[{"id":"a","text":"The receiver cannot carry an atomic clock, so its own clock error is a fourth unknown that must also be solved for","correct":true},{"id":"b","text":"Three satellites are never simultaneously visible from an aircraft in flight","correct":false},{"id":"c","text":"A fourth satellite is required purely as a communications relay","correct":false}]',
     '{"B1","B2"}'),

    (s15_id, 'GBAS (ground-based augmentation) improves GPS accuracy by:',
     '[{"id":"a","text":"Broadcasting correction data from geostationary satellites over a wide area","correct":false},{"id":"b","text":"Providing local corrections from a ground station at an airfield, permitting GPS-based precision approaches","correct":true},{"id":"c","text":"Increasing the number of satellites broadcast to the receiver","correct":false}]',
     '{"B1","B2"}'),

    (s15_id, 'The two databases held by a flight management computer are:',
     '[{"id":"a","text":"A navigation database, updated on a 28-day cycle, and a performance database describing how the aircraft type flies","correct":true},{"id":"b","text":"A weather database and a fuel database, both updated daily","correct":false},{"id":"c","text":"A single combined database updated annually","correct":false}]',
     '{"B1","B2"}'),

    (s15_id, 'The FMS relationship to the autoflight system is best described as:',
     '[{"id":"a","text":"The FMS moves the control surfaces directly, bypassing the autopilot","correct":false},{"id":"b","text":"The FMS computes the lateral and vertical profile and commands the autopilot and autothrottle to fly it, but never moves a control surface itself","correct":true},{"id":"c","text":"The FMS has no connection to the autopilot or autothrottle","correct":false}]',
     '{"B1","B2"}'),

    (s15_id, 'The crew interface to the flight management system is the:',
     '[{"id":"a","text":"Control display unit (CDU or MCDU) on the centre pedestal","correct":true},{"id":"b","text":"Overhead panel switches only","correct":false},{"id":"c","text":"Standby attitude indicator","correct":false}]',
     '{"B1","B2"}'),

    (s15_id, 'TCAS derives range to another aircraft by:',
     '[{"id":"a","text":"Interrogating its transponder on 1030 MHz and timing the reply received on 1090 MHz","correct":true},{"id":"b","text":"Measuring the Doppler shift of the other aircraft''s VHF radio transmissions","correct":false},{"id":"c","text":"Reading the other aircraft''s GPS position directly from a shared database","correct":false}]',
     '{"B1","B2"}'),

    (s15_id, 'The correct crew response to a TCAS traffic advisory (TA), as opposed to a resolution advisory (RA), is that:',
     '[{"id":"a","text":"A TA is amber and information only; the crew must not manoeuvre on it, unlike an RA which commands a vertical manoeuvre","correct":true},{"id":"b","text":"Both a TA and an RA command an identical vertical manoeuvre","correct":false},{"id":"c","text":"A TA commands a turn while an RA commands a vertical manoeuvre","correct":false}]',
     '{"B1","B2"}'),

    (s15_id, 'The major operational limitation of TCAS is that:',
     '[{"id":"a","text":"It can only detect aircraft carrying an operating transponder, and gives vertical guidance only","correct":true},{"id":"b","text":"It can command horizontal turns but never vertical manoeuvres","correct":false},{"id":"c","text":"It only functions above 20,000 feet","correct":false}]',
     '{"B1","B2"}'),

    (s15_id, 'In a fly-by-wire aircraft, the signal path from the pilot''s control input to the surface is:',
     '[{"id":"a","text":"A transducer converts the input to an electrical signal, flight control computers process it, and actuator control electronics drive the actuators","correct":true},{"id":"b","text":"Cables and pushrods run directly from the control column to the surface, as in a conventional aircraft","correct":false},{"id":"c","text":"A hydraulic line runs directly from the control column to the actuator with no electronic processing","correct":false}]',
     '{"B1","B2"}'),

    (s15_id, 'The real advantage of fly-by-wire, beyond weight saving and removal of friction and backlash, is:',
     '[{"id":"a","text":"Flight envelope protection, whereby the computer can decline to let the aircraft stall, overspeed or be over-stressed","correct":true},{"id":"b","text":"The complete elimination of any need for redundant computers","correct":false},{"id":"c","text":"Removing the need for any electrical power supply to the flight controls","correct":false}]',
     '{"B1","B2"}'),

    (s15_id, 'Redundancy in a fly-by-wire system is achieved partly by using multiple computers of dissimilar design, written by separate teams, because this:',
     '[{"id":"a","text":"Ensures a common software error cannot affect all the computers at once","correct":true},{"id":"b","text":"Reduces the total number of computers required to just one","correct":false},{"id":"c","text":"Removes the need for a back-up control law or mechanical reversion","correct":false}]',
     '{"B1","B2"}'),

    (s15_id, 'In an integrated modular avionics (IMA) installation, ARINC 653 is significant because it:',
     '[{"id":"a","text":"Defines the wiring colour code used throughout the IMA cabinet","correct":false},{"id":"b","text":"Provides the time and memory partitioning that makes mixed criticality of software functions on shared modules acceptable","correct":true},{"id":"c","text":"Specifies the physical dimensions of the IMA cabinet only","correct":false}]',
     '{"B1","B2"}'),

    (s15_id, 'BITE (built-in test equipment) fault data is normally interrogated by the technician via:',
     '[{"id":"a","text":"A maintenance page on the CDU or a dedicated maintenance terminal","correct":true},{"id":"b","text":"Physically disassembling every suspect LRU in turn","correct":false},{"id":"c","text":"A separate paper logbook maintained only by the flight crew","correct":false}]',
     '{"B1","B2"}'),

    (s15_id, 'When investigating a cascade of stored BITE faults, the correct approach is to recognise that:',
     '[{"id":"a","text":"The last fault recorded in the sequence is always the root cause","correct":false},{"id":"b","text":"The first fault in the cascade, by flight leg and sequence, is usually the real one and the rest are consequences","correct":true},{"id":"c","text":"All faults in a cascade must have entirely unrelated causes","correct":false}]',
     '{"B1","B2"}'),

    (s15_id, 'ACARS carries, among other things, automatic OOOI reports, which stand for:',
     '[{"id":"a","text":"Out of the gate, off the ground, on the ground, into the gate","correct":true},{"id":"b","text":"Oil, oxygen, operations and instrumentation status","correct":false},{"id":"c","text":"Origin, operator, order and itinerary","correct":false}]',
     '{"B1","B2"}'),

    (s15_id, 'The in-flight entertainment system on a modern aircraft is:',
     '[{"id":"a","text":"Level E software, typically the largest single computer network on the aircraft, and physically separated from the avionics networks","correct":true},{"id":"b","text":"Integrated onto the same physical network as the avionics systems for efficiency","correct":false},{"id":"c","text":"Classified at the same design assurance level as the flight control computers","correct":false}]',
     '{"B1","B2"}'),

    (s15_id, 'Regarding the certification boundary between an aircraft information domain (such as an electronic flight bag network) and the avionics domain:',
     '[{"id":"a","text":"The information domain may read data from the avionics domain but must never be able to write to it","correct":true},{"id":"b","text":"The avionics domain may freely write data into the information domain","correct":false},{"id":"c","text":"There is no enforced boundary between the two domains","correct":false}]',
     '{"B1","B2"}');

END $$;
