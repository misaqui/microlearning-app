# Branch workflow — effective 1 November 2026

User decision supersedes the earlier main-first development policy.

## Discovery, alternatives and decision
main and recreated develop both start at ec406138. The earlier develop implementation is historical and must not be reintroduced. Direct main integration was considered earlier; the user now chooses development and pilot validation in develop, with main reserved for validated versions.

## Workflow and acceptance
1. Branch short-lived work from develop; all work PRs target develop. Existing PR #3 is retargeted, not automatically merged.
2. CI checks PRs and pushes for develop and main: branch-policy, Flutter analysis, tests and web release build. No IA/backend/new paid resources.
3. Merge reviewed work into develop, validate the exact integrated commit with CI and browser acceptance. The pilot Render service should track develop with autoDeploy off and manual releases.
4. Once that candidate has CI and functional evidence, open a release PR from this repository's develop into main. This is the explicit exception to all work PRs targeting develop. Link candidate SHA, successful checks, browser evidence, limitations and rollback. Revalidate the resulting release commit.
5. Never interpret green CI alone as functional acceptance. main promotion and production deployment are distinct actions.

## Configuration versus administrative protection
Actions rejects PRs targeting main from a different source branch/repository. This gate is not an administrative ban on direct pushes; required checks/rulesets and the default branch need separate GitHub settings access. Do not claim those settings changed until observed.
GitHub default branch: desired develop. Render pilot branch: desired develop. Their actual settings must be verified separately; changing a settings document does not change the hosted service.

## Rollback
Revert the workflow configuration PR on develop to undo this policy configuration. Restore hosted settings separately if they were changed. Do not reset develop back to historical clone commits or merge historical sources. Keep main and production untouched during configuration.

## Verification plan
Static checks: YAML parsed, branch-source allow/reject cases evaluated, shell syntax and diff whitespace. Actions must pass on configuration PR before integration, then develop push. PR #3 must incorporate new policy without dropping dependency locking. Local Flutter execution remains blocked by earlier review; use Actions.
