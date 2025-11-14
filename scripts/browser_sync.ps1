# Cross-Browser Context Synchronization Script
# Optimized for 5-minute intervals with change detection
# Enhanced version with proper context file discovery

param(
    [switch]$Force,
    [switch]$Verbose,
    [switch]$Silent  # New parameter for scheduled runs
)

$ErrorActionPreference = "Stop"

# Configuration
$BaseDir = "C:\Users\Darrell\LifeOS\00_System\LLM_Operating_Manual"
$BrowserSyncDir = "$BaseDir\browser_sync"
$ContextDir = "$BaseDir\context"
$LogFile = "$BaseDir\Logs\browser_sync_$(Get-Date -Format 'yyyyMMdd').log"
$HashFile = "$BaseDir\.last_sync_hash"

# Ensure log directory exists
$LogDir = Split-Path $LogFile -Parent
if (-not (Test-Path $LogDir)) {
    New-Item -ItemType Directory -Path $LogDir -Force | Out-Null
}

function Write-Log {
    param($Message, $Level = "INFO")
    $Timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $LogMessage = "[$Timestamp] [$Level] $Message"
    Add-Content -Path $LogFile -Value $LogMessage
    
    # Only show output if not in silent mode
    if (-not $Silent -and $Verbose) {
        Write-Host $LogMessage -ForegroundColor $(if($Level -eq "ERROR") {"Red"} elseif($Level -eq "WARN") {"Yellow"} else {"Green"})
    }
}

function Get-FileHash {
    param($Path)
    if (Test-Path $Path) {
        $content = Get-Content $Path -Raw
        $bytes = [System.Text.Encoding]::UTF8.GetBytes($content)
        $hash = [System.Security.Cryptography.SHA256]::Create()
        $hashBytes = $hash.ComputeHash($bytes)
        return [System.BitConverter]::ToString($hashBytes).Replace("-", "").ToLower().Substring(0, 16)
    }
    return $null
}

function Get-ContentHash {
    # Generate hash of all relevant content files
    $contentPaths = @(
        "$ContextDir\raw\DDAY_VoiceProtocols_Corrected_v2025-11.md",
        "$ContextDir\merged\merged_context.yaml",
        "$BrowserSyncDir\arc\arc_ai_context.json",
        "$BrowserSyncDir\comet\comet_ai_context.json",
        "$BrowserSyncDir\perplexity\perplexity_voice_context.json"
    )
    
    $combinedContent = ""
    foreach ($path in $contentPaths) {
        if (Test-Path $path) {
            $combinedContent += Get-Content $path -Raw
        }
    }
    
    if ($combinedContent) {
        $bytes = [System.Text.Encoding]::UTF8.GetBytes($combinedContent)
        $hash = [System.Security.Cryptography.SHA256]::Create()
        $hashBytes = $hash.ComputeHash($bytes)
        return [System.BitConverter]::ToString($hashBytes).Replace("-", "").ToLower()
    }
    return $null
}

function Test-ChangesNeeded {
    # Check if any files have changed since last sync
    $currentHash = Get-ContentHash
    $lastHash = if (Test-Path $HashFile) { Get-Content $HashFile -Raw } else { "" }
    
    if ($currentHash -eq $lastHash -and -not $Force) {
        Write-Log "No changes detected since last sync (5-min check)"
        return $false
    }
    
    # Save current hash for next comparison
    $currentHash | Set-Content $HashFile -NoNewline
    return $true
}

