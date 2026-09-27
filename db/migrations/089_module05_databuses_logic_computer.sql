-- Module 05: Digital Techniques / Electronic Instrument Systems (B1/B2 Common)
-- Sub-Module 04 (Data Buses), Sub-Module 05 (Logic Circuits), Sub-Module 06 (Basic Computer Structure)
-- Source: EASA Part-66 Module 5 official study notes, plus a topically-matched question bank

DO $$
DECLARE
    m05_id INT;
    s4_id  INT;
    s5_id  INT;
    s6_id  INT;
BEGIN
    SELECT id INTO m05_id FROM easa_modules WHERE code = 'M05';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M05.4') THEN
        RAISE NOTICE 'M05.4-M05.6 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 05.4: Data Buses
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m05_id, 'M05.4', 'Data Buses',
        $cnt$
# Data Buses

## The Problem the Bus Was Invented to Solve

Picture a 1960s airliner. Every instrument had its own dedicated wire running back to its own dedicated sensor — a synchro needed three wires and a reference, a potentiometer needed a supply, a wiper and a return. Multiply that by every parameter on the aircraft and the result is looms weighing hundreds of kilograms, thousands of connector pins, and an intermittent-pin fault problem that never ends.

The fix was to stop sending each parameter on its own wire. Convert everything to digital, put it all on one shared pair of wires, and label each item so the receiver knows what it is looking at. One twisted pair can then carry a hundred parameters — weight goes down, connections go down, and reliability goes up.

## Time Division Multiplexing

The technique that makes a shared bus possible is **time division multiplexing (TDM)**. Instead of giving each signal its own wire, you give each signal its own moment. A multiplexer samples the inputs in turn and staggers them in time to form one composite pulse train. At the far end, a demultiplexer that knows the clock and the addressing splits the train back into the individual signals — one wire, many signals, separated by time.

## MIL-STD-1553B

The first widely used digital data bus flew on the F-15 and F-16 in 1975 and became a military standard in 1978. It defines the vocabulary — **bus controller**, **remote terminal**, **command and response** — that every later bus has borrowed.

| Parameter | MIL-STD-1553B |
|---|---|
| Data rate | 1 Mbps |
| Word length | 20 bits |
| Terminals | 1 bus controller plus up to 31 remote terminals |
| Direction | Half duplex — both ways, but only one way at a time |
| Medium | Shielded twisted pair, shields earthed at both ends |
| Coupling | Transformer coupled. Direct stub max 1 ft, transformer coupled stub max 20 ft |
| Error rate | No more than one word fault in ten million words |
| Encoding | Manchester bi-phase |

### Command and Response

The **bus controller initiates every single transfer**. A remote terminal cannot decide to send something; it is not allowed to speak until it is spoken to.

1. The bus controller transmits a command word naming a remote terminal, saying whether it is to receive or transmit, and how many data words are involved.
2. Every terminal hears it, but only the addressed one acts.
3. If it is a receive command, the data words follow immediately and the terminal replies with a status word.
4. If it is a transmit command, the terminal replies with a status word followed by the data words.
5. For a **terminal-to-terminal transfer the controller must issue two commands** — a receive command to one and a transmit command to the other — because neither terminal can start a transfer by itself.

The bus monitor listens to everything and checks it completed without error. In most installations the monitor and the controller live in the same box, often called the mission computer.

All three word types (command, data, status) are twenty bits and all begin with the same three-bit-time sync. **Manchester encoding requires a transition in the middle of every bit — the sync field breaks that rule on purpose**, holding high for a bit and a half then low for a bit and a half, so nothing in the data can accidentally imitate it and a terminal can always find the start of a word even mid-stream.

### Topology and Redundancy

A single-level bus is one controller and its terminals. Interconnect several single-level buses and you get a multi-level topology, used to segregate flight-critical functions from mission or non-critical ones. Each level then carries two or more redundant buses so a secondary can take over if the primary fails.

**Every device is coupled to the bus through an isolation transformer.** This is not about signal matching — it is so that a device which short-circuits internally cannot take the whole bus down with it.

## ARINC 429

Aeronautical Radio Incorporated was set up in 1929 by the airlines and the manufacturers to write standards for equipment form, fit and function. ARINC 429 flies on the Boeing 727, 737, 747, 757 and 767 and on the Airbus A300, A310 and A320 family, and it is still being installed today because it is simple, cheap and extremely well understood.

| Parameter | ARINC 429 |
|---|---|
| Data rate | 100 kbps (high speed) or 12 to 14.5 kbps (low speed) |
| Word length | 32 bits |
| Topology | One transmitter to a maximum of twenty receivers |
| Direction | Simplex — one direction only |
| Medium | Shielded twisted pair, screen earthed at both ends and at breaks |
| Encoding | Bipolar return to zero |
| Voltage | Nominally +10 V, 0 V and -10 V across the pair |

**Simplex is the key limitation.** If box A talks to box B and box B needs to answer, box B must have its own separate transmitter and its own separate pair of wires running back — there is no way to reverse the flow on the same bus. That is why creating a bi-directional link on ARINC 429 needs **two separate data buses**.

### The Signalling

