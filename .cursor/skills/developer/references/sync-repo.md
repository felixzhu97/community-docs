# Sync Repo

Sync **architecture docs only** from the local workspace into this meta-repo. Full application source trees stay local and must not be published.

Agent-driven workflow: follow this skill (and [c4-model](c4-model.md) / [commit-pr](commit-pr.md)). Do not rely on helper shell scripts.

## Publish whitelist

Allowed to stage and commit:

| Path | Role |
|------|------|
| `*/docs/c4-model/` | C4 PlantUML (and optional PNG) |
| `README.md` | Projects catalog and entry points |
| `.gitignore` | Local-clone ignore + docs whitelist |
| `.cursor/skills/` | Maintainer workflow skills |

Everything else under project clones (e.g. `angular/`, `spring-boot/` source) is ignored — see root `.gitignore`.

Current published C4 trees:

- `spring-ai/docs/c4-model/`
- `spring-security/docs/c4-model/`

## Stage (required)

Stage **only** whitelist paths. Do **not** use `git add -A`.

```bash
git add .gitignore README.md
git add .cursor/skills/
git add spring-ai/docs/c4-model/
git add spring-security/docs/c4-model/
git status --short
```

When onboarding a new project, extend the `git add` list with that project's `docs/c4-model/` path.

## Nested upstream Git

Local full clones keep VCS as `.git.local` so they do not collide with this meta-repo.

```bash
# Work inside an upstream clone
mv spring-ai/.git.local spring-ai/.git

# Before committing this meta-repo, hide nested Git again
mv spring-ai/.git spring-ai/.git.local
```

Replace `spring-ai` with the target project directory name.

## Onboard a new project

1. Add `docs/c4-model/` under the project directory (C1→C3 as needed)
2. Add a row to the Projects table in root `README.md`
3. Whitelist the path in `.gitignore` (same pattern as `spring-ai` / `spring-security`)
4. Add the C4 path to the stage commands above
5. Stage whitelist paths, then follow [commit-pr](commit-pr.md)
