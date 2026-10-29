# Tableau Next analytics agent

## Which agent

- **Analytics and Visualization V2** (`AnalyticsAgentConcierge`) answers data questions. Out of the box it has Analyze Data and Answer Questions with Knowledge; it can't write to Salesforce.
- The older **Analytics and Visualization** agent may decline data questions. The dashboard's Agentforce panel can open on it. Before a demo: click the agent name at the top of the panel, choose V2, click Select.
- The panel has no buttons or forms. Never script "click Create Task in the agent panel".

## Indexing

- The dashboard panel only answers from a semantic model the agent has indexed; otherwise it says "SDM not indexed" (error 11002, worded several ways). MCP `analyze_data` with `targetEntityType: "sdm"` doesn't need the index, so it can pass while the live panel fails.
- Reproduce the panel exactly through the Agent API with variables `targetEntityType: "dashboard"`, `targetEntityId: <dashboard API name>` (or `sdm` + model API name).
- Indexing is org-side. Toggling `agentEnabled`, re-saving fields or adding the model to Agent Settings didn't index a model. If a new model says "not indexed", wait a few minutes, then check the org's status before changing the build. Later edits to an indexed model didn't break it.

## Reading answers

- `analyze_data` puts tables and charts in `vizMetadata` (an HTML-escaped JSON string; rows under `dataSource.rows`, keyed by field label). The `answer` text may only say "the table includes First Name, Last Name…". **Score list answers from the rows.**
- A chart answer has `visualSpecification.layout: "Vizql"` and `marks.panes.type` Bar or Line; a table has layout `Table`. Ignore `marks.headers`.
- Answers vary between runs. Rehearse on the day of the demo. Summaries can misstate aggregates, so narrate from the chart or table.

## Questions that land

- Yes/No flag columns on a denormalized person table, plus business preferences mapping phrasings to each flag, answer questions that never name the flag.
- Ask about named people by name; long lists only show the top rows.
- Give each named person child rows matching their story (an open opportunity with their amount), or the agent finds them but says "no open opportunities".
- **"Visualize it":** name the chart type, the measure and the breakdown in field labels ("Show me a bar chart of average days since activity by dinner status"). If it returns a table, reword with the chart type first ("Create a bar chart showing …").
- Color-coded charts: an **aggregated stacked bar** is reliable ("stacked bar chart of total <measure> by <dimension>, with each bar split into <flag yes> and <flag no>"). Per-record bars colored by a flag, "on color" wording, agent-drawn scatters, reference lines, point labels and follow-ups that modify a previous chart were unreliable. Ask for the full chart in one prompt.
- Include the 18-character Salesforce Contact ID as a field ("… include their Salesforce Contact ID") so the person can be acted on. Don't add URL fields: the Trust Layer may print "URL_Redacted".

## Custom action: the agent creates the record

- Add an Apex invocable action to the agent's `GenAiPlannerBundle`: a `localTopicLinks` + `localTopics` entry with a `localActions` child (`invocationTargetType apex`, `invocationTarget <ClassName>`) and input/output `schema.json` files (`lightning__textType`, `numberType`, `dateType`; `copilotAction:isUserInput`, `isDisplayable`, `isUsedByPlanner`).
- Local topic and action names must be unique in the org; include the agent's name in them.
- On an agent that only links shared topics, local topics still work: insert them just before `<masterLabel>` and add `xmlns:xsi` to the root. A standalone GenAiFunction with an Apex target was rejected.
- Deploy fails "Cannot update record as Agent is Active": deactivate, deploy, reactivate (about 20 s off; `POST /connect/bot-versions/{id}/activation`).
- Deploy success means `<status>Succeeded</status>` with no `<componentFailures>`. Every component result says `<success>true</success>` even when the deploy failed.
- **Return the SObject**, not text: `@InvocableVariable public Task task;` with output type `lightning__recordInfoType` + `lightning:sObjectInfo.apiName`. It renders as a clickable record card. Plain URLs and markdown links don't render as links.
- Records created live in CRM won't appear in Tableau until Data 360 syncs; the record card covers that gap.
- Production orgs may skip tests on deploy; run the Apex tests explicitly.
- Rehearse the finale through the Agent API, find the created record (tag it in Description and filter in code; SOQL can't filter long text), then delete it.
