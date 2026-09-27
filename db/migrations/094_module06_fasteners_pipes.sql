-- Module 06: Materials and Hardware (B1/B2) — Fasteners, and Pipes and Unions
-- Source: EASA Part-66 Module 06 Study Notes (Sub-Modules 6.5 and 6.6) + associated question bank

DO $$
DECLARE
    m06_id INT;
    s5_id  INT;
    s6_id  INT;
BEGIN
    SELECT id INTO m06_id FROM easa_modules WHERE code = 'M06';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M06.5') THEN
        RAISE NOTICE 'M06.5/M06.6 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 06.5: Fasteners
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m06_id, 'M06.5', 'Fasteners',
        $cnt$
# Fasteners

This is the largest sub-module in Module 06, and the one most closely tied to everyday work on the aircraft. The part-number breakdowns are guaranteed exam material — learn them.

## Screw Threads

### Nomenclature

| Term | Definition |
|------|------------|
| **Major diameter** | The largest diameter — across the crests of an external thread |
| **Minor (root) diameter** | The smallest diameter — across the roots of an external thread |
| **Pitch diameter** | The imaginary diameter where the width of the thread and the width of the space are equal. This is the diameter that actually decides the fit |
| **Pitch** | The distance from a point on one thread to the same point on the next thread |
| **Lead** | The axial distance advanced in one full turn. Single start: lead = pitch. Two start: lead = 2 × pitch |
| **Crest / root / flank** | The top surface, the bottom surface, and the sloping side of the thread |
| **Thread angle** | The included angle between the flanks — 60° for Unified and Metric, 55° for Whitworth |
| **Helix angle** | The angle of the thread helix relative to a plane at right angles to the axis |
| **Depth of thread** | Radial distance between crest and root |
| **Class of fit** | How tightly the internal and external threads mate |

### Thread Forms

- **Unified (UN)** — the aircraft standard in the US/UK inch world; 60° angle, rounded root and crest.
  - **UNC** coarse — quicker to assemble, better in soft materials.
  - **UNF** fine — stronger (bigger minor diameter, more threads carrying load), better vibration resistance, used for most aircraft bolts.
  - **UNEF** extra fine — thin-walled parts.
  - **UNS** special.
- **Metric (ISO)** — 60°, designated M8 x 1.25 (diameter x pitch).
- **Whitworth (BSW) / BSF** — 55°, rounded crest and root. Older British aircraft.
- **BA (British Association)** — 47.5°, small instrument screws.
- **Acme** — 29°, trapezoidal; for power transmission — jack screws, flap and stabiliser actuators, vices.
- **Buttress** — one flank near vertical; carries a very high load in one direction only.
- **Square** — the most efficient power thread but hard to make; largely replaced by Acme.
- **Taper pipe threads (NPT / BSPT)** — seal by thread interference, used on some fluid fittings with the correct sealant.

### Classes of Fit

- **Class 1** — loose: assembles with the fingers, used where quick assembly matters.
- **Class 2** — free: the normal aircraft screw and bolt fit, a good balance of ease of assembly and security.
- **Class 3** — medium/close: needs a wrench throughout; used for high-strength and close tolerance work.
- **Class 4** — close: interference; must be forced.

In Unified practice, "A" = external thread and "B" = internal thread: 3A on the bolt, 3B in the nut.

### Thread Designation — Reading It

`1/4 - 28 UNF - 3A LH` means: 1/4 inch nominal diameter, 28 threads per inch, Unified Fine form, class 3 external fit, left-hand thread.

Right-hand threads tighten clockwise; left-hand threads tighten anticlockwise and are usually marked with a groove or flats on the hexagon.

### Measuring and Checking Threads

- **Thread pitch gauge** — a set of leaves stamped with the tpi; find the leaf that seats with no light showing.
- **Screw thread micrometer** — has a V anvil and a conical spindle; reads the pitch diameter directly.
- **Three-wire method** — three precision wires in the thread grooves, measured with an ordinary micrometer and converted by formula. The most accurate workshop method for pitch diameter.
- **GO / NO-GO ring and plug gauges** — the production check: the GO gauge must enter fully, the NO-GO must not enter more than a turn or two.
- **Optical comparator / profile projector** — checks the actual form and angle against a template.
- Simple field checks: run the correct nut down by hand, and check the thread visually for burrs, damage, corrosion and stripped or "pulled" crests.

## Bolts

### Standards

- **AN** — Air Force/Navy. **NAS** — National Aerospace Standard (higher strength, close tolerance). **MS** — Military Standard. **AMS** — material specification. **BS/SP** — British.
- AN bolts come in hex head, clevis and eyebolt. NAS adds internal wrenching and countersunk heads. MS gives hex head and internal wrenching.

### Head Markings — Identify the Bolt Before You Fit It

| Head marking | Meaning |
|--------------|---------|
| Cross or asterisk (X) | AN standard steel bolt |
| Single raised dash | AN standard steel bolt |
| Two raised dashes | Alloy steel, higher strength |
| Raised or recessed triangle | NAS close tolerance bolt |
| Letter S | Special bolt — manufacturer specific, must be replaced like for like |
| Double dash / letter D | Aluminium alloy 2024 bolt (usually anodised) |
| Raised dash inside a raised circle | Corrosion resistant steel |
| Plain head | Low strength material — do not use in structure |
| Coloured lacquer / distinctive mark | Bolt has been Magnaflux or Zyglo inspected |

### Part Number Breakdown — The Exam Favourite

