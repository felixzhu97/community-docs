# OpenClaw C4 Model Architecture

This directory contains C4 model diagrams describing the OpenClaw system architecture.

## Diagrams

| File                      | Level     | Description                                                         |
| ------------------------- | --------- | ------------------------------------------------------------------- |
| `C1-Context.puml`         | Context   | System boundary, users, actors, and external integrations           |
| `C2-Container.puml`       | Container | Major containers (CLI, Gateway, Agent Runtime, Plugin System, etc.) |
| `C3-Core-Components.puml` | Component | Core internal components (GatewayServer, EmbeddedRunner, etc.)      |
| `C3-Plugin-System.puml`   | Component | Plugin system architecture (Registry, Loader, SDK, plugin types)    |

## View Diagrams

### Online

Use [PlantUML Online Editor](https://www.plantuml.com/plantuml/uml/) and paste the contents of each `.puml` file.

### VS Code

Install the "PlantUML" extension and open any `.puml` file.

### CLI

```bash
brew install plantuml
cd c4-models/en
plantuml C1-Context.puml
plantuml C2-Container.puml
plantuml C3-Core-Components.puml
plantuml C3-Plugin-System.puml
```

## Architecture Overview

OpenClaw is an AI agent runtime with a plugin-based architecture supporting 135+ plugins:

### src/ Directory Structure

```
src/
├── gateway/       # GatewayServer, HTTP/WebSocket server (server.impl.ts)
├── agents/        # EmbeddedRunner, agent execution (pi-embedded-runner/runtime.ts)
├── plugins/       # PluginRegistry, RuntimeLoader (registry.ts, runtime/index.ts)
├── channels/      # MessageDispatcher, TurnKernel (src/channels/)
├── cli/           # CLI commands (run-main.ts)
├── config/        # ConfigLoader, ConfigStore (src/config/)
├── sessions/      # SessionManager (src/sessions/)
├── secrets/       # CredentialsStore (src/secrets/)
├── daemon/        # Daemon management (src/daemon/)
├── mcp/           # MCP integration
├── talk/          # Voice/talk functionality
└── tts/           # Text-to-speech
```

### Core Components

| Component        | Source                                     | Description                                       |
| ---------------- | ------------------------------------------ | ------------------------------------------------- |
| GatewayServer    | `src/gateway/server.impl.ts`               | HTTP/WebSocket server for real-time communication |
| EmbeddedRunner   | `src/agents/pi-embedded-runner/runtime.ts` | Core agent execution engine                       |
| PluginRegistry   | `src/plugins/registry.ts`                  | Plugin metadata and state management              |
| RuntimeLoader    | `src/plugins/runtime/index.ts`             | Dynamic module loading and lifecycle              |
| ConfigLoader     | `src/config/`                              | Configuration management and validation           |
| SessionManager   | `src/sessions/`                            | Conversation session management                   |
| CredentialsStore | `src/secrets/`                             | Secure credential storage                         |

### Plugin Types (135+ plugins)

**Channel Plugins (89)**: Discord, Telegram, Slack, MS Teams, WhatsApp, Matrix, IRC, Feishu, Line, Signal, Nostr, Twitch, Zalo, etc.

**Provider Plugins (40+)**: OpenAI, Anthropic, Google, DeepSeek, Mistral, Groq, Ollama, Together, Voyage, xAI, Nvidia, Cerebras, Fireworks, Deepinfra, LiteLLM, LM Studio, etc.

**Tool Plugins**: browser, canvas, codex, comfy, document-extract, tavily, exa, firecrawl, duckduckgo, brave, MCP integration

**Memory Plugins**: memory-wiki, memory-lancedb, memory-core, active-memory

**Speech Plugins**: elevenlabs, deepgram, azure-speech, speech-core, talk-voice

### Packages

- `packages/plugin-sdk/`: Plugin SDK for developing plugins
- `packages/sdk/`: General SDK
- `packages/plugin-package-contract/`: Plugin manifest and package contracts

### External Integrations

- **AI Providers**: OpenAI (GPT), Anthropic (Claude), Google (Gemini), DeepSeek, Ollama, OpenRouter, etc.
- **Messaging Platforms**: Discord, Telegram, Slack, MS Teams, WhatsApp, Matrix, Feishu, etc.
- **MCP Servers**: Model Context Protocol servers for tool integration
- **ClawHub**: Official plugin registry and catalog
- **File System**: Local storage at `~/.openclaw/` for configs, credentials, agents, sessions
