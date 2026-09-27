-- Module 05: Digital Techniques / Electronic Instrument Systems — Microprocessors, Integrated Circuits, Multiplexing, Fibre Optics
-- Source: EASA Part-66 Module 5 Study Notes, Sub-Modules 07-10 (pp. 45-58)

DO $$
DECLARE
    m05_id INT;
    s7_id  INT;
    s8_id  INT;
    s9_id  INT;
    s10_id INT;
BEGIN
    SELECT id INTO m05_id FROM easa_modules WHERE code = 'M05';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M05.7') THEN
        RAISE NOTICE 'M05.7-M05.10 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 05.7: Microprocessors
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m05_id, 'M05.7', 'Microprocessors',
        $cnt$
# Microprocessors

*Sub-Modules 07, 08 and 09 carry no required level for category B1 — they are B2 material. They are included here anyway, kept short: they close a gap that makes the rest of the module easier to follow, and they will be needed if the licence is later converted to B2. Read for understanding; do not spend B1 revision time memorising them.*

## What a Microprocessor Actually Is

A **microprocessor** is a complete central processing unit fabricated on a single integrated circuit. Everything inside a CPU block — control unit, ALU, registers, clock circuitry — is on one piece of silicon a few millimetres across. Add memory and input/output to it and the result is a **microcomputer**.

## The Elements, One by One

### Control Unit

Reads each instruction, decodes it, and issues the control signals that make everything else act. It does not do arithmetic itself; it tells the ALU when to do arithmetic. It is the part of the chip that turns a stored number into a sequence of actions.

### Arithmetic and Logic Unit (ALU)

The working end. It adds and subtracts, performs AND, OR, NOT and exclusive-OR bit by bit, and shifts numbers left and right. It also sets status flags — **carry, zero, negative, overflow** — which the control unit reads to make decisions. That is how a program branches: the ALU compares two numbers, the zero flag sets or does not, and the control unit takes one path or the other.

### Registers

Small, extremely fast stores inside the chip:

- **Accumulator** — holds one operand going into the ALU and receives the result coming out.
- **Program counter** — holds the address of the next instruction. Increments automatically; a jump instruction simply loads a different value into it.
- **Instruction register** — holds the instruction currently being decoded.
- **Memory address register** — holds the address currently being placed on the address bus.
- **Status or flag register** — holds the condition bits set by the ALU.
- **Stack pointer** — keeps track of where the return address was stored when a subroutine was called.

### Clock

A crystal-controlled oscillator producing a continuous square wave. Every register transfer, every ALU operation and every bus cycle happens on a defined edge of that wave. If the clock stops, the processor does not slow down — **it stops dead**. A dead clock crystal is a classic cause of a completely unresponsive LRU.

## How the Machine Runs a Program

Four steps, repeated forever, millions of times a second, every second the aircraft is powered:

1. The program counter puts an address on the address bus.
2. Memory returns the instruction on the data bus into the instruction register.
3. The control unit decodes it.
4. The ALU or registers carry it out, fetching any data operands needed, and the program counter increments — then the cycle begins again.

## Instruction Word Formats

A **single-address instruction** word carries an operation code and one operand address — the accumulator is assumed as the other operand. A **multi-address instruction** carries the opcode plus two or three addresses, so it can specify both sources and the destination in one word. Multi-address instructions do more per instruction but need longer words.
        $cnt$,
        7
    ) RETURNING id INTO s7_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 05.8: Integrated Circuits
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m05_id, 'M05.8', 'Integrated Circuits',
        $cnt2$
# Integrated Circuits

*A B2 topic, kept brief. But the scale-of-integration section is worth reading, because the vocabulary turns up in component documentation handled by a B1 engineer.*

## Encoders and Decoders

### Encoder

An **encoder** takes a number of input lines, of which exactly one is active at a time, and produces a binary code identifying which one it was. An eight-to-three encoder turns eight separate lines into a three-bit number. The obvious use is a keypad: sixteen keys become four bits.

A **priority encoder** handles the case where two inputs go active together by outputting the code for the higher-priority one rather than producing nonsense. On an aircraft this is how a warning system decides which of several simultaneous conditions to annunciate first.

### Decoder

