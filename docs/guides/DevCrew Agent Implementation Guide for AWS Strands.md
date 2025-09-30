# DevCrew Agent Implementation Guide for AWS Strands

This comprehensive guide demonstrates how to convert DevCrew agent specifications into AWS Strands agents, leveraging Strands' model-driven architecture, flexible tool ecosystem, and production-ready deployment patterns.

## Overview

DevCrew specifications define comprehensive frameworks for autonomous development teams across various domains. AWS Strands Agents provides an ideal implementation platform through its model-driven approach, where the foundation model's reasoning abilities handle planning and tool usage autonomously. Strands emphasizes simplicity - developers create agents with a prompt (defining the agent's role) and tools, and the LLM determines how to chain reasoning and invoke tools as needed.

Please note that implementation details (codes) listed below are examples only.

### Why AWS Strands for DevCrew Implementation?

- **Model-Driven Architecture**: LLM autonomously handles planning and tool invocation rather than hardcoded workflows
- **Code-First Simplicity**: Create production-ready agents in just a few lines of Python code
- **AWS Integration**: Seamless connection to Amazon Bedrock, AWS Lambda, and other AWS services
- **Production-Ready**: Built for scale with comprehensive observability, tracing, and deployment options
- **Multi-Agent Orchestration**: Four intuitive patterns (Agents-as-Tools, Handoffs, Swarms, Graphs) for complex coordination
- **Proven in Production**: Actively used by AWS teams including Kiro, Amazon Q, and AWS Glue

## Prerequisites

**Python Environment**: Python 3.10 or higher
**AWS Credentials**: Configured for Amazon Bedrock access
**Model Access**: Claude 3.7 Sonnet enabled in Amazon Bedrock (default model)
**GitHub Integration**: For DevCrew GitHub protocol workflows

## Quick Start: Installation and Setup

### Step 1: Create Virtual Environment

Create and activate a virtual environment for isolation:

```bash
python -m venv .venv
```

**Activate the environment:**

**macOS / Linux:**
```bash
source .venv/bin/activate
```

**Windows (CMD):**
```bash
.venv\Scripts\activate.bat
```

**Windows (PowerShell):**
```bash
.venv\Scripts\Activate.ps1
```

### Step 2: Install Strands Packages

Install the core SDK and development packages:

```bash
pip install strands-agents
pip install strands-agents-tools strands-agents-builder
```

**Package Overview:**
- `strands-agents`: Core SDK for agent development
- `strands-agents-tools`: Pre-built tools for common capabilities
- `strands-agents-builder`: Agent builder to help create custom agents and tools

### Step 3: Configure AWS Credentials

Strands defaults to Amazon Bedrock with Claude 3.7 Sonnet. Configure AWS credentials using one of these methods:

**Environment Variables:**
```bash
export AWS_ACCESS_KEY_ID=your_access_key
export AWS_SECRET_ACCESS_KEY=your_secret_key
export AWS_SESSION_TOKEN=your_session_token  # Optional
```

**AWS CLI Configuration:**
```bash
aws configure
```

**IAM Roles:** If running on AWS services (EC2, ECS, Lambda), use IAM roles attached to the service.

### Step 4: Enable Model Access

Enable Claude 3.7 model access in Amazon Bedrock console following AWS documentation. Navigate to Amazon Bedrock → Model access → Request access for Claude models.

### Step 5: Project Structure

Create your DevCrew agent project:

```
devcrew_agents/
├── __init__.py
├── agent.py              # Main agent implementation
├── requirements.txt      # Dependencies
└── tools/                # Custom DevCrew tools
    ├── github_protocol.py
    ├── tdd_workflow.py
    └── code_review.py
```

Create `requirements.txt`:
```
strands-agents>=0.1.0
strands-agents-tools>=0.1.0
boto3>=1.34.0
```

## DevCrew → Strands Component Mapping

### Core Translation Framework

| DevCrew Component | Strands Implementation | Location |
|------------------|----------------------|----------|
| Agent_Handle | Agent `name` parameter | Agent initialization |
| Agent_Role + Mandate | `system_prompt` parameter | Agent initialization |
| Persona_and_Tone | Integrated into `system_prompt` | Agent initialization |
| Core_Responsibilities | System prompt instructions | Agent initialization |
| Protocols | Tool implementations + prompts | Custom tools + system prompt |
| Tool Access | `tools` parameter | Agent initialization |
| Governance Rules | Tool validation + prompts | Tool implementations |
| Agent Interactions | Multi-agent patterns | Agents-as-Tools, Handoffs |

### Example: Backend Engineer Implementation

Based on your Backend-Engineer-vSEP25 specification:

**DevCrew Specification Summary:**
- **Agent_Handle**: Backend-Engineer-vSEP25
- **Role**: Server-Side Software Engineer
- **Mandate**: TDD-driven API and backend development
- **Key Protocols**: GH-1 (GitHub Issue Triage), P-TDD (Test-Driven Development), P-RECOVERY (Failure Recovery)
- **Tools**: Git, GitHub CLI, file operations, testing frameworks

#### Basic Agent Implementation

