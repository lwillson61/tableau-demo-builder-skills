# End-to-End Tableau Demo Builder Skill

Master orchestrator skill for full Tableau Next or Pulse demo delivery.

## What This Skill Covers

- Discovery and POV framing
- Industry-specific narrative design
- Synthetic data generation
- Data Cloud ingest + semantic layer
- Visualization design and dashboard composition
- Pulse metric/group workflows
- Self-critique and quality gating

## End-to-End Runbook

1. **Discovery**
   - Capture company context, business challenge, personas, and success metrics.
2. **Story blueprint**
   - Define demo arc: KPI context -> trend -> drivers -> action.
3. **Data design**
   - Model entities/events, create realistic synthetic signals, and document dictionary.
4. **Ingest + semantic**
   - Register schema, create stream, ingest data, build SDM, validate fields.
5. **Build assets**
   - Tableau Next: workspace, visualizations, dashboards, interactions.
   - Tableau Pulse: metrics, groups, digest targeting.
6. **Visual design pass**
   - Validate chart-type choice and layout clarity.
7. **Devils-advocate pass**
   - Critique, prioritize fixes, and close high-risk gaps.
8. **Delivery pack**
   - Provide run-of-show, concierge questions, and expected business actions.
9. **Memory update (mandatory)**
   - Append session learnings to `memory/MEMORY.md`.

## Hard Rules

- Build from business question, not from chart novelty.
- Reproducibility is non-negotiable (seeded generation + deterministic scripts).
- Never claim success without validation gates.
- Prefer fresh construction over cloning; if fragile API requires baseline recipes, disclose it.
- Keep explanations plain-English and action-oriented.
- Always persist learnings into `memory/MEMORY.md` before ending session.

## Definition of Done

- Data is ingested and model is queryable.
- Required visual assets exist and are usable.
- Visuals answer the intended business questions.
- Critique findings are addressed or explicitly documented.
- Another SE can rerun with minimal setup and get equivalent results.
