# Security Policy

## Supported Versions

This repository contains documentation and planning artifacts. Security updates apply to the latest version of all documentation.

| Documentation Version | Supported          |
| -------------------- | ------------------ |
| Latest (main/master) | :white_check_mark: |
| Archived versions    | :x:                |

## Reporting a Vulnerability

The devCrew_s repository is a documentation and planning repository. While it doesn't contain executable code, we take the security of our documentation and planning artifacts seriously.

### What to Report

Please report any of the following security concerns:

- Exposed sensitive information in documentation
- Credentials or API keys accidentally included
- Security vulnerabilities in recommended practices
- Misleading security guidance
- Privacy concerns in documentation

### How to Report

1. **Do NOT** create a public GitHub issue for security vulnerabilities
2. Use one of these secure reporting methods:
   - Open a **private security advisory** on GitHub (preferred)
   - Send an encrypted email to the repository maintainers
   - Use the GitHub Security tab to report privately

3. Include the following information in your report:
   - Description of the security concern
   - Location (file path and line numbers if applicable)
   - Potential impact assessment
   - Suggested remediation if known
   - Any additional context that might be helpful

### Response Timeline

- **Initial Acknowledgment**: Within 48 hours
- **Impact Assessment**: Within 3 business days  
- **Status Updates**: Weekly or as significant progress is made
- **Resolution**: Based on severity and complexity, typically within 14 days

### Disclosure Policy

- We follow responsible disclosure practices
- Security fixes will be applied as soon as possible
- Public disclosure will occur after remediation is complete
- Reporters will receive credit (unless they prefer to remain anonymous)

## Security Considerations for Documentation

### Best Practices

When contributing to this repository, please follow these security guidelines:

1. **Never commit sensitive data**:
   - No real credentials, API keys, or tokens
   - No internal IP addresses or hostnames
   - No personally identifiable information (PII)
   - Use placeholders like `<YOUR_API_KEY>` in examples

2. **Review before committing**:
   - Double-check all documentation for sensitive information
   - Ensure examples use safe, non-functional values
   - Verify that planning documents don't expose security details

3. **Access Control**:
   - This is a public repository - assume all content is publicly visible
   - Sensitive planning should use private channels
   - Security-critical discussions should happen in secure forums

## Security Resources

- [GitHub Security Best Practices](https://docs.github.com/en/code-security/getting-started)
- [Documentation Security Guidelines](docs/security/security-policy-template.md)
- [OWASP Documentation Security](https://owasp.org/www-project-documentation-security/)

## Contact

For urgent security matters that cannot be reported through GitHub, please contact the repository administrators directly through their GitHub profiles.

---

*This security policy was last updated on: 2025-09-29*