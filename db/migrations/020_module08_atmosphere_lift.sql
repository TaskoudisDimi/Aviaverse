-- Module 08: Basic Aerodynamics (B1/B2 Common) — The Atmosphere, Airspeed, Airflow and Lift, Basic Aerodynamic Theory
-- Source: EASA Part-66 Module 08 official textbook (IKAROS Aviation Training Centre, IK M8, Issue Oct.2012)

DO $$
DECLARE
    m08_id INT;
    s1_id  INT;
    s2_id  INT;
    s3_id  INT;
    s4_id  INT;
BEGIN
    SELECT id INTO m08_id FROM easa_modules WHERE code = 'M08';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M08.1') THEN
        RAISE NOTICE 'M08.1-M08.4 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 08.1: The Atmosphere
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m08_id, 'M08.1', 'The Atmosphere',
        $cnt$
# The Atmosphere

## The Four Atmospheric Layers

The Earth's atmosphere is considered to consist of four gaseous layers. Working outward from the Earth's surface, these are the **troposphere**, the **stratosphere**, the **ionosphere** and, finally, the **exosphere** — the outermost layer.

| Layer | Extent | Characteristics |
|-------|--------|------------------|
| **Troposphere** | Surface up to approx. 5 miles at the poles, up to approx. 10 miles at the equator | Turbulent, gusty conditions; where most cloud forms |
| **Stratosphere** | From the tropopause up to approx. 50–70 miles above the surface | Tranquil / non-turbulent; winds can be high velocity but are steady, not gusty |
| **Ionosphere** | From the stratopause up to the exosphere | Not considered in aircraft aerodynamics |
| **Exosphere** | Outermost layer | Not considered in aircraft aerodynamics |

The boundary between the troposphere and the stratosphere is called the **tropopause**. The boundary between the stratosphere and the ionosphere is called the **stratopause**.

Aircraft operate within the troposphere and the lower regions of the stratosphere, so the ionosphere and exosphere are not relevant to aircraft aerodynamics.

## Composition of Air

At sea level, air is a mixture of gases, principally nitrogen and oxygen, with argon, carbon dioxide and other gases of secondary importance.

| Gas | Symbol | % (approx.) |
|-----|--------|-------------|
| Nitrogen | N₂ | 78 |
| Oxygen | O₂ | 21 |
| Argon | A | 0.9 |
| Carbon Dioxide | CO₂ | 0.05 |
| Other gases | — | trace |

This composition is practically constant up to an altitude of about **50 miles**. Although air is a mixture of gases, for aerodynamic calculations it is treated as a uniform gas, so the gas laws (Boyle's, Charles' and the Combined Gas Law) can, within reasonable limits, be applied to it.

Air has weight and is compressible. Its **pressure, density and temperature all decrease with an increase in altitude**.

## Atmospheric Temperature

Air in contact with the Earth's surface is heated by conduction and radiation. This reduces its density, causing it to rise; as it rises the surrounding pressure drops, allowing the air to expand, and this expansion causes its temperature to fall.

- Standard sea level temperature: **15°C (59°F)**
- Temperature falls steadily with altitude, up to the tropopause, at a rate called the **lapse rate**
- Lapse rate: **1.98°C per 1,000 ft** (**0.65°C per 100 m**)
- This lapse rate applies up to approximately **36,090 ft**, above which temperature remains constant at approximately **−56°C**

## Humidity

The quantity of water vapour in the atmosphere is relatively small, ranging from a trace up to a maximum of about 4–5%. The capacity of air to hold water vapour increases with temperature; air is **saturated** when it can hold no additional vapour at its existing temperature.

### Relative Humidity

**Relative humidity** is the ratio of the amount of water vapour actually in the air to the amount that would saturate it at the same temperature, expressed as a percentage. Colder air can hold less moisture, so — like pressure, temperature and density — humidity decreases with an increase in altitude.

Water vapour, by itself, weighs approximately **5/8 of an equal volume of dry air** (because water is composed of hydrogen — an extremely light gas — and oxygen, whereas air is mainly nitrogen (78%) and oxygen (21%), both heavier than hydrogen). Consequently, assuming temperature and pressure remain the same, **humid air is less dense than dry air**: on damp days, air density is lower than on dry days.

## Atmospheric Pressure

The atmosphere is held against the Earth's surface by gravity, which produces atmospheric pressure. Gravitational effects decrease with altitude, so atmospheric pressure also decreases steadily with altitude.

Atmospheric pressure may be expressed in pounds per square inch, inches or millimetres of mercury, or millibars.

**Standard sea level pressure:**
- **14.69 lb/sq in** (101 kN/m²)
- **29.92 in** or **760 mm** of mercury
- **1013.25 millibars (mb)**

Atmospheric pressure at any point equals the weight of a column of air of unit cross-section extending from that point to the top of the atmosphere. A column of air of one square inch cross-section, from the surface to the edge of the atmosphere, weighs 14.69 lb and so exerts a pressure of 14.69 lb/sq in at sea level. If that same column is measured starting from 10,000 ft, 20,000 ft and 30,000 ft, the pressures exerted are approximately **10.1, 6.7 and 4.2 lb/sq in** respectively. At the tropopause, pressure has fallen to about **a quarter of its sea level value**.

