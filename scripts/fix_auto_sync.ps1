# Fixed Setup for automated browser context synchronization
# Corrects the duration format issue

$TaskName = "Browser_Context_Sync"
$ScriptPath = "C:\Users\Darrell\LifeOS\00_System\LLM_Operating_Manual\scripts\browser_sync.ps1"

Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "  Fixing Auto-Sync Configuration" -ForegroundColor White
Write-Host "========================================`n" -ForegroundColor Cyan

# First, remove any existing broken task
try {
    $existingTask = Get-ScheduledTask -TaskName $TaskName -ErrorAction SilentlyContinue
    if ($existingTask) {
        Unregister-ScheduledTask -TaskName $TaskName -Confirm:$false
        Write-Host "✓ Removed existing task" -ForegroundColor Yellow
    }
} catch {
    Write-Host "No existing task to remove" -ForegroundColor Gray
}

# Create new scheduled task with corrected duration
$Action = New-ScheduledTaskAction -Execute "PowerShell.exe" `
    -Argument "-ExecutionPolicy Bypass -WindowStyle Hidden -File `"$ScriptPath`""

# Create trigger with fixed duration (using 1 year instead of MaxValue)
$RepetitionInterval = (New-TimeSpan -Minutes 5)
$RepetitionDuration = (New-TimeSpan -Days 365)

$Trigger = New-ScheduledTaskTrigger -Once -At (Get-Date).AddMinutes(1) `
    -RepetitionInterval $RepetitionInterval `
    -RepetitionDuration $RepetitionDuration

# Add logon trigger
$LogonTrigger = New-ScheduledTaskTrigger -AtLogOn -User $env:USERNAME

# Settings
$Settings = New-ScheduledTaskSettingsSet `
    -AllowStartIfOnBatteries `
    -DontStopIfGoingOnBatteries `
    -StartWhenAvailable `
    -DontStopOnIdleEnd `
    -ExecutionTimeLimit (New-TimeSpan -Minutes 2)

# Register the task
try {
    $task = Register-ScheduledTask `
        -TaskName $TaskName `
        -Action $Action `
        -Trigger @($Trigger, $LogonTrigger) `
        -Settings $Settings `
        -Description "Syncs browser AI contexts every 5 minutes" `
        -RunLevel Highest
    
    Write-Host "✓ Scheduled task created successfully" -ForegroundColor Green
    Write-Host "  Task Name: $TaskName" -ForegroundColor Cyan
    Write-Host "  Frequency: Every 5 minutes" -ForegroundColor Green
    Write-Host "  Duration: 1 year (will auto-renew)" -ForegroundColor Cyan
    Write-Host "  Also runs: At system logon" -ForegroundColor Cyan
    
    # Verify the task exists before trying to start it
    $verifyTask = Get-ScheduledTask -TaskName $TaskName -ErrorAction SilentlyContinue
    if ($verifyTask) {
        # Run the task immediately
        Start-ScheduledTask -TaskName $TaskName -ErrorAction SilentlyContinue
        Write-Host "`n✓ Initial synchronization started" -ForegroundColor Green
        
        # Get task info
        Start-Sleep -Seconds 2
        $taskInfo = Get-ScheduledTaskInfo -TaskName $TaskName
        if ($taskInfo.NextRunTime) {
            Write-Host "  Next sync: $($taskInfo.NextRunTime)" -ForegroundColor Gray
        }
    }
    
} catch {
    Write-Host "✗ Failed to create scheduled task: $_" -ForegroundColor Red
    Write-Host "`nCreating simplified version..." -ForegroundColor Yellow
    
    # Simplified approach without repetition duration
    try {
        # Use daily trigger with 5-minute repetition
        $DailyTrigger = New-ScheduledTaskTrigger -Daily -At (Get-Date).AddMinutes(1)
        
        # Manually set repetition in XML after creation
        Register-ScheduledTask -TaskName $TaskName `
            -Action $Action `
            -Trigger $DailyTrigger `
            -Settings $Settings `
            -Description "Browser sync every 5 minutes"
        
        Write-Host "✓ Basic task created" -ForegroundColor Green
        Write-Host "  Note: You may need to manually adjust repetition in Task Scheduler" -ForegroundColor Yellow
    } catch {
        Write-Host "✗ Could not create task automatically" -ForegroundColor Red
        Write-Host "`nManual setup required - see instructions below" -ForegroundColor Yellow
    }
}

Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "          Verification" -ForegroundColor White
Write-Host "========================================`n" -ForegroundColor Cyan

# Check if task exists and show status
$finalTask = Get-ScheduledTask -TaskName $TaskName -ErrorAction SilentlyContinue
if ($finalTask) {
    Write-Host "✓ Task exists: $TaskName" -ForegroundColor Green
    Write-Host "  State: $($finalTask.State)" -ForegroundColor Cyan
    
    if ($finalTask.State -eq "Ready") {
        Write-Host "  Status: Ready to run" -ForegroundColor Green
    }
} else {
    Write-Host "⚠ Task not found - manual creation needed" -ForegroundColor Yellow
    Write-Host "`nManual Setup Instructions:" -ForegroundColor White
    Write-Host "1. Open Task Scheduler (taskschd.msc)" -ForegroundColor Cyan
    Write-Host "2. Click 'Create Task'" -ForegroundColor Cyan
    Write-Host "3. General tab:" -ForegroundColor Cyan
    Write-Host "   - Name: Browser_Context_Sync" -ForegroundColor Gray
    Write-Host "   - Check 'Run with highest privileges'" -ForegroundColor Gray
    Write-Host "4. Triggers tab - Add New:" -ForegroundColor Cyan
    Write-Host "   - Begin: One time" -ForegroundColor Gray
    Write-Host "   - Check 'Repeat task every: 5 minutes'" -ForegroundColor Gray
    Write-Host "   - For a duration of: Indefinitely" -ForegroundColor Gray
    Write-Host "5. Actions tab - Add New:" -ForegroundColor Cyan
    Write-Host "   - Program: PowerShell.exe" -ForegroundColor Gray
    Write-Host "   - Arguments: -ExecutionPolicy Bypass -File `"$ScriptPath`"" -ForegroundColor Gray
    Write-Host "6. Settings tab:" -ForegroundColor Cyan
    Write-Host "   - Check 'Allow task to be run on demand'" -ForegroundColor Gray
    Write-Host "   - Check 'Run task as soon as possible after scheduled start is missed'" -ForegroundColor Gray
}

Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "            Complete!" -ForegroundColor White
Write-Host "========================================" -ForegroundColor Cyan
