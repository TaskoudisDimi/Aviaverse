-- Module 15: Gas Turbine Engine (B1) — Fundamentals, Engine Performance, Inlet
-- Source: EASA Part-66 Module 15 B1 - Gas Turbine Engine official textbook (IKAROS Aviation Training Centre)

DO $$
DECLARE
    m15_id INT;
    s1_id  INT;
    s2_id  INT;
    s3_id  INT;
BEGIN
    SELECT id INTO m15_id FROM easa_modules WHERE code = 'M15';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M15.1') THEN
        RAISE NOTICE 'M15.1-M15.3 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 15.1: Fundamentals
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m15_id, 'M15.1', 'Fundamentals',
        $cnt$
# Turbine Engine Fundamentals

A discussion of turbine engines begins with some of the basic physics behind turbine engine operation.

## Energy

Energy is defined as something that gives us the capacity to perform work. Energy can be classified as one of two types: **potential** or **kinetic**.

### Potential Energy

Potential energy is energy at rest, or energy that is stored. It may be classified into three groups:

1. Energy due to **position** (e.g. water in an elevated reservoir, or an airplane raised off the ground on jacks)
2. Energy due to **distortion of an elastic body** (e.g. a stretched bungee cord or a compressed spring)
3. Energy that **produces work through chemical action** (e.g. energy stored in aviation gasoline, food, and storage batteries)

To calculate the potential energy of an object due to its height:

**Potential Energy = Weight × Height**

The answer has units of foot-pounds (ft-lbs) or inch-pounds (in-lbs) — the same units used for work.

*Example: A Boeing 747 weighing 450,000 pounds needs to be raised 4 feet in the air so maintenance can be done on the landing gear.*
**PE = 450,000 lb × 4 ft = 1,800,000 ft-lbs**

Aviation gasoline possesses potential energy because of its chemical nature — it has the potential to release heat energy, based on its British thermal unit (BTU) content. One pound of aviation gas contains **18,900 BTU** of heat energy, and each BTU is capable of **778 ft-lbs** of work. Multiplying 778 by 18,900 shows that one pound of aviation gas is capable of **14,704,200 ft-lbs** of work.

### Kinetic Energy

Kinetic energy is energy in motion. An airplane rolling down the runway or a rotating flywheel on an engine are examples of kinetic energy. Kinetic energy has the same units as potential energy (foot-pounds or inch-pounds):

**Kinetic Energy = ½ × Mass × Velocity²**

Mass is shown as weight ÷ gravity, and velocity is in feet per second, so the result comes out in foot-pounds.

*Example: A Boeing 777 weighing 600,000 lbs is moving down the runway on its takeoff roll with a velocity of 200 fps. How much kinetic energy does the airplane possess?*

**KE = ½ × (600,000 ÷ 32.2) × 200² = 372,670,807 ft-lb**

## Newton's Laws of Motion

The physical laws originated by Sir Isaac Newton are particularly applicable to the operation of turbine engines.

### First Law

Objects at rest tend to remain at rest, and objects in motion tend to remain in motion at the same speed and in the same direction, unless acted on by an external force. This property of matter is called **inertia**. Inertia is responsible for the discomfort felt when an airplane is brought to a sudden halt and passengers are thrown forward in their seats.

### Second Law

When a force acts upon a body, the momentum of that body is changed. The rate of change of momentum is proportional to the applied force. Bodies in motion have the property called **momentum** — a body with great momentum has a strong tendency to remain in motion and is hard to stop.

Based on Newton's second law, the formula for thrust is derived: force equals mass times acceleration.

**F = MA**

Mass equals weight divided by gravity, and acceleration equals velocity final minus velocity initial, divided by time. Putting these together, the formula for thrust becomes:

**Force = Weight × (Velocity Final − Velocity Initial) / (Gravity × Time)**, i.e. **F = W(Vf − Vi) / Gt**

*Example: A turbojet engine is moving 150 lbs of air per second through the engine. The air enters going 100 fps and leaves going 1,200 fps. How much thrust, in pounds, is the engine creating?*

**F = 150(1,200 − 100) / (32.2 × 1) = 5,124 lb of thrust**

### Third Law

For every action there is an equal and opposite reaction — the law of action and reaction. If a force is applied to an object, the object supplies a resistive force exactly equal to and in the opposite direction of the force applied. Forces always occur in pairs: the "acting force" is the force one body exerts on a second body, and the "reacting force" is the force the second body exerts on the first.

When an aircraft propeller pushes a stream of air backward with a force of 500 lbs, the air pushes the blades forward with a force of 500 lbs, causing the aircraft to move forward. A turbofan engine exerts a force on the air entering the inlet duct, causing it to accelerate out the fan duct and tailpipe. The air accelerating to the rear is the **action**, and the force inside the engine that makes it happen is the **reaction**, also called **thrust**.

## Bernoulli's Principle

Bernoulli's principle explains the action of a fluid flowing through tubes of varying cross-sectional area. A tube whose cross-sectional area gradually decreases to a minimum diameter in its center section is called a **venturi**. Where the cross-sectional area is decreasing, the passageway is a **converging duct**; where it starts to spread out, it is a **diverging duct**.

**Bernoulli's principle states:** the static pressure of a fluid (liquid or gas) decreases at points where the velocity of the fluid increases, provided no energy is added to nor taken away from the fluid.

In the wide sections of a venturi, the liquid moves at low velocity, producing high static pressure. In the narrow center section, the liquid must contain the same volume of fluid as the two end areas, so it moves at higher velocity, producing lower pressure. The velocity of the air represents kinetic energy, and the static pressure of the air represents potential energy.

Bernoulli's principle is important in understanding how the wing of an airplane generates lift and why the inlet duct of a turbine engine on a subsonic airplane is diverging in shape. Key to the principle is that **total pressure** of the airflow remains the same while static pressure varies:

**Total Pressure = Static Pressure + Dynamic Pressure**

## Boyle's and Charles' Laws

**Boyle's Law** states that when the temperature of a gas is kept constant and the pressure is increased, its volume decreases proportionately (and vice versa). By itself, Boyle's Law is of little use because in practice air is not compressed at a constant temperature.

**Charles' Law** states that if air is heated at a constant pressure, the change in volume will vary with the change in temperature — the volume of a mass of gas at constant pressure is proportional to the temperature of the gas.

Used together, the product of the pressure and volume of the air through each stage within a turbine engine is proportional to the temperature of the air at that stage:

- During **compression**, as work is done to increase pressure and decrease volume, there is a corresponding **rise in temperature**.
- During **combustion**, the addition of fuel increases pressure, with a corresponding **increase in volume**.
- During **exhaust**, there is a **decrease** in pressure and temperature of the gas, with an additional increase in volume.

## Force, Work, Power and Torque

### Force

Force is the intensity of an impetus, or the intensity of an input — for work, power, or torque to exist, there has to be a force that initiates the process. The unit for force in the English system is **pounds**; in the metric system it is **newtons**. One pound of force equals **4.448 newtons**. When calculating thrust, the formula "Force = Mass × Acceleration" is used, and thrust is expressed in pounds. The **GE90-115** turbofan engine (powerplant for the Boeing 777-300) has **115,000 pounds of thrust**.

### Work

Work is done when a resistance is overcome by a force acting through a measurable distance. Two factors are involved: (1) force and (2) movement through a distance. Work is accomplished only when an object is displaced some distance against a resistive force — pushing against something that does not move accomplishes no work by the technical definition.

**Work = Force (F) × Distance (d)**

In the English system, force is in pounds and distance in feet or inches, so the units are foot-pounds or inch-pounds — the same units as potential and kinetic energy. In the metric system, force is in newtons (N) and distance in meters, giving joules. One pound of force equals 4.448 N, and one meter equals 3.28 feet.

*Example: How much work is accomplished when a tow tractor pushes a Boeing 737-800 (weighing 130,000 lbs) 80 ft into the hangar, using a force on the tow bar of 5,000 lbs?*

**Work = Force × distance = 5,000 lbs × 80 ft = 400,000 ft-lbs**

Note that in this example the force used in the calculation is the pull on the tow bar, not the full weight of the airplane — since the airplane is being moved horizontally rather than lifted vertically, it takes far less work to move it than to lift it.

### Power

Power adds the consideration of **time** to work — how long it takes to accomplish the work. The work involved is the same regardless of how long it takes, but the power required differs: doing the same work in less time requires more power.

**Power = Force × distance ÷ time**

Units of power are foot-pounds per minute, foot-pounds per second, inch-pounds per minute or second, and possibly mile-pounds per hour, depending on how distance and time are measured.

Historically, the value of one **horsepower (hp)** was developed to compare the power of the steam engine to that of horses — it was found that the average horse could lift 550 lb, one foot off the ground, in one second:

- 1 hp = 550 ft-lb/s
- 1 hp = 33,000 ft-lb/min
- 1 hp = 375 mile-pounds per hour (mi-lb/hr)
- 1 hp = 746 watts (electricity conversion)

*Example: What power, and horsepower, would be needed to raise a GE-90 turbofan engine weighing 19,000 lb, 4 ft in 2 minutes, to install it on a Boeing 777-300?*

**Power = 19,000 lbs × 4 ft ÷ 2 minutes = 38,000 ft-lbs/min**
**Horsepower = 38,000 ÷ 33,000 = 1.15 hp**

### Torque

Whereas work is a force acting **through** a distance, torque is a force acting **along** a distance — torque creates twisting and tries to make something rotate.

**Torque = Force × distance**

If a wrench 10 inches long is on a bolt, and a force of 10 lbs is pushed down on the end of it, a torque of **100 lb-in** is applied to the bolt — even if the bolt does not move, the torque still exists. The units of work (foot-pounds/inch-pounds) and torque (pound-feet/pound-inches) look similar but are not the same, since work requires actual movement while torque does not.

Torque is important to how turbine engines work — the turbine blades extract energy from the high-velocity exhaust gases, and this energy becomes a force pushing on the turbine blades, which are a certain number of inches from the center of the shaft they are trying to rotate.

## Motion

The study of the relationship between the motion of bodies and the forces acting on them is called the study of "force and motion." The relationship between velocity, acceleration, and distance is known as **kinematics**. Motion is a continuing change of position or place. If the distance an object moves remains the same for a given period of time, the motion is described as **uniform**, and the object has a constant speed.

### Speed and Velocity

**Speed** refers to how fast an object is moving, or how far it will travel in a specific time — it says nothing about direction. **Velocity** denotes both the speed of an object and the direction in which it moves; it is a **vector quantity**. Two velocity vectors (e.g. the velocity of an airplane and the velocity of the wind) can be added together by **vector analysis** to find the resultant.

To calculate speed, distance is divided by elapsed time. If distance is in miles and time in hours, speed is in miles per hour (mph); if distance is in feet and time in seconds, speed is in feet per second (fps). To convert mph to fps, multiply by **1.467**.

### Acceleration

Acceleration is the rate of change of velocity:

**Acceleration (A) = (Velocity Final − Velocity Initial) / Time**

*Example: An F-15 fighter cruising at 400 mph advances to full afterburner and accelerates to 1,200 mph in 20 seconds. What is the average acceleration?*

**A = (1,200 − 400) / 20 = 40 mph/s**, or (× 1.467) **58.7 fps/s**

The acceleration due to gravity is **32.2 fps/s**. Dividing the F-15's acceleration (58.7 fps/s) by 32.2 shows the pilot is experiencing about **1.82 Gs**.

## General Requirements

Aircraft require thrust to produce enough speed for the wings to provide lift, or enough thrust to overcome weight for vertical takeoff. In level flight, thrust must equal and oppose aircraft drag. All heat engines convert heat energy into mechanical energy by the flow of a fluid mass (generally air) through the engine.

Propulsive force is obtained by displacing a working fluid — atmospheric air, in most cases. This is an application of Newton's third law: as air is displaced to the rear of the aircraft, the aircraft is moved forward. (A common misconception is that the displaced air pushes against the air behind the aircraft — this is not true.)

- **Rockets** carry their own oxidizer and do not depend on atmospheric air; they accelerate and displace the total combustion gases.
- **Propellers** (reciprocating or turboprop engines) accelerate a **large mass of air at a relatively lower velocity**.
- **Turbojets, ramjets, and pulse jets** accelerate a **smaller mass of air through a large velocity change**, using the same working fluid for propulsive force as is used within the engine. A problem with these engines is the noise made by the high-velocity exiting air.

"Turbojet" was originally used to describe any gas turbine engine; the term now generally used is "**gas turbine engine**," covering the **turbojet, turbofan, turboprop, and turboshaft**.

All aircraft engines must meet general requirements of **efficiency, economy, and reliability**: economical fuel consumption and cost, low weight-to-horsepower ratio, sustained high-power output with reliability, durability between overhauls, compactness with accessibility for maintenance, freedom from vibration, and the ability to cover a wide range of power output at various speeds and altitudes.

### Power and Weight