A logic 1 is a swing from null up to about +10 V and back to null. A logic 0 is a swing from null down to about -10 V and back to null. Because the line returns to zero after each bit (**bipolar return to zero**), the receiver can recover the clock from the data itself — no separate clock wire is needed. The end of a word is marked by at least four bit-times of null.

### The 32-Bit Word

- **Bits 1 to 8 — Label.** Always written in **octal**. The label says what the data is, not who sent it — label 203 is barometric altitude no matter which box transmits it. The label is transmitted first and is sent least significant bit first.
- **Bits 9 and 10 — SDI**, source/destination identifier. Distinguishes up to four identical systems: 00 means all systems, 01 system 1, 10 system 2, 11 system 3.
- **Bits 11 to 29 — Data.** Carried in binary (BNR), binary coded decimal (BCD), or as discrete bits.
- **Bits 30 and 31 — SSM**, sign/status matrix. Tells the receiver whether the data is valid, whether the equipment has failed, whether it is in test, and the sign or direction of the parameter. If the SSM says the data is no good, the receiver must not use it.
- **Bit 32 — Parity.** Odd parity — the transmitter sets this bit so the total number of ones in the word is odd.

Odd parity detects any single bit error (or any odd number of errors) because a flipped bit makes the count even. It cannot detect two bits flipping together, and it cannot correct anything — it only tells the receiver to throw the word away and wait for the next one, which on a bus repeating at up to fifty times a second is a perfectly good strategy.

A complete message consists of a start-of-transmission, up to 253 data words, and an end-of-transmission.

## ARINC 629

Developed for the Boeing 777, ARINC 629 fixes the two things that limit 429. It runs at **2 Mbps** — twenty times faster — and it supports **up to 131 terminals**, all of which can both transmit and receive: multiple-source, multiple-sink, like 1553B.

Its defining feature is that **it has no bus controller**. Instead it uses a **time-based collision avoidance protocol**: every terminal is allocated a protected slot and decides for itself when its slot has come round. No single box can hog the bus, and no single box failing can stop the others talking. Terminals connect through a serial interface module which provides the isolation. Words are 20 bits: three sync, sixteen data and one parity.

## Aircraft Networks — Ethernet and ARINC 664 AFDX

Ethernet has been standard for commercial computer networking since 1980 (IEEE 802.3, 1983). It has migrated to aircraft in a modified form called **AFDX**, Avionics Full-Duplex Switched Ethernet, defined by **ARINC 664** — found on the A380, A350 and 787.

Plain Ethernet is not acceptable on an aeroplane because it is non-deterministic — a collision's recovery time cannot be guaranteed, and on an aircraft you must be able to state the worst-case delivery time for a message. AFDX solves this by switching rather than sharing:

- **End systems** are the LRUs. Each one shapes its own traffic so it cannot flood the network.
- **Switches** police the traffic and route it, using fixed commutation tables designed in, not discovered at run time.
- **Virtual links** are unidirectional logical connections from one source to one or more destinations, each with a guaranteed bandwidth allocation — this is what restores determinism.
- Communication is **full duplex**, so both ends can transmit simultaneously and collisions cannot occur.
- Frames run from 64 to 1518 bytes and carry both source and destination addresses.
- The whole network is normally duplicated, with identical frames sent on both sides and the receiver taking the first good one.

## IEEE 1394 — Firewire

Originally a consumer serial interface, its high data rate — **up to 800 Mbps** — makes it attractive for streaming video, so it turns up in in-flight entertainment systems. It is also used in the Lockheed Martin F-35 vehicle management system for flight control, engine control and utilities, because it offers large bandwidth with a fault-tolerant topology in which no single failure can bring down the bus.

## Putting the Buses Side by Side

| | MIL-STD-1553B | ARINC 429 | ARINC 629 | ARINC 664 AFDX |
|---|---|---|---|---|
| Rate | 1 Mbps | 100 kbps / 12.5 kbps | 2 Mbps | 100 Mbps |
| Word/frame | 20 bits | 32 bits | 20 bits | 64–1518 bytes |
| Terminals | 1 BC + 31 RT | 1 Tx + 20 Rx | Up to 131 | Switched, many |
| Controller? | Yes — BC | None needed | None | Switches |
| Direction | Half duplex | Simplex | Half duplex | Full duplex |
| Typical fit | Military, some helos | 737, 757, 767, A320 | Boeing 777 | A380, A350, 787 |

## In the Hangar

- A 429 bus is a screened twisted pair and the **screen must be earthed at both ends and at every break**. A single missed screen earth is a classic cause of intermittent data faults and spurious flags.
- Do not swap the two conductors of a 429 pair. The polarity defines the difference between a 1 and a 0 — reversed wiring gives inverted data, which usually shows up as a **permanently invalid parameter rather than nothing at all**.
- When a system reports "no data from" another system on ARINC 429, the fault is on the transmitting side, or in the single pair between them, and nowhere else.
        $cnt$,
        4
    ) RETURNING id INTO s4_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 05.5: Logic Circuits
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m05_id, 'M05.5', 'Logic Circuits',
        $cnt2$
# Logic Circuits

