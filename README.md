# Community Docs

Community Docs is a collection of C4 architecture diagrams for open-source projects. It publishes documentation only.

Diagrams use [C4 Model](https://c4model.com/) views in PlantUML under each project’s `docs/c4-model/`. Full upstream source trees are not published—local clones stay private behind a default-deny gitignore.

## Get started

### Browse online

Paste any `.puml` file into [PlantUML Online](https://www.plantuml.com/plantuml/uml/).

### Browse in an editor

Install a PlantUML extension in VS Code or Cursor, then open a file under `*/docs/c4-model/`.

### Render with the CLI

```bash
brew install plantuml
plantuml react/docs/c4-model/C1-SystemContext.puml
```

Start with `C1-SystemContext.puml` for a project, then open C2 and C3 in the same folder.

## Projects

| Project | Path |
|---------|------|
| [Angular](https://github.com/angular/angular) | [`angular/docs/c4-model/`](angular/docs/c4-model/) |
| [React](https://github.com/facebook/react) | [`react/docs/c4-model/`](react/docs/c4-model/) |
| [React Native](https://github.com/facebook/react-native) | [`react-native/docs/c4-model/`](react-native/docs/c4-model/) |
| [Spring Framework](https://github.com/spring-projects/spring-framework) | [`spring-framework/docs/c4-model/`](spring-framework/docs/c4-model/) |
| [Spring Boot](https://github.com/spring-projects/spring-boot) | [`spring-boot/docs/c4-model/`](spring-boot/docs/c4-model/) |
| [Spring AI](https://github.com/spring-projects/spring-ai) | [`spring-ai/docs/c4-model/`](spring-ai/docs/c4-model/) |
| [Spring Security](https://github.com/spring-projects/spring-security) | [`spring-security/docs/c4-model/`](spring-security/docs/c4-model/) |

Each folder is flat: `C1-`–`C4-` PlantUML sources plus a short README. Some projects also ship a glossary (for example [`spring-security/docs/glossary.md`](spring-security/docs/glossary.md)).

## Next steps

- Take a guided path through one stack: Angular, then React / React Native, then Spring Framework → Boot → AI → Security.
- Compare how each project separates APIs, adapters, and tooling.
- When upstream architecture changes, refresh the matching C4 views and open a docs-only pull request.

## Contributing

Contributions are welcome and encouraged. Publish architecture docs only (`*/docs/c4-model/` and related catalog files). Do not submit full source trees, secrets, or build artifacts.

Prefer clear conventional subjects such as `docs(spring-ai): refine ChatClient component diagram`. Tie claims in diagrams to real source paths when you can.

## License

Community catalog text is for learning and collaboration. Architecture models that include upstream material remain under the corresponding upstream licenses—review those `LICENSE` files before reuse.
