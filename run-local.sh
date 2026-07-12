#!/usr/bin/env bash
set -a; source .env; set +a

DB="postgres://vyron:vyron_secret@localhost:5432/vyron?sslmode=disable"
SECRET="${JWT_SECRET}"
AI_KEY="${GEMINI_API_KEY}"

echo "→ Starting databases..."
docker compose up postgres redis -d
echo "  Waiting for postgres to be ready..."
until docker compose exec -T postgres pg_isready -U vyron >/dev/null 2>&1; do sleep 1; done
echo "  Postgres ready."

start_service() {
  local name=$1; local dir=$2; shift 2
  echo "→ Starting $name on port $PORT_VAL..."
  ( cd "services/$dir" && env "$@" go run . > "../../logs/${name}.log" 2>&1 ) &
  echo $! >> /tmp/vyron-pids
}

mkdir -p logs
rm -f /tmp/vyron-pids

PORT_VAL=8081 start_service auth auth \
  DATABASE_URL="$DB" JWT_SECRET="$SECRET" JWT_EXPIRY=24h PORT=8081

PORT_VAL=8082 start_service content content \
  DATABASE_URL="$DB" JWT_SECRET="$SECRET" PORT=8082

PORT_VAL=8083 start_service ai ai \
  GEMINI_API_KEY="$AI_KEY" PORT=8083

PORT_VAL=8084 start_service exam exam \
  DATABASE_URL="$DB" JWT_SECRET="$SECRET" REDIS_URL=localhost:6379 PORT=8084

PORT_VAL=8085 start_service progress progress \
  DATABASE_URL="$DB" JWT_SECRET="$SECRET" PORT=8085

sleep 2

PORT_VAL=8080 start_service gateway gateway \
  AUTH_SERVICE_URL=http://localhost:8081 \
  CONTENT_SERVICE_URL=http://localhost:8082 \
  AI_SERVICE_URL=http://localhost:8083 \
  EXAM_SERVICE_URL=http://localhost:8084 \
  PROGRESS_SERVICE_URL=http://localhost:8085 \
  PORT=8080

echo ""
echo "✓ All services started. Logs in ./logs/"
echo "  Ctrl+C then run: kill \$(cat /tmp/vyron-pids) to stop."
echo ""
echo "→ Starting frontend dev server at http://localhost:3000"
cd frontend && npm run dev
