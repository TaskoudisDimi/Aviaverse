-- Module 06: Materials and Hardware — Control Cables, Electrical Cables and Connectors
-- Source: EASA Part-66 Module 6 official study notes, Sub-Modules 6.10, 6.11

DO $$
DECLARE
    m06_id INT;
    s10_id INT;
    s11_id INT;
BEGIN
    SELECT id INTO m06_id FROM easa_modules WHERE code = 'M06';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M06.10') THEN
        RAISE NOTICE 'M06.10-M06.11 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 06.10: Control Cables
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m06_id, 'M06.10', 'Control Cables',
        $cnt$
# Control Cables

## Cable Construction

A control cable is built up in stages: wires are laid into a strand, and strands are laid around a central strand to form the cable. The designation tells you both numbers.

| Designation | Meaning | Sizes and Use |
|-------------|---------|----------------|
| **7 x 7** | 7 strands of 7 wires (49 wires) | 1/16 to 3/32 in — flexible; trim tab controls, light and low-load systems |
| **7 x 19** | 7 strands of 19 wires (133 wires) | 1/8 in and above — extra flexible; primary flight controls that run over pulleys |
| **1 x 7 / 1 x 19** | A single strand of 7 or 19 wires | Non-flexible — straight runs and bracing wires only, never over a pulley |

- **Materials**: carbon steel, galvanised or tinned (strong, cheaper, but corrodes if the coating is broken) and corrosion-resistant steel (slightly lower strength for the same size, used in wheel wells, bilges and any wet or exposed area). Some cables are nylon coated for corrosion protection — which also hides broken wires, so inspect these by feel and by careful examination.
- Cable size is quoted by diameter (1/16, 3/32, 1/8, 5/32, 3/16 in...). Each size has a specified breaking strength.
- The wires are preformed into their final helical shape before laying up, so a cut end does not unravel and the cable lies quietly on the pulley.

## End Fittings

- **Swaged terminals** — the standard modern method: the terminal is compressed onto the cable in a swaging machine, developing the full rated strength of the cable. Types: threaded end, fork end, eye end, single shank ball end and double shank ball end.
- Ball ends are used at quadrants and drums where space is tight. Threaded, fork and eye ends connect to turnbuckles, bellcranks and levers.
- **Swaging inspection**: check the finished diameter with a go/no-go gauge, check the length, look for cracks, and confirm the cable is fully inserted (a witness/inspection hole or a paint mark is used to prove it).
- **Nicopress (swaged sleeve) splice** — a copper sleeve compressed over a cable loop around a thimble. Develops full cable strength when the correct tool and sleeve are used, and is acceptable as a field method.
- **Woven (5-tuck) splice** — the traditional hand splice around a thimble; develops only about 75% of cable strength and is now rare.
- **Thimble, bushing and shackle** — used with a spliced loop to protect the cable from crushing at the attachment.

## Turnbuckles and Tension

- A turnbuckle is a barrel with a right-hand thread at one end and a left-hand thread at the other, so turning it lengthens or shortens the cable run and sets the tension.
- The left-hand end is identified by a groove machined around the barrel end (or by flats on the terminal).
- Not more than **three threads** may be exposed on either terminal when adjustment is complete — this is checked by inserting a piece of wire into the inspection hole: if it goes in, too much thread is showing.
- **Locking**: double-wrap or single-wrap safety wire through the terminal eyes and around the barrel, or a clip-type (Nielsen) locking device — a spring clip snapped into the barrel groove and the terminal slot. Clip type is quick but only for certain turnbuckle types.
- Cable tension is set with a **tensiometer**, which pushes a riser against the cable between two anvils and reads the force needed. Each instrument has its own calibration card giving the conversion for cable size and riser number.
- **Temperature matters**: the airframe and the cable expand at different rates, so tension is set against a cable rigging chart for the ambient temperature. Rig a cold-soaked or sun-baked aircraft to the "book" figure and it will be wrong when it flies.
- **Cable tension regulators** are fitted to some large aircraft: a spring-loaded quadrant assembly that automatically maintains constant tension as the airframe expands and contracts, so no seasonal re-rigging is needed.

## Cable System Components

