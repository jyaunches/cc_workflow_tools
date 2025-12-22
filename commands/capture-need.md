# capture_need

Capture a need, idea, bug, or change that should be addressed in a future Claude Code session. This command creates a draft specification with context from the current conversation.

## Usage

```
/capture_need <name> '<description>'
```

## Arguments

- `name`: A short, descriptive identifier for the need (e.g., `fix_auth_flow`, `add_caching`, `refactor_api`)
- `description`: A quoted description of what needs to be done

## Examples

```
/capture_need improve_test_coverage 'Add missing unit tests for the weather forecast command'
/capture_need add_location_search 'Implement search functionality to find weather data by city name or coordinates'
/capture_need optimize_api_caching 'Weather API requests are slow when fetching data for multiple locations'
/capture_need add_historical_data 'Enable fetching historical weather data alongside current conditions'
/capture_need batch_forecast_requests 'Support fetching weather forecasts for multiple cities in a single command'
```

## Process

1. Captures the need with its name and description
2. Analyzes the current conversation context to understand:
   - What led to identifying this need
   - Related code or systems involved
   - Potential implementation approach
3. Creates a draft specification in `specs/drafts/` with:
   - Context from the current session
   - Problem statement
   - Initial implementation ideas
   - Related files and systems
4. Provides a summary confirming the capture

## Output

The command will:
1. Create a file: `specs/drafts/need_<name>_<timestamp>.md`
2. Include relevant context from the current session
3. Suggest initial implementation approaches
4. List files that might need modification
5. Note any dependencies or blockers discovered

## Draft Format

The draft will include:
- **Need**: The name and description
- **Context**: How this need was identified in the current session
- **Current State**: What exists now that relates to this need
- **Proposed Change**: Initial ideas for addressing the need
- **Implementation Notes**: Technical considerations discovered
- **Related Files**: Files discussed or modified in current session
- **Session Reference**: Date and key topics from this session
- **Next Steps**: Use `/spec` to formalize when ready to implement

This draft can later be refined using `/spec` to create a formal specification for implementation.
