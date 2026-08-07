---
name: developer
description: Pull upstream project clones, sync architecture docs into this meta-repo, update C4 models, and follow branch/commit/PR standards. Use when pulling remote source, syncing the repo, editing C4 PlantUML, staging docs, committing, or opening PRs.
---

# Developer

**Pull upstream → update C4 (when needed) → sync repo → commit/PR.** Architecture docs only — never publish full source trees.

## Hard constraints

1. Pull upstream source into local clones only — see [pull-upstream](references/pull-upstream.md); never stage that source into this meta-repo
2. Publish only whitelist paths — see [sync-repo](references/sync-repo.md)
3. Architecture boundary changes must update C4 `.puml` in the same PR — see [c4-model](references/c4-model.md)
4. Every commit and PR must follow [commit-pr](references/commit-pr.md)
5. Stage only whitelist paths per [sync-repo](references/sync-repo.md) — never `git add -A`

## Workflow

```
pull-upstream → c4-model (if architecture touched) → sync-repo → commit-pr
```

| Step | Reference |
|------|-----------|
| Pull latest code from upstream remotes | [pull-upstream](references/pull-upstream.md) |
| Update C4 layers | [c4-model](references/c4-model.md) |
| Sync architecture docs into this repo | [sync-repo](references/sync-repo.md) |
| Branch / commit / PR | [commit-pr](references/commit-pr.md) |

Tickets for sync or C4 work follow [Product Owner](../product-owner/SKILL.md).

## Checklist

- [ ] Upstream: local clone pulled with `--ff-only` (or N/A)
- [ ] Sync: whitelist paths staged (or N/A)
- [ ] C4: matching `.puml` updated per trigger matrix (or N/A)
- [ ] README Projects / entry points updated if catalog changed (or N/A)
- [ ] Branch: `<type>/<slug>`; Commit: subject + why + References; PR: same References

## Related

| Need | Where |
|------|-------|
| Pull upstream | [pull-upstream](references/pull-upstream.md) |
| Sync repo | [sync-repo](references/sync-repo.md) |
| Update C4 | [c4-model](references/c4-model.md) |
| Commit / PR | [commit-pr](references/commit-pr.md) |
| Stories / AC / DoD | [Product Owner](../product-owner/SKILL.md) |
