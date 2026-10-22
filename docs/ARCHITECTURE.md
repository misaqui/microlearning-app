# Technical architecture — proposal

Status: design only; no API, database, AI pipeline, or authentication is implemented by these documents.

## Existing baseline
Original upstream project uses Flutter and flutter_riverpod, has navigation/screens for Home, Explore, Library, Create, Profile. Preserve that structure; progressively rename and refactor widgets. Verify Flutter Web build and tests before altering UI.

## Proposed components
1. Flutter Web client, Riverpod application state.
2. Modular HTTP API with explicit authentication/role guards (API technology to be selected after deploy/cost tests).
3. PostgreSQL for users, ideas, sources, provenance, reviews, collections, retrieval outcomes.
4. Background ingestion job triggered manually by admin. AI generation produces reviewable drafts and never publishes automatically.
5. Render workspace microlearning, Frankfurt preferred; separate staging and future production. Do not use padel.

## Initial data entities
- users(id, email, role, status)
- invitations(id, email, token_hash, expires_at, consumed_at)
- topics(id, slug, name)
- ideas(id, title, body, status, topic_id, created_by, reviewed_by, published_at)
- source_references(id, kind, url, title, refresh_mode, publication_mode, status, created_by)
- source_items(id, source_id, canonical_url, content_hash, extracted_at, content_metadata)
- ingestion_runs(id, source_id, status, requested_by, started_at, finished_at, error_code)
- idea_sources(idea_id, source_item_id)
- review_events(id, idea_id, actor_id, decision, comment, created_at)
- collections(id, owner_id, title)
- collection_ideas(collection_id, idea_id)
- learning_events(id, user_id, idea_id, event_type, event_at)
- review_schedule(id, user_id, idea_id, due_at, interval_days, ease_factor)
- inspiration_sources(id, type, url, title, focus, status)
- feature_proposals(id, inspiration_source_id, description, impact, effort, status)

## API contract (draft)
- GET /api/v1/feed?cursor=...
- GET /api/v1/ideas/{id}
- POST /api/v1/ideas/{id}/save
- GET /api/v1/library
- POST /api/v1/reviews/{ideaId}/attempt
- POST /api/v1/admin/sources
- PATCH /api/v1/admin/sources/{id}
- POST /api/v1/admin/sources/{id}/ingestions
- GET /api/v1/admin/ingestions/{id}
- GET /api/v1/admin/ideas?status=pending_review
- POST /api/v1/admin/ideas/{id}/review
- POST /api/v1/admin/ideas/{id}/publish
- POST /api/v1/admin/inspirations
- POST /api/v1/admin/inspirations/{id}/analyze
- GET /api/v1/admin/feature-proposals

## Performance goals to validate
Core flows usable on mobile web; avoid unnecessary repainting, resize and decode media appropriately, keep navigation responsive. Measure bundle size, latency, memory and accessibility before establishing SLO targets.
