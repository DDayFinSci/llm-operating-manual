# Final fix for scheduled task using batch wrapper
$TaskName = "Browser_Context_Sync"
$BatchPath = "C:\Users\Darrell\LifeOS\00_System\LLM_Operating_Manual\scripts\sync_wrapper.bat"

Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "  Final Scheduled Task Fix" -ForegroundColor White
Write-Host "========================================`n" -ForegroundColor Cyan

# Remove any existing task
try {
    $existing = Get-ScheduledTask -TaskName $TaskName -ErrorAction SilentlyContinue
    if ($existing) {
        Unregister-ScheduledTask -TaskName $TaskName -Confirm:$false
        Write-Host "[OK] Removed old task" -ForegroundColor Yellow
    }
} catch {
    Write-Host "No existing task to remove" -ForegroundColor Gray
}

# Create task with batch wrapper
$Action = New-ScheduledTaskAction -Execute $BatchPath

# Create triggers
$Trigger1 = New-ScheduledTaskTrigger -Once -At (Get-Date).AddMinutes(1) `
    -RepetitionInterval (New-TimeSpan -Minutes 5) `
    -RepetitionDuration (New-TimeSpan -Days 365)

$Trigger2 = New-ScheduledTaskTrigger -AtLogOn -User $env:USERNAME

# Settings
$Settings = New-ScheduledTaskSettingsSet `
    -AllowStartIfOnBatteries `
    -DontStopIfGoingOnBatteries `
    -StartWhenAvailable `
    -DontStopOnIdleEnd

# Register the task
try {
    $task = Register-ScheduledTask `
        -TaskName $TaskName `
        -Action $Action `
        -Trigger @($Trigger1, $Trigger2) `
        -Settings $Settings `
        -Description "Browser sync using batch wrapper (5-min intervals)" `
        -RunLevel Highest
    
    Write-Host "[OK] Task created with batch wrapper" -ForegroundColor Green
    Write-Host "  Batch file: $BatchPath" -ForegroundColor Cyan
    Write-Host "  Frequency: Every 5 minutes" -ForegroundColor Cyan
    
} catch {
    Write-Host "[ERROR] Failed to create task: $_" -ForegroundColor Red
    exit 1
}

# Test the task
Write-Host "`nTesting scheduled task..." -ForegroundColor Yellow
Start-ScheduledTask -TaskName $TaskName

# Wait for completion
Start-Sleep -Seconds 5

# Check result
$taskInfo = Get-ScheduledTaskInfo -TaskName $TaskName
$result = $taskInfo.LastTaskResult

Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "           Test Results" -ForegroundColor White
Write-Host "========================================" -ForegroundColor Cyan

if ($result -eq 0) {
    Write-Host "[OK] Task executed successfully!" -ForegroundColor Green
} else {
    Write-Host "[WARNING] Task returned code: $result" -ForegroundColor Yellow
}

Write-Host "  Last run: $($taskInfo.LastRunTime)" -ForegroundColor Gray
Write-Host "  Next run: $($taskInfo.NextRunTime)" -ForegroundColor Cyan

# Check for recent log entries
$logFile = "C:\Users\Darrell\LifeOS\00_System\LLM_Operating_Manual\Logs\browser_sync_$(Get-Date -Format 'yyyyMMdd').log"
if (Test-Path $logFile) {
    $recentTime = (Get-Date).AddMinutes(-1)
    $recentLogs = Get-Content $logFile -Tail 20 | Where-Object { $_ -match (Get-Date $recentTime -Format 'HH:mm') }
    
    if ($recentLogs) {
        Write-Host "`n[OK] Recent sync activity detected:" -ForegroundColor Green
        $recentLogs[-1]
    }
}

Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "      Task Configuration Complete" -ForegroundColor White
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "`nThe scheduled task is now configured to:" -ForegroundColor White
Write-Host "  • Run every 5 minutes automatically" -ForegroundColor Green
Write-Host "  • Use batch wrapper for reliability" -ForegroundColor Green
Write-Host "  • Sync browser contexts to GitHub" -ForegroundColor Green
Write-Host "  • Run at system startup" -ForegroundColor Green