The useful output of all aircraft powerplants is **thrust**. A reciprocating engine is rated in **brake horsepower (bhp)**; the gas turbine engine is rated in **thrust horsepower (thp)**:

**Thp = (thrust × aircraft speed in mph) / 375 mile-pounds per hour**

*Example: If a gas turbine is producing 4,000 pounds of thrust and the aircraft is traveling at 500 mph:*

**Thp = (4,000 × 500) / 375 = 5,333.33 thp**

Because horsepower varies with speed, it is not practical to rate or compare turbine engines on a horsepower basis. The engine is seldom held at maximum power for more than 2 minutes; power is soon reduced to a climb power, then further reduced to a cruise power for the duration of the flight.

### Fuel Economy

The basic parameter for describing fuel economy is **specific fuel consumption** — for gas turbines, the fuel flow (lbs/hr) divided by thrust (lbs), called **thrust-specific fuel consumption**. **Equivalent specific fuel consumption** is used for the turboprop engine: fuel flow in lbs/hr divided by the turboprop's equivalent shaft horsepower.

At low speed, reciprocating and turboprop engines have better economy than the pure turbojet or turbofan. At high speed, because of losses in propeller efficiency, a reciprocating or turboprop engine's efficiency becomes limited above **400 mph**, less than that of the turbofan.

### Durability and Reliability

Durability and reliability are closely linked. An engine is **reliable** when it performs at specified ratings in widely varying flight attitudes and weather conditions. **Durability** is the amount of engine life obtained while maintaining the desired reliability. No definite time interval between overhauls is specified in the engine rating — the **time between overhauls (TBO)** varies with operating conditions and is specified by the engine manufacturer.

### Operating Flexibility

**Operating flexibility** is the ability of an engine to run smoothly and give desired performance at all speeds from idling to full-power output, across all atmospheric conditions encountered in operation.

### Compactness

The shape and size of the engine must be as compact as possible, to aid streamlining and balancing of the aircraft, to improve pilot view in single-engine aircraft, and to reduce drag from frontal area. Weight limitations are closely related to compactness — a more elongated, spread-out engine makes it harder to keep specific weight within allowable limits.

## Types and Construction

In a reciprocating engine, intake, compression, combustion, and exhaust all take place in the **same combustion chamber**, so each must have exclusive occupancy during its part of the cycle. A significant feature of the gas turbine engine is that **separate sections are devoted to each function**, and all functions are performed **simultaneously without interruption**.

A typical gas turbine engine consists of:

1. An air inlet
2. Compressor section
3. Combustion section
4. Turbine section
5. Exhaust section
6. Accessory section
7. The systems necessary for starting, lubrication, fuel supply, and auxiliary purposes (anti-icing, cooling, pressurization)

Another common nomenclature divides the engine into the **"cold section"** (from the inlets up through the compressors and/or diffusers) and the **"hot section"** (the areas past the compressors, from the combustion chambers through the exhaust).

### Turbine Engine Types

Four types of gas turbine engines are used to propel and power aircraft: the **turbofan, turboprop, turboshaft, and turbojet**.

**Turbojet:** the original term for any gas turbine engine used in aircraft. Pure turbojet engines have problems with noise and fuel consumption in the speed range airliners fly (0.8 Mach), so their use is now very limited.

**Turbofan:** turns a large fan or set of fans at the front of the engine, producing about **80 percent of the thrust**. It is quieter and has better fuel consumption in the high sub-Mach speed range. Many turbofans are two-shaft (**two-spool**) engines:

- The **low-pressure spool** generally contains the fan(s) and the turbine stages that drive them.
- The **high-pressure spool** is the high-pressure compressor, shaft, and turbines, and makes up the **core** of the engine — this is where the combustion section is located, so it is also called the **gas generator**.

**Bypass ratio:** the amount of airflow (lbs/sec) from the fan bypass compared to the amount that flows through the core of the engine.

*Example: 100 lb/sec flow through the fan compared with 20 lb/sec flow through the core gives a bypass ratio of 5:1.*

Turbofans are categorized as **high bypass** or **low bypass**. Most transport category aircraft use high-bypass engines. Some low-bypass turbofans, used in speed ranges above 0.8 Mach (military aircraft), use augmenters or afterburners — extra fuel nozzles and a flame holder in the exhaust — to give large, short-duration increases in thrust.

The turbofan fan can be part of the first-stage compressor blades or a separate set of blades mounted forward of the compressor. Converting more of the fuel energy into pressure (rather than velocity) is the general principle of the fan engine, giving fuel economy and increased range without increasing fuel flow — but it requires additional turbine stages to drive the fan, leaving less energy for thrust from the core exhaust gases; the fan's own thrust more than makes up for this. Turbofan exhaust may use a **separate fan nozzle** or a **mixed (common) nozzle** where fan and core air mix before discharge.

The turbofan is a compromise between the good operating efficiency and high thrust capability of a turboprop and the high speed, high altitude capability of a turbojet.

**Turboprop:** a gas turbine engine that turns a propeller through a speed reduction gear box. Most efficient in the **300 to 400 mph** speed range, and can use shorter runways than other aircraft. Approximately **80 to 85 percent** of the energy developed is used to drive the propeller; the rest exits the exhaust as thrust.

**Turboshaft:** a gas turbine engine made to transfer horsepower to a shaft to operate something other than a propeller. Used primarily to power **helicopters** and **auxiliary power units (APUs)**. APUs provide electrical power and bleed air on the ground, and emergency backup power in flight.
        $cnt$,
        1
    ) RETURNING id INTO s1_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 15.2: Engine Performance
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m15_id, 'M15.2', 'Engine Performance',
        $cnt2$
# Engine Performance

## Turbine Engine Operating Principles

The principle used by a gas turbine engine as it provides force to move an airplane is based on **Newton's law of momentum**: for every action there is an equal and opposite reaction. If the engine accelerates a mass of air (action), it applies a force on the aircraft (reaction). The **turbofan** generates thrust by giving a **relatively slower acceleration to a large quantity of air**; the old pure **turbojet** achieves thrust by imparting **greater acceleration to a smaller quantity of air** — its main problem being fuel consumption and noise.

The mass of air is accelerated within the engine by a **continuous-flow cycle**: ambient air enters the inlet diffuser where it is subjected to changes in temperature, pressure, and velocity due to ram effect; the compressor increases pressure and temperature mechanically; air continues at constant pressure to the burner section where temperature is increased by combustion; energy is taken from the hot gas by expanding through a turbine (which drives the compressor) and through an exhaust nozzle designed to discharge exhaust gas at high velocity to produce thrust.

