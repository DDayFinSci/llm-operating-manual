# Fundamental Strategy Decision Tree (MSIF)
**Version 2.0 — Diagnostic Architecture**

---

## Decision Architecture Overview

```
Entry → Business Quality → Financial Strength → Valuation → Catalyst Validation → Portfolio Fit → Recommendation
```

---

## Stage 1: Business Quality Assessment

**Question:** Does the company possess durable competitive advantages?

| Decision Gate | Pass Criteria | Fail → Revise |
|---------------|---------------|----------------|
| **Moat Identification** | Specific moat type: scale economies, network effects, intangibles, switching costs. | Generic claims: "Strong brand" without supporting economics. |
| **Moat Durability** | Evidence of sustained pricing power or margin stability (5+ years). | Recent entrants gaining share; eroding margins. |
| **Industry Structure** | Competitive positioning quantified (market share trends, HHI, pricing dynamics). | Fragmented industry with low barriers; unsustainable margins. |

**Output Required:** Moat analysis section; competitive positioning data; margin trend analysis.

---

## Stage 2: Financial Strength Evaluation

**Question:** Can the company sustain and fund its thesis under stress?

### Solvency and Liquidity Decision Tree

```
Capital Structure Risk:
├─ Debt/EBITDA > 4x → High Leverage (Requires covenant analysis + DSCR > 1.5x)
├─ Debt/EBITDA 2-4x → Moderate Leverage (Verify interest coverage > 5x)
└─ Debt/EBITDA < 2x → Conservative (Proceed to liquidity check)

Liquidity Position:
├─ Current Ratio < 1.0 → Immediate Risk (Requires refinancing plan or asset sales)
├─ Current Ratio 1.0-1.5 → Monitor (Check cash conversion cycle and revolver availability)
└─ Current Ratio > 1.5 → Strong (Verify FCF generation supports growth CapEx)
```

| Decision Gate | Pass Criteria | Fail → Revise |
|---------------|---------------|----------------|
| **Debt Service Coverage** | DSCR ≥ 1.5x; covenant compliance history clean. | Covenant breaches or thin coverage (<1.3x). |
| **Cash Conversion** | Operating cash flow > Net Income; consistent FCF generation. | Negative FCF despite reported profitability (quality-of-earnings issue). |
| **Balance Sheet Flexibility** | Liquidity sufficient for 12+ months operations without external financing. | Burn rate unsustainable; refinancing risk within 18 months. |

**Output Required:** Solvency metrics table; covenant summary; FCF projection vs. capital needs.

---

## Stage 3: Valuation Analysis

**Question:** Does the valuation offer sufficient margin of safety?

### Valuation Method Selection

```
Company Profile:
├─ Mature, Stable FCF → DCF (Primary) + Relative Multiples (Secondary)
├─ High Growth, Negative FCF → DCF with detailed assumptions + Comparable Transactions
├─ Cyclical / Asset-Heavy → Sum-of-Parts + Replacement Cost + Relative Multiples
└─ Early Stage / Pre-Profit → Comparable Transactions + Revenue Multiples (Flag High Risk)
```

| Decision Gate | Pass Criteria | Fail → Revise |
|---------------|---------------|----------------|
| **DCF Discipline** | WACC justified (beta source, risk-free rate, ERP); terminal growth ≤ GDP + 1%. | Unrealistic terminal growth (>4%) or cherry-picked inputs. |
| **Scenario Rigor** | Bull and bear cases model *specific risks* with margin/revenue sensitivity. | Scenarios merely adjust discount rate; no operational stress testing. |
| **Margin of Safety** | Intrinsic value ≥ 20% above current price (mid-case); bear case > current price. | Narrow margin (<10%); bear case implies significant downside. |

**Output Required:** DCF model with sensitivity tables (WACC, perpetuity growth); scenario P&L assumptions; margin-of-safety calculation.

---

## Stage 4: Catalyst Validation

**Question:** Is there an identifiable, time-bound catalyst that will close the valuation gap?

### Catalyst Classification and Evidence Requirements

| Catalyst Type | Required Evidence | Red Flags |
|---------------|-------------------|-----------|
| **Earnings Inflection** | Margin expansion tied to specific cost initiative or revenue driver; management guidance. | Vague claims: "Operational improvements expected." |
| **M&A / Corporate Action** | Precedent transactions in sector; activist involvement; management commentary. | Speculation without basis: "Could be acquired." |
| **Product Launch / Approval** | FDA calendar, patent expiry dates, confirmed launch timelines. | "New product pipeline" without specifics or timing. |
| **Market Re-Rating** | Peer multiples expansion with sector tailwinds; sell-side estimate revisions. | "Market will recognize value" (passive hope, not catalyst). |

