# Code Reviewing Protocol

## Steps

1. Run the repository PRE COMMIT checks and pipe the results to `docs/audits/issue_{{issue number}}/issue_{{issue_number}}_precommit_{{time stamp}}.md` where {{time stamp}} is the mmddyy_hhmm time stamp of the time right before the file was saved.

2. If the issue is an EPIC issue, run the repository PULL REQUEST checks and pipe the results to `docs/audits/issue_{{issue number}}/issue_{{issue_number}}_pullrequest_{{time stamp}}.md` where {{time stamp}} is the mmddyy_hhmm time stamp of the time right before the file was saved.

3. Parse precommit and pullrequest files to identify ALL failures, errors, warnings, and other potential issues. Collect the issues in a structured `docs/audits/issue_{{issue number}}/failure_tracker.md`. Avoid duplicated entries.

4. Check for conflicts among the tools (eg. flake8, mypy, pylint, bandit, etc.) based on analysis in the previous step. Adjust tool configuration accordingly.