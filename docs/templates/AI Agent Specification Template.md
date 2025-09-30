

# **AI Agent Specification Template**

This section presents the comprehensive template for specifying an autonomous agent. Each field is designed to be both human-readable for architects and machine-parseable for orchestration and governance systems.

## **Part I: Core Identity & Mandate**

This part of the specification defines the agent's fundamental purpose, its role within the larger organization of the AI system, and its core identity. It answers the foundational questions: "Who are you?" and "Why do you exist?" This section establishes the agent's strategic context, from which all its subsequent behaviors and capabilities are derived.

#### **Agent\_Handle**

* **Definition:** A unique, machine-addressable, and human-readable identifier used for invocation, logging, and routing within the communication system. The handle MUST be globally unique within the agent ecosystem.  
* **Purpose:** To provide a stable, canonical name for the agent, analogous to a service name in a microservices architecture or a hostname in a network. This handle serves as the primary key for the agent in any registry, orchestration engine, or monitoring dashboard, allowing for unambiguous addressing and tracking.  
* **Concise Example:** @System-Architect, @QA-Tester, @Security-Auditor, @Orchestrator.1

#### **Agent\_Role**

* **Definition:** A descriptive, functional title that clearly and concisely communicates the agent's primary expertise and specialization.  
* **Purpose:** To provide immediate clarity to both human operators and other AI agents about the agent's function. An orchestrator agent, for instance, would use this field to select the appropriate specialist for a given subtask, making it a critical piece of metadata for dynamic team formation.1  
* **Concise Example:** "Site Reliability Engineer," "Prompt Engineer," "Product Owner," "Database Administrator".1

#### **Organizational\_Unit**

* **Definition:** The agent's formal placement within the system's predefined organizational structure, such as a Pod, Swarm, Guild, or Chapter.  
* **Purpose:** To define the agent's team context, its primary collaboration patterns, and its lines of coordination. This field is not merely descriptive; it is a critical architectural constraint that dictates the agent's expected communication pathways and interaction models within a "team-of-teams" framework.1 An agent in a "Platform Guild," for example, is expected to provide stable, long-term services to other teams, while an agent in a "Quality & Security Chapter" is expected to act as a cross-cutting governance enforcer. This formal structure is essential for managing cognitive load and enabling scalable collaboration in a complex multi-agent system, mirroring successful human organizational patterns to solve the same challenges of communication overhead and domain specialization.3  
* **Concise Example:** "Quality & Security Chapter," "Platform & Operations Guild," "Core Leadership & Strategy Pod".1

#### **Mandate**

* **Definition:** A single, declarative sentence that defines the agent's high-level, strategic objective. This is its ultimate, non-negotiable reason for existence.  
* **Purpose:** To serve as the agent's "North Star." This statement is the highest-level instruction from which all other behaviors, plans, and decisions are derived. During complex reasoning or when faced with ambiguity, the agent should use its mandate as the final arbiter for selecting a course of action. It provides a stable goal in a dynamic environment.1  
* **Concise Example (for @Security-Auditor):** To proactively identify, assess, and mitigate security vulnerabilities across the entire software development lifecycle and production infrastructure.1

#### **Core\_Responsibilities**

* **Definition:** An itemized list of the primary, recurring duties and functions the agent is expected to perform in order to fulfill its Mandate.  
* **Purpose:** To decompose the abstract Mandate into a concrete, though not exhaustive, list of key functions. This list helps to scope the agent's work, provides clear areas of accountability, and serves as a basis for defining the agent's required tools and actions.  
* **Concise Example (for @Security-Auditor):**  
  * Perform static (SAST) and dynamic (DAST) analysis of application code to identify common vulnerabilities.1  
  * Execute the P-SEC-VULN protocol for the continuous management of discovered vulnerabilities.2  
  * Conduct structured threat modeling using the STRIDE methodology for new architectural decisions as part of the SEC- protocol.2  
  * Audit project dependencies and generate Software Bills of Materials (SBOMs) to identify known security issues in third-party libraries.1

#### **Persona\_and\_Tone**

* **Definition:** A set of guidelines that dictate the agent's communication style, personality, and interaction patterns, particularly in communications directed at human operators.  
* **Purpose:** To ensure consistency, appropriateness, and effectiveness in agent interactions. A well-defined persona builds trust and makes the agent's outputs more understandable and useful. This is a key component of the agent's "profile," which establishes its core behavioral characteristics.4  
* **Concise Example (for @Code-Reviewer):** Formal, precise, and constructive. All feedback must be objective, citing specific project standards or established software engineering principles. Avoid subjective or ambiguous language. The tone should be that of a helpful mentor focused on improving code quality, not a punitive critic.

