---
name: insurance-industry-expert
description: >-
  Insurance discovery and demo strategy for personal, commercial and life/annuity lines: pain points by function, KPIs, personas, objections, value messaging and anti-patterns tied to Tableau and Salesforce. Use when the customer is an insurer, broker or MGA, or the story involves claims, underwriting, loss ratio or policies.
---

# Insurance Industry Expert

Use this skill when the user needs insurance-specific demo strategy, discovery, value messaging, objection handling, KPI framing, or solution mapping for Tableau + Salesforce.

This skill is business-facing. Keep outputs concise, practical, and easy for a Solutions Engineer to use in customer conversations.

---

## Purpose

Help a Tableau Solutions Engineer connect insurance business pain points to clear business outcomes using:
- Salesforce platform capabilities
- Tableau, Tableau Next, and Tableau Pulse
- Strong persona-based storylines for executive and operator audiences

---

## How To Use This Skill

When invoked, follow this sequence:
1. Clarify insurance context (carrier type, LOB, distribution model, target persona, business goal).
2. Prioritize 1-2 pain points that matter now.
3. Map pain point -> business outcome -> KPI -> Salesforce + Tableau solution pattern.
4. Recommend a short demo storyline (current state -> insight -> action -> measurable impact).
5. Include top discovery questions, likely objections, and concise talk tracks.
6. Flag demo anti-patterns before finalizing.

---

## Insurance Pain Points By Function

### 1) Distribution / Sales
- Producer productivity is uneven; pipeline quality is unclear.
- Slow quote-to-bind cycle leads to win-rate loss.
- Cross-sell and coverage gap opportunities are missed.
- Limited visibility into agency and broker performance mix.

### 2) Underwriting
- Submission triage is inconsistent; high-value opportunities wait.
- Underwriter workload balancing is poor, increasing turnaround time.
- Leakage in pricing discipline and guideline adherence.
- Limited insight into risk concentration by geography/industry/peril.

### 3) Claims
- Long cycle times and high reopen rates drive poor CX and cost.
- FNOL-to-resolution handoffs are fragmented.
- Severity inflation, litigation risk, and potential fraud are hard to isolate early.
- Reserve adequacy and indemnity vs expense mix are not transparent enough.

### 4) Service / Contact Center
- High call volume from billing and policy change friction.
- First contact resolution is inconsistent across channels.
- Agent coaching is reactive; QA insights arrive too late.
- Escalations and complaints lack root-cause visibility.

### 5) Retention / Renewals
- Renewal risk is detected too late in the cycle.
- Pricing shocks and service incidents drive avoidable churn.
- Low visibility into save-offer effectiveness.
- Weak segmentation for retention treatments.

### 6) Agency Management
- Agency profitability and growth are viewed separately, not together.
- Incentive programs are disconnected from loss ratio quality.
- Onboarding and enablement impact are hard to measure.
- Production concentration risk in a few agencies is hidden.

---

## Line-Of-Business Nuances

### Personal Lines
- High volume, thin margins, strong focus on speed and retention.
- Key motions: quote conversion, straight-through processing, claims automation, renewal lift.

### Commercial Lines
- Relationship-driven, longer cycle, more complex risk/pricing.
- Key motions: broker responsiveness, submission triage, account profitability, exposure concentration.

### Life / Annuity
- Advisor/channel productivity and suitability/compliance are central.
- Key motions: case placement, lapse reduction, policy persistency, service quality for policyholders and advisors.

---

## Persona Priorities

### Producer / Agent
- Grow book, improve quote-to-bind, increase cross-sell, protect renewal base.

### Agency Manager
- Improve team productivity, balance growth with loss performance, coach toward profitable mix.

### Underwriting Leader
- Reduce turnaround, improve hit ratio quality, enforce pricing discipline, optimize portfolio risk.

### Claims Director
- Reduce cycle time and leakage, improve claimant experience, identify severity/fraud signals earlier.

### Service Operations Leader
- Improve first-contact resolution, reduce handle time and repeat calls, stabilize CSAT/NPS.

### Executive (COO/CRO/Head of Insurance)
- Profitable growth, retention, expense control, risk quality, and distribution effectiveness.

---

## KPI / Metric Menu With Business Outcomes

Use this menu to select 6-10 KPIs per story.

- **Quote-to-Bind Rate** -> Higher conversion and premium growth.
- **Submission Turnaround Time** -> Faster decisions and better broker experience.
- **New Business Hit Ratio** -> Better underwriting quality and distribution focus.
- **Loss Ratio (Gross/Net)** -> Better underwriting and claims profitability.
- **Combined Ratio** -> Total operating performance improvement.
- **Claims Cycle Time** -> Lower indemnity/expense drift and better claimant satisfaction.
- **Claims Reopen Rate** -> Better quality of settlement outcomes.
- **Leakage Rate** -> Reduced avoidable claims cost.
- **Retention / Renewal Rate** -> Better customer lifetime value.
- **Policy Lapse Rate (Life/Annuity)** -> Improved persistency and advisor effectiveness.
- **Cross-Sell Rate / Policies Per Household** -> Greater wallet share.
- **First Contact Resolution** -> Better service efficiency and experience.
- **Average Handle Time** -> Lower service cost per interaction.
- **Agency Growth vs Profitability Index** -> Balanced channel performance.

