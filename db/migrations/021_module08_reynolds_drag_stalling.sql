-- Module 08: Basic Aerodynamics — Reynolds' Number, Lift, Aerofoils, Drag, Stalling
-- Source: IKAROS Aviation Training Center, IK M8 Basic Aerodynamics (B1/B2 Common), Issue Oct.2012

DO $$
DECLARE
    m08_id INT;
    s5_id  INT;
    s6_id  INT;
    s7_id  INT;
    s8_id  INT;
    s9_id  INT;
BEGIN
    SELECT id INTO m08_id FROM easa_modules WHERE code = 'M08';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M08.5') THEN
        RAISE NOTICE 'M08.5-M08.9 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 08.5: Reynolds' Number
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m08_id, 'M08.5', 'Reynolds'' Number',
        $cnt$
# Reynolds' Number

## Introduction

In the early days of flying, when aircraft speeds were of the order of 30–40 mph, testing an aerofoil shape was a relatively simple matter. As speeds increased and aircraft design became more sophisticated, wind tunnels were developed to test scale models instead of full-size aircraft. This introduced a new problem: **dynamic similarity** — making sure the airflow pattern around a small model genuinely represents the airflow around the full-size aircraft.

## The Problem of Scale

If a 1/10 scale model of an aircraft is built:

- All **linear dimensions** are 1/10 of the real aircraft
- All **areas** are 1/100 of the real aircraft (1/10 × 1/10)
- If built from the same materials, the **mass** is 1/1000 of the real aircraft (1/10 × 1/10 × 1/10)

The model is "to scale" in some respects but badly out of scale in others. This is one of the reasons free-flying scale models can give misleading results in manoeuvring and spinning trials unless the model's weight distribution is very carefully adjusted.

## Reynolds' Discovery — Fluid Flow

During the 19th century, the physicist Osborne Reynolds experimented with fluid flow through pipes. He discovered that flow changes from **streamlined (laminar)** to **turbulent** at a critical velocity that is **inversely proportional to the diameter of the pipe**:

- The **larger** the pipe, the **lower** the velocity needed to trigger turbulence.
- Example: if the critical velocity in a 20 mm diameter pipe is 20 m/s, the critical velocity in a 40 mm diameter pipe is only 10 m/s.

Reynolds showed the same rule applies to flow around any body placed in a stream — for example, two spheres of different diameters in an airflow will each transition to turbulence at a speed inversely proportional to their own diameter. Turbulence therefore begins at a *lower* flow speed over the *larger* sphere. The transition point occurs at the point of maximum thickness of the body relative to the flow.

## Scale Correction and Dynamic Similarity

Reynolds' experiments established that **if the flow pattern over a model is similar to the flow pattern over the full-size aircraft, the aerodynamic laws hold true and there is no error due to scale effect.** Scale effect concerns not just linear dimensions but speed, density and area — everything summed up in the fundamental lift and drag formulae:

**L = CL × ½ρV²S**, and **D = CD × ½ρV²S**

Reynolds' principle states that the value of **velocity × size (VL)** must be the same for both the model test and the full-size aircraft for the flow patterns to be truly comparable.

### A Worked Example

To test a 1/10 scale model and correctly predict behaviour of the full-size aircraft at 200 kt, simple scaling would require a wind-tunnel speed of **2,000 kt** (10 × 200 kt) — impractical, and the tunnel would also need to be huge to avoid wall interference, especially at such high Mach numbers. The model's wing area would also be only 1/100 of the real wing, yet would need to support forces equal to those on the full-size aircraft.

### Using Density Instead of Speed

Reynolds also found that flow similarity depends on the density and viscosity of the fluid, not just its speed and the body size. Specifically, similarity is achieved when:

**(density × velocity × size) ÷ viscosity** is held constant.

It is impractical to fill a wind tunnel with oil or water and accelerate it to 150–200 kt, but it *is* practical to **increase the density of the air** by pressurising the tunnel. Increasing pressure has little effect on viscosity, so with increased density the required velocity (and/or model size) can be reduced while still preserving aerodynamic similarity.

**Example:** compressing the tunnel air to 25 atmospheres gives a density factor of 25 with no corresponding increase in viscosity. The equivalent test speed for the 2,000 kt case above becomes:

2,000 kt ÷ 25 = **80 kt**

## Viscosity and Temperature

A change in air density does not itself affect viscosity — but temperature does. Compressing air heats it, so the compressed air must be cooled to keep viscosity constant. Note the important difference between liquids and gases here:

- **Liquids** become *less* viscous as temperature rises.
- **Air** (and gases generally) become *more* viscous as temperature rises.

Any uncontrolled rise in viscosity during a high-pressure tunnel test would offset the benefit gained from increasing density.

## Reynolds' Number (R)

Every wind-tunnel test result is quoted together with its **Reynolds' Number (R)**:

**R = (ρ × V × L) ÷ μ**

Where:

| Symbol | Meaning |
|--------|---------|
| ρ (rho) | Density of the fluid, in kg/m³ (1.2250 kg/m³ for air at sea level, ISA) |
| V | Velocity of the test, in metres per second |
| L | A characteristic dimension of the body — for an aerofoil, this is the **chord length** |
| μ (mu) | The viscosity of the fluid |

Given the units involved, it is not surprising that typical test results are quoted with Reynolds' Numbers on the order of **R ≈ 4 × 10⁶ (4,000,000)**.

## Reynolds' Number as a Ratio of Forces

Any flow experiment on geometrically similar bodies is fully determined once speed (V), body length (L), fluid density (ρ) and fluid viscosity (μ) are fixed — that combination *is* the Reynolds' Number.

Fundamentally, **R is a measure of the ratio between the inertial forces and the viscous forces** acting within the fluid flow:

- Reynolds' Number can be calculated for a series of tests comparing different aerofoils at a fixed speed, **or**
- A single aerofoil can be tested across a range of Reynolds' Numbers corresponding to different flight speeds.

In practice, the *absolute* values of density and viscosity used in a given test matter less than the **ratio of inertial forces to viscous forces** — and that ratio is exactly what Reynolds' Number represents. Two flows with the same Reynolds' Number, even in different fluids or at different scales, will exhibit dynamically similar behaviour.
        $cnt$,
        5
    ) RETURNING id INTO s5_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 08.6: Lift
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m08_id, 'M08.6', 'Lift',
        $cnt2$
# Lift

## Introduction

Having covered the basic theory of lift generation elsewhere, this section deals in more detail with pressure distribution around the aerofoil, movement of the Centre of Pressure (CP), the factors affecting lift, the coefficient of lift, and the lift/drag ratio.

## Distribution of Pressure About the Wing

A pressure plot taken around a typical aerofoil at 6° angle of attack shows positive and negative pressures measured relative to the free-stream static pressure. Conditions at the trailing edge are difficult to measure accurately because the pressures there are very small.

Although most low-speed aerofoil sections look broadly similar, each is designed to give specific aerodynamic characteristics — there is no single "typical" pressure distribution. In general terms, at normal (conventional) angles of attack:

- There is a **pressure decrease** over much of the **upper surface**.
- There is a **smaller pressure decrease** over much of the **lower surface**.
- The **greatest contribution to overall lift comes from the upper surface**.

### How the Aerofoil Shape Creates This Distribution

