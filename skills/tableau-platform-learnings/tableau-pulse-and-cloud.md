# Tableau Pulse and Tableau Cloud

## Pulse API

- Definitions: `POST /api/-/pulse/definitions`; default metric: `/metrics:getOrCreate`; scoped copies with a filter (`OPERATOR_EQUAL`); follow: `POST /subscriptions` (409 means already following).
- Check insights: `POST /api/-/pulse/insights/detail` with `OUTPUT_FORMAT_TEXT`. Match by insight type: `top-drivers` / `top-detractors` (names the value first), `riskmo`, `unusualchange` ("above/below the expected range"), `newtrend` / `currenttrend`. Each insight also carries a Vega-Lite chart and Pulse's own question wording.
- Use `GRANULARITY_BY_MONTH` + `RANGE_LAST_COMPLETE` vs the previous period; plant changes from the 1st of the last complete month. `TIME_COMPARISON_YEAR_AGO_PERIOD` gives a cleaner headline when months have different lengths.
- Pulse's default view is monthly: about 12 months on the unusual-change chart, 18–20 on the trend chart. Last month by day is 28–31 points.
- Pulse's "why" only uses dimensions allowed on the definition.
- A shrinking book can flatten year-over-year counts even when frequency rises. Tune new-business volume before trusting a count metric.
- Deleting a definition removes its metrics and follows; then delete the data source.
- Web links: home `https://<pod>/pulse/site/<site>`, metric `/pulse/site/<site>/metrics/<metric_id>`.

## Tableau Cloud auth

- Use a dedicated personal access token per tool: one session per PAT, and a second sign-in ends the first.
- Read the PAT in-process from its config file; passing it through a shell environment block caused 401s.

## Generating workbooks in code

- A `.twbx` is a zip of one `.twb` plus `Data/Extracts/<name>.hyper`. The datasource is a `federated` connection wrapping a `hyper` connection (`schema='Extract' tablename='Extract'`).
- Each worksheet declares fields in `datasource-dependencies` (a `column` plus a `column-instance` like `[sum:Field:qk]`, `[none:Field:nk]`, `[tmn:Date:qk]`) and references `[datasource].[instance]` on rows/cols.
- A dashboard is rejected ("references sheet … which has no visual representation") unless its `<window class='dashboard'>` lists a `<viewpoint>` per sheet.
- Publish: `POST /sites/{id}/workbooks?workbookType=twbx&overwrite=true`. Check the result with `GET /views/{id}/image` (add `vf_<Field>=<value>` to render a filtered or parameter state).
- **Category colors** don't apply to a plain extract column. Color by a calc `ATTR([Col])` and map colors in the datasource `<style>` by the plain calc name (`[Calculation_x]`), not the instance name; the datasource needs a `<layout/>` before its `<style>`.
- **Filled map:** state column `semantic-role='[State].[Name]'`, a country semantic value, generated lat/long on rows/cols, `Multipolygon` mark with the generated geometry, and `<mapsources>` in the view and workbook.
- **Donut:** two zero-calc axes with a folded `space` encoding (or there's no hole), a colored Pie pane and a white Pie pane on top.
- **KPI text cards:** Text marks with a custom label; colored ▲/▼ from two string calcs that are null when they don't apply.
- Tableau Cloud can't draw web fonts. Map brand fonts to Tableau Book, Arial, Georgia, Trebuchet MS, Verdana, Times New Roman, Tahoma or Courier New.
- Zones are in 100000ths of the page size. Hide helper sheets with `hidden='true'` on their windows.
- REST can publish a workbook, but can't author sheets in an existing one. Tableau Agent demos usually start from a published source the SE builds sheets on.

## Embedding

- Direct Trust connected app (site admin): `POST /api/3.24/sites/{site}/connected-apps/direct-trust` with `domainSafelist` (space-separated), then `POST …/{clientId}/secrets`.
- JWT (HS256): header `{alg, typ, kid: secret_id, iss: client_id}`, payload `{iss, aud: "tableau", sub: <user>, scp: ["tableau:views:embed"], jti: uuid, exp: +10 min}`. One token per page load; `jti` is single use.
- `<tableau-viz src="https://<pod>/t/<site>/views/<Workbook>/<View>" token="<jwt>" toolbar="hidden" hide-tabs>` with the Embedding API v3 script. Allow the pod in CSP `script-src`, `frame-src` and `connect-src`.
- The allowed-domain list is checked against the page's origin (scheme + host + port). Add every origin you'll demo from.

## Tableau Agent (Tableau Cloud)

- **Dashboard Q&A** answers what/why questions with text and tables. It can't create charts.
- **Web authoring** writes and explains calcs and builds charts on request: name the chart type and the fields ("Create a stacked bar chart of Deposits by relationship manager, colored by last contact, for the West"). There's no API for it; try the ask once before the meeting.
- Neither can create Salesforce records, send email or change data. Say the next step out loud.
