# Security Scan Protocol

## Steps

1. Query project documentation for recent architectural decisions. Analyze commit history for recurring patterns. Check for related open issues or previous review feedback.

2. Run parallel scans: SAST (SonarQube/CodeQL), SCA (Snyk/Dependabot), Secrets (GitGuardian). Output result to a temp file.

3. Execute IaC security checks (Checkov, Terrascan) if applicable. Output result to a temp file.

4. Perform dynamic configuration analysis. Output result to a temp file.

5. Aggregate findings from the temp files and Categorize them: CRITICAL (security/functional), MAJOR (maintainability), MINOR (style). Calculate risk scores using CVSS for security issues.

6. Verify issues against recent team decisions and documented exceptions

7. Check for false positives using historical review data

8. Validate business logic correctness where possible

9. Pipe the results to `docs/audits/issue_{{issue number}}/issue_{{issue_number}}_security_{{time stamp}}.md` where {{time stamp}} is the mmddyy_hhmm time stamp of the time right before the file was saved.