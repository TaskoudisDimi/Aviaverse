-- Module 16: Piston Engines (B1) — Engine Construction, Engine Fuel Systems
-- Source: EASA Part-66 Module 16 official textbook (IKAROS Aviation Training Centre, IK01, Issue Oct.2012)

DO $$
DECLARE
    m16_id INT;
    s3_id  INT;
    s4_id  INT;
BEGIN
    SELECT id INTO m16_id FROM easa_modules WHERE code = 'M16';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M16.3') THEN
        RAISE NOTICE 'M16.3/M16.4 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 16.3: Engine Construction
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m16_id, 'M16.3', 'Engine Construction',
        $cnt$
# Engine Construction

## Crankcase

The **crankcase** is the part of the engine that houses the crankshaft and connecting rods. It provides mounting faces for the cylinders or cylinder blocks, the reduction gear, the wheel case and other units, and may be a single casing or built up from several sections depending on engine type.

- Contains the **main bearings** — usually **plain metal bearings** for in-line engines and **roller bearings** for radial engines.
- Engine mountings take the form of **feet** on in-line engines and a **steel ring** on radial engines.
- Provision is made at the lowest point of the crankcase to collect engine oil for recirculation.

The crankcase is subjected to many vibrational and other forces:
- Because the cylinders are fastened to the crankcase, expansion forces tend to pull the cylinder off the crankcase.
- Unbalanced centrifugal and inertia forces of the crankshaft, acting through the main bearings, subject the crankcase to continuously changing **bending moments**.
- The crankcase must have sufficient stiffness to withstand these bending moments without objectionable deflection.
- If the engine has a propeller reduction gear, the front (drive) end is subjected to additional forces.

## Crankshaft

The crankshaft's purpose is to change the **reciprocating motion** of the piston into **rotary motion**.

- Crankshafts are usually **alloy steel forgings**, with journals and crankpins hardened to resist wear.
- Crankpins and journals are usually **hollow** to reduce weight; these hollow spaces are interconnected by drillings in the crank webs to form passages for lubricating oil.
- A shaft is classified by the number of **throws** (cranks) — e.g. a "six-throw" shaft has six crankpins.
- Crankwebs are sometimes extended, the extra metal providing a means of balancing the assembly.
- Suitable drives at each end of the crankshaft transmit torque to the reduction gear and the accessory drives.

**Types:**
- **Single-throw (360°) crankshaft** — the simplest type, used in a single-row radial engine; can be built in one or two pieces; uses two main bearings, one at each end.
- **Double-throw (180°) crankshaft** — used on double-row radial engines, with one throw provided for each row of cylinders.

## Crankshaft Balance

Excessive vibration causes fatigue failure of metal structures and rapid wear of moving parts, and can be caused by an unbalanced crankshaft. Crankshafts are balanced for both **static balance** and **dynamic balance**.

- **Static balance**: the weight of the entire assembly of crankpins, crank cheeks and counterweights is balanced around the axis of rotation. Tested by resting the shaft on two knife edges — if it tends to turn toward one position, it is out of static balance.
- **Dynamic balance**: all forces created by crankshaft rotation and power impulses are balanced within themselves so that little or no vibration is produced in operation. **Dynamic dampers** — pendulums fastened to the crankshaft, free to move in a small arc and incorporated in the counterweight assembly — reduce vibration to a minimum.

## Camshafts and Cam Drums

### Camshaft

The valve mechanism of an **opposed engine** is operated by a camshaft, driven by a gear that mates with a gear on the crankshaft.

- The camshaft **always rotates at one-half of crankshaft speed**.
- As the camshaft revolves, its lobes raise the tappet assembly in the tappet guide, transmitting force through the push rod and rocker arm to open the valve.
- The **profile of the lobe** controls, in terms of crankshaft degrees: the point of valve opening, the rate of valve opening, the period the valve remains open, the rate of valve closing, and the point of valve closing.

### Cam Drum

The valve mechanism of a **radial engine** is operated by one or two **cam drums** (cam rings), depending on the number of cylinder rows.

- In a single-row radial engine, one ring with a **double cam track** is used — one track operates the intake valves, the other the exhaust valves.
- The cam ring is a circular steel piece with lobes on its outer surface; the lobe surfaces and the spaces between them, on which the cam rollers ride, form the **cam track**.
- As the cam ring revolves, its lobes raise the cam roller and tappet, transmitting force through the push rod and rocker arm to open the valve.
- In a single-row radial engine the cam ring is usually located between the propeller reduction gearing and the front of the power section; in a twin-row radial engine a second cam ring, for the rear row, sits between the rear of the power section and the supercharger section.
- The cam ring is mounted concentrically with the crankshaft and driven by it, at reduced speed, through the cam intermediate drive gear assembly.
- Cam rings may have **four or five lobes** on both the intake and exhaust tracks; valve-event timing is set by the spacing of these lobes and the speed/direction the ring is driven relative to the crankshaft.
- The cam ring can be toothed on its **inside or outside** periphery: if the reduction gear meshes with the outside teeth, the cam turns in the **same direction** as the crankshaft; if driven from the inside, it turns in the **opposite direction**.
- On a **nine-cylinder** radial engine, the spacing between cylinders is 40° and the firing order is 1-3-5-7-9-2-4-6-8, giving 80° between firing impulses; to obtain the correct relation between valve operation and firing order, the cam must be driven **opposite** to crankshaft rotation. On a **seven-cylinder** engine using a four-lobe cam, the cam must rotate in the **same direction** as the crankshaft, because the spacing between cylinder firings is greater than the spacing of the cam lobes.
- **Cam ring speed** is one-half — the speed at which the cam would run if it had a single lobe per valve — **divided by the number of lobes** on either cam track.
- In a twin-row, 14-cylinder radial engine (seven cylinders per row), the valve mechanism may use two separate assemblies — effectively two seven-cylinder engines in tandem with firing impulses properly spaced — each driven by its own four-lobe cam ring geared to the crankshaft.

## Sump

The **sump** is where oil returns after completing lubrication of the engine.

- **Wet sump**: a pressed-steel container bolted to the lower part of the engine, in which the oil is stored.
- **Dry sump**: the sump is an integral part of the crankcase, and scavenge pumps return the oil to a separate storage tank.

## Accessory Gearbox

### Accessory Section

The accessory (rear) section is usually of cast construction, in **aluminium alloy** (most widely used) or, to a lesser extent, **magnesium**.

- On some engines it is cast in one piece, with mounting provisions for magnetos, carburettors, fuel/oil/vacuum pumps, starter, generator, etc., arranged for accessibility; other designs use a cast magnesium cover plate for the accessory mounts.
- Mounting arrangements have been increasingly standardised so accessories are interchangeable between different engine makes.
- Increased electrical demands and higher starting torque requirements on powerful engines have increased starter and generator size, requiring more mounting bolts and, in some cases, a strengthened rear section.
- **Accessory drive shafts** run in bronze bushings in the diffuser and rear sections, fitted with gears that provide power take-offs to the accessory mounting pads — allowing gear ratios to be arranged to give the correct drive speed for correct timing/functioning of magnetos, pumps, etc.
- Some drives are duplicated (e.g. the **tachometer drive**) to connect instruments at separate stations.
- The accessory section provides mounting for the carburettor (or master control), fuel injection pumps, engine-driven fuel pump, tachometer generator, engine-analyser synchronising generator, oil filter and oil pressure relief valve.

### Accessory Gear Trains

