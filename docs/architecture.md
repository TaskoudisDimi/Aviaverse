# Architecture

VJet-Academy is an EASA Part-66 aviation maintenance training platform: a Vue
3 frontend talking to six small Go services behind a reverse-proxy gateway,
backed by Postgres and Redis.

## Request flow

```
Browser → nginx (TLS, static assets) → gateway (:8080) → auth/content/ai/exam/progress
                                                              ↓
                                                     Postgres · Redis
```

nginx serves the built frontend directly and reverse-proxies everything
under `/api/` to the gateway. The gateway is a thin router — no business
logic — that forwards each `/api/v1/<service>/...` prefix to the matching
backend service over the internal Docker network. See
[deploy.md](./deploy.md) for how this maps onto the actual containers.

## Services

| Service | Port | Owns |
| --- | --- | --- |
| [`gateway`](../services/gateway) | 8080 | Reverse proxy — routes `/api/v1/<prefix>` to the right service. No business logic. |
| [`auth`](../services/auth) | 8081 | Accounts, login (password + Google), JWT issuance, subscriptions/billing (Stripe), admin user management, upgrade-nudge emails. |
| [`content`](../services/content) | 8082 | EASA modules/subjects/lesson content, plan-based access gating, module locking, reviews. |
| [`ai`](../services/ai) | 8083 | AI Instructor chat (Gemini), grounded in the module content stored by `content`. |
| [`exam`](../services/exam) | 8084 | Exam simulator — question selection, scoring, module locking (shared with `content`). |
| [`progress`](../services/progress) | 8085 | Study progress tracking, dashboard stats. |

Every service owns its own `main.go` + `handlers/` package and talks to
Postgres directly — there's no shared ORM or ODM layer, just `database/sql`
+ `lib/pq`. A couple of small helpers (`allowedModuleCodes`,
`moduleAllowed`, the module-lock logic) are intentionally duplicated
between `content` and `exam` rather than factored into a shared package,
since the services are meant to stay independently deployable.

## Data

- **Postgres** (`pgvector/pgvector:pg16`) — the system of record. Schema
  changes are plain numbered SQL files in [`db/migrations/`](../db/migrations),
  applied idempotently (every migration guards itself with
  `IF EXISTS`/`ON CONFLICT DO NOTHING` so re-running the whole set is safe).
  The `pgvector` extension is available but not yet used by any shipped
  feature.
- **Redis** — login rate-limiting and the AI Instructor's monthly message
  counters. Not a system of record; safe to flush.

## Frontend

Vue 3 + Vite + Pinia + Vue Router + Tailwind, built as a PWA (`vite-plugin-pwa`)
— installable on a phone today via "Add to Home Screen", see
[mobile-app-proposal.md](./mobile-app-proposal.md) for what a real app-store
app would take on top of that.

## Content-grounding rule

Exam questions and AI Instructor answers must trace back to real,
client-provided source material — never general model knowledge presented
as course content. See the migration history in `db/migrations/` (the
`*_exam_content.sql` files) for how each module's question bank was sourced
and validated.
