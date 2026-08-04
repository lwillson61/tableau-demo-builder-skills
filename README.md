# tableau-demo-builder-skills
Portable skill pack for Cursor and Claude Code to build high-quality, end-to-end Tableau Next and Tableau Pulse demos.

This pack is designed for Solutions Engineers who need repeatable demo execution:

discovery -> story -> data -> ingest -> semantic layer -> dashboards/metrics -> critique -> memory

What This Includes

skills/discovery-industry-story/SKILL.md

skills/data-cloud-ingest-semantic/SKILL.md

skills/tableau-pulse-demo-builder/SKILL.md

skills/viz-design-playbook/SKILL.md

skills/self-critique-devils-advocate/SKILL.md

skills/end-to-end-demo-builder/SKILL.md

memory/MEMORY.md (cross-session learning store)

CLAUDE.md (runtime behavior policy)

.cursor/rules/memory-protocol.mdc (always-on Cursor memory rule)

RUNBOOK.md (operator checklist)

GITHUB_PUBLISHING_GUIDE.md (publishing helpers)

install.sh / install.ps1



Quick Start

1) Install into your project repo

macOS/Linux

bash install.sh /path/to/your/project

Windows PowerShell

.\install.ps1 C:\path\to\your\project

If you omit the target path, installation uses your current directory.

2) Open your project in Cursor or Claude Code

After install, confirm these exist in your project:

skills/
memory/MEMORY.md
CLAUDE.md
.cursor/rules/memory-protocol.mdc (Cursor)


3) Start the first session

Use this starter prompt:

Use skills/end-to-end-demo-builder/SKILL.md for this session.
Read memory/MEMORY.md first.
Follow the full workflow and update memory after each major milestone.



Recommended Workflow

Discovery

Use discovery-industry-story to define business context, personas, and decision questions.



Data + Ingest + Semantic Layer

Use data-cloud-ingest-semantic to generate realistic synthetic data, ingest into Data Cloud, and build the SDM.



Build Demo Assets


Tableau Next: dashboards, metrics, advanced chart types  


Tableau Pulse: metric catalogs, subscriptions, groups



Visual Design Pass

Use viz-design-playbook to validate chart selection and readability.



Self-Critique

Use self-critique-devils-advocate to identify and fix high-risk issues.



Persist Learning

Append outcomes and patterns to memory/MEMORY.md.



Cursor vs Claude Usage

Cursor





Skills live in your project skills/ folder.



Rule file .cursor/rules/memory-protocol.mdc enforces memory behavior.

Claude Code



Use the same skills/ and memory/ structure inside your repo.



CLAUDE.md provides mandatory runtime policy (read memory, update memory, quality gates).



Memory Protocol (Required)

This pack is intentionally stateful across sessions.

Agents must:


Read memory/MEMORY.md at session start.

Reuse prior learnings and avoid known failure modes.

Append concise notes after each major milestone:

discovery outcomes

data generation/integration choices

visualization decisions

failures and fixes

Add a final session log entry before finishing.

If memory is not updated, the task is considered incomplete.



Who This Is For

Tableau Solutions Engineers

Demo architects building financial services and insurance scenarios

AI-assisted teams that need repeatable, high-quality demo delivery


Design Goal

Enable another user or agent to produce demos with:

Clear business narrative

Credible/reproducible data

Technically valid Tableau Next/Pulse builds

Strong visual design decisions
