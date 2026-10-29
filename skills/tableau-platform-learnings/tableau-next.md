# Tableau Next: visualizations and dashboards

## Visualizations

- Create: `POST /services/data/v67.0/tableau/visualizations?minorVersion=12`. Read with `minorVersion: -1` via MCP.
- The slim MCP `create_visualization` works for Line, Bar, Bar + Color and Donut. Maps and Sankey need the full REST body.
- **Calc measure binding:** omit `objectName`. The MCP tool wants `level` copied from the calc (`function: UserAgg` for aggregate calcs); the **REST** body rejects `level` (`Unrecognized field "level"`).
- Any new encoded field needs a `style.encodings.fields.<key>` entry or the write fails ("encodings style is required").
- Date fields: `DateTruncMonth`, `displayCategory: "Continuous"`. A `DateRange` filter needs a continuous date.
- Line width can't be changed in the UI. Set it at creation: `style.marks.ALL.size {isAutomatic: false, type: Pixel, value: 2}`.

### By chart type

- **Line:** optional `visualSpecification.forecasts` (RidgeRegression) and reference lines (Average or a target).
- **Bar + Color:** stacked for additive measures; for rates, put both dimensions on rows with stacking off.
- **Donut:** `layout: "Radial"`, Angle on the measure, Color + Label on the category.
- **Funnel:** Bar marks, stacked, label + color encodings, `marks.panes.connector.type: "Origami"`, centered stacking axis, fit `Entire`. Several count measures: Measure Names on rows, Measure Values on columns. Don't use a KPI filtered on the funnel's own stage column.
- **Heatmap:** create with Square marks, then PATCH the pane to **Bar** marks: bars fill each cell and center labels. `style.fit` accepts only `Entire`/`Standard`. Labels ignore number formats, so label with a `ROUND(AVG(...), 0)` calc. Diverging color only for change measures; rates are sequential.
- **Scatter:** compare like with like (rates/averages on axes, a total as size). Size needs a pixel range (`isAutomaticSize: false`, `size {min 5, max 18, type Pixel}`) or bubbles cover each other.
- **Table:** `layout: "Table"`, one row per category value, 1–3 measures.
- **Metric picker:** a List/Text parameter plus `CASE [Parameters].[P] WHEN 'Label' THEN <aggregate> … END` (UserAgg); the chart binds the calc and a parameter widget sits above it.
- **Dot map** (no filled maps exist): `layout: "Map"`, Circle marks, `locations: ["F3"]`, light map background.
  - F1 longitude, F2 latitude: `type Field, role Dimension, displayCategory Continuous`.
  - F3: `type MapPosition, role Dimension, displayCategory Continuous, longitudeOrX: F1, latitudeOrY: F2`.
  - F4: the location as a discrete Detail (one dot and tooltip per place).
  - F5: the size measure. **Requires** `style.encodings.fields.F5` with a number format and `size {isAutomatic: false, min, max, type: Pixel}`, or create fails.
  - The model averages coordinates; size by a Sum or Count, never a rate.
- **Sankey:** `layout: "Flow"`, `levels: [F1, F2, …]`, `link: <measure key>`, `marks.fields.<level>` = Bar with Color on a second copy of the level field, plus `marks.nodes` (Bar) and `marks.links` (Line). The full `style` block is required ("Value required for [shading]"). 2–12 values per level.
- **Radial family (newer API versions):** `layout: "Radial"` with Donut or Bar panes plus Detail encodings. Fragile; start from a working spec.
- A Text/key column as a measure plots `CountD` of it.

## KPI cards (metric widgets)

