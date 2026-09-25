-- Module 11B: Piston Aeroplane Aerodynamics, Structures and Systems (B1) —
-- Fuel Systems; Hydraulic Power Systems
-- Source: EASA Part-66 Module 11B official textbook (IKAROS Aviation Training Centre, IK M11B, Issue IK01 – OCT 2012)

DO $$
DECLARE
    m11_id INT;
    s12_id INT;
    s13_id INT;
BEGIN
    SELECT id INTO m11_id FROM easa_modules WHERE code = 'M11';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M11B.12') THEN
        RAISE NOTICE 'M11B.12-M11B.13 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module M11B.12: Fuel Systems
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m11_id, 'M11B.12', 'Fuel Systems',
        $cnt$
# Fuel Systems

## Rigid Fuel Tanks

Rigid tanks are normally made from metal or plastic material and fitted internally where space permits. Metal fuel tanks are constructed from aluminium alloy, stainless steel or tinned steel, riveted, welded or soldered together. The tank is a light structure strengthened by internal stiffeners, angle pieces and baffles — the baffles are necessary, in large tanks, to reduce the effects of fuel surge caused when the aircraft manoeuvres. A rigid tank is secured within the airframe by built-in padded cradles and padded metal straps, the cradle shaped to match the tank's contours.

**Very few aircraft over 5,700 kg use metal rigid tanks**, except when long-range tanks are fitted in the cargo hold (e.g. commercial IATA LD6 containers).

Integral fuel tanks are also of rigid construction, because they are part of the airframe structure rather than independent items.

## Flexible Fuel Tanks

Flexible fuel tanks may have thin, very flexible walls (called **bag tanks**) or thicker, less flexible material. Their flexibility allows them to be folded and inserted through a small aperture that would not admit a rigid tank of similar capacity, so a greater fuel capacity is made available for a given space. Compared with rigid tanks, flexible tanks are lighter and easier to handle and store.

When filled with fuel, a flexible tank expands to contact the walls of its compartment, so the weight of fuel is carried by the aircraft structure and not by the tank itself — flexing of the structure therefore does not impose harmful loads on the tank material. Flexible tanks are resilient, like an inner tube, and can withstand considerable distortion or shock loading; if a flexible tank is not completely full it is unlikely to burst on crash impact.

### Tank Coverings

- **Protective covering** — usually several layers of fabric, or fabric and rubber, cemented to the tank material with adhesives. A tank with a protective covering generally becomes stiff enough to support its own weight and retain its shape, though it will sag once metal fittings are added and needs support when fitted.
- **Nylon fabric/net reinforcement** (no protective cover) — does not stiffen the tank, which remains very flexible and limp and cannot support its own weight; this is the type sometimes called a **'bag tank'**.
- **Self-sealing covering** — usually layers of cellular rubber with an overall protective cover of glass fabric or nylon fabric outside. The cellular rubber is immediately affected by contact with fuel: if the tank is pierced, the rubber swells on contact with leaking fuel and forces its way into the puncture to block the hole. A drawback is that minor leaks may go undiscovered until the covering begins to swell and bulge externally.

### Attachments and Fittings

Because of the flexible nature of the tank material, each aperture used to attach fuel system components must be reinforced with a metal **attachment ring**, sometimes called a **'stud ring'** or **'bolt ring'**.

## Integral Fuel Tanks

Integral tanks use the primary wing structure itself, normally located between the front and rear wing spars and between the upper and lower wing skin. Solid **'tank end'** ribs close the ends of each tank, while the other ribs act as fuel baffles to minimise fuel slosh. A centre tank often traverses the fuselage between the two inner wing root ribs.

All fuel tanks must be fuel tight: close metal-to-metal fit of all parts forms the basic seal, completed with sealing compounds and sealing fasteners on all joints. The centre tank has a secondary external barrier coating to prevent fuel vapour entering the pressurised fuselage section. Some wing ribs contain free-swinging, fuel-actuated baffle check valves to prevent fuel flow away from the electric boost pumps. The outer portion of the wing provides fuel overflow by means of a **surge tank**, which also affords venting into the system. Each fuel tank has additional space for **2% expansion** of the fuel without spillage into the surge tank.

Large commercial aircraft generally have three tanks per wing — inner, outer and surge tank — with a centre tank sometimes available as a standard option. Aircraft manufacturers number fuel tanks from left to right, nose to tail; a few 'extended range' aircraft have an additional integral tank in the vertical stabiliser.

### Sealing Integral Tanks

Before assembly, all structural parts that become integral fuel tanks are cleaned to a particular specification, then immediately coated with a special sealant and assembled wet, with joints finished (rivets closed or bolts tightened) before the sealant sets. The sequence of sealant application is:

1. **Interfay** — the first coating of sealant, applied before assembly, which should bond with all parts of the joint.
2. **Fillet** — a neat coating applied at the edges of the joint after surplus sealant is removed, strong enough to cope with flexing between the parts.
3. **Brush-on coat** — a final coat applied to overlap the joint and fillet.

A quicker-drying **barrier coating** may also be applied over partially cured sealant to reduce contamination from swarf while work continues nearby; it is not itself a sealant and will not prevent or cure leaks.

### Water Draining and Scavenging

Water drain valves are provided at the low points of each tank; all valves may be opened with standard tools and the outer seal is replaceable without emptying the tanks. Some aircraft additionally fit a **water scavenge system** in the optional centre tank: two jet pumps, using tappings on the tank pumps for motive power, collect water from low points and discharge it towards the fuel pump inlet.

## Engine Fuel Feed — Design Requirements

Fuel systems must be designed to comply with requirements such as the following:

