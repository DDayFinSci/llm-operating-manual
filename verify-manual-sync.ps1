# MCP Manual Sync Verification Script
# Ensures sync is manual-only

Write-Host "=== MCP Manual Sync Verification ===" -ForegroundColor Cyan
Write-Host ""

# Check scheduled tasks
Write-Host "Checking scheduled tasks..." -ForegroundColor Yellow
$syncTasks = Get-ScheduledTask | Where-Object {
    $_.TaskName -match 'Browser_Context_Sync|MCP|llm-operating' -and 
    $_.State -ne 'Disabled'
}
if ($syncTasks) {
    Write-Host "WARNING: Found active sync tasks:" -ForegroundColor Red
    $syncTasks | Format-Table TaskName, State
} else {
    Write-Host "OK: No active auto-sync tasks found" -ForegroundColor Green
}

# Check for file watchers
Write-Host ""
Write-Host "Checking for file watchers..." -ForegroundColor Yellow
$watchers = Get-Process | Where-Object {
    $_.ProcessName -match 'fswatch|watchman|chokidar'
}
if ($watchers) {
    Write-Host "WARNING: Found potential file watchers:" -ForegroundColor Red
    $watchers | Format-Table Id, ProcessName
} else {
    Write-Host "OK: No file watchers detected" -ForegroundColor Green
}
# Verify Git hooks are inactive
Write-Host ""
Write-Host "Checking Git hooks..." -ForegroundColor Yellow
$repoPath = "C:\Users\Darrell\LifeOS\00_System\LLM_Operating_Manual"
$hooksPath = Join-Path $repoPath ".git\hooks"
if (Test-Path $hooksPath) {
    $gitHooks = Get-ChildItem -Path $hooksPath | Where-Object { -not $_.Name.EndsWith('.sample') }
    if ($gitHooks) {
        Write-Host "WARNING: Found active Git hooks:" -ForegroundColor Red
        $gitHooks | Format-Table Name
    } else {
        Write-Host "OK: All Git hooks are inactive" -ForegroundColor Green
    }
} else {
    Write-Host "Git hooks directory not found" -ForegroundColor Yellow
}

# Summary
Write-Host ""
Write-Host "=== Manual Sync Instructions ===" -ForegroundColor Cyan
Write-Host "Your MCP sync is configured for MANUAL-ONLY operation."
Write-Host ""
Write-Host "To sync manually, use one of these methods:" -ForegroundColor White
Write-Host "1. Run the manual-push.ps1 script"
Write-Host "2. Use git commands directly:"
Write-Host "   cd $repoPath"
Write-Host "   git add ."
Write-Host "   git commit -m 'Manual sync'"
Write-Host "   git push origin main"
Write-Host ""
Write-Host "Script complete." -ForegroundColor Green