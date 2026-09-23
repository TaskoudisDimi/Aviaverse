#!/usr/bin/env bash
# ─── Deploy pre-built binaries to server ──────────────────────────────────────
set -euo pipefail

SERVER="${SERVER:-root@188.245.64.189}"
REMOTE_DIR="/opt/aviaverse"

# SSH with ControlMaster: one connection, reused for every command (no repeated passwords)
SOCKET="/tmp/aviaverse-ssh-$$"
SSH="ssh -o ServerAliveInterval=30 -o ServerAliveCountMax=10 -o ConnectTimeout=30 \
         -o ControlMaster=auto -o ControlPath=$SOCKET -o ControlPersist=120 $SERVER"

if [ ! -d "dist/bin" ]; then
    echo "ERROR: Run 'bash build-prod.sh' first."
    exit 1
fi

cleanup() {
    rm -rf "$STAGE" 2>/dev/null || true
    ssh -O exit -o ControlPath="$SOCKET" "$SERVER" 2>/dev/null || true
}
STAGE=$(mktemp -d)
trap cleanup EXIT

echo "╔══════════════════════════════════════╗"
echo "║   Deploying to $SERVER               ║"
echo "╚══════════════════════════════════════╝"
echo ""

# ── Open the shared SSH connection ───────────────────────────────────────────
echo "→ Connecting to server (enter password once) ..."
$SSH "echo '  ✓ Connected'"

# ── Pack ─────────────────────────────────────────────────────────────────────
echo "→ Packing all files ..."
mkdir -p "$STAGE/dist/bin" \
         "$STAGE/services/"{auth,content,ai,exam,progress,gateway} \
         "$STAGE/nginx" \
         "$STAGE/db/migrations" \
         "$STAGE/frontend/dist"

