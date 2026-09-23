-- Module 15: Gas Turbine Engine (B1) — Compressors, Combustion Section, Turbine Section, Exhaust
-- Source: EASA Part-66 Module 15 official textbook (Aviation Maintenance Technician Certification Series, "Gas Turbine Engine")

DO $$
DECLARE
    m15_id INT;
    s4_id  INT;
    s5_id  INT;
    s6_id  INT;
    s7_id  INT;
BEGIN
    SELECT id INTO m15_id FROM easa_modules WHERE code = 'M15';

    IF EXISTS (SELECT 1 FROM easa_subjects WHERE code = 'M15.4') THEN
        RAISE NOTICE 'M15.4-M15.7 already seeded, skipping.';
        RETURN;
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 15.4: Compressors
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m15_id, 'M15.4', 'Compressors',
        $cnt$
# Compressors

## Function of the Compressor Section

The compressor section of the gas turbine engine performs critical functions. Its **primary function** is to supply air in sufficient quantity to satisfy the requirements of the combustion burners. Specifically, the compressor must increase the pressure of the mass of air received from the air inlet duct, and then discharge it to the burners in the quantity and at the pressures required.

A **secondary function** of the compressor is to supply bleed air for various purposes in the engine and aircraft. Bleed air is taken from any of the various pressure stages of the compressor; the exact bleed port location depends on the pressure or temperature required for a particular job. Air is often bled from the final (highest pressure) stage, since pressure and temperature are at a maximum there; this high-pressure air may need to be cooled before use (for example, for cabin pressurization) by routing it through an air conditioning unit.

Current applications of bleed air include:
- Cabin pressurization, heating, and cooling
- Deicing and anti-icing equipment
- Pneumatic starting of engines
- Auxiliary drive units (ADU)

Bleed air is often controlled by a **bleed valve**, mounted directly to the compressor case or in the downstream ducting, whose primary function is to open and close for passage of bleed air into the pneumatic system.

## Compressor Types and Applications

A **stage** in a compressor is considered to be a rise in pressure. The two principal compressor types currently used in gas turbine aircraft engines are:
- **Centrifugal-flow** — picks up the entering air and accelerates it outward by centrifugal action
- **Axial-flow** — compresses air while it continues in its original direction of flow, thus avoiding the energy loss caused by turns

Axial-flow compressors are normally found on turbofan engines, which are widely used in aviation. Centrifugal-flow compressors are commonly used in turboprop and turboshaft engines.

## Centrifugal-Flow Compressors

The centrifugal-flow compressor consists of an **impeller** (rotor), a **diffuser** (stator), and a **compressor manifold**.

- Centrifugal compressors have a high pressure rise per stage — around **8:1** — but are generally limited to **two stages** due to efficiency concerns.
- The **impeller** is usually made from forged aluminum alloy, heat treated, machined, and smoothed for minimum flow restriction and turbulence. It may be **single-entry** or **double-entry**:
  - The **double-entry** type has a smaller diameter but is usually operated at a higher rotational speed to assure sufficient airflow, and requires a **plenum chamber** because the air must enter the engine at almost right angles to the engine axis.
  - The **single-entry** type permits simpler, direct ducting to the impeller eye (inducer vanes), but must be larger in diameter to deliver the same quantity of air as the double-entry type, increasing overall engine diameter.
- Double-entry installations may include **auxiliary air-intake doors (blow-in doors)** as part of the plenum chamber. These admit air to the engine compartment during ground operation, when air requirements for the engine exceed the airflow through the inlet ducts. The doors are spring-closed when the engine is not operating, open automatically when engine compartment pressure drops below atmospheric, and ram air pressure in flight helps the springs hold them closed.
- The **diffuser** is an annular chamber with a number of vanes forming a series of divergent passages into the manifold. The diffuser vanes direct the flow of air from the impeller to the manifold at an angle designed to retain the maximum amount of energy imparted by the impeller, delivering air at a velocity and pressure satisfactory for use in the combustion chambers.
- The **compressor manifold** diverts the flow of air from the diffuser into the combustion chambers, with one outlet port for each chamber so the air is evenly divided. **Turning (cascade) vanes** are sometimes fitted inside the outlet elbows to reduce air pressure losses by presenting a smooth, turning surface.

**Advantages of the centrifugal-flow compressor:**
- High pressure rise per stage
- Efficiency over a wide rotational speed range
- Simplicity of manufacture and low cost
- Low weight
- Low starting power requirements

**Disadvantages of the centrifugal-flow compressor:**
- Large frontal area for a given airflow
- Losses in turns between stages

## Axial-Flow Compressor

The axial-flow compressor has two main elements: a **rotor** and a **stator**.

- The rotor has blades fixed on a spindle that impel air rearward (in the same manner as a propeller) because of their angle and airfoil contour. From inlet to exit, air flows along an axial path and is compressed at a ratio of approximately **1.25:1 per stage**. Compressor pressure ratio increases with the number of compression stages; most engines utilize up to **16 stages** or more.
- The stator has rows of vanes, stationary, attached inside an enclosing case, projecting radially toward the rotor axis and fitting closely on either side of each stage of rotor blades. The stator vanes receive air from the inlet duct or each preceding stage, increase its pressure, and deliver it to the next stage at the correct velocity and pressure. They act as diffusers at each stage, partially converting high velocity to pressure. Each consecutive pair of rotor and stator blades constitutes a **pressure stage**.
- The first-stage rotor blades can be preceded by an **inlet guide vane assembly** (fixed or variable). The guide vanes direct airflow into the first-stage rotor blades at the proper angle and impart a pre-swirl, in the direction of engine rotation, that improves the compressor's aerodynamic characteristics by reducing drag on the first-stage rotor blades.
- At the discharge end of the compressor, the stator vanes are constructed to straighten the airflow to eliminate turbulence — these are called **straightening vanes** or the outlet vane assembly.
- Stator vanes are usually made of steel with corrosion- and erosion-resistant qualities, and are often shrouded. Rotor blades are usually made of stainless steel, with the latter stages made of titanium, and are commonly fitted into disks by either **bulb-type** or **fir-tree** attachment methods.
- Compressor blade tips are reduced in thickness by cutouts, referred to as blade profiles, which prevent serious damage to the blade or housing should the blades contact the compressor housing — a condition that can occur if rotor blades become excessively loose or if rotor support is reduced by a malfunctioning bearing.
- Blades vary in length from entry to discharge because the annular working space (drum to casing) is reduced progressively toward the rear by the decrease in casing diameter, providing a fairly constant velocity through the compressor.
- The rotor features either **drum-type** construction (rings flanged together and held by through bolts — satisfactory for low-speed compressors where centrifugal stresses are low) or **disk-type** construction (disks machined from aluminum forgings, shrunk over a steel shaft, with rotor blades dovetailed into the disk rims).
- The combination of compressor stages and turbine stages on a common shaft is referred to as an **engine spool**, supported by bearings seated in suitable bearing housings.