## What a Gate Is

A gate is a small circuit, built from transistors and resistors, that accepts one or more input voltages and produces an output voltage according to a fixed rule. In digital work the transistors are never operated in their linear region — they are driven either hard off or into full saturation, so the exact gain of the transistor, its temperature drift and its ageing simply do not matter. All that matters is which side of the threshold the voltage falls.

In this world there are two conditions: voltage present, called **logic 1**, and voltage absent, called **logic 0**.

### Positive and Negative Logic

Everything here assumes **positive logic**: the more positive voltage is logic 1. In **negative logic** the more negative voltage is logic 1 — the same physical circuit then behaves as a different gate (a positive-logic AND becomes a negative-logic OR). Aircraft wiring diagrams sometimes use negative logic for switch inputs that ground a line when operated, so check the convention before interpreting the diagram.

## The Gates You Must Recognise

- **NOT (inverter).** One input, one output, and the output is always the opposite. The bubble on the output marks inversion — the same bubble appears on NAND and NOR.
- **BUFFER.** Output equals input. It restores a weak or slow signal to a clean full-strength one, and isolates one part of a circuit from another. Two inverters in series make a buffer.
- **AND.** Output is 1 only when every input is 1 — "all of these."
- **OR.** Output is 1 when any input is 1, including when both are — "any of these."
- **NAND.** AND followed by an inverter. Output is 0 only when all inputs are 1.
- **NOR.** OR followed by an inverter. Output is 1 only when all inputs are 0.
- **Exclusive OR (XOR).** Output is 1 when the inputs are different — a one-bit difference detector.
- **Exclusive NOR (XNOR).** Output is 1 when the inputs are the same — a one-bit comparator.

### The Switch Mnemonic

If you blank on a truth table, rebuild it from switches. **AND is two switches in series** — both must be closed. **OR is two switches in parallel** — either will do. Then add a bubble for the N versions and invert the answer column.

### NAND and NOR Are Universal

Any logic function whatsoever can be built entirely from NAND gates, or entirely from NOR gates. This is why integrated circuit families are dominated by NAND packages — a manufacturer can make one part and let the designer build anything from it.

## From Gates to Arithmetic

Take an exclusive OR and an AND, feed them the same two inputs: the XOR gives you the sum of two bits and the AND gives you the carry. That is binary addition, done in hardware, with two gates — a **half adder**.

The half adder cannot accept a carry coming in from the stage to its right, which is why it is only "half" an adder. Join two half adders with an OR gate and you have a **full adder**, which takes A, B and a carry-in and produces a sum and a carry-out. Chain four of them and you can add four-bit numbers; chain thirty-two and you have the arithmetic unit of a processor.

## Logic on the Aeroplane

Open any aircraft wiring manual and you will find logic drawn in exactly the symbols above, usually with 28 V DC as the logic 1.

### AND Logic — Autopilot Engage

An autopilot must not engage unless a whole list of conditions is satisfied at once: the attitude reference is valid, the heading reference is valid, every servo reports serviceable, the pitch wheel and turn knob are centred. Every one of those is a 28 V discrete into an **AND gate**. Lose any single one and the engage circuit stays dead. If an autopilot will not engage, go to the AND gate on the schematic and find which of its inputs is missing.

### OR Logic — Door Unsafe

The DOOR UNSAFE caption must illuminate if the cabin door is insecure **or** the baggage door is insecure. Two inputs, an **OR gate**, one lamp — in the physical wiring the two switches sit in parallel.

### Other Patterns

- **Flag logic.** A gyro flag is typically driven by a NOR or an inverted AND — the flag pulls into view when the valid signals go away, so a loss of power shows the flag rather than hiding it. **Fail-safe design always drives the warning with the absence of the good signal.**
- **Latching.** A radio altimeter decision-height annunciator uses a latch so that a brief trip stays displayed.
- **Comparators.** Two exclusive-OR gates feeding an OR will tell you instantly if two systems disagree.

## Memory: From Combinational to Sequential

Everything so far is **combinational** — the output depends only on what the inputs are doing right now. Feed the output of a gate back to its own input and the circuit remembers — that is **sequential logic**, and the basic element is the flip-flop.

- **Astable.** No stable state — it flips continuously. This is an oscillator, and it is where a computer's clock comes from.
- **Monostable.** One stable state. Trigger it and it produces a single output pulse of fixed length, then returns. Used for timing and for cleaning up a noisy switch input.
- **Bistable.** Two stable states. It stays where you put it until something changes it — one bit of memory, and a row of them makes a register.

The **SR latch** is the simplest bistable, built from two cross-coupled NOR gates. Set makes the output go to 1 and stay there; reset makes it go to 0 and stay there. **Applying both set and reset at once is forbidden** — the circuit cannot obey two contradictory instructions and the resulting state is unpredictable. Add a clock input and you get the D-type and JK flip-flops that make up counters, shift registers and the working registers inside a processor.
        $cnt2$,
        5
    ) RETURNING id INTO s5_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 05.6: Basic Computer Structure
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m05_id, 'M05.6', 'Basic Computer Structure',
        $cnt3$
# Basic Computer Structure