`AN4-DD-5A` read piece by piece:
- **AN4** — AN standard hex head bolt, diameter 4/16 inch = 1/4 inch (the digit after AN is the diameter in sixteenths).
- **DD** — the material: DD = 2024 aluminium alloy. C = corrosion resistant steel. No letters = cadmium plated alloy steel.
- **5** — grip length in eighths of an inch = 5/8 inch.
- **A** — the shank is undrilled. No letter at all = drilled shank (for a cotter pin).
- An **H** before the length digit = the head is drilled for lockwire.

So AN4H5 = 1/4 in alloy steel bolt, drilled head, 5/8 in grip, drilled shank.

- AN bolt diameters run AN3 to AN20 = 3/16 in to 1 1/4 in.
- Grip length is the length of the unthreaded shank. It must equal the total thickness of the material being clamped, so that the plain shank carries the shear and no thread lies in the bearing surface.
- A common working rule: no more than one thread inside the hole, and about one to three threads showing beyond the nut. Add washers to fine-tune grip — but not more than about three.

### Types of Bolt

- **General purpose hex head** (AN3-AN20) — tension and shear, light drive fit (about 0.006 in clearance for a 5/8 in hole).
- **Close tolerance** (AN173-186, NAS) — machined accurately, driven in with a 12-14 oz hammer; used where the joint carries severe reversing shear, because a loose bolt would hammer the hole oval.
- **Internal wrenching** (NAS144-158, MS20004-24) — very high strength alloy steel with a hex socket head; used in high tension applications. Requires a special countersunk washer under the head and a heat-treated washer under the nut, because of the head radius and the loads involved.
- **Clevis bolt** (AN21-36) — slotted or drilled round head, short threaded portion, used in shear only — control system linkages. Never use one in tension.
- **Eyebolt** (AN42-49) — a looped end for a cable, turnbuckle or rod end — tension applications.
- **Drilled head bolt** — for lockwire. **Hi-Lok / Hi-Lite** — a pin and a collar with a break-off drive; gives controlled preload with one hand access on one side only.
- **Lockbolt (Huck)** — a pin with a swaged collar. Pull type (blind side collar swaged and stem broken) and stump type (needs a bucking bar). Permanent, fast, consistent preload, light.
- **Jo-bolt** — a three-part blind structural bolt (nut, sleeve, screw) for use where there is access to one side only, in high-strength applications. Not removable without destroying it.

### Rules for Bolts

- Alloy steel bolts smaller than 10-32 and aluminium alloy bolts smaller than 1/4 in are not used in primary structure.
- Aluminium bolts and nuts are not used where they will be repeatedly removed for maintenance (the threads wear) and not on seaplanes (dissimilar metal corrosion).
- Always fit the bolt with the head up or forward where possible, so that if the nut comes off, gravity and airflow keep the bolt in place.
- The bolt takes the load in shear through its plain shank, or in tension through its threads — never design a joint that puts a thread in bearing.

## Nuts

| Nut | Locked by | Notes |
|-----|-----------|-------|
| Castle (AN310) | Cotter pin through slots and the drilled bolt shank | The standard for shear/tension bolts in control systems and anywhere positive locking is needed |
| Castellated shear (AN320) | Cotter pin | Thinner, lower strength — shear applications only, with clevis bolts |
| Plain hex (AN315) | Check nut or lockwasher | Full strength but needs separate locking |
| Check nut (AN316) | Jams against another nut | Used on turnbuckle ends and threaded rod ends |
| Wing nut (AN350) | Hand tight only | Frequent removal, low torque — battery connections, hose clamps |
| Sheet spring (speed) nut | Spring tension of the nut itself | Non-structural — cowlings, fairings, trim |
| Self-locking, fibre/nylon insert (AN365, MS20365) | Unthreaded fibre or nylon collar gripping the thread | Reusable only while it still gives resistance; temperature limited to about 121°C (250°F); do not use where the failure of the nut could jeopardise the aircraft, or in the engine hot section |
| Self-locking, all metal (AN363, MS21042, "stiff nut") | Deformed or slotted-and-pinched top threads | High temperature capable; used on exhaust, engine and hot areas |
| Anchor nut / nutplate | Riveted or clipped to the structure | For blind access — inspection panels, fairings. Fixed, floating, gang channel and sealing types |
| Pal nut | Thin stamped nut jammed on top of a plain nut | A secondary lock, used with turnbuckles and older assemblies |
| Rivnut | Blind threaded insert set with a pull tool | Gives a thread in thin sheet where you cannot reach behind — de-icer boots, panels |

### Self-Locking Nut Rules You Must Know

- The bolt must protrude at least flush with the top of the nut — if you cannot see the end of the bolt through the nut, the locking feature is not engaged.
- A fibre nut is serviceable only while it still resists being run down by hand at the point where the thread first enters the collar. Once it spins freely, scrap it.
- Never use a self-locking nut on a rotating part or where the bolt turns (a pulley bolt, a control hinge) — use a castle nut and a cotter pin.
- Fibre nuts are limited to about 250°F. Above that use all-metal.

## Screws, Studs and Dowels

### Screws

- The general difference from a bolt: a screw usually has a lower strength material, a loose thread fit, a slotted or recessed head for a driver, and often no clearly defined grip length (threaded most of the way).
- **Structural screws** (AN509, AN525, NAS204) — same material and strength as a bolt, with a definite grip — can be used in structure.
- **Machine screws** (AN515 round head, AN520, AN505/510 fillister, AN500/501) — the general-purpose fastener.
- **Self-tapping screws** (AN504, AN530) — cut their own thread; non-structural only — name plates, brackets, trim. Never use one to replace a structural fastener.
- **Drive screws** (AN535) — hammered in, effectively a removable rivet, for permanent name plates and sealing blind holes.
- Head recesses: slotted, Phillips, Pozidriv, Torx, hex socket. Use the correct driver, fully engaged, held square — a cammed-out recess is the fastest way to make a panel unairworthy.

