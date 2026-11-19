#!/usr/bin/env bash
# ─── Aviaverse Academy — First Deploy ─────────────────────────────────────────
# Run this script ONCE on the server to deploy the application from scratch.
# Usage: bash deploy.sh

set -euo pipefail

if [ ! -f .env.prod ]; then
  echo "ERROR: .env.prod not found."
  echo "Run: cp .env.prod.example .env.prod && nano .env.prod"
  exit 1
fi

echo ""
echo "╔══════════════════════════════════════╗"
echo "║   Aviaverse Academy — Deploy         ║"
echo "╚══════════════════════════════════════╝"
echo ""

echo "→ Building and starting all containers..."
docker compose -f docker-compose.prod.yml --env-file .env.prod up -d --build

echo ""
echo "→ Waiting for database migrations to finish..."
sleep 12

echo ""
echo "→ Container status:"
docker compose -f docker-compose.prod.yml ps

SERVER_IP=$(curl -sf https://ipinfo.io/ip 2>/dev/null || hostname -I | awk '{print $1}')
echo ""
echo "✓ Aviaverse Academy is live at: http://${SERVER_IP}"
echo ""
