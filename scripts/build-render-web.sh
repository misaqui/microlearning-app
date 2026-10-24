#!/usr/bin/env bash
set -euo pipefail

# Render static build: use a specific Flutter release to limit version drift.
FLUTTER_VERSION="3.35.5"
SDK_DIR="${TMPDIR:-/tmp}/microlearning-flutter-sdk"
if [ ! -x "$SDK_DIR/bin/flutter" ]; then
  git clone --quiet --depth 1 --branch "$FLUTTER_VERSION" https://github.com/flutter/flutter.git "$SDK_DIR"
fi
export PATH="$SDK_DIR/bin:$PATH"
flutter --version
flutter config --enable-web
flutter create --platforms=web --project-name microlearning_hub .
flutter pub get
flutter analyze
flutter test
flutter build web --release
