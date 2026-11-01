# Render pilot deployment

Workspace microlearning (tea-dbd9mji9lscs73ao01j0), static service srv-dbeih10m7kps73e0nb90. Never use padel.

Desired pilot configuration: repository misaqui/microlearning-app; branch develop; build bash scripts/build-render-web.sh; publish build/web; autoDeploy off. Verify hosted settings independently; this file alone does not apply them. main is reserved for validated versions, not daily development. See BRANCH_WORKFLOW.md.

The service was observed tracking main before this policy change. Changing its branch must not silently trigger a deployment. Use a manual pilot release after exact-candidate CI, and verify live status, SHA and browser behavior.

Current independent baseline: Flutter Web with original local lessons. No backend, login, ingestion API or paid AI calls. Favorites persistence and dependency locking are proposed in PR #3 until integrated; do not describe pending code as published. Historical clone source/assets remain excluded; see UPSTREAM_PROVENANCE.md.

## Validation and promotion
1. Work PRs target develop. Check CI and review before integrating.
2. For a pilot release, verify exact develop SHA, build gates and service settings; monitor the deploy to live.
3. Exercise Discover, detail, save, Library and reload in browser. Once PR #3 lands, require favorites to survive reload and deletion to persist. Report device/browser limits.
4. Promote a validated version only via develop-to-main PR with evidence. Production deployment remains a separate authorized action.

Rollback: revert the offending PR on develop and manually release the previous approved candidate, checking final live SHA. Do not erase unrelated local preferences.

## PR #3 candidate
This candidate adds local favorites and commits pubspec.lock with exact hashes. CI/Render generate scaffolding with --no-pub, enforce the lock, and run analyze/test/build without resolving again. These changes remain unpublished until integration and manual pilot release; the checks against the old main-based merge are historical evidence only. Require new CI against develop.
