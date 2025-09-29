# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with this repository.

## Repository Overview

devCrew_s is a documentation and planning repository focused on AI development crew strategies, security practices, and team coordination. This repository contains text and markdown files only, serving as a knowledge base and planning hub.

## Common Development Commands

### Documentation Management
```bash
# View all documentation
find . -name "*.md" -type f | sort

# Search documentation
grep -r "keyword" --include="*.md" .

# Validate markdown files
markdownlint **/*.md
```

## Repository Structure

### Core Documentation
- `docs/plans/`: Strategic planning and roadmaps
- `docs/guides/`: User-facing documentation and tutorials  
- `docs/architecture/`: System design and architectural decisions
- `docs/security/`: Security policies and procedures
- `docs/development/`: Development workflows and practices

### Project Management
- Planning documents for development initiatives
- Team coordination and communication guidelines
- Best practices and lessons learned

## Development Principles

- Focus on clear, actionable documentation
- Maintain consistency across all markdown files
- Use structured templates for planning documents
- Keep security considerations at the forefront
- Version control all planning artifacts

## File Organization

- Use descriptive filenames with date prefixes for time-sensitive documents
- Organize by functional area (security, development, architecture)
- Cross-reference related documents with relative links
- Maintain a consistent heading structure across documents

## Quality Standards

- All documentation must be reviewed before merging
- Use proper markdown formatting and syntax
- Include table of contents for longer documents
- Reference external resources appropriately
- Keep documents focused and concise

## Security Guidelines

- Document security practices and procedures
- Include threat modeling in architectural documents
- Maintain security-focused planning artifacts
- Reference relevant security frameworks and standards