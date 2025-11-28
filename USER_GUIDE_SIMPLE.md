# Simple User Guide - Your AI Assistant Settings Sync System
*A plain English guide for using your automated AI configuration system*

---

## What This System Does (In Simple Terms)

Imagine you have a personal assistant who knows exactly how you like things done - your writing style, your preferences, how formal or casual to be in different situations. Now imagine having to re-train that assistant every time you switch browsers or computers. Frustrating, right?

**This system solves that problem.** It automatically keeps all your AI assistants (in different browsers) synchronized with your preferences, updating every 5 minutes.

---

## What You Need to Know

### It's Automatic
- **Runs by itself** every 5 minutes
- **Backs up to the cloud** (your private GitHub)
- **Starts when Windows starts**
- **You don't need to do anything** once it's set up

### Your Custom Settings Include
- **Your professional writing style** (DDAY Voice)
- **Different modes** for different situations (formal, casual, analytical)
- **Quick shortcuts** that work in any browser
- **Optimizations** for voice conversations with AI

---

## How to Use It (Day to Day)

### Quick Commands in Any AI Chat
When chatting with AI (Perplexity, Claude, etc.), you can type:

- **`!dday`** → Makes the AI use your professional voice
- **`!analyze`** → Tells AI to think deeper about problems
- **`!voice`** → Optimizes responses for reading out loud
- **`!sync`** → Check when settings last updated

### Check If Everything's Working
1. Open PowerShell (Windows terminal)
2. Navigate to: `cd C:\Users\Darrell\LifeOS\00_System\LLM_Operating_Manual`
3. Type: `.\scripts\check_status.ps1`
4. You'll see:
   - ✅ Green = Good
   - ⚠️ Yellow = Attention needed
   - ❌ Red = Problem

### If Something's Not Working
**First, don't panic!** The system has built-in fixes:

1. **Force a sync right now:**
   ```
   .\scripts\browser_sync.ps1 -Force
   ```

2. **Turn sync off/on (like restarting):**
   ```
   .\scripts\toggle_sync.ps1 -Action Disable
   .\scripts\toggle_sync.ps1 -Action Enable
   ```

3. **Check what's happening:**
   ```
   .\scripts\check_status.ps1
   ```

---

## Common Situations

### "I updated my preferences but don't see changes"
- Wait 5 minutes (automatic sync)
- OR force sync now: `.\scripts\browser_sync.ps1 -Force`

### "The sync stopped working"
1. Run: `.\scripts\check_status.ps1`
2. If it shows errors, run: `.\scripts\final_task_fix.ps1`

### "I want to stop the sync temporarily"
- Disable: `.\scripts\toggle_sync.ps1 -Action Disable`
- Re-enable later: `.\scripts\toggle_sync.ps1 -Action Enable`

### "I want to see my current settings"
- Open: `C:\Users\Darrell\LifeOS\00_System\LLM_Operating_Manual\browser_sync\shared\unified_context.md`

---

## Your Professional Voice Settings

The system maintains THREE voice modes for different situations:

### 🎩 **Formal (V3)**
- Board presentations
- Academic papers
- Official evaluations
- *Very professional, structured*

### 💼 **Standard (V2)**
- Regular work emails
- Project updates
- Team communications
- *Professional but approachable*

### 👔 **Casual (V1)**
- Slack/Teams messages
- Quick notes
- Informal discussions
- *Relaxed but still professional*

---

## What's Happening Behind the Scenes

Every 5 minutes, your computer:
1. ✅ Checks if any settings changed
2. ✅ Updates all browser configurations
3. ✅ Saves a backup to GitHub (private)
4. ✅ Writes a log of what happened
5. ✅ Goes back to sleep until next check

---

## Important Files & Locations

### Your Main Folder
`C:\Users\Darrell\LifeOS\00_System\LLM_Operating_Manual`

### Your Settings
`browser_sync\shared\unified_context.md` - All your preferences in one place

### Today's Activity Log
`Logs\browser_sync_20241114.log` (date changes daily)

### Your Cloud Backup
https://github.com/DDayFinSci/llm-operating-manual (Private - only you can see it)

---

## Quick Reference Card

### Essential Commands (Copy & Paste These)
```
Check status:     .\scripts\check_status.ps1
Force sync now:   .\scripts\browser_sync.ps1 -Force
Stop sync:        .\scripts\toggle_sync.ps1 -Action Disable
Start sync:       .\scripts\toggle_sync.ps1 -Action Enable
Fix problems:     .\scripts\final_task_fix.ps1
```

### In Your AI Chats
```
!dday     = Professional voice
!analyze  = Deep analysis
!voice    = Voice-optimized
!sync     = Check sync status
```

---

## When to Contact Support

You generally won't need help, but if:
- ❌ Red errors persist after running fix script
- ❌ GitHub shows "authentication failed"
- ❌ Sync hasn't run for hours
- ❌ Browser commands (!dday) don't work

Save this info for support:
1. Screenshot of `.\scripts\check_status.ps1` output
2. Last 20 lines of today's log file
3. What you were doing when it stopped

---

## Remember

- ✅ **It's automatic** - Let it run in the background
- ✅ **It's private** - Only you can access your settings
- ✅ **It's reliable** - Self-healing with error recovery
- ✅ **It's yours** - Customized for your professional voice

---

*Last Updated: November 14, 2024*
*System Version: 2.0*
*Status: OPERATIONAL*