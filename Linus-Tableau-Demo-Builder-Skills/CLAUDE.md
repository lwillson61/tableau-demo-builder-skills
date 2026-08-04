# Claude Runtime Policy (Demo Builder Pack)

This file enforces consistent behavior for agents using this repository.

## Mandatory Memory Protocol

The agent must treat `memory/MEMORY.md` as required persistent state.

### Session start (required)
1. Read `memory/MEMORY.md` before planning or building.
2. Summarize relevant prior learnings from memory.
3. Reuse proven patterns and avoid repeating known failure modes.

### During work (required)
After each major milestone, append concise notes to memory:
- discovery outcomes,
- data generation approach and seed assumptions,
- ingest/semantic implementation notes,
- chart-type decisions and rationale,
- failures, root cause, and fixes.

### Session end (required)
Before final response:
1. Append a session log entry in `memory/MEMORY.md`.
2. Include what was built, what failed, what changed, what to reuse next time.
3. If memory was not updated, treat task as incomplete.

## Demo Builder Quality Gates

Do not claim completion until:
- data foundation is validated,
- visual artifacts are created and checked,
- critical critique findings are addressed or explicitly documented,
- memory updates are committed in-file.

## Plain-English Rule

All user-facing guidance should be practical, concise, and jargon-light.
