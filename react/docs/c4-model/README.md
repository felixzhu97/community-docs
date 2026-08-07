# React C4 模型

本目录用 [C4 模型](https://c4model.com/) 与 [C4-PlantUML](https://github.com/plantuml-stdlib/C4-PlantUML) 描述 [facebook/react](https://github.com/facebook/react) monorepo。

React 是**用于构建用户界面的 JavaScript 库**（多包 monorepo），不是单一可部署应用。系统边界是开发者通过 npm 消费的 React 运行时、渲染器与相关工具。

文件**扁平**存放。每个图使用 `C1-`–`C4-` 前缀；图内文案为中文。结构依据当前仓库 `packages/*` 与 `compiler/`。

## 布局

```text
docs/c4-model/
├── README.md
├── C1-SystemContext.puml
├── C2-Container.puml
├── C3-Component-Reconciler.puml
├── C3-Component-ReactDom.puml
└── C4-Dynamic-RenderCommit.puml
```

## 图表

| Path | Kind | Summary |
|------|------|---------|
| [C1-SystemContext.puml](C1-SystemContext.puml) | 系统上下文 | 开发者、应用、浏览器/Node、打包器、npm、RN |
| [C2-Container.puml](C2-Container.puml) | 容器 | `react`、reconciler、scheduler、react-dom、RSC、compiler 等 |
| [C3-Component-Reconciler.puml](C3-Component-Reconciler.puml) | 组件 | Fiber begin/complete/commit 与 host config |
| [C3-Component-ReactDom.puml](C3-Component-ReactDom.puml) | 组件 | client/server 入口、事件与 bindings |
| [C4-Dynamic-RenderCommit.puml](C4-Dynamic-RenderCommit.puml) | 动态 | 更新 → 调度 → render/commit → DOM |

## 渲染

```bash
plantuml docs/c4-model/*.puml
```

## 上游锚点

- `packages/react` — 公共 React API
- `packages/react-reconciler` — Fiber（`ReactFiberBeginWork.js`、`ReactFiberCommitWork.js` 等）
- `packages/scheduler` — 调度器
- `packages/react-dom` / `packages/react-dom-bindings` — DOM 渲染器与绑定
- `packages/react-native-renderer` — RN 宿主渲染器
- `packages/react-server`、`packages/react-client`、`packages/react-server-dom-*` — RSC / Flight
- `compiler/` — React Compiler
- 文档站点：[react.dev](https://react.dev/)
