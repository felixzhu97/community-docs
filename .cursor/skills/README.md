# Skills

Project skills for **Community Docs**. Thin `SKILL.md` entry points; details live in each skill's `references/`.

## Skills

| Skill | Use when |
|-------|----------|
| [developer](./developer/) | Pull upstream clones, sync architecture docs, update C4, branch / commit / PR |
| [product-owner](./product-owner/) | Write stories, acceptance criteria, and DoD for sync-repo or C4 work |

## References layout

```text
developer/references/
  pull-upstream.md  # fetch/pull local clones from upstream remotes
  sync-repo.md      # whitelist, stage script, onboard project
  c4-model.md       # paths, layers, trigger matrix
  commit-pr.md      # branch / commit / PR

product-owner/references/
  story-template.md
  acceptance-criteria.md
```

## How to use

- Pull latest upstream source → `developer` → [pull-upstream](./developer/references/pull-upstream.md)
- Sync docs or edit C4 → `developer`
- Commit or open a PR → `developer` → [commit-pr](./developer/references/commit-pr.md)
- Shape a sync/C4 ticket → `product-owner`