### Studs

- A stud is threaded at both ends and stays permanently in the parent part; the nut does the work. Used where repeated assembly would wear out a tapped hole — cylinder holding-down studs, magneto flanges.
- **Standard stud** — plain shank between two threads.
- **Waisted stud** — the shank is reduced below the thread root diameter, so it can stretch and absorb shock, and any failure occurs in the shank where it is detectable.
- **Stepped stud** — the parent-end thread is a different (usually larger) size, so an oversize repair can be made in the casting without changing the nut.
- **Shouldered stud** — has a shoulder that locates the part and controls the depth of insertion.
- Fitting: screw in with a stud tool or two locked nuts, to the specified depth and torque; some are fitted with a locking compound or an interference fit. Removal by stud extractor — never grip the thread with pliers.

### Dowels

- Plain, headless pins used to locate one part accurately on another (a crankcase half, a gearbox cover). They take the shear load and let the bolts take the clamp load. Never rely on the bolts alone for alignment.

## Washers

- **Plain washer** (AN960/AN970) — spreads the load, protects the surface, provides a bearing face, and adjusts grip length. AN970 is the large-area washer for wood or thin sheet.
- **Lockwasher** (AN935 split spring, AN936 shakeproof/star) — bites into the nut and the surface to resist rotation. Not for use on primary or secondary structure, on control systems, on soft material, or where it will be removed frequently.
- **Countersunk washer** — for internal wrenching bolts, matching the head radius.
- **Special washers** — ball socket and seat washers for angled surfaces, taper washers for tapered flanges, heat-treated washers under high-strength nuts.
- **Tab washer** — a locking device, not a load-spreading washer.

## Locking Devices

Vibration undoes threads. Every threaded fastener on an aircraft is locked by friction or, better, by a positive mechanical device. Positive locking is the only kind acceptable in a flight control system.

### Cotter (Split) Pins

- Used with castle nuts and drilled bolts. Always fit a new pin — never reuse one.
- Preferred method: the upper prong bent back over the bolt end, the lower prong bent down along the nut face; trim so nothing protrudes far enough to snag or foul.
- Alternative method: prongs bent around opposite sides of the nut.
- If the hole does not line up, tighten to the next slot within the torque range — never slacken back off. If it still will not line up, change the washer thickness.

### Lockwire (Safety Wire)

- Double twist is the standard method; single wire is used only in a closely spaced, confined series where specified.
- The wire must be pulled so that the tension is always in the tightening direction.
- 6 to 8 twists per inch, evenly spaced and tight but not overstressed (over-twisting work hardens and breaks the wire).
- Normally not more than three fasteners in one series (unless closer, as in a small bolt circle).
- Finish with a pigtail of three to four twists, cut off and bent back so it cannot snag hands or be ingested.
- Use the correct diameter and material — usually 0.032 in corrosion resistant or annealed steel; never reuse lockwire.
- Also used on oil caps, drain cocks, valves, electrical connectors and turnbuckles, and to hold emergency devices in place with frangible copper wire that is designed to break.

### Other Positive Locks

- **Tab washer** — a washer with tabs, one bent up against a flat of the nut and another bent down into a hole or over an edge. Use a new one every time; do not bend a tab twice.
- **Locking plate** — a plate that fits over the nut and is screwed to the structure, used with internal wrenching bolts and some gearbox nuts.
- **Circlips / snap rings** — internal or external spring rings in a groove, retaining a bearing or a pin. Fitted with the correct pliers; check the groove and that the ring is fully seated. Do not over-open them.
- **Keys** — transmit torque between a shaft and a hub: parallel (square/rectangular), gib head (has a head for extraction), Woodruff (semicircular, self-aligning, used on tapered shafts, e.g. magneto drives).
- **Pal nut** — a thin locking nut run down onto a plain nut.
- **Roll (spring) pin** — a rolled, split, springy tube driven into a hole to retain or align.
- **Quick release / turnlock fasteners** — for panels and cowlings that come off often:
  - **Dzus** — a stud with a spiral cam slot, a grommet and a spring wire; a quarter turn with a screwdriver locks it.
  - **Camloc** — a stud and receptacle assembly with a cross pin engaging a cam — also quarter turn.
  - **Airloc** — a stud with a cross pin engaging a cam ring in the receptacle.
- **Thread-locking compounds** — used only where the maintenance manual calls for them, with the specified grade and surface preparation.

## Solid Rivets

### Materials and Codes

| Code | Material | Head marking | Notes |
|------|----------|---------------|-------|
| A | 1100 (99%+ pure Al) | Plain | Very soft — non-structural only |
| AD | 2117-T | Recessed dimple (dot) | The field rivet — by far the most used. Driven as received, no heat treatment, good corrosion resistance |
| D | 2017-T | Raised dot | Stronger; an icebox rivet — drive within about 1 hour of removal from the freezer |
| DD | 2024-T | Raised double dash | Strongest common aluminium rivet; icebox — drive within 10-20 minutes |
| B | 5056 | Raised cross | For magnesium structure — corrosion compatible |
| M | Monel | Plain or double dimple | For nickel-steel alloys; can substitute for CRES |
| F | Corrosion resistant steel | Recessed dash | Firewalls, exhaust brackets |
| — | Mild steel | Plain | Steel parts |
| C | Copper | Plain | Copper alloys and non-metallics only (leather) |
| — | Titanium | Recessed large dash | Special applications |

