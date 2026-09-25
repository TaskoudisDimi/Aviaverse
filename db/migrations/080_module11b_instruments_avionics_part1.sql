-- Module 11B: Piston Aeroplane Structures and Systems (B1) — Instruments and Avionics (Part 1)
-- Source: EASA Part-66 Module 11B official textbook (IKAROS Aviation Training Centre, IK M11B, Issue IK01 – OCT 2012)
-- Covers Chapter 5 "INSTRUMENT SYSTEMS (ATA 31)" of the source book: the atmosphere/standard atmosphere,
-- pressure (air data) instruments, altimeters, airspeed indicators, vertical speed indicators, gyroscopic
-- instruments, the gyro horizon, attitude director indicator, standby attitude indicator, direction indicator,
-- turn & slip indicator / turn co-ordinator, horizontal situation indicator, angle of attack, stall warning,
-- and the introduction of Electronic Instrument Systems (EFIS/EICAS/ECAM).

DO $$
DECLARE
    m11_id INT;
    s1_id  INT;
BEGIN
    SELECT id INTO m11_id FROM easa_modules WHERE code = 'M11';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M11B.5') THEN
        RAISE NOTICE 'M11B.5 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module M11B.5: Instruments and Avionics (Part 1)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m11_id, 'M11B.5', 'Instruments and Avionics (Part 1)',
        $cnt$
# Instruments and Avionics (Part 1)

## The Atmosphere

A relatively thin layer of air called the atmosphere surrounds the Earth. It extends upwards from the surface for a distance of about **250 miles** and is composed mainly of **nitrogen 78%**, **oxygen 21%**, plus **1% of other gases**, which includes, amongst others, argon, carbon dioxide and helium.

Under the gravitational effect of the Earth, the atmosphere exerts a pressure on the Earth's surface. This pressure, measured at sea level, is approximately **1.013 bar (14.7 lbf/in²)**, and reduces with height. The pressure reduction is **not linear** — the rate of pressure reduction decreases with a rise in altitude, forming an exponential curve. Temperature and water vapour within the air also affect the pressure of the air, and therefore the height at which a particular pressure can be measured.

### Atmospheric Temperature Bands

Temperature change within the atmosphere can be divided into three bands, corresponding to three layers or regions:

1. The **Troposphere**
2. The **Stratosphere**
3. The **Chemosphere**

It is assumed that the troposphere extends to a height of **36,090 ft**, with a temperature gradient falling at a linear rate to **−56.5°C** at 36,090 ft (a fall of approximately **1.98°C for every 1,000 ft** of height increase). The stratosphere is assumed to range from 36,090 ft to the **stratopause at 104,987 ft**, and to have a constant temperature of −56.5°C. Above this is the chemosphere, extending to the limits of the atmosphere, which is assumed to have a temperature gradient that initially rises with altitude. For the purpose of aircraft pressure instruments, these higher levels are not important.

### Standard Atmosphere

To produce an instrument capable of accurately measuring aircraft height (and speed) using only the prevailing atmospheric pressure, the instrument must be calibrated and tested against a set of standard conditions. Standard atmospheres have been in use since the 1800s, the early ones based on simple temperature laws. During WW1 these were found to be inadequate, leading to the development and international acceptance in **1924** of the **International Committee on Air Navigation (ICAN)** standard. This standard was adopted by the **International Civil Aviation Organisation (ICAO)** in **1952**.

Advances in aircraft performance and the introduction of missiles highlighted the need for an increase in the altitude range of the standard atmosphere, the ICAO limit being 65,000 ft. This introduced two further standards to supplement the ICAO standard: the **Wright Air Development Centre (WADC)** standard and the **Air Research Development Command (ARDC)** standard, extending the usable range well beyond the ICAO limit.

## Pressure (Air Data) Instruments

### Air Data Instruments

An **Air Data System** senses and measures the total pressure created by the forward motion of the aircraft and the static pressure of the surrounding atmosphere, in terms of speed, altitude and rate of change of altitude. Measurement may be achieved by connecting sensors directly to mechanical-type instruments, or to a remotely located **Air Data Computer (ADC)**, which transmits the data in electrical signal format to electro-mechanical or servo-type instruments.

