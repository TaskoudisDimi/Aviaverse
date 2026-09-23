-- Module 13: Aircraft Aerodynamic Structures (B2) — Landing Gear
-- Source: EASA Part-66 Module 13 official textbook (IKAROS Aviation Training Centre chapter "13.16 - Landing Gear")
-- Note: this module is B2-ONLY.

DO $$
DECLARE
    m13_id INT;
    s1_id  INT;
BEGIN
    SELECT id INTO m13_id FROM easa_modules WHERE code = 'M13';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M13.16') THEN
        RAISE NOTICE 'M13.16 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 13.16: Landing Gear
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m13_id, 'M13.16', 'Landing Gear',
        $cnt$
# Landing Gear

## Introduction

Landing gears have two main functions:

- **Supporting the weight** of the stationary aircraft on the ground
- **Absorbing the loads** during touchdown, the landing run and taxiing

Landing gear is divided into two main categories: **fixed (non-retractable)** or **fully retractable**.

Early aircraft had fixed landing gear, which produced a large amount of parasitic drag in flight. Since **drag increases at the square of forward speed**, as aircraft began to fly faster the resulting amount of drag became prohibitive. In the short term this was resolved by installing streamlined fairings over the wheels, but it soon became clear that drag could be almost completely eliminated if the landing gear were retracted after take-off and stowed out of the air-stream.

## General Arrangement

Early landing gear designs consisted of two main legs set just in front of the centre of gravity (C of G) of the aircraft and a small tailwheel at the rear of the fuselage (**tailwheel undercarriage**). Placing the C of G just aft of the main gear ensured the aircraft quickly attained flying attitude on take-off, and the inclined fuselage gave ample propeller-to-ground clearance for the propeller-driven aircraft of the time.

The main disadvantage of the tailwheel configuration was the risk that the aircraft would **"nose over"** when heavy braking was applied, together with poor crew vision during taxiing and the initial part of the take-off run.

This problem was overcome by the **tricycle configuration**, now used almost exclusively, which places the main landing gear aft of the C of G and a supporting nose gear at the forward end of the fuselage. As aircraft became larger and heavier, landing gear design came to include multi-leg and multi-wheel configurations.

## Construction

All landing gears must be attached to strong points on the fuselage or wing structure so that landing loads can be absorbed and transferred safely to the aircraft structure.

- **Smaller light aircraft**: use a steel leaf or tubular steel spring undercarriage. One end attaches to a strong point on the airframe, the wheel and axle are on the other end; deflection of the spring tube on landing absorbs the loads. A properly conducted landing will not cause undercarriage rebound.
- Another simple method uses **elastic bungee cord** encased in a loose-weave cotton braid, located on support struts; the cord stretches on landing and transfers the loads into the airframe.
- **Larger, more modern aircraft** require heavier, more complex retractable systems. Each landing gear unit is basically a wheeled shock absorber (**oleo**). A forged cylinder body is attached to the airframe on **trunnions**, allowing it to pivot when raised and lowered.

Key components of a retractable oleo leg:

- **Articulated side stays** — located between the cylinder body and airframe strong points, giving the leg strength and rigidity and allowing it to fold
- **Drag/bracing struts** — absorb the high acceleration loads during take-off and deceleration loads during braking
- **Torque (scissor) link** — a hinged link between the axle yoke and the cylinder body; allows the piston to move freely in and out of the cylinder while preventing the piston/wheel assembly from swivelling
- **Main actuator** — attached to the cylinder body, raises and lowers the gear
- **Downlock actuator** — located on the bracing strut, causes a mechanical lock when the gear is lowered and unlocks the gear before it is raised
- **Hop Damper** — often used with multi-wheel units to align the bogie at the correct angle for landing and to absorb minor shock loads during taxiing; connected between the main landing gear body and the bogie

## Multiple Axles and Wheels

Multi-wheel landing gear allows maximum utilisation of aircraft when operating from different runways. Typical wheel/axle configurations are: **Single**, **Double**, **Tandem** and **Bogie**.

**Advantages:**
- Spread the landing loads over a larger area (footprint)
- Easier to stow, as wheel volume is reduced
- Greater safety — with loads spread over several wheels, a burst tyre is less critical since the remaining wheels accept the extra load

**Disadvantages:**
- More moving parts, requiring more maintenance
- Expensive to produce
- The large footprint increases the turning circle, needed to prevent the tyres from crabbing and increasing wear

## Shock Absorbing

To absorb and dissipate the shock loads of landing, the kinetic energy of impact must be converted into other forms of energy. Most landing gear legs use self-contained hydraulic shock-absorbing struts. There are three main types used on commercial aircraft:

- Oleo-pneumatic without separator
- Oleo-pneumatic with separator
- Liquid Spring

### Oleo-Pneumatic Without Separator

The strut uses compressed gas (normally **nitrogen**) combined with a specific quantity of hydraulic oil. It is essentially an outer cylinder into which an inner hollow piston is inserted. Airborne, the piston fully extends under nitrogen pressure; the lighter nitrogen settles in the upper portion of the cylinder with the heavier oil below. Because there is **no separator** between the oil and gas, some **aeration ("froth")** occurs where the oil and gas mix at the demarcation line.