### Force, Mass and Acceleration

A free-falling 1 lb object accelerates at the rate of gravity, **32.2 ft/sec²**. Since the object's mass weighs 1 lb (which is also the force gravity imparts to it), a force of 1 lb accelerates a mass of 1 lb at 32.2 ft/sec² — and, with no friction, a force of 10 lb accelerates a mass of 10 lb at the same 32.2 ft/sec². This gives:

**F = MA / G**

where F = force, M = mass (lb), A = acceleration (ft/sec²), G = gravity (32.2 ft/sec²).

*Example: Compute the force necessary to accelerate a mass of 50 pounds by 100 ft/sec².*

**F = (50 lb × 100 ft/sec²) / 32.2 ft/sec² = 155 lb**

### Jet Thrust

Since a turbojet engine accelerates air, jet thrust can be found from:

**Fn = Ms(V₂ − V₁) / G**

where Fn = thrust (lb), Ms = mass flow (lb/sec), V₁ = inlet velocity, V₂ = jet (exhaust) velocity, G = 32.2 ft/sec².

*Example: Changing the velocity of 100 lb/sec of mass airflow from 600 ft/sec to 800 ft/sec:*

**F = 100 (800 − 600) / 32.2 = 621 lb**

Thrust can be increased by two methods: **increasing the mass flow of air** through the engine, or **increasing the gas velocity**. If jet velocity stays constant relative to the aircraft, thrust decreases as aircraft speed increases (because V₁ increases) — but this is not a serious problem, because as aircraft speed increases, more air enters the engine and jet velocity increases too, so resultant net thrust stays almost constant with increased airspeed.

## The Brayton Cycle

The **Brayton cycle** is the name given to the thermodynamic cycle of a gas turbine engine used to produce thrust. It is a variable-volume, **constant-pressure cycle** of events, also called the "continuous combustion cycle." The four continuous and constant events are **intake, compression, expansion (includes power), and exhaust**:

- **Intake:** air enters at ambient pressure and constant volume; it leaves the intake at increased pressure and decreased volume.
- **Compression:** air is received from the intake at increased pressure, slightly above ambient, and compressed further by the compressor — it leaves with a large increase in pressure and decrease in volume.
- **Expansion:** takes place in the combustion chamber by burning fuel, which expands the air by heating it — pressure stays relatively constant, but there is a marked increase in volume. The expanding gases move rearward through the turbine, converted from velocity energy to mechanical energy.
- **Exhaust:** a convergent duct converts the expanding volume and decreasing pressure of the gases to a final high velocity.

The force created inside the engine to keep this cycle continuous has an equal and opposite reaction (thrust) that moves the aircraft forward.

## Convergent and Divergent Ducts

Bernoulli's principle — whenever a fluid's velocity increases at a point, the pressure at that point is lower — is applied to gas turbine engines through convergent and divergent duct design:

- A **convergent duct increases velocity and decreases pressure**. This principle is usually used for the **exhaust nozzle**.
- A **divergent duct decreases velocity and increases pressure**. This principle is used in the **compressor and diffuser**, where air is slowing and pressurizing.

When an exhaust nozzle is convergent, gas velocity leaving the rear of the engine increases — desirable for maximum thrust. As gases approach the speed of sound, the nozzle is said to be **choked**, producing **choked nozzle thrust** — the highest efficiency obtainable for subsonic flight (though at the speed of sound the exhaust gases produce a shock wave that deteriorates performance).

**Gross (static) thrust** is developed when the engine is on the ground and stationary; airflow velocity entering the engine changes and affects thrust once the aircraft is in flight.

### Thrust Distribution

The thrust developed by an engine can be thought of as contributed by the various sections during the continuous combustion cycle. In the forward part of the engine, loads are in the forward direction (Newton's second law); as gases pass through the nozzle guide vanes and turbine, loads shift to the rearward direction as power is extracted and drag occurs. Drag continues as gases pass through the exhaust section. The **resultant thrust is in the forward direction**.

*Example figures for a representative turbojet engine: Forward Gas Load 57,836 lb, Rearward Gas Load 46,678 lb, giving a Total (resultant) Thrust of 11,158 lb (57,836 − 46,678 = 11,158).*

## Thermal Efficiency

**Thermal efficiency** is a prime factor in gas turbine performance — the ratio of net work produced by the engine to the chemical energy supplied as fuel. The three most important factors affecting thermal efficiency are:

1. **Turbine inlet temperature**
2. **Compression ratio**
3. **Component efficiencies of the compressor and turbine**

Other factors affecting thermal efficiency are compressor inlet temperature and combustion efficiency. In actual operation, turbine engine exhaust temperature varies directly with turbine inlet temperature at a constant compression ratio. RPM is a direct measure of compression ratio, so at constant rpm, maximum thermal efficiency is obtained by maintaining the highest possible exhaust temperature — but since engine life is greatly reduced at high turbine inlet temperatures, operators must not exceed the exhaust temperatures specified for continuous operation.

## Effect of Inlet Conditions on Thrust/Power

The three principal variables that affect inlet conditions are the **speed of the aircraft, the altitude of the aircraft, and the ambient temperature**. To simplify analysis, these three variables can be represented by a single variable called **stagnation density**. The power produced by a turbine engine is proportional to the stagnation density at the inlet.

- **Outside Air Temperature (OAT):** thrust output improves rapidly with a reduction in OAT at constant altitude, rpm, and airspeed — partly because the energy required per pound of airflow to drive the compressor varies directly with temperature (leaving more energy for thrust), and partly because reduced temperature increases air density, increasing mass flow through the engine.
- **Altitude:** an increase in altitude causes a decrease in pressure and temperature. Since the temperature lapse rate is lower than the pressure lapse rate as altitude increases, density decreases. Although decreased temperature increases thrust, the effect of decreased density more than offsets this — so the net result of increased altitude is a **reduction in thrust output**.
- **Airspeed:** as airspeed increases, ram drag increases rapidly while exhaust velocity stays relatively constant, so **specific thrust** (net thrust per pound of airflow per second) decreases. In the low-speed range, specific thrust decreases faster than airflow increases, causing net thrust to decrease; at higher speeds, airflow increases faster than specific thrust decreases, causing net thrust to increase again until sonic velocity is reached.

### Ram Recovery

A rise in pressure above existing outside atmospheric pressure at the engine inlet, as a result of the forward velocity of the aircraft, is called **ram pressure**. Ram effect causes an increase in compressor entrance pressure over atmospheric, which increases mass airflow and gas velocity, both of which tend to increase thrust — this is called **ram recovery** or **total pressure recovery**.

Two opposing trends occur as aircraft speed increases: thrust output temporarily decreases from static, but soon ceases to decrease, and moving to higher speeds, thrust output begins to increase again due to the increased pressure of ram recovery.

## Engine Pressure Ratio (EPR)

**Engine pressure ratio (EPR)** reflects how much power is being developed by an operating turbine engine. EPR is a comparison of the pressure at the **inlet of the compressor** to the pressure at the **turbine exhaust area**, measured by pick-ups known as the **P2 and P7 sensors**. An EPR gauge on the flight deck is used to set power for takeoff on many aircraft types.

## Engine Ratings

The **flat rating** of a turbine engine is the thrust performance guaranteed by the manufacturer for a new engine under specific operating conditions, such as takeoff, maximum continuous climb, and cruise power settings.

Turbine inlet temperature is proportional to the energy available to turn the turbine — the hotter the gases entering the turbine section, the more power is available to turn the turbine wheel. Exhaust gas temperature (EGT) is proportional to turbine inlet temperature, regardless of where on the engine it is measured for the flight deck reading. A higher EGT means more energy is reaching the turbine so it can turn the compressor faster — but this works only until the temperature reaches a point where the turbine inlet guide vanes start to be damaged. EGT must be held constant, or lowered, to preserve hot-section life while still providing the thrust needed to meet certification requirements.

Performance ratings for turbine engines are given by the manufacturer for **takeoff, maximum continuous operation, maximum climb, maximum cruise, and idle**.
        $cnt2$,
        2
    ) RETURNING id INTO s2_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 15.3: Inlet
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m15_id, 'M15.3', 'Inlet',
        $cnt3$
