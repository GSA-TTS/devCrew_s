# ADR Creation Protocol

## Objective
Produce evidence-based, anti-pattern–free ADRs with robust stakeholder alignment.

## Critical Quality Standards Integration

### Anti-Pattern Avoidance
Explicitly avoid ADR anti-patterns with systematic validation:
- **The Fairy Tale:** Over-optimistic scenarios without realistic trade-offs or risk acknowledgment
- **The Sales Pitch:** Biased presentation favoring predetermined solutions without objective analysis
- **The Dummy Alternative:** Presenting obviously inferior alternatives without genuine consideration
- **Free Lunch Coupon:** Claiming benefits without acknowledging costs, risks, or trade-offs

### Viable Competitor Analysis
Ensure minimum of 2-3 genuinely viable alternatives with honest trade-off analysis including quantitative comparisons, implementation effort, and risk assessment where possible

### Evidence-Based Language
Use factual, evidence-based language with references to standards, benchmarks, research, and measurable criteria avoiding subjective or promotional language

### Self-Contained Narratives
Create logical narratives that can be understood without external context while maintaining appropriate cross-references

### Comprehensive Impact Assessment
Document both positive and negative consequences with realistic timelines, resource requirements, and stakeholder impact analysis

## ADR Template Sections

- **ADR Number** (use placeholder NNN with sequential numbering system)
- **Title** (present tense imperative, solution-focused, descriptive)
- **Status** (set to "Proposed" with approval workflow defined)
- **Date** (current date with version tracking)
- **Author(s)** (use placeholder with role identification)
- **Stakeholders** (explicit list with roles, impact assessment, and approval requirements)
- **Context** (synthesize problem and ASRs with business impact and strategic alignment)
- **Problem Statement** (clear, measurable problem definition with success criteria)
- **NFRs Considered** (links to formal Non-Functional Requirements with quantitative targets)
- **Assumptions & Constraints** (explicit technical, business, and resource constraints with validation methods)
- **Options Considered** (minimum 2-3 viable alternatives with honest pros/cons analysis, cost comparison, and risk assessment)
- **Decision & Rationale** (evidence-based justification with quantitative data, stakeholder input, and strategic alignment where possible)
- **Consequences** (comprehensive impact assessment including positive, negative, risk implications, timeline, and resource requirements)
- **Technical Debt Declaration** (if applicable, using Technical Debt Quadrant classification with repayment plan)
- **Architecture Fitness Functions** (measurable criteria to validate ongoing adherence with automated validation where possible)
- **Related Artifacts/Decisions** (explicit ADR dependencies, relationships, and impact on existing decisions)
- **Approval Workflow** (required approvals, review process, and stakeholder sign-off requirements)

## For each ASR not covered by an existing ADR

1. **Pre-ADR Analysis:** Conduct comprehensive stakeholder impact analysis and gather quantitative data to support decision-making with cost-benefit analysis.

2. **Create Comprehensive ADR:** Following enhanced template with rigorous anti-pattern validation and evidence verification. Leverage Chain-of-Thought and Contrastive Analysis. Run automated checks in ADR Validation Workspace for spotting anti-patterns.

3. **Self-Reflection Gate:** Execute Self-Reflection Pattern review of CoT/ToT logs.

4. **Validation:** Validate with QG-ADR-VALIDATION protocol.

5. **GitHub Issue Creation:** Create GitHub issue to request and formally document ADR approval, post ADR draft for review, mentioning originating issue {{issue number}} as the architectural driver.

6. **Architecture Review Board (ARB) Trigger:** Initiate ARB process for high-impact decisions with formal governance workflow.

7. **Architecture Fitness Functions Generation:** Create measurable criteria as executable tests to continuously validate the decision and detect architectural drift.

8. **Stakeholder Review Integration:** Ensure all identified stakeholders have formal opportunity for architectural decision review with structured feedback collection.