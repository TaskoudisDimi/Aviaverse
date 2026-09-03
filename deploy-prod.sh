#!/usr/bin/env bash
# ─── Deploy pre-built binaries to server ──────────────────────────────────────
set -euo pipefail

SERVER="${SERVER:-root@188.245.64.189}"
REMOTE_DIR="/opt/aviaverse"
SSH="ssh -o ServerAliveInterval=30 -o ServerAliveCountMax=10 -o ConnectTimeout=30 $SERVER"

if [ ! -d "dist/bin" ]; then
    echo "ERROR: Run 'bash build-prod.sh' first."
    exit 1
fi

echo "╔══════════════════════════════════════╗"
echo "║   Deploying to $SERVER               ║"
echo "╚══════════════════════════════════════╝"
echo ""

# Pack everything into one tar and send in a single connection
echo "→ Packing all files ..."
STAGE=$(mktemp -d)
mkdir -p "$STAGE/dist/bin" "$STAGE/services/"{auth,content,ai,exam,progress,gateway} \
         "$STAGE/nginx" "$STAGE/db/migrations" "$STAGE/frontend"

cp dist/bin/* "$STAGE/dist/bin/"
for svc in auth content ai exam progress gateway; do
    cp "services/$svc/Dockerfile" "$STAGE/services/$svc/"
done
tar czf --no-xattrs -C frontend dist/ | tar xz -C "$STAGE/frontend" 2>/dev/null || \
    tar czf /dev/stdout --no-xattrs -C frontend dist/ 2>/dev/null | tar xz -C "$STAGE/frontend"
cp docker-compose.prod.yml         "$STAGE/"
cp nginx/nginx.prod.conf           "$STAGE/nginx/"
cp db/migrations/001_init.sql          "$STAGE/db/migrations/"
cp db/migrations/002_module01_seed.sql "$STAGE/db/migrations/"
cp db/migrations/003_module02_seed.sql "$STAGE/db/migrations/"
cp db/migrations/004_module02_wave_sound.sql "$STAGE/db/migrations/"
cp db/migrations/005_module01_diagrams.sql  "$STAGE/db/migrations/"
cp db/migrations/006_module02_enrich.sql    "$STAGE/db/migrations/"
cp frontend/Dockerfile             "$STAGE/frontend/"
cp frontend/nginx.conf             "$STAGE/frontend/"

echo "→ Uploading (single connection) ..."
tar czf - --no-xattrs -C "$STAGE" . | \
    $SSH "mkdir -p $REMOTE_DIR && tar xzf - -C $REMOTE_DIR"
rm -rf "$STAGE"

echo "→ Starting containers ..."
$SSH "cd $REMOTE_DIR && docker compose -f docker-compose.prod.yml --env-file .env.prod build --no-cache frontend && docker compose -f docker-compose.prod.yml --env-file .env.prod up -d 2>&1"

echo "→ Running new DB migrations ..."
$SSH "docker exec aviaverse-postgres-1 psql -U vyron vyron -f /docker-entrypoint-initdb.d/003_module02_seed.sql 2>&1 || true"
$SSH "docker exec aviaverse-postgres-1 psql -U vyron vyron -f /docker-entrypoint-initdb.d/004_module02_wave_sound.sql 2>&1 || true"
$SSH "docker exec aviaverse-postgres-1 psql -U vyron vyron -f /docker-entrypoint-initdb.d/005_module01_diagrams.sql 2>&1 || true"
$SSH "docker exec aviaverse-postgres-1 psql -U vyron vyron -f /docker-entrypoint-initdb.d/006_module02_enrich.sql 2>&1 || true"

echo "→ Restarting nginx (refresh upstream IPs) ..."
$SSH "docker restart aviaverse-nginx-1 2>/dev/null || true"

echo ""
$SSH "cd $REMOTE_DIR && docker compose -f docker-compose.prod.yml --env-file .env.prod ps"
echo ""
echo "✓ Done! → http://188.245.64.189:3000"
