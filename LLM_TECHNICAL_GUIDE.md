# LLM Technical Implementation Guide
## MCP Cross-Device Synchronization System v2.0
*Comprehensive technical documentation for AI assistants working with this system*

---

## System Architecture Overview

This document provides complete technical specifications for understanding and maintaining Darrell Day's cross-device AI context synchronization system. The system implements a distributed configuration management solution using Git version control, Windows Task Scheduler, and browser-specific JSON/MD configurations.

### Core Design Principles
1. **Idempotent Operations**: All sync operations can be repeated safely
2. **Change Detection**: Hash-based comparison prevents unnecessary operations
3. **Graceful Degradation**: System continues functioning despite individual component failures
4. **Silent Background Operation**: Minimal resource usage, no user interruption
5. **Self-Documenting**: Comprehensive logging and status reporting

---

## Technical Stack

### Languages & Runtimes
- **PowerShell 5.1+**: Primary scripting language for automation
- **Batch Script**: Wrapper layer for Task Scheduler compatibility
- **JSON**: Configuration data format
- **Markdown**: Human-readable context format
- **YAML**: Structured context storage
- **Git**: Version control and distribution

### Dependencies
- **Windows 10/11**: Operating system
- **Git for Windows**: Version control (2.30+)
- **Windows Task Scheduler**: Automation service
- **PowerShell**: Execution environment
- **.NET Framework 4.5+**: Required for certain PowerShell operations

---

## File System Architecture

```
C:\Users\Darrell\LifeOS\00_System\LLM_Operating_Manual\
│
├── browser_sync\                    # Browser-specific configurations
│   ├── arc\
│   │   ├── arc_ai_context.json     # Arc browser AI configuration
│   │   │   Structure: {
│   │   │     version: "5.0",
│   │   │     timestamp: "ISO-8601",
│   │   │     profile: { name, role, voice, style },
│   │   │     active_projects: {},
│   │   │     voice_mode_optimization: {},
│   │   │     browser_commands: {},
│   │   │     sync_metadata: { integration_token, last_sync, hash }
│   │   │   }
│   │   └── SETUP_GUIDE.md
│   │
│   ├── comet\
│   │   ├── comet_ai_context.json   # Comet/Perplexity web configuration
│   │   │   Structure: Similar to Arc with platform-specific adaptations
│   │   └── SETUP_GUIDE.md
│   │
│   ├── perplexity\
│   │   └── perplexity_voice_context.json  # Voice mode optimizations
│   │       Structure: {
│   │         voice_tiers: { quick_30s, standard_60s, detailed_120s },
│   │         verbal_markers: {},
│   │         response_optimization: {}
│   │       }
│   │
│   └── shared\
│       ├── unified_context.md      # Generated master context (DO NOT EDIT)
│       └── last_sync.json          # Sync timestamp and status
│
├── context\
│   ├── raw\                        # Source context files
│   │   └── DDAY_VoiceProtocols_Corrected_v2025-11.md
│   └── merged\
│       └── merged_context.yaml     # Structured context data
│
├── scripts\                         # Automation scripts
│   ├── browser_sync.ps1            # Main synchronization engine
│   ├── sync_wrapper.bat           # Task Scheduler entry point
│   ├── toggle_sync.ps1            # Enable/disable automation
│   ├── check_status.ps1           # System health check
│   ├── final_task_fix.ps1         # Task repair utility
│   └── fix_scheduled_task.ps1     # Alternative task repair
│
├── Logs\
│   └── browser_sync_YYYYMMDD.log  # Daily rotating logs
│
├── .github\
│   └── workflows\
│       ├── browser_sync.yml       # GitHub Actions workflow
│       └── deploy_mobile.yml      # Mobile deployment (future)
│
├── .last_sync_hash                # Change detection hash
├── .gitignore                     # Git exclusions
└── README.md                      # Repository documentation
```

---

## Core Component Specifications

### 1. Main Synchronization Script (`browser_sync.ps1`)

**Purpose**: Orchestrates the entire synchronization process

