---
name: tableau-platform-learnings
description: >-
  Field-verified API behaviors, payload shapes and traps for Tableau Next, Data 360
  semantic models, the Tableau Next analytics agent, Tableau Pulse and Tableau Cloud,
  learned from automated demo builds in live orgs. Read before calling Tableau Next or
  Data 360 APIs/MCP tools, and whenever a create or update call is refused, a chart
  won't draw, a metric card looks wrong, or the agent gives unexpected answers.
---

# Tableau Platform Learnings

Verified in live orgs in 2026 against Salesforce API v67 and the hosted Tableau Next MCP server (beta). These products move fast: when something here disagrees with what you see, trust the live response, then update this file.

## Reference files

| File | Read when |
|------|-----------|
| [data-360-and-semantic-models.md](data-360-and-semantic-models.md) | Ingesting data, building or querying a semantic model, calcs, metrics |
| [tableau-next.md](tableau-next.md) | Creating visualizations, dashboards, KPI cards, filters, maps, branding |
| [analytics-agent.md](analytics-agent.md) | Agent questions, rehearsal, custom agent actions, the "agent creates a record" finale |
| [tableau-pulse-and-cloud.md](tableau-pulse-and-cloud.md) | Pulse metrics and insights, generated Tableau Cloud workbooks, embedding, Tableau Agent |

## The rules that cost the most time to learn

1. **Verify every write with a read.** A 200 doesn't mean the asset is right. GET it back and check the fields you care about.
2. **Never send a GET body back as a POST/PATCH.** GET adds read-only fields (`id`, `status`, `permissions`, `url`, audit fields) and HTML-escapes text (`&` → `&amp;`, `'` → `&#39;`). Re-sending it fails or double-escapes. Build write bodies from scratch.
3. **Use API v67** for visualizations (`?minorVersion=12`). v66 rejects maps and can't read tables.
4. **Explicit semantic models beat auto-bind.** Create the model empty, add objects with `shouldIncludeAllFields: false`, add your own fields with your own API names. Names come back exactly as sent.
5. **Metric widgets need `source: {id, name}`.** With only the id, the source is dropped and the card shows no data.
6. **Don't write Tableau Next dashboards through the MCP update tool.** Even an unchanged update unhooks metric cards from their period filter. Use the REST PATCH.
7. **Tableau Next has dot maps only**, no filled maps. Dots need latitude/longitude columns in the data.
8. **The dashboard's agent panel needs an indexed model**, and may open on the older agent. Rehearse through the Agent API with the dashboard as context, and pick "Analytics and Visualization V2" in the panel before presenting.
9. **Agent list answers live in the returned table, not the prose.** Check the artifact rows, not the summary sentence.
10. **Return record IDs or record cards from agents, never URLs.** The Trust Layer may redact URLs.
11. **Synthetic series need noise.** Flat data makes cards, sparklines and Pulse insights look fake. Aim for 30–50 moving points per default range.
12. **New models can take minutes to draw.** If a chart says "Trouble displaying content" right after creation, wait 5–15 minutes before debugging. Then check in order: data in the DLO → model fields → chart spec.
13. **When an API is unclear, find a working asset and read its spec.** Reverse-engineering a chart someone built in the UI is faster than guessing.