The aerofoil profile presented to the airflow determines the velocity distribution, and hence the pressure distribution, over the surface. This profile is set by the aerofoil's geometry (thickness distribution and camber) and by the angle of attack.

- The **greatest positive pressures** occur at **stagnation points**, where the flow is brought to rest — at the trailing edge, and at a point near the leading edge whose exact location depends on angle of attack.
- At the **front stagnation point**, the flow divides to pass over and under the section. Immediately downstream of this point the flow must accelerate, so pressure falls below the stagnation value.
- A smoothly contoured surface produces a smoothly changing pressure distribution that must return to the stagnation value at the trailing edge.

Over the **upper surface**: flow accelerates rapidly around the nose (faster acceleration at higher angles of attack), pressure falls continuously to a peak negative (suction) value, then the flow decelerates and pressure rises back through free-stream value to a small positive value near the trailing edge.

Over the **lower surface**: flow accelerates much less rapidly, pressure falls more gently to a small negative value, then rises again to a small positive value near the trailing edge.

At small angles of attack, lift arises mainly from the *difference* between the pressure reductions on the upper and lower surfaces. At higher angles of attack, lift comes partly from decreased pressure above the section and partly from increased pressure below it. At a small negative angle of attack (around −4° for a typical cambered section) the pressure decreases above and below are equal, and the section produces **no lift**. At the stalling angle, the low-pressure region on the upper surface suddenly collapses, and what lift remains is due mainly to increased pressure on the lower surface.

## Centre of Pressure (CP)

The combined effect of the pressure distribution over the aerofoil can be represented as a single aerodynamic force acting at one point on the chord line — the **Centre of Pressure (CP)**.

- The location of the CP is a function of camber and section lift coefficient; both the magnitude of the resultant force and its position vary with angle of attack.
- As angle of attack **increases**, the force increases and the **CP generally moves forward**.
- At the **stall**, the force decreases abruptly and the **CP moves rearward** along the chord.
- On a **cambered aerofoil**, CP movement over the normal working range of angles of attack is typically **20–30% of the chord**, aft of the leading edge.
- On a **symmetrical aerofoil**, there is virtually **no CP movement** over the normal subsonic working range of angles of attack.

## Definition of Lift

By definition, **lift is the component of the total aerodynamic reaction that is perpendicular to the flight path of the aircraft.**

## Variables Affecting Lift

Experiment shows that the total aerodynamic reaction — and therefore lift — acting on a wing moving through the air depends on at least the following variables:

- Free stream velocity (V)
- Air density (ρ)
- Wing area (S)
- Wing shape, in section and in planform
- Angle of attack (incidence)
- Condition of the surface
- Viscosity of the air
- The speed of sound (i.e. the speed of propagation of small pressure waves)

Lift increases when the angle of attack of a given aerofoil section is increased; this happens mechanically through greater acceleration of the airflow over the section, with a corresponding decrease in pressure. The general, simplified equation for aerodynamic force is **½ρV²S multiplied by a coefficient**, where the coefficient captures the change in force caused by changing angle of attack.

**The equation for lift is: L = CL × ½ρV²S**

CL, for a given aerofoil section and planform, accounts for angle of attack and all of the other unknown quantities not explicitly represented in the basic force formula.

## Coefficient of Lift (CL)

CL is obtained experimentally, at a quoted Reynolds' Number, from the lift equation:

**Lift = CL × ½ρV²S**

Rearranged: **CL = Lift ÷ (½ρV²S)** = Lift ÷ (qS), where **q** is dynamic pressure (½ρV²).

Values of CL are then plotted against angle of attack, allowing the factors affecting lift to be studied in terms of CL and its curve.

### Factors Affecting CL

The coefficient of lift depends on:

- **Angle of attack**
- **Shape** of the wing section and planform
- **Condition** of the wing surface
- **Reynolds' Number** (R = ρVL/μ)
- **Speed of sound** (Mach number)

### The Lift Curve and Angle of Attack

For a typical wing (e.g. 13% thickness/chord ratio, 2% camber), the greater part of the CL-vs-angle-of-attack curve is **linear** — the airflow follows the aerofoil's design contour almost to the trailing edge before separation occurs. At high angles of attack the curve begins to lean over, indicating a loss of lifting effectiveness.

From the point of maximum thickness to the trailing edge, the flow outside the boundary layer is decelerating, with an accompanying pressure rise (per Bernoulli's theorem). This **adverse pressure gradient** thickens the existing boundary layer. Within the boundary layer, friction has already reduced the airflow's kinetic energy (lost as heat); this weakened flow, meeting the thickening boundary layer, slows further still.

As angle of attack increases, the boundary layer **separation point moves rapidly forward**. The detached flow causes a substantial reduction in CL. At this stage the aerofoil has effectively changed from a streamlined body to a bluff (blunt) one. A desirable, progressive (rather than sudden) stall across an actual wing is achieved by wash-out at the tips, a change of aerofoil section along the span, or a combination of both.

### Variation of Drag with Angle of Attack (Overview)

Total drag varies steadily with angle of attack, being least at a small negative angle and increasing on either side of that minimum. The rate of increase becomes marked above about 8° angle of attack, and increases at an even greater rate after the stall — the sudden rise at the stall is caused by turbulence from the breakdown of steady flow. (Drag is covered in full detail in the following section.)

### Variation of Lift/Drag Ratio with Angle of Attack

For a given amount of lift it is desirable to have the least possible drag. The greatest lifting effort typically occurs at an angle of attack of around 18°, while least drag occurs at around −2°. Neither extreme is useful on its own, since the ratio of lift to drag is low at both. What matters is the **highest lift/drag (L/D) ratio** — the greatest lifting effort relative to drag at the same angle of attack.

The L/D ratio at any chosen angle of attack can be calculated by dividing CL by the corresponding CD at that angle. The same result is obtained whether lift and drag themselves are used, or their coefficients:

**L/D = (CL × ½ρV²S) ÷ (CD × ½ρV²S) = CL ÷ CD**

The L/D ratio increases rapidly up to an angle of attack of about 4°, where lift may be **12 to 25 times** the drag (the exact figure depends on the aerofoil). Beyond this point the L/D ratio steadily decreases — even though lift is still increasing, drag is rising at a faster rate.

The angle of attack giving the **highest L/D ratio** is the aerofoil's best all-round performance point:

- At a **higher** angle of attack, the required lift is obtained but at a lower, uneconomical speed.
- At a **lower** angle of attack, the required lift is obtained but at a higher, uneconomical speed.
        $cnt2$,
        6
    ) RETURNING id INTO s6_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 08.7: Aerofoils
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m08_id, 'M08.7', 'Aerofoils',
        $cnt3$
# Aerofoils

## Introduction

The performance of an aerofoil is governed by its contour. Aerofoils are generally divided into **three classes**:

- **High lift**
- **General purpose**
- **High speed**

## High Lift Aerofoils

- Employ a **high thickness/chord ratio**, a **pronounced camber**, and a **well-rounded leading edge**.
- Maximum thickness occurs at about **25–30% of the chord** behind the leading edge.
- The greater the camber (the amount of curvature of the mean camber line), the greater the shift of Centre of Pressure for a given change in angle of attack — so the range of CP movement is **large** on a high lift section.
- This CP movement can be reduced significantly by **reflexing the trailing edge upwards**, though some lift is lost as a result.
- Used mainly on **sailplanes** and other aircraft where a high CL is all-important and speed is a secondary consideration.

