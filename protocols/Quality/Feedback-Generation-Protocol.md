# Feedback Generation Protocol

## Steps

1. Accept `{{list of files}}` containing files that are relevant for feedback generation. Carefully analyze the files.

2. Load relevant historical context. Query project documentation for recent architectural decisions. Analyze commit history for recurring patterns. Check for related open issues or previous review feedback.

3. Identify which past suggestions were accepted/implemented. Identify new best practices discovered through reviewing past suggestions and related results. Create/update reviewing practices and standards saved in `docs/audits/issue_{{issue number}}/reviewingStandards.md`

4. Generate mentoring-style feedback based on earlier analyses and reviewing standards. Provide code examples and learning resources for complex issues. Prioritize actionable improvements with clear business justification.

5. Add a comment to the github issue (#{{issue number}}) with the full generated feedback using github cli (for example: gh issue comment <issue-number> --body "Your full feedback text here.")