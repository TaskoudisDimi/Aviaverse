# gateway

Reverse proxy. Port 8080.

No business logic — routes `/api/v1/<prefix>` to the matching service
(`auth`, `content`, `ai`, `exam`, `progress`) over the internal Docker
network. See [docs/architecture.md](../../docs/architecture.md).
