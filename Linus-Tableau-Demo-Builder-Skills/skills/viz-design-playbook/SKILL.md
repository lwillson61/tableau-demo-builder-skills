# Visualization Design Playbook Skill

Use this skill to choose chart types intentionally and apply visual best practices.

## Core Principle

Choose charts based on the decision/question first, then data shape, then aesthetics.

## Fast Decision Matrix

- Trend over time -> line / multi-series line
- Ranked comparison -> sorted bar
- Part-to-whole (few categories) -> donut
- Two-dimensional intensity -> heatmap
- Stage flow/split -> Sankey
- Geographic distribution -> map

## Advanced Chart Guidance

### Nightingale / Radial Donut
- Best for cyclical storytelling and pattern emphasis.
- Not ideal for precision comparisons.
- Keep categories constrained; add labels/tooltips.

### Radial Heat Map
- Best for cyclical intensity (hour/day/month loops).
- Use sequential palettes and fixed legends.
- Avoid over-segmentation and rainbow scales.

### Radial Bars / Spoke Bars
- Good when circular form supports narrative.
- Keep ordering meaningful.
- Use linear bars when exact ranking matters.

### Sankey
- Best for where-volume-goes analysis across stages.
- Keep nodes manageable and group tiny paths into `Other`.
- Preserve logical left-to-right flow and reduce crossing.

### Donut with KPI
- Best for part-to-whole plus one key total.
- Use few categories; keep center KPI legible.
- Switch to bars when shares are close or many.

### Map
- Use when location drives action.
- Build from lat/lon map-position fields where required.
- Keep base map quiet and markers readable.

## Universal Visual Design Rules

- Titles should answer a business question.
- Use color with purpose, not decoration.
- Prefer readability over novelty.
- Make top insight visible in <5 seconds.
