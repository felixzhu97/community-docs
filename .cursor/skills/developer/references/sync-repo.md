# Sync Repo

Sync **architecture docs only** from the local workspace into this meta-repo. Full application source trees stay local and must not be published.

To refresh local clones from upstream remotes first, see [pull-upstream](pull-upstream.md). This document only covers staging docs into the meta-repo.

Agent-driven workflow: follow this skill (and [c4-model](c4-model.md) / [commit-pr](commit-pr.md)). Do not rely on helper shell scripts.

## Publish whitelist

Allowed to stage and commit:

| Path | Role |
|------|------|
| `*/docs/c4-model/` | Flat C1–C4 PlantUML (and optional PNG) |
| `spring-security/docs/glossary.md` | Spring Security 社区术语表 |
| `README.md` | Projects catalog and entry points |
| `.gitignore` | Default-deny root + docs whitelist |
| `.cursor/skills/` | Maintainer workflow skills |

Root `.gitignore` uses `/*` default-deny, un-ignores published project roots, then allows only `*/docs/c4-model/`. New local clones are ignored automatically; onboarding a project only needs `!<name>/` plus that shared docs rule.

Current published C4 trees:

- `angular/docs/c4-model/`
- `react/docs/c4-model/`
- `react-native/docs/c4-model/`
- `spring-framework/docs/c4-model/`
- `spring-boot/docs/c4-model/`
- `spring-ai/docs/c4-model/`
- `spring-security/docs/c4-model/`
- `spring-security/docs/glossary.md`

## Stage (required)

Stage **only** whitelist paths. Do **not** use `git add -A`.

```bash
git add .gitignore README.md
git add .cursor/skills/
git add angular/docs/c4-model/
git add react/docs/c4-model/
git add react-native/docs/c4-model/
git add spring-framework/docs/c4-model/
git add spring-boot/docs/c4-model/
git add spring-ai/docs/c4-model/
git add spring-security/docs/c4-model/
git add spring-security/docs/glossary.md
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

1. Add flat `docs/c4-model/` files using `C1-`–`C4-` naming (see [c4-model](c4-model.md))
2. Add a row to the Projects table in root `README.md`
3. Whitelist `docs/c4-model/` in `.gitignore` (same pattern as `angular`)
4. Add that path to the stage commands above
5. Stage whitelist paths, then follow [commit-pr](commit-pr.md)
