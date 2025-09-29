## How to contribute

> All contributions to this project will be released under the CC0
> dedication. By submitting a pull request, or filing a bug, issue, or
> feature-request you are agreeing to comply with this waiver of copyright interest.
> Details can be found in our [LICENSE](LICENSE.md).

We're so glad you're thinking about contributing to a GSA open source project! If you're unsure about anything, just ask -- or submit the issue or pull request anyway. The worst that can happen is you'll be politely asked to change something. We love all friendly contributions.

## Types of Contributions

We welcome the following contributions to this documentation repository:
- 📝 **Documentation improvements**: Fix typos, clarify content, improve examples
- 📋 **Planning documents**: Strategic plans, roadmaps, architectural decisions
- 🔒 **Security guidelines**: Best practices, security procedures, threat models
- 🏗️ **Templates**: Reusable templates for common documentation needs
- 🐛 **Bug reports**: Issues with documentation accuracy or broken links

## Submit an issue

Use the issue tracker to suggest feature requests, report bugs, and ask questions. This is also a great way to connect with the developers of the project as well as others who are interested in this solution. We have templates available for:
- Documentation requests
- Security concerns
- Planning proposals

## Documentation Standards

### File Organization
```
docs/
├── architecture/     # System design and architectural decisions
├── development/      # Development practices and workflows
├── guides/          # User-facing guides and tutorials
├── plans/           # Strategic planning documents
├── policies/        # Policy documents
├── security/        # Security guidelines and procedures
└── templates/       # Reusable documentation templates
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

## Requesting a change

Generally speaking, you should fork this repository, make changes in your
own fork, and then submit a pull-request. For documentation repositories:
1. Ensure markdown formatting is correct
2. Check all links are valid
3. Remove any sensitive information
4. Follow the file organization structure
5. Use the PR template to describe your changes

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
