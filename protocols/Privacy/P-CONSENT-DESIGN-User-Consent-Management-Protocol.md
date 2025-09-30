# P-CONSENT-DESIGN: User Consent Management Protocol

## Objective
To govern the design and implementation of clear, compliant, and user-friendly mechanisms for obtaining user consent for data collection.

## Trigger
A requirement for user consent is identified in the `pia_report.md`.

## Action Sequence

### Design
The @UX-UI-Designer designs consent UIs (e.g., cookie banners, preference centers) following best practices: no pre-checked boxes, equal visual prominence for "Accept" and "Reject," and simple language.

### Implementation
The @Backend-Engineer implements the core logic, including an immutable audit log for consent events and a gatekeeper function that blocks data processing for non-consenting users.

### Validation
The @QA-Tester executes a `validate_consent_workflow` test suite to verify that no non-essential trackers are loaded before consent is given and that withdrawal is as easy as granting consent.