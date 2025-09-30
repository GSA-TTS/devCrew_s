# P-PIA: Privacy Impact Assessment Protocol

## Objective
To provide a formal risk management process to identify, assess, and mitigate privacy risks before development begins.

## Trigger
Invoked by the P-PRIVACY-BY-DESIGN protocol.

## Action Sequence
The @Compliance-Auditor or @Project-Manager executes a multi-phase workflow.

### Threshold Analysis
An initial check is run to determine if a full PIA is necessary (e.g., does the feature involve a new PII collection?).

### Data Flow Mapping
If needed, a sub-team maps how data is collected, used, and stored, producing a `data_flow_diagram.md` and a `data_inventory.json`.

### Risk Identification
The @Security-Auditor analyzes the data flows against privacy principles (like GDPR) to identify risks.

### Mitigation Planning
For each high or medium risk, a specific mitigation strategy is defined. The final `pia_report.md` becomes a mandatory input for subsequent protocols.