The basic Air Data Instruments display airspeed, altitude, Mach number and vertical speed, all calculated from air pressure received from a Pitot/static source:

- **Static air pressure** — the outside air pressure at the instant of measuring
- **Pitot pressure** — the dynamic pressure of the air due to the forward motion of the aircraft, measured using a tube facing the direction of travel

The **three primary instruments** in the Air Data System are:

1. **Altimeter** (Baro Ht)
2. **Indicated Air Speed (IAS) Indicator**
3. **Vertical Speed Indicator**

The IAS indicator is often combined to display Mach number as well as indicated airspeed and is then referred to as the **Combined Speed Indicator**.

Indicated Airspeed, Mach number, Barometric Height and Vertical Speed are derived from the Pitot/static inputs as follows:

| Parameter | Derivation |
|---|---|
| **IAS** | Pitot minus Static (in knots) |
| **Mach No** | (Pitot − Static) divided by Static |
| **Baro Ht** | Static (in feet) |
| **Vertical Speed** | Change in Static pressure (× 1,000 ft/min) |

### Location of Probes and Static Vents

Probe/vent location depends largely on aircraft type, speed range and aerodynamic characteristics — there is no common standard for all aircraft. On larger aircraft it is normal to have **standby probes and static vents**, always located one on each side of the fuselage and **interconnected** so as to balance out dynamic pressure effects resulting from any yawing or side-slip motion of the aircraft.

Pitot and static pressures are carried through seamless, corrosion-resistant metal (light alloy) pipelines, with flexible sections used where connection is required to components on anti-vibration mountings. Provision is made for eliminating water entering the system through condensation, rain or snow (to avoid "slugs" of water blocking the lines), in the form of drain holes in the probes and drain taps/valves in the pipelines. The drain holes in the probes are sized so as **not to introduce errors** into the system.

## Altimeters

### Aneroid Barometer Principle

If a membrane or pressure-sensitive capsule forms part of a sealed, evacuated capsule, atmospheric pressure on the outside of the capsule forces it inward until its resistance balances the atmospheric pressure — the greater the pressure, the greater the capsule movement before balance is attained. A linkage mechanism transmits this movement to a pointer. This is the principle of the **aneroid barometer**, and of the pressure (barometric) altimeter, which uses an airtight instrument case containing an evacuated capsule stack connected via levers and gears to a pointer moving over a scale calibrated in feet. External static pressure is fed into the instrument case, so as the aircraft climbs, case pressure falls, the capsule expands, and the pointer is driven around the dial; the reverse happens as the aircraft descends.

### Friction Compensation

Friction in the gearing of a simple altimeter cannot truly be compensated for, but is reduced as much as possible through careful design and cleanliness/finish during manufacture. The instrument's rate of response to capsule movement can be further improved by the use of a **vibrator**, which helps prevent the mechanism from sticking.

### Temperature Compensation

Temperature affects the strength of the materials used in the capsules and springs — they become **stronger as temperature decreases**. With a drop in temperature the capsule stack tends to extend, causing the instrument to **over-read**; a rise in temperature causes the capsule stack to contract, causing the instrument to **under-read**. Two main methods, both using a bi-metallic element, compensate for this:

1. A **"U"-shaped bi-metallic bracket** around the capsule stack: with a drop in temperature the limbs move inwards, exerting a compressive force onto the capsule stack, opposing its tendency to expand.
2. A **bi-metallic compensating link** built into the lever system that transmits capsule movement to the pointers, effectively altering linkage length to compensate for capsule expansion/contraction.

### Pressure Compensation

Aircraft pressure-operated altimeters are calibrated to one of the standard atmospheres and provide an accurate reading only when the prevailing atmospheric pressure conforms to that standard. Under ICAO standard conditions, sea level pressure is **1013.25 millibars**, at which a correctly calibrated altimeter indicates zero feet.

Since standard conditions rarely prevail, variations in sea-level pressure cause errors in indicated altitude. For example, if sea-level pressure falls to 1010 millibars, the capsule stack senses the pressure decrease and expands, producing an error of **+100 ft** (the instrument over-reads). A corresponding rise in sea-level pressure to 1016.55 millibars produces an error of **−100 ft** (the instrument under-reads). At this height, a **one-millibar change in pressure corresponds to about a 30 ft change in indicated altitude**, and the error increases further with altitude.