- Widget: `{type: "metric", source: {id: <metric id>, name: <metric apiName>}, parameters: {metricOption: {sdmApiName, sdmId, layout: {componentVisibility: {...}}}}}`. Both `id` and `name` are required.
- Compact cards need `rowspan: 9`; with the history chart on, `rowspan: 11`.
- Cards default to the full data range, so they show all-time totals. A Sum KPI then disagrees with a trend line's last point unless you design for it.
- Cards can't forecast. For a forecast, add a Line viz with `forecasts`.
- **Pattern that looks real:** a daily snapshot table (one row per day for 12+ months, split by one dimension) with visible noise. Sum/Count metric = `SUM(value)/COUNTD(snapshot_date)`; rate metric = `SUM(numerator)/SUM(denominator)`. Plot trend lines from the same table so card, chart and script agree.
- **Card period filter:** a dashboard filter `Between [start, end]` with fixed dates (e.g. the last 42 days vs the 42 before). `LastNDays` works but labels the card "All"; `Last30Days`, `LastN`, `Relative`, `Today`, `LastNMonths` are rejected. Fixed dates mean the demo ages: rebuild before presenting an old one.
- The comparison reads "no data" when history is shorter than twice the range.

## Dashboards

- `create_dashboard` needs `minorVersion: -1`, `maxWidth: 1200` and a style block, or the canvas renders blank.
- The MCP `create_dashboard` may create only an empty scaffold (one layout, one page). Then write widgets and layout with one REST PATCH to `/tableau/dashboards/{name}`, keeping the server's layout and page names.
- POST requires `workspaceIdOrApiName`, `layouts[].name`, and `pages[].name` (UUID) + `label`. A visualization widget source is `{id}` only.
- **REST PATCH accepts fewer widget settings than create.** Keep: text `content, conditionalFormattingRules, receiveFilterSource`; visualization `legendPosition, receiveFilterSource`; metric `metricOption, receiveFilterSource, widgetStyle`; parameter `isLabelHidden, parameterName, viewType`; filter `filterOption, isLabelHidden, viewType`; plus `actions: []`. It rejects `receiveParameterSource`, `verticalAlignment` and filter `publishers`.
- **Avoid MCP dashboard updates** after cards and filters exist: they unhook cards from the period filter. The REST PATCH restores it.
- `&` in labels gets escaped on every read-modify-write. Unescape before writing, or write "and".
- **Header text widgets:** Quill delta `[{"attributes":{"bold":true,"size":"16px"},"insert":"<Header>"},{"attributes":{"align":"center"},"insert":"\n"}]`. `textContent` alone comes out left-aligned and unbolded.
- **Navigation buttons:** `button` widgets with `{"actionType": "navigate", "eventType": "click", "parameters": {"destination": {"type": "dashboard", "target": "<dashboard API name>"}}}`. `"type": "page"` is for pages inside one dashboard.

### Filters

- A filter on a table a chart can't reach through relationships breaks that chart ("Can't show visualization"). Give each chart an include list of only the filters it can reach (`{"filterMode": "include", "widgetIds": [...]}`, empty list when none). The PATCH rejects `"none"` on charts.
- Filters must ignore each other (`{"filterMode": "none", "widgetIds": []}` on each filter widget, no `publishers` key), or the period filter makes the other value lists say "Error getting data".
- Adding a filter can drop the labels of earlier filters; one PATCH after the last filter restores them.
- Filter widget shape: `{type: filter, name, label, source {id, name} = model, parameters {filterOption {dataType, fieldName, objectName, selectionType}, isLabelHidden, viewType: list}, initialValues.details {fieldName: "Obj.field", operator, values}}`.

## Branding

- Viz PATCH (`/tableau/visualizations/{id}?minorVersion=12`) sets mark color (`style.marks.panes.color.color`), custom palettes and text colors. Dashboard PATCH sets title/header text and gutter colors.
- There is no font setting in Tableau Next. Metric `borderColor` saves but doesn't draw in view mode.
- Keep titles at 4.5:1 contrast and marks at 3:1; darken light brand colors.

## Screenshots

- MCP render tools return widget data, not images. For real screenshots, log a headless browser in through frontdoor with the org session and open `/tableau/visualization/{name}/view` or the dashboard. Capture full-page: the canvas scrolls inside the page.

## Self-repair pattern for refused payloads

On a 400/422, strip the field an `Unrecognized field "X"` error names and retry, up to 3 attempts, then fall back to a plain bar or line with the same fields. Save fixes that worked and apply them before the next send. Only retry payload refusals, never 401/409/5xx, and never the DLO → DMO mapping.