### Spool Configurations

There are two configurations of axial compressor in use: the **single rotor/spool** (solid spool) and the **dual rotor/spool** (split spool, two-spool). One version of the solid-spool compressor uses **variable inlet guide vanes (VIGV)**, and the first few rows of stator vanes are variable.

- **VIGV** are positioned in front of the rotor blades
- **Variable stator vanes (VSV)** are positioned behind the rotor blades

Most turbofan engines are of the split-spool type. Most large turbofan engines use a large fan with a few stages of compression, called the **low-pressure spool**. The second spool, referred to as the **high-pressure spool**, is the compressor for the gas generator and core of the engine, supplying air to the combustion section. Many dual-rotor systems have rotors turning in opposite directions with no mechanical connection between them.

**Advantages of the axial-flow compressor:**
- High peak efficiencies
- Small frontal area for given airflow
- Straight-through flow, allowing high ram efficiency
- Increased pressure rise by increasing number of stages, with negligible losses

**Disadvantages of the axial-flow compressor:**
- Good efficiencies over only a narrow rotational speed range
- Difficulty of manufacture and high cost
- Relatively high weight
- High starting power requirements (partially overcome by split compressors)

## Diffuser

The diffuser is the divergent section of the engine after the compressor and before the combustion section. It has the all-important function of reducing high-velocity compressor discharge air to increased pressure at a slower velocity. This prepares the air for entry into the flame burning area of the combustion section at a lower velocity so that the flame of combustion can burn continuously — if air passed through the flame area at high velocity, it could extinguish the flame.

## Fan Balance

All turbine engine rotating assemblies require balancing by the manufacturer; however, only **fan blades** can be balanced without disassembly of the engine. High-bypass fans require particular attention to balance while in service, due to their large diameter and high rotational forces — even minor damage can cause the fan to become unbalanced and compromise the integrity of the rotating assembly and its bearings.

Fan blades are assembled and balanced as a set using computer software that considers the **radial moment weight** of each individual blade (usually marked on the blade case or on the bottom of the dovetails for blade attachment). After the blades are fitted, a vibration survey is carried out, and trim balance weights are fitted if necessary. If a fan blade is damaged in the field, there are three trim balance options:
1. Replace the blade with one within a small tolerance of the original radial moment weight
2. Replace the blade with one of a different weight, then fit a correcting weight using a formula from the maintenance manual
3. Replace the damaged blade and the blade diametrically opposite it with a pair of blades of matching weights

After considerable time in service, vibration levels can gradually increase — this may be due to worn dry film lubricant on the blade roots rather than blade damage or movement. Out-of-balance forces are indicated by their magnitude (in "aircraft units") and direction (a phase angle from a known datum, usually the number 1 balance hole). Fan assembly balance information may be displayed on EICAS or ECAM system displays or on special balancing test equipment, with limits specified in the maintenance manual.

## Compressor Stall and Surge

Each compressor blade is an airfoil, subject to the same aerodynamic principles as a wing or propeller. Just as a wing can stall and lose lift when the maximum angle of attack is exceeded, the same is true for a compressor blade or stage.

- When a **single compressor blade or stage** stalls, it is said to have **stalled**.
- When the **entire compressor** stalls, it is known as **surge**.

Compressors can experience stall or surge on the ground when a high wind suddenly blows across the engine inlet duct, or in flight from distorted inlet airflow causing the angle of air striking the compressor blades to be incorrect. Other causes include icing, rapid throttle movement, rapid maneuvering, or a fuel governor malfunction. Deterioration of blade shape from erosion, deposit build-up, or blade damage all contribute, as can failure of the variable inlet guide vanes, variable stator vanes, or a malfunctioning compressor bleed system.

A technician may recognize a compressor stall or surge during a ground run-up by hearing abnormal noises — rumbling, moaning, or just a bang — accompanied by rapid changes in indicated RPM, EGT, and EPR, and by poor throttle response.

The effects of stall or surge are detrimental to the engine and its life: changes in material properties and fatigue occur due to shock loading of internal engine components. High EGT spikes during a surge reflect high turbine section temperatures that may exceed design capabilities, resulting in a reduction in engine life.
        $cnt$,
        4
    ) RETURNING id INTO s4_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 15.5: Combustion Section
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m15_id, 'M15.5', 'Combustion Section',
        $cnt2$
# Combustion Section

## Function

The combustion section houses the combustion process, which raises the temperature of the air passing through the engine, releasing energy contained in the air/fuel mixture. About **2/3 of this energy** is used at the turbine or turbine stages to drive the gas generator compressor. The remaining energy passes through the remaining turbine stages, which absorb more of the energy to drive the fan, output shaft, or propeller. Only the pure turbojet allows the air to create all the thrust by exiting the rear of the engine as a high-velocity jet.

The primary function of the combustion section is to burn the fuel/air mixture, adding heat energy to the air. To do this efficiently, the combustion chamber must:
- Provide the means for proper mixing of the fuel and air to assure good combustion
- Burn this mixture efficiently
- Cool the hot combustion products to a temperature the turbine inlet guide vanes/blades can withstand under operating conditions
- Deliver the hot gases to the turbine section

The combustion section is located directly between the compressor and turbine sections. Combustion chambers are always arranged coaxially with the compressor and turbine, regardless of type, since they must be in a through-flow position to function efficiently.

## Basic Elements Common to All Combustion Chambers

1. Casing
2. Perforated inner liner
3. Fuel injection system
4. Some means for initial ignition
5. Fuel drainage system, to drain off unburned fuel after engine shutdown

Drainage prevents gum deposits (caused by residue left when fuel evaporates) in the fuel manifold, nozzles, and combustion chambers, and — most importantly — prevents the danger of an after-fire: if unburned fuel is allowed to accumulate after shutdown, it may ignite at the next starting attempt and exhaust gas temperature could exceed safe operating limits.

## Types of Combustion Chambers

There are three basic types of combustion chambers, with variations within each type being in detail only:

| Type | Typical application |
|------|----------------------|
| **Can type** | Turboshaft engines and APUs |
| **Can-annular type** | (not used in modern engines) |
| **Annular type** | Modern turbine engines (most common today) |

### Can-Type Combustion Chamber

Each can-type chamber consists of an outer case or housing, within which is a perforated, highly heat-resistant stainless steel combustion chamber liner (inner liner). The outer case is removed to facilitate liner replacement.

Older engines with several combustion cans had each can fitted with an **inter-connector (flame propagation) tube**, since each can is a separate burner operating independently. As the flame is started by spark igniter plugs in two of the lower chambers, it passes through the interconnecting tubes and ignites the mixture in adjacent chambers until all chambers are burning.

Air entering the chamber is divided into two main streams:
- **Primary (combustion) air** — directed inside the liner at the front end, where it mixes with fuel and is burned
- **Secondary (cooling) air** — passes between the outer casing and the liner and joins the combustion gases through larger holes toward the rear of the liner, cooling the combustion gases from about **3,500°F to near 1,500°F**

Holes around the fuel nozzle in the dome/inlet end aid fuel atomization, and louvers along the axial length of the liner direct a cooling layer of air along the inside wall, which also helps keep the flame centered in the liner and prevents burning of the liner walls. The two fuel nozzle types used are the **simplex nozzle** and the **duplex nozzle**.

### Can-Annular Combustion Chamber

The can-annular design uses interconnected burners with projecting flame tubes to facilitate engine starting, in the same manner as the can-type. The forward face of each chamber presents apertures aligning with fuel nozzles from a corresponding fuel nozzle cluster; these are dual-orifice (duplex) nozzles requiring a flow-divider (pressurizing valve). Around each nozzle are **pre-swirl (swirl) vanes** that impart a swirling motion to the fuel spray, improving atomization, burning, and efficiency.

The swirl vanes provide two effects imperative to proper flame propagation:
1. **High flame speed** — better mixing of air and fuel, ensuring spontaneous burning
2. **Low air velocity axially** — swirling eliminates overly rapid flame movement in the axial direction

This turbulence in the early combustion and cooling stages is desirable, since mixing of fuel vapor with primary air by diffusion alone is too slow; mechanical mixing (via swirl vanes, or coarse screens placed in the diffuser outlet in most axial-flow engines) is required.

Spark igniter plugs on the can-annular chamber are of the same basic type used in can-type chambers — usually two per assembly, mounted on a boss on each chamber housing, long enough to protrude into the combustion chamber. Fuel drain valves are located in two or more of the bottom chambers to assure proper drainage and prevent residual fuel burning at the next start.

### Annular Combustion Chamber

The annular chamber's basic components are a housing and a liner, as in the can type, but the liner is an **undivided circular shroud** extending all the way around the outside of the turbine shaft housing. The chamber may be constructed of heat-resistant materials, sometimes coated with thermal barrier materials such as ceramic materials. Like the other types, the annular combustion chamber uses louvers and holes to prevent the flame from contacting the side of the combustion chamber. Modern turbine engines usually have an annular combustion chamber.
        $cnt2$,
        5
    ) RETURNING id INTO s5_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 15.6: Turbine Section
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m15_id, 'M15.6', 'Turbine Section',
        $cnt3$
# Turbine Section

## Function and Location

The turbine transforms a portion of the kinetic (velocity) energy of the exhaust gases into mechanical energy to drive the gas generator compressor and accessories. The sole purpose of the gas generator turbine is to absorb approximately **60 to 70 percent** of the total pressure energy from the exhaust gases; the exact amount absorbed is determined by the load the turbine is driving. The turbine section is located aft of the combustion chamber, directly behind its outlet.

The turbine assembly consists of two basic elements: **turbine inlet guide vanes** (the stator element — also called turbine inlet nozzle vanes or nozzle diaphragm) and **turbine blades** (the rotor element). The turbine inlet nozzle vanes are located directly aft of the combustion chambers and immediately forward of the turbine wheel — this is the **highest/hottest temperature location** that comes into contact with metal components in the engine, so turbine inlet temperature must be controlled or damage to the turbine inlet vanes will occur.

## Turbine Inlet Nozzle

The stationary vanes of the turbine inlet nozzle are contoured and angled to form a number of small nozzles discharging gas at extremely high speed. The nozzle serves two purposes:
1. Converts a varying portion of the heat and pressure energy of the gas into **velocity energy**, which is then converted to mechanical energy through the turbine blades
2. Deflects the gases to a specific angle in the direction of turbine wheel rotation, since the gas must enter the still-rotating turbine blade passageway

The nozzle assembly consists of an inner shroud and an outer shroud, between which the nozzle vanes are fixed. One characteristic is common to all turbine inlet nozzles: the vanes must be constructed to allow **thermal expansion**, otherwise severe distortion or warping of the metal components would occur from rapid temperature changes. Two construction methods achieve this:
- **Loose-fitting vanes** — each vane fits into a contoured slot slightly larger than the vane, with inner and outer support rings encasing the shrouds for added strength and rigidity, and to facilitate removal of the nozzle vanes as a unit
- **Welded/riveted vanes** — the vanes are fixed into the shrouds, and either the inner or outer shroud ring is cut into segments (saw cuts) to allow sufficient expansion and prevent stress and warping

## Turbine Rotor

The rotor element consists essentially of a **shaft and a wheel**. The turbine wheel is a dynamically balanced unit consisting of blades attached to a rotating disk, which is in turn attached to the main power-transmitting shaft. A turbine disk without blades is simply called a "disk"; once blades are installed, it becomes the **turbine wheel**.

The disk rim is exposed to hot gases passing through the blades and absorbs considerable heat from the gases, as well as heat conducted from the blades themselves. As a result, disk rim temperatures are normally well above those of the more remote inner portion of the disk, and this temperature gradient adds thermal stresses to the rotational stresses. Methods to relieve these stresses include:
- Bleeding cooling air back onto the face of the disk
- Grooves/notches broached in the disk rim (which also attach the turbine blades) — these provide space for thermal expansion of the disk; sufficient clearance exists between blade root and notch when the disk is cold, and expansion during operation causes the blade root to fit tightly

The turbine shaft is usually fabricated from **alloy steel**, capable of absorbing high torque loads. It may be connected to the disk by welding or (more commonly) by bolting, and is typically connected to the compressor rotor hub by a spline.

## Turbine Blade Attachment and Retention

The most satisfactory method of attaching turbine blades to the disk is the **fir-tree design**. Blades are retained in their grooves by a variety of methods, the more common being:
- Peening
- Welding
- Lock tabs
- Riveting

Turbine blades may be forged or cast, depending on the alloy composition; most are precision cast and finish ground to shape. Many turbine blades are cast as a **single crystal**, giving better strength and heat properties. Heat barrier coatings (such as ceramic coating) and airflow cooling help keep turbine blades and inlet nozzles cooler, allowing exhaust temperature to be raised and increasing engine efficiency.

