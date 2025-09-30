# EXPERIMENT-001: A/B Experimentation Protocol

## Objective
Design, run, and analyze A/B tests.

## Steps

1. Define experiment parameters in `/docs/product/experiments/design_{{experiment_id}}.yaml`:
   ```yaml
   experiment_id: {{experiment_id}}
   variants:
     - name: control
     - name: variant_a
   success_metric: conversion_rate
   sample_size: calculate_sample_size(...)
   ```

2. Deploy via `gh workflow run experiment-deploy.yml --inputs experiment_id={{experiment_id}}`.

3. Monitor results in `/integrations/analytics/experiment_{{experiment_id}}_results.json`.

4. Compute statistical significance using **A/B Reasoning**; record in `results_{{experiment_id}}.md`.

5. Decide rollout based on `p_value < 0.05` and update backlog accordingly.