# FinOps policy

## Starting guardrails
- Infrastructure planning ceiling: EUR 15 per month. Target EUR 0 for initial static demonstration.
- Additional purchased AI credits: EUR 0 unless explicitly approved.
- Application AI inference/API: disabled for initial demo. A ChatGPT subscription does not automatically cover application API usage.
- No persistent paid backend, database, monitoring, queue or vector storage until justified by measured requirements.

## Decision rules
Evaluate **monthly recurring cost**, limits, data retention, operational toil, availability, migration and security before selecting a service.
Prefer static-first Flutter web, local test fixtures, demand-driven ingestion and caching. Do not mistake free tiers for production durability.
Never hardcode credentials; secrets must be server-side once an API is introduced.

## Tracking per feature
Record purpose, incremental infrastructure EUR/month, estimated AI tokens/calls (if any), CI minutes, data volume and rollback options.
Escalate any new recurring charge or possible cost overrun to the owner before provisioning.

## Checkpoints
At each milestone review actual bills vs budget, unused dependencies, CI inefficiencies and deployment necessity.