A **decoder** does the opposite: it takes a binary code and activates exactly one of many output lines. Three bits in, one of eight lines out. Its everyday aircraft use is driving a numeric display — a **BCD-to-seven-segment decoder** takes four bits and lights the right combination of the seven bars to form a digit.

Decoders are also how a processor selects between memory chips and peripherals. The top few address lines feed a decoder whose outputs are the chip-select signals. That is called **address decoding**, and it is why a fault in one decoder can make a whole block of memory disappear.

## Scale of Integration

| Scale | Gates per chip (approx.) | Typical devices |
|-------|---------------------------|------------------|
| **SSI** — small scale | Up to about 12 | Individual gate packages, single flip-flops |
| **MSI** — medium scale | About 12 to 100 | Encoders, decoders, counters, registers, adders, multiplexers |
| **LSI** — large scale | About 100 to 10,000 | Early microprocessors, memory chips, calculator chips |
| **VLSI** — very large scale | 10,000 to millions | Modern processors, DSPs, large memories, FPGAs |
| **ULSI** — ultra large scale | Millions upward | Current generation processors and system-on-chip devices |

The trend has one obvious consequence for the aircraft: functions that once filled a rack now fit in a box, and boxes that once weighed twenty kilograms now weigh two. It has a less obvious consequence too, and it is the one that concerns a maintainer. As geometries shrink, the insulating layers inside the device get thinner, and the voltage needed to punch through them falls. That is why electrostatic sensitivity is getting worse, not better.
        $cnt2$,
        8
    ) RETURNING id INTO s8_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 05.9: Multiplexing
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m05_id, 'M05.9', 'Multiplexing',
        $cnt3$
# Multiplexing

*Formally B2, but the idea has already appeared twice — in the data bus sub-module and in the ARINC 429 word format — so it is worth making solid.*

## The Principle

A **multiplexer** is an electronic rotary switch. It has several data inputs, a set of select lines, and one output. Whatever binary number is on the select lines determines which input is connected to the output. A **demultiplexer** is the same switch running backwards: one input, several outputs, and the select lines choose which output the data goes to.

Put a multiplexer at one end of a wire and a demultiplexer at the other, drive both from the same address counter, and many separate signals can be carried down one physical conductor. Each signal gets the line for a brief slice of time, over and over. This is **time division multiplexing (TDM)**, and it is the whole reason a modern aircraft has a hundred kilograms less wiring than a 1960s one.

## The Synchronisation Problem

Everything depends on the two ends staying in step. If the demultiplexer is one slot behind, channel 2's data arrives on channel 3's indicator — and nothing looks obviously broken, which makes it a nasty fault.

That is why every real bus carries a sync pattern: the three-bit-time illegal Manchester code in **MIL-STD-1553B**, the four-bit-time null gap in **ARINC 429**, the three sync bits in **ARINC 629**.

## Frequency Division Multiplexing

There is a second way to share a medium. Instead of giving each signal its own slice of time, give it its own slice of frequency. Each channel modulates a different carrier, all carriers travel together, and filters at the far end separate them again. This is how radio broadcasting works, and how several signals share one coaxial cable or one fibre.

| | Time division (TDM) | Frequency division (FDM) |
|---|----------------------|----------------------------|
| Shares by | Time slots | Carrier frequencies |
| Signals present | One at a time, in sequence | All at once, side by side |
| Separated by | Timing and address | Filters |
| Suits | Digital data | Analogue signals, radio, optical |
| Aircraft example | ARINC 429, 629, 1553B | Wavelength multiplexing on a fibre; radio channels |
        $cnt3$,
        9
    ) RETURNING id INTO s9_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 05.10: Fibre Optics
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m05_id, 'M05.10', 'Fibre Optics',
        $cnt4$
# Fibre Optics

*Level 1 only, so the depth required is modest — but the advantages and disadvantages list is very heavily examined, and the handling precautions are something a maintainer will genuinely need.*

## Why Fibre at All

Shielded twisted pair copper carries a megabit or two — that covers 1553B and ARINC 629. Coaxial cable takes data rates from about 2 to 50 Mbps. Beyond that, and certainly at the 100 Mbps of AFDX or the 800 Mbps of Firewire, copper starts to struggle with attenuation and with radiating and receiving interference. Glass does not.

## Construction

Working outwards from the centre:

- **Core** — the thin glass or plastic centre. The light travels here, and nowhere else.
- **Cladding** — glass of a lower refractive index surrounding the core. This is what keeps the light in.
- **Coating or buffer jacket** — plastic applied over the cladding on glass fibres for mechanical and moisture protection.
- **Strength member** — Kevlar or fibreglass yarn that takes the tensile load so the glass does not.
- **Outer jacket** — usually black polyurethane, protecting the whole assembly.

## Total Internal Reflection

Light entering the core at a shallow enough angle strikes the core-cladding boundary at an angle greater than the **critical angle**, and is reflected completely back into the core — not partly, completely. It bounces its way down the fibre, following the cable round bends, losing very little energy.

The **acceptance zone** (or acceptance cone) is the range of input angles for which total internal reflection will occur. The **numerical aperture** expresses the size of that cone: a larger numerical aperture accepts light from a wider angle, which makes coupling easier but tends to increase dispersion.

Bend the fibre too tightly and the angle at which light strikes the boundary falls below the critical angle. At that point it is no longer totally reflected — some of it passes into the cladding and is lost. A tight bend therefore does two bad things at once: it increases attenuation, and it puts the glass under a stress that may snap it. The minimum bend radius in the maintenance manual is a hard limit.

## Fibre Types

- **Step index multimode** — a distinct boundary between core and cladding. Many rays (modes) travel simultaneously by different paths. Typical sizes 62.5/125 and 50/125 micrometres (core/cladding diameter).
- **Graded index multimode** — the refractive index falls off gradually from the centre outwards, so rays curve rather than bounce and the longer paths travel faster, evening out arrival times.
- **Single mode** — the core is so small, about 9 micrometres, that only one path fits. Highest bandwidth and longest reach, but hardest to couple into and most expensive to terminate.

## Dispersion and Attenuation — the Two Limits

**Dispersion** (pulse spreading) is what happens when the different rays making up one pulse take different lengths of time to arrive. The pulse leaves as a sharp edge and arrives as a smear; spread far enough, consecutive pulses run into each other and the receiver can no longer tell them apart. Dispersion is worst in step index multimode and least in single mode.

**Attenuation** is the loss of optical power along the fibre. Its two causes are **scattering**, where light is deflected out of the core by imperfections in the glass, and **absorption**, where light energy is taken up by impurities and by the coating. Silica glass fibres have the lowest attenuation, which is why they dominate long-haul telecommunications; plastic fibres are cheaper, tougher and take a tighter bend but lose far more.

## Advantages and Disadvantages

| Advantages | Disadvantages |
|------------|----------------|
| Complete immunity from EMI — glass is not a conductor | Fibre and terminations are more expensive than copper |
| No crosstalk, no line capacitance, no mutual coupling between adjacent fibres | Optical transmitters and receivers are needed at each end |
| Very low attenuation, so much greater distances between repeaters | Splicing and terminating is difficult, slow and needs special tooling and skill |
| Enormous bandwidth — hundreds of Mbps and beyond | Glass is brittle and has a strict minimum bend radius |
| Much lighter than the equivalent copper | Contamination of an end face by dust or finger grease destroys the connection |
| Higher tensile strength for a given diameter | Cannot carry electrical power along with the data |
| No spark hazard, no short circuit even if the jacket melts; tolerant of nuclear radiation | Fault finding requires an optical power meter or OTDR, not a multimeter |

If a question asks for the chief advantage of fibre over copper, the answer is **immunity from electromagnetic interference**. Everything else is secondary.

## The Optical Link

A fibre optic data bus does exactly the same job as an electrical one; only the carrier is different. The transmitter converts the electrical signal into light pulses using either an **LED** or a **laser diode**. An LED is cheaper and adequate for shorter, slower links; a laser diode gives higher output power and much greater speed at greater cost.

The receiver has two parts: a **photodiode detector** that turns the light back into an electrical signal, and an output circuit that amplifies and reshapes it into a clean digital pulse train.

## Couplers and Terminals

A coupler splits or combines optical signals. A **four-port directional coupler** takes signals in at ports 1 and 2 and passes them out of ports 3 and 4, but not back out of the input side. A **tee coupler** taps a portion of the light out of a through path and is used in bus architectures such as **MIL-STD-1773**, the fibre optic version of 1553B. A **star coupler** takes one input and divides it among many outputs from a central point.