## **Part II: Cognitive & Architectural Framework**

This part of the specification transitions from defining *what* the agent is to *how* it thinks and operates. It details the agent's internal architecture, its core reasoning processes, and the mechanisms it uses to learn and remember. This section provides a blueprint for the agent's "mind," drawing heavily on established agentic design patterns and architectural principles.

#### **Agent\_Architecture\_Type**

* **Definition:** The agent's fundamental operational model, classifying its primary mode of decision-making and its level of autonomy.  
* **Purpose:** To establish the agent's core cognitive capabilities and limitations. This classification informs how the agent should be managed, what kinds of tasks it is suited for, and the complexity of its planning and reasoning modules. It sets the architectural foundation upon which specific reasoning patterns are built.6  
* **Concise Example:**  
  * **Goal-Based Agent:** This agent possesses an internal model of its environment and a defined set of goals. It is capable of searching for and planning sequences of actions to achieve a desired future state, making it suitable for complex, multi-step tasks (e.g., @Orchestrator).6  
  * **Utility-Based Agent:** An advanced form of a goal-based agent that optimizes its actions to maximize a specific "utility" function. This enables it to make decisions involving trade-offs, such as balancing cost, speed, and quality (e.g., @FinOps-Auditor optimizing cloud spend).6

#### **Primary\_Reasoning\_Patterns**

* **Definition:** The specific, structured cognitive processes and algorithms the agent employs to solve problems, make decisions, and generate outputs.  
* **Purpose:** To make the agent's "thinking" process transparent, predictable, and auditable. Formally defining these patterns allows for better debugging, ensures the agent uses appropriate cognitive tools for each task, and provides a more granular level of control over its behavior. Separating the agent's architectural type (its potential) from its reasoning patterns (its methods) allows for a more precise and modular design. For example, a sophisticated Goal-Based Agent can be restricted to simpler reasoning patterns for safety or efficiency.  
* **Concise Example:**  
  * **P-COG-COT (Chain-of-Thought):** MUST BE USED for tasks requiring detailed, auditable, step-by-step reasoning, such as root cause analysis or architectural design, producing an explicit reasoning trace.2  
  * **ReAct (Reason+Act):** The default pattern for tasks requiring tight, iterative loops of tool use and environmental observation, common in implementation and testing agents.7  
  * **Reflection:** To be employed for tasks involving iterative refinement and self-correction based on feedback, such as generating code, writing documentation, or responding to a failed test.7

#### **Planning\_Module**

* **Definition:** The agent's methodology for task decomposition and the strategic sequencing of actions. This module constitutes the core of the agent's executive function, enabling it to break down complex goals into manageable steps.5  
* **Purpose:** To formally define how the agent transforms a high-level, often ambiguous, goal into a concrete, executable plan. This is a critical capability for orchestrator, project manager, and other strategic agents that must manage complex workflows.  
* **Concise Example:**  
  * **Methodology:** Hierarchical Task Network (HTN) Decomposition. The agent recursively breaks down abstract goals into a dependency graph of primitive, executable actions that are defined in the system's Action\_Index.11  
  * **Optimization Protocol:** P-PLAN-ASTAR (A-Star Optimal Task Planning). Following decomposition, the agent applies the A\* search algorithm to the task graph to identify the most efficient execution path, minimizing a cost function such as time or computational resources.2

#### **Memory\_Architecture**

* **Definition:** A formal description of the agent's memory systems, detailing how it accesses, stores, and processes information across different time horizons and scopes.  
* **Purpose:** To define the agent's ability to maintain context, learn from experience, and access shared knowledge. A well-defined memory architecture is critical for ensuring coherence in long-running tasks, preventing redundant work, and enabling the agent collective to improve over time.5  
* **Concise Example:**  
  * **Short-Term (Working Memory):** The context window of the foundation model, supplemented by a per-task, file-based scratchpad (task\_context.md) for immediate thoughts and intermediate results.  
  * **Long-Term (Knowledge Base):** Read-only access to the centralized, persistent Knowledge Graph via the QueryKnowledgeGraph tool. This provides the agent with access to the entire system's history of decisions and outcomes, governed by Protocol P-KNOW-KG-INTERACTION.2  
  * **Collaborative (Shared Memory):** Interaction with the shared project filesystem for handoffs and the central research cache managed by the @Context-Manager for external information, governed by Protocol CORE-CACHE-003.2