Gear trains use both **spur-type** and **bevel-type** gears:
- **Spur gears** — generally drive the heavier-loaded accessories, or those requiring the least play/backlash in the gear train.
- **Bevel gears** — permit angular location of short stub shafts leading to the various accessory mounting pads.

## Cylinder and Piston Assemblies

### Cylinders

The **cylinder** is where power is developed: it provides the combustion chamber and houses the piston and connecting rod.

Four major design/construction factors:
- Strong enough to withstand the internal pressures of engine operation.
- Constructed of lightweight metal to keep engine weight down.
- Good heat-conducting properties for efficient cooling.
- Comparatively easy and inexpensive to manufacture, inspect and maintain.

- The **head** is produced singly per cylinder on air-cooled engines, or cast "in-block" (all heads in one block) on liquid-cooled engines.
- Air-cooled cylinder heads are generally **aluminium alloy** — a good heat conductor whose light weight reduces overall engine weight — and are **forged or die-cast** for strength.
- The inner head shape may be **flat, semispherical, or peaked** (house-roof form); the **semispherical** type is most satisfactory, being stronger and giving more rapid, thorough scavenging of exhaust gases.
- The air-cooled cylinder is an **overhead-valve** type, assembled from two major parts: the **cylinder head** and the **cylinder barrel**.
- At assembly, the head is expanded by heating and screwed onto a chilled barrel; as the head cools/contracts and the barrel warms/expands, a **gastight joint** results.
- Some cylinders are one-piece **aluminium alloy sand castings**, with a removable **steel liner** fitted in the piston bore (running the full length of the barrel, projecting below the cylinder flange) — the liner can be replaced in the field.

### Cylinder Heads

- Provides the place for fuel/air combustion, and heat conductivity for cooling.
- Houses the intake/exhaust valve ports, spark plugs, and valve actuating mechanisms.
- After casting, spark plug bushings, valve guides, rocker-arm bushings and valve seats are installed.
- **Spark plug bushings** — bronze or steel, shrunk and screwed into the openings; **stainless steel Heli-Coil** inserts are used on many current engines.
- **Valve guides** — bronze or steel, shrunk or screwed into drilled openings, generally angled to the cylinder centre line.
- **Valve seats** — circular rings of hardened metal that protect the softer cylinder-head metal from valve hammering and exhaust gases.
- Because of extreme temperatures, adequate **fin area** and rapidly heat-conducting metals are essential; **aluminium alloy** is used because it is easily cast/machined into deep, closely spaced fins and resists corrosive attack from tetraethyl lead in gasoline.
- Improved air cooling has come from **reducing fin thickness and increasing fin depth**: fin area has grown from about **1,200 sq in** to more than **7,500 sq in** per cylinder in modern engines; cooling fins taper from **0.090 in** at the base to **0.060 in** at the tip.
- Because temperature varies across the head, more fin area is provided around the **exhaust valve region** — the hottest part of the internal surface.

### Cylinder Barrels

- Must be a **high-strength material, usually steel**; light, yet suited to high-temperature operation; a good bearing material with high tensile strength.
- Made from a **steel alloy forging** with the inner surface hardened to resist wear from the piston and piston rings — usually by exposing the hot steel to **ammonia or cyanide gas**, so nitrogen is absorbed and forms iron nitrides on the surface. This process is called **nitriding**.
- Some barrels are threaded on the outside at one end so they can be screwed into the cylinder head.
- Some air-cooled barrels have **replaceable aluminium cooling fins** attached; others have fins **machined integrally** with the barrel.

### Pistons

The piston is a cylindrical member moving back and forth within the cylinder, acting as a moving wall of the combustion chamber:
- Downward stroke draws in the fuel/air mixture.
- Upward stroke compresses the charge; after ignition, expanding gases force the piston down (power stroke), transmitting force to the crankshaft via the connecting rod.
- On the return upward stroke, the piston forces exhaust gases from the cylinder.

### Piston Construction

- Most aircraft pistons are machined from **aluminium alloy forgings**.
- Grooves in the outside surface receive the piston rings; cooling fins on the inside improve heat transfer to the engine oil.
- **Trunk type** or **slipper type**: slipper-type pistons are not used in modern high-powered engines, since they do not provide adequate strength or wear resistance; they are cut away on the lower part, with all rings fitted above the gudgeon pin.
- The piston head (top face) may be **flat, convex or concave**, and may have recesses machined in to clear the valves.
- Up to **six grooves** may be machined for compression and oil rings: **compression rings** occupy the three uppermost grooves; **oil control rings** sit immediately above the piston pin. The piston is drilled at the oil-control-ring grooves to return scraped oil to the crankcase. An **oil scraper ring** at the base of the skirt limits oil consumption. The wall sections between ring grooves are called **ring lands**.
- The **piston skirt** guides the piston and incorporates the heavily built **piston-pin bosses**, which transfer the head's load to the piston pin.

### Piston Pin

- Joins the piston to the connecting rod; machined as a tube from a **nickel steel alloy forging**, casehardened and ground.
- Also called a **wristpin**, from the similarity between its motion and that of a human arm/wrist.
- Modern engines use the **full-floating** type — free to rotate in both the piston and the connecting-rod piston-pin bearing.
- Must be retained to stop the pin ends scoring the cylinder walls: earlier engines used **circlips** in grooves (a semi-floating pin); current practice fits a plug of **relatively soft aluminium** in the pin ends for a good bearing surface against the cylinder wall.

## Connecting Rods

The **connecting rod** transmits forces between the piston and crankshaft — strong enough to stay rigid under load, yet light enough to limit inertia forces as the rod/piston stop, reverse and restart at each stroke end.

Three types of connecting-rod assembly:

| Type | Typically used in | Key features |
|------|--------------------|--------------|
| **Master-and-articulated rod** | Radial engines | One piston per row connects to the crankshaft via a master rod (its "big end" carries the crankpin/master-rod bearing); all other pistons in that row connect to the master rod via articulated rods, attached by knuckle pins pressed into the master-rod flanges |
| **Plain-type** | In-line and opposed engines | Crankpin end fitted with a cap and two-piece bearing, held by bolts/studs |
| **Fork-and-blade** | V-type engines | Forked rod split at the crankpin end so the blade rod fits between the prongs; a single two-piece bearing on the crankshaft end |

- **Master-and-articulated rods**: articulated rods are forged steel alloy, I- or H-section, with bronze bushings pressed into each end for the knuckle-pin and piston-pin bearings; a plain bearing (piston-pin bushing) is installed in the piston end of the master rod.
- **Plain-type**: connecting rods should always be replaced in the **same cylinder and same relative position** to maintain proper fit and balance.

## Valves

Engine valves regulate gas flow into and out of a cylinder by opening/closing at predetermined times. Each cylinder has at least one **intake valve** and one **exhaust valve** (some high-powered engines have two of each per cylinder).

- Intake valves operate at lower temperatures and are typically **chrome, nickel, or tungsten steel**.
- Exhaust valves, enduring much higher temperatures, are typically **inconel, silicon-chromium, or cobalt-chromium alloys**.
- The most common type is the **poppet valve**, named for its "popping" action, classified by head shape:

| Head shape | Description |
|------------|-------------|
| **Flat-headed** | Flat head; used only as an intake valve in aircraft engines |
| **Semi-tulip** | Slightly concave head |
| **Tulip** | Deep, wide indented head |
| **Mushroom** | Convex head; not commonly found on aircraft engines |

