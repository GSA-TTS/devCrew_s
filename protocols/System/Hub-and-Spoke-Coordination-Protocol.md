# Hub-and-Spoke Coordination Protocol

## Objective
To enforce decoupled communication via the central message bus, forbidding direct agent-to-agent calls.

## Trigger
Any inter-agent communication that is part of a larger workflow.

## Agents
@Orchestrator, All Agents.

## Workflow

1. **No Direct Communication**: Direct, synchronous API calls between agents for workflow orchestration are strictly forbidden.

2. **Broker as Intermediary**: All communication must be asynchronous and mediated by the RabbitMQ message broker.

3. **Standardized Message Properties**: Every message must include a `correlation_id` and `content_type` to maintain state and track conversations.

4. **Handoff via Filesystem**: Substantive handoff documents (e.g., `prd.md`) are written to a shared filesystem, and the message payload contains a reference (path) to the document.