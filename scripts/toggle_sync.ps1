# Toggle Auto-Sync On/Off
# Use this to enable/disable the 5-minute sync without deleting the task

param(
    [ValidateSet("Enable", "Disable", "Status")]
    [string]$Action = "Status"
)

$TaskName = "Browser_Context_Sync"

Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "     Auto-Sync Control Panel" -ForegroundColor White
Write-Host "========================================`n" -ForegroundColor Cyan

try {
    $task = Get-ScheduledTask -TaskName $TaskName -ErrorAction Stop
    
    switch ($Action) {
        "Enable" {
            Enable-ScheduledTask -TaskName $TaskName
            Write-Host "✓ Auto-sync ENABLED (every 5 minutes)" -ForegroundColor Green
            
            # Get next run time
            $taskInfo = Get-ScheduledTaskInfo -TaskName $TaskName
            Write-Host "  Next sync: $($taskInfo.NextRunTime)" -ForegroundColor Cyan
            
            # Start it immediately
            Start-ScheduledTask -TaskName $TaskName
            Write-Host "  Running sync now..." -ForegroundColor Yellow
        }
        
        "Disable" {
            Disable-ScheduledTask -TaskName $TaskName
            Write-Host "⏸ Auto-sync DISABLED" -ForegroundColor Yellow
            Write-Host "  Manual sync still available:" -ForegroundColor Gray
            Write-Host "  .\scripts\browser_sync.ps1" -ForegroundColor White
        }
        
        "Status" {
            $taskInfo = Get-ScheduledTaskInfo -TaskName $TaskName
            $isEnabled = $task.State -ne "Disabled"
            
            if ($isEnabled) {
                Write-Host "✓ Auto-sync is ENABLED" -ForegroundColor Green
                Write-Host "  Frequency: Every 5 minutes" -ForegroundColor Cyan
                Write-Host "  Last run: $($taskInfo.LastRunTime)" -ForegroundColor Gray
                Write-Host "  Next run: $($taskInfo.NextRunTime)" -ForegroundColor Cyan
                Write-Host "  Last result: $(if($taskInfo.LastTaskResult -eq 0) {'Success'} else {'Failed'})" -ForegroundColor $(if($taskInfo.LastTaskResult -eq 0) {'Green'} else {'Red'})
            } else {
                Write-Host "⏸ Auto-sync is DISABLED" -ForegroundColor Yellow
                Write-Host "  To enable: .\toggle_sync.ps1 -Action Enable" -ForegroundColor Gray
            }
            
            # Show recent sync activity
            $logFile = "C:\Users\Darrell\LifeOS\00_System\LLM_Operating_Manual\Logs\browser_sync_$(Get-Date -Format 'yyyyMMdd').log"
            if (Test-Path $logFile) {
                $recentLogs = Get-Content $logFile -Tail 5
                if ($recentLogs) {
                    Write-Host "`nRecent activity:" -ForegroundColor White
                    $recentLogs | ForEach-Object {
                        if ($_ -match '\[INFO\]') {
                            Write-Host "  $_" -ForegroundColor Gray
                        } elseif ($_ -match '\[WARN\]') {
                            Write-Host "  $_" -ForegroundColor Yellow
                        } elseif ($_ -match '\[ERROR\]') {
                            Write-Host "  $_" -ForegroundColor Red
                        }
                    }
                }
            }
        }
    }
    
    # Show control options
    if ($Action -eq "Status") {
        Write-Host "`n========================================" -ForegroundColor Cyan
        Write-Host "           Control Options" -ForegroundColor White
        Write-Host "========================================" -ForegroundColor Cyan
        Write-Host "  Enable:  .\toggle_sync.ps1 -Action Enable" -ForegroundColor Green
        Write-Host "  Disable: .\toggle_sync.ps1 -Action Disable" -ForegroundColor Yellow
        Write-Host "  Status:  .\toggle_sync.ps1 -Action Status" -ForegroundColor Cyan
    }
    
} catch {
    Write-Host "✗ Task not found: $TaskName" -ForegroundColor Red
    Write-Host "  Run .\setup_auto_sync.ps1 to create it" -ForegroundColor Yellow
}

Write-Host ""