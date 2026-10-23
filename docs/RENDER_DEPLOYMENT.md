# Render deploy readiness

Target: workspace microlearning (tea-dbd9mji9lscs73ao01j0). Never use padel.

Frontend: Flutter Web static site.
Repository: misaqui/microlearning-app
Branch: develop
Build: bash scripts/build-render-web.sh
Publish directory: build/web
Autodeploy: off until checks and redistribution rights are cleared.

IMPORTANT: upstream repository appears to have no LICENSE; do not create a publicly distributed build until rights are resolved. GitHub Actions should report passing analyze, test, and build first.

Backend, login and ingestion API are not implemented yet. A Flutter UI deployed without those would be a preview, not an operational secure multiuser MVP.
