# OpenClaw C4 模型架构

本目录包含描述 OpenClaw 系统架构的 C4 模型图表。

## 图表列表

| 文件                      | 层级   | 描述                                               |
| ------------------------- | ------ | -------------------------------------------------- |
| `C1-Context.puml`         | 上下文 | 系统边界、用户、角色和外部集成                     |
| `C2-Container.puml`       | 容器   | 主要容器（CLI、Gateway、Agent 运行时、插件系统等） |
| `C3-Core-Components.puml` | 组件   | 核心内部组件（GatewayServer、EmbeddedRunner 等）   |
| `C3-Plugin-System.puml`   | 组件   | 插件系统架构（注册表、加载器、SDK、插件类型）      |

## 查看图表

### 在线

使用 [PlantUML 在线编辑器](https://www.plantuml.com/plantuml/uml/)，将每个 `.puml` 文件的内容粘贴进去。

### VS Code

安装 "PlantUML" 扩展，打开任意 `.puml` 文件即可。

### 命令行

```bash
brew install plantuml
cd c4-models/zh
plantuml C1-Context.puml
plantuml C2-Container.puml
plantuml C3-Core-Components.puml
plantuml C3-Plugin-System.puml
```

## 架构概览

OpenClaw 是一个基于插件架构的 AI Agent 运行时系统，支持 135+ 个插件：

### src/ 目录结构

```
src/
├── gateway/       # GatewayServer, HTTP/WebSocket 服务器 (server.impl.ts)
├── agents/        # EmbeddedRunner, Agent 执行 (pi-embedded-runner/runtime.ts)
├── plugins/       # PluginRegistry, RuntimeLoader (registry.ts, runtime/index.ts)
├── channels/      # MessageDispatcher, TurnKernel (src/channels/)
├── cli/           # CLI 命令 (run-main.ts)
├── config/        # ConfigLoader, ConfigStore (src/config/)
├── sessions/      # SessionManager (src/sessions/)
├── secrets/       # CredentialsStore (src/secrets/)
├── daemon/        # 守护进程管理 (src/daemon/)
├── mcp/           # MCP 集成
├── talk/          # 语音功能
└── tts/           # 文字转语音
```

### 核心组件

| 组件             | 源码                                       | 描述                                 |
| ---------------- | ------------------------------------------ | ------------------------------------ |
| GatewayServer    | `src/gateway/server.impl.ts`               | 用于实时通信的 HTTP/WebSocket 服务器 |
| EmbeddedRunner   | `src/agents/pi-embedded-runner/runtime.ts` | 核心 Agent 执行引擎                  |
| PluginRegistry   | `src/plugins/registry.ts`                  | 插件元数据和状态管理                 |
| RuntimeLoader    | `src/plugins/runtime/index.ts`             | 动态模块加载和生命周期管理           |
| ConfigLoader     | `src/config/`                              | 配置管理和验证                       |
| SessionManager   | `src/sessions/`                            | 对话会话管理                         |
| CredentialsStore | `src/secrets/`                             | 安全凭据存储                         |

### 插件类型（135+ 个插件）

**渠道插件（89 个）**：Discord、Telegram、Slack、MS Teams、WhatsApp、Matrix、IRC、飞书、Line、Signal、Nostr、Twitch、Zalo 等

**提供商插件（40+ 个）**：OpenAI、Anthropic、Google、DeepSeek、Mistral、Groq、Ollama、Together、Voyage、xAI、Nvidia、Cerebras、Fireworks、Deepinfra、LiteLLM、LM Studio 等

**工具插件**：browser、canvas、codex、comfy、document-extract、tavily、exa、firecrawl、duckduckgo、brave、MCP 集成

**记忆插件**：memory-wiki、memory-lancedb、memory-core、active-memory

**语音插件**：elevenlabs、deepgram、azure-speech、speech-core、talk-voice

### 包结构

- `packages/plugin-sdk/`：用于开发插件的插件 SDK
- `packages/sdk/`：通用 SDK
- `packages/plugin-package-contract/`：插件清单和包契约

### 外部集成

- **AI 提供商**：OpenAI (GPT)、Anthropic (Claude)、Google (Gemini)、DeepSeek、Ollama、OpenRouter 等
- **消息平台**：Discord、Telegram、Slack、MS Teams、WhatsApp、Matrix、飞书等
- **MCP 服务器**：用于工具集成的 Model Context Protocol 服务器
- **ClawHub**：官方插件注册表和目录
- **文件系统**：本地存储位置 `~/.openclaw/`，用于存储配置、凭据、Agent、会话
