#!/usr/bin/env bash
# ─── Start Aviaverse locally (fast dev mode) ──────────────────────────────────
# Postgres + Redis via Docker, all Go services natively.
# Run frontend separately: cd frontend && npm run dev

set -euo pipefail
cd "$(dirname "$0")"

# Load .env
if [ -f .env ]; then source .env; fi
: "${JWT_SECRET:=dev_secret_change_me}"
: "${GEMINI_API_KEY:?GEMINI_API_KEY is required}"

PID_FILE="/tmp/aviaverse-pids"
DB_URL="postgres://vyron:vyron_secret@localhost:5432/vyron?sslmode=disable"

stop() {
  echo "→ Stopping services..."
  if [ -f "$PID_FILE" ]; then
    while read -r pid; do kill "$pid" 2>/dev/null || true; done < "$PID_FILE"
    rm -f "$PID_FILE"
  fi
  docker compose stop postgres redis 2>/dev/null || true
  echo "✓ Stopped"
  exit 0
}
trap stop SIGINT SIGTERM

if [ "${1:-}" = "stop" ]; then stop; fi

echo "╔══════════════════════════════════════╗"
echo "║   Aviaverse — Local Dev              ║"
echo "╚══════════════════════════════════════╝"
echo ""

echo "→ Starting Postgres + Redis ..."
docker compose up -d postgres redis
echo "→ Waiting for Postgres to be healthy ..."
until docker compose exec -T postgres pg_isready -U vyron -q 2>/dev/null; do sleep 1; done
echo "  ✓ Postgres ready"

rm -f "$PID_FILE"

start_svc() {
  local name=$1 port=$2
  shift 2
  echo "→ Starting $name on :$port ..."
  (cd "services/$name" && PORT=$port "$@" go run . > "/tmp/aviaverse-$name.log" 2>&1) &
  echo $! >> "$PID_FILE"
}

start_svc auth     8081 DATABASE_URL="$DB_URL" JWT_SECRET="$JWT_SECRET" JWT_EXPIRY=24h
start_svc content  8082 DATABASE_URL="$DB_URL"
start_svc ai       8083 GEMINI_API_KEY="$GEMINI_API_KEY"
start_svc exam     8084 DATABASE_URL="$DB_URL" REDIS_URL=localhost:6379 JWT_SECRET="$JWT_SECRET"
start_svc progress 8085 DATABASE_URL="$DB_URL" JWT_SECRET="$JWT_SECRET"

sleep 2
start_svc gateway  8080 \
  AUTH_SERVICE_URL=http://localhost:8081 \
  CONTENT_SERVICE_URL=http://localhost:8082 \
  AI_SERVICE_URL=http://localhost:8083 \
  EXAM_SERVICE_URL=http://localhost:8084 \
  PROGRESS_SERVICE_URL=http://localhost:8085 \
  JWT_SECRET="$JWT_SECRET"

echo ""
echo "✓ All services started. Logs in /tmp/aviaverse-*.log"
echo ""
echo "  Now open a second terminal and run:"
echo "    cd frontend && npm run dev"
echo ""
echo "  Press Ctrl+C to stop everything."
echo ""

wait