```python
# devcrew_agents/agent.py

import logging
from strands import Agent, tool
from strands_tools import file_read, file_write, shell, calculator

# Enable debug logging
logging.getLogger("strands").setLevel(logging.DEBUG)
logging.basicConfig(
    format="%(levelname)s | %(name)s | %(message)s",
    handlers=[logging.StreamHandler()]
)

# Define custom DevCrew tools
@tool
def github_issue_triage(issue_number: int) -> str:
    """
    Execute GitHub Issue Triage Protocol (GH-1) for specified issue.

    This tool implements the complete GitHub workflow:
    1. Verify clean git environment (no uncommitted changes)
    2. Create or switch to feature branch: issue_{issue_number}
    3. Fetch issue details using GitHub CLI
    4. Read architectural documentation from /docs/architecture
    5. Create implementation plan in /docs/plans/issue_{issue_number}_plan.md
    6. Comment progress to GitHub issue

    The tool ensures proper git workflow management and documentation.

    Args:
        issue_number (int): The GitHub issue number to process

    Returns:
        str: Status message with plan location and next steps
    """
    import subprocess

    try:
        # Check git status
        status = subprocess.run(
            ["git", "status", "--porcelain"],
            capture_output=True,
            text=True
        )

        if status.stdout.strip():
            return f"Error: Uncommitted changes detected. Commit or stash before proceeding."

        # Create feature branch
        branch_name = f"issue_{issue_number}"
        subprocess.run(
            ["git", "checkout", "-b", branch_name],
            capture_output=True
        )

        # Fetch issue details
        issue_result = subprocess.run(
            ["gh", "issue", "view", str(issue_number), "--json", "title,body"],
            capture_output=True,
            text=True
        )

        # Comment on issue
        subprocess.run(
            ["gh", "issue", "comment", str(issue_number), 
             "--body", f"Starting work on issue #{issue_number}. Feature branch created: {branch_name}"],
            capture_output=True
        )

        return f"Successfully triaged issue #{issue_number}. Branch {branch_name} created. Ready for implementation."

    except Exception as e:
        return f"Error in GitHub triage protocol: {str(e)}"

@tool
def tdd_cycle(test_file: str, implementation_file: str, issue_number: int) -> str:
    """
    Execute Test-Driven Development Protocol (P-TDD) cycle.

    Implements the complete RED-GREEN-REFACTOR cycle:

    RED Phase:
    1. Read test specifications from test_file
    2. Run tests to verify they FAIL (expected behavior)
    3. Document failed test results

    GREEN Phase:
    4. Implement minimal code to pass ONE test
    5. Run tests to verify that test now passes
    6. Repeat until all tests pass

    REFACTOR Phase:
    7. Improve code quality while maintaining green tests
    8. Remove duplication, improve naming
    9. Run tests after each refactor

    This tool enforces strict TDD discipline and maintains 100% test coverage.

    Args:
        test_file (str): Path to test file containing test specifications
        implementation_file (str): Path to implementation file
        issue_number (int): GitHub issue number for tracking

    Returns:
        str: TDD cycle status with test results and coverage metrics
    """
    import subprocess

    try:
        # RED Phase: Run tests to verify failures
        test_result = subprocess.run(
            ["pytest", test_file, "-v"],
            capture_output=True,
            text=True
        )

        if test_result.returncode == 0:
            return "Warning: Tests are already passing. TDD requires failing tests first (RED phase)."

        # Run tests again after implementation
        final_result = subprocess.run(
            ["pytest", test_file, "-v", "--cov=" + implementation_file, "--cov-report=term"],
            capture_output=True,
            text=True
        )

        # Comment to GitHub
        comment = f"""
        TDD Cycle Complete for issue #{issue_number}:
        - Test file: {test_file}
        - Implementation: {implementation_file}
        - Coverage: See test output
        """

        subprocess.run(
            ["gh", "issue", "comment", str(issue_number), "--body", comment],
            capture_output=True
        )

        return f"TDD cycle executed. Tests: {final_result.stdout}"

    except Exception as e:
        return f"Error in TDD cycle: {str(e)}"

@tool
def code_review_check(file_path: str, standards_path: str = "/docs/guides/coding_standards.md") -> str:
    """
    Perform comprehensive code review following DevCrew quality standards.

    Review dimensions:
    1. Style & Standards: Verify adherence to coding standards
    2. Security: Check for OWASP Top 10 vulnerabilities
    3. Performance: Identify inefficient algorithms
    4. Testing: Validate test coverage
    5. Documentation: Assess code comments and docs
    6. Maintainability: Evaluate complexity and coupling

    Uses static analysis tools and pattern matching to provide
    actionable feedback with severity levels.

    Args:
        file_path (str): Path to file for review
        standards_path (str): Path to coding standards document

    Returns:
        str: Code review report with findings by category and severity
    """
    import subprocess

    try:
        # Read the file
        with open(file_path, 'r') as f:
            code_content = f.read()

        # Run static analysis (example with pylint for Python)
        pylint_result = subprocess.run(
            ["pylint", file_path],
            capture_output=True,
            text=True
        )

        # Security scan (example with bandit)
        bandit_result = subprocess.run(
            ["bandit", "-r", file_path],
            capture_output=True,
            text=True
        )

        review_report = f"""
        Code Review Report for {file_path}:

        === Static Analysis ===
        {pylint_result.stdout}

        === Security Scan ===
        {bandit_result.stdout}

        === Assessment ===
        Review the findings above and address issues by severity:
        - Critical/High: Must fix before merge
        - Medium: Should fix
        - Low: Consider addressing
        """

        return review_report

    except Exception as e:
        return f"Error in code review: {str(e)}"

# Create Backend Engineer Agent
backend_engineer = Agent(
    name="Backend-Engineer-vSEP25",
    system_prompt="""
    You are Backend-Engineer-vSEP25, a disciplined server-side software engineer 
    specializing in Test-Driven Development and API implementation.

    ## Core Identity & Mandate
    You write, test, and maintain server-side code, business logic, and APIs, 
    adhering strictly to architectural specifications and employing rigorous TDD methodology.

    ## Primary Responsibilities
    - **TDD Implementation**: Follow strict Test-Driven Development cycles (RED-GREEN-REFACTOR)
    - **API Development**: Build RESTful/GraphQL APIs per specifications
    - **Database Interaction**: Write queries, migrations, and data access logic
    - **Quality Assurance**: Maintain 100% test coverage for all new code

    ## Operational Protocols

    ### GitHub Issue Triage Protocol (GH-1)
    When working with GitHub issues:
    1. Use the github_issue_triage tool to set up proper git workflow
    2. Ensure clean git environment before starting
    3. Create feature branch: issue_{number}
    4. Read documentation from /docs/architecture
    5. Create implementation plan
    6. Comment progress to GitHub issue

    ### Test-Driven Development Protocol (P-TDD)
    For all code implementation:
    1. Start with RED phase - write failing tests first
    2. Use tdd_cycle tool to execute complete cycle
    3. Implement minimal code for GREEN phase
    4. Refactor while maintaining green tests
    5. Verify 100% code coverage
    6. Document results in GitHub

    ### Failure Recovery Protocol (P-RECOVERY)
    On encountering failures:
    1. Use version control as transactional workspace
    2. Create isolated branch for risky operations
    3. Make granular commits as checkpoints
    4. Merge on success, rollback on failure
    5. Escalate persistent failures to humans

    ## Guiding Principles
    - **KISS**: Keep solutions simple and straightforward
    - **DRY**: Avoid code duplication
    - **Secure by Design**: Security is inherent, not an afterthought

    ## Constraints
    - ALL code MUST have corresponding passing tests (100% coverage)
    - NO commits to protected branches (main, master, production)
    - NO handling of raw secrets (use environment variables or secrets manager)
    - Follow coding standards in /docs/guides/coding_standards.md

    Your persona is disciplined, logical, and detail-oriented. You communicate
    through clean, well-documented, highly tested code. When you encounter
    persistent issues, document them comprehensively and escalate to human oversight.
    """,
    tools=[
        github_issue_triage,
        tdd_cycle,
        code_review_check,
        file_read,
        file_write,
        shell,
        calculator
    ]
)

# Example usage
if __name__ == "__main__":
    # Ask the agent to work on a GitHub issue
    result = backend_engineer("""
    Please work on GitHub issue #42. 
    - Triage the issue and create proper git workflow
    - Review the requirements
    - Create implementation plan following TDD protocol
    """)

    print(result.message)
```

