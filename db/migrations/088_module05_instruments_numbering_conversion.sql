-- Module 05: Digital Techniques / Electronic Instrument Systems (B1) — Electronic Instrument Systems, Numbering Systems, Data Conversion
-- Source: EASA Part-66 Module 5 Study Notes (Sub-Modules 01-03) + Module 5 exam-practice question bank

DO $$
DECLARE
    m05_id INT;
    s1_id  INT;
    s2_id  INT;
    s3_id  INT;
BEGIN
    SELECT id INTO m05_id FROM easa_modules WHERE code = 'M05';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M05.1') THEN
        RAISE NOTICE 'M05.1-M05.3 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 05.1: Electronic Instrument Systems
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m05_id, 'M05.1', 'Electronic Instrument Systems',
        $cnt$
# Electronic Instrument Systems

## Where We Came From: Analogue Instruments

For the first sixty years of aviation, an instrument was a self-contained machine. The Airspeed Indicator was not *told* the airspeed by anything — it measured it directly. Pitot pressure went in through a pipe, a capsule expanded, a linkage multiplied the movement, and a needle moved. The instrument was the sensor, the computer and the display all in one case.

### The Classic Six-Instrument Panel ("the T")

Six analogue instruments grew into a standard arrangement that still survives on light aircraft — and, in principle, on the glass screens of a modern Airbus.

Reading across the top of the T:
- **Airspeed Indicator** — top left
- **Attitude Indicator** — top centre
- **Altimeter** — top right
- **Heading Indicator** — bottom centre (directly under the attitude indicator)

Those four form the **basic "T"**. The two remaining instruments fill in the corners:
- **Turn and Slip Indicator** — bottom left
- **Vertical Speed Indicator** — bottom right

Adding radio navigation gives a **Radio Magnetic Indicator (RMI)** driven by the ADF, and a **Course Deviation Indicator** driven by the VOR/ILS receivers. On an ILS approach, the **glideslope needle** gives vertical guidance and the **localiser needle** gives lateral guidance, with marker beacons calling out progress down the approach.

### Analogue vs Digital — Why It Matters to an Engineer

- **Analogue instruments fail locally.** A blocked pitot line kills the ASI and nothing else — a real advantage, and the reason standby instruments are still fitted.
- **Digital instruments fail systemically.** One air data computer feeding six screens means a single fault can wipe out the airspeed indication on all of them — which is exactly why aircraft carry two or three of everything.

## What Changed in the 1970s

Two things happened at once: digital electronics became cheap and reliable enough to fly, and display tubes became small enough to fit a panel. Put them together and you get the **Electronic Instrument System** — the "glass cockpit."

- The first airliner to carry one was the **McDonnell Douglas MD-80 in 1979**, using **cathode ray tubes (CRT)**.
- Over the next decade, the **liquid crystal display (LCD)** matured and pushed the CRT out, because flat panels are **lighter, shallower, draw less power and dump less heat** into the cockpit.
- A modern flight deck may have anything from one screen in a light aircraft to eight large panels in an A380.

### The Signal Path in a Glass Cockpit

Following an airspeed signal through a digital aeroplane:

1. Pitot pressure enters an **air data computer**, which converts it to a digital number.
2. That number travels down a **data bus** as a stream of ones and zeros.
3. At the far end, a computer turns it back into something a human can read — either a pointer drawn on a screen, or the digits themselves.

**Nothing reaches the screen without passing through a symbol generator.**

## The Symbol Generator

The display unit itself is a **dumb screen** — it does not know what an attitude is. It paints whatever picture the symbol generator sends it. The symbol generator is where the aircraft's data becomes a picture.

Functions of the symbol generator:
- Receives raw parameters from the **air data computer, inertial reference system, navigation receivers, radio altimeter, weather radar and flight management computer**.
- Builds the artificial horizon, speed tape, altitude tape, compass rose, map and flight director bars.
- Drives the display unit with the finished picture.
- **Compares its own answer against the other symbol generator** and raises a flag if the two disagree — this **comparator function** is the reason a glass cockpit can be trusted.
- **Removes a parameter and posts a red flag or an amber dash line** when the incoming data is invalid.

> **A common exam trap:** If a display goes blank, the fault is not automatically in the display unit. Work backwards: **display unit → symbol generator → source data → power**. A symbol generator failure on many types blanks **two screens**, which is a strong clue in itself.

