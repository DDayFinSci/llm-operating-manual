# Decision Framework Revision Summary
**MSIF Strategy Evaluation — Version 2.0**

---

## Overview of Changes

The original decision trees were linear flowcharts listing common gaps without integrating diagnostic logic. Version 2.0 transforms them into **true decision architectures** with:

1. **Branching logic and pass/fail gates** at each stage
2. **Quantitative thresholds** where appropriate (alpha, Sharpe, correlation, etc.)
3. **Embedded corrective actions** for identified weaknesses
4. **Portfolio integration requirements** throughout
5. **Explicit benchmark selection frameworks** to prevent mismatch errors

---

## Key Improvements by Framework

### **Unified Professional Framework**

| Original Weakness | Version 2.0 Solution |
|-------------------|---------------------|
| Linear flow with no decision gates | Five-stage architecture with explicit pass/fail criteria at each node |
| No benchmark guidance | Embedded decision tree matching strategy intent to appropriate benchmark |
| Diversification claims unquantified | Required correlation analysis and portfolio simulation with before/after metrics |
| Missing implementation details | Stage 5 gate requiring liquidity analysis, rebalancing calendar, compliance checklist |
| Disconnected recommendations | Final matrix linking recommendation directly to gate performance across all dimensions |

**Diagnostic Additions:**
- Alpha significance testing requirement (t-stat > 2.0)
- Sharpe improvement threshold (≥ benchmark + 0.15)
- Correlation constraint (< 0.70 with existing holdings)
- Factor exposure reporting to prevent unintended concentration

---

### **Fundamental Strategy Framework**

| Original Weakness | Version 2.0 Solution |
|-------------------|---------------------|
| Speculative catalysts | Catalyst classification table requiring specific evidence, timeline, and probability assessment |
| Inconsistent valuation | DCF discipline gate with WACC justification, terminal growth caps, scenario rigor requirements |
| Financial health disconnected from thesis | Solvency decision tree (Debt/EBITDA, DSCR, liquidity) integrated before valuation stage |
| Portfolio fit ignored | Stage 5 requiring sector concentration check, factor exposure analysis, correlation with top holdings |

**Diagnostic Additions:**
- Moat durability test (5+ year margin stability)
- Debt service coverage requirement (DSCR ≥ 1.5x)
- Margin of safety threshold (≥20% for full position; <10% = Do Not Buy)
- Catalyst timing constraint (≤18 months; specific trigger date)
- Position sizing guidance tied to conviction level (high = 4-6%; speculative = <2%)

---

### **Systematic Strategy Framework**

| Original Weakness | Version 2.0 Solution |
|-------------------|---------------------|
| S&P 500 benchmark default | Explicit benchmark selection tree matching strategy intent (defensive → Min Vol; quality → Quality Index) |
| Weak rule-inefficiency link | Factor-to-inefficiency mapping table requiring alignment between screens and stated thesis |
| Recommendation-data disconnect | Stage 7 framework distinguishing rule validity from signal status (valid rules can justify "Do Not Buy") |
| Missing diversification analysis | Portfolio role classification table (defensive hedge, factor diversifier, return enhancer, redundant) |
| Confusion: systematic ≠ timing | Critical distinction box clarifying "Do Not Buy" can mean valid-but-not-triggering (discipline, not rejection) |

**Diagnostic Additions:**
- Inefficiency classification requirement (structural, behavioral, compositional, information-based)
- Out-of-sample testing mandate (multiple decades, crisis periods)
- Transaction cost adjustment (15-30 bps per trade)
- Correlation threshold (< 0.70 preferred; > 0.75 = redundancy flag)
- Factor map integration to identify portfolio gaps or overlaps
- Three-part recommendation logic: rule validity + signal status + portfolio context

---

## Conceptual Innovations

### **1. Benchmark Matching Logic**

Instead of defaulting to S&P 500, frameworks now require:
- Defensive strategies → MSCI Min Vol or Defensive Equity Index
- Quality strategies → MSCI Quality Index
- Factor tilts → Corresponding factor benchmarks

**Rationale:** Per markdown analysis, benchmark mismatch creates false underperformance narratives. A valid defensive strategy will naturally underperform S&P 500 in bull markets—this doesn't invalidate the thesis.

### **2. Portfolio Integration as Mandatory Gate**

Every framework now includes:
- Correlation analysis with existing holdings
- Simulated portfolio metrics (volatility, Sharpe) before/after inclusion
- Factor exposure mapping to identify concentration risks

**Rationale:** Standalone metrics can mislead. A strategy with strong Sharpe may degrade portfolio performance if highly correlated with existing positions.

### **3. Recommendation-Evidence Linkage**

Final decision matrices explicitly connect outcomes to gate performance:
- ✓ across all gates → BUY
- Single implementation failure → HOLD (monitor for operational improvements)
- Redundancy despite strong metrics → DO NOT BUY or rotate existing position
- Negative alpha → DO NOT BUY (fails fundamental return test)

