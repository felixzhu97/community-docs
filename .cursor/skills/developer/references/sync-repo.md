# Sync Repo

Sync **architecture docs only** from the local workspace into this meta-repo. Full application source trees stay local and must not be published.

## Publish whitelist

Allowed to stage and commit:

| Path | Role |
|------|------|
| `*/docs/c4-model/` | C4 PlantUML (and optional PNG) |
| `README.md` | Projects catalog and entry points |
| `.gitignore` | Local-clone ignore + docs whitelist |
| `scripts/` | Maintainer helpers |

Everything else under project clones (e.g. `angular/`, `spring-boot/` source) is ignored — see root `.gitignore`.

Current published C4 trees:

- `spring-ai/docs/c4-model/`
- `spring-security/docs/c4-model/`

## Stage (required)

Prefer the staging script; do **not** rely on `git add -A`.

```bash
./scripts/stage-architecture.sh
git status --short
```

The script stages `.gitignore`, `README.md`, `scripts/`, and the Spring C4 paths above. Extend it when adding a new project.

## Nested upstream Git

Local full clones keep VCS as `.git.local` so they do not collide with this meta-repo.

```bash
# Work inside an upstream clone
./scripts/project-git.sh enable spring-ai

# Before committing this meta-repo, hide nested Git again
./scripts/project-git.sh disable spring-ai
```

## Onboard a new project

1. Add `docs/c4-model/` under the project directory (C1→C3 as needed)
2. Add a row to the Projects table in root `README.md`
3. Whitelist the path in `.gitignore` (same pattern as `spring-ai` / `spring-security`)
4. Add the C4 path to `scripts/stage-architecture.sh`
5. Sync via the staging script, then follow [commit-pr](commit-pr.md)