- **Pulleys** — guide and change the direction of a cable. Fitted with sealed bearings; must be aligned so the cable runs in the centre of the groove, and every pulley must have a cable guard pin close to it to stop the cable jumping out when slack.
- **Pulley defects**: worn or grooved rim, flat spots, seized or rough bearing, and the tell-tale worn groove pattern that shows misalignment.
- **Fairleads** — phenolic, nylon or rubbed blocks that support a cable and prevent it from whipping or fouling. A cable may be deflected not more than 3 degrees by a fairlead. Wear limits are given as a maximum reduction of the original thickness.
- **Pressure seals** — where a cable passes through a pressure bulkhead. The cable must not be deflected as it passes through, and a swaged fitting must not be dragged through the seal.
- **Bellcranks, quadrants, sectors, levers and torque tubes** — convert and redirect the motion. Check for cracks, worn bushes, elongated holes and security.
- **Push-pull (control) rods** — a tube with adjustable rod ends, used where the load reverses and a cable would go slack. The check ("witness") hole in the rod end shows that the threaded shank is screwed in far enough — if the wire will not enter the hole, engagement is correct.
- **Cable drums** — used where a cable must wind on and off, as in trim systems.
- **Bowden cable** — a flexible inner wire sliding inside a flexible outer conduit, so drive can be routed round corners with no pulleys. It can only pull; a return spring is needed at the far end. Used for engine controls, carburettor heat, brakes on light aircraft.
- **Teleflex** — a push-pull flexible control that can transmit load in both directions — a wound cable or rack running in a conduit.

## Rigging, Inspection and Defects

**Rigging basics**

- Set the control surfaces to neutral using rigging pins and boards, adjust the cable tension with the turnbuckles, then check the full and free travel against the stops.
- Primary stops are at the control surface; secondary stops are at the cockpit control. The primary stops take the load — the secondary ones must be reached only after the primary.
- Check for cable interference, correct routing, correct sense (moving the control the right way — the classic and lethal rigging error), and full travel with no fouling of structure or wiring.
- **Spring-back** — after the control is moved to the stop and released, a properly tensioned system springs back slightly. Excessive spring-back means the cables are too slack or the system is stretching.

**Inspecting cables**

- **Broken wires** — draw a clean, dry cloth along the run; snags mark the spot. Check especially at pulleys, fairleads and where the cable enters a fitting.
- Limits are given per unit length, typically no more than 3 broken wires in one strand in 1 inch (check the actual figure for the type). Any broken wire in the run of a critical control is normally cause for replacement.
- **Wear/flat spots** — flattening on the outer wires from running on a seized pulley or a worn fairlead.
- **Corrosion** — external is visible; internal corrosion is the killer. Twist the cable gently against its lay to open the strands and look inside. Rust-coloured dust coming out of a cable is a rejection.
- **Kinks and "bird caging"** — permanent distortion where the strands have been forced apart by crushing or by releasing tension violently. Always reject.
- Handle cable with clean gloves; never step on it, drop tools on it or let it kink while fitting. Keep it away from the arc when welding.
        $cnt$,
        10
    ) RETURNING id INTO s10_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 06.11: Electrical Cables and Connectors
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m06_id, 'M06.11', 'Electrical Cables and Connectors',
        $cnt2$
# Electrical Cables and Connectors

## Conductors

- **Copper** — the standard. Excellent conductivity, ductile, easily soldered and crimped. Plated to stop oxidation and to raise the temperature limit: tin plated to about 150°C, silver plated to about 200°C, nickel plated to about 260°C and above.
- **Aluminium** — about half the conductivity but only a third of the weight, so for the large cables (size 8 and bigger) it saves real weight. Restrictions: it creeps under a clamped joint, forms a high-resistance oxide immediately when exposed, is easily nicked, and must not be used in small sizes or in areas of vibration and flexing. Terminals must be aluminium and treated with a jointing compound.
- Aircraft wire is stranded, never solid, so that it survives vibration and flexing. More strands = more flexible.
- Size is given in **AWG (American Wire Gauge)** — and the numbering is inverted: the bigger the AWG number, the smaller the wire. 22 AWG is thin; 4/0 is a battery cable.

## Insulation and Screening

| Insulation | Character |
|------------|-----------|
| **PVC** | Cheap, flexible, low temperature limit, gives off dense toxic smoke in a fire. Not used on modern transport aircraft |
| **PTFE (Teflon)** | Excellent temperature range and chemical resistance, non-flammable; softer, so it can be cut through ("cold flow") by a clamp |
| **ETFE (Tefzel)** | Tough, light, good abrasion resistance — a very common modern choice |
| **Polyimide (Kapton)** | Superb mechanical and temperature performance and very light, but degrades with moisture and can support arc tracking — a self-sustaining carbon arc along the bundle. Now avoided or used in hybrid constructions |
| **Composite / hybrid** (e.g. PTFE-polyimide-PTFE) | Combines the strengths of each and is the current standard on new aircraft |
| **Fibreglass / silicone** | High temperature areas — engines, fire zones |

