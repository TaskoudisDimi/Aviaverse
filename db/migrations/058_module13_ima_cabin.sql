-- Module 13.20-13.21: Integrated Modular Avionics (ATA 42), Cabin Systems (ATA 44) (B2 only)
-- Source: EASA Part-66 Module 13 official textbook (IKAROS Aviation Training Centre, IK 01, Issue Oct.2012)
-- This is the final batch of Module 13 sub-modules.

DO $$
DECLARE
    m13_id INT;
    s20_id INT;
    s21_id INT;
BEGIN
    SELECT id INTO m13_id FROM easa_modules WHERE code = 'M13';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M13.20') THEN
        RAISE NOTICE 'M13.20-M13.21 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 13.20: Integrated Modular Avionics (ATA 42)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m13_id, 'M13.20', 'Integrated Modular Avionics',
        $cnt$
# Integrated Modular Avionics (ATA 42)

## Terminology

- **Federated Architecture** - an avionic structure that has functions (e.g. flight management, communications management, analogue signal consolidation and conversion to digital, etc.) implemented in LRUs that interchange information over digital data buses.
- **ARINC 653** - "Avionics Application Standard Software Interface," a software specification for space and time partitioning in safety-critical avionics real-time operating systems. It allows hosting of multiple applications of different software levels on the same hardware in the context of an Integrated Modular Avionics architecture.
- **ARINC 664** - defines the use of a deterministic Ethernet network as an avionic data bus in modern aircraft such as the Airbus A380, Sukhoi Superjet 100 and Boeing 787 Dreamliner.
- **Ethernet** - a family of computer networking technologies for local area networks (LANs). Systems divide a stream of data into frames, each containing source/destination addresses and error-checking data.
- **Deterministic Ethernet** - the ability to send a piece of information to a destination and receive a response in a repeatable time frame.
- **Avionics Full-Duplex Switched Ethernet (AFDX)** - a next-generation aircraft data network (ADN), based upon the IEEE 802.3 Ethernet specification, utilizing commercial off-the-shelf hardware.
- **IEEE 802.3** - a working group and collection of IEEE standards defining the physical layer and the media access control (MAC) of wired Ethernet.
- **Virtual Link (VL)** - the communications channel used to transfer a user's data from an End-System to one or more other End-Systems across the switched AFDX network. The VL utilizes a Bandwidth Allocation Gap (BAG), specifying the minimum gap between the sending times of two consecutive frames for a VL.
- **End System** - an active AFDX subscriber connected to an AFDX network, embedded in each avionics equipment, that communicates with other subscribers respecting AFDX rules.
- **Commercial Off-The-Shelf (COTS)** - a non-developmental item of supply that is both commercial and sold in substantial quantities in the commercial marketplace, procured/utilized in the same form as available to the general public.
- **Star Topology** - a networking topology in which components are connected by individual cables to a central hub, which forwards a received signal simultaneously to all other connected components.
- **Jitter** - distortion in transmission occurring when a signal drifts from its reference position; typically results in loss of data due to synchronization problems.
- **Media Access Control (MAC) address** - a unique 6-byte (48-bit) address usually permanently burned into a network interface device, uniquely identifying it on an Ethernet-based network.
- **Application** - system-specific software, loaded onto a CPIOM, which runs and controls an associated aircraft system.

## The Need for IMA

The Boeing 767 and 757 were the first commercial aircraft to take advantage of the digital federated architecture. The Airbus A320 followed shortly and extended the idea to become the first fly-by-wire transport aircraft.

Two generations of aircraft beyond the initial federated avionics aircraft, **ARINC 429 became the victim of its own success**: the amount of digital information exchanged by LRUs grew beyond ARINC 429's capability to carry it. The initial 1978 standard defined about a hundred 32-bit data word "labels"; by the early 1990s the standard had to be divided into three parts, with Part 2 (label/word format definitions) approaching 200 pages by 2004.

The ARINC 429 bus consists of a single transmitting LRU connected to one or more receiving LRUs, transferring data at either **12-14.5 Kbps or 100 Kbps**. Two-way data transfer requires two 429 buses, and different unrelated data sets may require more than one bus — leading to a proliferation of 429 buses among LRUs.

Beginning with the Boeing 777, the federated avionics architecture moved toward an **Integrated Modular Architecture (IMA)** with the Airplane Information Management System (AIMS) Cabinet. Several major functions (flight management, communications management, aircraft condition monitoring) previously implemented as independent LRUs were implemented using IMA. The concentration of functions within the IMA Cabinet demanded increased bandwidth for communications with avionics outside the Cabinet.

## Avionics Full-Duplex Switched Ethernet (AFDX)

AFDX is a next-generation aircraft data network (ADN) based upon IEEE 802.3 Ethernet, utilizing commercial off-the-shelf hardware to reduce cost and development time. AFDX is one implementation of deterministic Ethernet defined by **ARINC Specification 664 Part 7**. It was developed by Airbus for the A380, initially to address real-time issues for fly-by-wire system development; a similar implementation is used on the Boeing 787 Dreamliner.

AFDX utilizes a **cascaded star topology** network, where each switch can be bridged to other switches, significantly reducing wire runs and aircraft weight. It provides **dual link redundancy** and the required Quality of Service (QoS) for safety-critical avionics systems.

Ethernet's original half-duplex mode used **Carrier Sense Multiple Access with Collision Detection (CSMA/CD)**: each end-system monitors its receive port before transmitting (carrier sense) and detects collisions during transmission. **Full-duplex mode separates both communication directions in each end-system**, obviating the need for CSMA/CD.

A given LRU may communicate with many other LRUs over one set of AFDX wires, instead of one ARINC 429 bus pair per one-way data set and recipient LRU.

Each LRU has an AFDX end-system with transmit and receive ports connecting to a switch; the path from one LRU to others is a **Virtual Link (VL)**. Traffic shaping is implemented in the end-system, and a policing function is implemented in the switch, to maintain deterministic delivery. Packet integrity is checked using a **Cyclic Redundancy Check** verified at the destination.

Each network has one or more AFDX switches. All messages are transmitted to both (redundant) networks; each receiving end-system accepts the first valid copy of any message, relieving application software of responsibility for handling network redundancy.

### AFDX Applications

AFDX has been implemented in the Airbus A380 and military A400M, as well as the Boeing 787. In the A380, the AFDX backbone connects **23 major functions with about 120 subscribers**; advantages include weight savings from eliminating most ARINC 429 buses, estimated at about **100 Kg**, and simpler configuration management. The Airbus A350XWB will connect **36 major functions with about 150 subscribers** to its AFDX backbone.

## IMA Advantages

Traditional avionic systems are based on federated architectures where different subsystems, on their own hardware, are physically separated. In IMA, subsystems share a common platform (memory and processor), increasing utilization. IMA has gained popularity due to reduced weight, size and recurring cost.

The IMA concept replaces numerous separate processors and LRUs with fewer, more centralized processing units, providing weight reduction and maintenance savings. Fewer types and varieties of avionics spares drive higher reliability and less maintenance for airlines.

The traditional approach uses a separate LRU for each avionics function, interconnected point-to-point (e.g. via ARINC 429 or ARINC 629) to every other LRU it must communicate with — difficult to expand and requiring long cable runs.

IMA replaces point-to-point cabling with a **"virtual backplane" data communications network**, connecting software-configurable LRUs that can adapt to changes in network functioning or operating modes. In the event of failures, the system can quickly reconfigure. The **ARINC 653** standard describes an application program interface and operating system that partitions critical and non-critical functions so they cannot interfere with each other.

Using the IMA approach, **Boeing saved 2,000 lbs of weight** on the 787 Dreamliner's avionics suite versus previous comparable aircraft. The IMA approach **cut in half the part numbers** of processor units for the Airbus A380's avionics suite. An IMA operator can upgrade software without upgrading hardware, and vice versa, and inventory in the shop is smaller since common parts/cards can be used in any of the IMA computers.

## Manufacturer's Approaches

The Boeing 787 and Airbus A380 both adapt the general "shared resources" concept, but differ in approach.

Key to the B787 avionics suite (developed with Smiths Aerospace, Rockwell Collins and Honeywell) is a central computing system Boeing calls the **Common Core System (CCS)**, which eliminates more than 100 different LRUs.

The A380 applies the IMA concept with computers capable of hosting different functions, connected by a network — it does not rely on a single (or dual) central processor. The A380's IMA approach relies on **eight processing modules**, tied together by the AFDX communication network (ARINC 664 standard). Seven of the computers are Core Processing Input/Output Modules (CPIOM); the eighth is an Input/Output Module (IOM).

