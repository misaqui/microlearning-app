# Render pilot deployment

Target: confirmed workspace microlearning (tea-dbd9mji9lscs73ao01j0), static service srv-dbeih10m7kps73e0nb90. Never use padel.

- Repository: misaqui/microlearning-app; canonical branch main. develop is historical.
- Build: bash scripts/build-render-web.sh; publish directory build/web.
- AutoDeploy remains off; release is manual, using reviewed commit after CI success and existing user release authorization.
- Flutter 3.35.5 and committed pubspec.lock. Generate web scaffolding with --no-pub, then enforce lockfile; analysis/test/build do not resolve again.
- No backend, authentication, ingestion, analytics or AI calls. Three original local lessons; local-only favorites. This is a usability pilot, not a secure multiuser product.

## Provenance
The current main implementation was independently rebuilt. Do not import source, assets or content from historical clone branches; see UPSTREAM_PROVENANCE.md. The earlier upstream permission warning applies to that historical material, not to a claim of copied material in this independent pilot.

## Release procedure
1. Review exact PR head and Actions evidence. Merge to main, require main CI success before release.
2. Confirm service/workspace/branch, current live deploy and target main SHA. Trigger one manual deploy and retain its ID; monitor until live or failed. Never equate accepted trigger with live.
3. Inspect build evidence for lock enforcement, analyze, tests and web build. Verify deployed SHA matches intended main SHA.
4. Browser: Discover -> detail -> save two ideas -> Library -> reload -> both remain. Remove one -> reload -> only remaining idea. Reopen same origin/profile and recheck. Check mobile layout separately; do not claim device QA from desktop evidence.
5. Record evidence and remaining limitations. No cross-device/personal account persistence; clearing site data can erase favorites.

## Rollback
Revert the PR and manually release the previous approved source after its checks, or use the previous retained Render artifact when available. Confirm final live version and autoDeploy remains off. The local key may remain inert; do not delete unrelated browser data.
