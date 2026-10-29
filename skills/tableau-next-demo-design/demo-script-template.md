# DEMO_SCRIPT.md template

Fill every section. Delete the guidance in italics.

```markdown
# Demo script — {Company} — {Use case}

**Audience:** {persona}
**Length:** {minutes}
**Org:** {alias}  **Workspace:** {name}  **Dashboard:** {name}
**SDM:** {apiName}

## One-sentence outcome
{What they should believe and do after the demo}

## Aha reminder
- Dashboard shows: {list}
- Agent-only: {list}
- Action: {Case / Task / Opportunity the owner opens}

## Setup (before the meeting)
1. Log into {org URL}
2. Open Tableau Next workspace {name}
3. Open dashboard {name} — default filters: {dates, segment}
4. Confirm Concierge is available on the dashboard
5. Confirm one named customer still exists: {Name}, {Account}, {Case/Task Id}

## Click path and talk track

### 0:00 — Frame
**Say:** {2–3 sentences. Business problem, not product.}
**Click:** {nothing / open dashboard}
**Do not say:** {features to avoid}

### 0:02 — KPI context
**Click:** {point at which KPI}
**Say:** {what the number means in business terms}
**Expected:** {the number, the comparison}

### 0:04 — Trend
**Click:** {filter or hover}
**Say:** …
**Expected:** …

### 0:07 — Driver / where it breaks
**Click:** {journey, step, or rank}
**Say:** …
**Expected:** …

### 0:10 — Analytics agent
**Click:** Concierge / Ask
**Paste this question (verbatim):**
> {question 1}

**Expected answer:** {the agent-only aha, including names/counts}
**Say after it lands:** {why this could not be seen on the dashboard}

**Backup question if the first misses:**
> {question 2, still not answered by a chart}

### 0:13 — Actionability
**Click:** {open the Salesforce record — Case/Task/Opportunity}
**Say:** {who owns it, what they do before Friday}
**Show:** {record name, related Contact, status}

### 0:15 — Close
**Say:** {decision you want: pilot, next workshop, data sources to connect}
**Ask them:** {one question that forces a business commitment}

## Agent question bank
Keep these off the dashboard. Use in order.

1. {verbatim question} — Expected: …
2. {verbatim question} — Expected: …
3. {verbatim question} — Expected: …

## If something breaks
| Symptom | Recovery |
|---------|----------|
| Concierge timeout | Repeat question 1. Do not open a punchline worksheet. |
| Wrong SDM | Set Concierge context to {SDM} |
| Named customer missing | Use backup name {Name} / Id {Id} |
| CRM record missing | Search Accounts for {external id prefix} |

## Do not do
- Do not click into a who-list viz
- Do not apologize into a product tour
- Do not show raw CSV
```
