# Community Architecture Atlas

[![License](https://img.shields.io/badge/license-Community%20Learning-blue.svg)](#许可证)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](#贡献指南)

面向开发者社区的**开源架构图谱合集**：汇集主流开源项目的 [C4 Model](https://c4model.com/) 与 [TOGAF](https://www.opengroup.org/togaf) 架构文档，帮助大家系统理解系统边界、容器拆分与核心组件。

> 本仓库只托管架构模型与说明文档，不包含完整业务源码。

## 目录

- [简介](#简介)
- [收录项目](#收录项目)
- [仓库结构](#仓库结构)
- [快速开始](#快速开始)
- [学习路径建议](#学习路径建议)
- [贡献指南](#贡献指南)
- [社区约定](#社区约定)
- [致谢](#致谢)
- [许可证](#许可证)

## 简介

在阅读大型开源项目时，架构往往散落在源码与零散文档中。本社区仓库把可复用的架构视图集中起来，方便：

- 新人快速建立系统心智模型（C1 → C2 → C3）
- 团队对照业界项目讨论架构取舍
- 贡献者补充、校正 PlantUML 模型与说明

图表以 **PlantUML** 为主，部分目录附带已渲染的 PNG，可直接预览。

## 收录项目

| 项目 | 模型类型 | 路径 | 说明 |
|------|----------|------|------|
| [n8n](https://github.com/n8n-io/n8n) | C4 | [`n8n/c4-models/`](n8n/c4-models/) | 工作流自动化平台 |
| [OpenClaw](https://github.com/openclaw/openclaw) | C4 + Docs | [`openclaw/c4-models/`](openclaw/c4-models/)、[`openclaw/docs/`](openclaw/docs/concepts/architecture.md) | AI Agent 运行时（中/英） |
| [Spring AI](https://github.com/spring-projects/spring-ai) | C4 | [`spring-ai/docs/c4-model/`](spring-ai/docs/c4-model/) | Spring AI 框架（ChatClient / RAG / MCP） |
| [Spring Security](https://github.com/spring-projects/spring-security) | C4 | [`spring-security/docs/c4-model/`](spring-security/docs/c4-model/) | 认证与授权体系 |
| [domain-driven-hexagon](https://github.com/Sairyss/domain-driven-hexagon) | TOGAF | [`domain-driven-hexagon/docs/architecture/togaf/`](domain-driven-hexagon/docs/architecture/togaf/) | DDD 六边形示例 |
| [NocoBase](https://github.com/nocobase/nocobase) | TOGAF | [`nocobase/docs/architecture/togaf/`](nocobase/docs/architecture/togaf/) | 无代码 / 低代码平台 |
| [TensorFlow](https://github.com/tensorflow/tensorflow) | TOGAF | [`tensorflow/docs/togaf/`](tensorflow/docs/togaf/) | 机器学习平台 |
| [Transformers](https://github.com/huggingface/transformers) | TOGAF | [`transformers/docs/`](transformers/docs/) | Hugging Face Transformers |

## 仓库结构

```text
community-architecture-atlas/
├── README.md
├── scripts/                          # 维护脚本（可选）
├── n8n/c4-models/                    # C1 / C2 / C3
├── openclaw/
│   ├── c4-models/{zh,en}/            # 中英文 C4
│   └── docs/.../architecture*.md
├── spring-ai/docs/c4-model/          # Context / Container / Component / Dynamic
├── spring-security/docs/c4-model/
├── domain-driven-hexagon/docs/architecture/togaf/
├── nocobase/docs/architecture/togaf/
├── tensorflow/docs/togaf/
└── transformers/docs/togaf_*.puml
```

## 快速开始

### 浏览已渲染图片

部分项目已提供 PNG，例如：

- [n8n C1 Context](n8n/c4-models/images/C1-Context.png)
- [OpenClaw 中文 C1](openclaw/c4-models/zh/images/C1-Context.png)
- [NocoBase 概览](nocobase/docs/architecture/togaf/out/00-overview-context.png)

### 预览 PlantUML 源文件

1. **在线**：将 `.puml` 内容粘贴到 [PlantUML Online](https://www.plantuml.com/plantuml/uml/)
2. **编辑器**：安装 PlantUML 扩展（VS Code / Cursor）后打开文件即可预览
3. **命令行**：

```bash
brew install plantuml   # macOS
plantuml n8n/c4-models/C1-Context.puml
```

## 学习路径建议

1. 从 [n8n C1 Context](n8n/c4-models/C1-Context.puml) 熟悉 C4 分层，再下钻 Container / Component
2. 对照 [OpenClaw 中文模型](openclaw/c4-models/zh/) 与 [架构说明](openclaw/docs/concepts/architecture.md)，理解插件化 Agent 运行时
3. 阅读 [Spring AI C4](spring-ai/docs/c4-model/)，理解 ChatClient、RAG / ETL 与 MCP 分层
4. 阅读 [Spring Security C4](spring-security/docs/c4-model/)，关注信任边界与部署 / 时序图
5. 用 [NocoBase](nocobase/docs/architecture/togaf/) / [TensorFlow](tensorflow/docs/togaf/) 的 TOGAF 四域图建立企业架构视角
6. 结合 [domain-driven-hexagon](domain-driven-hexagon/docs/architecture/togaf/) 看 DDD 与架构视图如何映射

## 贡献指南

欢迎通过 Issue / Pull Request 参与：补充模型、修正错误、完善说明、新增开源项目架构文档。

### 贡献前请确认

- [ ] 内容用于学习交流，并尊重上游项目的许可证与署名
- [ ] 图表层级清晰（C1 → C2 → C3，或 TOGAF 业务 / 应用 / 数据 / 技术）
- [ ] 提供简短 README 或目录说明（概述、图表列表、如何渲染）
- [ ] 优先提交 PlantUML 源文件；PNG 可选

### 新增项目的建议步骤

1. 在对应目录下新增 `c4-models/` 或 `docs/architecture/`（TOGAF）
2. 更新本 README「收录项目」表格
3. 若你是仓库维护者本地联调，请同步更新 `.gitignore` 白名单与 `scripts/stage-architecture.sh`

### 提交说明

请使用清晰的 commit message，例如：

```text
docs(n8n): refine C2 container boundaries
docs(openclaw): add plugin system component diagram
```

## 社区约定

- **友善与尊重**：讨论聚焦架构与技术，避免人身攻击
- **署名与出处**：引用上游设计或文档时注明来源链接
- **最小必要**：本仓库只收架构文档，不提交完整源码、密钥或构建产物
- **可验证**：重要结论尽量对应到图中的容器 / 组件或源码路径说明

如有争议，优先在 Issue 中公开讨论后再合并。

## 致谢

感谢各上游开源项目作者与贡献者。本仓库中的架构梳理用于社区学习，不代表上游官方文档；若与官方说明冲突，以官方仓库为准。

## 许可证

- 本仓库的编排、学习路径与社区文档：以社区学习与交流为目的开放使用
- 各项目架构模型中若包含上游版权内容，遵循对应上游项目的许可证
- 使用或二次分发前，请自行核对相关上游 LICENSE

---

如果这个仓库对你有帮助，欢迎 Star；有想法或补充，欢迎提 Issue / PR。
