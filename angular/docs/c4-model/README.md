# Angular C4 Model

This directory describes the [Angular](https://github.com/angular/angular) monorepo with the [C4 model](https://c4model.com/) and [C4-PlantUML](https://github.com/plantuml-stdlib/C4-PlantUML).

Angular is a **web application platform** (TypeScript packages + tooling), not a single deployable app. The system boundary is the Angular platform that application developers consume via npm packages and Angular tooling.

Files are **flat**. Every diagram uses a `C1-`–`C4-` prefix per [c4model.com/diagrams](https://c4model.com/diagrams) (`C4-Dynamic-` / `C4-Deployment-` for supporting types).

## Layout

```text
docs/c4-model/
├── README.md
├── C1-SystemContext.puml
├── C2-Container.puml
├── C3-Component-RuntimeCore.puml
├── C3-Component-CompilerPipeline.puml
└── C4-Dynamic-BootstrapChangeDetection.puml
```

## Diagrams

| Path | Kind | Summary |
|------|------|---------|
| [C1-SystemContext.puml](C1-SystemContext.puml) | System Context | App developers, Angular apps, browser/Node, npm registry |
| [C2-Container.puml](C2-Container.puml) | Container | `packages/*` runtime & compiler packages, adev, build tooling |
| [C3-Component-RuntimeCore.puml](C3-Component-RuntimeCore.puml) | Component | Core runtime: DI, change detection, rendering, signals |
| [C3-Component-CompilerPipeline.puml](C3-Component-CompilerPipeline.puml) | Component | Template/compiler pipeline (`compiler` + `compiler-cli`) |
| [C4-Dynamic-BootstrapChangeDetection.puml](C4-Dynamic-BootstrapChangeDetection.puml) | Dynamic | Bootstrap and change-detection cycle (high level) |

## Render

```bash
plantuml docs/c4-model/*.puml
```

## Source anchors (upstream)

- `packages/core` — runtime: DI, change detection, signals, application bootstrap
- `packages/compiler` / `packages/compiler-cli` — template compilation (`ngtsc`)
- `packages/common`, `packages/router`, `packages/forms` — first-party libraries
- `packages/platform-browser`, `packages/platform-server` — platform adapters
- `adev/` — angular.dev documentation application

Official overview: [angular.dev](https://angular.dev/)
