# DevCrew Protocols Registry

## 📋 Overview

This repository contains the comprehensive collection of standardized protocols for the DevCrew multi-agent system. These protocols define structured, repeatable workflows that ensure consistency, reliability, and scalability across all autonomous development agents.

## 🎯 Purpose

Protocols are concise, reusable workflows—a sequence of standardized steps that can be invoked across multiple agents. Well-designed protocols ensure consistency, auditability, and ease of maintenance throughout the software development lifecycle.

## 🗺️ Navigation

**Quick Jump:** [Architecture](#architecture-protocols) | [Development](#development-protocols) | [Security](#security-protocols) | [Operations](#operations-protocols) | [Quality](#quality-assurance-protocols) | [Privacy](#privacy--ethics-protocols) | [Product](#product-management-protocols) | [System](#system-coordination-protocols)

## 🔍 Protocol Categories

### Architecture Protocols
- **ADR Creation**: Evidence-based architectural decision documentation
- **ASR Extraction**: Systematic identification of Architecturally Significant Requirements
- **ASR-ADR Alignment**: Traceability between ASRs and ADRs
- **C4 Visualization**: Automated architectural diagram generation
- **Technology Radar**: Strategic technology adoption and evaluation
- **Architecture Fitness (FIT-001)**: Continuous architecture validation
- **Pattern Management (PAT-001)**: Architectural pattern catalog
- **Cross-Functional Requirements (CFR-001)**: Integration of NFRs
- **Technical Debt Management (DEBT-001)**: Systematic debt tracking

### Development Protocols
- **GH-1**: GitHub Issue Triage Protocol
- **P-TDD**: Test-Driven Development enforcement
- **P-FEATURE-DEV**: End-to-end feature development lifecycle
- **P-BUG-FIX**: Rapid bug diagnosis and resolution
- **P-API-DEV**: API lifecycle management
- **P-DB-MIGRATE**: Zero-downtime database migrations

### Security Protocols
- **P-DEVSECOPS**: Integrated security in CI/CD pipeline
- **P-SEC-VULN**: Automated vulnerability management
- **P-SEC-INCIDENT**: NIST-based incident response
- **P-SEC-CHAOS**: Security chaos engineering
- **Security Scan**: Multi-tool security analysis

### Quality Assurance Protocols
- **P-QGATE**: Automated quality checkpoints
- **Code Review**: Comprehensive code quality validation
- **Feedback Generation**: Intelligent review feedback
- **QG-ASR-VALIDATION**: Quality gate for ASR extraction
- **QG-ALIGN-VALIDATION**: Quality gate for ASR-ADR alignment
- **QG-ADR-VALIDATION**: Quality gate for ADR creation

### Operations Protocols
- **GitHub Maintenance**: Repository maintenance automation
- **Local Dependency Maintenance**: Dependency management
- **OPS-001**: Operational resilience and error handling

### Privacy & Ethics Protocols
- **P-PRIVACY-BY-DESIGN**: Privacy integration in development
- **P-PIA**: Privacy Impact Assessment
- **P-CONSENT-DESIGN**: User consent management
- **P-DATA-MINIMIZATION**: Minimum data collection enforcement
- **P-ETHICAL-DESIGN**: Dark pattern prevention

### Product Management Protocols
- **STRAT-PRIO-001**: RICE scoring for feature prioritization
- **STRAT-PRIO-002**: Bug triage and prioritization matrix
- **USER-STORY-MAP-001**: User story mapping and organization
- **EXPERIMENT-001**: A/B testing and experimentation
- **FEEDBACK-INGEST-001**: Customer feedback processing
- **ROADMAP-UPDATE-001**: Product roadmap synchronization
- **METRIC-TRACK-001**: Value metrics tracking
- **COMM-LIAISON-001**: Stakeholder communication
- **File Read/Write**: Product documentation management

### System Coordination Protocols
- **Hub-and-Spoke**: Decoupled agent communication
- **P-RESOURCE**: Concurrent task scheduling
- **P-RECOVERY**: Failure recovery and rollback
- **P-LEARN**: Continuous self-optimization
- **Research Cache Management**: Performance optimization through caching

## 📋 Protocol Structure

Each protocol follows a standardized template:

```markdown
# Protocol Name

## Objective
Clear statement of the protocol's purpose and goals

## Trigger
Conditions or events that initiate the protocol

## Agents
Roles responsible for execution

## Prerequisites
Required conditions before execution

## Steps
1. Numbered, actionable steps
2. Clear success criteria per step
3. Explicit failure handling

## Outputs
Expected deliverables and artifacts

## Quality Gates
Validation checkpoints and criteria

## Recovery
Rollback and escalation procedures
```

## 🤝 Contributing

### Why Contribute Protocols?

- **Reusability**: One definition serves many agents (e.g., GH-1, P-TDD, P-RECOVERY in the Backend-Engineer spec)
- **Consistency**: Enforces uniform procedures across the DevCrew ecosystem and avoids ad hoc practices
- **Scalability**: New agents adopt proven protocols, reducing onboarding time and errors

### Contribution Types

#### Improve Existing Protocols
- Refine step definitions for clarity or efficiency
- Enhance failure-handling and escalation paths
- Add examples and edge-case guidance

#### Add New Protocols
- Identify repetitive tasks (e.g., security audits, performance tuning)
- Define a clear objective, trigger, step sequence, constraints, and failure recovery
- Document inputs, outputs, and success criteria

### Best Practices for Protocol Design

1. **Clear Name & ID**
   - Use concise identifiers (e.g., GH-1, P-TDD)
   - Follow naming conventions for the category

2. **Objective & Trigger**
   - Describe when and why the protocol runs
   - Be specific about triggering conditions

3. **Step-by-Step Instructions**
   - Numbered actions with explicit success criteria
   - Keep each step focused (one responsibility per step)
   - Include decision points and branching logic

4. **Constraints & Preconditions**
   - Specify required context (branch state, data availability)
   - List dependencies on other protocols or systems

5. **Failure Handling & Escalation**
   - Define rollback mechanisms, retries, and human-in-the-loop triggers
   - Specify timeout conditions and recovery procedures

6. **Examples & Templates**
   - Provide snippet templates or sample commands
   - Include real-world scenarios and use cases

7. **Reusability Focus**
   - Avoid agent-specific details; make protocols generic where possible
   - Use parameterization for variable elements

### Submission Process

1. **Fork the Repository**: Create your own fork for development
2. **Create Feature Branch**: Name it `protocol/[category]/[name]`
3. **Follow Template**: Use the standard protocol structure
4. **Test Protocol**: Validate with at least two different agent scenarios
5. **Document Changes**: Update this README if adding new categories
6. **Submit PR**: Include rationale and example usage in PR description
7. **Review Process**: Address feedback from maintainers

## 📊 Protocol Metrics

| Category | Count | Status |
|----------|-------|--------|
| Architecture | 9 | Active |
| Development | 6 | Active |
| Security | 5 | Active |
| Operations | 3 | Active |
| Quality | 6 | Active |
| Privacy | 5 | Active |
| Product | 9 | Active |
| System | 5 | Active |
| **Total** | **48** | **Active** |

## 🔄 Version Control

- All protocols follow semantic versioning (MAJOR.MINOR.PATCH)
- Changes are tracked through Git history
- Breaking changes require migration guides

## 📚 Related Documentation

- [DevCrew Agent Specifications](../README.md)
- [Architecture Decision Records](../docs/architecture/ADRs/)
- [Development Guides](../docs/guides/)
- [Protocol Registry](../Protocol%20Registry.md)

## 📝 License

This protocol collection is part of the DevCrew project and follows the same licensing terms as the main repository.

## 🏷️ Metadata

- **Last Updated**: September 2024
- **Maintainers**: DevCrew Architecture Team
- **Review Cycle**: Quarterly
- **Compliance**: SOC2, GDPR, HIPAA compatible

## 🔗 Quick Links

### Most Used Protocols
1. [P-TDD: Test-Driven Development](Development/P-TDD-Test-Driven-Development-Protocol.md)
2. [P-RECOVERY: Failure Recovery](System/P-RECOVERY-Failure-Recovery-and-Transactional-Rollback-Protocol.md)
3. [GH-1: Github Issue Triage](Development/GH-1-Github-Issue-Triage-Protocol.md)
4. [P-QGATE: Quality Gates](Quality/P-QGATE-Automated-Quality-Gate-Protocol.md)
5. [ASR Extraction](Architecture/ASR-Extraction-Protocol.md)

### Critical Security Protocols
- [P-SEC-INCIDENT: Incident Response](Security/P-SEC-INCIDENT-Cybersecurity-Incident-Response-Protocol.md)
- [P-DEVSECOPS: DevSecOps Pipeline](Security/P-DEVSECOPS-Integrated-DevSecOps-Pipeline-Protocol.md)
- [P-SEC-VULN: Vulnerability Management](Security/P-SEC-VULN-Automated-Vulnerability-Management-Protocol.md)

### Governance Protocols
- [ADR Creation Protocol](Architecture/ADR-Creation-Protocol.md)
- [Architecture Fitness Protocol](Architecture/FIT-001-Architecture-Fitness-Protocol.md)
- [Technology Radar Protocol](Architecture/Technology-Radar-Protocol.md)

### Product Management Protocols
- [RICE Scoring](Product/STRAT-PRIO-001-RICE-Scoring-Protocol.md)
- [User Story Mapping](Product/USER-STORY-MAP-001-User-Story-Mapping-Protocol.md)
- [A/B Experimentation](Product/EXPERIMENT-001-AB-Experimentation-Protocol.md)

### Privacy & Compliance Protocols
- [Privacy by Design](Privacy/P-PRIVACY-BY-DESIGN-Privacy-by-Design-Lifecycle-Protocol.md)
- [Privacy Impact Assessment](Privacy/P-PIA-Privacy-Impact-Assessment-Protocol.md)
- [Consent Management](Privacy/P-CONSENT-DESIGN-User-Consent-Management-Protocol.md)

---

*For questions or support, please open an issue in the main DevCrew repository or contact the Architecture Team.*