- Flow at a rate and pressure to ensure proper engine functioning in each likely operating condition.
- Each engine fed through a system independent of the fuel supply to any other engine.
- No pump able to draw fuel from two or more tanks simultaneously, unless air ingress is prevented.
- Fuel tank vents and transfer systems designed so that no structural failure can occur from over-filling.
- Integral tanks must have facilities for interior inspection and repair.
- Fuel tanks located and installed so that no fuel is released near the engines in quantities sufficient to start a fire in otherwise survivable crash conditions.
- A fuel strainer must be fitted at each fuel tank outlet or booster pump.
- Fuel lines must be designed, installed and supported to prevent excessive vibration and allow deformation and stretching without leakage.

### Multi-Tank Feed Arrangements

Multi-tank fuel systems can use a **low-pressure booster pump in each tank**, located in collector tanks equipped with check valves for one-way flow. Alternatively, some aircraft use groups of tanks that feed into **collector tanks**, rather than fitting booster pumps in every tank.

In a typical multi-engine 'fuel cell' arrangement, each engine is normally supplied from one pump in the centre tank or both pumps in its own wing tank; any one pump can supply the maximum demand of one engine. Two a.c.-driven booster pumps, supplied from different busbars, are fitted in each tank, each delivering fuel via a built-in non-return valve into a single pipe. Pumps in the wing tanks are fitted with pressure relief sequence valves so that, when all pumps run, the centre tank pumps deliver fuel preferentially. In each wing tank the pumps sit in a collector box fed by gravity through flap non-return valves, so the system continues supplying fuel under negative 'g' or transient manoeuvres; a bypass at the pumps permits gravity feed if the pumps fail. A **cross-feed pipe**, controlled by a double motor-actuated spherical plug valve mounted on the rear spar, allows both engines to be fed from one side, or all the fuel to be used by one engine.

## Fuel Feed Components

### Booster Pumps

Each tank is normally provided with **two identical, interchangeable fuel pumps**, installed in canister assemblies so they can be replaced without de-fuelling the tank. They are **centrifugal pumps driven by 115-volt, three-phase motors**, with an output of about **250–300 litres per minute** and a maximum fuel pressure at zero flow of about **38 p.s.i.** Each pump includes a non-return valve and a by-pass valve; the by-pass valve reduces pressure drop so the engine can be operated on suction feed up to about **6,000 feet**. Pumps are protected by a **thermal fuse, activated at approximately 175°C**.

Special features some pumps include: a pressure relief valve, a non-return valve, an AC/DC motor, thermal trip devices, and a canister shut-off valve (to allow pump replacement with fuel still in the tank).

### Jet Pumps

Jet pumps transfer fuel around the system using fuel bled from the booster pump, continually fed through a central nozzle into a venturi. The depression created in the venturi draws fuel from the surrounding tank, through a filter, up through the venturi tube, and either into the next tank or straight to the collector box.

### Sequence Valves

Sequence valves give automatic transfer from one tank to another. In a typical example (centre, inner and outer tank pumps), the sequence valve limits the fuel pressure of the outer tank pumps **from 38 psi to 17.5 psi**, giving priority to the inner tank pumps for structural reasons; once the inner tanks are empty, the engines are automatically supplied from the outer tanks, which then run continuously.

### Transfer Valves

Transfer valves enable fuel to be transferred from tank to tank, as distinct from cross-feed valves, which permit fuel to be fed from any tank to any engine. Operation of transfer valves is actuated by a signal from low-level sensors.

### L.P. Valve

The L.P. shut-off valve enables isolation of the fuel system in the event of fire or engine maintenance (e.g. engine removal). It is located at the top of the pylon on the outside of the front wing spar, controlled normally by operation of the fire handles, and activated by either a pair of electric motors or mechanically.

### Cross-Feed Valve

The cross-feed valve enables fuel to be fed to any engine from any tank. It is normally of spherical construction, with two 28 VDC electric motors mounted on a differential gearbox — one motor drives the valve at any time, the other is a back-up — and is typically fitted on the rear spar.

## Cross-Feed and Transfer

**Auto-transfer**: on a wing with lateral dihedral, fuel pumps are normally inboard and fuel flow is towards the wing root. When a wing contains more than one tank, the outboard tank automatically transfers into the inboard tank and empties first; a transfer valve between the tanks opens automatically whenever a high-level float switch in the inboard tank detects that it is not full.

**Manual transfer**: no in-flight transfer of fuel between left and right mainplanes is normally possible, for reasons of trim. However, fuel can be fed from any tank to any engine by boost pump selection and opening a cross-feed valve from the flight deck.

## Indications and Warnings

Provision is made on the flight deck overhead panel to display fuel tank quantity, boost pump low pressure, and crossfeed/fuel-fire shut-off valve position. Aural and visual warnings on the glare shield alert the crew if the fuel system develops a fault.

## Fuel Level Sensing

Modern aircraft use **thermistors** to send signals for warnings and sequencing; older aircraft may use **float switches**. Float-operated switches are of a magnetic type, isolating the electrical mechanism from the fuel tank for safety: upward movement of the float brings the armature closer to the magnet until, at a predetermined level, it attracts the magnet and operates a micro switch; as fuel level falls, the combined forces of a counterweight and the micro switch spring overcome the magnetic attraction and change the circuit.

Float switches or thermistors provide five functions:

1. **High level sensing** — prevents overfilling: closes the associated refuel/defuel valve and illuminates a blue FULL light.
2. **Overflow sensing** — if high-level shut-off fails, fuel enters the adjacent vent tank and washes around the overflow sensor, shown by an amber FULL light.
3. **Low level sensing** — divided into outer tank and inner/centre tank low-level sensing; an exposed outer tank LO LVL sensor illuminates an amber LO LVL light.
4. **Under full level sensing** — when fuel quantity in either outer tank drops below a certain level, maximum flight speed (VMO) is reduced to protect the wing structure; the signal is sent to the Air Data Computer (ADC).
5. **Calibration sensing** (fuel trim tanks only) — gives a signal at a predetermined filling level for accuracy testing of the fuel quantity indication during refuelling.

## Fuel Quantity Measurement and Indication

