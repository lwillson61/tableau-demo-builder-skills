---
name: discovery-industry-story
description: >-
  Runs business-first customer discovery and writes a Tableau POV (point of view) with
  personas and 2-3 demo stories before any build. Use when the user has call notes or
  only a company name, asks for a POV, discovery questions, a value hypothesis, or a
  demo story for Tableau Next, Pulse or Tableau Cloud.
---

# Discovery and Industry Story

Use before any demo build. The demo must solve a business problem, not show features.

## How to think

- **Business first.** Name each pain in business terms (growth, margin, cost to serve, risk, retention, client experience), tie it to the industry, and name the metric that would show it.
- **Industry cues.** Banking: deposits and margin, approval-to-funding time, relationship-manager blind spots. Credit unions: member growth and retention, cross-sell, staff capacity. Wealth: advisor productivity, asset retention and net flows, household view, onboarding speed. Insurance: loss ratio, claims cycle time and leakage, quote-to-bind, renewal retention, agent/broker performance. Other industries: the 2–3 things that drive their P&L. For depth, use `financial-services-industry-expert` or `insurance-industry-expert`.
- **Personas.** 2–3 decision owners: an executive (growth, margin, risk), a manager (team or territory performance), a frontline or operations role (daily priorities, next best action).
- **Stories plan the aha first.** Dashboard aha = WHAT and WHERE (a trend, or which region/segment/product). Agent-only insight = WHO and WHY (a short, countable list at an intersection such as high value × friction × no follow-up, which no chart shows). Then one "visualize it" chart the agent draws on request. Every story ends with a Salesforce record being created (Task, Case or Opportunity).
- **Honesty.** Company facts come only from sources you actually read. Everything else is an assumption: say "likely" and list it under assumptions. Never invent revenue, headcount or customer counts.
- **Style.** Plain English, one sentence per field, no product tour. People in stories are fictional.

## Tableau POV structure

1. **Customer information** — overview (2–3 specific sentences), mission and values, industry trends, 3–5 competitors, how they create value, target customers.
2. **Vision** — the business problem, and a shared vision written as "If <company>'s biggest challenge is …, then together …".
3. **Value messaging** — a short, repeatable tagline, plus one or two sentences each on how Tableau Next, Tableau Pulse, Tableau Agent and Tableau Cloud address the problem.
4. **Better together** — at least 5 Salesforce clouds, Data 360 first. For each: the use cases it solves and what Tableau adds.
5. **Agentic** — what Agentforce does in plain words, and at least 3 experiences: who, what they ask, what the agent does, what Tableau Next adds (answers grounded in the governed semantic model, returned with a chart).

Then: personas, 2–3 demo stories, the 2–4 data tables the demo would simulate (grain + key fields that make the ahas true, including a person- or account-level table), discovery questions, assumptions.

## Discovery questions that validate the POV

- What outcome matters this quarter?
- Which decision is slow today, and what does the delay cost?
- Which metric surprises leadership most often?
- Who acts on the signal today, and how do they find out?

## Output template

- Company summary:
- Strategic challenge:
- Demo tagline:
- Persona 1 / decisions:
- Persona 2 / decisions:
- Top 3 business questions:
- Dashboard aha (what/where):
- Agent-only aha (who/why):
- Salesforce action after the aha:
- Proof metrics (how success will be measured):
- Assumptions:
