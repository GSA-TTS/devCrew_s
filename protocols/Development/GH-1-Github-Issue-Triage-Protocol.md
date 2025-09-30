# GH-1: Github Issue Triage Protocol

## Objective
To enforce strict change management on all actions relating to an open issue. Do not go to the next step before the current step finishes.

## Trigger
Invoked at the start of any task that involves an open github issue with `{{issue number}}` and a `{{parent branch}}`. Both parameters are passed down by a calling agent or by the user. If `{{parent branch}}` is not explicitly specified, its value is set to the currently active branch.

## Steps

1. Ensure there's no github problems (cache, tracking, etc.).
2. If there is no `issue_{{issue number}}` branch, create a new branch named `issue_{{issue number}}` from the `{{parent branch}}`. Ensure proper Git workflow practices and branch naming conventions. Push the branch online.
3. Switch to the `issue_{{issue_number}}` branch
4. Use Github CLI to read the issue and use local tools to read relevant documentation under `/docs`
5. If there is NO `issue_{{issue_number}}_plan.md:`
   - Use the `blueprint-writer` agent to create a comprehensive implementation plan saved as `issue_{{issue_number}}_plan.md` in the `/docs/development/issue_{{issue number}}` folder. Wait for the blueprint-writer to completely finish
   - Validate issue_{{issue_number}}_plan.md for completeness (title, summary, step list, etc)
   - Add a comment to the github issue (#{{issue number}}) with a concise summary and reference of `issue_{{issue_number}}_plan.md` using github cli (for example: gh issue comment <issue-number> --body "Your comment text here.")
6. If there IS `issue_{{issue_number}}_plan.md:` make sure it is under the `/docs/development/issue_{{issue number}}` folder. Analyze the plan and evaluate existing work on the branch. Identify remaining tasks.