On landing, the inner piston is forced up into the outer cylinder, reducing internal volume. A tapered metering pin and snubber knob, integral with the piston, are forced into a snubber tube carried by the outer cylinder. Oil is forced through a decreasing orifice area and the nitrogen gas is compressed — this absorbs the landing energy. As the piston re-extends, a flapper valve slams shut, restricting oil flow through a reduced number of holes in the snubber tube, which prevents rapid extension and dampens the recoil energy.

### Oleo-Pneumatic With Separator

The principle is the same as the type without a separator, but a **floating piston** separates the oil chamber from the nitrogen chamber, preventing oil and gas from mixing. This also means the nitrogen chamber need not be positioned at the top of the leg, or limited to a single chamber. This makes shock absorbing more efficient, reduces jolting during taxiing and simplifies servicing.

### Liquid Spring

This type has no gas compartment. It relies on the fact that if a piston is forced into a cylinder completely filled with oil under static pressure, energy absorption takes place through oil compression. Oil is generally considered incompressible, but at normal hydraulic system pressures (typically **3,000 psi**) any compression is negligible; in liquid spring shock absorbers, pressures in excess of **60,000 psi** are often generated, and at these pressures the oil does compress. During touchdown the piston is forced into the cylinder, compressing the oil as volume progressively reduces ("**jack ram displacement**"); a restrictor valve absorbs the recoil as in the other two types.

## Servicing — Filling and Charging

The strut must be serviced with the correct quantity of oil (completely free of air) and the nitrogen chamber charged to the correct value to maintain the correct oil/gas ratio. When correctly filled and charged, the strut adopts the correct extension on the ground and the risk of the piston "bottoming" against the outer cylinder on touchdown is eliminated. Filling and charging procedures are detailed in the Aircraft Maintenance Manual (AMM) and must be strictly followed.

A general sequence for an oleo-pneumatic without separator strut: position the aircraft on jacks (wheels clear of the ground); release nitrogen pressure via the charging valve; compress the leg fully with a bottle jack; open the bleed valve and pump oil in until clean, air-free oil emerges; close the oil valves; connect a nitrogen rig and inflate to the correct pressure from the AMM; close the charging valve and remove the rig; lower the aircraft off jacks.

- On an oleo-pneumatic **with separator**, an additional procedure is needed before deflating the nitrogen, to ensure the separator is correctly positioned.
- On a **liquid spring** type, procedure is similar for oil filling/bleeding, but there is no nitrogen charging procedure.
- In service, shock strut serviceability can be monitored using a **pressure/extension graph**.

## Extension and Retraction Systems

As aircraft speed increases, once the parasite drag of fixed gear exceeds the induced drag from the weight of a retraction system, it becomes practical to retract the gear. Raising/lowering is carried out hydraulically or pneumatically via a cockpit selector lever, mechanically or electrically linked to a selector valve, which directs fluid to one side or the other of the piston.

The gear is uplocked and downlocked mechanically or hydraulically through uplock boxes and downlock toggle levers. Gear position is sensed by proximity switches or microswitches, transmitted to the cockpit via a control unit. In the case of fluid or electrical failure, a mechanical emergency lowering system is available.

Most modern light aircraft use a self-contained **hydraulic power pack**, containing the fluid reservoir, sight glass, pressure pump, filter, thermal relief valve, pressure relief valve, and ground service/replenishment connections.

### Extension Sequence

Selecting GEAR DOWN energises a micro-switch that powers the hydraulic pump; pressure unlocks the uplocks (which remain open under spring pressure). Movement of the legs breaks the uplock limit switches, showing **red triangles** ("in transit") on the panel. The selector valve opens the down lines and the actuators extend. Once the legs are mechanically locked, excess pressure bleeds back to the reservoir through the low-pressure control valve. When all three wheels are down and locked, proximity switches signal the control unit, which turns off the pump, closes the selector valve lines and shows **green triangles** ("locked down").

### Retraction Sequence

Selecting GEAR UP is the reverse: pressure unlocks the downlock actuators and opens the up lines. Breaking the downlock proximity switches shows red (in transit) triangles. On full retraction the legs mechanically lock the uplocks; the pump switches off and the triangles change from red to black. A **squat switch system** and an electro-mechanical stop on the selector lever prevent the gear from being retracted while the aircraft is on the ground.

## Selector Valve

The selector valve on modern large aircraft is normally operated by electrical solenoids signalled from micro-switches on the selector lever, though some aircraft use mechanical operation. A spool valve moves from neutral to allow hydraulic pressure to one side of the main actuator piston. Normal operation can be overridden in an emergency: the spool valve is moved mechanically by rods, cables and levers to open all lines for free fluid flow, normally inter-linked with the emergency mechanical opening of the uplocks.

## Uplock and Downlock Mechanisms

On retraction, a roller on the landing gear leg engages the **uplock hook**; limit switches sense engagement and turn off hydraulic pressure, so the gear is then held retracted purely mechanically. Normal release is by a hydraulically actuated valve: pressure pushes a plunger against the lock lever, rotating it and allowing the hook to disengage under its own spring tension so the gear can extend.

