# Systematic Strategy Decision Tree (MSIF)
**Version 2.0 — Diagnostic Architecture**

---

## Decision Architecture Overview

```
Entry → Thesis Definition → Rule Design → Data Validation → Benchmark Fit → Portfolio Role → Implementation → Recommendation
```

---

## Stage 1: Thesis Definition and Inefficiency Mapping

**Question:** What specific market inefficiency does this systematic strategy exploit?

### Inefficiency Classification Framework

| Inefficiency Type | Mechanism | Representative Papers | Expected Behavior |
|-------------------|-----------|----------------------|-------------------|
| **Structural Constraint** | Leverage limits force risk-seeking in high-beta assets. | Frazzini & Pedersen (2014) — Betting Against Beta | Outperforms when leverage constrained; risk-off regimes. |
| **Behavioral Mispricing** | Investors neglect stable, unsexy quality firms. | Asness et al. (2019) — Quality Minus Junk | Outperforms during behavioral corrections; late-cycle. |
| **Compositional Effect** | "Defensive" portfolios overweight profitable, cheap firms. | Novy-Marx (2014) — Understanding Defensive Equity | Outperforms via embedded value and profitability factors. |
| **Information Diffusion** | Momentum reflects slow incorporation of news. | Jegadeesh & Titman (1993) | Outperforms in trending markets; reverses in panic. |

| Decision Gate | Pass Criteria | Fail → Revise |
|---------------|---------------|----------------|
| **Inefficiency Clarity** | Explicitly classified as structural, behavioral, compositional, or information-based. | Vague: "Undervalued stocks" without economic mechanism. |
| **Academic Foundation** | Supported by peer-reviewed research spanning 10+ years, multiple markets. | Single backtest or proprietary claim without external validation. |
| **Economic Persistence** | Explains *why* inefficiency persists despite rational arbitrage. | Assumes mispricing without explaining survival mechanism. |

**Output Required:** One-paragraph thesis statement identifying inefficiency type, mechanism, and expected regime sensitivity.

---

## Stage 2: Rule Design and Screening Criteria

**Question:** Do the screening rules directly exploit the identified inefficiency?

### Factor-to-Inefficiency Mapping

| Target Inefficiency | Required Screening Factors | Avoid Mixing |
|---------------------|---------------------------|--------------|
| **Low Beta / BAB** | Beta < 0.80; volatility < market. | Do not add momentum (conflicting signal). |
| **Quality (QMJ)** | Profitability (ROE, ROIC), low leverage, stable earnings growth. | Avoid high-growth or speculative screens. |
| **Defensive Equity** | Low beta + profitability (ROE > 15%) + value (P/E < median). | Recognize factor overlap with quality and value. |
| **Momentum** | 12-month return > market; avoid 1-month reversal window. | Do not combine with mean-reversion screens. |

| Decision Gate | Pass Criteria | Fail → Revise |
|---------------|---------------|----------------|
| **Rule-Thesis Alignment** | Screening criteria operationalize the stated inefficiency. | Rules unrelated to thesis (e.g., quality thesis but only revenue screens). |
| **Parameter Justification** | Thresholds defended by literature or historical optimization. | Arbitrary cutoffs: "Beta < 0.75 feels right." |
| **Signal Clarity** | Binary or ranked criteria; no discretionary overrides. | "Systematic with qualitative adjustments" (contradictory). |

**Output Required:** Screening methodology table; parameter justification section; example portfolio construction from live data.

---

## Stage 3: Data Validation and Backtest Integrity

**Question:** Is the supporting evidence robust and free from data-mining bias?

| Decision Gate | Pass Criteria | Fail → Revise |
|---------------|---------------|----------------|
| **Out-of-Sample Testing** | Strategy validated across multiple decades; includes crisis periods (2008, 2020). | Backtest limited to post-2008 or single regime. |
| **Survivorship Bias** | Dataset includes delisted / bankrupt companies. | Uses only current index constituents (inflates returns). |
| **Transaction Cost Realism** | Accounts for spreads, turnover, market impact (assume 15-30 bps per trade). | Assumes zero-cost execution; ignores illiquidity. |
| **Rebalancing Specification** | Frequency defined (monthly, quarterly); turnover estimated. | Vague: "Rebalance as needed." |

