# P-BUG-FIX: Bug Triage and Resolution Protocol

## Objective
To provide a rapid, reactive workflow for diagnosing, remediating, and deploying a fix for a software defect with minimal human intervention.

## Phases & Key Steps

### Phase 1: Diagnosis & Root Cause Analysis
Triggered by an alert or bug report, the @Orchestrator invokes a @Debugger specialist. The @Debugger initiates a parallel investigation, searching logs, tracing code execution paths, and querying the database to pinpoint the root cause and produce a bug_report.md.

### Phase 2: Remediation & Validation (TDD-based)
The @Debugger proposes a minimal code change and also defines a specific new test case that will fail with the buggy code but pass with the fix. The implementation agent first implements the failing test to reproduce the bug, then applies the code change and ensures all tests pass. The fix undergoes an expedited **P-QGATE** review before being deployed.