## Air Density

**Air density** is the mass of air in a given volume (mass per unit volume). It is a variable quantity, depending on atmospheric pressure, temperature and humidity:

- Density **increases** with an increase in atmospheric pressure
- Density **decreases** with an increase in air temperature
- Density **decreases** with an increase in humidity

With an increase in altitude, the reduction in atmospheric pressure is the **dominant factor**, so air density reduces steadily with an increase in altitude.

## Viscosity and the Boundary Layer

Air, being a fluid, has **viscosity** — the property that tends to resist relative motion within itself. If adjacent layers of air move at different velocities, viscous forces tend to slow the faster layer and speed up the slower one.

Because air is viscous, any object moving through it drags a group of air particles with it. The layer of air immediately next to the object's surface is pulled along at approximately the speed of the object (viscous adhesion); layers progressively further from the surface are dragged along at reduced velocity, until a distance is reached where the object's movement has no further effect on the surrounding air.

The layer of air extending from an object's surface to the point where this dragging effect ceases is known as the **boundary layer**. The boundary layer may be **laminar** or **turbulent**.

## International Standard Atmosphere (ISA)

Real atmospheric conditions vary around the world and change continually — even hourly — and neither pressure nor density decreases uniformly with altitude. For this reason, all aerodynamic measurements and calculations are based on an agreed reference model: the **International Standard Atmosphere (ISA)**.

ISA is based on observations taken at **45° latitude, north and south**, and its values were agreed by the **International Civil Aviation Organisation (ICAO)**. ISA assumes:
- Temperature decreases at **0.65°C per 100 m** (**1.98°C per 1,000 ft**) with increasing altitude, up to **36,098 ft (11,000 m)**
- Above that height, temperature remains constant at **−56°C** up to 65,000 ft

**ISA mean sea level values:**

| Quantity | Value |
|----------|-------|
| Pressure | **1013.25 millibars (mb)**, 14.69 lb/sq in, 29.92 in or 760 mm of mercury |
| Density | **1.225 kg/m³** (0.077 lb/ft³) |
| Temperature | **15°C**, 59°F, 288 K |

*Note: the millibar does not strictly conform to SI, and is being replaced internationally by the hectopascal (hPa), which is numerically identical — 1013.25 mb = 1013.25 hPa, so gas-law and equation-of-state calculations are unaffected.*

### Selected ISA Values

| Altitude (ft) | Altitude (m) | Density (kg/m³) | Pressure (mb) | Temperature (°C) |
|---------------|--------------|------------------|----------------|-------------------|
| 0 | 0 | 1.225 | 1013.25 | 15 |
| 6,562 | 2,000 | 1.007 | 795 | 2 |
| 13,124 | 4,000 | 0.819 | 612 | −11 |
| 19,686 | 6,000 | 0.660 | 472 | −24 |
| 26,248 | 8,000 | 0.526 | 357 | −37 |
| 32,810 | 10,000 | 0.414 | 265 | −50 |
| 39,372 | 12,000 | 0.312 | 194 | −56.5 |
| 45,934 | 14,000 | 0.228 | 142 | −56.5 |
| 52,496 | 16,000 | 0.166 | 104 | −56.5 |

*Note: ICAO ISA is an assumed reference state for comparing aircraft/engine performance and calibrating instruments — actual conditions on any given day are unlikely to match it exactly.*

## Equation of State

To calculate ISA values up to the tropopause, the **Equation of State** for a perfect gas is used:

**p = ρRT**

where:
- p = pressure (millibars)
- ρ = density (kg/m³)
- T = temperature (Kelvin)
- R = gas constant for air = **2.872**

## The Gas Laws

A perfect gas obeys **Boyle's Law** and the **Laws of Charles**. Permanent gases such as oxygen, nitrogen, hydrogen, and air under normal conditions, follow these laws closely enough that the simple perfect-gas equations may be applied.

### Boyle's Law
If the temperature of a given quantity of a perfect gas is held constant during a change of pressure and volume, the volume varies inversely as the pressure:

**pV = constant**

### Charles' Law (Constant Pressure)
If pressure is held constant, volume increases by 1/273 of its value at 0°C for every 1°C rise in temperature:

**V / T = constant**, i.e. **V₁/T₁ = V₂/T₂**

### Charles' Law (Constant Volume)
If volume is held constant, pressure increases by 1/273 of its value at 0°C for every 1°C rise in temperature:

**P / T = constant**, i.e. **P₁/T₁ = P₂/T₂**

### Combined Gas Law
Boyle's Law and both forms of Charles' Law combine into a single equation:

**P₁V₁/T₁ = P₂V₂/T₂**

where P₁V₁/T₁ are the sea level values and P₂V₂/T₂ are the values at altitude. Given the temperature and pressure at any altitude, this equation allows air density at that altitude to be estimated.

### Worked Example

*Given: air density at sea level is 1.225 kg/m³ when pressure is 1013 mb and temperature is 15°C (288 K). Find the density of air at 8,000 m, where temperature is −37°C (236 K) and pressure is 357 mb.*

