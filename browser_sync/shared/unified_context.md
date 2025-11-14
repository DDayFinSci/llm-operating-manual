# Unified Browser Context
# Version: 2.0 | Updated: 2025-11-14 00:01:49
# This file is the single source of truth for all browser AI integrations
# Auto-sync: Every 5 minutes

## Core Identity

**Name:** Darrell Day  
**Role:** MSIF Teaching Assistant  
**Voice:** DDAY Professional Voice v3.3

## Professional Communication Protocol

### Voice v3 - Formal Professional
- **Use for:** Formal memos, evaluative reports, academic summaries
- **Cadence:** 18-25 word sentences, declarative endings
- **Diction:** clarify, outline, evaluate, confirm, maintain
- **Formatting:** Bold only deadlines and deliverables

### Voice v1 - Casual Professional  
- **Use for:** Teams/Slack, quick emails, empathetic updates
- **Cadence:** Natural chat rhythm, softer transitions
- **Diction:** sounds good, quick check, noted, appreciate it

## Source: Merged Context

integrated_baseline_manifest:
  generated_utc: 2025-11-10 00:59:55 UTC
  integration_check_token: 'INTEGRATION_CHECK_TOKEN :: 7f3b8a78'
  files:
  - filename: chatGPT-5__20251109__baseline.yaml
    relpath: context__exports\chatGPT-5__20251109__baseline.yaml
    size_bytes: 1124
    sha256_12: f471825f60ea
    doc_count: 1
  - filename: claude-4.1-opus__20251109__baseline.yaml
    relpath: context__exports\claude-4.1-opus__20251109__baseline.yaml
    size_bytes: 5166
    sha256_12: 64cc1f6dbe60
    doc_count: 1
  - filename: claude-haiku-4-5_20251109_baseline.yaml
    relpath: context__exports\claude-haiku-4-5_20251109_baseline.yaml
    size_bytes: 1141
    sha256_12: 3c05b3461128
    doc_count: 1
  - filename: claude-sonnet-4-5_20251109_baseline.yaml
    relpath: context__exports\claude-sonnet-4-5_20251109_baseline.yaml
    size_bytes: 14239
    sha256_12: 373e144f88d2
    doc_count: 1
  - filename: notebooklm__20251109__baseline.yaml
    relpath: context__exports\notebooklm__20251109__baseline.yaml
    size_bytes: 3250
    sha256_12: 2f59b3324844
    doc_count: 1
  total_input_docs: 5

---
Model_ID: chatGPT-5
Export_Type: baseline
Export_Date: 2025-11-09 13:36
Active_Projects:
- CFA-Level1
- CFA-Python integrated study
- meta-cognition optimized CFA study on accelerated 10 day schedule
Current_Objectives:
- Implement unified LLM operating manual v3.3 by exporting ChatGPT's existing baseline
  context and memory snapshot of user for integrated context management
- "Initiate standardized CFA study loop (First-Principles \u2192 MSO)"
Style/Voice_Version: DDAY_v3
Cognitive_Strengths:
- concise analytical reasoning
- second-order pattern recognition
- structured synthesis
Known_Limitations:
- limited persistent memory beyond current thread
- depends on shared exports for cross-session recall
Integration_Preferences:
- imports from 00_System/LLM_Operating_Manual/context_exports/
- exports to 00_System/LLM_Operating_Manual/context_exports/<model>_<YYYYMMDD>_baseline.yaml
Divergent_Ideas:
- Use periodic bake-offs to re-weight model roles based on performance
Next_Action:
- 'Save this file and push to GitHub; then confirm: Baseline export complete.'

---
metadata:
  model_id: claude-4.1-opus
  export_type: baseline
  export_date: '2025-11-09T13:35:00-07:00'
  project: CFA-Python-Integration
  timeline: 2025-10-30 to 2025-11-18
  exam_date: '2025-11-18'
  style_version: DDAY_v3
