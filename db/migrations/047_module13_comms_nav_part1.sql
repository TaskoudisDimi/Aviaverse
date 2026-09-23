-- Module 13: Aircraft Aerodynamics (B2) — Communication and Navigation Systems (Part 1) (ATA 23/34)
-- Source: EASA Part-66 Module 13 official textbook (IKAROS Aviation Training Centre, IK M13, Issue Oct.2012)
-- This subject is B2-ONLY. Covers: radio wave theory/propagation, modulation, transmission lines/antennas,
-- radio set fundamentals, precipitation static/bonding, VHF/HF communication systems, SELCAL, SATCOM,
-- ACARS, and the audio integrating system.

DO $$
DECLARE
    m13_id INT;
    s1_id  INT;
BEGIN
    SELECT id INTO m13_id FROM easa_modules WHERE code = 'M13';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M13.4A') THEN
        RAISE NOTICE 'M13.4A already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 13.4A: Communication and Navigation Systems (Part 1)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m13_id, 'M13.4A', 'Communication and Navigation Systems (Part 1)',
        $cnt$
# Communication and Navigation Systems (Part 1)

## Introduction

This is the first part of the Communication/Navigation chapter (ATA 23/34). It covers the fundamentals of radio waves, propagation, modulation, transmission lines and antennas, basic radio set theory, precipitation static, and the principal aircraft communication systems: VHF, HF, SELCAL, SATCOM, ACARS and the audio integrating system.

## Radio Waves and Antennas

When a high-frequency AC signal is placed on an antenna, two fields exist: electric fields (**E fields**) and magnetic fields (**H fields**). When the AC changes fast enough, the fields do not entirely collapse before the next buildup occurs, and some of the energy is radiated into space as an electromagnetic (radio) wave. This wave has an electric component and a magnetic component, at right angles to each other, and both at right angles to the direction of propagation.

A radio wave leaves the transmitter antenna and travels through space at the **speed of light, 300,000,000 metres per second**.

### Antenna Characteristics

Three characteristics of an antenna are critical: its **length**, **polarization**, and **directivity**.

- For maximum efficiency, an antenna's length must be **one-half the wavelength** of the signal being transmitted or received — this allows the antenna current to be maximum.
- **Polarization**: when the transmitting antenna is vertical, its electric field is vertical (vertically polarized) and is best picked up by a vertical antenna; when horizontal, the radiation is horizontally polarized and best received on a horizontal antenna. Most **LF, MF and HF** communication uses **horizontally polarized** antennas, while **higher-frequency systems use vertically polarized** antennas.

### Antenna Types and Directivity

- **Dipole antenna** — transmits its signal strongest in a direction perpendicular to its length.
- **Vertical whip antenna** — has uniform field strength in all directions; called an **omnidirectional** antenna.
- **Loop antenna** — highly directional; its strength is sharply reduced in the direction perpendicular to its plane.

### Oscillators

Alternating current is produced with oscillators. For electronic oscillation to occur, two conditions must be met: **amplification** and **feedback in the correct phase** from the output back into the input. A coil and capacitor connected in parallel form a resonant circuit with a resonant frequency depending on the capacitance and inductance. The processes inside an L-C circuit are comparable to a pendulum: energy oscillates periodically between the electric field of the capacitor (potential energy) and the magnetic field of the coil (kinetic energy). An antenna itself is comparable to an open (straightened) resonant circuit.

### Frequency, Period and Wavelength

- **Frequency (f)**: the number of complete cycles of a recurring event in one unit of time.
- **Period (T)**: the time needed for one complete cycle of oscillation; inversely related to frequency.
- **Wavelength (λ)**: the distance between a peak (or trough) of a wave and the corresponding peak (or trough) in the next cycle.

The higher the frequency, the shorter the wavelength.

## Radio Wave Propagation

When a radio wave leaves an antenna it travels out along three paths, depending mainly on frequency: **surface (ground) waves**, **sky waves**, and **space waves**.

- **Ground waves** — the portion of the wave that travels along the surface of the Earth, mainly influenced by the conductivity of the surface. Lower frequencies (VLF, LF, MF) normally follow the curvature of the Earth as ground waves, used for very long-distance communication/navigation. Ground wave range depends on transmitter power, frequency, and surface conductivity.
- **Sky waves** — the portion of the wave radiated into space; HF communication and night-time commercial broadcast are carried primarily by sky waves, which bounce off the **ionosphere** and return to Earth at a distance from the transmitter (the "skip distance"), which varies and causes fading.
- **Space waves** — frequencies in the VHF band and higher travel in a straight line from transmitting to receiving antenna ("line of sight").