#### Code Reviewer Agent Implementation

```python
# Create specialized Code Reviewer Agent
from strands import Agent, tool
from strands_tools import file_read

code_reviewer = Agent(
    name="Code-Reviewer-vSEP25",
    system_prompt="""
    You are Code-Reviewer-vSEP25, an adaptive quality assurance expert with 
    comprehensive knowledge of coding standards, security vulnerabilities, 
    and best practices across multiple languages and frameworks.

    ## Core Identity & Mandate
    Perform intelligent, context-aware code reviews ensuring adherence to 
    quality standards, security best practices, and regulatory compliance 
    while continuously learning from team feedback.

    ## Review Process
    Your review process is systematic and covers:

    1. **Style & Standards**: Enforce consistent coding patterns
    2. **Security Analysis**: Identify vulnerabilities and insecure practices
    3. **Performance**: Flag inefficient algorithms and operations
    4. **Maintainability**: Assess code complexity and documentation
    5. **Testing**: Validate test coverage and quality

    ## Review Guidelines
    - Provide actionable, constructive feedback
    - Include specific examples and suggested fixes
    - Assign severity levels: Critical, High, Medium, Low
    - Context-aware: Consider project phase and deadlines
    - Learn from feedback: Adapt standards to project needs

    ## Non-Negotiable Requirements
    - Security vulnerabilities must be flagged immediately
    - Compliance requirements cannot be bypassed
    - Test coverage must meet minimum thresholds

    Your persona is thorough, helpful, and focused on continuous improvement.
    You believe in elevating code quality through education and constructive feedback.
    """,
    tools=[
        code_review_check,
        file_read
    ]
)
```

## Advanced Multi-Agent Orchestration

Strands 1.0 introduces four intuitive patterns for multi-agent orchestration. Here's how to implement DevCrew's multi-agent workflows:

### 1. Agents-as-Tools (Hierarchical Delegation)

Transform specialized agents into tools that orchestrator agents can call. This mirrors DevCrew's architecture where a technical lead delegates to specialists.

