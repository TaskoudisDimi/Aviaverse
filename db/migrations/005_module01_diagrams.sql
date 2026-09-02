-- Migration 005: Enrich M01 Mathematics subjects with SVG diagrams
-- Idempotent: skips if diagrams already present (checks for <!-- diag --> marker)

DO $$
DECLARE
    s_id INT;
BEGIN
    -- ──────────────────────────────────────────────────────────────
    -- M01.1 Arithmetic — add BODMAS diagram + powers visual
    -- ──────────────────────────────────────────────────────────────
    SELECT id INTO s_id FROM easa_subjects WHERE code = 'M01.1';

    IF s_id IS NOT NULL AND (SELECT content NOT LIKE '%<!-- diag -->%' FROM easa_subjects WHERE id = s_id) THEN
        UPDATE easa_subjects SET content = content || $diag1$

<!-- diag -->

## BODMAS — Order of Operations

<svg viewBox="0 0 560 64" xmlns="http://www.w3.org/2000/svg" style="width:100%;max-width:560px;display:block;margin:1rem 0;border-radius:8px;overflow:hidden">
  <rect width="560" height="64" fill="#0f172a"/>
  <rect x="4"   y="8" width="82" height="48" rx="6" fill="#1e3a5f"/>
  <rect x="94"  y="8" width="82" height="48" rx="6" fill="#1e3a5f"/>
  <rect x="184" y="8" width="82" height="48" rx="6" fill="#1e3a5f"/>
  <rect x="274" y="8" width="82" height="48" rx="6" fill="#1e3a5f"/>
  <rect x="364" y="8" width="82" height="48" rx="6" fill="#1e3a5f"/>
  <rect x="454" y="8" width="102" height="48" rx="6" fill="#1e3a5f"/>
  <text x="45"  y="24" fill="#38bdf8" font-size="13" font-weight="bold" text-anchor="middle" font-family="monospace">B</text>
  <text x="135" y="24" fill="#38bdf8" font-size="13" font-weight="bold" text-anchor="middle" font-family="monospace">O</text>
  <text x="225" y="24" fill="#38bdf8" font-size="13" font-weight="bold" text-anchor="middle" font-family="monospace">D</text>
  <text x="315" y="24" fill="#38bdf8" font-size="13" font-weight="bold" text-anchor="middle" font-family="monospace">M</text>
  <text x="405" y="24" fill="#38bdf8" font-size="13" font-weight="bold" text-anchor="middle" font-family="monospace">A</text>
  <text x="505" y="24" fill="#38bdf8" font-size="13" font-weight="bold" text-anchor="middle" font-family="monospace">S</text>
  <text x="45"  y="44" fill="#94a3b8" font-size="9"  text-anchor="middle" font-family="sans-serif">Brackets</text>
  <text x="135" y="44" fill="#94a3b8" font-size="9"  text-anchor="middle" font-family="sans-serif">Of / Orders</text>
  <text x="225" y="44" fill="#94a3b8" font-size="9"  text-anchor="middle" font-family="sans-serif">Division</text>
  <text x="315" y="44" fill="#94a3b8" font-size="9"  text-anchor="middle" font-family="sans-serif">Multiply</text>
  <text x="405" y="44" fill="#94a3b8" font-size="9"  text-anchor="middle" font-family="sans-serif">Addition</text>
  <text x="505" y="44" fill="#94a3b8" font-size="9"  text-anchor="middle" font-family="sans-serif">Subtraction</text>
  <text x="87"  y="37" fill="#475569" font-size="16" text-anchor="middle">›</text>
  <text x="177" y="37" fill="#475569" font-size="16" text-anchor="middle">›</text>
  <text x="267" y="37" fill="#475569" font-size="16" text-anchor="middle">›</text>
  <text x="357" y="37" fill="#475569" font-size="16" text-anchor="middle">›</text>
  <text x="447" y="37" fill="#475569" font-size="16" text-anchor="middle">›</text>
</svg>

## Powers Quick Reference

