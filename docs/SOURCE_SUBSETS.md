# Initial source subsets — design only

1. Web articles: manually entered public HTTPS URL; extraction on demand; editorial review mandatory.
2. Manual authoring: administrator's own notes/text; publish only after approval.
3. Inspirations: apps, websites, and GitHub repositories for feature proposals, separate from published learning cards.

Web source default: type=web, url=null, refresh=manual, publication=review, status=draft.

PDF, video, RSS, automatic refresh and automatic publication are excluded from the first operational ingestion scope.

Security: server-verified authorization, SSRF protections (including redirected and resolved addresses), size/time limits, sanitization, deduplication, audit logging, AI spend caps, and provenance are mandatory before ingestion is enabled.

All features above are planned; they are not implemented by this file.
