# Arc Browser AI Integration Guide

## Quick Setup (2 minutes)

### Step 1: Access Arc AI Settings
1. Open Arc Browser
2. Press `Cmd/Ctrl + ,` for Settings
3. Navigate to "Max" or "AI" section

### Step 2: Import Context
1. Open file: `browser_sync/arc/arc_ai_context.json`
2. Copy the entire JSON content
3. In Arc AI settings, paste into "Custom Context" or "AI Instructions" field

### Step 3: Enable Auto-Sync
Arc automatically uses your context for:
- Max AI conversations
- Instant answers (Cmd+T queries)
- Page summaries
- Search enhancements

### Step 4: Voice Commands with Arc
When using Arc's AI features, start with:
- "Using DDAY voice..." for professional responses
- "Analyze with second-order reasoning..." for deep analysis
- "Create MSO summary..." for structured outputs

## Verification
Your context hash: Check `browser_sync/arc/arc_prompt_template.md`
This ensures you're using the latest synchronized version.

## Advanced Features

### Custom Commands
Arc supports custom AI commands. Add these shortcuts:

1. **Quick Analysis** (`/analyze`)
   - Triggers: "Apply DDAY analytical framework to this page"
   
2. **Faculty Review** (`/review`)
   - Triggers: "Review this content as MSIF faculty would"
   
3. **MSO Summary** (`/mso`)
   - Triggers: "Create MSO-structured summary in 250 words"

### Arc + Perplexity Integration
Arc can route queries to Perplexity. When configured:
1. Complex research → Routes to Perplexity with your profile
2. Quick facts → Handled by Arc's built-in AI
3. Voice queries → Can use either based on complexity

## Troubleshooting

| Issue | Solution |
|-------|----------|
| Context not applying | Re-import `arc_ai_context.json` |
| Responses too generic | Verify hash matches latest export |
| Voice commands not working | Check Arc AI is enabled in settings |

## Auto-Update
The sync system updates Arc's configuration automatically when you:
- Modify context files in Obsidian
- Run `START_SYNC.bat`
- Push changes to GitHub
