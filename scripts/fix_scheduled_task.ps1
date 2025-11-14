# Fix Scheduled Task with proper working directory
# Ensures the task runs from the correct location

$TaskName = "Browser_Context_Sync"
$ScriptPath = "C:\Users\Darrell\LifeOS\00_System\LLM_Operating_Manual\scripts\browser_sync.ps1"
$WorkingDir = "C:\Users\Darrell\LifeOS\00_System\LLM_Operating_Manual"

Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "  Fixing Scheduled Task Directory" -ForegroundColor White
Write-Host "========================================`n" -ForegroundColor Cyan

# Remove old task
$existingTask = Get-ScheduledTask -TaskName $TaskName -ErrorAction SilentlyContinue
if ($existingTask) {
    Unregister-ScheduledTask -TaskName $TaskName -Confirm:$false
    Write-Host "✓ Removed old task" -ForegroundColor Yellow
}

# Create action with working directory
$Action = New-ScheduledTaskAction `
    -Execute "PowerShell.exe" `
    -Argument "-ExecutionPolicy Bypass -WindowStyle Hidden -Command `"Set-Location '$WorkingDir'; & '$ScriptPath' -Silent`"" `
    -WorkingDirectory $WorkingDir

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
    -DontStopOnIdleEnd `
    -ExecutionTimeLimit (New-TimeSpan -Minutes 2)

# Register the fixed task
try {
    $task = Register-ScheduledTask `
        -TaskName $TaskName `
        -Action $Action `
        -Trigger @($Trigger1, $Trigger2) `
        -Settings $Settings `
        -Description "Browser AI context sync (5-min) with working directory" `
        -RunLevel Highest
    
    Write-Host "✓ Task recreated with working directory" -ForegroundColor Green
    Write-Host "  Working Dir: $WorkingDir" -ForegroundColor Cyan
    Write-Host "  Script: $ScriptPath" -ForegroundColor Cyan
    
    # Test run immediately
    Write-Host "`nTesting scheduled task..." -ForegroundColor Yellow
    Start-ScheduledTask -TaskName $TaskName
    
    # Wait for completion
    Start-Sleep -Seconds 5
    
    # Check status
    $taskInfo = Get-ScheduledTaskInfo -TaskName $TaskName
    $lastResult = $taskInfo.LastTaskResult
    
    if ($lastResult -eq 0) {
        Write-Host "✓ Test run successful!" -ForegroundColor Green
    } else {
        Write-Host "⚠ Test run completed with code: $lastResult" -ForegroundColor Yellow
        Write-Host "  Check logs for details" -ForegroundColor Gray
    }
    
    Write-Host "`nNext scheduled run: $($taskInfo.NextRunTime)" -ForegroundColor Cyan
    
} catch {
    Write-Host "✗ Failed to create task: $_" -ForegroundColor Red
}

Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "        Task Fix Complete" -ForegroundColor White
Write-Host "========================================" -ForegroundColor Cyan
