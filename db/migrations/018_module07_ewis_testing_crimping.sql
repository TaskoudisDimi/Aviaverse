-- Module 07: Maintenance Practices — EWIS Testing, Crimping Tools & Connector Pin Servicing
-- Source: EASA Part-66 Module 7 official course (IK MOD 7A), "M7 B1/B2 - 7.7 Electrical Cables and
-- Connectors" chapter — Continuity/Insulation/Bonding Testing, Use of Crimping Tools, Testing of
-- Crimped Joints, and Connector Pin Removal and Insertion sections.

DO $$
DECLARE
    m07_id INT;
    s1_id  INT;
    s3_id  INT;
    s4_id  INT;
BEGIN
    SELECT id INTO m07_id FROM easa_modules WHERE code = 'M07';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M07.1') THEN
        RAISE NOTICE 'M07.1 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 07.1: EWIS Testing — Continuity, Insulation & Bonding
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m07_id, 'M07.1', 'EWIS Testing: Continuity, Insulation & Bonding',
        $cnt$
# EWIS Testing: Continuity, Insulation & Bonding

Fault-finding and acceptance testing of aircraft wiring rests on three basic electrical tests: **continuity
testing**, **insulation resistance testing**, and **bonding testing**. The instruments used range from a
simple multimeter to purpose-built insulation and bonding testers, but the underlying test methods are
the same regardless of which instrument is used.

## Continuity Testing

Continuity testing confirms that a conductor or component provides an unbroken electrical path. It can
be carried out with a voltmeter (on a live, powered circuit) or with an ohmmeter (on an isolated,
unpowered circuit).

### Using a Voltmeter — Fault-Finding Rule

Consider a simple series circuit: battery, switch, a resistor, and a lamp. If the resistor develops an open
circuit, no current can flow anywhere in the loop.

**Voltmeter connected across a good (healthy) component in an open circuit** — the meter will read
**zero**. Since no current flows anywhere in an open series circuit, there is no voltage drop across a
healthy component, so a voltmeter placed across it reads zero even though the component itself is
fine.

> **Troubleshooting rule:** When a voltmeter is connected across a good, non-defective component in
> an open circuit, the voltmeter will read zero.

**Voltmeter connected across the open (defective) component** — the meter now reads a voltage. This
is because the voltmeter itself has a very high internal resistance, and connecting it across the open
resistor effectively *shunts* (bridges) the break, completing the circuit through the meter. Current now
flows through the rest of the circuit and through the voltmeter, so the meter indicates a voltage — this
is what points the technician to the open component.

The same logic applies to a **shorted component**. If one resistor in a series circuit is shorted, a
voltmeter connected across any of the *un-shorted* resistors will show a portion of the applied voltage,
while a voltmeter connected across the **shorted** resistor will read **zero** (no voltage can be dropped
across a short).

### Using an Ohmmeter

An ohmmeter test is only valid on a de-energised, isolated circuit — the component under test must be
isolated and the power source removed (for example, by opening the circuit switch) before connecting
the meter, otherwise the reading will be inaccurate and the meter may be damaged.

With the circuit isolated, the (zeroed) ohmmeter is connected in parallel across the component under
test:

> **Troubleshooting rule:** When an ohmmeter is properly connected across a circuit component and a
> resistance reading is obtained, the component has continuity and is not open.

> If the ohmmeter instead indicates **infinite resistance**, this shows a discontinuity — the component
> or wire under test is open.

For a **shorted** component, the ohmmeter connected across it will show a **zero** reading, positively
identifying which component in the circuit has failed short.

### Summary — Continuity Fault Indications

| Test Instrument | Across a healthy, unbroken component | Across an open (broken) component | Across a shorted component |
|---|---|---|---|
| Voltmeter (circuit powered) | Reads zero | Reads a voltage (meter shunts the break) | Reads zero |
| Ohmmeter (circuit isolated) | Reads a resistance value | Reads infinite resistance | Reads zero |

An open in a series circuit stops current flow everywhere in that circuit. A short has the opposite
effect — it produces a greater-than-normal current flow, which will usually blow a fuse or burn out a
component. In circuits with additional series resistors, however, a single shorted resistor may not
increase current enough to open the fuse, so the circuit may keep functioning with the fault present —
which is why systematic voltmeter or ohmmeter checks across each component are needed to locate it.

## Insulation Testing

Insulation testing is **not** simply a measurement of resistance, in ohms, between two points assumed
to be electrically separate. In service, the insulation of an electrical installation is subjected to
electrical stress, and that stress can reduce the effective resistance between the points under test. To
get a meaningful result, the insulation test must reproduce comparable electrical stress to what the
circuit experiences in normal operation.

**Key requirement:** any insulation tester used must have an output voltage equal to — and preferably
appreciably higher than — the working voltage of the circuit under test.

Insulation tests are carried out after circuit installation, and at intervals specified in the Maintenance
Manual. A typical instrument is a hand-cranked **250 V insulation tester** (megohmmeter), with its
output controlled so the test voltage cannot exceed 300 V. A battery-powered (non-hand-wound)
insulation tester may also be used.

### Insulation Testing Procedure

Before starting an insulation test:

1. All switches in the circuit concerned should be **ON**.
2. All ancillary equipment supplied by the system should be disconnected; filaments (e.g. lamp
   filaments) should be removed.
3. Components that are normally open (cutouts, relays) should have their terminals bridged, so the
   test voltage reaches all parts of the circuit.
4. Remove the appropriate fuse, or trip the appropriate circuit breaker.
5. Connect one tester lead to earth and the other to the terminal on the circuit side of the fuse holder
   or circuit breaker.

Insulation resistance readings vary with the temperature and humidity of the surrounding atmosphere,
so the test results **and** the weather/environmental conditions at the time should both be recorded.

### After Testing

Immediately after an insulation test, functioning checks should be carried out on all the services that
were subjected to the test. If either the insulation test or the subsequent functioning check reveals a
fault, the fault must be rectified and then **both** the insulation test and the functioning test repeated,
in that sequence, on the affected circuits.

### Checking the Insulation Tester Itself

The tester should also be checked before and after use:

- Turn the handle with the test leads **touching** — the reading should show **no resistance**.
- Turn the handle with the leads **apart** — the needle should move towards **infinity**.

## Bonding Testing

