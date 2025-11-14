# Unified Browser Context Sync Manager
# Synchronizes context between Arc, Comet, and Perplexity

param(
    [string]$Action = "sync",  # sync, status, force, verify
    [switch]$Verbose
)

$global:BrowserSyncRoot = "C:\Users\Darrell\LifeOS\00_System\LLM_Operating_Manual\browser_sync"
$global:ContextRoot = "C:\Users\Darrell\LifeOS\00_System\LLM_Operating_Manual\context"
$global:LogFile = "C:\Users\Darrell\LifeOS\00_System\LLM_Operating_Manual\Logs\browser_sync.log"

function Write-SyncLog {
    param([string]$Message, [string]$Level = "INFO")
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logEntry = "[$timestamp] [$Level] $Message"
    Add-Content -Path $global:LogFile -Value $logEntry
    if ($Verbose -or $Level -eq "ERROR") {
        Write-Host $logEntry -ForegroundColor $(if ($Level -eq "ERROR") { "Red" } else { "Gray" })
    }
}

function Get-ContextHash {
    param([string]$FilePath)
    if (Test-Path $FilePath) {
        $content = Get-Content $FilePath -Raw
        $bytes = [System.Text.Encoding]::UTF8.GetBytes($content)
        $hash = [System.Security.Cryptography.SHA256]::Create().ComputeHash($bytes)
        return [System.BitConverter]::ToString($hash).Replace("-", "")
    }
    return $null
}

function Sync-BrowserContexts {
    Write-SyncLog "Starting browser context synchronization"
    
    # Load configurations
    $arcConfig = "$global:BrowserSyncRoot\arc\arc_ai_context.json"
    $cometConfig = "$global:BrowserSyncRoot\comet\comet_ai_config.json"
    
    if (-not (Test-Path $arcConfig)) {
        Write-SyncLog "Arc configuration not found" "ERROR"
        return $false
    }
    
    if (-not (Test-Path $cometConfig)) {
        Write-SyncLog "Comet configuration not found" "ERROR"
        return $false
    }
    
    # Read Arc config (source of truth for shared data)
    $arc = Get-Content $arcConfig | ConvertFrom-Json
    $comet = Get-Content $cometConfig | ConvertFrom-Json
    
    # Sync active projects
    $comet.active_projects = $arc.active_projects
    
    # Sync communication preferences (preserve voice optimizations)
    $comet.communication_preferences.brevity = $arc.communication_preferences.brevity
    $comet.communication_preferences.emphasis = $arc.communication_preferences.emphasis
    $comet.communication_preferences.citations = $arc.communication_preferences.citations
    
    # Update timestamps
    $syncTime = (Get-Date).ToString("yyyy-MM-ddTHH:mm:ss.ffffff")
    $arc.sync_configuration.last_sync = $syncTime
    $comet.timestamp = $syncTime
    
    # Calculate content hash for verification
    $contentHash = Get-ContextHash -FilePath $arcConfig
    $arc.sync_configuration | Add-Member -NotePropertyName "content_hash" -NotePropertyValue $contentHash -Force
    $comet | Add-Member -NotePropertyName "sync_hash" -NotePropertyValue $contentHash -Force
    
    # Write updated configurations
    $arc | ConvertTo-Json -Depth 10 | Set-Content $arcConfig
    $comet | ConvertTo-Json -Depth 10 | Set-Content $cometConfig
    
    Write-SyncLog "Browser contexts synchronized successfully"
    return $true
}

function Sync-PerplexityProfile {
    Write-SyncLog "Updating Perplexity profile"
    
    $arcConfig = Get-Content "$global:BrowserSyncRoot\arc\arc_ai_context.json" | ConvertFrom-Json
    
    # Create Perplexity-optimized profile
    $perplexityProfile = @{
        version = "1.0"
        timestamp = (Get-Date).ToString("yyyy-MM-ddTHH:mm:ss.ffffff")
        voice_mode = @{
            enabled = $true
            style = "DDAY Professional Voice"
            optimization = "concise_analytical"
            response_length = "30-45 seconds"
        }
        context = @{
            name = $arcConfig.profile.name
            role = $arcConfig.profile.role
            projects = $arcConfig.active_projects
            communication = @{
                tone = $arcConfig.profile.style.tone
                structure = "Lead with conclusion, then evidence"
                emphasis = "Analytical rigor over comprehensive coverage"
            }
        }
        prompts = @{
            default = "Apply DDAY Professional Voice. Lead with key insight. 30-45 second responses."
            research = "Provide executive summary first. Cite sources. Focus on decision-relevant information."
            analysis = "Second-order reasoning required. Consider implications and edge cases."
        }
        sync_token = "mcp_unified_2025"
    }
    
    $perplexityPath = "$global:BrowserSyncRoot\perplexity\perplexity_profile.json"
    New-Item -ItemType Directory -Path "$global:BrowserSyncRoot\perplexity" -Force | Out-Null
    $perplexityProfile | ConvertTo-Json -Depth 10 | Set-Content $perplexityPath
    
    Write-SyncLog "Perplexity profile updated"
    return $true
}