#### **Learning\_Mechanism**

* **Definition:** The specific protocol or pattern the agent uses for self-improvement and adaptation based on performance feedback and operational data.  
* **Purpose:** To build a capacity for continuous improvement into the agent's design, moving it beyond a static definition toward a dynamic, evolving system component.  
* **Concise Example:** The agent's operational data (e.g., success rates, errors, resource consumption) is systematically logged and analyzed by the @Prompt-Engineer-Agent as part of the P-LEARN (Continuous Learning) protocol. This agent does not self-modify but provides the necessary data and hypotheses for system-level optimization, which is then implemented through the formal Specification\_Lifecycle process.2

## **Part III: Capabilities, Tools, and Actions**

This part provides a concrete, machine-readable manifest of what the agent is permitted to *do*. It defines the agent's formal API to the rest of the system and serves as the primary mechanism for enforcing the principle of least privilege, a cornerstone of secure and reliable system design.

#### **Action\_Index**

* **Definition:** A comprehensive manifest of all authorized atomic actions the agent can perform, categorized by their nature (Direct, Coordination, Meta). Each action corresponds to a formally defined and version-controlled function within the system's action registry.  
* **Purpose:** To provide a definitive and enforceable list of the agent's intrinsic capabilities. This serves as the agent's "toolbelt" and is used by orchestration systems for task assignment and by security monitors for validating agent behavior. The categorization helps in understanding the agent's potential impact on the system: Direct actions modify system state, Coordination actions manage workflows, and Meta actions involve reasoning about the system itself.2  
* **Concise Example:** See Table 1 for an example authorization matrix for the @QA-Tester agent.

#### **Tool\_Manifest**

* **Definition:** A detailed list of external tools, services, and APIs that the agent is permitted to access. Access is typically mediated through a secure gateway like a Model Context Protocol (MCP) server.1  
* **Purpose:** To explicitly grant and scope access to external systems, ensuring the agent only interacts with approved services and endpoints. This prevents uncontrolled access to sensitive data or external systems and makes the agent's external dependencies explicit.  
* **Concise Example (for @Security-Auditor):**  
  * Tool ID: MCP-SEMGREP  
  * Description: Invokes the Semgrep static analysis security tool to scan code for vulnerabilities.  
  * Permissions: Execute\_Scan, Read\_Report  
  * Endpoint: \[semgrep\_mcp\_server\_url\]  
  * Version: 1.5.0

#### **Resource\_Permissions**

* **Definition:** An explicit access control list (ACL) that defines the agent's rights and restrictions on shared system resources, such as the filesystem, databases, or message queues.  
* **Purpose:** To enforce the principle of least privilege at the resource level, preventing unauthorized data access, modification, or deletion. This provides a granular layer of security and safety, ensuring that even if an agent's logic is flawed, its potential for damage is strictly contained.1  
* **Concise Example (for @Code-Reviewer):**  
  * Resource: Project Filesystem  
  * Path: /workspace/src/\*  
  * Permissions: Read-Only  
  * Rationale: Agent requires read access to source code for review purposes but is explicitly forbidden from modifying it.

**Table 1: Action & Tool Authorization Matrix (Example for @QA-Tester)**  
This table operationalizes the principle of least privilege and provides a machine-readable capability manifest. It transforms a simple list of permissions into a formal security and operational contract. This structure is not just documentation; it is a consumable artifact that can be used for automated validation of agent behavior and dynamic capability discovery by an orchestrator. An orchestration engine can query this table to confirm if an agent is suitable for a task, and a security monitor can use it to validate that an agent's action call is within its authorized scope in real-time. This formalizes the agent's "API" to the system, a cornerstone of building reliable, component-based software that applies directly to multi-agent systems.1

| Action/Tool ID | Category | Description | Key Parameters | Access Level | Rationale |
| :---- | :---- | :---- | :---- | :---- | :---- |
| DA-FS-ReadFile | Direct | Reads the complete content of a specified file. | file\_path | Read-Only | Required to read user stories, technical specifications, and acceptance criteria. |
| DA-FS-WriteFile | Direct | Creates a new file or overwrites an existing one. | file\_path, content | Write | Primary function is to write new test files and generate test reports. |
| DA-EX-RunTests | Direct | Executes the project's automated test suite (e.g., npm test). | test\_suite\_name | Execute | Core function for executing TDD cycles and full regression suites. |
| DA-TL-QueryDatabase | Direct (Tool) | Executes a SQL query against a connected database via MCP. | sql\_query | Execute | Needed for data validation and integration tests that verify database state. |
| CA-CS-WriteHandoffDocument | Coordination | Creates a structured document to pass context to other agents. | file\_path, content\_schema | Write | To communicate detailed test results and bug reports to implementation agents. |
| STRAT-PRIO-002 | Meta | Executes the Bug Triage and Prioritization protocol. | bug\_report.md | Execute | Responsible for assessing the technical severity of new bug reports. |

