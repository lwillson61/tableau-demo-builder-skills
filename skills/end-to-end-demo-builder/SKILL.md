---
name: end-to-end-demo-builder
description: >-
  Orchestrates a full Tableau Next, Tableau Pulse or Tableau Cloud demo build, from
  discovery to a rehearsed demo pack, by running the other skills in this package in
  order. Use when the user asks to build a complete demo, run the whole demo workflow,
  or go from customer notes to a working demo.
---

# End-to-End Tableau Demo Builder

Master orchestrator for full demo delivery. Each step names the skill that owns it.

## Runbook

1. **Discovery** — `discovery-industry-story` (plus `financial-services-industry-expert` or `insurance-industry-expert`).
   Company context, business problem, personas, success metrics, POV.
2. **Story blueprint** — `tableau-next-demo-design`.
   Aha Contract first: dashboard ahas (what/where) vs agent-only ahas (who/why/next action).
3. **Data design** — `data-cloud-ingest-semantic`.
   Seeded synthetic data that makes every planned aha exactly true; data dictionary.
4. **Ingest + semantic model** — `data-cloud-ingest-semantic`.
   Data 360 streams, semantic model, calcs, metrics, business preferences.
5. **Build assets**
   - Tableau Next: workspace, visualizations, dashboards (`viz-design-playbook`).
   - Tableau Pulse: definitions, metrics, follows (`tableau-pulse-demo-builder`).
   - Salesforce records for the people the agent will name (`tableau-next-demo-design` › actionability).
6. **Rehearse** — ask every agent question for real and check the answers against the plan.
7. **Devil's advocate** — `self-critique-devils-advocate`. Fix P0/P1 before calling it done.
8. **Delivery pack** — `AHA_CONTRACT.md`, `DEMO_SCRIPT.md`, `OBJECT_MAP.md`, data dictionary.
9. **Capture learnings** — append anything new about the platform to your own learnings file.

Before any API work, read `tableau-platform-learnings`. It lists the payload shapes and traps that were verified in live orgs.

## Hard rules

- Build from the business question, not from chart novelty.
- Reproducible: one fixed seed, deterministic scripts. Any change that touches the random stream changes every planted value, so re-check the ahas.
- Never claim success without reading the asset back (GET after every POST).
- Prefer fresh construction over cloning. If a fragile chart family needs a copied spec, say so.
- Plain English, action-oriented. Every story ends with a Salesforce record being created, never "look at a dashboard".

## Definition of done

- Data is ingested and the semantic model answers queries.
- Every chart draws and answers its intended question.
- Every agent question was rehearsed and returned the planned people.
- The script's numbers match what the screen shows.
- Critique findings are fixed or written down.
- Another SE can rerun it with minimal setup and get the same result.