function Get-SyncStatus {
    Write-Host "`n=== Browser Context Sync Status ===" -ForegroundColor Cyan
    
    $configs = @{
        "Arc" = "$global:BrowserSyncRoot\arc\arc_ai_context.json"
        "Comet" = "$global:BrowserSyncRoot\comet\comet_ai_config.json"
        "Perplexity" = "$global:BrowserSyncRoot\perplexity\perplexity_profile.json"
    }
    
    foreach ($browser in $configs.Keys) {
        $configPath = $configs[$browser]
        if (Test-Path $configPath) {
            $config = Get-Content $configPath | ConvertFrom-Json
            $lastModified = (Get-Item $configPath).LastWriteTime
            Write-Host "`n$browser Browser:" -ForegroundColor Green
            Write-Host "  Status: Configured" -ForegroundColor White
            Write-Host "  Last Updated: $lastModified" -ForegroundColor Gray
            Write-Host "  Version: $($config.version)" -ForegroundColor Gray
            
            if ($config.sync_configuration.last_sync) {
                Write-Host "  Last Sync: $($config.sync_configuration.last_sync)" -ForegroundColor Gray
            }
        } else {
            Write-Host "`n$browser Browser:" -ForegroundColor Yellow
            Write-Host "  Status: Not Configured" -ForegroundColor Red
        }
    }
    
    # Check sync health
    Write-Host "`n=== Sync Health ===" -ForegroundColor Cyan
    $arcHash = Get-ContextHash -FilePath $configs["Arc"]
    $cometConfig = Get-Content $configs["Comet"] | ConvertFrom-Json
    
    if ($cometConfig.sync_hash -eq $arcHash) {
        Write-Host "✓ Arc and Comet are synchronized" -ForegroundColor Green
    } else {
        Write-Host "⚠ Arc and Comet are out of sync" -ForegroundColor Yellow
    }
}

function Start-AutoSync {
    Write-Host "Starting auto-sync service..." -ForegroundColor Cyan
    Write-SyncLog "Auto-sync service started"
    
    $watcher = New-Object System.IO.FileSystemWatcher
    $watcher.Path = $global:BrowserSyncRoot
    $watcher.Filter = "*.json"
    $watcher.IncludeSubdirectories = $true
    $watcher.EnableRaisingEvents = $true
    
    $action = {
        $path = $Event.SourceEventArgs.FullPath
        $changeType = $Event.SourceEventArgs.ChangeType
        
        # Debounce - wait 2 seconds before syncing
        Start-Sleep -Seconds 2
        
        # Only sync on Arc config changes (source of truth)
        if ($path -like "*arc_ai_context.json") {
            Write-Host "Detected Arc configuration change, syncing..." -ForegroundColor Yellow
            Sync-BrowserContexts
            Sync-PerplexityProfile
        }
    }
    
    Register-ObjectEvent -InputObject $watcher -EventName "Changed" -Action $action
    
    Write-Host "Auto-sync enabled. Press Ctrl+C to stop." -ForegroundColor Green
    
    while ($true) {
        Start-Sleep -Seconds 60
        # Periodic sync every 5 minutes
        if ((Get-Date).Minute % 5 -eq 0) {
            Sync-BrowserContexts
            Sync-PerplexityProfile
        }
    }
}

# Main execution
switch ($Action) {
    "sync" {
        Sync-BrowserContexts
        Sync-PerplexityProfile
        Write-Host "`n✓ Context synchronization complete" -ForegroundColor Green
    }
    "status" {
        Get-SyncStatus
    }
    "force" {
        Write-Host "Forcing full resync..." -ForegroundColor Yellow
        Sync-BrowserContexts
        Sync-PerplexityProfile
        Write-Host "`n✓ Forced sync complete" -ForegroundColor Green
    }
    "auto" {
        Start-AutoSync
    }
    "verify" {
        Get-SyncStatus
        Write-Host "`nRunning verification tests..." -ForegroundColor Cyan
        $testResult = Sync-BrowserContexts
        if ($testResult) {
            Write-Host "✓ Sync verification passed" -ForegroundColor Green
        } else {
            Write-Host "✗ Sync verification failed" -ForegroundColor Red
        }
    }
    default {
        Write-Host "Usage: .\unified_browser_sync.ps1 -Action [sync|status|force|auto|verify] [-Verbose]" -ForegroundColor Yellow
    }
}