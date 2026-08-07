# Spring Framework C4 模型

本目录用 [C4 模型](https://c4model.com/) 与 [C4-PlantUML](https://github.com/plantuml-stdlib/C4-PlantUML) 描述 [Spring Framework](https://github.com/spring-projects/spring-framework) monorepo。

Spring Framework 提供 IoC、AOP、Web（MVC / WebFlux）、数据访问与测试等**基础模块**。系统边界为本仓库的 `spring-*` 产物；Spring Boot 与业务应用视为外部消费方。

文件**扁平**存放。每个图使用 `C1-`–`C4-` 前缀；图内文案为中文，专业术语保留英文。

## 布局

```text
docs/c4-model/
├── README.md
├── C1-SystemContext.puml
├── C2-Container.puml
├── C3-Component-IoC.puml
├── C3-Component-ServletMvc.puml
├── C3-Component-WebFlux.puml
└── C4-Dynamic-ApplicationContextRefresh.puml
```

## 图表

| Path | Kind | Summary |
|------|------|---------|
| [C1-SystemContext.puml](C1-SystemContext.puml) | 系统上下文 | 开发者、Framework、应用、Boot、Servlet / Reactive 运行时 |
| [C2-Container.puml](C2-Container.puml) | 容器 | core、AOP、web、MVC、WebFlux、data/tx、messaging、test |
| [C3-Component-IoC.puml](C3-Component-IoC.puml) | 组件 | ApplicationContext.refresh 与配置类处理 |
| [C3-Component-ServletMvc.puml](C3-Component-ServletMvc.puml) | 组件 | DispatcherServlet 请求路径 |
| [C3-Component-WebFlux.puml](C3-Component-WebFlux.puml) | 组件 | DispatcherHandler 与 WebFilter |
| [C4-Dynamic-ApplicationContextRefresh.puml](C4-Dynamic-ApplicationContextRefresh.puml) | 动态 | refresh() 生命周期 |

## 渲染

```bash
plantuml docs/c4-model/*.puml
```

## 上游锚点

- `spring-core` / `spring-beans` / `spring-context` / `spring-expression` — IoC 核心
- `spring-aop` / `spring-aspects` — AOP
- `spring-web` / `spring-webmvc` / `spring-webflux` — Web 栈
- `spring-tx` / `spring-jdbc` / `spring-orm` / `spring-r2dbc` — 数据访问
- `spring-test` — TestContext

官方参考：[Spring Framework Reference](https://docs.spring.io/spring-framework/reference/)
