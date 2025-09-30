# STRAT-PRIO-001: RICE Scoring Protocol

## Objective
Prioritize new features using Reach, Impact, Confidence, Effort.

## Steps

1. Retrieve candidate features from `/docs/product/backlog/backlog_{{sprint_id}}.yaml`.

2. For each feature `{{feature_id}}`, compute:
   * `Reach = estimate_users_per_period`
   * `Impact = business_value_score`
   * `Confidence = data_confidence_percentage`
   * `Effort = story_point_estimate`

3. Calculate `RICE_Score = (Reach × Impact × Confidence) / Effort`.

4. Generate `rice_scoring_matrix_{{quarter}}.md` with feature rows sorted by descending RICE_Score.

5. Commit matrix and create PR with `gh pr create --title "Priority Matrix Q{{quarter}}" --body "RICE scores computed."`