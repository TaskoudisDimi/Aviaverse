#!/usr/bin/env bash
# ─── Deploy pre-built binaries to server ──────────────────────────────────────
# Usage: bash deploy-prod.sh

set -euo pipefail

SERVER="${SERVER:-root@188.245.64.189}"
SSH_KEY="${SSH_KEY:-$HOME/ssh}"
REMOTE_DIR="/opt/aviaverse"

SSH="ssh -i $SSH_KEY"
SCP="scp -i $SSH_KEY"

if [ ! -d "dist/bin" ]; then
    echo "ERROR: Run 'bash build-prod.sh' first."
    exit 1
fi

echo "╔══════════════════════════════════════╗"
echo "║   Deploying to $SERVER"
echo "╚══════════════════════════════════════╝"
echo ""

echo "→ Uploading binaries ..."
$SSH "$SERVER" "mkdir -p $REMOTE_DIR/dist/bin $REMOTE_DIR/nginx $REMOTE_DIR/db/migrations"
$SCP dist/bin/* "$SERVER:$REMOTE_DIR/dist/bin/"

echo "→ Uploading frontend ..."
$SCP -r frontend/dist/ "$SERVER:$REMOTE_DIR/frontend/"

echo "→ Uploading configs ..."
$SCP docker-compose.prod.yml "$SERVER:$REMOTE_DIR/"
$SCP nginx/nginx.prod.conf   "$SERVER:$REMOTE_DIR/nginx/"
$SCP db/migrations/*.sql     "$SERVER:$REMOTE_DIR/db/migrations/"

echo "→ Starting containers ..."
$SSH "$SERVER" "cd $REMOTE_DIR && docker compose -f docker-compose.prod.yml --env-file .env.prod up -d --build 2>&1 | tail -10"

echo ""
echo "✓ Deployed! → http://188.245.64.189"