# Inlets and Accessory

## Air Entrance

The air entrance is designed to conduct incoming air to the compressor with a minimum energy loss from drag or ram pressure loss — airflow into the compressor should be free of turbulence for maximum operating efficiency. Proper inlet design contributes to aircraft performance by increasing the ratio of compressor discharge pressure to duct inlet pressure — also called the **compressor pressure ratio** (outlet pressure divided by inlet pressure).

The amount of air passing through the engine depends on three factors:

1. The **compressor speed (rpm)**
2. The **forward speed of the aircraft**
3. The **density of the ambient (surrounding) air**

Turbine inlet type is dictated by the type of gas turbine engine — a high-bypass turbofan inlet is completely different from a turboprop or turboshaft inlet. On large turbofan-powered aircraft the inlet is bolted to the front (A flange) of the engine.

Since the huge fan is usually the first part of the aircraft the incoming air contacts, **icing protection** must be provided to prevent chunks of ice forming on the leading edge of the inlet, breaking loose, and damaging the fan. **Warm air bled from the engine's compressor** is ducted through the inlet to prevent ice from forming; if inlet guide vanes are used to straighten airflow, they too have anti-icing air flowing through them. The inlet also contains sound-reducing materials that absorb fan noise.

**Turboprops and turboshafts** can use an **inlet screen** to help filter out ice or debris. A **deflector vane** and a **heated inlet lip** are used to prevent ice or large chunks from entering the engine.

On **military aircraft**, a divided entrance permits the use of very short ducts with a resultant small pressure drop through skin friction. Military aircraft can fly above Mach 1, but airflow through the engine must always stay below Mach 1 — supersonic airflow in the engine would destroy it. Convergent and divergent shaped ducts control the airflow and drop it to subsonic speeds before it enters the engine; these are called **supersonic inlets**.

## Turbine Engine Inlet Systems

The engine inlet is designed to provide a relatively **distortion-free flow of air**, in the required quantity, to the compressor inlet. Many engines use **inlet guide vanes (IGV)** to help straighten the airflow and direct it into the first stages of the compressor. A uniform, steady airflow is necessary to avoid **compressor stall** (airflow tending to stop or reverse direction) and excessive internal engine temperatures in the turbine section. The air-inlet duct is normally considered an **airframe part**, not a part of the engine, though it is very important to the engine's overall performance.

A gas turbine engine consumes considerably more airflow than a reciprocating engine, so the air entrance passage is correspondingly larger, and inefficiencies of the inlet duct result in successively magnified losses through other engine components. Small turboprop and turboshaft engines have lower airflow than large turbofan engines, which require a completely different type of inlet. Many turboprop, APU, and turboshaft engines use **screens** that cover the inlet to prevent **foreign object damage (FOD)**.

### Divided-Entrance Duct

High-speed, single or twin-engine military aircraft, where the pilot sits low and close to the nose, make it difficult to use the older single-entrance duct. A **divided duct**, taking air from either side of the fuselage — either a **wing-root inlet** or a **scoop at each side of the fuselage** — is widely used instead. Either type presents more design problems than a single-entrance duct because of the difficulty obtaining sufficient air scoop area without excessive drag, and the need for a duct of reasonable length with as few bends as possible. Side scoops are placed as far forward as possible to permit a gradual bend toward the compressor inlet. A series of **turning vanes** is sometimes placed in the side-scoop inlet to straighten incoming airflow and prevent turbulence.

### Variable-Geometry Duct

The main function of an inlet duct is to furnish the proper amount of air to the engine inlet. In military aircraft using a turbojet or low-bypass turbofan, airflow through the engine must be **less than Mach 1 at all times**. Inlet ducts are therefore designed to function as **diffusers** — decreasing velocity and increasing static pressure of the air passing through them.

For military supersonic aircraft, a diffuser progressively decreases in area in the downstream direction (a **convergent supersonic section**) until incoming air is reduced to Mach 1; the aft section then increases in area, acting as a **divergent subsonic diffuser**. For very high-speed aircraft, the inside area/configuration of the duct is changed mechanically as aircraft speed changes — this is a **variable-geometry inlet duct**.

Military aircraft use three methods to diffuse inlet air and slow it at supersonic flight speeds:

1. **Varying the area/geometry** of the inlet duct using a movable restriction, such as a ramp or wedge, inside the duct.
2. A **variable airflow bypass** arrangement, which extracts part of the inlet airflow from the duct ahead of the engine.
3. Setting up a **shock wave** in the airstream, via a restriction or small obstruction that automatically protrudes into the duct at high flight Mach numbers — a shock wave is a thin region of discontinuity in a flow of air or gas during which speed, pressure, density, and temperature undergo a sudden change; stronger shocks produce larger changes. The shock wave diffuses the airflow, decreasing its velocity.