**Bonding** is the electrical interconnection of the metallic parts of an aircraft, normally at earth
potential, to allow the safe distribution of electrical charges and currents.

Bonding provides protection against charges arising from precipitation static build-up and from
electrostatic induction caused by lightning strikes, so that the safety of the aircraft and its occupants is
not endangered. Specifically, bonding is intended to:

- Minimise damage to the aircraft structure or components from a lightning strike or static discharge.
- Prevent the passage of electrical currents that would cause dangerous malfunctioning of the aircraft
  or its equipment.
- Prevent the build-up of high potential differences within the aircraft.

Bonding also reduces the risk of electric shock from the electrical supply system, reduces interference
with essential services such as radio communications and navigation aids, and provides a low-resistance
electrical return path for current in earth-return systems.

### Primary and Secondary Conductors

- **Primary conductors** — carry lightning discharge current.
- **Secondary conductors** — provided for other forms of bonding (e.g. equipment earthing, static
  charge dissipation).

### Bonding on Different Types of Aircraft Construction

**All-metal aircraft**: the skin itself is considered adequate protection against lightning discharge,
*provided* the method of construction produces satisfactory electrical contact at the structural joints.

> An electrical contact with a resistance of **less than 0.05 ohm** is considered satisfactory.

**Non-metallic / composite aircraft**: a "cage" of metallic conductors with surge-carrying capability must
be built into the aircraft structure, and the metal parts of the aircraft are bonded to this cage.

### Ground Discharge on Landing

The aircraft's earth system (normally the airframe on a metal aircraft) must be automatically connected
to ground on landing. This is normally achieved through the **nose wheel tyre**, which is impregnated
with an electrically conducting compound. On some aircraft, a static discharge whip (or similar device)
trailed from a landing wheel assembly is used instead to give ground contact on landing.

### Electrostatic Charges on Composite Surfaces

On surfaces such as glass-fibre reinforced plastic, electrostatic charge build-up is reduced or removed
by applying a special conductive paint to the surface.

### Bonding Conductors

Solid bonding strip and braided bonding cord are selected by cross-sectional area. Cords are usually
braided copper or aluminium, fitted at each end with a connecting tape or lug. Braided cord is used for
bonding connections across moving parts, or parts subjected to vibration, and cord may be used as
either a primary or a secondary conductor.

### Performing a Bonding Test

The bonding test is carried out with a dedicated bonding test set. A standard bonding tester lead is
typically around 60 feet (18 m) long, so on larger aircraft the measurement between the extremities of
the airframe may need to be built up by selecting one or more main earth points in succession — with
the resistance between the chosen main earth points checked first, before moving on to check each
more remote point from that reference.

The test lead's pronged ends are brought into contact with the aircraft part being checked, and the
test meter indicates the resistance of the bond directly in ohms. To get good electrical contact at the
test prongs, it may be necessary to penetrate or remove a small area of non-conducting protective
coating (e.g. paint) — any such damage to the protective coating must be restored after the test.

If a bond connection shows excessive resistance, the rectification action depends on the type of
connection involved.

> Corrosion at a bonding or earth connection is a very common cause of excessive resistance readings.

### Maximum Bonding Resistance Values

| Conductor Type | Test Condition | Maximum Resistance |
|---|---|---|
| Primary | Between extremities of the fixed portions of non-metallic/composite aircraft | Estimated and declared by the manufacturer |
| Primary | Between extremities of the fixed portions of metallic aircraft; between bonded components and the main earth system | **0.05 ohm** |
| Primary | Between metallic parts normally in contact with flammable fluids and the main earth system, and between the parts themselves | **1 ohm** |
| Primary | Between isolated conducting parts subject to appreciable electrostatic charging and the main earth system | **0.5 megohm**, or 100,000 ohms per sq. ft of surface area, whichever is less |
| Secondary | Between equipment supplied from an unearthed system (any voltage) and the main earth system | **1 ohm** |
| Secondary | Between equipment containing circuits of 50 V (RMS or DC) or more and the main earth system | **1 ohm** |

Where a reading beyond the range of the bonding tester is required — for example the 0.5 megohm
figure for isolated conducting parts — a 250 V insulation tester may be used instead, as stipulated by
the applicable bonding test schedule.
        $cnt$,
        1
    ) RETURNING id INTO s1_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 07.3: Crimping Tools & Techniques
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m07_id, 'M07.3', 'Crimping Tools & Techniques',
        $cnt3$
# Crimping Tools & Techniques

A wide variety of crimping tools are used in aircraft wiring work, each matched to a specific family of
terminals, splices, and contacts. Regardless of the tool family, the same underlying principles apply:
**the correct tool, terminal, and cable combination must always be used together**, the tool must be
correctly maintained and periodically gauge-checked, and the crimp must never be made without
verifying the joint afterwards. Using the wrong tool, an out-of-calibration tool, or an incorrect die can
produce a joint that looks acceptable but is mechanically weak or electrically high-resistance — a
serious latent defect in an aircraft wiring system.

## PIDG Thin Wall Wire Terminals

**PIDG** stands for **Pre-Insulated Diamond Grip**. PIDG terminals are colour- and dot-coded by wire
size, and each tool/terminal combination is matched to a specific wire gauge:

| Wire Size (AWG) | Dot Code | Terminal Insulation Colour |
|---|---|---|
| 24–22 | 2 dots | Brown |
| 20 | 1 dot | Grey |
| 18 | 2 dots | Orange |
| 16 | 1 dot | Orange |
| 14 | 2 dots | White |
| 12 | 1 dot | White |
| 10 | 1 dot | Black |
| 22–16 | — | Red |

### Crimping Procedure

1. Strip the wire to the length specified by the relevant wiring standard (typically around 0.22–0.25 in
   / 5.5–6.4 mm).
2. Locate the terminal in the crimping tool and take up the handle pressure until the terminal is held —
   but **not deformed**.
3. Insert the stripped wire so the conductor strands are just visible on the terminal palm, both before
   and after crimping.
4. Completely close the tool handles until the **ratchet releases** — this is what guarantees a
   full, consistent crimp; the tool cannot be opened part-way through the cycle.
5. Open the handles and remove the crimped joint.

### Insulation Support Crimping Adjustment

The insulation-support section of many PIDG tools has three settings:

- **Position 1 = Tight**
- **Position 2 = Medium**
- **Position 3 = Loose**

