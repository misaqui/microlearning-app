# Microlearning Hub — Product specification (draft)

Status: planned, not implemented.

## Goal
Discovery-first microlearning web app for a small invited group. Deepstash-like short idea browsing, not a course-first LMS.

## Experience
- Discover: personalized/topic-based feed, paginated and accessible.
- Idea: brief text, source provenance, save and follow topic; optional quick self-check.
- Library: saves, collections, review queue.
- Review: retrieval practice with feedback and spaced repetition, non-intrusive.
- Profile: interests, progress, account preferences.
- Admin: content sources, inspiration sources, drafts, review, publish, audit.

## Learning considerations
Treat 3–5 minute sessions as a UX hypothesis, not a universal scientific threshold. Support active retrieval with corrective feedback, spaced review, practical examples, user autonomy and measured retention. Avoid dark patterns and punitive streaks.

## Content sources
Web source draft: type=web; URL=null until provided; refresh=manual; publication=review; must pass editorial approval prior to visible publication. Future providers: PDF, video transcript, text, RSS.

Inspiration source: references to apps, websites and repositories for product improvement, **not** learner content. Analyses generate feature proposals only; no automatic code change.

## Resource efficiency
Keep Flutter + Riverpod. Prefer one small modular API, PostgreSQL, object storage only when required. Paginate feeds, lazy load media, cache published cards, batch ingestion and avoid LLM calls when serving read requests. Define spending limits for ingestion and AI.

## Security gates
No deployment of copied upstream code until redistribution rights are clarified. Server-side authorization, invite-only accounts, least privilege, rate limiting, CSRF/CORS review, input validation, audit trail; URL ingestion must block private/internal destinations, validate redirects, enforce size/time limits; file ingestion should scan files and restrict types. No API secrets in Flutter web bundle. Automated dependency/security scans and tests before release.

## Acceptance criteria
An admin registers a source as a draft with no URL; after adding a validated URL starts a manual ingestion; ideas remain invisible until reviewed and published; viewers cannot access drafts or admin endpoints; provenance is retained; personal saves and progress persist.
