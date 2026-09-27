-- Module 01 (Mathematics) supplement: additional worked-exam-practice questions
-- for the three EXISTING subjects M01.1 (Arithmetic), M01.2 (Algebra), M01.3 (Geometry).
-- Source: 46-question worked exam-practice booklet (questions with a detected correct
-- answer only; unmarked/ambiguous questions were skipped).
-- This migration does NOT touch easa_subjects — it only inserts new question rows.

DO $$
DECLARE
    s1_id INT;
    s2_id INT;
    s3_id INT;
BEGIN
    SELECT id INTO s1_id FROM easa_subjects WHERE code = 'M01.1';
    SELECT id INTO s2_id FROM easa_subjects WHERE code = 'M01.2';
    SELECT id INTO s3_id FROM easa_subjects WHERE code = 'M01.3';

    -- Idempotency guard: check for a distinctive question from this supplement.
    IF EXISTS (SELECT 1 FROM questions WHERE subject_id = s1_id AND text LIKE '%3/8 + 5/12%') THEN
        RAISE NOTICE 'M01 supplement already seeded, skipping.';
        RETURN;
    END IF;

    INSERT INTO questions (subject_id, text, options, licence_types) VALUES
    -- ===================== M01.1 Arithmetic (7 questions) =====================
    (s1_id, 'Evaluate 3/8 + 5/12', '[{"id":"a","text":"8/20","correct":false},{"id":"b","text":"19/24","correct":true},{"id":"c","text":"15/96","correct":false}]', '{"B1","B2"}'),

    (s1_id, 'Evaluate 3¾ ÷ 1½', '[{"id":"a","text":"5⅝","correct":false},{"id":"b","text":"2½","correct":true},{"id":"c","text":"0.4","correct":false}]', '{"B1","B2"}'),

    (s1_id, 'Evaluate 12 ÷ 4 × 3 + 2', '[{"id":"a","text":"3","correct":false},{"id":"b","text":"11","correct":true},{"id":"c","text":"15","correct":false}]', '{"B1","B2"}'),

    (s1_id, 'An engine develops 85 hp from a possible 125 hp. What percentage of the available power is being developed?', '[{"id":"a","text":"40 %","correct":false},{"id":"b","text":"68 %","correct":true},{"id":"c","text":"147 %","correct":false}]', '{"B1","B2"}'),

    (s1_id, '4180 rpm is 38 % of an engine''s maximum speed. What is the maximum speed?', '[{"id":"a","text":"1588 rpm","correct":false},{"id":"b","text":"4218 rpm","correct":false},{"id":"c","text":"11 000 rpm","correct":true}]', '{"B1","B2"}'),

    (s1_id, '£240 is to be divided between four men in the ratio 9 : 11 : 13 : 15. How much does the man on the largest share receive?', '[{"id":"a","text":"£60","correct":false},{"id":"b","text":"£75","correct":true},{"id":"c","text":"£80","correct":false}]', '{"B1","B2"}'),

    (s1_id, 'An aircraft covers 750 km in 3 hours 45 minutes. What is its average speed?', '[{"id":"a","text":"166.7 km/h","correct":false},{"id":"b","text":"200 km/h","correct":true},{"id":"c","text":"250 km/h","correct":false}]', '{"B1","B2"}'),

    -- ===================== M01.2 Algebra (16 questions) =====================
    (s2_id, 'Solve 3(2y + 3) = 21', '[{"id":"a","text":"y = 2","correct":true},{"id":"b","text":"y = 3","correct":false},{"id":"c","text":"y = 9","correct":false}]', '{"B1","B2"}'),

    (s2_id, 'The volume of a cone is V = πr²h/3. Transposed to make r the subject, this becomes:', '[{"id":"a","text":"r = 3V/πh","correct":false},{"id":"b","text":"r = √(3V/πh)","correct":true},{"id":"c","text":"r = √(V/3πh)","correct":false}]', '{"B1","B2"}'),

    (s2_id, 'Solve the simultaneous equations 2x + 3y = 8 and 3x + 5y = 11. The value of x is:', '[{"id":"a","text":"x = 1","correct":false},{"id":"b","text":"x = 7","correct":true},{"id":"c","text":"x = −7","correct":false}]', '{"B1","B2"}'),

    (s2_id, 'The roots of 6x² − 5x − 6 = 0 are:', '[{"id":"a","text":"x = 1½ and x = −⅔","correct":true},{"id":"b","text":"x = −1½ and x = ⅔","correct":false},{"id":"c","text":"there are no real roots","correct":false}]', '{"B1","B2"}'),

    (s2_id, 'Expanded, (a + b)² is equal to:', '[{"id":"a","text":"a² + b²","correct":false},{"id":"b","text":"a² + 2ab + b²","correct":true},{"id":"c","text":"a² + ab + b²","correct":false}]', '{"B1","B2"}'),

    (s2_id, 'Simplify 3a²b / 6ab²', '[{"id":"a","text":"a / 2b","correct":true},{"id":"b","text":"2a / b","correct":false},{"id":"c","text":"a² / 2b²","correct":false}]', '{"B1","B2"}'),

    (s2_id, 'A car costs seven times as much as a motorcycle. Two cars and three motorcycles together cost £8500. What does one motorcycle cost?', '[{"id":"a","text":"£500","correct":true},{"id":"b","text":"£850","correct":false},{"id":"c","text":"£1214","correct":false}]', '{"B1","B2"}'),

    (s2_id, 'Solve (x − 4)/3 − (2x − 1)/2 = 4', '[{"id":"a","text":"x = −7.25","correct":true},{"id":"b","text":"x = 7.25","correct":false},{"id":"c","text":"x = −8.75","correct":false}]', '{"B1","B2"}'),

    (s2_id, 'The value of 2⁻³ is:', '[{"id":"a","text":"−8","correct":false},{"id":"b","text":"−6","correct":false},{"id":"c","text":"1/8","correct":true}]', '{"B1","B2"}'),

    (s2_id, 'Simplify a⁵ × a³ ÷ a²', '[{"id":"a","text":"a¹⁰","correct":false},{"id":"b","text":"a⁶","correct":true},{"id":"c","text":"a⁷·⁵","correct":false}]', '{"B1","B2"}'),

    (s2_id, 'Written in standard form, 0.002 is:', '[{"id":"a","text":"2.0 × 10⁻³","correct":true},{"id":"b","text":"0.2 × 10⁻²","correct":false},{"id":"c","text":"2.0 × 10³","correct":false}]', '{"B1","B2"}'),

    (s2_id, 'The binary number 101101₂ expressed in decimal is:', '[{"id":"a","text":"43","correct":false},{"id":"b","text":"45","correct":true},{"id":"c","text":"53","correct":false}]', '{"B1","B2"}'),

    (s2_id, 'The decimal number 29 expressed in binary is:', '[{"id":"a","text":"10111","correct":false},{"id":"b","text":"11101","correct":true},{"id":"c","text":"11011","correct":false}]', '{"B1","B2"}'),

    (s2_id, 'The octal number 376₈ expressed in decimal is:', '[{"id":"a","text":"254","correct":true},{"id":"b","text":"376","correct":false},{"id":"c","text":"886","correct":false}]', '{"B1","B2"}'),

    (s2_id, 'The hexadecimal number A7₁₆ expressed in binary is:', '[{"id":"a","text":"10100111","correct":true},{"id":"b","text":"10100110","correct":false},{"id":"c","text":"11100101","correct":false}]', '{"B1","B2"}'),

    (s2_id, 'Given that log₁₀ 2 = 0.301, the value of log₁₀ 200 is:', '[{"id":"a","text":"0.602","correct":false},{"id":"b","text":"2.301","correct":true},{"id":"c","text":"3.010","correct":false}]', '{"B1","B2"}'),

    -- ===================== M01.3 Geometry (20 questions) =====================
    (s3_id, 'The sum of the interior angles of a hexagon is:', '[{"id":"a","text":"360°","correct":false},{"id":"b","text":"720°","correct":true},{"id":"c","text":"1080°","correct":false}]', '{"B1","B2"}'),

    (s3_id, 'A right-angled triangle has sides of 5 mm and 12 mm about the right angle. The hypotenuse is:', '[{"id":"a","text":"8.5 mm","correct":false},{"id":"b","text":"13 mm","correct":true},{"id":"c","text":"17 mm","correct":false}]', '{"B1","B2"}'),

    (s3_id, 'A wheel of diameter 715 mm makes 30 complete revolutions. The distance travelled is:', '[{"id":"a","text":"21.45 m","correct":false},{"id":"b","text":"67.4 m","correct":true},{"id":"c","text":"134.8 m","correct":false}]', '{"B1","B2"}'),

    (s3_id, 'One radian is equal to approximately:', '[{"id":"a","text":"3.142°","correct":false},{"id":"b","text":"6.2832°","correct":false},{"id":"c","text":"57.3°","correct":true}]', '{"B1","B2"}'),

    (s3_id, 'A two-cylinder engine has a bore of 77 mm and a stroke of 89 mm. Its total cubic capacity is:', '[{"id":"a","text":"414.44 cm³","correct":false},{"id":"b","text":"828.88 cm³","correct":true},{"id":"c","text":"3315.5 cm³","correct":false}]', '{"B1","B2"}'),

    (s3_id, 'A trapezium has parallel sides of 8 cm and 12 cm, and a vertical height of 5 cm. Its area is:', '[{"id":"a","text":"40 cm²","correct":false},{"id":"b","text":"50 cm²","correct":true},{"id":"c","text":"100 cm²","correct":false}]', '{"B1","B2"}'),

    (s3_id, 'A volume of 2 500 000 mm³ expressed in cm³ is:', '[{"id":"a","text":"2500 cm³","correct":true},{"id":"b","text":"25 000 cm³","correct":false},{"id":"c","text":"250 000 cm³","correct":false}]', '{"B1","B2"}'),

    (s3_id, 'In the equation of a straight line, y = mx + c, the term c represents:', '[{"id":"a","text":"the gradient of the line","correct":false},{"id":"b","text":"the intercept on the y-axis","correct":true},{"id":"c","text":"the intercept on the x-axis","correct":false}]', '{"B1","B2"}'),

    (s3_id, 'When data is plotted, the quantity placed on the horizontal (x) axis is:', '[{"id":"a","text":"the dependent variable","correct":false},{"id":"b","text":"the independent variable","correct":true},{"id":"c","text":"always time","correct":false}]', '{"B1","B2"}'),

    (s3_id, 'A graph of the function y = kx² produces:', '[{"id":"a","text":"a straight line through the origin","correct":false},{"id":"b","text":"a parabola","correct":true},{"id":"c","text":"a sine wave","correct":false}]', '{"B1","B2"}'),

    (s3_id, 'On a graph of speed against time, the area beneath the curve represents:', '[{"id":"a","text":"the acceleration","correct":false},{"id":"b","text":"the distance travelled","correct":true},{"id":"c","text":"the average speed","correct":false}]', '{"B1","B2"}'),

    (s3_id, 'The period of the function y = sin x is:', '[{"id":"a","text":"90°","correct":false},{"id":"b","text":"180°","correct":false},{"id":"c","text":"360°","correct":true}]', '{"B1","B2"}'),

    (s3_id, 'In a right-angled triangle the sides are 3, 4 and 5 units. Taking φ as the angle opposite the side of 3 units, cos φ is:', '[{"id":"a","text":"0.6","correct":false},{"id":"b","text":"0.75","correct":false},{"id":"c","text":"0.8","correct":true}]', '{"B1","B2"}'),

    (s3_id, 'If sin θ = 0.5, the angle θ is:', '[{"id":"a","text":"30°","correct":true},{"id":"b","text":"45°","correct":false},{"id":"c","text":"60°","correct":false}]', '{"B1","B2"}'),

    (s3_id, 'For an angle lying in the second quadrant (between 90° and 180°), which of the following is positive?', '[{"id":"a","text":"sine only","correct":true},{"id":"b","text":"cosine only","correct":false},{"id":"c","text":"tangent only","correct":false}]', '{"B1","B2"}'),

    (s3_id, 'The three sides of a triangle are known, but none of its angles. To find an angle you would use:', '[{"id":"a","text":"the sine rule","correct":false},{"id":"b","text":"the cosine rule","correct":true},{"id":"c","text":"Pythagoras'' theorem","correct":false}]', '{"B1","B2"}'),

    (s3_id, 'The value of tan 90° is:', '[{"id":"a","text":"0","correct":false},{"id":"b","text":"1","correct":false},{"id":"c","text":"infinity","correct":true}]', '{"B1","B2"}'),

    (s3_id, 'The mid-point of the straight line joining the points (2, 1) and (6, 4) is:', '[{"id":"a","text":"(4, 2.5)","correct":true},{"id":"b","text":"(4, 3)","correct":false},{"id":"c","text":"(8, 5)","correct":false}]', '{"B1","B2"}'),

    (s3_id, 'The rectangular co-ordinates (2, 1) expressed in polar form are:', '[{"id":"a","text":"(2.236, 26.57°)","correct":true},{"id":"b","text":"(2.236, 63.43°)","correct":false},{"id":"c","text":"(3, 26.57°)","correct":false}]', '{"B1","B2"}'),

    (s3_id, 'To convert the polar co-ordinates (r, φ) to rectangular co-ordinates, the x value is given by:', '[{"id":"a","text":"x = r sin φ","correct":false},{"id":"b","text":"x = r cos φ","correct":true},{"id":"c","text":"x = r / cos φ","correct":false}]', '{"B1","B2"}')
    ;
END $$;
