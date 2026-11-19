# Deployment

## Production (automatic)

Every push to `main` deploys automatically via
[`.github/workflows/deploy.yml`](../.github/workflows/deploy.yml):

1. Builds all six Go services for `linux/amd64` and the frontend (Vite, with
   `VITE_CAL_USERNAME` / `VITE_GOOGLE_CLIENT_ID` injected from GitHub secrets).
2. Packages the binaries, frontend `dist/`, Dockerfiles, compose files and
   every `db/migrations/*.sql` file (except `001_init.sql`, `002_module01_seed.sql`
   and `112_library_rag.sql` — see the workflow for why those are excluded)
   into a tarball.
3. Uploads it to the server over SSH and runs
   `docker compose -f docker-compose.prod.yml build/up` for the app services.
4. Applies every migration in order (each one guards itself, so re-running
   the full set on every deploy is safe).
5. Reloads nginx and prints container status.

To re-run a deploy without a new commit: `gh workflow run deploy.yml --repo TaskoudisDimi/Aviaverse`.

### Required GitHub secrets

`DEPLOY_SSH_KEY`, `DEPLOY_HOST`, `DEPLOY_USER` (server access),
`VITE_CAL_USERNAME`, `VITE_GOOGLE_CLIENT_ID` (frontend build-time vars —
Vite only, these are gitignored locally so CI needs its own copies).

### Server-side env vars

Live in `.env.prod` on the server (never committed) — `JWT_SECRET`,
`POSTGRES_PASSWORD`, `GEMINI_API_KEY`, `GOOGLE_CLIENT_ID`,
`STRIPE_SECRET_KEY`/`STRIPE_WEBHOOK_SECRET`, `RESEND_API_KEY`, etc. See
`.env.prod.example` for the full list.

### Server layout

- App stack: Docker Compose (`docker-compose.prod.yml`), containers named
  `aviaverse-<service>-1`.
- In front of it: a **host-level** nginx (not the `aviaverse-nginx-1`
  container) terminates TLS and reverse-proxies `vjet-academy.academy` to
  `localhost:3000`, where the app's own nginx container does the real
  `/api/*` vs static-asset routing. The vhost for this lives at
  `/etc/nginx/sites-available/vjet-academy` on the server — it is **not**
  tracked in this repo, since it's host config, not app config. If this
  server is ever rebuilt from scratch, that vhost needs recreating (proxy
  everything to `127.0.0.1:3000`; any certificate works for the TLS leg —
  Cloudflare's "Full" SSL mode doesn't validate the origin cert's identity,
  just that *something* is there to encrypt to).
- The host also serves `task-code.com` from the same nginx — be careful not
  to touch its config when changing the vjet-academy vhost.

## Manual fallback (local scripts)

[`scripts/`](../scripts) has the pre-CI deploy scripts, kept as a manual
fallback and for disaster recovery:

- `build-prod.sh` — cross-compiles the Go services locally, builds the
  frontend. Run first.
- `deploy-prod.sh` — packages and ships what `build-prod.sh` produced,
  same steps as the CI pipeline above, run by hand: `bash scripts/deploy-prod.sh`
  (from the repo root).
- `run-local.sh` — local dev: Postgres + Redis via Docker, Go services
  natively. Run the frontend separately with `cd frontend && npm run dev`.
- `server-setup.sh`, `deploy.sh` — **historical only**. One-time VPS
  bootstrap and first deploy, already run once against the current server.
  Kept as a reference for standing up a brand-new server, not for routine
  use — see the warning comments in each file.
- `backup-db.sh` — nightly Postgres backup (see below). Lives on the
  server at `/opt/aviaverse/backup-db.sh`; this copy in the repo is the
  source of truth if it ever needs redeploying there.

## Database backups

A cron job on the server runs `backup-db.sh` daily at 03:17 (server time):
`pg_dump` → gzip → `/opt/aviaverse/backups/vyron-<timestamp>.sql.gz`, with
anything older than 30 days deleted automatically. The database is small
(~28MB as of 2026-11, ~2MB compressed), so this costs negligible disk space.

Check it's running: `ssh root@<host> "crontab -l"` and
`ls -lh /opt/aviaverse/backups/`. These backups are **local to the
server only** — they protect against bad migrations or accidental data
loss, not against losing the whole server. For that, periodically pull a
copy down:

```bash
scp root@<host>:/opt/aviaverse/backups/vyron-<timestamp>.sql.gz .
```

Restore from one: `gunzip -c vyron-<timestamp>.sql.gz | docker exec -i aviaverse-postgres-1 psql -U vyron vyron`.

## Database migrations outside a deploy

Applied directly over SSH when needed ahead of a code deploy:

```bash
cat db/migrations/NNN_name.sql | ssh root@<host> \
  "docker exec -i aviaverse-postgres-1 psql -U vyron -d vyron"
```

Every migration is idempotent by design (`IF EXISTS ... RETURN`,
`ON CONFLICT DO NOTHING`), so this is safe to re-run.