```python
from strands import Agent, tool
from strands_tools import calculator, file_write, python_repl

# Create specialized agents
backend_engineer_specialist = Agent(
    name="Backend Engineer Specialist",
    system_prompt="""
    You are a backend engineering specialist focused on server-side implementation,
    API development, and database design. You follow TDD principles strictly.
    """,
    tools=[file_write, python_repl, calculator]
)

code_reviewer_specialist = Agent(
    name="Code Review Specialist",
    system_prompt="""
    You are a code review specialist focused on quality, security, and maintainability.
    You provide constructive feedback with actionable recommendations.
    """,
    tools=[file_read, code_review_check]
)

qa_tester_specialist = Agent(
    name="QA Testing Specialist",
    system_prompt="""
    You are a QA specialist focused on test design, coverage analysis, and quality gates.
    You ensure all code meets testing standards before release.
    """,
    tools=[tdd_cycle, python_repl]
)

# Convert specialist agents into tools
@tool
def backend_engineer(task: str) -> str:
    """
    Delegate backend engineering tasks to the backend specialist.
    Use for: API implementation, database design, server-side logic.

    Args:
        task (str): Detailed task description for backend work

    Returns:
        str: Backend specialist's response with implementation details
    """
    response = backend_engineer_specialist(task)
    return str(response)

@tool
def code_reviewer(code_path: str, context: str = "") -> str:
    """
    Delegate code review to the review specialist.
    Use for: Quality assessment, security analysis, maintainability review.

    Args:
        code_path (str): Path to code for review
        context (str): Additional context about the code

    Returns:
        str: Code review report with findings and recommendations
    """
    task = f"Review the code at {code_path}. Context: {context}"
    response = code_reviewer_specialist(task)
    return str(response)

@tool
def qa_tester(test_strategy: str) -> str:
    """
    Delegate testing tasks to the QA specialist.
    Use for: Test design, coverage analysis, quality validation.

    Args:
        test_strategy (str): Description of testing requirements

    Returns:
        str: QA specialist's testing plan and results
    """
    response = qa_tester_specialist(test_strategy)
    return str(response)

# Create orchestrator agent (Technical Lead)
technical_lead = Agent(
    name="Technical-Lead",
    system_prompt="""
    You are a Technical Lead coordinating a development team.
    You don't implement code yourself - you delegate to specialists:

    - backend_engineer: For API and server-side implementation
    - code_reviewer: For quality and security reviews
    - qa_tester: For test design and validation

    Your job is to:
    1. Break down complex tasks into specialist assignments
    2. Coordinate work between specialists
    3. Ensure quality standards are met
    4. Report progress and final results

    Always delegate appropriately based on the task type.
    """,
    tools=[backend_engineer, code_reviewer, qa_tester]
)

# Example: Complex task delegation
result = technical_lead("""
We need to implement a new user authentication API endpoint.
Please coordinate the team to:
1. Implement the backend API
2. Review the code for security
3. Create comprehensive tests

GitHub issue: #42
""")
```

### 2. Handoffs (Sequential Workflow)

Agents can hand off control to each other for sequential workflows, similar to an assembly line.

```python
from strands import Agent
from strands.multiagent import handoff

# Handoff pattern for DevCrew sequential workflow
result = backend_engineer(
    "Implement login API for issue #42",
    handoffs=[
        handoff(
            agent=code_reviewer,
            description="Review the implementation for quality and security"
        ),
        handoff(
            agent=qa_tester,
            description="Create and execute test suite"
        )
    ]
)
```

### 3. Swarms (Parallel Collaboration)

Multiple agents work in parallel, then results are synthesized. Useful for research or analysis tasks.

```python
from strands.multiagent import Swarm

# Create a research swarm for architectural decisions
architecture_swarm = Swarm(
    agents=[
        Agent(
            name="Security Architect",
            system_prompt="Focus on security implications and best practices"
        ),
        Agent(
            name="Performance Architect", 
            system_prompt="Focus on scalability and performance optimization"
        ),
        Agent(
            name="Maintainability Architect",
            system_prompt="Focus on code maintainability and developer experience"
        )
    ]
)

# Query the swarm
result = architecture_swarm("Evaluate microservices vs monolithic architecture for our e-commerce platform")
```

### 4. Graphs (Complex Workflows)

Deterministic graph-based orchestration for complex conditional workflows.

```python
from strands.multiagent import Graph

# Create workflow graph for DevCrew
devcrew_graph = Graph()

# Add agents as nodes
devcrew_graph.add_node("triage", backend_engineer)
devcrew_graph.add_node("implement", backend_engineer)
devcrew_graph.add_node("review", code_reviewer)
devcrew_graph.add_node("test", qa_tester)

# Define workflow edges with conditions
devcrew_graph.add_edge("triage", "implement")
devcrew_graph.add_edge("implement", "review")

# Conditional routing based on review results
devcrew_graph.add_conditional_edge(
    "review",
    lambda result: "implement" if "Changes Requested" in result else "test"
)

# Execute workflow
result = devcrew_graph.execute("Work on issue #42")
```

## Tool Development Best Practices

### Effective Tool Descriptions

Strands agents rely heavily on tool descriptions. Well-crafted descriptions significantly improve tool usage accuracy.

**A good tool description should:**
- Clearly explain purpose and functionality
- Specify when the tool should be used
- Detail parameters and their formats
- Describe expected output format
- Note limitations or constraints
- Provide usage examples