| | Sea Level | 8,000 m |
|---|-----------|---------|
| Pressure | P₁ = 1013 mb | P₂ = 357 mb |
| Volume | V₁ = 1 m³ | V₂ = unknown |
| Temperature | T₁ = 288 K | T₂ = 236 K |

Using P₁V₁/T₁ = P₂V₂/T₂, rearranged for V₂:

**V₂ = (P₁ × V₁ × T₂) / (T₁ × P₂) = (1013 × 1 × 236) / (288 × 357) = 2.33 m³**

So 1 m³ of air at sea level expands to 2.33 m³ at 8,000 m, but still has a mass of 1.225 kg. Density at 8,000 m:

**ρ = mass / volume = 1.225 / 2.33 = 0.526 kg/m³**

This matches the ISA table value of 0.526 kg/m³ at 8,000 m, confirming the calculation.
        $cnt$,
        1
    ) RETURNING id INTO s1_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 08.2: Airspeed
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m08_id, 'M08.2', 'Airspeed',
        $cnt2$
# Airspeed

## Introduction

To study airflow physics it is necessary to examine how airspeed is measured, because the simple instruments used in aircraft take no account of the difference between actual atmospheric conditions and ISA conditions. Since the conventional Airspeed Indicator (ASI) is calibrated according to ISA, its reading can be corrected to obtain a true value of airspeed **in the conditions in which the aircraft is actually flying**.

## ASI Principle

Any body moving through the air experiences an increase in pressure because air "piles up" ahead of it. If the body is considered fixed and the air is considered to be moving instead, this pressure is proportional to the **kinetic energy** of the air.

The kinetic energy of a solid object is given by **E = ½MV²**. To find the kinetic energy of air, a unit mass — or the mass of a unit volume, i.e. **density (ρ)** — must be used instead of M. The formula becomes:

**Dynamic pressure = ½ρV²**

This is considered **the most important expression in aerodynamics**.

The ASI compares two pressures:
- The pressure due to the aircraft's forward speed, sensed by the **Pitot tube**
- The pressure due to the aircraft's height, the **static pressure**

The difference between the two is displayed on a scale that has been converted from a pressure reading to a speed reading.

## Airspeed Definitions

### Indicated Airspeed (IAS)

The raw reading taken directly from the Airspeed Indicator. Due to its mechanical simplicity, the ASI is not 100% accurate: manufacturing tolerances and wear in use cause indication errors. These errors must not exceed **2 knots or 2 mph** and are checked when the instrument is new and at regular intervals thereafter. The errors recorded at every point on the scale are used in calculating Calibrated Airspeed.

### Calibrated Airspeed (CAS)

Airflow patterns around an aircraft vary with speed and altitude, so the Pitot/static pressure sensor does not always measure true pressure values — this is called **pressure (position) error**. Because this variation is the same for all aircraft of a given type, the manufacturer determines correction figures by experimental (flight test) analysis, and these are published in the aircraft's Flight Manual.

The published pressure error corrections (specific to the aircraft type) are combined mathematically with the instrument calibration values (specific to the individual instrument) and the result is recorded on a **correction card** used by the pilot to convert IAS to CAS.

- In British aviation, CAS is also known as **Rectified Airspeed**
- In the USA it is also known as **True Indicated Airspeed**

### True Airspeed (TAS)

To obtain an accurate airspeed, actual atmospheric temperature and pressure must be taken into account. Since these vary continuously in flight, the pilot feeds **Calibrated Airspeed**, **Outside Air Temperature** and **Height (pressure)** into a calculator (or air data computer) to obtain **True Airspeed**. TAS is only "true" at the instant the calculation is made.

### Equivalent Airspeed (EAS)

To obtain results from wind-tunnel experiments that have universal application, airspeed must be expressed against a Standard Atmosphere reference. This is achieved by applying a correction factor based on the ratio of the ambient air density (used to calculate TAS) to standard (ISA sea level) density. **Equivalent Airspeed** is used in compiling aircraft performance charts and flight envelope graphs.

## Summary of the Conversion Chain

| Step | From | To | Correction applied |
|------|------|-----|---------------------|
| 1 | Raw instrument reading | **IAS** | (none — raw reading) |
| 2 | IAS | **CAS** | Instrument calibration error + pressure (position) error |
| 3 | CAS | **TAS** | Outside Air Temperature and height (pressure altitude) |
| 4 | (Ambient density basis) | **EAS** | Ratio of ambient density to standard (ISA) density |
        $cnt2$,
        2
    ) RETURNING id INTO s2_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 08.3: Airflow and Lift
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m08_id, 'M08.3', 'Airflow and Lift',
        $cnt3$
# Airflow and Lift

## Introduction

Several theories have been developed to predict the performance of a wing/aerofoil shape. This module covers only the **Equation of Continuity** and **Bernoulli's Theorem**, which together explain lift in terms of pressure distribution. Other theories that exist but are not covered here include Momentum Theory, Circulation Theory and Dimensional Analysis.

### Pressure Distribution