Although the Airbus IMA computers have eight different part numbers, the memory and power supply cards are common to all; only the input/output card differs depending on the system interfaced.

## Aircraft Data Networks

### Aircraft Data Network (ADN) Characteristics

The most important characteristics of an ADN are **Quality of Service (QoS), available bandwidth, weight, and the cost of development and deployment**. QoS is determined by attributes such as bandwidth guarantee, jitter, transmit latency and Bit Error Ratio (BER). A guaranteed bandwidth, limited jitter, upper-bounded transmit latency and a low BER (typically **10⁻¹², i.e. one error bit in a trillion**) are imperative for a reliable, deterministic ADN.

New generation aircraft (A380, A350, B787, A400M) require more sophisticated functions, leading to more complex avionics that need higher-bandwidth ADNs. Less wiring reduces weight, leading to a more fuel-efficient aircraft. Using existing commercial technologies, adapted for ADN requirements, benefits from lower COTS costs and field-proven equipment.

### Emergence of AFDX

Prior to the A380, the three main ADNs were **ARINC 629, MIL-STD-1553 and ARINC 429**, with maximum bandwidths of **100 Kbps, 1 Mbps and 2 Mbps** respectively. None of these could fulfil the A380's demanding requirements, so **AFDX was conceived by Airbus** and first implemented on the A380. AFDX is also used on the A400M and Boeing 787 (with some standard extensions), and is the planned ADN backbone for the Airbus A350.

### AFDX Characteristics

The AFDX standard was originally defined by Airbus as the "AFDX Detailed Functional Specification (DFS)," and also exists as **ARINC 664**. Boeing's ADN backbone for the 787 is based on ARINC 664 with minor extensions, called the "Interoperability Specification for the 787 End Systems."

AFDX is a serial data transfer method based on conventional Ethernet (IEEE 802.3), allowing transfer rates of either **10 or 100 Mbps** over copper or fibre optic media. Since conventional Ethernet is not deterministic, AFDX was extended to ensure deterministic behaviour and high reliability.

AFDX ensures deterministic behaviour through traffic control, guaranteeing the bandwidth of each **Virtual Link (VL)**, thereby limiting jitter and transmit latency. To improve reliability, each AFDX channel must be **dual redundant** — two channels transmitting the same data stream simultaneously. AFDX only forwards one data stream to the upper layers, automatically excluding an erroneous stream. With these characteristics, AFDX ensures a BER as low as **10⁻¹²** while providing bandwidth up to 100 Mbps.

## IMA General Layout

Most conventional LRU functions are done by avionics "applications," hosted in shared IMA modules called **Core Processing Input/Output Modules (CPIOMs)**. There are seven CPIOMs doing different functions — Airbus calls this "open IMA."

The three functional domains of the Airbus IMA model are: **cockpit** (electrical flight control, communications and warning), **cabin** (air conditioning and pneumatics), and **utilities** (energy, fuel and landing gear functions).

Service capability is increased with additional IMA modules called **Input/Output Modules (IOMs)**. CPIOMs and IOMs are Line Replaceable Modules (LRMs). These LRMs communicate through the **Avionics Data Communication Network (ADCN)**, using AFDX technology.

## The Controller Area Network (CAN) Bus

The CAN bus is a vehicle bus standard allowing microcontrollers and devices to communicate without a host computer. It is a serial communications protocol supporting distributed real-time control with a high level of security.

The CAN bus operates at data rates of up to **1 Mb/sec for cable lengths less than 40 meters**; for longer cables, the data rate typically falls to **125 Kb/sec for 500 meters (1,640 feet)**. Signals are normally transmitted on a twisted pair of wires.

Data collisions are avoided using **CSMA/AMP**: Carrier Sense Multiple Access (CSMA) ensures a terminal transmits only when the bus is quiet, and bus arbitration logic connects the terminal with the higher-priority message (Arbitration based on Message Priority). A message consists of an ID (representing priority) and up to eight data bytes, encoded in non-return-to-zero (NRZ). Messages with numerically smaller ID values have higher priority and are transmitted first (priority-based bus arbitration).

Each node requires a **host processor** (decides what received messages mean and what to transmit), a **CAN controller** (hardware with a synchronous clock, handling serial bit reception/transmission), and a **transceiver** (adapts signal levels between the bus and controller).

### Use of CAN Bus on the Airbus A380

To reduce interconnecting wires from flight-deck control panels to avionics-compartment computers, Airbus deployed CAN bus. A typical overhead panel (e.g. electrical power system control) may have about 14-15 switches/indicators, each with at least six wires — totaling at least **90 wires** from just one panel.

Airbus redesigned these into **Integrated Control Panels (ICP)**, connecting all switches/indicators on a panel to a CAN bus controller integral with the panel, transmitting data on only **two wires**. ICPs connect to Input/Output Modules (IOM) using CAN data buses; from IOMs, data is transmitted to the ADCN using AFDX. This reduces wiring, improves maintenance and reduces aircraft weight.

Even though CAN bus is used extensively to reduce wiring, **ARINC 429 is still used** to interconnect radio system control panels (e.g. VHF/HF) to LRUs in the avionics compartments, because it has a well-defined data structure suitable for aircraft systems, is easy to implement and maintain, and has a simple transmission protocol.

## Avionics Data Communication Network (ADCN)

ADCN is the principal means of communication technology between avionics equipment on the Airbus A380 and similar aircraft. ADCN is the name of the system; the technology is AFDX. It is used for exchange of operational, maintenance and loading data between subscribers, and is easily configurable without requiring new connections for new messages.

The ADCN is composed of **two redundant networks (A and B)**, both composed of AFDX switches connected with AFDX cables. Each ADCN subscriber has an **AFDX End System** interface, which duplicates frames in transmission and keeps the first valid one received, increasing data availability. On the A380, subscribers communicate at **10 or 100 Mbits/s**.

### The Virtual Link (VL)

Aircraft system data is sent simultaneously on both redundant networks A and B through AFDX switches, according to a predefined path called a **Virtual Link (VL)**. Virtual Links are unidirectional logical paths from a source end-system to one or more destination end-systems. Unlike traditional Ethernet, which switches on MAC address, **AFDX routes packets using a Virtual Link ID** (a 16-bit unsigned integer).

Each Virtual Link is allocated dedicated bandwidth, and total bandwidth cannot exceed the network maximum. Each VL is "frozen" in specification for determinism; a switch's VL configuration table can reject erroneous transmissions. **Sub-virtual links (sub-VLs)** carry less critical data in round-robin sequence, without guaranteed bandwidth or latency.

Each VL has one source (Tx end-system port) and one or more destinations (Rx end-system ports), and is assigned a MAC address, a maximum frame size, and a **Bandwidth Allocation Gap (BAG)** — the minimum time between two transmissions of a frame. A Virtual Link is analogous to a single ARINC 429 bus in carrying a unidirectional information stream. Key VL properties:

- A Virtual Link is unidirectional
- A Virtual Link has a unique emitter and one or more receivers
- A Virtual Link always follows a frozen route on the network
- Virtual Link maximum bandwidth = frame size / BAG

## Core System

### Core Processing Input/Output Modules (CPIOMs)

CPIOMs form the core of the Integrated Modular system. In the Airbus configuration, there are **7 types of CPIOM, identified by letters A to G**, each associated with a specific part number. Within a given type, CPIOMs are interchangeable but may require software reconfiguration.

| Type | Hosted applications | ATA chapter(s) |
|------|---------------------|-----------------|
| CPIOM-A | Pneumatic and optional air conditioning: Engine Bleed Air System (EBAS), OverHeat Detection System (OHDS), Pneumatic Distribution System (PADS); Supplemental Cooling System (SCS) | ATA 36; ATA 21 |
| CPIOM-B | Air conditioning: Air Generation System (AGS), Avionics Ventilation System (AVS), Cabin Pressure Control System (CPCS), Temperature Control System (TCS), Ventilation Control System (VCS) | ATA 21 |
| CPIOM-C | Cockpit and flight controls: Flight Control Unit (FCU) backup, Weight and Balance Backup Computation (WBBC); Flight Control Data Concentrator (FCDC); Flight Warning System (FWS) | ATA 22; ATA 27; ATA 31 |
| CPIOM-D | Data link: Air Traffic Control (ATC) system; Avionics Communication Router (ACR) | ATA 46; ATA 23 |
| CPIOM-E (×2) | Energy: Circuit Breaker Monitoring System (CBMS), Electrical Load Management System (ELMS), Electrical System BITE (ESB) | ATA 24 |
| CPIOM-F (×4) | Fuel: fuel CG measurement, fuel measurement, fuel management, fuel system BITE, fuel integrity, fuel monitor | ATA 28 |
| CPIOM-G (×4) | Landing gear: braking control system, steering control system, Landing Gear Extension and Retraction System (LGERS), plus associated monitoring/BITE functions | ATA 32 |

