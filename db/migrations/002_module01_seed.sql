-- Module 01: Mathematics — subjects and questions
-- Source: EASA Part-66 Module 01 official textbook, IKAROS ATC study notes, Module 01 Q&A bank

DO $$
DECLARE
    m01_id INT;
    s1_id  INT;
    s2_id  INT;
    s3_id  INT;
BEGIN
    SELECT id INTO m01_id FROM easa_modules WHERE code = 'M01';

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 01.1: Arithmetic
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m01_id, 'M01.1', 'Arithmetic',
        $cnt$
# Arithmetic

## Number System
Arithmetic uses real numbers with four operations: addition (+), subtraction (−), multiplication (×) and division (÷). Whole numbers (integers) use the decimal system with ten digits: 0–9.

## Directed Numbers
Numbers with a + or − sign. Key rules:
- (+) × (+) = (+)
- (+) × (−) = (−)
- (−) × (−) = (+)
Division follows the same sign rules.

## Factors and Multiples
**Prime numbers** have exactly two factors: 1 and themselves (2, 3, 5, 7, 11, 13, 17, 19, 23, 29…)

**Highest Common Factor (HCF)**: the largest factor that divides into all given numbers.

**Lowest Common Multiple (LCM)**: the smallest number into which all given numbers divide exactly.

## Arithmetical Precedence — BODMAS
**B**rackets → **O**f → **D**ivision → **M**ultiplication → **A**ddition → **S**ubtraction

Example: 4{2(5−1)−3}+8 = 4{5}+8 = **28**

## Fractions
- **Proper**: numerator < denominator (e.g. 11/16)
- **Improper**: numerator ≥ denominator (e.g. 23/4)
- **Mixed number**: e.g. 5¾

Addition/Subtraction: find the Lowest Common Denominator (LCD) first.
Multiplication: multiply numerators together and denominators together.
Division: invert the divisor and multiply.

## Decimal Fractions
Convert a fraction to a decimal by dividing numerator by denominator. E.g., 7/8 = 0.875.

When multiplying decimals, the answer has as many decimal places as the combined total of both numbers.

## Weights and Measures
**SI units**: metre (m), kilogram (kg), second (s), Kelvin (K), ampere (A).

Useful conversions:
- 1 inch = 2.54 cm
- 1 mile = 1.6094 km
- 1 nautical mile = 1.852 km
- 1 UK gallon = 4.546 litres
- 1 US gallon = 3.785 litres
- 1 knot = 1.1508 mph

## Ratio and Proportion
A **ratio** compares two quantities: 5:3 means 5 parts to 3 parts.

Examples in aviation:
- Compression ratio = volume at BDC ÷ volume at TDC
- Gear ratio = teeth on driver gear ÷ teeth on driven gear

**Proportion**: a statement that two ratios are equal. E.g., 3/4 = 6/8.

## Averages and Percentages
**Average** = (sum of all values) ÷ (number of values)

**Percentage** = a fraction with denominator 100.
- To find X% of N: multiply N × X/100
- To express A as a % of B: (A ÷ B) × 100

## Powers and Roots
| Expression | Meaning | Value |
|---|---|---|
| 3² | 3 squared | 9 |
| 2³ | 2 cubed | 8 |
| 2⁻³ | negative power | 1/8 |
| √25 | square root | 5 |
| ∛64 | cube root | 4 |

**Scientific notation**: 8347 = 8.347 × 10³;  0.003 = 3 × 10⁻³

Laws of indices: aᵐ × aⁿ = aᵐ⁺ⁿ;  aᵐ ÷ aⁿ = aᵐ⁻ⁿ;  (aᵐ)ⁿ = aᵐⁿ
        $cnt$,
        1
    ) RETURNING id INTO s1_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 01.2: Algebra
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m01_id, 'M01.2', 'Algebra',
        $cnt2$
# Algebra

## Introduction
Algebra uses letters (variables) to represent numbers in formulas and equations.

Operations:
- Adding a and b: a + b
- Subtracting: a − b
- Multiplying: ab (or a·b)
- Dividing: a/b
- Squaring: a²

## Removing Brackets
Every term inside the bracket is multiplied by the factor outside:
- a(x + y) = ax + ay
- (a + b)(x + y) = ax + ay + bx + by
- (a + b)² = a² + 2ab + b²
- (a − b)² = a² − 2ab + b²
- (a + b)(a − b) = a² − b²

