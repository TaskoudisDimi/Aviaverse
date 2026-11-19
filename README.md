# VJet-Academy

EASA Part-66 aviation maintenance training platform: study modules, an exam
simulator, and an AI Instructor chat, for B1.1 and B2 licence candidates.

Live at [vjet-academy.academy](https://vjet-academy.academy).

## Stack

- **Frontend** — Vue 3, Vite, Pinia, Vue Router, Tailwind. Built as a PWA.
- **Backend** — six small Go (Gin) services behind a reverse-proxy gateway:
  `auth`, `content`, `ai`, `exam`, `progress`, `gateway`.
- **Data** — Postgres (`pgvector/pgvector:pg16`), Redis.

See [docs/architecture.md](./docs/architecture.md) for how the pieces fit
together, and each `services/*/README.md` for what that service owns.

## Local development

```bash
bash scripts/run-local.sh      # Postgres + Redis via Docker, Go services natively
cd frontend && npm run dev     # frontend, separately
```

Or the full stack via Docker Compose: `docker compose up`.

## Deploying

Every push to `main` deploys to production automatically. See
[docs/deploy.md](./docs/deploy.md) for the pipeline, required secrets, and
the manual fallback scripts.

## Docs

- [docs/architecture.md](./docs/architecture.md) — services, data flow, the
  content-grounding rule.
- [docs/deploy.md](./docs/deploy.md) — CI/CD pipeline, server layout,
  manual deploy scripts.
- [docs/mobile-app-proposal.md](./docs/mobile-app-proposal.md) — draft plan
  for wrapping the PWA into an App Store/Google Play app.
- [docs/handoff.md](./docs/handoff.md) — what transfers if this project
  changes hands.
