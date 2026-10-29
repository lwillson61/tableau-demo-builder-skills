# Aha Contract — dashboard vs analytics agent

## Split

| Layer | Question it may answer | Typical viz |
|-------|------------------------|-------------|
| Dashboard | What is happening? Where is it worst? Is it getting worse? | KPI, trend, ranked bar, funnel |
| Analytics agent | Who? Which intersection? What should we do today? | No viz. Concierge / `analyze_data` only |

If a chart can answer an agent question, the aha is burned.

## How to plant an agent-only aha

1. Put the signal on **row-level** data (session, customer, case), not on a pre-aggregated summary table the dashboard uses.
2. Keep the combination off the dashboard. Example: dashboard has Journey and Outcome. Agent-only needs Journey × Device × File_Type × Deposit_Band × Open_Case_Flag.
3. Cap the cohort so the live answer is a short named list (about 20–80).
4. Give each named person a Salesforce Account/Contact and a Case or Task.
5. Write the Concierge question before generating data. Then generate data that makes that answer true.

## Patterns that work in a live room

- **Named list:** “Which existing customers abandoned X after 10+ minutes this week and have no open Case?”
- **Hidden intersection:** high-value segment × longest step × after a known change date.
- **Channel leak:** digital fail then Case with a matching reason, not shown as a join on the dashboard.
- **Contrast pair:** one customer who finished (copy this) vs one who tried and called (fix this). Same journey, different device or document type.

## Patterns that burn the aha

- A table widget of “customers to call”
- A KPI titled the punchline (“41 high-value upload failures”)
- A heatmap of the exact intersection the agent is supposed to find
- Tooltip that names the cohort

## Rehearsal test

Hand the dashboard to someone who has not read the script. They should reach the dashboard ahas. They should not be able to name the agent cohort or the next action without asking Concierge.
