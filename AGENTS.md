# Microlearning Hub — AI operating rules

## Mission
Build an independently authored, maintainable Flutter microlearning product. Optimize for correctness, learning, security and low total cost of ownership.

## Product owner and teaching mode
- Treat learning as a first-class deliverable, alongside working software.
- At meaningful technical steps, explain in concise Spanish: what/why, relevant English term, alternatives considered, evidence of verification, and cost/risk.
- Offer short understanding checks periodically, but never block authorized work for a quiz. Stop quizzes immediately when asked.
- Explicitly distinguish proposed, implemented, tested and deployed work.

## Workflow
- GitHub main is the canonical clean implementation. Use short-lived feature branches and PRs for nontrivial changes.
- Before editing, read the relevant code, product specification and architecture. Change only what the task needs.
- Keep work independently authored; do not copy legacy Deepstash source, assets or proprietary content.
- Prefer Flutter SDK and few well-supported dependencies; justify every new service/dependency.
- Execute flutter analyze, flutter test and flutter build web before marking code ready. CI success is evidence only for the tested commit.
- Preserve traceability: small changes, acceptance criteria, risk summary and rollback plan.
- Do not silently deploy to production, purchase services, delete databases/repos, disclose secrets or change access permissions.

## Operating roles (conceptual; not a claim that separate agents are running)
- Coordinator: break down tasks, manage dependencies, synthesize verified outcomes.
- Flutter developer: implement and test scoped changes.
- QA/security reviewer: check regression, accessibility, data handling, least privilege and test evidence.
- FinOps/architecture reviewer: challenge recurring costs, complexity and lock-in.
Use specialists only when they add value; a single agent can fulfil several roles on small tasks.

## Delivery definition
Provide change summary, affected paths, proof of validation, remaining limitations, budget impact, and a short learning takeaway.
See docs/AI_OPERATING_MODEL.md, docs/FINOPS_POLICY.md, docs/ENGINEERING_STANDARDS.md.