Protective coating is identified by colour: zinc chromate = yellow, anodised = pearl grey, metal sprayed = silvery grey.

### Head Styles

- **AN470 / MS20470** — universal head. Replaces round, brazier and flat heads; the standard protruding head for repair.
- **AN426 / MS20426** — 100° countersunk (flush) head, for aerodynamic surfaces.
- AN430 round head, AN455/456 brazier head (large shallow head for thin sheet), AN442 flat head (internal structure) — older styles you will still meet.

### Part Number — Reading It

`MS20470AD4-6`:
- **MS20470** — the standard and head style (universal head).
- **AD** — material: 2117-T aluminium alloy.
- **4** — diameter in 32nds of an inch = 4/32 = 1/8 inch.
- **6** — length in 16ths of an inch = 6/16 = 3/8 inch.

So: universal head, 2117-T, 1/8 in diameter, 3/8 in long. The same logic applies to MS20426 (countersunk).

### Selection and Installation Rules

- Diameter — about three times the thickness of the thickest sheet being joined (never less than the thickness of the thicker sheet).
- Length — grip (total material thickness) plus 1.5 x diameter to form the shop head.
- Formed (shop) head dimensions when driven: diameter 1.5D, height 0.5D.
- Edge distance — the centre of the hole at least 2D from the edge (2.5D preferred), never less than 2D.
- Pitch (spacing along a row) — normally 3D to 12D; transverse pitch (between rows) normally at least 2.5D.
- Hole must be the correct size, drilled square, deburred, and the sheets clamped tightly together before driving — otherwise the rivet swells between the sheets.
- Countersinking: machine countersink where the sheet is thicker than the head; dimple thin sheet (coin dimpling or hot dimpling for hard alloys).
- Removal: file the head flat, centre punch, drill to the depth of the head only with a drill one size under the rivet diameter, then break the head off with a pin punch and drive the shank out — never drill straight through and never enlarge the hole.

## Blind Rivets and Special Fasteners

Used where there is no access to the far side, or where the full strength of a solid rivet is not required. They are installed from one side by pulling a stem through the sleeve.

- **Self-plugging friction lock** (e.g. MS20600) — the stem is retained by friction only, so it can vibrate out. Non-structural. Recognisable by the broken stem sitting slightly proud.
- **Pull-thru** — the stem pulls completely through and is discarded, leaving a hollow rivet. Non-structural.
- **Mechanical lock, self-plugging** (Cherrylock, CherryMax, Huck) — a locking collar mechanically drives a ring into the head to lock the stem permanently and the stem breaks flush. These are structural and are the ones you will use on a repair. CherryMax also offers one tool for a whole size range.
- **Hi-Shear (pin) rivet** — a threadless bolt with a swaged collar. Shear only; never use where the grip length is less than the shank diameter. Has the same shear strength as a bolt of equal diameter, at about 40% of the weight, and about three times the strength of a solid rivet.
- **Taper-Lok** — a tapered shank pulled into a tapered hole by a nut; the strongest special fastener — it fills the hole completely without deforming and puts the surrounding material into radial compression.
- **Hi-Tigue** — a bead at the base of the shank preloads the hole, greatly improving fatigue life of the joint.
- **Rivnut** — a blind threaded rivet, giving a thread in a place you cannot reach.
- Rivet codes for special rivets follow the same idea: diameter in 32nds and grip in 16ths. E.g. NAS177-14-17 = 100° countersunk pin rivet, 14/32 diameter, maximum grip 17/16.

## Installation, Torque and Thread Repair

### Torque

- Torque exists to produce the correct bolt tension (preload), which is what actually holds a joint together and stops fatigue. It is not just "tight".
- Use the manufacturer's figures. Where none exist, use the standard torque tables — and note whether they are for dry or lubricated threads. Lubricating a thread specified as dry can overstress the bolt by 20% or more.
- Torque the nut, not the bolt head, unless the manual says otherwise (the tables are written for turning the nut).
- Run the nut down by hand first; if there is drag from a self-locking feature, measure the running torque and add it to the specified figure.
- Apply the load slowly and smoothly, in the correct sequence for a multi-bolt flange, and do not jerk. Never use a torque wrench to slacken a fastener.
- If an extension or adapter changes the effective length, the setting must be recalculated: **Wrench setting = Desired torque x L / (L + A)**, where L is the wrench length and A is the added length of the extension in the same line.
- Torque wrenches are calibrated tools: check the calibration date, store click-types wound down to their lowest setting, and never drop one.

### Hole and Thread Repair

- **Helicoil** — a coiled stainless wire insert screwed into a specially tapped oversize hole; restores a damaged internal thread to the original size and gives a harder, more wear-resistant thread than the parent aluminium. Drill, tap with the special tap, wind in the insert with the mandrel, then break off the driving tang.
- **Keensert / solid inserts** — a solid bush locked with keys or a locking ring; used where higher strength is needed.
- **Acres fastener sleeves** — a thin sleeve fitted into an oversize or slightly damaged fastener hole so that the original size fastener can still be used, restoring an interference fit and improving fatigue life without going oversize on the bolt.
- **Oversize fasteners** — the last resort, and only within the limits given in the SRM; the new hole must still meet edge distance and spacing requirements.

## Fast Revision