### CPIOM Components

A CPIOM is composed of:

**Hardware Boards**
- A power supply board connected to the **28 VDC** bus
- 2 input/output boards, connected to aircraft systems through analogue, ARINC, CAN and/or discrete signals
- 1 Central Processing Unit (CPU) board supporting an **AFDX End-System board**, which supplies an AFDX interface for the CPIOM to exchange AFDX data with the ADCN
- Field Loadable Module Software

One CPIOM **core software** operates the module and its hosted applications; one CPIOM **configuration table software** gives the module and applications their configuration data (memory, CPU, I/O allocations, etc.).

**CPIOM Basic Software** includes the Airbus API (based on ARINC 653), CSW tables, a Drivers Manager, Libraries, and system partitions such as MONIT NVM (Non-Volatile Memory management), Instrumentation Data Load (compliant to ARINC 615A), resource BITE, and SNMP-MIB.

**CPIOM Hardware inputs/outputs** (may differ per CPIOM type) include: I/O AFDX, DGI (Digital Input), DGO (Digital Output), AN (Controller Area Network), DSI (Discrete Input), DSO (Discrete Output), ANI (Analogic Input), ANO (Analogic Output).

## Input/Output Modules (IOM)

An IOM is used whenever a function needs to dialogue with other ADCN subscribers via the ADCN (the CPIOM incorporates its own IOM). In normal operation, IOMs convert aircraft system data sent/received by directly-connected LRUs from non-AFDX into AFDX format, and vice versa.

### The "Mirror" IOM Principle

On the Airbus A380, there are **8 IOMs connected to the ADCN — 4 on side 1 and 4 on side 2**. IOM 1/3/5/7 are "mirror" IOMs of IOM 2/4/6/8, and vice versa. An LRU exchanging messages with ADCN subscribers must use both "mirror" IOMs, so both the LRU and the ADCN subscriber send/receive redundant messages. In case of one IOM loss, communication is not lost, thanks to the mirror IOM.

An IOM does not host avionics applications; it hosts only the IOM operational program software and the IOM configuration table software. **All IOMs are fully interchangeable.**

## Component Failures

- **Loss of CPIOM**: only the cockpit effect related to loss of its hosted applications is annunciated, not the loss of the CPIOM itself.
- **Single IOM loss**: only its mirror IOM converts the data. Class 4 fault (becomes class 1 level 1 if not repaired within 1,000 flight hours). No functional effect; GO with a specified rectification interval per the MMEL.
- **Multiple "non-mirror" IOMs loss**: only their mirror IOMs convert the data. Class 1 level 1 fault. No functional effect; NO GO per the MMEL.
- **Multiple "mirror" IOMs loss**: aircraft system data sent/received by the connected LRUs is lost. Class 1 level 2 fault. Functional effect on aircraft systems; NO GO per the MMEL.

## Network Components

The system gathers aircraft systems within functional areas: Flight Controls and Auto Flight, Cockpit, Engines control, Energy, Pneumatic and Cabin, Fuel, and Landing Gear. These computers exchange operational and maintenance data mostly through the ADCN (two redundant networks A and B, composed of AFDX switches connected by AFDX cables). Subscribers communicate at 10 or 100 Mbits/s. **In case of total network failure, all essential data transmission is backed up using ARINC 429 data bus systems.**

### AFDX Switch Components

An AFDX switch is composed of: a power supply board (28 VDC bus), a switching board (routes frames per a configuration table), an input/output board connected to other switches and ADCN subscribers, plus Field Loadable Module Software (AFDX SW operational program and AFDX SW configuration table). **All AFDX switches are interchangeable but may require software reconfiguration.**

### ADCN Failure Modes

- **Single AFDX switch loss**: non-degraded network transmits the data. Class 4 fault (class 1 level 1 after 1,000 flight hours). No functional effect; GO with rectification interval.
- **Multiple AFDX switches loss (same network)**: non-degraded network transmits the data. Class 1 level 1 fault. No functional effect; NO GO.
- **Multiple AFDX switches loss (both networks)**: data is partially or no longer transmitted. Class 1 level 2 fault. Functional effect; NO GO.
- **All AFDX switches loss**: data is not transmitted. Class 1 level 2 fault. Functional effect; NO GO. The aircraft can still be safely operated via backup interconnections (mainly ARINC 429 buses).
- **Single AFDX cable loss**: non-degraded network transmits the data. Class 4 fault (class 1 level 1 after 1,000 flight hours). No functional effect; GO with rectification interval.
- **Multiple AFDX cables loss**: data partially or not transmitted at all. Class 1 level 1 fault. Possible functional effect; NO GO.

## Combining Technologies

Conventional avionics (LRUs) exist alongside IMA avionics, and LRUs also dialogue with new-technology Applications via non-AFDX methods.

### Common Remote Data Concentrator (CRDC)

CRDCs collect, convert and exchange data between the ADCN and LRUs that do not have AFDX technology and that are mostly installed outside the avionics compartment.

### Example Implementation — Fuel Measurement and Management System (FMMS) on the Airbus A380

The A380's IMA suite comprises CPIOM units interconnected by AFDX to operate and communicate with aircraft systems including the Fuel Measurement and Management System.

CPIOMs are arranged in pairs to form computing lanes: one CPIOM is designated the **'Command' (COM)** channel, the other the **'Monitor' (MON)** channel. Of the two fuel system computing lanes, one is designated the **'Primary'** lane controlling the system, the other operates as **'Standby'**. The functional health of each lane is continually assessed by **BITE software** within each MON channel; should the primary lane's health deteriorate below that of the standby lane, control switches over to the standby lane.

Each lane interfaces with two **Fuel Quantity Data Concentrators (FQDCs)**, which interface with the in-tank equipment. The four CPIOMs interconnect with the FQDCs and the **Integrated Refuel Panel (IRP)**. The fuel system supplier is responsible for the functionality of the embedded software in the CPIOMs, with COM and MON functions partitioned within each CPIOM pair.
        $cnt$,
        21
    ) RETURNING id INTO s20_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 13.21: Cabin Systems (ATA 44)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m13_id, 'M13.21', 'Cabin Systems',
        $cnt2$
# Cabin Systems (ATA 44)

## Overview

The cabin system gives the cabin crew an interface to the cabin core system and the cabin monitoring system, and lets passengers use the entertainment system. It is comprised of **three sub-systems**:

- The **Cabin Core System**
- The **In-Flight Entertainment System (IFE)**
- The **Cabin Monitoring System**

## Definitions

- **Cabin system** - the units and components furnishing a means of entertaining passengers and providing communication within the aircraft and between the aircraft cabin and ground stations. Includes voice, data, and music and video transmissions.
- **Cabin core system** - the portion of the cabin system used to accomplish integrated functional control, operation, testing and monitoring of cabin systems and to increase cabin comfort (such as active noise control); includes controllers, cabin control panels, handsets, signs and loudspeakers.
- **In-flight entertainment system** - the portion of the cabin system used to entertain passengers with music, video, information and games; includes controllers, cabin control panels, audio and video equipment.
- **Cabin address system** - the public announcement system by which flight and cabin crew broadcast messages to passengers.
- **Cabin mass memory system** - used to store and process cabin-related data such as systems configuration data and multimedia programs; includes controllers, terminals, keyboards, disk drives, printers and modems.
- **Cabin monitoring system** - the portion of the cabin system used to monitor parts of the cabin area; includes surveillance cameras and monitors. It does **not** include external anti-hijack devices or external video monitoring.
- **Miscellaneous cabin system** - the portion of the cabin system used to support miscellaneous cabin functions.

## Cabin Core System

The cabin core system includes two sub-subsystems: the **Cabin Intercommunication Data System (CIDS)** and the **Service Interphone**.

