---
description: Post-feature deployment configuration audit
---

# Post-Feature Deployment Configuration Audit

Audit deployment configuration after implementing a feature to ensure GitHub workflows and deployment configs have necessary environment variables and settings.

**Note**: Documentation updates (README.md, CLAUDE.md) are handled by the "Clean the House" phase during `/implement-phase`. This command focuses solely on deployment configuration.

## Scope

Review deployment-related files:
- `.github/workflows/*.yml` - All GitHub Actions workflows
- Deployment configuration files (e.g., `fly.toml`, `render.yaml`, `railway.json`)
- Staging/production environment configs (if separate files exist)
- `Dockerfile` - Container build configuration
- `.env.example` - Environment variable template

## Audit Process

### 1. Environment Variables Check

- Compare `.env.example` with deployment workflows
- Identify new environment variables from recent code changes
- Verify all required variables are set in deployment workflows
- Check for hardcoded values that should be secrets

### 2. GitHub Workflow Analysis

For each workflow (`docker-publish.yml`, `deploy-fly.yml`, etc.):
- Are new secrets needed for recent features?
- Do build steps account for new dependencies?
- Are test commands updated for new test files?
- Do deployment steps set all necessary environment variables?

**Critical Dependency Check**:
- Check `pyproject.toml` for dependencies that require extras (e.g., `httpx[http2]`, `uvicorn[standard]`)
- Verify optional features used in code are included in main `dependencies` (not just `dev`)
- Common issue: Using `http2=True`, `h2=True`, or other optional features without installing the extra packages
- Example: If code uses `httpx.AsyncClient(http2=True)`, ensure `httpx[http2]` is in dependencies

### 3. Deployment Platform Configuration

- Does the deployment config include new environment variables?
- Are new internal service dependencies configured?
- Do health checks account for new endpoints?
- Are resource limits appropriate for new features?

### 4. Docker Configuration

- Does Dockerfile copy new configuration files?
- Are new system dependencies installed?
- Are new Python packages in requirements reflected?

## Output Format

```markdown
## Deployment Configuration Audit

### GitHub Workflows
**File**: `.github/workflows/[workflow-name].yml`

Issues:
- [ ] **Missing Secret**: `[SECRET_NAME]` needed for [feature]
- [ ] **Missing Env Var**: `[VAR_NAME]` not set in deployment step
- [ ] **Outdated Command**: [Description of command that needs update]

Recommendations:
1. Add to secrets sync section (lines X-Y):
   ```yaml
   [SECRET_NAME]="${{ secrets.[SECRET_NAME] }}" \
   ```

### Deployment Platform Configuration
**File**: Deployment config (e.g., `fly.toml`, `render.yaml`, etc.)

Issues:
- [ ] **Missing Env Var**: `[VAR_NAME]` should be in environment section
- [ ] **Missing Service Link**: New dependency on internal service

Recommendations:
1. Add to environment configuration:
   ```
   [VAR_NAME] = "[default_value]"
   ```

### Environment Template
**File**: `.env.example`

Issues:
- [ ] **Missing Variable**: `[VAR_NAME]` used in code but not documented
- [ ] **Outdated Comment**: [Description]

Recommendations:
1. Add new variables with documentation comments
```

## Gathering Context

Before starting the audit, I will:

1. Review recent git commits to understand what changed:
   ```bash
   git log --oneline -10
   git diff HEAD~5..HEAD --stat
   ```

2. Search for new environment variables in code:
   ```bash
   grep -r "os.getenv\|Settings\(\)" src/ --include="*.py"
   ```

3. Check for new service integrations:
   ```bash
   grep -r "httpx\|requests\|AsyncClient" src/ --include="*.py"
   ```

4. Check for optional dependency usage that needs extras in pyproject.toml:
   ```bash
   # Check for HTTP/2 usage
   grep -r "http2=True" src/ --include="*.py"

   # Check for other common optional features
   grep -r "h2=True\|websockets=True\|brotli=True" src/ --include="*.py"

   # Verify pyproject.toml has the extras
   grep "httpx\[" pyproject.toml
   ```

## Execution Plan

I will:

1. **Gather Context**: Review recent commits and code changes
2. **Audit Deployment**: Check all deployment configuration files
3. **Generate Report**: Provide comprehensive findings with specific recommendations
4. **Await Approval**: Present findings and wait for approval before making any changes

## Notes

- This command is **read-only by default** - it identifies issues but doesn't fix them
- After reviewing the report, you can ask me to implement specific recommendations
- Focus on practical, high-impact issues rather than minor formatting
- Prioritize deployment configuration issues as they can break production

---

Ready to perform deployment configuration audit.
