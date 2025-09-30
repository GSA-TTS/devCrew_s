# P-DATA-MINIMIZATION: Data Minimization Enforcement Protocol

## Objective
To enforce the principle of collecting only the absolute minimum amount of personal data required to provide a specific service.

## Trigger
During the technical design phase of a new feature.

## Action Sequence

### Justification
Any requirement to collect personal data in the `prd.md` must be made using a machine-parsable **Data_Justification_Block**, which includes the data element, the specified purpose, and a necessity argument.

### Challenge
The @System-Architect is required to execute a `challenge_data_request` action, attempting to devise an alternative solution that achieves the purpose without collecting the data.

### Validation
A `validate_data_minimization` automated test is included in the Quality Gate, which scans all data collection points and fails the build if any data is collected that is not in the approved `data_inventory.json` from the PIA.