## What the Crew Actually Sees

Two display formats do most of the work. Boeing traditionally calls them **EADI** and **EHSI**; the more modern naming is **PFD** (Primary Flight Display) and **ND** (Navigation Display). The names change between manufacturers but the content does not.

### EADI / Primary Flight Display

This is the old attitude indicator, grown up:
- The **artificial horizon** fills the middle.
- The **airspeed tape** runs down the left, the **altitude tape** down the right, with **vertical speed** alongside it.
- Across the top sit the **flight mode annunciations**, telling the crew what the autopilot and autothrottle are doing.
- **Flight director bars, ILS deviation, radio altitude and decision height** all appear on the same screen.

The pilot's eyes no longer have to travel round six separate dials — everything needed to fly the aeroplane is inside one scan.

### EHSI / Navigation Display

This is the old horizontal situation indicator, grown up:
- In its simplest mode it is a **compass rose with a course pointer**.
- Select **map mode** and the flight management computer's route is drawn on it — waypoints, tracks, the top-of-descent point, the aircraft's own position.
- **Weather radar** returns can be overlaid on the same picture, and on many types **TCAS traffic** appears here too.

### Engine and Warning Displays

A third format handles the engines and aircraft systems: Boeing calls it **EICAS**, Airbus calls it **ECAM**. The difference between them is a philosophy, not just a label. A modern flight deck has **three families of display: flight, navigation, and engine/systems**.

## In the Hangar

- Display units are **line-replaceable and usually interchangeable** between positions — the aircraft tells the unit which format to show through a **pin-programmed connector or a position strap**. That is why fitting a serviceable unit into a different slot works, and why a **mis-pinned connector produces the wrong format rather than a blank screen**.
- Screens are also **dimmable to nothing**. Before signing off a "no display" snag, **check the brightness control**.
        $cnt$,
        1
    ) RETURNING id INTO s1_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 05.2: Numbering Systems
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m05_id, 'M05.2', 'Numbering Systems',
        $cnt2$
# Numbering Systems

## The One Idea: Place Value

Every numbering system works the same way. A number is a row of digit columns; each column has a weight equal to the **base raised to the power of the column number**, counting from zero at the right. Multiply each digit by its column weight, add them up, and that is the value.

You already do this without thinking in decimal — reading 4027 you are silently computing four thousands, no hundreds, two tens and seven units. Binary is not harder, it just has fewer digits available, so it needs more columns to say the same thing.

## Binary — Base 2

Two digits only: **0 and 1**. A digital circuit does not have to measure a voltage accurately — it only has to decide whether the voltage is present or absent. That decision can be made reliably by a transistor millions of times a second, and it survives noise, temperature and ageing far better than any analogue level.

- The rightmost bit is the **least significant bit (LSB)**, weight = 1.
- The leftmost bit is the **most significant bit (MSB)**.
- Column weights run **1, 2, 4, 8, 16, 32, 64, 128** and so on.

### Binary to Decimal — Example: 1 0 1 1 0 1

| Bit | 1 | 0 | 1 | 1 | 0 | 1 |
|-----|---|---|---|---|---|---|
| Weight | 32 | 16 | 8 | 4 | 2 | 1 |

32 + 0 + 8 + 4 + 0 + 1 = **45 decimal**

### Decimal to Binary: Repeated Division by 2

Divide by two, write down the remainder, divide the answer by two again, and keep going until you reach zero. Then **read the remainders upwards** (reading them the wrong way round is the single most common mistake in this topic).

Example — decimal 45 to binary:
```
45 / 2 = 22 remainder 1   ^
22 / 2 = 11 remainder 0   |
11 / 2 = 5  remainder 1   |  read
 5 / 2 = 2  remainder 1   |  upwards
 2 / 2 = 1  remainder 0   |
 1 / 2 = 0  remainder 1   |
```
Answer: **101101**

### Fractions

For the part after the point, multiply instead of divide: multiply the fraction by two, write down whichever whole number falls out (0 or 1), keep the remaining fraction and repeat. This time **read downwards**.

Example — decimal 0.6875 to binary:
```
0.6875 x 2 = 1.375  -> 1   |
0.375  x 2 = 0.75   -> 0   |  read
0.75   x 2 = 1.5    -> 1   |  downwards
0.5    x 2 = 1.0    -> 1   v
```
Answer: **0.1011**