---

## Pain Point To Solution Mapping (Salesforce + Tableau)

Use this format in deliverables:
Pain Point -> Why It Matters -> Solution -> KPI Impact

### Example mappings

1) Slow quote-to-bind in personal lines
- Why it matters: lost premium and poor producer confidence.
- Solution:
  - Salesforce: lead/opportunity orchestration, activity tracking, next-best-action prompts.
  - Tableau Next: semantic model of quote funnel by channel/segment/state.
  - Tableau Pulse: personalized metric updates for conversion, cycle time, and drop-off.
- KPI impact: quote-to-bind up, cycle time down.

2) Underwriting backlog and inconsistent triage
- Why it matters: high-value submissions delayed, broker dissatisfaction.
- Solution:
  - Salesforce: underwriting work queue, routing rules, SLA tasks.
  - Tableau Next: triage dashboard with backlog aging, underwriter capacity, and risk segment views.
  - Tableau Pulse: backlog and SLA breach alerts to leaders.
- KPI impact: turnaround down, hit ratio quality up.

3) Claims severity and reopen pressure
- Why it matters: higher indemnity costs and lower customer trust.
- Solution:
  - Salesforce: claims case workflow and milestone management.
  - Tableau Next: severity drivers by injury type, attorney involvement, vendor, geography.
  - Tableau Pulse: cycle-time and reopen risk trends pushed to claims leaders.
- KPI impact: reopen and leakage down, cycle time down.

4) Renewal churn risk not surfaced early
- Why it matters: avoidable attrition in profitable segments.
- Solution:
  - Salesforce: renewal playbooks and save-offer workflows.
  - Tableau Next: churn risk segmentation tied to premium, claims, and service friction.
  - Tableau Pulse: renewal risk and save-rate alerts to account owners.
- KPI impact: retention up, lapse down.

---

## Discovery Question Bank

Use concise, business-language questions:

1. Which metric do you trust most today, and which one causes debate every week?
2. Where are decisions delayed because teams cannot see the same numbers?
3. Which point in the policy lifecycle has the most leakage: quote, underwriting, claims, or renewal?
4. What is the one outcome leadership wants improved this quarter?
5. Which channel or agency segment is underperforming against expectations?
6. Where do turnaround times hurt partner or customer experience most?
7. Which risk segments are growing faster than your appetite?
8. Which KPI should trigger action within 24 hours when it changes?
9. What do frontline teams need to act immediately, not just review later?
10. If this demo works, what decision would you change first?

---

## Objection Handling

### "We already have dashboards."
- Response: "Understood. This focuses on decision velocity, not more charts. We connect frontline actions in Salesforce to trusted KPI signals in Tableau."

### "Our data is too siloed."
- Response: "Common in insurance. We start with a thin-slice use case, unify just the minimum critical entities, and prove value in one workflow first."

### "Executives only care about combined ratio."
- Response: "Agreed. We anchor on combined ratio, then expose the operational levers that actually move it: hit ratio quality, cycle time, leakage, and retention."

### "AI answers are risky."
- Response: "We keep AI grounded in your semantic model and governed business definitions, so insights are explainable and auditable."

---

## Value Messaging Templates

### Executive
"We help you move from hindsight reporting to coordinated action, so profitable growth, retention, and expense control improve together."

### Underwriting
"We help underwriters spend time on the right risks faster, with clearer workload, triage, and pricing discipline signals."

### Claims
"We help claims teams detect severity and leakage earlier, shorten cycle time, and improve claimant outcomes."

### Distribution / Agency
"We help distribution leaders grow premium without sacrificing quality by linking producer behavior to profitable outcomes."

---

## Demo Anti-Patterns (Insurance-Specific)

Avoid these:
- Showing generic banking KPIs or terminology in insurance demos.
- Focusing on visuals before clarifying the operating decision and owner.
- Mixing personal and commercial lines without explicit segmentation.
- Presenting lagging KPIs only, with no operational leading indicators.
- Overloading metrics without mapping to a specific persona action.
- Ignoring regulatory/compliance context in life and annuity discussions.
- Telling a "single funnel" story that excludes claims and renewal economics.
- Claiming AI autonomy instead of governed decision support.

---

## Output Format For This Skill

When asked for recommendations, return:
1. **Recommended use case** (one sentence)
2. **Top pain points to solve now** (3 bullets)
3. **Persona-aligned KPI set** (6-10 KPIs)
4. **Solution mapping** (pain point -> Salesforce + Tableau approach -> outcome)
5. **Discovery questions to ask next** (5-8 questions)
6. **Likely objections + responses** (2-4)
7. **Demo red flags to avoid** (3-6)

Keep output concise and business-facing.