## General Purpose Aerofoils

- Employ a **lower thickness/chord ratio**, **less camber**, and a **sharper leading edge** than high lift sections, but maximum thickness is still around **25–30% of the chord** behind the leading edge.
- The lower thickness/chord ratio results in **less drag** and a **lower CL** than a high lift aerofoil.
- Used on aircraft whose required speeds are higher than those suited to a high lift aerofoil, but not high enough to bring on compressibility effects.

## High Speed Aerofoils

- Employ a **very low thickness/chord ratio**, **no camber**, and a **sharp leading edge**.
- Maximum thickness occurs at approximately the **50% chord point**.
- Most lie in the **5–10% thickness/chord ratio** band; even thinner sections have been used on research aircraft, because the overriding requirement is **low drag** — though thinner sections also have lower maximum lift coefficients.
- Usually **symmetrical** about the chord line; some are wedge-shaped, others consist of circular arcs placed symmetrically about the chord line.

## Sensitivity of Performance to Contour

The performance of any aerofoil is sensitive to small changes in its contour:

- Changing thickness by as little as **1% of the chord**, or shifting the point of maximum camber by only an inch or so, alters all of the aerofoil's characteristics.
- Changes to the **shape of the leading edge** markedly affect maximum lift, drag, and stall behaviour — a **sharp** leading edge stalls **more readily** than a **well-rounded** one.
- Surface finish matters: dents or scratches degrade performance. On high-performance aircraft, a poor surface finish can drastically reduce both performance and control at high Mach numbers.

## Summary — Pressure Distribution and Lift Points

The pressure distribution around an aerofoil varies considerably with shape and angle of attack, but at conventional angles of attack, the greatest contribution to overall lift comes from the upper surface.

There are two points through which the lift force may be considered to act:

- The **Centre of Pressure (CP)** — a *moving* point.
- The **Aerodynamic Centre** — a *fixed* point, used in most stability analysis.

Lift depends on: free stream velocity, air density, wing area, wing shape (section and planform), angle of attack, condition of the surface, viscosity of the air, and the speed of sound.

CL depends on: angle of attack, shape of the wing section and planform, condition of the wing surface, Reynolds' Number, and speed of sound (Mach number).

## Key Definitions

| Term | Definition |
|------|-----------|
| **Free Stream Flow** | Air in a region where pressure, temperature and relative velocity are unaffected by the passage of the aircraft through it. Also called relative airflow (RAF). |
| **Total Reaction (TR)** | The resultant of all the aerodynamic forces acting on the wing or aerofoil section. |
| **Lift** | The component of TR that is perpendicular to the flight path or RAF. |
| **Drag** | The component of TR that is tangential to the flight path, i.e. parallel to the RAF. |
| **Chord Line** | A straight line joining the centres of curvature of the leading and trailing edges of an aerofoil. |
| **Chord (c)** | The distance between the leading and trailing edge, measured along the chord line. The mean chord is often used as a datum linear dimension, just as wing area (S) is used as a datum area. |
| **Wing Area (S)** | The area of the wing projected on a plane perpendicular to the normal axis. |
| **Mean Line / Camber Line** | A line joining the leading and trailing edges, equidistant from the upper and lower surfaces at every point. Maximum camber is usually expressed as the ratio of the maximum distance between camber line and chord line to the chord length. Where the camber line lies above the chord line, the aerofoil has **positive camber**. |
| **Angle of Attack (α)** | The angle between the chord line and the flight path or RAF. Also called **Incidence** in many textbooks. |
| **Thickness/Chord Ratio** | The maximum thickness (depth) of an aerofoil section, expressed as a percentage of chord length. |
| **Centre of Pressure (CP)** | The point, usually on the chord line, through which the Total Reaction may be considered to act. |
| **Streamline** | The path traced by a particle in a steady fluid flow. |
| **Aspect Ratio (AR)** | span ÷ chord, or equivalently span² ÷ wing area. |
| **Wing Loading** | Weight per unit wing area: weight ÷ wing area. |
| **Load Factor (g or n)** | n = Total Lift ÷ Weight. |
| **Fineness Ratio** | The ratio of the chord length of a non-lift-producing body to its thickness. |
        $cnt3$,
        7
    ) RETURNING id INTO s7_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 08.8: Drag
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m08_id, 'M08.8', 'Drag',
        $cnt4$
# Drag

## Introduction

Every part of an aircraft in flight produces an aerodynamic force. **Total drag** is the sum of all components of aerodynamic force acting parallel and opposite to the direction of flight. Each drag component represents resistance to the aircraft's movement — i.e. lost energy.

Three points to bear in mind about total drag:

- The *causes* of subsonic drag have changed little over the years, but the relative balance of values has changed — e.g. parasite drag is now such a small part of the whole that it is often not considered as a separate category.
- An aircraft in flight has drag even when it is **not producing lift**.
- When producing lift, the whole aircraft produces **additional** drag, some of which appears as increments to the same components that make up zero lift drag.

### Two Main Groupings

**Zero Lift Drag** — the drag that exists when the aircraft is flying at the zero-lift angle of attack, so that the resultant of all aerodynamic forces acts parallel and opposite to the flight path. Composed of:

- Surface friction drag
- Form drag (boundary layer normal pressure drag)
- Interference drag

**Lift Dependent Drag** — the additional drag produced because the aircraft is producing lift. Composed of:

- Induced drag (vortex drag)
- Increments of: form drag, surface friction drag, and interference drag

## Zero Lift Drag

### The Boundary Layer

Because air is viscous, any object moving through it drags along a thin layer of air particles with it:

- A particle immediately adjacent to the surface is pulled along at approximately the object's own speed (viscous adhesion).
- Particles progressively further from the surface are affected progressively less.
- Beyond a certain distance, the object's movement causes no discernible motion of the air at all.

This layer — from the surface out to the point where no dragging effect remains — is the **Boundary Layer**. Its nature is a controlling factor in surface friction drag; more importantly, it determines the **maximum lift coefficient**, the **stalling characteristics** of a wing, the value of **form drag**, and (to some extent) the aircraft's high-speed characteristics.

The viscous drag force within the boundary layer is insensitive to pressure/density variations normal to the surface. The coefficient of viscosity of air behaves like temperature and therefore **decreases with altitude**.

### Surface Friction Drag

Surface friction drag depends on:

- The **total surface area** of the aircraft (the whole wetted surface has a boundary layer, and therefore friction drag)
- The **coefficient of viscosity** of the air — the greater the viscosity, the greater the dragging effect
- The **rate of change of velocity** across the flow

### Laminar and Turbulent Boundary Layers

The boundary layer is normally defined as the region of flow where speed is less than 99% of free-stream flow. It exists in two forms:

- **Laminar** — smooth, layered flow, typically found towards the front of a body.
- **Turbulent** — mixing flow, found further aft. The point where laminar flow becomes turbulent is the **Transition Point**.

The rate of change of velocity at the surface is **greater in turbulent flow** than in laminar flow, producing **greater surface friction drag**. The turbulent layer mixes with the faster-moving air above it and carries more kinetic energy than the laminar layer.

