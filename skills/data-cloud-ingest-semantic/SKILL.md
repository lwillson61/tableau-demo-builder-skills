---
name: data-cloud-ingest-semantic
description: >-
  Generates seeded synthetic demo data with planted signals, ingests it into Data 360
  (Data Cloud), and builds a Tableau Next semantic model with explicit fields, joins,
  calcs, metrics and business preferences. Use when creating demo data, data streams,
  DLOs/DMOs, semantic models (SDMs), or when ingest or the model is failing.
---

# Data 360 Ingest and Semantic Layer

Moves synthetic data into a semantic model the dashboard and the analytics agent can both use. Exact API shapes and traps: `tableau-platform-learnings` › `data-360-and-semantic-models.md`.

## Data generation rules

1. One fixed seed. Parameters at the top of the script.
2. Parent tables before children; 2–4 tables, each with a primary key and at least one date.
3. Generate a baseline, then plant the scenarios. Planted values must be exact: the aha quotes them.
4. **One denormalized person-level table** (contacts/customers, ≤2,000 rows) carries every column the agent filters on, plus a Yes/No flag per agent-only aha, so the agent never joins at question time.
5. Agent-only cohorts are short and countable (about 3–80 people, at most a fifth of the table).
6. Named stars (2–3 fictional people) get exact row values and child rows that match their story (an open opportunity with their amount, activity rows that add up to their counters).
7. Columns: snake_case, ≤40 characters, types Text/Number/Date/Boolean only. Real category values, never "TBD" or "etc".
8. Rate-like columns (`_pct`, `_rate`, `avg_`, `_per_`, `days`) are averaged, never summed.
9. End time series at the last complete month, or the final point reads as a collapse.
10. Export a data dictionary.

## Ingest workflow

1. Authenticate with a token that has Data 360 scopes (`CDPIngest`, `CDPQuery`). A plain CLI token often lacks them.
2. Create one stream per table (in parallel is fine). Keep names short.
3. Store the stream name the API **returns**, not the one you sent.
4. Wait for the DLO to be ACTIVE, map DLO → DMO once (never retry a mapping), then confirm rows with a SQL query on `<object>__dlm`.

## Semantic model workflow

1. Create the model empty, then add each DMO with `shouldIncludeAllFields: false`.
2. Add dimensions and measures yourself with business labels and your own API names (unique across the whole model).
3. Add relationships (`ManyToOne`) between explicit fields.
4. Add calcs (`_clc`) and metrics (`_mtc`). Every metric needs a time dimension.
5. Write business preferences that map plain-English phrasings to each flag ("deals gone quiet" → `Stalled_Flag = Yes`).
6. Read everything back and run a query per agent cohort: the counts must equal the plan.

## Reliability checklist

- DLO is ACTIVE and has the expected row count.
- Model fields are visible (never `isVisible: false`; leave unwanted fields out instead).
- Each agent cohort query returns the planned count.
- Labels are clean and audience-friendly (≤40 characters).

## Common failure patterns

- Long stream or schema names; spaces in schema labels.
- Ingest 404 during the propagation window: poll, don't fail.
- Building charts before the model's fields exist, or right after creation (it can take minutes before charts draw).
- Reusing a GET payload as a POST/PATCH body (read-only fields and HTML-escaped text get written back).
- Data can't be refreshed in place in an existing stream: a data change usually means a new build.
