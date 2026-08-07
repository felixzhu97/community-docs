#!/usr/bin/env bash
# Stage only Spring ecosystem architecture docs for the community meta-repo.
# Prefer this over `git add -A`.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

git add .gitignore README.md scripts/

git add spring-ai/docs/c4-model/
git add spring-security/docs/c4-model/

echo "Staged architecture paths. Review with: git status --short"
git status --short