**Rationale:** Recommendations must trace directly to evidence. "Buy" despite negative alpha = intellectual dishonesty.

### **4. Systematic-Specific Logic (Signal vs. Rules)**

Systematic framework clarifies three "Do Not Buy" scenarios:
1. **Rules are invalid** → Strategy rejected
2. **Rules are valid but not triggering** → Strategy endorsed; timing awaits signal
3. **Rules trigger but portfolio context prevents action** → Strategy valid but redundant

**Rationale:** Students often confuse "the rules don't trigger" with "the strategy is bad." Disciplined patience is a feature, not a bug.

---

## Anti-Pattern Codification

Each framework now includes an **Anti-Pattern Table** documenting recurring errors:

| Anti-Pattern | Observed Frequency | Framework Response |
|--------------|-------------------|-------------------|
| S&P 500 benchmark default | ~70% of pitches | Benchmark selection tree (Stage 4, Systematic; Stage 3, Unified) |
| Speculative catalysts | ~50% of fundamental pitches | Catalyst validation gate requiring timeline + evidence (Stage 4, Fundamental) |
| Assertion-based diversification | ~60% of pitches | Mandatory correlation analysis + portfolio simulation (All frameworks) |
| Academic ≠ investable confusion | ~40% of pitches | Data validation gate requiring transaction costs + out-of-sample testing (Stage 2, Unified; Stage 3, Systematic) |

---

## Pedagogical Benefits

### **For Students:**
- Clear pass/fail criteria at each stage (removes ambiguity)
- Embedded corrective actions (guidance on what to fix)
- Quantitative thresholds (removes "feels right" analysis)
- Portfolio context requirements (forces integrated thinking)

### **For Instructors/TAs:**
- Consistent evaluation rubric across all pitches
- Diagnostic tool for identifying specific analytical gaps
- Prevents recommendation-data disconnect (most common error)
- Scalable feedback framework (point to specific gate failure)

### **For the Fund:**
- Disciplined decision-making process
- Repeatable, auditable investment logic
- Reduced risk of groupthink or narrative-driven decisions
- Portfolio-level thinking embedded from inception

---

## Usage Guidance

### **When to Use Each Framework:**

| Strategy Type | Framework | Key Differentiator |
|---------------|-----------|-------------------|
| Company-specific thesis with fundamental analysis | Fundamental | Requires moat analysis, DCF, company-specific catalyst |
| Rules-based factor/quantitative strategy | Systematic | Requires inefficiency classification, screening rules, no discretionary overrides |
| Hybrid (quant screen + fundamental overlay) | Start with Systematic → Layer Fundamental | Clarify which component drives alpha; avoid double-counting |
| Multi-factor or complex strategies | Unified Professional | Comprehensive; use when strategy spans multiple categories |

### **Evaluation Workflow:**

1. **Pre-Pitch:** Students complete self-assessment checklist (all gates)
2. **Pitch Presentation:** Explicitly address each stage; flag any "Fail" gates with mitigation plan
3. **Post-Pitch:** TA/Instructor maps feedback to specific gate failures
4. **Revision:** Students resubmit analysis targeting failed gates

---

## Integration with MSIF Operations

### **Committee Workflow:**
- **Screening Phase:** Use frameworks to identify which pitches advance to full committee review
- **Deep Dive Phase:** Committee evaluates pitch against framework gates; votes on advancement
- **Portfolio Construction:** Integration gates ensure new positions complement existing exposures
- **Post-Mortem:** Framework serves as audit trail for decision rationale

### **Performance Monitoring:**
- Track which framework gates most frequently predict success/failure
- Refine thresholds based on realized outcomes (alpha, Sharpe, correlation accuracy)
- Document patterns: Do catalyst-driven pitches outperform quantitative strategies? Does diversification analysis predict actual portfolio impact?

---

## Version History and Maintenance

**Version 1.0 (Original):**
- Linear flowcharts
- Qualitative gap lists
- No decision logic or quantitative gates

**Version 2.0 (Current):**
- Branching decision architecture
- Quantitative thresholds and pass/fail criteria
- Embedded corrective actions and anti-pattern documentation
- Portfolio integration requirements throughout

**Future Enhancements (Proposed):**
- Post-investment tracking: Do strategies passing all gates actually deliver expected alpha?
- Calibration: Adjust thresholds (Sharpe improvement, MoS %, correlation limits) based on realized outcomes
- Machine-readable format: Encode frameworks for automated pre-screening (flag pitches missing required analyses)

---

## Summary Principle

The Version 2.0 frameworks transform strategy evaluation from **subjective narrative assessment** to **structured diagnostic process**.

Every recommendation must survive a series of evidence-based gates. Failure at any stage requires revision—not rationalization.

This discipline protects the fund from behavioral biases, ensures intellectual honesty, and builds a repeatable investment process that compounds learning across cohorts.

---

**Frameworks Revised:** 3  
**Total Pages:** ~12  
**Last Updated:** November 2025  
**Maintained By:** Darrell Day, MSIF TA
