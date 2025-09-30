# P-FEATURE-DEV: New Feature Development Lifecycle Protocol

## Objective
To manage the complete, end-to-end lifecycle of a new feature, from a high-level idea to a fully deployed product increment.

## Phases & Key Steps

### Phase 1: Planning & Design (Gated Sequence)
A business goal is translated into an actionable technical plan. Agents collaborate to produce a prd.md, plan.md, tech_spec.md, and design_spec.md. The process is paused for human review and approval via a NotifyHuman gate.

### Phase 2: Implementation (Massively Parallel)
The @Orchestrator executes DecomposeTask to create dozens of discrete coding tasks and assigns them concurrently to a swarm of implementation agents, aiming to saturate all available execution slots. Each agent executes the **P-TDD** protocol.

### Phase 3: Integration & Deployment (Gated Sequence)
As each task completes P-TDD, its output is submitted to the **P-QGATE** protocol. Once all tasks have passed, branches are merged, and the @QA-Tester runs end-to-end tests. The @DevOps-Engineer then deploys the feature to staging, followed by another NotifyHuman gate for final production sign-off.