Even within a turbulent boundary layer, an extremely thin layer immediately at the surface (perhaps ~1% of the turbulent layer's total thickness) remains laminar — the **laminar sub-layer**. Despite its thinness, it is significant for surface friction drag, and for the drag reduction achievable by smoothing a surface.

### Transition to Turbulence

Forward movement of the transition point **increases** surface friction drag. The position of the transition point depends on:

- Surface condition
- Speed of the flow
- Size of the object
- Adverse pressure gradient

**Surface condition:** both laminar and turbulent boundary layers thicken downstream — roughly 0.2 mm thick at 1 m downstream of the leading edge, growing to about 2 mm at 1 m downstream of the transition point. The turbulent layer is typically about **ten times thicker** than the laminar layer. The thin laminar layer is extremely sensitive to surface irregularities — any roughness perceptible to the hand will trigger transition to turbulence at that point, and the resulting boundary layer thickening spreads fanwise downstream, markedly increasing surface friction drag. Ice, snow or frost contamination increases drag *and* adds weight, requiring more lift.

**Speed and size:** as previously noted, the transition velocity is inversely proportional to the thickness of the body — the thicker the body, the lower the speed at which transition occurs. For a given aerofoil, increasing flow velocity moves the transition point forward towards the leading edge. Earlier transition means more of the surface is covered by turbulent boundary layer, increasing surface friction drag — although the turbulent layer's greater kinetic energy also **delays separation**, increasing maximum CL.

### Form Drag (Boundary Layer Normal Pressure Drag)

The difference between friction drag and form drag is clearest with a flat plate: at zero incidence, essentially all drag is friction drag; at 90° incidence, essentially all drag is form drag due to separation.

**Separation point:** surface friction reduces the kinetic energy of air within the boundary layer; on a curved surface, the adverse pressure gradient reduces it further. Eventually, close to the trailing edge, a finite portion of the boundary layer stops moving altogether, producing eddies in a turbulent wake. Downstream of the transition point, faster-moving air mixing into the turbulent layer gives it greater kinetic energy than the laminar layer — but the turbulent layer will still separate as readily under an adverse pressure gradient as the laminar layer would.

**Streamlining:** where the boundary layer separates ahead of the trailing edge, pressure at the separation point is lower than at the forward stagnation point, creating a pressure drag between the front and rear surfaces (form drag). This can be a large part of total drag, so delaying separation for as long as possible is important. **Streamlining** increases the **fineness ratio** of a body, reducing surface curvature and thus the adverse pressure gradient.

### Interference Drag

On a complete aircraft, total drag is **greater than the sum** of the drag of its individual parts measured separately. The extra drag results from flow interference at junctions — wing/fuselage, wing/nacelle, and similar joints — which modifies the boundary layers there and increases wake turbulence, in turn increasing the front-to-rear pressure difference and hence resistance. For subsonic aircraft this component can be reduced by fitting **fairings** at such junctions (e.g. at trailing-edge wing roots).

### Zero Lift Drag Summary

Zero lift drag comprises surface friction drag, form drag, and interference drag.

- Surface friction drag depends on: total surface area; viscosity of the air; rate of change of velocity across the flow (transition point, surface condition, speed and size, adverse pressure gradient).
- Form drag depends on: separation point; transition point; adverse pressure gradient; streamlining.
- Interference drag is caused by the mixing of airflows at airframe junctions.

**Zero lift drag varies as the square of the Equivalent Air Speed (EAS).**

## Lift Dependent Drag

All drag arising because the aircraft is producing lift is **Lift Dependent Drag**. It mainly comprises induced drag, plus increments of the drag types that make up zero lift drag (these increments become more apparent at high angles of attack).

### Induced Drag (Vortex Drag)

On a finite rectangular wing at a positive angle of attack, the pressure difference between the upper (lower pressure) and lower (higher pressure) surfaces causes air to spill around the wing tips. This deflects flow over the upper surface **inward** towards the fuselage, and flow under the lower surface **outward** towards the tips. Where these flows meet at the trailing edge, a sheet of vortices forms and drifts towards the tip, rolling up into a large wingtip vortex. Under high-lift conditions (e.g. manoeuvring flight), the pressure difference — and hence vortex strength — greatly increases; the pressure drop at the vortex core may be enough to condense visible vapour trails.

The net effect of these vortices is extra **downwash** behind the wing, additional to the downwash produced by lift generation itself — this is called **induced downwash**. The vortices represent a three-dimensional acceleration of the airflow (a change of speed and direction); the power absorbed doing this work appears as an additional drag force — **induced drag**.

### Factors Affecting Induced Drag

- **Planform**
- **Aspect ratio**
- **Lift and weight**
- **Speed**

**Planform:** induced drag is greatest where the vortices are strongest — at the wingtips — so reducing induced drag means achieving an even spanwise pressure distribution. An **elliptical planform** gives constant downwash along the span and, for a given lift, span and velocity, produces the **minimum possible induced drag**. Elliptical wings are difficult to manufacture, but a careful combination of taper and washout (or a change of aerofoil section) at the tips can closely approximate the elliptical ideal.

**Aspect Ratio (AR):** if AR were infinite, induced drag would be zero — the closer a design gets to this (impossible) limit, the less induced drag it produces. A low-AR wing suffers worse tip vortices, due to greater transverse flow over its longer chord and induced downwash affecting a greater proportion of its shorter span. **Induced drag is inversely proportional to AR** — e.g. doubling the AR halves the induced drag.

**Lift and weight:** the induced downwash angle (and therefore induced drag) depends on the pressure difference between the upper and lower wing surfaces — which is the lift itself. An increase in CL (e.g. during manoeuvres, or due to increased weight) therefore increases induced drag at a given speed. **Induced drag varies as CL², and therefore as weight², at a given speed.**

**Speed:** if speed is halved in level flight, dynamic pressure (½ρV²) falls to a quarter of its original value. To restore the original lift, CL must increase fourfold. The resulting increase in angle of attack tilts the lift vector rearward, increasing its contribution to induced drag. (The vortices themselves are unaffected, since lift — and the pressure difference producing it — is unchanged.) Induced drag at high angles of attack (e.g. at take-off) can account for **nearly three-quarters of total drag**, falling to an almost insignificant fraction at high speed.

### Increments of Zero Lift Drag Resulting from Lift Production

As lift increases from zero towards its manoeuvring maximum, forward movement of the low-pressure peak causes earlier transition of the boundary layer to turbulence, and the growing adverse pressure gradient causes earlier separation. Earlier transition increases surface friction drag; earlier separation increases form drag. Changing angle of attack (whether from a speed change or a manoeuvre) also changes the frontal area presented to the airflow, further changing form drag.

**Interference drag** increases too: when producing lift, the boundary layers at junctions are thicker and more turbulent, so mixing there causes greater energy losses. The greater the lift, the greater these drag increments — noticeable mainly at high angles of attack.

### Lift Dependent Drag Summary

Lift dependent drag comprises induced (vortex) drag, plus increments of surface friction, form, and interference drag.

**Induced drag varies as:**

- CL² (directly)
- 1/V² (inversely with the square of speed)
- Weight² (directly, at a given speed)
- 1/Aspect Ratio (inversely)

Increments of zero lift drag arise from the forward movement of the transition and separation points as lift increases.

## Total Drag

Total drag = Zero Lift Drag + Lift Dependent Drag. A graph of total drag against EAS is fundamental to performance theory — but it is only valid for **one aircraft weight, in level flight**.

Three points on the total drag curve are important:

- The point of **minimum drag × velocity** gives the **minimum power speed (VMP)**.
- **VIMD** is the lowest-drag speed, and coincides with the **best lift/drag ratio** speed.
- The **maximum EAS/drag ratio speed** — the primary aerodynamic consideration for **best range** — has the value **1.32 × VIMD**.

## Coefficient of Drag (CD)

CD is found experimentally, at a quoted Reynolds' Number, from:

**Drag = CD × ½ρV²S = CD × qS**

Rearranged: **CD = Drag ÷ (qS)**

CD depends on: angle of attack; shape (section and planform); surface condition; Reynolds' Number; speed of sound (Mach number).

Total drag — and hence the total drag coefficient — has two components: zero lift and lift dependent. CD is often plotted against angle of attack, but it is more common to plot CD against CL as a **Polar Curve**.

### Effect of Angle of Attack

At low angles of attack (and low CL), drag is mostly zero lift drag. At high angles of attack, drag is mostly induced drag plus the increases in zero lift drag.

### Effect of Shape

Minimum CD is affected by thickness/chord ratio and camber — a thin, high-speed aerofoil with little or no camber has a low minimum CD. The most significant effect, however, comes from moving the point of **maximum thickness rearward**.

Most low-drag aerofoils have maximum thickness between **40% and 50%** of the chord behind the leading edge — this keeps a large part of the wing surface covered by a laminar boundary layer, reducing drag. These are known as **laminar wings**, and their characteristic CD curve shows a **"laminar bucket"** — a range of low, roughly constant CD around a central value known as the **optimum (or ideal) lift coefficient**, whose value is set by the shape and amount of camber of the mean camber line. Good design places this favourable range to cover the aircraft's most common lift coefficients in normal flight, benefiting both performance and fuel economy.

### Effect of Roughness

A roughened leading edge causes **immediate transition to turbulent flow**, increasing surface friction drag across the affected surface.
        $cnt4$,
        8
    ) RETURNING id INTO s8_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 08.9: Stalling
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m08_id, 'M08.9', 'Stalling',
        $cnt5$