The fuel quantity system measures fuel in the tanks; indicates it on the fuel quantity indicator, pre-selector and ECAM/EFIS displays; controls automatic refuelling; and messages fuel quantity to the flight management computer.

### Principle of Capacitance Gauging

A capacitor stores electrical charge, the amount depending on three physical properties: the surface area of the plates, the size of the gap between them, and the insulating material (**dielectric**) between them. In a fuel tank 'capacitor stack', the plate area and gap are fixed — the only variable is the dielectric, which is either fuel, air, or both. When the tank is full, the charge held is a pre-set value; as fuel level falls, the dielectric gradually changes to air and the stored charge reduces. This change in capacitance is sensed by a signal conditioner to determine fuel level.

### Fuel Quantity Indicating System

Each tank has a group of probes arranged so at least one probe is immersed at all times; the number varies by aircraft. Probe signals are sent, via a summing adapter on the wing rear spar, to the **fuel quantity computer**, which also receives:

- **Capacitance index compensator** signals — one compensator per tank, at the lowest probe, senses different fuel types and additives to correct readings.
- **Condensicon sensor** signals — senses fuel density and dielectric constant while refuelling.
- **Attitude sensor** signals — senses aircraft attitude to the roll axis (longitudinal) and pitch axis (lateral), on the ground and in flight.
- **THS position detector** signals — corrects trim tank fuel measurement for stabiliser position.

The fuel quantity of the tanks is normally displayed in **10 kg steps**; the indicator sends feedback signals to the computer to avoid transmission errors and is also used for test purposes.

## Refuelling and Defuelling

As any liquid flows through a pipeline it produces **static electricity**, which — if discharged in the presence of fuel vapour — could cause an explosion. Safety precautions during refuelling include:

- Use the correct grade of fuel (Av-gas, Av-tur, Av-tag).
- No smoking within **15 m**.
- No metal-studded or metal-tipped footwear.
- Correct bonding of aircraft and bowser, and correct positioning of the bowser.
- No vehicles or ground equipment under the aircraft; maintenance activity kept to a minimum.
- No replenishment of LOX; no transmitting of radar.
- Aircraft and bowser not left unattended; check and remedy fuel spillage or leakage.
- An appropriate fire appliance readily available.
- The electrical state of the aircraft must not change while connected to the bowser.

On small aircraft, refuelling may require stopping short of full tanks to remain within weight limits with a full passenger/baggage load. On aircraft with multiple tanks per wing, filling order matters — e.g. inner tanks filled first to reduce bending load on the wing spars — and larger aircraft with fin, tailplane or rear-fuselage tanks must also be refuelled in the correct longitudinal order to maintain stability.

### Pressure Refuelling

Fuel flows from refuel adapters into the refuel/jettison manifold; when refuel valves open, fuel flows from the manifold into the tanks through a flow tube that reduces the exit force and distributes fuel within the tank. As each tank reaches full, its high-level sensor signals the refuel valve to close. Remaining fuel in the manifold drains, through manifold drain valves, into the main tanks; two vacuum relief valves admit air to the manifold as this fuel drains. If a refuel system failure prevents the refuel valves closing, fuel enters the surge tanks; if it reaches the surge tank float switches, the switch closes and all refuel valves shut.

### Defuelling

Defuelling a pressure-type fuel system is almost the reverse of refuelling: a de-fuel bowser is connected to the single fuel point coupling, and using a combination of the bowser's suction pump and the aircraft's own booster pumps, the contents of selected tanks are returned to the bowser.
        $cnt$,
        12
    ) RETURNING id INTO s12_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module M11B.13: Hydraulic Power Systems
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m11_id, 'M11B.13', 'Hydraulic Power Systems',
        $cnt2$
# Hydraulic Power Systems

## Advantages of Hydraulic Actuation

Hydraulic actuation offers several advantages over conventional mechanical and electrical systems:

- Provision of smooth and steady movement.
- Hydraulic power is confined to pipelines and components, without requiring widespread structural strengthening.
- Simpler installation than mechanical power transmission systems.
- Variations in speed and power output without complex, heavy gearboxes.
- Power can be provided from many separate sources, for normal and emergency operation.

Hydraulic actuation also offers an advantage over gaseous (pneumatic) systems, since hydraulic fluid offers high resistance to compression.

## Pressure and Force

**Pressure is force per unit area** — the total load acting on a surface, divided by the area on which it acts. The SI unit for force is the Newton (N) and for area the square millimetre (mm²), but aircraft commonly use pounds per square inch (lb/in²), kilograms per square centimetre (kg/cm²) or the bar (**1 bar = 14.5 psi**). A force of 1 pound applied to an area of 1 square inch produces a pressure of 1 lb/in²; a force of 4 pounds applied to 4 square inches produces the same 1 lb/in² pressure.

### Bramah's Press and Mechanical Advantage

Joseph Bramah demonstrated the principle of differential areas. With two equal pistons of 2 square inches each, a force of 20 pounds applied to each keeps them balanced, generating a pressure of 20 ÷ 2 = **10 lb/in²**. If one piston (1 in²) is made smaller than the other (2 in²), a force of 10 pounds on the small piston generates 10 lb/in², which — applied to the larger piston — produces a force of 20 pounds (2 × 10). This principle allows a relatively small pump to supply pressure used to move large loads, and lets different actuators produce different forces from the same system pressure by varying piston areas. Because an actuator piston with a ram on one side only produces differential forces in each direction, a ram is fitted on each side of the piston where equal force is required in both directions.

### Compressibility

Hydraulic oil subjected to 5,000 psi compresses by about **1%**, depending on oil type, whereas air subjected to the same pressure compresses to about **1/300 of its original volume**. Normal aircraft hydraulic working pressures are below this value, so compression is very slight and can generally be disregarded.

### Pascal's Law and Bernoulli's Theorem

