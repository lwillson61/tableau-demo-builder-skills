---
name: tableau-next-demo-design
description: >-
  Designs and gates Tableau Next demos so aha moments are planned first, dashboard
  charts stay trend/where, and who/why/next-action insights can only be uncovered
  by the analytics agent. Always produces a full demo script (click path, story,
  agent questions) and Salesforce-object actionability via the SObject All MCP
  server. Use when building a Tableau Next demo, writing a demo script, planting
  Concierge/agent insights, creating matching Account/Contact/Case/Task/Opportunity
  data, or when the user mentions aha moments, actionability, click path, or
  analytics agent questions.
---

# Tableau Next Demo Design

Use this skill before generating data or authoring visuals. It designs the live story. Downstream skills do the plumbing:

- `end-to-end-demo-builder` — ingest, SDM, dashboard runbook
- `data-cloud-ingest-semantic` — Data 360 ingest + semantic model
- `viz-design-playbook` — chart choice and dashboard layout
- `tableau-platform-learnings` — verified API shapes and traps
- `self-critique-devils-advocate` — quality gate before claiming done

## Hard rules (do not weaken)

- Decide the outcome and aha moments first, then make sure the who/why insights can only be uncovered by the analytics agent.
- Always include a demo script with the whole click path, story and agent questions.
- Always include actionability: data that matches Salesforce objects in the target org, created with the SObject All MCP server.

- Do not start CSV generation until the Aha Contract is written and approved in-session (or the user already approved the story).
- Dashboard visuals answer **what** and **where**. They must not answer the agent punchline.
- Every demo ships a `DEMO_SCRIPT.md` with click path, talk track, and agent questions.
- Every demo has at least one "visualize it" prompt where the agent creates a chart, besides the list/table questions and the aha. Name the chart type, the measure and the breakdown in field labels (e.g. "Show me a bar chart of average days since activity by dinner status"), pick a breakdown no dashboard chart shows, and put it right after the first list question. On Classic it is a Tableau Agent web-authoring ask; on Pulse a Q&A question (Pulse picks the chart, so never name a chart type).
- Every demo ships CRM records (Account, Contact, plus Case/Task/Opportunity as the action) keyed to the analytic grain.
- Prefer SObject All MCP for CRM create/read. If MCP is disconnected, use `sf data` against the target org and note the fallback in the script.

## Workflow

Copy this checklist and complete it in order:

```
Demo design
- [ ] 1. Outcome and personas
- [ ] 2. Aha Contract (dashboard vs agent-only)
- [ ] 3. Data signals that make the agent-only ahas true
- [ ] 4. Salesforce object map + actionability
- [ ] 5. Visual narrative (KPI → trend → driver). No agent punchline charts.
- [ ] 6. Build data / SDM / dashboard (other skills)
- [ ] 7. Create matching Salesforce records via SObject All MCP
- [ ] 8. Write DEMO_SCRIPT.md (full click path + agent questions)
- [ ] 9. Rehearse: dashboard cannot answer the agent questions; agent can
- [ ] 10. Devils-advocate pass
```

### 1. Outcome and personas

Write four lines:

- Company / industry
- Decision owner in the room
- Business outcome if they act
- Metric that moves

### 2. Aha Contract

Produce a table with at least two dashboard ahas and at least two agent-only ahas.

| Aha | Owner | Why the dashboard must not show it | Agent question that unlocks it |
|-----|-------|------------------------------------|--------------------------------|

**Dashboard ahas** = ranks, trends, funnels, mixes a VP can see in 10 seconds.

**Agent-only ahas** = named people, intersections (value × friction × no open case), hidden cohorts, next best action. These exist in the data and the semantic model, but no viz, KPI, table, or tooltip lists them.

Plant the signal in grain-level data (session, customer, case). Do not add a worksheet that groups that signal.

Details: [aha-and-agent.md](aha-and-agent.md)

### 3. Data signals

For each agent-only aha, name:

- The field combination that makes it true
- How many rows (keep it countable in a live ask: ~20–80 people, not 8,000)
- The CRM record that makes action possible (Case, Task, Opportunity)

Use a fixed seed. Inject scenarios after baseline generation.

### 4. Salesforce object map

Required pattern:

| Analytic grain | Salesforce object | Purpose in the demo |
|----------------|-------------------|---------------------|
| Customer / member | Account + Contact | Who to call |
| Failed digital / service | Case | Work already in the queue |
| Follow-up | Task | What the banker does next |
| Revenue intent (loan, account open) | Opportunity | Pipeline sitting in the leak |