The CIDS operates, controls, monitors and transmits data from different cabin systems related to passengers and cabin crew, and enables various system tests. It contains CIDS directors, Flight Attendant Panels (FAP) and mini-FAPs — mini-FAPs connect to FAPs, which connect to the directors, and the directors connect to all systems related to passengers and crew.

The service interphone system lets ground maintenance crew and cockpit/cabin crew speak to each other, via service interphone jacks, cockpit acoustic equipment, and cockpit/cabin handsets.

The CIDS directors interface with: the **Control and Display System (CDS)**, aircraft systems and cabin support systems, and Communication Systems (ATA 23).

### Location

The single cockpit handset and cabin handsets, FAPs and mini-FAPs are in the cabin; the **CIDS directors are located in the avionics compartment**. Service interphone jacks are located for maintenance crew in areas such as the nose landing gear section, the wing box section, the aft cargo compartment, and the trimmable horizontal stabilizer/APU section.

### Control and Indicating

Some CIDS controls are on the cockpit overhead panel and center pedestal; most controls and indications are on the FAPs and mini-FAPs in the cabin.

## Cabin Intercommunication Data System (CIDS)

### CIDS Functions

CIDS operates and monitors: Passenger/Cabin Announcement, Cabin Temperature Control, Water/Waste Tank level indication, Cabin Illumination, Emergency and Evacuation Signaling, Lavatory Smoke Warning and Indication, Aircraft Doors and Slides Status, IFE System Status, and various optional functions.

CIDS hardware provides spare inputs, outputs and circuits, so new cabin equipment can be connected without changing CIDS hardware — only the CIDS software database needs updating. CIDS can also detect faults in its own components and connected equipment.

Key system functions include:
- **Passenger Address (PA)** — distributes announcements from the cockpit and each attendant station through assigned passenger loudspeakers
- **Service Interphone** — allows telephone communication between ground crew, cockpit crew and cabin crew when the aircraft is on the ground
- **Cabin and Flight Crew Interphone** — allows telephone communication between all attendant stations and the cockpit
- **Cabin Ready Signaling** — informs the cockpit crew about cabin status (an airline option)
- **Passenger Call** — controls illumination of the passenger call light and activation of the call chime
- **Passenger Signs** — controls the NO SMOKING (NS), FASTEN SEAT BELT (FSB), RETURN TO SEAT (RTS) and EXIT signs
- **Pre-Recorded Announcement and Boarding Music (PRAM)** — transmits pre-recorded announcements and boarding music to loudspeakers
- **Cabin Illumination** — controls illumination of different cabin areas independently
- **Reading Lights** — controls passenger reading lights and attendant work-lights

### CIDS Architecture

The CIDS is designed modularly, with the number of installed components adapted to the cabin layout and functional requirements. The architecture is based on a controller, bus lines and network concept, with **CIDS directors fulfilling the role of controllers**.

CIDS system components include: Directors; Decoder/Encoder Units (DEU) Type A and Type B; Passenger Interface and Supply Adapter (PISA); Flight Attendant Panel (FAP); Cabin Assignment Module (CAM); On-Board Replaceable Module (OBRM); Integrated PRAM (I-PRAM); optional Additional Attendant Panels (AAP); Attendant Indication Panels (AIP); Area Call Panels (ACP); handsets; loudspeakers; passenger call/reset pushbuttons and call lights; and NS/FSB/RTS signs.

All CIDS components connect to **two or more identical Directors** — one active, the other(s) in hot standby. Directors monitor system performance continuously, store detected faults, and send them to the Warning and Maintenance System (WMS) and/or the FAP; a major fault is also sent to the cockpit (e.g. ECAM/EICAS Status or Warning Page). Most CIDS components are installed at attendant stations, usually near door areas or in the aisle between them.

**Multi-Purpose Flight Attendant Panel (MP FAP)**: lets cabin/maintenance crew control and monitor cabin support systems and passenger/crew-related functions. On the Airbus A380, there are typically two independent touch-screen FAPs (Upper Deck and Main Deck), though the number of MP FAPs **can be increased to up to 10**. 'Daisy chain' connectivity between MP FAPs is possible. **MINI-FAPs** are an option, letting cabin crew control/monitor some systems in a specific cabin zone.

**Decoder/Encoder Units Type A (DEU A)** interface the active director with passenger-related functions: cabin lighting and all Passenger Service Unit (PSU) functions (individual lighting, signs, calls, loudspeakers). On the A380, there are typically **85 DEUs A installed (a maximum of 192 can be installed)**.

**Decoder/Encoder Units Type B (DEU B)** interface the active director with cabin-crew-related functions: Area Call Panels (ACPs), Attendant Indication Panels (AIPs), optional Additional Attendant Panels (AAPs), and handsets. On the A380, there are typically **21 DEUs B installed (a maximum of 72 can be installed)**.

**Area Call Panels (ACPs)** are a remote call facility informing attendants of a passenger/interphone call, lavatory smoke detection, or cabin evacuation signaling; mainly on the cabin ceiling above the aisles.

**Attendant Indication Panels (AIP)** display dial and call information from the PA/interphone and other cabin system information (e.g. lavatory smoke location), installed at all attendant stations. Each AIP has a **two-row alphanumerical display, 16 characters per row**, plus two indicator lights (red/green): the upper row shows communication information, the lower row shows cabin system/emergency information. The **red light** is for system/emergency information, the **green light** for communication information; lights are steady normally and flash in emergency situations.

**Cabin Assignment Module (CAM)** is a plug-in memory cartridge installed in the FAP, containing the cabin layout definition and airline-specific data (cabin zoning, seat-to-loudspeaker/sign relation, chime sequences, audio levels).

**Integrated PRAM (I-PRAM)** provides announcement and boarding music functionality; audio data is stored on a compact flash card plugged into the FAP sub-panel.

**On-Board Replaceable Module (OBRM)** is the storage device for internal system software, installed in the FAP sub-panel.

**Power Supply**: CIDS directors, DEUs A and B, and MP FAPs are powered by **28 VDC**, normally from the DC bus, DC ground service, or DC essential bus (if ground service bus is unavailable).

## Multi-Purpose Flight Attendant Panel (MP FAP)

Installed at the purser stations. It is the main CIDS human-machine interface, comprising: a touch screen to display/select MP FAP pages, a hard key panel for major functions, a CIDS key for CIDS applications, and a MENU key for external applications (e.g. cabin log book). It displays UTC time. The touch screen includes aircraft symbols/soft keys, system/function keys, deck selection keys, a screen-off key, a heading row, and a cabin status key.

## Communication Functions

CIDS has three communication functions: **Passenger Address (PA)**, **Cabin Interphone**, and **Service Interphone**.

### Passenger Address (PA)

The PA system distributes announcements from the cockpit, attendant stations, and the IFE System to all assigned cabin loudspeakers and passenger headsets. Cockpit crew can announce via handsets or acoustic devices (boom set, microphone, oxygen mask) by selecting the PA key on the Radio Management Panel (RMP). A source with higher PA priority interrupts a lower-priority announcement. Typical PA source priorities:

1. Cockpit acoustic devices
2. Cockpit handset
3. Cabin handset
4. Pre-recorded announcements
5. In-Flight Entertainment (IFE)

### Cabin Interphone

Used for communication between cabin crew stations and between cockpit and cabin crew stations; conference mode allows multiple interphone stations to communicate simultaneously. From the cockpit, calls use the cockpit handset or cockpit call panel with functions: EMER call, ALL call, PURS call, and PILOT REST call. Typical interphone call source priorities:

1. Emergency
2. Captain (via Cabin handset)
3. Purser
4. Conference
5. Miscellaneous (crew rests, etc.)

A higher-priority call interrupts a lower-priority one; calls activate visual (AIP, ACP) and aural (cockpit buzzer, cabin loudspeakers) indications.

### Service Interphone

Used for communication between service areas, between cockpit and service areas, and between service areas and cabin crew stations. It is automatically available when the Nose Landing Gear compressed signal is received, or when the landing gear is not compressed and external power is used. A "Service Interphone Override" switch on the cockpit overhead panel can manually activate it. Interphone service jacks are typically at: avionics, nose landing gear, cargo compartments, air conditioning, hydraulic compartment, near the DFDR, trim actuator, APU compartment, and engines.

## Indicating Functions

CIDS fulfils indicating functions for: Smoke Detection Function (SDF), Emergency lighting power supply, Ice protection and control, Trolley lift, Electrical load management, Galley cooling, IFE and seat power, Doors/slides, and Vacuum System Control Function (VSCF).

