# P-SEC-INCIDENT: Cybersecurity Incident Response Protocol

## Objective
To provide a structured, repeatable process for managing cybersecurity incidents, based on the NIST Incident Response Framework.

## Trigger
A high-fidelity alert from a monitoring tool indicating a potential security breach.

## Phases (NIST Framework)

1. **Preparation**: Continuous maintenance of an up-to-date incident response plan, roles, and tools.

2. **Detection & Analysis**: The @SRE-Agent detects initial Indicators of Compromise (IOCs) and passes the alert to the @Security-Auditor for validation and impact assessment.

3. **Containment, Eradication, & Recovery**: The @Orchestrator, guided by the @Security-Auditor, delegates tasks to contain the threat (e.g., isolating a network segment), eradicate the root cause (e.g., patching the vulnerability), and recover affected systems from secure backups.

4. **Post-Incident Activity**: A post-mortem analysis is convened to produce a report detailing the incident timeline, root cause, and lessons learned.