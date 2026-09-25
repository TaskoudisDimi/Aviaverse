-- Migration 086: Append "Small Aircraft Fuel System" appendix content to M11B.12 (Fuel Systems)
-- Source: m11b.txt lines 16816-17634, section "10.A - SMALL AIRCRAFT FUEL SYSTEM"
-- This section covers simplified/GA-style fuel system topics not covered by migrations 083/084:
-- shut-off valve placement, fuel level gauges, return lines, drain valves, tank interconnection,
-- screens/gascolator, electrical fuel pump, fuel lines/fittings, sizing, vapor lock, quick
-- disconnects, fire protection, fuel flow testing, and aerobatic (inverted-flight) fuel supply.

DO $$
DECLARE
    s12_id INT;
BEGIN
    SELECT id INTO s12_id FROM easa_subjects WHERE code = 'M11B.12';

    IF s12_id IS NULL THEN
        RAISE NOTICE 'M11B.12 not found, skipping.';
        RETURN;
    END IF;

    -- Idempotency guard: skip if this backfill was already applied.
    IF EXISTS (
        SELECT 1 FROM easa_subjects WHERE id = s12_id AND content LIKE '%Small Aircraft Fuel System%'
    ) THEN
        RAISE NOTICE 'M11B.12 small-aircraft appendix already seeded, skipping.';
        RETURN;
    END IF;

    UPDATE easa_subjects
    SET content = content || $cnt$

## Small Aircraft Fuel System

This section covers simplified fuel system arrangements typical of small/light aeroplanes,
supplementing the fuel system topics already covered above.

### Fuel System Components: Shut-Off Valve

The simplest fuel system is a single line from one tank, or a gravity-fed system of
interconnected tanks on a high-wing aeroplane. Even the simplest system needs a shut-off
valve (or fuel selector valve, if multiple tanks are fitted) so that, in case of a fuel leak,
fire, or forced landing, the pilot can shut off the fuel supply to the engine. The valve must
be within easy reach and preferably easy view of the pilot — located between the tank(s) and
the engine, aft of the firewall.

If the valve uses O-rings, they must be compatible with the fuel used. A simple compatibility
test: submerge the O-ring in the fuel for 24 hours. If it survives without abnormal swelling,
softening, cracking, or falling apart when pulled on gently, it is suitable for use (slight
swelling is normal). This test is especially important when using automotive fuel containing
alcohol.

### Fuel Level Gauges

The simplest fuel level indicator is a float with a rod sticking out of the top of the tank.
Every independent tank should have its own fuel level gauge.

- **Sight gauge**: a common solution on high- or mid-wing aeroplanes — a clear tube mounted
  to the wing root rib, allowing the remaining fuel to be seen directly.
- **Remote sensors** (when tanks are not conveniently located, requiring a panel-mounted gauge):
  - **Float-type sensors** use a variable resistor. Resistance is lowest at full fuel and
    highest at empty. This arrangement is deliberate: it avoids indicating more fuel than is
    actually present if resistance increases for other reasons (e.g. a bad or corroded contact).
  - **Capacitance-type sensors** have no moving parts and are usually more accurate than float
    sensors, but their readings depend on the fuel type used for calibration. For example, a
    capacitance probe calibrated to read "full" with auto gas will read less than full with
    Avgas. The indicating gauge must be matched to the type of sensor used.

### Fuel Return Lines

Engines requiring a fuel return line (vapour return line) need a means to route the return
line to the tank being drawn from, and to shut it off when required. The best arrangement is a
dual-line fuel selector that switches the main and return lines together; a separate selector
for the return line is less elegant and invites operating errors. High-wing aeroplanes need a
check valve in the return line to prevent fuel draining back from the tank to the engine when
the engine is not running; low-wing aeroplanes do not need this check valve, since gravity
performs the same function. The return line should enter the tank at the highest point of the
wing root (or innermost tank) rib, to minimise outlet pressure. The return line must not be
teed into the main fuel line, since it also returns vapour that the system is trying to remove
from the main feed.

### Drain Valves

