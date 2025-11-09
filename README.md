
# Implementation Guide — Step by Step (Rev. 2025-11-09)

## 0 | Where to Save the Master Synthesis

- Save `20251109__Master-Synthesis__v3.3__gpt.md` in BOTH:
    
    - Obsidian vault: `/LifeOS/00_System/LLM_Operating_Manual/`
        
    - Git repo (private): `llm-operating-manual/`
        
- **Obsidian = human-friendly hub. Git = source-of-truth.**
    

---

## 1 | Baseline Context Exports (once per model)

Run the **Baseline Export Prompt** in each model  
(`gpt-5`, `claude-4.5-sonnet`, `claude-4.5-haiku`, `claude-4.1-opus`, `notebooklm`).  
Save each YAML file to:

```
00_System/LLM_Operating_Manual/context_exports/<model>_<YYYYMMDD>_baseline.yaml
```

Commit and push to GitHub when all five exist.

---

## 2 | Link the GitHub Remote

```powershell
cd "C:\Users\pyfieri\LifeOS\00_System\LLM_Operating_Manual"
git init
git branch -M main
git remote add origin git@github.com:DarrellDay/llm-operating-manual.git
git add .
git commit -m "v3.3 baseline: context exports + registry"
git push -u origin main
```

Confirm repo visibility = **Private**.

---

## 3 | Create Active Projects Index

New note: `/LifeOS/03_Projects/_Active_Projects.md`  
For each project:

1. Paste the Descriptor header.
    
2. Link to latest `EXTRACT | SYNTH | FINAL` artifacts by filename.
    

---

## 4 | Apply Descriptor Header and Naming Convention

1. Open your top three active notes; insert the YAML Descriptor.
    
2. Set `Style: DDAY_v3`.
    
3. Rename recent artifacts to:
    
    ```
    <YYYYMMDD>__<Project>__<Unit>__<Status>__<vX>__<agent>.<ext>
    ```
    

---

## 5 | Initial Bake-Off (Claude 4.5 family + GPT-5)

1. Open `templates/roles.md`.
    
2. Task: _CFA QM – Sharpe vs Sortino vs Information Ratio_.
    
3. Run the same Descriptor header in:
    
    - ChatGPT (GPT-5)
        
    - Claude 4.5 Sonnet
        
    - Claude 4.5 Haiku  
        _(optional deep audit: Claude 4.1 Opus)_
        
4. Score on context fidelity, reasoning, structure, tone.
    
5. Record results under **Default Role Map**, commit and push.
    

---

## 6 | Load Prompt Macros

From `templates/prompt_macros.md`, add to each model’s snippets:

- **First-Principles Auditor**
    
- **MSO Builder**
    
- **Research Extract → Synthesis → Audit**
    
- (Optional) **DDAY Comms Macro**
    

Pin Auditor and MSO Builder for quick access.

---

## 7 | Ship an MSO Today (CFA Session 1)

1. Descriptor for CFA sessions:
    
    ```
    Project: CFA-Level1
    Objective: Systematic study via First-Principles → MSO loop
    Sources: [Schweser-2025, CFAI-2025, Mocks]
    Output_Type: md
    Style: DDAY_v3
    ```
    
2. Topic example: **QM – TVM Basics**
    
3. Run First-Principles Auditor → approve → MSO Builder.
    
4. Save:
    
    ```
    05_Resources/CFA/Sessions/20251109__CFA-L1__tvm-basics__SYNTH__v1__gpt.md
    ```
    
5. Commit and push.
    

---

## 8 | Recurring Actions Every Session

**Start each session**

1. `git pull` to sync latest manual.
    
2. Prompt: _“Import all current context exports from 00_System/LLM_Operating_Manual/context_exports/ and align with DDAY_v3 voice.”_
    
3. Confirm Descriptor header present and accurate.
    
4. (If CFA) Run First-Principles Auditor before work.
    

**End each session**

1. Run _Context Export Macro_ (`Export_Type: session`).
    
2. If voice used → run _Voice Summarizer Macro_.
    
3. Save to `context_exports/`, commit and push.
    

---

## 9 | Maintenance Cadence

|Frequency|Action|Purpose|
|---|---|---|
|Weekly (Fri)|Bake-off or cross-audit; update roles.md|Model drift check|
|Weekly (Mon)|Health Check macro|Descriptor + tone consistency|
|Monthly|Merge registry + refresh voice sample|Continuity|
|Quarterly|Full bake-off + capability review|Empirical re-weighting|

---

## 10 | Evidence & Compliance Defaults

- **Research/Finance** → strict citations.
    
- **Comms/Editing** → citations optional.
    
- **Sensitive Partner Info** → paraphrase + modularize details + keep `Chain_of_Origin`.
    

---

## 11 | Optional Voice Session SOP

1. Voice on → state Descriptor aloud.
    
2. Work in `/scratchpad` folder.
    
3. At end → run Voice Summarizer macro (≤ 250 words).
    
4. Save `voice_<YYYYMMDD_HHMM>.yaml` in `context_exports/`, commit and push.
    