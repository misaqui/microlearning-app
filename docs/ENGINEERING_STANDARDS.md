# Engineering standards

## Technology and provenance
Flutter/Dart web-first. Preserve independently authored source and licensed dependencies only. Avoid copying the older clone's source, artwork, names or content.

## Scope
First vertical slice: Discover ideas from local fixtures, open detail, save to Library and resume. Review and Profile remain simple placeholders until relevant acceptance criteria are defined.

## Quality gates
- Format Dart source, analyze with no errors, run widget/unit tests and build web release.
- Test navigation, state updates and empty/error states; add accessibility semantics and responsive layouts.
- No UI-only authorization: eventual role checks belong on the server.
- Validate URL ingestion against SSRF and untrusted content before enabling external input.
- Use lockfiles and CI pinning where practical; avoid adding dependencies without a maintenance justification.
- Run security and licensing checks before production.

## Delivery
A change is only complete when acceptance criteria, validation results, known limitations and rollback are documented.
Passing CI does not mean deployed, secure against all threats, or licensed for third-party assets.