Not every decimal fraction terminates — try 0.1 in binary and you will still be multiplying next week. This is a genuine property of the number, and it is why a digital air data computer can never hold an airspeed *exactly*; it holds the nearest value its word length allows (**quantisation error**, covered in Sub-Module 03).

### Binary Addition and Subtraction

Addition has only four rules: **0+0=0, 0+1=1, 1+0=1, 1+1=0 carry 1**. Subtraction inside a computer is usually done by adding the **two's complement** of the number instead — invert every bit and add one — because that lets the same adder circuit do both jobs.

Example:
```
  1 0 1 1 0   (22)
+ 0 1 1 0 1   (13)
-----------
  1 1 1 1 1   (35)
```

## Octal — Base 8

Eight digits, **0 to 7**. There is no such thing as an octal 8 or 9. Octal exists because **three binary digits map exactly onto one octal digit**, making it a compact shorthand for reading a binary pattern.

**ARINC 429 labels are always written in octal.** Label 203 is the octal pattern **010 000 011**.

To convert binary to octal, split the bits into groups of three from the right and convert each group; to go the other way, expand each octal digit into three bits. Decimal to octal uses repeated division by eight — the same procedure as binary, with a different divisor.

## Hexadecimal — Base 16

Sixteen digits. After 9, the letters **A to F** stand in for ten to fifteen. Hex maps **four bits to one digit**, so **one byte (eight bits) is always exactly two hex characters** — which is why memory addresses, fault codes and BITE readouts are given in hex.

| Decimal | Binary | Octal | Hex |
|---------|--------|-------|-----|
| 0 | 0000 | 0 | 0 |
| 1 | 0001 | 1 | 1 |
| 2 | 0010 | 2 | 2 |
| 3 | 0011 | 3 | 3 |
| 4 | 0100 | 4 | 4 |
| 5 | 0101 | 5 | 5 |
| 6 | 0110 | 6 | 6 |
| 7 | 0111 | 7 | 7 |
| 8 | 1000 | 10 | 8 |
| 9 | 1001 | 11 | 9 |
| 10 | 1010 | 12 | A |
| 11 | 1011 | 13 | B |
| 12 | 1100 | 14 | C |
| 13 | 1101 | 15 | D |
| 14 | 1110 | 16 | E |
| 15 | 1111 | 17 | F |

Example — binary 1101 1010 1111 to hex, and back:
```
1101  1010  1111
 D     A     F      -> DAF hex

Back again: D = 1101, A = 1010, F = 1111 -> 110110101111. Nothing was lost.
```

## Binary Coded Decimal (BCD)

BCD is a different animal — you do not convert the number as a whole, you convert **each decimal digit separately into its own four-bit group**.

Decimal 497 in pure binary is 111110001. In BCD it is **0100 1001 0111** — not the same pattern, and not the same length. BCD wastes six of the sixteen possible codes in every nibble, because **1010 through 1111 are never used**. In exchange, each group drives a decimal display directly, with no arithmetic needed.

This is why **ARINC 429 offers a BCD data format** alongside its binary one — a DME distance transmitted in BCD can be routed almost straight to a numeric readout.

> **Watch the invalid codes:** 1010, 1011, 1100, 1101, 1110 and 1111 are **illegal in BCD**. If a receiver sees one it should reject the word.

## Worked Reference Examples

- Decimal **173** = **10101101** binary = **255** octal = **AD** hex.
- Binary **10110110** = **182** decimal = **B6** hex.
- Hex **2F9** = **0010 1111 1001** binary = **761** decimal.
- Binary **0.1101** = 0.5 + 0.25 + 0 + 0.0625 = **0.8125** decimal.
- Decimal **806** in BCD = **1000 0000 0110**, requiring **twelve bits**.
        $cnt2$,
        2
    ) RETURNING id INTO s2_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 05.3: Data Conversion
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m05_id, 'M05.3', 'Data Conversion',
        $cnt3$
# Data Conversion

## Analogue vs Digital

The world an aeroplane flies through is analogue: pressure, temperature, control surface position, fuel quantity, engine speed all vary smoothly and continuously. The computers that manage the aeroplane are digital and can only handle numbers. Something has to sit between the two — the **converter**.