The correct procedure is to start at Position 3 (loose), crimp a sample, and check the insulation grip by
bending the cable back and forth once. If the wire pulls out of the insulation support, move to Position
2 and repeat the test; only fit Position 1 if still needed. **Never use a tighter setting than required**, as
an over-tight insulation grip can damage the wire insulation.

### Colour and Dot Coding

Tools and terminals are colour-coded by wire size for quick visual identification. In addition, the
crimping tool itself leaves **one or two raised dots** on the terminal insulation as physical proof that the
correct tool was used for that particular wire size — a form of built-in quality verification that can be
checked after the crimp has been made.

### Tool Maintenance

- Check the die crimping areas for any broken or chipped condition. A tool showing such damage must
  be **withdrawn from use** and returned to the manufacturer for rectification.
- Lubricate all pins, pivot points, and bearing surfaces with light machine oil according to use:

| Tool Usage | Lubrication Interval |
|---|---|
| Full daily use | Daily |
| Occasional daily use | Weekly |
| Used weekly or occasionally | Monthly |

In every case, excess oil must be wiped off before use, especially from the crimping areas, to avoid
contaminating the joint.

### "CERTI-CRIMP" Ratchet Inspection (AMP Hand Tools)

The ratchet on AMP hand tools must be checked periodically to confirm it does not release
prematurely — i.e. that it never opens the dies before they have fully bottomed. The check:

1. Thoroughly clean the bottoming surfaces of the dies.
2. Make a test crimp using the **maximum** wire size the tool is rated for, in the appropriately sized
   terminal.
3. When the crimp is made, squeeze the handle until the ratchet releases, but **do not** release
   pressure on the handles.
4. Try to insert a **0.001 in shim** between the bottoming surfaces of the dies. If the shim can be
   inserted (or there is no gap at all), the ratchet mechanism is satisfactory.
5. If the clearance is **greater than 0.001 in**, the dies are not bottoming correctly and the tool must
   be withdrawn from use and returned to the AMP Tool Repair Department.

### Die and Locator Clearance / Gauging

The clearance between the dies, and between the locator and die face, should be checked with feeler
gauges and must not exceed the maximum dimension specified for that tool. If exceeded, the tool must
be withdrawn from use.

Before gauging, the dies must be clean and free of particles, and a terminal of the correct type should
first be crimped to ensure the dies are correctly seated. To gauge the conductor crimp jaws:

- Close the tool handles until the ratchet is free, without releasing handle pressure.
- The **"NO GO"** plug gauge may only partially enter the crimp dies — it must **not** pass through.
- The **"GO"** plug gauge **must** pass freely through the dies.
- Any tool failing either check must be withdrawn from use.

**Never crimp a gauge** — doing so can damage the crimping jaws.

### Before Crimping

Always check the correct combination of tool, terminal, and cable, and confirm the insulation support
setting. Open the jaws fully and insert the terminal so the palm protrudes through the locator and the
barrel butts up against the locator. Close the handles until the terminal is just gripped (not deformed),
then insert the stripped cable into the barrel so that approximately 0.03 in of conductor protrudes onto
the terminal palm. Hold the wire in position and close the handles fully until the ratchet releases.

Two points are critical here:

- Cable stripping must be done correctly — the correct length stripped, no conductor strands cut or
  damaged, and all cotton/glass cloth insulation "tails" removed.
- Only **bare conductor** should be inside the crimp barrel — insulation must never be forced into the
  barrel.

### AMP Crimping Procedure (Tool No. 59239, Size 12–10, Yellow)

1. Strip cables to the required length; ensure no strands are cut and all insulation is removed.
2. Squeeze the handles to release the ratchet and open the tool. Once the ratchet engages on a crimp
   cycle, the handles **cannot** be opened again until the crimp is complete.
3. Place the terminal in the crimping dies and close the handles until it is held firmly, without
   deforming it.
4. Insert the stripped cable into the terminal, hold it in position, and complete the crimping action
   until the ratchet releases.
5. For **in-line splice joints**, position the splice in the tool and crimp **each half of the splice
   separately** — this means **two** crimping operations for a single splice, and the joint must be
   insulated after crimping.

### "Stratotherm" Terminals (Uninsulated, with Insulation Support, Size 22–10)

Crimped using AMP tool part no. 59461 (or similar). Procedure:

1. Strip cables to the required length, with no damaged strands and all insulation removed.
2. Open the tool (ratchet release); once engaged, the tool stays closed until the crimp is complete.
3. Place the terminal in the crimping jaws, close until held (not deformed), insert the stripped cable
   into the crimp barrel, then complete the crimp by closing the handles until the ratchet releases.
4. Adjust the insulation support pins to match the cable's insulation diameter:
   - **Position 1** — small insulation diameters
   - **Position 2** — medium insulation diameters
   - **Position 3** — large insulation diameters
5. The insulation support setting is correct if the insulation does **not** break or fracture when the
   cable is bent through 90°.
6. Before crimping, always verify the correct combination of tool, terminal, cable, and insulation
   support setting.
7. Insert the terminal fully into the locator (palm protruding, barrel against the locator); close until
   just gripped; insert the stripped cable so approximately 0.03 in of conductor protrudes onto the
   terminal palm; complete the crimp.
8. For in-line splice joints, position and crimp each half of the splice separately (two operations), and
   insulate the joint after crimping.

## Sealed In-Line Crimping

This method provides an **immersion-resistant, sealed, in-line crimp splice** for joining single wires.

**Tools and preparation**: all tools must be checked and tested in accordance with the applicable
specification (BS G178) and carry a current tool-check identification mark. Only personnel who have
been instructed and tested in the correct use of crimping tools may carry out splicing. Crimping
surfaces and moving parts must be kept clean and free of metal particles, and lubricated with light
machine oil as necessary. Operators must **not** make any adjustments or alterations to the crimping
tool.

### Operation

1. Confirm the correct in-line splice barrel, sealing sleeve, and marker sleeve have been provided.
   Strip the wires to a length of approximately 8–9 mm (5/16 in). For Fenwal-supplied fire-zone wire,
   strip an additional 6–7 mm (¼ in) of the outer cover.