## **Part IV: Interaction & Communication Protocols**

This part of the specification defines the formal rules of engagement for how the agent communicates and collaborates with other agents and with human operators. A robust and explicit interaction framework is essential for preventing the chaotic and unpredictable behavior that can emerge in complex multi-agent systems. This section ensures all interactions are structured, predictable, and auditable.

#### **Communication\_Protocols**

* **Definition:** The formal, standardized rules, message formats, and transport mechanisms the agent must use for all inter-agent communication.  
* **Purpose:** To ensure interoperability, reliability, and observability in a heterogeneous multi-agent system. Adherence to a standard protocol prevents communication failures and allows for system-wide monitoring and tracing of agent conversations.14  
* **Concise Example:**  
  * **Primary (Asynchronous Workflow):** P-COM-EDA (Event-Driven Communication Protocol). All communication related to the execution of multi-step workflows MUST be asynchronous and mediated by the RabbitMQ message broker. All messages MUST conform to the standard message envelope and use the hierarchical topic naming convention.2  
  * **Secondary (Dynamic Discovery):** A2A (Agent-to-Agent Protocol). To be used for dynamic discovery and capability negotiation with agents outside the immediate system or for ad-hoc queries not part of a formal protocol.15

#### **Core\_Data\_Contracts**

* **Definition:** A list of formal, version-controlled schemas for the primary data artifacts that the agent consumes as input and produces as output.  
* **Purpose:** To create a strict, unambiguous "API contract" for the agent's data handoffs. This eliminates a common source of error in multi-agent systems where one agent produces data in a format another does not expect. These contracts enable automated validation of all inputs and outputs.2  
* **Concise Example:**  
  * **Input Contract:** task\_packet.json (MUST conform to the Core Handoff Schema, version 1.2).2  
  * **Output Contract:** validation\_report.json (MUST conform to the Validation Report Schema, version 1.0).2  
  * **Output Contract:** bug\_prioritization\_matrix.md (MUST conform to the output specification of protocol STRAT-PRIO-002).2

#### **Coordination\_Patterns**

* **Definition:** The primary orchestration patterns the agent is designed to participate in, defining its role in complex, multi-agent workflows.  
* **Purpose:** To explicitly define how the agent collaborates with its peers. This helps the orchestrator to correctly structure workflows and ensures the agent's internal logic is designed to handle the expected interaction model, whether it is a simple pipeline or a complex, dynamic conversation.  
* **Concise Example:**  
  * **Sequential Orchestration:** The agent acts as a distinct step in a linear pipeline. Its execution is triggered by the completion of an upstream agent's task, and its output triggers a downstream agent (e.g., @Code-Reviewer acts after @Backend-Engineer).16  
  * **Concurrent Orchestration:** The agent works in parallel with other specialist agents on the same problem, with their results being aggregated by a synthesizer (e.g., @Security-Auditor and @Performance-Engineer running checks simultaneously as part of the P-QGATE protocol).16  
  * **Group Chat Orchestration:** The agent participates in a collaborative, conversational workflow, such as a "debate" or a maker-checker loop, to solve a problem or refine an output. A chat manager coordinates the turn-taking.16

The combination of Communication Protocols, Core Data Contracts, and Coordination Patterns forms a three-layered "Interaction Stack," which is essential for engineering robust multi-agent systems. The protocols define the transport layer (how messages travel), the data contracts define the presentation layer (the format of the messages), and the coordination patterns define the application layer (the logic of the interaction). Specifying all three layers forces the designer to think through the interaction model completely, preventing the common failure mode of agents being unable to collaborate effectively due to mismatched assumptions about communication.

#### **Human-in-the-Loop\_(HITL)\_Triggers**

