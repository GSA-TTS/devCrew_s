# USER-STORY-MAP-001: User Story Mapping Protocol

## Objective
Organize user stories into narrative flows.

## Steps

1. Load user stories from `/{docs/product/backlog}/backlog_{{sprint_id}}.yaml`.

2. Group stories by `{{epic_id}}` and order by user journey phases (Discovery, Engagement, Retention).

3. Generate `story_map_{{epic_id}}.yaml` with sections:
   ```yaml
   epic_id: {{epic_id}}
   phases:
     - name: Discovery
       stories:
         - id: {{story_id}}
           description: ...
           acceptance_criteria: ...
     ...
   ```

4. Simulate key scenarios using **Scenario Simulation** and embed results under `sim_results:`.

5. Commit story map and notify `@UX-Researcher` for validation.