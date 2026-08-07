# Spring AI C4 模型

本目录以 [C4 模型](https://c4model.com/) + [C4-PlantUML](https://github.com/plantuml-stdlib/C4-PlantUML) 描述 Spring AI 框架架构。

Spring AI 是面向 AI 应用的 **库/框架**（Maven 多模块），而非可运行单体应用。图中系统边界为「Spring AI 框架」，外部为消费方应用与各类 AI / 向量 / MCP 服务。

文件**扁平**存放；每个图使用 `C1-`–`C4-` 前缀（支撑图用 `C4-Dynamic-` / `C4-Deployment-` 等）。

## 布局

```text
docs/c4-model/
├── README.md
├── C1-SystemContext.puml
├── C2-Container.puml
├── C3-Component-CoreApis.puml
├── C3-Component-ChatClient.puml
├── C3-Component-RagEtl.puml
├── C3-Component-Mcp.puml
├── C3-Component-BootLayering.puml
├── C4-Code-ChatClient.puml
└── C4-Dynamic-ChatFlow.puml
```

## 图清单

| 路径 | 类型 | 说明 |
|------|------|------|
| [C1-SystemContext.puml](C1-SystemContext.puml) | 系统上下文 | 开发者 / Spring 应用与 LLM、向量库、MCP、可观测性等 |
| [C2-Container.puml](C2-Container.puml) | 容器 | 核心 API、适配器、Boot Auto-Configuration / Starters |
| [C3-Component-CoreApis.puml](C3-Component-CoreApis.puml) | 组件 | Commons / Model / ChatClient / VectorStore 核心抽象 |
| [C3-Component-ChatClient.puml](C3-Component-ChatClient.puml) | 组件 | ChatClient 与 Advisor 链 |
| [C3-Component-RagEtl.puml](C3-Component-RagEtl.puml) | 组件 | ETL 与 RAG 管线 |
| [C3-Component-Mcp.puml](C3-Component-Mcp.puml) | 组件 | MCP ↔ ToolCallback 桥接 |
| [C3-Component-BootLayering.puml](C3-Component-BootLayering.puml) | 组件 | Boot Starter → Auto-Configuration → Provider |
| [C4-Code-ChatClient.puml](C4-Code-ChatClient.puml) | 代码 | ChatClient / Advisor 关键类关系 |
| [C4-Dynamic-ChatFlow.puml](C4-Dynamic-ChatFlow.puml) | 动态 | ChatClient.call 时序 |

## 渲染

```bash
plantuml docs/c4-model/*.puml
```