**Pascal's Law**: pressure in an enclosed container is transmitted equally and undiminished to all parts of the container, and acts at 90° to all confining surfaces. A pressure exerted on a fluid in a pipeline is therefore felt at the other end at the same value, regardless of pipe length — but this applies to static conditions with no flow.

**Bernoulli's principle**: in fluid flows, the sum of kinetic and pressure energy remains constant. So if kinetic energy (due to movement) increases, pressure energy must decrease. Pumps provide **flow**, not pressure — it is the resistance to that flow that causes pressure to rise. In practice, aircraft hydraulic pumps are efficient and supply flow in excess of that required, so the pressure drop due to fluid movement is very small.

## Hydraulic Fluids

### Properties of an Ideal Fluid

An ideal hydraulic fluid should be incompressible; have reasonable density with little variation due to temperature; have viscosity with a low rate of change with temperature; have a large working temperature range; provide good lubrication; present no significant health hazard; have a flash point above 100°C (preferably non-flammable); not foam; be chemically stable; not harm (or be harmed by) system materials; and have a good storage life. No single fluid provides all of these properties.

### Types of Fluid

| Fluid | Base / Colour | Key characteristics |
|-------|----------------|----------------------|
| **DTD 900/4081** | Natural castor-based oil, golden yellow to brown | Used with natural rubber seals; flammable; strips paint; attacks synthetic rubber; toxic in a fine spray mist |
| **Aeroshell 41 / Mil-H-5606 / Def Stan 91-48** | Mineral-based oil, red | Used with synthetic rubber seals; flammable; attacks natural rubber; density and lubricating properties vary with temperature |
| **Skydrol 500B / Mil-H-8446** | Synthetic phosphate-ester, purple | Fire resistant; strips paint; attacks both natural and synthetic rubber; slightly heavier than water; broad operating temperature range; seals made from Butyl, Ethylene, Propylene or Teflon; absorbs moisture from the atmosphere |
| **Skydrol 500B-4** | Improved Skydrol | Same properties as 500B, with more resistance to wear and erosion of orifices and valve lands |
| **Skydrol LD-4** | Low-density Skydrol | Weight saving of approximately 5% on a volume basis compared to other Skydrol types |

### Fluid Compatibility

Hydraulic fluids may not be mixed, even those of the same base type. The manufacturer specifies the only permissible fluid for a given aircraft or system in the maintenance manuals. If cross-contamination occurs, the whole system must be drained and flushed before further operation.

### Aeration of Fluids

Gases are more easily compressed than liquids, so a gas present in hydraulic oil will compress under pressure and seriously affect system operation; small high-velocity gas bubbles also accelerate wear on components, acting like 'gas bullets' (a sand-blasting effect). Gas may be present as **free bubbles** (from un-bled components) or as **gas in solution** with the oil. Gas in solution is relatively harmless until it comes out of solution to form free bubbles — this can be caused by a negative pressure in the oil, such as a pump sucking oil from the reservoir causing a pressure drop, and is known as **cavitation**.

## Basic Hydraulic System

A basic hydraulic system consists of the following components:

- **Actuator** (hydraulic jack) — provides the output force to operate aircraft services; consists of a piston, acted on by hydraulic pressure, secured to a rod (ram) that imparts the force.
- **Selector** — provides control of the system, manually or electrically operated from the cockpit. The terms 'pressure' and 'return' apply only to pipelines up to the selector; pipelines from the selector to the actuator are named by purpose (UP, DOWN, RETRACT, EXTEND, etc.).
- **Pump** — provides a flow of oil to the system (not pressure — resistance to that flow causes pressure to rise).
- **Reservoir** — receives, stores and supplies fluid to and from the system, maintaining a surplus so the system can still operate in the event of a leak, and storing fluid displaced because the actuator holds less fluid when retracted than when fully extended.
- **Pipelines** — direct fluid to the appropriate components, referred to by the nature of their flow (RETURN, PRESSURE, EXTEND, RETRACT, etc.).

**Operation**: with the selector at extend, fluid from the pump flows into the rear of the cylinder, producing enough pressure to overcome friction and any load, moving the piston and ram to the fully extended position while fluid from the other end of the cylinder returns to the reservoir. Moving the selector to retract reverses the flow; because less fluid is needed to fill the ram side of the piston, the excess is temporarily stored in the reservoir.

## Storage and Pressure Generation

### Reservoirs