**Output Required:** Performance table with transaction-cost-adjusted returns; turnover analysis; crisis-period performance.

---

## Stage 4: Benchmark Fit and Performance Evaluation

**Question:** Does the strategy deliver superior risk-adjusted returns vs. the *appropriate* benchmark?

### Benchmark Selection Decision Tree

```
Strategy Intent:
├─ Defensive / Low Volatility
│   └─ Benchmark: MSCI USA Min Vol Index (NOT S&P 500)
│
├─ Quality Focus
│   └─ Benchmark: MSCI USA Quality Index or S&P 500 Quality
│
├─ Value Tilt
│   └─ Benchmark: Russell 1000 Value or S&P 500 Value
│
├─ Momentum
│   └─ Benchmark: MSCI USA Momentum or S&P 500 (with momentum factor adjustment)
│
└─ Multi-Factor (e.g., Defensive Quality)
    └─ Benchmark: Blend of factor indices or construct synthetic benchmark
```

**Critical Rule:** Defensive strategies benchmarked to S&P 500 will appear weak due to beta mismatch. This does NOT invalidate the strategy.

| Decision Gate | Pass Criteria | Fail → Revise |
|---------------|---------------|----------------|
| **Benchmark Justification** | Benchmark matches strategy's factor tilts and volatility profile. | S&P 500 default for low-beta strategy (benchmark mismatch). |
| **Alpha Significance** | α > 0.5% annually vs. matched benchmark (t-stat > 1.5). | Negative alpha vs. appropriate benchmark. |
| **Sharpe Improvement** | Sharpe ratio ≥ benchmark + 0.10. | Marginal or negative Sharpe differential. |
| **Downside Protection** | Sortino ratio or max drawdown superior to benchmark during stress. | Higher drawdowns without compensating upside. |

**Output Required:** Performance comparison table (strategy vs. matched benchmark vs. S&P 500 for context); statistical significance testing; regime analysis.

---

## Stage 5: Portfolio Role and Diversification

**Question:** What role does this strategy serve within MSIF's portfolio?

### Portfolio Role Classification

| Role | Expected Contribution | Correlation Profile | Allocation Guidance |
|------|----------------------|---------------------|---------------------|
| **Defensive Hedge** | Reduces portfolio volatility; limits drawdowns. | Low correlation (< 0.60) with growth-oriented positions. | 10-15% allocation (stabilizer). |
| **Factor Diversification** | Adds exposure to under-represented factor (e.g., quality). | Moderate correlation (0.40-0.70); fills gap in factor map. | 5-10% allocation (diversifier). |
| **Return Enhancer** | Targets alpha generation; accepts higher volatility. | Variable correlation; evaluated on standalone risk-adjusted return. | Position size based on conviction and capacity. |
| **Redundant Exposure** | Overlaps with existing positions; adds little incremental value. | High correlation (> 0.75) with current holdings. | Reconsider or rotate out similar position. |

| Decision Gate | Pass Criteria | Fail → Revise |
|---------------|---------------|----------------|
| **Correlation Analysis** | Correlation matrix with existing systematic positions reported; < 0.70 preferred. | High overlap with current strategies (redundancy). |
| **Portfolio Simulation** | Demonstrates reduction in portfolio volatility OR improvement in Sharpe ratio. | Negative contribution to total portfolio risk-adjusted return. |
| **Factor Map Integration** | Shows positioning on factor space (value, quality, momentum, low-vol); identifies gaps or overlaps. | Factor loadings unreported or ignored. |

**Output Required:** Correlation matrix; simulated portfolio metrics (pre/post addition); factor exposure map.

---

## Stage 6: Implementation Feasibility

**Question:** Can MSIF execute this strategy within operational and regulatory constraints?

