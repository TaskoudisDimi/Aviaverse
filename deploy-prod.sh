#!/usr/bin/env bash
# ─── Deploy pre-built binaries to server ──────────────────────────────────────
set -euo pipefail

SERVER="${SERVER:-root@188.245.64.189}"
REMOTE_DIR="/opt/aviaverse"
SSH_OPTS="-o ServerAliveInterval=30 -o ServerAliveCountMax=10 -o ConnectTimeout=30"
SSH="ssh $SSH_OPTS $SERVER"
SCP="scp $SSH_OPTS"

if [ ! -d "dist/bin" ]; then
    echo "ERROR: Run 'bash build-prod.sh' first."
    exit 1
fi

echo "╔══════════════════════════════════════╗"
echo "║   Deploying to $SERVER               ║"
echo "╚══════════════════════════════════════╝"
echo ""

echo "→ Preparing server directories ..."
$SSH "mkdir -p $REMOTE_DIR/dist/bin \
               $REMOTE_DIR/nginx \
               $REMOTE_DIR/db/migrations \
               $REMOTE_DIR/frontend \
               $REMOTE_DIR/services/auth \
               $REMOTE_DIR/services/content \
               $REMOTE_DIR/services/ai \
               $REMOTE_DIR/services/exam \
               $REMOTE_DIR/services/progress \
               $REMOTE_DIR/services/gateway \
               $REMOTE_DIR/frontend"

echo "→ Uploading Go binaries ..."
$SCP dist/bin/* "$SERVER:$REMOTE_DIR/dist/bin/"

echo "→ Uploading Dockerfiles ..."
for svc in auth content ai exam progress gateway; do
    $SCP "services/$svc/Dockerfile" "$SERVER:$REMOTE_DIR/services/$svc/Dockerfile"
done

echo "→ Uploading frontend (as tar) ..."
tar czf /tmp/frontend-dist.tar.gz --no-xattrs -C frontend dist/
$SCP /tmp/frontend-dist.tar.gz "$SERVER:$REMOTE_DIR/"
$SSH "cd $REMOTE_DIR && tar xzf frontend-dist.tar.gz -C frontend && rm frontend-dist.tar.gz"
rm /tmp/frontend-dist.tar.gz

echo "→ Uploading configs ..."
$SCP docker-compose.prod.yml             "$SERVER:$REMOTE_DIR/"
$SCP nginx/nginx.prod.conf               "$SERVER:$REMOTE_DIR/nginx/"
$SCP db/migrations/001_init.sql          "$SERVER:$REMOTE_DIR/db/migrations/"
$SCP db/migrations/002_module01_seed.sql "$SERVER:$REMOTE_DIR/db/migrations/"
$SCP frontend/Dockerfile                 "$SERVER:$REMOTE_DIR/frontend/"
$SCP frontend/nginx.conf                 "$SERVER:$REMOTE_DIR/frontend/"

echo "→ Starting containers ..."
$SSH "cd $REMOTE_DIR && docker compose -f docker-compose.prod.yml --env-file .env.prod up -d --build 2>&1"

echo ""
$SSH "cd $REMOTE_DIR && docker compose -f docker-compose.prod.yml ps"
echo ""
echo "✓ Done! → http://188.245.64.189:3000"
