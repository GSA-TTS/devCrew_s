## How to Contribute to DevCrew

> All contributions to this project will be released under the CC0
> dedication. By submitting a pull request, or filing a bug, issue, or
> feature-request you are agreeing to comply with this waiver of copyright interest.
> Details can be found in our [LICENSE](LICENSE.md).

We're so glad you're thinking about contributing to the DevCrew project! Whether you're from software engineering, product management, operations, data science, or any other domain, your expertise is valuable here. If you're unsure about anything, just ask -- or submit the issue or pull request anyway. The worst that can happen is you'll be politely asked to change something. We love all friendly contributions.

### 🚀 Quick Links
- [Submit an Issue](#submit-an-issue) - Report bugs, propose changes, or request updates
- [Protocol Guidelines](#contributing-protocols) - Best practices for protocol design
- [Agent Guidelines](#contributing-agent-specifications) - How to propose new agents
- [Submission Process](#submission-process) - Via PR or Issue
- [Review Process](#review-process) - What to expect during review

## Types of Contributions

We welcome the following contributions to the DevCrew ecosystem across all development domains:

### Protocol Contributions
- 📝 **Improve Existing Protocols**: Refine step definitions for clarity or efficiency, enhance failure-handling and escalation paths, add examples and edge-case guidance
- 🆕 **Add New Protocols**: Identify repetitive tasks (e.g., security audits, performance tuning), define clear objective, trigger, step sequence, constraints, and failure recovery
- 🔄 **Protocol Reusability**: Ensure protocols are generic and reusable across multiple agents

### Agent Specifications
- 🤖 **Propose New Agents**: Create innovative agent specifications following the [AI Agent Specification Template](proposed_agents/AI%20Agent%20Specification%20Template.md)
- 🔧 **Improve Existing Agents**: Review current specs, add missing details, enhance integration, validate feasibility
- 🎯 **Protocol Integration**: Leverage existing protocol codes (e.g., GH-1, P-TDD, P-RECOVERY)

### Documentation & Planning
- 📋 **Documentation improvements**: Fix typos, clarify content, improve examples
- 🏗️ **Planning documents**: Strategic plans, roadmaps, architectural decisions
- 🔒 **Security guidelines**: Best practices, security procedures, threat models
- 📚 **Templates**: Reusable templates for common documentation needs
- 🐛 **Bug reports**: Issues with documentation accuracy, broken links, or protocol inconsistencies

## Submit an Issue

Use the issue tracker to suggest feature requests, report bugs, propose changes, and ask questions. This is also a great way to connect with the developers of the project as well as others who are interested in this solution.

### Issue Types
- 🐛 **Bug Reports**: Protocol errors, agent specification issues, broken links
- 💡 **Feature Requests**: New protocols, agent capabilities, or system enhancements
- 📝 **Documentation Requests**: Missing documentation, clarifications needed
- 🤖 **Agent Proposals**: Suggest new agent specifications
- 🔄 **Protocol Updates**: Request changes or corrections to existing protocols
- 🔒 **Security Concerns**: Report security vulnerabilities or concerns
- 📋 **Planning Proposals**: Strategic initiatives or architectural changes

## Contribution Guidelines

### Contributing Protocols

#### Best Practices for Protocol Design
1. **Clear Name & ID**: Use concise identifiers (e.g., GH-1, P-TDD)
2. **Objective & Trigger**: Describe when and why the protocol runs
3. **Step-by-Step Instructions**: 
   - Numbered actions with explicit success criteria
   - Keep each step focused (one responsibility per step)
   - Include decision points and branching logic
4. **Constraints & Preconditions**: Specify required context (branch state, data availability)
5. **Failure Handling & Escalation**: Define rollback mechanisms, retries, and human-in-the-loop triggers
6. **Examples & Templates**: Provide snippet templates or sample commands
7. **Reusability Focus**: Avoid agent-specific details; make protocols generic where possible

#### Why Contribute Protocols?
- **Reusability**: One definition serves many agents (e.g., GH-1, P-TDD, P-RECOVERY)
- **Consistency**: Enforces uniform procedures across the DevCrew ecosystem
- **Scalability**: New agents adopt proven protocols, reducing onboarding time and errors

### Contributing Agent Specifications

#### Best Practices for Agent Design
1. **Protocol Reuse**
   - **Mandatory**: Use existing protocol codes (e.g., GH-1, P-TDD, P-RECOVERY)
   - **Reference Format**: `Execute protocol: GH-1 with parameters {{issue_number}}`
   - **Avoid Duplication**: Don't redefine existing protocols

2. **Clear Boundaries**
   - Define explicit scope and responsibilities
   - Avoid overlap with existing agents
   - Specify handoff points clearly

3. **Memory Architecture**
   - Define short-term, long-term, and collaborative memory
   - Specify data formats and storage locations
   - Include cache management strategies

4. **Integration Design**
   - Use standard message formats
   - Define clear input/output contracts
   - Specify event triggers and responses

5. **Governance Integration**
   - Include quality gates and validation steps
   - Define escalation paths
   - Specify compliance requirements

6. **Testing Strategy**
   - Include testability in the design
   - Define performance benchmarks
   - Specify validation criteria

### Documentation Standards

#### File Organization
```
devCrew_s/
├── protocols/                   # Standardized workflow protocols
│   ├── Architecture/           # ADRs, ASRs, C4 models
│   ├── Development/            # TDD, feature development
│   ├── Security/               # DevSecOps, incident response
│   ├── Quality/                # Quality gates, code reviews
│   ├── Privacy/                # Privacy by design, GDPR
│   ├── Product/                # RICE scoring, user stories
│   ├── System/                 # Coordination, recovery
│   └── Operations/             # Maintenance, resilience
├── proposed_agents/             # Unofficial agent specifications
├── docs/
│   ├── architecture/           # System design and architectural decisions
│   ├── development/            # Development practices and workflows
│   ├── guides/                 # User-facing guides and tutorials
│   └── plans/                  # Strategic planning documents
```

### Markdown Guidelines
- Use proper heading hierarchy (start with #, then ##, etc.)
- Include a table of contents for longer documents
- Use meaningful link text (avoid "click here")
- Keep line length under 100 characters for readability
- Use code blocks with language specification

### Security Considerations
**Never include:**
- ❌ Real API keys, tokens, or credentials
- ❌ Internal network addresses
- ❌ Personally identifiable information (PII)

**Always include:**
- ✅ Use placeholders for sensitive values: `<API_KEY>`
- ✅ Security considerations in technical documentation

## Submission Process

You can contribute through either **Pull Requests** or **Issues**:

### Via Pull Request

1. **Fork & Branch**
   ```bash
   # For protocols
   git checkout -b protocol/[category]/[name]
   
   # For agent specifications
   git checkout -b proposed-agent/[agent-name]
   
   # For documentation
   git checkout -b docs/[type]/[description]
   ```

2. **Make Your Changes**
   - For protocols: Follow the protocol design best practices
   - For agents: Use the [AI Agent Specification Template](proposed_agents/AI%20Agent%20Specification%20Template.md)
   - For docs: Follow markdown guidelines

3. **Quality Checks**
   - Ensure markdown formatting is correct
   - Check all links are valid
   - Remove any sensitive information
   - Follow the file organization structure
   - Test protocols with at least two different scenarios
   - Validate agent specs are complete

4. **Submit PR**
   - Use descriptive PR title: `[Protocol/Agent/Docs] Category: Brief Description`
   - Include rationale and example usage
   - Reference any related issues
   - Label appropriately

### Via Issue

If you prefer not to submit a PR directly, you can create an issue to:
- **Propose changes**: Suggest improvements to existing protocols or agents
- **Request updates**: Ask for corrections or enhancements
- **Report problems**: Identify bugs or inconsistencies
- **Start discussions**: Propose new ideas or architectural changes

Include in your issue:
- Clear description of the proposed change
- Rationale for why it's needed
- Any relevant examples or use cases
- Links to affected files/protocols

## Review Process

### For Protocols
1. **Technical Review**: Verify protocol steps are clear and executable
2. **Reusability Check**: Ensure protocol is generic enough for multiple agents
3. **Integration Test**: Validate protocol works with existing workflows
4. **Documentation**: Confirm all sections are complete

### For Agent Specifications
1. **Completeness Check**: All template sections filled
2. **Protocol Validation**: Referenced protocols exist and are used correctly
3. **Boundary Review**: No overlap with existing agents
4. **Feasibility Assessment**: Implementation is technically viable

### For Proposed Agents
Proposed agents follow a maturity progression:
- 🔴 **Draft**: Initial concept (<50% complete)
- 🟡 **In Review**: Under active development (50-80% complete)
- 🟢 **Ready for Vetting**: Complete specification (100% complete)
- ✅ **Approved**: Ready for promotion to official status

## Example Contributions

### Protocol Example
```markdown
# P-CODE-REVIEW: Automated Code Review Protocol

## Objective
Ensure code quality through systematic review

## Trigger
Pull request created or updated

## Steps
1. Run static analysis tools
2. Check test coverage
3. Validate coding standards
4. Generate feedback report
```

### Agent Protocol Usage Example
```markdown
## Protocol Execution
Step 1: Execute GH-1 with {{issue_number}}
Step 2: Upon completion, trigger P-TDD
Step 3: If failure, execute P-RECOVERY
Step 4: On success, proceed to P-QGATE
```

## Further inquiry

We encourage you to read this project's CONTRIBUTING policy (you are here), its [LICENSE](LICENSE.md), and its [README](README.md) and adhere to its [CODE_OF_CONDUCT](CODE_OF_CONDUCT.md).

If you have any questions or want to read more, check out the [GSA Open Source Policy](https://open.gsa.gov/oss-policy/) and [Guidance repository](https://github.com/GSA/open-source-policy), or just [shoot us an email](mailto:cto@gsa.gov).

---

## Public domain

This project is in the public domain within the United States, and
copyright and related rights in the work worldwide are waived through
the [CC0 1.0 Universal public domain dedication](https://creativecommons.org/publicdomain/zero/1.0/).

All contributions to this project will be released under the CC0
dedication. By submitting a pull request, you are agreeing to comply
with this waiver of copyright interest.
