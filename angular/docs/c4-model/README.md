# Angular C4 模型

本目录用 [C4 模型](https://c4model.com/) 与 [C4-PlantUML](https://github.com/plantuml-stdlib/C4-PlantUML) 描述 [Angular](https://github.com/angular/angular) monorepo。

Angular 是** Web 应用平台**（TypeScript 包 + 工具链），不是单一可部署应用。系统边界是应用开发者通过 npm 包与 Angular 工具消费的 Angular 平台。

文件**扁平**存放。每个图使用 `C1-`–`C4-` 前缀（见 [c4model.com/diagrams](https://c4model.com/diagrams)）；图内文案为中文。

## 布局

```text
docs/c4-model/
├── README.md
├── C1-SystemContext.puml
├── C2-Container.puml
├── C3-Component-RuntimeCore.puml
├── C3-Component-CompilerPipeline.puml
└── C4-Dynamic-BootstrapChangeDetection.puml
```

## 图表

| Path | Kind | Summary |
|------|------|---------|
| [C1-SystemContext.puml](C1-SystemContext.puml) | 系统上下文 | 应用开发者、Angular 应用、浏览器/Node、npm |
| [C2-Container.puml](C2-Container.puml) | 容器 | `packages/*` 运行时与编译器包、adev、构建工具 |
| [C3-Component-RuntimeCore.puml](C3-Component-RuntimeCore.puml) | 组件 | 核心运行时：DI、change detection、渲染、signals |
| [C3-Component-CompilerPipeline.puml](C3-Component-CompilerPipeline.puml) | 组件 | 模板/编译流水线（`compiler` + `compiler-cli`） |
| [C4-Dynamic-BootstrapChangeDetection.puml](C4-Dynamic-BootstrapChangeDetection.puml) | 动态 | 启动与 change detection 周期（高层） |

## 渲染

```bash
plantuml docs/c4-model/*.puml
```

## 上游锚点

- `packages/core` — 运行时：DI、change detection、signals、应用启动
- `packages/compiler` / `packages/compiler-cli` — 模板编译（`ngtsc`）
- `packages/common`, `packages/router`, `packages/forms` — 一等库
- `packages/platform-browser`, `packages/platform-server` — 平台适配
- `adev/` — angular.dev 文档应用

官方概览：[angular.dev](https://angular.dev/)
