# Community Architecture Atlas

[![License](https://img.shields.io/badge/license-Community%20Learning-blue.svg)](#license)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](#contributing)

A community collection of **architecture diagrams** for open-source projects — primarily [C4 Model](https://c4model.com/) views — to help developers understand system boundaries, containers, and core components.

> **Current focus:** Spring ecosystem only (`spring-ai`, `spring-security`). Other local clones stay ignored for now.
>
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
| [Spring AI](https://github.com/spring-projects/spring-ai) | C4 | [`spring-ai/docs/c4-model/`](spring-ai/docs/c4-model/) | Spring AI framework (ChatClient / RAG / MCP) |
| [Spring Security](https://github.com/spring-projects/spring-security) | C4 | [`spring-security/docs/c4-model/`](spring-security/docs/c4-model/) | Authentication and authorization |

## Repository Layout

```text
community-architecture-atlas/
├── README.md
├── scripts/                              # maintainer helpers (optional)
├── spring-ai/docs/c4-model/              # Context / Container / Component / Dynamic
└── spring-security/docs/c4-model/        # Context / Containers / Components / Sequences
```

## Quick Start

### Browse PlantUML sources

1. **Online**: paste a `.puml` file into [PlantUML Online](https://www.plantuml.com/plantuml/uml/)
2. **Editor**: install a PlantUML extension in VS Code / Cursor and open the file
3. **CLI**:

```bash
brew install plantuml   # macOS
plantuml spring-ai/docs/c4-model/context/system-context.puml
```

Useful entry points:

- [Spring AI system context](spring-ai/docs/c4-model/context/system-context.puml)
- [Spring Security system context](spring-security/docs/c4-model/01-system-context.puml)

## Suggested Learning Path

1. Read [Spring AI C4](spring-ai/docs/c4-model/) for ChatClient, RAG / ETL, and MCP layering
2. Study [Spring Security C4](spring-security/docs/c4-model/), focusing on trust boundaries and deployment / sequence views
3. Compare how both projects separate framework APIs, adapters, and Boot auto-configuration

## Contributing

Issues and pull requests are welcome: add models, fix mistakes, improve docs, or extend coverage within the Spring ecosystem.

### Before you contribute

- [ ] Content is for learning and respects upstream licenses and attribution
- [ ] Diagram layers are clear (C1 → C2 → C3)
- [ ] Include a short README or index (overview, diagram list, how to render)
- [ ] Prefer PlantUML sources; PNGs are optional

### Adding a Spring project

1. Add `docs/c4-model/` (or equivalent) under the project directory
2. Update the [Projects](#projects) table in this README
3. Maintainers syncing a local workspace should also update the `.gitignore` whitelist and `scripts/stage-architecture.sh`

### Commit messages

Use clear conventional-style messages, for example:

```text
docs(spring-ai): refine ChatClient component diagram
docs(spring-security): clarify OAuth2 login sequence
```

## Community Guidelines

- **Be kind**: keep discussion focused on architecture and technology
- **Cite sources**: link upstream design docs when you reuse ideas
- **Keep it minimal**: architecture docs only — no full source trees, secrets, or build artifacts
- **Stay verifiable**: tie claims to containers / components in the diagrams or to source paths

When in doubt, open an Issue for discussion before merging.

## Acknowledgments

Thanks to the authors and contributors of the upstream Spring projects. Architecture notes in this atlas are for community learning and are **not** official upstream documentation. If anything conflicts with an upstream README or docs site, the upstream project wins.

## License

- Cataloging, learning paths, and community docs in this repository are shared for learning and collaboration
- Architecture models that include upstream copyrighted material remain under the corresponding upstream licenses
- Review upstream `LICENSE` files before reuse or redistribution

---

If this atlas helps you, a Star is appreciated. Ideas and improvements are welcome via Issues and PRs.