IDs must join: `Contact.AccountId`, web `customer_id` = Account/Contact external key, Case.ContactId, Task.WhoId/WhatId, Opportunity.AccountId.

Create records with SObject All MCP. See [actionability.md](actionability.md).

### 5. Visual narrative

Build only after the Aha Contract:

1. KPIs — current state
2. Trend — getting better or worse
3. Ranked driver — which journey/step/segment
4. Stop. Do not add the who-list or the hidden intersection chart.

**Maps:** Tableau Next draws **dot maps only** (one dot per location, sized by a measure); filled/shaded
state maps are not available, so "a map by state" means one dot per state. Use one only when the data has a
real geography, as the "where" chart. Dot maps need latitude and longitude fields in the data. Build details:
`tableau-platform-learnings` › `tableau-next.md`.

### Rules proven in live builds

- At least 2 dashboard ahas and 3 agent-only ahas. Each agent-only aha is 2–4 conditions (value × friction × no follow-up) on the person-level table, backed by its own Yes/No flag column so the flag and the question always agree.
- Charts never use a person, name, key or flag column.
- Agent questions are plain English and never name the flag column. Write business preferences that map phrasings to each flag.
- **Say the flag rule out loud** in the talk track ("registered, open deal over $250K, no follow-up"), or execs ask "how did it know?" and "why not the others?".
- 2–3 named stars, each asked about **by name** ("Tell me about Dana Whitfield…"). Agents list only the top few rows of a long list, so a star buried in a list of 18 may never appear.
- Expose the 18-character Salesforce Contact ID as a field (label "Salesforce Contact ID"), never a record URL. The agent can act on an ID; the Trust Layer may print a URL as "URL_Redacted". Label the demo's own row key "Demo Record Key" so it isn't mistaken for a Salesforce ID.
- Only the people the agent names go into CRM (under 100 per object). Add an OpportunityContactRole so the named person is on the deal, not just the account.
- Volume lives in Data 360 and only named people in CRM, so CRM roll-ups (e.g. Campaign totals) won't match the dashboard. Keep the presenter on Contact/Opportunity/Task records.
- Never call a declining series "steady". Give a skeptic a parity check (e.g. "same status, other industries look the same") when the story says "it's a process gap, not pricing".
- Live record creation is about one call per record; create the bulk ahead of time and only the finale record live.

### 6–7. Build

Run ingest + SDM + Tableau Next authoring skills. Then create CRM rows. Validate joins: pick one named customer from an agent-only aha and confirm Account, Case/Task, and analytic row all exist.

### 8. Demo script

Always write `DEMO_SCRIPT.md` using [demo-script-template.md](demo-script-template.md). Must include:

- Setup (org, workspace, dashboard, Concierge)
- Minute-by-minute click path
- Exact talk track
- Exact analytics agent questions (copy-paste)
- The "visualize it" question and the chart it should draw
- Expected answer and the CRM action that follows
- Recovery if Concierge misses (backup question, never a backup chart of the punchline)

### 9. Rehearse gate

Ask the agent questions against the dashboard only (no Concierge). If a human can read the punchline off a viz, delete or hide that viz and keep the signal in data.

### 10. Critique

Run `self-critique-devils-advocate`. Block ship if:

- Agent aha is visible on a chart
- No Salesforce records for the named customers
- Script has no click path or no agent questions
- Action is “look at a dashboard” instead of open a Case/Task/Opportunity

## MCP servers

| Server | URL | Use |
|--------|-----|-----|
| SObject All | `https://api.salesforce.com/platform/mcp/v1/platform/sobject-all` | CRUD on Salesforce objects |
| Tableau Next Pilot | `https://api.salesforce.com/platform/mcp/v1/analytics/tableau-next-pilot` | SDM, dashboards, Analytics Q&A |

If either namespace is `needsAuth`, stop CRM writes and tell the user to Connect in Cursor Settings → Tools & MCP. Do not fake actionability.

Confirm the target org with `sf org display --target-org <your-org-alias>` before any writes.

## Output pack (every demo)

Create these files in the demo folder:

- `AHA_CONTRACT.md` — dashboard vs agent-only table
- `DEMO_SCRIPT.md` — click path + agent questions
- `OBJECT_MAP.md` — analytic grain → Salesforce objects + sample Ids after create
- Data dictionary from the ingest skill
