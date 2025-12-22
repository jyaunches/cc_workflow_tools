---
name: track-learning
description: Capture a learning from development work and evaluate its applicability to shared documentation
usage: /track-learning "<learning_summary>" [additional context...]
example:
  - /track-learning "Discovered that uv sync --frozen-lockfile prevents dependency drift in CI builds"
  - /track-learning "Found that testcontainers requires explicit network cleanup in pytest fixtures" This was discovered while debugging flaky tests in benz_analyzer where containers weren't being properly torn down between test runs.
  - /track-learning "Learned that Fly.io apps need explicit health checks for zero-downtime deployments" Without health checks, Fly deploys new instances before old ones finish processing, causing request drops.
---

# Track Learning: $ARGUMENTS

Capturing and evaluating a learning from the current repository for potential ecosystem-wide application.

## Process Overview

This command performs two key functions:
1. **Capture**: Records the learning in `learnings.md` with date, source repository, summary, and session context
2. **Evaluate**: Reviews if the learning should be applied to shared documentation or project templates

## Context Gathering

The command will incorporate:
- **Command Arguments**: The primary learning summary (required)
- **Additional Content**: Any text following the command provides extra context
- **Session Context**: Current Claude conversation history including:
  - Files recently read or modified
  - Commands executed
  - Problems encountered and solutions found
  - Code patterns discovered
  - Error messages and resolutions

## Implementation Steps

### Phase 1: Capture Learning with Context

1. **Extract Learning Components**:
   - Primary learning summary from quoted argument
   - Additional context provided after the command
   - Current repository name (from working directory path)
   - Current date (YYYY-MM-DD format)

2. **Analyze Session Context**:
   - Review recent file operations (Read, Edit, Write tools used)
   - Identify relevant code snippets or patterns discussed
   - Capture any error messages and their resolutions
   - Note testing approaches or debugging steps taken
   - Extract configuration changes or setup modifications

3. **Update Learnings File**:
   - Append to `/Users/jyaunches/Development/benzbout/benz_mgmt/learnings.md`
   - Include comprehensive context from the session
   - Add code examples, configuration snippets, or command sequences

### Phase 2: Evaluate Applicability

1. **Analyze Learning Type Based on Context**:
   - **Pattern/Best Practice**: Could benefit all repositories
   - **Tool/Library Usage**: Specific to technology stack
   - **Configuration/Setup**: Infrastructure or deployment related
   - **Bug Fix/Workaround**: Might prevent issues in other repos
   - **Testing Strategy**: Test patterns or fixtures
   - **Performance Optimization**: Efficiency improvements

2. **Review Target Documents**:
   - **shared_docs/**: Cross-repository documentation
     - Integration patterns
     - Deployment strategies
     - Common troubleshooting
     - Testing guidelines
   - **new-project/**: Project template files
     - PROJECT_SETUP.md for setup instructions
     - Configuration templates
     - Build system patterns
     - Initial test structures
   - **CLAUDE.md or CLAUDE.base.md**: AI assistant instructions
     - Development patterns
     - Common pitfalls to avoid
     - Testing approaches
     - Debugging strategies

3. **Generate Context-Aware Recommendations**:
   - Use session history to identify specific files that could benefit
   - Propose concrete additions based on actual code/commands from session
   - Include relevant code snippets or configurations from the current work
   - Explain why each location is relevant based on the problem solved

### Phase 3: User Confirmation

**PAUSE FOR USER REVIEW**

Present recommendations to user:
- Show the complete learning entry with full context
- List each recommended documentation update
- Display proposed content additions (including code/config from session)
- Explain the rationale for each location
- Ask for confirmation before proceeding with specific locations

Example presentation:
```
Based on the current session where we [describe work done], I recommend adding this learning to:

1. **shared_docs/deployment_patterns.md**
   - Reason: This pattern applies to all services using Fly.io
   - Proposed addition: [specific content with code examples]

2. **new-project/PROJECT_SETUP.md**
   - Reason: New projects should include this configuration from the start
   - Proposed addition: [setup instructions with examples]

Would you like me to proceed with these updates? You can approve all, select specific ones, or modify the proposals.
```

### Phase 4: Apply Updates

After user confirmation:
1. Update approved documentation locations
2. Include actual code snippets or commands from the session
3. Maintain consistent formatting with existing content
4. Add cross-references where appropriate
5. Confirm all updates completed

## Enhanced Learning Entry Format

```markdown
## YYYY-MM-DD - [repository_name]

**Learning**: [One-line summary]

**Context**: [Brief description including what was being worked on in the session]

**Session Work**: 
- Files modified: [list of files from session]
- Problem encountered: [specific issue faced]
- Solution found: [how it was resolved]

**Details**: 
[Expanded explanation with actual code examples, commands, or configuration snippets from the session]

```python
# Example code from session
def example_from_session():
    pass
```

**Related Commands/Configurations**:
```bash
# Commands that were successful
uv sync --frozen-lockfile
```

**Applied To**:
- [ ] shared_docs/[specific_file.md] - [reason based on session context]
- [ ] new-project/[specific_file] - [reason based on session context]
- [ ] CLAUDE.md - [reason based on session context]

**Session Reference**: [Key aspects of the Claude session that led to this learning]
```

## Documentation Update Criteria

Consider adding to:
- **shared_docs/** if learning applies to multiple repositories or represents a pattern discovered
- **new-project/** if it should be part of initial project setup based on issues encountered
- **CLAUDE.md** if it affects AI-assisted development patterns or common issues Claude should be aware of

The session context helps determine:
- Specific code patterns to document
- Exact error messages to watch for
- Precise configuration values that work
- Testing approaches that were successful
- Performance improvements discovered

## Execution Plan

I'll now capture and evaluate this learning. Let me start by analyzing the current session context and the learning provided.

### Step 1: Extracting Learning Information

First, I'll identify:
- The learning summary from the arguments
- Any additional context provided
- The current repository we're working in
- Today's date for the entry

### Step 2: Gathering Session Context

I'll review our current conversation to understand:
- What files we've been working with
- What problems we encountered
- What solutions we implemented
- Any relevant code patterns or configurations

### Step 3: Creating Learning Entry

I'll create a comprehensive learning entry in `/Users/jyaunches/Development/benzbout/benz_mgmt/learnings.md` with all the context gathered.

### Step 4: Evaluating Documentation Updates

I'll analyze where this learning should be applied:
- Reviewing shared_docs for relevant documentation
- Checking new-project templates
- Considering updates to CLAUDE.md instructions

### Step 5: User Confirmation

I'll present my recommendations for where to apply this learning and wait for your approval before making any documentation updates.

Let me begin by processing the learning: **$ARGUMENTS**