## Linear Equations
Contains only the first power of the unknown.
**Golden rule**: whatever you do to one side, do the same to the other side.

Example: 5y − 5 = 3y + 9  → 2y = 14  → y = 7

## Transposition of Formulae
Rearranging a formula to make a different variable the subject.

Example — make r the subject of V = πr²h/3:
1. 3V = πr²h  (multiply both sides by 3)
2. 3V/(πh) = r²  (divide both sides by πh)
3. r = √(3V/πh)  (take square root)

## Simultaneous Equations (two unknowns)
Eliminate one unknown by making its coefficients equal, then add or subtract the equations.

Example: 4x − 3y = 1  and  x + 3y = 19
Adding both: 5x = 20  →  x = 4  →  y = 5

## Quadratic Equations
Form: ax² + bx + c = 0

**Quadratic formula**: x = (−b ± √(b² − 4ac)) / 2a

- b² − 4ac > 0: two different real roots
- b² − 4ac = 0: one repeated root
- b² − 4ac < 0: no real roots

Example: x² + 2x − 15 = 0  →  (x + 5)(x − 3) = 0  →  x = −5 or x = 3

## Number Systems
| System | Base | Digits |
|--------|------|--------|
| Binary | 2 | 0, 1 |
| Octal | 8 | 0–7 |
| Decimal | 10 | 0–9 |
| Hexadecimal | 16 | 0–9, A–F |

Decimal → Binary: divide repeatedly by 2, read remainders upward.
Example: 45 → 101101₂

Hexadecimal letters: A=10, B=11, C=12, D=13, E=14, F=15

## Logarithms
If y = aˣ then x = logₐ(y).
Common logs (base 10): log 10 = 1, log 100 = 2, log 1000 = 3, log 1 = 0.

Rules:
- log(MN) = log M + log N
- log(M/N) = log M − log N
- log(Mˣ) = x · log M
        $cnt2$,
        2
    ) RETURNING id INTO s2_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 01.3: Geometry
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m01_id, 'M01.3', 'Geometry',
        $cnt3$
# Geometry

