# QG-ADR-VALIDATION: Quality Gate for ADR Creation

## Objective
Validate new or updated ADRs against anti-patterns, evidence standards, and stakeholder requirements.

## Steps

1. **Anti-Pattern Detection:** Run automated checks in ADR Validation Workspace for The Fairy Tale, The Sales Pitch, The Dummy Alternative, Free Lunch Coupon

2. **Alternative Viability Assessment:** Confirm ≥2–3 viable alternatives with quantitative trade-off matrices.

3. **Evidence Standards Verification:** Ensure all claims have supporting data, benchmarks, or referenced standards.

4. **Consequence Realism Review:** Validate timelines, resource estimates, and risk assessments for both positive and negative impacts.

5. **Stakeholder Approval Verification:** Check that all stakeholders listed have documented sign-off entries.

6. **Fitness Function Integration:** Confirm that measurable fitness functions have been defined and linked.

7. **Gate Decision:** If all checks pass, change ADR status to "Proposed" and proceed to GitHub issue creation. If any check fails, compile remediation tasks and re-enter ADR Creation Protocol.