- **SDF**: receives information directly from the fire protection system to monitor smoke detectors in cargo and avionics compartments, and monitors the fire extinguishing system; also displays cabin smoke detector status via DEUs on the MP FAPs, and reports to the Flight Warning System (FWS).
- **Emergency Lighting Power Supply**: CIDS directors interface (via DEUs) with the emergency lighting system for failure indicating (through FWS) and testing.
- **Ice Protection and Control**: interface with the potable/waste water ice protection system via DEUs, reporting failures and displaying/selecting floor panel temperature via the MP FAPs.
- **Trolley Lift**: interface via DEUs to report failures through the MP FAPs.
- **Electrical Load Management Indication**: via the ADCN, indicates shedding status of cabin support systems (air conditioning, IFE, flight systems) on the MP FAPs.
- **Galley Cooling**: via the ADCN, interfaces with the Supplemental Cooling System (SCS) to display status on the MP FAPs.
- **IFE and Seat Power**: via the ADCN, displays IFE/seat power status and controls MP-FAP-initiated, IFE, and seat power switching.
- **Doors/Slides**: via the ADCN, interfaces with the Door and Slide Management System (DSMS) to indicate status on the MP FAPs.
- **VSCF**: interfaces with the water/waste system to display monitoring of potable/waste water tank filling levels via the MP FAPs.

## Control Functions

CIDS provides control functions for: Cabin lighting and passenger reading lights, Emergency Evacuation (EVAC), Illuminated signs, Passenger call, IFE, Air conditioning, VSCF, and optional Electric Window Shades (EWS).

- **Cabin Lighting/Reading Lights**: controlled independently per cabin zone/deck/room via MP FAPs, optional AAPs and MINI-FAPs; individual reading light control via PSUs and IFE.
- **EVAC**: controls evacuation signaling in all cabin areas and the cockpit, activated from the cockpit EVAC panel or from the cabin (MP FAPs, AAPs, MINI-FAPs).
- **Illuminated Signs**: directly controls exit sign lighting; via DEUs controls NS, optional PED, FSB and RTS sign lighting, and lavatory-occupied signs. Manually activated from the cockpit signs panel or automatically per aircraft configuration.
- **Passenger Call**: activated from passenger seats (via IFE) or lavatories, reset from attendant stations via MP FAPs/AAPs/MINI-FAPs; activates ACP/AIP call indications and passenger call chimes.
- **IFE**: CIDS exchanges control commands for passenger call and reading light operation, IFE operation from the MP FAP, and PA/video-related audio signals.
- **Air Conditioning**: via the ADCN, remotely controls cabin temperature within a given range, set via MP FAPs/MINI-FAPs; also controls optional electrical heaters and humidifiers.
- **VSCF**: controls water depressurization, auto-dish, water system shutdown, potable water tank refill quantity pre-selection, and control of up to **four showers**, via the MP FAPs.
- **EWS**: centralized control of optional Electric Window Shades per zone, via a dedicated MP FAP page, selectable by side (left or right).

## Other Functions

- **Software Loading**: updates software of loadable CIDS components (directors, MP FAPs, MINI-FAPs, handsets, DEU Bs) via a dedicated MP FAP page; ground-only.
- **Layout Selection**: choice of a maximum of **three predefined and three modifiable** cabin layouts via a dedicated MP FAP page; protected by an access code, ground-only.
- **Cabin Programming**: modifies cabin zone configuration (Cabin Zones, No Smoking Zones, Non-Smoker Aircraft programming) via a dedicated MP FAP page; available on ground or in flight, protected by access code.
- **Loudspeaker Level Adjustment**: manual adjustment of cabin loudspeaker level for announcements/chimes via a dedicated MP FAP page; protected by an access code, available on ground or in flight, adjustable within a range of **-4dB to +6dB in steps of 2dB**.
- **MP FAP Set-Up**: controls/indicates MP FAP internal settings (loudspeaker volume, screen brightness).

## Emergency Crew Alerting System (ECAS)

ECAS is an optional, highly customizable system used to signal an incident in the cabin or cockpit. For a cabin alert (initiated via a hidden/guarded switch at the attendant station or galley), the DEU B transmits the signal to the Directors, which send it to the cockpit (visual/aural indications) and, via the data-bus, to the DEUs B, activating AIP visual indications in the alerting area; the ECAS status is also sent to the optional Cabin Video System. For a cockpit alert, the signal goes directly to the Directors, which send it via data-bus to DEUs B (AIP/ACP visual indications) and to DEUs A (via PISA, to emit a special chime).

## Crew Signaling

The cabin crew can send a "cabin ready status" to the cockpit for take-off and landing: an "area ready" signal is initiated on each assigned MINI-FAP/MP FAP, area statuses are collected on a Cabin Ready page, and the purser initiates a "cabin ready" signal displayed on the ECAM. The enable/reset logic is programmed in the CAM, depending on flight phase and customized conditions (e.g. landing gear down and locked, engine not running, or slats/flaps extended). An optional "sterile cockpit" switch (on the overhead panel) triggers visual indications on AIPs/ACPs if the flight crew does not want to be disturbed; it can only be reset by the sterile cockpit switch itself.

## Emergency Evacuation (EVAC)

Used to initiate evacuation in all cabin areas and the cockpit. The EMER command can be initiated from the MP FAP, MINI-FAP, AAP (EVAC CMD buttons), or the cockpit EVAC panel. The EVAC switch has CAPT and PURS positions. In the **CAPT position, only the cockpit crew can activate** the EVAC command — a cabin-initiated evacuation instead activates the EVAC light and cockpit horn/buzzer (the horn can be silenced with the HORN-OFF button); the cockpit crew confirms via the COMMAND button (ON indication in white). In the cabin, an emergency tone is broadcast, AIPs display "EVACUATION ALERT" with flashing red lights, the ACP pink LED is on, and the EVAC RESET button flashes on the MP FAPs/AAPs/MINI-FAPs. Cancellation is via the EVAC CMD pushbutton (cockpit) or the EVAC RESET button (cabin). If assigned in the CAM, CIDS sends EVAC status to the Doors and Slides Management Control Unit (DSMCU) to inhibit audio alert at door opening with slide armed, and to the IFE Center to inhibit audio/video while EVAC is active.

## Passenger (PAX) Signs

Controls NS, FSB, RTS and EXIT signs via control switches on the cockpit overhead SIGNS panel. EXIT signs are controlled by the Directors via the Emergency Power Supply Unit (all other signs via DEUs A). An optional No-PED sign can replace the NS sign.

- **FSB switch ON**: director signals DEU A to switch on all FSB and RTS signs.
- **FSB switch AUTO**: signs switch on if nose landing gear is down and locked, or slats extended and engine running (customizable conditions).
- **FSB switch OFF**: all FSB and RTS signs off. When FSB is ON, a FASTEN SEAT BELT memo displays on the ECAM.
- **NS switch ON**: all NS signs switch on (optionally EXIT signs too).
- **NS switch AUTO**: NS and EXIT signs switch on when nose landing gear is down and locked, or slats extended (customizable). When NS is ON, a NO SMOKING memo displays on the ECAM.
- **NS switch OFF**: NS and EXIT signs switch off, except the NS signs in no-smoking areas defined on the MP FAP Cabin Programming page, which stay on.
- **NON SMOKER aircraft function** (via MP FAP Cabin Programming page): switches on all NS signs regardless of cockpit switch position.

In case of cabin decompression, all NS, FSB and EXIT signs switch on regardless of cockpit switch position (RTS, PED and Return to Cabin signs stay OFF). Sign activation/deactivation triggers an attention chime, and can trigger PRAM special announcements and IFE display, if configured. Passenger sign lighting level can decrease/increase in proportion to general lighting (**proportional mode**), or when general lighting crosses a predefined level (**trigger level mode**).

## Passenger (PAX) Call

Initiated by pushing the passenger CALL button (PSU), the LAV CALL button, or from the Passenger Control Unit (PCU) in the armrest. The signal goes to the Directors via the DEU A or the IFE System; the active Director signals the DEU A to switch on the related call light. The lavatory call light also switches on automatically for NS/FSB sign activation, a lavatory smoke event, or a rinse valve failure. The active Director switches on the respective ACP light, and the AIP indicates the call origin; call location may optionally be shown on the MP FAP/MINI-FAP CALL pages. A high call chime sounds from loudspeakers in the respective area. Pressing CALL again resets that indication; the CALL RESET button (MP FAP SEAT SETTING page, MINI-FAP MISCELLANEOUS page, or AAP) resets all calls in the assigned zone. A Chime Inhibit button silences the call chime while keeping visual indications; inhibitions reset automatically when the aircraft transits to the landing phase (nose landing gear down and locked).