In at least one installation, both the shock method and the variable-geometry method are combined: the same device that changes duct area also sets up the shock wave, with both varied automatically with aircraft airspeed.

### Compressor Inlet Screens

A **compressor inlet screen** is sometimes placed across the engine air inlet to prevent ingestion of items drawn into the intake. Engines with inlet screens — such as turboprops and APUs — are less vulnerable to FOD. If an engine is readily subject to internal damage (e.g. an axial compressor with aluminum compressor blades), an inlet screen is almost a necessity.

Screens, however, **add appreciably to inlet duct pressure loss**, are **very susceptible to icing**, and are subject to **fatigue failure** — a failed screen can sometimes cause more damage than no screen at all. Some inlet screens are made retractable, withdrawn from the airstream after takeoff or when icing conditions prevail, but such screens add both weight and bulk and are subject to mechanical failure. In large turbofan engines with steel or titanium compressor (fan) blades, which do not damage easily, the disadvantages of compressor screens outweigh the advantages, so screens are **not generally used**.

### Bellmouth Compressor Inlets

A **bellmouth inlet** is usually installed on an engine undergoing testing in a test cell. It is generally equipped with probes to measure intake temperature and pressure (total and static). During testing, outside static air must flow into the engine with as little resistance as possible. The bellmouth is attached to the moving part of the test stand, which pushes against a load cell to measure thrust.

The bellmouth is a bell-shaped funnel with carefully rounded shoulders offering practically no air resistance — duct loss is so slight it is considered **zero**. This lets the engine be operated without the losses common to an installed aircraft inlet duct, so engine performance data such as rated thrust and specific fuel consumption obtained with a bellmouth inlet are the "cleanest" figures available. Bellmouth inlets are usually fitted with protective screening, and the efficiency lost through the screen must be accounted for when very accurate engine data are needed.

## Turboprop and Turboshaft Compressor Inlets

The air inlet on a turboprop is more of a problem than on some other gas turbine engines because the propeller drive shaft, hub, and spinner must also be considered. The **ducted arrangement** is generally the best inlet design for a turboprop as far as airflow and aerodynamic characteristics are concerned. Many turboprop inlets are anti-iced using **electrical elements** in the lip opening of the intake. **Deflector doors** are sometimes used to deflect ice or dirt away from the intake, and the air may then pass through a screen. A **conical spinner**, which does not allow ice to build up on its surface, is sometimes used with turboprop and turbofan engines.

## Turbofan Engine Inlet Sections

High-bypass turbofan engines are usually built with the fan at the forward end of the compressor. In dual-spool engines, the fan is integral with the relatively slow-turning, low-pressure compressor, allowing the fan blades to rotate at low tip speed for best fan efficiency. This permits a conventional air inlet duct with low inlet duct loss, and reduces engine damage from ingested foreign material, since much of it is thrown radially outward and passes through the fan discharge rather than the core. Warm bleed air is drawn from the engine and circulated inside the inlet lip for anti-icing, and the fan hub/spinner is either heated by warm air or conical. Inside the inlet, near the fan blade tips, is an **abradable rub strip** that allows the fan blades to rub for short times during flightpath changes, and sound-reducing materials lower fan noise.

The fan on high-bypass engines consists of one stage of rotating blades and stationary vanes, ranging in diameter from less than **84 inches** to more than **112 inches**. Fan blades are either **hollow titanium** or **composite materials**. Air accelerated by the outer part of the fan blades forms a **secondary airstream** (fan flow), ducted overboard without passing through the main engine — this secondary air produces **80 percent of the thrust** in high-bypass engines. Air passing through the inner part of the fan blades becomes the **primary airstream (core flow)** through the engine itself.

Fan exhaust air may be discharged in one of two ways:

