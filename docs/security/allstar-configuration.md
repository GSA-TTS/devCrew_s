# AllStar Security Configuration

This document describes the AllStar security policy configuration for the devCrew_s repository.

## Overview

AllStar is an automated security policy enforcement tool that helps maintain repository security standards. The configuration files in `.allstar/` define the security policies for this repository.

## Configuration Files

### admin.yaml
- **Purpose**: Controls repository administrator policies
- **Current Setting**: Opted out due to single-developer scenario
- **Rationale**: AllStar requires team-based administration, but this is a solo documentation project

### binary_artifacts.yaml
- **Purpose**: Monitors and controls binary files in the repository
- **Current Setting**: Monitoring enabled with issue creation
- **Allowed Files**: Currently none, but can be configured for documentation assets

### branch_protection.yaml
- **Purpose**: Enforces branch protection policies
- **Current Setting**: Adapted for single-developer workflow
- **Key Policies**:
  - Force push blocking: Enabled
  - Signed commits: Required
  - Up-to-date branches: Required
  - Review requirements: Disabled (solo development)

### security.yaml
- **Purpose**: Ensures security policy compliance
- **Current Setting**: Security policy enforcement active
- **Requirements**: SECURITY.md file required

## Policy Adaptations

The configuration has been adapted for a documentation repository with single-developer workflow:

1. **Admin Policy**: Opted out to avoid violations in solo development
2. **Branch Protection**: Maintains core security while allowing solo workflow
3. **Binary Artifacts**: Configured for documentation assets
4. **Security Policy**: Active to ensure proper security documentation

## Monitoring

AllStar will automatically:
- Create issues for policy violations
- Monitor repository changes
- Enforce configured security policies
- Auto-resolve issues when compliance is achieved

## Compliance

To maintain AllStar compliance:
- Keep SECURITY.md file current and accessible
- Follow branch protection guidelines
- Document any necessary binary artifacts
- Review and update policies as the project evolves

## References

- [AllStar GitHub Repository](https://github.com/ossf/allstar/)
- [GSA-TTS AllStar Configuration](https://github.com/GSA-TTS/.allstar)
- [Branch Protection Best Practices](./branch-protection-guidelines.md)