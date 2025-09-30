# Research Cache Management Protocol

## Objective
To optimize performance by managing a local cache of research materials and external documentation.

## Trigger
An agent requires external information to complete a task.

## Agents
@Context-Manager, Research-Consuming Agents.

## Workflow

1. **Query Cache**: An agent requests information by sending a message to the `@Context-Manager`.

2. **Cache Validation**: The `@Context-Manager` checks its local cache for a file matching the query that is less than 7 days old.

3. **Cache Hit**: If a fresh file is found, its content is returned.

4. **Cache Miss**: If the file is missing or stale, a new research task is initiated. The new result is first written to the cache with the current date, then returned to the requester.