* **Definition:** An explicit, non-overridable list of conditions, events, or decision points that require the agent to halt autonomous execution and escalate to a human operator via the NotifyHuman action.  
* **Purpose:** To build safety, strategic alignment, and accountability into the system by design. These gates ensure that high-stakes, irreversible, or strategically critical decisions are validated by humans, providing a crucial oversight mechanism.1  
* **Concise Example (for @Orchestrator):**  
  * **Trigger:** Initiative Kickoff Gate. Before delegating any implementation tasks for a new feature, the complete set of planning documents (prd.md, plan.md, tech\_spec.md) MUST be submitted for approval to the Human Command Group.  
  * **Trigger:** Pre-Deployment Gate. A feature that has passed all automated tests and is in the staging environment MUST receive a manual sign-off from a human product manager before a production deployment is initiated.  
  * **Trigger:** Persistent Critical Failure. If the P-RECOVERY protocol fails more than three consecutive times on the same critical task, autonomous retries MUST cease, and an alert with a full diagnostic report MUST be sent to the on-call SRE team.

## **Part V: Governance, Ethics & Safety**

This part of the specification defines the comprehensive set of rules, constraints, and guardrails that govern the agent's behavior. It ensures that the agent's actions are not only functionally correct but also safe, ethical, aligned with project standards, and resilient to failure. This section transforms high-level principles into enforceable operational logic.

#### **Guiding\_Principles**