Examining the flow pattern and pressure distribution on a wing's surface is the most useful non-mathematical method of understanding lift, based on experimental (wind-tunnel) data. It is a qualitative approach with limitations, and some facts can only be shown by experiment or by mathematics.

The airflow pattern around an aircraft at low speed depends mainly on:
- The **shape** of the aircraft
- Its **attitude** relative to the free-stream flow
- The **size** of the aircraft
- The **density and viscosity** of the air
- The **speed** of the airflow

Size, density, viscosity and speed are combined into a single parameter called the **Reynolds Number (R)**. Once R is known, the airflow pattern depends only on shape, attitude and Reynolds Number. Reynolds Number and the condition of the surface determine the characteristics of the **boundary layer**, which in turn modifies the airflow pattern and pressure distribution.

The boundary layer's effect on lift is **insignificant** through the normal operating range of angles of attack, but has a **profound effect** on lift at high angles of attack (approaching the stall).

It makes no difference to the airflow pattern whether the aircraft is moving through still air or the air is flowing past a stationary aircraft — it is the **relative velocity** between air and aircraft that matters.

## Types of Flow

### Steady Streamline Flow

Flow parameters (speed, direction, pressure, etc.) may vary from point to point, but at any given point they remain **constant with respect to time**. This type of flow can be represented by streamlines and is the flow pattern hoped for over aircraft components. It divides into two types:

- **Classical Linear Flow** — found over a conventional aerofoil at low incidence; streamlines closely follow the contour of the body and there is no separation of flow from the surface.
- **Controlled Separated Flow (Leading Edge Vortex Flow)** — a halfway stage between steady streamline flow and unsteady flow. Due to boundary layer effects, typically at a sharp leading edge, the flow separates from the surface but — rather than breaking down into chaotic turbulence — forms a strong, stable and predictable vortex that can be controlled to generate a useful lift force. This is found on swept and delta planforms, particularly at higher angles of incidence.

### Unsteady Flow

Flow parameters vary with **time**, so the flow cannot be represented by streamlines.

### Two-Dimensional Flow

Occurs when a wing has infinite span, or completely spans a wind tunnel wall-to-wall (except near the walls): every part of the wing then experiences the same flow pattern, and the motion is confined to a plane parallel to the free-stream direction.

As air flows around the aircraft, its speed changes. In subsonic flow:
- A **reduction** in streamline velocity is shown by **increased spacing** between streamlines
- An **increase** in velocity is shown by **decreased spacing** between streamlines

Corresponding pressure changes accompany these velocity changes. As air approaches an aerofoil it is turned toward the low pressure (partial vacuum) region on the upper surface — this is called **upwash**. After passing over the aerofoil, the airflow returns to its original position and state — this is called **downwash**.

Pressure differences between upper and lower surfaces are usually expressed relative to ambient pressure using "−" and "+". In practice the pressure above the aerofoil is usually much lower than ambient, and the pressure below is usually only slightly lower than ambient (except at high angles of attack) — i.e. **both are typically negative relative to ambient**.

### Three-Dimensional Flow

A real wing has a finite length (a wingtip). Wherever lift is being produced, the pressure differential between the upper (low pressure) and lower (higher pressure) surfaces tries to equalise around the wingtip. This induces a **spanwise drift** of air over the wing — inward on the upper surface, outward on the lower surface — producing three-dimensional flow. This spanwise effect is strongest at the tip and progressively weaker toward the wing root.

Where the upper and lower airflows meet at the trailing edge, they form vortices — small near the wing root, growing larger toward the tip, merging into one large vortex near the wingtip. Viewed from the rear, this vortex rotates **clockwise on the port wing** and **anticlockwise on the starboard wing**.

Because of this "tip spillage," a real (finite-span) wing can **never produce as much lift as an equivalent infinite-span wing**. If a wing has constant section and angle of incidence from root to tip, the lift per unit span is virtually constant until about **1.2 chord lengths** from the wingtip.

The overall size of the trailing-edge vortex depends on the amount of spanwise (transverse) flow — the greater the pressure difference (and hence lift force), the larger the vortex. The familiar thin white vapour streaks seen behind wingtips show only the low-pressure central core of the vortex; the actual influence on the airflow behind the trailing edge is considerably more extensive than it appears.
        $cnt3$,
        3
    ) RETURNING id INTO s3_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 08.4: Basic Aerodynamic Theory
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m08_id, 'M08.4', 'Basic Aerodynamic Theory',
        $cnt4$
# Basic Aerodynamic Theory

## General

The shape of the aircraft (together with the boundary layer) determines the velocity changes in the airflow around it, and consequently the airflow pattern and pressure distribution. A simplified explanation of why these changes occur requires two principles:

- The **Equation of Continuity**
- **Bernoulli's Theorem**

## The Equation of Continuity

The Equation of Continuity states, in essence, that **mass can neither be created nor destroyed** — air mass flow is constant.

Consider streamline flow of air through a venturi tube. The air mass flow (mass per unit time) is the product of the cross-sectional area (A), the flow velocity (V), and the density (ρ). This product remains constant at every point along the tube:

**A × ρ × V = constant**

This general equation applies to both compressible and incompressible fluids.

