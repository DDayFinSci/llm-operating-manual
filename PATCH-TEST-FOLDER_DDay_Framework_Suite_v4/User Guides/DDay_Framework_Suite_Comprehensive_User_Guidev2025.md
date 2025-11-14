

DDAY Framework Suite — Comprehensive User Interaction Guide (v2025-11.2)

for ChatGPT Enterprise environments



0. Core Concept

The DDAY Framework Suite is composed of three loadable layers, each containing multiple sub-frameworks and behavioral modes.
All interactions with the LLM occur through explicit activation, initialization, or context switching among these layers.

Layer

File

Function

Internal Tag

Reasoning Core

FinanceAnalyst_MetaCognitive_Framework_Corrected_v2025-11.yaml

Analytical logic & structured thinking (RF01-RF05, WP01-WP02, CH01-CH03)

reasoning_core

Behavioral Core

DDAY_VoiceProtocols_Corrected_v2025-11.yaml

Tone, voice, pacing, and communicative style (Professional v3 / Casual v1 / Snapshots BS01–BS06)

behavioral_core

Validation Core

AUDIT_IMPLEMENTATION_SUMMARY_2025-11-10.md

Quality-assurance, encoding, linkage, and audit verification logic

validation_reference



1. Quick Reference: Adjustable “Levers”

Lever Category

Options

Typical Command / Prompt Example

Purpose

Framework Layer Activation

reasoning_core / behavioral_core / validation_reference / full_suite

“Activate behavioral_core only.”

Load only the frameworks you need for the task.

Voice Mode (from Behavioral Core)

Professional v3 / Casual-Professional v1

“Use DDAY Professional v3 for this deliverable.”

Controls tone, structure, and rhythm.

Analytical Frameworks (RF)

RF01 – Foundational ReasoningRF02 – Comparative AssessmentRF03 – Error-DecompositionRF04 – Risk-Signal ValidationRF05 – Credit Evaluation

“Apply RF03 Error-Decomposition using ±10 % / 5 % thresholds.”

Determines analytical logic path.

Workflow Patterns (WP)

WP01 – Documentation ProtocolWP02 – Analytical Delivery Cycle

“Follow WP01 naming and documentation protocol.”

Ensures standardized outputs and metadata.

Cognitive Heuristics (CH)

CH01 – Noise-to-SignalCH02 – Anchoring MitigationCH03 – Confidence Interval Calibration

“Use CH01 to validate data-pattern reliability.”

Adds interpretive heuristics.

Behavioral Snapshots (BS)

BS01 – InstructionalBS02 – Peer FeedbackBS03 – MentorshipBS04 – Strategic BriefBS05 – Reflective / NarrativeBS06 – Crisis Communication

“Apply BS06 crisis snapshot tone.”

Rapidly changes communication posture.

Threshold Controls

deviation_alert ± 10 %material_variance ≥ 5 %impact_priority > 3 % AND effort < 4 h

“Use stricter threshold: ±8 % / 4 % materiality for this run.”

Adjusts sensitivity for variance detection.

Output Cadence

Second-Order Reasoning (default)Linear Summary (brief)

“Return linear summary only.”

Defines explanation depth.

Formatting Mode

Markdown (default)YAML (spec) Table (summary) Bullet (concise)

“Output in YAML spec format.”

Controls output structure for export.

Connector Reference Source

Box / Local / GitHub / SharePoint

“Reference Box path under /Credit Department/….”

Directs where supporting files are sourced.

Audit Severity Level

Light Verification / Full Verification

“Run full verification under validation_reference.”

Chooses QA intensity.

Session Mode

Project (persistent frameworks)General (temporary context)

“Start in Project mode under LLM_Frameworks__DDAY_2025.”

Defines memory and retrieval boundaries.

Output Focus (Systemic Cadence)

First-Order Effects (quick impact) Second-Order Implications (full systemic)

“Give me only first-order effects.”

Adjusts analytical depth.



2. Daily Workflow Protocol

Step

Action

Example Prompt

Expected Behavior

1. Start New Project Chat

Inside LLM_Frameworks__DDAY_2025 project

“Initialize DDAY Framework Suite; apply full_suite with Professional v3 voice.”

Loads all frameworks and confirms thresholds.

2. Define Intent

Specify focus area

“Focus on RF04 Risk-Signal Validation for current dataset.”

Loads the right reasoning module.

3. Execute Analysis / Drafting

Work through iterative prompts; adjust tone via Professional v3 ↔ Casual v1.

“Switch to BS02 Peer Feedback tone.”

Adapts delivery style mid-session.

4. Mid-Session Validation (optional)

“Run light verification.”

Ensures no drift or linkage loss.



5. Close Session

“Conclude under DDAY Suite; summarize variances and systemic implications.”

Outputs compliance summary + audit-ready paragraph.



6. Archive

Export and save to Box under /Session Archives/<date>__SessionSummary.md

—

Keeps permanent log.



3. Pre-Session Prompts (Boot Options)

Mode

Prompt

Loads

Full Initialization

Initialize DDAY Framework Suite.

All three cores; default thresholds.

Voice-Only Mode

Activate behavioral_core only.

DDAY Voice protocols only.