# Stalling

## Introduction

The nature of the boundary layer determines a wing's stalling characteristics. In particular, the phenomenon of **boundary layer separation** is central to understanding what happens when a wing stalls.

## Boundary Layer Separation

Boundary layer separation results from the adverse pressure gradient developed around the body. Low-energy air close to the surface is unable to keep moving against this pressure gradient, and the flow nearest the surface reverses direction relative to the free stream.

The development of separation, moving downstream along the surface:

- **Point A** — a normal, healthy velocity profile.
- **Point B** — the adverse pressure gradient has begun to modify the velocity profile.
- **Point C** — the velocity profile has been modified so much that flow at the surface has stopped entirely. This is defined as the **Separation Point**.
- **Point D** — flow close to the surface has fully reversed; the flow is now separated.

Aft of the separation point, the flow is eddying and turbulent, with a mean motion opposite to the free stream.

## Trailing Edge Separation

On a normal subsonic aerofoil section at low angles of attack, virtually no flow separation occurs ahead of the trailing edge — the flow stays attached over the rear of the surface as a turbulent boundary layer.

As angle of attack increases:

1. The adverse pressure gradient increases.
2. The boundary layer begins to separate near the trailing edge.
3. As angle of attack increases further, the separation point moves progressively **forward** along the wing surface, towards the leading edge.
4. As the separation point moves forward, the slope of the lift/angle-of-attack curve decreases.
5. Eventually an angle of attack is reached at which the wing is said to **stall** — flow over the upper surface breaks down completely and lift decreases.

## Critical Angle of Attack

The marked drop in CL that accompanies breakdown of the airflow occurs at the **critical angle of attack** for a given wing. In subsonic flight, an aircraft will always stall at the **same critical angle of attack**, except at high Reynolds' Numbers. Importantly, **not all lift is lost at the critical angle** — the aerofoil continues to produce some lift up to angles of attack as high as 90°.

## Aerodynamic Symptoms of an Approaching Stall

The most consistent stall warning arises from separated flow from the wing passing over the **tail surfaces**. The resulting turbulent wake causes **buffeting** of the control surfaces, usually felt at the control column and rudder pedals. As the separation point moves forward, to within a few degrees of the critical angle of attack, this buffeting gives adequate stall warning. On some aircraft, separation may also occur over the cockpit canopy, giving an additional audible warning.

The amount of pre-stall buffet depends on the position of the tail surfaces relative to the turbulent wake. Lowering trailing-edge (inboard) flaps increases the downwash angle behind them, which can **reduce** the amount of buffet warning available.

## Pitching Moments at the Stall

As angle of attack increases through the critical angle, the wing's pitching moment changes; changes in downwash angle behind the wing also change the tail's pitching moment. The overall effect varies by aircraft type and may be masked by how quickly the elevator is deflected to increase angle of attack. Most aircraft, however, are designed to produce a **nose-down pitching moment** at the critical angle of attack.

## Tip Stalling

A wing is designed to stall **progressively, from root to tip**, for three reasons:

1. To induce early buffet symptoms over the tail surfaces (adequate stall warning).
2. To retain **aileron effectiveness** up to the critical angle of attack.
3. To avoid a large rolling moment that would result if one wingtip stalled before the other (**wing drop**).

A **rectangular straight wing** usually stalls from the root first, because of the reduction in effective angle of attack at the tips caused by the wingtip vortex. Incorporating washout (to reduce vortex/induced drag) also helps delay tip stall.

A **tapered wing**, by contrast, tends to **aggravate** tip stalling, due to the lower Reynolds' Number at the tip (smaller local chord).

### Features Used to Prevent Wingtip Stalling