In compressible flow theory, it is convenient to assume that changes in fluid density are insignificant at speeds below about **0.4 Mach**, because pressure changes are small and have little effect on density. Below 0.4M, the equation of continuity simplifies to:

**A × V = constant**, i.e. **V = constant / A**

From this it follows that a **reduction in cross-sectional area produces an increase in velocity**, and vice versa — the venturi effect. This equation allows velocity changes around a given shape to be predicted mathematically.

## Bernoulli's Theorem

A gas in steady motion possesses several forms of energy:
- Potential energy (due to height)
- Heat energy
- Pressure energy
- Kinetic energy (due to motion)

Work and heat may also pass into or out of the system.

Daniel Bernoulli demonstrated that in the **steady streamline flow** of an **ideal fluid**, the sum of these energies remains constant. The italicised conditions — steady streamline flow, ideal fluid — represent the limits within which Bernoulli's theorem strictly holds.

In low subsonic flow (below about 0.4M), it is convenient to treat air as **incompressible and inviscid** (i.e. ideal), and predictions of pressure changes around an aerofoil made on this basis agree closely with measured values. Above 0.4M, these simplifications cause significant errors and are no longer valid.

In low subsonic flow, Bernoulli's Theorem can be simplified further by assuming changes in potential energy and heat energy are insignificant, with no heat or work transfer. For the streamline flow of air around a wing at low speed:

**Pressure Energy + Kinetic Energy = constant**

Expressed in terms of pressure:

**p + ½ρV² = constant**

where p = static pressure, ρ = density, and V = flow velocity.

In words: **static pressure + dynamic pressure = a constant**. This constant is known as the **Total Head Pressure**, **stagnation pressure**, or **Pitot pressure**.

Since flow velocity is governed by aircraft shape, Bernoulli's Theorem shows that an **increase in velocity causes a decrease in static pressure**, and vice versa.

**Dynamic pressure = ½ρV²** is commonly abbreviated to **q** when detailed calculation is not required.

## Pressure Distribution Round an Aerofoil

Although the whole aircraft contributes to lift and drag, the wing is designed to produce the lift needed for the whole aircraft. Examining pressure distribution around the wing is the most convenient non-mathematical way to see how lift is produced.

Pressure distribution is traditionally measured using a **manometer** — a series of glass tubes filled with coloured liquid, connected to small pressure-tapping holes in the aerofoil surface. As air flows over the aerofoil, pressure variations are shown by differing fluid levels in the tubes. These readings are in **absolute pressure**, and are usually compared against ambient (free-stream static) pressure to visualise the lifting effect.

The pressure at any point on the aerofoil surface can be represented by a vector perpendicular to the surface, with length proportional to the difference between the absolute pressure (p) at that point and the free-stream static pressure (p₀), i.e. proportional to (p − p₀). This is converted to a non-dimensional **pressure coefficient (Cp)** by dividing by the free-stream dynamic pressure (q):

**Cp = (p − p₀) / q**

**Plotting convention:**
- Measured pressure **higher** than ambient → (p − p₀) is positive → **positive Cp**, plotted **toward** the surface
- Measured pressure **lower** than ambient → (p − p₀) is negative → **negative Cp**, plotted **away from** the surface

**Worked example — the leading edge stagnation point**, where the air is brought completely to rest: absolute pressure there equals total head pressure = free-stream static pressure + free-stream dynamic pressure = p₀ + q. So:

**Cp = (p₀ + q − p₀) / q = q / q = 1**

Each Cp vector has a component perpendicular to the free-stream flow, which is by definition a **lift component** — since it is expressed in coefficient form, it is the **local lift coefficient** at that point. Summing all the upward-pointing lift components and subtracting the downward-pointing ones across the whole pressure distribution gives the **total lift coefficient** for the aerofoil.

Two important facts emerge from inspecting pressure distribution diagrams as angle of attack changes:
- The **lift coefficient increases with an increase in angle of attack**
- The **centre of pressure (CP) moves forward with an increase in angle of attack**

Pressure distribution is often plotted as a graph with Cp plotted perpendicular to the **chord line** (rather than perpendicular to the surface, as in the vector diagrams). By convention, negative Cp values are plotted **upward** on this graph, so that the plot visually relates to the natural sense of lift.

## Summary

**Airflow pattern (and therefore lift) depends upon:**
- Angle of attack (incidence)
- Shape (thickness/chord ratio, camber)
- Density of the air
- Viscosity, size and speed — combined into the **Reynolds Number**

**Equation of Continuity:**
- Air mass flow is constant
- Cross-sectional area × velocity × density = constant, i.e. **A·V·ρ = k**
- Assuming density changes are negligible: **A·V = k**, so **V = k / A**
- A reduced cross-sectional area (A) gives a greater velocity — the venturi effect