| | Analogue | Digital |
|---|----------|---------|
| Nature of the signal | Continuous — takes every value in between | Discrete — steps between fixed values |
| Number of states | Infinite | Two (0 and 1) |
| Effect of noise | Adds directly to the signal and cannot be removed | Ignored, provided it does not push a level past the threshold |
| Accuracy over distance | Degrades | Does not degrade; the signal is regenerated |
| Typical aircraft example | Synchro, potentiometer, thermocouple, tacho | ARINC 429 word, discrete switch line, bus data |

The killer advantage of digital is noise immunity: an analogue voltage that picks up interference is simply wrong and cannot be recovered downstream. A digital signal that picks up the same interference is still comfortably a 1 or a 0, and the receiver reconstructs a clean pulse. That single property is why the whole aircraft moved to digital.

## Analogue-to-Digital Conversion (ADC)

### Sampling

You cannot convert a continuously changing voltage — it will have moved before you finish. The first job is to **freeze it**: a **sample and hold** circuit closes a switch for a brief instant, charges a capacitor to whatever the input is at that moment, then opens the switch so the voltage sits still while the rest of the converter works on it.

The **sampling rate must be at least twice the highest frequency present in the signal** — sample too slowly and you can reconstruct a completely false signal. In practice, designers use considerably more than twice.

### Quantising

The held voltage is compared against a ladder of fixed reference levels and assigned to the nearest one. The number of available levels is set by the **word length**: **n bits gives 2ⁿ levels**.
- 8 bits → 256 steps
- 12 bits → 4096 steps
- 16 bits → 65,536 steps

The gap between the real value and the stored value is **quantisation error** — it can never be eliminated, only made smaller by using **more bits**. This is the fundamental limitation of every ADC.

> **Resolution — a worked example:** an air data computer measures altitude from 0 to 50,000 ft using a 12-bit converter — 4,096 steps across 50,000 ft, so one step is about **12 ft**. Go to 16 bits and the step becomes about **0.8 ft**. More bits costs conversion time — resolution against speed is the trade every designer makes.

### Encoding

Finally, the chosen level is expressed as a binary word and clocked out — either in parallel on a set of lines, or serially onto a data bus.

### ADC Types

| Type | How it works | Speed | Typical use |
|------|---------------|-------|-------------|
| Ramp / counter | A counter drives a DAC until it matches the input | Slow | Cheap, low-speed instrumentation |
| Successive approximation | Tries each bit in turn, MSB first, keeping it if it fits | Medium — fixed time | The workhorse. Most air data and engine ADCs |
| Flash / parallel | One comparator per level, all compared at once | Very fast | Video, radar, high-rate signals |
| Dual slope integrating | Charges then discharges a capacitor and times it | Slow but very accurate | Precision measurement, good noise rejection |

**Successive approximation** takes exactly one clock period per bit, so the conversion time is predictable — and predictable timing is worth a great deal on an aircraft.

## Digital-to-Analogue Conversion (DAC)

Going the other way is easier: each bit is used to switch a current or a voltage into a summing point, weighted according to that bit's significance. Add the contributions together and you have an analogue output.

The simplest arrangement uses a separate resistor for each bit, halving in value as significance rises — a **weighted resistor DAC**. It works, but a twelve-bit version would need resistors spanning a range of 4096 to 1, all held to the same tolerance — not manufacturable.

The **R-2R ladder** gets the same result using only **two resistor values, repeated**, which can be matched very accurately on a single chip. This is why it dominates in practice.

The output of a DAC is not a smooth curve — it is a **staircase**, one step per input code, so a **reconstruction filter** is normally fitted afterwards to smooth it. On the aircraft, DACs drive servo motors, analogue instrument movements, control surface actuators and the deflection circuits of a CRT.

## Where You Meet Both Converters on the Aeroplane

- **Into the computer (ADC):** a resolver on a flap track, a thermocouple in a jet pipe, a fuel tank probe, a pitot capsule — all analogue.
- **Out of the computer (DAC):** a torque motor on a hydraulic servo valve, an analogue standby instrument fed from a digital source, the drive to an old-style pointer indicator — all digital in, analogue out.

