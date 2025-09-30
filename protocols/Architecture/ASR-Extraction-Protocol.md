# ASR Extraction Protocol

## Objective
To systematically identify Architecturally Significant Requirements from GitHub issues with enhanced rigor, precision, and stakeholder impact analysis.

## Steps

1. **Issue Deconstruction:** Execute `gh issue view {{issue_number}} --comments` to retrieve complete issue information including title, body, labels, assignees, and all comments with metadata analysis. Cache full issue data in Contextual Cache. Record metadata (labels, assignees) for stakeholder mapping.

2. **Stakeholder Analysis:** Identify and categorize stakeholders (author, commenters, mentioned teams, assignees) and analyze issue labels, project associations, and milestone metadata for comprehensive context gathering. Populate Stakeholder Impact Matrix using Multi-Perspective Synthesis.

3. **Problem Statement Separation:** Systematically separate the core problem statement from proposed solutions using Chain-of-thought reasoning to avoid solution bias and ensure requirement focus rather than implementation focus.

4. **Requirements Elicitation:** Extract both explicit and implicit requirements from context and stakeholder comments into ASR Extraction Workspace. Apply Contrastive Analysis to categorize and compare requirements into:
   * Functional Requirements: What the system must do with clear acceptance criteria
   * Non-Functional Requirements: How the system must perform, focusing on:
     * Performance/Scalability indicators with quantitative targets
     * Security considerations and compliance requirements
     * Reliability/Availability needs with SLA definitions
     * Maintainability/Evolvability aspects and technical debt constraints
     * Operability requirements and monitoring needs

5. Detect duplicated or overlapping requirements

6. **Causal Relationship Mapping:** Use Causal Inference to build root-cause chains.

7. **ASR Assessment Criteria:** Evaluate each requirement against enhanced ASR litmus test with explicit justification:
   * High Cost of Change: One-way door decisions that are expensive to reverse with impact analysis
   * Broad Scope of Impact: Cross-cutting concerns affecting multiple components with dependency mapping
   * High Technical Risk: New or unproven technologies with risk mitigation strategies
   * Significant NFR Impact: Fundamental alterations to system qualities with measurable impact
   * High Business Value/Risk: Critical business initiatives or significant risk factors with stakeholder priority
   * Validate candidate ASRs via Analogical Reasoning against pattern catalog
   * Assign a priority score based on analysis results

8. **Create Structured Analysis:** Save comprehensive analysis as `docs/planning/ISSUE_{{issue_number}}/ISSUE_{{issue_number}}_ASRs.md` with full traceability and stakeholder mapping.

9. **ADR Gap Analysis:** Execute Graph-of-Thoughts crosswalk with existing ADRs. Flag missing ADRs for creation with priority assessment. Validate that all ASRs have corresponding ADR references or flag gaps requiring new ADR creation with priority assessment and impact analysis.

10. **Quality Gate:** Execute **QG-ASR-VALIDATION** before concluding.