Every coupler loses light — the total loss around a network (the optical power budget) has to be calculated during design and verified during maintenance.

## Terminations

You cannot solder or crimp glass. The entire skill of terminating a fibre lies in getting the two core faces perfectly aligned, perfectly perpendicular and perfectly clean.

The usual preparation method is **scribe and break**: a cutting tool nicks the cladding, the blade is drawn across the stationary fibre and tension is applied, producing a clean break with a mirror-like end face, which is then inspected under a microscope.

Joining methods:

- **Fusion splicing** — the two prepared ends are aligned in a V-groove under a microscope, then an electric arc is struck; the localised heat softens the ends and surface tension pulls them together. Lowest loss, permanent.
- **Mechanical splicing** — the ends are held in alignment by an elastomeric insert inside a glass sleeve, often with index-matching gel. Quicker, needs less equipment, but higher loss.
- **Connectors** — demountable. The **SMA** is the traditional standard; **ST, FC and LC** types are common on modern installations.

Sources of loss at a joint: lateral displacement of the two cores, end separation, angular misalignment, surface roughness, and mismatches in core diameter or concentricity.

## On the Aircraft

Fibre appears wherever bandwidth or interference immunity matters: the in-flight entertainment distribution system, video and camera feeds, the Boeing 777's fibre networks, and increasingly the primary avionics networks of the latest types.

**Handling precautions:**