- The **valve face** seals at the intake/exhaust ports, typically ground to an angle of **30° to 60°** against the valve seat; in some engines the intake face is ground to **30°** and the exhaust face to **45°** — the exact angle is manufacturer-specified for airflow, efficiency and sealing. Valve faces are often made more durable by welding on **Stellite** (a cobalt-chromium alloy), which resists high temperature and corrosion and withstands shock/wear.
- The **valve stem** aligns the valve head as it moves, is usually surface-hardened, and joins the head at the **valve neck**. The stem **tip** is also hardened; a **rotator cap** may be fitted to increase service life.
- A groove near the tip holds a **split key (keeper key)**, locking the valve spring retaining washers in place and holding the valve in the cylinder head. Some radial-engine valve stems have an additional groove for a **safety circlet (spring ring)**, preventing the valve falling into the cylinder if the tip breaks off.
- Some **exhaust valve stems** are hollowed and partially filled with **metallic sodium** to dissipate heat: the sodium melts at approximately **208°F**, circulates with the valve's up-and-down motion, and carries heat from the valve head into the stem, where it is dissipated through the cylinder head; sodium-filled valves can reduce operating temperature by as much as **400°F**.

## Valve Operating Mechanism

A typical mechanism consists of an internally driven camshaft or cam ring that pushes a **valve lifter (tappet)**, which transmits force to a **push rod**, which actuates a **rocker arm** to open the valve against the **valve spring**.

### Valve Lifters (Tappets)

- **Solid lifter** — a solid metal cylinder; the camshaft end is flat and polished, the push-rod end has a spherical cavity; drilled holes let oil flow through to lubricate the push rod.
- **Hydraulic lifter** (used on most opposed engines) — uses oil pressure to cushion cam-lobe impact and remove play. Consists of a **cam follower face**, **lifter body**, **hydraulic plunger and plunger spring**, a **check valve**, and a **push rod socket**, sitting in a crankcase bore resting on the camshaft.
  - When the follower face is on the back of a cam lobe, the plunger spring forces the plunger outward, pressing the push-rod socket against the push rod; a ball check valve lifts off its seat, letting oil flow from the **oil supply chamber** to the **oil pressure chamber**.
  - When the cam lobe strikes the follower face, the lifter body/cylinder moves outward, seating the check valve and trapping oil in the pressure chamber — this trapped oil cushions the abrupt pressure applied to the push rod. Some oil leaks between plunger and cylinder to compensate for heat-induced dimensional changes.
  - Immediately after the valve closes, the check valve moves off its seat again, ready for the next cycle.
  - A second type uses a **disk-type check valve** instead of a ball. Hydraulic lifters eliminate clearances in the mechanism, reducing hammering and wear.

### Push Rod

- A hollow **steel or aluminium alloy tube** with polished ends; one end rides in the lifter socket, the other fits a socket in the rocker arm.
- Holes drilled at each end allow oil flow from the lifter to the valve components in the head.
- Usually enclosed by a thin metal **shroud tube** running from the cylinder head to the crankcase, which often also provides a return path for oil pumped up to the head.

### Rocker Arm

- A pivoting lever in the cylinder head that converts push-rod lifting motion into the downward motion needed to open the valve.
- Made of **forged steel**, with a cup-shaped socket for the push rod and a flat surface bearing on the valve tip.
- Pivots on a shaft suspended between two **rocker arm bosses** cast into the head, each containing a bronze bushing bearing surface; the shaft is press-fitted and retained by the rocker-box cover or individual boss covers.
- The amount and duration of valve opening depend on the shape of the cam lobes.

### Valve Springs

- **Helical-coiled springs** holding the valve face firmly against the valve seat.
- Most engines use **two or more springs of different sizes/diameters** to prevent **valve float (valve surge)** — where a spring vibrates at its resonant frequency and loses its ability to hold the valve closed. Using multiple differently-sized springs makes it nearly impossible for all springs to resonate together, and also reduces the chance of failure from heat or metal fatigue.
- Held in place by a **valve spring retainer** and a **split valve key**; a retainer seat sits between the cylinder head and the spring's bottom, the retainer on top, locked to the valve stem by the split key.

### Valve Seat

- A circular ring of hardened metal (bronze or steel) providing a uniform sealing surface, machined to an oversize fit.
- Installed by heating the cylinder head and chilling the seat, then pressing it in with a **mandrel**; as the assembly cools, the head shrinks and retains the seat, which is then precisely ground.
- Usually ground to the **same angle** as the valve face; in some cases the valve face is ground fractionally shallower than the seat, producing an interference fit for more positive seating.

### Valve Guide

- A cylindrical sleeve supporting the valve stem and keeping the valve face aligned with the seat.
- Made of **steel, tin-bronze, or aluminium-bronze**, installed with a **shrink fit** in the same manner as a valve seat.

## Propeller Reduction Gearboxes

Power from a piston aero engine reaches the atmosphere via the propeller. As engine power increases, propellers must grow larger (wider and longer blades); since engines are designed for maximum power at a specified RPM, propeller diameter is restricted so **tip velocity stays below Mach 1** to avoid compressibility problems. Whenever crankshaft design speed exceeds propeller-shaft design speed, a **reduction gear** must be interposed.

Three main types of reduction gear:

| Type | Description |
|------|-------------|
| **Spur Gear** | Usually used on in-line engines; the small gear receives drive from the crankshaft via a coupling shaft on the same axis line as the crankshaft |
| **Spur Epicyclic** | A sun gear (driven by the crankshaft) meshes with and drives three equi-spaced **planet pinions**, mounted on a carrier and rotating independently on their axles; an internally toothed **annulus** surrounds the train and meshes with the pinions. If the annulus is fixed, the sun wheel's rotation makes the pinions rotate about their own axes while also moving around the annulus, so the planet-pinion carrier (secured to the propeller shaft) rotates slower than the sun wheel — with crankshaft and propeller shaft on the same axis. **Double helical or skew** teeth are used where high torque must be transmitted |
| **Bevel Epicyclic Gear** | Two opposed bevel gears of different diameter: the larger (rear, driving) bevel is driven by the crankshaft, the smaller (front) bevel is held stationary in its casing. Three satellite (planet) pinions, free to rotate, are mounted on equally spaced arms radiating from the propeller shaft, engaging both bevel gears; rotation of the driving bevel causes the satellite pinions, their mounting arms, and the propeller shaft to rotate at reduced speed |
        $cnt$,
        3
    ) RETURNING id INTO s3_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 16.4: Engine Fuel Systems
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m16_id, 'M16.4', 'Engine Fuel Systems',
        $cnt2$
# Engine Fuel Systems

## Introduction

The carburetion system must control the air/fuel ratio in response to throttle setting at all selected power outputs (from slow-running to full throttle) and during acceleration/deceleration; it must function at all operating altitudes and temperatures, provide for ease of starting, and may incorporate a means of shutting off fuel to stop the engine.

Three main systems are compared:

| System | Cost / complexity | Metering accuracy | Effect of flight manoeuvres | Icing susceptibility |
|--------|--------------------|--------------------|------------------------------|------------------------|
| **Float-chamber carburettor** | Cheapest, simplest; used on many light aircraft | Basic | Prone to being affected | Very prone to icing |
| **Injection carburettor** | More sophisticated | Meters fuel more precisely, more accurate air/fuel ratio | Less affected | Less prone to icing |
| **Direct- (port-) injection system** | Most sophisticated | Best fuel distribution; reputed most economical | Unaffected | Free from icing |

Any of these types may be fitted with a **manual mixture control**, for obtaining the most economical cruising mixture. To help the pilot select the best mixture, some aircraft are fitted with **fuel flowmeters**, **exhaust gas temperature gauges**, or **exhaust gas analysers**.