| Decision Gate | Pass Criteria | Fail → Revise |
|---------------|---------------|----------------|
| **Catalyst Timing** | Event horizon ≤ 18 months; specific date or trigger identified. | Open-ended: "Eventually the market will realize..." |
| **Catalyst Probability** | Supporting evidence from management, industry trends, or historical precedent. | Pure speculation without substantiation. |
| **Thesis Linkage** | Catalyst directly addresses the source of current mispricing. | Catalyst unrelated to core valuation thesis. |

**Output Required:** Catalyst roadmap with timeline; supporting evidence (transcripts, filings, industry reports).

---

## Stage 5: Portfolio Fit Assessment

**Question:** How does this position interact with existing fund exposures?

| Decision Gate | Pass Criteria | Fail → Revise |
|---------------|---------------|----------------|
| **Sector Concentration** | Addition keeps sector weight within policy limits (typically <25% per sector). | Overconcentration risk in single sector. |
| **Factor Exposure** | Position doesn't create unintended factor tilt (e.g., excessive value or growth loading). | Amplifies existing bias; reduces diversification. |
| **Risk Contribution** | Marginal contribution to portfolio volatility justified by expected alpha. | High idiosyncratic risk without commensurate return expectation. |
| **Correlation Context** | Low correlation (<0.60) with largest existing positions; enhances diversification. | High overlap with current holdings; redundant exposure. |

**Output Required:** Sector allocation table (current vs. proposed); correlation with top 10 holdings; simulated portfolio metrics.

---

## Final Recommendation Decision Matrix

| Scenario | Business Quality | Financial Strength | Valuation MoS | Catalyst | Portfolio Fit | Recommendation |
|----------|------------------|-------------------|---------------|----------|---------------|----------------|
| 1 | ✓ | ✓ | ✓ (>20%) | ✓ | ✓ | **BUY** (Initiate position per policy limit) |
| 2 | ✓ | ✓ | ✓ (10-20%) | ✓ | ✓ | **BUY** (Smaller initial position; scale on confirmation) |
| 3 | ✓ | ✓ | ✓ | ✗ | ✓ | **HOLD** (Monitor for catalyst emergence) |
| 4 | ✓ | ✓ | ✗ (<10%) | — | — | **DO NOT BUY** (Insufficient margin of safety) |
| 5 | ✓ | ✗ | — | — | — | **DO NOT BUY** (Financial risk overrides thesis) |
| 6 | ✗ | — | — | — | — | **DO NOT BUY** (No durable competitive advantage) |

---

## Key Anti-Patterns to Avoid

| Anti-Pattern | Why It Fails | Corrective Action |
|--------------|--------------|-------------------|
| **Speculative Catalysts** | "Could be acquired" without evidence. | Require concrete timeline and supporting data. |
| **Valuation Inconsistency** | DCF uses aggressive assumptions; comparables ignored. | Cross-validate methods; explain divergence. |
| **Financial Health Disconnect** | Strong thesis but weak balance sheet. | Solvency analysis must inform conviction level. |
| **Portfolio Blindness** | Analyzes position in isolation. | Every pitch must address portfolio interaction. |

---

## Special Considerations for MSIF Context

**Fundamental vs. Systematic:**
- Fundamental strategies require *company-specific* catalysts and deep business analysis.
- If thesis relies primarily on factor exposure (value, quality, momentum), consider systematic framework instead.
- Hybrid strategies (quantitative screens + fundamental overlay) must clearly delineate which component drives alpha.

**Position Sizing Guidance:**
- High conviction (passes all gates with strong evidence): 4-6% of portfolio
- Moderate conviction (narrow MoS or uncertain catalyst timing): 2-3% of portfolio
- Speculative (single gate weakness): <2% or reconsider entirely

---

## Summary Principle

Every fundamental recommendation must demonstrate durable business quality, financial resilience, attractive valuation with margin of safety, a credible catalyst, and portfolio compatibility.

Weak catalyst or narrow valuation margin = reduced position size or "Do Not Buy."

---

**Framework Version:** 2.0  
**Last Updated:** November 2025  
**Maintained By:** Darrell Day, MSIF TA