<svg viewBox="0 0 520 110" xmlns="http://www.w3.org/2000/svg" style="width:100%;max-width:520px;display:block;margin:1rem 0;border-radius:8px;overflow:hidden">
  <rect width="520" height="110" fill="#0f172a"/>
  <!-- header row -->
  <rect x="0" y="0" width="520" height="26" fill="#1e293b"/>
  <text x="90"  y="18" fill="#38bdf8" font-size="11" font-weight="bold" font-family="monospace" text-anchor="middle">Expression</text>
  <text x="260" y="18" fill="#38bdf8" font-size="11" font-weight="bold" font-family="monospace" text-anchor="middle">Meaning</text>
  <text x="430" y="18" fill="#38bdf8" font-size="11" font-weight="bold" font-family="monospace" text-anchor="middle">Value</text>
  <!-- rows -->
  <text x="90"  y="44" fill="#e2e8f0" font-size="13" font-family="monospace" text-anchor="middle">2³</text>
  <text x="260" y="44" fill="#94a3b8" font-size="11" font-family="sans-serif" text-anchor="middle">2 × 2 × 2</text>
  <text x="430" y="44" fill="#34d399" font-size="13" font-family="monospace" text-anchor="middle">8</text>
  <text x="90"  y="65" fill="#e2e8f0" font-size="13" font-family="monospace" text-anchor="middle">2⁻³</text>
  <text x="260" y="65" fill="#94a3b8" font-size="11" font-family="sans-serif" text-anchor="middle">1 ÷ (2 × 2 × 2)</text>
  <text x="430" y="65" fill="#34d399" font-size="13" font-family="monospace" text-anchor="middle">0.125</text>
  <text x="90"  y="86" fill="#e2e8f0" font-size="13" font-family="monospace" text-anchor="middle">√64</text>
  <text x="260" y="86" fill="#94a3b8" font-size="11" font-family="sans-serif" text-anchor="middle">What number × itself = 64?</text>
  <text x="430" y="86" fill="#34d399" font-size="13" font-family="monospace" text-anchor="middle">8</text>
  <text x="90"  y="107" fill="#e2e8f0" font-size="13" font-family="monospace" text-anchor="middle">10³</text>
  <text x="260" y="107" fill="#94a3b8" font-size="11" font-family="sans-serif" text-anchor="middle">Scientific notation</text>
  <text x="430" y="107" fill="#34d399" font-size="13" font-family="monospace" text-anchor="middle">1000</text>
  <!-- dividers -->
  <line x1="160" y1="26" x2="160" y2="110" stroke="#1e293b" stroke-width="1"/>
  <line x1="340" y1="26" x2="340" y2="110" stroke="#1e293b" stroke-width="1"/>
  <line x1="0"   y1="52" x2="520" y2="52"  stroke="#1e293b" stroke-width="1"/>
  <line x1="0"   y1="73" x2="520" y2="73"  stroke="#1e293b" stroke-width="1"/>
  <line x1="0"   y1="94" x2="520" y2="94"  stroke="#1e293b" stroke-width="1"/>
</svg>
$diag1$
        WHERE id = s_id;
        RAISE NOTICE 'M01.1 diagrams added.';
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- M01.2 Algebra — add number systems visual + quadratic formula
    -- ──────────────────────────────────────────────────────────────
    SELECT id INTO s_id FROM easa_subjects WHERE code = 'M01.2';

    IF s_id IS NOT NULL AND (SELECT content NOT LIKE '%<!-- diag -->%' FROM easa_subjects WHERE id = s_id) THEN
        UPDATE easa_subjects SET content = content || $diag2$

<!-- diag -->

## Number Systems Visual

<svg viewBox="0 0 540 130" xmlns="http://www.w3.org/2000/svg" style="width:100%;max-width:540px;display:block;margin:1rem 0;border-radius:8px;overflow:hidden">
  <rect width="540" height="130" fill="#0f172a"/>
  <!-- header -->
  <rect x="0" y="0" width="540" height="26" fill="#1e293b"/>
  <text x="70"  y="18" fill="#38bdf8" font-size="11" font-weight="bold" font-family="monospace" text-anchor="middle">System</text>
  <text x="180" y="18" fill="#38bdf8" font-size="11" font-weight="bold" font-family="monospace" text-anchor="middle">Base</text>
  <text x="290" y="18" fill="#38bdf8" font-size="11" font-weight="bold" font-family="monospace" text-anchor="middle">Digits</text>
  <text x="430" y="18" fill="#38bdf8" font-size="11" font-weight="bold" font-family="monospace" text-anchor="middle">Example (45)</text>
  <!-- rows -->
  <rect x="2" y="28" width="136" height="24" rx="3" fill="#172554"/>
  <text x="70"  y="44" fill="#e2e8f0" font-size="12" font-family="monospace" text-anchor="middle">Binary</text>
  <text x="180" y="44" fill="#a78bfa" font-size="12" font-family="monospace" text-anchor="middle">2</text>
  <text x="290" y="44" fill="#94a3b8" font-size="12" font-family="sans-serif" text-anchor="middle">0, 1</text>
  <text x="430" y="44" fill="#34d399" font-size="12" font-family="monospace" text-anchor="middle">101101₂</text>
  <text x="70"  y="66" fill="#e2e8f0" font-size="12" font-family="monospace" text-anchor="middle">Octal</text>
  <text x="180" y="66" fill="#a78bfa" font-size="12" font-family="monospace" text-anchor="middle">8</text>
  <text x="290" y="66" fill="#94a3b8" font-size="12" font-family="sans-serif" text-anchor="middle">0 – 7</text>
  <text x="430" y="66" fill="#34d399" font-size="12" font-family="monospace" text-anchor="middle">55₈</text>
  <text x="70"  y="88" fill="#e2e8f0" font-size="12" font-family="monospace" text-anchor="middle">Decimal</text>
  <text x="180" y="88" fill="#a78bfa" font-size="12" font-family="monospace" text-anchor="middle">10</text>
  <text x="290" y="88" fill="#94a3b8" font-size="12" font-family="sans-serif" text-anchor="middle">0 – 9</text>
  <text x="430" y="88" fill="#34d399" font-size="12" font-family="monospace" text-anchor="middle">45₁₀</text>
  <text x="70"  y="110" fill="#e2e8f0" font-size="12" font-family="monospace" text-anchor="middle">Hex</text>
  <text x="180" y="110" fill="#a78bfa" font-size="12" font-family="monospace" text-anchor="middle">16</text>
  <text x="290" y="110" fill="#94a3b8" font-size="12" font-family="sans-serif" text-anchor="middle">0–9, A–F</text>
  <text x="430" y="110" fill="#34d399" font-size="12" font-family="monospace" text-anchor="middle">2D₁₆</text>
  <!-- dividers -->
  <line x1="140" y1="26" x2="140" y2="130" stroke="#1e293b" stroke-width="1"/>
  <line x1="240" y1="26" x2="240" y2="130" stroke="#1e293b" stroke-width="1"/>
  <line x1="350" y1="26" x2="350" y2="130" stroke="#1e293b" stroke-width="1"/>
  <line x1="0"   y1="52" x2="540" y2="52"  stroke="#1e293b" stroke-width="1"/>
  <line x1="0"   y1="74" x2="540" y2="74"  stroke="#1e293b" stroke-width="1"/>
  <line x1="0"   y1="96" x2="540" y2="96"  stroke="#1e293b" stroke-width="1"/>
</svg>

## Binary Conversion: 45 → 101101₂

<svg viewBox="0 0 460 70" xmlns="http://www.w3.org/2000/svg" style="width:100%;max-width:460px;display:block;margin:1rem 0;border-radius:8px;overflow:hidden">
  <rect width="460" height="70" fill="#0f172a"/>
  <!-- bit position labels -->
  <text x="60"  y="16" fill="#475569" font-size="10" text-anchor="middle" font-family="monospace">2⁵</text>
  <text x="120" y="16" fill="#475569" font-size="10" text-anchor="middle" font-family="monospace">2⁴</text>
  <text x="180" y="16" fill="#475569" font-size="10" text-anchor="middle" font-family="monospace">2³</text>
  <text x="240" y="16" fill="#475569" font-size="10" text-anchor="middle" font-family="monospace">2²</text>
  <text x="300" y="16" fill="#475569" font-size="10" text-anchor="middle" font-family="monospace">2¹</text>
  <text x="360" y="16" fill="#475569" font-size="10" text-anchor="middle" font-family="monospace">2⁰</text>
  <text x="60"  y="28" fill="#94a3b8" font-size="9"  text-anchor="middle" font-family="monospace">32</text>
  <text x="120" y="28" fill="#94a3b8" font-size="9"  text-anchor="middle" font-family="monospace">16</text>
  <text x="180" y="28" fill="#94a3b8" font-size="9"  text-anchor="middle" font-family="monospace">8</text>
  <text x="240" y="28" fill="#94a3b8" font-size="9"  text-anchor="middle" font-family="monospace">4</text>
  <text x="300" y="28" fill="#94a3b8" font-size="9"  text-anchor="middle" font-family="monospace">2</text>
  <text x="360" y="28" fill="#94a3b8" font-size="9"  text-anchor="middle" font-family="monospace">1</text>
  <!-- bit boxes -->
  <rect x="30"  y="34" width="60" height="28" rx="4" fill="#1e3a5f"/>
  <rect x="90"  y="34" width="60" height="28" rx="4" fill="#1e293b"/>
  <rect x="150" y="34" width="60" height="28" rx="4" fill="#1e3a5f"/>
  <rect x="210" y="34" width="60" height="28" rx="4" fill="#1e3a5f"/>
  <rect x="270" y="34" width="60" height="28" rx="4" fill="#1e293b"/>
  <rect x="330" y="34" width="60" height="28" rx="4" fill="#1e3a5f"/>
  <text x="60"  y="53" fill="#38bdf8" font-size="16" font-weight="bold" text-anchor="middle" font-family="monospace">1</text>
  <text x="120" y="53" fill="#475569" font-size="16" font-weight="bold" text-anchor="middle" font-family="monospace">0</text>
  <text x="180" y="53" fill="#38bdf8" font-size="16" font-weight="bold" text-anchor="middle" font-family="monospace">1</text>
  <text x="240" y="53" fill="#38bdf8" font-size="16" font-weight="bold" text-anchor="middle" font-family="monospace">1</text>
  <text x="300" y="53" fill="#475569" font-size="16" font-weight="bold" text-anchor="middle" font-family="monospace">0</text>
  <text x="360" y="53" fill="#38bdf8" font-size="16" font-weight="bold" text-anchor="middle" font-family="monospace">1</text>
  <text x="420" y="53" fill="#34d399" font-size="13" font-weight="bold" font-family="monospace">= 45</text>
