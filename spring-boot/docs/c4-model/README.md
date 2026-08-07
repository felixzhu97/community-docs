# Spring Boot C4 模型

本目录用 [C4 模型](https://c4model.com/) 与 [C4-PlantUML](https://github.com/plantuml-stdlib/C4-PlantUML) 描述 [Spring Boot](https://github.com/spring-projects/spring-boot) monorepo。

Spring Boot 是构建在 Spring Framework 之上的**应用框架与工具链**（引导、Auto-Configuration、Starter、打包与 Actuator），不是业务单体应用。系统边界为 Boot 仓库产物；消费方应用与 Spring Framework 视为外部系统。

文件**扁平**存放。每个图使用 `C1-`–`C4-` 前缀；图内文案为中文，专业术语保留英文。

## 布局

```text
docs/c4-model/
├── README.md
├── C1-SystemContext.puml
├── C2-Container.puml
├── C3-Component-Bootstrap.puml
├── C3-Component-AutoConfiguration.puml
├── C3-Component-Actuator.puml
└── C4-Dynamic-SpringApplicationRun.puml
```

## 图表

| Path | Kind | Summary |
|------|------|---------|
| [C1-SystemContext.puml](C1-SystemContext.puml) | 系统上下文 | 开发者 / 运维、Boot、应用、Framework、运行时 |
| [C2-Container.puml](C2-Container.puml) | 容器 | core、autoconfigure、module、starter、loader、plugin、BOM、test |
| [C3-Component-Bootstrap.puml](C3-Component-Bootstrap.puml) | 组件 | SpringApplication 与运行监听、ConfigData |
| [C3-Component-AutoConfiguration.puml](C3-Component-AutoConfiguration.puml) | 组件 | ImportSelector、条件注解、`.imports` |
| [C3-Component-Actuator.puml](C3-Component-Actuator.puml) | 组件 | Endpoint 模型、Health、暴露层 |
| [C4-Dynamic-SpringApplicationRun.puml](C4-Dynamic-SpringApplicationRun.puml) | 动态 | SpringApplication.run 生命周期 |

## 渲染

```bash
plantuml docs/c4-model/*.puml
```

## 上游锚点

- `core/spring-boot` — `SpringApplication`、Environment、ConfigData
- `core/spring-boot-autoconfigure` — `@SpringBootApplication`、`AutoConfigurationImportSelector`
- `module/*` — 特性模块与 `AutoConfiguration.imports`
- `starter/*` — Starter POM
- `loader/`、`build-plugin/` — 可执行 JAR 与构建插件
- `module/spring-boot-actuator*`、`module/spring-boot-health` — Actuator / Health

官方参考：[Spring Boot Reference](https://docs.spring.io/spring-boot/reference/)
