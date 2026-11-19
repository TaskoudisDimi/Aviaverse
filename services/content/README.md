# content

EASA modules, subjects, lesson content, and reviews. Port 8082.

- Module/subject catalog and full lesson text (`handlers/content.go`).
- Plan-based access gating (`allowedModuleCodes`) and the free-plan
  single-module lock (`lockModule`) — shared logic with the `exam` service,
  since one lock covers both study content and the exam simulator.
- Module and overall-app reviews (`handlers/reviews.go`).

See [docs/architecture.md](../../docs/architecture.md) for how this fits
with the other services.
