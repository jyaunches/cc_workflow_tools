#!/bin/bash
# Check if project has been initialized for cc_workflow_tools

if [ ! -f ".claude/PATTERNS.md" ]; then
    echo "cc_workflow_tools: PATTERNS.md not found - run /cc_workflow_tools:init for enhanced workflow features"
fi