**Key Functions**:
```powershell
function Test-ChangesNeeded
  - Computes SHA256 hash of all content files
  - Compares with stored hash in .last_sync_hash
  - Returns boolean indicating if sync needed

function Update-UnifiedContext
  - Merges all context sources
  - Generates unified_context.md
  - Adds metadata and timestamps
  - Returns content hash for verification

function Update-BrowserConfig($Browser, $ConfigPath, $Hash)
  - Updates specific browser JSON configuration
  - Injects current timestamp and hash
  - Handles different config structures gracefully

function Sync-ToGitHub
  - Stages changes with git add
  - Creates descriptive commit message
  - Pushes to origin/main
  - Handles errors gracefully
```

**Error Handling**:
- All operations wrapped in try-catch blocks
- Errors logged with context
- Non-critical failures don't stop sync
- Exit codes: 0 (success), 1 (failure)

### 2. Task Scheduler Configuration

**Task Name**: `Browser_Context_Sync`

**Triggers**:
```xml
<Triggers>
  <TimeTrigger>
    <Repetition>
      <Interval>PT5M</Interval>       <!-- Every 5 minutes -->
      <Duration>P365D</Duration>      <!-- For 1 year -->
    </Repetition>
  </TimeTrigger>
  <LogonTrigger>
    <UserId>SYSTEM\Darrell</UserId>
  </LogonTrigger>
</Triggers>
```

**Action**:
```xml
<Action>
  <Execute>C:\Users\Darrell\LifeOS\00_System\LLM_Operating_Manual\scripts\sync_wrapper.bat</Execute>
</Action>
```

**Why Batch Wrapper?**
- Ensures correct working directory
- Handles PowerShell execution policy
- Provides clean exit codes to Task Scheduler
- Simplifies troubleshooting

### 3. Git Configuration

**Repository**: https://github.com/DDayFinSci/llm-operating-manual.git

**Authentication**:
- Method: Personal Access Token (PAT)
- Storage: Windows Credential Manager
- Scope: repo (full control)
- Expiration: 90 days (renewable)

**Commit Strategy**:
- Only commits when changes detected
- Descriptive messages: "Auto-sync: X file(s) updated [5-min interval]"
- Ignores non-essential files via .gitignore

### 4. Context Processing Pipeline

```
1. Source Files                    2. Processing                   3. Distribution
   ↓                                  ↓                              ↓
┌─────────────────┐              ┌─────────────┐              ┌──────────────┐
│ DDAY_Voice.md   │──────────────▶│   Merge &   │─────────────▶│ arc.json     │
│ merged.yaml     │              │   Process   │              │ comet.json   │
│ browser JSONs   │              │  (Add Hash) │              │ perplexity.json│
└─────────────────┘              └─────────────┘              └──────────────┘
                                        │                            │
                                        ▼                            ▼
                                 ┌─────────────┐              ┌──────────────┐
                                 │unified.md   │              │   GitHub     │
                                 └─────────────┘              └──────────────┘
```

---

## DDAY Professional Voice Protocol

### Voice Architecture
```yaml
voice_hierarchy:
  v3_formal:
    use_cases: [board_communications, academic_papers, evaluations]
    sentence_length: 18-25  # Hard constraint
    paragraph_length: 3-4    # Sentences max
    tone: composed_precise_authoritative
    diction: [clarify, outline, evaluate, confirm, maintain]
    
  v2_standard:
    use_cases: [cross_functional_emails, project_updates]
    sentence_length: 15-20  # Flexible
    tone: professional_approachable
    natural_rhythm: true
    
  v1_casual:
    use_cases: [slack, teams, quick_emails]
    tone: conversational
    contractions: allowed
    phrases: [sounds_good, quick_check, noted]
```

### Command Processing

When an LLM encounters these commands, apply the following transformations:

**`!dday` or `/dday`**:
1. Set sentence length to 18-25 words
2. Use declarative endings
3. Apply "authority through economy" principle
4. Remove unnecessary transitions
5. Bold only deadlines and deliverables

**`!analyze` or `/analyze`**:
1. Apply second-order thinking
2. Consider implications beyond stated problem
3. Structure response with clear hierarchy
4. Provide both immediate and downstream effects