### The Ionosphere

The ionosphere consists of one or more layers of ionized/conducting air enveloping the globe at a distance of roughly **100 to 400 km** from the Earth's surface (ultraviolet radiation from the sun provides these conductive layers at an altitude between 75 and 400 km). Its effect on radio waves varies with frequency:

- **Lower frequencies (LF, MF)** are almost completely **absorbed** by the ionosphere — only their ground waves are usable for communication/navigation.
- **Higher frequency** waves are less absorbed and "bend" back to Earth depending on frequency and the thickness of the ionosphere layers.
- As frequency increases toward **VHF**, the reduced absorption is coupled with a reduced ability of the ionosphere to bend the wave back — eventually the wave is not bent back to Earth but keeps travelling into space.
- Reflection also depends on the **angle of penetration**: too wide an angle and the wave goes through the ionosphere into space; a smaller angle of penetration allows reflection back to Earth.

### Propagation Characteristics by Frequency Range

**VHF / UHF / SHF** — line-of-sight propagation; not reflected by the ionosphere and practically not interfered with by ionospheric or atmospheric storms; best suited for aeronautical communication and navigation over short/medium distances. The ground-to-air VHF communication range depends on aircraft altitude and can be calculated approximately as:

**Range (NM) = 1.23 × √(aircraft altitude in feet)**

This gives a theoretical communication range of about **220 NM** for an aircraft at **33,000 feet**, and in actual practice up to **350 NM**. VHF is the primary aeronautical communication band and is also used for radio navigation by ILS and VOR. UHF and SHF are mainly used for satellite communication and radar systems (ATC radar, transponder, TCAS, DME, weather radar).

**HF (short wave)** — reflected by the ionosphere, enabling communication over very long distances; the HF ground wave propagation range is very small and has no practical value. Because the ionosphere is an unstable reflector, HF communications are very much affected by ionospheric and atmospheric storms, interference and fading.

**MF (medium frequency)** — sky waves are reflected by the lower layer of the ionosphere; ground waves propagate a few hundred kilometres over the Earth's surface, filling the "no reception gap" left by the sky waves. MF is subject to interference, fading, and is very sensitive to atmospheric storms.

**LF (low frequency)** — ground waves extend to a few thousand kilometres; beyond a certain distance, interference between ground and sky waves renders reception practically impossible.

### Field Strength, Reflection, Refraction and Diffraction

- **Field strength** of radio waves decreases proportionally to the **square of the distance** from the transmitting antenna, because the wave spreads over larger and larger areas.
- **Reflection** — radio waves are reflected from conducting surfaces, similar to light reflecting off glass.
- **Refraction** — when radio waves travel through/over a medium of different conductivity, their path is bent (refracted); the boundary between two media is not always abrupt, so the path curves gradually depending on the rate of change of conductivity.
- **Coastal effect** — radio waves travelling overland that suddenly cross a coastline are bent abruptly because water has higher conductivity than land; important in radio navigation.
- **Diffraction** — the bending of lower-frequency radio waves around the edge of an obstacle (e.g. a mountain top); diffraction lessens with increasing frequency.

### Interference and Fading

When direct and reflected radio waves reach a receiver antenna simultaneously, the resulting signal depends on the phase relationship between them:

- **In phase**: signal strengths add — a clear, strong signal is received.
- **90° phase difference**: signal strength is average, but readability is very poor because the waves interfere with each other.
- **180° phase difference (phase opposition)**: the waves cancel each other, resulting in a weak signal.