1. To the outside air through **short ducts (dual exhaust nozzles)** directly behind the fan.
2. As a **ducted fan**, using closed ducts all the way to the rear of the engine, where core airflow and fan airflow mix in a common **mixed exhaust nozzle**.
        $cnt3$,
        3
    ) RETURNING id INTO s3_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M15.1 Fundamentals (16 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s1_id, 'Energy can be classified into two basic types:',
     '[{"id":"a","text":"Potential and kinetic","correct":true},{"id":"b","text":"Static and dynamic","correct":false},{"id":"c","text":"Chemical and mechanical","correct":false}]',
     '{"B1"}'),

    (s1_id, 'The formula used to calculate the potential energy of an object due to its height is:',
     '[{"id":"a","text":"Potential Energy = Weight × Height","correct":true},{"id":"b","text":"Potential Energy = Mass × Velocity","correct":false},{"id":"c","text":"Potential Energy = Force ÷ Distance","correct":false}]',
     '{"B1"}'),

    (s1_id, 'A Boeing 747 weighing 450,000 lb is raised 4 feet in the air on jacks for landing gear maintenance. How much potential energy does it possess because of this raised position?',
     '[{"id":"a","text":"112,500 ft-lbs","correct":false},{"id":"b","text":"1,800,000 ft-lbs","correct":true},{"id":"c","text":"450,004 ft-lbs","correct":false}]',
     '{"B1"}'),

    (s1_id, 'The formula used to calculate the kinetic energy of an object in motion is:',
     '[{"id":"a","text":"Kinetic Energy = ½ × Mass × Velocity²","correct":true},{"id":"b","text":"Kinetic Energy = Mass × Velocity","correct":false},{"id":"c","text":"Kinetic Energy = Weight × Height","correct":false}]',
     '{"B1"}'),

    (s1_id, 'Newton''s first law of motion, which explains why a magician can snatch a tablecloth from a table without disturbing the dishes, describes the property of:',
     '[{"id":"a","text":"Momentum","correct":false},{"id":"b","text":"Inertia","correct":true},{"id":"c","text":"Torque","correct":false}]',
     '{"B1"}'),

    (s1_id, 'The formula for thrust, derived from Newton''s second law, in the form F = W(Vf − Vi) / Gt, is used to compute the thrust of a turbojet engine moving 150 lbs of air per second, entering at 100 fps and leaving at 1,200 fps. What thrust, in pounds, is the engine creating?',
     '[{"id":"a","text":"Approximately 5,124 lb","correct":true},{"id":"b","text":"Approximately 1,100 lb","correct":false},{"id":"c","text":"Approximately 35,400 lb","correct":false}]',
     '{"B1"}'),

    (s1_id, 'Newton''s third law of motion, the law of action and reaction, explains that when a propeller pushes a stream of air backward with a force of 500 lbs:',
     '[{"id":"a","text":"The air pushes the blades forward with an equal force of 500 lbs","correct":true},{"id":"b","text":"The air pushes against the air behind the aircraft, propelling it forward","correct":false},{"id":"c","text":"No reactive force is produced, since air has negligible mass","correct":false}]',
     '{"B1"}'),

    (s1_id, 'According to Bernoulli''s principle, as fluid flows through the narrow center section of a venturi tube:',
     '[{"id":"a","text":"Velocity decreases and static pressure increases","correct":false},{"id":"b","text":"Velocity increases and static pressure decreases","correct":true},{"id":"c","text":"Both velocity and static pressure remain unchanged","correct":false}]',
     '{"B1"}'),

    (s1_id, 'Boyle''s Law states that when the temperature of a gas is held constant and its pressure is increased, its volume:',
     '[{"id":"a","text":"Increases proportionately","correct":false},{"id":"b","text":"Decreases proportionately","correct":true},{"id":"c","text":"Remains unchanged","correct":false}]',
     '{"B1"}'),

    (s1_id, 'During the compression stage of a gas turbine engine, as work is done to increase pressure and decrease volume, there is a corresponding:',
     '[{"id":"a","text":"Rise in temperature","correct":true},{"id":"b","text":"Fall in temperature","correct":false},{"id":"c","text":"No change in temperature","correct":false}]',
     '{"B1"}'),

    (s1_id, 'A tow tractor pushes a Boeing 737-800 airplane 80 ft into the hangar using a force on the tow bar of 5,000 lbs. How much work is accomplished?',
     '[{"id":"a","text":"85,000 ft-lbs","correct":false},{"id":"b","text":"400,000 ft-lbs","correct":true},{"id":"c","text":"650,000,000 ft-lbs","correct":false}]',
     '{"B1"}'),

    (s1_id, 'A GE-90 turbofan engine weighing 19,000 lb must be raised 4 ft in 2 minutes to install it on a Boeing 777-300. What horsepower is required?',
     '[{"id":"a","text":"Approximately 1.15 hp","correct":true},{"id":"b","text":"Approximately 38 hp","correct":false},{"id":"c","text":"Approximately 0.15 hp","correct":false}]',
     '{"B1"}'),

    (s1_id, 'Torque differs from work in that torque is a force acting:',
     '[{"id":"a","text":"Through a distance, requiring the object to move","correct":false},{"id":"b","text":"Along a distance, and exists even if nothing moves","correct":true},{"id":"c","text":"Only on rotating electrical machinery","correct":false}]',
     '{"B1"}'),

    (s1_id, 'A reciprocating engine is rated in brake horsepower (bhp); the gas turbine engine is rated in:',
     '[{"id":"a","text":"Torque horsepower (tohp)","correct":false},{"id":"b","text":"Thrust horsepower (thp)","correct":true},{"id":"c","text":"Indicated horsepower (ihp)","correct":false}]',
     '{"B1"}'),

    (s1_id, 'A significant feature of the gas turbine engine, compared with a reciprocating engine, is that intake, compression, combustion, and exhaust:',
     '[{"id":"a","text":"Take place in the same chamber, one after another","correct":false},{"id":"b","text":"Take place in separate sections, all simultaneously and without interruption","correct":true},{"id":"c","text":"Only occur during engine start-up","correct":false}]',
     '{"B1"}'),

    (s1_id, 'The high-pressure spool of a two-spool turbofan engine is also referred to as the gas generator because it contains the:',
     '[{"id":"a","text":"Fan section","correct":false},{"id":"b","text":"Combustion section","correct":true},{"id":"c","text":"Exhaust nozzle","correct":false}]',
     '{"B1"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M15.2 Engine Performance (14 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s2_id, 'A turbofan engine generates thrust by giving a relatively slower acceleration to a large quantity of air, whereas the older pure turbojet achieves thrust by:',
     '[{"id":"a","text":"Imparting greater acceleration to a smaller quantity of air","correct":true},{"id":"b","text":"Accelerating the same quantity of air at the same rate","correct":false},{"id":"c","text":"Not accelerating air at all, relying solely on combustion pressure","correct":false}]',
     '{"B1"}'),

    (s2_id, 'Using F = MA/G, what force is necessary to accelerate a mass of 50 pounds by 100 ft/sec²?',
     '[{"id":"a","text":"Approximately 32 lb","correct":false},{"id":"b","text":"Approximately 155 lb","correct":true},{"id":"c","text":"Approximately 5,000 lb","correct":false}]',
     '{"B1"}'),

    (s2_id, 'Using the jet thrust formula Fn = Ms(V2 − V1)/G, what thrust results from changing the velocity of 100 lb/sec of mass airflow from 600 ft/sec to 800 ft/sec?',
     '[{"id":"a","text":"Approximately 621 lb","correct":true},{"id":"b","text":"Approximately 200 lb","correct":false},{"id":"c","text":"Approximately 6,211 lb","correct":false}]',
     '{"B1"}'),

    (s2_id, 'The thrust of a gas turbine engine can be increased by two methods: increasing the gas velocity, or:',
     '[{"id":"a","text":"Increasing the mass flow of air through the engine","correct":true},{"id":"b","text":"Decreasing the compressor rpm","correct":false},{"id":"c","text":"Reducing the exhaust nozzle diameter to zero","correct":false}]',
     '{"B1"}'),

    (s2_id, 'The four continuous and constant events of the Brayton cycle, as applied to a gas turbine engine, are:',
     '[{"id":"a","text":"Intake, compression, expansion (power), and exhaust","correct":true},{"id":"b","text":"Induction, ignition, power, and cooling","correct":false},{"id":"c","text":"Suction, compression, power, and scavenging","correct":false}]',
     '{"B1"}'),

    (s2_id, 'The Brayton cycle is also commonly known as the:',
     '[{"id":"a","text":"Constant-volume cycle","correct":false},{"id":"b","text":"Constant-pressure cycle","correct":true},{"id":"c","text":"Variable-pressure cycle","correct":false}]',
     '{"B1"}'),

    (s2_id, 'In gas turbine engine design, a convergent duct is generally used for the exhaust nozzle because it:',
     '[{"id":"a","text":"Increases velocity and decreases pressure","correct":true},{"id":"b","text":"Decreases velocity and increases pressure","correct":false},{"id":"c","text":"Has no effect on velocity or pressure","correct":false}]',
     '{"B1"}'),

    (s2_id, 'When exhaust gases in a convergent nozzle approach the speed of sound, the nozzle is said to be:',
     '[{"id":"a","text":"Stalled","correct":false},{"id":"b","text":"Choked","correct":true},{"id":"c","text":"Flooded","correct":false}]',
     '{"B1"}'),

    (s2_id, 'Thrust developed when an engine is on the ground and stationary is called:',
     '[{"id":"a","text":"Net thrust","correct":false},{"id":"b","text":"Gross or static thrust","correct":true},{"id":"c","text":"Ram thrust","correct":false}]',
     '{"B1"}'),

    (s2_id, 'The three most important factors affecting the thermal efficiency of a gas turbine engine are turbine inlet temperature, component efficiencies of the compressor and turbine, and:',
     '[{"id":"a","text":"Compression ratio","correct":true},{"id":"b","text":"Fuel octane rating","correct":false},{"id":"c","text":"Propeller pitch","correct":false}]',
     '{"B1"}'),

    (s2_id, 'The three principal variables affecting inlet conditions, and thus engine power, are the speed and altitude of the aircraft, and:',
     '[{"id":"a","text":"The ambient temperature","correct":true},{"id":"b","text":"The aircraft''s total weight","correct":false},{"id":"c","text":"The color of the airframe","correct":false}]',
     '{"B1"}'),

    (s2_id, 'As aircraft altitude increases, the net effect on thrust output is:',
     '[{"id":"a","text":"An increase, because the decrease in temperature dominates","correct":false},{"id":"b","text":"A reduction, because the decrease in density more than offsets the effect of colder temperature","correct":true},{"id":"c","text":"No change, since pressure and temperature effects always cancel","correct":false}]',
     '{"B1"}'),

    (s2_id, 'A rise in pressure above existing outside atmospheric pressure at the engine inlet, caused by the forward velocity of the aircraft, is referred to as:',
     '[{"id":"a","text":"Ram pressure","correct":true},{"id":"b","text":"Choke pressure","correct":false},{"id":"c","text":"Stagnation loss","correct":false}]',
     '{"B1"}'),

    (s2_id, 'Engine pressure ratio (EPR) compares the pressure at the inlet of the compressor to the pressure:',
     '[{"id":"a","text":"At the turbine exhaust area","correct":true},{"id":"b","text":"At the fan inlet only","correct":false},{"id":"c","text":"In the fuel manifold","correct":false}]',
     '{"B1"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M15.3 Inlet (11 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s3_id, 'The amount of air passing through a gas turbine engine is dependent upon the compressor speed (rpm), the density of the ambient air, and:',
     '[{"id":"a","text":"The forward speed of the aircraft","correct":true},{"id":"b","text":"The color of the aircraft livery","correct":false},{"id":"c","text":"The number of passengers on board","correct":false}]',
     '{"B1"}'),

    (s3_id, 'On a high-bypass turbofan engine, ice is prevented from forming on the inlet leading edge primarily by:',
     '[{"id":"a","text":"Warm air bled from the engine''s compressor and ducted through the inlet","correct":true},{"id":"b","text":"A layer of anti-icing paint applied to the fan blades","correct":false},{"id":"c","text":"Reducing engine power whenever icing conditions are detected","correct":false}]',
     '{"B1"}'),

    (s3_id, 'The function of inlet guide vanes (IGV) in a turbine engine inlet system is to:',
     '[{"id":"a","text":"Straighten the airflow and direct it into the first stages of the compressor","correct":true},{"id":"b","text":"Increase the bypass ratio of the engine","correct":false},{"id":"c","text":"Convert kinetic energy directly into electrical power","correct":false}]',
     '{"B1"}'),

    (s3_id, 'A uniform, steady airflow into the compressor is necessary primarily to avoid:',
     '[{"id":"a","text":"Compressor stall","correct":true},{"id":"b","text":"Excessive fuel consumption at idle only","correct":false},{"id":"c","text":"Reduced generator output","correct":false}]',
     '{"B1"}'),

    (s3_id, 'A divided-entrance duct, taking air from either side of the fuselage via a wing-root inlet or side scoops, is primarily associated with:',
     '[{"id":"a","text":"High-speed, single or twin-engine military aircraft","correct":true},{"id":"b","text":"Large transport-category turbofan aircraft","correct":false},{"id":"c","text":"Piston-engine training aircraft","correct":false}]',
     '{"B1"}'),

    (s3_id, 'In a supersonic military aircraft, airflow through the engine core must always remain:',
     '[{"id":"a","text":"Above Mach 1","correct":false},{"id":"b","text":"Below Mach 1","correct":true},{"id":"c","text":"Exactly at Mach 1","correct":false}]',
     '{"B1"}'),

    (s3_id, 'Which of the following is NOT one of the three methods military aircraft use to diffuse inlet air and slow it at supersonic flight speeds?',
     '[{"id":"a","text":"A movable restriction (ramp or wedge) that varies duct area/geometry","correct":false},{"id":"b","text":"A variable airflow bypass that extracts part of the inlet airflow ahead of the engine","correct":false},{"id":"c","text":"Increasing compressor rpm to slow the incoming air by suction","correct":true}]',
     '{"B1"}'),

    (s3_id, 'A significant disadvantage of a compressor inlet screen is that it:',
     '[{"id":"a","text":"Adds appreciably to inlet duct pressure loss and is very susceptible to icing","correct":true},{"id":"b","text":"Increases the bypass ratio of the engine","correct":false},{"id":"c","text":"Eliminates the need for anti-icing on the inlet lip","correct":false}]',
     '{"B1"}'),

    (s3_id, 'A bellmouth inlet, typically installed on an engine undergoing test-cell testing, is designed to:',
     '[{"id":"a","text":"Simulate icing conditions for certification testing","correct":false},{"id":"b","text":"Offer practically no air resistance, so duct loss is considered zero","correct":true},{"id":"c","text":"Increase inlet duct pressure loss to measure worst-case performance","correct":false}]',
     '{"B1"}'),

    (s3_id, 'On a turboprop engine, a conical spinner is sometimes used because it:',
     '[{"id":"a","text":"Does not allow ice to build up on its surface","correct":true},{"id":"b","text":"Increases the compressor pressure ratio","correct":false},{"id":"c","text":"Reduces the need for a reduction gear box","correct":false}]',
     '{"B1"}'),

    (s3_id, 'On a high-bypass turbofan engine, the secondary airstream produced by the outer part of the fan blades, ducted overboard without passing through the engine core, produces approximately what percentage of total engine thrust?',
     '[{"id":"a","text":"20 percent","correct":false},{"id":"b","text":"50 percent","correct":false},{"id":"c","text":"80 percent","correct":true}]',
     '{"B1"}');

END $$;
