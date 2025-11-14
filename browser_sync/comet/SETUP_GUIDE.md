# Comet Browser AI Integration Guide

## Quick Setup (3 minutes)

### Step 1: Access Comet AI Settings
1. Open Comet Browser
2. Click the AI icon in toolbar (or press `Alt+A`)
3. Select "Settings" or "AI Preferences"

### Step 2: Import Context Configuration
1. Navigate to: `browser_sync/comet/comet_ai_context.json`
2. Copy the entire JSON content
3. In Comet AI settings:
   - Find "Custom Instructions" or "AI Context"
   - Paste the JSON content
   - Save settings

### Step 3: Configure Voice Mode
Comet integrates with Perplexity Max for voice interactions:
1. In Comet settings, link your Perplexity account
2. Enable "Voice Mode Passthrough"
3. Set default to "Perplexity Max Voice"

### Step 4: Enable Quick Commands
Comet supports command shortcuts. Enable these:
- `!dday` - DDAY Professional Voice
- `!analyze` - Deep analysis mode
- `!mso` - MSO structure
- `!voice` - Voice optimization
- `!quick` - 30-second response

## Voice Mode Optimization

### For Perplexity Max Voice Mode
When using voice commands through Comet:

1. **Quick Questions** (30 seconds)
   - Start with: "Quick answer using DDAY voice"
   - Comet auto-routes to Perplexity with context

2. **Analysis** (60-90 seconds)  
   - Start with: "Analyze with second-order reasoning"
   - Includes structured verbal markers

3. **Research** (2+ minutes)
   - Start with: "Deep dive on..."
   - Routes to Perplexity Pro with full context

### Arc ↔ Comet Synchronization

Both browsers share the unified context at:
`browser_sync/shared/unified_context.md`

Changes in either browser sync automatically every 6 hours.

## Advanced Features

### Context Modules
Comet loads different context modules based on your query:
- **Professional**: For work emails, memos
- **MSIF**: For fund analysis, pitch reviews
- **Personal**: For learning, note-taking

### Smart Routing
Comet automatically routes queries:
- Complex research → Perplexity Pro
- Quick facts → Built-in AI
- Analysis → Claude through Comet
- Voice queries → Perplexity Max

### Memory Persistence
Comet maintains conversation context across sessions:
- Auto-saves every interaction
- Syncs with GitHub for backup
- Shares memory with Arc when enabled

## Verification

Check your configuration status:
1. Type `!sync` in Comet's AI chat
2. Should return: "Context synchronized. Hash: a1b2c3d4e5f6g7h8"
3. If mismatch, re-import configuration

## Troubleshooting

| Issue | Solution |
|-------|----------|
| Context not loading | Re-import `comet_ai_context.json` |
| Voice mode not working | Check Perplexity account link |
| Commands not recognized | Enable quick commands in settings |
| Sync failing | Run `browser_sync.ps1` manually |

## Manual Sync
To force synchronization:
```powershell
C:\Users\Darrell\LifeOS\00_System\LLM_Operating_Manual\scripts\browser_sync.ps1
```

## Auto-Update Schedule
- Every 6 hours automatically
- On system startup
- When context files change in Obsidian
- After GitHub push