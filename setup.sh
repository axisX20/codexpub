#!/usr/bin/env bash
set -e

# Download Flutter SDK (stable channel)
git clone https://github.com/flutter/flutter.git -b stable --depth 1

# Add Flutter to PATH
export PATH="$PWD/flutter/bin:$PATH"

# Get project dependencies
flutter pub get

# (Optional) Run Flutter doctor (checks if everything is fine)
flutter doctor