## Float-Chamber Carburettors

### Basic Operation

In a float-chamber (simple) carburettor, airflow to the engine is controlled by a **throttle valve**, and fuel flow by **metering jets**.

- Engine suction draws air through the air intake, through a **venturi** in the carburettor, then to the induction manifold; the air speeds up through the venturi and a **drop in pressure** occurs.
- Fuel is held in a **float chamber**, supplied by gravity, an electrical booster pump, or an engine-driven fuel pump (with a fuel pressure gauge fitted where pumps are used); a constant level is maintained by the **float and needle-valve**.
- Air-intake/atmospheric pressure acts on the fuel in the float chamber, which connects to a **fuel discharge tube** in the throat of the venturi; the pressure difference between the float chamber and the venturi throat forces fuel to discharge into the airstream.
- As airflow through the venturi increases, the pressure drop increases, raising the pressure differential and increasing fuel flow in proportion to airflow.
- The size of the **main jet** in the discharge tube determines the quantity of fuel discharged at a given pressure differential, and so controls mixture strength.

### Main Metering System

As engine speed and venturi airflow increase, the proportion of fuel to air rises because air and fuel have different flow characteristics.

- Some carburettors use a **diffuser**: as engine speed rises above idling, the fuel level in the diffuser well drops, progressively uncovering air holes that admit more air into the discharge tube, reducing the pressure differential and preventing mixture enrichment. Drawing both air and fuel through the discharge tube also vaporises the fuel more readily, especially at low speeds.
- Carburettors without a diffuser instead bleed atmospheric-pressure air into the discharge tube (**air bleed**), producing a similar effect.

### Idling

At idle, venturi air velocity is too low to discharge fuel adequately, but air passing through the gap between the throttle valve and throttle-body wall has enough velocity to create the needed pressure reduction.

- One or more small holes are drilled through the throttle-body wall at this position and ducted to the float chamber, with an air bleed in the duct, providing an air/fuel mixture to an **idling jet**.
- On some carburettors, idling mixture is adjusted by varying the total quantity discharged into the airstream; on others, a fuel metering jet is placed in the idling duct and adjustment is made via the air bleed.
- A **cut-off valve** may be fitted to the duct to allow the engine to be stopped.

### Mixture Controls

The pressure drop at the venturi (a measure of air mass flow) is proportional to **d × v²** (d = air density, v = air velocity); fuel mass flow from the pressure drop is proportional to **D × V²** (D = fuel density, V = fuel velocity).

- At constant air density, changes in fuel mass flow are proportional to changes in air mass flow (engine speed).
- At constant air velocity, the venturi pressure drop is directly proportional to changes in air density, but fuel mass flow (constant density) stays proportional to pressure drop — so changes in air density produce **less than proportional** changes in fuel flow. This causes a **progressive increase in richness with increased altitude**, unacceptable for economical operation.
- Float-chamber carburettors are normally fitted with a **manual mixture control**, correcting altitude enrichment and also used for leaning the mixture for economical cruising. Some large engines have **automatic mixture control**.

**Needle-type mixture control**: a cockpit lever connects to a needle valve in the float chamber; raising/lowering the needle varies fuel flow through an orifice to the main jet, controlling mixture strength — in the fully down position, it blocks fuel flow, stopping the engine.

**Air bleed mixture control**: controls air pressure in the float chamber via a small air bleed and a cockpit-lever-operated valve, varying the pressure differential on the fuel — valve fully open gives maximum air pressure (fully rich); closing it reduces fuel flow (weaker mixture). A pipe connection to the engine side of the throttle valve, connected via the cockpit control's "idle cut-off" position, reduces float-chamber air pressure and stops fuel flow, stopping the engine.

**Automatic mixture control**: typically an **aneroid capsule** positioning a valve that admits atmospheric pressure into the mixture discharge tube, altering the pressure difference between venturi and float chamber and so varying fuel flow. One version uses **engine oil pressure** to position the mixture control valve according to atmospheric pressure: as altitude increases, the aneroid capsule (open to atmosphere) expands and lowers a piston valve, directing oil to the underside of a servo piston, which moves upward (oil above it returns to the scavenge line); the servo piston, linked to the mixture control valve and the aneroid capsule, opens the control valve while raising the capsule/piston valve until the piston valve regains its neutral position. Movement of the servo piston is set to be proportional to atmospheric pressure changes, and mixture-valve opening proportional to fuel flow requirements.
- **Economical cruising** is obtained by resetting the piston valve's neutral position (via a two-position cockpit control rotating a sleeve 90° around the piston valve, bringing a second set of holes into line), so the servo piston adopts a higher position irrespective of altitude, giving a weaker mixture. As power is increased above the cruising range, the mixture lever is automatically moved to the rich setting.

### Power Enrichment

At power settings above the cruising range, a **richer mixture** is required to prevent **detonation**, provided either by an additional fuel supply, or by setting the carburettor rich for high power and bleeding off float-chamber pressure to reduce fuel flow for cruising.

- A **power jet (enrichment jet / economiser)**: an additional needle valve connected to the throttle control, fully closed below the throttle setting needed for maximum sea-level cruising power, opening progressively as the throttle opens further, and fully open at full throttle. On some engines the power jet operates independently of the throttle, via a sealed bellows actuated by **manifold pressure**, so enrichment relates to engine power rather than throttle position.
- **Back-suction economiser** (air-operated economiser): at high power the throttle valve is nearly fully open, so air pressure past the valve is only slightly below atmospheric, giving little effect on float-chamber pressure and thus a rich mixture. As the throttle closes toward cruising, suction created past the valve is applied to the float chamber via the economiser channel and air jet, reducing float-chamber pressure and fuel flow through the main jet — giving the economical cruising mixture.

### Acceleration

If the throttle is opened quickly, airflow responds almost immediately, but the fuel metering system responds more slowly, temporarily weakening the mixture. An **accelerator pump**, linked directly to the throttle, forces fuel into the venturi whenever the throttle is opened.

- Initial throttle opening: the accelerator pump piston supplies fuel through a **non-return valve** to the delivery tube; a **delayed-action plunger** also supplies extra fuel for a few seconds after throttle movement stops.
- When the throttle is moved rearwards, the accelerator pump is replenished from the float chamber via a non-return valve.

## Injection Carburettors

These do not have a vented float chamber and do not rely on venturi suction to discharge fuel; they form a **pressurised, closed system** that meters fuel according to airflow and mixture-strength requirements, spraying it into the induction manifold downstream of the throttle valve.

Main components: an **air throttle valve**, an **engine-driven pump**, a **pressure regulator**, a **fuel control unit**, an **automatic mixture control**, an **accelerator pump**, and a **discharge nozzle**.

- **Throttle body** — houses the throttle valve, discharge nozzle, accelerator pump, venturis, and automatic mixture control; provides connections to the regulator and fuel control unit.
- **Throttle valve** — unlike a float-chamber carburettor, controls **only airflow**; since no fuel passes it, there is less likelihood of carburettor icing.
- **Discharge nozzle** — contains a spring-loaded valve and diaphragm; opens when metered fuel pressure on the diaphragm overcomes spring pressure, acting as a relief valve to hold discharge-line pressure relatively constant regardless of fuel flow.
- **Accelerator pump** — automatic in operation, supplying additional fuel during rapid throttle opening.
- **Venturis** — two are used: a smaller "**boost**" venturi discharges into the throat of the main venturi, giving a larger pressure drop than a single venturi could provide. Impact tubes around the top of the main venturi supply air-intake pressure to the regulator. Their purpose is to **measure airflow** through the throttle body.
- **Automatic mixture control** — a sealed bellows responding to air pressure and temperature, connected to a tapered needle in the duct supplying air-intake pressure to the regulator, automatically varying fuel flow with air density changes.