function Update-UnifiedContext {
    Write-Log "Updating unified context..."
    
    # Primary context sources
    $contextSources = @()
    
    # Check for DDAY Voice Protocols
    $voiceProtocol = "$ContextDir\raw\DDAY_VoiceProtocols_Corrected_v2025-11.md"
    if (Test-Path $voiceProtocol) {
        $contextSources += @{
            name = "DDAY Professional Voice"
            path = $voiceProtocol
            priority = 1
        }
    }
    
    # Check for merged context
    $mergedContext = "$ContextDir\merged\merged_context.yaml"
    if (Test-Path $mergedContext) {
        $contextSources += @{
            name = "Merged Context"
            path = $mergedContext
            priority = 2
        }
    }
    
    # Build unified content
    $unifiedContent = @"
# Unified Browser Context
# Version: 2.0 | Updated: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')
# This file is the single source of truth for all browser AI integrations
# Auto-sync: Every 5 minutes

## Core Identity

**Name:** Darrell Day  
**Role:** MSIF Teaching Assistant  
**Voice:** DDAY Professional Voice v3.3

"@
    
    # Add each context source
    foreach ($source in ($contextSources | Sort-Object priority)) {
        if (Test-Path $source.path) {
            Write-Log "Including context: $($source.name)"
            $content = Get-Content $source.path -Raw
            
            # Extract key sections for voice protocols
            if ($source.name -eq "DDAY Professional Voice") {
                $unifiedContent += @"

## Professional Communication Protocol

### Voice v3 - Formal Professional
- **Use for:** Formal memos, evaluative reports, academic summaries
- **Cadence:** 18-25 word sentences, declarative endings
- **Diction:** clarify, outline, evaluate, confirm, maintain
- **Formatting:** Bold only deadlines and deliverables

### Voice v1 - Casual Professional  
- **Use for:** Teams/Slack, quick emails, empathetic updates
- **Cadence:** Natural chat rhythm, softer transitions
- **Diction:** sounds good, quick check, noted, appreciate it

"@
            } else {
                # Include other contexts directly (limited for size)
                $unifiedContent += "`n## Source: $($source.name)`n`n"
                $unifiedContent += $content.Substring(0, [Math]::Min($content.Length, 5000))
            }
        }
    }
    
    # Add voice mode optimization section
    $unifiedContent += @"

## Voice Mode Optimization

### Response Tiers
- **Quick (30s):** Single insight + action
- **Standard (60s):** Context + 2-3 points + conclusion  
- **Detailed (120s):** Framework + analysis + implications

### Verbal Markers
- **Transitions:** "First," "Second," "The key point"
- **Emphasis:** "Note that," "Critical here is"
- **Conclusions:** "Bottom line," "Net result"

## Universal Commands
- `/dday` or `!dday` - Apply DDAY Professional Voice
- `/analyze` or `!analyze` - Second-order analysis
- `/mso` or `!mso` - MSO structure
- `/voice` or `!voice` - Voice mode optimization
- `/sync` or `!sync` - Check synchronization status

"@
    
    # Calculate and add hash
    $tempFile = [System.IO.Path]::GetTempFileName()
    Set-Content -Path $tempFile -Value $unifiedContent
    $hash = Get-FileHash -Path $tempFile
    Remove-Item $tempFile
    
    $unifiedContent += @"

## Sync Metadata
- **Hash:** $hash
- **Updated:** $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')
- **Source:** $BaseDir
- **Next Sync:** $(Get-Date (Get-Date).AddMinutes(5) -Format 'yyyy-MM-dd HH:mm')
- **Sync Frequency:** Every 5 minutes
"@
    
    # Save unified context
    Set-Content -Path "$BrowserSyncDir\shared\unified_context.md" -Value $unifiedContent -Encoding UTF8
    Write-Log "Unified context updated with hash: $hash"
    
    return $hash
}

function Update-BrowserConfig {
    param(
        [string]$Browser,
        [string]$ConfigPath,
        [string]$Hash
    )
    
    Write-Log "Updating $Browser configuration..."
    
    if (Test-Path $ConfigPath) {
        $config = Get-Content $ConfigPath -Raw | ConvertFrom-Json
        
        # Update timestamp and hash
        $config.timestamp = (Get-Date).ToString("yyyy-MM-ddTHH:mm:ss.ffffff")
        
        if ($config.PSObject.Properties.Name -contains "sync_metadata") {
            $config.sync_metadata.last_sync = $config.timestamp
            $config.sync_metadata.hash = $Hash
        } elseif ($config.PSObject.Properties.Name -contains "sync_hash") {
            $config.sync_hash = $Hash
            $config.last_update = $config.timestamp
        } elseif ($config.PSObject.Properties.Name -contains "integration_token") {
            $config.integration_token = $Hash.Substring(0, 8)
        }
        
        # Save updated config
        $config | ConvertTo-Json -Depth 10 | Set-Content -Path $ConfigPath -Encoding UTF8
        Write-Log "$Browser configuration updated"
    } else {
        Write-Log "Config file not found: $ConfigPath" -Level "WARN"
    }
}

