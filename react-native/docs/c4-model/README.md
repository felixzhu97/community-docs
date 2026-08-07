# React Native C4 模型

本目录用 [C4 模型](https://c4model.com/) 与 [C4-PlantUML](https://github.com/plantuml-stdlib/C4-PlantUML) 描述 [facebook/react-native](https://github.com/facebook/react-native) monorepo。

React Native 把 React 的声明式 UI 带到 **iOS / Android** 等原生平台。系统边界是 `packages/react-native` 的 JS API、平台原生工程与 `ReactCommon` 共享运行时，以及配套 codegen / Metro 工具包。

文件**扁平**存放。每个图使用 `C1-`–`C4-` 前缀；图内文案为中文。结构依据当前仓库目录（`Libraries/`、`ReactAndroid/`、`ReactApple`/`React/`、`ReactCommon/` 等）。

## 布局

```text
docs/c4-model/
├── README.md
├── C1-SystemContext.puml
├── C2-Container.puml
├── C3-Component-ReactCommon.puml
├── C3-Component-JsLibraries.puml
└── C4-Dynamic-JsToNative.puml
```

## 图表

| Path | Kind | Summary |
|------|------|---------|
| [C1-SystemContext.puml](C1-SystemContext.puml) | 系统上下文 | 开发者、RN 应用、React、Metro、Hermes、iOS/Android |
| [C2-Container.puml](C2-Container.puml) | 容器 | JS 包、ReactAndroid、ReactApple、ReactCommon、codegen、CLI/Metro |
| [C3-Component-ReactCommon.puml](C3-Component-ReactCommon.puml) | 组件 | jsi、Fabric renderer、TurboModule、yoga、Hermes 集成 |
| [C3-Component-JsLibraries.puml](C3-Component-JsLibraries.puml) | 组件 | `Libraries/` 下 Core、Components、NativeModules 等 |
| [C4-Dynamic-JsToNative.puml](C4-Dynamic-JsToNative.puml) | 动态 | JS → JSI → 原生模块/宿主（高层） |

## 渲染

```bash
plantuml docs/c4-model/*.puml
```

## 上游锚点

- `packages/react-native` — 主包（`index.js`、`Libraries/`）
- `packages/react-native/ReactCommon` — `jsi/`、`cxxreact/`、`react/renderer`、`react/nativemodule`、`yoga/`、`hermes/`
- `packages/react-native/ReactAndroid` — Android 运行时
- `packages/react-native/React` / `ReactApple` — Apple 平台运行时与 Fabric
- `packages/react-native-codegen` — 新架构代码生成
- `packages/metro-config`、`packages/community-cli-plugin`、`packages/dev-middleware` — 开发与打包集成
- `packages/rn-tester` — 内部测试应用
- 文档：[reactnative.dev](https://reactnative.dev/)
