# Linus Tableau Demo Builder Skills

Portable skill pack for Claude Code or Cursor to build high-quality, end-to-end Tableau demos.

This kit documents practical patterns for:
- Discovery and industry storytelling
- Synthetic data generation
- Data Cloud ingestion and semantic layer build
- Tableau Next and Tableau Pulse demo delivery
- Visualization type selection and design best practices
- Self-critique loops using devils-advocate review
- Cross-session memory capture and continuous learning

## Structure

- `skills/discovery-industry-story/SKILL.md`
- `skills/data-cloud-ingest-semantic/SKILL.md`
- `skills/tableau-pulse-demo-builder/SKILL.md`
- `skills/viz-design-playbook/SKILL.md`
- `skills/self-critique-devils-advocate/SKILL.md`
- `skills/end-to-end-demo-builder/SKILL.md`
- `memory/MEMORY.md`
- `CLAUDE.md`
- `.cursor/rules/memory-protocol.mdc`
- `RUNBOOK.md`
- `GITHUB_PUBLISHING_GUIDE.md`
- `install.sh` and `install.ps1`

## How to Use

1. Start with `discovery-industry-story`.
2. Use `data-cloud-ingest-semantic` when creating Tableau Next data foundations.
3. Use `tableau-pulse-demo-builder` for Pulse-specific workflows.
4. Use `viz-design-playbook` to choose and refine chart types.
5. Run `self-critique-devils-advocate` before final delivery.
6. Use `end-to-end-demo-builder` as the orchestrator for full builds.
7. Enforce the memory protocol by reading/updating `memory/MEMORY.md` each session.

## Memory Requirement (Important)

This pack is designed to persist learning between sessions.

Required behavior for agents using this pack:
- Always read `memory/MEMORY.md` at the start of a build.
- After each major step (discovery, data generation, ingest, viz build, critique), append key learnings.
- Record failures and fixes so future sessions avoid repeated issues.
- Keep entries short, concrete, and reusable.

## Design Goal

Enable another SE or AI assistant to reliably produce demos with:
- clear business narrative,
- credible and reproducible data,
- technically valid builds,
- and polished visual design decisions.