Most turbines are open at the outer perimeter of the blades; however, a second type — the **shrouded turbine** — is sometimes used, where the blades form a band around the outer perimeter of the wheel. Shrouding improves efficiency and vibration characteristics and permits lighter stage weights, but limits turbine speed and requires more blades.

## Multistage Turbines and Spools

A single turbine wheel often cannot absorb enough power from the exhaust gases to drive all the components dependent on it, so additional turbine stages are added. A **turbine stage** consists of a row of stationary vanes (nozzles) followed by a row of rotating blades — a turbine nozzle always precedes each wheel. Some turboprop engines have used as many as **five turbine stages**.

- In a **single-stage rotor turbine**, power is developed by one turbine rotor driving all engine-driven parts — used where low weight and compactness predominate (the simplest version of the pure turbojet).
- In **multiple-spool engines**, each spool has its own set of turbine stages driving the compressor attached to it. Most turbofan engines have **two spools**: a low-pressure spool (fan shaft, a few compression stages, and its driving turbine) and a high-pressure spool (high-pressure compressor shaft and high-pressure turbine).

## Turbine Casing

The turbine casing encloses the turbine wheel and nozzle vane assembly, gives support to the stator elements, and always has flanges front and rear for bolting the assembly to the combustion chamber housing and the exhaust cone assembly, respectively.

## Inspection

Crack detection on the turbine disk and blades is mostly visual, aided by structural inspection techniques such as penetrant methods. Cracks on the disk necessitate rejection of the disk and replacement of the turbine rotor; slight pitting from foreign matter impingement may be blended by stoning and polishing.

Strong light and a magnifying glass are used to inspect turbine blades for:
- **Stress rupture cracks** — minute hairline cracks on or across the leading or trailing edge, at a right angle to the edge length, ranging from one-sixteenth inch upward
- **Deformation of the leading edge** (waviness, varying airfoil thickness) caused by over-temperature — when found on first-stage turbine blades, an over-temperature condition can be suspected

