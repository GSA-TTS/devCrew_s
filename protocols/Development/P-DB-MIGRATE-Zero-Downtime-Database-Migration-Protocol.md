# P-DB-MIGRATE: Zero-Downtime Database Migration Protocol

## Objective
To perform database schema and data migrations without service interruption, using a parallel change pattern.

## Trigger
A task that requires a non-trivial change to the database schema.

## Phases & Key Steps

1. **Planning & Preparation**: The @System-Architect and @Database-Administrator design the target schema and create migration scripts.

2. **Schema Expansion**: The script is executed to add new schema elements alongside the old ones without altering existing data, ensuring backward compatibility.

3. **Dual Writing Deployment**: A new application version is deployed that writes to **both** the old and new schema elements simultaneously to ensure data consistency.

4. **Data Backfill**: A background task incrementally migrates all existing data from the old schema to the new schema.

5. **Switch Read Path Deployment**: Another application version is deployed that reads exclusively from the new schema.

6. **Validation & Cleanup**: After a monitoring period, a final version is deployed that removes the dual-write logic, and a final script drops the old schema elements.