function Sync-ToGitHub {
    Write-Log "Checking for GitHub changes..."
    
    Push-Location $BaseDir
    try {
        # Check if git repo exists
        if (Test-Path ".git") {
            # Stage changes
            git add browser_sync/* 2>&1 | Out-Null
            git add context/* 2>&1 | Out-Null
            git add scripts/* 2>&1 | Out-Null
            
            # Check for actual changes
            $changes = git status --porcelain
            if ($changes) {
                # Create descriptive commit message
                $changeCount = ($changes | Measure-Object).Count
                $commitMessage = "Auto-sync: $changeCount file(s) updated [5-min interval]"
                
                git commit -m $commitMessage 2>&1 | Out-Null
                
                # Check if remote is configured
                $remotes = git remote 2>&1
                if ($remotes) {
                    git push origin main 2>&1 | Out-Null
                    Write-Log "GitHub sync completed ($changeCount changes)"
                } else {
                    Write-Log "No git remote configured - local commit only" -Level "WARN"
                }
            } else {
                Write-Log "No changes to sync to GitHub"
            }
        } else {
            Write-Log "Git repository not initialized" -Level "WARN"
        }
    } catch {
        Write-Log "GitHub sync failed: $_" -Level "ERROR"
    } finally {
        Pop-Location
    }
}

function Test-BrowserIntegration {
    param([string]$Browser)
    
    $configPaths = @{
        "Arc" = "$BrowserSyncDir\arc\arc_ai_context.json"
        "Comet" = "$BrowserSyncDir\comet\comet_ai_context.json"
        "Perplexity" = "$BrowserSyncDir\perplexity\perplexity_voice_context.json"
    }
    
    if ($configPaths.ContainsKey($Browser)) {
        $path = $configPaths[$Browser]
        if (Test-Path $path) {
            try {
                $config = Get-Content $path -Raw | ConvertFrom-Json
                return $true
            } catch {
                Write-Log "$Browser config invalid: $_" -Level "ERROR"
                return $false
            }
        }
    }
    return $false
}

# Main synchronization process
try {
    # Check if changes are needed (skip if Force flag is set)
    if (-not $Force -and -not (Test-ChangesNeeded)) {
        if (-not $Silent) {
            Write-Host "No changes detected - skipping sync (5-min interval)" -ForegroundColor Gray
        }
        exit 0
    }
    
    Write-Log "Starting browser context synchronization (5-min sync)"
    
    # Step 1: Update unified context
    $contextHash = Update-UnifiedContext
    
    # Step 2: Update each browser configuration
    $browsers = @{
        "Arc" = "$BrowserSyncDir\arc\arc_ai_context.json"
        "Comet" = "$BrowserSyncDir\comet\comet_ai_context.json"
        "Perplexity" = "$BrowserSyncDir\perplexity\perplexity_voice_context.json"
    }
    
    foreach ($browser in $browsers.Keys) {
        Update-BrowserConfig -Browser $browser -ConfigPath $browsers[$browser] -Hash $contextHash
    }
    
    # Step 3: Test integrations
    $allTestsPassed = $true
    foreach ($browser in $browsers.Keys) {
        if (-not (Test-BrowserIntegration -Browser $browser)) {
            $allTestsPassed = $false
        }
    }
    
    # Step 4: Sync to GitHub if all tests pass
    if ($allTestsPassed) {
        Sync-ToGitHub
        Write-Log "Synchronization completed successfully"
        
        if (-not $Silent) {
            Write-Host "[OK] Sync complete (5-min interval)" -ForegroundColor Green
            Write-Host "  Hash: $contextHash" -ForegroundColor Cyan
            Write-Host "  Next: $(Get-Date (Get-Date).AddMinutes(5) -Format 'HH:mm:ss')" -ForegroundColor Gray
        }
    } else {
        Write-Log "Synchronization completed with errors" -Level "WARN"
        if (-not $Silent) {
            Write-Host "[WARNING] Sync completed with warnings" -ForegroundColor Yellow
        }
    }
    
} catch {
    Write-Log "Fatal error during synchronization: $_" -Level "ERROR"
    if (-not $Silent) {
        Write-Host "[ERROR] Synchronization failed: $_" -ForegroundColor Red
    }
    exit 1
}