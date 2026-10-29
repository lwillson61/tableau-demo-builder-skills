---
name: viz-design-playbook
description: >-
  Chooses chart types from the business question and applies visual best practices for
  Tableau Next and Tableau Cloud dashboards, including what each product can draw. Use
  when picking charts, laying out a dashboard, reviewing a viz, or when the user asks
  which chart fits, or about Sankey, radial, heatmap, map, scatter or donut charts.
---

# Visualization Design Playbook

Choose the chart from the decision first, then the data shape, then aesthetics.

## Fast decision matrix

| Question | Chart |
|----------|-------|
| Trend over time | Line (continuous month) |
| Ranked comparison | Sorted horizontal bar |
| Part-to-whole, ≤5 categories | Donut |
| Two-way hotspot | Heatmap |
| Two measures moving together | Scatter (rates/averages on axes, total as size) |
| Stage drop-off | Funnel |
| Where volume goes across stages | Sankey |
| Location matters | Map |

## What each product draws

- **Tableau Next:** line, bar (stacked/colored by a second dimension), donut, funnel, scatter, heatmap, table, Sankey, **dot maps only** (no filled/choropleth maps), plus radial variants on newer API versions. Reference lines and forecasts on bar/line only. No area, bullet or labelled pie charts.
- **Tableau Cloud (Classic):** everything, including filled maps, bullets, LOD/table calcs, parameters, actions and viz in tooltip.

## Dashboard layout (Tableau Next)

- KPI cards on top (3–4), then trend, then ranked drivers. Reading order follows a Z.
- Every chart gets a bold, centered 16px header text widget directly above it (same column and width). Headers are short titles, not sentences.
- 1-row gap between a chart and the next header; 1-column gutter between side-by-side charts.
- Dashboard text is customer-facing only: no presenter notes, audience labels or "this dashboard shows" lines.
- Date fields are continuous by default.
- Thin lines (about 2px) look more professional; set line width at creation.

## Advanced charts

- **Nightingale / radial donut:** cyclical categories (month, hour), 4–8 slices. Not for precise comparison.
- **Radial heat map:** cyclical intensity; sequential palette, fixed legend.
- **Radial / spoke bars:** only when the circle supports the story; ordered meaningfully.
- **Sankey:** 8–12 nodes per stage, group tiny paths into "Other", left-to-right order.
- **Donut with KPI:** one total in the center, ≤5 slices; switch to bars when shares are close.
- **Map:** only with a real geography that matters to the story; quiet base map; at most one per dashboard.

## Universal rules

- Titles answer a business question.
- One accent color for the focus, grays for the rest; a second color only for good/bad.
- Text contrast at least 4.5:1, marks 3:1. Never light text on a light background.
- The top insight is visible in under 5 seconds.
- The aha bar or line must be the most extreme in the default view.

API payload shapes for each Next chart type: `tableau-platform-learnings` › `tableau-next.md`.
