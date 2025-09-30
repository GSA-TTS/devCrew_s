# P-DEVSECOPS: Integrated DevSecOps Pipeline Protocol

## Objective
To embed automated security practices throughout the CI/CD pipeline, making security a shared responsibility ("Shift Left Security").

## Trigger
A code commit is pushed to the version control repository.

## Phases (CI/CD Stages)

1. **Pre-Commit**: Agents use IDE plugins for real-time security feedback.

2. **Commit/Build Stage**: The CI pipeline automatically performs **Static Application Security Testing (SAST)** to scan source code and **Software Composition Analysis (SCA)** to scan third-party dependencies for known vulnerabilities.

3. **Test Stage**: In a temporary test environment, **Dynamic Application Security Testing (DAST)** is run to scan the running application by simulating external attacks.

4. **Deploy Stage**: Before deployment, Infrastructure as Code (IaC) scripts are scanned for misconfigurations.

5. **Operate/Monitor Stage**: In production, the @SRE-Agent and @Security-Auditor continuously monitor for threats and anomalies.