Tanks can collect significant amounts of water, entering through leaking fuel caps (the most
common source), refuelling from contaminated cans, or occasionally from a fuel truck. Drain
valves fitted at the lowest point of each tank allow water and dirt to be checked for and
removed before every flight. Drain valves are spring-loaded: they open when pushed and reseal
when released, and are screwed into a fitting riveted or bonded to the wing skin at the tank's
lowest point (with the aeroplane on the ground). Some fittings protrude further than others;
flush/recessed types produce less drag. Because drain valves are frequently in contact with
water, steel types are prone to corrosion and should be replaced if they show signs of sticking
or leaking. Plastic drain valves are used to minimise lightning-strike potential. Any fuel
drain must be kept well clear of the exhaust (at least 12 inches).

### Tanks and Interconnection

A single tank is straightforward; two tanks can be managed with a selector valve. Interconnected
wing tanks must have connections at both the high and low points, with the connecting tubes
sized large enough for rapid filling and for the fuel level to equalise. The air spaces of
interconnected tanks must also be properly connected to equalise pressure — unequal pressure
produces unequal fuel levels. A center drain in the interconnect vent line prevents fuel being
trapped in a low spot if the tanks are overfilled. Once interconnected in this way, the two
tanks can be treated as one and only a simple on/off valve is needed (no selector valve).

Fuel tank vents should be sized similarly to the fuel lines. Vents must be located at the
highest practical point to avoid siphoning fuel, particularly with the aeroplane on a sloped
surface or when tank expansion space is insufficient and the sun heats the fuel. A plugged
vent will eventually starve the engine of fuel as the pump can no longer overcome the suction.

### Fuel Screens and Filters

The engine fuel pick-up should be at the second-lowest point of the tank (the lowest point is
reserved for the drain valve) and should be fitted with a small screen — around 16 mesh — to
keep out fibres, paint flakes, and sealant debris without being so fine that it clogs easily.
Any particles or water that pass the tank screen are caught in the **gascolator**: a small bowl
with a fine mesh screen and a drain valve, which should be drained before every flight. The
gascolator should be located downstream of the fuel selector (so fuel from any tank passes
through it) and at the lowest point of the fuel system, since a gascolator mounted too high can
allow air to interrupt fuel flow. A gascolator mounted forward of the firewall should be made
of steel to be fireproof.

Automotive-style inline paper fuel filters are not recommended: they can become soaked with
water that freezes and blocks fuel flow, and can restrict or block flow entirely with no bypass
if not regularly checked and replaced.

### Electrical Fuel Pump

High-wing aeroplanes with the carburettor below the tank can often rely on gravity feed without
an electric fuel pump. Low-wing aeroplanes, or fuel-injected engines, generally need an electric
pump to move fuel uphill and to assist starting. Carburetted engines require only a simple,
low-pressure pump (under 10 psi); fuel-injected engines require considerably higher pressure, up
to 50 psi, and generally cannot be started without an electric pump. The fuel pump should be
located downstream of the fuel selector (so it serves every tank) and, ideally, downstream of
the gascolator, so that dirt does not pass through the pump. If the pump is installed upstream
of the gascolator and pressurises the lines, the gascolator (not designed for much pressure) may
begin to leak.

A fuel flow transducer, if installed, should be located in the line between the engine-driven
pump and the carburettor/fuel metering unit — installing it before the engine-driven pump on
engines with return lines would cause it to over-read. Fuel flow transducers use a small
rotating wheel whose speed is converted into a flow reading, with a bypass in case the wheel
sticks; accuracy improves with less turbulent flow, so the transducer should be installed in a
straight section of hose, well clear of fittings and bends.

Continuous-flow fuel injection does not inject fuel directly into the cylinder — it continuously
dribbles fuel onto the outside of the intake valve, where it puddles and is drawn in when the
valve opens. Only diesel aircraft engines are "true" fuel-injected engines, injecting fuel under
very high pressure directly into the cylinder. Fuel primers, used on carburetted engines for
cold starting, inject fuel directly into the intake manifold via a mechanical primer pump located
in the cabin, T'd into a fuel line and routed to one or more cylinders.

### Fuel Lines and Fittings

Rubber hoses are the least expensive option and are adequate for low-pressure (3-5 psi) fuel
systems, but must be specifically rated for fuel use. Rubber hoses age, particularly in hot
locations: unprotected hoses near the exhaust in the engine compartment may last well under a
year, while hoses on the cabin side can last five years or more; hoses should be inspected by
bending them and checking for cracks. Teflon hoses and hard (aluminium) lines both have an
effectively unlimited service life and are suitable for higher-pressure fuel-injected systems.
Aluminium fittings are colour-coded blue, steel fittings black. Silicone sealant must never be
used on fuel system joints, as it is not fuel resistant; where sealant is required, a Mil-Spec
fuel-resistant sealant must be used instead. Flared fitting surfaces should not be sealed with
any sealant at all — the seal is made metal-to-metal.

Fire sleeve (a braided glass-fibre wrapping impregnated with silicone) protects hoses from fire
and must be cut long enough that it does not pull back and expose the fitting when the hose is
bent, since the fitting is the weak point in a fire.

### Sizing of Fuel Lines

Fuel line size depends on the engine's maximum fuel flow and line length. As a general starting
point: 4-8 gal/hour needs 1/4" O.D. tubing, 8-20 gal/hour needs 3/8" O.D. tubing, and 20-40
gal/hour needs 1/2" O.D. tubing. Engines with a fuel return line (such as fuel-injected
Continental engines) need the return flow added to the maximum takeoff fuel consumption when
sizing the main line — on Continental engines the "vapor return flow" is typically about
one-third of total fuel flow, so a Continental installation may need a larger main line diameter
than a Lycoming of similar horsepower.

### Avoiding Vapor Lock

Fuel components begin to boil/vaporise above about 110°F. Vapour bubbles forming in the fuel
line can block fuel flow — a symptom is a rise in EGT as the mixture leans out, which enriching
the mixture will not fix, since the restriction is caused by vapour, not the mixture setting.
To reduce the risk of vapor lock: keep the fuel cool (light-coloured tank paint, insulated
lines/strainers, cool airflow around the pump), avoid low tank pressure, and consider a tank
vent that provides positive (ram air) pressure. Automotive fuel has a higher vapour pressure
than Avgas and is more prone to vapor lock; liquid water in the fuel also increases vapour
pressure. Fuel return lines help by circulating and cooling the fuel. Above 18,000 ft, reduced
ambient pressure increases the likelihood of vapor problems, and a continuous boost pump
(around 5 psi) may be needed at high altitude.

### Quick Disconnect Fittings

Aeroplanes with removable wings benefit from quick-disconnect fuel line fittings, saving the
need to drain fuel before removing the wings. Their O-rings must be tested for fuel compatibility
the same way as other O-rings (24-hour submersion test). Quick disconnect fittings may be made
of plastic (Nylon has good fuel resistance) or metal, and should shut off fuel on both ends when
disconnected, though a small residual amount of fuel inside the fitting will be released.

### Fire Protection

A study found that 94% of fires in small aeroplanes occur on the ground, particularly as
post-crash fires. Firewall-forward, steel fittings and protected (fire-sleeved) hoses should be
used. Fuel lines passing through the firewall use a bulkhead fitting: for lines under half an
inch, steel is used; for half an inch and larger, aluminium protected by fire sleeve is
considered sufficiently fire resistant.

### Fuel Flow Test

Once fuel lines are connected, the fuel pump (or gravity feed) must be shown to supply at least
about 125% of the maximum fuel flow needed for full power. This can be verified by disconnecting
the fuel line at the carburettor/fuel metering unit, holding a container at the same level as
the disconnected line, and timing how long it takes to collect a measured quantity of fuel using
the electric pump or gravity feed, with the aeroplane positioned in its worst-case attitude
(e.g. a steep climb attitude for a front-engine aeroplane).

### Aerobatic (Inverted-Flight) Fuel Supply

