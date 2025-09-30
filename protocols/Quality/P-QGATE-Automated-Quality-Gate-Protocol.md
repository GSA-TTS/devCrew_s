# P-QGATE: Automated Quality Gate Protocol

## Objective
To provide a mandatory, automated governance checkpoint that all code changes must pass before integration, institutionalizing the role of the Quality & Security Chapter.

## Trigger
The successful completion of a code implementation task.

## Steps (Parallel Execution)

1. **Delegate Reviews**: The @Orchestrator receives the completed code and assigns review tasks in parallel to relevant governance agents (@Code-Reviewer, @Security-Auditor, @Performance-Engineer).

2. **Perform Validation**: The governance agents execute their respective meta-actions concurrently: ReviewCode, AuditSecurity, AssessPerformance.

3. **Synthesize Results**: The @Orchestrator gathers the findings into a single, standardized validation_report.json file.

4. **Validation**: The protocol succeeds only if the status in the final report is "PASS," requiring a passing grade from all agents. If any gate fails, the report with actionable feedback is routed back to the originating agent for remediation.