The **downlock actuator** can be single- or double-direction. A single-direction actuator unlocks the downlock mechanism (upper and lower toggles) prior to retraction, the leg relying on its own extension to provide the over-centre lock; a double-direction actuator both locks the downlock mechanism on extension and unlocks it prior to retraction. Once the gear is fully extended, hydraulic pressure moves the toggle levers to an **over-centre position**, forming a mechanical lock that prevents the leg from collapsing. Once parked, a **red-flagged safety pin** is inserted through alignment holes in the toggle levers to prevent inadvertent collapse or retraction on the ground, and is removed before flight.

## Emergency Landing Gear Operation

If the actuator or hydraulic system fails, the uplocks can be released manually. An emergency lever in the cockpit rotates the hook locks, releasing the legs from the uplock hooks, and also operates a lever on the selector valve that opens all hydraulic lines to return, allowing free flow of fluid through the system. Once the uplocks are released, the landing gear legs extend **under gravity and aerodynamic forces**, possibly assisted by a spring- or gas-operated free-fall assister. Proximity and limit switches continue to operate normally, giving cockpit indication of transit and down-lock.

## Landing Gear Door Sequencing

Bay access doors open and close in relation to gear movement — some are mechanically linked by rods, bellcranks and links; others are hydraulically operated via a sequencing valve, signalled by micro-switches or proximity switches. The sequencing valve can be **door operated** or **gear operated**.

### Door Operated Sequencing System

Pressure is fed first to the door actuator to open the door. Only when the door is **fully open**, abutting and depressing a plunger, does the sequence valve unseat and open a gallery allowing fluid pressure to the main actuator — extending the landing gear. If the door is not fully open, the main actuator remains isolated. On retraction, once the leg is fully retracted it depresses a plunger that opens a gallery to the door actuator, closing the door.

### Gear Operated Sequencing System

The principle is similar, except the plunger (or slide) is operated via a cam and linkage mechanism directly attached to the landing gear leg, ensuring the door starts (or is in the process of) opening as soon as the gear starts to move.

## Safety Bars

On some aircraft with hydraulically sequenced doors, if the hydraulic system fails, the landing gear legs push against **safety bars** fitted to the doors, forcibly opening them without damage; once operated the doors remain open.

## Indications and Warning

All modern aircraft with retractable gear indicate on the flight deck whether the legs are locked down, in transit, or locked up, usually via a dedicated set of coloured indicator lights near the selector lever (one set per leg). Under the modern **"dark cockpit" philosophy**, all indicator lights are extinguished when the legs are properly locked up; **red** lights indicate "in transit" (not locked up and not locked down); **green** lights illuminate when a leg is down and locked.

A red light typically illuminates whenever: the lever is not down and the gear is not up; the lever is down and the gear is not down and locked; or an engine throttle is in the idle range and any gear is not down and locked. A green light illuminates whenever the gear is down and locked.

On some aircraft, red transit lights are replaced by a **"nips"** light in the selector lever, with separate amber warning lights indicating a fault (e.g. a leg failing to reach its selected position within a time limit). Where visual confirmation from the cabin is not possible (typically for the nose gear), the locked-down indication may be duplicated as an additional "confidence light" in case of bulb failure.

Micro-switches or proximity sensors on each leg relay position to the flight deck indicators, changing output voltage whenever the uplock or downlock mechanisms are made or broken. Other indication methods include mechanical indicators outside the aircraft (e.g. painted lines on toggle levers that align when down and locked), and **pop-up indicators** that stand proud on the upper wing surface, operated by a spring-loaded plunger and cable linkage from the toggle levers, retracting under spring pressure when the gear is retracted.

A warning system connected to the centralised warning panel (lights and audio) may activate when the aircraft descends to a certain height (via the radio altimeter) or when the landing configuration is incorrect (e.g. power levers or flaps set incorrectly), to prevent landing with the gear retracted.

The gear selector lever may also have an **electro-mechanical safety interlock**: with all legs compressed, a safety solenoid is de-energised, moving a latch pin under the selector lever that prevents it from operating. Once each leg is fully extended, a limit switch signal energises the safety solenoid, withdrawing the latch pin and allowing gear-up selection.

## Safety Switches

**Proximity switches** on each leg indicate downlocked or in-transit status: the switch is made when the target on the leg aligns with the switch probe (downlocked); when out of alignment, the switch is broken (in transit). The signals are processed by an electronic control unit or computer, illuminating a green triangle when locked down and a red triangle when in transit.

**Limit micro-switches** on the uplocks sense when the gear is locked up (changing red triangles to black), and limit switches on the oleos sense when the leg is fully extended (allowing retraction). Together, the proximity and limit switches form part of the **weight-on-wheels / weight-off-wheels squat switch system**, preventing inadvertent retraction on the ground: retraction is normally only permitted when all three legs are weight-off-wheels, fully extended, and the downlocks have been unlocked.

## Wheels

