



DDAY Framework Suite — Command Reference Sheet

(Daily Operational Quick-Use Guide)



Initialization Commands

Purpose

Command

Notes

Full boot (all layers)

Initialize DDAY Framework Suite.

Loads reasoning_core → behavioral_core → validation_reference.

Quick boot

Quick-init DDAY Suite; apply Professional v3.

Faster start, fewer confirmations.

Analysis-only

Activate reasoning_core only.

Loads RF01–RF05 frameworks.

Voice-only

Activate behavioral_core only.

Loads tone, pacing, voice protocols.

Audit-only

Activate validation_reference; run integrity crosswalk.

Runs QA checks only.



Voice & Tone Controls

Setting

Command

Effect

Professional Voice (v3)

Use DDAY Professional v3.

Formal, concise, declarative.

Casual-Professional Voice (v1)

Switch to Casual-Professional v1.

Conversational, authentic.

Snapshot Tone Change

Apply BS[01–06] (e.g., Apply BS06 crisis snapshot.)

Instant context-specific tone.



Analytical Framework Controls

Framework

Command

Focus

RF01

Apply RF01 Foundational Reasoning.

Baseline logic, structure.

RF02

Apply RF02 Comparative Assessment.

Relative performance analysis.

RF03

Apply RF03 Error-Decomposition.

Variance & diagnostic logic.

RF04

Apply RF04 Risk-Signal Validation.

Stress & signal reliability.

RF05

Apply RF05 Credit Evaluation.

Credit & repayment capacity.



Workflow & Heuristic Modules

Category

Command

Purpose

WP01

Follow WP01 Documentation Protocol.

Naming & version discipline.

WP02

Follow WP02 Analytical Delivery Cycle.

Standard analysis flow.

CH01

Apply CH01 Noise-to-Signal.

Detect false patterns.

CH02

Apply CH02 Anchoring Mitigation.

Counter bias.

CH03

Apply CH03 Confidence Calibration.

Quantify uncertainty.



Threshold & Depth Adjustments

Control

Command

Default

Deviation alert

Set deviation_alert ±10%.

±10 %

Material variance

Set material_variance ≥5%.

≥ 5 %

Tighten thresholds

Tighten thresholds to ±8 % / 4 %.

—

Depth mode

First-order effects only. or Expand with second-order implications.

Second-order reasoning by default.



Output Format & Structure

Format

Command

Markdown

Output in Markdown.

YAML

Output in YAML spec format.

Table

Return output as summary table.

Bulleted

Use concise bullet format.



Session Management

Action

Command

Verify active versions

Run light verification.

Full integrity check

Run full verification.

Re-initialize (drift fix)

Re-initialize DDAY Framework Suite.

Switch framework mid-chat

Switch to [framework_name].

Switch voice mid-chat

Switch to [voice_name].

Combine audit + tone

Overlay validation_reference with Professional v3.



Closing & Archiving

Purpose

Command

Result

End session properly

Conclude DDAY Session.

Outputs compliance summary.

Formal closeout

Conclude under DDAY Framework Suite; summarize variances and systemic implications.

Audit-ready close.

Archive output

Save transcript to Box → /Session Archives/<YYYYMMDD>__SessionSummary.md

Tag: session_log, v2025_11.



Maintenance & Checks

Frequency

Command

Weekly

Run light verification — confirm active versions and thresholds.

Quarterly

Update framework version to v2026_02.

Biannually

Run full verification under validation_reference.

Annually

Archive deprecated frameworks.



Emergency Recovery

If tone, reasoning, or structure drifts:

Re-initialize DDAY Framework Suite.
Restore reasoning_core + behavioral_core.
Confirm Professional v3 active; enforce ±10 % / ≥5 % thresholds.



Core Operating Rhythm

Start with an explicit initialization.
Operate using targeted frameworks and voice controls.
Verify regularly (light or full).
Conclude with compliance summary.
Archive your session.



Mantra: Start deliberately → Switch explicitly → End cleanly.
Maintain audit traceability, tone integrity, and reasoning fidelity across every session.

