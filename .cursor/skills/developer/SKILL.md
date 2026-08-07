---
name: developer
description: Sync architecture docs into this meta-repo, update C4 models, and follow branch/commit/PR standards. Use when syncing the repo, editing C4 PlantUML, staging docs, committing, or opening PRs.
---

# Developer

**Sync repo → update C4 (when needed) → commit/PR.** Architecture docs only — never publish full source trees.

## Hard constraints

1. Publish only whitelist paths — see [sync-repo](references/sync-repo.md)
2. Architecture boundary changes must update C4 `.puml` in the same PR — see [c4-model](references/c4-model.md)
3. Every commit and PR must follow [commit-pr](references/commit-pr.md)
4. Prefer `./scripts/stage-architecture.sh` over `git add -A`

## Workflow

```
sync-repo → c4-model (if architecture touched) → commit-pr
```

| Step | Reference |
|------|-----------|
| Sync architecture docs into this repo | [sync-repo](references/sync-repo.md) |
| Update C4 layers | [c4-model](references/c4-model.md) |
| Branch / commit / PR | [commit-pr](references/commit-pr.md) |

Tickets for sync or C4 work follow [Product Owner](../product-owner/SKILL.md).

## Checklist

- [ ] Sync: whitelist paths staged (or N/A)
- [ ] C4: matching `.puml` updated per trigger matrix (or N/A)
- [ ] README Projects / entry points updated if catalog changed (or N/A)
- [ ] Branch: `<type>/<slug>`; Commit: subject + why + References; PR: same References

## Related

| Need | Where |
|------|-------|
| Sync repo | [sync-repo](references/sync-repo.md) |
| Update C4 | [c4-model](references/c4-model.md) |
| Commit / PR | [commit-pr](references/commit-pr.md) |
| Stories / AC / DoD | [Product Owner](../product-owner/SKILL.md) |