* **Definition:** A concise list of high-level, philosophical tenets that the agent should follow in its reasoning, decision-making, and output generation. These are not typically machine-enforceable but serve to guide the LLM's behavior and align its "judgment."  
* **Purpose:** To instill best practices and a desired "style" of work into the agent's core logic, influencing its approach to problem-solving.  
* **Concise Example (for @Backend-Engineer):**  
  * **KISS (Keep It Simple, Stupid):** Prioritize the simplest solution that meets the requirements.  
  * **YAGNI (You Aren't Gonna Need It):** Do not implement functionality that is not explicitly required.  
  * **DRY (Don't Repeat Yourself):** Avoid duplication of code and logic; favor abstraction and reuse.

#### **Enforceable\_Standards**

* **Definition:** A list of specific, measurable, and verifiable rules and specifications that the agent's output must conform to.  
* **Purpose:** To define objective quality criteria that can be checked by other governance agents or automated tooling within a CI/CD pipeline. These standards are non-negotiable quality gates.  
* **Concise Example:**  
  * "All Python code MUST be compliant with the PEP 8 style guide, as validated by a linter."  
  * "All public-facing API endpoints MUST be defined in and conform to the openapi.yaml specification."  
  * "All UI components MUST meet WCAG 2.1 AA accessibility standards."

#### **Required\_Protocols**

* **Definition:** A list of mandatory, multi-step operational procedures that the agent must initiate, participate in, or be subjected to during its execution cycle.  
* **Purpose:** To transform abstract principles and standards into concrete, auditable, and computationally enforceable behaviors. Protocols are the primary mechanism for enforcing process governance across the entire system.2  
* **Concise Example (for @Backend-Engineer):**  
  * **P-TDD (Test-Driven Development):** This protocol MUST be used for all new code implementation. The agent must first create a failing test before writing the implementation code.  
  * **P-QGATE (Automated Quality Gate):** All completed code MUST be submitted to this protocol for review by the Quality & Security Chapter before it can be merged.  
  * **SCM- (SBOM Lifecycle):** The agent's code commits will trigger this protocol in the CI/CD pipeline to generate a Software Bill of Materials.

**Table 2: Protocol Adherence Matrix (Example for @System-Architect)**  
This matrix provides a clear, auditable link between an agent and the formal governance processes it is subject to. It elevates protocols from a general system concept to a specific, contractual obligation for each agent. This self-documenting and machine-readable record can be used by an orchestrator to understand the process overhead associated with assigning a task to this agent, by a CI/CD pipeline to validate that the agent's logic includes handlers for these protocols, and by a compliance agent to get a system-wide view of governance enforcement.2

| Protocol ID | Protocol Name | Agent's Role/Responsibility |
| :---- | :---- | :---- |
| ADR- | ADR Lifecycle | **Owner.** Responsible for the successful execution of the protocol, including drafting, submitting, and managing Architecture Decision Records. |
| ARC- | C4 Architectural Visualization | **Executor.** Responsible for performing the primary actions of the protocol, generating C4 model diagrams from accepted ADRs. |
| SEC- | Threat Modeling (STRIDE) | **Executor.** Responsible for producing Data Flow Diagrams (DFDs) as a required input artifact for the protocol. |
| GOV- | Architecture Fitness Function | **Executor.** Responsible for authoring new fitness function tests based on architectural principles defined in accepted ADRs. |
| P-DOCS-UPDATE | Automated Documentation Update | **Executor.** Responsible for generating documentation updates derived from architectural changes and ADRs. |

#### **Ethical\_Guardrails**

* **Definition:** A set of strict, non-overridable constraints designed to prevent unethical, biased, or harmful outcomes. These are typically implemented as pre-processing checks, post-processing filters, or logic embedded within mandatory protocols.  
* **Purpose:** To ensure the agent operates responsibly and aligns with human values, particularly in sensitive domains involving user data, fairness, or safety. These guardrails are critical for building trustworthy AI systems.5  
* **Concise Example:**  
  * **Bias Mitigation:** The agent is forbidden from using demographic data (e.g., age, gender, ethnicity) in its decision-making process unless explicitly required for a formal P-ETHICS-BIAS-AUDIT protocol.  
  * **Data Privacy:** The agent MUST strictly adhere to the P-DATA-MINIMIZATION protocol. It is forbidden from requesting, processing, or storing any personal data beyond what is explicitly defined and justified in the approved pia\_report.md for its current task.2  
  * **Dark Pattern Prevention:** The agent MUST NOT generate UI/UX designs, copy, or user flows that employ deceptive or manipulative techniques as defined by the P-ETHICAL-DESIGN protocol.2

#### **Forbidden\_Patterns**

* **Definition:** A definitive, explicit list of actions, behaviors, or outputs that the agent is strictly prohibited from performing under any circumstances.  
* **Purpose:** To create hard boundaries and fail-safes that prevent catastrophic errors, security breaches, or violations of core architectural principles. These are the system's absolute "red lines."  
* **Concise Example:**  
  * The agent MUST NOT execute arbitrary shell commands (ExecuteShell) outside of a sandboxed, ephemeral CI/CD environment.  
  * The agent MUST NOT commit code directly to protected branches (e.g., main, release). All changes must go through a pull request and pass the P-QGATE protocol.  
  * The agent MUST NOT handle, log, or transmit raw user credentials, API keys, or Personally Identifiable Information (PII) in plaintext.  
  * The agent MUST NOT engage in direct, synchronous agent-to-agent API calls for workflow orchestration, per protocol CORE-COORD-002.2

#### **Resilience\_Patterns**

* **Definition:** The agent's expected behavior during system failures and its role in maintaining overall system resilience and stability.  
* **Purpose:** To design for failure as a first-class concern, ensuring that the agent can recover gracefully from transient errors, contribute to the system's stability, and avoid causing cascading failures.  
* **Concise Example:**  
  * **Transactional Rollback:** All state-changing operations on the shared filesystem MUST be wrapped in the P-RECOVERY protocol. This involves creating a temporary Git branch at the start of the operation (BeginTx), and either merging it upon success (CommitTx) or deleting it upon failure (RollbackTx) to ensure atomicity.2  
  * **Circuit Breaker Adherence:** The agent MUST respect the P-GOV-CIRCUIT-BREAKER protocol. If a tool call fails because a circuit is open, the agent MUST NOT retry the call. Instead, it must immediately report the failure and await further instructions, preventing it from overwhelming a struggling downstream service.2

## **Part VI: Operational & Lifecycle Management**

This final part of the specification addresses the non-functional, operational aspects of the agent. It treats the agent not as a static piece of code but as a dynamic, long-running service that needs to be monitored, managed, and maintained throughout its lifecycle.

#### **Observability\_Requirements**

* **Definition:** The specific logging, metrics, and tracing requirements that must be implemented for all of the agent's actions and decisions.  
* **Purpose:** To ensure the agent is not a "black box." Robust observability is essential for debugging, monitoring performance, understanding emergent behavior, and auditing actions in a production environment.9  
* **Concise Example:**  
  * **Logging:** All actions MUST be logged via the MA-MO-LogAction meta-action. Each log entry MUST include the correlation\_id to link it to a specific workflow, the task\_id, the action name, its parameters, and its outcome (success/failure).2  
  * **Metrics:** The agent's runtime environment MUST emit standardized metrics to a central monitoring system (e.g., Prometheus). Key metrics include: action success/failure rate, action execution latency (p50, p90, p99), and foundation model token consumption per task.  
  * **Tracing:** All inter-agent communication messages MUST propagate the correlation\_id in their standard envelope. This enables the reconstruction of a complete, distributed trace of a workflow across multiple agents and services.2

#### **Performance\_Benchmarks**

* **Definition:** A set of quantifiable Key Performance Indicators (KPIs) and Service Level Objectives (SLOs) that define the expected performance, quality, and reliability of the agent's work.  
* **Purpose:** To establish a formal, data-driven contract for the agent's performance. These benchmarks are used to trigger alerts when performance degrades, to guide optimization efforts, and to provide an objective measure of the agent's effectiveness.  
* **Concise Example (for @Code-Reviewer):**  
  * **SLO 1 (Latency):** 95% of code review requests must be completed within 60 seconds of invocation.  
  * **SLO 2 (Accuracy):** The agent must have a false positive rate of less than 5% for identified critical-severity issues.  
  * **SLO 3 (Availability):** The agent service must maintain 99.9% uptime, as measured by a health check endpoint.

#### **Resource\_Consumption\_Profile**

* **Definition:** The expected computational and financial cost profile of the agent, including guidelines for foundation model selection, resource allocation, and optimization strategies.  
* **Purpose:** To manage the operational costs associated with running the agent at scale. This makes the cost-performance trade-off an explicit part of the agent's design, enabling informed decisions about which models to use for which tasks.19  
* **Concise Example:**  
  * **Default Foundation Model:** Claude 3.5 Sonnet (for optimal balance of performance and cost).  
  * **High-Stakes Escalation Model:** For tasks involving high-complexity reasoning (e.g., executing the P-COG-TOT protocol), the agent is authorized to escalate to Claude 3 Opus. This escalation must be explicitly logged with a justification.  
  * **Cost Management Protocol:** The agent's operations are continuously monitored by the P-FINOPS-COST-MONITOR protocol. The agent should prioritize batching file reads and other I/O operations to minimize operational costs.

#### **Specification\_Lifecycle**

* **Definition:** The formal, version-controlled process for proposing, reviewing, approving, and deploying changes to this agent specification file.  
* **Purpose:** To fully realize the "Agent-as-Code" philosophy by treating the agent's definition as a critical piece of source code. This ensures that the agent's evolution is managed in a controlled, transparent, auditable, and non-disruptive manner.  
* **Concise Example:** This specification is managed as the file \[agent\_handle\].md within the governance.git repository. All changes MUST be proposed via a Pull Request. Changes require formal approval from the designated owner\_agent of the relevant protocol (if applicable) and a human from the Strategic Command Group. Merging a change to the main branch automatically triggers a CI/CD pipeline that validates the specification's syntax and deploys the update to the system-wide agent registry.2

**Table 3: Data Contract I/O Specification (Example for @Project-Manager)**  
This table provides an unambiguous, formal definition of the agent's data interfaces, acting as the data-centric equivalent of an API specification like OpenAPI/Swagger. Communication failures in multi-agent systems often stem from mismatched assumptions about the format and content of data passed between agents.1 This table makes the data contract explicit for each agent, listing the specific artifacts it is expected to read and write and linking them to a formal, version-controlled schema. This enables automated validation at runtime: before an orchestrator delegates a task, it can verify that the provided input files match the agent's declared  
Input\_Artifact schema. Similarly, upon task completion, the agent's output can be validated against its Output\_Artifact schema, preventing data-related errors from propagating through a workflow.2

| Direction | Artifact Name | Schema Reference / Version | Description |
| :---- | :---- | :---- | :---- |
| Input | prd.md | prd\_schema:1.2 | Consumes the Product Requirements Document artifact to generate a project plan. |
| Output | plan.md | plan\_schema:1.0 | Produces a detailed Work Breakdown Structure (WBS) and project schedule artifact. |
| Output | status\_report.md | status\_report\_schema:1.1 | Generates a weekly, structured progress report artifact for human stakeholders. |
| Output | prioritization\_report.json | rice\_score\_schema:1.0 | Produces a ranked list of features as a JSON artifact based on the RICE scoring protocol. |

**Part VI: Execution Flows**  
This is the most critical section describing the workflows the agent can carry out, and is the ultimate manifest of the above sections. Each workflow contains in great detail the phases, steps, gates, artifacts, and interactions with other agents. A protocol may appear more than one time across phases and steps. Workflows must be linked by one parent workflow.

#### **Works cited**

1. Dev-Crew : 1- Blue Print  
2. Dev-Crew : 2- Protocol Registry  
3. What is a Multi-Agent System? | IBM, accessed August 31, 2025, [https://www.ibm.com/think/topics/multiagent-system](https://www.ibm.com/think/topics/multiagent-system)  
4. Guidelines and best practices for automating with AI agent \- Webex Help Center, accessed August 31, 2025, [https://help.webex.com/en-us/article/nelkmxk/Guidelines-and-best-practices-for-automating-with-AI-agent](https://help.webex.com/en-us/article/nelkmxk/Guidelines-and-best-practices-for-automating-with-AI-agent)  
5. The Architecture of Autonomous AI Agents: Understanding Core Components and Integration \- Deepak Gupta, accessed August 31, 2025, [https://guptadeepak.com/the-rise-of-autonomous-ai-agents-a-comprehensive-guide-to-their-architecture-applications-and-impact/](https://guptadeepak.com/the-rise-of-autonomous-ai-agents-a-comprehensive-guide-to-their-architecture-applications-and-impact/)  
6. What Are AI Agents? | IBM, accessed August 31, 2025, [https://www.ibm.com/think/topics/ai-agents](https://www.ibm.com/think/topics/ai-agents)  
7. AI Agent Workflow Design Patterns — An Overview | by Craig Li, Ph.D | Binome \- Medium, accessed August 31, 2025, [https://medium.com/binome/ai-agent-workflow-design-patterns-an-overview-cf9e1f609696](https://medium.com/binome/ai-agent-workflow-design-patterns-an-overview-cf9e1f609696)  
8. Agentic Design Patterns. From reflection to collaboration… | by Bijit ..., accessed August 31, 2025, [https://medium.com/@bijit211987/agentic-design-patterns-cbd0aae2962f](https://medium.com/@bijit211987/agentic-design-patterns-cbd0aae2962f)  
9. Zero to One: Learning Agentic Patterns \- Philschmid, accessed August 31, 2025, [https://www.philschmid.de/agentic-pattern](https://www.philschmid.de/agentic-pattern)  
10. Understanding Autonomous Agent Architecture \- SmythOS, accessed August 31, 2025, [https://smythos.com/developers/agent-development/autonomous-agent-architecture/](https://smythos.com/developers/agent-development/autonomous-agent-architecture/)  
11. What are AI Agents?- Agents in Artificial Intelligence Explained \- AWS \- Updated 2025, accessed August 31, 2025, [https://aws.amazon.com/what-is/ai-agents/](https://aws.amazon.com/what-is/ai-agents/)  
12. What are AI agents? Definition, examples, and types | Google Cloud, accessed August 31, 2025, [https://cloud.google.com/discover/what-are-ai-agents](https://cloud.google.com/discover/what-are-ai-agents)  
13. A practical guide to building agents \- OpenAI, accessed August 31, 2025, [https://cdn.openai.com/business-guides-and-resources/a-practical-guide-to-building-agents.pdf](https://cdn.openai.com/business-guides-and-resources/a-practical-guide-to-building-agents.pdf)  
14. Communication in Multi-agent Environment in AI \- GeeksforGeeks, accessed August 31, 2025, [https://www.geeksforgeeks.org/artificial-intelligence/communication-in-multi-agent-environment-in-ai/](https://www.geeksforgeeks.org/artificial-intelligence/communication-in-multi-agent-environment-in-ai/)  
15. Agentic AI Communication Protocols: The Backbone of Autonomous Multi-Agent Systems, accessed August 31, 2025, [https://datasciencedojo.com/blog/agentic-ai-communication-protocols/](https://datasciencedojo.com/blog/agentic-ai-communication-protocols/)  
16. AI Agent Orchestration Patterns \- Azure Architecture Center ..., accessed August 31, 2025, [https://learn.microsoft.com/en-us/azure/architecture/ai-ml/guide/ai-agent-design-patterns](https://learn.microsoft.com/en-us/azure/architecture/ai-ml/guide/ai-agent-design-patterns)  
17. Understanding Agent Architecture: The Frameworks Powering AI Systems \- HatchWorks, accessed August 31, 2025, [https://hatchworks.com/blog/ai-agents/agent-architecture/](https://hatchworks.com/blog/ai-agents/agent-architecture/)  
18. AI Agent Best Practices and Ethical Considerations | Writesonic, accessed August 31, 2025, [https://writesonic.com/blog/ai-agents-best-practices](https://writesonic.com/blog/ai-agents-best-practices)  
19. AI Agent best practices from one year as AI Engineer : r/AI\_Agents \- Reddit, accessed August 31, 2025, [https://www.reddit.com/r/AI\_Agents/comments/1lpj771/ai\_agent\_best\_practices\_from\_one\_year\_as\_ai/](https://www.reddit.com/r/AI_Agents/comments/1lpj771/ai_agent_best_practices_from_one_year_as_ai/)