The wheels provide suspension and adhesion between the aircraft and the ground. Early wheels/tyres were bicycle-type with spoke rims. Most light aircraft use fixed-flange, one-piece forged or cast wheels. Modern tyres are more rigid due to load-bearing requirements, requiring **two-piece wheel construction** — either **removable rim** (with an inner tube) or **split wheel** (tubeless, requiring a perfect seal via an O-ring between the mating halves). Wheels are usually made from aluminium or magnesium alloys, cast or forged.

The inboard wheel section has key ways that drive the brake discs with the wheel. Larger aircraft wheels have one or more **fusible plugs**, with a centre hole filled with a low-melting-point alloy; when the tyre overheats past a temperature limit, the alloy melts and allows the tyre to safely deflate.

### Types of Wheels

There are three basic types of aircraft wheel:

- **Well-based** — limited to smaller light aircraft, similar to a typical car wheel
- **Divided (or Split)** — used on most modern commercial airliners; two half assemblies, each with its own tapered bearing, bolted together with a sealing ring between the halves for tubeless tyres. The inner half carries the brake rotor drive blocks; the outer half may carry fusible plugs
- **Loose and Detachable Flange** — a main hub carries both bearings, brake rotor drive blocks and fusible plugs; one of the two wheel flanges can be removed to facilitate tyre replacement, retained by a locking ring (loose flange) or nuts and bolts (detachable flange), with a sealing ring for tubeless tyres

## Tyres

Ribbed tread (straight grooves running around the tyre circumference) proved more suitable for hard-surface runways than the early diamond tread pattern (which suited wet grass), and is used on almost all modern aircraft tyres.

### Tyre Inflation and Deflation

Tyres are inflated with **nitrogen** from a ground cart; the required pressure is laid down in the AMM, and a tyre inflation box regulates charge rate and pressure. A deflation tool releases pressure; any ice must thaw before the valve core is removed.

### Tyre Construction

- **The Bead** — gives the tyre strength and stiffness for a firm mounting on the wheel; made of bundles of high-strength carbon steel wire (two or three bundles per side), enclosed in rubberised fabric to insulate the carcass plies from heat
- **The Carcass** — layers of rubberised fabric cut in strips with threads running at about **45 degrees** to the strip length, extending across the tyre and around the bead. Each ply is laid so that threads cross the adjacent ply at about **90 degrees** — this is known as **bias ply** construction. Cords were originally cotton, then nylon, and now **aramid fibres (Kevlar)**, which are stronger than nylon, polyester or fibreglass, and even stronger pound-for-pound than steel
- **Chafing strips** — rubberised fabric wrapped around the edges of the carcass plies and the bead area, providing a chafe-resistant surface against the wheel bead seat
- **The undertread** — a layer of compound rubber between the plies and tread rubber, providing adhesion; further fabric plies above it strengthen the tread and resist centrifugal forces during high-speed rotation
- **The inner liner** — a thin rubber coating over the inside plies; on tubeless tyres, a less permeable compound that seals the tyre; on tubed tyres, a smooth liner to prevent chafing
- **The Tread** — the thick outer rubber layer with moulded grooves for optimum traction

### Tyre Wear Assessment

Modern aircraft tyres have circumferential grooves, primarily to displace water and help prevent aquaplaning, which can also be used to establish tyre wear: if any groove is worn to less than **2 mm** depth for more than **25%** of the tread circumference, the tyre must be replaced.

Other wear-assessment methods:

- **Tie Bars** — small transverse rubber bars moulded at intervals in the circumferential grooves, typically set at 2 mm depth; the tyre is worn to its limit when worn to the top of the tie bar
- **Wear Indicator Grooves** — dedicated grooves, typically about 2 mm shallower than the water-displacing grooves; the limit is reached when worn to the bottom of the indicator groove anywhere on the circumference
- **Sipes** — an axial slit in the tread rubber at zigzag tread corners (not extending into the tread depth); the limit is reached when the tyre is worn to the bottom of the sipe

### Tyre Damage

Damage near the bead is rarely tolerated; cuts in the casing plies must be carefully assessed against the manufacturer's requirements. If the cords are exposed due to any damage, including splits or crazing, the tyre is classed as unserviceable.

### Leak Holes (Awl Holes) and Vent Holes

- **Leak Holes (Awl Holes)** — pierced completely through the sidewall during manufacture, to let trapped air escape between the tube and tyre on tyre/tube assemblies; indicated by 6 mm diameter spots of litho ink, usually **grey**
- **Vent Holes** — on tubeless tyres, allow trapped air between casing layers to escape to atmosphere; they do not penetrate right through the sidewall; indicated by 6 mm diameter spots of litho ink, usually **green**

### Balance Marks

