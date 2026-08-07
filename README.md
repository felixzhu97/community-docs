# Community Architecture Atlas

社区开源学习仓库：通过 `.gitignore` 白名单，**只托管各项目的 C4 / TOGAF 与架构文档**；完整源码留在本地，不推送到 GitHub。

## 会发布到 GitHub 的内容

| 项目 | 路径 |
|------|------|
| n8n | `n8n/c4-models/` |
| OpenClaw | `openclaw/c4-models/`、`openclaw/docs/.../architecture*.md` |
| Spring Security | `spring-security/docs/c4-model/` |
| domain-driven-hexagon | `domain-driven-hexagon/docs/architecture/togaf/` |
| NocoBase | `nocobase/docs/architecture/togaf/` |
| TensorFlow | `tensorflow/docs/togaf/` |
| Transformers | `transformers/docs/togaf_*.puml` |

其余目录（dify、odoo、chatwoot 等完整源码）仅本地保留。

## 本地子项目 Git

各子项目原有的 `.git` 已重命名为 `.git.local`，以便本仓库能跟踪其中的架构文件，同时避免把整仓源码当 submodule 提交。

在某个子项目里恢复正常 Git 操作：

```bash
./scripts/project-git.sh enable n8n      # .git.local -> .git
# ... git pull / commit ...
./scripts/project-git.sh disable n8n     # .git -> .git.local
```

向本仓库提交前，请确认相关子项目处于 `disable`（`.git.local`）状态。

## 查看图表

- 在线：[PlantUML Online](https://www.plantuml.com/plantuml/uml/)
- 编辑器：安装 PlantUML 扩展后打开 `.puml`
- 部分目录已含 PNG（如 `n8n/c4-models/images/`）

## 提交架构文档

不要使用 `git add -A`（子项目自己的 `.gitignore` 可能把无关目录重新包含进来）。请用：

```bash
./scripts/stage-architecture.sh
git commit -m "Update architecture docs"
git push
```

## 扩展白名单

1. 在 `.gitignore` 中按现有模式追加 `!path/` / `!path/**`
2. 在 `scripts/stage-architecture.sh` 中增加对应 `git add` 路径
