---
name: tableau-pulse-demo-builder
description: >-
  Designs and builds Tableau Pulse demos on Tableau Cloud: metric definitions, realistic
  synthetic history, planted insights Pulse will actually surface, follows and digests.
  Use for Pulse-first demos, Pulse metrics, insights, digests or alerts.
---

# Tableau Pulse Demo Builder

## Outcome

A Pulse demo where each leader follows a few metrics and Pulse itself explains what changed and why.

## Build sequence

1. Define 3–5 metrics by type:
   - **Flow** (Sum over a period): volume, revenue, count.
   - **Average/Rate**: average of a per-row rate or severity column. Never sum a rate.
   - **Snapped** (point in time): balance, pipeline, headcount.
2. Plan 3–5 insights first, each of one kind: top contributor, concentration, unusual change, or trend. Each insight names only its own planted value.
3. Generate one daily table: 18 months ending yesterday, a date, 2–3 dimensions with 3–8 values, 2–5 measures.
4. Publish the data source (a `.hyper` extract works well), create definitions, default metrics and any scoped (filtered) copies.
5. Follow the metrics for each persona and confirm the insights appear.
6. Add one "visualize it" question: plain English, no chart type named (Pulse picks the chart).

## Rules that make insights land

- **Realistic variability.** About 30–50 points per default range, and every point moves (≈±5% month texture for flows, ±3.5% for rates; ≈±8% day-to-day). A perfectly smooth series looks fake and Pulse's expected range collapses ("down 0.0%").
- Keep monthly totals equal before planting, and lower weekends evenly, so 30-day months don't read as drops.
- Planted changes must clear the noise: unusual change ≥20%, top contributor ≥15% from zero.
- Plant changes in the **last complete month**; metrics use monthly granularity, last complete period vs previous.
- If month-over-month is noisy (short months), compare to the same period a year ago instead.
- A driver dimension only shows up in "why" answers if it's in the definition's allowed dimensions. Plan those at definition time.

## Limits to script around

- Pulse can follow, share and send digests. It can't create Salesforce records or email a named person; say the next step out loud.
- There is no image export for Pulse metrics; capture screenshots by hand.
- A second definition with the same name on the same data source returns 409: reuse it.

API details: `tableau-platform-learnings` › `tableau-pulse-and-cloud.md`.