</svg>
$diag2$
        WHERE id = s_id;
        RAISE NOTICE 'M01.2 diagrams added.';
    END IF;

    -- ──────────────────────────────────────────────────────────────
    -- M01.3 Geometry — add right triangle + circle + trig table
    -- ──────────────────────────────────────────────────────────────
    SELECT id INTO s_id FROM easa_subjects WHERE code = 'M01.3';

    IF s_id IS NOT NULL AND (SELECT content NOT LIKE '%<!-- diag -->%' FROM easa_subjects WHERE id = s_id) THEN
        UPDATE easa_subjects SET content = content || $diag3$

<!-- diag -->

## Right-Angled Triangle (SOHCAHTOA)

<svg viewBox="0 0 520 200" xmlns="http://www.w3.org/2000/svg" style="width:100%;max-width:520px;display:block;margin:1rem 0;border-radius:8px;overflow:hidden">
  <rect width="520" height="200" fill="#0f172a"/>
  <!-- triangle -->
  <polygon points="60,160 340,160 60,40" fill="none" stroke="#334155" stroke-width="2"/>
  <!-- right angle box -->
  <rect x="60" y="140" width="20" height="20" fill="none" stroke="#475569" stroke-width="1.5"/>
  <!-- angle arc at bottom-left (approx) -->
  <path d="M 60,160 Q 100,160 100,130" fill="none" stroke="#38bdf8" stroke-width="1.5" stroke-dasharray="4,2"/>
  <text x="95"  y="158" fill="#38bdf8" font-size="14" font-family="sans-serif">θ</text>
  <!-- labels -->
  <text x="190" y="178" fill="#34d399" font-size="14" font-weight="bold" font-family="sans-serif" text-anchor="middle">Adjacent</text>
  <text x="38"  y="105" fill="#a78bfa" font-size="14" font-weight="bold" font-family="sans-serif" text-anchor="middle" transform="rotate(-90,38,105)">Opposite</text>
  <text x="212" y="95"  fill="#fb923c" font-size="14" font-weight="bold" font-family="sans-serif" text-anchor="middle" transform="rotate(-55,212,95)">Hypotenuse (c)</text>
  <!-- Pythagoras -->
  <text x="380" y="70"  fill="#e2e8f0" font-size="13" font-family="monospace">c² = a² + b²</text>
  <!-- SOHCAHTOA box -->
  <rect x="370" y="90" width="140" height="90" rx="6" fill="#1e293b"/>
  <text x="440" y="108" fill="#38bdf8" font-size="11" font-weight="bold" font-family="monospace" text-anchor="middle">SOH</text>
  <text x="440" y="122" fill="#94a3b8" font-size="10" font-family="sans-serif" text-anchor="middle">sin θ = Opp/Hyp</text>
  <text x="440" y="138" fill="#38bdf8" font-size="11" font-weight="bold" font-family="monospace" text-anchor="middle">CAH</text>
  <text x="440" y="152" fill="#94a3b8" font-size="10" font-family="sans-serif" text-anchor="middle">cos θ = Adj/Hyp</text>
  <text x="440" y="168" fill="#38bdf8" font-size="11" font-weight="bold" font-family="monospace" text-anchor="middle">TOA</text>
  <text x="440" y="182" fill="#94a3b8" font-size="10" font-family="sans-serif" text-anchor="middle">tan θ = Opp/Adj</text>