## The Vocabulary, Precisely

Get the terminology exact — a great many marks in this sub-module are lost to loose language rather than to lack of understanding.

| Term | Meaning |
|---|---|
| Bit | A single binary digit — one 0 or one 1. The smallest unit of information there is. |
| Nibble | Four bits. One hexadecimal character, or one BCD digit. |
| Byte | Eight bits. The standard unit of storage. |
| Word | The number of bits the processor handles as a single unit. Machine dependent: 8, 16, 32 or 64 bits. Do not confuse this with an ARINC 429 word, which is always 32 bits regardless of the processor. |
| Hardware | The physical items you can hold — boards, chips, connectors, the LRU itself. |
| Software | The instructions and data. No mass, no part number you can touch, but it is still a controlled aircraft part. |
| Firmware | Software permanently held in ROM. Sits between the two — physically hardware, functionally software. |
| CPU | Central processing unit. The part that fetches, decodes and executes instructions. |
| IC | Integrated circuit. Many components fabricated together on one chip of silicon. |

## Architecture — The Block Diagram

Every avionics box on the aeroplane is a version of the universal computer block diagram: a CPU, memory, and input/output, joined by three buses.

### Central Processing Unit

Inside the CPU there are four things to name:

- **Control unit.** Fetches each instruction from memory, works out what it means, and generates the timing and control signals that make the rest of the machine do it — the conductor of the orchestra.
- **Arithmetic and logic unit (ALU).** Does the actual work — adds, subtracts, compares, and performs the AND, OR and NOT operations. Built from full adders and gates.
- **Registers.** Very small, very fast storage inside the processor itself, used to hold the numbers currently being worked on. Named ones to know: the **accumulator**, which holds the result of ALU operations; the **program counter**, which holds the address of the next instruction; and the **instruction register**, which holds the instruction being decoded.
- **Clock.** An astable multivibrator that produces a continuous train of pulses. Everything in the machine steps in time with it — a faster clock means more instructions per second (and more radiated interference).

### The Three Buses

Students remember that there are three buses and forget which does what — fix it now with direction as well as name.

| Bus | Direction | Carries |
|---|---|---|
| Address | One way, CPU outwards | Which memory location or device is being spoken to |
| Data | Two way | The actual bits being read or written |
| Control | Mixed | Read, write, clock, reset, interrupt and other timing signals |

The width of the **address bus** sets how much memory the processor can reach: n lines can address 2 to the power n locations — sixteen lines reach 65,536 locations, twenty-four lines reach over sixteen million. The width of the **data bus** sets how many bits move in one go.

## Memory

### RAM — Random Access Memory

Read and write freely, but **volatile**: remove the power and the contents are gone. This is the computer's working space. Two kinds:

- **Static RAM (SRAM)** stores each bit in a flip-flop. Fast, needs no maintenance, but takes more transistors per bit, so it is expensive and less dense.
- **Dynamic RAM (DRAM)** stores each bit as a charge on a tiny capacitor. Very dense and cheap, but the charge leaks away, so every cell must be read and rewritten thousands of times a second — a process called **refresh**, the defining characteristic of DRAM.

"Random access" does not mean the contents are random — it means any location can be reached directly, in the same time as any other, without reading through everything before it. The opposite is serial access, like a tape.

### ROM — Read Only Memory

**Non-volatile**: the contents survive loss of power. This is where the operating program lives. The family runs:

- **ROM** — the pattern is built in during manufacture and can never be changed.
- **PROM** — programmable once by the user, by blowing internal fusible links. One shot; a mistake means a new chip.
- **EPROM** — erasable by exposing the die to ultraviolet light through a quartz window, then reprogrammable. A chip with a small window and a foil label over it is an EPROM; the label stops stray UV erasing it.
- **EEPROM and Flash** — erasable electrically, in circuit, without removing the device. This is what makes modern data loading possible: a loadable software aircraft part is written into Flash through a data-loader port, with no need to open the box.

## Computers on the Aircraft

An avionics LRU is this block diagram in a box with an aircraft connector on the front. Its ROM holds the operational flight program, its RAM holds the parameters it is working on this second, and its input/output section is a set of ARINC 429 receivers and transmitters, discrete inputs and analogue channels through ADCs.

Two design philosophies exist:

- **Federated** — one function, one box. Each LRU has its own processor, its own power supply and its own case. Heavy and duplicated, but a failure is naturally contained.
- **Integrated Modular Avionics (IMA)** — many functions share a cabinet, a power supply, a cooling system and a common backplane, running as software partitions on shared processing modules. Far lighter, but it demands rigorous partitioning so that a low-criticality function cannot disturb a high-criticality one.

## In the Hangar

