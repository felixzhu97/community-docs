# Spring Security C4 模型

本目录用 [C4 模型](https://c4model.com/) 与 [C4-PlantUML](https://github.com/plantuml-stdlib/C4-PlantUML) 描述 [Spring Security](https://github.com/spring-projects/spring-security)。

Spring Security 是嵌入宿主 Spring 应用的**安全框架**（Maven 多模块 JAR），而非独立可部署单体。系统边界为 Spring Security 自身；外部为宿主应用、运行时容器以及 OAuth2 / SAML / CAS / LDAP / Kerberos 等身份基础设施。

文件**扁平**存放。每个图使用 `C1-`–`C4-` 前缀（见 [c4model.com/diagrams](https://c4model.com/diagrams)）；支撑图使用 `C4-Dynamic-` / `C4-Deployment-`。图内文案为中文。

## 布局

```text
docs/c4-model/
├── README.md
├── C1-SystemContext.puml
├── C2-Container.puml
├── C3-Component-Core.puml
├── C3-Component-Config.puml
├── C3-Component-WebServlet.puml
├── C3-Component-WebReactive.puml
├── C3-Component-OAuth2.puml
├── C3-Component-Federation.puml
├── C3-Component-Supporting.puml
├── C4-Deployment-EmbeddedRuntime.puml
├── C4-Dynamic-FormLogin.puml
├── C4-Dynamic-OAuth2Login.puml
└── C4-Dynamic-ServletRequest.puml
```

## 图表

| 路径 | 类型 | 说明 |
|------|------|------|
| [C1-SystemContext.puml](C1-SystemContext.puml) | 系统上下文 | 终端用户、应用开发者与宿主应用、IdP、目录等信任边界 |
| [C2-Container.puml](C2-Container.puml) | 容器 | Servlet / Reactive 栈与发布模块（core、web、oauth2-* 等） |
| [C3-Component-Core.puml](C3-Component-Core.puml) | 组件 | 认证、授权、SecurityContext、方法安全 |
| [C3-Component-Config.puml](C3-Component-Config.puml) | 组件 | HttpSecurity / ServerHttpSecurity DSL 与 Filter 链装配 |
| [C3-Component-WebServlet.puml](C3-Component-WebServlet.puml) | 组件 | FilterChainProxy 与 Servlet Security Filters |
| [C3-Component-WebReactive.puml](C3-Component-WebReactive.puml) | 组件 | SecurityWebFilterChain 与 Reactive WebFilter |
| [C3-Component-OAuth2.puml](C3-Component-OAuth2.puml) | 组件 | OAuth2 / OIDC Client、Resource Server、Authorization Server |
| [C3-Component-Federation.puml](C3-Component-Federation.puml) | 组件 | SAML2、CAS、LDAP、Kerberos、WebAuthn |
| [C3-Component-Supporting.puml](C3-Component-Supporting.puml) | 组件 | ACL、Messaging、RSocket、Test、Crypto 等支撑模块 |
| [C4-Deployment-EmbeddedRuntime.puml](C4-Deployment-EmbeddedRuntime.puml) | 部署 | 嵌入宿主应用的运行时拓扑 |
| [C4-Dynamic-FormLogin.puml](C4-Dynamic-FormLogin.puml) | 动态 | 表单登录认证流程 |
| [C4-Dynamic-OAuth2Login.puml](C4-Dynamic-OAuth2Login.puml) | 动态 | OAuth2 / OIDC 授权码登录流程 |
| [C4-Dynamic-ServletRequest.puml](C4-Dynamic-ServletRequest.puml) | 动态 | Servlet 请求经 FilterChainProxy |

## 渲染

```bash
plantuml docs/c4-model/*.puml
```

## 上游锚点

- `spring-security-core` — AuthenticationManager、AuthorizationManager、SecurityContext
- `spring-security-web` — FilterChainProxy、Security Filters / WebFilters
- `spring-security-config` — HttpSecurity / ServerHttpSecurity DSL
- `spring-security-oauth2-*` — OAuth2 / OIDC Client、Resource Server、Authorization Server
- `spring-security-saml2-service-provider`、`spring-security-cas`、`spring-security-ldap`、`spring-security-kerberos-*`、`spring-security-webauthn` — 联邦与目录认证

官方概览：[spring.io/projects/spring-security](https://spring.io/projects/spring-security)