**`!mso` or `/mso`**:
1. Mission: State the core objective
2. Situation: Current state analysis
3. Outcome: Desired end state
4. Clear path from S to O via M

**`!voice` or `/voice`**:
1. Optimize for verbal delivery
2. Add verbal markers ("First," "Second," "The key point")
3. Shorten sentences to <20 words
4. Include natural pause points
5. End with clear takeaway

---

## Browser Integration Specifications

### Arc Browser
- **Config Location**: `%APPDATA%\Arc\User Data\Default\ai_context.json` (potential)
- **Integration Method**: Manual import or file placement
- **Commands**: Recognized in Max AI interface
- **Sync**: Via JSON hash validation

### Comet Browser (Perplexity Web)
- **Config Location**: Browser local storage
- **Integration Method**: Settings → AI Preferences → Import
- **Commands**: Processed in chat interface
- **Sync**: Via timestamp comparison

### Perplexity Desktop App
- **Config Location**: Settings → Personalization → Introduce Yourself
- **Integration Method**: Direct text input (completed)
- **Commands**: Active in all chat contexts
- **Voice Tiers**: 30s/60s/120s response optimization

---

## Change Detection Algorithm

```python
def compute_content_hash():
    """Pseudocode for change detection"""
    content_sources = [
        "context/raw/DDAY_VoiceProtocols_Corrected_v2025-11.md",
        "context/merged/merged_context.yaml",
        "browser_sync/arc/arc_ai_context.json",
        "browser_sync/comet/comet_ai_context.json",
        "browser_sync/perplexity/perplexity_voice_context.json"
    ]
    
    combined_content = ""
    for source in content_sources:
        if file_exists(source):
            combined_content += read_file(source)
    
    if combined_content:
        return sha256(combined_content.encode('utf-8'))
    return None

def needs_sync():
    current_hash = compute_content_hash()
    stored_hash = read_file(".last_sync_hash")
    
    if current_hash != stored_hash:
        write_file(".last_sync_hash", current_hash)
        return True
    return False
```

---

## Error Recovery Procedures

### Common Issues and Solutions

1. **Task Scheduler Failure (Code: 1)**
   - Cause: Working directory not set
   - Solution: Use batch wrapper
   - Implementation: sync_wrapper.bat sets directory explicitly

2. **PowerShell Execution Policy**
   - Cause: Restricted execution
   - Solution: `-ExecutionPolicy Bypass` flag
   - Implementation: Added to all script calls

3. **Git Authentication Failure**
   - Cause: Expired or missing PAT
   - Solution: Refresh token in github_setup.ps1
   - Storage: Windows Credential Manager

4. **Character Encoding Issues**
   - Cause: Unicode characters in scripts
   - Solution: Replace with ASCII equivalents
   - Example: ✓→[OK], ⚠→[WARNING], ✗→[ERROR]

---

## Performance Characteristics

### Resource Usage
```yaml
metrics:
  cpu_usage:
    average: <1%
    peak: 5%
    duration: 2-5 seconds
    
  memory:
    working_set: ~20MB
    peak: ~35MB
    
  disk_io:
    reads: ~500KB
    writes: ~200KB
    
  network:
    upload: ~100KB (when changes present)
    download: ~10KB (git status check)
```

### Optimization Strategies
1. **Change Detection**: Prevents unnecessary syncs
2. **Partial Updates**: Only modified files are processed
3. **Batch Operations**: Multiple changes in single commit
4. **Silent Mode**: No UI interruption during scheduled runs
5. **Log Rotation**: Daily logs prevent file growth

---

## Security Considerations

### Data Classification
- **PUBLIC**: README, setup guides
- **PRIVATE**: Voice protocols, personal context
- **SENSITIVE**: API keys, tokens (excluded via .gitignore)

### Access Control
- GitHub repository: PRIVATE
- Local files: Windows user permissions
- Task Scheduler: User-level execution
- Git credentials: Encrypted in Windows Credential Manager

### Excluded from Git
```gitignore
Logs/
*.log
.env
secrets.json
*_local.json
*.key
*.token
```

---

## Maintenance Procedures

