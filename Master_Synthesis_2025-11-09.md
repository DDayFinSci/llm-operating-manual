
# Master Synthesis v3.3 — Unified LLM Operating Manual

### Location

`C:\Users\pyfieri\LifeOS\00_System\LLM_Operating_Manual\Master_Synthesis_2025-11-09.md`

---

## A. Operating Principles

1. **Execution First** → ship an MSO before optimizing.
    
2. **First-Principles Guardrails** → define 5 axioms before automating.
    
3. **Two-Track Iteration** → Precision lane + Discovery lane.
    
4. **Model-Agnostic Empiricism** → choose by bake-off, not habit.
    
5. **Portable Context Layer** → Registry + Exports = shared memory.
    
6. **Simplicity Filter (Brogaard)** → halve words, plain language.
    
7. **Small Boring Wins** → progress by daily micros.
    

---

## B. Shared Handoff Header

Add to every new note or prompt.

```yaml
Descriptor:
  Project: <name>
  Objective: <1-2 sentences, outcome + audience>
  Sources: [<links or file IDs>]
  Output_Type: <memo|csv|python|excel-notes|checklist>
  Style: DDAY_v3
Chain_of_Origin:
  Created_By: <gpt5|claude-4.5-sonnet|claude-4.5-haiku|claude-4.1-opus|notebooklm|human>
  Derived_From: [<source refs>]
  Date: <YYYY-MM-DD>
  Status: <EXTRACT|SYNTH|FINAL>
Evidence_Policy:
  Mode: hybrid
  Notes: <ambiguities / follow-ups>
```

---

## C. Naming Convention

`<YYYYMMDD>__<Project>__<Unit>__<Status>__<vX>__<agent>.<ext>`

Examples

- `20251109__CFA-L1__tvm-basics__SYNTH__v1__gpt.md`
    
- `20251109__WebBank-CPR__ratio-covenants__FINAL__v2__claude-4.5-sonnet.md`
    

---

## D. Model Roles (2025 baseline)

|Task Archetype|Preferred Model|Rationale|
|---|---|---|
|Research Extract & Audit|**Claude Sonnet 4.5**|Best long-context reasoning + structured extraction|
|Fast Skim / High Throughput|**Claude Haiku 4.5**|Speed & cost-efficiency for parallel tasks|
|Deep Analysis / High-stakes|**Claude Opus 4.1**|Frontier-level depth when needed|
|Synthesis / Formatting / Voice|**ChatGPT (GPT-5)**|DDAY v3 enforcement, composure, tone|
|Knowledge Recall|**NotebookLM**|Persistent retrieval & reference|

---

## E. Prompt Macros (Templates)

### 1. First-Principles Auditor

List ≤ 5 axioms, 3 traps, 1 minimal example. Then ask “Proceed to MSO?”

### 2. MSO Builder

Produce the smallest working artifact (≤ 1 page or script); propose 1 variant + 1 robustness test.

### 3. Research Extract → Synthesis → Audit

Three sequential roles: Extractor → Synthesizer → Auditor.

### 4. DDAY Comms Macro

Audience + Goal → 150-250 words + action bullets + 1-sentence close.

---

## F. Recurring Actions (per LLM session)

### **Always start each session with**

1. Pull latest repo:  
    `git -C "C:\Users\pyfieri\LifeOS\00_System\LLM_Operating_Manual" pull origin main`
    
2. Run import prompt:
    

> “Import all current context exports from `00_System/LLM_Operating_Manual/context_exports/`  
> and align with DDAY_v3 voice.”

3. Paste or confirm the appropriate Descriptor header.
    
4. (If CFA study session) Run **First-Principles Auditor** before doing anything else.
    

---

### **During session**

- Follow the macro sequence appropriate to the task:  
    • CFA Study → Auditor → MSO Builder.  
    • Research → Extract → Synthesis → Audit.  
    • Writing / Comms → DDAY Comms Macro.
    
- Use the model best fit for the role (see table above).
    
- Commit sub-artifacts to Obsidian and Git once they reach `SYNTH`.
    

---

### **Always end each session with**

1. Run **Context Export Macro** (`Export_Type: session`)  
    → save to `00_System\LLM_Operating_Manual\context_exports\<model>_<YYYYMMDD_HHMM>.yaml`
    
2. For voice or dictation sessions, run **Voice Summarizer** macro to create a short transcript and append to same folder.
    
3. Commit and push:
    

```powershell
git add .
git commit -m "Session export + voice summary <date>"
git push
```

4. If you produced a new deliverable (`SYNTH` or `FINAL`), log it in `_context_registry.md`.
    

---

## G. Recurring System Cadence

|Frequency|Action|Purpose|
|---|---|---|
|Every Session|Import exports → work → export → push|Keeps memory synced|
|Weekly (Fri AM)|Bake-off or cross-audit → update roles.md → push|Prevents model drift|
|Weekly (Mon)|Health Check macro → report Descriptor and tone drift|Context integrity|
|Monthly|Registry merge + voice sample refresh|System continuity|
|Quarterly|Full bake-off and tool capability review|Empirical re-weighting|

---

## H. Voice Chat Protocol (when active)

1. Begin voice session by reading Descriptor header aloud (ensures context anchoring).
    
2. At close, run Voice Summarizer macro to create 250-word summary + key actions.
    
3. Save summary under `context_exports/voice_<YYYYMMDD_HHMM>.yaml` → commit and push.
    
4. Next text session imports that file to maintain continuity.
    

---

## I. Drift Prevention Matrix

|Drift Type|Countermeasure|
|---|---|
|File version|Git history + weekly pulls|
|Context memory|Import/export loop|
|Voice tone|ChatGPT DDAY v3 audits|
|Cross-model logic|Recursive audit log|
|Structural paths|Registry merge review|

---

## J. Next Immediate Steps (Your Actions Now)

1. Run baseline exports for all models.
    
2. Push to GitHub (`llm-operating-manual`).
    
3. Verify registry and voice manifest exist.
    
4. Begin **CFA Session 1** using Auditor → MSO Builder.
    
5. After session, export context + push.
    

---

This is now your **canonical reference** for the integrated LifeOS LLM System.  
Every session—ChatGPT, Claude, or NotebookLM—follows the same rhythm: **Import → Work → Export → Push.**