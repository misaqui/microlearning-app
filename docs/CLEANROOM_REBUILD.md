# Cleanroom rebuild: inventory and cost guardrails

Status: independent prototype; not production-ready. The historical `main` and `develop` branches are preserved.

## Removed from this branch
- Original Deepstash-inspired `lib/` implementation, example data, images and UI resources.
- Original platform scaffolding (Android, iOS, desktop and web) until regenerated from official Flutter tooling.
- Historical test code and inherited build scripts.

## Preserved
- Product, architecture, provenance and delivery documents in `docs/`.
- Git history and legacy branches as evidence only; do not merge inherited implementation into this branch.

## Rebuilt independently
- Four-tab navigation: Discover, Library, Review, Profile.
- A minimal standalone app, a smoke test, and a web-only CI pipeline.

## Guardrails
- No paid services, AI API keys or database provisioned.
- Monthly infrastructure target: EUR 0 for static demo; hard planning ceiling EUR 15 for MVP before explicit budget review.
- No extra purchased development credits by default.
- Do not deploy copied code or branded third-party assets.
- Add authentication, database, ingestion and editorial flows only behind tested acceptance gates.

## Next work
1. Validate GitHub Actions build and correct failures.
2. Implement owned content models and local fixtures.
3. Build full Discover-to-Save flow; add accessibility/performance tests.
4. Choose persistence and auth based on actual usage and costs.
5. Deploy static demo only after review.