**Example of well-described DevCrew tool:**

```python
@tool
def github_protocol_executor(
    issue_number: int, 
    protocol: str, 
    action: str, 
    message: str = ""
) -> str:
    """
    Execute DevCrew GitHub protocols for issue management and workflow automation.

    This tool implements standardized GitHub workflows for the DevCrew framework,
    ensuring consistent issue tracking, branch management, and team communication.
    Use this tool whenever you need to interact with GitHub issues or manage
    git workflow for DevCrew development processes.

    Supported Protocols:
    - GH-1: GitHub Issue Triage (branch creation, issue analysis, planning)
    - GH-2: Pull Request Management (PR creation, review requests, merging)
    - GH-3: Issue Commenting (progress updates, completion notifications)

    The tool enforces DevCrew's git workflow standards:
    - Feature branches named: issue_{number}
    - Conventional commit messages
    - Required code reviews before merging
    - Automatic issue linking

    Example Usage Scenarios:
    - Starting work on issue: protocol='GH-1', action='start_work'
    - Updating progress: protocol='GH-3', action='comment', message='Implementation 50% complete'
    - Creating PR: protocol='GH-2', action='create_pr'

    Tool Limitations:
    - Requires GitHub CLI (gh) installed and authenticated
    - Requires git repository with remote origin
    - Does not handle merge conflicts (escalates to human)
    - Rate limited by GitHub API (5000 requests/hour)

    Args:
        issue_number (int): GitHub issue number (positive integer, e.g., 42)
            The issue must exist in the repository
        protocol (str): DevCrew protocol identifier (GH-1, GH-2, or GH-3)
            Determines which workflow to execute
        action (str): Specific action within protocol
            For GH-1: 'start_work', 'create_plan', 'fetch_requirements'
            For GH-2: 'create_pr', 'request_review', 'merge'
            For GH-3: 'comment', 'close', 'reopen'
        message (str, optional): Message text for comments or PR descriptions
            Required for 'comment' and 'create_pr' actions
            Supports markdown formatting

    Returns:
        str: Execution status with details
            Success: "Protocol {protocol} executed successfully. {details}"
            Error: "Protocol execution failed: {error_message}"

    Example return:
        "Protocol GH-1 executed successfully. Created branch issue_42, 
        fetched requirements, created implementation plan at 
        /docs/plans/issue_42_plan.md"
    """
    # Implementation here
    pass
```

### Auto-Loading Tools

Tools in `./tools/` directory can be automatically loaded and reloaded during development:

```python
from strands import Agent

# Auto-load tools from ./tools/ directory (default behavior)
agent = Agent(
    name="DevCrew Agent",
    load_tools_from_directory=True  # Default is True
)

# For production, disable auto-loading for stability
production_agent = Agent(
    name="Production Agent",
    load_tools_from_directory=False,
    tools=[github_protocol_executor, tdd_cycle, code_review_check]  # Explicit list
)
```

## Model Configuration

### Using Different Models

Strands supports multiple model providers. Default is Amazon Bedrock with Claude 3.7 Sonnet.

**String Model ID (Simplest):**
```python
from strands import Agent

agent = Agent(
    model="us.anthropic.claude-3-7-sonnet-20250219-v1:0"
)

# Check configured model
print(agent.model.config)
# {'model_id': 'us.anthropic.claude-3-7-sonnet-20250219-v1:0'}
```

**Explicit Model Configuration:**
```python
from strands import Agent
from strands.models import BedrockModel

# Configure model with specific settings
bedrock_model = BedrockModel(
    model_id="us.anthropic.claude-3-7-sonnet-20250219-v1:0",
    region_name='us-west-2',
    temperature=0.3,  # Lower for consistency in code generation
    max_tokens=4096
)

agent = Agent(
    name="Backend Engineer",
    model=bedrock_model,
    system_prompt="..."
)
```

### Model Provider Options

**Amazon Bedrock (Default):**
```python
from strands.models import BedrockModel

model = BedrockModel(
    model_id="us.amazon.nova-premier-v1:0",  # Or Claude, Llama, etc.
    region_name="us-west-2"
)
```

**Anthropic Direct:**
```python
from strands.models import AnthropicModel

model = AnthropicModel(
    model_id="claude-3-7-sonnet-20250219",
    api_key="your-api-key"  # Or use ANTHROPIC_API_KEY env var
)
```

**OpenAI:**
```python
from strands.models import OpenAIModel

model = OpenAIModel(
    model_id="gpt-4o",
    api_key="your-api-key"  # Or use OPENAI_API_KEY env var
)
```

**Ollama (Local):**
```python
from strands.models import OllamaModel

model = OllamaModel(
    model_id="llama3.2",
    base_url="http://localhost:11434"
)
```

### DevCrew Agent-Specific Models

Different DevCrew agents can use different models based on complexity:

```python
# Backend Engineer - Complex reasoning for implementation
backend_engineer = Agent(
    name="Backend-Engineer-vSEP25",
    model=BedrockModel(
        model_id="us.anthropic.claude-3-7-sonnet-20250219-v1:0",
        temperature=0.2  # Low temperature for consistency
    ),
    system_prompt="...",
    tools=[...]
)

# Code Reviewer - Efficient model for pattern matching
code_reviewer = Agent(
    name="Code-Reviewer-vSEP25",
    model=BedrockModel(
        model_id="us.amazon.nova-pro-v1:0",  # Faster, efficient
        temperature=0.3
    ),
    system_prompt="...",
    tools=[...]
)

# QA Tester - Balance of capability and speed
qa_tester = Agent(
    name="QA-Tester-vSEP25",
    model=BedrockModel(
        model_id="us.anthropic.claude-3-haiku-20250307-v1:0",  # Fast for testing
        temperature=0.1
    ),
    system_prompt="...",
    tools=[...]
)
```

## Observability and Debugging

### Debug Logging

Enable detailed logging for development:

```python
import logging
from strands import Agent

# Enable Strands debug logs
logging.getLogger("strands").setLevel(logging.DEBUG)

logging.basicConfig(
    format="%(levelname)s | %(name)s | %(message)s",
    handlers=[logging.StreamHandler()]
)

agent = Agent(name="DevCrew Agent")
agent("What is the status of issue #42?")
```

### Callback Handlers for Custom Logging

Capture agent events for custom logging or monitoring:

```python
from strands import Agent

tool_use_ids = []

def devcrew_callback(**kwargs):
    """Custom callback for DevCrew agent monitoring"""
    if "data" in kwargs:
        # Log streamed response data
        print(kwargs["data"], end="", flush=True)

    elif "current_tool_use" in kwargs:
        tool = kwargs["current_tool_use"]
        if tool["toolUseId"] not in tool_use_ids:
            # Log tool invocation
            print(f"\n[Tool: {tool.get('name')}]")
            print(f"[Input: {tool.get('input')}]")
            tool_use_ids.append(tool["toolUseId"])

    elif "tool_result" in kwargs:
        result = kwargs["tool_result"]
        # Log tool results
        print(f"[Result: {result.get('content')}]")

agent = Agent(
    name="Backend Engineer",
    callback_handler=devcrew_callback,
    tools=[...]
)
```

### Async Streaming for Web Applications

For web frameworks like FastAPI or Django:

```python
import asyncio
from strands import Agent

agent = Agent(
    name="Backend Engineer",
    callback_handler=None  # Disable default handler
)

async def stream_agent_response(query: str):
    """Stream agent response asynchronously"""
    agent_stream = agent.stream_async(query)

    async for event in agent_stream:
        if "data" in event:
            # Yield text chunks for SSE or WebSocket
            yield {"type": "text", "content": event["data"]}

        elif "current_tool_use" in event:
            tool = event["current_tool_use"]
            if tool.get("name"):
                yield {"type": "tool", "name": tool["name"]}

        elif "tool_result" in event:
            result = event["tool_result"]
            yield {"type": "result", "content": result}

# Usage in FastAPI
from fastapi import FastAPI
from fastapi.responses import StreamingResponse

app = FastAPI()

@app.get("/agent/stream")
async def agent_stream_endpoint(query: str):
    return StreamingResponse(
        stream_agent_response(query),
        media_type="text/event-stream"
    )
```

## Production Deployment

### Architecture Patterns

Strands supports multiple production architectures. Here are recommended patterns for DevCrew:

#### 1. Monolithic Architecture (Simple)

Agent and tools run in same environment. Good for getting started quickly.

```python
# Single deployment unit
from strands import Agent

agent = Agent(
    name="DevCrew Agent",
    tools=[github_protocol_executor, tdd_cycle, code_review_check]
)

# Deploy to single Lambda function, EC2 instance, or Fargate container
```

**Pros**: Simple deployment, low latency
**Cons**: All tools share same environment, scaling limitations

#### 2. Microservices Architecture (Recommended)

Agent and tools deployed as separate services. Better isolation and scaling.

```
┌──────────────┐
│   API GW     │
└──────┬───────┘
       │
┌──────▼───────────┐
│  Agent Service   │ (Fargate/Lambda)
│  (Strands Loop)  │
└──────┬───────────┘
       │
       ├─────► Tool: GitHub Protocol (Lambda)
       ├─────► Tool: TDD Workflow (Lambda)
       └─────► Tool: Code Review (Fargate)
```

**Implementation:**
```python
# agent_service.py
from strands import Agent, tool
import httpx

@tool
async def github_protocol(issue_number: int, action: str) -> str:
    """Call GitHub protocol microservice"""
    async with httpx.AsyncClient() as client:
        response = await client.post(
            "https://api.devcrew.com/tools/github",
            json={"issue_number": issue_number, "action": action}
        )
        return response.json()["result"]

agent = Agent(tools=[github_protocol, ...])
```

**Pros**: Better isolation, independent scaling, security boundaries
**Cons**: Network latency, more complex deployment

#### 3. Return-of-Control Architecture

Client executes some tools locally (e.g., file operations), while agent runs remotely.

```
┌──────────────┐
│   Client     │ ◄─── Local tools (file ops, git)
└──────┬───────┘
       │
┌──────▼───────────┐
│  Agent Service   │ ◄─── Remote tools (APIs, ML models)
└──────────────────┘
```

**Pros**: Sensitive operations stay local, flexible security model
**Cons**: Client-server coordination complexity

### Deployment to AWS Services

#### AWS Lambda Deployment

**Best for**: Event-driven agents, API endpoints, scheduled tasks

