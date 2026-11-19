#!/usr/bin/env bash
# ─── Aviaverse Academy — Update (zero downtime) ───────────────────────────────
# ⚠ SUPERSEDED: deploys now happen automatically on every push to main via
# .github/workflows/deploy.yml. Kept only for reference — do not run this
# against production, it predates that pipeline and will conflict with it.
# Run this every time you push code changes and want to update the server.
# Usage: bash update.sh

set -euo pipefail

echo ""
echo "→ Pulling latest code..."
git pull origin main

echo "→ Rebuilding app containers (data volumes are preserved)..."
docker compose -f docker-compose.prod.yml --env-file .env.prod up -d --build \
  nginx frontend gateway auth content ai exam progress

echo ""
echo "→ Container status:"
docker compose -f docker-compose.prod.yml ps

echo ""
echo "✓ Update complete. Database and Redis data untouched."
echo ""
