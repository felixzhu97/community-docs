# Update C4 Model

Architecture insight in this repo lives under each project's `docs/c4-model/`. Prefer **PlantUML** (`.puml`) as source of truth.

## Paths

| Project | Path |
|---------|------|
| Spring AI | [`spring-ai/docs/c4-model/`](../../../../spring-ai/docs/c4-model/) |
| Spring Security | [`spring-security/docs/c4-model/`](../../../../spring-security/docs/c4-model/) |

New projects use the same layout: `<project>/docs/c4-model/`.

Layouts may differ by project (folders like `context/`, `container/`, `component/`, or numbered files like `01-system-context.puml`). Keep the project's existing convention.

## Layers

| Layer | Typical content |
|-------|-----------------|
| C1 Context | System boundary, actors, external systems |
| C2 Container | Apps, data stores, major runtime units |
| C3 Component | Packages / modules inside a container |
| Dynamic / Sequence | Key runtime flows |
| Deployment | Topology, hosts, ports (when present) |

## Trigger matrix

If **any** row matches, update the listed C4 artifacts in the **same PR**. If none match, mark N/A.

| Change | Update |
|--------|--------|
| New external actor/system, or system purpose change | C1 Context |
| New container, subdomain boundary, major data store | C2 Container |
| New/changed module or component structure inside a container | C3 Component |
| New/changed critical runtime flow | Dynamic / Sequence (if the project has them) |
| Deploy topology, ports, hosting | Deployment (if present) |
| Project added to or removed from the catalog | Matching C4 tree + root README Projects |
| Pure wording polish with no architecture semantics | None (N/A) |

## Rules

1. Edit `.puml` first
2. If PNG previews exist, refresh them in the same PR when PlantUML is available; otherwise note in the PR that PNGs are pending
3. When diagrams conflict with upstream docs or source, **upstream wins** — cite upstream in commit/PR References ([commit-pr](commit-pr.md))
4. Keep diagrams minimal and verifiable (tie claims to real containers/components or source paths)

## Workflow

1. Identify which layer(s) the change affects (matrix above)
2. Update the matching `.puml` files under `*/docs/c4-model/`
3. Sync via [sync-repo](sync-repo.md)
4. Commit / open PR per [commit-pr](commit-pr.md)