Analysis-Only Mode

Activate reasoning_core only.

Analytical frameworks only.

Audit Mode

Activate validation_reference; run integrity crosswalk.

QA verification.

Quick Initialize

Quick-init DDAY Suite; apply Professional v3.

Fast boot, fewer confirmations.



4. Mid-Session Control Levers

Control

Prompt

Purpose

Switch Voice

Switch to Casual-Professional v1 tone.

Move from formal to chat voice.

Switch Framework

Switch to RF03 Error-Decomposition.

Change reasoning schema.

Adjust Thresholds

Tighten thresholds to ±8 % / 4 %.

Increase precision.

Set Output Format

Return output in Markdown table.

Adjust format for reports.

Add Secondary Layer

Overlay validation_reference for QA while keeping Professional v3 voice.

Combine audit + tone layers.

Toggle Depth

First-order effects only. or Expand with second-order implications.

Control analytical depth.



5. End-of-Session Protocol

Always finish with:

Conclude DDAY Session.
Summarize session outputs and note any variances from RF01–RF05 thresholds.
Log compliance outcome unless deviation ≥ 5 %.

Then export your transcript summary and save to:

/Credit Department/Personal Folders/DDay/Session Archives/<YYYYMMDD>__SessionSummary.md

Tag: session_log, v2025_11.



6. Verification Routines

Type

Prompt

When to Use

Expected Result

Light Verification

Run light verification — confirm active versions and thresholds.

Weekly / Before deliverables.

Confirms load order + voice integrity.

Full Verification

Run full verification — validate encoding, thresholds, and audit linkages.

Biannually.

Checks BOM, tags, cross-file alignment.

Box Metadata Check

(Use API/CLI if connector blocked.)

Quarterly.

Confirms tag integrity (behavioral_core, etc.).



7. Maintenance & Version Control

Frequency

Action

Note

Weekly

Light verification.

Use short prompt above.

Monthly

Tag check (v2025_11, UTF8_BOM).

Ensure all still visible in Box.

Quarterly

Version update (e.g., v2026_02).

Replace files + update version string in project instructions.

Biannually

Full verification + audit summary.

Log in AUDIT_IMPLEMENTATION_SUMMARY_<date>.md.

Annually

Archive deprecated versions.

Move to /Archive/ folder.



8. Connector Logic

Connector

Status

Usage

Box

Primary repository

Source of truth for all framework files and archives.

Local Sync

C:\Users\darrell.day\Box\Credit Department\Personal Folders\DDay\...

Use for manual verification if connector disabled.

GitHub / SharePoint (Optional)

Secondary redundancy

Can host mirrored frameworks if enabled later.



9. Behavioral Summary Reference

Snapshot

Context

Tone

BS01 – Instructional

Teaching or explaining process

Neutral / clear

BS02 – Peer Feedback

Student or peer review

Collegial / direct

BS03 – Mentorship

Advisory or coaching

Warm / guiding

BS04 – Strategic Brief

Executive summary

Crisp / authoritative

BS05 – Reflective Narrative

Essay or internal thought

Introspective / balanced

BS06 – Crisis Communication

Urgent or high-risk context

Focused / action-oriented



10. Voice Modes Overview

Voice

Use Case

Characteristics

Professional v3

Formal reports, memos, academic work

Structured brevity; declarative; minimal formatting; “authority through economy.”

Casual-Professional v1

Emails, Teams messages, human conversation

Natural rhythm; empathetic phrasing; minor imperfections allowed.

To change voices mid-session:

Switch to [voice_name].



11. Optional Performance Levers

Lever

Range / Options

Use Case

Timing Benchmarks

Initial assessment 5–10 min • Full analysis 30–45 min • Documentation 10 min • Validation 5–10 min

Self-check for pacing discipline.

Information Density Goal

80–95 %

Controls verbosity; request “Increase density to 90 %.”

Heuristic Mode

“Apply CH01–CH03 heuristics collectively.”

Broader reasoning coverage.

Confidence Interval Mode

“Return base-case 70–80 % confidence interval.”

Adds probabilistic framing.



12. Example Session Flow

Prompt:
Work:
“Apply RF03 to evaluate deviation; tighten threshold to ±8 %.”
Communicate:
“Switch to BS02 for feedback summary.”
Validate:
“Run light verification.”
Close:
“Conclude DDAY Session; summarize systemic assessment.”
Archive:
Save summary to Box Session Archives folder, tag session_log, v2025_11.



13. In Case of Context Drift

If the model starts losing structure or tone:

Re-initialize DDAY Framework Suite; restore reasoning_core + behavioral_core.
Confirm Professional v3 active; enforce thresholds ±10 % / ≥ 5 %.

This restores the full behavioral and analytical posture instantly.



14. Core Mantra for Consistency

Start deliberately, switch explicitly, end cleanly.

Start every serious session with a clear initialization.
Switch frameworks or voices intentionally.
End with compliance confirmation and archive the output.



✅ With these controls, you can:

Dynamically adjust tone, reasoning depth, and QA rigor.
Maintain perfect audit traceability.
Prevent drift or unintended model behavior.
Operate ChatGPT Enterprise as a stable, reproducible analytical partner.

