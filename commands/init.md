---
description: Initialize project with starter files for the workflow (PATTERNS.md, etc.)
---

# Initialize Project for Workflow Tools

Set up this project with the starter files needed for the cc_workflow_tools workflow.

## Check What's Missing

First, check which files already exist:

```bash
echo "=== Checking project setup ==="
[ -f ".claude/PATTERNS.md" ] && echo "PATTERNS.md: EXISTS" || echo "PATTERNS.md: MISSING"
[ -d "specs" ] && echo "specs/: EXISTS" || echo "specs/: MISSING"
```

## Create Missing Files

### 1. Create specs directory (if missing)

If the `specs/` directory doesn't exist, create it:

```bash
mkdir -p specs
```

### 2. Create PATTERNS.md (if missing)

If `.claude/PATTERNS.md` doesn't exist, create it with this starter template:

```markdown
# Project Patterns

This file defines coding patterns and conventions for this project. The workflow tools use this to decide which recommendations to auto-apply vs ask about.

## Language & Framework

- **Language**: [Python/TypeScript/Go/etc.]
- **Framework**: [FastAPI/Express/etc. or None]
- **Package Manager**: [uv/npm/etc.]

## Code Style

### Naming Conventions
- Functions: snake_case / camelCase
- Classes: PascalCase
- Constants: SCREAMING_SNAKE_CASE
- Files: snake_case / kebab-case

### Type Annotations
- [Required / Preferred / Optional]
- Use dataclasses for data structures: [Yes / No]

## Architecture Patterns

### Project Structure
```
src/
├── module_name/
│   ├── __init__.py
│   ├── models.py
│   └── services.py
└── tests/
```

### Dependency Injection
- [Constructor injection / Global singletons / etc.]

### Error Handling
- Use custom exceptions: [Yes / No]
- Error response format: [Describe]

## Testing Patterns

- Test framework: [pytest / jest / etc.]
- Test file naming: `test_*.py` / `*.test.ts`
- Use fixtures: [Yes / No]
- Integration tests use: [testcontainers / mocks / etc.]

## What to Auto-Apply

These changes align with our patterns and can be applied automatically:
- Adding type hints to function signatures
- Converting dicts to dataclasses
- Using context managers for resources
- Following existing module patterns

## What Needs Discussion

These changes need human review:
- Adding new dependencies
- Changing public API signatures
- Architectural restructuring
- Database schema changes
```

**Important**: Customize this template for your specific project. The more accurate your PATTERNS.md, the better the workflow can auto-apply safe changes.

## Summary

After running this command, you should have:
- `.claude/PATTERNS.md` - Customize this for your project's patterns
- `specs/` directory - Where feature specifications will be stored

The workflow commands (`/cc_workflow_tools:feature_wf:execute-workflow`, etc.) will now use PATTERNS.md to make smarter decisions about which recommendations to auto-apply.

**Next step**: Edit `.claude/PATTERNS.md` to match your project's actual patterns and conventions.
