# AI operating model

## Current approach
Start with one coordinator and specialized *review roles on demand*, not a mandatory always-on multi-agent system. Actual parallel agent execution requires capable tooling; do not imply it happened unless logged.

## Workflow
1. Product owner supplies objective. Coordinator writes acceptance criteria and risk/cost boundaries.
2. Developer implements on a task branch with the minimum viable code.
3. QA/security independently evaluates high-risk changes; FinOps reviews new infrastructure and AI API usage.
4. GitHub Actions validates static analysis, tests and web compilation.
5. Coordinator reports verified result and prepares release decision. Production deploy requires approval.

## Learning protocol
Explain **concept → choice → action → evidence → implication** in approachable Spanish, pairing core terms with English once.
Ask at most one small optional check at a time. Do not delay execution or continue quizzes when the owner wants progress.
Capture important decisions in docs; avoid duplicating transient chat in permanent instructions.

## When to add Skills
Only after a repeatable process has passed once. Candidate procedures: feature delivery, quality gate, FinOps review and release.
Keep each Skill short, with clear triggers; include scripts only for deterministic tasks. Avoid skill proliferation.

## Knobs
Use normal reasoning for routine tasks and deeper reviews for architecture/security. Keep concurrency low (1-2 unless measured benefit); bound retries and tool use. These are working policies, not claims of changed ChatGPT account settings.