| Feature | How it Works |
|---------|-------------|
| **Washout** | A built-in reduction of incidence towards the tips, so the wing root reaches its critical angle of attack before the tip does. |
| **Root Spoilers** | A sharper leading edge at the wing root makes it harder for the airflow to follow the contour there, inducing an early stall at the root (a crude version is seen on some light aircraft). |
| **Change of Section** | An aerofoil section with more gradual stalling characteristics (increased camber) is used towards the wingtips. |
| **Slats and Slots** | Fitted to the outer portion of the wing, these increase the stalling angle of attack of that part of the wing. |
        $cnt5$,
        9
    ) RETURNING id INTO s9_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M08.5 Reynolds' Number (12 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s5_id, 'For a 1/10 scale model built from the same materials as the full-size aircraft, the mass of the model is:',
     '[{"id":"a","text":"1/10 of the full-size aircraft","correct":false},{"id":"b","text":"1/100 of the full-size aircraft","correct":false},{"id":"c","text":"1/1000 of the full-size aircraft","correct":true}]',
     '{"B1.1","B1.3","B2"}'),

    (s5_id, 'Reynolds discovered that, for flow in a pipe, the critical velocity at which flow becomes turbulent is:',
     '[{"id":"a","text":"Directly proportional to the pipe diameter","correct":false},{"id":"b","text":"Inversely proportional to the pipe diameter","correct":true},{"id":"c","text":"Independent of the pipe diameter","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s5_id, 'If the critical velocity in a 20 mm diameter pipe is 20 m/s, the critical velocity in a 40 mm diameter pipe would be approximately:',
     '[{"id":"a","text":"5 m/s","correct":false},{"id":"b","text":"10 m/s","correct":true},{"id":"c","text":"40 m/s","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s5_id, 'Reynolds'' principle of dynamic similarity states that, between a model and a full-size aircraft, the value of:',
     '[{"id":"a","text":"Velocity divided by size (V/L) must be the same","correct":false},{"id":"b","text":"Velocity multiplied by size (VL) must be the same","correct":true},{"id":"c","text":"Size alone must be identical","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s5_id, 'To correctly test a 1/10 scale model representing an aircraft flying at 200 kt, simple velocity scaling would require a wind-tunnel speed of:',
     '[{"id":"a","text":"20 kt","correct":false},{"id":"b","text":"200 kt","correct":false},{"id":"c","text":"2,000 kt","correct":true}]',
     '{"B1.1","B1.3","B2"}'),

    (s5_id, 'A practical way to achieve dynamic similarity without using an extremely high tunnel speed is to:',
     '[{"id":"a","text":"Increase the density of the test air by pressurising the tunnel","correct":true},{"id":"b","text":"Reduce the size of the test section","correct":false},{"id":"c","text":"Fill the tunnel with a low-viscosity liquid","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s5_id, 'If tunnel air is compressed to 25 atmospheres with no significant change in viscosity, a required test speed of 2,000 kt is reduced to approximately:',
     '[{"id":"a","text":"800 kt","correct":false},{"id":"b","text":"80 kt","correct":true},{"id":"c","text":"8 kt","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s5_id, 'When air is compressed in a high-pressure wind tunnel, it must be cooled because:',
     '[{"id":"a","text":"Increasing density directly increases viscosity","correct":false},{"id":"b","text":"Compression raises temperature, and air becomes more viscous as temperature rises","correct":true},{"id":"c","text":"Cooling increases the air density further","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s5_id, 'Compared to liquids, air (a gas) responds to a temperature rise by becoming:',
     '[{"id":"a","text":"Less viscous, the same as liquids","correct":false},{"id":"b","text":"More viscous, unlike liquids which become less viscous","correct":true},{"id":"c","text":"Unaffected in viscosity by temperature","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s5_id, 'The formula for Reynolds'' Number is R = ρVL/μ. In this formula, L represents:',
     '[{"id":"a","text":"The wing area","correct":false},{"id":"b","text":"A characteristic dimension of the body — the chord length, for an aerofoil","correct":true},{"id":"c","text":"The lift coefficient","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s5_id, 'Typical Reynolds'' Numbers quoted for aerofoil wind-tunnel test results are of the order of:',
     '[{"id":"a","text":"4 × 10²","correct":false},{"id":"b","text":"4 × 10⁶","correct":true},{"id":"c","text":"4 × 10¹²","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s5_id, 'Fundamentally, Reynolds'' Number represents the ratio of:',
     '[{"id":"a","text":"Lift forces to drag forces","correct":false},{"id":"b","text":"Inertial forces to viscous forces","correct":true},{"id":"c","text":"Density to temperature","correct":false}]',
     '{"B1.1","B1.3","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M08.6 Lift (13 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s6_id, 'At conventional angles of attack, the greatest contribution to overall lift comes from:',
     '[{"id":"a","text":"The lower surface of the aerofoil","correct":false},{"id":"b","text":"The upper surface of the aerofoil","correct":true},{"id":"c","text":"Equal contributions from both surfaces at all times","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s6_id, 'At the front stagnation point of an aerofoil:',
     '[{"id":"a","text":"The airflow is accelerated to maximum velocity","correct":false},{"id":"b","text":"The airflow is brought to rest and then divides to pass over and under the section","correct":true},{"id":"c","text":"Lift is always at its maximum value","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s6_id, 'For a typical cambered aerofoil, at approximately what negative angle of attack does the section produce zero lift?',
     '[{"id":"a","text":"About -4 degrees","correct":true},{"id":"b","text":"About -15 degrees","correct":false},{"id":"c","text":"0 degrees exactly","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s6_id, 'The Centre of Pressure (CP) is best described as:',
     '[{"id":"a","text":"A fixed point used for stability calculations","correct":false},{"id":"b","text":"The point on the chord line where the resultant aerodynamic force may be considered to act","correct":true},{"id":"c","text":"The point of maximum camber","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s6_id, 'As angle of attack increases (below the stall), the Centre of Pressure on a cambered aerofoil generally:',
     '[{"id":"a","text":"Moves forward","correct":true},{"id":"b","text":"Moves aft","correct":false},{"id":"c","text":"Remains stationary","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s6_id, 'At the stall, the Centre of Pressure of a cambered aerofoil typically:',
     '[{"id":"a","text":"Continues moving forward","correct":false},{"id":"b","text":"Moves abruptly rearward along the chord","correct":true},{"id":"c","text":"Moves off the chord line entirely","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s6_id, 'On a symmetrical aerofoil, over the normal working range of angles of attack at subsonic speed, the CP:',
     '[{"id":"a","text":"Moves rapidly forward and aft","correct":false},{"id":"b","text":"Shows virtually no movement","correct":true},{"id":"c","text":"Moves only at the stall","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s6_id, 'By definition, lift is the component of the total aerodynamic reaction that is:',
     '[{"id":"a","text":"Parallel to the flight path","correct":false},{"id":"b","text":"Perpendicular to the flight path","correct":true},{"id":"c","text":"Perpendicular to the chord line","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s6_id, 'Which of the following is the correct equation for lift?',
     '[{"id":"a","text":"L = CL x rho x V x S","correct":false},{"id":"b","text":"L = CL x half x rho x V squared x S","correct":true},{"id":"c","text":"L = CL / (half x rho x V squared x S)","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s6_id, 'The coefficient of lift (CL) is obtained experimentally by dividing lift by:',
     '[{"id":"a","text":"Dynamic pressure multiplied by wing area (qS)","correct":true},{"id":"b","text":"Air density alone","correct":false},{"id":"c","text":"Wing area alone","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s6_id, 'Which of the following is NOT listed as a factor affecting the coefficient of lift (CL)?',
     '[{"id":"a","text":"Angle of attack","correct":false},{"id":"b","text":"Reynolds'' Number","correct":false},{"id":"c","text":"Total weight of the aircraft","correct":true}]',
     '{"B1.1","B1.3","B2"}'),

    (s6_id, 'The highest lift/drag (L/D) ratio for a typical aerofoil occurs at approximately what angle of attack?',
     '[{"id":"a","text":"About -2 degrees","correct":false},{"id":"b","text":"About 4 degrees","correct":true},{"id":"c","text":"About 18 degrees","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s6_id, 'Beyond the angle of attack for best L/D ratio, the L/D ratio decreases because:',
     '[{"id":"a","text":"Lift begins to decrease immediately","correct":false},{"id":"b","text":"Drag increases at a faster rate than lift, even though lift is still increasing","correct":true},{"id":"c","text":"CL becomes constant while CD decreases","correct":false}]',
     '{"B1.1","B1.3","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M08.7 Aerofoils (13 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s7_id, 'Aerofoils are generally divided into which three classes?',
     '[{"id":"a","text":"High lift, general purpose, high speed","correct":true},{"id":"b","text":"Symmetrical, cambered, laminar","correct":false},{"id":"c","text":"Subsonic, transonic, supersonic","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s7_id, 'A high lift aerofoil section is characterised by:',
     '[{"id":"a","text":"A low thickness/chord ratio and no camber","correct":false},{"id":"b","text":"A high thickness/chord ratio, pronounced camber, and a well-rounded leading edge","correct":true},{"id":"c","text":"A sharp leading edge and maximum thickness at 50% chord","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s7_id, 'High lift aerofoil sections are mainly used on:',
     '[{"id":"a","text":"Sailplanes and aircraft where high CL matters more than speed","correct":true},{"id":"b","text":"Supersonic research aircraft","correct":false},{"id":"c","text":"Aircraft optimised purely for minimum drag at high Mach number","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s7_id, 'Reflexing the trailing edge of a high lift wing upward has the effect of:',
     '[{"id":"a","text":"Increasing CP movement while increasing lift","correct":false},{"id":"b","text":"Reducing CP movement, though some lift is lost","correct":true},{"id":"c","text":"Having no effect on CP movement or lift","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s7_id, 'Compared to a high lift aerofoil, a general purpose aerofoil has:',
     '[{"id":"a","text":"A lower thickness/chord ratio, less camber, and less drag","correct":true},{"id":"b","text":"A higher thickness/chord ratio and more camber","correct":false},{"id":"c","text":"The same aerodynamic characteristics","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s7_id, 'High speed aerofoil sections typically have their maximum thickness located at approximately:',
     '[{"id":"a","text":"10% of the chord","correct":false},{"id":"b","text":"25-30% of the chord","correct":false},{"id":"c","text":"50% of the chord","correct":true}]',
     '{"B1.1","B1.3","B2"}'),

    (s7_id, 'High speed aerofoils are usually:',
     '[{"id":"a","text":"Highly cambered","correct":false},{"id":"b","text":"Symmetrical about the chord line","correct":true},{"id":"c","text":"Fitted with a rounded, blunt leading edge","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s7_id, 'Comparing leading edge shapes, which stalls more readily?',
     '[{"id":"a","text":"A sharp leading edge","correct":true},{"id":"b","text":"A well-rounded leading edge","correct":false},{"id":"c","text":"Leading edge shape has no effect on stall behaviour","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s7_id, 'The Aerodynamic Centre differs from the Centre of Pressure in that the Aerodynamic Centre is:',
     '[{"id":"a","text":"A moving point used mainly in performance calculations","correct":false},{"id":"b","text":"A fixed point, used in most work on stability","correct":true},{"id":"c","text":"Only relevant to symmetrical aerofoils","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s7_id, 'The chord line of an aerofoil is defined as:',
     '[{"id":"a","text":"A line equidistant from the upper and lower surfaces","correct":false},{"id":"b","text":"A straight line joining the centres of curvature of the leading and trailing edges","correct":true},{"id":"c","text":"The path traced by a particle in the airflow","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s7_id, 'An aerofoil is said to have positive camber when:',
     '[{"id":"a","text":"The camber line lies above the chord line","correct":true},{"id":"b","text":"The camber line lies below the chord line","correct":false},{"id":"c","text":"The camber line coincides exactly with the chord line","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s7_id, 'Aspect ratio (AR) of a wing is defined as:',
     '[{"id":"a","text":"Wing area divided by span","correct":false},{"id":"b","text":"Span divided by chord (or span squared divided by wing area)","correct":true},{"id":"c","text":"Chord divided by thickness","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s7_id, 'Load factor (n) is defined as:',
     '[{"id":"a","text":"Total lift divided by weight","correct":true},{"id":"b","text":"Weight divided by wing area","correct":false},{"id":"c","text":"Total drag divided by lift","correct":false}]',
     '{"B1.1","B1.3","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M08.8 Drag (17 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s8_id, 'Total drag is best described as:',
     '[{"id":"a","text":"Only the drag produced when the aircraft is generating lift","correct":false},{"id":"b","text":"The sum of all aerodynamic force components acting parallel and opposite to the direction of flight","correct":true},{"id":"c","text":"The resistance produced solely by the aircraft''s engines","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s8_id, 'Zero lift drag is composed of which three components?',
     '[{"id":"a","text":"Induced drag, wave drag, and interference drag","correct":false},{"id":"b","text":"Surface friction drag, form drag, and interference drag","correct":true},{"id":"c","text":"Induced drag, surface friction drag, and wave drag","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s8_id, 'Lift dependent drag mainly comprises:',
     '[{"id":"a","text":"Induced (vortex) drag, plus increments of zero lift drag components","correct":true},{"id":"b","text":"Surface friction drag only","correct":false},{"id":"c","text":"Wave drag only","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s8_id, 'The boundary layer is best defined as:',
     '[{"id":"a","text":"The region of air unaffected by the aircraft''s passage","correct":false},{"id":"b","text":"The layer of air extending from the surface to the point where the dragging effect of the surface is no longer discernible","correct":true},{"id":"c","text":"The layer of air directly ahead of the stagnation point","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s8_id, 'Compared to laminar flow, turbulent flow at the surface produces:',
     '[{"id":"a","text":"Lower surface friction drag due to a lower rate of velocity change","correct":false},{"id":"b","text":"Higher surface friction drag due to a higher rate of velocity change at the surface","correct":true},{"id":"c","text":"Exactly the same surface friction drag","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s8_id, 'The laminar sub-layer refers to:',
     '[{"id":"a","text":"An extremely thin layer that remains laminar even within an otherwise turbulent boundary layer","correct":true},{"id":"b","text":"The entire boundary layer when the aircraft flies at low speed","correct":false},{"id":"c","text":"A layer that only exists ahead of the transition point","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s8_id, 'Contamination of an aerofoil surface by ice, snow, or frost in flight results in:',
     '[{"id":"a","text":"Reduced drag and reduced weight","correct":false},{"id":"b","text":"Increased drag and increased weight, requiring more lift","correct":true},{"id":"c","text":"No significant aerodynamic effect","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s8_id, 'Form drag (boundary layer normal pressure drag) is best illustrated by comparing a flat plate at:',
     '[{"id":"a","text":"Zero incidence (all friction drag) versus 90 degrees incidence (all form drag)","correct":true},{"id":"b","text":"Two different Reynolds Numbers with the same incidence","correct":false},{"id":"c","text":"Subsonic versus supersonic speed only","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s8_id, 'Streamlining reduces form drag primarily by:',
     '[{"id":"a","text":"Increasing the fineness ratio and reducing the adverse pressure gradient","correct":true},{"id":"b","text":"Increasing surface roughness to trip turbulence early","correct":false},{"id":"c","text":"Reducing the total wetted surface area to zero","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s8_id, 'Interference drag arises mainly from:',
     '[{"id":"a","text":"Flow mixing and boundary layer modification at junctions such as wing/fuselage or wing/nacelle","correct":true},{"id":"b","text":"The viscosity of the air alone","correct":false},{"id":"c","text":"Compressibility effects at low subsonic speed","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s8_id, 'Zero lift drag varies with equivalent air speed (EAS) as:',
     '[{"id":"a","text":"EAS squared","correct":true},{"id":"b","text":"EAS to the first power (directly proportional)","correct":false},{"id":"c","text":"The inverse of EAS","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s8_id, 'An elliptical wing planform is aerodynamically significant because, for a given lift, span and velocity, it produces:',
     '[{"id":"a","text":"The maximum possible induced drag","correct":false},{"id":"b","text":"The minimum possible induced drag","correct":true},{"id":"c","text":"Zero induced drag under all conditions","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s8_id, 'Induced drag is related to aspect ratio (AR) such that if the AR is doubled, induced drag is:',
     '[{"id":"a","text":"Doubled","correct":false},{"id":"b","text":"Halved","correct":true},{"id":"c","text":"Unchanged","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s8_id, 'At a given speed, induced drag varies as:',
     '[{"id":"a","text":"CL (directly, linearly)","correct":false},{"id":"b","text":"CL squared","correct":true},{"id":"c","text":"The square root of CL","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s8_id, 'At high angles of attack, such as during take-off, induced drag can account for approximately:',
     '[{"id":"a","text":"One-tenth of total drag","correct":false},{"id":"b","text":"Nearly three-quarters of total drag","correct":true},{"id":"c","text":"An insignificant fraction of total drag","correct":false}]',
     '{"B1.1","B1.3","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Additional questions — M08.8 Drag (continued: total drag, CD, shape, roughness)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s8_id, 'On the total drag versus EAS curve, the maximum EAS/drag ratio speed (best range speed) has the value:',
     '[{"id":"a","text":"0.75 x VIMD","correct":false},{"id":"b","text":"1.0 x VIMD","correct":false},{"id":"c","text":"1.32 x VIMD","correct":true}]',
     '{"B1.1","B1.3","B2"}'),

    (s8_id, 'The coefficient of drag (CD) is calculated as:',
     '[{"id":"a","text":"Drag divided by qS (dynamic pressure x wing area)","correct":true},{"id":"b","text":"Drag multiplied by qS","correct":false},{"id":"c","text":"Drag divided by weight","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s8_id, 'Most low-drag (laminar) aerofoils have their maximum thickness located at approximately:',
     '[{"id":"a","text":"10-15% of chord","correct":false},{"id":"b","text":"40-50% of chord","correct":true},{"id":"c","text":"80-90% of chord","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s8_id, 'The term "laminar bucket" refers to:',
     '[{"id":"a","text":"A device used to collect boundary layer air for testing","correct":false},{"id":"b","text":"A range of lift coefficients over which a laminar aerofoil has a favourable, low CD","correct":true},{"id":"c","text":"A container used in wind-tunnel model construction","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s8_id, 'A roughened leading edge on an aerofoil primarily causes:',
     '[{"id":"a","text":"Delayed transition, reducing surface friction drag","correct":false},{"id":"b","text":"Immediate transition to turbulent flow, increasing surface friction drag","correct":true},{"id":"c","text":"No measurable change in drag coefficient","correct":false}]',
     '{"B1.1","B1.3","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M08.9 Stalling (13 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s9_id, 'Boundary layer separation is fundamentally caused by:',
     '[{"id":"a","text":"An adverse pressure gradient developed around the body","correct":true},{"id":"b","text":"An increase in air density near the surface","correct":false},{"id":"c","text":"A decrease in the aircraft''s weight","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s9_id, 'The separation point on a wing surface is defined as the point where:',
     '[{"id":"a","text":"The boundary layer first becomes turbulent","correct":false},{"id":"b","text":"Flow at the surface has ceased entirely (about to reverse)","correct":true},{"id":"c","text":"The chord line meets the camber line","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s9_id, 'As angle of attack increases towards the stall, the boundary layer separation point on a normal subsonic aerofoil:',
     '[{"id":"a","text":"Moves progressively forward, towards the leading edge","correct":true},{"id":"b","text":"Moves progressively aft, towards the trailing edge","correct":false},{"id":"c","text":"Remains fixed at the trailing edge until the stall","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s9_id, 'The wing is said to stall when:',
     '[{"id":"a","text":"The separation point first appears anywhere on the wing","correct":false},{"id":"b","text":"Flow over the upper surface breaks down completely and lift decreases","correct":true},{"id":"c","text":"The aircraft reaches its maximum permitted speed","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s9_id, 'In subsonic flight, an aircraft will generally stall at:',
     '[{"id":"a","text":"A random angle of attack that varies each time","correct":false},{"id":"b","text":"The same critical angle of attack, except at high Reynolds Numbers","correct":true},{"id":"c","text":"An angle of attack that depends only on airspeed","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s9_id, 'At the critical angle of attack:',
     '[{"id":"a","text":"All lift is instantly lost","correct":false},{"id":"b","text":"Lift decreases markedly but some lift remains, even up to angles as high as 90 degrees","correct":true},{"id":"c","text":"Drag instantly drops to zero","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s9_id, 'The most consistent aerodynamic stall warning symptom is:',
     '[{"id":"a","text":"A sudden increase in engine RPM","correct":false},{"id":"b","text":"Buffeting of the control surfaces caused by separated flow passing over the tail","correct":true},{"id":"c","text":"A sudden decrease in cabin pressure","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s9_id, 'Lowering trailing-edge (inboard) flaps can have which effect on pre-stall buffet warning?',
     '[{"id":"a","text":"It always increases the amount of buffet warning","correct":false},{"id":"b","text":"It may reduce the amount of buffet warning due to increased downwash behind the flaps","correct":true},{"id":"c","text":"It has no effect on buffet warning under any circumstances","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s9_id, 'Most aircraft are designed so that, at the critical angle of attack, the pitching moment produced is:',
     '[{"id":"a","text":"Nose-up","correct":false},{"id":"b","text":"Nose-down","correct":true},{"id":"c","text":"Neutral, with no change in pitching moment","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s9_id, 'A wing is deliberately designed to stall progressively from root to tip for all of the following reasons EXCEPT:',
     '[{"id":"a","text":"To retain aileron effectiveness up to the critical angle of attack","correct":false},{"id":"b","text":"To avoid a large rolling moment from one tip stalling before the other","correct":false},{"id":"c","text":"To reduce the aircraft''s total structural weight","correct":true}]',
     '{"B1.1","B1.3","B2"}'),

    (s9_id, 'A rectangular straight wing usually stalls first at the root because:',
     '[{"id":"a","text":"The wingtip vortex reduces the effective angle of attack at the tips","correct":true},{"id":"b","text":"The root has a smaller local chord than the tip","correct":false},{"id":"c","text":"The root always has a sharper leading edge than the tip","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s9_id, 'A tapered wing tends to aggravate tip stalling because:',
     '[{"id":"a","text":"The tip has a larger chord and therefore a higher local Reynolds Number","correct":false},{"id":"b","text":"The tip has a smaller chord and therefore a lower local Reynolds Number","correct":true},{"id":"c","text":"Taper eliminates the wingtip vortex entirely","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s9_id, 'Which wingtip stall prevention feature works by reducing built-in incidence towards the tips?',
     '[{"id":"a","text":"Root spoiler","correct":false},{"id":"b","text":"Washout","correct":true},{"id":"c","text":"Slats and slots","correct":false}]',
     '{"B1.1","B1.3","B2"}');

END $$;