- **Shielding (screening)** — a braid of tinned copper over the insulation to contain or exclude electromagnetic interference. It is earthed at one end only for signal cables (to avoid an earth loop) unless the wiring manual says otherwise.
- **Twisting** wires together (a specified number of twists per foot) cancels the magnetic fields of the go and return conductors — the cheapest interference fix there is. Used for a.c. pairs and for sensitive instrument leads.
- **Coaxial cable** — a central conductor, a solid dielectric, a braided outer conductor and an outer sheath, with a controlled characteristic impedance (usually 50 or 75 ohms). Used for RF: antennas, transponder, DME, radio altimeter. Coax must not be kinked, crushed, sharply bent or over-tightened in a clamp — any change in the spacing of the conductors changes the impedance and reflects the signal (a poor VSWR). Its connectors (BNC, TNC, N) must be assembled exactly to the procedure.
- **High tension (ignition) leads** — heavily insulated and screened conductors carrying tens of thousands of volts to the igniters or spark plugs. The screening also stops radio interference. Handle by the connector, keep the ends clean and dry, and check the insulation resistance.
- **Fibre optic** — increasingly used for data. Immune to EMI, light, huge bandwidth; needs absolute cleanliness at the connector and has a strict minimum bend radius.

## Selecting a Wire Size

Three questions decide the size, and the **largest answer wins**:

1. **Current carrying capacity** — will it get too hot? This depends on the conductor size, the insulation temperature rating, whether the wire is in a bundle or in free air (a bundle cannot lose heat, so the rating is de-rated by the number of wires), the altitude (thin air cools less well) and whether the load is continuous or intermittent.
2. **Allowable voltage drop** — will enough voltage reach the load? Governed by the length of the run and the current. Typical maximum permitted drops: about 0.5 V on a 14 V system, 1 V on a 28 V system, and 4 V on a 115 V a.c. system for continuous operation (roughly double for intermittent).
3. **Mechanical strength** — a wire must be robust enough to survive handling and vibration. Aircraft practice normally sets a minimum size of **22 AWG** for general airframe wiring, even if the current is tiny.

- The wire is then protected by a circuit breaker or fuse sized to protect the wire, not the equipment — the wire must never be the fuse.

## Identification and Routing

- Each wire carries an identification code — typically the unit/circuit function letter, the wire number, the segment letter, the size, and a suffix for earth or a.c. phase (for example P123B20N). The scheme is defined in the aircraft wiring manual.
- Marking is direct (hot stamped/laser printed on the insulation) or indirect (a printed sleeve or band). Markings are placed at each end of the wire and at intervals of not more than about 15 in (or 50 in on some schemes), and always at each side of a bulkhead or junction.

**Routing rules**

- Separate the categories: ignition, high-power, generator feeders, sensitive signal, and fuel/oxygen lines all keep clear of each other. Signal wiring must not run with power wiring.
- Route above fluid lines wherever possible, and never clamp a wire bundle to a fluid line. If a bundle must run below a line, provide a drip loop so fluid cannot track along the wire into a connector.
- Slack: about 1/2 inch of deflection between supports under moderate thumb pressure — enough to allow for vibration and to permit two re-terminations, but not enough to chafe.
- Bend radius generally not less than 10 times the outside diameter of the bundle (3x for coax, and less at a connector where the bundle is fixed).
- Clamps (loop clamps) at the specified spacing (commonly not more than 24 in) sized correctly to the bundle — the cushion must contact all the way round, the bolt must be above the bundle wherever possible, and the clamp must not distort or pinch the wires.
- Protect against chafing with grommets in every hole, spiral wrap, conduit or sleeving where a bundle passes structure or moving parts. **Chafing is the single most common cause of wiring failure and of in-flight electrical fires.**
- Movable controls — allow for full travel of the control at both extremes, and check clearance with the surface at each stop.
- **SWAMP areas** (Severe Wind And Moisture Problem: wheel wells, wing leading and trailing edges, flap areas, pylons, near doors) demand specially resistant wire, sealed connectors and extra protection.
- Conduit — rigid (aluminium tube) or flexible; must be deburred, drained at the low point, and sized so the bundle occupies no more than about 80% of the internal area.

## Terminations

**Stripping and crimping**

