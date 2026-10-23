#!/usr/bin/env bash
set -euo pipefail
FLUTTER_CHANNEL=stable
if ! command -v flutter >/dev/null 2>&1; then
  git clone --depth 1 --branch "$FLUTTER_CHANNEL" https://github.com/flutter/flutter.git /tmp/flutter
  export PATH="/tmp/flutter/bin:$PATH"
fi
flutter config --enable-web
flutter pub get
flutter build web --release
