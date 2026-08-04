# Data Cloud Ingest and Semantic Layer Skill

Use this skill to move from synthetic/curated data to a usable Tableau Next semantic model.

## Outcome

Create a reliable data foundation:
- source files generated with realistic signals,
- schema + data stream registered in Data Cloud,
- ingest completed and validated,
- semantic model created with business-friendly fields.

## Data Generation Rules

1. Use a single fixed seed for reproducibility.
2. Define dimensions/parameters at the top of script.
3. Generate tables in dependency order (parents before children).
4. Inject scenarios after baseline generation (spikes, declines, regional anomalies).
5. Export a data dictionary.

## Ingest Workflow

1. Authenticate to Salesforce + Data Cloud tokens.
2. Register/merge schema on ingest connector.
3. Create stream with short, safe names.
4. Wait for DLO activation (eventual consistency retries).
5. Create ingest job, upload CSV, close job, poll to completion.

## Semantic Layer Workflow

1. Create semantic model on activated DLO.
2. Prefer business labels over technical names.
3. Explicitly define dimensions, measures, data types.
4. Preserve valid aggregation behavior (do not override user-defined agg).
5. Validate model has expected fields/relationships before visualization build.

## Reliability Checklist

- Workspace exists.
- DLO status is ACTIVE.
- Ingest job state is complete.
- SDM fields are discoverable.
- Required dimensions/measures resolve.
- Naming is clean and audience-friendly.

## Common Failure Patterns

- Stream/schema names too long.
- Ingest job 404 during propagation window.
- Creating visuals before SDM fields are materialized.
- Reusing API GET payloads that include read-only fields.