- AN bolt: the number is diameter in 16ths; the length digit is grip in eighths. Rivet: diameter in 32nds, length in 16ths.
- Grip length = material thickness. Clevis bolt = shear only. Eyebolt = tension.
- Fibre self-locking nut: max about 250°F, bolt must show through the nut, never on a rotating part.
- Lockwire: double twist, 6-8 twists per inch, always pulling in the tightening direction, max 3 fasteners.
- Cotter pins and tab washers are always renewed, never reused. Tighten to the next slot, never back off.
- Rivet shop head = 1.5D wide x 0.5D high. Edge distance 2D minimum. Length = grip + 1.5D.
- AD = 2117 field rivet (dimple). DD = 2024 (double dash), icebox, 10-20 minutes.
- Torque produces preload. Check dry or lubricated, and correct for any extension.
        $cnt$,
        5
    ) RETURNING id INTO s5_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 06.6: Pipes and Unions
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m06_id, 'M06.6', 'Pipes and Unions',
        $cnt2$
# Pipes and Unions

Covers identification and types of rigid and flexible pipes and their connectors, and standard unions for hydraulic, fuel, oil, pneumatic and air system pipes.

## Rigid Lines — Materials

| Material | Where used |
|----------|------------|
| 1100-H14 / 3003-H14 (soft aluminium) | Low or no pressure: instrument lines, ventilating ducts, drains |
| 5052-O aluminium | General purpose low/medium pressure — fuel, oil, coolant, instrument lines. Easy to flare and bend |
| 2024-T3 / 6061-T6 aluminium | Medium and high pressure hydraulic lines |
| Corrosion resistant steel (annealed 304, 321, 347) | High pressure hydraulic (up to 3,000+ psi), brake lines, landing gear, engine and firewall areas, anywhere abrasion or fire is a risk |
| Titanium 3AL-2.5V | Modern high pressure hydraulic systems — a big weight saving over steel. Must not be flared — use swaged or special fittings |
| Copper | Obsolete for aircraft fluid lines — it work hardens and cracks with vibration. Still found on very old types; must be annealed periodically |

- Rigid tube size is given as outside diameter (OD) in 16ths of an inch plus the wall thickness. So a "-8" line is 8/16 = 1/2 inch OD.
- Identify the material by markings, colour code bands, weight, magnetism (CRES vs aluminium) and a spot check with a magnet or file — but always confirm against the IPC.

## Rigid Line Fittings

### AN Flared Fittings — the 37 Degree Standard

- The tube end is flared to 37 degrees; a sleeve and a nut pull the flare onto the cone of the fitting to make a metal-to-metal seal.
- AC (older Air Corps) fittings use 45 degrees and are not interchangeable with AN. Automotive fittings are also 45 degrees — never mix them.
- Identify: AN fittings are usually blue or black anodised (aluminium) or plain steel; AC fittings are grey/black with a different shoulder. AN steel fittings often carry a small identification mark.
- Single flare for most sizes; double flare on soft aluminium tubing of 3/8 in OD and under, because it is stronger and resists cracking.
- Flaring faults to look for: cracks or splits, off-centre, too long (fouls the threads), too short (blows out), scored or dirty seat, tube not cut square.

### Flareless (MS / Bite-Type) Fittings

- No flare is made. A sleeve (ferrule) with a sharp internal edge bites into the outside of the tube as the nut is tightened, gripping and sealing it.
- Installation: cut square, deburr, pre-set the sleeve in a presetting tool or the fitting itself, then tighten the nut the specified amount past finger tight (typically 1/6 to 1/3 turn) — torque by turns, not by feel.
- Advantages: no flaring equipment, fewer parts to damage, good for high pressure. Disadvantage: easily over-tightened, which collapses the tube.

### Other Connections

- **Swaged fittings** — permanently swaged onto the tube with a portable tool; light, strong, leak-free, no flare. Used extensively on modern transports.
- **Cryofit** — a shape-memory alloy sleeve, shrunk in liquid nitrogen, slipped on and allowed to warm so it shrinks tight. Permanent — the tube must be cut out to remove it.
- **Universal bulkhead fitting** — passes through a bulkhead with a locknut, keeping the join accessible and the structure sealed.
- Banjo, elbow, tee, cross, union, reducer, blanking cap — know the names.

## Flexible Hose

### Construction

1. **Inner tube (liner)** — carries the fluid; must be compatible with it (synthetic rubber, Buna-N, neoprene, butyl for Skydrol, or PTFE/Teflon).
2. **Reinforcement** — one or more braids of cotton, or steel wire, which give the hose its pressure rating.
3. **Outer cover** — protects against abrasion, oil, ozone and weather.

| Class | Reinforcement | Typical duty |
|-------|----------------|--------------|
| Low pressure | One fabric braid | Up to about 300 psi — instrument, vent, drain lines |
| Medium pressure | One wire braid + fabric | Up to about 1,500 psi |
| High pressure | Two or more wire braids | 3,000 psi and above — hydraulic systems |

- **PTFE (Teflon) hose** — extruded PTFE tube with a stainless steel wire braid. Unaffected by any known fuel, petroleum or synthetic oil, alcohol, coolant or solvent; very wide temperature range; practically unlimited storage life. Often preformed — never straighten a preformed PTFE hose; support it with a wire if it must be removed.
- Hose size is quoted by the inside diameter in 16ths of an inch (the opposite convention to rigid tube, which uses OD).

### Hose Identification

