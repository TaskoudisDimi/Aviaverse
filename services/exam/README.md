# exam

The exam simulator. Port 8084.

- Starts an exam (official EASA format or a "quick test"), selects
  questions, scores submissions (`handlers/exam.go`).
- Weak-subject detection for the "review weak points" AI mode.
- The free-plan single-module lock (`lockModule`) — shared logic with the
  `content` service, since one lock covers both study content and the exam
  simulator (see [docs/architecture.md](../../docs/architecture.md)).