- Strip with the correct gauge stripping tool set to the right size. Any nicked or broken strands beyond the permitted number (usually zero for small sizes) mean cut it off and start again — a nick is a fatigue break waiting to happen.
- Crimping is now the standard method: the terminal barrel is deformed around the conductor by a controlled tool, giving a gas-tight cold weld. It is stronger, more consistent, more vibration resistant and faster than soldering.
- Use the correct crimp tool with the correct die/positioner, calibrated and in date. Colour code: **red = 22-18 AWG, blue = 16-14, yellow = 12-10** on standard pre-insulated terminals.
- A correct crimp: all strands inside the barrel, conductor visible in the inspection hole, insulation gripped by the insulation support (not by the conductor barrel), no cracked barrel, and the terminal cannot be pulled off by hand.
- Soldering is used only where specified. Risks: cold joints, a rigid section that concentrates vibration and breaks the wire just behind the joint, and wicking of solder up the strands. Never solder a joint that will be flexed.
- Terminal lugs on a terminal strip or stud: normally not more than four terminals on one stud, with the largest at the bottom; fit them so they cannot rotate onto a neighbour, and torque the nut correctly. Never fit copper and aluminium terminals in contact.
- **Splices** — a permanent joint in a wire run. Rules: staggered along the bundle so they do not form a lump, not within a specified distance of a connector or clamp, only one splice per wire segment, and never in a highly loaded or SWAMP location unless the splice is environmentally sealed.

## Connectors

**The idea**

- A connector lets a harness be disconnected for maintenance without cutting wire. It must maintain contact resistance, keep out moisture, resist vibration, and make it impossible to connect the wrong plug to the wrong socket.
- Terms: the **plug** usually carries the socket (female) contacts and is on the live side, so nothing is exposed to be shorted; the **receptacle** is mounted on the equipment or structure and normally carries the pins (male).
- Insert (insulator) — holds the contacts in the correct arrangement; the shell is the metal body; keys or keyways and a master key prevent mismating and set the correct clocking position.
- Coupling is by threaded ring (slow but very secure), bayonet (quarter turn, quick), or push-pull.

**Types you must recognise**

| Type | Notes |
|------|-------|
| **AN/MS circular** (MS3100 series) | The classic. Classes: A general purpose, B with a cable clamp, C pressurised, D environment resistant, E environmental with grommet, F conduit, K firewall/fireproof, R rack-and-panel |
| **MIL-DTL-38999** | The modern high-density circular connector — series I bayonet, series III threaded self-locking, environmental and EMI shielded. The standard on current aircraft |
| **Rack and panel** | Blind-mating connectors between an avionics unit and its tray — the unit plugs in as it slides home |
| **D-subminiature (D-type)** | Rectangular, low current, common in avionics and test connections |
| **Terminal / junction block** | Screw or crimp connections in a junction box |
| **Quick disconnect / in-line** | For rapid removal of a component |
| **Coaxial (BNC, TNC, N, SMA)** | RF connections with matched impedance |

**Ratings, installation and care**

- Current rating is set by the contact size (a size 20 contact carries about 7.5 A, size 16 about 13 A, size 12 about 23 A — always check the actual specification) and it is derated when many contacts in the connector are loaded together.
- Voltage rating is set by the insert material and the creepage and clearance distances between contacts — and it falls with altitude (thinner air breaks down at a lower voltage) and with humidity and contamination.
- Contacts are inserted and removed with the correct plastic insertion/extraction tool, colour coded for size. Never use a screwdriver, a paperclip or a home-made pick — you will damage the retention clip and the contact will "back out" in service.
- Unused cavities must be filled with sealing plugs — and it is normal practice to leave spare contacts wired to a spare pin for future modification.
- Mount connectors so that water drains away from them; where a connector points upward, provide a drip loop in the wiring so fluid falls off before the connector.
- Provide strain relief — the backshell clamp takes the load, not the contacts. The wires inside must have enough slack to allow two re-terminations.
- Potting and sealing — environmental connectors use a rubber grommet round each wire; the wire size must match the grommet or the seal is lost.
- Never force a connector or use a tool to tighten a coupling ring — if it will not go, the keyway is wrong or a contact is bent. Protect open connectors with caps and never let them hang on their wiring.

## Bonding and Earthing

- **Bonding** — electrically joining every metallic part of the aircraft so that they are all at the same potential, using bonding jumpers/straps across joints, hinges and mounts. Purposes: a safe path for lightning and static discharge, prevention of sparking at joints (essential near fuel), reduction of radio interference, and protection of personnel.
- **Earthing (grounding)** — connecting the return side of an electrical circuit to the airframe, which acts as the return conductor in a single-pole system.
- Typical resistance limits: bonding jumpers a few milliohms (commonly quoted as not more than 3 milliohms across a joint) and earth connections a very low resistance — the actual figure comes from the aircraft manual. Measured with a milliohm meter (bonding tester), not an ordinary multimeter.
- Installation: remove all paint, anodising and oxide from the contact faces down to bare metal, use the correct jumper and hardware, avoid dissimilar metals or use a compatible washer, keep the jumper short and direct, then re-protect the joint with sealant or paint after testing to stop corrosion.
- Never earth a system through a hinge, a control cable, a bearing or a fluid line, and never use a bonding jumper as a structural member.

