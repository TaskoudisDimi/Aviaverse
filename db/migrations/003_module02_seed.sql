-- Module 02: Physics — subjects and questions
-- Sources: EASA Part-66 Module 02 syllabus, NAR Gyroscopic Principles notes, Basics of Fiber Optics

DO $$
DECLARE
    m02_id INT;
    s1_id  INT;
    s2_id  INT;
    s3_id  INT;
    s4_id  INT;
BEGIN
    SELECT id INTO m02_id FROM easa_modules WHERE code = 'M02';

    -- Skip if already seeded
    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M02.1') THEN
        RAISE NOTICE 'M02 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 02.1: Matter
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m02_id, 'M02.1', 'Matter',
        $cnt$
# Matter

## Nature of Matter
All matter is made up of atoms. An atom consists of:
- **Nucleus**: contains protons (+) and neutrons (neutral)
- **Electrons**: negatively charged particles orbiting the nucleus in shells

The number of protons = **atomic number**. The total of protons + neutrons = **mass number**.

## Elements, Compounds, Mixtures
- **Element**: a pure substance made of only one type of atom (e.g. copper Cu, oxygen O)
- **Compound**: two or more elements chemically bonded (e.g. water H₂O, aluminium oxide Al₂O₃)
- **Mixture**: elements or compounds physically mixed, not bonded (e.g. air)

## States of Matter
| State | Shape | Volume | Particle motion |
|-------|-------|--------|-----------------|
| Solid | Fixed | Fixed | Vibrate about fixed positions |
| Liquid | Takes container shape | Fixed | Slide past each other |
| Gas | Takes container shape | Expands to fill | Move freely at high speed |

## Electron Shells
Electrons occupy shells:
- Shell 1 (K): max 2 electrons
- Shell 2 (L): max 8 electrons
- Shell 3 (M): max 18 electrons

Atoms with full outer shells are chemically stable (noble gases). Atoms seek full outer shells by bonding.

## Chemical Reactions
In a chemical reaction, atoms rearrange to form new substances. Energy is either absorbed (endothermic) or released (exothermic).

Aviation relevance: combustion of aviation fuel is an exothermic chemical reaction:
Fuel + O₂ → CO₂ + H₂O + heat

## Molecular Structure
Molecules are the smallest units of a compound. Intermolecular forces hold molecules together — stronger in solids, weaker in gases.

**Density** = mass ÷ volume (kg/m³). Water: 1000 kg/m³. Aluminium: 2700 kg/m³.
        $cnt$,
        1
    ) RETURNING id INTO s1_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 02.2: Mechanics
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m02_id, 'M02.2', 'Mechanics',
        $cnt2$
# Mechanics

## Statics — Forces and Moments
A **force** is a push or pull measured in Newtons (N). Forces are vectors: they have magnitude and direction.

**Resultant**: the single force that has the same effect as a system of forces.
**Equilibrant**: the force equal and opposite to the resultant, producing equilibrium.

**Moment** (torque) = Force × perpendicular distance from pivot (N·m).
For equilibrium: sum of clockwise moments = sum of anticlockwise moments.

**Centre of Gravity (CG)**: the point through which the weight of a body acts. An aircraft must maintain its CG within defined limits for stable flight.

**Stress and Strain**:
- Stress = Force ÷ Area (Pa or N/m²)
- Strain = Change in length ÷ Original length (dimensionless)
- Young's Modulus E = Stress ÷ Strain

Types of stress: tension, compression, shear, bending, torsion.

## Kinematics — Motion
**Scalar**: magnitude only (speed, distance, mass, time).
**Vector**: magnitude and direction (velocity, displacement, force, acceleration).

**Linear motion equations** (uniform acceleration a):
- v = u + at
- s = ut + ½at²
- v² = u² + 2as
- s = (u + v)t / 2

Where u = initial velocity, v = final velocity, a = acceleration, s = displacement, t = time.

