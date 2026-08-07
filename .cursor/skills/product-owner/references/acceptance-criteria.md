# Acceptance Criteria

Use **numbered scenarios** with **Scenario / GIVEN / WHEN / THEN** (and optional **AND**). Each scenario is independently testable.

Scope for this repo: **syncing architecture docs** and **updating C4 models** — not application feature UX.

## Format

```
1.
   **Scenario** [short outcome name]
   **GIVEN** [precondition / repo state]
   **WHEN** [maintainer or contributor action]
   **THEN** [observable result]
   **AND** [additional observable result]   ← optional
```

## Rules

- Each AC item includes **Scenario**, **GIVEN**, **WHEN**, **THEN** (and optional **AND**)
- One scenario = one behavior; name it in learning/maintainer language
- At least **3** scenarios per ticket (happy path + edge cases)
- **GIVEN** = state only; **WHEN** = single trigger; **THEN/AND** = observable outcomes only
- No low-level implementation noise (class names, internal APIs) unless verifying a cited upstream path
- Present tense

## Good examples (sync / C4)

```
1.
   **Scenario** Publish C4 docs via whitelist
   **GIVEN** a project has an updated docs/c4-model tree locally
   **WHEN** the maintainer runs the architecture staging script and opens a PR
   **THEN** only whitelist paths appear in the PR diff
   **AND** full application source trees are not included

2.
   **Scenario** Context diagram matches upstream boundaries
   **GIVEN** the Spring AI system context PlantUML is open for edit
   **WHEN** a contributor updates actors and external systems from upstream docs
   **THEN** the C1 diagram reflects those boundaries
   **AND** the commit References cite the upstream documentation page

3.
   **Scenario** Catalog lists the new project
   **GIVEN** a new Spring project's C4 folder is ready to publish
   **WHEN** the maintainer adds the project to the README Projects table
   **THEN** learners can find the docs path from the README
```

## Bad examples (avoid)

```
1.
   **Scenario** Run git add
   **WHEN** files are added
   **THEN** git works

2.
   **Scenario** Diagram updated
   **GIVEN** someone wants better docs
   **WHEN** they edit something
   **THEN** it is better
```
