# n8n C4 架构模型

本目录包含 PlantUML 格式的 C4 模型图表，描述 n8n 工作流自动化平台的架构。

## 概述

n8n 是一个用 TypeScript 编写的开源工作流自动化平台，采用 pnpm workspaces 管理的 monorepo 结构。由 Node.js 后端、Vue.js 前端和可扩展的节点式工作流引擎组成。

## 图表层级

### Level 1: Context (上下文图)
- **C1-Context.puml** - 系统上下文，展示 n8n 作为核心系统与外部参与者（用户、API 消费者、Webhook 来源）和外部系统（数据库、Redis、外部 API）的关系

### Level 2: Container (容器图)
- **C2-Container.puml** - 顶层容器：CLI 服务端、编辑器 UI、核心引擎、Worker 节点
- **C2-Frontend-Container.puml** - 前端架构：Vue 3 SPA、Pinia 状态管理、设计系统、i18n
- **C2-Nodes-Container.puml** - 节点生态系统：基础节点、LangChain、实例 AI、社区节点

### Level 3: Component (组件图)
- **C3-Component-Backend.puml** - 后端组件：控制器、服务、仓库、核心子系统
- **C3-Component-Frontend.puml** - 前端组件：视图、状态库、路由、组合式函数
- **C3-Node-Execution.puml** - 节点执行：生命周期、节点类型、数据流、执行控制

## 核心包结构

| 包名 | 描述 | 关键组件 |
|------|------|----------|
| `packages/cli` | Express 服务端 | Controllers, Services, Repositories, Push/WebSocket |
| `packages/core` | 工作流执行引擎 | WorkflowExecute, executeNode, RoutingNode |
| `packages/workflow` | 核心接口和类型 | Workflow, INode, IConnection, Expression |
| `packages/editor-ui` | Vue 3 前端 | Views, Pinia Stores, Composables |
| `@n8n/design-system` | Vue 组件库 | N8nButton, N8nInput, NodeIcon 等 |
| `packages/nodes-base` | 内置节点 | 307 个集成节点 |
| `@n8n/nodes-langchain` | AI/LangChain 节点 | Agents, Chains, Tools, Memory, Embeddings |
| `@n8n/instance-ai` | AI 助手后端 | 工具注册、工作流构建、记忆系统 |
| `@n8n/config` | 配置管理 | 30+ 配置文件 |
| `@n8n/db` | 数据库实体 | TypeORM 实体定义 |
| `@n8n/api-types` | 共享类型 | FE/BE 通信的 DTO 和 schema |
| `@n8n/i18n` | 国际化 | 20+ 语言翻译文件 |

## 架构模式

1. **Controller-Service-Repository** - 后端遵循 MVC 模式
   - Controller: 处理 HTTP 请求
   - Service: 业务逻辑
   - Repository: 数据访问

2. **Dependency Injection** - 使用 `@n8n/di` IoC 容器

3. **Event-Driven** - 内部 MessageEventBus 实现事件驱动

4. **Multi-Main HA** - Redis 领导者选举支持高可用部署

5. **Pinia State Management** - 前端使用 Pinia 状态管理

6. **Type-Safe API** - `@n8n/api-types` 提供共享类型定义

## 关键文件位置

### 后端
```
packages/cli/src/
├── controllers/          # HTTP 控制器
├── services/             # 业务服务
├── repositories/         # 数据仓库
└── subsystems/           # 核心子系统 (push, webhooks, scaling)

packages/core/src/
├── execution-engine/     # 执行引擎
│   ├── workflow-execute.ts
│   ├── routing-node.ts
│   └── wait-tracker.ts
└── node-execute-functions.ts

packages/@n8n/db/src/
└── entities/             # TypeORM 实体
```

### 前端
```
packages/editor-ui/src/
├── views/                # Vue 视图组件
├── stores/               # Pinia 状态库
├── composables/          # 组合式函数
├── api/                  # API 客户端
└── router/               # 路由配置
```

## 查看图表

### 在线预览
- [PlantUML Online Editor](https://www.plantuml.com/plantuml/uml/)
- [Kroki](https://kroki.io/plantuml)

### VS Code 插件
安装 "PlantUML" 插件 (jebbs) 可直接在 VS Code 预览

### 本地渲染
```bash
# 安装 Graphviz
brew install graphviz  # macOS
apt install graphviz   # Ubuntu

# 生成 PNG
plantuml C1-Context.puml
plantuml C2-Container.puml
```

## 技术栈

- **前端**: Vue 3, TypeScript, Vite, Pinia, vue-i18n
- **后端**: Node.js, TypeScript, Express, TypeORM
- **数据库**: PostgreSQL, SQLite (开发)
- **队列**: Redis + Bull
- **测试**: Jest (单元), Playwright (E2E)
- **代码质量**: ESLint, Prettier, lefthook