- Never look into the end of a fibre or a transmitter port. The light may be infrared and therefore invisible, and a laser source can damage the retina before its presence is even known.
- Fit the dust caps back on every connector and port, every time — a single particle of dust on a core face is comparable in size to the core itself.
- Clean end faces with approved lint-free wipes and solvent only. Skin oil is a contaminant.
- Do not use a multimeter. Continuity means nothing here — an optical power meter, or an OTDR to locate a break along the run, is required.
        $cnt4$,
        10
    ) RETURNING id INTO s10_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M05.7 Microprocessors (15 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s7_id, 'A microprocessor is best described as:',
     '[{"id":"a","text":"A complete central processing unit fabricated on a single integrated circuit","correct":true},{"id":"b","text":"A microcomputer complete with memory and input/output already built in","correct":false},{"id":"c","text":"A crystal-controlled oscillator used to generate a system clock","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, 'To turn a microprocessor into a microcomputer, what must be added?',
     '[{"id":"a","text":"Memory and input/output","correct":true},{"id":"b","text":"A control unit and an arithmetic and logic unit","correct":false},{"id":"c","text":"A stack pointer and a status register","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, 'Which part of a microprocessor decodes each instruction and issues the control signals that make the rest of the chip act, without itself performing arithmetic?',
     '[{"id":"a","text":"The control unit","correct":true},{"id":"b","text":"The arithmetic and logic unit","correct":false},{"id":"c","text":"The stack pointer","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, 'Besides addition and subtraction, what other operations does the arithmetic and logic unit (ALU) perform?',
     '[{"id":"a","text":"AND, OR, NOT and exclusive-OR bit by bit, and left/right shifts","correct":true},{"id":"b","text":"Decoding of the instruction held in the instruction register","correct":false},{"id":"c","text":"Generation of the continuous square wave used for register transfers","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, 'What is the function of the status (flag) register in a microprocessor?',
     '[{"id":"a","text":"It holds the condition bits — carry, zero, negative, overflow — set by the ALU","correct":true},{"id":"b","text":"It holds the address of the next instruction to be fetched","correct":false},{"id":"c","text":"It holds the instruction currently being decoded","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, 'How does a program branch, in terms of the ALU and control unit?',
     '[{"id":"a","text":"The ALU compares two numbers and sets or clears a flag; the control unit reads that flag to decide which path to take","correct":true},{"id":"b","text":"The control unit performs the comparison and the ALU decides which path to take","correct":false},{"id":"c","text":"The clock alone determines which path is taken, without reference to any flag","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, 'Which register holds one operand going into the ALU and receives the result coming out?',
     '[{"id":"a","text":"The accumulator","correct":true},{"id":"b","text":"The memory address register","correct":false},{"id":"c","text":"The instruction register","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, 'What does the program counter hold, and what does a jump instruction do to it?',
     '[{"id":"a","text":"It holds the address of the next instruction and increments automatically; a jump instruction loads a different value into it","correct":true},{"id":"b","text":"It holds the result of the last ALU operation; a jump instruction clears it to zero","correct":false},{"id":"c","text":"It holds the current instruction being decoded; a jump instruction has no effect on it","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, 'Which register holds the instruction that is currently being decoded?',
     '[{"id":"a","text":"The instruction register","correct":true},{"id":"b","text":"The memory address register","correct":false},{"id":"c","text":"The stack pointer","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, 'Which register holds the address currently being placed on the address bus?',
     '[{"id":"a","text":"The memory address register","correct":true},{"id":"b","text":"The accumulator","correct":false},{"id":"c","text":"The status register","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, 'Which register keeps track of where the return address was stored when a subroutine was called?',
     '[{"id":"a","text":"The stack pointer","correct":true},{"id":"b","text":"The program counter","correct":false},{"id":"c","text":"The instruction register","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, 'The clock in a microprocessor is best described as:',
     '[{"id":"a","text":"A crystal-controlled oscillator producing a continuous square wave, with every register transfer and bus cycle timed to a defined edge of it","correct":true},{"id":"b","text":"A register that stores the result of the last arithmetic operation","correct":false},{"id":"c","text":"A decoder that selects between memory chips and peripherals","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, 'If the clock in a microprocessor stops, what happens to the processor?',
     '[{"id":"a","text":"It stops dead, rather than merely slowing down","correct":true},{"id":"b","text":"It continues to run, but at a reduced speed","correct":false},{"id":"c","text":"It automatically switches to an internal backup clock","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, 'What are the four steps of the fetch-decode-execute cycle, in order?',
     '[{"id":"a","text":"Fetch the instruction, decode it, execute it, increment the program counter","correct":true},{"id":"b","text":"Decode the instruction, fetch it, increment the program counter, execute it","correct":false},{"id":"c","text":"Execute the instruction, fetch the next one, decode it, reset the stack pointer","correct":false}]',
     '{"B1","B2"}'),

    (s7_id, 'What does a single-address instruction word contain, and where is the second operand assumed to be?',
     '[{"id":"a","text":"An operation code and one operand address; the second operand is assumed to be in the accumulator, which also receives the result","correct":true},{"id":"b","text":"An operation code and three operand addresses, specifying both sources and the destination","correct":false},{"id":"c","text":"Only an operand address, with the operation code held permanently in the control unit","correct":false}]',
     '{"B1","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M05.8 Integrated Circuits (10 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s8_id, 'An encoder is a circuit that:',
     '[{"id":"a","text":"Takes a number of input lines, of which exactly one is active at a time, and produces a binary code identifying which one it was","correct":true},{"id":"b","text":"Takes a binary code and activates exactly one of many output lines","correct":false},{"id":"c","text":"Combines several optical signals into a single fibre","correct":false}]',
     '{"B1","B2"}'),

    (s8_id, 'The obvious use of an encoder is a keypad, where sixteen keys become:',
     '[{"id":"a","text":"Four bits","correct":true},{"id":"b","text":"Sixteen bits","correct":false},{"id":"c","text":"Two bits","correct":false}]',
     '{"B1","B2"}'),

    (s8_id, 'If two inputs of a priority encoder go active together, what does it output?',
     '[{"id":"a","text":"The code for the higher-priority input, rather than a nonsense value","correct":true},{"id":"b","text":"The code for the lower-priority input only","correct":false},{"id":"c","text":"No output at all, until only one input remains active","correct":false}]',
     '{"B1","B2"}'),

    (s8_id, 'A decoder is a circuit that:',
     '[{"id":"a","text":"Takes a binary code and activates exactly one of many output lines","correct":true},{"id":"b","text":"Takes a number of input lines and produces a binary code identifying which one is active","correct":false},{"id":"c","text":"Shifts a binary number left or right by a set number of bits","correct":false}]',
     '{"B1","B2"}'),

    (s8_id, 'A BCD-to-seven-segment decoder is used to:',
     '[{"id":"a","text":"Take four bits and light the right combination of the seven bars to form a digit on a numeric display","correct":true},{"id":"b","text":"Take a binary code and select between eight memory chips","correct":false},{"id":"c","text":"Convert eight separate lines into a three-bit number","correct":false}]',
     '{"B1","B2"}'),

    (s8_id, 'Address decoding, used by a processor to select between memory chips and peripherals, works by:',
     '[{"id":"a","text":"Feeding the top few address lines to a decoder whose outputs are the chip-select signals","correct":true},{"id":"b","text":"Feeding every address line directly into every memory chip simultaneously","correct":false},{"id":"c","text":"Using a priority encoder to choose the fastest-responding memory chip","correct":false}]',
     '{"B1","B2"}'),

    (s8_id, 'Which scale of integration corresponds to roughly 12 to 100 gates per chip, and is typical of encoders, decoders, counters, registers and multiplexers?',
     '[{"id":"a","text":"MSI — medium scale integration","correct":true},{"id":"b","text":"SSI — small scale integration","correct":false},{"id":"c","text":"ULSI — ultra large scale integration","correct":false}]',
     '{"B1","B2"}'),

    (s8_id, 'Which scale of integration, with roughly 10,000 to millions of gates per chip, is typical of modern processors, DSPs, large memories and FPGAs?',
     '[{"id":"a","text":"VLSI — very large scale integration","correct":true},{"id":"b","text":"SSI — small scale integration","correct":false},{"id":"c","text":"LSI — large scale integration","correct":false}]',
     '{"B1","B2"}'),

    (s8_id, 'As IC geometries have shrunk with increasing scale of integration, what has happened to electrostatic sensitivity?',
     '[{"id":"a","text":"It has gotten worse, because the insulating layers are thinner and a lower voltage can punch through them","correct":true},{"id":"b","text":"It has gotten better, because modern devices are inherently more robust","correct":false},{"id":"c","text":"It has remained completely unchanged since the introduction of SSI devices","correct":false}]',
     '{"B1","B2"}'),

    (s8_id, 'On an integrated circuit package, if pin 1 is to the left of the identifying notch, in which direction are the remaining pins numbered?',
     '[{"id":"a","text":"Anticlockwise","correct":true},{"id":"b","text":"Clockwise","correct":false},{"id":"c","text":"Left to right across the package, ignoring the notch","correct":false}]',
     '{"B1","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M05.9 Multiplexing (10 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s9_id, 'A multiplexer can be described as:',
     '[{"id":"a","text":"An electronic rotary switch with several data inputs, a set of select lines and one output, where the select-line value determines which input reaches the output","correct":true},{"id":"b","text":"A device with one input and several outputs, where the select lines choose which output the data goes to","correct":false},{"id":"c","text":"A circuit that converts a binary code into a decimal display value","correct":false}]',
     '{"B1","B2"}'),

    (s9_id, 'A demultiplexer can be described as:',
     '[{"id":"a","text":"The same switch as a multiplexer running backwards — one input, several outputs, with the select lines choosing which output the data goes to","correct":true},{"id":"b","text":"A device with several data inputs and one output, selected by an address counter","correct":false},{"id":"c","text":"A device that combines several carrier frequencies onto a single conductor","correct":false}]',
     '{"B1","B2"}'),

    (s9_id, 'How many select lines does an eight-input multiplexer require?',
     '[{"id":"a","text":"Three","correct":true},{"id":"b","text":"Eight","correct":false},{"id":"c","text":"Two","correct":false}]',
     '{"B1","B2"}'),

    (s9_id, 'Time division multiplexing (TDM) works by:',
     '[{"id":"a","text":"Driving a multiplexer and a demultiplexer from the same address counter, so each signal gets the shared conductor for a brief slice of time in turn","correct":true},{"id":"b","text":"Giving each signal a permanently dedicated conductor of its own","correct":false},{"id":"c","text":"Giving each signal its own carrier frequency, with all signals present at once","correct":false}]',
     '{"B1","B2"}'),

    (s9_id, 'Time division multiplexing is described as the whole reason a modern aircraft has:',
     '[{"id":"a","text":"A hundred kilograms less wiring than a 1960s aircraft","correct":true},{"id":"b","text":"A hundred kilograms more wiring than a 1960s aircraft","correct":false},{"id":"c","text":"No electrical wiring at all in its data systems","correct":false}]',
     '{"B1","B2"}'),

    (s9_id, 'If a demultiplexer falls one slot behind its multiplexer, what is the effect described in the study notes?',
     '[{"id":"a","text":"Channel 2''s data arrives on channel 3''s indicator, and nothing looks obviously broken, making it a nasty fault","correct":true},{"id":"b","text":"The whole bus stops transmitting and an obvious fault warning is triggered","correct":false},{"id":"c","text":"Every channel''s data is duplicated onto every indicator simultaneously","correct":false}]',
     '{"B1","B2"}'),

    (s9_id, 'Which sync pattern does MIL-STD-1553B use to keep its multiplexer and demultiplexer in step?',
     '[{"id":"a","text":"A three-bit-time illegal Manchester code","correct":true},{"id":"b","text":"A four-bit-time null gap","correct":false},{"id":"c","text":"Three sync bits at the start of every word","correct":false}]',
     '{"B1","B2"}'),

    (s9_id, 'Which sync pattern does ARINC 429 use?',
     '[{"id":"a","text":"A four-bit-time null gap","correct":true},{"id":"b","text":"A three-bit-time illegal Manchester code","correct":false},{"id":"c","text":"An eight-bit-time preamble","correct":false}]',
     '{"B1","B2"}'),

    (s9_id, 'Frequency division multiplexing (FDM) works by:',
     '[{"id":"a","text":"Giving each channel its own carrier frequency, so all carriers travel together and filters at the far end separate them again","correct":true},{"id":"b","text":"Giving each channel the whole medium in turn for a brief slice of time","correct":false},{"id":"c","text":"Alternating each channel''s data with a synchronising address counter","correct":false}]',
     '{"B1","B2"}'),

    (s9_id, 'Compared with time division multiplexing, in frequency division multiplexing the signals are:',
     '[{"id":"a","text":"All present at once, side by side, and separated by filters","correct":true},{"id":"b","text":"Present one at a time, in sequence, and separated by timing and address","correct":false},{"id":"c","text":"Never present simultaneously under any circumstances","correct":false}]',
     '{"B1","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M05.10 Fibre Optics (16 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s10_id, 'In a fibre optic cable, what keeps the light confined within the core?',
     '[{"id":"a","text":"The cladding, which is glass of a lower refractive index surrounding the core","correct":true},{"id":"b","text":"The outer jacket, usually made of black polyurethane","correct":false},{"id":"c","text":"The strength member, made of Kevlar or fibreglass yarn","correct":false}]',
     '{"B1","B2"}'),

    (s10_id, 'Working outwards from the centre, what is the correct order of the parts of a fibre optic cable?',
     '[{"id":"a","text":"Core, cladding, coating/buffer jacket, strength member, outer jacket","correct":true},{"id":"b","text":"Cladding, core, strength member, coating/buffer jacket, outer jacket","correct":false},{"id":"c","text":"Outer jacket, strength member, coating/buffer jacket, cladding, core","correct":false}]',
     '{"B1","B2"}'),

    (s10_id, 'Total internal reflection occurs in a fibre optic cable when:',
     '[{"id":"a","text":"Light strikes the core-cladding boundary at an angle greater than the critical angle, and is reflected completely back into the core","correct":true},{"id":"b","text":"Light strikes the core-cladding boundary at an angle less than the critical angle, and passes through into the cladding","correct":false},{"id":"c","text":"Light is absorbed by impurities in the coating and re-emitted back into the core","correct":false}]',
     '{"B1","B2"}'),

    (s10_id, 'What happens if a fibre optic cable is bent more tightly than its minimum bend radius?',
     '[{"id":"a","text":"The angle at the boundary falls below the critical angle, so light escapes into the cladding, increasing attenuation and risking fracture of the glass","correct":true},{"id":"b","text":"Nothing, provided the connectors at each end remain clean","correct":false},{"id":"c","text":"The numerical aperture increases, improving the light-carrying capacity of the fibre","correct":false}]',
     '{"B1","B2"}'),

    (s10_id, 'Which fibre type has a core of only about 9 micrometres, allowing only one light path, and gives the highest bandwidth and longest reach?',
     '[{"id":"a","text":"Single mode","correct":true},{"id":"b","text":"Step index multimode","correct":false},{"id":"c","text":"Graded index multimode","correct":false}]',
     '{"B1","B2"}'),

    (s10_id, 'Dispersion (pulse spreading) in a fibre optic cable is:',
     '[{"id":"a","text":"The spreading of a light pulse in time because different rays take different path lengths, which limits the maximum data rate","correct":true},{"id":"b","text":"The loss of optical power along the fibre due to scattering and absorption","correct":false},{"id":"c","text":"The bending of light rays as they cross the core-cladding boundary","correct":false}]',
     '{"B1","B2"}'),

    (s10_id, 'What are the two causes of attenuation (loss of optical power) in a fibre?',
     '[{"id":"a","text":"Scattering, where light is deflected by imperfections in the glass, and absorption, where light energy is taken up by impurities and the coating","correct":true},{"id":"b","text":"Dispersion and total internal reflection","correct":false},{"id":"c","text":"Excess numerical aperture and excess core diameter","correct":false}]',
     '{"B1","B2"}'),

    (s10_id, 'If asked for the chief advantage of fibre optics over copper wiring, the correct answer is:',
     '[{"id":"a","text":"Immunity from electromagnetic interference","correct":true},{"id":"b","text":"Lower cost of terminations and splicing","correct":false},{"id":"c","text":"The ability to carry electrical power along with the data","correct":false}]',
     '{"B1","B2"}'),

    (s10_id, 'A disadvantage of fibre optic connections, related to cleanliness, is that:',
     '[{"id":"a","text":"Contamination of an end face by dust or finger grease destroys the connection","correct":true},{"id":"b","text":"They pick up and radiate electromagnetic interference more readily than copper","correct":false},{"id":"c","text":"They require a continuous ground path at both ends to function","correct":false}]',
     '{"B1","B2"}'),

    (s10_id, 'At the transmitter end of a fibre optic link, what converts the electrical signal into light pulses?',
     '[{"id":"a","text":"An LED or a laser diode","correct":true},{"id":"b","text":"A photodiode detector","correct":false},{"id":"c","text":"A four-port directional coupler","correct":false}]',
     '{"B1","B2"}'),

    (s10_id, 'At the receiver end of a fibre optic link, what does the photodiode detector do?',
     '[{"id":"a","text":"Turns the light back into an electrical signal","correct":true},{"id":"b","text":"Converts the electrical signal into light pulses","correct":false},{"id":"c","text":"Taps a portion of the light out of a through path","correct":false}]',
     '{"B1","B2"}'),

    (s10_id, 'A tee coupler in a fibre optic system:',
     '[{"id":"a","text":"Taps a portion of the light out of a through path, and is used in bus architectures such as MIL-STD-1773","correct":true},{"id":"b","text":"Takes one input and divides it among many outputs from a central point","correct":false},{"id":"c","text":"Passes signals in at two ports out of two other ports, but never back out of the input side","correct":false}]',
     '{"B1","B2"}'),

    (s10_id, 'Which of the following correctly describes fusion splicing of fibre optic cable?',
     '[{"id":"a","text":"The prepared ends are aligned under a microscope and an electric arc softens and joins them — lowest loss, permanent","correct":true},{"id":"b","text":"The ends are held together by an elastomeric insert inside a glass sleeve — quicker, but higher loss","correct":false},{"id":"c","text":"The ends are joined using a demountable SMA, ST, FC or LC connector","correct":false}]',
     '{"B1","B2"}'),

    (s10_id, 'Why must a multimeter never be used to fault-find a fibre optic cable?',
     '[{"id":"a","text":"Continuity means nothing in a fibre — an optical power meter, or an OTDR to locate a break, is required instead","correct":true},{"id":"b","text":"A multimeter will permanently damage the glass core if connected to it","correct":false},{"id":"c","text":"A multimeter can only measure frequency division multiplexed signals, not time division ones","correct":false}]',
     '{"B1","B2"}'),

    (s10_id, 'Why should you never look into the end of a fibre optic cable or a transmitter port?',
     '[{"id":"a","text":"The light may be infrared and therefore invisible, and a laser source can damage the retina before its presence is known","correct":true},{"id":"b","text":"The end face is always covered in solvent residue that is harmful if it contacts the eye","correct":false},{"id":"c","text":"The connector shell carries a high voltage capable of causing electric shock","correct":false}]',
     '{"B1","B2"}'),

    (s10_id, 'Which demountable connector type is described as the traditional standard, with ST, FC and LC types common on modern installations?',
     '[{"id":"a","text":"SMA","correct":true},{"id":"b","text":"RJ45","correct":false},{"id":"c","text":"BNC","correct":false}]',
     '{"B1","B2"}');

END $$;
