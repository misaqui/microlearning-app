# Delivery plan and gates

Status: planned, not shipped.

## Gate 0 — source rights and baseline (blocking)
- Identify upstream copyright/license and request explicit permission if none.
- Establish baseline Flutter version, web build, tests, dependencies, actual data flows.
- Record architecture decisions and risk register.

## Gate 1 — discovery UX
- Remove promotional clutter, provide light minimal theme, accessible mobile navigation.
- Discover-first home and topic filtering; idea detail; saves.
- Data mocked only where clearly labelled.

## Gate 2 — application foundation
- Authentication and invitation-only roles; guarded API.
- PostgreSQL migrations and basic content APIs.
- Automated tests in CI.

## Gate 3 — content operations
- Web sources (empty URL draft, manual refresh, mandatory editorial review).
- Ingest and transform content with provenance, bounded resource usage and operator feedback.
- Inspirations and feature proposals separate from published learning material.

## Gate 4 — learning quality and security
- Optional quick recall with corrective feedback and spaced-review scheduling.
- Accessibility testing, security scanning, abuse/rate tests and backups.

## Gate 5 — development deployment
- Provision new service only in Render workspace microlearning after source permissions, tests and repo linkage confirmed.
- Production only after private-user acceptance.

## Non-goals for initial MVP
- Native mobile releases, autonomous source crawling, auto publishing, social network, paid subscriptions, heavy recommendation ML, large-scale distributed architecture.