**Fading** occurs when sky waves suddenly disappear due to a great increase in ionospheric absorption caused by a burst of ionization radiation from a solar eruption. A fadeout is usually complete within less than a minute and may last from a few minutes to several hours. **Ionospheric storms** (caused by solar activity disturbing the Earth's magnetic field) disrupt the normal ionosphere layer pattern; their disturbing effect on sky wave communication is greatest near the polar regions and becomes negligible at the equator.

## Modulation

The carrier wave generated by the transmitter carries the information (intelligence) from transmitter to receiver; the process of placing intelligence onto a carrier is called **modulation**. Three methods most often used in aviation communication equipment are **amplitude modulation (AM)**, **frequency modulation (FM)**, and **single-sideband (SSB)**.

### Amplitude Modulation (AM)

AM is a method in which the **voltage (amplitude)** of the carrier is changed by the audio or data signal.

### Frequency Modulation (FM)

FM changes the **frequency** of the carrier according to the audio signal, while the amplitude is held constant by limiter circuits — any interference that amplitude-modulates the carrier is clipped off. FM can be used to obtain interference-free communication or navigation applications, since man-made and natural interference tend to amplitude-modulate radio signals.

### Single-Sideband (SSB)

Both AM and FM require a wide band of frequencies for transmission. An AM signal contains the carrier, a **lower sideband** (carrier frequency minus modulating frequency) and an **upper sideband** (carrier frequency plus modulating frequency). Since all the necessary information is carried in either sideband alone, SSB removes the carrier and one sideband, using all available transmitter energy for the remaining sideband.

- Aircraft shortwave (**HF**) radio communication uses the **upper sideband (USB)**. The lower sideband (LSB) is used by other services and radio amateurs.

**Advantages of SSB:**
- Higher range with less transmitter power
- More radio stations may share a frequency band
- Less reception noise due to smaller receiver bandwidth
- Less fading — no carrier is cancelled at the ionosphere

**Disadvantage:** SSB receiver circuits are more complex and expensive, because the missing carrier must be reinserted from a very accurate local oscillator inside the receiver.

### Pulse Modulation

Instead of transmitting information continuously, the data signal is periodically sampled. Forms include: **Pulse Amplitude Modulation (PAM)**, **Pulse Width Modulation (PWM)**, **Pulse Phase Modulation (PPM)**, and **Pulse Code Modulation (PCM)**. Time Division Multiplex (TDM) is used to send different information over the same line by sampling each channel for a short period of time.

## Transmission Lines and Antennas

### Coaxial Cable

Antenna cable (coaxial cable, "coax") has a central conductor, surrounded by insulating material, then a braided metal shield, encased in a protective plastic coating. Coax has a specified characteristic impedance that must be matched to the antenna and the transmitter/receiver — normally **50 ohms**. Coax should not be bent to too tight a radius (generally not smaller than three inches, or eight inches for certain cable types) and must not be allowed to overheat.

### Conductors for Radio Waves

There are three main types of transmission line:

- **Coaxial line** — the most common type.
- **Open-wire (parallel conductor) lines** — e.g. 300-ohm TV ribbon line; lower losses in simple multiband antenna systems, but not used in aircraft.
- **Waveguides** — a hollow, conducting tube that confines electromagnetic energy via skin effect on its inner walls rather than carrying current like a two-conductor line; used for **weather radar** systems (approximately **9.375 GHz**).

### Characteristic Impedance, Matching and SWR

A perfectly lossless transmission line can be represented by inductors and capacitors connected along its length. Its **characteristic impedance (Z₀)** equals the square root of L/C (inductance and capacitance per unit length). A line terminated with a resistance equal to its characteristic impedance is **matched** — all power is absorbed in the load. A **mismatched** line produces a reflected wave that combines with the forward wave to form a **standing wave**. The amount of reflection depends on the difference between the load impedance and the line's characteristic impedance. In a mismatched line, the ratio of reflected to forward voltage at a point is the voltage reflection coefficient, from which the **Voltage Standing Wave Ratio (VSWR)** is derived. In VHF systems, a VSWR meter shows forward and reflected voltage during transmit; a ratio of more than **2** indicates a problem in the antenna circuit.

### Antenna Installation and Maintenance

Radio antennas are typically located on the exterior of the aircraft, or near the exterior under a nonconductive cover. Exterior-mounted antennas are either **blade (rigid)** or **whip (flexible)** type; **flush-mounted** antennas are located within the aircraft's outer cover and produce less drag. The leading edge of blade-type antennas often deteriorates rapidly on high-speed aircraft and requires particular inspection attention. Antenna seals/gaskets must be inspected to prevent moisture ingress and corrosion. Radar antennas are housed in a nonconductive cover called a **radome**, which must be inspected for cracks and proper seal to the airframe.

## Radio Set Fundamentals

### Transmitter and Receiver

A basic transmitter uses a crystal-controlled oscillator to produce an accurate alternating current in the radio frequency (RF) range (above approximately **100 kHz**). The intelligence to be transmitted is converted into an audio frequency (AF) signal by the microphone, which modulates the carrier; the modulated carrier is amplified and radiated by the antenna.

A basic receiver picks up the weak signal with its antenna, amplifies it, and rectifies (demodulates) it in a detector to recover the AF signal, which is amplified again to drive a speaker. Because the receiver antenna picks up signals from many transmitters, a receiver must filter out all but the wanted frequency — this is achieved with a **superheterodyne** circuit.

### Superheterodyne Receiver

A tunable local oscillator produces a frequency offset from the frequency to which the preamplifier is tuned. The preamplifier signal and local oscillator signal are combined in a **mixer**, which produces signals at the sum and the difference of the two frequencies. The **intermediate frequency (IF)** is: **IF = RF ± f₀** (Radio Frequency ± Oscillator Frequency). For example, a broadcast receiver tuned to 1,200 kHz with a local oscillator 455 kHz higher (1,655 kHz) produces a mixer output including a 455 kHz difference signal, which is amplified by a narrow-band IF amplifier tuned to 455 kHz and then demodulated. In the aircraft VHF communication receiver example described, the local oscillator produces a frequency **10.8 MHz** different from the tuned frequency, giving a **10.8 MHz** intermediate frequency.

### AGC and Squelch

- **Automatic Gain Control (AGC)** — feeds back part of the detector output into the IF amplifier to hold the output constant as input signal strength varies: it increases amplification when the signal is weak and reduces it when the signal is strong.
- **Squelch** — attenuates the audio frequency amplifier output when no signal is being received, suppressing background hiss; as soon as a signal is received, the attenuation is removed. Adjustable squelch thresholds are provided because squelch can also suppress a weak wanted communication signal.

### Crystal (Quartz) Oscillators and Frequency Synthesis

Crystal resonators use the **piezoelectric effect**: pressure on the crystal surface causes electrical charge displacement (and voltage); conversely, an applied alternating voltage causes the crystal to oscillate mechanically. The resonant frequency is highly stable and depends on the crystal's mechanical dimensions. A quartz oscillator produces only one frequency according to its dimensions; to produce different selectable frequencies, a **Phase Locked Loop (PLL)** (frequency synthesizer) is used — a voltage-controlled oscillator's output is divided down and compared against a stable reference frequency, and the comparator adjusts the VCO voltage until the divided output matches the reference.

## Precipitation Static and Bonding

### Electrical Charging and Corona Discharge

Flying through ice particles, dry snow, dust/sand, or large raindrops causes **triboelectric charging**: electric charge is transferred at each particle impact, typically leaving the aircraft negatively charged. The developed potential difference can reach **100,000 to 200,000 volts** in a fraction of a second. As the aircraft's potential rises, electric fields become high at its extremities (wingtips, tail, sharp trailing edges), eventually ionizing the surrounding air and releasing short bursts of charge — **corona discharge/pulses**. The energy of these pulses, coupled into radio antennas, causes **precipitation static (p-static)** — heard as popping, then buzzing, then a steady roar that can mask all but the strongest radio signals. High electric fields can also develop from **induced charging** near or between electrically charged (thunder) clouds.

### Static Dischargers

**Static dischargers** are installed at the trailing edges and tips of wings, stabilizers and control surfaces to provide controlled removal of the electrical charge, replacing the uncontrolled corona discharge. A high-resistance rod in the discharger acts almost as a non-conductor at RF frequencies (so it does not further concentrate the antenna coupling field) but is a satisfactory conductor at DC (so the static field concentrates near the tip of the discharger, and discharge occurs away from the trailing edge, reducing antenna coupling). With static dischargers fitted, discharge occurs at a **lower current level and much more frequently**, producing an extremely weak magnetic field that is not picked up by the radio receiver.

### Bonding

All moving airframe surfaces (e.g. flaps, ailerons) and detachable panels must be **bonded** to the main mass of the airframe. Without bonding, a voltage difference can build up across unbonded parts, causing sparking — effectively creating a small "spark transmitter" that couples noise into the aircraft antennas.

### Streamering

Non-conductive synthetic (composite) parts of the aircraft cannot easily lose an accumulated static charge; when the potential difference reaches a certain level, the charge discharges all at once, coupling noise into the antenna system — a phenomenon called **streamering**. The solution is a special conductive paint that allows the charge to leak away; radomes are also fitted with metal diverter strips to drain static charge without disturbing radar operation.

### Atmospheric and Man-Made Noise

Besides p-static, **atmospheric noise** (thunderstorms, lightning, corona discharges) and **man-made noise** (electric motors, arcing relay contacts, electrical welding equipment, high-frequency diathermic equipment) can also mask communication and navigation signals.

## VHF Communication System

VHF is used for **short-range voice and data communication** between aircraft, or between aircraft and a ground station.

- **Frequency:** 118.000–136.975 MHz, AM; **25 kHz** channel spacing (760 channels) or **8.33 kHz** channel spacing (2,280 channels).
- **Power:** 5–25 W (typical system); one described transceiver produces a nominal output of **30 W (minimum 25 W)**.
- The **Push-To-Talk (PTT)** switch changes the system from reception (Rx) to transmission (Tx) mode.
- If there is a control panel failure **when the system is switched on**, the transceiver goes to the **emergency frequency, 121.5 MHz**. If the failure occurs **during operation**, the transceiver continues on the last operational frequency.
- The transceiver self-test operates the transmitter and receiver for about 100 milliseconds, checking VSWR and audio at a 2,000 Hz test modulation.
- **Antenna:** a vertically polarized, quarter-wavelength antenna that uses the metal of the aircraft as the other quarter-wavelength to give the required half wavelength; on fabric-covered aircraft a ground plane (aluminium foil/screen) must be provided.

## HF Communication System

HF allows **long-distance voice communication** between aircraft, or between aircraft and a ground station, since the ionosphere reflects HF radio waves back to Earth, so line of sight does not limit range.

- **Frequency:** 2–29.999 MHz (shortwave); **1 kHz** channel spacing, giving **28,000 channels**.
- **Power:** 100–400 W (general); a described transceiver (HFS 700) transmits **125 W in AM mode** and **400 W peak envelope power (PEP) in SSB mode**.
- **Modes:** AM (carrier with amplitude modulation) and SSB, transmitting only the **upper sideband (USB)**.
- The system consists of a transceiver, an **antenna coupler**, an antenna, and a control panel, linked via an ARINC 429 data bus.
- The **antenna coupler** tunes filters to match the antenna's impedance to the transmitter's 50-ohm output impedance for the selected frequency, using minimum SWR as the tuning criterion; it performs an automatic **tune-cycle** after each frequency change or on switch-on.
- Antenna coupler faults (shown by the **KEY-INTERLOCK** light) include: excessive tuning time (more than 15 seconds), excessive start positioning time (more than 15 seconds), or occurrence of an arc (from low pressurization at high altitude).
- Front-panel fault lights: **LRU FAIL** (transceiver fault), **KEY-INTERLOCK** (coupler fault), **CONTROL INPUT FAIL** (control panel fault, monitoring ARINC 429 bus activity and word validity).
- **Lightning arrestor:** a glass bowl containing a spark-gap protects older HF systems against high static voltages and lightning; if a lightning strike is too strong the glass turns black and the device must be replaced. Modern systems use **grounded antennas**, discharging lightning energy directly to the aircraft structure, requiring no separate lightning arrestor.

## SELCAL (Selective Calling)

SELCAL provides aural and visual indication of calls from ground stations, reducing pilot workload since the crew do not have to continuously monitor all communication receivers. It operates over VHF or HF systems.

- The aircraft has a specific, unique **4-letter SELCAL code**.
- Audio frequencies in the range **300–1,500 Hz** represent the 4 letters; the transmitted code has **2 periods**, each containing **2 frequencies**, giving 4 frequencies total for the 4 letters.
- The **SELCAL decoder** compares the received code with the code set on the SELCAL code panel; a match triggers a **buzzer** and an amber **"CALL"** light in the cockpit.
- Pressing **RESET** cancels the aural and visual indications.

## Satellite Communication (SATCOM)

The Multichannel Aviation Satellite Communication System (MCS SATCOM) provides worldwide voice and data communication. The system consists of the **Space Segment** (satellite), the **Ground Earth Station (GES)** network, and the **Aircraft Earth Station (AES)**. Two space segment providers are named: **INMARSAT** (International Maritime Satellite Organisation) and the **American Mobile Satellite Consortium (AMSC)**.

- Communications satellites operate in **geostationary orbit** at approximately **36,000 km** above the equator and convert **L-band** frequencies (**1.5–1.6 GHz**, aircraft-to-satellite) to **C-band** frequencies (**4–6 GHz**, satellite-to-GES).
- Main AES components: **Satellite Data Unit (SDU)** — the main processing/control element, handling coding/decoding, protocol decisions, and antenna steering data; **Radio Frequency Unit (RFU)** — operates full duplex; **High Power Amplifier (HPA)** — amplifies L-band signals, supplying at least **40 watts** average output, adjustable over a **15 dB** range in **1 dB** increments via ARINC 429; **High Gain Antenna (HGA)** — a top-mounted, low-profile phased array of **32 radiating elements** providing at least **+12 dBic** gain with near-hemispherical coverage, steerable toward any direction except downward; **Diplexer/Low Noise Amplifier (DIP/LNA)** — filters transmit/receive signals and provides low-noise receive amplification; **Beam Steering Unit (BSU)** — receives antenna position/beam data from the SDU and points the antenna beam at the satellite.
- The SATCOM system typically has **three to six channels**: one for ACARS, one for cockpit voice, and the remainder for cabin (passenger telephone) communication.

## ACARS

The **Aircraft Communication Addressing and Reporting System (ACARS)** is a two-way digital air/ground data link network used for **maintenance, operations and commercial** purposes. It is transmitted/received via the **VHF** transceiver, or via **SATCOM** when the VHF link is unavailable.

- **ARINC** (Aeronautical Radio Incorporated) operates ACARS, dominant in the USA on **131.550 MHz**.
- **SITA** (Société Internationale de Télécommunications Aéronautiques) operates AIRCOM, covering most of the world on **131.725 MHz**.
- **Air Canada** operates its own network on **131.475 MHz**; **AVICOM** (Japan) operates on **131.450 MHz**.
- If a ground frequency channel is congested, the ground station can initiate an automatic frequency change to another channel (**Remote Tuning**).
- **Data format:** each alphabetic character is represented by 7 bits; each message packet is divided into a **34-character preamble** (address and system protocol), a **220-character message**, and a **7-character trailer** (parity and verification).
- ACARS automatically reports **OOOI** times (**O**ut, **O**ff, **O**n, **I**n — e.g. Out: doors closed/engines running/parking brake released; Off: lift-off; On: touchdown; In: at gate), used for aircraft movement and message control.
- Airborne components include the **Communication Management Unit (CMU)**, a **Multifunction Control Display Unit (MCDU)**, a printer, and the VHF/SATCOM systems. The CMU controls the VHF-3 system, which can be used for data link or voice.

## Audio Integrating System

Modern airliners have an interphone/audio system allowing crew to communicate with each other, ground crew and passengers; cockpit conversations are also recorded for accident investigation. Audio selection panels at each crew station allow selection of any VHF/HF transceiver, any navigation receiver, the interphone, or the public address system.

### Acoustic Equipment

- **Microphone** — converts sound waves into electrical signals; frequency response should be as flat as possible from below 200 Hz to above 3,500 Hz. A **noise-cancelling** microphone reduces background pickup.
  - **Dynamic** microphone: impedance of about **680 Ω**, output of about **12 mV** on voice peaks (with a preamplifier, impedance ~100 kΩ and output ~100 mV).
  - **Electret** microphone: uses a material with a trapped polarization charge; requires a polarizing voltage of about **4 V**; output level is fairly low.
- **Hand microphone** — contains a preamplifier and the PTT switch.
- **Headset** — better than a loudspeaker for understanding bad/distorted signals.
- **Boomset** — a headset combined with a microphone, leaving both hands free.
- **Oxygen mask microphone** — active as soon as the mask is taken from its stowage.
- **Cockpit loudspeaker** — muted during radio transmission or interphone operation to prevent acoustical feedback (whistling).

### Audio Selector Panel and Voice/Ident Filter

Each crew station has an **Audio (Selector) Control Panel** to select and adjust the volume of audio sources and route microphone signals to a transmitter or the interphone (mic selectors are mechanically interlocked so only one can be used at a time). The **VOICE/IDENT** switch cancels morse-code identification tones from ADF, ILS and VOR navigation receivers:

- **VOICE** position: a filter cancels the **1,020 Hz** navigation identification morse code (and DME's **1,350 Hz** identification code is disconnected), leaving only voice (weather/airport information) audible.
- **IDENT** position: both station identification and voice can be heard.

### Interphone Systems

Three interphone systems are distinguished:

- **Flight interphone** — communication among the flight deck crew, and between flight deck crew and the ground engineer (e.g. during engine start).
- **Cabin interphone** — communication among cabin crew and between cabin crew and the flight deck, via the Cabin Intercommunication Data System (CIDS).
- **Service (maintenance) interphone** — communication among maintenance personnel via plug-in jacks at various locations on the aircraft.

**Ground crew call:** a call button in the nose wheel well, when pressed, sounds a chime and illuminates a ground-crew call light on the flight deck; pressing the flight deck's ground-crew call button sounds a horn in the nose wheel well.
        $cnt$,
        4
    ) RETURNING id INTO s1_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M13.4A Communication and Navigation Systems (Part 1) (22 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s1_id, 'For an antenna to be most efficient at a given frequency, its length must be:',
     '[{"id":"a","text":"One-half the wavelength of the signal","correct":true},{"id":"b","text":"Exactly equal to the wavelength of the signal","correct":false},{"id":"c","text":"Independent of the wavelength of the signal","correct":false}]',
     '{"B2"}'),

    (s1_id, 'Frequencies in the VHF band and higher, travelling in a straight line from transmitting to receiving antenna, propagate as:',
     '[{"id":"a","text":"Ground waves","correct":false},{"id":"b","text":"Sky waves","correct":false},{"id":"c","text":"Space waves","correct":true}]',
     '{"B2"}'),

    (s1_id, 'HF communication over very long distances relies mainly on sky waves being:',
     '[{"id":"a","text":"Reflected back to Earth by the ionosphere","correct":true},{"id":"b","text":"Absorbed completely by the troposphere","correct":false},{"id":"c","text":"Guided along the Earth''s surface as ground waves","correct":false}]',
     '{"B2"}'),

    (s1_id, 'The theoretical VHF ground-to-air communication range in nautical miles can be approximated as 1.23 multiplied by:',
     '[{"id":"a","text":"The transmitter power in watts","correct":false},{"id":"b","text":"The square root of the aircraft''s altitude in feet","correct":true},{"id":"c","text":"The frequency in megahertz","correct":false}]',
     '{"B2"}'),

    (s1_id, 'The field strength (energy) of a radio wave decreases with distance from the transmitting antenna in proportion to:',
     '[{"id":"a","text":"The distance itself","correct":false},{"id":"b","text":"The square of the distance","correct":true},{"id":"c","text":"The square root of the distance","correct":false}]',
     '{"B2"}'),

    (s1_id, 'When direct and reflected radio waves arrive at a receiver antenna exactly in phase opposition (180° difference), the result is:',
     '[{"id":"a","text":"A stronger signal, because the two waves add together","correct":false},{"id":"b","text":"The two waves cancel each other, producing a weak signal","correct":true},{"id":"c","text":"No effect at all on the received signal","correct":false}]',
     '{"B2"}'),

    (s1_id, 'In amplitude modulation (AM), the intelligence signal changes which property of the carrier?',
     '[{"id":"a","text":"Its frequency","correct":false},{"id":"b","text":"Its phase only","correct":false},{"id":"c","text":"Its voltage (amplitude)","correct":true}]',
     '{"B2"}'),

    (s1_id, 'Aircraft HF (shortwave) radio communication transmits information using which type of modulation?',
     '[{"id":"a","text":"Full double-sideband AM with carrier","correct":false},{"id":"b","text":"Single-sideband, using the upper sideband (USB)","correct":true},{"id":"c","text":"Frequency modulation (FM) only","correct":false}]',
     '{"B2"}'),

    (s1_id, 'Which of the following is an advantage of single-sideband (SSB) transmission over conventional AM?',
     '[{"id":"a","text":"Higher range for a given transmitter power, since energy is not wasted on the carrier and one sideband","correct":true},{"id":"b","text":"Simpler and cheaper receiver circuitry","correct":false},{"id":"c","text":"No local oscillator is required in the receiver","correct":false}]',
     '{"B2"}'),

    (s1_id, 'The characteristic impedance of a standard aircraft coaxial antenna cable is normally:',
     '[{"id":"a","text":"50 ohms","correct":true},{"id":"b","text":"600 ohms","correct":false},{"id":"c","text":"8 ohms","correct":false}]',
     '{"B2"}'),

    (s1_id, 'On a VHF communication system, if the VSWR meter shows a ratio of reflected to forward voltage greater than approximately 2, this indicates:',
     '[{"id":"a","text":"Normal operation requiring no action","correct":false},{"id":"b","text":"A problem in the antenna circuit","correct":true},{"id":"c","text":"That the squelch threshold needs adjustment","correct":false}]',
     '{"B2"}'),

    (s1_id, 'In a superheterodyne receiver, the intermediate frequency (IF) is related to the radio frequency (RF) and the local oscillator frequency (f0) by:',
     '[{"id":"a","text":"IF = RF x f0","correct":false},{"id":"b","text":"IF = RF ± f0","correct":true},{"id":"c","text":"IF = RF / f0","correct":false}]',
     '{"B2"}'),

    (s1_id, 'Under normal charging conditions in flight, the electrostatic potential difference developed on an aircraft due to triboelectric charging can reach approximately:',
     '[{"id":"a","text":"1,000 to 2,000 volts","correct":false},{"id":"b","text":"100,000 to 200,000 volts","correct":true},{"id":"c","text":"10 to 20 volts","correct":false}]',
     '{"B2"}'),

    (s1_id, 'What is the main purpose of installing static dischargers on an aircraft''s trailing edges and wingtips?',
     '[{"id":"a","text":"To increase the aircraft''s aerodynamic lift at high angle of attack","correct":false},{"id":"b","text":"To provide controlled removal of the static electrical charge and reduce coupling into the antennas","correct":true},{"id":"c","text":"To generate the carrier signal for VHF transmissions","correct":false}]',
     '{"B2"}'),

    (s1_id, 'Why is it important that moving surfaces such as flaps and ailerons are electrically bonded to the main airframe structure?',
     '[{"id":"a","text":"To prevent arcing/sparking across unbonded parts, which can create radio noise and a fuel ignition hazard","correct":true},{"id":"b","text":"To reduce the aerodynamic drag of the control surface","correct":false},{"id":"c","text":"To increase the range of the VHF communication system","correct":false}]',
     '{"B2"}'),

    (s1_id, 'On the VHF communication system described, if the control panel fails at the moment the system is switched on, the transceiver defaults to:',
     '[{"id":"a","text":"The last frequency used before the previous shutdown","correct":false},{"id":"b","text":"The emergency frequency, 121.5 MHz","correct":true},{"id":"c","text":"A random frequency within the VHF band","correct":false}]',
     '{"B2"}'),

    (s1_id, 'The main function of the HF antenna coupler is to:',
     '[{"id":"a","text":"Generate the audio frequency signal from the microphone","correct":false},{"id":"b","text":"Tune filters to match the antenna impedance to the transmitter''s 50-ohm output for the selected frequency","correct":true},{"id":"c","text":"Decode SELCAL tones received from a ground station","correct":false}]',
     '{"B2"}'),

    (s1_id, 'The purpose of the SELCAL (Selective Calling) system is to:',
     '[{"id":"a","text":"Automatically tune the HF antenna coupler","correct":false},{"id":"b","text":"Provide aural and visual indication of a call, so the crew do not have to continuously monitor every receiver","correct":true},{"id":"c","text":"Automatically report OOOI times to the airline''s ground computer","correct":false}]',
     '{"B2"}'),

    (s1_id, 'A SATCOM system''s aircraft-to-satellite (uplink/downlink) signals typically use the:',
     '[{"id":"a","text":"L-band, approximately 1.5–1.6 GHz","correct":true},{"id":"b","text":"C-band, approximately 4–6 GHz","correct":false},{"id":"c","text":"VHF band, approximately 118–137 MHz","correct":false}]',
     '{"B2"}'),

    (s1_id, 'What does the abbreviation "OOOI," automatically reported by the ACARS system, represent?',
     '[{"id":"a","text":"On, Off, Over, In","correct":false},{"id":"b","text":"Out, Off, On, In","correct":true},{"id":"c","text":"Origin, Offset, Overhead, Inbound","correct":false}]',
     '{"B2"}'),

    (s1_id, 'In the audio integrating system, selecting the VOICE position on the VOICE/IDENT switch:',
     '[{"id":"a","text":"Cancels the navigation identification morse code tone so only voice audio is heard","correct":true},{"id":"b","text":"Disables the microphone completely","correct":false},{"id":"c","text":"Switches the receiver from VHF to HF reception","correct":false}]',
     '{"B2"}'),

    (s1_id, 'Which of the following is one of the three interphone systems described for a large aircraft?',
     '[{"id":"a","text":"Cabin interphone","correct":true},{"id":"b","text":"SELCAL interphone","correct":false},{"id":"c","text":"ACARS interphone","correct":false}]',
     '{"B2"}');

END $$;
