# Tableau Pulse Demo Builder Skill

Use this skill for Pulse-first demos focused on metrics, digesting, and alerting behavior.

## Outcome

Deliver a Pulse demo with:
- clear metric taxonomy,
- realistic metric behavior over time,
- subscriptions/grouping configured for role-based consumption.

## Pulse Build Sequence

1. Define business metric set by type:
   - **Flow** (sum over period): volume, revenue, count.
   - **Average/Rate**: score, conversion rate, ratio.
   - **Snapped** (point-in-time): balance, pipeline, headcount.
2. Validate metric semantics and time grain.
3. Publish datasource and verify freshness.
4. Create Pulse metrics via API.
5. Create groups/subscriptions with role-based naming.
6. Confirm metric cards and digest behavior.

## Design Best Practices

- Use plain-language metric names.
- Keep metric catalog focused; avoid noisy long tails.
- Ensure every metric supports an action question:
  - What changed?
  - Why did it change?
  - What should I do next?

## Quality Checks

- Time grain aligns to metric semantics.
- Threshold/anomaly logic is explainable.
- Dimensional slices are meaningful and limited.
- Digest recipients map to business owners.