## Angular Measurement
- Full circle = 360° = 2π radians
- Right angle = 90° = π/2 radians
- 1° = 60 minutes ('); 1' = 60 seconds ('')
- **1 radian ≈ 57.3°** (arc length equals radius)
- Conversion: degrees × π/180 = radians

Types of angles:
- **Acute**: less than 90°
- **Right**: exactly 90°
- **Obtuse**: between 90° and 180°
- **Reflex**: greater than 180°
- **Complementary**: two angles that sum to 90°
- **Supplementary**: two angles that sum to 180°

## Triangles
Sum of interior angles = **180°**
Area = ½ × base × perpendicular height

| Type | Description |
|------|-------------|
| Equilateral | All 3 sides equal; all angles = 60° |
| Isosceles | 2 sides equal; 2 base angles equal |
| Scalene | All 3 sides and angles different |
| Right-angled | One angle = 90°; longest side = hypotenuse |

**Pythagoras Theorem** (right-angled triangles): a² + b² = c²
Example: sides 5 and 12 → hypotenuse = √(25 + 144) = **13**

## Quadrilaterals
Sum of interior angles = **360°**

| Shape | Properties |
|-------|-----------|
| Square | All sides equal; all angles 90° |
| Rectangle | Opposite sides equal; all angles 90° |
| Parallelogram | Opposite sides parallel and equal |
| Rhombus | All sides equal; diagonals bisect at 90° |
| Trapezium | One pair of parallel sides |

## Circles
- Circumference C = πD = 2πr  (π ≈ 3.14159)
- Area = πr²
- Arc length = rθ  (θ in radians)
- Sector area = ½r²θ

## Areas and Volumes
| Shape | Formula |
|-------|---------|
| Rectangle | L × W |
| Triangle | ½bh |
| Circle | πr² |
| Trapezium | ½(a+b)h |
| Cylinder | πr²h |
| Cone | ⅓πr²h |
| Sphere | (4/3)πr³ |
| Surface of sphere | 4πr² |

## Trigonometry (SOHCAHTOA)
For a right-angled triangle with angle θ:

- **sin θ** = Opposite / Hypotenuse
- **cos θ** = Adjacent / Hypotenuse
- **tan θ** = Opposite / Adjacent

Key values:
| Angle | sin | cos | tan |
|-------|-----|-----|-----|
| 0° | 0 | 1 | 0 |
| 30° | 0.5 | 0.866 | 0.577 |
| 45° | 0.707 | 0.707 | 1 |
| 60° | 0.866 | 0.5 | 1.732 |
| 90° | 1 | 0 | undefined |

## Graphs
Straight line: y = mx + c
- m = gradient (rise ÷ run)
- c = y-intercept

Quadratic: y = ax² → parabola
Trigonometric: y = sin x and y = cos x → period 360°

## Coordinate Systems
**Rectangular (Cartesian)**: position as (x, y)
**Polar**: position as (r, θ); r = distance from origin, θ = angle from x-axis

Conversion: x = r cos θ,  y = r sin θ
Reverse: r = √(x²+y²),  θ = arctan(y/x)
        $cnt3$,
        3
    ) RETURNING id INTO s3_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M01.1 Arithmetic (20 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s1_id, 'A car travels 24 miles in 45 minutes. What is its average speed?',
     '[{"id":"a","text":"18 mph","correct":false},{"id":"b","text":"32 mph","correct":true},{"id":"c","text":"36 mph","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'Work out: 4{2(5−1)−3}+8',
     '[{"id":"a","text":"28","correct":true},{"id":"b","text":"37","correct":false},{"id":"c","text":"54","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'What is 15.4/2 − 2 × (6.2 − 15.6)?',
     '[{"id":"a","text":"−11.1","correct":false},{"id":"b","text":"11.1","correct":false},{"id":"c","text":"26.5","correct":true}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'A cuboid has dimensions 4 cm × 6 cm × 12 cm. What is its volume in m³?',
     '[{"id":"a","text":"0.028 m³","correct":false},{"id":"b","text":"0.000288 m³","correct":true},{"id":"c","text":"2.88 m³","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'A rectangle measures 11 cm × 120 cm. What is its area in m²?',
     '[{"id":"a","text":"0.132 m²","correct":true},{"id":"b","text":"13.2 m²","correct":false},{"id":"c","text":"1320 m²","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'Calculate: 4 3/8 − 2 1/4 + 1/8',
     '[{"id":"a","text":"2 1/8","correct":false},{"id":"b","text":"2 1/4","correct":true},{"id":"c","text":"2 1/2","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, '11/16 + 5/8 = ?',
     '[{"id":"a","text":"55/128","correct":false},{"id":"b","text":"10/11","correct":false},{"id":"c","text":"21/16","correct":true}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, '5/8 + 3/4 = ?',
     '[{"id":"a","text":"11/4","correct":false},{"id":"b","text":"8/8","correct":false},{"id":"c","text":"11/8","correct":true}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, '3/4 multiplied by 0.82 equals:',
     '[{"id":"a","text":"0.615","correct":true},{"id":"b","text":"1.23","correct":false},{"id":"c","text":"2.46","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'Express 9/20 as a percentage.',
     '[{"id":"a","text":"40%","correct":false},{"id":"b","text":"45%","correct":true},{"id":"c","text":"47%","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'Express 3/8 as a percentage.',
     '[{"id":"a","text":"0.375%","correct":false},{"id":"b","text":"3.75%","correct":false},{"id":"c","text":"37.5%","correct":true}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'What is 30% of 0.01?',
     '[{"id":"a","text":"0.03","correct":false},{"id":"b","text":"0.003","correct":true},{"id":"c","text":"0.0003","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'An engine of 96 horsepower is running at 75% power. How much horsepower is being developed?',
     '[{"id":"a","text":"62 hp","correct":false},{"id":"b","text":"72 hp","correct":true},{"id":"c","text":"168 hp","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'Find the square root of 1600.',
     '[{"id":"a","text":"40","correct":true},{"id":"b","text":"80","correct":false},{"id":"c","text":"800","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'Find the Lowest Common Multiple (LCM) of 6, 7 and 8.',
     '[{"id":"a","text":"84","correct":false},{"id":"b","text":"168","correct":true},{"id":"c","text":"336","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'Convert 162 knots to miles per hour (1 knot = 1.1508 mph).',
     '[{"id":"a","text":"176 mph","correct":false},{"id":"b","text":"186 mph","correct":true},{"id":"c","text":"196 mph","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'How many centimetres are in one inch?',
     '[{"id":"a","text":"0.254 cm","correct":false},{"id":"b","text":"2.54 cm","correct":true},{"id":"c","text":"25.4 cm","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'The ratio 6:5 can also be expressed as:',
     '[{"id":"a","text":"10:16","correct":false},{"id":"b","text":"20:25","correct":false},{"id":"c","text":"24:20","correct":true}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'To find the area of a circle you multiply:',
     '[{"id":"a","text":"Twice the radius by π","correct":false},{"id":"b","text":"The square of the circumference by the radius","correct":false},{"id":"c","text":"The square of the radius by π","correct":true}]',
     '{"B1.1","B1.3","B2"}'),

    (s1_id, 'A prime number is one that:',
     '[{"id":"a","text":"Can only be divided by itself and 1","correct":true},{"id":"b","text":"Is always an even number","correct":false},{"id":"c","text":"Is always divisible by 3","correct":false}]',
     '{"B1.1","B1.3","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M01.2 Algebra (16 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s2_id, 'Solve the equation: 5x = 3x + 2',
     '[{"id":"a","text":"x = 3","correct":false},{"id":"b","text":"x = 1","correct":true},{"id":"c","text":"x = 5","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'Make L the subject of the formula 2πfL = x.',
     '[{"id":"a","text":"L = 2πf","correct":false},{"id":"b","text":"L = 2πf/x","correct":false},{"id":"c","text":"L = x / (2πf)","correct":true}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'Expand: (x − 3)(x + 5)',
     '[{"id":"a","text":"x² + 2x − 15","correct":true},{"id":"b","text":"x² + 2x","correct":false},{"id":"c","text":"x² − 15","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'Solve by factorising: x² + 2x − 15 = 0',
     '[{"id":"a","text":"x = 3 or x = −5","correct":true},{"id":"b","text":"x = 5 or x = −3","correct":false},{"id":"c","text":"x = 3 or x = 5","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'What is the decimal value of the binary number 100000?',
     '[{"id":"a","text":"16","correct":false},{"id":"b","text":"32","correct":true},{"id":"c","text":"64","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'What is log₁₀(1000)?',
     '[{"id":"a","text":"1","correct":false},{"id":"b","text":"2","correct":false},{"id":"c","text":"3","correct":true}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'Simplify: 3a − 2b + 6a − 3b − 2a',
     '[{"id":"a","text":"7a + 5b","correct":false},{"id":"b","text":"7a − 5b","correct":true},{"id":"c","text":"11a − 5b","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'Solve: 2x = 4(x − 3)',
     '[{"id":"a","text":"x = 0.5","correct":false},{"id":"b","text":"x = 2","correct":false},{"id":"c","text":"x = 6","correct":true}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'The hexadecimal digit D equals what decimal value?',
     '[{"id":"a","text":"8","correct":false},{"id":"b","text":"13","correct":true},{"id":"c","text":"17","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'The equation ax² + bx + c = 0 is called a:',
     '[{"id":"a","text":"Linear equation","correct":false},{"id":"b","text":"Quadratic equation","correct":true},{"id":"c","text":"Simultaneous equation","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'If y/x = 4 and x = 5, then y = ?',
     '[{"id":"a","text":"1¼","correct":false},{"id":"b","text":"4/5","correct":false},{"id":"c","text":"20","correct":true}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'log 9 − log 3 = ?',
     '[{"id":"a","text":"log 3","correct":true},{"id":"b","text":"log 6","correct":false},{"id":"c","text":"log 27","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'Octal is a number system to the base of:',
     '[{"id":"a","text":"2","correct":false},{"id":"b","text":"8","correct":true},{"id":"c","text":"16","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'Solve for x: 5x − 7 = 3',
     '[{"id":"a","text":"x = −2","correct":false},{"id":"b","text":"x = 4/5","correct":false},{"id":"c","text":"x = 2","correct":true}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'Solve simultaneously: 4x − 3y = 1 and x + 3y = 19.',
     '[{"id":"a","text":"x = 3, y = 4","correct":false},{"id":"b","text":"x = 4, y = 5","correct":true},{"id":"c","text":"x = 5, y = 3","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s2_id, 'What is log₁₀(1)?',
     '[{"id":"a","text":"0","correct":true},{"id":"b","text":"1","correct":false},{"id":"c","text":"10","correct":false}]',
     '{"B1.1","B1.3","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M01.3 Geometry (18 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s3_id, 'A scalene triangle has:',
     '[{"id":"a","text":"Two sides unequal","correct":false},{"id":"b","text":"All three sides unequal","correct":true},{"id":"c","text":"Two sides equal","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'An equilateral triangle has:',
     '[{"id":"a","text":"No equal sides","correct":false},{"id":"b","text":"Two equal sides","correct":false},{"id":"c","text":"Three equal sides and three angles of 60°","correct":true}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'The sum of the interior angles of a triangle is:',
     '[{"id":"a","text":"90°","correct":false},{"id":"b","text":"180°","correct":true},{"id":"c","text":"360°","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'The circumference of a circle is found by:',
     '[{"id":"a","text":"Multiplying the diameter by π","correct":true},{"id":"b","text":"Multiplying the radius by π","correct":false},{"id":"c","text":"Dividing the diameter by π","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'One radian is equal to approximately:',
     '[{"id":"a","text":"75°","correct":false},{"id":"b","text":"57.3°","correct":true},{"id":"c","text":"90°","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'In a right-angled triangle, sin θ equals:',
     '[{"id":"a","text":"Opposite ÷ Hypotenuse","correct":true},{"id":"b","text":"Adjacent ÷ Hypotenuse","correct":false},{"id":"c","text":"Opposite ÷ Adjacent","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'In a right-angled triangle, cos θ equals:',
     '[{"id":"a","text":"Opposite ÷ Hypotenuse","correct":false},{"id":"b","text":"Adjacent ÷ Hypotenuse","correct":true},{"id":"c","text":"Opposite ÷ Adjacent","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'In a right-angled triangle, tan θ equals:',
     '[{"id":"a","text":"Opposite ÷ Adjacent","correct":true},{"id":"b","text":"Adjacent ÷ Hypotenuse","correct":false},{"id":"c","text":"Opposite ÷ Hypotenuse","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'A right-angled triangle has the two shorter sides of 5 cm and 12 cm. What is the length of the hypotenuse?',
     '[{"id":"a","text":"13 cm","correct":true},{"id":"b","text":"15 cm","correct":false},{"id":"c","text":"17 cm","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'An obtuse angle is one that:',
     '[{"id":"a","text":"Is greater than 180°","correct":false},{"id":"b","text":"Is less than 90°","correct":false},{"id":"c","text":"Is greater than 90° but less than 180°","correct":true}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'A quadrilateral with only one pair of parallel sides is called a:',
     '[{"id":"a","text":"Trapezium","correct":true},{"id":"b","text":"Rhombus","correct":false},{"id":"c","text":"Parallelogram","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'How many radians are in a full circle (360°)?',
     '[{"id":"a","text":"π","correct":false},{"id":"b","text":"2π","correct":true},{"id":"c","text":"4π","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'The area of a circle whose circumference is 12 cm is approximately:',
     '[{"id":"a","text":"3.8 cm²","correct":false},{"id":"b","text":"11.5 cm²","correct":true},{"id":"c","text":"38 cm²","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'The gradient of a straight-line graph y = mx + c is represented by:',
     '[{"id":"a","text":"c","correct":false},{"id":"b","text":"m","correct":true},{"id":"c","text":"x","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'At which angle do sin and cos have the same numerical value?',
     '[{"id":"a","text":"0°","correct":false},{"id":"b","text":"45°","correct":true},{"id":"c","text":"60°","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'A circular panel is secured by 7 equally spaced rivets. What is the angular spacing between adjacent rivets?',
     '[{"id":"a","text":"51.43°","correct":true},{"id":"b","text":"51.50°","correct":false},{"id":"c","text":"52.00°","correct":false}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'The volume of a sphere of radius r is:',
     '[{"id":"a","text":"πr²","correct":false},{"id":"b","text":"4πr²","correct":false},{"id":"c","text":"(4/3)πr³","correct":true}]',
     '{"B1.1","B1.3","B2"}'),

    (s3_id, 'In polar coordinates, a point is defined by:',
     '[{"id":"a","text":"Its x and y distances from the origin","correct":false},{"id":"b","text":"A distance r from the origin and an angle θ","correct":true},{"id":"c","text":"Two angles measured from the axes","correct":false}]',
     '{"B1.1","B1.3","B2"}');

END $$;
