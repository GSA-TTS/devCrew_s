# STRAT-PRIO-002: Bug Triage & Prioritization Protocol

## Objective
Triage and prioritize incoming bug reports.

## Steps

1. Fetch open bug issues via `gh issue list --label bug --state open`.

2. For each bug `{{bug_id}}`, assess:
   * Severity (Critical/High/Medium/Low)
   * Frequency (users_affected_estimate)
   * Business Impact (revenue_risk_score)

3. Compute `Priority = (Severity_weight + Frequency_weight + Impact_weight) / 3`.

4. Update `backlog_{{sprint_id}}.yaml` with `bug_{{bug_id}}: Priority: {{Priority}}`.

5. Post comment on each issue.