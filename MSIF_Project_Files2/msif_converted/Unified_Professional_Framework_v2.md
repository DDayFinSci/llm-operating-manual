# Unified Professional Decision Framework (MSIF)
**Version 2.0 — Diagnostic Architecture**

---

## Decision Architecture Overview

```
Entry → Thesis Validation → Evidence Quality → Risk-Adjusted Return → Portfolio Integration → Implementation Feasibility → Recommendation
```

---

## Stage 1: Thesis Validation

**Question:** Does the thesis identify a specific, persistent market inefficiency?

| Decision Gate | Pass Criteria | Fail → Revise |
|---------------|---------------|----------------|
| **Inefficiency Type** | Clearly classified as structural, behavioral, or compositional. | Thesis relies on generic "undervalued" claims without mechanism. |
| **Persistence Test** | Academic support spans multiple market cycles (10+ years). | Evidence limited to single regime or recent backtest window. |
| **Economic Logic** | Explains *why* inefficiency persists despite rational actors. | Circular reasoning: "Mispriced because undervalued." |

**Output Required:** One-sentence thesis linking inefficiency type to expected return source.

---

## Stage 2: Evidence Quality

**Question:** Does the supporting evidence meet investability standards?

| Decision Gate | Pass Criteria | Fail → Revise |
|---------------|---------------|----------------|
| **Data Integrity** | Out-of-sample validation; survivorship-bias-free dataset. | Backtest uses only post-2008 data or cherry-picked periods. |
| **Transaction Costs** | Accounts for spreads, turnover, market impact (>$10M AUM). | Assumes frictionless execution; ignores illiquidity. |
| **Replication Clarity** | Screening rules, rebalancing frequency, position limits specified. | Vague implementation: "Invest in quality stocks." |

**Output Required:** Methodology section detailing rules, frequency, constraints.

---

## Stage 3: Risk-Adjusted Return Assessment

**Question:** Does the strategy deliver superior risk-adjusted returns *relative to an appropriate benchmark*?

### Benchmark Selection Decision Tree

```
Strategy Intent:
├─ Defensive / Low Volatility → Use MSCI Min Vol or Defensive Equity Index
├─ Quality Focus → Use Quality Factor Index (e.g., MSCI USA Quality)
├─ Broad Market Exposure → Use S&P 500 or Russell 1000
└─ Factor Tilt (Value, Momentum, etc.) → Use corresponding factor benchmark
```

| Decision Gate | Pass Criteria | Fail → Revise |
|---------------|---------------|----------------|
| **Alpha Magnitude** | α > 1% annually vs. appropriate benchmark (t-stat > 2.0). | Negative or statistically insignificant alpha. |
| **Sharpe Ratio** | Sharpe ≥ benchmark + 0.15 (material improvement). | Marginal Sharpe gain (<0.10) insufficient for complexity. |
| **Drawdown Profile** | Max drawdown ≤ benchmark or justified by higher Sortino ratio. | Deeper drawdowns without compensating upside. |

**Output Required:** Performance table vs. matched benchmark; statistical significance testing.

---

## Stage 4: Portfolio Integration Analysis

**Question:** How does this strategy improve the *total fund's* risk-return profile?

| Decision Gate | Pass Criteria | Fail → Revise |
|---------------|---------------|----------------|
| **Correlation Check** | Correlation with existing holdings < 0.70. | High overlap with current portfolio (redundancy risk). |
| **Diversification Benefit** | Demonstrates portfolio volatility reduction or Sharpe improvement. | Standalone metrics strong but portfolio contribution negative. |
| **Factor Exposure** | Explicit factor loadings reported; no unintended concentration. | Adds leverage to already-dominant factor (e.g., more momentum). |

**Output Required:** Correlation matrix; simulated portfolio metrics (before/after inclusion).

---

## Stage 5: Implementation Feasibility

**Question:** Can MSIF execute this strategy within operational constraints?

| Decision Gate | Pass Criteria | Fail → Revise |
|---------------|---------------|----------------|
| **Liquidity Constraint** | Average daily volume supports position sizing without >5% market impact. | Illiquid small-caps; cannot deploy capital efficiently. |
| **Rebalancing Burden** | Turnover manageable within team capacity (<30% quarterly for systematic). | High-frequency strategy beyond operational bandwidth. |
| **Regulatory Compliance** | US long-only equities; no derivatives or leverage. | Requires restricted instruments (options, shorts, international). |

**Output Required:** Position-sizing worksheet; rebalancing calendar; compliance checklist.

---

## Final Recommendation Decision Matrix

| Scenario | Alpha | Sharpe Improvement | Diversification | Implementation | Recommendation |
|----------|-------|-------------------|-----------------|----------------|----------------|
| 1 | ✓ | ✓ | ✓ | ✓ | **BUY** (Full allocation per policy limit) |
| 2 | ✓ | ✓ | ✓ | ✗ | **HOLD** (Monitor for operational improvements) |
| 3 | ✓ | ✓ | ✗ | ✓ | **HOLD** (Redundant; consider only if rotating out similar position) |
| 4 | ✓ | ✗ | ✓ | ✓ | **DO NOT BUY** (Complexity unjustified by marginal gain) |
| 5 | ✗ | — | — | — | **DO NOT BUY** (Fails fundamental return test) |

---

## Key Anti-Patterns to Avoid

| Anti-Pattern | Why It Fails | Corrective Action |
|--------------|--------------|-------------------|
| **S&P 500 Default** | Mismatches defensive or factor strategies. | Select benchmark aligned with strategy intent. |
| **Assertion-Based Diversification** | Claims benefit without evidence. | Quantify correlation and portfolio volatility impact. |
| **Academic ≠ Investable** | Theoretical validity doesn't guarantee execution feasibility. | Layer transaction costs, liquidity, and operational realism. |
| **Recommendation-Data Disconnect** | "Buy" call despite negative alpha or weak Sharpe. | Recommendation *must* trace directly to evidence. |

---

## Summary Principle

Every recommendation must survive five gates: valid thesis, quality evidence, superior risk-adjusted returns vs. matched benchmark, positive portfolio contribution, and operational feasibility. 

Failure at any stage requires revision—not rationalization.

---

**Framework Version:** 2.0  
**Last Updated:** November 2025  
**Maintained By:** Darrell Day, MSIF TA
