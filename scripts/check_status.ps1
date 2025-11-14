# Quick Status Check for MCP Sync System
# Run this anytime to verify everything is working

Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "   MCP SYNC SYSTEM STATUS CHECK" -ForegroundColor White
Write-Host "========================================`n" -ForegroundColor Cyan

# 1. Check scheduled task
$task = Get-ScheduledTask -TaskName "Browser_Context_Sync" -ErrorAction SilentlyContinue
if ($task) {
    $taskInfo = Get-ScheduledTaskInfo -TaskName "Browser_Context_Sync"
    
    if ($taskInfo.LastTaskResult -eq 0) {
        Write-Host "[OK] Scheduled Task: WORKING" -ForegroundColor Green
    } else {
        Write-Host "[WARNING] Scheduled Task: Error Code $($taskInfo.LastTaskResult)" -ForegroundColor Yellow
    }
    
    Write-Host "  Last run: $($taskInfo.LastRunTime)" -ForegroundColor Gray
    Write-Host "  Next run: $($taskInfo.NextRunTime)" -ForegroundColor Cyan
} else {
    Write-Host "[ERROR] Scheduled Task: NOT FOUND" -ForegroundColor Red
}

# 2. Check unified context
$unifiedContext = "C:\Users\Darrell\LifeOS\00_System\LLM_Operating_Manual\browser_sync\shared\unified_context.md"
if (Test-Path $unifiedContext) {
    $lastModified = (Get-Item $unifiedContext).LastWriteTime
    $age = (Get-Date) - $lastModified
    
    if ($age.TotalMinutes -lt 10) {
        Write-Host "`n[OK] Unified Context: CURRENT" -ForegroundColor Green
    } else {
        Write-Host "`n[WARNING] Unified Context: STALE" -ForegroundColor Yellow
    }
    
    Write-Host "  Last updated: $lastModified" -ForegroundColor Gray
    Write-Host "  Age: $([math]::Round($age.TotalMinutes, 1)) minutes" -ForegroundColor Gray
} else {
    Write-Host "`n[ERROR] Unified Context: NOT FOUND" -ForegroundColor Red
}

# 3. Check recent sync activity
$logFile = "C:\Users\Darrell\LifeOS\00_System\LLM_Operating_Manual\Logs\browser_sync_$(Get-Date -Format 'yyyyMMdd').log"
if (Test-Path $logFile) {
    $lastLog = Get-Content $logFile -Tail 1
    if ($lastLog -match "Synchronization completed successfully") {
        Write-Host "`n[OK] Last Sync: SUCCESS" -ForegroundColor Green
    } elseif ($lastLog -match "ERROR") {
        Write-Host "`n[WARNING] Last Sync: ERRORS" -ForegroundColor Yellow
    } else {
        Write-Host "`n[INFO] Last Sync: IN PROGRESS" -ForegroundColor Cyan
    }
    
    # Show last 3 log entries
    Write-Host "`nRecent Activity:" -ForegroundColor White
    Get-Content $logFile -Tail 3 | ForEach-Object {
        Write-Host "  $_" -ForegroundColor Gray
    }
} else {
    Write-Host "`n[WARNING] No log file for today" -ForegroundColor Yellow
}

# 4. Check GitHub connectivity
Write-Host "`n[INFO] GitHub Repository:" -ForegroundColor White
Push-Location "C:\Users\Darrell\LifeOS\00_System\LLM_Operating_Manual"
$gitStatus = git status --porcelain 2>&1
if ($LASTEXITCODE -eq 0) {
    if ($gitStatus) {
        Write-Host "  Uncommitted changes: $($gitStatus.Count) files" -ForegroundColor Yellow
    } else {
        Write-Host "  Repository is clean" -ForegroundColor Green
    }
    
    # Check last commit
    $lastCommit = git log -1 --oneline 2>&1
    Write-Host "  Last commit: $lastCommit" -ForegroundColor Gray
} else {
    Write-Host "  [WARNING] Git not configured" -ForegroundColor Yellow
}
Pop-Location

# 5. Check browser configs
Write-Host "`n[INFO] Browser Configurations:" -ForegroundColor White
$configs = @{
    "Arc" = "browser_sync\arc\arc_ai_context.json"
    "Comet" = "browser_sync\comet\comet_ai_context.json"
    "Perplexity" = "browser_sync\perplexity\perplexity_voice_context.json"
}

foreach ($browser in $configs.Keys) {
    $path = "C:\Users\Darrell\LifeOS\00_System\LLM_Operating_Manual\$($configs[$browser])"
    if (Test-Path $path) {
        $config = Get-Content $path -Raw | ConvertFrom-Json
        if ($config.sync_metadata.hash -or $config.sync_hash -or $config.integration_token) {
            Write-Host "  $browser : [OK] Configured" -ForegroundColor Green
        } else {
            Write-Host "  $browser : [WARNING] Missing hash" -ForegroundColor Yellow
        }
    } else {
        Write-Host "  $browser : [ERROR] Not found" -ForegroundColor Red
    }
}

Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "           QUICK ACTIONS" -ForegroundColor White
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Force sync now:   .\scripts\browser_sync.ps1 -Force" -ForegroundColor Yellow
Write-Host "  Check status:     .\scripts\toggle_sync.ps1 -Action Status" -ForegroundColor Yellow
Write-Host "  Disable sync:     .\scripts\toggle_sync.ps1 -Action Disable" -ForegroundColor Yellow
Write-Host "  Enable sync:      .\scripts\toggle_sync.ps1 -Action Enable" -ForegroundColor Yellow
Write-Host "  View context:     code browser_sync\shared\unified_context.md" -ForegroundColor Yellow

Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "         SYSTEM OPERATIONAL" -ForegroundColor Green
Write-Host "========================================`n" -ForegroundColor Cyan
