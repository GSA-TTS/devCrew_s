# QG-ASR-VALIDATION: Quality Gate for ASR Extraction

## Objective
Ensure identified ASRs are complete, justified, and stakeholder-validated.

## Steps

1. **Requirement Completeness Check:** Verify each ASR adds measurable architectural value (performance, security, maintainability, etc.). Flag "nice-to-have" requirements for separate backlog.

2. **Traceback Linking:** For every ASR, verify there is a Git commit or design document referencing it. Run a script to search ADR titles for ASR keywords; flag any missing coverage.

3. **Justification Verification:** Ensure each ASR includes explicit rationale linked to impact categories (cost, risk, scope). Confirm causal chains from business needs to technical requirements.

4. **Stakeholder Validation:** Cross-reference the **Stakeholder Impact Matrix** to confirm all identified stakeholders have sign-off entries. If any stakeholder lacks approval, assign follow-up tasks via GitHub issue.

5. **Pattern Alignment:** Check each ASR against the pattern catalog for analogical corroboration or anti-pattern flags.

6. **Gate Decision:** If all checks pass, mark ASRs as "Validated" in `ISSUE_{{issue_number}}_ASRs.md`. If any check fails, document failures and loop back to ASR Extraction Protocol.