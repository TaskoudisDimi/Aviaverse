# ai

The AI Instructor chat. Port 8083.

- Streams chat responses from Gemini (`gemini/client.go`), grounded in the
  relevant module's lesson content pulled from Postgres (not the model's
  general knowledge — see the content-grounding rule in
  [docs/architecture.md](../../docs/architecture.md)).
- Per-plan monthly message caps enforced via Redis counters
  (`handlers/ai.go`).
- `cmd/ingest`, `cmd/query` — a **pilot, not yet wired into the live
  chat**: embeds reference PDFs into `library_documents`/`library_chunks`
  (pgvector) for future retrieval-augmented answers. Migration
  `112_library_rag.sql` (which creates those tables) is deliberately
  excluded from the deploy pipeline until this ships — see
  [docs/deploy.md](../../docs/deploy.md).