Aeroplanes intended for extended inverted flight need a way to keep supplying fuel to the engine
in any attitude. Two approaches are used:

- **Flop tube**: a flexible hose with a weight on its free end, inside the tank (used, for
  example, in the Pitts). The weight causes the hose to "flop" to whichever side of the tank is
  lowest, drawing fuel from the bottom regardless of the aeroplane's attitude.
- **Header tank**: used in aeroplanes such as the Super Decathlon (a high-wing monoplane), where
  the main tanks are in the wings above the engine. In upright flight, fuel gravity-feeds from
  the wing tanks into a small header tank near the pilot's feet, which supplies the engine-driven
  pump. When inverted, the header tank (now above the engine) gravity-feeds the pump directly. A
  check valve in the line from the main tanks to the header tank prevents fuel draining back into
  the main tanks while inverted. In the Decathlon, the header tank holds enough fuel for about
  two minutes of inverted flight.

$cnt$
    WHERE id = s12_id;

    INSERT INTO questions (subject_id, text, options, licence_types) VALUES
    (s12_id, 'On a small aeroplane, where should the fuel shut-off (or fuel selector) valve be located?',
     '[{"id":"a","text":"Between the tank(s) and the engine, aft of the firewall, within easy reach and view of the pilot","correct":true},{"id":"b","text":"Inside the fuel tank itself, so it cannot be reached in flight","correct":false},{"id":"c","text":"Forward of the firewall, next to the engine-driven fuel pump","correct":false}]',
     '{"B1"}'),

    (s12_id, 'How is an O-ring tested for compatibility with a particular fuel before use in a fuel system component such as a shut-off valve?',
     '[{"id":"a","text":"It is submerged in the fuel for 24 hours and checked for abnormal swelling, softening, or cracking","correct":true},{"id":"b","text":"It is heated in an oven to 110°F and checked for discoloration","correct":false},{"id":"c","text":"It is coated with silicone sealant and inspected after one hour","correct":false}]',
     '{"B1"}'),

    (s12_id, 'What is a "sight gauge" fuel level indicator, as commonly used on high- or mid-wing small aeroplanes?',
     '[{"id":"a","text":"A clear tube mounted to the wing root rib that allows the fuel remaining in the tank to be seen directly","correct":true},{"id":"b","text":"A capacitance probe mounted in the fuel pump housing","correct":false},{"id":"c","text":"A pressure switch that illuminates a warning light when the tank is empty","correct":false}]',
     '{"B1"}'),

    (s12_id, 'In a float-type (resistor-based) remote fuel level sensor, what happens to the electrical resistance as the tank empties?',
     '[{"id":"a","text":"Resistance is lowest when the tank is full and highest when the tank is empty","correct":true},{"id":"b","text":"Resistance is highest when the tank is full and lowest when the tank is empty","correct":false},{"id":"c","text":"Resistance stays constant regardless of fuel level and only current changes","correct":false}]',
     '{"B1"}'),

    (s12_id, 'A capacitance-type fuel level sensor is calibrated to read "full" using auto gas. What happens if the tank is then filled with Avgas instead?',
     '[{"id":"a","text":"The gauge will read less than full even though the tank is actually full","correct":true},{"id":"b","text":"The gauge reading is unaffected, since capacitance sensors are fuel-type independent","correct":false},{"id":"c","text":"The gauge will read over-full and trigger a warning light","correct":false}]',
     '{"B1"}'),

    (s12_id, 'Why do high-wing aeroplanes need a check valve in the fuel return line, while low-wing aeroplanes generally do not?',
     '[{"id":"a","text":"On a high-wing aeroplane, without the check valve fuel could drain back from the tank to the engine when the engine is stopped; on a low wing, gravity already prevents this","correct":true},{"id":"b","text":"High-wing aeroplanes need it to increase fuel pressure at altitude, which low-wing aeroplanes do not require","correct":false},{"id":"c","text":"The check valve is only needed to prevent vapor lock, which only occurs on high-wing designs","correct":false}]',
     '{"B1"}'),

    (s12_id, 'What is the purpose of the gascolator in a small aeroplane fuel system, and where should it be located?',
     '[{"id":"a","text":"To trap dirt and water via a fine mesh screen and drain valve; it should be downstream of the fuel selector and at the lowest point of the fuel system","correct":true},{"id":"b","text":"To boost fuel pressure for fuel-injected engines; it should be mounted as high as possible in the fuel system","correct":false},{"id":"c","text":"To cool the fuel and prevent vapor lock; it should be mounted directly on the exhaust manifold","correct":false}]',
     '{"B1"}'),

    (s12_id, 'Why should the fuel screen inside the tank (finger strainer) not use too fine a mesh, such as much finer than about 16 mesh?',
     '[{"id":"a","text":"Too fine a mesh can clog too easily and block the fuel supply to the engine","correct":true},{"id":"b","text":"A fine mesh increases fuel vapour pressure and promotes vapor lock","correct":false},{"id":"c","text":"A fine mesh is not compatible with O-ring seals in the fuel selector valve","correct":false}]',
     '{"B1"}'),

    (s12_id, 'What pressure range is typical for the fuel pump feeding a carburetted (non-fuel-injected) small aeroplane engine, compared to a fuel-injected engine?',
     '[{"id":"a","text":"Carburetted engines need a low-pressure pump, under about 10 psi; fuel-injected engines may need up to about 50 psi","correct":true},{"id":"b","text":"Carburetted engines need about 50 psi; fuel-injected engines need less than 10 psi","correct":false},{"id":"c","text":"Both carburetted and fuel-injected engines require the same fuel pressure, around 25 psi","correct":false}]',
     '{"B1"}'),

    (s12_id, 'What is "vapor lock" in a small aeroplane fuel system, and what is one recognisable symptom?',
     '[{"id":"a","text":"Fuel vaporising in the lines and blocking fuel flow; a symptom is a rise in EGT as the mixture leans out, which enriching the mixture does not correct","correct":true},{"id":"b","text":"Air trapped in the gascolator drain valve; a symptom is a drop in oil pressure","correct":false},{"id":"c","text":"Ice forming in the carburettor throat; a symptom is a rise in manifold pressure","correct":false}]',
     '{"B1"}'),

    (s12_id, 'As a general starting point for sizing small aeroplane fuel lines, what tubing outer diameter is suggested for a fuel flow of about 8-20 gallons per hour?',
     '[{"id":"a","text":"3/8\" O.D. tubing","correct":true},{"id":"b","text":"1/4\" O.D. tubing","correct":false},{"id":"c","text":"1/2\" O.D. tubing","correct":false}]',
     '{"B1"}'),

    (s12_id, 'According to a study referenced in the small aircraft fuel system material, what proportion of fires in small aeroplanes occur on the ground (particularly post-crash)?',
     '[{"id":"a","text":"94%","correct":true},{"id":"b","text":"50%","correct":false},{"id":"c","text":"6%","correct":false}]',
     '{"B1"}'),

    (s12_id, 'What must be demonstrated by a fuel flow test after connecting the fuel system from tank to engine?',
     '[{"id":"a","text":"That the fuel pump or gravity feed can supply about 125% of the maximum fuel flow needed for full power","correct":true},{"id":"b","text":"That the fuel pump can maintain exactly the idle fuel flow for at least one hour","correct":false},{"id":"c","text":"That the gascolator drain valve seals to at least 50 psi","correct":false}]',
     '{"B1"}'),

    (s12_id, 'What is the purpose of a "flop tube" fuel system, as used in aerobatic aeroplanes such as the Pitts?',
     '[{"id":"a","text":"A weighted flexible hose inside the tank that flops to the lowest point regardless of aeroplane attitude, keeping fuel available in inverted flight","correct":true},{"id":"b","text":"A rigid tube that vents excess fuel overboard during a spin to prevent overfilling","correct":false},{"id":"c","text":"A tube that automatically shuts off the fuel supply whenever the aeroplane is inverted, as a safety feature","correct":false}]',
     '{"B1"}');
END $$;