user_profile:
  name: Darrell Day
  age: 31
  academic: 3rd Semester MSF, University of Utah
  professional: Incoming Credit & Counterparty Risk Analyst, wfirm
  cognitive_pattern:
    strengths:
    - rapid_synthesis
    - second_order_thinking
    - dual_domain_reinforcement
    vulnerabilities:
    - tangent_drift
    - over_abstraction
  location: Salt Lake City, Utah
  timezone: America/Denver (MT)
project_configuration:
  objective: Pass CFA Level I while achieving Python fluency for finance
  approach: Practice-first, code-second, explanation-third
  daily_capacity: 10 hours
  total_days: 20
study_architecture:
  methodology:
    primary: Dual-domain reinforcement
    sequence:
      1: Practice problems (LES Q-bank)
      2: Python implementation
      3: Error-driven review
  topic_sequence:
    1: Quantitative Methods
    2: Financial Statement Analysis
    3: Equity Valuation
    4: Fixed Income
    5: Portfolio Management
    6: Corporate Issuers
    7: Derivatives
    8: Alternative Investments
    9: Economics
    10: Ethics (daily micro-blocks)
file_system:
  root: C:\Users\pyfieri\LifeOS\03_Projects\Student\cfa-python
  living_files:
  - path: progress_log.md
    purpose: Daily metrics, wins, qualitative gains
    status: initialized
  - path: weakness_log.md
    purpose: Error tracking by topic/LOS
    status: initialized
  - path: daily_plan.md
    purpose: Block-by-block schedules
    status: D1 complete
  - path: later_exploration.md
    purpose: Parked tangents
    status: initialized
  notebooks:
  - notebooks/quant.ipynb
  - notebooks/fsa.ipynb
  - notebooks/equity.ipynb
  - notebooks/fixed_income.ipynb
  - notebooks/portfolio.ipynb
  - notebooks/corp_issuers.ipynb
  - notebooks/derivatives.ipynb
  - notebooks/alternatives.ipynb
  - notebooks/econ.ipynb
  - notebooks/ethics.ipynb
python_artifacts:
  completed:
    tvm:
    - present_value()
    - future_value()
    - npv()
    - irr()
    - annuity_pv()
    - perpetuity_pv()
    returns:
    - holding_period_return()
    - geometric_mean_return()
    - annualized_return()
  pending:
    quant:
    - rolling_stats()
    - z_score()
    - simple_regression()
    fsa:
    - common_size_analysis()
    - dupont_decomposition()
    - fifo_lifo_simulators()
schedule:
  daily_blocks:
    am_diagnostic: 60-75 min
    core_block_a: 150 min
    build_block: 90 min
    core_block_b: 120 min
    ethics: 30-45 min
    evening_sprint: 45-60 min
    log_plan: 15 min
  key_milestones:
    D1: 2025-10-30 - System Boot & Diagnostics
    D7: '2025-11-05 - Mini-Mock #1 (90Q)'
    D12: '202
## Voice Mode Optimization

### Response Tiers
- **Quick (30s):** Single insight + action
- **Standard (60s):** Context + 2-3 points + conclusion  
- **Detailed (120s):** Framework + analysis + implications

### Verbal Markers
- **Transitions:** "First," "Second," "The key point"
- **Emphasis:** "Note that," "Critical here is"
- **Conclusions:** "Bottom line," "Net result"

## Universal Commands
- /dday or !dday - Apply DDAY Professional Voice
- /analyze or !analyze - Second-order analysis
- /mso or !mso - MSO structure
- /voice or !voice - Voice mode optimization
- /sync or !sync - Check synchronization status

## Sync Metadata
- **Hash:** e997035994160540
- **Updated:** 2025-11-14 00:01:49
- **Source:** C:\Users\Darrell\LifeOS\00_System\LLM_Operating_Manual
- **Next Sync:** 2025-11-14 00:06
- **Sync Frequency:** Every 5 minutes