The standard atmosphere also assumes a sea-level temperature of 15°C and a lapse rate of 1.98°C per 1,000 ft up to 36,090 ft. Because cold air is denser than warm air, the pressure at a given height over a column of cold air is less than over a column of warm air at the same height for the same sea-level pressure. Consequently, altimeters **over-read in air colder than standard** conditions and **under-read in air warmer than standard** conditions.

To compensate for pressure variations, the altimeter has a **Ground Pressure Setting Knob** on its face, which repositions the instrument datum (and pointers) without affecting the capsule stack, while a **Baroscale** indicator (usually calibrated in millibars, typically shown via a veeder counter) displays the datum setting. This is normally adjusted by the flight crew using pressure information obtained from flight maps or Air Traffic Control, given as radio "Q" codes:

| Q Code | Meaning |
|---|---|
| **QFE** | Airfield barometric pressure — altimeter reads zero feet when landing/taking off at the airfield for which QFE was given |
| **QNH** | Actual sea-level barometric pressure — altimeter indicates height above mean sea level (MSL) |
| **QNE** | Standard sea-level barometric pressure (1013.25 mb) — altimeter indicates "Standard Pressure Altitude" |

QFE is normally set before take-off and on approach before landing. QNH is normally set when the aircraft is below 3,000 ft, and QNE is set when the aircraft is above 3,000 ft.

## Servo-Assisted Altimeters

Despite the use of a vibrator mechanism to enhance response, the basic altimeter becomes **increasingly inaccurate with height**, as a direct result of the non-linear change in atmospheric pressure with altitude. For example, the pressure drop from sea level to 1,000 ft is **36.08 mb**, whereas the pressure drop from 50,000 ft to 51,000 ft is only **5.44 mb**.

## Airspeed Indicators

Airspeed is displayed either in **knots** (nautical miles per hour; 1 nautical mile = 6,080 ft) or as a factor of the speed of sound, **Mach** (Mach 1 = speed of sound). This can be shown on a separate Airspeed Indicator (ASI) and Mach meter (MM), or combined into a single instrument.

### Simplified Airspeed Indicator

When an aircraft is stationary, all external surfaces are subjected equally to the prevailing atmospheric pressure. In motion, the aircraft experiences a build-up of additional (dynamic) pressure on its leading edges, proportional (for a given height) to the aircraft's speed. Pitot pressure alone cannot accurately measure speed, since it takes no account of the thinning of the air with altitude; this would otherwise lead to an apparent loss of indicated airspeed as altitude increases. Measuring the **difference** between dynamic (Pitot) pressure and static pressure compensates for this.

The ASI, in its simplest form, is a sealed instrument case containing a capsule with Pitot pressure applied inside it while static pressure is fed to the case; capsule movement results only from the dynamic pressure due to the aircraft's speed through the air.

### Pitot Pressure

Pitot pressure, sensed by the Pitot tube, is the sum of dynamic and static pressure:

**P = ½ρV² + S**

where P = Pitot pressure, ρ = air density, V = aircraft velocity, and S = static pressure.

Because dynamic pressure builds up as the **square** of aircraft speed, while capsule movement responds **linearly** to pressure change, the square-law pressure rise must be compensated for if the instrument scale is to read linearly with speed (rather than being compressed at low speeds). This is normally achieved using a **ranging spring assembly**.

## Vertical Speed Indicators

### Basic Operation

The Vertical Speed Indicator (VSI), commonly known as the rate of climb indicator, gives the flight crew an accurate indication of the rate at which the aircraft is changing height — essential when flying on instruments only, at night, or in poor visibility.

The VSI is a further adaptation of the differential pressure instrument. Static pressure is fed both into the instrument case and into the capsule, but the pressure to the case passes through a **restrictor (calibrated choke)**, greatly reducing the rate at which case pressure can change while allowing the capsule to respond rapidly. As the aircraft climbs, capsule pressure falls faster than case pressure, creating a pressure differential (case pressure greater) that contracts the capsule and drives the pointer to indicate a rate of climb; on descent, the capsule pressure becomes greater than the case, the capsule expands, and the pointer indicates a descent. In level flight the two pressures balance and the pointer reads zero.