2. Lightly twist together the wires entering the splice from the same side.
3. Slide the sealing sleeve and marker sleeve onto one of the wires to be spliced.
4. Squeeze the crimping tool handles together until the ratchet releases.
5. Place the barrel of the crimp splice in the correct colour-coded crimp location of the tool.
6. Insert the wires into the crimp barrel and crimp.
7. Do **not** allow wire insulation to enter the crimp barrel. Slide the sealing sleeve centrally over the
   crimped splice.
8. Shrink the sealing sleeve using heat, applied until the internal sealant insert melts and flows axially
   along the wire — remove the heat source **immediately** this happens (over-heating damages the
   joint and surrounding insulation).

### Inspection

Every crimped joint must be visually inspected for:

- Correct combination of cable, tool, and terminal.
- Correct form and location of the crimp.
- Adequate insertion of conductor strands into the crimp barrel.
- Freedom from fracture, roughness, sharp edges, and flash.
- Absence of damage to the conductor or the insulation.

### Rules of In-Line Splicing

- Each barrel must carry **only one cable**, unless specifically permitted by the airworthiness
  authority.
- The crimp must be fitted horizontally, or otherwise positioned so moisture ingress is not possible.
  Additional sleeving is **not** permitted as a substitute for correct positioning.
- Operating temperature limits must not be exceeded.
- Specific airworthiness authority approval is required before using in-line splices on: screened
  cables, coaxial cables, multi-cored cables, cables larger than size 10, thermocouple cables,
  high-voltage cables (above 250 V RMS), fire-resistant cables in protective zones, and totally
  enclosed cables that cannot be inspected.
- In-line splicing is otherwise restricted to **size 10 (35 A) or smaller**.
- Low-temperature connectors must not be crimped on size 12 or larger EFGLAS cable.
- Repair scheme spacing limits: minimum **12 ft** between joints in one cable; no more than **2**
  joints in any 10 ft run; maximum joints permitted overall — **3** in a 20 ft run, **5** in a 200 ft run,
  **8** in a run over 200 ft.

**Installation practice**: joints should be accessible for visual inspection wherever possible, positioned
so they do not touch each other, ducting, straps, or other features, and located on the outside of the
loom if possible. All fixing attachments must be approved, and joints must be staggered — if staggering
is not possible, positive separation must be achieved using insulation or cable clips.

## BICC/Burndy Crimping Tools

| Tool | Contact Size Range | Die Type | GO/NO GO Gauge Part No. |
|---|---|---|---|
| M1OS-1 | Size 12 to size 24 (inclusive) | Interchangeable dies | J74482 / J74483 |
| MR8-13 | Size 10 | Fixed die | J74481 |
| MR4-20 | Size 8 | Fixed die | J74480 |

All three tools use a **ratchet mechanism**: once a crimp cycle starts, the tool cannot be opened until
crimping is complete, after which the handle and jaws return automatically to the fully open position.

**Periodic in-service check** (all three tools): fully close the tool handles, and while maintaining firm
handle pressure, insert the **GO** gauge between the crimping jaws — it should pass freely. With the
jaws in the same position, insert the **NO GO** gauge — it should **not** enter. Never crimp the gauge
itself, as this can damage the jaws.

**Crimping procedure**: select the correct stop bushing and die nest (M1OS-1) or contact groove
(MR8-13, MR4-20) for the contact being crimped, fit and secure it, insert the contact, then insert the
stripped wire fully to the depth of the crimp barrel, and close the handle until it bottoms against the
positive stop.

**Inspection note**: for BICC/Burndy terminals S1018-004 fitted to 12 or 14 AWG cable, a pull-off test
and a milli-volt drop test (to BSG 178) must be carried out on one sample from each manufactured
batch — because the sleeve fitted over the crimped portion of this particular terminal prevents visual
inspection of how far the cable has entered the terminal.

## Daniels Crimping Tools

| Tool | Contact Size Range | Conductor Range | Head/Positioner System | Colour |
|---|---|---|---|---|
| AF 8 | Size 12–22 | 12–26 AWG | "THIA" preset turret head (3 colour-coded positioners) or universal head UH2-5 | Blue |
| AFM 8 (M22520/2-01) | Size 20 and smaller | 20–32 AWG | Bayonet-locked individual positioners, safety-wire lockable | Blue |

**AF 8**: has eight indentor closures controlled by a selector knob, which must be raised to rotate and
can be locked in any position. The turret head must be released (raised) to change position and
depressed to lock before crimping. To crimp: rotate the turret to the correct colour positioner, raise
and rotate the selector knob to the selector number listed on the data plate for that contact and wire
size, insert the contact and wire from the side opposite the turret head, and close the handle until it
bottoms and the ratchet releases.

**AFM 8**: a lightweight miniature version for smaller contacts. The positioner bayonet-locks into the
tool and can be secured with a safety wire clip; the selector setting (read from the data plate on the
positioner) is set by raising and rotating the selector knob. Insert the contact and wire from the side
opposite the positioner and close the handle to the positive stop.

Both tools use GO/NO GO gauges in the same manner as other crimping tools — the GO gauge must
pass freely between the indentor tips when the handles are fully closed, the NO GO gauge must not
enter, and the gauge must never be crimped.

## Heavy Duty Terminals — Manufacturer Tool Families

Different heavy-duty terminal manufacturers require their own dedicated, non-interchangeable
crimping equipment:

| Terminal Family | Crimp Tool | Notes |
|---|---|---|
| Hellermann Deutsch Terminals & Splices | Hellermann 12TC (with Hellermann FP1 foot pump) | Hydraulic, foot-pump operated |
| ERMA Terminals & Splices | ERMA 19600 hydraulic hand crimping tool | Inhibitor compound (ERMA part no. 13,000, DTD 5003) required only on ERMA terminal 23406 |
| AMP Terminals & Splices | AMP 69062 MOD AF (hydraulic hand tool) or AMP 46447 (hand tool) | AMP parts must only be crimped with AMP tools |

Recommended safety precaution: pressure hoses on hydraulic foot-pump equipment (such as the
Hellermann Crimp Tool/Foot Pump set) must be checked for good condition with all connections tight,
and all tools must be inspected at the correct calibration intervals.

## Hellermann Deutsch Terminals & Splices

**Important:** cut at least 25.4 mm (1.0 in) off the cable end, immediately before crimping, using large
cutters capable of cutting the cable in a **single** cutting action — **never** a hacksaw.

1. Slide the appropriately sized heat-shrink sleeve over the cable, then strip the insulation to the
   dimension specified for the terminal being used.