Materials such as metals and plastics also experience **creep** — slow structural deformation at a molecular level caused by prolonged exposure to high stresses. Creep increases with temperature and can cause observable dimensional changes to the blades, so dimensional inconsistency could be caused by creep rather than over-temperature. Signs of scoring on the turbine case may indicate blade length is out of tolerance. Blades removed for detailed inspection or a check of turbine disk stretch must be numbered before removal and re-installed in the same slots.
        $cnt3$,
        6
    ) RETURNING id INTO s6_id;

    -- ──────────────────────────────────────────────────────────────
    -- Sub-Module 15.7: Exhaust
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO easa_subjects (module_id, code, title, content, sort_order)
    VALUES (
        m15_id, 'M15.7', 'Exhaust',
        $cnt4$
# Exhaust

## Exhaust Section Overview

The exhaust section is located directly behind the turbine section and ends when gases are ejected at the rear as a high-velocity exhaust gas stream. Its components — although each has an individual purpose — share one common function: they must direct the flow of hot gases rearward in a manner that prevents turbulence while imparting a high final (exit) velocity to the gases. The exhaust section's components are the **exhaust cone**, the **tailpipe** (if required), and the **exhaust nozzle**.

## Exhaust Cone Assembly

The exhaust cone collects the exhaust gases discharged from the turbine section and gradually converts them into a solid flow of gases; in doing so, gas velocity decreases slightly and pressure increases, due to the diverging passage (increasing annular area) between the outer duct and the inner cone.

The exhaust cone assembly consists of an outer shell/duct (usually stainless steel, attached to the rear flange of the turbine case), an **inner cone**, three or four **radial hollow struts (or fins)**, and, in some designs, tie rods to help the struts support the inner cone. The duct includes thermocouple bosses for exhaust temperature thermocouples and, where used, insertion holes for tie rods.

The radial struts have a **twofold function**:
1. They support the inner cone in the exhaust duct
2. They straighten the swirling exhaust gases, which would otherwise leave the turbine at an angle of approximately **45°**

The centrally located inner cone fits closely against the rear face of the turbine disk, preventing turbulence of the gases as they leave the turbine wheel. In some configurations, a small hole in the exit tip of the cone allows cooling air to circulate from the aft end of the cone (where gas pressure is relatively high) into the cone's interior and against the face of the turbine wheel (where pressure is relatively low due to wheel rotation), assuring positive air circulation; the cooling gases return to the main flow path through the clearance between the turbine disk and the inner cone. The exhaust cone assembly is the terminating component of the basic engine — the exhaust nozzle is usually considered an airframe component.

## Tailpipe

The tailpipe is usually semi-flexible; some incorporate a bellows arrangement allowing movement during installation, maintenance, and thermal expansion, eliminating stress and warping. Because heat radiation from the exhaust cone and tailpipe could damage surrounding airframe components, insulation is required — commonly **insulation blankets** (several layers of aluminum foil, each separated by fiberglass or similar material) or shrouds.

A typical insulation blanket cross-section shows a progressive temperature drop, for example:

| Location | Approximate Temperature |
|----------|--------------------------|
| Exhaust gas | 1,000°F |
| Jet tailpipe | 900°F |
| Stainless steel shroud | 350°F |
| Cooling air | 120°F |

On some turboprop aircraft, the exhaust duct (often called a tailpipe, though it is essentially a simple stainless steel conical or cylindrical pipe) includes an engine tail cone and internal struts that add strength, impart an axial direction to the gas flow, and smooth it. Since most of the turboprop's energy has already been transferred to the propeller, this duct provides little thrust. The forward section of the tailpipe is funnel-shaped, surrounding but not contacting the turbine exhaust section, forming an annular gap that acts as an air ejector: high-velocity exhaust gases entering the tailpipe create a low-pressure effect that draws air around the engine hot section through the gap into the tailpipe. The rear section is secured to the airframe by support arms that permit fore-and-aft movement to compensate for expansion.

Immediately aft of the turbine outlet, the engine is instrumented for turbine discharge pressure (via one or more pressure probes) and, in large engines where internal turbine-inlet temperature is impractical to measure, for exhaust gas temperature at the turbine outlet.

## Exhaust Nozzles

There are two types of exhaust nozzle design:
- **Converging (convergent)** — for subsonic gas velocities
- **Converging-diverging (convergent-divergent)** — for supersonic gas velocities

The nozzle opening may be of **fixed** or **variable area**. The fixed-area type is simpler, with no moving parts, but its outlet area is critical: too large wastes thrust, too small can choke or stall the engine. A **variable-area** nozzle is used when an augmenter or afterburner is fitted, since it must increase its open area when the afterburner is selected (to handle the increased mass flow) and close to a smaller area when the afterburner is off.

Turbine engines have several different exhaust nozzle types depending on engine type:
- **Turboshaft** engines (helicopters) can have an exhaust nozzle forming a **divergent duct** that provides no thrust — all engine power is used to rotate the rotors
- **Ducted-fan turbofans** direct fan airflow through closed ducts to a common (mixed) exhaust nozzle, where core and fan flows mix
- **Unducted-fan turbofans** have two separate nozzles — one for fan airflow, one for core airflow — each exhausting separately to ambient air. Fan air (which creates **80–85 percent** of total thrust) is directed through exit vanes with minimal turbulence; core airflow, which must be straightened as it leaves the turbine, is accelerated through a converging nozzle, increasing momentum and thrust
- **Turboprop** exhaust nozzles provide only small amounts of thrust (about **10–15 percent**), since most of the engine's energy has been transferred to the propeller; they are mainly used to discharge exhaust gases from the aircraft

### Convergent Exhaust Nozzle

As exhaust gases exit the rear of the engine, the first part of the nozzle and the exhaust plug form a divergent duct to reduce turbulence, before the gases flow into the convergent component, where flow is restricted by a smaller outlet opening — increasing gas velocity and thrust. The restriction of the outlet opening is limited by two factors: too large an opening wastes thrust, too small chokes the flow in other engine components. The exhaust nozzle thus acts as an orifice whose size determines the density and velocity of the gases as they emerge, which is critical to thrust performance.

Adjusting nozzle area changes both engine performance and exhaust gas temperature. When exhaust gas velocity at the nozzle opening reaches **Mach 1**, flow passes only at that speed and cannot increase further — this is called a **choked nozzle**. Extra flow builds up pressure in the nozzle, sometimes called **pressure thrust**: a pressure differential exists between the inside of the nozzle and the ambient air, and pressure thrust can be calculated by multiplying this pressure difference by the area of the nozzle opening. Many engines cannot develop pressure thrust because most of their energy is used to drive turbines that turn propellers, large fans, or helicopter rotors.

### Convergent-Divergent (C-D) Exhaust Nozzle

Whenever the engine pressure ratio is high enough to produce exhaust gas velocities that might exceed Mach 1 at the nozzle, more thrust can be gained using a convergent-divergent nozzle — its advantage is greatest at high Mach numbers because of the resulting higher pressure ratio across the nozzle.

To ensure a constant weight/volume of gas flows past any point once sonic velocity is reached, the rear part of a supersonic exhaust duct is enlarged (the **divergent section**) to accommodate the additional volume of gas flowing at supersonic rates — without this enlargement, the nozzle would not operate efficiently. In the C-D nozzle:
- The **convergent section** handles the gases while subsonic, delivering them to the throat just as they attain sonic velocity
- The **divergent section** handles the gases after they emerge from the throat and become supersonic, further increasing their velocity

This nozzle type is generally used on very high-speed aerospace vehicles.

## Thrust Reversers

As aircraft gross weights and landing airspeeds have increased, aircraft brakes alone can no longer always be relied upon to stop the aircraft within a reasonable distance after touchdown. Thrust reverser systems are divided into two categories:

- **Mechanical blockage** — a removable obstruction (an inverted cone, half-sphere, or clamshell) is placed in the exhaust gas stream, somewhat to the rear of the nozzle, mechanically blocking and diverting the gases at a suitable angle in the reverse direction. This type is generally used with **ducted turbofan engines**, where fan and core flow mix in a common nozzle before exiting.
- **Aerodynamic blockage** — used mainly with **unducted turbofan engines**, using only fan air to slow the aircraft. A modern aerodynamic thrust reverser system consists of a **translating cowl**, **blocker doors**, and **cascade vanes** that redirect fan airflow forward to slow the aircraft.

A thrust reverser must withstand high temperatures, be mechanically strong, relatively light, reliable, and fail-safe, and must streamline into the nacelle configuration when not in use. Since the fan can produce approximately **80 percent** of the engine's thrust, it is the best source for reverse thrust. If the thrust levers are at idle and the aircraft has weight on wheels, moving the thrust levers aft activates the translating cowl to open and close the blocker doors, stopping fan airflow from going aft and redirecting it forward through the cascade vanes. Returning the thrust levers to idle reverses this — blocker doors open, translating cowl closes.

Actuating power is generally pneumatic or hydraulic, using gearboxes, flexdrives, screwjacks, control valves, and air or hydraulic motors. Systems are locked in the stowed position until commanded to deploy from the flight deck, with flight-deck indication of reverser status. During maintenance, the reverser system must be mechanically locked out from deploying while personnel are in the area.

## Thrust Vectoring

**Thrust vectoring** is the ability of an aircraft's engines to direct thrust other than parallel to the vehicle's longitudinal axis, by moving or changing the position of the exhaust nozzle. Vertical takeoff aircraft use thrust vectoring for takeoff thrust before changing direction for horizontal flight; military aircraft use it for in-flight maneuvering. A vectoring nozzle can typically be moved (vectored) up and down by **20°**, making the aircraft more maneuverable in flight.

## Engine Noise Suppression

There are three sources of noise from a gas turbine engine: the engine air intake, vibration from the engine housing, and — by far the greatest — the **engine exhaust**. Exhaust noise is caused by the high degree of turbulence of a high-velocity jet stream moving through the relatively quiet atmosphere.

- Close behind the engine (within a few nozzle diameters), the jet stream velocity is high with little atmospheric mixing; turbulence here is fine-grain, producing relatively **high-frequency** noise from violent, shearing mixing action.
- Farther downstream (approximately **10 nozzle diameters** behind the engine), as the jet stream slows and mixes with the atmosphere, turbulence becomes coarser, producing **lower-frequency** noise — most of the perceived noise radiates from this low-frequency turbulence region. Low-frequency noise travels farther and is attenuated less by distance, buildings, terrain, and atmospheric disturbance than high-frequency noise, making it more objectionable at a distance even at equal source volume.

Noise levels vary with engine thrust and are proportional to the work done by the engine on the air passing through it: an engine with relatively low airflow but high thrust (high exhaust temperature/pressure and/or afterburning) produces high noise levels, while a larger engine handling more air is quieter at the same thrust — so operating at lower power settings, or using larger engines at partial thrust, reduces noise. A turbofan is quieter than a turbojet of the same thrust during takeoff, mainly because fan exhaust gas velocities at the tailpipe are slower. Fan engines require a larger turbine (often with an additional stage) to drive the fan; this reduces exhaust gas velocity and hence noise, since exhaust noise is proportional to exhaust gas velocity.

Noise suppressors currently in use are either the **corrugated perimeter type** or the **multi-tube type**. Both break up the single main jet exhaust stream into a number of smaller jet streams, increasing the total nozzle perimeter and reducing the size of the air stream eddies created as gases discharge into the open air. Although total noise energy is unchanged, the frequency is raised considerably — the size of eddies scales down linearly with the size of the exhaust stream. This has two effects:
1. The frequency shift may put some noise above the audibility range of the human ear
2. High frequencies remaining within the audible range, while potentially more annoying, are more heavily attenuated by atmospheric absorption than low frequencies, so the noise level falls off faster with distance

In the engine nacelle, the area between the engine and the cowl has **acoustic linings** — a porous skin supported by a honeycomb backing — that convert acoustic energy into heat, providing further noise suppression.

## Turbine Engine Emissions

New combustion technology has dramatically reduced gas turbine engine emissions, with continued focus on lowering oxides of nitrogen (**NOx**) — most of the research has centered on the combustion section. Most advanced designs pre-mix fuel and air before it enters the combustion burner area. One example is the **Twin Annular, Pre-mixing Swirler (TAPS)** combustor, in which air from the high-pressure compressor is directed through two high-energy swirlers adjacent to the fuel nozzles, creating a more thorough and leaner fuel/air mix that burns at lower temperatures. Since most NOx forms from the reaction of oxygen and nitrogen at high temperatures — and NOx levels rise the longer the mixture stays at high temperature — this leaner, cooler-burning mix reduces NOx as well as carbon monoxide and unburned hydrocarbon emissions. Increases in gas turbine engine component efficiencies have also resulted in fewer overall emissions.
        $cnt4$,
        7
    ) RETURNING id INTO s7_id;

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M15.4 Compressors (14 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s4_id, 'What is the primary function of the compressor section of a gas turbine engine?',
     '[{"id":"a","text":"To increase the pressure of the air received from the air inlet duct and discharge it to the burners in the quantity and at the pressures required","correct":true},{"id":"b","text":"To atomize fuel for combustion","correct":false},{"id":"c","text":"To convert exhaust heat energy directly into thrust","correct":false}]',
     '{"B1"}'),

    (s4_id, 'Bleed air is often taken from the final (highest pressure) compressor stage because, at that point:',
     '[{"id":"a","text":"Pressure and air temperature are at a maximum","correct":true},{"id":"b","text":"The air is coolest and driest","correct":false},{"id":"c","text":"Airflow velocity is lowest","correct":false}]',
     '{"B1"}'),

    (s4_id, 'Which of the following is listed as a current application of engine bleed air?',
     '[{"id":"a","text":"Cabin pressurization, heating, and cooling","correct":true},{"id":"b","text":"Fuel filtration","correct":false},{"id":"c","text":"Landing gear retraction","correct":false}]',
     '{"B1"}'),

    (s4_id, 'In compressor terminology, a "stage" is considered to be:',
     '[{"id":"a","text":"A rise in pressure","correct":true},{"id":"b","text":"A single rotor blade","correct":false},{"id":"c","text":"A complete revolution of the compressor shaft","correct":false}]',
     '{"B1"}'),

    (s4_id, 'The centrifugal-flow compressor consists of which three main components?',
     '[{"id":"a","text":"Impeller, diffuser, and compressor manifold","correct":true},{"id":"b","text":"Rotor, stator, and straightening vanes","correct":false},{"id":"c","text":"Casing, liner, and fuel injector","correct":false}]',
     '{"B1"}'),

    (s4_id, 'Centrifugal-flow compressors are generally limited to about two stages mainly because of:',
     '[{"id":"a","text":"Efficiency concerns","correct":true},{"id":"b","text":"Excessive weight per stage","correct":false},{"id":"c","text":"Insufficient pressure rise per stage","correct":false}]',
     '{"B1"}'),

    (s4_id, 'Compared to the single-entry impeller, the double-entry impeller:',
     '[{"id":"a","text":"Has a smaller diameter but is usually operated at a higher rotational speed, and requires a plenum chamber","correct":true},{"id":"b","text":"Has a larger diameter and requires no plenum chamber","correct":false},{"id":"c","text":"Cannot be used on turboprop or turboshaft engines","correct":false}]',
     '{"B1"}'),

    (s4_id, 'The approximate pressure rise per stage of an axial-flow compressor is:',
     '[{"id":"a","text":"Approximately 1.25:1","correct":true},{"id":"b","text":"Approximately 8:1","correct":false},{"id":"c","text":"Approximately 25:1","correct":false}]',
     '{"B1"}'),

    (s4_id, 'What is the main functional difference between a variable inlet guide vane (VIGV) and a variable stator vane (VSV)?',
     '[{"id":"a","text":"VIGV are positioned in front of the rotor blades; VSV are positioned behind the rotor blades","correct":true},{"id":"b","text":"VIGV are used only on centrifugal compressors; VSV are used only on axial compressors","correct":false},{"id":"c","text":"VIGV control fuel flow; VSV control bleed air flow","correct":false}]',
     '{"B1"}'),

    (s4_id, 'The drum-type axial compressor rotor, formed of rings held together by through bolts, is satisfactory for:',
     '[{"id":"a","text":"Low-speed compressors, where centrifugal stresses are low","correct":true},{"id":"b","text":"High-speed compressors only, due to its light weight","correct":false},{"id":"c","text":"Centrifugal compressors exclusively","correct":false}]',
     '{"B1"}'),

    (s4_id, 'Compressor rotor blades are commonly fitted into the disk rims by which two attachment methods?',
     '[{"id":"a","text":"Bulb-type or fir-tree methods","correct":true},{"id":"b","text":"Welding or brazing only","correct":false},{"id":"c","text":"Shrink-fitting or riveting only","correct":false}]',
     '{"B1"}'),

    (s4_id, 'What is the primary function of the diffuser, located after the compressor and before the combustion section?',
     '[{"id":"a","text":"To reduce high-velocity compressor discharge air to increased pressure at a slower velocity","correct":true},{"id":"b","text":"To increase the velocity of the air before it enters the combustion chamber","correct":false},{"id":"c","text":"To mix fuel and air before ignition","correct":false}]',
     '{"B1"}'),

    (s4_id, 'Regarding turbine engine rotating assembly balancing, which statement is correct?',
     '[{"id":"a","text":"Only fan blades can be balanced without disassembly of the engine","correct":true},{"id":"b","text":"No rotating assembly can be balanced without full engine disassembly","correct":false},{"id":"c","text":"Compressor and turbine disks, but not fan blades, can be balanced without disassembly","correct":false}]',
     '{"B1"}'),

    (s4_id, 'What is the difference between a compressor "stall" and a compressor "surge"?',
     '[{"id":"a","text":"A stall affects a single blade or stage; a surge occurs when the entire compressor stalls","correct":true},{"id":"b","text":"A stall occurs only on the ground; a surge occurs only in flight","correct":false},{"id":"c","text":"A stall and a surge are two names for exactly the same event","correct":false}]',
     '{"B1"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M15.5 Combustion Section (9 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s5_id, 'Approximately what proportion of the energy released in combustion is used to drive the gas generator compressor?',
     '[{"id":"a","text":"About 2/3 of the energy","correct":true},{"id":"b","text":"About 1/10 of the energy","correct":false},{"id":"c","text":"All of the energy","correct":false}]',
     '{"B1"}'),

    (s5_id, 'Which of the following is listed among the basic elements common to all combustion chambers?',
     '[{"id":"a","text":"A fuel drainage system to drain off unburned fuel after engine shutdown","correct":true},{"id":"b","text":"A variable-area exhaust nozzle","correct":false},{"id":"c","text":"An inlet guide vane assembly","correct":false}]',
     '{"B1"}'),

    (s5_id, 'What are the three basic types of combustion chambers?',
     '[{"id":"a","text":"Can type, can-annular type, and annular type","correct":true},{"id":"b","text":"Simplex, duplex, and triplex type","correct":false},{"id":"c","text":"Convergent, divergent, and convergent-divergent type","correct":false}]',
     '{"B1"}'),

    (s5_id, 'The can-type combustion chamber is typical of the type used on:',
     '[{"id":"a","text":"Turboshaft engines and APUs","correct":true},{"id":"b","text":"Modern high-bypass turbofan engines","correct":false},{"id":"c","text":"Supersonic turbojet engines only","correct":false}]',
     '{"B1"}'),

    (s5_id, 'In a can-type combustion chamber, secondary (cooling) air joins the combustion gases toward the rear of the liner and cools them from about:',
     '[{"id":"a","text":"3,500°F to near 1,500°F","correct":true},{"id":"b","text":"1,500°F to near 500°F","correct":false},{"id":"c","text":"5,000°F to near 3,500°F","correct":false}]',
     '{"B1"}'),

    (s5_id, 'In older can-type combustion chambers, what was the purpose of the inter-connector (flame propagation) tubes?',
     '[{"id":"a","text":"To spread the flame from the igniter-equipped chambers to all the other chambers during starting","correct":true},{"id":"b","text":"To drain unburned fuel after shutdown","correct":false},{"id":"c","text":"To carry bleed air to the aircraft pneumatic system","correct":false}]',
     '{"B1"}'),

    (s5_id, 'Swirl (pre-swirl) vanes fitted around the fuel nozzle in a can-annular combustion chamber provide which two effects?',
     '[{"id":"a","text":"High flame speed for better mixing, and low axial air velocity to prevent overly rapid flame movement","correct":true},{"id":"b","text":"Increased exhaust gas temperature and reduced fuel flow","correct":false},{"id":"c","text":"Reduced turbulence and increased axial flame speed","correct":false}]',
     '{"B1"}'),

    (s5_id, 'What type of combustion chamber do modern turbine engines usually use?',
     '[{"id":"a","text":"Annular type","correct":true},{"id":"b","text":"Can type","correct":false},{"id":"c","text":"Can-annular type","correct":false}]',
     '{"B1"}'),

    (s5_id, 'The liner of an annular combustion chamber is best described as:',
     '[{"id":"a","text":"An undivided circular shroud extending all the way around the outside of the turbine shaft housing","correct":true},{"id":"b","text":"A series of separate perforated cans, each with its own outer case","correct":false},{"id":"c","text":"A set of individually replaceable flame tubes with no shroud","correct":false}]',
     '{"B1"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M15.6 Turbine Section (9 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s6_id, 'The turbine assembly consists of which two basic elements?',
     '[{"id":"a","text":"Turbine inlet guide vanes (stator) and turbine blades (rotor)","correct":true},{"id":"b","text":"Impeller and diffuser","correct":false},{"id":"c","text":"Exhaust cone and tailpipe","correct":false}]',
     '{"B1"}'),

    (s6_id, 'The sole purpose of the gas generator turbine is to absorb approximately what percentage of the total pressure energy from the exhaust gases?',
     '[{"id":"a","text":"60 to 70 percent","correct":true},{"id":"b","text":"10 to 20 percent","correct":false},{"id":"c","text":"95 to 100 percent","correct":false}]',
     '{"B1"}'),

    (s6_id, 'What are the two purposes of the turbine inlet nozzle?',
     '[{"id":"a","text":"To convert heat and pressure energy into velocity energy, and to deflect the gases to the correct angle for turbine wheel rotation","correct":true},{"id":"b","text":"To cool the exhaust gases and to drain unburned fuel","correct":false},{"id":"c","text":"To atomize the fuel and to ignite the fuel/air mixture","correct":false}]',
     '{"B1"}'),

    (s6_id, 'One characteristic is common to all turbine inlet nozzles: they must be constructed to allow for:',
     '[{"id":"a","text":"Thermal expansion","correct":true},{"id":"b","text":"Radial fuel flow","correct":false},{"id":"c","text":"Reverse rotation","correct":false}]',
     '{"B1"}'),

    (s6_id, 'In a welded/riveted turbine nozzle vane assembly, thermal expansion is accommodated by:',
     '[{"id":"a","text":"Cutting either the inner or outer shroud ring into segments with saw cuts","correct":true},{"id":"b","text":"Fitting the vanes loosely into oversized slots only","correct":false},{"id":"c","text":"Using flexible rubber seals between the vanes","correct":false}]',
     '{"B1"}'),

    (s6_id, 'The most satisfactory and commonly used method of attaching turbine blades to the disk is the:',
     '[{"id":"a","text":"Fir-tree design","correct":true},{"id":"b","text":"Bolted flange design","correct":false},{"id":"c","text":"Dovetail-only design without locking","correct":false}]',
     '{"B1"}'),

    (s6_id, 'Compared with an unshrouded (open) turbine, a shrouded turbine:',
     '[{"id":"a","text":"Improves efficiency and vibration characteristics and permits lighter stage weights, but limits turbine speed and requires more blades","correct":true},{"id":"b","text":"Allows a higher maximum turbine speed with fewer blades","correct":false},{"id":"c","text":"Eliminates the need for a turbine casing","correct":false}]',
     '{"B1"}'),

    (s6_id, 'Stress rupture cracks on turbine blades typically appear as:',
     '[{"id":"a","text":"Minute hairline cracks on or across the leading or trailing edge, at a right angle to the edge length","correct":true},{"id":"b","text":"Large circular pits scattered across the blade face","correct":false},{"id":"c","text":"Discoloration only, with no physical cracking","correct":false}]',
     '{"B1"}'),

    (s6_id, 'Creep, as it affects turbine blades, is best described as:',
     '[{"id":"a","text":"Slow structural deformation at a molecular level caused by prolonged exposure to high stresses, which increases with temperature","correct":true},{"id":"b","text":"Sudden brittle fracture caused by a single overload event","correct":false},{"id":"c","text":"Surface corrosion caused by moisture ingestion","correct":false}]',
     '{"B1"}');

    -- ──────────────────────────────────────────────────────────────
    -- Questions — M15.7 Exhaust (14 questions)
    -- ──────────────────────────────────────────────────────────────
    INSERT INTO questions (subject_id, text, options, licence_types) VALUES

    (s7_id, 'What are the three components of the exhaust section of a gas turbine engine?',
     '[{"id":"a","text":"Exhaust cone, tailpipe (if required), and exhaust nozzle","correct":true},{"id":"b","text":"Impeller, diffuser, and manifold","correct":false},{"id":"c","text":"Combustion liner, casing, and fuel nozzle","correct":false}]',
     '{"B1"}'),

    (s7_id, 'The radial struts of the exhaust cone assembly perform a twofold function: they support the inner cone and:',
     '[{"id":"a","text":"Straighten the swirling exhaust gases, which would otherwise leave the turbine at an angle of approximately 45°","correct":true},{"id":"b","text":"Ignite unburned fuel remaining in the exhaust stream","correct":false},{"id":"c","text":"Increase the swirl of the exhaust gases to improve mixing","correct":false}]',
     '{"B1"}'),

    (s7_id, 'There are two types of exhaust nozzle design: the converging design for subsonic gas velocities, and:',
     '[{"id":"a","text":"The converging-diverging design for supersonic gas velocities","correct":true},{"id":"b","text":"The straight-bore design for transonic gas velocities","correct":false},{"id":"c","text":"The double-convergent design for hypersonic gas velocities","correct":false}]',
     '{"B1"}'),

    (s7_id, 'A variable-area exhaust nozzle is typically required when an engine is fitted with:',
     '[{"id":"a","text":"An augmenter or afterburner","correct":true},{"id":"b","text":"A thrust reverser only","correct":false},{"id":"c","text":"A noise suppressor only","correct":false}]',
     '{"B1"}'),

    (s7_id, 'A turboshaft engine exhaust nozzle typically forms what type of duct, and why?',
     '[{"id":"a","text":"A divergent duct that provides no thrust, since all engine power is used to rotate the rotors","correct":true},{"id":"b","text":"A convergent-divergent duct that produces maximum thrust","correct":false},{"id":"c","text":"A variable-area duct used to control rotor RPM directly","correct":false}]',
     '{"B1"}'),

    (s7_id, 'What is a "choked nozzle"?',
     '[{"id":"a","text":"A condition where exhaust gas velocity at the nozzle opening reaches Mach 1, so flow cannot increase further and extra flow builds up pressure in the nozzle","correct":true},{"id":"b","text":"A nozzle that has become physically blocked by carbon deposits","correct":false},{"id":"c","text":"A nozzle whose variable area has failed in the fully closed position","correct":false}]',
     '{"B1"}'),

    (s7_id, 'Pressure thrust in a choked nozzle can be calculated by:',
     '[{"id":"a","text":"Multiplying the pressure differential between the inside of the nozzle and ambient air by the area of the nozzle opening","correct":true},{"id":"b","text":"Dividing exhaust gas temperature by nozzle diameter","correct":false},{"id":"c","text":"Multiplying fan RPM by compressor pressure ratio","correct":false}]',
     '{"B1"}'),

    (s7_id, 'In a convergent-divergent (C-D) exhaust nozzle, the divergent section is used to:',
     '[{"id":"a","text":"Accommodate the additional volume of gas flowing at supersonic rates after it becomes supersonic beyond the throat","correct":true},{"id":"b","text":"Slow the gases back down to subsonic velocity before they exit the engine","correct":false},{"id":"c","text":"Mix fan air with core exhaust gas","correct":false}]',
     '{"B1"}'),

    (s7_id, 'Thrust reverser systems are generally divided into which two categories?',
     '[{"id":"a","text":"Mechanical blockage and aerodynamic blockage","correct":true},{"id":"b","text":"Fixed-area and variable-area","correct":false},{"id":"c","text":"Convergent and convergent-divergent","correct":false}]',
     '{"B1"}'),

    (s7_id, 'A mechanical-blockage thrust reverser, using an inverted cone, half-sphere, or clamshell obstruction, is generally used with:',
     '[{"id":"a","text":"Ducted turbofan engines, where fan and core flow mix in a common nozzle","correct":true},{"id":"b","text":"Unducted turbofan engines only","correct":false},{"id":"c","text":"Turboprop engines exclusively","correct":false}]',
     '{"B1"}'),

    (s7_id, 'A modern aerodynamic-blockage thrust reverser system, used mainly with unducted turbofan engines, consists of a translating cowl, blocker doors, and:',
     '[{"id":"a","text":"Cascade vanes that redirect the fan airflow forward","correct":true},{"id":"b","text":"An inverted cone that blocks the core exhaust stream","correct":false},{"id":"c","text":"A variable-area convergent-divergent nozzle","correct":false}]',
     '{"B1"}'),

    (s7_id, 'A vectoring exhaust nozzle can typically be moved up and down by approximately how many degrees to increase flight maneuverability?',
     '[{"id":"a","text":"20°","correct":true},{"id":"b","text":"90°","correct":false},{"id":"c","text":"5°","correct":false}]',
     '{"B1"}'),

    (s7_id, 'Of the three sources of gas turbine engine noise (air intake, engine housing vibration, and engine exhaust), which produces the greatest noise?',
     '[{"id":"a","text":"The engine exhaust","correct":true},{"id":"b","text":"The engine air intake","correct":false},{"id":"c","text":"Vibration from the engine housing","correct":false}]',
     '{"B1"}'),

    (s7_id, 'The two types of engine noise suppressor currently in use, which break the main jet exhaust stream into a number of smaller jet streams, are the corrugated perimeter type and the:',
     '[{"id":"a","text":"Multi-tube type","correct":true},{"id":"b","text":"Acoustic honeycomb type","correct":false},{"id":"c","text":"Cascade vane type","correct":false}]',
     '{"B1"}');

END $$;