The dial is graduated in feet per minute, with the zero point conventionally at the 9 o'clock position; the pointer moves **clockwise for ascent** and **anti-clockwise for descent**.

### Calibration

Calibration is set during manufacture and cannot be adjusted in service. It is achieved by two calibration springs acting on the centre of the capsule via a calibration stem, with their forces modified during manufacture by two rows of adjustment screws. The **upper spring** controls capsule expansion (rate of descent) and the **lower spring** controls capsule compression (rate of ascent).

### Altitude and Temperature Compensation

The way air passes through the metering device varies with air density and temperature, so the metering unit must compensate for both altitude and temperature changes to give a consistent pressure difference for a given rate of altitude change. Compensation is achieved by combining two metering devices: an **orifice** and a **capillary tube**.

- **Altitude:** the pressure difference across an orifice decreases with altitude (a negative error), while across a capillary tube it increases with altitude (a positive error) — the two effects tend to cancel.
- **Temperature:** air viscosity is proportional to temperature (falling as temperature falls). The pressure difference across an orifice increases as temperature decreases, while across a capillary tube it decreases as temperature decreases. A correctly chosen combination of orifice and capillary tube provides a stable pressure differential over a wide range of altitude and temperature.

## Gyroscopic Instruments

### Gyroscopic Properties

A gyroscope, mechanically, is a system containing a heavy metal wheel (rotor), universally mounted with three degrees of freedom:

- **Spinning freedom** — about the axis of spin (XX)
- **Tilting freedom** — about a horizontal axis at right angles to the spin axis (axis of tilt, YY)
- **Veering freedom** — about a vertical axis perpendicular to both other axes (axis of veer, ZZ)

These freedoms are obtained by mounting the rotor in two concentrically pivoted rings (inner and outer), forming the **gimbal system**, mounted so all axes are mutually at right angles and intersect at the rotor's centre of gravity. The system exhibits gyroscopic properties only when the rotor is spinning; at high speed it possesses two fundamental properties:

1. **Gyroscopic inertia (rigidity)**
2. **Precession**

### Rigidity

**Rigidity** is the property that resists any force tending to change the plane of rotor rotation. It depends on:

- The **mass** of the rotor
- The **speed of rotation**

### Precession

**Precession** is the angular change in direction of the plane of rotation under the influence of an applied force. The change takes place not in line with the applied force, but always at a point **90° away in the direction of rotation**. The rate of precession depends on:

- The strength and direction of the applied force
- The angular velocity of the rotor

A gyro with its spin axis parallel to the Earth's spin axis, located at the North Pole, could hold this position indefinitely. Located at the Equator, a similar gyro would appear to continually point North as the Earth rotates beneath it (it is the Earth rotating, not the gyro). This rigidity property is exploited in a number of gyro instruments, including the directional gyro. Precession, undesirable in instruments like the directional gyro, is deliberately used in turn indicators.

Instruments that use gyro rigidity or precession include the Gyro Horizon Unit, Attitude Director Indicator, Standby Horizon Unit, Direction Indicator, Turn & Slip Indicator, and Turn Co-ordinator.

## Gyro Horizon Unit

The Gyro Horizon Unit represents the aircraft's pitch and roll attitude relative to its vertical axis, using a **displacement gyroscope** whose spin axis is vertical. Attitude is shown by the relative position of two elements: one symbolising the aircraft, the other a gyro-stabilized **horizon bar**. The gimbal system is arranged so the inner ring (forming the rotor casing) is pivoted parallel to the aircraft's lateral axis, and the outer ring is pivoted parallel to the longitudinal axis. The symbolic aircraft element may be fixed to the case or externally adjustable for pitch trim reference. In level flight the three axes are mutually at right angles; a change in attitude (e.g. climbing) moves the case and outer ring about the stabilized inner ring's axis, and the horizon bar — pivoted via a magnifying lever system engaging an actuating pin on the inner ring — indicates the resulting climb or bank attitude.

## Attitude Director Indicator (ADI)

The ADI presents a symbolic three-dimensional display of aircraft attitude combined with lateral and vertical steering commands. Attitude is shown by a stationary aeroplane symbol against a moveable horizon line, carried on a servo-driven sphere marked in **5° increments**, coloured blue for sky and black/brown-orange for ground. The sphere is unbalanced in the roll axis so that, on loss of power, it rotates to approximately **90° left bank** indication.

