---
name: add-doc
description: Create documentation in local docs/ or shared docs accessible to all repositories
usage: /add-doc <local|shared> "<description_of_documentation>"
example:
  - /add-doc local "API endpoint documentation for weather service authentication"
  - /add-doc shared "Common database schema patterns across benz ecosystem"
---

# Create Documentation: $ARGUMENTS

Creating documentation based on the specified scope and description.

## Documentation Scope

The first argument determines where documentation will be created:
- **local**: Creates documentation in the current repository's `docs/` directory
- **shared**: Creates documentation in the benz_mgmt `shared_docs/` directory, accessible to all repositories via symlink

## Implementation Process

1. **Parse Arguments**: Extract scope (local/shared) and description from command arguments
2. **Validate Scope**: Ensure first argument is either "local" or "shared" 
3. **Generate Filename**: Create descriptive filename from the documentation description
4. **Determine Target Path**: 
   - Local: `./docs/[generated_filename].md`
   - Shared: `../benz_mgmt/shared_docs/[generated_filename].md` (or current repo if already in benz_mgmt)
5. **Create Documentation**: Generate comprehensive documentation content based on the description
6. **Verify Structure**: Ensure target directory exists, create if needed

## Documentation Standards

All documentation should include:
- Clear title and purpose statement
- Table of contents for longer documents
- Code examples where applicable (following repository patterns)
- Integration notes with existing systems
- Maintenance and update guidelines

## File Naming Convention

Generated filenames follow the pattern: `YYYY-MM-DD_descriptive-name.md`
- Date prefix ensures chronological ordering
- Descriptive name derived from the provided description
- Kebab-case formatting for consistency

Ready to create documentation with scope and description: **$ARGUMENTS**