```python
# lambda_handler.py
from strands import Agent

# Initialize agent outside handler for reuse
agent = Agent(
    name="DevCrew Agent",
    model="us.anthropic.claude-3-7-sonnet-20250219-v1:0",
    tools=[...]
)

def lambda_handler(event, context):
    """AWS Lambda handler for DevCrew agent"""
    user_query = event.get('query', '')

    # Invoke agent
    response = agent(user_query)

    return {
        'statusCode': 200,
        'body': response.message
    }
```

**Deployment:**
```bash
# Package dependencies
pip install -t package/ strands-agents strands-agents-tools

# Copy code
cp lambda_handler.py package/

# Create deployment package
cd package && zip -r ../lambda-deployment.zip .

# Deploy to Lambda
aws lambda create-function \
    --function-name devcrew-agent \
    --runtime python3.11 \
    --handler lambda_handler.lambda_handler \
    --zip-file fileb://lambda-deployment.zip \
    --role arn:aws:iam::ACCOUNT:role/lambda-bedrock-role \
    --timeout 300 \
    --memory-size 1024
```

#### Amazon ECS Fargate Deployment

**Best for**: Long-running agents, complex workflows, resource-intensive tasks

```dockerfile
# Dockerfile
FROM python:3.11-slim

WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application
COPY devcrew_agents/ ./devcrew_agents/
COPY tools/ ./tools/

# Set environment
ENV PYTHONUNBUFFERED=1

# Run agent service
CMD ["python", "-m", "devcrew_agents.agent"]
```

**Deploy to ECS:**
```bash
# Build and push image
docker build -t devcrew-agent .
aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin ACCOUNT.dkr.ecr.us-west-2.amazonaws.com
docker tag devcrew-agent:latest ACCOUNT.dkr.ecr.us-west-2.amazonaws.com/devcrew-agent:latest
docker push ACCOUNT.dkr.ecr.us-west-2.amazonaws.com/devcrew-agent:latest

# Create ECS task definition and service (use AWS Console or CloudFormation)
```

#### Amazon EC2 Deployment

**Best for**: Maximum control, GPU requirements, specialized hardware

```bash
# SSH into EC2 instance
ssh -i key.pem ec2-user@instance-ip

# Install Python and dependencies
sudo yum install python3.11 -y
python3.11 -m venv .venv
source .venv/bin/activate
pip install strands-agents strands-agents-tools

# Clone DevCrew repository
git clone https://github.com/your-org/devcrew-agents.git
cd devcrew-agents

# Run agent service
python -m devcrew_agents.agent
```

### Production Configuration Best Practices

**Explicit Model Configuration:**
```python
from strands import Agent
from strands.models import BedrockModel

# Production agent with explicit configuration
production_agent = Agent(
    name="Backend-Engineer-Production",
    model=BedrockModel(
        model_id="us.anthropic.claude-3-7-sonnet-20250219-v1:0",
        region_name="us-west-2",
        temperature=0.2,  # Low for consistency
        max_tokens=4096
    ),
    tools=[...],  # Explicit tool list
    load_tools_from_directory=False  # Disable auto-loading
)
```

**Security Best Practices:**
- Store API keys in AWS Secrets Manager
- Use IAM roles for AWS service access
- Enable VPC for network isolation
- Implement input validation and sanitization
- Use AWS WAF for API protection
- Enable CloudTrail for audit logging

**Monitoring and Observability:**
```python
# Enable OpenTelemetry tracing
from opentelemetry import trace
from opentelemetry.exporter.otlp.proto.grpc.trace_exporter import OTLPSpanExporter
from opentelemetry.sdk.trace import TracerProvider
from opentelemetry.sdk.trace.export import BatchSpanProcessor

# Configure OTEL
trace.set_tracer_provider(TracerProvider())
span_processor = BatchSpanProcessor(OTLPSpanExporter())
trace.get_tracer_provider().add_span_processor(span_processor)

# Strands automatically emits OTEL traces
agent = Agent(name="DevCrew Agent", tools=[...])
```

**Cost Optimization:**
- Use Nova models for cost-effective tasks
- Implement caching for repeated queries
- Set appropriate max_tokens limits
- Use Lambda for intermittent workloads
- Monitor token usage with CloudWatch

## DevCrew Protocol Implementation Examples

### Complete GitHub Workflow

```python
from strands import Agent, tool
import subprocess

@tool
def complete_github_workflow(issue_number: int) -> str:
    """
    Execute complete DevCrew GitHub workflow for issue resolution.

    Workflow Steps:
    1. Triage issue and create feature branch
    2. Implement solution using TDD
    3. Run code review
    4. Create pull request
    5. Update issue with results

    Args:
        issue_number (int): GitHub issue to process

    Returns:
        str: Workflow completion status
    """
    try:
        # Step 1: Triage
        subprocess.run(["git", "checkout", "-b", f"issue_{issue_number}"])
        issue_data = subprocess.run(
            ["gh", "issue", "view", str(issue_number), "--json", "title,body"],
            capture_output=True, text=True
        )

        # Step 2: Comment progress
        subprocess.run([
            "gh", "issue", "comment", str(issue_number),
            "--body", f"Starting work on issue #{issue_number}"
        ])

        # Step 3: Implementation (delegated to agent)
        # ... implementation logic ...

        # Step 4: Create PR
        subprocess.run([
            "gh", "pr", "create",
            "--title", f"Fix #{issue_number}",
            "--body", f"Resolves #{issue_number}"
        ])

        return f"Workflow complete for issue #{issue_number}. PR created."
    except Exception as e:
        return f"Workflow error: {str(e)}"

# Create agent with complete workflow
devcrew_agent = Agent(
    name="DevCrew-Complete",
    system_prompt="""
    You coordinate complete development workflows.
    Use the complete_github_workflow tool to handle issues end-to-end.
    """,
    tools=[complete_github_workflow]
)
```

