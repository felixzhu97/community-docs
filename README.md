# Community Docs

[![License](https://img.shields.io/badge/license-Community%20Learning-blue.svg)](#license)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](#contributing)

A community collection of **architecture diagrams** for open-source projects — primarily [C4 Model](https://c4model.com/) views — to help developers understand system boundaries, containers, and core components.

> **Scope:** Angular plus Spring ecosystem (`angular`, `spring-ai`, `spring-security`).  
> This repository publishes architecture models and documentation only — not full application source trees.

## Table of Contents

- [About](#about)
- [Projects](#projects)
- [Repository Layout](#repository-layout)
- [Quick Start](#quick-start)
- [Suggested Learning Path](#suggested-learning-path)
- [Contributing](#contributing)
- [Code of Conduct](#code-of-conduct)
- [Acknowledgments](#acknowledgments)
- [License](#license)

## About

Architecture insight in large open-source codebases is often scattered across source and ad-hoc docs. This repository brings reusable architecture views together so that:

- Newcomers can build a clear mental model (C1 → C2 → C3)
- Teams can discuss trade-offs against real-world projects
- Contributors can improve PlantUML models and explanations

Diagrams are written in **PlantUML**. Some directories also include pre-rendered PNGs for quick browsing.

## Projects

| Project | Type | Path | Description |
|---------|------|------|-------------|
| [Angular](https://github.com/angular/angular) | C4 | [`angular/docs/c4-model/`](angular/docs/c4-model/) | Web platform: core runtime, compiler, first-party packages |
| [Spring AI](https://github.com/spring-projects/spring-ai) | C4 | [`spring-ai/docs/c4-model/`](spring-ai/docs/c4-model/) | Spring AI framework (ChatClient / RAG / MCP) |
| [Spring Security](https://github.com/spring-projects/spring-security) | C4 | [`spring-security/docs/c4-model/`](spring-security/docs/c4-model/) | Authentication and authorization |

## Repository Layout

```text
community-docs/
├── README.md
├── angular/docs/c4-model/                # C1–C4 flat
├── spring-ai/docs/c4-model/              # C1–C4 flat
└── spring-security/docs/c4-model/        # C1–C4 flat
```

## Quick Start

### Browse PlantUML sources

1. **Online**: paste a `.puml` file into [PlantUML Online](https://www.plantuml.com/plantuml/uml/)
2. **Editor**: install a PlantUML extension in VS Code / Cursor and open the file
3. **CLI**:

```bash
brew install plantuml   # macOS
plantuml angular/docs/c4-model/C1-SystemContext.puml
```

Useful entry points:

- [Angular system context](angular/docs/c4-model/C1-SystemContext.puml)
- [Spring AI system context](spring-ai/docs/c4-model/C1-SystemContext.puml)
- [Spring Security system context](spring-security/docs/c4-model/C1-SystemContext.puml)

## Suggested Learning Path

1. Read [Angular C4](angular/docs/c4-model/) for platform packages, runtime core, and the compiler pipeline
2. Read [Spring AI C4](spring-ai/docs/c4-model/) for ChatClient, RAG / ETL, and MCP layering
3. Study [Spring Security C4](spring-security/docs/c4-model/), focusing on trust boundaries and deployment / sequence views
4. Compare how framework APIs, adapters, and tooling are separated across these projects

## Contributing

Issues and pull requests are welcome. You can help by adding models, fixing mistakes, improving docs, or extending project coverage.

### Before you contribute

- [ ] Content is for learning and respects upstream licenses and attribution
- [ ] Diagram layers are clear (C1 → C2 → C3)
- [ ] Include a short README or index (overview, diagram list, how to render)
- [ ] Prefer PlantUML sources; PNGs are optional
- [ ] Submit architecture docs only — no full source trees, secrets, or build artifacts

### Adding a project

1. Add `docs/c4-model/` (or equivalent) under the project directory
2. Update the [Projects](#projects) table in this README
3. Open a pull request with a clear description of what you added

### Commit messages

Use clear conventional-style messages, for example:

```text
docs(angular): refine core runtime component diagram
docs(spring-ai): refine ChatClient component diagram
docs(spring-security): clarify OAuth2 login sequence
```

## Code of Conduct

- Be kind and keep discussion focused on architecture and technology
- Cite sources: link upstream design docs when you reuse ideas
- Stay verifiable: tie claims to containers / components in the diagrams or to source paths

When in doubt, open an Issue for discussion before merging.

## Acknowledgments

Thanks to the authors and contributors of the upstream Angular and Spring projects. Architecture notes in this repository are for community learning and are **not** official upstream documentation. If anything conflicts with an upstream README or docs site, the upstream project wins.

## License

- Cataloging, learning paths, and community docs in this repository are shared for learning and collaboration
- Architecture models that include upstream copyrighted material remain under the corresponding upstream licenses
- Review upstream `LICENSE` files before reuse or redistribution

---

If this project helps you, a Star is appreciated. Ideas and improvements are welcome via Issues and PRs.
