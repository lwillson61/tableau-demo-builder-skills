# Data 360 and semantic models

## Auth

- Data 360 calls need a token with Data 360 scopes (`CDPIngest`, `CDPQuery`). A plain Salesforce CLI token usually lacks them.
- The hosted MCP servers (`api.salesforce.com/platform/mcp/...`) reject CLI tokens. They need a token from an External Client App with the `MCP` scope and named-user JWT on. Every token, MCP included, must come from an app the org knows.
- External Client Apps deploy cleanly as metadata. A "Local" app only logs in to its own org, so each org needs its own copy.
- Python 3.14 on macOS may fail SSL verification; use `ssl.create_default_context(cafile=certifi.where())`.

## Streams and ingest

- Schema labels can't contain spaces (`InvalidCharacterObjectName`); stream labels can.
- The stream API may **rename** your stream. Store the name in the create response.
- Updating a connector schema with PUT replaces all schemas on it. GET the existing ones first and merge.
- Use the connector's short name as `sourceName` in ingest jobs, not its UUID.
- Typical timing with parallel per-table ingest: upload → stream ~8 s → rows ~10 s → DMO → mapping → `<name>__dlm` queryable ~15 s.
- DMO field names are `<column>__c`. DLO → DMO mapping works with those names plus the `KQ_<pk>__c` key-qualifier field. **Mapping create isn't idempotent: never retry it.**
- New streams may be missing from the create response or the list for a while. Poll the stream by name, then the DLO status, before giving up.
- Data in an existing stream can't be repointed to a new upload. A data change usually means a new stream.
- Deleting: `DELETE /ssot/data-streams/{name}?shouldDeleteDataLakeObject=true` may answer 412 and the mapping delete 500, yet the stream, DLO, mapping and DMO are removed in the background. Poll until all are 404.
- Verify data with a SQL query on the `__dlm` object before blaming the model.

## Semantic model (SDM)

- REST paths: `/services/data/v67.0/ssot/semantic/models/...`. Include `"dataspace": "default"` on create.
- Description max 255 characters. Field labels max 40 characters.
- Recipe that works: create empty → `add_semantic_model_data_object` (`dataObjectType: "Dmo"`, `dataObjectName: <stream>__dlm`, `shouldIncludeAllFields: false`) → add dimensions and measures with your own `apiName` and `dataObjectFieldName: <col>__c`.
- Field API names must be unique across the whole model; prefix repeated columns with the table.
- Field adds on different objects can run in parallel.
- Measure `dataType: "Currency"` fails ("missing a record currency field"). Use `Number` and format money in the viz.
- Never set `isVisible: false`. Hidden ID fields break filters and breakdowns. Leave unwanted fields out instead.
- Relationships: `joinType: "Auto"`, `cardinality: "ManyToOne"`, criteria `Equals` with `leftFieldType`/`rightFieldType: "TableField"` and semantic API names.
- GET may show `objectReferenceId: null` for connected objects. That's cosmetic.
- Some MCP tools take `modelApiNameOrId` (the data-object tool also needs `dataObjectNameOrId`); passing a differently named parameter gives a generic "Unexpected error".

## Calculated fields and metrics

- Row-level calc: `IF <cond> THEN x ELSE 0 END` (or simple `CASE`) with aggregation `Sum`. `IF … AND (… OR …)` is accepted.
- Ratio calc: `SUM(a)/SUM(b)` with `aggregationType: "UserAgg"`.
- Quotes in formulas and descriptions come back HTML-escaped (`&#39;`) but evaluate fine. Keep apostrophes out of descriptions.
- Clickable link field (for humans, not agents): calc dimension `dataType: "Url"`, `semanticDataType: "WebUrl"`.
- **Every metric needs a time dimension**, so a table with no date can't back a metric.
- Metric filters persist as `{fieldName: "Obj.field", operator: "Equals", values: [...]}`; the filter field must also be in `additionalDimensions`.
- Metric aggregation `Last` is rejected, and `isCumulative` breaks the card.
- Point-in-time measures (open pipeline) have no history to forecast; use the record's own date (close date) as the time dimension.

## Queries

- `run_semantic_query` needs top-level `semanticModelApiName` and `dataspace: "default"`, or it fails "SDM is not set".
- Quickest metric check: `structuredMetricQuery` `{model_api_name, submetric_definition: {metric_api_name}, time_grain: "Month"}` returns one row per month.
- `render_metric` may return a generic 400 for metrics created in the same session. Verify with a semantic query instead.
- Filter syntax that works: `flattenFilter {filterLogic: "1", filters: [{fieldName: "Obj.field", operator: "EqualsIgnoreCase", value: "Yes"}]}`. Grouping by a flag with COUNT is a reliable cohort check.
- Results return grouped dimensions before measures regardless of request order; order columns by `queryMetadata.fields[alias].placeInOrder`.

## Business preferences

- The update is a full replacement. One `# ` line per rule.
- Map plain-English phrasings to each flag ("deals gone quiet for 30 days" → the stalled flag). This is what lets the agent answer questions that never name the flag.
- Never write back preferences read from GET; regenerate them (apostrophes double-escape).
