# TOGAF Architecture (PlantUML)

This folder contains a lightweight TOGAF-aligned architecture pack for the NocoBase repository.

All diagrams are written in PlantUML (`.puml`) and can be rendered independently.

## Diagram set

- `diagrams/00-overview-context.puml`
  - System context and high-level building blocks
- `diagrams/01-motivation.puml`
  - Motivation view: drivers, goals, principles, requirements, constraints
- `diagrams/02-business-capabilities.puml`
  - Business architecture: capability map and value stream
- `diagrams/03-application-components.puml`
  - Application architecture: core runtime components and plugin boundary
- `diagrams/04-data-architecture.puml`
  - Data architecture: core domains and key entity relationships
- `diagrams/05-technology-deployment.puml`
  - Technology architecture: deployment nodes and infrastructure dependencies
- `diagrams/06-implementation-migration.puml`
  - Implementation & migration: work packages, milestones, roadmap (Gantt)
- `diagrams/07-security-trust-boundaries.puml`
  - Security view: trust zones and key controls

## Render diagrams (Docker)

Render PNG:

```bash
cd docs/architecture/togaf/diagrams
mkdir -p ../out
docker run --rm -v "$PWD/..":/work -w /work/diagrams plantuml/plantuml -tpng "*.puml" -o ../out
```

Render SVG:

```bash
cd docs/architecture/togaf/diagrams
mkdir -p ../out
docker run --rm -v "$PWD/..":/work -w /work/diagrams plantuml/plantuml -tsvg "*.puml" -o ../out
```

## Render diagrams (PlantUML jar)

If you have `plantuml.jar` locally:

```bash
cd docs/architecture/togaf/diagrams
mkdir -p ../out
java -jar /path/to/plantuml.jar -tpng "*.puml" -o ../out
```