## In-Flight Entertainment (IFE) System

### Audio and Video Entertainment

Audio entertainment covers music, news, information and comedy, mostly pre-recorded with their own DJs; some aircraft offer a channel of the aeroplane's radio communications. In audio-video on demand (AVOD) systems, software selects music from a music server. Headphones distributed to passengers are used for both audio entertainment and personal televisions; systems have been made compatible with satellite radio and personal music devices.

Almost all systems use **MPEG** technology; bandwidth/disk space determine the capability to stream from MPEG1/1.5 up to MPEG2/3.5. **MPEG4-H264** is a newer encoding standard, requiring modern decoding systems, with comparable quality to MPEG2 but a smaller file size, and requiring a license from MPEG LA.

Video entertainment is provided via large front-of-cabin screens and smaller aisle monitors, or via **personal televisions (PTVs)** for every passenger, offering films, comedies, documentaries and other programming. PTVs may be operated by an **In-Flight Management System (IFMS)** (streaming pre-recorded channels from a central server) or an **AVOD** system (streaming individual programs to a passenger with playback control). Some systems offer video games and closed captioning (started in 2008), with selectable subtitle languages.

Personal on-demand videos are stored in the aircraft's main IFE computer system, allowing pause/rewind/fast-forward. Portable media players (PMPs) — commercial off-the-shelf or proprietary — may be handed out by cabin crew or semi-embedded in seatbacks/armrests.

A **moving-map system** is a real-time flight information video channel broadcast through PTVs and cabin video screens, displaying aircraft position/direction along with altitude, airspeed, distance to/from destination/origin and local time, derived from the aircraft's flight computer systems.

### In-Flight Connectivity

IFE has expanded to include internet browsing, text messaging, mobile phone use (where permitted) and email — sometimes called "IFEC" (In-Flight Entertainment and Connectivity). Providers deliver in-flight broadband via satellite-based or air-to-ground cellular solutions. Some airlines integrate satellite telephones (usually unable to receive incoming calls), and some systems allow passenger-to-passenger calls by keying in a seat number. **Wi-Fi** connectivity is provided via satellite or air-to-ground networks; on the A380, passengers can connect to the internet via individual IFE units or laptops via in-flight Wi-Fi. Mobile phone use while airborne is generally prohibited by carriers and regulators (e.g. FAA/FCC), though some carriers now permit it on selected routes using dedicated onboard systems.

### IFE System

The IFE supplies audio, video, data and interactive functions (games, gambling, on-board shopping, internet), distributed via the cabin distribution network, and may give telephone/data network access via an optional satellite communications link. The IFE system contains the **IFE Centre (IFEC)**, the **Cabin Distribution Network (CDN)**, and passenger in-seat equipment; the IFE control panel is in the **Remote Control Centre (RCC)**. The IFEC connects to the RCC, the FAPs, the CDN, and (through the CDN) passenger in-seat equipment, wall-mounted displays, and Wireless Access Points (WAP).

**Component locations (A380 example)**: the RCC is at the attendant station near a door; wall-mounted displays and in-seat equipment are in the cabin; the IFEC is in the pressurized area rear of the cargo compartment. IFE controls are located in the cockpit, on the FAPs, and via the RCC.

### IFE Components

**Cabin Work Station (CWS)**: fully customizable, the main working area of the purser; the FAP is installed into the CWS, giving cabin crew a centralized location for CIDS, PRAM, IFE, logbook, e-mail, passenger profile and electronic documentation. More than one CWS may be installed. CWS items include: IFE control panels, a Credit Card Reader (scans crew ID badges), a data loader plug, an IFE handset (air-to-ground calls), an **In-Seat Power Converter (ISPC)** (converts 115 VAC/1400 Hz aircraft power to 110 VAC 50/60 Hz for the AC outlet), a System Setup Box, an On-Board Media Loader (CD/DVD), a PED power switch, a DVD player, a keyboard, a CWS main power switch, Passenger SYS switches (shut down power to the entire IFE system), and a Media Encoder.

**Remote Control Centers (RCCs)**: additional IFE control panels, fully customized, interfacing with Area Distribution Boxes (ADBs); unlike the CWS, RCCs contain no audio/video media sources. RCC equipment includes an IFE control panel, an On-Board Media Loader, a Credit Card Reader, a keyboard, an RCC main power switch (does **not** shut down the whole IFE system), a Passenger SYS switch, and RCC circuit breakers.

**In-Flight Entertainment Centre (IFEC)**: installed in the Avionics Bay, hosting the majority of the IFE system's head-end electronics — the source for audio, video, data and interactive functions. It includes duplicated components for redundancy, and hosts audio/video encoders, media storage units, Ethernet switches, servers, and telephone functions. It controls/monitors the whole IFE system and interfaces with the Cabin Network and aircraft systems.

### Cabin Distribution

- **Area Distribution Boxes (ADBs)**: installed in the ceiling in a single line along the aircraft centerline (up to 12 on the A380); supply network, interactive, passenger service, and database data to Seat Electronic Boxes (SEBs), communicating via fiber optic and Ethernet buses, acting as a network switch.
- **Floor Disconnect Boxes (FDBs)**: installed under the floor panels; supply audio, video, data, telephone and service data from ADBs to SEBs. **Each FDB can control up to 20 SEBs** (Airbus).
- **Seat Electronics Boxes (SEBs)**: mounted under the seat; supply network data and digital video/audio distribution for passengers and Seat Display Units. **Each SEB can control up to 4 SDUs** (Airbus).

### Seat Equipment

- **Seat Display Unit (SDU)**: touch-screen unit displaying video selections; on-demand services via Ethernet are routed through the SEB and decoded in the SDU. Has external USB ports and an Ethernet port (RJ45) for passenger laptops.
- **Handset Passenger Control Unit (PCU)**: the main passenger interface with the IFE system, which may include telephone, keyboard, and game controller functionality, plus Passenger Service System (PSS) controls.
- **In-Seat Power Converter (ISPC) and AC Outlet Unit (ACOU)**: the ISPC converts **115 VAC 380-800 Hz to 110 VAC 60 Hz** for passenger devices (e.g. laptops); the ACOU is the passenger-accessible socket.

### Overhead Equipment

- **Tapping Unit (TU)**: installed in the ceiling, receives Ethernet signals and decodes them into video format for overhead monitors; each TU can control several overhead monitors.
- **Wall Mount and Retract Display Units (DUs)**: display overhead video entertainment received from the TU.

### Functions and Interfaces

Passenger-requested audio/video files from the SDU/PCU go to the IFEC via the cabin network, which sends files back via ADBs, FDBs and SEBs. Broadcast video/audio uses DVD in the CWS or IFEC audio/video files. Interactive function requests travel through SEB, FDB, ADB to the IFEC, which returns the software by reversing the path (the SEB verifies correct software receipt); email/internet access is via the NSS connection.

Telephone signals: seat-to-ground calls go from the PCU through the cabin network to the IFEC, which sends the data to the ground via **SATCOM**; seat-to-seat calls are routed by the IFEC between PCUs.

When a **PA is activated from the CIDS**, it overrides other passenger audio/video selection — encoded in the IFEC, sent to the cabin network, decoded in the SDU, and sent to the headset. When video/audio PA is activated from the IFEC, audio is sent to SDUs (and decoded to headset and CIDS loudspeakers) and video is sent to TUs and SDUs via the cabin network.

The **Passenger Video Information System (PVIS)**, or 'Moving Map,' gives high-resolution satellite images of the earth's surface; flight map data is stored in the IFEC, which receives aircraft parameters (airspeed, position) via the NSS connection, distributed to SDUs and DUs via the cabin network.

The **Passenger Service System (PSS)** gives reading light and attendant call control to passengers, controlled from the PCU via the cabin network, the IFEC and the CIDS.

**Cameras**: the IFEC receives video signals from camera systems and encodes them for broadcast to overhead and in-seat monitors, like other video sources.

**IFEC interfaces** include: an ARINC 429 bus with CIDS (Layout of Passenger Address data — cabin layout comparison, zoning, passenger call status synchronization); discrete signals with CIDS (e.g. cabin decompression); an Ethernet bus with the NSS (email/internet, optional live TV); an Ethernet bus with NSS-diode (aircraft data — airspeed, position); and optical fiber cable with ADBs (data distribution to overhead equipment).