**Gravitational acceleration** g = 9.81 m/s² (≈ 32 ft/s²)

**Angular motion**: similar equations apply with angle (θ), angular velocity (ω), angular acceleration (α):
- ω = ω₀ + αt
- θ = ω₀t + ½αt²

**Centripetal acceleration** = v²/r (directed toward centre of circular path)
**Centripetal force** = mv²/r

## Dynamics — Newton's Laws
**Newton's 1st Law**: A body remains at rest or in uniform motion unless acted on by a net external force (inertia).

**Newton's 2nd Law**: F = ma (force = mass × acceleration)

**Newton's 3rd Law**: For every action there is an equal and opposite reaction.

**Weight** W = mg (N). Mass is constant; weight varies with gravity.

**Momentum** = mass × velocity (kg·m/s). In a closed system, momentum is conserved.
**Impulse** = Force × time = change in momentum.

**Work** = Force × distance in direction of force (Joules, J).
**Power** = Work ÷ time = Force × velocity (Watts, W). 1 HP = 746 W.
**Energy**: kinetic energy KE = ½mv²; potential energy PE = mgh.

**Friction**: static friction force = μs × Normal force. Kinetic friction = μk × Normal force (μk < μs).

## Fluid Dynamics
**Pressure** = Force ÷ Area (Pa). Hydrostatic pressure p = ρgh.

**Archimedes' Principle**: a body immersed in a fluid experiences an upthrust equal to the weight of fluid displaced.

**Continuity equation**: A₁v₁ = A₂v₂ (for incompressible flow — area × velocity = constant)

**Bernoulli's Principle**: for steady, incompressible flow:
p + ½ρv² + ρgh = constant
Faster flow → lower pressure (basis of wing lift generation).

## Gyroscopic Principles
A **gyroscope** is a spinning wheel (rotor) mounted in gimbals. The angular momentum H = M × r × ω.

**Rigidity in space**: a spinning gyro maintains its spin-axis direction in space unless a force is applied.
Apparent wander occurs because Earth rotates at 15°/hour:
- Apparent drift = 15 × sin(latitude) °/hour
- Apparent topple = 15 × cos(latitude) °/hour

**Real (mechanical) wander**: caused by bearing friction acting on the gyro axes.

**Precession**: when a torque is applied at 90° to the spin axis, the gyro moves (precesses) around a third axis mutually perpendicular to both. The response appears 90° from the applied force, in the direction of spin.

Types of gyro:
- **Space (free) gyro**: free to rotate about all three axes, no external control
- **Tied (displacement) gyro**: space gyro with external control (e.g. Directional Gyro)
- **Earth gyro**: tied to Earth's vertical by gravity (e.g. Attitude Indicator)
- **Rate gyro**: one degree of freedom beyond spin axis; uses restraining springs to measure rate of turn
- **Rate-integrating gyro**: viscous restraint instead of springs; detects turning by precessing about output axis

**Transport wander** (for aircraft flying E or W):
Drift = Groundspeed (kt) × tan(latitude) / 60 °/hour
        $cnt2$,
        2
    ) RETURNING id INTO s2_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 02.3: Thermodynamics
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m02_id, 'M02.3', 'Thermodynamics',
        $cnt3$
# Thermodynamics

## Temperature and Heat
**Temperature** measures the average kinetic energy of particles. Scales:
- Celsius (°C): water freezes at 0°C, boils at 100°C
- Fahrenheit (°F): freezes at 32°F, boils at 212°F
- Kelvin (K): absolute scale. 0 K = −273°C (absolute zero). K = °C + 273

Conversion: °F = (°C × 9/5) + 32

**Heat** is thermal energy transferred due to temperature difference (Joules).
**Specific heat capacity** (c): energy needed to raise 1 kg by 1°C. Q = mcΔT.

