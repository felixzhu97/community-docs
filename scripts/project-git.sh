#!/usr/bin/env bash
# Toggle nested project VCS metadata between .git and .git.local
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
usage() {
  echo "Usage: $0 enable|disable <project-dir>"
  echo "  enable  - .git.local -> .git  (work inside the project clone)"
  echo "  disable - .git -> .git.local  (safe for community meta-repo commits)"
  exit 1
}

[[ $# -eq 2 ]] || usage
action=$1
project=$2
dir="$ROOT/$project"

if [[ ! -d "$dir" ]]; then
  echo "Project not found: $project"
  exit 1
fi

case "$action" in
  enable)
    if [[ -d "$dir/.git" ]]; then
      echo "Already enabled: $project/.git"
      exit 0
    fi
    if [[ ! -d "$dir/.git.local" ]]; then
      echo "No .git.local in $project"
      exit 1
    fi
    mv "$dir/.git.local" "$dir/.git"
    echo "Enabled Git for $project"
    ;;
  disable)
    if [[ -d "$dir/.git.local" ]]; then
      echo "Already disabled: $project/.git.local"
      exit 0
    fi
    if [[ ! -d "$dir/.git" ]]; then
      echo "No .git in $project"
      exit 1
    fi
    mv "$dir/.git" "$dir/.git.local"
    echo "Disabled Git for $project (renamed to .git.local)"
    ;;
  *)
    usage
    ;;
esac