Simple (non-pressurised) reservoirs must be mounted above the pump to give a positive head of pressure; during manoeuvres such as banking at high angles, the reservoir may effectively be below the pump, causing a temporary pressure loss known as **pump stagnation**, which may also starve the pump of lubrication and cooling. Other problems with simple reservoirs include: aeration of the oil during rapid or high-angle manoeuvres (oil and the reservoir's air space mixing); cavitation caused by pump suction producing negative pressure in the supply line; and a lowering of the fluid's boiling point at high altitude (as pressure on a liquid decreases, its boiling point falls), which — if the fluid boiled — would release dissolved gas.

**Pressurised reservoirs** overcome these problems by maintaining a positive pressure on the fluid, and typically use a direct-reading gauge (reproduced at the flight deck) rather than a sight glass. Four methods are used to pressurise reservoirs:

1. **Aspirator** — uses the flow of fluid in the return pipeline to draw in air that pressurises the reservoir; no piston separates air from oil, so aeration remains possible. A pressure regulator prevents over-pressurisation; mainly found on older aircraft.
2. **Permanent gas charge** — usually uses a piston to separate oil and gas (normally nitrogen), preventing aeration. A gas charging valve and gauge are on the gas end, a contents gauge on the other; oil level is checked first, then gas pressure is checked against a graph for the given oil level.
3. **Compressor bleed air** — pressurises the reservoir with air drawn from the engine compressor bleed via the pneumatic system, with a pressure regulator maintaining reservoir pressurisation of about **40–45 lb/in²**; a charge point allows ground pressurisation without engines running.
4. **Hydraulic system pressure** — uses differential areas: a large piston on top of the oil is connected by a ram to a small piston acted on by system pressure. Example: a small piston of 1 in² acted on by 3,000 lb/in² system pressure produces a force of 3,000 pounds on the ram; with a large piston area of 35 in², the stored fluid pressure is 3,000 ÷ 35 ≈ **85 lb/in²**.

### Hydraulic Pumps

The pump does not deliver pressure — pressure is created only when an attempt is made to compress the fluid (e.g. by the resistance of an actuator). A **hand pump** provides slow delivery and is normally used for emergency operation and ground testing; an engine-driven pump is fitted for main system operation. Hand pumps are usually of double-acting type, delivering fluid on each stroke via inlet, outlet and transfer non-return valves (NRVs).

**Fixed volume (constant displacement) pumps** deliver a fixed quantity of fluid per revolution regardless of system demand, so a means of diverting unwanted output must be provided:

- **Spur gear pump** — two meshing gears in a closely fitted housing; fluid is drawn in on the inlet side between the teeth and housing, carried around, and forced out as the teeth mesh on the discharge side. A weak relief valve maintains a 'case' pressure of about **5 psi** around the shafts, so that if a seal is scored, fluid is forced out rather than air being drawn in.
- **Gerotor pump** — a combination internal/external gear pump; an inner spur drive gear (e.g. six teeth) rotates an outer internal gear, with the expanding cavity under the inlet port drawing in fluid and the contracting cavity under the outlet port expelling it.
- **Radial piston pump** — cylinders arranged radially around an eccentric crankshaft; each piston moves up and down once per revolution, drawing in fluid at the bottom of its stroke and forcing it out, past a delivery valve, at the top.
- **Axial piston (bent axis) pump** — a fixed-volume multi-piston pump; the cylinder block and drive shaft rotate together at an angle to each other, so each piston moves in and out of its cylinder once per revolution, drawing fluid in on the outward stroke and expelling it on the inward stroke.

A **variable volume pump** is similar to the axial piston pump but with a co-axial cylinder block and drive shaft; pistons attached to shoes rotate against a stationary yoke, and the yoke angle is varied to change pump stroke. At low system pressure, spring pressure turns the yoke to maximum angle for full-stroke, maximum output; as pressure builds after a service completes its stroke, the control piston moves the yoke toward minimum stroke, maintaining only a small flow for lubrication, leakage compensation and heat dissipation. Some pumps can be **'off-loaded'** (e.g. during engine start) via a solenoid-operated valve that reduces swash-plate angle or bypasses pump output back to the return line.

### Filters

Hydraulic fluid cleanliness is critical, since solid particle contamination can damage components. Filtering capability is measured in **microns** (one millionth of a metre, approximately one twenty-five-thousandth of an inch); adequate filtering normally removes contamination greater than about **10 microns**. Low-pressure filter elements (supply and return lines) are typically paper, glass fibre cloth or fine metallic mesh; high-pressure elements are usually sintered metal, very fine metallic mesh or wire-wound type.

A **differential pressure (clogging) indicator** uses two magnetically coupled pistons separated by a metal diaphragm; as differential pressure across the filter element rises, the inner piston moves away from the diaphragm until spring force on the outer piston overcomes magnetic attraction, popping out a red indicator button (manually reset). A **bypass facility** is fitted to all filters so that, if blocked, fluid can still flow (unfiltered) to maintain system operation; additional filters are therefore fitted upstream of sensitive components such as selectors and powered flying controls.

A **two-stage filter**, used on some large aircraft, allows a very fine element for low flow rates without excessive pressure drop at high flow rates: the first stage is rated between **0.4 and 3 microns**, the second between **1.5 and 15 microns**. During normal cruise (typically less than **5 gallons per minute**), flow passes through both stages; when flow rates rise (e.g. landing gear/flap operation), a flow divider allows excess flow to bypass the first stage and pass through the coarser second stage only, limiting the pressure differential.

### Accumulators

Accumulators store hydraulic pressure by using the compressibility of a gas (usually **nitrogen**) to compensate for the near-incompressibility of hydraulic fluid; a moving separator (piston, diaphragm or bladder) isolates the oil from the gas. With zero hydraulic pressure, the accumulator is pre-charged with gas to a predetermined pressure, usually about **half the normal system pressure**. Reasons for fitting an accumulator include: smoothing operation where an automatic cut-out valve is used with the pump; storing pressure for emergency operation of systems; providing initial impetus to a system before the pump responds; and damping pump pulsations to prevent fatigue damage to pipelines and structure. The **separator piston** type is the most common; diaphragm and bladder types require regular inspection for damage.

Gas charging valves are typically one of three types: the **AN 812** (a high-pressure valve core similar to a tyre valve, identified by an 'H' on the stem), the **AN 6287-1** (charged and sealed via a swivel nut providing a metal-to-metal seal), and the **MS 28889** (similar to the AN 6287-1 but with no valve core).

### Actuators and Motors

An actuator transforms fluid flow into linear or rotary motion:

- **Single acting actuator** — normally used as a locking device, engaged by spring pressure and released by hydraulic pressure (e.g. a landing gear up-lock).
- **Double acting actuator** — used in most aircraft systems; because of the piston rod, the top piston area is greater than the underside area, so more force is available during extension — the operation offering greater resistance (e.g. raising the landing gear) is therefore carried out in the extending direction.
- **Balanced actuator** — equal force can be applied to both sides of the piston, used for applications such as nose-wheel steering and flying control boost systems.

**Hydraulic motors** drive emergency hydraulic pumps, fuel proportioners, flap drives, etc. They operate on the wedge principle: pistons mounted in a fixed cylinder block bear on a swash plate assembly (via a ball bearing to reduce friction), and as each piston is forced from its cylinder by fluid pressure, its movement causes the swash plate — and the output shaft — to rotate; wasted, spring-loaded piston valves, operated by an eccentric driving ring, control fluid flow to and from each cylinder in turn. A flow (throttling) control valve regulates motor speed.

## Pressure Control

### Automatic Cut-Out Valve

Where a fixed-volume pump has no self-idling ability, a **cut-out valve** relieves excess flow and pressure to avoid over-pressurisation, and provides an idling circuit once a predetermined system pressure is reached. It is preferable to a simple pressure relief valve, since it directs fluid back to the reservoir at nil or low pressure rather than merely relieving pressure. An **accumulator is essential** wherever a cut-out valve is fitted, since slight leakage would otherwise cause frequent, wasteful loading and unloading of the pump. The **cut-out pressure is always greater than the cut-in pressure**, because raising the piston requires overcoming both the spring and the force of fluid pressure on top of the poppet valve.

### Pressure Relief Valve

A simple ball- or cone-type valve, held on a seat by an adjustable spring; once pressure exceeds the set value, the valve opens and relieves excess pressure to the return line. Valve size depends on position in the system — a hand pump circuit valve need only release small amounts, while one fitted after an engine-driven pump must relieve excess pressure at full system flow. Relief valves may also be fitted in user systems — e.g. in the flap DOWN line, to allow flaps to **blow back** and avoid airframe overstress if speed increases with flaps extended.

### Thermal Relief Valve

Fitted where no other pressure relief exists, thermal relief valves release small quantities of fluid to maintain pressure when fluid trapped in a neutral-selector circuit expands as it heats. According to the Lee hydraulic handbook, 100 cubic inches of fluid at 0 lb/in² and 70°F, heated to 120°F, will rise in pressure to about **6,900 lb/in²** — equivalent to adding 2.3 cubic inches of fluid to the same volume — so about 2.3 cubic inches must be released to maintain the original pressure. Because only small quantities need to be released, thermal relief valves are fitted with a restrictor to prevent major pressure loss should the valve jam open.

### Pressure Reducing Valve

Used where operating pressure itself must be reduced (rather than force, via a smaller actuator area) — for example, main wheel brakes, where full system pressure is neither desirable nor practicable. The valve has three ports (pressure inlet, reduced-pressure/signal, and return) and a spring-loaded moving valve stem; excess pressure at the reduced-pressure port moves the stem against the spring, closing off the inlet and opening the return line, so the valve balances inlet and return flow to maintain the reduced pressure. It also performs the role of a relief valve if the operating system pressure rises.

## Instrumentation and Indication

Large aeroplane hydraulic systems generally monitor and indicate **fluid quantity, pressure and temperature**; indicators and controls are grouped on a flight deck panel, with urgent warnings repeated on the master warning panel.

- **Quantity indicators** — older aircraft may use a transparent window/tube on the reservoir; more modern (often pressurised) reservoirs use a float switch or rheostat feeding a gauge, sometimes duplicated on the flight deck and at the reservoir/ground servicing panel, with a low-level warning light.
- **Temperature indicators** — sensors (bi-metallic strip, resistive bulb or thermistor) are normally fitted to reservoirs, usually giving an overheat warning light rather than a gauge; similar sensors monitor electric motor casings driving hydraulic pumps.
- **Pressure indicators** — direct-reading (bourdon tube) gauges require pressure relay valves to prevent fluid loss if a gauge pipeline leaks; electrically signalled systems use a bourdon-tube pressure transmitter connected to a variable resistor, sending a voltage proportional to pressure to a moving-coil gauge.
- **Pressure switches** — illuminate warning lamps for low system pressure, or to indicate a pump is providing pressure above a set value.
- **Other indications** on modern large aeroplanes include wheel brake accumulator pressure, engine-driven pump isolation cock position, reservoir pressurisation system status, power transfer unit status, and ram air turbine status.

### Glass Cockpit Displays

Modern large aeroplanes use screen-based **glass cockpit** technology (e.g. Boeing's **EICAS** — Engine Indication and Crew Alerting System) instead of many traditional analogue instruments and warning lights, using CRT, flat screen or LCD displays in colour to distinguish Warning, Caution and Advisory messages alongside system performance data, and providing a maintenance mode for engineering diagnostic use. Dual EICAS computers process information from monitored systems and flight crew/maintenance panel inputs; warnings and alerts are displayed automatically, with the flight crew alerted by a master caution light (possibly with an audible alarm) at each crew position.
        $cnt2$,
        13
    ) RETURNING id INTO s13_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M11B.12 Fuel Systems (17 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s12_id, 'Very few aircraft over what weight would utilise metal rigid fuel tanks, except when long-range tanks are fitted in the cargo hold?',
     '[{"id":"a","text":"5,700 kg","correct":true},{"id":"b","text":"1,000 kg","correct":false},{"id":"c","text":"50,000 kg","correct":false}]',
     '{"B1"}'),

    (s12_id, 'What is the very flexible, limp type of flexible fuel tank called, which is reinforced by nylon fabric or net but cannot support its own weight?',
     '[{"id":"a","text":"An integral tank","correct":false},{"id":"b","text":"A bag tank","correct":true},{"id":"c","text":"A surge tank","correct":false}]',
     '{"B1"}'),

    (s12_id, 'A self-sealing fuel tank covering works by:',
     '[{"id":"a","text":"Cellular rubber swelling on contact with leaking fuel and forcing itself into the puncture","correct":true},{"id":"b","text":"An electric solenoid closing a valve automatically at the puncture point","correct":false},{"id":"c","text":"A secondary metal skin bonded permanently over the whole tank","correct":false}]',
     '{"B1"}'),

    (s12_id, 'On a flexible fuel tank, the metal ring used to reinforce and strengthen an aperture before a system component is fitted is called an attachment ring, also known as a:',
     '[{"id":"a","text":"Stud ring or bolt ring","correct":true},{"id":"b","text":"Cradle ring","correct":false},{"id":"c","text":"Baffle ring","correct":false}]',
     '{"B1"}'),

    (s12_id, 'In an integral wing fuel tank, ribs other than the solid tank-end ribs mainly serve to:',
     '[{"id":"a","text":"Act as fuel baffles to minimise fuel slosh","correct":true},{"id":"b","text":"Provide the fuel-tight seal at the tank ends","correct":false},{"id":"c","text":"House the capacitance probes only","correct":false}]',
     '{"B1"}'),

    (s12_id, 'Each integral fuel tank is designed with additional space to allow for fuel expansion without spillage into the surge tank, equal to approximately:',
     '[{"id":"a","text":"2%","correct":true},{"id":"b","text":"20%","correct":false},{"id":"c","text":"0.2%","correct":false}]',
     '{"B1"}'),

    (s12_id, 'When sealing an integral fuel tank joint, what is the name given to the first coat of sealant applied to the parts before they are assembled wet?',
     '[{"id":"a","text":"The fillet","correct":false},{"id":"b","text":"The interfay","correct":true},{"id":"c","text":"The barrier coat","correct":false}]',
     '{"B1"}'),

    (s12_id, 'According to the design requirements for a fuel feed system, each engine must be fed through a system that is:',
     '[{"id":"a","text":"Independent of the system supplying fuel to any other engine","correct":true},{"id":"b","text":"Shared equally at all times with every other engine on the aircraft","correct":false},{"id":"c","text":"Directly connected to the auxiliary power unit fuel line","correct":false}]',
     '{"B1"}'),

    (s12_id, 'Aircraft booster (fuel) pumps described in this module are typically:',
     '[{"id":"a","text":"Centrifugal pumps driven by 115-volt, three-phase motors","correct":true},{"id":"b","text":"Hand-operated diaphragm pumps only","correct":false},{"id":"c","text":"Gerotor pumps driven by the accessory gearbox","correct":false}]',
     '{"B1"}'),

    (s12_id, 'The by-pass valve fitted to a booster pump reduces pressure drop so that an engine can be operated on suction feed up to approximately:',
     '[{"id":"a","text":"6,000 feet","correct":true},{"id":"b","text":"600 feet","correct":false},{"id":"c","text":"60,000 feet","correct":false}]',
     '{"B1"}'),

    (s12_id, 'A booster pump''s thermal fuse is designed to activate at approximately:',
     '[{"id":"a","text":"175°C","correct":true},{"id":"b","text":"75°C","correct":false},{"id":"c","text":"375°C","correct":false}]',
     '{"B1"}'),

    (s12_id, 'A jet pump transfers fuel by:',
     '[{"id":"a","text":"Using fuel bled from a booster pump, fed through a nozzle into a venturi, whose depression draws in surrounding fuel","correct":true},{"id":"b","text":"Using an electric impeller mounted directly in the collector box","correct":false},{"id":"c","text":"Gravity feed alone, assisted by a float valve","correct":false}]',
     '{"B1"}'),

    (s12_id, 'In a typical sequence valve arrangement, the pressure of the outer tank pumps is limited from 38 psi down to approximately:',
     '[{"id":"a","text":"17.5 psi","correct":true},{"id":"b","text":"5 psi","correct":false},{"id":"c","text":"30 psi","correct":false}]',
     '{"B1"}'),

    (s12_id, 'What is the essential difference between a cross-feed valve and a transfer valve?',
     '[{"id":"a","text":"A cross-feed valve feeds fuel from any tank to any engine, while a transfer valve moves fuel from tank to tank","correct":true},{"id":"b","text":"A cross-feed valve is manual only, while a transfer valve is always automatic","correct":false},{"id":"c","text":"There is no functional difference; the names are interchangeable","correct":false}]',
     '{"B1"}'),

    (s12_id, 'In the principle of capacitance fuel gauging, which property of the fuel tank capacitor varies as fuel level changes?',
     '[{"id":"a","text":"The dielectric between the plates, changing from fuel to air as the level falls","correct":true},{"id":"b","text":"The surface area of the plates, which physically shrinks as fuel is used","correct":false},{"id":"c","text":"The gap between the plates, which widens as fuel is used","correct":false}]',
     '{"B1"}'),

    (s12_id, 'The fuel quantity of the tanks on the example system described is normally displayed in steps of:',
     '[{"id":"a","text":"10 kg","correct":true},{"id":"b","text":"1 kg","correct":false},{"id":"c","text":"100 kg","correct":false}]',
     '{"B1"}'),

    (s12_id, 'During refuelling, what minimum no-smoking distance from the aircraft is specified as a safety precaution?',
     '[{"id":"a","text":"15 m","correct":true},{"id":"b","text":"1.5 m","correct":false},{"id":"c","text":"50 m","correct":false}]',
     '{"B1"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M11B.13 Hydraulic Power Systems (19 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s13_id, 'Which of the following is listed as an advantage of hydraulic actuation over mechanical and electrical systems?',
     '[{"id":"a","text":"It provides smooth and steady movement without requiring widespread structural strengthening","correct":true},{"id":"b","text":"It always weighs less than an equivalent mechanical system regardless of pipe run length","correct":false},{"id":"c","text":"It eliminates the need for any pressure control components","correct":false}]',
     '{"B1"}'),

    (s13_id, 'Pressure is defined as:',
     '[{"id":"a","text":"Force per unit area","correct":true},{"id":"b","text":"Area per unit force","correct":false},{"id":"c","text":"Force multiplied by velocity","correct":false}]',
     '{"B1"}'),

    (s13_id, 'One bar is equal to approximately:',
     '[{"id":"a","text":"14.5 psi","correct":true},{"id":"b","text":"1.45 psi","correct":false},{"id":"c","text":"145 psi","correct":false}]',
     '{"B1"}'),

    (s13_id, 'In Bramah''s Press, if a force of 10 pounds is applied to a 1 in² piston, and this pressure acts on a second piston of 2 in², what force is produced on the larger piston?',
     '[{"id":"a","text":"5 pounds","correct":false},{"id":"b","text":"20 pounds","correct":true},{"id":"c","text":"10 pounds","correct":false}]',
     '{"B1"}'),

    (s13_id, 'When subjected to a pressure of 5,000 psi, hydraulic oil will typically compress by about:',
     '[{"id":"a","text":"1%","correct":true},{"id":"b","text":"10%","correct":false},{"id":"c","text":"50%","correct":false}]',
     '{"B1"}'),

    (s13_id, 'Pascal''s Law states that pressure in an enclosed container is:',
     '[{"id":"a","text":"Transmitted equally and undiminished to all parts of the container, acting at 90° to all confining surfaces","correct":true},{"id":"b","text":"Concentrated only at the point where the force is first applied","correct":false},{"id":"c","text":"Proportional to the length of pipe between the pump and the actuator","correct":false}]',
     '{"B1"}'),

    (s13_id, 'According to the text, a hydraulic pump primarily provides:',
     '[{"id":"a","text":"Flow — pressure is created by the resistance to that flow","correct":true},{"id":"b","text":"Pressure directly, independent of any flow or resistance","correct":false},{"id":"c","text":"Both flow and pressure in exactly equal, fixed proportions","correct":false}]',
     '{"B1"}'),

    (s13_id, 'Which hydraulic fluid type described is a mineral-based oil, red in colour, used with synthetic rubber seals?',
     '[{"id":"a","text":"DTD 900/4081","correct":false},{"id":"b","text":"Aeroshell 41 / Mil-H-5606 / Def Stan 91-48","correct":true},{"id":"c","text":"Skydrol 500B","correct":false}]',
     '{"B1"}'),

    (s13_id, 'Skydrol 500B is a synthetic, phosphate-ester based fluid whose major advantage is that it is:',
     '[{"id":"a","text":"Fire resistant","correct":true},{"id":"b","text":"Compatible with natural rubber seals","correct":false},{"id":"c","text":"The lightest hydraulic fluid available","correct":false}]',
     '{"B1"}'),

    (s13_id, 'If cross-contamination between two different hydraulic fluid types occurs in a system, the correct action is to:',
     '[{"id":"a","text":"Drain and flush the whole system before further operation","correct":true},{"id":"b","text":"Simply top off the reservoir with the correct fluid type","correct":false},{"id":"c","text":"Continue operation, since all aviation hydraulic fluids are mutually compatible","correct":false}]',
     '{"B1"}'),

    (s13_id, 'Cavitation in a hydraulic system is best described as:',
     '[{"id":"a","text":"Dissolved gas coming out of solution to form free bubbles, often due to a negative pressure at the pump inlet","correct":true},{"id":"b","text":"The normal, harmless compression of hydraulic fluid under working pressure","correct":false},{"id":"c","text":"A build-up of solid particle contamination on a filter element","correct":false}]',
     '{"B1"}'),

    (s13_id, 'In a basic hydraulic system, the terms ''pressure'' and ''return'' strictly apply only to the pipelines:',
     '[{"id":"a","text":"Up to the selector","correct":true},{"id":"b","text":"From the selector to the actuator","correct":false},{"id":"c","text":"Inside the reservoir only","correct":false}]',
     '{"B1"}'),

    (s13_id, 'A pressurised hydraulic reservoir is used mainly to overcome problems such as pump stagnation, aeration, cavitation and:',
     '[{"id":"a","text":"A lowering of the fluid''s boiling point at high altitude","correct":true},{"id":"b","text":"Excessive fluid viscosity at high altitude","correct":false},{"id":"c","text":"An increase in fluid density at low temperature","correct":false}]',
     '{"B1"}'),

    (s13_id, 'A reservoir pressurised by engine compressor bleed air typically maintains a reservoir pressurisation of about:',
     '[{"id":"a","text":"40-45 lb/in²","correct":true},{"id":"b","text":"4-5 lb/in²","correct":false},{"id":"c","text":"400-450 lb/in²","correct":false}]',
     '{"B1"}'),

    (s13_id, 'A hydraulic system pressurised reservoir uses a small piston of 1 in² acted on by 3,000 lb/in² system pressure, connected by a ram to a large piston of 35 in². What is the approximate resulting pressure on the stored fluid?',
     '[{"id":"a","text":"85 lb/in²","correct":true},{"id":"b","text":"3,000 lb/in²","correct":false},{"id":"c","text":"105,000 lb/in²","correct":false}]',
     '{"B1"}'),

    (s13_id, 'Which type of fixed-volume hydraulic pump uses two meshing gears closely fitted into a housing, with fluid trapped between the teeth and housing and carried from inlet to discharge side?',
     '[{"id":"a","text":"Spur gear pump","correct":true},{"id":"b","text":"Variable volume pump","correct":false},{"id":"c","text":"Radial piston pump","correct":false}]',
     '{"B1"}'),

    (s13_id, 'Adequate hydraulic system filtering normally requires removal of all contamination greater than approximately:',
     '[{"id":"a","text":"10 microns","correct":true},{"id":"b","text":"1,000 microns","correct":false},{"id":"c","text":"0.1 microns","correct":false}]',
     '{"B1"}'),

    (s13_id, 'An accumulator is pre-charged with gas, usually to a pressure of:',
     '[{"id":"a","text":"About half the normal system pressure","correct":true},{"id":"b","text":"Exactly equal to the normal system pressure","correct":false},{"id":"c","text":"A fixed 15 psi regardless of system pressure","correct":false}]',
     '{"B1"}'),

    (s13_id, 'Why must an accumulator be fitted whenever an automatic cut-out valve is used?',
     '[{"id":"a","text":"Without one, slight system leakage would cause frequent, wasteful loading and unloading of the pump","correct":true},{"id":"b","text":"The cut-out valve cannot physically function without an accumulator connected to its spring chamber","correct":false},{"id":"c","text":"It is only a cosmetic requirement with no functional purpose","correct":false}]',
     '{"B1"}');

END $$;
