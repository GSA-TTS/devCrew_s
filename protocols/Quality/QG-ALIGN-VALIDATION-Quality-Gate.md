# QG-ALIGN-VALIDATION: Quality Gate for ASR-ADR Alignment

## Objective
Confirm ASRs are fully mapped to existing ADRs or flagged for new ADR creation.

## Steps

1. **Coverage Verification:** For each ASR, verify at least one linked ADR entry in the ASR analysis document.

2. **Semantic Consistency Check:** Use semantic search logs to ensure ADR descriptions accurately reflect ASR semantics.

3. **Gap Prioritization Confirmation:** Ensure missing ADRs have been prioritized via MCTS risk simulations with assigned priority scores.

4. **Impact Matrix Review:** Validate downstream impact analyses exist for ADR updates or new ADRs.

5. **Gate Decision:** If all ASRs are covered or properly flagged, mark alignment as "Validated." Otherwise, record deficiencies and re-run ASR-ADR Alignment Protocol.