### Daily Operations
```powershell
# Morning check
.\scripts\check_status.ps1

# Review overnight activity
Get-Content Logs\browser_sync_$(Get-Date -Format 'yyyyMMdd').log -Tail 50

# Verify GitHub sync
git log --oneline -10
```

### Weekly Maintenance
```powershell
# Clean old logs (keep 30 days)
Get-ChildItem Logs\*.log | Where {$_.LastWriteTime -lt (Get-Date).AddDays(-30)} | Remove-Item

# Verify all components
.\scripts\check_status.ps1 -Verbose

# Test manual sync
.\scripts\browser_sync.ps1 -Force -Verbose
```

### Monthly Tasks
- Review and update context files
- Refresh GitHub PAT if expiring
- Check for script updates
- Archive old logs

---

## Integration Points for LLMs

When another LLM needs to work with this system:

### 1. Reading Current Configuration
```powershell
# Get current context
$context = Get-Content "browser_sync\shared\unified_context.md" -Raw

# Parse voice settings
$voiceConfig = Get-Content "context\raw\DDAY_VoiceProtocols_Corrected_v2025-11.md"

# Check sync status
$status = & ".\scripts\toggle_sync.ps1" -Action Status
```

### 2. Modifying Configuration
```powershell
# Edit source files (not generated ones)
$newContext = "Updated context..."
Set-Content "context\raw\DDAY_VoiceProtocols_Corrected_v2025-11.md" $newContext

# Force sync to propagate changes
& ".\scripts\browser_sync.ps1" -Force
```

### 3. Troubleshooting
```powershell
# Full diagnostic
& ".\scripts\check_status.ps1"

# View recent errors
Get-Content Logs\browser_sync_$(Get-Date -Format 'yyyyMMdd').log | Select-String "ERROR"

# Repair task if needed
& ".\scripts\final_task_fix.ps1"
```

---

## Command Reference for LLMs

### Essential Operations
```powershell
# System health check
.\scripts\check_status.ps1

# Force synchronization
.\scripts\browser_sync.ps1 -Force -Verbose

# Toggle automation
.\scripts\toggle_sync.ps1 -Action [Enable|Disable|Status]

# View configurations
Get-Content browser_sync\shared\unified_context.md
Get-Content browser_sync\arc\arc_ai_context.json | ConvertFrom-Json

# Check GitHub status
git status
git log --oneline -5

# Manual GitHub push
git add .
git commit -m "Manual update: [description]"
git push origin main
```

### Diagnostic Commands
```powershell
# Task Scheduler status
Get-ScheduledTask -TaskName "Browser_Context_Sync" | Get-ScheduledTaskInfo

# Recent sync activity
Get-Content Logs\browser_sync_$(Get-Date -Format 'yyyyMMdd').log -Tail 50

# Hash verification
Get-Content .last_sync_hash

# File modification times
Get-ChildItem browser_sync\* -Recurse | Sort-Object LastWriteTime -Descending | Select -First 10
```

---

## Future Extensibility

### Planned Enhancements
1. **Mobile Sync**: Via Vercel API deployment
2. **Multi-User Support**: Separate branches per user
3. **Webhook Integration**: Real-time sync triggers
4. **Cloud Backup**: S3/Azure blob redundancy
5. **Version Tagging**: Semantic versioning for context changes

### API Endpoints (Planned)
```javascript
// /api/context.js
GET  /api/context         // Retrieve current context
POST /api/context/update  // Trigger sync
GET  /api/status          // System health
GET  /api/logs/:date      // Retrieve logs
```

---

## Conclusion

This system implements a robust, self-healing synchronization solution for maintaining consistent AI assistant configurations across multiple platforms. The architecture prioritizes reliability, efficiency, and maintainability while remaining transparent and debuggable.

For LLMs working with this system:
1. Always modify source files, not generated ones
2. Use provided scripts rather than direct manipulation
3. Check logs for operation context
4. Respect the 5-minute sync cycle
5. Preserve the DDAY voice protocols

---

**Technical Specification Version**: 2.0.0
**Last Updated**: November 14, 2024
**Author**: Claude (Anthropic) with Darrell Day
**Status**: PRODUCTION

---

*End of Technical Documentation*