# NotebookLM Error Analysis — Critical Learning Document
**Date:** 2025-11-11  
**Purpose:** Document source-output misalignment for future AI workflow improvement

---

## What NotebookLM Analyzed (WRONG)

**Strategy:** Betting Against Beta (BAB) by Ute Capital  
**Authors Referenced:** Frazzini & Pedersen's low-beta anomaly work  
**Key Metrics Cited:**
- 10-year Sharpe of 0.78 (vs S&P's 0.72)
- 1.35 Alpha
- Rejection due to "lower alpha" and "more risk"

**Citations:** All from "compr2025_Systematic_Strategy__Low_Beta__Ute_Capital"

---

## What Was Actually Presented (CORRECT)

**Strategy:** Quality Minus Junk (QMJ) by 4 Risketeers  
**Authors Referenced:** Asness, Frazzini & Pedersen's QMJ framework  
**Actual Metrics:**
- 10-year return: 426.03% vs S&P's 314.73%
- 10-year Sharpe: 0.94 vs S&P's 0.72
- Alpha: 2.90% annually
- Beta: 0.97
- Max Drawdown: -14.56% vs S&P's -24.1%
- **Recommendation: YES — Buy $50,000**

**Screening Process:**
1. Market Cap ≥ $20B (585 stocks)
2. Top 50% Operating Margin (234 stocks)
3. Bottom 50% Debt to Assets (116 stocks)
4. Rank by P/E (113 stocks)
5. Top 15 by Free Cash Flow (final portfolio)

---

## Key Differences

| Element | NotebookLM's Analysis | Actual Pitch |
|---------|----------------------|--------------|
| Strategy Type | Betting Against Beta | Quality Minus Junk |
| Team | Ute Capital | 4 Risketeers |
| Recommendation | Do Not Buy | Yes — Buy |
| Focus | Low-beta anomaly | Quality factors |
| Performance | Underperformance implied | Clear outperformance |
| Sharpe Ratio | 0.78 | 0.94 |

---

## Root Cause Analysis

1. **File Name Ambiguity**: Both strategies are "systematic" and both reference Frazzini
2. **No Explicit File Direction**: NotebookLM wasn't told which specific file to analyze
3. **Recursive Error**: My initial draft mentioned BAB, which NotebookLM then elaborated on
4. **Citation Blindness**: 9 citations to wrong document weren't caught initially

---

## Prevention Protocol

### For AI-Assisted Analysis
1. **Always specify exact file names** in prompts
2. **Verify team names** match in output
3. **Check first citation** immediately for source accuracy
4. **Cross-reference key metrics** between source and output
5. **Never let one AI's error** influence another's analysis

### Red Flags to Watch
- Citations to unexpected documents
- Strategy names that don't match brief
- Performance metrics that contradict recommendations
- Academic papers that seem tangentially related

---

## Impact Assessment

**What This Error Caused:**
- Wrong strategy analyzed entirely
- Incorrect feedback generated
- Time spent debugging instead of analyzing
- Risk of student confusion if delivered

**What This Error Revealed:**
- AI tools can confidently analyze wrong documents
- Citation numbers can obscure source problems
- Human verification remains essential
- Clear file naming conventions matter

---

## Systematic Fix Applied

Updated `DARRELL_PROTOCOL_MASTER_LOG.md` with:
- AI Tool Verification Protocol
- Source-output alignment requirements
- Multi-AI coordination guidelines
- Explicit warning about recursive feedback loops

---

**Lesson:** Trust but verify. AI confidence ≠ AI accuracy.