- A lay line (a printed stripe running the length of the hose) plus letters and numbers repeated at intervals of not more than 9 inches gives the specification, the quarter and year of manufacture and the manufacturer code.
- Hose suitable for phosphate-ester fluid is marked "Skydrol use".
- The lay line is fitted straight, not spiralled. If it spirals when installed, the hose has been twisted — it will fail early and it will try to unscrew its own fitting.
- Hoses have a shelf life and a service life; check the cure date before fitting.

### Hose Fittings and Installation

- Fittings are reusable (screw-together) or swaged (permanent). Reusable fittings can be fitted in the workshop; swaged assemblies come as a complete part number.
- Leave 5-8% slack in the length of a flexible hose. It contracts by up to about 4% under pressure, and it must not be in tension.
- Respect the minimum bend radius and keep bends at least two fitting-lengths clear of the end fitting.
- Support with the correct clamps at the specified spacing; protect from chafing, heat and moving parts; do not let a hose rub on structure.
- Torque the nut with two spanners — one to hold the fitting — so no twist is put into the hose or the line.

## Fluid Line Identification

Lines are identified with colour-coded tape or decals carrying a word, a colour and a geometric symbol, so the system can be identified by a colour-blind engineer or in poor light.

| System | Colour |
|--------|--------|
| Fuel | Red |
| Lubrication (oil) | Yellow / brown |
| Hydraulic | Blue and yellow |
| Pneumatic / compressed air | Orange |
| Oxygen | Green (and green/white) |
| Fire protection | Brown |
| De-icing / anti-icing | Dark grey |
| Coolant | Blue |
| Instrument air / vacuum | Orange and blue |
| Water injection | Dark green |

- Tape is applied near each end, at each junction, and at intervals through the run — and always where a line passes through a bulkhead or into a new compartment.
- Beware: colour conventions vary between manufacturers and between EASA and older schemes. Always confirm with the aircraft documentation before cutting into a line.

## Inspection and Damage Limits

