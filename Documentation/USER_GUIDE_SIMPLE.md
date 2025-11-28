# 🚀 MCP Sync System - User Guide
## Your AI Context Syncs Automatically Every 5 Minutes!

---

## What This Does For You

Think of this system as your **"AI Memory Bank"** that follows you everywhere. It ensures that every AI assistant you talk to (ChatGPT, Claude, Perplexity, etc.) remembers:
- Your professional writing style (DDAY Voice)
- Your current projects (CFA prep, MSIF work)
- Your preferences and commands
- Your context and background

**It's like having a personal assistant briefing every AI before you talk to them!**

---

## How It Works (Simple Version)

### The Magic Circle 🔄
Every 5 minutes, your computer:
1. **Collects** your AI settings from a special folder
2. **Packages** them into a unified file
3. **Uploads** them to your private cloud (GitHub)
4. **Updates** all your browsers automatically

You don't have to do anything - it just works!

---

## Quick Start Commands

### The Commands You'll Actually Use

#### Check if it's working:
1. Open PowerShell (Windows key + X, then "A")
2. Type: `cd C:\Users\Darrell\LifeOS\00_System\LLM_Operating_Manual`
3. Type: `.\scripts\check_status.ps1`
4. You should see green "[OK]" messages

#### Force a sync right now:
```
.\scripts\browser_sync.ps1 -Force
```

#### Turn sync on/off:
```
# Turn off
.\scripts\toggle_sync.ps1 -Action Disable

# Turn back on
.\scripts\toggle_sync.ps1 -Action Enable
```

---

## Your Custom AI Commands

When chatting with any AI, you can use these shortcuts:

### In Arc Browser:
- `/dday` - Makes the AI write like you
- `/analyze` - Deep analysis mode
- `/sync` - Check when last synced

### In Comet/Perplexity:
- `!dday` - Your professional voice
- `!analyze` - Deep thinking mode
- `!voice` - Optimize for speaking

---

## Setting Up Your Browsers (One-Time Setup)

### Perplexity (90% Done!)
We already added your settings! Just:
1. Open Perplexity
2. Go to Settings → Personalization
3. Your DDAY context is already there
4. Start chatting - try saying "!dday explain something"

### Arc Browser (To Do)
1. Open Arc
2. Press Ctrl+, for settings
3. Find "Max AI" or "AI Settings"
4. Look for "Custom Instructions"
5. Copy this file's contents: `browser_sync\arc\arc_ai_context.json`
6. Paste and save

### Comet Browser (To Do)
1. Open Comet
2. Go to AI settings
3. Import from: `browser_sync\comet\comet_ai_context.json`
4. Save

---

## How to Know It's Working

### Green Lights 🟢
- **Check Status** shows "[OK] Scheduled Task: WORKING"
- Files update every 5 minutes
- GitHub shows recent commits
- Commands like `/dday` work in browsers

### Red Flags 🔴
- Status shows "Failed"
- No updates for over 10 minutes
- Browser commands don't work
- Error messages appear

---

## Common Questions

### "Why do I need this?"
Without this system, you'd have to:
- Manually copy settings to each browser
- Re-explain yourself to every AI
- Lose your preferences when switching devices
- Start from scratch with each conversation

### "Is my data safe?"
- ✅ Private GitHub repository (only you can see it)
- ✅ No sensitive data (passwords, SSN, etc.)
- ✅ You control what syncs
- ✅ Can turn off anytime

### "What if it stops working?"
Run the magic fix command:
```
.\scripts\check_status.ps1
```
This tells you exactly what's wrong!

### "Can I use this on my phone?"
Not yet, but the foundation is ready. When you want mobile access, we can set it up in 10 minutes.

---

## Your DDAY Voice Settings

The system maintains your professional writing style:

### Quick Reference
- **Formal (V3):** Board reports, academic papers
- **Standard (V2):** Regular emails, updates  
- **Casual (V1):** Slack, quick messages

### Your Style Rules
- Short sentences (18-25 words)
- Clear, direct language
- No fluff or corporate jargon
- Emphasis through structure, not CAPS or bold

---

## Troubleshooting

### If Something Seems Wrong

#### Step 1: Check Status
```
.\scripts\check_status.ps1
```
Look for green "[OK]" messages

#### Step 2: Force Sync
```
.\scripts\browser_sync.ps1 -Force
```
This manually triggers an update

#### Step 3: Check the Log
```
Get-Content "Logs\browser_sync_$(Get-Date -Format 'yyyyMMdd').log" -Tail 10
```
Shows what happened recently

#### Step 4: Restart the System
```
.\scripts\toggle_sync.ps1 -Action Disable
.\scripts\toggle_sync.ps1 -Action Enable
```

---

## Visual System Map

```
Your Computer
    ↓ (every 5 min)
Your Settings
    ↓
Private Cloud (GitHub)
    ↓
All Your Browsers
    ↓
Every AI Knows You!
```

---

## Important Locations

### Your Main Folder
`C:\Users\Darrell\LifeOS\00_System\LLM_Operating_Manual`

### Your Configs
`browser_sync\` folder has all browser settings

### Your Logs
`Logs\` folder shows what's happening

### Your Cloud Backup
https://github.com/DDayFinSci/llm-operating-manual

---

## The Bottom Line

✅ **It's Working** - Syncing every 5 minutes
✅ **It's Private** - Your own secure repository  
✅ **It's Automatic** - No manual work needed
✅ **It's Reliable** - Survived all our testing

🔄 **Next Time You Chat with AI:**
- Your voice and style are ready
- Your context is loaded
- Your commands work instantly

---

## Need Help?

1. **First:** Run `.\scripts\check_status.ps1`
2. **Second:** Check this guide
3. **Third:** Force a manual sync
4. **Fourth:** Ask Claude/ChatGPT - they can read your logs!

Remember: The system is designed to be invisible. If you don't notice it, it's working perfectly!

---

*User Guide Version 1.0*
*System Status: OPERATIONAL*
*Last Sync: Every 5 minutes, 24/7*