A red spot (sometimes triangular) on either side of the tyre indicates its lightest point. On assembly, the red spot should align with the inflation valve on a tubeless assembly, or with a red line (heavy point) on the tube for a tubed assembly (or the tube's inflation valve if there is no red line).

### Electrically Conducting Tyres

Some tyres are designed to conduct electrical charges to earth as the aircraft touches down, identified by the word **CONDUCTIVE** or the letters **ECTA** (electrically conducting tyre assembly) on the sidewall.

### Aquaplaning

Aquaplaning occurs on wet runways when a wave of water builds up in front of a spinning wheel, potentially lifting the tyre off the runway to float on a thin layer of water, causing complete loss of braking efficiency. The approximate aquaplaning speed formula is:

**Aquaplaning Speed (kt) = 9 (approx.) × √(Tyre Pressure)**

This speed is placarded for the crew so they can quickly pass through it on landing. If tyre pressures are incorrect, the placarded speed becomes useless and aquaplaning will occur at a different speed — maintaining correct tyre pressure is therefore important.

## Brakes

Aircraft brake systems convert the kinetic energy of aircraft motion into heat energy, generated by friction between the brake linings and the brake drum or disc. There are two types:

- **Energising (servo) brakes** — use friction between rotating and stationary parts to produce a wedging action that uses the aircraft's own momentum to increase braking force, reducing the pilot's effort. Used on some smaller light aircraft, with a single servo action operating only with forward motion; linings mount on a torque plate free to move against the rotating drum. When hydraulic pressure is released, a retracting spring pulls the linings from the drum.
- **Non-energising brakes** — the most common type; actuated by hydraulic pressure, with braking action depending on applied pressure. The main types are **expander tube**, **single disc** and **multiple disc** brakes.

### Expander Tube Brakes

Rarely used on modern aircraft. Hydraulic fluid expands a heavy neoprene tube located on a torque flange's circumference, pushing brake block linings against the brake drum. Stainless steel heat shields between the lining blocks protect the expander tube from heat. Return springs collapse the tube and force fluid back to the reservoir when the pedal is released.

### Single Disc Brakes

Most common on light aircraft; hydraulic pressure squeezes the rotating disc between brake linings in a caliper. Two types: **floating disc, fixed caliper** (disc keyed into the wheel, free to move in and out) and **fixed disc, floating caliper** (disc rigidly attached to the wheel, caliper moves on anchor bolts). Some have automatic adjusters with wear indicators: an adjuster pin's protrusion indicates lining wear, and linings are replaced when the pin is flush with the housing.

### Multi Disc Brakes

Standard on most modern high-performance aircraft. A **segmented rotor**, multiple-disc design with (typically) three rotating discs keyed to the wheel; the rotors are segmented to allow for cooling and expansion at the high temperatures generated during braking. Stator plates (brake-lining discs) between the rotors are keyed to the axle shaft, with linings riveted to each side. Automatic adjusting pins work as with single disc brakes. Most large jet aircraft use a number of separate brake cylinders (rather than one annular cylinder), each supplied from a separate hydraulic system so that full braking remains available even if one system fails. Some aircraft use **carbon fibre brake discs** — lighter and able to function at higher temperatures, though expensive, so generally used only on transport aircraft.

### Brake Systems and Brake Control Valve

Light aircraft generate hydraulic pressure from the pilot's rudder pedals via a master cylinder (foot motor) to a slave cylinder; larger aircraft use the aircraft's main hydraulic systems. Pressure applied to the brakes must be proportional to pedal force, allowing the pilot to hold brakes partially applied without a pressure build-up — achieved via a **brake control valve** (metering valve). Rudder pedals connect to the valve hydraulically (via a master cylinder/foot motor), or by rods or cables. Hydraulic systems operate simultaneously, typically with a different system feeding inboard versus outboard wheels, so braking is maintained to at least one set of wheels if one system fails.

In the brake control valve, the centre slide moves as the pilot applies the brakes, opening the pressure line and closing the return line; pressure also builds in a metering chamber until it equals the pedal input pressure, at which point the slide returns to a central position, blocking both lines and holding brake pressure constant. Releasing the pedals moves the slide to open the return line, dissipating pressure.

## Anti-Skid Systems

The anti-skid system provides maximum effective braking for any runway condition without skidding, often used with an autobrake system. It automatically overrides or modifies the metered brake pressure from the flight deck (or autobrake commands), maintaining optimum wheel braking regardless of weather (ice, rain, crosswind). Maximum braking efficiency occurs when the wheels are at maximum deceleration just before an impending skid. The system continuously modulates hydraulic pressure at each brake unit in response to actual wheel speed, preventing blown tyres, flat spots or aquaplaning caused by a locked wheel. If deceleration exceeds limits (an approaching skid), a corrective signal momentarily reduces brake pressure at that wheel until wheel speed increases again, repeating as required. Anti-skid systems can be **electronic** (most modern systems) or **mechanical** (older aircraft).

### Electronic Anti-Skid System

Components: a **wheel speed transducer** in each main landing gear axle; an **electronic anti-skid control unit** (with BITE for continuous self-test and fault warning); an **anti-skid control valve** for each main wheel; and a **control switch and failure warning indicator** on the flight deck.

- **Wheel speed transducer** — a speed-sensing generator-type device sending an output voltage directly proportional to wheel rotation. The control unit compares this to a reference voltage scheduled to the maximum deceleration rate; if the transducer voltage exceeds the reference, an error signal reduces hydraulic pressure at that brake unit until the voltages agree again.
- **Anti-skid control valve** — a two-stage electro-hydraulic servo valve. The first stage is a torque-motor-operated flapper valve; the second stage is a spring-biased spool valve. With no control signal, maximum braking is possible; an increasing signal moves the flapper toward the pressure nozzle, reducing first-stage pressure, which moves the spool valve to connect the brake line to return, reducing brake pressure. As the wheel spins up again, current reduces and pressure is re-applied. This cycle can repeat at up to **50 cycles per second**.
- **Anti-skid control unit** — contains circuits for full anti-skid control, BITE and monitoring. On a typical four-mainwheel aircraft (e.g. Boeing 737), circuits are arranged into two channels for inboard and outboard wheel pairs. The system has three modes: **Touch-down protection** (prevents landing with brakes on — a full brake release/dump signal is sent while airborne, removed on touchdown), **Skid-control** (maximum braking efficiency once wheels spin up to a pre-determined speed — e.g. 30 kt for the Fokker 50 and 70 kt for the Boeing 737), and **Locked-wheel protection** (compares inboard/outboard wheel pair speeds; if one slows to a pre-determined difference — e.g. 30% for the Fokker 50, 40% for the Boeing 737 — a full dump signal is sent to the slower wheel; this mode switches off below about 15 kt, though skid-control remains active).
- **Control switch and warning system** — usually on the front panel, often combined with the autobrake selector; a simple on/off switch with a malfunction warning light, allowing the anti-skid control unit to be interrogated to pinpoint a faulty transducer, valve, or the control unit itself.

### Mechanical Anti-Skid System

An older system that modulates brake pressure mechanically via a single self-contained device per wheel, often called a "**maxaret**" (maximum arresting) unit. It detects rapid wheel deceleration and momentarily releases brake pressure. It may be mounted externally on the brake unit torque plate, driven by a small rubber-tyred wheel in contact with the mainwheel, or mounted inside the axle and driven via a splined drive shaft. Both types incorporate an internally mounted heavy **flywheel** sensitive to angular deceleration: under severe braking, the flywheel's inertia lets it continue rotating at the higher speed, advancing through an arc until it contacts limit stops. This mechanically shifts two hydraulic metering valves from "pressure to brakes" to "no pressure in and brakes to return." With pressure removed, the wheel regains speed and the flywheel returns (assisted by a return spring), re-applying the brakes; the cycle continues until deceleration returns to normal limits.

## Autobraking

Some modern aircraft have autobraking systems: a selector switch allows the pilot to select a deceleration rate, automatically controlled after landing down to a complete stop, freeing the aircrew for other tasks. The autobrake system uses the normal anti-skid and brake units, but hydraulic pressure is sent via solenoid valves that allow a pre-determined amount of pressure through the anti-skid valves to the brake units.

- **Selector Panel** — a solenoid-latched switch holds a selected position only if arming conditions are met; otherwise it automatically returns to DISARM, with a warning illuminated locally and on the centralised warning panel.
- **Auto-Brake Control Unit** — processes the selector signal and commands the solenoid valve. A time delay and electrical ramp prevent brake snatch/jerking; the time delay ensures the aircraft is firmly on the ground before activation. Terminology: **On Ramp** (gradual build-up of brake pressure to the selected deceleration rate), **Off Ramp** (gradual decrease to zero at the end of the landing run or on cancellation), **Drop Out** (instantaneous pressure release to zero, for a go-around).
- **Auto Brake Solenoid Valve** — electrically controlled hydraulic valves, fitted just upstream of the anti-skid valves, that allow pressure to the brake units at a setting proportional to the selected deceleration rate; they shut immediately on Drop Out. A solenoid servo valve modulates brake pressure to regulate the deceleration rate; a pressure switch connected to the DISARM warning light monitors zero pressure when armed.
- **System Operation** — once weight-on-wheels, and after wheels reach a certain speed or a pre-determined time delay, brakes apply "up the ramp" to the selected deceleration rate, then modulate to hold it; autobrakes switch off once the aircraft stops or slows below a certain speed, enabling taxi.
- **Auto Brake Termination** — can be cancelled by the pilot moving the selector to disarm/off, or by manual braking. Immediate **Drop Out** occurs if the thrust levers are advanced from the idle gate, or the speed brake lever is moved to stow the speed brakes (e.g. for a go-around).

## Steering

Nose wheel steering systems improve tyre life (less scrub), reduce brake wear, and save fuel and engine life since brakes and engine thrust are no longer needed to turn the aircraft. Most systems use servo-jack-operated scissor links attached to a collar on the landing gear leg, driven by servo jacks that rotate the leg via the scissor links. Steering inputs come from a cockpit tiller (and can also come from the rudder pedals). Apart from mechanical steering, there are three basic methods:

- **Single Servo Jack** — used on smaller light aircraft; both ends of the jack ram attach to the landing gear leg, and fluid moves the jack body along the ram, operating a cam and link assembly that rotates the wheel. The shock absorber is splined onto the steering shaft, so its action is unaffected.
- **Double Servo Jack** — used on larger aircraft; two jacks are fixed to a steering collar, free to rotate around the landing gear leg and attached to the upper scissor link, rotating the wheel/axle via the scissor link when actuated.
- **Rack and Pinion** — hydraulically operated racks rotate a pinion which rotates the wheel and axle; a mechanical linkage from the cockpit tiller operates a servo valve in a hydraulic metering valve, directing fluid to move the rack piston.

### Steering Mechanisms and Nose Wheel Self-Centring

On some small aircraft, the nose wheel is steered by direct linkage from the rudder pedals, or via a steering bar against a steering arm on the landing gear leg (ineffective once the wheel is stowed). Nose or tail wheels on light aircraft may be **steerable** or **castoring** — a castoring nose wheel aircraft is steered by independent use of brakes and rudder; some light aircraft have limited tail wheel steering interlinked with the rudder pedals, with the tail wheel breaking out (and later re-centralising) if the turning circle is too small.

Inputs to hydraulic control valves are made via a mechanical system of cables, bellcranks, levers and gearboxes from the tiller and rudder pedals, with a follow-up action that neutralises nose wheel movement once the desired turn rate is achieved. Rudder pedal steering input is normally restricted to a small degree of movement, used on take-off/landing and isolated when airborne.

It is important that a steerable nose wheel is centred when retracting, so that it fits into the wheel well without damage. This can be achieved by a **centring cam** inside the oleo strut: when the strut compresses, the piston cam disengages from the cylinder cam receptacle, allowing the wheel to be steered; on take-off, as the strut extends, the piston cam is forced into the cylinder receptacle, holding the wheel centred for stowing. Double servo jack systems can instead centralise the wheel by supplying pressure to a centralising jack, normally initiated by the weight-on-wheels micro-switches as the aircraft takes off.
        $cnt$,
        20
    ) RETURNING id INTO s1_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M13.16 Landing Gear (18 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s1_id, 'What are the two main functions of an aircraft landing gear?',
     '[{"id":"a","text":"Supporting the weight of the stationary aircraft on the ground, and absorbing the loads during touchdown, landing run and taxiing","correct":true},{"id":"b","text":"Providing lift at low speed and reducing engine vibration","correct":false},{"id":"c","text":"Cooling the brakes and generating electrical power","correct":false}]',
     '{"B2"}'),

    (s1_id, 'Why did early fixed landing gear become impractical as aircraft speeds increased?',
     '[{"id":"a","text":"Because parasitic drag increases at the square of forward speed, making the drag penalty prohibitive","correct":true},{"id":"b","text":"Because fixed gear could not support increasing aircraft weight","correct":false},{"id":"c","text":"Because fixed gear caused excessive tyre wear at high taxi speeds only","correct":false}]',
     '{"B2"}'),

    (s1_id, 'What problem with the tailwheel undercarriage configuration led to the almost universal adoption of the tricycle configuration?',
     '[{"id":"a","text":"The risk of the aircraft nosing over under heavy braking, and poor crew vision while taxiing and during the initial take-off run","correct":true},{"id":"b","text":"Excessive fuel consumption during ground operations","correct":false},{"id":"c","text":"Inability to fit retractable landing gear to a tailwheel arrangement","correct":false}]',
     '{"B2"}'),

    (s1_id, 'What is the main disadvantage associated with multi-wheel landing gear configurations?',
     '[{"id":"a","text":"The large footprint increases the turning circle needed to prevent the tyres from crabbing and increasing wear","correct":true},{"id":"b","text":"They reduce the load-carrying capacity of the aircraft","correct":false},{"id":"c","text":"They cannot be retracted into the aircraft structure","correct":false}]',
     '{"B2"}'),

    (s1_id, 'Why does an oleo-pneumatic shock strut WITHOUT a separator exhibit some aeration ("froth") of the oil?',
     '[{"id":"a","text":"Because there is no separator between the oil and the nitrogen gas, so the two mix together at the demarcation line","correct":true},{"id":"b","text":"Because the oil is deliberately mixed with air during servicing to reduce its viscosity","correct":false},{"id":"c","text":"Because the metering pin injects air into the oil during compression","correct":false}]',
     '{"B2"}'),

    (s1_id, 'In a door-operated landing gear door sequencing system, under what condition is hydraulic pressure allowed to reach the main gear actuator during extension?',
     '[{"id":"a","text":"Only after the aircraft has reduced below a set airspeed","correct":false},{"id":"b","text":"Only when the door is fully open and has depressed the sequence valve plunger","correct":true},{"id":"c","text":"Only when the pilot manually overrides the sequencing valve","correct":false}]',
     '{"B2"}'),

    (s1_id, 'Under the "dark cockpit" philosophy for landing gear position indication, what do illuminated red and green indicator lights normally signify?',
     '[{"id":"a","text":"Red = system fault; green = system healthy, regardless of gear position","correct":false},{"id":"b","text":"Red = gear in transit (not locked up and not locked down); green = gear down and locked; no lights = gear properly locked up","correct":true},{"id":"c","text":"Red = gear locked up; green = gear locked down; both extinguished only during retraction","correct":false}]',
     '{"B2"}'),

    (s1_id, 'What are the three basic types of aircraft wheel construction described for landing gear?',
     '[{"id":"a","text":"Well-based, Divided (or Split), and Loose and Detachable Flange","correct":true},{"id":"b","text":"Spoked, Solid, and Pneumatic","correct":false},{"id":"c","text":"Fixed Flange, Cast, and Forged","correct":false}]',
     '{"B2"}'),

    (s1_id, 'What is the purpose of a fusible plug fitted to a larger aircraft wheel?',
     '[{"id":"a","text":"It contains a low melting point alloy that melts if the tyre overheats, allowing the tyre to safely deflate","correct":true},{"id":"b","text":"It provides a drain point for water that collects inside the wheel rim","correct":false},{"id":"c","text":"It electrically bonds the wheel to the axle for static discharge","correct":false}]',
     '{"B2"}'),

    (s1_id, 'In the bias-ply construction of an aircraft tyre carcass, at what approximate angle do the cords of each ply run relative to the length of the fabric strip, and how are adjacent plies arranged?',
     '[{"id":"a","text":"Cords run at about 45 degrees to the strip length, with each ply crossing the adjacent ply at about 90 degrees","correct":true},{"id":"b","text":"Cords run parallel (0 degrees) to the strip length, with all plies aligned in the same direction","correct":false},{"id":"c","text":"Cords run at 90 degrees to the strip length, with adjacent plies crossing at 45 degrees","correct":false}]',
     '{"B2"}'),

    (s1_id, 'Using the circumferential water-displacing grooves as a tyre wear assessment method, when must the tyre be replaced?',
     '[{"id":"a","text":"When any groove is worn to less than 2 mm depth for more than 25% of the tread circumference","correct":true},{"id":"b","text":"When any groove is worn to less than 5 mm depth anywhere on the tyre","correct":false},{"id":"c","text":"When the tread has lost more than 50% of its original weight","correct":false}]',
     '{"B2"}'),

    (s1_id, 'How are Leak Holes (Awl Holes) and Vent Holes distinguished on an aircraft tyre sidewall?',
     '[{"id":"a","text":"Leak holes pierce completely through the sidewall (for tube-type tyres) and are usually marked grey; vent holes do not penetrate fully through (for tubeless tyres) and are usually marked green","correct":true},{"id":"b","text":"Leak holes are only found on tubeless tyres and marked red; vent holes are only found on tubed tyres and marked blue","correct":false},{"id":"c","text":"There is no functional difference; the colour simply indicates the tyre manufacturer","correct":false}]',
     '{"B2"}'),

    (s1_id, 'According to the approximate aquaplaning speed formula given, aquaplaning speed in knots is calculated as:',
     '[{"id":"a","text":"9 (approx.) multiplied by the square root of the tyre pressure","correct":true},{"id":"b","text":"The tyre pressure divided by 9","correct":false},{"id":"c","text":"9 (approx.) multiplied by the tyre pressure squared","correct":false}]',
     '{"B2"}'),

    (s1_id, 'What is the fundamental difference between energising (servo) brakes and non-energising brakes?',
     '[{"id":"a","text":"Energising brakes use the aircraft''s own momentum to create a wedging action that increases braking force, while non-energising brakes do not use this wedging action, and braking depends only on applied hydraulic pressure","correct":true},{"id":"b","text":"Energising brakes are only fitted to large jet aircraft, while non-energising brakes are only fitted to light aircraft","correct":false},{"id":"c","text":"Energising brakes use electrical actuation, while non-energising brakes are purely mechanical","correct":false}]',
     '{"B2"}'),

    (s1_id, 'In an electronic anti-skid system, how does the wheel speed transducer signal contribute to skid protection?',
     '[{"id":"a","text":"Its output voltage, proportional to wheel rotation, is compared to a reference voltage scheduled to the maximum deceleration rate; if it exceeds the reference, an error signal reduces brake pressure at that wheel","correct":true},{"id":"b","text":"It measures tyre pressure directly and shuts off braking if pressure falls too low","correct":false},{"id":"c","text":"It sends a fixed signal that only activates the anti-skid system below 15 knots","correct":false}]',
     '{"B2"}'),

    (s1_id, 'What are the three modes of operation of a typical electronic anti-skid control unit?',
     '[{"id":"a","text":"Touch-down protection, skid-control, and locked-wheel protection","correct":true},{"id":"b","text":"Taxi mode, take-off mode, and landing mode","correct":false},{"id":"c","text":"Manual, automatic, and emergency mode","correct":false}]',
     '{"B2"}'),

    (s1_id, 'What autobrake terminology describes the gradual build-up of brake pressure to the amount required for the selected deceleration rate?',
     '[{"id":"a","text":"Drop Out","correct":false},{"id":"b","text":"On Ramp","correct":true},{"id":"c","text":"Off Ramp","correct":false}]',
     '{"B2"}'),

    (s1_id, 'What is the basic difference between a single servo jack and a double servo jack nose wheel steering system?',
     '[{"id":"a","text":"The single servo jack has both ends of the jack ram attached to the landing gear leg with a cam/link rotating the wheel, while the double servo jack uses two jacks fixed to a steering collar attached to the upper scissor link","correct":true},{"id":"b","text":"The single servo jack is hydraulic and the double servo jack is purely electrical","correct":false},{"id":"c","text":"There is no functional difference; the double servo jack is simply a backup for redundancy","correct":false}]',
     '{"B2"}');

END $$;