2. Minimise the time between stripping and crimping. No inhibitor compound is required with these
   terminals. Great care must be taken that no conductor strands are severed or damaged during
   stripping, and no visible insulation remains on the conductor before insertion.
3. Open the dies. On the terminal, remove the protective tape from the inspection hole and the sealing
   cap from the bore opening.
4. Place the terminal, palm downward, with the die edge 0.05–0.10 in from the edge of the inspection
   hole.
5. Operate the foot pump enough to close the dies and firmly hold the terminal **without deforming**
   it, and re-check the 0.05–0.10 in dimension.
6. Insert the stripped wire into the crimp barrel, checking that it is fully bottomed (visible through the
   inspection hole), leaving about 0.15 in of conductor protruding to allow for expansion during
   crimping. Continue crimping until the dies close and the foot pump pressure relief valve breaks.
7. Release the hydraulic pressure to open the dies and remove the terminal. Remove any excess flash
   from the hexagon with a blunt-edged tool, then submit for inspection.
8. For **size 000** terminals and splices, reposition in the tool with the die face approximately 0.06 in
   from the open end of the terminal and make a **second** crimp; deflash and submit for inspection.
9. Cover the terminal/wire joint with the appropriate heat-shrink sleeve.

| Die Set Part No. | Terminal Type | Conductor Strip Length | Number of Crimps |
|---|---|---|---|
| HC12530 | 0CA | 1.04 in minimum | 1 per barrel |
| HC13531 | 000CA | 1.44 in | 2 per barrel |

## ERMA and AMP Terminals

The same cable-cutting warning applies: use large cutters for a single cutting action (never a hacksaw)
to remove at least 25.4 mm (1.0 in) from the cable end immediately before crimping.

1. Slide the shrink sleeve (S1205) over the cable and strip the insulation to the specified dimension.
   Minimise the time between stripping and crimping. Inhibitor compound is required only for ERMA
   terminal 23406 — the barrel end of the conductor and the bore of that terminal are lightly coated
   with it before insertion.
2. Open the dies: on the ERMA tool by turning the knob anti-clockwise; on the AMP 69062 by rotating
   the reservoir handle anti-clockwise; on the AMP 46447 by squeezing the handles until the ratchet
   releases. Insert the terminal, close the valve, and pump/squeeze until the crimp barrel is lightly
   gripped, checking the dies are centred on the barrel.
3. Insert the cable, stripped to the specified length, into the crimp barrel, checking correct insertion
   through the open end or inspection window.
4. Pump the lever until the dies fully close — indicated by an audible "click" as the safety valve
   operates (ERMA), by a sudden reduction in hand load (AMP 69062), or by ratchet release (AMP
   46447).
5. Open the valve (turn anti-clockwise) to retract the ram and lower die, allowing withdrawal of the
   crimped terminal.
6. Cover the joint with the shrink sleeve and submit the completed terminal for inspection.

> **Manufacturer matching rule:** AMP parts must be crimped using AMP tools, and ERMA parts must
> be crimped using ERMA tools — dies, terminals, and tools from different manufacturers are not
> interchangeable. The correct die set for a given cable and terminal combination is selected from the
> manufacturer's reference tables; the die code is engraved into the die faces so it is impressed onto
> the terminal's crimp barrel as a permanent record of which die produced the crimp.

**ERMA tool operation**: the hydraulic pump must be operated several times to complete a crimp; a
built-in ratchet prevents any further pressure increase once the correct crimping pressure is reached.
Pressure is released afterwards using a pressure relief valve on the side of the tool, which opens the
jaws for removal of the crimped cable.

**AMP 69062 operation**: this tool has a four-position upper die and a common lower die, covering
terminal sizes 9, 6, 4, and 2. To operate: press the latch to open the tool; pull back the nest lock and
rotate the thumb knob until the required die (identified by the wire size number on the nest) appears
and locks in place — the head cannot close until this happens; close the head; rotate the reservoir
handle clockwise to close the hydraulic return port so pumping the handle closes the dies (a sudden
decrease in pumping effort indicates the crimp is complete); rotate the reservoir handle anti-clockwise
to release pressure and open the dies.
        $cnt3$,
        3
    ) RETURNING id INTO s3_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 07.4: Crimped Joint Testing & Connector Pin Servicing
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m07_id, 'M07.4', 'Crimped Joint Testing & Connector Pin Servicing',
        $cnt4$
# Crimped Joint Testing & Connector Pin Servicing

A crimped joint must satisfy two independent requirements: it must be **mechanically** sound (the wire
will not pull out of the terminal under normal handling and service loads) and it must be
**electrically** sound (the joint has low enough resistance not to overheat or cause a voltage drop
under load). Two standard tests verify these properties — the **tensile test** and the **voltage drop
test** — and every crimped joint additionally receives a routine visual inspection.

As a general qualification practice, tensile and voltage-drop tests are performed on **not less than two
specimens** of each and every combination of crimp barrel, conductor, tool, die, locator, or positioner
— i.e. whenever any element of the crimping combination changes, the combination must be
re-verified with fresh test samples.

## Tensile Test

The tensile test verifies the **mechanical** integrity of the crimped joint. Each sample is tested in a
tensile testing machine, which applies an axial pull with the jaws separating at a steady rate of
between **1 and 2 inches per minute**. Each specimen is pulled **to destruction**, and must not fail
below a specified minimum load for its wire size. Before testing, any insulation grip on the terminal (if
fitted) is rendered inoperative by removing the cable insulation, so that the test measures only the
strength of the conductor crimp itself.

Reference test values for copper conductor crimps (per MIL-T-7928E) are shown below, alongside the
matching voltage-drop test current and maximum permitted voltage drop for context:

| Wire Size (AWG) | Test Current (A) | Max. Voltage Drop (mV) | Minimum Pull-Off Load (lbs) |
|---|---|---|---|
| 26 | 3 | 8 | 7 |
| 24 | 4.5 | 8 | 10 |
| 22 | 9 | 7 | 15 |
| 20 | 11 | 6 | 19 |
| 18 | 16 | 5 | 38 |
| 16 | 22 | 7 | 50 |
| 14 | 32 | 6 | 70 |
| 12 | 41 | 5 | 110 |
| 10 | 55 | 5 | 150 |
| 8 | 73 | 5 | 225 |
| 6 | 101 | 5 | 300 |
| 4 | 135 | 5 | 400 |

