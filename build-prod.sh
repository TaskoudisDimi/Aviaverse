#!/usr/bin/env bash
# ─── Build production binaries locally (Mac → Linux) ──────────────────────────
# Compiles all Go services for Linux/amd64 on your Mac.
# Run this before deploying to avoid compilation on the server.

set -euo pipefail

SERVICES="auth content ai exam progress gateway"
OUT="dist/bin"

echo "╔══════════════════════════════════════╗"
echo "║   Building Linux binaries on Mac     ║"
echo "╚══════════════════════════════════════╝"
echo ""

rm -rf "$OUT" && mkdir -p "$OUT"

for svc in $SERVICES; do
    echo -n "  → $svc ... "
    (
        cd "services/$svc"
        CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags="-s -w" -o "../../$OUT/$svc" .
    )
    echo "OK  ($(du -sh "../../$OUT/$svc" 2>/dev/null | cut -f1 || du -sh "$OUT/$svc" | cut -f1))"
done

echo ""
echo "→ Building frontend ..."
(cd frontend && npm run build --silent)
echo "  OK"

echo ""
echo "✓ All binaries ready in $OUT/"
ls -lh "$OUT/"
echo ""
echo "Next: bash deploy-prod.sh"
