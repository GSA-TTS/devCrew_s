# P-ETHICAL-DESIGN: Ethical Design and Dark Pattern Prevention Protocol

## Objective
To proactively prevent the use of "dark patterns"—deceptive UI/UX tricks designed to mislead users.

## Trigger
During the review of a `design_spec.md`.

## Action Sequence
A specialized @Ethical-Design-Auditor agent is invoked as part of the Quality Gate.

### Heuristic Scanning
The agent executes a `scan_for_dark_patterns` action, using a library of heuristics to detect known categories like Confirmshaming, Misdirection, Forced Continuity, and Hidden Costs.

### Remediation Loop
If the agent's `dark_pattern_report.json` contains any high-severity findings, the Quality Gate automatically rejects the design and routes a remediation task back to the @UX-UI-Designer.