As wire size increases (lower AWG number, larger diameter), the minimum required pull-off load
increases substantially, reflecting the greater mechanical strength expected of a larger crimp joint.

## Voltage Drop Test

The voltage drop test verifies the **electrical** integrity (contact resistance) of the crimped joint. The
appropriate test current for the wire size (from the table above) is passed through the specimen at an
open-circuit voltage of **no more than 30 V**. Milli-volt drop readings are taken with test probes placed
between a point adjacent to the forward end of the crimp barrel and a point on the conductor
immediately behind the crimp barrel. The measured milli-volt drop must not exceed the maximum
figure given in the table for that wire size — a higher-than-specified drop indicates excessive contact
resistance in the crimp, which in service would cause local heating and joint degradation under load.

## Routine Inspection of Crimped Joints

Beyond the destructive/electrical qualification tests, **every** crimped joint produced in service must be
visually inspected for:

- Correct combination of cable, tool, and termination, and correct die marks (if applicable).
- Correct form and location of the crimp.
- Adequate insertion of the conductor strands into the crimp barrel.
- Absence of insulation or other non-conducting material inside the crimp barrel.
- Freedom from fracture, flash, and rough or sharp edges.
- Absence of damage to the conductor or the insulation.
- Insulation properly gripped by the insulation crimp, where applicable.

## Connector Pin Removal and Insertion

Aircraft electrical and avionics systems use a vast range of connector types, and the individual pins
(contacts) inside them must never be pulled or pushed directly with pliers, a screwdriver, or similar
improvised tools. Doing so risks bending or breaking the miniature contact retaining clips inside the
connector insert, damaging the insert material itself, or tearing the rear sealing grommet — any of
which can turn a simple contact replacement into a full connector or backshell replacement. For this
reason, dedicated **removal/insertion tools** are used.

### Types of Removal/Insertion Tool

Two main families of tool are used:

- **Plastic insertion and extraction tools** — introduced specifically to prevent damage to contact
  retaining clips and insert materials.
- **Tweezer-type insert/extract tools** — spring-loaded tweezer tools used on smaller contacts and
  certain grommet-sealed connectors.

### Plastic Tools

Plastic tools are colour-coded by contact size: **Red** for size 20, **Blue** for size 16, and **Yellow** for
sizes 12 and 22. On composite (dual-ended) tools, the extraction end is always **White**.

**Installing a contact (coloured end):**

1. Hold the insertion (coloured) half of the tool between thumb and forefinger, and lay the wire along
   the tool's slot, leaving about ½ in protruding beyond the end of the tool to the contact's crimp
   barrel.
2. Squeeze the wire firmly into the tool at the tip, between thumb and forefinger, while quickly pulling
   the protruding wire away from the tool with the other hand.
3. The wire snaps into place in the tool. Pull it back through the tool until the tip seats on the back
   end of the crimp barrel.
4. With the connector's rear seal facing you, slowly push the contact straight into the connector seal.
5. A firm stop is felt when the contact positively seats in the connector.

**Removing a contact (white end):**

1. With the rear of the connector facing you, lay the wire of the contact to be removed along the slot
   of the removal (white) half of the tool, leaving about ½ in from the end of the tool to the rear of the
   connector.
2. Squeeze the wire firmly into the tool, about ¼ in from the tip, while quickly pulling the connector
   away from the tool with the other hand.
3. The wire snaps into place. Slide the tool down over the wire and into the rear seal, pushing slowly
   into the connector until a positive resistance is felt — at this point the contact retaining clip is in
   the unlocked position.
4. Press the wire of the contact being removed against the serrations on the plastic tool, and pull the
   tool and the contact/wire assembly out of the connector **together**.

> **Caution:** never tip, spread, or rotate the tool while it is inside the connector — this can damage
> the grommet, the insert, or adjacent contacts.

Connectors may use either **front-release** or **rear-release** contact retention systems, and the
correct insertion/extraction technique must match the system fitted.

### Tweezer-Type Insert/Extract Tools

**To install a contact:**

1. Open the tool tips by squeezing the handles, placing the tips around the wire insulation.
2. Slide the tool along the wire until the tip end butts against the shoulder on the contact.
3. Carefully push the contact forward, directly in line with the grommet hole, until the contact is felt to
   snap into position.
4. Slide the tool back along the wire insulation until it clears the grommet, then remove the tool from
   the wire.

**To remove a contact:**

1. Open the tool tips sufficiently to place them around the wire insulation.
2. Slide the tool down the wire until the tips enter the grommet and reach a positive stop — a slight
   increase in resistance is felt just before this point.
3. Holding the tool tips firmly against the positive stop on the contact, grip the wire and simultaneously
   withdraw the tool, the contact, and the wire together.

> **Caution:** the tips of installing and removal tools used on small contacts have very thin wall
> sections, giving them sharp edges that can cut the wire insulation or the connector's sealing grommet.
> Do not squeeze, spread, tip, or rotate the tweezers while they are entering the connector grommet.

