# Community Architecture Atlas

[![License](https://img.shields.io/badge/license-Community%20Learning-blue.svg)](#license)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](#contributing)

A community collection of **architecture diagrams** for popular open-source projects — primarily [C4 Model](https://c4model.com/) and [TOGAF](https://www.opengroup.org/togaf) views — to help developers understand system boundaries, containers, and core components.

> This repository hosts architecture models and documentation only. Full application source trees are not published here.

## Table of Contents

- [About](#about)
- [Projects](#projects)
- [Repository Layout](#repository-layout)
- [Quick Start](#quick-start)
- [Suggested Learning Path](#suggested-learning-path)
- [Contributing](#contributing)
- [Community Guidelines](#community-guidelines)
- [Acknowledgments](#acknowledgments)
- [License](#license)

## About

Architecture insight in large open-source codebases is often scattered across source and ad-hoc docs. This atlas brings reusable architecture views together so that:

- Newcomers can build a clear mental model (C1 → C2 → C3)
- Teams can discuss trade-offs against real-world projects
- Contributors can improve PlantUML models and explanations

Diagrams are written in **PlantUML**. Some directories also include pre-rendered PNGs for quick browsing.

## Projects

| Project | Type | Path | Description |
|---------|------|------|-------------|
| [n8n](https://github.com/n8n-io/n8n) | C4 | [`n8n/c4-models/`](n8n/c4-models/) | Workflow automation platform |
| [OpenClaw](https://github.com/openclaw/openclaw) | C4 + Docs | [`openclaw/c4-models/`](openclaw/c4-models/), [`openclaw/docs/`](openclaw/docs/concepts/architecture.md) | AI agent runtime (EN / ZH) |
| [Spring AI](https://github.com/spring-projects/spring-ai) | C4 | [`spring-ai/docs/c4-model/`](spring-ai/docs/c4-model/) | Spring AI framework (ChatClient / RAG / MCP) |
| [Spring Security](https://github.com/spring-projects/spring-security) | C4 | [`spring-security/docs/c4-model/`](spring-security/docs/c4-model/) | Authentication and authorization |
| [domain-driven-hexagon](https://github.com/Sairyss/domain-driven-hexagon) | TOGAF | [`domain-driven-hexagon/docs/architecture/togaf/`](domain-driven-hexagon/docs/architecture/togaf/) | DDD hexagonal example |
| [NocoBase](https://github.com/nocobase/nocobase) | TOGAF | [`nocobase/docs/architecture/togaf/`](nocobase/docs/architecture/togaf/) | No-code / low-code platform |

## Repository Layout

```text
community-architecture-atlas/
├── README.md
├── scripts/                          # maintainer helpers (optional)
├── n8n/c4-models/                    # C1 / C2 / C3
├── openclaw/
│   ├── c4-models/{zh,en}/            # bilingual C4
│   └── docs/.../architecture*.md
├── spring-ai/docs/c4-model/          # Context / Container / Component / Dynamic
├── spring-security/docs/c4-model/
├── domain-driven-hexagon/docs/architecture/togaf/
└── nocobase/docs/architecture/togaf/
```

## Quick Start

### Browse rendered images

Some projects ship PNGs, for example:

- [n8n C1 Context](n8n/c4-models/images/C1-Context.png)
- [OpenClaw C1 (ZH)](openclaw/c4-models/zh/images/C1-Context.png)
- [NocoBase overview](nocobase/docs/architecture/togaf/out/00-overview-context.png)

### Preview PlantUML sources

1. **Online**: paste a `.puml` file into [PlantUML Online](https://www.plantuml.com/plantuml/uml/)
2. **Editor**: install a PlantUML extension in VS Code / Cursor and open the file
3. **CLI**:

```bash
brew install plantuml   # macOS
plantuml n8n/c4-models/C1-Context.puml
```

## Suggested Learning Path

1. Start with [n8n C1 Context](n8n/c4-models/C1-Context.puml) to learn C4 layers, then drill into Container / Component
2. Compare [OpenClaw C4 (ZH)](openclaw/c4-models/zh/) with the [architecture notes](openclaw/docs/concepts/architecture.md) for a plugin-based agent runtime
3. Read [Spring AI C4](spring-ai/docs/c4-model/) for ChatClient, RAG / ETL, and MCP layering
4. Study [Spring Security C4](spring-security/docs/c4-model/), focusing on trust boundaries and deployment / sequence views
5. Use [NocoBase TOGAF](nocobase/docs/architecture/togaf/) for an enterprise-architecture perspective
6. Map DDD ideas to architecture views via [domain-driven-hexagon](domain-driven-hexagon/docs/architecture/togaf/)

## Contributing

Issues and pull requests are welcome: add models, fix mistakes, improve docs, or onboard another open-source project's architecture views.

### Before you contribute

- [ ] Content is for learning and respects upstream licenses and attribution
- [ ] Diagram layers are clear (C1 → C2 → C3, or TOGAF business / application / data / technology)
- [ ] Include a short README or index (overview, diagram list, how to render)
- [ ] Prefer PlantUML sources; PNGs are optional

### Adding a new project

1. Add `c4-models/` or `docs/architecture/` (TOGAF) under the project directory
2. Update the [Projects](#projects) table in this README
3. Maintainers syncing a local workspace should also update the `.gitignore` whitelist and `scripts/stage-architecture.sh`

### Commit messages

Use clear conventional-style messages, for example:

```text
docs(n8n): refine C2 container boundaries
docs(openclaw): add plugin system component diagram
```

## Community Guidelines

- **Be kind**: keep discussion focused on architecture and technology
- **Cite sources**: link upstream design docs when you reuse ideas
- **Keep it minimal**: architecture docs only — no full source trees, secrets, or build artifacts
- **Stay verifiable**: tie claims to containers / components in the diagrams or to source paths

When in doubt, open an Issue for discussion before merging.

## Acknowledgments

Thanks to the authors and contributors of the upstream open-source projects. Architecture notes in this atlas are for community learning and are **not** official upstream documentation. If anything conflicts with an upstream README or docs site, the upstream project wins.

## License

- Cataloging, learning paths, and community docs in this repository are shared for learning and collaboration
- Architecture models that include upstream copyrighted material remain under the corresponding upstream licenses
- Review upstream `LICENSE` files before reuse or redistribution

---

If this atlas helps you, a Star is appreciated. Ideas and improvements are welcome via Issues and PRs.