| Decision Gate | Pass Criteria | Fail → Revise |
|---------------|---------------|----------------|
| **US Long-Only Compliance** | Strategy limited to US-listed equities; no derivatives, leverage, or shorts. | Requires restricted instruments. |
| **Liquidity and Capacity** | Average position size supports deployment without >5% daily volume. | Illiquid small-caps; cannot scale. |
| **Rebalancing Burden** | Turnover manageable (<30% quarterly for systematic strategies). | High-frequency rebalancing beyond team capacity. |
| **Data and Tools** | Required data available via Bloomberg or Capital IQ; screening automation feasible. | Proprietary data or complex infrastructure required. |

**Output Required:** Position-sizing worksheet; rebalancing calendar; data source verification; compliance checklist.

---

## Stage 7: Recommendation Logic (Systematic-Specific)

**CRITICAL DISTINCTION:**  
A systematic strategy can be **valid and valuable** even when it generates a **"Do Not Buy" recommendation today.**

### Recommendation Framework

| Scenario | Rule Validity | Current Signal | Data Quality | Portfolio Fit | Recommendation |
|----------|---------------|----------------|--------------|---------------|----------------|
| 1 | ✓ | Buy Signal | ✓ | ✓ | **BUY** (Initiate per strategy rules) |
| 2 | ✓ | Hold / No Signal | ✓ | ✓ | **HOLD** (Strategy valid; await signal) |
| 3 | ✓ | Sell Signal | ✓ | ✓ | **DO NOT BUY** (Rules advise patience) |
| 4 | ✓ | Buy Signal | ✓ | ✗ | **DO NOT BUY** (Redundant with existing exposure) |
| 5 | ✓ | Buy Signal | ✗ | ✓ | **DO NOT BUY** (Data fails validation; returns unrealistic) |
| 6 | ✗ | — | — | — | **DO NOT BUY** (Rules lack academic foundation) |

**Key Principle:**  
"Do Not Buy" for a systematic strategy can mean:
1. **Rules are invalid** (thesis failed validation), OR
2. **Rules are valid but not triggering** (discipline = wait for signal), OR
3. **Rules are valid and triggering but portfolio context prevents action** (redundancy or capacity)

**Students must clarify which interpretation applies.** Simply saying "Do Not Buy" without this distinction creates confusion.

---

## Final Recommendation Decision Matrix

| Evaluation Dimension | Weight | Rating Criteria |
|----------------------|--------|-----------------|
| **Thesis Clarity** | 20% | Inefficiency type identified; economic logic sound. |
| **Rule Design** | 20% | Screening criteria directly exploit inefficiency. |
| **Data Integrity** | 15% | Out-of-sample validation; transaction costs included. |
| **Benchmark Fit** | 20% | Matched benchmark used; alpha and Sharpe improvement clear. |
| **Portfolio Role** | 15% | Diversification benefit quantified; correlation analyzed. |
| **Implementation** | 10% | Feasible within MSIF constraints (liquidity, rebalancing, compliance). |

**Pass Threshold:** ≥70% weighted score across dimensions.

---

## Key Anti-Patterns to Avoid

| Anti-Pattern | Why It Fails | Corrective Action |
|--------------|--------------|-------------------|
| **S&P 500 Benchmark Default** | Mismatches defensive or factor strategies; creates false underperformance. | Match benchmark to strategy intent (see Stage 4 tree). |
| **Recommendation-Data Disconnect** | "Buy" despite negative alpha; "Do Not Buy" despite valid rules. | Recommendation must logically follow from data and signal status. |
| **Ignoring Factor Overlap** | Adds momentum strategy when portfolio already momentum-heavy. | Require correlation analysis and factor map. |
| **Confusing Rules with Timing** | "Do Not Buy" implies strategy is bad (vs. currently not triggering). | Clarify whether rejection is rule-based or signal-based. |

---

## Summary Principle

Systematic strategies must:
1. Identify a specific, persistent inefficiency with academic support.
2. Design rules that operationalize the inefficiency.
3. Validate data integrity across regimes and transaction costs.
4. Use benchmarks that match factor tilts and volatility profiles.
5. Demonstrate portfolio diversification benefits.
6. Prove operational feasibility within MSIF constraints.

A "Do Not Buy" recommendation can reflect valid rules awaiting signal—not strategy invalidity.

---

**Framework Version:** 2.0  
**Last Updated:** November 2025  
**Maintained By:** Darrell Day, MSIF TA