Using the correct, purpose-designed tool — and the correct technique — for every contact insertion or
removal is what prevents cumulative, hard-to-detect damage to connector inserts, retaining clips, and
sealing grommets across the life of an aircraft's EWIS.
        $cnt4$,
        4
    ) RETURNING id INTO s4_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M07.1 EWIS Testing: Continuity, Insulation & Bonding (13 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s1_id, 'A voltmeter is connected across a healthy (non-defective) component in an open series circuit. What will the voltmeter read?',
     '[{"id":"a","text":"Zero","correct":true},{"id":"b","text":"The full supply voltage","correct":false},{"id":"c","text":"A reading that fluctuates rapidly","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'A voltmeter is connected across the open (defective) component in an open series circuit. Why does the voltmeter now show a voltage reading?',
     '[{"id":"a","text":"The voltmeter shunts (bridges) the break and allows current to flow through it","correct":true},{"id":"b","text":"The battery voltage automatically doubles","correct":false},{"id":"c","text":"The component becomes a better conductor when measured","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'Before connecting an ohmmeter across a circuit component to check continuity, what must first be done?',
     '[{"id":"a","text":"Increase the circuit supply voltage","correct":false},{"id":"b","text":"Isolate the component and remove the power source from the circuit","correct":true},{"id":"c","text":"Short the component to earth","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'An ohmmeter is properly connected across an isolated circuit component and a resistance reading is obtained. This indicates:',
     '[{"id":"a","text":"The component is open circuit","correct":false},{"id":"b","text":"The component has continuity and is not open","correct":true},{"id":"c","text":"The component is short circuit","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'An ohmmeter connected across a shorted resistor will indicate:',
     '[{"id":"a","text":"Infinite resistance","correct":false},{"id":"b","text":"A zero reading","correct":true},{"id":"c","text":"The rated resistance of the resistor","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'What must the output voltage of an insulation tester be, relative to the working voltage of the circuit under test?',
     '[{"id":"a","text":"Lower than the working voltage, to avoid damage","correct":false},{"id":"b","text":"Equal to, and preferably appreciably higher than, the working voltage","correct":true},{"id":"c","text":"Exactly half the working voltage","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'During an insulation test, components such as cutouts and relays that are normally open should be:',
     '[{"id":"a","text":"Removed from the circuit entirely","correct":false},{"id":"b","text":"Left exactly as found","correct":false},{"id":"c","text":"Bridged at their terminals","correct":true}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'A typical insulation (megohmmeter) test set is described as a 250 V tester whose output is controlled so the test voltage cannot exceed:',
     '[{"id":"a","text":"260 V","correct":false},{"id":"b","text":"300 V","correct":true},{"id":"c","text":"500 V","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'If an insulation test or the subsequent functioning check reveals a fault, what is the correct sequence of actions?',
     '[{"id":"a","text":"Rectify the fault, then repeat the insulation test and the functioning test, in that order","correct":true},{"id":"b","text":"Repeat only the functioning test, since the fault is already known","correct":false},{"id":"c","text":"Return the aircraft to service and monitor the circuit","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'When checking a hand-cranked insulation tester itself before use, turning the handle with the leads apart should cause the needle to move towards:',
     '[{"id":"a","text":"Zero","correct":false},{"id":"b","text":"Infinity","correct":true},{"id":"c","text":"Mid-scale and stay there","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'On an all-metal aircraft, what maximum resistance at a structural joint is considered satisfactory for lightning protection bonding?',
     '[{"id":"a","text":"Less than 0.05 ohm","correct":true},{"id":"b","text":"Less than 5 ohms","correct":false},{"id":"c","text":"Less than 0.5 megohm","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'On aircraft of non-metallic or composite construction, adequate lightning protection is achieved by:',
     '[{"id":"a","text":"Relying entirely on the aircraft paint finish","correct":false},{"id":"b","text":"Building a cage of metallic conductors with surge-carrying capability into the structure","correct":true},{"id":"c","text":"Increasing the insulation resistance of the airframe","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'What is the most common cause of excessive resistance found at a bonding or earth connection?',
     '[{"id":"a","text":"Corrosion","correct":true},{"id":"b","text":"Over-tightened fasteners","correct":false},{"id":"c","text":"Use of an oversized bonding lead","correct":false}]',
     '{"B1.1","B1.3","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M07.3 Crimping Tools & Techniques (17 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s3_id, 'PIDG, as used in the designation "PIDG thin wall wire terminals", stands for:',
     '[{"id":"a","text":"Positive Insulation Ductile Grip","correct":false},{"id":"b","text":"Pre-Insulated Diamond Grip","correct":true},{"id":"c","text":"Parallel Insertion Die Guide","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'When crimping a PIDG terminal, the tool handles should be closed:',
     '[{"id":"a","text":"Only part-way, to allow the crimp to be checked mid-cycle","correct":false},{"id":"b","text":"Completely, until the ratchet releases","correct":true},{"id":"c","text":"Until the operator feels sufficient resistance, regardless of the ratchet","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'On a PIDG crimping tool''s insulation support adjustment, what does Position 3 represent?',
     '[{"id":"a","text":"Tight","correct":false},{"id":"b","text":"Medium","correct":false},{"id":"c","text":"Loose","correct":true}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'The one or two raised dots left on a PIDG terminal''s insulation by the crimping tool serve to:',
     '[{"id":"a","text":"Indicate the manufacturing batch number","correct":false},{"id":"b","text":"Confirm that the correct tool was used for that wire size","correct":true},{"id":"c","text":"Show the direction the wire should be inserted","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'During the CERTI-CRIMP ratchet inspection on an AMP hand tool, the ratchet mechanism is considered satisfactory if a shim of what thickness can be inserted between the bottoming surfaces of the dies?',
     '[{"id":"a","text":"0.001 in","correct":true},{"id":"b","text":"0.01 in","correct":false},{"id":"c","text":"0.1 in","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'When gauging a crimping tool''s conductor crimp jaws, what is the correct result for the "GO" and "NO GO" gauges?',
     '[{"id":"a","text":"Both gauges should pass freely through the dies","correct":false},{"id":"b","text":"The GO gauge should pass through; the NO GO gauge should not enter","correct":true},{"id":"c","text":"Neither gauge should enter the dies at all","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'When performing a GO/NO GO gauge check on a crimping tool, the technician should:',
     '[{"id":"a","text":"Crimp the gauge fully to confirm the reading","correct":false},{"id":"b","text":"Never crimp the gauge, as this may damage the jaws","correct":true},{"id":"c","text":"Only test the gauge with the ratchet disengaged","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'When crimping an in-line splice joint with an AMP crimping tool, how many separate crimping operations are required?',
     '[{"id":"a","text":"One, covering both halves simultaneously","correct":false},{"id":"b","text":"Two — each half of the splice is crimped separately","correct":true},{"id":"c","text":"Three, including a final test crimp","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'On a "Stratotherm" style terminal with insulation support, which pin position should be selected for a cable with a large insulation diameter?',
     '[{"id":"a","text":"Position 1","correct":false},{"id":"b","text":"Position 2","correct":false},{"id":"c","text":"Position 3","correct":true}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'The insulation support setting on a crimped terminal is considered correct if:',
     '[{"id":"a","text":"The insulation does not break or fracture when the cable is bent through 90°","correct":true},{"id":"b","text":"The wire can be pulled completely free of the terminal by hand","correct":false},{"id":"c","text":"The crimp barrel shows visible flash around its edge","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'Sealed in-line crimping is intended to provide a splice that is:',
     '[{"id":"a","text":"Resistant to immersion (moisture ingress)","correct":true},{"id":"b","text":"Removable without cutting the wire","correct":false},{"id":"c","text":"Usable only on coaxial cable","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'During sealed in-line crimping, after the sealing sleeve is slid over the crimped splice, heat is applied until:',
     '[{"id":"a","text":"The wire insulation begins to smoke","correct":false},{"id":"b","text":"The internal sealant insert melts and flows axially along the wire, at which point heat is removed immediately","correct":true},{"id":"c","text":"The sleeve turns a uniform white colour","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'Under the general rules of in-line splicing, how many cables may normally be placed in a single crimp barrel?',
     '[{"id":"a","text":"Only one, unless specifically permitted by the airworthiness authority","correct":true},{"id":"b","text":"Up to two, of the same gauge","correct":false},{"id":"c","text":"As many as fit without deforming the barrel","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'In-line crimp splicing is generally restricted to conductors of what maximum size, without special approval?',
     '[{"id":"a","text":"Size 16 or smaller","correct":false},{"id":"b","text":"Size 10 (35 A) or smaller","correct":true},{"id":"c","text":"Size 4 or smaller","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'What is the key rule regarding which crimping tools may be used on AMP terminals?',
     '[{"id":"a","text":"AMP parts must be crimped using AMP tools only","correct":true},{"id":"b","text":"Any manufacturer''s tool may be used as long as the die size matches","correct":false},{"id":"c","text":"ERMA tools are the approved substitute for AMP terminals","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'When cutting a cable end immediately before crimping a Hellermann Deutsch terminal, the correct tool and method is:',
     '[{"id":"a","text":"A hacksaw, to give a clean flat cut","correct":false},{"id":"b","text":"Large cutters capable of cutting the cable with a single cutting action","correct":true},{"id":"c","text":"Wire strippers set to the conductor diameter","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'On the Daniels AF 8 crimping tool, the "THIA" turret head assembly is used to:',
     '[{"id":"a","text":"Provide three colour-coded positioners for different contact sizes in one indexing turret","correct":true},{"id":"b","text":"Measure the pull-off force of the finished crimp","correct":false},{"id":"c","text":"Automatically strip the wire before crimping","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'On the AMP 69062 hydraulic hand crimping tool, what indicates that the crimping operation is complete while pumping the handle?',
     '[{"id":"a","text":"An audible alarm built into the tool","correct":false},{"id":"b","text":"A sudden decrease in the effort needed to pump the handle","correct":true},{"id":"c","text":"The reservoir handle automatically returns to its start position","correct":false}]',
     '{"B1.1","B1.3","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M07.4 Crimped Joint Testing & Connector Pin Servicing (12 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s4_id, 'What is the primary purpose of a tensile test on a crimped joint?',
     '[{"id":"a","text":"To verify the electrical resistance of the joint","correct":false},{"id":"b","text":"To verify the mechanical strength of the crimp by pulling the sample to destruction","correct":true},{"id":"c","text":"To confirm the correct insulation colour has been used","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s4_id, 'During a tensile test on a crimped joint sample, at what rate do the testing machine jaws separate?',
     '[{"id":"a","text":"Between 1 and 2 inches per minute","correct":true},{"id":"b","text":"Between 10 and 20 inches per minute","correct":false},{"id":"c","text":"As fast as the machine allows","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s4_id, 'Before a tensile test is carried out on a crimped joint sample, any insulation grip is rendered inoperative by:',
     '[{"id":"a","text":"Removing the cable insulation from the sample","correct":true},{"id":"b","text":"Soldering the insulation grip in place","correct":false},{"id":"c","text":"Filling the insulation grip with epoxy","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s4_id, 'What does the voltage drop test on a crimped joint primarily verify?',
     '[{"id":"a","text":"The mechanical pull strength of the crimp","correct":false},{"id":"b","text":"The electrical contact resistance / integrity of the crimped joint","correct":true},{"id":"c","text":"The insulation resistance to earth","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s4_id, 'During a crimped joint voltage drop test, the test current is applied at an open-circuit voltage of no more than:',
     '[{"id":"a","text":"5 V","correct":false},{"id":"b","text":"30 V","correct":true},{"id":"c","text":"115 V","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s4_id, 'In the voltage drop test, the test probes are placed:',
     '[{"id":"a","text":"At the two ends of the entire wire run","correct":false},{"id":"b","text":"Between a point adjacent to the forward end of the crimp barrel and a point on the conductor immediately behind the barrel","correct":true},{"id":"c","text":"On either side of the wire''s outer insulation","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s4_id, 'As wire size increases (AWG number decreases), the minimum specified pull-off load for a qualified crimp:',
     '[{"id":"a","text":"Decreases","correct":false},{"id":"b","text":"Increases","correct":true},{"id":"c","text":"Stays constant regardless of wire size","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s4_id, 'During routine visual inspection of a crimped joint, which of the following is specifically checked for?',
     '[{"id":"a","text":"Absence of insulation or other non-conducting material inside the crimp barrel","correct":true},{"id":"b","text":"The exact ambient temperature at the time of crimping","correct":false},{"id":"c","text":"The date the wire was originally manufactured","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s4_id, 'Why are dedicated plastic or tweezer-type tools used to remove and insert connector pins, rather than pliers or a screwdriver?',
     '[{"id":"a","text":"They are faster to use for high production rates","correct":false},{"id":"b","text":"They prevent damage to the contact retaining clips and connector insert material","correct":true},{"id":"c","text":"They are required only for coaxial connectors","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s4_id, 'On plastic connector pin insertion/extraction tools, which colour identifies a size 16 contact?',
     '[{"id":"a","text":"Red","correct":false},{"id":"b","text":"Blue","correct":true},{"id":"c","text":"Yellow","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s4_id, 'On a composite (dual-ended) plastic pin tool, the extraction end is always which colour?',
     '[{"id":"a","text":"White","correct":true},{"id":"b","text":"Black","correct":false},{"id":"c","text":"Green","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s4_id, 'What caution applies when using a plastic or tweezer-type tool inside a connector during pin removal?',
     '[{"id":"a","text":"The tool should be tipped and rotated to help release the contact","correct":false},{"id":"b","text":"The tool must never be tipped, spread, or rotated while inside the connector","correct":true},{"id":"c","text":"The tool should be left in place for at least 60 seconds before withdrawal","correct":false}]',
     '{"B1.1","B1.3","B2"}');

END $$;