**Bernoulli's Theorem:**
- Pressure energy + kinetic energy = constant, i.e. **p + ½ρV² = k**
- Static pressure + dynamic pressure = constant
- This constant, p + ½ρV², is the **total head, stagnation, or Pitot pressure**
        $cnt4$,
        4
    ) RETURNING id INTO s4_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M08.1 The Atmosphere (14 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s1_id, 'Working outward from the Earth''s surface, what is the correct order of the four atmospheric layers?',
     '[{"id":"a","text":"Troposphere, stratosphere, ionosphere, exosphere","correct":true},{"id":"b","text":"Stratosphere, troposphere, exosphere, ionosphere","correct":false},{"id":"c","text":"Troposphere, ionosphere, stratosphere, exosphere","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'The troposphere extends from the Earth''s surface to approximately:',
     '[{"id":"a","text":"5 miles at the poles and 10 miles at the equator","correct":true},{"id":"b","text":"10 miles at the poles and 5 miles at the equator","correct":false},{"id":"c","text":"50 miles at the poles and equator alike","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'The boundary between the troposphere and the stratosphere is called the:',
     '[{"id":"a","text":"Stratopause","correct":false},{"id":"b","text":"Tropopause","correct":true},{"id":"c","text":"Ionopause","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'Compared with the troposphere, conditions in the stratosphere are:',
     '[{"id":"a","text":"More turbulent, with gusty winds","correct":false},{"id":"b","text":"Tranquil, with steady (not gusty) high-velocity winds","correct":true},{"id":"c","text":"Completely calm, with no winds at all","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'The approximate percentage composition of dry air at sea level is:',
     '[{"id":"a","text":"78% nitrogen, 21% oxygen","correct":true},{"id":"b","text":"21% nitrogen, 78% oxygen","correct":false},{"id":"c","text":"50% nitrogen, 50% oxygen","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'The standard temperature at sea level under ISA is:',
     '[{"id":"a","text":"0°C (32°F)","correct":false},{"id":"b","text":"15°C (59°F)","correct":true},{"id":"c","text":"25°C (77°F)","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'The standard atmospheric lapse rate is approximately:',
     '[{"id":"a","text":"1.98°C per 1,000 ft (0.65°C per 100 m)","correct":true},{"id":"b","text":"3.5°C per 1,000 ft (1.2°C per 100 m)","correct":false},{"id":"c","text":"0.98°C per 100 ft (3.2°C per 100 m)","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'Above approximately 36,090 ft, standard temperature is assumed to:',
     '[{"id":"a","text":"Continue falling at the same lapse rate indefinitely","correct":false},{"id":"b","text":"Remain constant at approximately −56°C","correct":true},{"id":"c","text":"Begin rising again with altitude","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'Compared to dry air at the same temperature and pressure, air containing water vapour (humid air) is:',
     '[{"id":"a","text":"Denser, because water vapour is heavier than dry air","correct":false},{"id":"b","text":"Less dense, because water vapour is lighter than dry air","correct":true},{"id":"c","text":"Exactly the same density regardless of humidity","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'Standard sea level atmospheric pressure under ISA is:',
     '[{"id":"a","text":"1013.25 millibars","correct":true},{"id":"b","text":"760 millibars","correct":false},{"id":"c","text":"29.92 millibars","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'At the tropopause, atmospheric pressure has fallen to approximately:',
     '[{"id":"a","text":"Half its sea level value","correct":false},{"id":"b","text":"A quarter of its sea level value","correct":true},{"id":"c","text":"A tenth of its sea level value","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'As altitude increases, the dominant factor causing air density to decrease is:',
     '[{"id":"a","text":"The reduction in atmospheric pressure","correct":true},{"id":"b","text":"The increase in humidity","correct":false},{"id":"c","text":"The increase in temperature","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'The layer of air extending from an object''s surface to the point where the object''s movement no longer drags the air along is called the:',
     '[{"id":"a","text":"Tropopause","correct":false},{"id":"b","text":"Boundary layer","correct":true},{"id":"c","text":"Stagnation layer","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'Using the Combined Gas Law, air at sea level (P₁ = 1013 mb, V₁ = 1 m³, T₁ = 288 K) is taken to 8,000 m where P₂ = 357 mb and T₂ = 236 K. What is the resulting volume V₂?',
     '[{"id":"a","text":"Approximately 1.00 m³","correct":false},{"id":"b","text":"Approximately 2.33 m³","correct":true},{"id":"c","text":"Approximately 4.66 m³","correct":false}]',
     '{"B1.1","B1.3","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M08.2 Airspeed (11 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s2_id, 'Why must the reading of a conventional Airspeed Indicator be corrected for actual flight conditions?',
     '[{"id":"a","text":"Because the ASI is calibrated in accordance with ISA conditions, not actual conditions","correct":true},{"id":"b","text":"Because the ASI only works below 10,000 ft","correct":false},{"id":"c","text":"Because the ASI measures groundspeed, not airspeed","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'Dynamic pressure, considered the most important expression in aerodynamics, is given by:',
     '[{"id":"a","text":"ρV","correct":false},{"id":"b","text":"½ρV²","correct":true},{"id":"c","text":"ρ²V","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'The Airspeed Indicator derives its reading by comparing:',
     '[{"id":"a","text":"Pitot (total) pressure with static pressure","correct":true},{"id":"b","text":"Fuel pressure with hydraulic pressure","correct":false},{"id":"c","text":"Cabin pressure with outside air pressure","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'The raw, uncorrected reading taken directly from the Airspeed Indicator is called:',
     '[{"id":"a","text":"True Airspeed (TAS)","correct":false},{"id":"b","text":"Indicated Airspeed (IAS)","correct":true},{"id":"c","text":"Equivalent Airspeed (EAS)","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'The maximum acceptable indication error for an Airspeed Indicator is:',
     '[{"id":"a","text":"2 knots or 2 mph","correct":true},{"id":"b","text":"10 knots or 10 mph","correct":false},{"id":"c","text":"0.5 knots or 0.5 mph","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'Calibrated Airspeed (CAS) corrects Indicated Airspeed for:',
     '[{"id":"a","text":"Compressibility effects only","correct":false},{"id":"b","text":"Instrument calibration error and pressure (position) error","correct":true},{"id":"c","text":"Wind drift only","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'In British aviation terminology, Calibrated Airspeed is also known as:',
     '[{"id":"a","text":"Rectified Airspeed","correct":true},{"id":"b","text":"True Indicated Airspeed","correct":false},{"id":"c","text":"Ground Corrected Airspeed","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'In American aviation terminology, Calibrated Airspeed is also known as:',
     '[{"id":"a","text":"Rectified Airspeed","correct":false},{"id":"b","text":"True Indicated Airspeed","correct":true},{"id":"c","text":"Equivalent True Airspeed","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'To convert Calibrated Airspeed into True Airspeed, a pilot must additionally input:',
     '[{"id":"a","text":"Outside Air Temperature and height (pressure)","correct":true},{"id":"b","text":"Fuel remaining and aircraft weight","correct":false},{"id":"c","text":"Magnetic heading and wind direction","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'True Airspeed (TAS), once calculated, is:',
     '[{"id":"a","text":"Permanently accurate for the remainder of the flight","correct":false},{"id":"b","text":"Only true at the moment the calculation is made","correct":true},{"id":"c","text":"Only valid below the tropopause","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'Equivalent Airspeed (EAS) is obtained by applying a correction factor based on:',
     '[{"id":"a","text":"The ratio of ambient air density to standard (ISA) density","correct":true},{"id":"b","text":"The ratio of aircraft weight to wing area","correct":false},{"id":"c","text":"The ratio of Mach number to true airspeed","correct":false}]',
     '{"B1.1","B1.3","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M08.3 Airflow and Lift (13 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s3_id, 'The two theories used in this module to explain lift by pressure distribution are:',
     '[{"id":"a","text":"Momentum Theory and Circulation Theory","correct":false},{"id":"b","text":"The Equation of Continuity and Bernoulli''s Theorem","correct":true},{"id":"c","text":"Dimensional Analysis and Boundary Layer Theory","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'Size, density, viscosity and speed of the airflow are combined into a single parameter known as:',
     '[{"id":"a","text":"The Mach Number","correct":false},{"id":"b","text":"The Reynolds Number","correct":true},{"id":"c","text":"The Pressure Coefficient","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'Through the normal range of angles of attack, the effect of the boundary layer on lift produced is:',
     '[{"id":"a","text":"Insignificant","correct":true},{"id":"b","text":"The dominant factor determining lift","correct":false},{"id":"c","text":"Equal to the effect of Reynolds Number alone","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'When considering airflow pattern around an aircraft, the important factor is:',
     '[{"id":"a","text":"Whether the aircraft or the air is actually moving","correct":false},{"id":"b","text":"The relative velocity between the air and the aircraft","correct":true},{"id":"c","text":"The absolute velocity of the aircraft over the ground","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'In steady streamline flow, the flow parameters at any given point:',
     '[{"id":"a","text":"Are constant with respect to time, though they may vary from point to point","correct":true},{"id":"b","text":"Vary continuously with time at every point","correct":false},{"id":"c","text":"Are identical at every point in the flow field","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'Classical Linear Flow over a conventional aerofoil at low incidence is characterised by:',
     '[{"id":"a","text":"Streamlines that follow the contour of the body with no flow separation","correct":true},{"id":"b","text":"Complete separation of flow from the leading edge","correct":false},{"id":"c","text":"Chaotic, turbulent flow throughout","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'Leading Edge Vortex Flow (Controlled Separated Flow) is typically found on:',
     '[{"id":"a","text":"Straight, unswept low-speed wings at low incidence","correct":false},{"id":"b","text":"Swept and delta planforms, particularly at higher angles of incidence","correct":true},{"id":"c","text":"Helicopter rotor blades only","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'Unsteady flow cannot be represented by streamlines because:',
     '[{"id":"a","text":"The flow parameters vary with time","correct":true},{"id":"b","text":"The flow is always two-dimensional","correct":false},{"id":"c","text":"Streamlines only apply to supersonic flow","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'In subsonic two-dimensional flow, increased spacing between streamlines indicates:',
     '[{"id":"a","text":"An increase in flow velocity","correct":false},{"id":"b","text":"A reduction in flow velocity","correct":true},{"id":"c","text":"No change in flow velocity","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'As air approaches an aerofoil, it is turned toward the low-pressure region on the upper surface. This effect is known as:',
     '[{"id":"a","text":"Downwash","correct":false},{"id":"b","text":"Upwash","correct":true},{"id":"c","text":"Backwash","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'A finite-span (real) wing can never produce as much lift as an infinite-span wing because of:',
     '[{"id":"a","text":"Tip spillage, which produces three-dimensional flow and wingtip vortices","correct":true},{"id":"b","text":"Excessive boundary layer thickness at the wing root","correct":false},{"id":"c","text":"The wing always operating above 0.4 Mach","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'Viewed from the rear of the aircraft, the wingtip vortex rotates:',
     '[{"id":"a","text":"Clockwise on the port wing, anticlockwise on the starboard wing","correct":true},{"id":"b","text":"Anticlockwise on both wings","correct":false},{"id":"c","text":"Clockwise on both wings","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'The overall size of a wingtip vortex depends primarily on:',
     '[{"id":"a","text":"The amount of transverse (spanwise) flow, i.e. the pressure difference producing lift","correct":true},{"id":"b","text":"The colour and finish of the wing surface","correct":false},{"id":"c","text":"The aircraft''s indicated airspeed only, regardless of lift produced","correct":false}]',
     '{"B1.1","B1.3","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M08.4 Basic Aerodynamic Theory (13 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s4_id, 'The Equation of Continuity states that, along a streamline tube:',
     '[{"id":"a","text":"Cross-section area × velocity × density = a constant","correct":true},{"id":"b","text":"Pressure × temperature = a constant","correct":false},{"id":"c","text":"Velocity alone is always constant","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s4_id, 'Below approximately 0.4 Mach, the Equation of Continuity may be simplified to:',
     '[{"id":"a","text":"A × V = constant","correct":true},{"id":"b","text":"ρ × T = constant","correct":false},{"id":"c","text":"P × V² = constant","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s4_id, 'According to the venturi effect, a reduction in cross-sectional area of a flow tube produces:',
     '[{"id":"a","text":"A decrease in flow velocity","correct":false},{"id":"b","text":"An increase in flow velocity","correct":true},{"id":"c","text":"No change in flow velocity","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s4_id, 'Bernoulli''s Theorem, in its basic form, strictly applies to the steady streamline flow of:',
     '[{"id":"a","text":"An ideal (incompressible, inviscid) fluid","correct":true},{"id":"b","text":"Any compressible, turbulent fluid","correct":false},{"id":"c","text":"Only supersonic gas flows","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s4_id, 'Above approximately what Mach number do the simplifications used in Bernoulli''s Theorem cause significant errors?',
     '[{"id":"a","text":"0.1 Mach","correct":false},{"id":"b","text":"0.4 Mach","correct":true},{"id":"c","text":"1.0 Mach","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s4_id, 'The simplified form of Bernoulli''s Theorem, expressed in terms of pressure, is:',
     '[{"id":"a","text":"p + ½ρV² = constant","correct":true},{"id":"b","text":"p − ½ρV² = 0","correct":false},{"id":"c","text":"p × ρ × V = constant","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s4_id, 'In plain words, Bernoulli''s simplified theorem states that:',
     '[{"id":"a","text":"Static pressure minus dynamic pressure is a constant","correct":false},{"id":"b","text":"Static pressure plus dynamic pressure is a constant","correct":true},{"id":"c","text":"Static pressure equals dynamic pressure at every point","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s4_id, 'According to Bernoulli''s Theorem, an increase in flow velocity around an aircraft causes:',
     '[{"id":"a","text":"An increase in static pressure","correct":false},{"id":"b","text":"A decrease in static pressure","correct":true},{"id":"c","text":"No change in static pressure","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s4_id, 'Dynamic pressure (½ρV²) is commonly abbreviated to the symbol:',
     '[{"id":"a","text":"q","correct":true},{"id":"b","text":"k","correct":false},{"id":"c","text":"R","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s4_id, 'The non-dimensional pressure coefficient at a point on an aerofoil surface is defined as:',
     '[{"id":"a","text":"Cp = (p − p₀) / q","correct":true},{"id":"b","text":"Cp = q / (p − p₀)","correct":false},{"id":"c","text":"Cp = p₀ × q","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s4_id, 'At the leading edge stagnation point of an aerofoil, where the air is brought completely to rest, the value of the pressure coefficient (Cp) is:',
     '[{"id":"a","text":"0","correct":false},{"id":"b","text":"1","correct":true},{"id":"c","text":"−1","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s4_id, 'As angle of attack increases, pressure distribution diagrams show that:',
     '[{"id":"a","text":"Lift coefficient increases and the centre of pressure moves forward","correct":true},{"id":"b","text":"Lift coefficient decreases and the centre of pressure moves aft","correct":false},{"id":"c","text":"Neither lift coefficient nor centre of pressure position changes","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s4_id, 'Pressure distribution around an aerofoil in a wind tunnel is traditionally measured using a:',
     '[{"id":"a","text":"Megohmmeter","correct":false},{"id":"b","text":"Manometer","correct":true},{"id":"c","text":"Tachometer","correct":false}]',
     '{"B1.1","B1.3","B2"}');

END $$;
