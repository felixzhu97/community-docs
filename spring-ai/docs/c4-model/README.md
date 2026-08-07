# Spring AI C4 模型

本目录以 [C4 模型](https://c4model.com/) + [C4-PlantUML](https://github.com/plantuml-stdlib/C4-PlantUML) 描述 Spring AI 框架架构。

Spring AI 是面向 AI 应用的 **库/框架**（Maven 多模块），而非可运行单体应用。图中系统边界为「Spring AI Framework」，外部为消费方应用与各类 AI / 向量 / MCP 服务。

## 目录约定

- 按 C4 层级分目录：`context/`、`container/`、`component/`、`dynamic/`、`code/`
- **同一层级文件较多时用文件夹聚合**，根目录仅保留本索引
- 同目录内可用本地序号（`01-`、`02-`）排序；后续增图继续放在对应层级目录内

```
docs/c4-model/
├── README.md
├── context/
│   └── system-context.puml
├── container/
│   └── containers.puml
├── component/
│   ├── 01-core-apis.puml
│   ├── 02-chatclient.puml
│   ├── 03-rag-etl.puml
│   ├── 04-mcp.puml
│   └── 05-boot-layering.puml
├── dynamic/
│   └── chat-flow.puml
└── code/
    └── chatclient.puml
```

## 图清单

| 路径 | 层级 | 说明 |
|------|------|------|
| [context/system-context.puml](context/system-context.puml) | L1 Context | 开发者 / Spring 应用与 LLM、向量库、MCP、可观测性等外部系统 |
| [container/containers.puml](container/containers.puml) | L2 Container | 核心 API、适配器、Boot Auto-Config / Starters 等逻辑容器 |
| [component/01-core-apis.puml](component/01-core-apis.puml) | L3 Component | Commons / Model / ChatClient / VectorStore 核心抽象 |
| [component/02-chatclient.puml](component/02-chatclient.puml) | L3 Component | ChatClient 与 Advisor 链 |
| [component/03-rag-etl.puml](component/03-rag-etl.puml) | L3 Component | ETL 与 RAG 管线 |
| [component/04-mcp.puml](component/04-mcp.puml) | L3 Component | MCP ↔ ToolCallback 桥接 |
| [component/05-boot-layering.puml](component/05-boot-layering.puml) | L3 Component | Boot Starter → Auto-Config → Provider（OpenAI 示例） |
| [dynamic/chat-flow.puml](dynamic/chat-flow.puml) | Dynamic | ChatClient.call 时序 |
| [code/chatclient.puml](code/chatclient.puml) | L4 Code | ChatClient / Advisor 关键类关系 |

## 渲染方式

需要能访问 C4-PlantUML 的 `!include` URL（或本地镜像）。

```bash
# 使用 plantuml CLI（需已安装）
plantuml docs/c4-model/**/*.puml

# 或使用 Docker
docker run --rm -v "$PWD":/data plantuml/plantuml docs/c4-model/**/*.puml
```

也可在 IDE（IntelliJ PlantUML 插件、VS Code PlantUML 扩展）中打开单个 `.puml` 预览。

## 模块分层对照

| 层级 | Maven 模块（示例） | 可否依赖 Spring Boot |
|------|-------------------|----------------------|
| L0 Commons | `spring-ai-commons`, `spring-ai-retry`, `spring-ai-template-st` | 否 |
| L1 Model API | `spring-ai-model` | 否 |
| L2 Client / Store / MCP | `spring-ai-client-chat`, `spring-ai-vector-store`, `spring-ai-rag`, `mcp/*`, `advisors/*` | 否 |
| L3 Adapters | `models/*`, `vector-stores/*`, `memory-repositories/*`, `document-readers/*` | 否 |
| L4 Auto-Config | `auto-configurations/*` | 是（依赖多为 optional） |
| L5 Starters | `starters/*` | 是 |

设计说明见 [design/02-boot-modularity.adoc](../../design/02-boot-modularity.adoc)。

## 关键源码锚点

- `spring-ai-model/.../chat/model/ChatModel.java`
- `spring-ai-client-chat/.../chat/client/ChatClient.java`
- `spring-ai-client-chat/.../advisor/api/Advisor.java`
- `spring-ai-vector-store/.../vectorstore/VectorStore.java`
- `spring-ai-model/.../model/tool/ToolCallingManager.java`
- `spring-ai-rag/.../rag/advisor/RetrievalAugmentationAdvisor.java`
