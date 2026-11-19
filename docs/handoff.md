# Handoff notes

Accounts/credentials that need transferring or recreating under a new
owner's name if this project changes hands:

- **Cal.com** — either grant access to the existing account, or they create
  their own and update `VITE_CAL_USERNAME`.
- **Gemini API key** (`GEMINI_API_KEY`) — their own Google AI Studio key
  (there was an earlier open issue with `ACCESS_TOKEN_TYPE_UNSUPPORTED` —
  worth re-checking if this comes up again).
- **Server access** — SSH to 188.245.64.189 (root), or migrate to a server
  of their own.
- **`.env.prod` on the server** — `JWT_SECRET`, `POSTGRES_PASSWORD`,
  `GEMINI_API_KEY`, etc.
- **Domain/DNS** — if they want their own domain instead of the current one.

Technical handoff items:

- How deploy works — see [deploy.md](./deploy.md) (the GitHub Actions
  pipeline, plus the manual `scripts/` fallback).
- Where `docker-compose.prod.yml` is and what each service does — see
  [architecture.md](./architecture.md).
- Database access (`psql` credentials) if they need to manage content
  directly.
