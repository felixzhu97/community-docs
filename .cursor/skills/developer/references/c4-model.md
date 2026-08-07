# Update C4 Model

Architecture insight in this repo lives under each project's `docs/c4-model/`. Prefer **PlantUML** (`.puml`) as source of truth.

## Paths

| Project | Path |
|---------|------|
| Angular | [`angular/docs/c4-model/`](../../../../angular/docs/c4-model/) |
| React | [`react/docs/c4-model/`](../../../../react/docs/c4-model/) |
| React Native | [`react-native/docs/c4-model/`](../../../../react-native/docs/c4-model/) |
| Spring Boot | [`spring-boot/docs/c4-model/`](../../../../spring-boot/docs/c4-model/) |
| Spring AI | [`spring-ai/docs/c4-model/`](../../../../spring-ai/docs/c4-model/) |
| Spring Security | [`spring-security/docs/c4-model/`](../../../../spring-security/docs/c4-model/) |

New projects use: `<project>/docs/c4-model/`.

## File naming (required)

Follow [c4model.com/diagrams](https://c4model.com/diagrams). Keep the directory **flat** (no nested type folders). **Every** `.puml` file must use a `C1-`–`C4-` level prefix.

| Prefix | Diagram kind | Filename pattern | Example |
|--------|--------------|------------------|---------|
| `C1-` | System Context | `C1-SystemContext.puml` | `C1-SystemContext.puml` |
| `C2-` | Container | `C2-Container.puml` | `C2-Container.puml` |
| `C3-` | Component | `C3-Component-<Scope>.puml` | `C3-Component-RuntimeCore.puml` |
| `C4-` | Code | `C4-Code-<Scope>.puml` | `C4-Code-ChatClient.puml` |
| `C4-` | Dynamic (supporting) | `C4-Dynamic-<Scenario>.puml` | `C4-Dynamic-BootstrapChangeDetection.puml` |
| `C4-` | Deployment (supporting) | `C4-Deployment-<Scope>.puml` | `C4-Deployment-EmbeddedRuntime.puml` |
| `C4-` | Sequence-style flow | `C4-Sequence-<Scenario>.puml` | `C4-Sequence-FormLogin.puml` |

`C4-` covers both **Code** (static structure level 4) and C4 **supporting** diagram types (Dynamic / Deployment / Sequence). Distinguish them with the second token (`Code`, `Dynamic`, `Deployment`, `Sequence`).

Rules:

- One diagram per file; multiple views of the same kind use distinct `<Scope>` / `<Scenario>` suffixes
- Prefer PascalCase after the kind token (`SystemContext`, not `system-context`)
- Include a short `README.md` index in the same flat directory
- Filenames stay English; diagram **content** and README follow the Language section below

## Language (required)

All catalog projects use **Chinese** for diagram and README prose. Filenames remain English PascalCase with `C1-`–`C4-` prefixes.

| Field | Pattern | Example |
|-------|---------|---------|
| `title` | `中文 — 项目` | `系统上下文图 — Angular` |
| Element name | 中文角色/概念；专业名保留英文 | `应用开发者`、`ChatClient`、`@angular/core` |
| Element description | 中文叙述，术语不翻译 | `"用 TypeScript 与 Angular API 构建 Web 应用。"` |
| `Rel` label | 中文；协议 / API 名保留英文 | `"从 @angular/* 导入 API"`、`"HTTPS"` |
| README | 中文；Kind 列用中文图类型名 | `系统上下文`、`容器`、`组件` |

**Do not** force-translate product names, package IDs, class/API names, or protocols (e.g. Angular, Spring AI, OAuth2, MCP, `ChatClient`, npm, JDBC, DI, SSR). Keep them in English as commonly used.

Reference layout (Angular):

```text
docs/c4-model/
├── README.md
├── C1-SystemContext.puml
├── C2-Container.puml
├── C3-Component-RuntimeCore.puml
├── C3-Component-CompilerPipeline.puml
└── C4-Dynamic-BootstrapChangeDetection.puml
```

## Layers

| Layer / kind | Typical content |
|--------------|-----------------|
| C1 System Context | System boundary, actors, external systems |
| C2 Container | Apps, data stores, major runtime units |
| C3 Component | Packages / modules inside a container |
| C4 Code | Classes / key types (optional) |
| C4 Dynamic / Sequence | Key runtime flows |
| C4 Deployment | Topology, hosts, ports |

## Trigger matrix

If **any** row matches, update the listed artifacts in the **same PR**. If none match, mark N/A.

| Change | Update |
|--------|--------|
| New external actor/system, or system purpose change | `C1-SystemContext.puml` |
| New container, subdomain boundary, major data store | `C2-Container.puml` |
| New/changed module or component structure inside a container | Matching `C3-Component-*.puml` |
| New/changed class-level design worth a Code view | Matching `C4-Code-*.puml` |
| New/changed critical runtime flow | Matching `C4-Dynamic-*.puml` or `C4-Sequence-*.puml` |
| Deploy topology, ports, hosting | Matching `C4-Deployment-*.puml` |
| Project added to or removed from the catalog | Matching `docs/c4-model/` + root README Projects |
| Pure wording polish with no architecture semantics | None (N/A) |

## Rules

1. Edit `.puml` first
2. If PNG previews exist, refresh them in the same PR when PlantUML is available; otherwise note in the PR that PNGs are pending
3. When diagrams conflict with upstream docs or source, **upstream wins** — cite upstream in commit/PR References ([commit-pr](commit-pr.md))
4. Keep diagrams minimal and verifiable (tie claims to real containers/components or source paths)

## Workflow

1. Identify which layer(s) the change affects (matrix above)
2. Update the matching flat `.puml` files under `*/docs/c4-model/`
3. Sync via [sync-repo](sync-repo.md)
4. Commit / open PR per [commit-pr](commit-pr.md)
