#!/usr/bin/env bash
# Stage only architecture docs for the community meta-repo.
# Prefer this over `git add -A` — child project .gitignore files may re-include
# unrelated paths (e.g. n8n's `!.claude`).
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

git add .gitignore README.md scripts/

git add n8n/c4-models/

git add openclaw/c4-models/
git add -f \
  openclaw/docs/concepts/architecture.md \
  openclaw/docs/concepts/delegate-architecture.md \
  openclaw/docs/plugins/architecture.md \
  openclaw/docs/plugins/architecture-internals.md

git add spring-ai/docs/c4-model/

git add spring-security/docs/c4-model/

git add domain-driven-hexagon/docs/architecture/togaf/

git add nocobase/docs/architecture/togaf/

git add tensorflow/docs/togaf/

git add -f transformers/docs/togaf_*.puml

# Drop accidental paths that child .gitignore files may re-include
git rm -r --cached --ignore-unmatch n8n/.claude >/dev/null 2>&1 || true

echo "Staged architecture paths. Review with: git status --short"
git status --short