Software is a controlled part. Loading it is a maintenance task with a part number, an approval and a record — not a computer operation. Never assume a replacement LRU carries the right software standard: check the loaded part number after fitting, every time.
        $cnt3$,
        6
    ) RETURNING id INTO s6_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M05.4 Data Buses (21 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s4_id, 'The technique that allows one shared pair of wires to carry many parameters, by giving each signal its own moment in time rather than its own wire, is called:',
     '[{"id":"a","text":"Time division multiplexing","correct":true},{"id":"b","text":"Frequency division multiplexing","correct":false},{"id":"c","text":"Bipolar return to zero encoding","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'For MIL-STD-1553B, the data rate and word length are:',
     '[{"id":"a","text":"1 Mbps, 20-bit words","correct":true},{"id":"b","text":"100 kbps, 32-bit words","correct":false},{"id":"c","text":"2 Mbps, 16-bit words","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'A MIL-STD-1553B bus consists of:',
     '[{"id":"a","text":"One transmitter and up to twenty receivers","correct":false},{"id":"b","text":"One bus controller and up to 31 remote terminals","correct":true},{"id":"c","text":"Up to 131 terminals with no controller","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'On MIL-STD-1553B, which unit is permitted to initiate a data transfer on the bus?',
     '[{"id":"a","text":"Any remote terminal, whenever it has data ready","correct":false},{"id":"b","text":"Only the bus controller — a remote terminal may not speak until it is spoken to","correct":true},{"id":"c","text":"The bus monitor, which arbitrates between terminals","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'For a terminal-to-terminal transfer on MIL-STD-1553B, the bus controller must:',
     '[{"id":"a","text":"Issue a single combined command to both terminals simultaneously","correct":false},{"id":"b","text":"Issue two commands — a receive command to one terminal and a transmit command to the other","correct":true},{"id":"c","text":"Do nothing, since the two terminals negotiate the transfer directly","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'The three-bit-time sync field that begins every MIL-STD-1553B word deliberately breaks the Manchester encoding rule. Why is this useful?',
     '[{"id":"a","text":"It reduces the overall word length from 24 bits to 20 bits","correct":false},{"id":"b","text":"Nothing in the data can accidentally imitate it, so a terminal can always find the start of a word","correct":true},{"id":"c","text":"It allows the bus to run without an isolation transformer","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'Every device on a MIL-STD-1553B bus is coupled to it through an isolation transformer. The purpose of this is:',
     '[{"id":"a","text":"To step up the signal voltage for longer cable runs","correct":false},{"id":"b","text":"So that a device which short-circuits internally cannot take the whole bus down with it","correct":true},{"id":"c","text":"To convert the Manchester code into bipolar return-to-zero code","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'In an ARINC 429 word, why is simplex (one-direction-only) transmission considered the key limitation of the system?',
     '[{"id":"a","text":"Because if a receiving box needs to reply, it needs its own separate transmitter and pair of wires","correct":true},{"id":"b","text":"Because simplex buses cannot use bipolar return to zero encoding","correct":false},{"id":"c","text":"Because simplex transmission limits the bus to only one receiver","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'Why does ARINC 429 use bipolar return-to-zero signalling rather than a simple high/low logic level?',
     '[{"id":"a","text":"It halves the number of wires needed compared to a simple level","correct":false},{"id":"b","text":"Because the line returns to null after every bit, the receiver can recover timing from the data itself, with no separate clock wire needed","correct":true},{"id":"c","text":"It allows negative logic to be used instead of positive logic","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'In an ARINC 429 word, bits 1 to 8 (the label) are:',
     '[{"id":"a","text":"Always written in octal, and identify what the data is rather than who sent it","correct":true},{"id":"b","text":"Always written in hexadecimal, and identify which LRU transmitted the word","correct":false},{"id":"c","text":"Reserved for the sign/status matrix","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'The SSM field of an ARINC 429 word (bits 30 and 31) tells the receiver:',
     '[{"id":"a","text":"Which of up to four identical source systems sent the word","correct":false},{"id":"b","text":"Whether the data is valid, whether the equipment has failed or is in test, and the sign of the parameter","correct":true},{"id":"c","text":"The octal label identifying the parameter","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'ARINC 429 uses odd parity on bit 32. If a single bit in a word is corrupted in transmission, the receiver can:',
     '[{"id":"a","text":"Detect the error and correct the flipped bit automatically","correct":false},{"id":"b","text":"Detect that an error has occurred and discard the word, but not correct it","correct":true},{"id":"c","text":"Neither detect nor discard the corrupted word","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'ARINC 629, developed for the Boeing 777, differs from ARINC 429 mainly because it:',
     '[{"id":"a","text":"Runs at a lower data rate but supports more receivers","correct":false},{"id":"b","text":"Has no bus controller, and instead uses a time-based collision avoidance protocol with a protected slot for each terminal","correct":true},{"id":"c","text":"Uses Manchester bi-phase encoding instead of bipolar return to zero","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'ARINC 664 AFDX restores deterministic message delivery on an Ethernet-based aircraft network mainly through:',
     '[{"id":"a","text":"Virtual links — unidirectional logical connections with a guaranteed bandwidth allocation","correct":true},{"id":"b","text":"Allowing unlimited collisions and simply retransmitting lost frames","correct":false},{"id":"c","text":"Using a single bus controller to poll every LRU in turn","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'Compared with plain commercial Ethernet, ARINC 664 AFDX is made suitable for aircraft use because it is:',
     '[{"id":"a","text":"Switched and full duplex, so collisions cannot occur and worst-case delivery time can be guaranteed","correct":true},{"id":"b","text":"Simplex, so only one LRU can ever transmit","correct":false},{"id":"c","text":"Half duplex with a dedicated bus controller","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'IEEE 1394 (Firewire), used in aircraft in-flight entertainment systems and the F-35 vehicle management system, offers a maximum data rate of approximately:',
     '[{"id":"a","text":"800 Mbps","correct":true},{"id":"b","text":"2 Mbps","correct":false},{"id":"c","text":"100 kbps","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'Comparing bus directionality: which of the following is correctly matched?',
     '[{"id":"a","text":"ARINC 429 is simplex; MIL-STD-1553B and ARINC 629 are half duplex; ARINC 664 AFDX is full duplex","correct":true},{"id":"b","text":"ARINC 429 is full duplex; MIL-STD-1553B is simplex; ARINC 629 is half duplex","correct":false},{"id":"c","text":"All four bus types are half duplex","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'On an ARINC 429 installation, the screen of the twisted pair must be earthed:',
     '[{"id":"a","text":"At one end only, to avoid an earth loop","correct":false},{"id":"b","text":"At both ends and at every break — a single missed screen earth is a classic cause of intermittent data faults","correct":true},{"id":"c","text":"Only at the transmitting LRU","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'If the two conductors of an ARINC 429 twisted pair are swapped during installation, the most likely symptom is:',
     '[{"id":"a","text":"No effect at all, since polarity does not matter on a twisted pair","correct":false},{"id":"b","text":"A permanently invalid parameter, because reversed wiring inverts the data rather than removing it","correct":true},{"id":"c","text":"The receiver automatically corrects the polarity using the parity bit","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'An ARINC 429 installation typically has far more bus pairs than a MIL-STD-1553B installation on the same aircraft because:',
     '[{"id":"a","text":"ARINC 429 words are longer and need more wires per word","correct":false},{"id":"b","text":"ARINC 429 is simplex, so a separate pair is needed every time the direction of data flow must be reversed","correct":true},{"id":"c","text":"ARINC 429 requires an isolation transformer on every pair","correct":false}]',
     '{"B1","B2"}'),

    (s4_id, 'The signal on an ARINC 429 pair swings nominally between two peak voltages of:',
     '[{"id":"a","text":"+5 V and -5 V","correct":false},{"id":"b","text":"+10 V and -10 V","correct":true},{"id":"c","text":"+28 V and 0 V","correct":false}]',
     '{"B1","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M05.5 Logic Circuits (19 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s5_id, 'A NAND gate gives a logic 0 output only when:',
     '[{"id":"a","text":"All of its inputs are 1","correct":true},{"id":"b","text":"Any one of its inputs is 0","correct":false},{"id":"c","text":"All of its inputs are 0","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'A NOR gate gives a logic 1 output only when:',
     '[{"id":"a","text":"All of its inputs are 0","correct":true},{"id":"b","text":"Any one of its inputs is 1","correct":false},{"id":"c","text":"All of its inputs are 1","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'The Exclusive OR (XOR) gate is best described as:',
     '[{"id":"a","text":"A one-bit comparator that outputs 1 when the inputs are the same","correct":false},{"id":"b","text":"A one-bit difference detector that outputs 1 when the inputs are different","correct":true},{"id":"c","text":"A gate whose output is always 1 when both inputs are 1","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'The Exclusive NOR (XNOR) gate is best described as:',
     '[{"id":"a","text":"A one-bit comparator, outputting 1 when the two inputs are the same","correct":true},{"id":"b","text":"A one-bit difference detector, outputting 1 when the two inputs differ","correct":false},{"id":"c","text":"Functionally identical to a plain OR gate","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'It is often said that NAND and NOR gates are "universal". This means:',
     '[{"id":"a","text":"They are the only gates permitted in aircraft wiring diagrams","correct":false},{"id":"b","text":"Any logic function whatsoever can be built entirely from NAND gates alone, or entirely from NOR gates alone","correct":true},{"id":"c","text":"They can operate correctly with either positive or negative logic without any circuit change","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'What is the essential difference between a half adder and a full adder?',
     '[{"id":"a","text":"A half adder can only add 0, whereas a full adder can add any binary number","correct":false},{"id":"b","text":"A full adder accepts a carry-in from the previous stage in addition to the two data inputs, so full adders can be chained; a half adder cannot accept a carry-in","correct":true},{"id":"c","text":"A half adder uses AND gates only, while a full adder uses OR gates only","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'A half adder built from a single XOR gate and a single AND gate produces:',
     '[{"id":"a","text":"The sum on the XOR output and the carry on the AND output","correct":true},{"id":"b","text":"The carry on the XOR output and the sum on the AND output","correct":false},{"id":"c","text":"Only a sum output; no carry is generated","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'An autopilot engage circuit requires the attitude reference valid, the heading reference valid, every servo serviceable, and the pitch wheel and turn knob centred, all at the same time, before it will engage. This is a direct application of:',
     '[{"id":"a","text":"An OR gate, since any one condition being true is enough","correct":false},{"id":"b","text":"An AND gate, since every one of the conditions must be satisfied at once","correct":true},{"id":"c","text":"An Exclusive OR gate comparing two systems","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'If an autopilot will not engage and the engage logic is built from an AND gate fed by several discrete inputs, the correct troubleshooting approach is to:',
     '[{"id":"a","text":"Replace the autopilot computer immediately, since an AND gate fault is always internal to the computer","correct":false},{"id":"b","text":"Go to the AND gate on the schematic and find which of its inputs is missing","correct":true},{"id":"c","text":"Assume the fault must be in the OR gate feeding the annunciator lamp","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'A DOOR UNSAFE caption must illuminate if either the cabin door or the baggage door is insecure. This is implemented with:',
     '[{"id":"a","text":"An AND gate, with the two door switches wired in series","correct":false},{"id":"b","text":"An OR gate, with the two door switches wired in parallel","correct":true},{"id":"c","text":"A NAND gate, with the two door switches wired in series","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'A gyro warning flag is typically driven by a NOR gate or an inverted AND gate so that it appears when the valid signal is lost, rather than requiring a positive fault signal to appear. The reason for this fail-safe design is:',
     '[{"id":"a","text":"It uses fewer components than a positive fault-signal design","correct":false},{"id":"b","text":"Any failure that removes power or removes the data will also display the flag, whereas a design needing a positive fault signal would show nothing if the fault-detection circuit itself failed","correct":true},{"id":"c","text":"NOR gates operate faster than AND gates","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'A pair of Exclusive OR gates feeding into an OR gate is a standard building block for:',
     '[{"id":"a","text":"A half adder","correct":false},{"id":"b","text":"A comparator that flags disagreement between two systems","correct":true},{"id":"c","text":"A monostable multivibrator","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'In combinational logic, the output of a gate depends on:',
     '[{"id":"a","text":"Only the present state of its inputs","correct":true},{"id":"b","text":"The present inputs together with the previous output, fed back","correct":false},{"id":"c","text":"A stored program held in ROM","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'An astable multivibrator has:',
     '[{"id":"a","text":"No stable state — it flips continuously, which is where a computer''s clock comes from","correct":true},{"id":"b","text":"One stable state, producing a single pulse when triggered","correct":false},{"id":"c","text":"Two stable states, and it stays in whichever one it is set to","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'A monostable multivibrator is used for:',
     '[{"id":"a","text":"Storing one bit of data indefinitely","correct":false},{"id":"b","text":"Generating a continuous train of clock pulses","correct":false},{"id":"c","text":"Timing, and for cleaning up a noisy switch input by producing a single pulse of fixed length when triggered","correct":true}]',
     '{"B1","B2"}'),

    (s5_id, 'The SR latch, the simplest bistable circuit, is typically built from:',
     '[{"id":"a","text":"Two cross-coupled NOR gates","correct":true},{"id":"b","text":"A single Exclusive OR gate","correct":false},{"id":"c","text":"A single NOT gate feeding back on itself","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'On an SR latch, applying both the Set and Reset inputs at the same time is forbidden because:',
     '[{"id":"a","text":"It permanently damages the transistors inside the gates","correct":false},{"id":"b","text":"The circuit cannot obey two contradictory instructions at once, and the resulting output state is unpredictable","correct":true},{"id":"c","text":"It causes the latch to behave as an astable multivibrator","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'In positive logic, as used throughout this sub-module:',
     '[{"id":"a","text":"The more positive voltage represents logic 1","correct":true},{"id":"b","text":"The more positive voltage represents logic 0","correct":false},{"id":"c","text":"Voltage polarity has no relationship to logic state","correct":false}]',
     '{"B1","B2"}'),

    (s5_id, 'A truth table shows two inputs A and B, and an output C, with the four rows (A,B,C) reading (0,0,0), (0,1,1), (1,0,1), (1,1,0). This output pattern is that of:',
     '[{"id":"a","text":"An AND gate","correct":false},{"id":"b","text":"A NOR gate","correct":false},{"id":"c","text":"An Exclusive OR gate","correct":true}]',
     '{"B1","B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M05.6 Basic Computer Structure (20 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s6_id, 'A byte, the standard unit of computer storage, consists of:',
     '[{"id":"a","text":"Four bits","correct":false},{"id":"b","text":"Eight bits","correct":true},{"id":"c","text":"Sixteen bits","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'A nibble consists of:',
     '[{"id":"a","text":"Four bits — one hexadecimal character or one BCD digit","correct":true},{"id":"b","text":"Eight bits — one byte","correct":false},{"id":"c","text":"Sixteen bits","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'A processor''s "word" length is:',
     '[{"id":"a","text":"Always exactly 32 bits, on every processor","correct":false},{"id":"b","text":"The number of bits that particular processor handles as a single unit — machine dependent, and not the same thing as an ARINC 429 word, which is always 32 bits","correct":true},{"id":"c","text":"Always equal to one byte, regardless of the processor","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'Firmware is best described as:',
     '[{"id":"a","text":"A physical component with no software content","correct":false},{"id":"b","text":"Software that is permanently held in ROM — physically hardware, but functionally software","correct":true},{"id":"c","text":"Any software that is loaded through a data-loader port","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'Inside the CPU, the element that fetches each instruction from memory, decodes it, and generates the timing and control signals to carry it out is the:',
     '[{"id":"a","text":"Control unit","correct":true},{"id":"b","text":"Arithmetic and logic unit","correct":false},{"id":"c","text":"Accumulator","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'The part of the CPU that performs addition, subtraction, comparison, and the AND, OR and NOT operations is the:',
     '[{"id":"a","text":"Program counter","correct":false},{"id":"b","text":"Arithmetic and logic unit (ALU)","correct":true},{"id":"c","text":"Instruction register","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'The CPU register that holds the address of the next instruction to be fetched is the:',
     '[{"id":"a","text":"Accumulator","correct":false},{"id":"b","text":"Instruction register","correct":false},{"id":"c","text":"Program counter","correct":true}]',
     '{"B1","B2"}'),

    (s6_id, 'The CPU register that holds the result of ALU operations is the:',
     '[{"id":"a","text":"Accumulator","correct":true},{"id":"b","text":"Program counter","correct":false},{"id":"c","text":"Instruction register","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'The clock in a computer is essentially:',
     '[{"id":"a","text":"A monostable multivibrator producing a single timing pulse at power-up","correct":false},{"id":"b","text":"An astable multivibrator producing a continuous train of pulses that the whole machine steps in time with","correct":true},{"id":"c","text":"A bistable circuit that stores the current program state","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'Of the three buses in a computer, which one carries data in only one direction, outward from the CPU?',
     '[{"id":"a","text":"The data bus","correct":false},{"id":"b","text":"The address bus","correct":true},{"id":"c","text":"The control bus","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'An address bus has 16 lines. The number of distinct memory locations it can address is:',
     '[{"id":"a","text":"16","correct":false},{"id":"b","text":"65,536","correct":true},{"id":"c","text":"256","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'RAM (random access memory) is described as volatile because:',
     '[{"id":"a","text":"Its contents are lost when power is removed","correct":true},{"id":"b","text":"It can only be read, never written to","correct":false},{"id":"c","text":"It must be erased with ultraviolet light before reuse","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'The essential difference between static RAM (SRAM) and dynamic RAM (DRAM) is that:',
     '[{"id":"a","text":"SRAM stores each bit in a flip-flop; DRAM stores each bit as a charge on a capacitor that must be periodically refreshed","correct":true},{"id":"b","text":"SRAM is non-volatile; DRAM is volatile","correct":false},{"id":"c","text":"DRAM stores each bit in a flip-flop; SRAM requires refreshing","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'The term "random access", as in RAM, means that:',
     '[{"id":"a","text":"The contents of memory are randomly generated at power-up","correct":false},{"id":"b","text":"Any memory location can be reached directly, in the same time as any other, without reading through everything before it","correct":true},{"id":"c","text":"Data can only be accessed in a fixed sequential order, like a tape","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'ROM (read only memory) is described as non-volatile because:',
     '[{"id":"a","text":"Its contents survive the loss of power","correct":true},{"id":"b","text":"It can be rewritten an unlimited number of times","correct":false},{"id":"c","text":"It requires a continuous refresh cycle to retain data","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'A ROM chip with a small quartz window and a foil label covering it is most likely a(n):',
     '[{"id":"a","text":"PROM, which can never be reprogrammed","correct":false},{"id":"b","text":"EPROM, erased by exposing the die to ultraviolet light through the window","correct":true},{"id":"c","text":"EEPROM, erased electrically in circuit","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'What makes modern on-aircraft software data loading possible, without opening the LRU case?',
     '[{"id":"a","text":"PROM, which is programmed once by blowing fusible links","correct":false},{"id":"b","text":"EEPROM and Flash memory, which can be erased and reprogrammed electrically, in circuit, through a data-loader port","correct":true},{"id":"c","text":"EPROM, which is erased by ultraviolet light","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'In a "federated" avionics architecture:',
     '[{"id":"a","text":"Many functions share a single cabinet, power supply and backplane as software partitions","correct":false},{"id":"b","text":"Each function has its own dedicated box with its own processor, power supply and case — heavier, but a failure is naturally contained","correct":true},{"id":"c","text":"There is no CPU; all logic is combinational","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'In an Integrated Modular Avionics (IMA) architecture, the main design challenge introduced by sharing a cabinet and processing modules across many functions is:',
     '[{"id":"a","text":"The need for rigorous partitioning so a low-criticality function cannot disturb a high-criticality one","correct":true},{"id":"b","text":"The impossibility of running more than one software function on the same hardware","correct":false},{"id":"c","text":"The requirement for every function to have its own dedicated power supply","correct":false}]',
     '{"B1","B2"}'),

    (s6_id, 'When a replacement LRU is fitted to an aircraft, best practice regarding its software is to:',
     '[{"id":"a","text":"Assume the correct software standard is loaded, since all replacement units are pre-configured identically","correct":false},{"id":"b","text":"Check the loaded part number after fitting, every time, since software is a controlled aircraft part","correct":true},{"id":"c","text":"Load new software only if the aircraft fails its next check flight","correct":false}]',
     '{"B1","B2"}');

END $$;