### Fuel Pumps

The engine-driven fuel pump is generally a **positive-displacement** type, with capacity exceeding maximum engine fuel requirements. Since the carburettor relies on fuel at positive pressure, an **electrically operated booster pump** is also fitted — both as backup if the engine-driven pump fails, and for engine starting. A fuel pressure gauge indicates pump operation.

### Regulator

Attached to the throttle body, regulating pressure drop across the fuel-control-unit jets according to airflow. It has two pairs of chambers, each pair separated by a flexible diaphragm:
- **Chamber A** — ducted to air-intake pressure.
- **Chamber B** — ducted to boost-venturi suction.
- **Chamber C** — ducted to metered fuel pressure.
- **Chamber D** — supplied by unmetered fuel pressure.

The air and fuel diaphragms, and the sealing diaphragm between B and C, attach to the stem of the **fuel valve**, opened/closed by the air and fuel forces across the four chambers. Fuel is delivered from the pump to **chamber E**, which also contains a filter and a **vapour vent valve** (allowing vapour to escape and return to the aircraft tanks, preventing upset of the carburettor's balance).

### Fuel Control Unit

Attached to the regulator, containing all metering jets and valves. The manual mixture-control lever connects to a **rotary mixture-control valve** that determines which jets operate — a stationary member with ducts to the **auto-rich** and **auto-lean** jets, and a rotating member that covers/uncovers the ducts. A pressure-operated valve opens the passage from the **power jet**, and a plunger connected to the throttle adjusts fuel flow in the idling range. Where two jets/holes are connected in series, the **smaller** one (combined with the pressure drop across the jets) controls fuel flow.

- **Idle cut-off**: all rotary-valve fuel passages blocked, no fuel flows.
- **Auto-lean**: the largest passage is partially uncovered; fuel flows past the idling plunger through the auto-lean jet and mixture control valve to the discharge nozzle; flow depends on auto-lean jet size and the metered/unmetered pressure difference.
- **Auto-rich**: all passages uncovered; fuel flows through both the auto-lean and auto-rich jets and all rotary-valve holes to the discharge nozzle; when the power valve opens, additional fuel flows through the power jet and the large hole in the mixture control valve.

### Basic Operation

The pressure difference between chambers A and B (dependent on intake pressure vs. boost-venturi suction) increases with airflow, moving the air diaphragm and opening the fuel valve. Fuel then flows into chamber D, through the fuel-control-unit metering jets, back to chamber C, and to the discharge nozzle, which opens once chamber C / discharge-line pressure reaches a predetermined value. Because the jets restrict flow, unmetered pressure in D is always greater than metered pressure in C, so the fuel diaphragm moves in opposition to the air diaphragm, tending to close the fuel valve; as the valve closes, pressure in D falls until a balanced condition is reached where air and fuel forces are equal — at which point fuel flow through the jets is proportional to the C–D pressure difference, matching the A–B (airflow) pressure difference, so the correct basic air/fuel mixture is supplied at all engine speeds.

- Changing the mixture control alters fuel flow and the pressure drop across the jets; the diaphragm/fuel-valve assembly repositions to maintain the pressure drop for that airflow, changing mixture strength per the jets in use.
- Any change in fuel pump pressure or discharge-nozzle pressure similarly disturbs the diaphragm balance and is corrected by fuel-valve movement.

### Idling

At very low engine speeds, airflow is insufficient to create an effective pressure drop through the boost venturi to regulate fuel flow. A **spring** on the fuel valve stem in chamber D holds the fuel valve off its seat at idling speeds, allowing fuel to flow through chamber D to the fuel control unit, where the **idling plunger** (connected to the throttle) meters fuel for the first few degrees of throttle opening; at larger openings the plunger withdraws and has no further effect.

### Mixture Control

The manual mixture control varies fuel flow with operating conditions; the **automatic mixture control** corrects fuel flow for changes in air density. A small air bleed between chambers A and B causes a slight continuous air flow from the impact tubes to the boost venturi, controlling pressure in chamber A and thereby regulating fuel flow.
- At **sea level**, the bellows are fully compressed and the tapered needle is withdrawn from the air passage to chamber A; full intake pressure acts on the air diaphragm, giving maximum fuel valve opening/flow for the airflow condition.
- As the aircraft **climbs** and atmospheric pressure decreases, the bellows expand, inserting the tapered needle into the passage, restricting airflow into chamber A and reducing the differential pressure across the air diaphragm — the fuel valve closes slightly and fuel flow reduces to maintain the required mixture strength.

### Acceleration

A single-diaphragm automatic accelerator pump: air pressure on the engine side of the throttle valve varies with throttle position (lowest at idle, increasing as the throttle opens) and is ducted to the rear of the accelerator-pump diaphragm.
- At small throttle openings, air pressure and discharge-nozzle fuel pressure overcome the spring, withdrawing the diaphragm and filling the pump fuel chamber.
- As the throttle opens, air pressure increases and the spring forces the diaphragm forward, discharging fuel to the nozzle — added to normal metered flow, sufficient to overcome any temporary mixture weakening.

## Direct Fuel Injection Systems

Direct fuel injection on aircraft piston engines is usually a **low-pressure, continuous-flow** type, unlike the intermittent-flow type used on diesel engines, which injects calibrated quantities at a particular point in the cycle. Fuel is sprayed **continuously** into the inlet port of each cylinder.

Claimed advantages: **low operating pressure**, **good fuel distribution**, **freedom from icing problems**, and the ability to use a pump that does not need to be timed to the operating cycle.

- The size of a **variable orifice** is controlled by the air throttle valve position; the pressure of fuel through this orifice is controlled by engine speed.
- Mixture strength is varied by a manually operated control, adjusting fuel pressure for altitude/operating conditions.
- Because of the injector's method of operation, **no special idling arrangements** are required and **no separate priming system** is needed for starting.
- Main components: a **fuel pump**, a **fuel/air control unit**, a **fuel manifold (distribution) valve**, and **discharge nozzles** for each cylinder — plus a normal throttle valve and a fuel pressure gauge.

### Fuel Pump

A **positive-displacement, vane-type pump**, gear-driven from the crankshaft, so total pump output is proportional to engine speed.

- The pump supplies more fuel than required; a recirculation path with a **calibrated orifice and relief valve** ensures delivery pressure is also proportional to engine speed.
- Fuel enters through a **swirl chamber** separating vapour from liquid fuel; vapour is ejected by a jet of pressurised fuel and returned to the fuel tank.
- When the pump is not operating, a **spring-loaded valve** in the base of the swirl chamber lets fuel bypass the pump under positive pressure, allowing an electrically operated **booster pump** to be used for starting and emergencies. The booster pump is often **two-speed**: low pressure for normal back-up, high pressure for main-pump failure.

### Fuel/Air Control Unit

Mounted on the intake manifold, containing three control elements:
- **Air throttle assembly** — the air throttle valve, connected to the pilot's throttle lever, controlling airflow (the intake manifold has no venturi or other restriction).
- **Metering valve** — connected to the air throttle; a cam-shaped end face controls fuel flow to the fuel manifold valve according to throttle position, proportioning fuel flow to airflow for the correct air/fuel ratio.
- **Mixture valve** — connected to the pilot's mixture control lever; a contoured end face bleeds off fuel pressure applied to the metering valve, allowing the air/fuel ratio to be varied from the metering valve's basic setting. A fuel pressure gauge indicates metered fuel pressure, calibrated to allow mixture adjustment for altitude and power setting.

### Fuel Manifold Valve

Located on the engine crankcase; the central point distributing metered fuel to the engine. Contains a **spring-loaded diaphragm** with an attached valve.
- Engine stopped: the spring forces the diaphragm down, seating the valve and closing all outlet ports — no fuel flows.
- As fuel pressure builds (from engine rotation or booster pump operation) and overcomes spring force, the valve lifts, opening all ports to the discharge nozzles simultaneously. A **ball valve** ensures the ports are fully open before fuel starts flowing.

### Discharge Nozzle

Located in each cylinder head, outlet directed into the inlet port. A nozzle with a **calibrated orifice** directs fuel through a central bore; radial holes in the body admit air (drawn through a surrounding cylindrical filter) at ambient pressure (normally aspirated engine) or manifold pressure (supercharged engine), mixing with the fuel before it sprays into the inlet port. Nozzles are calibrated in several ranges and fitted to individual engines as a matched set, all with the same calibration.

### Pressure Gauge

A pressure tapping from the metered fuel line operates the **fuel pressure gauge**; since mixture strength depends on fuel pressure through the metering valve, the gauge reading is proportional to fuel flow.
- On a **normally aspirated engine**, the gauge has two ranges: a **take-off segment**, calibrated in thousands of feet of altitude (set to airfield height on take-off/climb, compensating for reduced air density), and a **cruise segment**, marked with maximum/minimum lines per power setting — during cruise, fuel pressure is first set to the highest line for best power, then reduced to the minimum line (once temperatures stabilise) for economical cruising. For ground running the mixture lever is left fully rich.
- On a **turbocharged engine**, fuel flow at a given power setting is constant at all altitudes, so the gauge is calibrated solely in units of pressure/flow, and mixture is adjusted to the recommended pressure/flow for the flight condition.

## Icing and Heating

Piston-engine icing has two distinct types: **impact icing** and **carburettor icing**, forming in different ways, occurring in ambient temperatures between roughly **+25°C and −15°C** — below **−15°C**, any ice formed is too dry to adhere to the intake or throttle-body wall. Icing may occur flying in cloud, rain or snow, in clear air with sufficiently high humidity, or when ground-running in similar conditions. An **air-intake temperature gauge** often provides an icing warning.

### Impact Icing

Caused by water droplets freezing on impact with the intake, throttle-body wall, or impact tubes — most likely between **0°C and −7°C**. Ice can build up around the air intake, disturb airflow to the carburettor, upset the air/fuel ratio, and cause power loss or complete engine stoppage.

Protection:
- A **gapped ice-guard** — a coarse wire-mesh screen mounted in front of the intake, with a gap providing an air passage if the screen becomes blocked with ice/snow.
- An **alternative air intake**, manually operated or a spring-loaded door in the intake duct opening into the engine compartment — if the intake/filter becomes blocked, engine suction opens the door automatically, drawing in warm air.

### Carburettor Icing

Restriction of airflow by the venturi and throttle valve increases air velocity and reduces its pressure (**Boyle's Law**), which also reduces its temperature; fuel vaporisation further cools the air and throttle-body walls. When carburettor air temperature drops below **0°C**, moisture in the air forms ice on the venturi and throttle valve, further restricting airflow — this can cause rough running, power loss, throttle-valve jamming, and eventual engine stoppage.

- Carburettor icing may develop in any carburettor type in air temperatures below **+25°C**, but is **less likely with direct fuel injectors**, since fuel is injected downstream of the throttle valve and venturi.
- Protection is usually by supplying **warm air** to the carburettor, or by heating the carburettor:
  - A **hot-air intake** ducts air from regions near heated engine parts (e.g. an exhaust-pipe muff) to the carburettor; the pilot's control may be two-position (selecting the air source) or multi-position (progressively bleeding more hot air in).
  - On some earlier carburettors, the throttle-body wall and throttle valve are hollow and form passages for pumped **engine oil**, warming the carburettor enough to prevent icing and assist fuel vaporisation.
- Manually selected hot-air intake use is usually restricted to operation **below 80% power**; prolonged use of hot air at higher power settings could result in **detonation**.
        $cnt2$,
        4
    ) RETURNING id INTO s4_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M16.3 Engine Construction (24 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s3_id, 'The crankcase is the part of the engine that:',
     '[{"id":"a","text":"Houses the crankshaft and connecting rods, and provides mounting faces for cylinders, reduction gear and other units","correct":true},{"id":"b","text":"Contains the combustion chamber and houses the piston","correct":false},{"id":"c","text":"Provides the sole structural connection between the propeller and the airframe","correct":false}]',
     '{"B1"}'),

    (s3_id, 'On in-line engines the crankcase main bearings are usually of the plain metal type; on radial engines they are usually:',
     '[{"id":"a","text":"Ball bearings","correct":false},{"id":"b","text":"Roller bearings","correct":true},{"id":"c","text":"Bronze bushings only, with no rolling elements","correct":false}]',
     '{"B1"}'),

    (s3_id, 'The purpose of the crankshaft is to:',
     '[{"id":"a","text":"Change the reciprocating motion of the piston into rotary motion","correct":true},{"id":"b","text":"Change the rotary motion of the propeller into reciprocating motion","correct":false},{"id":"c","text":"Provide the main air/fuel mixing chamber for the engine","correct":false}]',
     '{"B1"}'),

    (s3_id, 'Crankpins and journals are usually made hollow in order to:',
     '[{"id":"a","text":"Reduce weight, the hollow spaces also forming lubricating oil passages","correct":true},{"id":"b","text":"Increase torsional stiffness only","correct":false},{"id":"c","text":"Allow the crankshaft to be balanced without counterweights","correct":false}]',
     '{"B1"}'),

    (s3_id, 'A single-throw (360 degree) crankshaft, used in a single-row radial engine, is supported by:',
     '[{"id":"a","text":"A single central main bearing","correct":false},{"id":"b","text":"Two main bearings, one at each end","correct":true},{"id":"c","text":"Four main bearings equally spaced along its length","correct":false}]',
     '{"B1"}'),

    (s3_id, 'A crankshaft is checked for static balance by:',
     '[{"id":"a","text":"Resting it on two knife edges and observing whether it tends to turn toward one position","correct":true},{"id":"b","text":"Spinning it at full operating RPM on a test rig","correct":false},{"id":"c","text":"Measuring its resonant frequency with an accelerometer","correct":false}]',
     '{"B1"}'),

    (s3_id, 'A dynamic damper, used to reduce crankshaft vibration, is best described as:',
     '[{"id":"a","text":"A pendulum fastened to the crankshaft, free to move in a small arc, incorporated in the counterweight assembly","correct":true},{"id":"b","text":"A hydraulic cylinder fitted between the crankcase and engine mount","correct":false},{"id":"c","text":"An additional flywheel bolted to the propeller shaft","correct":false}]',
     '{"B1"}'),

    (s3_id, 'In an opposed engine, the camshaft speed relative to crankshaft speed is:',
     '[{"id":"a","text":"Always equal to crankshaft speed","correct":false},{"id":"b","text":"Always one-half of crankshaft speed","correct":true},{"id":"c","text":"Always twice crankshaft speed","correct":false}]',
     '{"B1"}'),

    (s3_id, 'On a radial engine, the valve mechanism is operated by a cam ring (cam drum) which is:',
     '[{"id":"a","text":"Mounted concentrically with the crankshaft and driven by it at reduced speed through the cam intermediate drive gear assembly","correct":true},{"id":"b","text":"Driven directly by the propeller reduction gearbox at propeller speed","correct":false},{"id":"c","text":"A fixed, non-rotating component with only the tappets moving around it","correct":false}]',
     '{"B1"}'),

    (s3_id, 'On a nine-cylinder radial engine with firing order 1-3-5-7-9-2-4-6-8, correct valve timing requires the cam ring to be driven:',
     '[{"id":"a","text":"In the same direction as the crankshaft","correct":false},{"id":"b","text":"In the opposite direction to the crankshaft","correct":true},{"id":"c","text":"At exactly crankshaft speed, regardless of direction","correct":false}]',
     '{"B1"}'),

    (s3_id, 'In a piston engine, the difference between a wet sump and a dry sump is that:',
     '[{"id":"a","text":"A wet sump stores the oil in a pressed-steel container bolted to the engine, whereas a dry sump is an integral part of the crankcase and scavenge pumps return oil to a separate tank","correct":true},{"id":"b","text":"A wet sump is only used on liquid-cooled engines and a dry sump only on air-cooled engines","correct":false},{"id":"c","text":"A dry sump contains no oil at all during normal operation","correct":false}]',
     '{"B1"}'),

    (s3_id, 'The accessory (rear) section of a piston engine is usually of cast construction, most widely made from:',
     '[{"id":"a","text":"Aluminium alloy","correct":true},{"id":"b","text":"Cast iron","correct":false},{"id":"c","text":"Stainless steel","correct":false}]',
     '{"B1"}'),

    (s3_id, 'In accessory gear trains, spur-type gears are generally used to drive:',
     '[{"id":"a","text":"The heaviest-loaded accessories, or those requiring the least play/backlash","correct":true},{"id":"b","text":"Only lightly loaded instruments such as the tachometer","correct":false},{"id":"c","text":"Accessories mounted at an angle to the main gear train","correct":false}]',
     '{"B1"}'),

    (s3_id, 'Of the four factors considered in cylinder design and construction, which is NOT one of them?',
     '[{"id":"a","text":"Strong enough to withstand internal operating pressures","correct":false},{"id":"b","text":"Good heat-conducting properties for efficient cooling","correct":false},{"id":"c","text":"Constructed from the heaviest available metal to maximise strength","correct":true}]',
     '{"B1"}'),

    (s3_id, 'Compared with flat or peaked cylinder head shapes, the semispherical combustion chamber shape is considered most satisfactory because it is:',
     '[{"id":"a","text":"Stronger and gives more rapid, thorough scavenging of exhaust gases","correct":true},{"id":"b","text":"The cheapest shape to cast and requires no machining","correct":false},{"id":"c","text":"The only shape that can accommodate a semi-tulip valve","correct":false}]',
     '{"B1"}'),

    (s3_id, 'Hardening the inner surface of a cylinder barrel by exposing the hot steel to ammonia or cyanide gas, so it absorbs nitrogen and forms iron nitrides on the surface, is a process known as:',
     '[{"id":"a","text":"Anodising","correct":false},{"id":"b","text":"Nitriding","correct":true},{"id":"c","text":"Carburising with sodium","correct":false}]',
     '{"B1"}'),

    (s3_id, 'Slipper-type pistons are not used in modern, high-powered aircraft engines mainly because:',
     '[{"id":"a","text":"They are cut away on the lower part and do not provide adequate strength or wear resistance","correct":true},{"id":"b","text":"They cannot be machined from aluminium alloy forgings","correct":false},{"id":"c","text":"They require a semi-floating piston pin, which is now obsolete","correct":false}]',
     '{"B1"}'),

    (s3_id, 'The piston pin used in modern aircraft engines is described as "full-floating" because it is:',
     '[{"id":"a","text":"Free to rotate in both the piston and the connecting-rod piston-pin bearing","correct":true},{"id":"b","text":"Held rigidly fixed in the piston but free to rotate in the connecting rod only","correct":false},{"id":"c","text":"Not physically connected to the piston, being held only by oil pressure","correct":false}]',
     '{"B1"}'),

    (s3_id, 'The master-and-articulated connecting rod assembly is commonly used in:',
     '[{"id":"a","text":"Radial engines, where one piston per row connects to the crankshaft via a master rod and the others connect to it via articulated rods","correct":true},{"id":"b","text":"In-line engines only","correct":false},{"id":"c","text":"V-type engines only, in place of the fork-and-blade assembly","correct":false}]',
     '{"B1"}'),

    (s3_id, 'Some exhaust valve stems are hollowed out and partially filled with metallic sodium in order to:',
     '[{"id":"a","text":"Reduce the overall weight of the valve for faster operation","correct":false},{"id":"b","text":"Help dissipate heat from the valve head into the stem, reducing valve operating temperature","correct":true},{"id":"c","text":"Provide a self-lubricating bearing surface against the valve guide","correct":false}]',
     '{"B1"}'),

    (s3_id, 'A hydraulic valve lifter, compared with a solid lifter, is designed to:',
     '[{"id":"a","text":"Use oil pressure to cushion the impact of the cam lobe and remove play in the valve operating mechanism","correct":true},{"id":"b","text":"Eliminate the need for a push rod and rocker arm entirely","correct":false},{"id":"c","text":"Operate the valve mechanically identically to a solid lifter but at half the weight","correct":false}]',
     '{"B1"}'),

    (s3_id, 'Most aircraft engines use two or more valve springs of different sizes on each valve mainly to prevent:',
     '[{"id":"a","text":"Valve float (valve surge), where a spring vibrates at its resonant frequency and loses its ability to hold the valve closed","correct":true},{"id":"b","text":"Excessive valve guide wear","correct":false},{"id":"c","text":"The valve seat from being ground to the wrong angle","correct":false}]',
     '{"B1"}'),

    (s3_id, 'A reduction gear must be interposed between the crankshaft and the propeller shaft whenever:',
     '[{"id":"a","text":"The crankshaft design speed exceeds the design speed of the propeller shaft","correct":true},{"id":"b","text":"The engine is air-cooled rather than liquid-cooled","correct":false},{"id":"c","text":"The propeller has more than two blades","correct":false}]',
     '{"B1"}'),

    (s3_id, 'In a spur epicyclic reduction gear with the annulus fixed, the output to the propeller shaft is normally taken from the:',
     '[{"id":"a","text":"Sun gear directly","correct":false},{"id":"b","text":"Planet pinion carrier, which rotates more slowly than the sun gear","correct":true},{"id":"c","text":"Annulus itself, which is allowed to rotate freely","correct":false}]',
     '{"B1"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M16.4 Engine Fuel Systems (20 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s4_id, 'Of the three carburetion systems described (float-chamber, injection carburettor, direct fuel injection), which is the cheapest and simplest, but most prone to icing?',
     '[{"id":"a","text":"The float-chamber carburettor","correct":true},{"id":"b","text":"The injection carburettor","correct":false},{"id":"c","text":"The direct- (port-) injection system","correct":false}]',
     '{"B1"}'),

    (s4_id, 'Compared with a float-chamber carburettor, a direct- (port-) injection fuel system is:',
     '[{"id":"a","text":"More prone to icing but less affected by flight manoeuvres","correct":false},{"id":"b","text":"Free from icing, unaffected by flight manoeuvres, and reputed to be the most economical","correct":true},{"id":"c","text":"Cheaper and simpler, though less accurate in metering fuel","correct":false}]',
     '{"B1"}'),

    (s4_id, 'In a float-chamber carburettor, a constant fuel level in the float chamber is maintained by:',
     '[{"id":"a","text":"The main jet and diffuser","correct":false},{"id":"b","text":"The float and needle-valve","correct":true},{"id":"c","text":"The accelerator pump piston","correct":false}]',
     '{"B1"}'),

    (s4_id, 'In a float-chamber carburettor, the size of the main jet in the discharge tube primarily determines:',
     '[{"id":"a","text":"The idling speed of the engine","correct":false},{"id":"b","text":"The quantity of fuel discharged at a given pressure differential, and so the mixture strength","correct":true},{"id":"c","text":"The maximum RPM the engine can achieve","correct":false}]',
     '{"B1"}'),

    (s4_id, 'The purpose of a diffuser in the main metering system of a carburettor is to:',
     '[{"id":"a","text":"Admit progressively more air into the discharge tube as speed rises, preventing over-enrichment of the mixture","correct":true},{"id":"b","text":"Increase fuel pressure at high engine speeds to enrich the mixture","correct":false},{"id":"c","text":"Cool the incoming air before it reaches the venturi","correct":false}]',
     '{"B1"}'),

    (s4_id, 'At idling speed, the pressure drop needed to discharge fuel from the idling jet is obtained mainly from:',
     '[{"id":"a","text":"The venturi, since air velocity through it is highest at idle","correct":false},{"id":"b","text":"Air passing through the gap between the throttle valve and the throttle-body wall","correct":true},{"id":"c","text":"The accelerator pump, which operates continuously at idle","correct":false}]',
     '{"B1"}'),

    (s4_id, 'As an aircraft climbs and air density decreases, an uncorrected float-chamber carburettor tends to produce:',
     '[{"id":"a","text":"A progressively leaner mixture","correct":false},{"id":"b","text":"A progressively richer mixture, since fuel flow decreases less than proportionally with air density","correct":true},{"id":"c","text":"No change in mixture strength at all","correct":false}]',
     '{"B1"}'),

    (s4_id, 'With a needle-type mixture control, moving the cockpit lever to the fully down position:',
     '[{"id":"a","text":"Gives the maximum rich mixture for takeoff","correct":false},{"id":"b","text":"Blocks fuel flow to the main jet, providing a means of stopping the engine","correct":true},{"id":"c","text":"Has no effect on fuel flow, only on air bleed","correct":false}]',
     '{"B1"}'),

    (s4_id, 'An automatic mixture control commonly uses which component to sense altitude and adjust fuel flow accordingly?',
     '[{"id":"a","text":"An aneroid capsule","correct":true},{"id":"b","text":"A bimetallic strip","correct":false},{"id":"c","text":"A centrifugal governor driven from the crankshaft","correct":false}]',
     '{"B1"}'),

    (s4_id, 'A power jet (enrichment jet, or economiser), connected to the throttle control, is designed to:',
     '[{"id":"a","text":"Remain fully open at all times below full throttle","correct":false},{"id":"b","text":"Stay fully closed below the throttle setting needed for maximum sea-level cruising power, opening progressively above it","correct":true},{"id":"c","text":"Operate only during engine starting","correct":false}]',
     '{"B1"}'),

    (s4_id, 'A back-suction economiser reduces fuel flow for economical cruising by:',
     '[{"id":"a","text":"Applying suction, created as the throttle closes, to the float chamber via the economiser channel and air jet, thereby reducing float-chamber pressure","correct":true},{"id":"b","text":"Increasing float-chamber pressure to force more fuel through the main jet","correct":false},{"id":"c","text":"Physically closing off the main jet with a needle valve linked to manifold pressure","correct":false}]',
     '{"B1"}'),

    (s4_id, 'The purpose of an accelerator pump, linked directly to the throttle, is to:',
     '[{"id":"a","text":"Prevent a temporary weakening of the mixture when the throttle is opened quickly","correct":true},{"id":"b","text":"Provide the constant fuel supply used during normal cruise flight","correct":false},{"id":"c","text":"Replace the main jet at high power settings","correct":false}]',
     '{"B1"}'),

    (s4_id, 'Unlike the throttle valve on a float-chamber carburettor, the throttle valve on an injection carburettor:',
     '[{"id":"a","text":"Controls only airflow to the engine, since no fuel passes through it","correct":true},{"id":"b","text":"Controls only fuel flow, with airflow regulated elsewhere","correct":false},{"id":"c","text":"Is eliminated entirely, being replaced by the discharge nozzle","correct":false}]',
     '{"B1"}'),

    (s4_id, 'In an injection carburettor throttle body, the purpose of using a smaller "boost" venturi discharging into the main venturi is to:',
     '[{"id":"a","text":"Provide a larger pressure drop than could be obtained with a single venturi, for measuring airflow","correct":true},{"id":"b","text":"Allow the accelerator pump to discharge fuel directly into the boost venturi only","correct":false},{"id":"c","text":"Reduce the overall size of the throttle body casting","correct":false}]',
     '{"B1"}'),

    (s4_id, 'In the regulator of an injection carburettor, which chamber is ducted to boost-venturi suction?',
     '[{"id":"a","text":"Chamber A","correct":false},{"id":"b","text":"Chamber B","correct":true},{"id":"c","text":"Chamber D","correct":false}]',
     '{"B1"}'),

    (s4_id, 'With the manual mixture control lever of an injection carburettor set to "idle cut-off":',
     '[{"id":"a","text":"All fuel passages in the rotary valve are blocked and no fuel flows to the engine","correct":true},{"id":"b","text":"Only the auto-lean jet is uncovered","correct":false},{"id":"c","text":"Both the auto-lean and auto-rich jets are uncovered","correct":false}]',
     '{"B1"}'),

    (s4_id, 'Direct fuel injection, as employed on most aircraft piston engines, is typically of which type?',
     '[{"id":"a","text":"High-pressure, intermittent-flow, timed to the operating cycle like a diesel engine","correct":false},{"id":"b","text":"Low-pressure, continuous-flow, spraying fuel continuously into the inlet port of each cylinder","correct":true},{"id":"c","text":"Direct cylinder injection timed only to the compression stroke","correct":false}]',
     '{"B1"}'),

    (s4_id, 'The engine-driven fuel pump used in a typical direct fuel injection system is a:',
     '[{"id":"a","text":"Centrifugal pump driven at a fixed speed regardless of engine RPM","correct":false},{"id":"b","text":"Positive-displacement, vane-type pump, gear-driven from the crankshaft so output is proportional to engine speed","correct":true},{"id":"c","text":"Diaphragm pump driven by manifold pressure changes only","correct":false}]',
     '{"B1"}'),

    (s4_id, 'When a direct fuel injection engine is stopped, the fuel manifold valve prevents fuel flow because:',
     '[{"id":"a","text":"A spring forces its diaphragm-mounted valve down, seating it and closing all outlet ports","correct":true},{"id":"b","text":"The discharge nozzles are mechanically capped by the throttle linkage","correct":false},{"id":"c","text":"The fuel/air control unit disconnects the fuel pump drive gear","correct":false}]',
     '{"B1"}'),

    (s4_id, 'Carburettor icing occurs when restriction of airflow by the venturi and throttle valve reduces air pressure and, in accordance with which principle, also reduces air temperature?',
     '[{"id":"a","text":"Bernoulli''s Theorem","correct":false},{"id":"b","text":"Boyle''s Law","correct":true},{"id":"c","text":"Newton''s Third Law","correct":false}]',
     '{"B1"}');

END $$;
