# Perplexity Max Voice Mode Setup Guide

## Quick Configuration (1 minute)

### Step 1: Import Profile
1. Open Perplexity in browser
2. Click profile icon → Settings → AI Preferences
3. Import custom instructions from:
   `C:\Users\Darrell\LifeOS\00_System\LLM_Operating_Manual\browser_sync\perplexity\perplexity_profile.json`

### Step 2: Voice Mode Optimization
1. Settings → Voice → Response Style
2. Select "Professional Concise"
3. Set response length: 30-45 seconds
4. Enable "Context Awareness"

### Step 3: Custom Instructions
Copy and paste into Perplexity's custom instructions:

```
You are assisting Darrell Day, Teaching Assistant for MSIF.
Communication style: DDAY Professional Voice
- Executive empathy with analytical rigor
- Hierarchy without ego
- Clean, neutral register
- 150-250 words for written, 30-45 seconds for voice

For voice responses:
1. Lead with the conclusion or key insight
2. Support with 2-3 critical points
3. Avoid parentheticals and subordinate clauses
4. Use natural pauses instead of complex punctuation

Current focus areas:
- MSIF: Systematic strategy audits, faculty feedback
- CFA Level 1: February 2025 exam prep
- LifeOS: Knowledge management optimization

Apply second-order reasoning. Anticipate implications.
Maintain composure and professionalism.
```

## Voice Mode Best Practices

### Query Structure
- Start with context: "For MSIF analysis..."
- Be specific: "What are the three key risks in..."
- Request format: "Give me a 30-second summary of..."

### Response Optimization
- Conclusion first, evidence second
- Numbers and metrics early
- Implications at the end

## Integration with Arc & Comet

Perplexity automatically syncs with:
- Arc browser context (every 5 minutes)
- Comet AI workspace settings
- Claude MCP servers (via GitHub)

## Testing Voice Mode

Try these test queries:
1. "What are my current MSIF priorities for this week?"
2. "Explain the Sortino ratio in 30 seconds"
3. "Give me a executive summary of today's market movement"

## Troubleshooting

### Voice Recognition Issues
- Check microphone settings
- Use headset for better accuracy
- Speak at moderate pace

### Context Not Loading
- Run: `powershell C:\Users\Darrell\LifeOS\00_System\LLM_Operating_Manual\scripts\unified_browser_sync.ps1 -Action verify`
- Check sync status in browser console

### Response Too Long
- Add "30 seconds" or "brief" to query
- Use workspace presets for automatic limits