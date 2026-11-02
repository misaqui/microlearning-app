# Pilot release hardening — 1 November 2026

> Registro histórico del 1 de noviembre. La política vigente de ramas es main como única rama permanente; ver docs/BRANCH_WORKFLOW.md. Este registro no constituye instrucciones actuales de integración o despliegue.

## Discovery and review
Two actual independent review agents inspected f21895f and its CI evidence. No persistence code blocker found. Delivery risks: dependency graph not locked; main push not checked; unreadable Library incorrectly claims it is empty. Prior CI checks GitHub's synthetic merge, not the isolated head.

## Alternatives and decision
- Deploy existing PR: fewer builds but dependency drift and misleading error state remain.
- Harden current PR, validate, then release: chosen under delegated implementation authority. No backend, AI calls, paid infrastructure or new product features.
- Start a larger architecture rewrite: unnecessary for this pilot.

## Small steps and acceptance
1. Add unreadable-library regression and observe RED in Actions; capture resolved dependency lock from that same run.
2. Correct error state. Commit the exact captured lock; use create --no-pub then pub get --enforce-lockfile in CI and Render; key SDK cache by Flutter version.
3. Validate analyze, all tests and web build; retain short-lived build artifact. CI main push, least permissions, concurrency cancellation, bounded job duration.
4. Independent final review. Merge reviewed exact head into main; verify main CI. Manual Render release only within user's deployment authorization; preserve autoDeploy off.
5. Confirm live commit and browser save two/reload/remove one/reload. Record limits honestly. Mobile/cross-browser acceptance remains separate unless actually exercised.

## Risk, cost and rollback
No additional recurring costs or AI inference. One deliberate RED run plus final PR and main verification consume existing CI. Artifact retention three days. Local favorites remain best-effort and bound to browser/origin/profile. Revert PR and deploy previous approved commit to roll back; local key can remain inert.

## Process notes
Flutter local execution remains blocked by earlier automatic review; all Flutter execution takes place in GitHub Actions or existing Render build, without attempting to bypass that denial. No installed Superpowers skill package was found in this environment; the required discovery/design/plan/implementation/verification/review stages are followed explicitly in repository records rather than claiming a missing tool was invoked. Quizzes paused by user.

## Execution evidence
- RED: PR head a2edb652; Actions 41294398491, job 124812095227. Analyze clean; 11 tests pass, new unreadable-Library test fails because empty-state text is present. No build after failing test.
- Captured exact pub-generated lockfile from the same CI job logs, including package hashes and SDK constraints; no handwritten dependency hashes.
