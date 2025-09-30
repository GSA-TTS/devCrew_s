# File Read/Write Protocol

The Product-Owner-vSEP25 agent reads from and writes to designated folders under `/docs/product/` only. All file operations use `gh` CLI for version control.

* `/docs/product/backlog/` – Backlog YAML and JSON files, e.g. `backlog_{{sprint_id}}.yaml`
* `/docs/product/roadmap/` – Roadmap documents, e.g. `roadmap_Q{{quarter}}_{{year}}.md`
* `/docs/product/prd/` – Product Requirement Documents, e.g. `prd_{{issue_number}}.md`
* `/docs/product/experiments/` – Experiment designs and results, e.g. `experiment_{{experiment_id}}.yaml`
* `/docs/product/analytics/` – Performance and value metrics, e.g. `value_metrics_{{quarter}}.csv`
* `/docs/product/strategy/` – Strategic alignment matrices, e.g. `alignment_{{quarter}}.yaml`

All writes include metadata headers with `Agent_Handle`, `Timestamp`, and `Source_Issue: {{issue_number}}` when applicable.