### Test-Driven Development Automation

```python
@tool
def automated_tdd_workflow(feature_description: str, test_file: str, impl_file: str) -> str:
    """
    Automate complete TDD workflow: test creation, implementation, validation.

    RED-GREEN-REFACTOR cycle with automated validation at each step.

    Args:
        feature_description (str): What to implement
        test_file (str): Path for test file
        impl_file (str): Path for implementation file

    Returns:
        str: TDD workflow results with coverage metrics
    """
    import subprocess

    # RED: Create failing tests
    # (Agent would generate test code here)

    # Verify tests fail
    result = subprocess.run(["pytest", test_file, "-v"], capture_output=True)
    if result.returncode == 0:
        return "Error: Tests must fail initially (RED phase)"

    # GREEN: Implement minimal code
    # (Agent would generate implementation here)

    # Verify tests pass
    result = subprocess.run(["pytest", test_file, "-v"], capture_output=True)
    if result.returncode != 0:
        return "Error: Tests still failing after implementation"

    # REFACTOR: Check coverage
    coverage = subprocess.run(
        ["pytest", test_file, f"--cov={impl_file}", "--cov-report=term"],
        capture_output=True, text=True
    )

    return f"TDD Complete. Coverage:\n{coverage.stdout}"
```

## Best Practices Summary

### Agent Design
1. **Clear System Prompts**: Comprehensive instructions with protocols and constraints
2. **Appropriate Models**: Use capable models for complex tasks, efficient models for simple tasks
3. **Tool Selection**: Provide only necessary tools, avoid capability drift
4. **Production Config**: Explicit configuration, disable auto-loading in production

### Tool Development
1. **Descriptive Documentation**: Detailed docstrings with examples and limitations
2. **Error Handling**: Robust error handling with informative messages
3. **Validation**: Input validation and sanitization
4. **Idempotency**: Tools should be safe to retry

### Multi-Agent Orchestration
1. **Agents-as-Tools**: For hierarchical delegation and specialist consultation
2. **Handoffs**: For sequential workflows with clear transitions
3. **Swarms**: For parallel research or analysis tasks
4. **Graphs**: For complex conditional workflows

### Security
1. **Secrets Management**: Use AWS Secrets Manager, never hardcode
2. **IAM Roles**: Use IAM roles instead of access keys when possible
3. **Input Validation**: Validate all inputs before processing
4. **Network Isolation**: Use VPC for sensitive workloads
5. **Audit Logging**: Enable CloudTrail and CloudWatch Logs

### Cost Optimization
1. **Model Selection**: Use Nova for cost-effective tasks, Claude for complex reasoning
2. **Token Limits**: Set appropriate max_tokens for each agent
3. **Caching**: Implement caching for repeated queries
4. **Serverless**: Use Lambda for intermittent workloads

## Conclusion

DevCrew specifications provide comprehensive frameworks for autonomous development teams across various domains. AWS Strands Agents offers a production-ready platform for implementing these specifications through:

- **Model-Driven Architecture**: LLM autonomously handles planning and tool usage
- **Code-First Simplicity**: Create agents in just a few lines of Python
- **Multi-Agent Orchestration**: Four intuitive patterns (Agents-as-Tools, Handoffs, Swarms, Graphs)
- **AWS Integration**: Seamless connection to Bedrock, Lambda, and other AWS services
- **Production-Ready**: Comprehensive observability, tracing, and deployment options

The mapping from DevCrew specifications to Strands implementation is straightforward:
- **Agent roles and personas** → System prompts with protocols and constraints
- **Protocols and workflows** → Custom tools and multi-agent patterns
- **Tool requirements** → Tool implementations with descriptive documentation
- **Quality gates** → Tool validation and error handling

Start with simple single-agent implementations, progressively enhance with multi-agent patterns, and deploy to production using AWS services. The result is a production-grade AI development team maintaining human oversight while maximizing automation efficiency.

## Additional Resources

- **Strands Documentation**: https://strandsagents.com/latest/documentation/
- **Strands GitHub**: https://github.com/strands-agents/sdk-python
- **AWS Blog - Introducing Strands**: https://aws.amazon.com/blogs/opensource/introducing-strands-agents-an-open-source-ai-agents-sdk/
- **AWS Blog - Multi-Agent Orchestration**: https://aws.amazon.com/blogs/devops/multi-agent-collaboration-with-strands/
- **AWS Prescriptive Guidance**: https://docs.aws.amazon.com/prescriptive-guidance/latest/agentic-ai-frameworks/strands-agents.html
- **DevCrew Specifications**: Reference Backend-Engineer-vSEP25 and Code-Reviewer-vSEP25 documents
