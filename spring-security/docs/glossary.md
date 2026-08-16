# Spring Security 术语表

本术语表配合本仓库 [C4 模型](c4-model/README.md) 阅读。正文为中文；产品名、类名、协议名保留英文。

官方参考：[Spring Security Reference](https://docs.spring.io/spring-security/reference/)

## 角色与边界

| 术语 | 说明 | 参见 |
|------|------|------|
| 终端用户（End user） | 通过宿主应用访问受保护资源的用户。 | [C1-SystemContext.puml](c4-model/C1-SystemContext.puml) |
| 应用开发者（Application developer） | 集成并配置 Spring Security 的开发者。 | [C1-SystemContext.puml](c4-model/C1-SystemContext.puml) |
| 宿主 Spring 应用（Host application） | 嵌入 Spring Security 的业务应用（MVC / WebFlux），非 Spring Security 仓库本身。 | [C1-SystemContext.puml](c4-model/C1-SystemContext.puml) |
| Spring Security | 为 Spring 应用提供认证、授权与常见攻击防护的框架（Servlet 与 Reactive）。 | [C1-SystemContext.puml](c4-model/C1-SystemContext.puml) |
| IdP（Identity Provider） | 外部身份提供者，如 OAuth2 / OIDC、SAML、CAS 等。 | [C1-SystemContext.puml](c4-model/C1-SystemContext.puml) |
| 运行时容器（Runtime container） | Servlet 容器（Tomcat / Jetty）或 Netty（WebFlux）。 | [C1-SystemContext.puml](c4-model/C1-SystemContext.puml) |

## 核心认证与授权

| 术语 | 说明 | 参见 |
|------|------|------|
| `Authentication` | 表示已认证主体、凭证与 `GrantedAuthority` 的模型。 | [C3-Component-Core.puml](c4-model/C3-Component-Core.puml) |
| `AuthenticationManager` | 认证入口；常见实现为 `ProviderManager`。 | [C3-Component-Core.puml](c4-model/C3-Component-Core.puml) |
| `ProviderManager` | 将认证委托给多个 `AuthenticationProvider`。 | [C3-Component-Core.puml](c4-model/C3-Component-Core.puml) |
| `AuthenticationProvider` | 具体认证策略（Dao、JWT、LDAP 等）。 | [C3-Component-Core.puml](c4-model/C3-Component-Core.puml) |
| `UserDetailsService` | 按用户名加载 `UserDetails`。 | [C3-Component-Core.puml](c4-model/C3-Component-Core.puml) |
| `UserDetails` | 用户主体信息（用户名、密码、权限等）。 | [C3-Component-Core.puml](c4-model/C3-Component-Core.puml) |
| `GrantedAuthority` | 授予主体的权限或角色。 | [C3-Component-Core.puml](c4-model/C3-Component-Core.puml) |
| `AuthorizationManager` | 授权决策接口（替代遗留 `AccessDecisionManager`）。 | [C3-Component-Core.puml](c4-model/C3-Component-Core.puml) |
| `AccessDecisionManager` | 遗留投票式访问决策。 | [C3-Component-Core.puml](c4-model/C3-Component-Core.puml) |
| `SecurityContext` | 持有当前 `Authentication` 的上下文。 | [C3-Component-Core.puml](c4-model/C3-Component-Core.puml) |
| `SecurityContextHolder` | 线程绑定 `SecurityContext` / `Authentication` 的持有者。 | [C3-Component-Core.puml](c4-model/C3-Component-Core.puml) |
| `PasswordEncoder` | 密码编码与匹配；常委托 `spring-security-crypto` 实现。 | [C3-Component-Core.puml](c4-model/C3-Component-Core.puml) |
| Method Security | 方法级授权（`@PreAuthorize` 等），基于 AOP / Interceptor。 | [C3-Component-Core.puml](c4-model/C3-Component-Core.puml) |

## 配置（Config）

| 术语 | 说明 | 参见 |
|------|------|------|
| `@EnableWebSecurity` | 启用 Servlet Web 安全自动配置。 | [C3-Component-Config.puml](c4-model/C3-Component-Config.puml) |
| `@EnableWebFluxSecurity` | 启用 Reactive Web 安全。 | [C3-Component-Config.puml](c4-model/C3-Component-Config.puml) |
| `HttpSecurity` | Servlet 安全 DSL：`authorizeHttpRequests`、`formLogin`、`oauth2` 等。 | [C3-Component-Config.puml](c4-model/C3-Component-Config.puml) |
| `ServerHttpSecurity` | Reactive 安全 DSL。 | [C3-Component-Config.puml](c4-model/C3-Component-Config.puml) |
| `SecurityFilterChain` | `HttpSecurity.build()` 产出的 Servlet Filter 链 Bean。 | [C3-Component-Config.puml](c4-model/C3-Component-Config.puml) |
| `SecurityWebFilterChain` | `ServerHttpSecurity.build()` 产出的 Reactive 链 Bean。 | [C3-Component-Config.puml](c4-model/C3-Component-Config.puml) |
| `@EnableMethodSecurity` | 启用全局方法安全配置。 | [C3-Component-Config.puml](c4-model/C3-Component-Config.puml) |

## Web — Servlet

| 术语 | 说明 | 参见 |
|------|------|------|
| `DelegatingFilterProxy` | 将 Servlet 容器 Filter 桥接到 Spring Bean。 | [C3-Component-WebServlet.puml](c4-model/C3-Component-WebServlet.puml) |
| `FilterChainProxy` | Spring Security Servlet 入口；选择 `SecurityFilterChain` 并应用 `HttpFirewall`。 | [C3-Component-WebServlet.puml](c4-model/C3-Component-WebServlet.puml) |
| `SecurityFilterChain` | 按请求匹配并提供有序 Security Filters。 | [C3-Component-WebServlet.puml](c4-model/C3-Component-WebServlet.puml) |
| `HttpFirewall` | 拒绝畸形 HTTP 请求。 | [C3-Component-WebServlet.puml](c4-model/C3-Component-WebServlet.puml) |
| `ExceptionTranslationFilter` | 将认证 / 授权异常转为登录重定向或 403。 | [C3-Component-WebServlet.puml](c4-model/C3-Component-WebServlet.puml) |
| `AuthorizationFilter` | URL 级 `AuthorizationManager` 检查。 | [C3-Component-WebServlet.puml](c4-model/C3-Component-WebServlet.puml) |
| `SecurityContextHolderFilter` | 加载 / 持久化 `SecurityContext`。 | [C3-Component-WebServlet.puml](c4-model/C3-Component-WebServlet.puml) |
| `UsernamePasswordAuthenticationFilter` | 表单用户名密码认证 Filter 之一。 | [C4-Dynamic-FormLogin.puml](c4-model/C4-Dynamic-FormLogin.puml) |

## Web — Reactive

| 术语 | 说明 | 参见 |
|------|------|------|
| `WebFilter` | Reactive 栈中的安全过滤器（类比 Servlet Filter）。 | [C3-Component-WebReactive.puml](c4-model/C3-Component-WebReactive.puml) |
| `SecurityWebFilterChain` | 匹配请求并提供有序 `WebFilter` 列表。 | [C3-Component-WebReactive.puml](c4-model/C3-Component-WebReactive.puml) |
| `WebFilterChainProxy` | Reactive 安全链入口。 | [C3-Component-WebReactive.puml](c4-model/C3-Component-WebReactive.puml) |
| `AuthenticationWebFilter` | Reactive 认证 `WebFilter`。 | [C3-Component-WebReactive.puml](c4-model/C3-Component-WebReactive.puml) |
| `AuthorizationWebFilter` | Reactive URL 授权 `WebFilter`。 | [C3-Component-WebReactive.puml](c4-model/C3-Component-WebReactive.puml) |
| `ReactiveSecurityContextHolder` | Reactor Context 中的 `Authentication`。 | [C3-Component-WebReactive.puml](c4-model/C3-Component-WebReactive.puml) |

## OAuth2 / OIDC

| 术语 | 说明 | 参见 |
|------|------|------|
| OAuth2 Core | `spring-security-oauth2-core`：`AuthorizationGrant`、`ClientRegistration`、`OidcIdToken` 等模型。 | [C3-Component-OAuth2.puml](c4-model/C3-Component-OAuth2.puml) |
| OAuth2 JOSE | `spring-security-oauth2-jose`：`JwtDecoder`、`JwkSet`、JWT 校验。 | [C3-Component-OAuth2.puml](c4-model/C3-Component-OAuth2.puml) |
| OAuth2 Client | `spring-security-oauth2-client`：`oauth2Login`、授权码流、`OAuth2AuthorizedClientService`。 | [C3-Component-OAuth2.puml](c4-model/C3-Component-OAuth2.puml) |
| OAuth2 Resource Server | `spring-security-oauth2-resource-server`：Bearer Token 保护 API。 | [C3-Component-OAuth2.puml](c4-model/C3-Component-OAuth2.puml) |
| OAuth2 Authorization Server | `spring-security-oauth2-authorization-server`：授权端点、Token 端点、客户端管理。 | [C3-Component-OAuth2.puml](c4-model/C3-Component-OAuth2.puml) |
| `OAuth2LoginAuthenticationFilter` | 处理 OAuth2 / OIDC 授权码回调并建立会话。 | [C3-Component-OAuth2.puml](c4-model/C3-Component-OAuth2.puml) |
| `BearerTokenAuthenticationFilter` | 从请求提取并认证 Bearer Token。 | [C3-Component-OAuth2.puml](c4-model/C3-Component-OAuth2.puml) |
| `JwtDecoder` | 解码并校验 JWT（常与 JWKS 配合）。 | [C3-Component-OAuth2.puml](c4-model/C3-Component-OAuth2.puml) |
| JWKS | JSON Web Key Set；公钥集合，用于 JWT 签名验证。 | [C3-Component-OAuth2.puml](c4-model/C3-Component-OAuth2.puml) |
| 授权码流（Authorization Code） | OAuth2 登录常用流程：重定向 IdP → 回调带 code → 换 Token。 | [C4-Dynamic-OAuth2Login.puml](c4-model/C4-Dynamic-OAuth2Login.puml) |

## 联邦与目录认证

| 术语 | 说明 | 参见 |
|------|------|------|
| SAML 2.0 SP | `spring-security-saml2-service-provider`：依赖方，消费 IdP 断言。 | [C3-Component-Federation.puml](c4-model/C3-Component-Federation.puml) |
| `Saml2WebSsoAuthenticationFilter` | 处理 SAML ACS 回调。 | [C3-Component-Federation.puml](c4-model/C3-Component-Federation.puml) |
| CAS | `spring-security-cas`：中央认证服务客户端集成。 | [C3-Component-Federation.puml](c4-model/C3-Component-Federation.puml) |
| LDAP | `spring-security-ldap`：目录绑定 / 搜索用户。 | [C3-Component-Federation.puml](c4-model/C3-Component-Federation.puml) |
| Kerberos / SPNEGO | `spring-security-kerberos-*`：与 KDC 票据验证。 | [C3-Component-Federation.puml](c4-model/C3-Component-Federation.puml) |
| WebAuthn | `spring-security-webauthn`：通行密钥 / 安全密钥注册与断言。 | [C3-Component-Federation.puml](c4-model/C3-Component-Federation.puml) |

## 支撑模块

| 术语 | 说明 | 参见 |
|------|------|------|
| `spring-security-crypto` | BCrypt、Argon2、SCrypt、`Encryptors` 等密码学原语。 | [C3-Component-Supporting.puml](c4-model/C3-Component-Supporting.puml) |
| ACL | `spring-security-acl`：领域对象级访问控制（`ObjectIdentity`、`AclService`）。 | [C3-Component-Supporting.puml](c4-model/C3-Component-Supporting.puml) |
| Messaging Security | `spring-security-messaging`：WebSocket / STOMP 消息授权。 | [C3-Component-Supporting.puml](c4-model/C3-Component-Supporting.puml) |
| RSocket Security | `spring-security-rsocket`：RSocket Payload 认证与授权。 | [C3-Component-Supporting.puml](c4-model/C3-Component-Supporting.puml) |
| `spring-security-test` | `@WithMockUser`、`SecurityMockMvcRequestPostProcessors` 等测试支持。 | [C3-Component-Supporting.puml](c4-model/C3-Component-Supporting.puml) |

## 发布模块（JAR）

与 [C2-Container.puml](c4-model/C2-Container.puml) 对齐的主要模块：

| 模块 | 说明 |
|------|------|
| `spring-security-core` | 认证、授权、`SecurityContext`、用户模型。 |
| `spring-security-web` | Servlet Filter 链与 Reactive `WebFilter`。 |
| `spring-security-config` | Java / XML / Kotlin DSL 配置。 |
| `spring-security-crypto` | 密码哈希与加密。 |
| `spring-security-oauth2-core` | OAuth2 / OIDC 核心模型。 |
| `spring-security-oauth2-jose` | JWT / JWS / JWK。 |
| `spring-security-oauth2-client` | OAuth2 / OIDC 客户端。 |
| `spring-security-oauth2-resource-server` | Resource Server。 |
| `spring-security-oauth2-authorization-server` | Authorization Server。 |
| `spring-security-saml2-service-provider` | SAML2 依赖方。 |
| `spring-security-ldap` | LDAP 认证。 |
| `spring-security-cas` | CAS 客户端。 |
| `spring-security-kerberos-*` | Kerberos / SPNEGO。 |
| `spring-security-webauthn` | WebAuthn。 |
| `spring-security-acl` | ACL。 |
| `spring-security-messaging` | 消息安全。 |
| `spring-security-rsocket` | RSocket 安全。 |
| `spring-security-test` | 测试支持。 |

## 运行时与流程

| 术语 | 说明 | 参见 |
|------|------|------|
| 表单登录（Form login） | 用户名密码提交 → `AuthenticationManager` 认证 → 建立会话。 | [C4-Dynamic-FormLogin.puml](c4-model/C4-Dynamic-FormLogin.puml) |
| Servlet 请求路径 | HTTP → `FilterChainProxy` → Security Filters → `DispatcherServlet`。 | [C4-Dynamic-ServletRequest.puml](c4-model/C4-Dynamic-ServletRequest.puml) |
| Remember-Me | 持久化登录令牌，减少重复认证（常配合 JDBC 存储）。 | [C1-SystemContext.puml](c4-model/C1-SystemContext.puml) |
| 嵌入运行时（Embedded runtime） | Spring Security 作为 JAR 嵌入宿主应用与容器。 | [C4-Deployment-EmbeddedRuntime.puml](c4-model/C4-Deployment-EmbeddedRuntime.puml) |
