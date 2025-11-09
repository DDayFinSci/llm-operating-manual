# Master Synthesis — Optimal, Cross-LLM Usage (Rev. 2025-11-08)

> This is the canonical reference. Keep this version-controlled (Git) and mirrored in Obsidian.

## A. Operating Principles (shortform)
1. Execution First → ship MSO before optimizing.
2. First-Principles Guardrails → 5-line axioms/definitions before automation.
3. Two-Track Iteration → Precision lane + Discovery lane (always 1 divergent variant).
4. Model-Agnostic Bake-Offs → pick tools empirically; revisit quarterly.
5. Portable Context + Chain-of-Origin → shared header everywhere.
6. Simplicity Filter (Brogaard) → halve words, plain language.
7. Small, Boring Wins → micro-loops to burn down backlog specifics.

## B. Shared Handoff Header (paste at top of docs/chats)
```yaml
Descriptor:
  Project: <name>
  Objective: <1–2 sentences, outcome & audience>
  Sources: [<links or file IDs>]
  Output_Type: <memo|csv|python|excel-notes|checklist>
  Style: DDAY_v2.1_simple
Chain_of_Origin:
  Created_By: <agent/app>     # gpt|claude|nblm|human
  Derived_From: [<source refs>]
  Date: <YYYY-MM-DD>
  Status: <EXTRACT|SYNTH|FINAL>
Evidence_Policy:
  Mode: hybrid    # strict for research/finance; optional for comms
  Notes: <residual ambiguity / open items>
```

## C. Universal Naming Pattern
`<YYYYMMDD>__<Project>__<Unit>__<Status>__<vX>__<agent>.<ext>`

## D. Prompt Macros (grab-and-go)
### First-Principles Auditor
You are my First-Principles Auditor.
Task: Before we automate, list the 5 most critical axioms/definitions for <TOPIC>.
Output: Axioms (≤5 lines), Common Traps (≤3), Minimal Example (≤10 lines).
Then ask: “Proceed to MSO?” If yes, produce the smallest working artifact.

### MSO Builder
You are my MSO Builder.
Objective: Produce the smallest working artifact that satisfies the Descriptor header.
Constraints: One page or one script; plain language; no extra dependencies.
After output: propose 1 divergent variant (novelty) and 1 robustness test.

### Research Extract → Synthesis → Audit
Role: Extractor → bullet abstract (≤10), claims + citations, residual ambiguity.
Role: Synthesizer → structured draft; label assumptions; map open items.
Role: Auditor → red-team checks: missing axioms, logic leaps, weak evidence, alt hypotheses.

### DDAY Comms (Brogaard filter)
Audience: <role>. Goal: <decision or action>.
Tone: DDAY v2.1 simple; remove jargon unless needed.
Deliverable: 150–250 words; action bullets; 1-sentence close.

## E. Quarterly Bake-Off (scoring axes)
Speed | First-principles accuracy | Structure fidelity | Citation quality | Long-context handling

## F. Week-One Checklist
- Add the header to 3 active projects.
- Rename 3 recent artifacts to the pattern.
- Run First-Principles+MSO on one current task.
- Schedule 1 backlog burndown (15–25m) and 1 weekly review.
- Create roles.md and log the first bake-off.

## G. What Good Looks Like
At least one MSO/day · Header everywhere · One divergent variant pre-final · Canonicals accessible across contexts · External docs read simpler.
