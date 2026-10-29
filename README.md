# Tableau Demo Skills

Agent skills for building custom Tableau Next, Tableau Pulse and Tableau Cloud demos: from customer discovery to a rehearsed demo where the dashboard shows *what* and *where*, the analytics agent finds *who* and *why*, and the story ends with a Salesforce record being created.

They work with Claude Code, Claude.ai and Cursor, or any agent that reads `SKILL.md` files.

## Skills

| Skill | What it does |
|-------|--------------|
| `end-to-end-demo-builder` | Runs the whole workflow and calls the skills below in order |
| `discovery-industry-story` | Business-first discovery and a Tableau POV with personas and demo stories |
| `financial-services-industry-expert` | Banking, credit union, wealth and insurance pain points, KPIs and talk tracks |
| `insurance-industry-expert` | Insurance discovery by function and line of business |
| `tableau-next-demo-design` | Aha Contract, agent questions, Salesforce actionability, demo script |
| `data-cloud-ingest-semantic` | Seeded synthetic data, Data 360 ingest, semantic model |
| `viz-design-playbook` | Chart choice and dashboard layout, including what each product can draw |
| `tableau-pulse-demo-builder` | Pulse metrics and planted insights that Pulse actually surfaces |
| `self-critique-devils-advocate` | P0/P1/P2 review of the plan and the finished build |
| `tableau-platform-learnings` | Verified API shapes and traps for Tableau Next, Data 360, the agent, Pulse and Tableau Cloud |

## Install

Copy the folders under `skills/` to one of:

- **Claude Code:** `~/.claude/skills/` (all projects) or `<project>/.claude/skills/`
- **Cursor:** `~/.cursor/skills/` or `<project>/.cursor/skills/`
- **Claude.ai:** zip each skill folder and upload it under Settings › Capabilities › Skills

```bash
git clone https://github.com/lwillson61/tableau-demo-builder-skills.git
cp -R tableau-demo-builder-skills/skills/* ~/.claude/skills/
```

## Prerequisites

- A Salesforce org with Data 360 and Tableau Next, and the Analytics and Visualization V2 agent.
- MCP servers connected in your agent:
  - Tableau Next: `https://api.salesforce.com/platform/mcp/v1/analytics/tableau-next-pilot` (beta; turn on both the "Tableau Next" and "Tableau Next (Beta)" entries under Setup › MCP Servers)
  - SObject All: `https://api.salesforce.com/platform/mcp/v1/platform/sobject-all`
- For Pulse and Tableau Cloud demos: a Tableau Cloud site and a personal access token.
- The hosted MCP servers need a token from an External Client App with the `MCP` scope (see `tableau-platform-learnings`).

## Use

Start with a prompt like:

> Build a Tableau Next demo for a regional bank losing commercial deposits. Here are my discovery notes: …

The agent runs discovery, writes the Aha Contract for your approval, then builds and rehearses. Every demo produces `AHA_CONTRACT.md`, `DEMO_SCRIPT.md` and `OBJECT_MAP.md`.

## Notes

- Tableau Next APIs and the MCP server are in beta and change often. The learnings were verified in live orgs in 2026; when the platform disagrees, trust the live response and update the file.
- All example companies and people are fictional.
- These skills aren't an official Salesforce product and aren't supported by Salesforce.