cp dist/bin/* "$STAGE/dist/bin/"

for svc in auth content ai exam progress gateway; do
    cp "services/$svc/Dockerfile" "$STAGE/services/$svc/"
done

cp -r frontend/dist/. "$STAGE/frontend/dist/"

cp docker-compose.prod.yml        "$STAGE/"
cp nginx/nginx.prod.conf          "$STAGE/nginx/"
cp db/migrations/001_init.sql          "$STAGE/db/migrations/"
cp db/migrations/002_module01_seed.sql "$STAGE/db/migrations/"
cp db/migrations/003_module02_seed.sql "$STAGE/db/migrations/"
cp db/migrations/004_module02_wave_sound.sql "$STAGE/db/migrations/"
cp db/migrations/005_module01_diagrams.sql   "$STAGE/db/migrations/"
cp db/migrations/006_module02_enrich.sql     "$STAGE/db/migrations/"
cp db/migrations/007_license_categories.sql  "$STAGE/db/migrations/"
cp db/migrations/008_module03_ewis_seed.sql  "$STAGE/db/migrations/"
cp db/migrations/009_module03_sta_enrich.sql "$STAGE/db/migrations/"
cp db/migrations/010_move_ewis_to_m07.sql    "$STAGE/db/migrations/"
cp db/migrations/011_module03_electrical_fundamentals_part1.sql "$STAGE/db/migrations/"
cp db/migrations/012_module03_electrical_fundamentals_part2.sql "$STAGE/db/migrations/"
cp db/migrations/013_module03_electrical_fundamentals_part3.sql "$STAGE/db/migrations/"
cp db/migrations/014_module03_electrical_fundamentals_part4.sql "$STAGE/db/migrations/"
cp db/migrations/015_password_reset_tokens.sql "$STAGE/db/migrations/"
cp db/migrations/016_module02_content_audit_fix.sql "$STAGE/db/migrations/"
cp db/migrations/017_module07_rebuild_cleanup.sql "$STAGE/db/migrations/"
cp db/migrations/018_module07_ewis_testing_crimping.sql "$STAGE/db/migrations/"
cp db/migrations/019_module07_soldering_installation.sql "$STAGE/db/migrations/"
cp db/migrations/020_module08_atmosphere_lift.sql "$STAGE/db/migrations/"
cp db/migrations/021_module08_reynolds_drag_stalling.sql "$STAGE/db/migrations/"
cp db/migrations/022_module08_flight_forces_turning.sql "$STAGE/db/migrations/"
cp db/migrations/023_module08_performance_stability.sql "$STAGE/db/migrations/"
cp db/migrations/024_module09_general_performance_factors.sql "$STAGE/db/migrations/"
cp db/migrations/025_module09_social_communication_environment.sql "$STAGE/db/migrations/"
cp db/migrations/026_module09_tasks_errors_hazards.sql "$STAGE/db/migrations/"
cp db/migrations/027_fix_licence_types_b1_matching.sql "$STAGE/db/migrations/"
cp db/migrations/028_module10_regulatory_framework_certifying_staff.sql "$STAGE/db/migrations/"
cp db/migrations/029_module10_approved_maintenance_organizations.sql "$STAGE/db/migrations/"
cp db/migrations/030_module10_air_operations_certification.sql "$STAGE/db/migrations/"
cp db/migrations/031_module10_continuing_airworthiness_national_requirements.sql "$STAGE/db/migrations/"
cp db/migrations/032_module11_fix_title_and_licence.sql "$STAGE/db/migrations/"
cp db/migrations/033_module11a_aerodynamics_structures_general.sql "$STAGE/db/migrations/"
cp db/migrations/034_module11a_airframe_types_aircon.sql "$STAGE/db/migrations/"
cp db/migrations/035_module11a_autoflight_communications.sql "$STAGE/db/migrations/"
cp db/migrations/036_module11a_communications_navigation.sql "$STAGE/db/migrations/"
cp db/migrations/037_module11a_navigation_instruments.sql "$STAGE/db/migrations/"
cp db/migrations/038_module11a_electrical_power_generation.sql "$STAGE/db/migrations/"
cp db/migrations/039_module11a_electrical_power_distribution.sql "$STAGE/db/migrations/"
cp db/migrations/040_module11a_equipment_fire_flightcontrols.sql "$STAGE/db/migrations/"
cp db/migrations/041_module11a_fuel_hydraulics.sql "$STAGE/db/migrations/"
cp db/migrations/042_module11a_icerain_landinggear.sql "$STAGE/db/migrations/"
cp db/migrations/043_module11a_lights_oxygen_general_water.sql "$STAGE/db/migrations/"
cp db/migrations/044_module11a_fix_m19_title.sql "$STAGE/db/migrations/"
cp db/migrations/045_module13_aerodynamics_structures_general.sql "$STAGE/db/migrations/"
cp db/migrations/046_module13_automatic_flight.sql "$STAGE/db/migrations/"
cp db/migrations/047_module13_comms_nav_part1.sql "$STAGE/db/migrations/"
cp db/migrations/048_module13_comms_nav_part2.sql "$STAGE/db/migrations/"
cp db/migrations/049_module13_comms_nav_part3.sql "$STAGE/db/migrations/"
cp db/migrations/050_module13_electrical_equipment.sql "$STAGE/db/migrations/"
cp db/migrations/051_module13_flightcontrols_lights_maintenance.sql "$STAGE/db/migrations/"
cp db/migrations/052_module13_instrument_systems.sql "$STAGE/db/migrations/"
cp db/migrations/053_module13_aircon_fire.sql "$STAGE/db/migrations/"
cp db/migrations/054_module13_fuel_pneumatic_water.sql "$STAGE/db/migrations/"
cp db/migrations/055_module13_hydraulic_power.sql "$STAGE/db/migrations/"
cp db/migrations/056_module13_icerain_infosys.sql "$STAGE/db/migrations/"
cp db/migrations/057_module13_landing_gear.sql "$STAGE/db/migrations/"
cp db/migrations/058_module13_ima_cabin.sql "$STAGE/db/migrations/"
cp db/migrations/059_module14_turbine_engines_starting.sql "$STAGE/db/migrations/"
cp db/migrations/060_module14_engine_indicating_systems.sql "$STAGE/db/migrations/"
cp db/migrations/061_module15_fundamentals_performance_inlet.sql "$STAGE/db/migrations/"
cp db/migrations/062_module15_compressors_combustion_turbine_exhaust.sql "$STAGE/db/migrations/"
cp db/migrations/063_module15_bearings_lubricants_lubrication.sql "$STAGE/db/migrations/"
cp db/migrations/064_module15_fuel_air_systems.sql "$STAGE/db/migrations/"
cp db/migrations/065_module15_starting_ignition_indication.sql "$STAGE/db/migrations/"
cp db/migrations/066_module15_augmentation_turboprop_turboshaft_apu.sql "$STAGE/db/migrations/"
cp db/migrations/067_module15_powerplant_installation_fire.sql "$STAGE/db/migrations/"
cp db/migrations/068_module15_monitoring_storage.sql "$STAGE/db/migrations/"
cp frontend/Dockerfile  "$STAGE/frontend/"
cp frontend/nginx.conf  "$STAGE/frontend/"

DIST_COUNT=$(find "$STAGE/frontend/dist" -type f | wc -l | tr -d ' ')
echo "  frontend/dist: $DIST_COUNT files"
if [ "$DIST_COUNT" -eq 0 ]; then
    echo "ERROR: frontend/dist is empty — run 'bash build-prod.sh' first."
    exit 1
fi

# ── Upload ───────────────────────────────────────────────────────────────────
echo "→ Uploading ..."
tar czf - -C "$STAGE" . | $SSH "mkdir -p $REMOTE_DIR && tar xzf - -C $REMOTE_DIR" 2>/dev/null

# ── Build & start ─────────────────────────────────────────────────────────────
echo "→ Building containers ..."
$SSH "cd $REMOTE_DIR && docker compose -f docker-compose.prod.yml --env-file .env.prod build --no-cache frontend ai auth exam 2>&1"

echo "→ Starting containers ..."
$SSH "cd $REMOTE_DIR && docker compose -f docker-compose.prod.yml --env-file .env.prod up -d --force-recreate frontend ai auth exam 2>&1"

# ── DB migrations ─────────────────────────────────────────────────────────────
echo "→ Running DB migrations ..."
$SSH "
docker exec aviaverse-postgres-1 psql -U vyron vyron -f /docker-entrypoint-initdb.d/003_module02_seed.sql 2>&1 || true
docker exec aviaverse-postgres-1 psql -U vyron vyron -f /docker-entrypoint-initdb.d/004_module02_wave_sound.sql 2>&1 || true
docker exec aviaverse-postgres-1 psql -U vyron vyron -f /docker-entrypoint-initdb.d/005_module01_diagrams.sql 2>&1 || true
docker exec aviaverse-postgres-1 psql -U vyron vyron -f /docker-entrypoint-initdb.d/006_module02_enrich.sql 2>&1 || true
docker exec aviaverse-postgres-1 psql -U vyron vyron -f /docker-entrypoint-initdb.d/007_license_categories.sql 2>&1 || true
docker exec aviaverse-postgres-1 psql -U vyron vyron -f /docker-entrypoint-initdb.d/008_module03_ewis_seed.sql 2>&1 || true
docker exec aviaverse-postgres-1 psql -U vyron vyron -f /docker-entrypoint-initdb.d/009_module03_sta_enrich.sql 2>&1 || true
docker exec aviaverse-postgres-1 psql -U vyron vyron -f /docker-entrypoint-initdb.d/010_move_ewis_to_m07.sql 2>&1 || true
docker exec aviaverse-postgres-1 psql -U vyron vyron -f /docker-entrypoint-initdb.d/011_module03_electrical_fundamentals_part1.sql 2>&1 || true
docker exec aviaverse-postgres-1 psql -U vyron vyron -f /docker-entrypoint-initdb.d/012_module03_electrical_fundamentals_part2.sql 2>&1 || true
docker exec aviaverse-postgres-1 psql -U vyron vyron -f /docker-entrypoint-initdb.d/013_module03_electrical_fundamentals_part3.sql 2>&1 || true
docker exec aviaverse-postgres-1 psql -U vyron vyron -f /docker-entrypoint-initdb.d/014_module03_electrical_fundamentals_part4.sql 2>&1 || true
docker exec aviaverse-postgres-1 psql -U vyron vyron -f /docker-entrypoint-initdb.d/015_password_reset_tokens.sql 2>&1 || true
docker exec aviaverse-postgres-1 psql -U vyron vyron -f /docker-entrypoint-initdb.d/016_module02_content_audit_fix.sql 2>&1 || true
docker exec aviaverse-postgres-1 psql -U vyron vyron -f /docker-entrypoint-initdb.d/017_module07_rebuild_cleanup.sql 2>&1 || true
docker exec aviaverse-postgres-1 psql -U vyron vyron -f /docker-entrypoint-initdb.d/018_module07_ewis_testing_crimping.sql 2>&1 || true
docker exec aviaverse-postgres-1 psql -U vyron vyron -f /docker-entrypoint-initdb.d/019_module07_soldering_installation.sql 2>&1 || true
docker exec aviaverse-postgres-1 psql -U vyron vyron -f /docker-entrypoint-initdb.d/020_module08_atmosphere_lift.sql 2>&1 || true
docker exec aviaverse-postgres-1 psql -U vyron vyron -f /docker-entrypoint-initdb.d/021_module08_reynolds_drag_stalling.sql 2>&1 || true
docker exec aviaverse-postgres-1 psql -U vyron vyron -f /docker-entrypoint-initdb.d/022_module08_flight_forces_turning.sql 2>&1 || true
docker exec aviaverse-postgres-1 psql -U vyron vyron -f /docker-entrypoint-initdb.d/023_module08_performance_stability.sql 2>&1 || true
docker exec aviaverse-postgres-1 psql -U vyron vyron -f /docker-entrypoint-initdb.d/024_module09_general_performance_factors.sql 2>&1 || true
docker exec aviaverse-postgres-1 psql -U vyron vyron -f /docker-entrypoint-initdb.d/025_module09_social_communication_environment.sql 2>&1 || true
docker exec aviaverse-postgres-1 psql -U vyron vyron -f /docker-entrypoint-initdb.d/026_module09_tasks_errors_hazards.sql 2>&1 || true
docker exec aviaverse-postgres-1 psql -U vyron vyron -f /docker-entrypoint-initdb.d/027_fix_licence_types_b1_matching.sql 2>&1 || true
docker exec aviaverse-postgres-1 psql -U vyron vyron -f /docker-entrypoint-initdb.d/028_module10_regulatory_framework_certifying_staff.sql 2>&1 || true
docker exec aviaverse-postgres-1 psql -U vyron vyron -f /docker-entrypoint-initdb.d/029_module10_approved_maintenance_organizations.sql 2>&1 || true
docker exec aviaverse-postgres-1 psql -U vyron vyron -f /docker-entrypoint-initdb.d/030_module10_air_operations_certification.sql 2>&1 || true
docker exec aviaverse-postgres-1 psql -U vyron vyron -f /docker-entrypoint-initdb.d/031_module10_continuing_airworthiness_national_requirements.sql 2>&1 || true
docker exec aviaverse-postgres-1 psql -U vyron vyron -f /docker-entrypoint-initdb.d/032_module11_fix_title_and_licence.sql 2>&1 || true
docker exec aviaverse-postgres-1 psql -U vyron vyron -f /docker-entrypoint-initdb.d/033_module11a_aerodynamics_structures_general.sql 2>&1 || true
docker exec aviaverse-postgres-1 psql -U vyron vyron -f /docker-entrypoint-initdb.d/034_module11a_airframe_types_aircon.sql 2>&1 || true
docker exec aviaverse-postgres-1 psql -U vyron vyron -f /docker-entrypoint-initdb.d/035_module11a_autoflight_communications.sql 2>&1 || true
docker exec aviaverse-postgres-1 psql -U vyron vyron -f /docker-entrypoint-initdb.d/036_module11a_communications_navigation.sql 2>&1 || true
docker exec aviaverse-postgres-1 psql -U vyron vyron -f /docker-entrypoint-initdb.d/037_module11a_navigation_instruments.sql 2>&1 || true
docker exec aviaverse-postgres-1 psql -U vyron vyron -f /docker-entrypoint-initdb.d/038_module11a_electrical_power_generation.sql 2>&1 || true
docker exec aviaverse-postgres-1 psql -U vyron vyron -f /docker-entrypoint-initdb.d/039_module11a_electrical_power_distribution.sql 2>&1 || true
docker exec aviaverse-postgres-1 psql -U vyron vyron -f /docker-entrypoint-initdb.d/040_module11a_equipment_fire_flightcontrols.sql 2>&1 || true
docker exec aviaverse-postgres-1 psql -U vyron vyron -f /docker-entrypoint-initdb.d/041_module11a_fuel_hydraulics.sql 2>&1 || true
docker exec aviaverse-postgres-1 psql -U vyron vyron -f /docker-entrypoint-initdb.d/042_module11a_icerain_landinggear.sql 2>&1 || true
docker exec aviaverse-postgres-1 psql -U vyron vyron -f /docker-entrypoint-initdb.d/043_module11a_lights_oxygen_general_water.sql 2>&1 || true
docker exec aviaverse-postgres-1 psql -U vyron vyron -f /docker-entrypoint-initdb.d/044_module11a_fix_m19_title.sql 2>&1 || true
docker exec aviaverse-postgres-1 psql -U vyron vyron -f /docker-entrypoint-initdb.d/045_module13_aerodynamics_structures_general.sql 2>&1 || true
docker exec aviaverse-postgres-1 psql -U vyron vyron -f /docker-entrypoint-initdb.d/046_module13_automatic_flight.sql 2>&1 || true
docker exec aviaverse-postgres-1 psql -U vyron vyron -f /docker-entrypoint-initdb.d/047_module13_comms_nav_part1.sql 2>&1 || true
docker exec aviaverse-postgres-1 psql -U vyron vyron -f /docker-entrypoint-initdb.d/048_module13_comms_nav_part2.sql 2>&1 || true
docker exec aviaverse-postgres-1 psql -U vyron vyron -f /docker-entrypoint-initdb.d/049_module13_comms_nav_part3.sql 2>&1 || true
docker exec aviaverse-postgres-1 psql -U vyron vyron -f /docker-entrypoint-initdb.d/050_module13_electrical_equipment.sql 2>&1 || true
docker exec aviaverse-postgres-1 psql -U vyron vyron -f /docker-entrypoint-initdb.d/051_module13_flightcontrols_lights_maintenance.sql 2>&1 || true
docker exec aviaverse-postgres-1 psql -U vyron vyron -f /docker-entrypoint-initdb.d/052_module13_instrument_systems.sql 2>&1 || true
docker exec aviaverse-postgres-1 psql -U vyron vyron -f /docker-entrypoint-initdb.d/053_module13_aircon_fire.sql 2>&1 || true
docker exec aviaverse-postgres-1 psql -U vyron vyron -f /docker-entrypoint-initdb.d/054_module13_fuel_pneumatic_water.sql 2>&1 || true
docker exec aviaverse-postgres-1 psql -U vyron vyron -f /docker-entrypoint-initdb.d/055_module13_hydraulic_power.sql 2>&1 || true
docker exec aviaverse-postgres-1 psql -U vyron vyron -f /docker-entrypoint-initdb.d/056_module13_icerain_infosys.sql 2>&1 || true
docker exec aviaverse-postgres-1 psql -U vyron vyron -f /docker-entrypoint-initdb.d/057_module13_landing_gear.sql 2>&1 || true
docker exec aviaverse-postgres-1 psql -U vyron vyron -f /docker-entrypoint-initdb.d/058_module13_ima_cabin.sql 2>&1 || true
docker exec aviaverse-postgres-1 psql -U vyron vyron -f /docker-entrypoint-initdb.d/059_module14_turbine_engines_starting.sql 2>&1 || true
docker exec aviaverse-postgres-1 psql -U vyron vyron -f /docker-entrypoint-initdb.d/060_module14_engine_indicating_systems.sql 2>&1 || true
docker exec aviaverse-postgres-1 psql -U vyron vyron -f /docker-entrypoint-initdb.d/061_module15_fundamentals_performance_inlet.sql 2>&1 || true
docker exec aviaverse-postgres-1 psql -U vyron vyron -f /docker-entrypoint-initdb.d/062_module15_compressors_combustion_turbine_exhaust.sql 2>&1 || true
docker exec aviaverse-postgres-1 psql -U vyron vyron -f /docker-entrypoint-initdb.d/063_module15_bearings_lubricants_lubrication.sql 2>&1 || true
docker exec aviaverse-postgres-1 psql -U vyron vyron -f /docker-entrypoint-initdb.d/064_module15_fuel_air_systems.sql 2>&1 || true
docker exec aviaverse-postgres-1 psql -U vyron vyron -f /docker-entrypoint-initdb.d/065_module15_starting_ignition_indication.sql 2>&1 || true
docker exec aviaverse-postgres-1 psql -U vyron vyron -f /docker-entrypoint-initdb.d/066_module15_augmentation_turboprop_turboshaft_apu.sql 2>&1 || true
docker exec aviaverse-postgres-1 psql -U vyron vyron -f /docker-entrypoint-initdb.d/067_module15_powerplant_installation_fire.sql 2>&1 || true
docker exec aviaverse-postgres-1 psql -U vyron vyron -f /docker-entrypoint-initdb.d/068_module15_monitoring_storage.sql 2>&1 || true
"

# ── Nginx reload ──────────────────────────────────────────────────────────────
echo "→ Reloading nginx ..."
$SSH "docker restart aviaverse-nginx-1 2>/dev/null || true"

# ── Status ────────────────────────────────────────────────────────────────────
echo ""
$SSH "cd $REMOTE_DIR && docker compose -f docker-compose.prod.yml --env-file .env.prod ps"
echo ""
echo "✓ Done! → http://188.245.64.189:3000"