</svg>

## Circle Formulas

<svg viewBox="0 0 480 160" xmlns="http://www.w3.org/2000/svg" style="width:100%;max-width:480px;display:block;margin:1rem 0;border-radius:8px;overflow:hidden">
  <rect width="480" height="160" fill="#0f172a"/>
  <!-- circle -->
  <circle cx="140" cy="80" r="64" fill="none" stroke="#334155" stroke-width="2"/>
  <!-- radius -->
  <line x1="140" y1="80" x2="204" y2="80" stroke="#38bdf8" stroke-width="2"/>
  <text x="172" y="72" fill="#38bdf8" font-size="12" font-family="monospace">r</text>
  <!-- diameter -->
  <line x1="76" y1="80" x2="204" y2="80" stroke="#a78bfa" stroke-width="1.5" stroke-dasharray="4,3"/>
  <text x="104" y="100" fill="#a78bfa" font-size="11" font-family="monospace">D = 2r</text>
  <!-- centre dot -->
  <circle cx="140" cy="80" r="3" fill="#38bdf8"/>
  <!-- arc label -->
  <path d="M 140,80 L 176,42" stroke="#475569" stroke-width="1" stroke-dasharray="3,2"/>
  <!-- formula box -->
  <rect x="260" y="20" width="210" height="120" rx="8" fill="#1e293b"/>
  <text x="365" y="44"  fill="#38bdf8" font-size="12" font-weight="bold" font-family="monospace" text-anchor="middle">Circle Formulas</text>
  <line x1="270" y1="50" x2="460" y2="50" stroke="#334155" stroke-width="1"/>
  <text x="365" y="68"  fill="#94a3b8" font-size="11" font-family="sans-serif" text-anchor="middle">Circumference = πD = 2πr</text>
  <text x="365" y="88"  fill="#94a3b8" font-size="11" font-family="sans-serif" text-anchor="middle">Area = πr²</text>
  <text x="365" y="108" fill="#94a3b8" font-size="11" font-family="sans-serif" text-anchor="middle">Arc = rθ  (θ in radians)</text>
  <text x="365" y="128" fill="#94a3b8" font-size="11" font-family="sans-serif" text-anchor="middle">Sector area = ½r²θ</text>
</svg>

## Sine Wave

<svg viewBox="0 0 500 100" xmlns="http://www.w3.org/2000/svg" style="width:100%;max-width:500px;display:block;margin:1rem 0;border-radius:8px;overflow:hidden">
  <rect width="500" height="100" fill="#0f172a"/>
  <!-- axes -->
  <line x1="30" y1="50" x2="490" y2="50" stroke="#334155" stroke-width="1"/>
  <line x1="30" y1="10" x2="30"  y2="90" stroke="#334155" stroke-width="1"/>
  <!-- sine wave approximation -->
  <path d="M 30,50 C 60,50 75,15 90,15 S 120,50 135,50 S 165,85 180,85 S 210,50 225,50 S 255,15 270,15 S 300,50 315,50 S 345,85 360,85 S 390,50 405,50 S 435,15 450,15 S 480,50 490,50"
        fill="none" stroke="#38bdf8" stroke-width="2.5"/>
  <!-- labels -->
  <text x="22"  y="54" fill="#475569" font-size="9" text-anchor="middle" font-family="monospace">0</text>
  <text x="22"  y="16" fill="#34d399" font-size="9" text-anchor="middle" font-family="monospace">+A</text>
  <text x="22"  y="88" fill="#fb923c" font-size="9" text-anchor="middle" font-family="monospace">−A</text>
  <text x="90"  y="8"  fill="#94a3b8" font-size="9" text-anchor="middle" font-family="monospace">90°</text>
  <text x="180" y="96" fill="#94a3b8" font-size="9" text-anchor="middle" font-family="monospace">180°</text>
  <text x="270" y="8"  fill="#94a3b8" font-size="9" text-anchor="middle" font-family="monospace">270°</text>
  <text x="360" y="96" fill="#94a3b8" font-size="9" text-anchor="middle" font-family="monospace">360°</text>
  <text x="460" y="46" fill="#38bdf8" font-size="11" font-weight="bold" font-family="monospace">sin</text>
</svg>
$diag3$
        WHERE id = s_id;
        RAISE NOTICE 'M01.3 diagrams added.';
    END IF;

END;
$$;
