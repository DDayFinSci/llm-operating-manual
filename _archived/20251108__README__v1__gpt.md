# Implementation Guide — Step by Step (Rev. 2025-11-08)

## 0) Where to Save the Master Synthesis
- Save `20251108__Master-synthesis__v1__gpt.md` in BOTH:
  - Obsidian vault: `/LifeOS/00_Systems/LLM_Operating_Manual/`
  - Git repo: `llm-operating-manual/` (private).

## 1) Drop-In Files
- Place everything in this starter kit into BOTH locations above (Obsidian + Git).
- Treat Obsidian as the human-friendly hub, Git as the source-of-truth for version history.

## 2) Create an "Active Projects" index note
- New note: `/LifeOS/03_Projects/_Active_Projects.md`
- For each project, paste the Descriptor header, and link to latest EXTRACT/SYNTH/FINAL files (by filename).

## 3) Apply the Descriptor Header
- Open your top 3 current project notes and paste the YAML header at the top.
- Fill in Objective, Output_Type, and set Status appropriately.

## 4) Adopt Naming Convention
- Rename your last 3 artifacts to: `<YYYYMMDD>__<Project>__<Unit>__<Status>__<vX>__<agent>.<ext>`.

## 5) Run Your First Bake-Off
- Open `templates/roles.md`. Use a small, real task (e.g., Research Extract).
- Score ChatGPT vs Claude (and any other tool) on the grid.
- Decide temporary defaults and record them under “Default Role Map”.

## 6) Use Prompt Macros
- Copy from `templates/prompt_macros.md` into your model prompts/snippet managers.
- Pin “First-Principles Auditor” and “MSO Builder” as quick actions.

## 7) Ship an MSO Today
- Pick one backlog item. Use the MSO Builder macro. Archive as `SYNTH` or `FINAL` per quality.
- Add a one-line change note to the top header (what changed).

## 8) Schedule Maintenance
- Weekly Review (30m): close/roll items; pick next bake-off; archive orphans.
- Quarterly Feature Audit: list capabilities of each model (RW files, context size, plugins).

## 9) Evidence & Compliance Defaults
- Research/finance → strict citations.
- Comms/editing → citations optional.
- Sensitive partner info → paraphrase; modularize details; keep Chain_of_Origin.

## 10) Hands-Free Session SOP (optional)
- Voice on → narrate goal; paste Descriptor header.
- Work in a single “/scratchpad” folder.
- At the end, export transcript summary as `SYNTH` note with header.