- **Rigid line**: look for dents, scratches, nicks, kinks, corrosion, cracked flares, loose or worn nuts and sleeves, chafing at clamps, and evidence of leakage (blue or brown staining).
- A general rule found in most manuals: a dent up to 20% of the diameter is acceptable if it is not in the heel of a bend; scratches or nicks up to 10% of wall thickness may be blended out if not in the heel of a bend. Always check the actual figures for the type.
- A kinked, cracked or severely dented line is replaced, not repaired.
- **Flexible hose**: look for cracked, hard, brittle or soft cover, blisters, exposed or broken wire braid, twisted lay line, leaking or slipped fittings, and expired life.
- After any work on a line: check for correct routing, clearance, support, security, absence of twist, then pressure test and leak check before release.
        $cnt2$,
        6
    ) RETURNING id INTO s6_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M06.5 Fasteners (21 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s5_id, 'In screw thread nomenclature, "pitch" is defined as:',
     '[{"id":"a","text":"The distance from a point on one thread to the same point on the next thread","correct":true},{"id":"b","text":"The axial distance advanced in one full turn","correct":false},{"id":"c","text":"The radial distance between crest and root","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'On a two-start thread, the lead equals:',
     '[{"id":"a","text":"Half the pitch","correct":false},{"id":"b","text":"The same as the pitch","correct":false},{"id":"c","text":"Two times the pitch","correct":true}]',
     '{"B1","B2"}'),

    (s5_id, 'The included thread angle for Unified and Metric threads is 60 degrees; for Whitworth threads it is:',
     '[{"id":"a","text":"55 degrees","correct":true},{"id":"b","text":"47.5 degrees","correct":false},{"id":"c","text":"29 degrees","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'Compared with UNC (coarse) threads, UNF (fine) threads used on most aircraft bolts are:',
     '[{"id":"a","text":"Weaker but quicker to assemble","correct":false},{"id":"b","text":"Stronger, with better vibration resistance","correct":true},{"id":"c","text":"Only used for thin-walled parts","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'Which thread form is used for power transmission applications such as jack screws and flap actuators, with a 29 degree angle?',
     '[{"id":"a","text":"Acme","correct":true},{"id":"b","text":"Buttress","correct":false},{"id":"c","text":"BA (British Association)","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'Class 2 fit, the normal aircraft screw and bolt fit, is best described as:',
     '[{"id":"a","text":"Loose — assembles with the fingers","correct":false},{"id":"b","text":"Free — a good balance of ease of assembly and security","correct":true},{"id":"c","text":"Close — an interference fit that must be forced","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'The thread designation 1/4-28 UNF-3A LH indicates:',
     '[{"id":"a","text":"1/4 in diameter, 28 threads per inch, Unified Fine, class 3 external fit, left-hand thread","correct":true},{"id":"b","text":"1/4 in diameter, 28 threads per inch, Unified Coarse, class 3 internal fit, right-hand thread","correct":false},{"id":"c","text":"28/1000 in diameter, class 4 fit, right-hand thread","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'The most accurate workshop method of measuring pitch diameter is the:',
     '[{"id":"a","text":"Thread pitch gauge","correct":false},{"id":"b","text":"Three-wire method","correct":true},{"id":"c","text":"Optical comparator","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'For a GO / NO-GO thread gauge check, a serviceable thread is one where:',
     '[{"id":"a","text":"The GO gauge enters fully and the NO-GO does not enter more than a turn or two","correct":true},{"id":"b","text":"Neither gauge enters the thread at all","correct":false},{"id":"c","text":"Both gauges enter fully","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'Reading the bolt part number AN4-DD-5A, the "DD" indicates:',
     '[{"id":"a","text":"A grip length of 5/8 inch","correct":false},{"id":"b","text":"2024 aluminium alloy material","correct":true},{"id":"c","text":"An undrilled shank","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'A cross or asterisk (X) marked on a bolt head identifies it as:',
     '[{"id":"a","text":"An AN standard steel bolt","correct":true},{"id":"b","text":"A corrosion resistant steel bolt","correct":false},{"id":"c","text":"An NAS close tolerance bolt","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'A raised or recessed triangle on a bolt head identifies it as:',
     '[{"id":"a","text":"An aluminium alloy 2024 bolt","correct":false},{"id":"b","text":"An NAS close tolerance bolt","correct":true},{"id":"c","text":"A low strength bolt not for use in structure","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'Close tolerance bolts (AN173-186, NAS) are driven into place using:',
     '[{"id":"a","text":"A 12-14 oz hammer","correct":true},{"id":"b","text":"A hydraulic press only","correct":false},{"id":"c","text":"Hand pressure only, never a hammer","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'A clevis bolt (AN21-36), used in control system linkages, is intended for:',
     '[{"id":"a","text":"Tension applications only","correct":false},{"id":"b","text":"Shear applications only — never use one in tension","correct":true},{"id":"c","text":"Combined tension and shear equally","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'The grip length of an AN bolt should equal the total thickness of the clamped material so that:',
     '[{"id":"a","text":"The plain shank carries the shear and no thread lies in the bearing surface","correct":true},{"id":"b","text":"Maximum thread engagement is achieved inside the hole","correct":false},{"id":"c","text":"The bolt can be tightened without a washer","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'Aluminium alloy bolts and nuts should not be used on seaplanes because of:',
     '[{"id":"a","text":"Their low tensile strength","correct":false},{"id":"b","text":"Dissimilar metal corrosion","correct":true},{"id":"c","text":"Their inability to be torqued accurately","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'The castle nut (AN310), the standard nut for shear/tension bolts in control systems, is locked by:',
     '[{"id":"a","text":"A cotter pin through the slots and the drilled bolt shank","correct":true},{"id":"b","text":"Spring tension of the nut itself","correct":false},{"id":"c","text":"Jamming against another nut","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'A fibre self-locking nut (AN365, MS20365) is correctly engaged only when:',
     '[{"id":"a","text":"The bolt end protrudes at least flush with the top of the nut","correct":true},{"id":"b","text":"The nut spins freely onto the bolt by hand","correct":false},{"id":"c","text":"A lockwasher is fitted underneath it","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'A self-locking nut must never be used:',
     '[{"id":"a","text":"On a wing nut application","correct":false},{"id":"b","text":"On a rotating part or where the bolt turns — use a castle nut and cotter pin instead","correct":true},{"id":"c","text":"On a check nut application","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'When applying lockwire (safety wire), the standard practice is:',
     '[{"id":"a","text":"6 to 8 twists per inch, pulled so tension is always in the tightening direction","correct":true},{"id":"b","text":"2 to 3 twists per inch, pulled in the loosening direction","correct":false},{"id":"c","text":"As many twists per inch as possible for maximum strength","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'Normally, how many fasteners may be linked in one lockwire series (unless they are closely spaced, as in a small bolt circle)?',
     '[{"id":"a","text":"Not more than three","correct":true},{"id":"b","text":"Not more than six","correct":false},{"id":"c","text":"There is no limit provided the wire does not break","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'Rivet material code "AD" (2117-T), the field rivet, is identified by which head marking, and requires:',
     '[{"id":"a","text":"A raised cross; must be heat treated before driving","correct":false},{"id":"b","text":"A recessed dimple (dot); driven as received, no heat treatment required","correct":true},{"id":"c","text":"A raised double dash; must be driven within 10-20 minutes of removal from the freezer","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'A DD (2024-T) rivet, the strongest common aluminium rivet, is an icebox rivet that must be driven within:',
     '[{"id":"a","text":"10-20 minutes of removal from the freezer","correct":true},{"id":"b","text":"24 hours of removal from the freezer","correct":false},{"id":"c","text":"1 week of removal from the freezer","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'The AN470 / MS20470 rivet head style, the standard protruding head used for repair, is called the:',
     '[{"id":"a","text":"Countersunk (flush) head","correct":false},{"id":"b","text":"Universal head","correct":true},{"id":"c","text":"Brazier head","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'When a solid rivet is properly driven, the formed (shop) head dimensions should be approximately:',
     '[{"id":"a","text":"Diameter 1.5D, height 0.5D","correct":true},{"id":"b","text":"Diameter 2D, height 1D","correct":false},{"id":"c","text":"Diameter 1D, height 1.5D","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'The minimum edge distance for a rivet hole (centre of hole to edge of sheet) is:',
     '[{"id":"a","text":"1D","correct":false},{"id":"b","text":"2D","correct":true},{"id":"c","text":"4D","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'Which type of blind rivet is structural and suitable for use on a repair?',
     '[{"id":"a","text":"Self-plugging friction lock (e.g. MS20600)","correct":false},{"id":"b","text":"Pull-thru rivet","correct":false},{"id":"c","text":"Mechanical lock, self-plugging (Cherrylock, CherryMax, Huck)","correct":true}]',
     '{"B1","B2"}'),

    (s5_id, 'The Hi-Shear (pin) rivet, compared with a solid rivet of equal diameter, offers approximately:',
     '[{"id":"a","text":"The same shear strength at about 40% of the weight, and about three times the strength of a solid rivet","correct":true},{"id":"b","text":"Half the shear strength but double the weight","correct":false},{"id":"c","text":"Equal tensile strength, but it must never be used in shear","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'The purpose of torque, correctly applied to a fastener, is to:',
     '[{"id":"a","text":"Produce the correct bolt tension (preload), which holds the joint together and stops fatigue","correct":true},{"id":"b","text":"Simply make the fastener as tight as physically possible","correct":false},{"id":"c","text":"Prevent the fastener from ever being removed again","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'If a torque wrench is fitted with an extension that changes its effective length, the wrench setting must be recalculated using:',
     '[{"id":"a","text":"Wrench setting = Desired torque x L / (L + A)","correct":true},{"id":"b","text":"Wrench setting = Desired torque x (L + A) / L","correct":false},{"id":"c","text":"Wrench setting = Desired torque / (L x A)","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'A Helicoil insert is used to:',
     '[{"id":"a","text":"Restore a damaged internal thread to its original size with a harder, more wear-resistant thread","correct":true},{"id":"b","text":"Permanently increase the diameter of a bolt hole","correct":false},{"id":"c","text":"Replace a damaged external thread on a bolt shank","correct":false}]',
     '{"B1","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M06.6 Pipes and Unions (14 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s6_id, 'Rigid tube size is specified as:',
     '[{"id":"a","text":"Outside diameter (OD) in 16ths of an inch plus wall thickness","correct":true},{"id":"b","text":"Inside diameter (ID) in 16ths of an inch plus wall thickness","correct":false},{"id":"c","text":"Outside diameter (OD) in 32nds of an inch only","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'Titanium 3AL-2.5V tubing used on modern high pressure hydraulic systems must be joined by:',
     '[{"id":"a","text":"A conventional 37 degree flare","correct":false},{"id":"b","text":"Swaged or special fittings — it must not be flared","correct":true},{"id":"c","text":"A 45 degree AC-type flare","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'Copper tubing is considered obsolete for aircraft fluid lines mainly because:',
     '[{"id":"a","text":"It is too expensive compared with aluminium","correct":false},{"id":"b","text":"It work hardens and cracks with vibration","correct":true},{"id":"c","text":"It cannot be bent to shape","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'Corrosion resistant steel tubing (annealed 304, 321, 347) is typically used for:',
     '[{"id":"a","text":"Low pressure instrument lines only","correct":false},{"id":"b","text":"High pressure hydraulic lines, brake lines and landing gear, up to 3,000+ psi","correct":true},{"id":"c","text":"Ventilating ducts and drains only","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'The AN flared tube fitting uses a flare angle of:',
     '[{"id":"a","text":"37 degrees","correct":true},{"id":"b","text":"45 degrees","correct":false},{"id":"c","text":"60 degrees","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'AC (Air Corps) and automotive fittings both use a flare angle of 45 degrees. In relation to AN fittings, they are:',
     '[{"id":"a","text":"Fully interchangeable with AN fittings","correct":false},{"id":"b","text":"Not interchangeable with AN fittings — never mix them","correct":true},{"id":"c","text":"Interchangeable only on low pressure lines","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'A double flare is used on soft aluminium tubing of 3/8 in OD and under because it is:',
     '[{"id":"a","text":"Faster to produce than a single flare","correct":false},{"id":"b","text":"Stronger and more resistant to cracking than a single flare","correct":true},{"id":"c","text":"Required by all AN fittings regardless of tube size","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'When installing a flareless (bite-type) fitting, after finger-tight the nut is typically tightened a further:',
     '[{"id":"a","text":"1/6 to 1/3 turn, torqued by turns rather than by feel","correct":true},{"id":"b","text":"Full 2 turns","correct":false},{"id":"c","text":"1/20 turn, using feel only","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'Cryofit fittings are installed by:',
     '[{"id":"a","text":"Heating the sleeve until it expands and slips over the tube","correct":false},{"id":"b","text":"Shrinking a shape-memory alloy sleeve in liquid nitrogen, then slipping it on and allowing it to warm and shrink tight","correct":true},{"id":"c","text":"Swaging a conventional aluminium ferrule with a hand tool","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'The three layers of construction of a flexible hose, from inside to outside, are:',
     '[{"id":"a","text":"Inner tube (liner), reinforcement, outer cover","correct":true},{"id":"b","text":"Outer cover, reinforcement, inner tube (liner)","correct":false},{"id":"c","text":"Reinforcement, inner tube (liner), outer cover","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'A high pressure flexible hose (3,000 psi and above) used in hydraulic systems is reinforced with:',
     '[{"id":"a","text":"One fabric braid","correct":false},{"id":"b","text":"One wire braid plus fabric","correct":false},{"id":"c","text":"Two or more wire braids","correct":true}]',
     '{"B1","B2"}'),

    (s6_id, 'Flexible hose size is quoted by:',
     '[{"id":"a","text":"Inside diameter in 16ths of an inch","correct":true},{"id":"b","text":"Outside diameter in 16ths of an inch","correct":false},{"id":"c","text":"Wall thickness in 32nds of an inch","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'If the lay line printed along a flexible hose spirals after installation, this indicates:',
     '[{"id":"a","text":"The hose has been twisted and will fail early / try to unscrew its own fitting","correct":true},{"id":"b","text":"Normal appearance for a correctly fitted hose","correct":false},{"id":"c","text":"The hose is rated for Skydrol use","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'The recommended slack to leave in the length of a flexible hose on installation is:',
     '[{"id":"a","text":"5-8% of its length","correct":true},{"id":"b","text":"20-25% of its length","correct":false},{"id":"c","text":"No slack at all — the hose should be installed taut","correct":false}]',
     '{"B1","B2"}');

END $$;
