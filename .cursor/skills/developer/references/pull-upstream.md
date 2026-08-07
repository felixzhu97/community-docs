# Pull Upstream

Pull the latest **source** from each project's upstream remote into the local full clone. Use this before refreshing C4 diagrams against current upstream code.

This step updates local clones only. It does **not** publish source trees into this meta-repo.

## Constraints

- `fetch` / `pull --ff-only` only — never push to upstream
- Prefer `--ff-only` so divergent local history fails loudly
- Do **not** `git add` project source into the meta-repo after a pull
- Nested VCS stays as `.git.local` (use `--git-dir` / `--work-tree`; no rename required)

## Pull one project

```bash
PROJECT=spring-ai   # or spring-security, spring-boot, spring-framework, angular, …

GIT_DIR="$PROJECT/.git.local"
if [[ ! -d "$GIT_DIR" ]]; then
  echo "Missing $GIT_DIR — enable nested git metadata first"
  exit 1
fi

BRANCH=$(git --git-dir="$GIT_DIR" rev-parse --abbrev-ref HEAD)

git --git-dir="$GIT_DIR" --work-tree="$PROJECT" fetch origin
git --git-dir="$GIT_DIR" --work-tree="$PROJECT" pull --ff-only origin "$BRANCH"
```

If HEAD is detached, check out the intended branch (usually `main` or `master`) before pulling.

## Known local clones

| Directory | Typical origin |
|-----------|----------------|
| `spring-ai` | `spring-projects/spring-ai` |
| `spring-security` | `spring-projects/spring-security` |
| `spring-boot` | `spring-projects/spring-boot` |
| `spring-framework` | `spring-projects/spring-framework` |
| `angular` | `angular/angular` |
| `react` | `facebook/react` |
| `react-native` | `facebook/react-native` |

Pull projects one at a time. Do not batch unless the requester names multiple projects.

## After pull

1. If architecture boundaries changed → update C4 per [c4-model](c4-model.md)
2. Publish docs only → [sync-repo](sync-repo.md)
3. Commit / PR → [commit-pr](commit-pr.md)
