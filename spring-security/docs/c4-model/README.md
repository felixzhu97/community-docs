# Spring Security C4 Model

C4 diagrams for [Spring Security](https://github.com/spring-projects/spring-security). Files are **flat** with `C1-`–`C4-` prefixes (`C4-Dynamic-` / `C4-Deployment-` for supporting types).

## Layout

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

## Diagrams

| Path | Kind | Summary |
|------|------|---------|
| [C1-SystemContext.puml](C1-SystemContext.puml) | System Context | Actors and trust boundaries |
| [C2-Container.puml](C2-Container.puml) | Container | Servlet / Reactive stacks and modules |
| [C3-Component-*.puml](C3-Component-Core.puml) | Component | Core, config, web, OAuth2, federation, supporting |
| [C4-Deployment-EmbeddedRuntime.puml](C4-Deployment-EmbeddedRuntime.puml) | Deployment | Embedded runtime topology |
| [C4-Dynamic-*.puml](C4-Dynamic-FormLogin.puml) | Dynamic | Form login / OAuth2 / servlet request flows |

```bash
plantuml docs/c4-model/*.puml
```