**IFE Stand-By Mode**: activated on the IFE control panel by cabin crew, switching off all entertainment functions except PA override and PSS functions, and retracting overhead video monitors; may also switch off PEDs. The IFE system automatically switches to Stand-By Mode in case of cabin decompression.

### System Power

Main power distribution components: **Secondary Power Distribution Boxes (SPDB)**, **Solid-State Power Controllers (SSPC)** (installed inside SPDBs), and **Power Floor Disconnect Boxes (PFDB)** (supply power within the cabin). SSPCs are controlled from the FAPs, letting cabin personnel disable power to parts of the IFE System while retaining functionality elsewhere. The whole IFE System's power can also be shut down via the Passenger SYS switch (CWS, RCC, or cockpit, via discrete links to the SPDBs). The PED power switch shuts off the ISPC (via ADCN and discrete signals) to remove power to passengers' PEDs.

## Cabin Monitoring System

The cabin monitoring system has two optional sub-subsystems: the **Cabin Video Monitoring System (CVMS)** and the **Cockpit Door Surveillance System (CDSS)**.

- **CVMS**: helps cabin and cockpit crew monitor cabin areas. The FAP (cabin) and the Control and Display System (CDS, cockpit) show the data. Each Area Distribution Unit (ADU) connects to a number of camera/microphone assemblies. ADU 1 interfaces with the FAP and, through the Concentrator Multiplexer for Video (CMV), to the CDS/System Display (SD). Controls: the FAP and the ECAM Control Panel (ECP).
- **CDSS**: helps flight crew identify a person in front of the cockpit door, using infrared cameras connected to ADU 1; images are shown on the CDS. ADU 1 interfaces with the CMV, which interfaces with the CDS and, through the ADCN, the Cockpit Door Locking System (CDLS). The ECP controls access to CDSS video, shown on the CDS/SD.

## Landscape Camera System

The optional Landscape Camera System (LCS) provides passengers with high-quality exterior landscape images. It consists of a single module with one control unit and up to **two colour cameras**: one installed in the nose section (unpressurized area) for a down view, and optionally a second for a forward view. It is controlled by a "LANDSCAPE CAMERA" pushbutton on the cockpit overhead panel, and can optionally be deactivated based on flight/ground status (received from the IFE Centre via RS485). The optional External and Taxiing Camera System (ETACS) switch can inhibit display of outside video images for security reasons.