A great many modern LRU faults trace to **one converter channel, not to the whole box** — which is why BITE reports at parameter level rather than box level.
        $cnt3$,
        3
    ) RETURNING id INTO s3_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M05.1 Electronic Instrument Systems (19 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s1_id, 'On the classic "T" instrument arrangement, which four instruments form the basic T, and where is the heading indicator positioned?',
     '[{"id":"a","text":"Airspeed, attitude and altimeter across the top, with the heading indicator directly below the attitude indicator","correct":true},{"id":"b","text":"Airspeed, altimeter and heading indicator across the top, with the attitude indicator below the altimeter","correct":false},{"id":"c","text":"Attitude, turn and slip, and vertical speed across the top, with the heading indicator top right","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'Compared with a digital instrument system, an analogue instrument:',
     '[{"id":"a","text":"Fails locally — e.g. a blocked pitot line kills only the ASI","correct":true},{"id":"b","text":"Fails systemically — a single fault can wipe out several displays at once","correct":false},{"id":"c","text":"Cannot fail, because it has no electronic components","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'Why do modern aircraft carry two or three of everything in a digital instrument system?',
     '[{"id":"a","text":"Because a single air data computer feeding several screens means one fault could otherwise wipe out an indication on all of them","correct":true},{"id":"b","text":"Because regulations require duplicated wiring regardless of failure modes","correct":false},{"id":"c","text":"Because digital computers are less reliable than analogue instruments","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'The first airliner to be fitted with an Electronic Instrument System (glass cockpit), using cathode ray tubes, was the:',
     '[{"id":"a","text":"McDonnell Douglas MD-80, in 1979","correct":true},{"id":"b","text":"Boeing 707, in 1958","correct":false},{"id":"c","text":"Airbus A320, in 1988","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'LCDs progressively replaced CRTs in flight deck displays mainly because LCDs are:',
     '[{"id":"a","text":"Lighter, shallower, draw less power and dump less heat into the cockpit","correct":true},{"id":"b","text":"Cheaper to manufacture but heavier and bulkier","correct":false},{"id":"c","text":"The only display type capable of showing colour","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'In a modern glass cockpit, nothing reaches the display screen without first passing through the:',
     '[{"id":"a","text":"Air data computer only","correct":false},{"id":"b","text":"Symbol generator","correct":true},{"id":"c","text":"Mode control panel","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'Which of the following is NOT a function of the symbol generator?',
     '[{"id":"a","text":"Measuring pitot and static pressure directly, bypassing the air data computer","correct":true},{"id":"b","text":"Building the artificial horizon, speed tape, altitude tape and compass rose from incoming data","correct":false},{"id":"c","text":"Comparing its output with the other symbol generator and flagging any disagreement","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'If incoming data to the symbol generator becomes invalid, the symbol generator will typically:',
     '[{"id":"a","text":"Remove the affected parameter and post a red flag or amber dash line","correct":true},{"id":"b","text":"Freeze the last valid reading indefinitely with no indication to the crew","correct":false},{"id":"c","text":"Automatically shut down both display units","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'A display screen on the flight deck goes blank. Following the correct troubleshooting sequence, the engineer should work backwards through:',
     '[{"id":"a","text":"Display unit, symbol generator, source data, power","correct":true},{"id":"b","text":"Power, source data, symbol generator, display unit","correct":false},{"id":"c","text":"Symbol generator, power, display unit, source data","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'A single symbol generator failure on many aircraft types typically:',
     '[{"id":"a","text":"Blanks two screens","correct":true},{"id":"b","text":"Blanks only a single screen, with no effect elsewhere","correct":false},{"id":"c","text":"Has no visible effect until the next flight","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'The modern naming for the EADI and EHSI display formats is respectively:',
     '[{"id":"a","text":"Primary Flight Display (PFD) and Navigation Display (ND)","correct":true},{"id":"b","text":"Engine Display and Systems Display","correct":false},{"id":"c","text":"Master Display and Standby Display","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'On an EADI / Primary Flight Display, the airspeed tape and altitude tape are positioned:',
     '[{"id":"a","text":"Airspeed tape down the left, altitude tape down the right with vertical speed alongside","correct":true},{"id":"b","text":"Airspeed tape down the right, altitude tape down the left","correct":false},{"id":"c","text":"Both tapes stacked one above the other along the bottom","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'In its simplest mode, an EHSI / Navigation Display shows:',
     '[{"id":"a","text":"A compass rose with a course pointer","correct":true},{"id":"b","text":"Engine parameters and system warnings","correct":false},{"id":"c","text":"The artificial horizon and flight director bars","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'Selecting map mode on an EHSI / Navigation Display draws:',
     '[{"id":"a","text":"The flight management computer''s route — waypoints, tracks, top-of-descent point and aircraft position","correct":true},{"id":"b","text":"Only the aircraft''s current pitch and roll attitude","correct":false},{"id":"c","text":"A fixed diagram of the aircraft''s hydraulic system","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'The engine and systems display format is called EICAS by Boeing and ECAM by Airbus. A modern flight deck therefore has three families of display: flight, navigation and:',
     '[{"id":"a","text":"Engine/systems","correct":true},{"id":"b","text":"Weather only","correct":false},{"id":"c","text":"Standby instruments only","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'Display units in a glass cockpit are usually interchangeable between panel positions because:',
     '[{"id":"a","text":"The aircraft tells the unit which format to show through a pin-programmed connector or position strap","correct":true},{"id":"b","text":"Every display unit is permanently hard-wired to show only one specific format","correct":false},{"id":"c","text":"Display units contain no software and simply mirror whatever signal arrives","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'A mis-pinned display connector on a glass cockpit installation will most likely result in:',
     '[{"id":"a","text":"The wrong display format being shown, rather than a blank screen","correct":true},{"id":"b","text":"Permanent damage to the symbol generator","correct":false},{"id":"c","text":"No effect at all, since format is set by the display unit itself","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'Before signing off a "no display" snag on a glass cockpit screen, an engineer should first check:',
     '[{"id":"a","text":"The brightness (dimming) control","correct":true},{"id":"b","text":"The aircraft''s weight and balance sheet","correct":false},{"id":"c","text":"The tyre pressures","correct":false}]',
     '{"B1","B2"}'),

    (s1_id, 'What does EFIS stand for?',
     '[{"id":"a","text":"Electronic Flight Instrument System","correct":true},{"id":"b","text":"Electronic Flight Information Service","correct":false},{"id":"c","text":"Electronic Fire Indication Signal","correct":false}]',
     '{"B1","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M05.2 Numbering Systems (20 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s2_id, 'Every place-value numbering system works on the same rule: a digit''s contribution to the total is found by multiplying it by:',
     '[{"id":"a","text":"The base raised to the power of its column position, counting from zero at the right","correct":true},{"id":"b","text":"The number of digits in the whole number","correct":false},{"id":"c","text":"The base divided by the column position","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'In binary, the rightmost bit is called the least significant bit (LSB) and carries a weight of:',
     '[{"id":"a","text":"1","correct":true},{"id":"b","text":"2","correct":false},{"id":"c","text":"10","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'Convert binary 101101 to decimal.',
     '[{"id":"a","text":"45","correct":true},{"id":"b","text":"53","correct":false},{"id":"c","text":"37","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'To convert a decimal whole number into binary, the correct method is to:',
     '[{"id":"a","text":"Repeatedly divide by 2, noting the remainders, then read them upwards","correct":true},{"id":"b","text":"Repeatedly multiply by 2 and read the results downwards","correct":false},{"id":"c","text":"Subtract 2 repeatedly until zero is reached","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'Convert decimal 0.6875 into binary.',
     '[{"id":"a","text":"0.1011","correct":true},{"id":"b","text":"0.1101","correct":false},{"id":"c","text":"0.1110","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'In binary addition, 1 + 1 gives:',
     '[{"id":"a","text":"0, carry 1","correct":true},{"id":"b","text":"1, carry 0","correct":false},{"id":"c","text":"1, carry 1","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'Inside a computer, binary subtraction is usually performed by adding the two''s complement of a number, which is obtained by:',
     '[{"id":"a","text":"Inverting every bit and adding one","correct":true},{"id":"b","text":"Reversing the order of the bits","correct":false},{"id":"c","text":"Multiplying the number by minus one directly in binary","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'The reason octal is used at all is that:',
     '[{"id":"a","text":"Three binary digits map exactly onto one octal digit","correct":true},{"id":"b","text":"Octal numbers require fewer digits than decimal for the same value","correct":false},{"id":"c","text":"Octal is easier for a computer processor to multiply than binary","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'ARINC 429 word labels are conventionally written in:',
     '[{"id":"a","text":"Octal","correct":true},{"id":"b","text":"Hexadecimal","correct":false},{"id":"c","text":"Decimal","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'In hexadecimal, one byte (eight bits) is always represented by exactly:',
     '[{"id":"a","text":"Two hex characters","correct":true},{"id":"b","text":"One hex character","correct":false},{"id":"c","text":"Four hex characters","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'In Binary Coded Decimal (BCD), each decimal digit is converted:',
     '[{"id":"a","text":"Separately, into its own four-bit group","correct":true},{"id":"b","text":"As part of the whole number, exactly as in pure binary","correct":false},{"id":"c","text":"Into a three-bit octal group","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'Which of the following four-bit patterns is an invalid (illegal) BCD digit?',
     '[{"id":"a","text":"1100","correct":true},{"id":"b","text":"0111","correct":false},{"id":"c","text":"1001","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'Decimal 173 converted to binary, octal and hexadecimal is:',
     '[{"id":"a","text":"10101101 binary, 255 octal, AD hex","correct":true},{"id":"b","text":"10110101 binary, 265 octal, BA hex","correct":false},{"id":"c","text":"11010101 binary, 325 octal, D5 hex","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'What is the decimal value of hexadecimal 2F9?',
     '[{"id":"a","text":"761","correct":true},{"id":"b","text":"697","correct":false},{"id":"c","text":"825","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'What is the decimal value of the binary fraction 0.1101?',
     '[{"id":"a","text":"0.8125","correct":true},{"id":"b","text":"0.6875","correct":false},{"id":"c","text":"0.75","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'The binary number 11010111 expressed as a decimal is:',
     '[{"id":"a","text":"215","correct":true},{"id":"b","text":"223","correct":false},{"id":"c","text":"207","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'What is hexadecimal 110 in decimal?',
     '[{"id":"a","text":"272","correct":true},{"id":"b","text":"282","correct":false},{"id":"c","text":"32","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'Convert binary 011101 to octal.',
     '[{"id":"a","text":"35","correct":true},{"id":"b","text":"25","correct":false},{"id":"c","text":"33","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'What is octal 54 in hexadecimal?',
     '[{"id":"a","text":"2C","correct":true},{"id":"b","text":"4F","correct":false},{"id":"c","text":"2F","correct":false}]',
     '{"B1","B2"}'),

    (s2_id, 'A hexadecimal number is a number expressed to base:',
     '[{"id":"a","text":"16","correct":true},{"id":"b","text":"8","correct":false},{"id":"c","text":"2","correct":false}]',
     '{"B1","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M05.3 Data Conversion (19 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s3_id, 'Which of the following is the key advantage of a digital signal over an analogue signal when picking up electrical interference?',
     '[{"id":"a","text":"A digital signal that picks up noise is usually still clearly a 1 or a 0, and can be regenerated cleanly; an analogue signal that picks up the same noise is simply wrong","correct":true},{"id":"b","text":"Digital signals are completely immune to all forms of electromagnetic interference under any circumstances","correct":false},{"id":"c","text":"Analogue signals are inherently more resistant to noise than digital signals","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'In the analogue vs digital comparison, accuracy over distance:',
     '[{"id":"a","text":"Degrades for an analogue signal, but does not degrade for a digital signal because it is regenerated","correct":true},{"id":"b","text":"Degrades equally for both analogue and digital signals","correct":false},{"id":"c","text":"Improves with distance for analogue signals only","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'The purpose of a sample and hold circuit at the input of an ADC is to:',
     '[{"id":"a","text":"Freeze the input voltage on a capacitor so it does not change while the rest of the converter works on it","correct":true},{"id":"b","text":"Permanently store every historical value the sensor has ever produced","correct":false},{"id":"c","text":"Convert the frozen voltage directly into an octal number","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'For an ADC to faithfully represent a signal, the sampling rate must be:',
     '[{"id":"a","text":"At least twice the highest frequency present in the signal","correct":true},{"id":"b","text":"Exactly equal to the highest frequency present in the signal","correct":false},{"id":"c","text":"Half the highest frequency present in the signal","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'In the quantising stage of an ADC, the number of available output levels is set by the word length according to:',
     '[{"id":"a","text":"2 raised to the power of the number of bits (n bits gives 2ⁿ levels)","correct":true},{"id":"b","text":"The number of bits multiplied by 10","correct":false},{"id":"c","text":"The number of bits divided by 2","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'A twelve-bit analogue-to-digital converter can represent how many discrete levels?',
     '[{"id":"a","text":"4,096","correct":true},{"id":"b","text":"1,024","correct":false},{"id":"c","text":"65,536","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'Quantisation error in an ADC is best described as:',
     '[{"id":"a","text":"The unavoidable gap between the true analogue value and the nearest stored digital step, which can only be reduced by using more bits","correct":true},{"id":"b","text":"An error that only occurs when the sampling rate is too high","correct":false},{"id":"c","text":"A fault that can be eliminated entirely by fitting a reconstruction filter","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'An air data computer measures altitude from 0 to 50,000 ft using a 12-bit converter (4,096 steps). The approximate size of one step is:',
     '[{"id":"a","text":"About 12 ft","correct":true},{"id":"b","text":"About 50 ft","correct":false},{"id":"c","text":"About 0.8 ft","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'Which ADC type works by having a counter drive a DAC until its output matches the analogue input?',
     '[{"id":"a","text":"Ramp / counter type","correct":true},{"id":"b","text":"Successive approximation type","correct":false},{"id":"c","text":"Flash / parallel type","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'An A-to-D converter using successive approximation is described as the "workhorse" of air data and engine ADCs mainly because:',
     '[{"id":"a","text":"It takes exactly one clock period per bit, giving a fixed, predictable conversion time","correct":true},{"id":"b","text":"It is the cheapest possible type of converter to manufacture","correct":false},{"id":"c","text":"It requires no reference voltage at all","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'Which type of analogue-to-digital converter uses one comparator per level, comparing all levels simultaneously, and is therefore the fastest?',
     '[{"id":"a","text":"Flash / parallel converter","correct":true},{"id":"b","text":"Ramp / counter converter","correct":false},{"id":"c","text":"Dual slope integrating converter","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'A dual slope integrating converter, which charges then discharges a capacitor and times the process, is typically used where:',
     '[{"id":"a","text":"Precision measurement and good noise rejection are required, even though conversion is slow","correct":true},{"id":"b","text":"The very highest conversion speed is the only requirement","correct":false},{"id":"c","text":"Cost must be kept to an absolute minimum regardless of accuracy","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'Sample and hold is a technique used in:',
     '[{"id":"a","text":"Analogue-to-digital conversion","correct":true},{"id":"b","text":"Digital-to-analogue conversion only","correct":false},{"id":"c","text":"Moving-coil instrument damping only","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'The resolution of an ADC or DAC is best defined as:',
     '[{"id":"a","text":"The number of discrete values that can be represented by the digital word","correct":true},{"id":"b","text":"The rate at which data is converted, in conversions per second","correct":false},{"id":"c","text":"The resolution of the display instrument reading the converted value","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'A weighted-resistor DAC becomes impractical at higher bit counts mainly because:',
     '[{"id":"a","text":"A twelve-bit version would need resistor values spanning a 4096:1 range, all held to the same tolerance","correct":true},{"id":"b","text":"It requires more power than any digital circuit can supply","correct":false},{"id":"c","text":"It cannot be built using resistors at all, only capacitors","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'The R-2R ladder dominates DAC design in practice because:',
     '[{"id":"a","text":"It achieves the required weighting using only two resistor values, which can be matched very accurately on a single chip","correct":true},{"id":"b","text":"It uses no resistors at all, only capacitors","correct":false},{"id":"c","text":"It requires a different, unique resistor value for every single bit","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'The output of a DAC, before any filtering, takes the form of:',
     '[{"id":"a","text":"A staircase, with one step per input code","correct":true},{"id":"b","text":"A smooth, perfectly continuous curve","correct":false},{"id":"c","text":"A single fixed DC voltage regardless of input","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'Which of the following is an example of a signal passing INTO the computer through an ADC?',
     '[{"id":"a","text":"A pitot capsule pressure signal","correct":true},{"id":"b","text":"A torque motor driving a hydraulic servo valve","correct":false},{"id":"c","text":"An analogue standby instrument fed from a digital source","correct":false}]',
     '{"B1","B2"}'),

    (s3_id, 'Modern LRU built-in test equipment (BITE) typically reports faults at parameter (converter channel) level rather than box level because:',
     '[{"id":"a","text":"Many LRU faults trace to one converter channel rather than the whole box","correct":true},{"id":"b","text":"Box-level reporting is not technically possible in any digital LRU","correct":false},{"id":"c","text":"Parameter-level reporting requires no digital processing at all","correct":false}]',
     '{"B1","B2"}');

END $$;