Cross pointer bars indicate flight director commands: the **horizontal (pitch) bar**, shown below the aeroplane symbol, commands pitch up; the **vertical (roll) bar**, shown right or left of centre, commands right or left roll respectively.

Glideslope position is shown by a pointer on a vertical scale: aircraft **above** the glideslope beam is shown by the pointer **below** the scale index, and aircraft **below** the beam by the pointer **above** the index. Localizer deviation is shown on a fixed horizontal scale: the pointer indicates to the **right** of the index if the aircraft is to the **left** of the localizer beam, and to the **left** if the aircraft is to the **right** of the beam.

Pressing the **TEST** switch should produce: 10° ± 5° pitch nose up, 20° ± 5° roll to the right, ATT and FD flags in view, and FD bars indicating nose up and roll to the right.

**Warning flags:**

| Flag | Indicates |
|---|---|
| **ATT** | Internal ADI failure or Gyro Attitude (VRU) failure |
| **FD** | Internal failure of the command bars or flight director failure |
| **LOC** | Loss of the localizer valid signal or insufficient signal, index off scale |
| **Glideslope** | Loss of the glideslope valid signal, index off scale |

## Attitude Indicators (Standby)

The standby attitude indicator display comprises a two-coloured drum in an outer gimbal, a roll marker on the outer gimbal shroud, and a roll scale/aeroplane index on the front cover. A white line divides the drum's blue (sky) and dark orange (earth) colours, representing the horizon. The pitch scale can indicate **60° of dive or 80° of climb**; the roll scale is graduated at 0°, 10°, 20°, 30°, 40°, 50° and 60° left and right. A **fast erection knob** provides purely mechanical caging.

**Running up:** 28V DC is applied, producing a three-phase 19V, 400Hz supply to the gyro stator winding, which energises and runs up the rotor. At **18,000 rpm**, a sensor operates the gyro flag, removing it from view to indicate the gyro has reached usable speed with power applied.

**Erection control** is achieved by a single-pendulum mechanical erector device, slaving the gyro assembly to the local vertical via a reduction gear, an erector bob-weight (rotating at approximately **40 rpm**) and a moving pendulum; any deviation from the vertical axis is corrected.

**Caging:** because the gyro assembly may occupy a random position as it runs up, pulling the fast erection knob approximately **30 seconds** after energising the gyro brings the assembly near the vertical axis; releasing the knob allows it to align precisely.

## Direction Indicators

The Direction Indicator was the first gyroscopic instrument introduced as a "Heading Indicator," though largely superseded on current aircraft by remote-indicating compass systems. It uses a **horizontal-axis gyroscope** and, being non-magnetic, is used in conjunction with a magnetic compass. The outer ring of the gyro carries a circular card graduated in degrees, referenced against a lubber line fixed to the gyro frame; as the frame turns, the number of degrees turned can be read on the card. A **caging/setting knob** sets the indicator to the correct magnetic heading; while setting the heading, the inner gimbal must be caged to prevent it precessing as the outer gimbal is rotated.

## Turn & Slip Indicator and Turn Co-ordinator

The Turn & Slip Indicator contains two independent mechanisms: a gyroscopically controlled pointer for the rate at which the aircraft turns, and a mechanism for detecting slip/slide. The rate-of-turn pointer scale is calibrated in "Standard Rates":

| Rate | Turn Rate |
|---|---|
| Rate 1 | 180° per minute |
| Rate 2 | 360° per minute |
| Rate 3 | 540° per minute |
| Rate 4 | 720° per minute |

The **rate gyroscope** used differs from a displacement gyro in having only one gimbal ring, restrained in the longitudinal axis by a calibrated spring. Normally the rotor spin axis is horizontal (spring restraint) and the pointer is at zero. When the aircraft turns, gyro rigidity resists the turning movement, detected as a force at the rotor rim; precession then tilts the gimbal ring about the longitudinal axis, stretching the calibrated spring until its restoring force balances further deflection — so gimbal ring movement is a direct measure of turn rate.