## Inspecting Aircraft Wiring

- Look for chafing at every clamp, grommet, bulkhead and moving part — and for the polished or shiny spot that is the first sign of it.
- Heat damage, discolouration, brittle or cracked insulation, and any sign of arcing or carbon tracking.
- Contamination — hydraulic fluid, fuel, de-icing fluid, coolant, cleaning agents and lavatory fluid all attack insulation. Corrosion of terminals and connector shells.
- Loose, broken or missing clamps; incorrect or missing grommets; excessive slack or, worse, a bundle pulled tight.
- Broken lacing or ties, poor previous repairs, unauthorised splices, wire pulled out of a terminal, and bent or backed-out connector contacts.
- Lacing and tying: bundles are laced with waxed cord (single or double cord lacing) or tied with individual ties or straps. Ties must be snug but not so tight that they deform the insulation, which causes cold flow and eventual short circuits.
        $cnt2$,
        11
    ) RETURNING id INTO s11_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M06.10 Control Cables (16 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s10_id, 'A "7 x 7" control cable designation means:',
     '[{"id":"a","text":"7 strands of 7 wires (49 wires), used for trim tab controls and light, low-load systems","correct":true},{"id":"b","text":"7 strands of 19 wires (133 wires), used for primary flight controls over pulleys","correct":false},{"id":"c","text":"A single strand of 7 wires, used only for straight runs and bracing wires","correct":false}]',
     '{"B1","B2"}'),

    (s10_id, 'Which cable construction is extra flexible and used for primary flight controls that run over pulleys?',
     '[{"id":"a","text":"1 x 7 (single strand of 7 wires)","correct":false},{"id":"b","text":"7 x 19 (7 strands of 19 wires)","correct":true},{"id":"c","text":"1 x 19 (single strand of 19 wires)","correct":false}]',
     '{"B1","B2"}'),

    (s10_id, 'A 1 x 7 or 1 x 19 (single strand) control cable is non-flexible and must be used:',
     '[{"id":"a","text":"Only for straight runs and bracing wires, and never over a pulley","correct":true},{"id":"b","text":"Only over pulleys in primary flight control systems","correct":false},{"id":"c","text":"Interchangeably with 7 x 7 cable in trim tab systems","correct":false}]',
     '{"B1","B2"}'),

    (s10_id, 'Control cable wires are preformed into their final helical shape before being laid up so that:',
     '[{"id":"a","text":"A cut end does not unravel and the cable lies quietly on the pulley","correct":true},{"id":"b","text":"The cable can be nylon coated more easily","correct":false},{"id":"c","text":"The breaking strength of the cable is increased","correct":false}]',
     '{"B1","B2"}'),

    (s10_id, 'Single shank and double shank ball end swaged terminals are mainly used:',
     '[{"id":"a","text":"At quadrants and drums, where space is tight","correct":true},{"id":"b","text":"Only for splicing two cable ends together in a straight run","correct":false},{"id":"c","text":"To connect a cable directly to a turnbuckle barrel","correct":false}]',
     '{"B1","B2"}'),

    (s10_id, 'A Nicopress (swaged sleeve) splice is formed by:',
     '[{"id":"a","text":"A copper sleeve compressed over a cable loop around a thimble, developing full cable strength with the correct tool and sleeve","correct":true},{"id":"b","text":"Hand-weaving the cable strands around a thimble in a 5-tuck pattern","correct":false},{"id":"c","text":"Soldering the cable end directly into a threaded terminal","correct":false}]',
     '{"B1","B2"}'),

    (s10_id, 'A traditional woven (5-tuck) hand splice around a thimble develops approximately what proportion of the cable''s strength?',
     '[{"id":"a","text":"50%","correct":false},{"id":"b","text":"75%","correct":true},{"id":"c","text":"100%, the same as a swaged terminal","correct":false}]',
     '{"B1","B2"}'),

    (s10_id, 'When a turnbuckle is correctly adjusted, the maximum number of threads that may be exposed on either terminal is:',
     '[{"id":"a","text":"Three","correct":true},{"id":"b","text":"Five","correct":false},{"id":"c","text":"One","correct":false}]',
     '{"B1","B2"}'),

    (s10_id, 'A turnbuckle barrel is checked for correct thread engagement by:',
     '[{"id":"a","text":"Inserting a piece of wire into the inspection hole — if it goes in, too much thread is showing","correct":true},{"id":"b","text":"Measuring the overall length of the assembled turnbuckle with a rule","correct":false},{"id":"c","text":"Counting the number of safety wire wraps around the barrel","correct":false}]',
     '{"B1","B2"}'),

    (s10_id, 'A clip-type (Nielsen) turnbuckle locking device is:',
     '[{"id":"a","text":"Quick to fit, but suitable only for certain turnbuckle types","correct":true},{"id":"b","text":"Approved for use on every type of turnbuckle","correct":false},{"id":"c","text":"Only permitted on trim system turnbuckles, never on primary flight controls","correct":false}]',
     '{"B1","B2"}'),

    (s10_id, 'A tensiometer measures cable tension by:',
     '[{"id":"a","text":"Pushing a riser against the cable between two anvils and reading the force needed, using a calibration card for cable size and riser number","correct":true},{"id":"b","text":"Measuring the electrical resistance along the length of the cable","correct":false},{"id":"c","text":"Counting the number of turns needed to fully tighten the turnbuckle barrel","correct":false}]',
     '{"B1","B2"}'),

    (s10_id, 'Cable tension regulators, fitted to some large aircraft, are used to:',
     '[{"id":"a","text":"Automatically maintain constant tension as the airframe expands and contracts, avoiding seasonal re-rigging","correct":true},{"id":"b","text":"Permanently lock the turnbuckle so tension can never be adjusted again","correct":false},{"id":"c","text":"Measure cable tension for entry into the maintenance log only","correct":false}]',
     '{"B1","B2"}'),

    (s10_id, 'Every control cable pulley must be fitted with a cable guard pin close to it in order to:',
     '[{"id":"a","text":"Stop the cable jumping out of the pulley groove when the cable goes slack","correct":true},{"id":"b","text":"Measure the rotational speed of the pulley","correct":false},{"id":"c","text":"Lock the pulley so it cannot rotate during rigging","correct":false}]',
     '{"B1","B2"}'),

    (s10_id, 'A fairlead supporting a control cable must not deflect the cable by more than:',
     '[{"id":"a","text":"3 degrees","correct":true},{"id":"b","text":"15 degrees","correct":false},{"id":"c","text":"30 degrees","correct":false}]',
     '{"B1","B2"}'),

    (s10_id, 'When inspecting a control cable for broken wires, the typical limit quoted is:',
     '[{"id":"a","text":"No more than 3 broken wires in one strand in 1 inch (check the actual figure for the type)","correct":true},{"id":"b","text":"Up to 50% of the wires in one strand may be broken before rejection","correct":false},{"id":"c","text":"Broken wires are acceptable anywhere except at a pulley","correct":false}]',
     '{"B1","B2"}'),

    (s10_id, 'Kinks and "bird caging," where the strands of a control cable have been forced apart by crushing or by violently releasing tension, should be:',
     '[{"id":"a","text":"Always rejected","correct":true},{"id":"b","text":"Re-laid by hand and returned to service","correct":false},{"id":"c","text":"Accepted provided the cable still passes the tensiometer check","correct":false}]',
     '{"B1","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M06.11 Electrical Cables and Connectors (24 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s11_id, 'Nickel plated copper conductors are used because they raise the usable temperature limit to about:',
     '[{"id":"a","text":"150°C","correct":false},{"id":"b","text":"200°C","correct":false},{"id":"c","text":"260°C and above","correct":true}]',
     '{"B1","B2"}'),

    (s11_id, 'Aluminium conductors are restricted from use in small sizes and in areas of vibration and flexing because aluminium:',
     '[{"id":"a","text":"Creeps under a clamped joint and forms a high-resistance oxide immediately when exposed","correct":true},{"id":"b","text":"Has a higher conductivity than copper and so overheats small terminals","correct":false},{"id":"c","text":"Cannot be crimped or soldered under any circumstances","correct":false}]',
     '{"B1","B2"}'),

    (s11_id, 'Aircraft electrical wire is always stranded, never solid, primarily so that it:',
     '[{"id":"a","text":"Survives vibration and flexing in service","correct":true},{"id":"b","text":"Carries a higher voltage than solid wire of the same size","correct":false},{"id":"c","text":"Can be run without any insulation","correct":false}]',
     '{"B1","B2"}'),

    (s11_id, 'In the American Wire Gauge (AWG) system used for aircraft wire, as the AWG number increases:',
     '[{"id":"a","text":"The wire becomes smaller","correct":true},{"id":"b","text":"The wire becomes larger","correct":false},{"id":"c","text":"The wire''s insulation rating always increases","correct":false}]',
     '{"B1","B2"}'),

    (s11_id, 'PTFE (Teflon) insulation has excellent temperature range and chemical resistance, but because it is relatively soft it can be:',
     '[{"id":"a","text":"Cut through (\"cold flow\") by a clamp","correct":true},{"id":"b","text":"Dissolved by ordinary aviation fuel on contact","correct":false},{"id":"c","text":"Used only on cables that never pass through a clamp of any kind","correct":false}]',
     '{"B1","B2"}'),

    (s11_id, 'A known risk of polyimide (Kapton) insulation is that it:',
     '[{"id":"a","text":"Degrades with moisture and can support arc tracking along the bundle","correct":true},{"id":"b","text":"Is too heavy for use on modern aircraft","correct":false},{"id":"c","text":"Gives off dense toxic smoke in a fire, like PVC","correct":false}]',
     '{"B1","B2"}'),

    (s11_id, 'Cable shielding (screening) for a signal cable is normally earthed:',
     '[{"id":"a","text":"At one end only, to avoid an earth loop, unless the wiring manual says otherwise","correct":true},{"id":"b","text":"At both ends, always, with no exceptions","correct":false},{"id":"c","text":"Nowhere — shielding is never connected to earth","correct":false}]',
     '{"B1","B2"}'),

    (s11_id, 'Twisting the go and return conductors of a pair together (a specified number of twists per foot) is used because it:',
     '[{"id":"a","text":"Cancels the magnetic fields of the two conductors — the cheapest interference fix available","correct":true},{"id":"b","text":"Increases the current-carrying capacity of both conductors","correct":false},{"id":"c","text":"Is required before a conductor can be crimped","correct":false}]',
     '{"B1","B2"}'),

    (s11_id, 'Coaxial cable must never be kinked, crushed, sharply bent or over-tightened in a clamp because doing so:',
     '[{"id":"a","text":"Changes the spacing of the conductors, altering the characteristic impedance and reflecting the signal (a poor VSWR)","correct":true},{"id":"b","text":"Has no electrical effect but voids the manufacturer''s warranty","correct":false},{"id":"c","text":"Only affects the cable''s current-carrying capacity, not its signal quality","correct":false}]',
     '{"B1","B2"}'),

    (s11_id, 'High tension (ignition) leads should be handled and maintained by:',
     '[{"id":"a","text":"Handling by the connector, keeping the ends clean and dry, and checking the insulation resistance","correct":true},{"id":"b","text":"Pulling on the cable itself to disconnect it, since the connector is not load rated","correct":false},{"id":"c","text":"Routine immersion cleaning, since HT leads are unaffected by moisture","correct":false}]',
     '{"B1","B2"}'),

    (s11_id, 'When selecting the size of an aircraft wire, three factors are considered — current carrying capacity, allowable voltage drop, and mechanical strength. The wire size chosen is set by:',
     '[{"id":"a","text":"The largest of the three answers","correct":true},{"id":"b","text":"The smallest of the three answers, to save weight","correct":false},{"id":"c","text":"Current carrying capacity alone; the other two are advisory only","correct":false}]',
     '{"B1","B2"}'),

    (s11_id, 'Aircraft practice normally sets a minimum wire size for general airframe wiring, even where the current carried is tiny, of:',
     '[{"id":"a","text":"22 AWG","correct":true},{"id":"b","text":"10 AWG","correct":false},{"id":"c","text":"30 AWG","correct":false}]',
     '{"B1","B2"}'),

    (s11_id, 'A circuit breaker or fuse fitted in an aircraft electrical circuit is sized to:',
     '[{"id":"a","text":"Protect the wire, not the equipment — the wire must never be the fuse","correct":true},{"id":"b","text":"Protect the equipment only, regardless of the wire''s current rating","correct":false},{"id":"c","text":"Match the battery''s maximum discharge rate","correct":false}]',
     '{"B1","B2"}'),

    (s11_id, 'A typical aircraft wire identification code (for example P123B20N) is built from:',
     '[{"id":"a","text":"The unit/circuit function letter, the wire number, the segment letter, the size, and a suffix for earth or a.c. phase","correct":true},{"id":"b","text":"The manufacturer''s batch number and the date of installation only","correct":false},{"id":"c","text":"The aircraft registration and the wire''s current rating only","correct":false}]',
     '{"B1","B2"}'),

    (s11_id, 'In an aircraft wiring installation, chafing is significant because it is:',
     '[{"id":"a","text":"The single most common cause of wiring failure and of in-flight electrical fires","correct":true},{"id":"b","text":"A purely cosmetic defect with no effect on serviceability","correct":false},{"id":"c","text":"Only a concern for coaxial cable, not for standard wire bundles","correct":false}]',
     '{"B1","B2"}'),

    (s11_id, 'The minimum bend radius generally permitted for a wire bundle is:',
     '[{"id":"a","text":"10 times the outside diameter of the bundle (3x for coax)","correct":true},{"id":"b","text":"1 times the outside diameter of the bundle, for any type of cable","correct":false},{"id":"c","text":"20 times the outside diameter of the bundle, with no exception for coax","correct":false}]',
     '{"B1","B2"}'),

    (s11_id, 'Crimped terminations are now the standard method of joining a wire to a terminal because, compared with soldering, crimping is:',
     '[{"id":"a","text":"Stronger, more consistent, more vibration resistant and faster","correct":true},{"id":"b","text":"Slower but produces a lower-resistance joint","correct":false},{"id":"c","text":"Only suitable for aluminium conductors, never for copper","correct":false}]',
     '{"B1","B2"}'),

    (s11_id, 'On standard pre-insulated crimp terminals, the colour code red is used for wire sizes:',
     '[{"id":"a","text":"22-18 AWG","correct":true},{"id":"b","text":"16-14 AWG","correct":false},{"id":"c","text":"12-10 AWG","correct":false}]',
     '{"B1","B2"}'),

    (s11_id, 'A correctly made crimp termination shows:',
     '[{"id":"a","text":"The conductor visible in the inspection hole, with the insulation gripped by the insulation support, not the conductor barrel","correct":true},{"id":"b","text":"No conductor visible at all, fully hidden inside the barrel","correct":false},{"id":"c","text":"The insulation gripped by the conductor barrel to hold the wire securely","correct":false}]',
     '{"B1","B2"}'),

    (s11_id, 'A permanent splice repair in a wire bundle is subject to the rule that there must be:',
     '[{"id":"a","text":"Only one splice per wire segment","correct":true},{"id":"b","text":"No more than three splices per wire segment","correct":false},{"id":"c","text":"No limit, provided each splice is taped individually","correct":false}]',
     '{"B1","B2"}'),

    (s11_id, 'In standard connector terminology, the plug usually carries the socket (female) contacts and is on the live side. The receptacle, mounted on the equipment or structure, normally carries:',
     '[{"id":"a","text":"The pins (male)","correct":true},{"id":"b","text":"A second set of socket (female) contacts","correct":false},{"id":"c","text":"No contacts at all, only the shell and keyway","correct":false}]',
     '{"B1","B2"}'),

    (s11_id, 'Which connector type is described as the modern, high-density circular connector — environmental and EMI shielded — that is the standard on current aircraft?',
     '[{"id":"a","text":"MIL-DTL-38999","correct":true},{"id":"b","text":"D-subminiature (D-type)","correct":false},{"id":"c","text":"AN/MS circular Class A","correct":false}]',
     '{"B1","B2"}'),

    (s11_id, 'Connector pin/socket contacts should be inserted or removed using:',
     '[{"id":"a","text":"The correct plastic insertion/extraction tool, colour coded for size","correct":true},{"id":"b","text":"A small flat-blade screwdriver, to save time","correct":false},{"id":"c","text":"A paperclip bent to the approximate contact diameter","correct":false}]',
     '{"B1","B2"}'),

    (s11_id, 'Bonding jumpers and straps are fitted across joints, hinges and mounts primarily to:',
     '[{"id":"a","text":"Provide a safe path for lightning and static discharge, prevent sparking near fuel, reduce radio interference, and protect personnel","correct":true},{"id":"b","text":"Increase the mechanical strength of the joint, replacing structural fasteners","correct":false},{"id":"c","text":"Insulate the joint electrically from the rest of the airframe","correct":false}]',
     '{"B1","B2"}'),

    (s11_id, 'Bonding and earth connection resistance is correctly measured using:',
     '[{"id":"a","text":"A milliohm meter (bonding tester), not an ordinary multimeter","correct":true},{"id":"b","text":"An ordinary multimeter set to its highest resistance range","correct":false},{"id":"c","text":"A clamp-type current meter placed around the jumper","correct":false}]',
     '{"B1","B2"}');

END $$;