## Heat Transfer
- **Conduction**: heat flows through a solid by atomic vibration
- **Convection**: heat carried by moving fluid (natural or forced)
- **Radiation**: electromagnetic waves (no medium required); all bodies emit radiation

## Gas Laws
For an ideal gas (fixed amount):

**Boyle's Law** (constant temperature T): p × V = constant → p₁V₁ = p₂V₂

**Charles' Law** (constant pressure p): V/T = constant → V₁/T₁ = V₂/T₂

**Gay-Lussac's Law** (constant volume): p/T = constant → p₁/T₁ = p₂/T₂

**Combined Gas Law**: p₁V₁/T₁ = p₂V₂/T₂ (T must be in Kelvin)

**Ideal Gas Law**: pV = nRT (R = 8.314 J/mol·K)

## Laws of Thermodynamics
**1st Law**: energy is conserved. Heat added to a system = increase in internal energy + work done by system.
Q = ΔU + W

**2nd Law**: heat flows naturally from hot to cold. No engine can be 100% efficient.
Carnot efficiency η = 1 − T_cold/T_hot (temperatures in Kelvin).

## Changes of State
**Latent heat**: energy absorbed or released during a change of state (no temperature change).
- Latent heat of fusion: solid ↔ liquid
- Latent heat of vaporisation: liquid ↔ gas (much larger)

In aircraft air-conditioning and refrigeration systems, refrigerants absorb latent heat on evaporation, providing cooling.

## Thermal Expansion
Solids, liquids and gases expand when heated.
**Linear expansion**: ΔL = L₀αΔT (α = coefficient of linear expansion)
**Volumetric expansion**: ΔV = V₀γΔT (γ ≈ 3α for isotropic solids)

Aluminium alloys have higher α than steel — important for clearances in engines.
        $cnt3$,
        3
    ) RETURNING id INTO s3_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 02.4: Optics and Wave Motion
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m02_id, 'M02.4', 'Optics and Wave Motion',
        $cnt4$
# Optics and Wave Motion

## Light
Light is electromagnetic radiation visible to the human eye (wavelength 400–700 nm).
Speed of light in vacuum: c = 3 × 10⁸ m/s.

**Reflection**: angle of incidence = angle of reflection (both measured from normal).

**Refraction**: light bends when passing between media of different optical density.
Refractive index n = speed of light in vacuum / speed of light in medium.
Snell's Law: n₁ sin θ₁ = n₂ sin θ₂.

**Total internal reflection (TIR)**: when light travels from a denser to a less dense medium and the angle of incidence exceeds the critical angle, all light is reflected internally. This is the basis of fiber optic light transmission.

## Fiber Optics
A fiber optic cable transmits light through a hair-thin glass or plastic fiber:
- **Core**: central silica region where light travels
- **Cladding**: outer silica layer with lower refractive index — confines light by TIR
- **Coating**: polymer protection layer (stripped for connectorisation)
- **Buffer**: 900 µm layer protecting the fiber during installation

**Advantages of fiber optics over copper**:
- Very high bandwidth (500 MHz·km for multimode; >10 GHz·km for single mode)
- Immune to EMI and RF interference
- No sparks or shorts — safe in flammable environments
- Lighter and smaller than equivalent copper
- High data security (no RF emission)
- Electrical isolation between endpoints

**Types of fiber**:
- **Multimode (MM)**: larger core (50/125 µm or 62.5/125 µm); multiple light paths (modes); limited bandwidth due to modal dispersion
- **Single mode (SM)**: small core (9/125 µm); one mode propagated straight through; very high bandwidth (>10 GHz·km)

**Light sources**:
- LED: multimode, widest spectral width, least bandwidth
- VCSEL: multimode, narrower spectral width than LED
- Laser: single mode, narrowest spectral width, highest bandwidth

**Typical wavelengths**: 850 nm, 1300 nm (multimode); 1300 nm, 1550 nm (single mode).