**Bank indication** uses a ball in a curved, liquid-filled glass tube. In level flight, gravity holds the ball centred. In a correctly banked turn matched to airspeed, the resultant of gravity and centrifugal force holds the ball central. If the bank angle is incorrect for the rate of turn, the aircraft will skid or slip: in a **skid**, centrifugal force is the greater; in a **slip**, the force of gravity is the greater.

The **Turn Co-ordinator** changes the mechanism slightly from the Turn & Slip Indicator so that it senses rotation about both the longitudinal axis (bank) and the vertical axis (turn), giving the pilot a more accurate indication of the aircraft's turning.

## Horizontal Situation Indicator (HSI)

The HSI combines a servo-driven azimuth (compass) card — read against a miniature aircraft symbol and a 12 o'clock lubber line, and driven by the gyrocompass system — with navigation displays. A glideslope pointer and scale on the right-hand side show ILS glideslope deviation. The **course deviation bar** represents the centreline of a selected VOR or localizer course, with deviation shown against a scale of four white dots. Windows in the course mask show To/From indications for a VOR station (solid triangle, "V"), a selected NAV waypoint (solid triangle, "N"), an ILS-selected station (half-blue/half-yellow flag), or a failure (orange/yellow striped flag). A pink bearing pointer shows the bearing to the next waypoint, and windows show **DIST** (distance to waypoint) and **GND SPD** (ground speed). Selected course is shown by an orange dagger-shaped indicator on the heading dial, with a reciprocal pointer opposite.

**Warning flags:**

| Flag | Indicates |
|---|---|
| **MAG annunciator** | Displayed information is magnetic heading |
| **HEADING warning flag** | Heading information has become unreliable (covers the MAG annunciator) |
| **Navigation warning flag** | Navigation data missing/unreliable when tuned to a VOR station |
| **VERT warning flag (GS)** | Glideslope data missing or unreliable |

## Angle of Attack (AOA)

Knowing the angle of attack is essential for flying modern, larger aircraft. The simplest AOA indicators are the **AOA probe** and the **stall vane**: a hinged-vane sensor mounted in the wing leading edge, protruding into the airstream. In normal level flight the airstream holds the vane parallel to the airflow; if AOA increases, the airflow meets the leading edge at an increasing angle and deflects the vane. When AOA reaches a pre-set warning value, the vane activates a circuit that triggers the **stick shaker** on the control column, indicating an approaching stall.

## Stall Warning Indication

The stall warning system uses a precision, counter-balanced aerodynamic vane that positions a synchro, protected against ice formation by an internal heating element. Because pitch attitude is affected by flap extension, the sensor synchro is also interconnected with a synchro in the flap position transmitter, modifying the AOA signal output as a function of flap position.

**Stick shaking** is produced by a motor secured to the control column, driving a deliberately unbalanced weighted ring that sets up vibration in the column, simulating the natural buffeting of a stalled condition.

## Electronic Instrument Systems

Modern technology has significantly changed flight instrument layout on most current aircraft, chiefly through the introduction of **Electronic Instrument Systems**, which have replaced many complex electro-mechanical instruments with TV-type colour displays. These systems also allow images to be exchanged between display units in the event of display failures. They include:

1. **Electronic Flight Instrument System (EFIS)**
2. **Engine Instrumentation & Crew Alerting System (EICAS)**
3. **Electronic Centralized Aircraft Monitoring (ECAM)**
        $cnt$,
        5
    ) RETURNING id INTO s1_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M11B.5 Instruments and Avionics (Part 1) (24 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s1_id, 'The Earth''s atmosphere, extending to about 250 miles, is composed mainly of:',
     '[{"id":"a","text":"78% nitrogen, 21% oxygen, 1% other gases","correct":true},{"id":"b","text":"78% oxygen, 21% nitrogen, 1% other gases","correct":false},{"id":"c","text":"50% nitrogen, 50% oxygen","correct":false}]',
     '{"B1"}'),

    (s1_id, 'As altitude increases, atmospheric pressure reduces:',
     '[{"id":"a","text":"Linearly, at a constant rate","correct":false},{"id":"b","text":"Non-linearly, forming an exponential curve, with the rate of reduction decreasing as altitude rises","correct":true},{"id":"c","text":"Only above the stratopause","correct":false}]',
     '{"B1"}'),

    (s1_id, 'The three primary instruments of an Air Data System are the altimeter, the Indicated Airspeed Indicator, and the:',
     '[{"id":"a","text":"Vertical Speed Indicator","correct":true},{"id":"b","text":"Turn Co-ordinator","correct":false},{"id":"c","text":"Angle of Attack Indicator","correct":false}]',
     '{"B1"}'),

    (s1_id, 'In an Air Data System, Indicated Airspeed (IAS) is derived as:',
     '[{"id":"a","text":"Pitot minus Static pressure","correct":true},{"id":"b","text":"Pitot plus Static pressure","correct":false},{"id":"c","text":"Static pressure alone","correct":false}]',
     '{"B1"}'),

    (s1_id, 'A simple pressure (barometric) altimeter operates on the principle that, as the aircraft climbs:',
     '[{"id":"a","text":"Case pressure falls, allowing the evacuated capsule stack to expand and drive the pointer","correct":true},{"id":"b","text":"Case pressure rises, compressing the capsule stack","correct":false},{"id":"c","text":"The capsule is vented directly to Pitot pressure","correct":false}]',
     '{"B1"}'),

    (s1_id, 'With a drop in temperature, the materials of an altimeter''s capsule stack become stronger, causing the capsule stack to tend to extend. The uncompensated effect on the instrument is that it will:',
     '[{"id":"a","text":"Under-read","correct":false},{"id":"b","text":"Over-read","correct":true},{"id":"c","text":"Show no error","correct":false}]',
     '{"B1"}'),

    (s1_id, 'The Q code that, when set into an altimeter''s baroscale, causes the altimeter to read zero feet at the airfield of origin is:',
     '[{"id":"a","text":"QNH","correct":false},{"id":"b","text":"QFE","correct":true},{"id":"c","text":"QNE","correct":false}]',
     '{"B1"}'),

    (s1_id, 'At a height where the relationship in this text applies, a one-millibar change in atmospheric pressure corresponds to approximately what change in indicated altitude?',
     '[{"id":"a","text":"3 ft","correct":false},{"id":"b","text":"30 ft","correct":true},{"id":"c","text":"300 ft","correct":false}]',
     '{"B1"}'),

    (s1_id, 'A ranging spring assembly is used in an Airspeed Indicator because:',
     '[{"id":"a","text":"Dynamic pressure rises as the square of speed, while capsule movement is linear, so the square-law relationship must be compensated for a linear speed scale","correct":true},{"id":"b","text":"It reduces the instrument''s sensitivity to static pressure errors only","correct":false},{"id":"c","text":"It allows the ASI to read Mach number directly","correct":false}]',
     '{"B1"}'),

    (s1_id, 'In a Vertical Speed Indicator, static pressure reaches the capsule directly but reaches the instrument case through a restrictor (calibrated choke). The purpose of this restrictor is to:',
     '[{"id":"a","text":"Allow the capsule to respond rapidly while greatly slowing the rate at which case pressure changes, creating the differential that drives the pointer","correct":true},{"id":"b","text":"Prevent any pressure at all from reaching the case","correct":false},{"id":"c","text":"Equalise case and capsule pressure instantly","correct":false}]',
     '{"B1"}'),

    (s1_id, 'A VSI''s altitude and temperature compensation is achieved by combining, within the metering unit, an orifice with a:',
     '[{"id":"a","text":"Capillary tube","correct":true},{"id":"b","text":"Second capsule stack","correct":false},{"id":"c","text":"Bi-metallic spring","correct":false}]',
     '{"B1"}'),

    (s1_id, 'A true gyroscope, once its rotor is spinning at high speed, possesses two fundamental properties: rigidity and:',
     '[{"id":"a","text":"Precession","correct":true},{"id":"b","text":"Resonance","correct":false},{"id":"c","text":"Induction","correct":false}]',
     '{"B1"}'),

    (s1_id, 'In the Gyro Horizon Unit, attitude is indicated by the relative position of a symbolic aircraft element and a:',
     '[{"id":"a","text":"Horizon bar, stabilized by the gyroscope","correct":true},{"id":"b","text":"Rotating compass card","correct":false},{"id":"c","text":"Pitot pressure needle","correct":false}]',
     '{"B1"}'),

    (s1_id, 'On the sphere of an Attitude Director Indicator (ADI), if the vertical (roll) command bar is displayed to the right of centre, this commands the pilot to:',
     '[{"id":"a","text":"Roll left","correct":false},{"id":"b","text":"Roll right","correct":true},{"id":"c","text":"Pitch up","correct":false}]',
     '{"B1"}'),

    (s1_id, 'On an ADI, the ATT warning flag indicates:',
     '[{"id":"a","text":"An internal failure of the ADI or a Gyro Attitude (VRU) failure","correct":true},{"id":"b","text":"Loss of the localizer valid signal only","correct":false},{"id":"c","text":"A flap position disagreement","correct":false}]',
     '{"B1"}'),

    (s1_id, 'On a standby Attitude Indicator, once the gyro rotor reaches 18,000 rpm, a sensor operates the gyro flag, which:',
     '[{"id":"a","text":"Comes into view to warn of low rotor speed","correct":false},{"id":"b","text":"Disappears from view, indicating the gyro has attained a usable speed with power applied","correct":true},{"id":"c","text":"Flashes continuously until the instrument is caged","correct":false}]',
     '{"B1"}'),

    (s1_id, 'The Direction Indicator (directional gyro) uses a horizontal-axis gyroscope and, being non-magnetic, is used in conjunction with:',
     '[{"id":"a","text":"A magnetic compass","correct":true},{"id":"b","text":"A radio altimeter","correct":false},{"id":"c","text":"An angle of attack vane","correct":false}]',
     '{"B1"}'),

    (s1_id, 'On a Turn & Slip Indicator, the bank indication ball is displaced from the centre of its tube, with centrifugal force being the greater of the two forces, during a:',
     '[{"id":"a","text":"Slip","correct":false},{"id":"b","text":"Skid","correct":true},{"id":"c","text":"Correctly balanced turn only","correct":false}]',
     '{"B1"}'),

    (s1_id, 'Compared with a Turn & Slip Indicator, a Turn Co-ordinator gives a more accurate indication of aircraft turning because it senses rotation about:',
     '[{"id":"a","text":"Only the vertical (turn) axis","correct":false},{"id":"b","text":"Both the longitudinal (bank) axis and the vertical (turn) axis","correct":true},{"id":"c","text":"Only the lateral (pitch) axis","correct":false}]',
     '{"B1"}'),

    (s1_id, 'On a Horizontal Situation Indicator (HSI), the course deviation bar represents:',
     '[{"id":"a","text":"The centreline of a selected VOR radial or localizer course","correct":true},{"id":"b","text":"The aircraft''s current magnetic heading only","correct":false},{"id":"c","text":"Distance to the next waypoint","correct":false}]',
     '{"B1"}'),

    (s1_id, 'The simplest form of Angle of Attack indicator described in this text is:',
     '[{"id":"a","text":"The AOA probe / hinged-vane stall vane, mounted in the wing leading edge","correct":true},{"id":"b","text":"A radio altimeter transceiver","correct":false},{"id":"c","text":"A capacitance fuel probe","correct":false}]',
     '{"B1"}'),

    (s1_id, 'In the stall warning system, the AOA sensor synchro is interconnected with a synchro in the flap position transmitter in order to:',
     '[{"id":"a","text":"Modify the AOA signal output as a function of flap position","correct":true},{"id":"b","text":"Power the stick-shaker motor directly","correct":false},{"id":"c","text":"Prevent the flaps from being retracted in flight","correct":false}]',
     '{"B1"}'),

    (s1_id, 'A stick shaker simulates the natural buffeting of a stalled condition by:',
     '[{"id":"a","text":"A motor driving a deliberately unbalanced weighted ring, secured to the control column","correct":true},{"id":"b","text":"Directly deflecting the elevator control surface","correct":false},{"id":"c","text":"Reducing hydraulic pressure to the control column","correct":false}]',
     '{"B1"}'),

    (s1_id, 'Electronic Instrument Systems such as EFIS, EICAS and ECAM have largely replaced complex electro-mechanical instruments with:',
     '[{"id":"a","text":"TV-type colour displays, which also allow images to be exchanged between display units on failure","correct":true},{"id":"b","text":"Simple analogue dial gauges only","correct":false},{"id":"c","text":"Mechanical flag indicators exclusively","correct":false}]',
     '{"B1"}');

END $$;