The landscape camera module interfaces with the IFEC via: an **Ethernet bus** (digital video transmission to seat display units/overhead monitors), an **RS485 bus** (camera control, BITE data, software loading), and **three analogue video signals** (FWD, DWN, MIX — used as backup when the Ethernet bus is installed).
        $cnt2$,
        22
    ) RETURNING id INTO s21_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M13.20 Integrated Modular Avionics (17 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s20_id, 'What caused ARINC 429 to become, in the textbook''s words, "the victim of its own success"?',
     '[{"id":"a","text":"The amount of digital information exchanged by LRUs grew beyond ARINC 429''s carrying capability","correct":true},{"id":"b","text":"It was replaced by MIL-STD-1553 on all commercial aircraft","correct":false},{"id":"c","text":"Its transmission rate exceeded what modern LRUs could process","correct":false}]',
     '{"B2"}'),

    (s20_id, 'Which aircraft type began the move from federated avionics toward an Integrated Modular Architecture with the AIMS Cabinet?',
     '[{"id":"a","text":"Boeing 767","correct":false},{"id":"b","text":"Boeing 777","correct":true},{"id":"c","text":"Airbus A320","correct":false}]',
     '{"B2"}'),

    (s20_id, 'AFDX (Avionics Full-Duplex Switched Ethernet) is one implementation of deterministic Ethernet defined by:',
     '[{"id":"a","text":"ARINC Specification 664 Part 7","correct":true},{"id":"b","text":"ARINC Specification 429 Part 2","correct":false},{"id":"c","text":"IEEE 802.11 wireless standard","correct":false}]',
     '{"B2"}'),

    (s20_id, 'AFDX was originally developed by Airbus for which aircraft, initially to address real-time issues for fly-by-wire system development?',
     '[{"id":"a","text":"A320","correct":false},{"id":"b","text":"A380","correct":true},{"id":"c","text":"A350","correct":false}]',
     '{"B2"}'),

    (s20_id, 'To improve reliability, the AFDX standard requires each AFDX channel to be:',
     '[{"id":"a","text":"A single high-bandwidth channel with no redundancy","correct":false},{"id":"b","text":"A dual redundant channel, transmitting the same data stream simultaneously on two channels","correct":true},{"id":"c","text":"Triplicated across three independent networks","correct":false}]',
     '{"B2"}'),

    (s20_id, 'A reliable, deterministic Aircraft Data Network (ADN) is expected to achieve a Bit Error Ratio (BER) as low as approximately:',
     '[{"id":"a","text":"10⁻¹² (one error bit in a trillion)","correct":true},{"id":"b","text":"10⁻³ (one error bit in a thousand)","correct":false},{"id":"c","text":"10⁻⁶ (one error bit in a million)","correct":false}]',
     '{"B2"}'),

    (s20_id, 'Unlike a traditional Ethernet switch, which switches frames based on the Ethernet destination (MAC) address, an AFDX switch routes packets using:',
     '[{"id":"a","text":"A Virtual Link ID","correct":true},{"id":"b","text":"The IP source address only","correct":false},{"id":"c","text":"A random round-robin selection","correct":false}]',
     '{"B2"}'),

    (s20_id, 'The Bandwidth Allocation Gap (BAG) of a Virtual Link specifies:',
     '[{"id":"a","text":"The maximum number of destination end-systems allowed","correct":false},{"id":"b","text":"The minimum time between two transmissions of a frame for that Virtual Link","correct":true},{"id":"c","text":"The physical distance permitted between switches","correct":false}]',
     '{"B2"}'),

    (s20_id, 'In the Airbus IMA model, the seven types of Core Processing Input/Output Module (CPIOM) are identified by:',
     '[{"id":"a","text":"Letters A to G","correct":true},{"id":"b","text":"Numbers 1 to 7","correct":false},{"id":"c","text":"Roman numerals I to VII","correct":false}]',
     '{"B2"}'),

    (s20_id, 'Which CPIOM type hosts the Engine Bleed Air System (EBAS), OverHeat Detection System (OHDS) and Pneumatic Distribution System (PADS)?',
     '[{"id":"a","text":"CPIOM-A","correct":true},{"id":"b","text":"CPIOM-F","correct":false},{"id":"c","text":"CPIOM-G","correct":false}]',
     '{"B2"}'),

    (s20_id, 'A CPIOM''s Central Processing Unit (CPU) board supports which additional board that lets the CPIOM exchange data with the ADCN?',
     '[{"id":"a","text":"An AFDX End-System board","correct":true},{"id":"b","text":"A CAN controller board","correct":false},{"id":"c","text":"An ARINC 429 transmitter board","correct":false}]',
     '{"B2"}'),

    (s20_id, 'On the Airbus A380, the CAN bus was deployed mainly to:',
     '[{"id":"a","text":"Replace all ARINC 429 buses on the aircraft","correct":false},{"id":"b","text":"Reduce the number of interconnecting wires from flight-deck control panels to avionics-compartment computers","correct":true},{"id":"c","text":"Provide the primary flight control data bus","correct":false}]',
     '{"B2"}'),

    (s20_id, 'The CAN bus data rate of up to 1 Mb/sec applies to cable lengths of:',
     '[{"id":"a","text":"Less than 40 meters","correct":true},{"id":"b","text":"Up to 500 meters","correct":false},{"id":"c","text":"Any length, unlimited","correct":false}]',
     '{"B2"}'),

    (s20_id, 'On the Airbus A380, an LRU that exchanges messages with ADCN subscribers must use both "mirror" IOMs. What is the benefit of this arrangement?',
     '[{"id":"a","text":"It doubles the maximum data transfer rate available to the LRU","correct":false},{"id":"b","text":"In case of a single IOM loss, communication between the LRU and the ADCN subscriber is not lost","correct":true},{"id":"c","text":"It eliminates the need for the LRU to have its own AFDX end-system","correct":false}]',
     '{"B2"}'),

    (s20_id, 'According to the Master Minimum Equipment List (MMEL), what is the dispatch status for the loss of multiple "mirror" IOMs?',
     '[{"id":"a","text":"GO with a specified rectification interval","correct":false},{"id":"b","text":"NO GO, since there is a functional effect on aircraft systems","correct":true},{"id":"c","text":"No MMEL entry exists for this failure","correct":false}]',
     '{"B2"}'),

    (s20_id, 'In case of total ADCN network failure, all essential data transmission is backed up using:',
     '[{"id":"a","text":"MIL-STD-1553 data bus systems","correct":false},{"id":"b","text":"ARINC 429 data bus systems","correct":true},{"id":"c","text":"Satellite communication links only","correct":false}]',
     '{"B2"}'),

    (s20_id, 'What is the role of a Common Remote Data Concentrator (CRDC)?',
     '[{"id":"a","text":"It collects, converts and exchanges data between the ADCN and LRUs that do not have AFDX technology","correct":true},{"id":"b","text":"It stores flight recorder data for maintenance download","correct":false},{"id":"c","text":"It generates the 28 VDC power supply for the CPIOMs","correct":false}]',
     '{"B2"}'),

    (s20_id, 'In the Fuel Measurement and Management System (FMMS) example on the Airbus A380, what triggers a switchover of control from the primary fuel system lane to the standby lane?',
     '[{"id":"a","text":"The health of the primary lane, assessed by BITE software in the MON channel, deteriorates below that of the standby lane","correct":true},{"id":"b","text":"The aircraft descends below 10,000 ft","correct":false},{"id":"c","text":"The Integrated Refuel Panel (IRP) is disconnected","correct":false}]',
     '{"B2"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M13.21 Cabin Systems (17 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s21_id, 'The cabin system is comprised of which three sub-systems?',
     '[{"id":"a","text":"The cabin core system, the In-Flight Entertainment System, and the cabin monitoring system","correct":true},{"id":"b","text":"The flight management system, the cabin core system, and the fire protection system","correct":false},{"id":"c","text":"The IFE system, the electrical system, and the hydraulic system","correct":false}]',
     '{"B2"}'),

    (s21_id, 'According to the module''s definitions, which of the following is explicitly excluded from the cabin monitoring system?',
     '[{"id":"a","text":"Surveillance cameras used to monitor the cabin area","correct":false},{"id":"b","text":"External anti-hijack devices and external video monitoring","correct":true},{"id":"c","text":"Monitors used to display cabin camera images","correct":false}]',
     '{"B2"}'),

    (s21_id, 'Within the Cabin Intercommunication Data System (CIDS), which components are the central controllers, with one active and the other(s) in hot standby?',
     '[{"id":"a","text":"The Decoder/Encoder Units (DEUs)","correct":false},{"id":"b","text":"The CIDS Directors","correct":true},{"id":"c","text":"The Multi-Purpose Flight Attendant Panels (MP FAPs)","correct":false}]',
     '{"B2"}'),

    (s21_id, 'On the Airbus A380 example given, the CIDS Directors are physically located in the:',
     '[{"id":"a","text":"Avionics compartment","correct":true},{"id":"b","text":"Aft cargo compartment","correct":false},{"id":"c","text":"Cabin ceiling above the aisles","correct":false}]',
     '{"B2"}'),

    (s21_id, 'On the A380 example, the Multi-Purpose Flight Attendant Panel (MP FAP) count can be increased up to:',
     '[{"id":"a","text":"4 MP FAPs","correct":false},{"id":"b","text":"10 MP FAPs","correct":true},{"id":"c","text":"20 MP FAPs","correct":false}]',
     '{"B2"}'),

    (s21_id, 'Decoder/Encoder Units Type A (DEU A) are used to control:',
     '[{"id":"a","text":"Cabin crew related equipment such as Area Call Panels and handsets","correct":false},{"id":"b","text":"Cabin lighting and Passenger Service Unit (PSU) functions (individual lighting, signs, calls, loudspeakers)","correct":true},{"id":"c","text":"The Cabin Video Monitoring System cameras only","correct":false}]',
     '{"B2"}'),

    (s21_id, 'On an Attendant Indication Panel (AIP), what does the red indicator light signify?',
     '[{"id":"a","text":"Communication information, such as an interphone call","correct":false},{"id":"b","text":"System and emergency information","correct":true},{"id":"c","text":"That the panel has lost power","correct":false}]',
     '{"B2"}'),

    (s21_id, 'The Cabin Assignment Module (CAM) is best described as:',
     '[{"id":"a","text":"A plug-in memory cartridge, installed in the FAP, containing the cabin layout definition and airline-specific data","correct":true},{"id":"b","text":"A backup battery pack for the CIDS Directors","correct":false},{"id":"c","text":"The main IFE video server","correct":false}]',
     '{"B2"}'),

    (s21_id, 'What is the typical highest-priority source for a Passenger Address (PA) announcement?',
     '[{"id":"a","text":"In-Flight Entertainment (IFE)","correct":false},{"id":"b","text":"Cockpit acoustic devices","correct":true},{"id":"c","text":"Pre-recorded announcements","correct":false}]',
     '{"B2"}'),

    (s21_id, 'The service interphone system is automatically made available when:',
     '[{"id":"a","text":"The Nose Landing Gear compressed signal is received, or the landing gear is not compressed and external power is used","correct":true},{"id":"b","text":"The aircraft climbs above 10,000 ft","correct":false},{"id":"c","text":"The cabin crew manually enable it from the MP FAP at every flight","correct":false}]',
     '{"B2"}'),

    (s21_id, 'The loudspeaker level adjustment function on the MP FAP allows announcement and chime volume to be modified within a range of:',
     '[{"id":"a","text":"-4dB to +6dB, in steps of 2dB","correct":true},{"id":"b","text":"-20dB to +20dB, in steps of 5dB","correct":false},{"id":"c","text":"0dB to +10dB, in steps of 1dB","correct":false}]',
     '{"B2"}'),

    (s21_id, 'When the EVAC switch is in the CAPT position:',
     '[{"id":"a","text":"Only the cockpit crew can activate the EVAC command","correct":true},{"id":"b","text":"Only the purser can activate the EVAC command","correct":false},{"id":"c","text":"Any cabin crew member can activate the EVAC command directly","correct":false}]',
     '{"B2"}'),

    (s21_id, 'When the FSB (Fasten Seat Belt) control switch is in the AUTO position, the signs typically switch on when:',
     '[{"id":"a","text":"The cabin temperature drops below a set threshold","correct":false},{"id":"b","text":"The nose landing gear is down and locked, or slats are extended and an engine is running","correct":true},{"id":"c","text":"The IFE system enters Stand-By mode","correct":false}]',
     '{"B2"}'),

    (s21_id, 'In case of cabin decompression, which passenger signs are switched on regardless of the cockpit switch positions?',
     '[{"id":"a","text":"NS, FSB and EXIT signs","correct":true},{"id":"b","text":"Only the RTS sign","correct":false},{"id":"c","text":"Only the No-PED sign","correct":false}]',
     '{"B2"}'),

    (s21_id, 'In the IFE cabin distribution hierarchy, each Floor Disconnect Box (FDB) can control up to how many Seat Electronics Boxes (SEBs), and each SEB up to how many Seat Display Units (SDUs), per the Airbus example given?',
     '[{"id":"a","text":"Up to 20 SEBs per FDB, and up to 4 SDUs per SEB","correct":true},{"id":"b","text":"Up to 4 SEBs per FDB, and up to 20 SDUs per SEB","correct":false},{"id":"c","text":"Up to 12 SEBs per FDB, and up to 1 SDU per SEB","correct":false}]',
     '{"B2"}'),

    (s21_id, 'The In-Seat Power Converter (ISPC) converts aircraft power for passenger use as follows:',
     '[{"id":"a","text":"115 VAC 380-800 Hz to 110 VAC 60 Hz","correct":true},{"id":"b","text":"28 VDC to 400 Hz three-phase AC","correct":false},{"id":"c","text":"110 VAC 60 Hz to 115 VAC 400 Hz","correct":false}]',
     '{"B2"}'),

    (s21_id, 'The Cabin Monitoring System comprises which two optional sub-subsystems?',
     '[{"id":"a","text":"The Cabin Video Monitoring System (CVMS) and the Cockpit Door Surveillance System (CDSS)","correct":true},{"id":"b","text":"The Landscape Camera System and the External Taxiing Camera System","correct":false},{"id":"c","text":"The Passenger Video Information System and the Passenger Service System","correct":false}]',
     '{"B2"}');

END $$;