**Attenuation**: expressed in dB/km. 3 dB = 50% signal loss. Lower at operating wavelengths (natural dips).

**Modal dispersion**: in multimode fiber, different modes travel different path lengths, causing pulse spreading and limiting bandwidth. Graded-index fiber reduces this by varying the refractive index across the core.

## Wave Motion and Sound
A **wave** transfers energy without transferring matter.

**Transverse waves**: oscillation perpendicular to direction of travel (e.g. light, radio waves).
**Longitudinal waves**: oscillation parallel to direction of travel (e.g. sound).

Key parameters:
- **Wavelength (λ)**: distance between successive crests (m)
- **Frequency (f)**: oscillations per second (Hz)
- **Amplitude**: maximum displacement
- **Wave speed**: v = fλ

**Sound**: longitudinal pressure wave. Speed in air ≈ 340 m/s at sea level (increases with temperature).
**Mach number** = aircraft speed / local speed of sound.

**Doppler effect**: frequency appears higher when source approaches, lower when it recedes.
        $cnt4$,
        4
    ) RETURNING id INTO s4_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M02.1 Matter (12 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s1_id, 'The nucleus of an atom contains:',
     '[{"id":"a","text":"Protons and electrons","correct":false},{"id":"b","text":"Protons and neutrons","correct":true},{"id":"c","text":"Neutrons and electrons","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'The atomic number of an element is the number of:',
     '[{"id":"a","text":"Neutrons in the nucleus","correct":false},{"id":"b","text":"Protons in the nucleus","correct":true},{"id":"c","text":"Electrons in the outer shell","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'Which state of matter has a fixed volume but takes the shape of its container?',
     '[{"id":"a","text":"Solid","correct":false},{"id":"b","text":"Gas","correct":false},{"id":"c","text":"Liquid","correct":true}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'Water (H₂O) is best described as:',
     '[{"id":"a","text":"An element","correct":false},{"id":"b","text":"A compound","correct":true},{"id":"c","text":"A mixture","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'The maximum number of electrons in the first electron shell (K shell) is:',
     '[{"id":"a","text":"2","correct":true},{"id":"b","text":"8","correct":false},{"id":"c","text":"18","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'Air is best described as:',
     '[{"id":"a","text":"An element","correct":false},{"id":"b","text":"A compound","correct":false},{"id":"c","text":"A mixture","correct":true}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'Density is defined as:',
     '[{"id":"a","text":"Mass per unit area","correct":false},{"id":"b","text":"Mass per unit volume","correct":true},{"id":"c","text":"Volume per unit mass","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'In the combustion of aviation fuel, the reaction is:',
     '[{"id":"a","text":"Endothermic — it absorbs heat","correct":false},{"id":"b","text":"Exothermic — it releases heat","correct":true},{"id":"c","text":"Isothermal — no heat change","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'Atoms with completely filled outer electron shells are:',
     '[{"id":"a","text":"Highly reactive","correct":false},{"id":"b","text":"Chemically stable","correct":true},{"id":"c","text":"Always metals","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'The density of water is approximately:',
     '[{"id":"a","text":"100 kg/m³","correct":false},{"id":"b","text":"1000 kg/m³","correct":true},{"id":"c","text":"10000 kg/m³","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'A substance made of only one type of atom is called:',
     '[{"id":"a","text":"A compound","correct":false},{"id":"b","text":"A mixture","correct":false},{"id":"c","text":"An element","correct":true}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'Electrons carry:',
     '[{"id":"a","text":"A positive charge","correct":false},{"id":"b","text":"No charge","correct":false},{"id":"c","text":"A negative charge","correct":true}]',
     '{"B1.1","B1.3","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M02.2 Mechanics (20 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s2_id, 'Newton''s 2nd Law states that force equals:',
     '[{"id":"a","text":"Mass divided by acceleration","correct":false},{"id":"b","text":"Mass multiplied by velocity","correct":false},{"id":"c","text":"Mass multiplied by acceleration","correct":true}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'A body at rest on a frictionless surface. According to Newton''s 1st Law it will:',
     '[{"id":"a","text":"Accelerate due to gravity","correct":false},{"id":"b","text":"Remain at rest unless a net force acts on it","correct":true},{"id":"c","text":"Slowly come to a stop","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'An aircraft weighs 1500 kg. What is its weight in Newtons? (g = 9.81 m/s²)',
     '[{"id":"a","text":"1500 N","correct":false},{"id":"b","text":"14715 N","correct":true},{"id":"c","text":"152.9 N","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'Bernoulli''s principle states that, for steady flow, faster moving air has:',
     '[{"id":"a","text":"Higher pressure","correct":false},{"id":"b","text":"Lower pressure","correct":true},{"id":"c","text":"The same pressure","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'Work is calculated by:',
     '[{"id":"a","text":"Force × velocity","correct":false},{"id":"b","text":"Force × distance in the direction of the force","correct":true},{"id":"c","text":"Mass × acceleration","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'The kinetic energy of a 2 kg mass moving at 10 m/s is:',
     '[{"id":"a","text":"20 J","correct":false},{"id":"b","text":"100 J","correct":true},{"id":"c","text":"200 J","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'Momentum is defined as:',
     '[{"id":"a","text":"Mass × acceleration","correct":false},{"id":"b","text":"Mass × velocity","correct":true},{"id":"c","text":"Force × time","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'Stress is defined as:',
     '[{"id":"a","text":"Force × area","correct":false},{"id":"b","text":"Change in length divided by original length","correct":false},{"id":"c","text":"Force divided by area","correct":true}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'A torque of 50 N·m is applied at a distance of 0.5 m from a pivot. What is the force applied?',
     '[{"id":"a","text":"25 N","correct":false},{"id":"b","text":"100 N","correct":true},{"id":"c","text":"25 N·m","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'One horsepower is equal to:',
     '[{"id":"a","text":"550 W","correct":false},{"id":"b","text":"746 W","correct":true},{"id":"c","text":"1000 W","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'A gyroscope''s angular momentum is increased by:',
     '[{"id":"a","text":"Reducing the rotor mass","correct":false},{"id":"b","text":"Increasing rotor mass, radius, or spin rate","correct":true},{"id":"c","text":"Reducing the spin axis radius","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'Rigidity in space is a property of a gyroscope that means its spin axis:',
     '[{"id":"a","text":"Points toward the Earth''s centre","correct":false},{"id":"b","text":"Rotates with the Earth","correct":false},{"id":"c","text":"Maintains its direction in space unless a force is applied","correct":true}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'Gyroscopic precession occurs when a torque is applied to a gyro. The result is that the gyro moves:',
     '[{"id":"a","text":"In the direction of the applied force","correct":false},{"id":"b","text":"Around a third axis 90° to both the spin axis and input axis","correct":true},{"id":"c","text":"Opposite to the direction of the applied force","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'Apparent gyro drift at the North Pole is:',
     '[{"id":"a","text":"Zero","correct":false},{"id":"b","text":"15°/hour","correct":true},{"id":"c","text":"7.5°/hour","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'The formula for apparent gyro drift at any latitude is:',
     '[{"id":"a","text":"15 × cos(latitude) °/hour","correct":false},{"id":"b","text":"15 × tan(latitude) °/hour","correct":false},{"id":"c","text":"15 × sin(latitude) °/hour","correct":true}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'An Earth gyro (e.g. Attitude Indicator) has its spin axis constrained to:',
     '[{"id":"a","text":"The aircraft longitudinal axis","correct":false},{"id":"b","text":"Earth''s vertical (controlled by gravity)","correct":true},{"id":"c","text":"Magnetic North","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'A rate gyro uses which restraint to measure rate of turn?',
     '[{"id":"a","text":"Viscous fluid damping","correct":false},{"id":"b","text":"Restraining springs","correct":true},{"id":"c","text":"Gravity","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'Real (mechanical) wander of a gyro is caused by:',
     '[{"id":"a","text":"Earth''s rotation","correct":false},{"id":"b","text":"Aircraft movement","correct":false},{"id":"c","text":"Friction in the gimbal bearings","correct":true}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'Centripetal force acting on a mass in circular motion is directed:',
     '[{"id":"a","text":"Tangentially to the circular path","correct":false},{"id":"b","text":"Away from the centre","correct":false},{"id":"c","text":"Toward the centre of the circular path","correct":true}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'The formula for centripetal force is:',
     '[{"id":"a","text":"m × v","correct":false},{"id":"b","text":"m × v² / r","correct":true},{"id":"c","text":"m × r × v","correct":false}]',
     '{"B1.1","B1.3","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M02.3 Thermodynamics (12 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s3_id, 'Convert 20°C to Kelvin.',
     '[{"id":"a","text":"253 K","correct":false},{"id":"b","text":"293 K","correct":true},{"id":"c","text":"313 K","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'Boyle''s Law states that, at constant temperature, the pressure of a fixed mass of gas is:',
     '[{"id":"a","text":"Directly proportional to its volume","correct":false},{"id":"b","text":"Inversely proportional to its volume","correct":true},{"id":"c","text":"Independent of its volume","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'A gas occupies 4 litres at 2 bar pressure. If pressure doubles (temperature constant), the new volume is:',
     '[{"id":"a","text":"8 litres","correct":false},{"id":"b","text":"2 litres","correct":true},{"id":"c","text":"1 litre","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'The three main methods of heat transfer are:',
     '[{"id":"a","text":"Conduction, convection and radiation","correct":true},{"id":"b","text":"Conduction, advection and reflection","correct":false},{"id":"c","text":"Radiation, absorption and emission","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'Charles'' Law states that at constant pressure, the volume of a gas is:',
     '[{"id":"a","text":"Inversely proportional to absolute temperature","correct":false},{"id":"b","text":"Directly proportional to absolute temperature","correct":true},{"id":"c","text":"Independent of temperature","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'Latent heat is the heat energy involved in:',
     '[{"id":"a","text":"Raising the temperature of a substance","correct":false},{"id":"b","text":"A change of state with no temperature change","correct":true},{"id":"c","text":"Increasing the pressure of a gas","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'The First Law of Thermodynamics states that:',
     '[{"id":"a","text":"Heat flows from cold to hot","correct":false},{"id":"b","text":"Energy cannot be created or destroyed","correct":true},{"id":"c","text":"No engine can reach 100% efficiency","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'Convert 68°F to Celsius.',
     '[{"id":"a","text":"15°C","correct":false},{"id":"b","text":"20°C","correct":true},{"id":"c","text":"25°C","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'The specific heat capacity of a material is the energy required to raise:',
     '[{"id":"a","text":"1 kg by 1 K","correct":true},{"id":"b","text":"1 litre by 10°C","correct":false},{"id":"c","text":"The whole material to 100°C","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'Which gas law applies at constant volume?',
     '[{"id":"a","text":"Boyle''s Law","correct":false},{"id":"b","text":"Charles'' Law","correct":false},{"id":"c","text":"Gay-Lussac''s Law","correct":true}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'Absolute zero is approximately:',
     '[{"id":"a","text":"0°C","correct":false},{"id":"b","text":"−100°C","correct":false},{"id":"c","text":"−273°C","correct":true}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'In aircraft refrigeration systems, the refrigerant provides cooling by:',
     '[{"id":"a","text":"Absorbing latent heat during evaporation","correct":true},{"id":"b","text":"Releasing heat during compression","correct":false},{"id":"c","text":"Conducting heat through the fuselage","correct":false}]',
     '{"B1.1","B1.3","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M02.4 Optics and Wave Motion (14 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s4_id, 'Total internal reflection occurs when light:',
     '[{"id":"a","text":"Passes from a less dense to a more dense medium","correct":false},{"id":"b","text":"Passes from a denser medium and the angle exceeds the critical angle","correct":true},{"id":"c","text":"Strikes a mirror at 90°","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s4_id, 'In a fiber optic cable, light is kept within the core by:',
     '[{"id":"a","text":"Metallic shielding","correct":false},{"id":"b","text":"Total internal reflection at the core-cladding interface","correct":true},{"id":"c","text":"The coating layer","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s4_id, 'Which part of a fiber optic cable has the LOWER refractive index?',
     '[{"id":"a","text":"Core","correct":false},{"id":"b","text":"Cladding","correct":true},{"id":"c","text":"Buffer","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s4_id, 'The main advantage of fiber optic cable over copper is:',
     '[{"id":"a","text":"Lower cost for short runs","correct":false},{"id":"b","text":"Immunity to electromagnetic interference and much higher bandwidth","correct":true},{"id":"c","text":"Easier to solder","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s4_id, 'A single-mode fiber optic cable has a typical core/cladding diameter of:',
     '[{"id":"a","text":"62.5/125 µm","correct":false},{"id":"b","text":"50/125 µm","correct":false},{"id":"c","text":"9/125 µm","correct":true}]',
     '{"B1.1","B1.3","B2"}'),

    (s4_id, 'Modal dispersion in multimode fiber is caused by:',
     '[{"id":"a","text":"Attenuation due to absorption","correct":false},{"id":"b","text":"Different light modes travelling different path lengths","correct":true},{"id":"c","text":"Reflection losses at connectors","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s4_id, 'Which light source is used in single-mode fiber applications?',
     '[{"id":"a","text":"LED","correct":false},{"id":"b","text":"VCSEL","correct":false},{"id":"c","text":"Laser diode","correct":true}]',
     '{"B1.1","B1.3","B2"}'),

    (s4_id, 'Fiber optic systems are safe to use in fuel bay areas because:',
     '[{"id":"a","text":"They use low voltage electricity","correct":false},{"id":"b","text":"They do not emit sparks or cause short circuits","correct":true},{"id":"c","text":"They are shielded by the metal cladding","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s4_id, 'Sound is a:',
     '[{"id":"a","text":"Transverse electromagnetic wave","correct":false},{"id":"b","text":"Longitudinal pressure wave","correct":true},{"id":"c","text":"Transverse mechanical wave","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s4_id, 'The wave equation relating speed, frequency and wavelength is:',
     '[{"id":"a","text":"v = f / λ","correct":false},{"id":"b","text":"v = f × λ","correct":true},{"id":"c","text":"v = λ / f","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s4_id, 'Snell''s Law of refraction states that n₁ sin θ₁ equals:',
     '[{"id":"a","text":"n₂ / sin θ₂","correct":false},{"id":"b","text":"n₂ sin θ₂","correct":true},{"id":"c","text":"n₂ × θ₂","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s4_id, 'Attenuation in fiber optic cable is expressed in:',
     '[{"id":"a","text":"Hz·km","correct":false},{"id":"b","text":"dB/km","correct":true},{"id":"c","text":"W/m","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s4_id, 'The Doppler effect causes the apparent frequency of a sound source to:',
     '[{"id":"a","text":"Stay the same whether the source approaches or recedes","correct":false},{"id":"b","text":"Appear higher as the source approaches and lower as it recedes","correct":true},{"id":"c","text":"Appear lower as the source approaches","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s4_id, '3 dB of attenuation in a fiber optic link means:',
     '[{"id":"a","text":"75% of light has been lost","correct":false},{"id":"b","text":"50% of light has been lost","correct":true},{"id":"c","text":"25% of light has been lost","correct":false}]',
     '{"B1.1","B1.3","B2"}');

END $$;
