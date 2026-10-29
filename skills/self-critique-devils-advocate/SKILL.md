---
name: self-critique-devils-advocate
description: >-
  Stress-tests a demo plan, script or finished build before delivery and returns at most
  six P0/P1/P2 findings with evidence. Use before claiming a demo is done, after a build,
  or when the user asks for a review, critique, devil's advocate pass or quality gate.
---

# Self-Critique with Devil's Advocate

Run twice: once on the plan (against the seeded data), once after the build (against what the org really returned: card values, agent answers, the created record).

## Gather facts first

Exact card values (not "1.2K" display values), top and bottom chart values, list sizes the agent returned, and the record the finale created. Findings must quote this evidence.

## Look for, in this order

1. **Numbers that disagree** — the script quotes a value, count, rank or direction the facts contradict.
2. **Story gaps** — the problem → insight → action chain breaks, or the decision owner never gets a decision.
3. **Agent leaks** — a chart, title or tooltip already shows the who/why the agent is meant to reveal, or an agent question can be answered by reading the dashboard.
4. **Chart fit** — a ranking drawn as a line, 7+ donut slices, a one-row heatmap.
5. **Weak finale** — the Salesforce action isn't tied to the people the agent named.
6. **Missing "visualize it" beat** — no question where the agent draws a chart, it repeats a dashboard chart, or the agent answered with a table instead.
7. **Realism** — values a customer would laugh at (98% rate in a struggling business).
8. **Impossible steps (always P0)** — clicking a button in the agent panel (it has none), or an agent sending email, booking meetings or editing records it has no action for.

## Not problems (never report)

- Rounding said aloud: 18.8% vs 19%, $170.6M vs $171M.
- A figure that averages or totals several chart cells.
- Wording choices.
- Only report a number when a customer would notice: more than ~5% off, wrong direction, wrong leader or rank, or a wrong count of people.

## Severity

- **P0 Must fix** — the presenter would be caught out in front of the customer.
- **P1 Should fix** — a sharp customer would notice.
- **P2 Polish** — optional. A P0/P1 without evidence becomes P2.

Fix P0/P1 first, then re-check. Data and charts can't change after a build without rebuilding, so script fixes are usually the right repair.

## Evidence log

- Build goal:
- Assets created:
- Findings (severity, evidence, fix):
- Remaining known constraints:
- Final confidence:
