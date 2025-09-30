# P-TDD: Test-Driven Development Protocol

## Objective
To enforce a strict Test-Driven Development (TDD) cycle for all code implementation, providing a deterministic check against the non-deterministic output of LLMs. Do not try to create a git commit during this protocol. Do not go to the next step before the current step finishes. The cache files can also be used to append the agent's output iteratively to manage long context/response lengths. Cache files must be cleared afterwards.

## Trigger
Invoked at the start of any task that requires writing or modifying code.

## Steps

1. **Delegate Test Creation**: If `/tests/issue_{{issue_number}}_tests.md` does not exist, based on `/docs/development/issue_{{issue number}}/issue_{{issue_number}}_plan.md,` the **QA-Tester_vSEP25** is invoked to create new tests, and the agent must wait for the QA-Tester_vSEP25 to completely finish its work. If `/tests/issue_{{issue_number}}_tests.md` does exist, proceed to step 2.

2. **Verify Tests:** If step 1 succeeds, there should be a tracker at `/tests/issue_{{issue_number}}_tests.md`. Analyze `/docs/development/issue_{{issue number}}/issue_{{issue_number}}_plan.md` and make sure tests were created for all new requirements. For each test that was marked with "flaky", understand the issues and improve the test. Do not try to mask or avoid issues. Note that a requirement is old when there is existing documentation about it. If `issue_{{issue_number}}_tests.md` is not complete, return to step 1. Otherwise, proceed to the next step.

3. **Validate Test Failure (RED)**: Newly created tests are executed 3 times each to confirm that the new test fails as expected. Flag a test as "flaky" in `issue_{{issue_number}}_tests.md` if the test results are non-deterministic. If there is any flaky test, documented in `issue_{{issue_number}}_tests.md` return to step 2, go to the next step otherwise.

4. **Write Implementation Code (GREEN)**: The agent writes the minimum amount of code necessary to make the new test pass.

5. **Validate Test Pass**: New tests are executed again for at least 3 rounds to identify flaky results. If there are one or more flaky tests, mark the tests as "flaky" and document the flakiness in `issue_{{issue_number}}_tests.md` and then return to step 2, proceed otherwise. For each stable failing test, apply fixes to the implementation codes and run the test again. Repeat this cycle until the test is passed. Add a comment to the github issue (#{{issue number}}) with a concise summary of implemented codes using github cli (for example: gh issue comment <issue-number> --body "Your comment text here.")

6. **Refactor**: With a safety net of passing tests, the agent refactors the code for clarity and quality.

7. **Ensure 100% code coverage** by writing more tests, avoid duplicated tests.

8. **Validate Test Pass**: New tests are executed again and fixes are applied to validate that all tests now pass. Repeat this step until all new tests are passed

9. Add a comment to the github issue (#{{issue number}}) with a concise summary of implemented codes, tests generated, and test results using github cli (for example: gh issue comment <issue-number> --body "Your comment text here.") Make sure all changes/updates are properly staged in Github. Do not create a git commit.