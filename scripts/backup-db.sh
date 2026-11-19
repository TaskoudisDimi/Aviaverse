#!/usr/bin/env bash
# ─── Nightly Postgres backup ───────────────────────────────────────────────
# Dumps the production database, compresses it, and deletes backups older
# than RETENTION_DAYS. Runs via cron on the server (see docs/deploy.md for
# the crontab entry). The database is tiny (~28MB as of 2026-11), so even a
# month of daily backups costs negligible disk space.
set -euo pipefail

BACKUP_DIR="/opt/aviaverse/backups"
RETENTION_DAYS=30
TIMESTAMP=$(date +%Y%m%d-%H%M%S)

mkdir -p "$BACKUP_DIR"
docker exec aviaverse-postgres-1 pg_dump -U vyron vyron | gzip > "$BACKUP_DIR/vyron-$TIMESTAMP.sql.gz"

# Drop anything older than the retention window.
find "$BACKUP_DIR" -name "vyron-*.sql.gz" -mtime "+$RETENTION_DAYS" -delete

echo "Backup written: $BACKUP_DIR/vyron-$TIMESTAMP.sql.gz ($(du -h "$BACKUP_DIR/vyron-$TIMESTAMP.sql.gz" | cut -f1))"
