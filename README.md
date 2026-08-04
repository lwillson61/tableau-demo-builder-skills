# Linus Tableau Demo Builder Skills

Portable skill pack for Cursor and Claude Code to build high-quality, end-to-end Tableau Next and Tableau Pulse demos.

This pack supports repeatable execution:

`discovery -> story -> data -> ingest -> semantic layer -> dashboards/metrics -> critique -> memory`

---

## Skills Catalog

| Skill | Purpose |
|-------|---------|
| `skills/end-to-end-demo-builder/SKILL.md` | Full orchestration of end-to-end demo builds |
| `skills/discovery-industry-story/SKILL.md` | Discovery framework, POV, personas, and business questions |
| `skills/data-cloud-ingest-semantic/SKILL.md` | Data generation, Data Cloud ingest, and semantic layer practices |
| `skills/tableau-pulse-demo-builder/SKILL.md` | Tableau Pulse metric, group, and digest workflows |
| `skills/viz-design-playbook/SKILL.md` | Chart selection guidance and visual design best practices |
| `skills/self-critique-devils-advocate/SKILL.md` | Structured critique loop before final delivery |

---

## Included Files

- `memory/MEMORY.md`
- `CLAUDE.md`
- `.cursor/rules/memory-protocol.mdc`
- `RUNBOOK.md`
- `GITHUB_PUBLISHING_GUIDE.md`
- `install.sh`
- `install.ps1`

---

## Quick Start

## Install Into Your Project

### macOS/Linux

```bash
bash install.sh /path/to/your/project
```

### Windows PowerShell

```powershell
.\install.ps1 C:\path\to\your\project
```

If no target path is provided, installation uses your current directory.

## Verify Installation

Confirm these exist in your target project:

- `skills/`
- `memory/MEMORY.md`
- `CLAUDE.md`
- `.cursor/rules/memory-protocol.mdc`

## Start the First Session

Use this prompt:

> Use `skills/end-to-end-demo-builder/SKILL.md` for this session.  
> Read `memory/MEMORY.md` first.  
> Follow the workflow and update memory after each major milestone.

---

## Recommended Workflow

1. Discovery  
   Use `discovery-industry-story` to define context, personas, and decision questions.

2. Data + Ingest + Semantic Layer  
   Use `data-cloud-ingest-semantic` to generate synthetic data, ingest into Data Cloud, and build the SDM.

3. Build Demo Assets  
   Tableau Next: dashboards, metrics, advanced visualizations.  
   Tableau Pulse: metric catalogs, groups, and subscriptions.

4. Visual Design Pass  
   Use `viz-design-playbook` to validate chart choice and readability.

5. Self-Critique  
   Use `self-critique-devils-advocate` to identify and fix high-risk issues.

6. Persist Learning  
   Append outcomes and reusable patterns to `memory/MEMORY.md`.

---

## Cursor and Claude Usage

## Cursor

- Skills are consumed from project `skills/`
- `.cursor/rules/memory-protocol.mdc` enforces memory behavior

## Claude Code

- Use the same `skills/` and `memory/` structure in repo
- `CLAUDE.md` enforces memory updates and quality gates

---

## Memory Protocol

This pack is intentionally stateful across sessions.

1. Read `memory/MEMORY.md` at session start.
2. Reuse prior learnings and avoid known failure modes.
3. Append concise notes after each major milestone:
   - discovery outcomes
   - data generation and integration choices
   - visualization decisions
   - failures and fixes
4. Add a final session log entry before finishing.

If memory is not updated, the task is incomplete.

---

## Who This Is For

- Tableau Solutions Engineers
- Demo architects in financial services and insurance
- AI-assisted teams that need repeatable, high-quality demo delivery

---

## Design Goal

Enable another user or agent to reliably produce demos with:

- clear business narrative
- credible and reproducible data
- technically valid Tableau Next and Tableau Pulse builds
- strong visual design decisions
