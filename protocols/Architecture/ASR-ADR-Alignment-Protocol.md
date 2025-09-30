# ASR-ADR Alignment Protocol

## Objective
Ensure traceability between ASRs and ADRs, prevent drift, and maintain governance oversight.

## Steps

1. **ADR Registry Analysis:** Review existing ADRs in `/docs/architecture/ADRs` directory using semantic search and structural analysis for comprehensive coverage assessment. Cache results in GoT Cache.

2. **Cross-Reference Mapping:** Cross-reference identified ASRs in `issue_{{issue_number}}_asr.md` with existing ADRs using semantic similarity and explicit requirement traceability. Link ASRs to ADRs using **Graph-of-Thoughts** if possible.

3. **Coverage Documentation:** Update `issue_{{issue_number}}_asr.md` to note ASRs covered by existing ADRs with explicit links, version references, and coverage gap analysis.

4. **Gap Prioritization:** Identify ASRs requiring new ADRs and prioritize them based on architectural risk, business impact, stakeholder priority, and implementation timeline constraints. Run Monte Carlo Tree Search simulations to estimate risk/impact of missing ADRs.

5. **Dependency Impact Graph Generation:** Visualize how ADR gaps cascade through existing ADR networks. Generate a directed graph in `docs/reports/{{issue}}_DependencyGraph.svg` showing ADR nodes and missing-ASR links to illustrate ripple effects.

6. **Impact Analysis:** Create comprehensive architectural impact analysis for changes to existing ADRs including downstream effects and stakeholder notification requirements. Use Contrastive Analysis to generate downstream impact matrices; save in `docs/reports/..._ImpactAnalysis.md`.

7. **Governance Trigger:** Initiate Architecture Review Board (ARB) process for high-impact decisions requiring formal governance approval.

8. **Quality Gate:** Execute **QG-ALIGN-VALIDATION** before completing.