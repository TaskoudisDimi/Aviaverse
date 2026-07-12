#!/usr/bin/env bash
# ─── Deploy pre-built binaries to server ──────────────────────────────────────
# Uploads binaries + frontend dist to the server and restarts containers.
# No compilation happens on the server — deploy takes < 30 seconds.
#
# Usage: SERVER=root@188.245.64.189 bash deploy-prod.sh

set -euo pipefail

SERVER="${SERVER:-root@188.245.64.189}"
REMOTE_DIR="/opt/aviaverse"

if [ ! -d "dist/bin" ]; then
    echo "ERROR: Run 'bash build-prod.sh' first."
    exit 1
fi

echo "╔══════════════════════════════════════╗"
echo "║   Deploying to $SERVER"
echo "╚══════════════════════════════════════╝"
echo ""

echo "→ Uploading binaries ..."
ssh "$SERVER" "mkdir -p $REMOTE_DIR/dist/bin"
scp dist/bin/* "$SERVER:$REMOTE_DIR/dist/bin/"

echo "→ Uploading frontend ..."
ssh "$SERVER" "mkdir -p $REMOTE_DIR/frontend/dist"
scp -r frontend/dist/ "$SERVER:$REMOTE_DIR/frontend/"

echo "→ Uploading configs ..."
scp docker-compose.prod.yml nginx/nginx.prod.conf db/migrations/*.sql "$SERVER:$REMOTE_DIR/" 2>/dev/null || true
ssh "$SERVER" "mkdir -p $REMOTE_DIR/nginx && scp nginx.prod.conf $REMOTE_DIR/nginx/ 2>/dev/null; true"

echo "→ Restarting containers ..."
ssh "$SERVER" "cd $REMOTE_DIR && docker compose -f docker-compose.prod.yml --env-file .env.prod up -d --build 2>&1 | tail -5"

echo ""
echo "✓ Deployed! → http://188.245.64.189"
