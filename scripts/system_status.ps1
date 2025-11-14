# MCP Cross-Device System - Complete Setup Summary
# Run this to see full system status and next steps

Write-Host "`n" -NoNewline
Write-Host "╔════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║     MCP CROSS-DEVICE CONTEXT SYSTEM - STATUS          ║" -ForegroundColor Cyan
Write-Host "╚════════════════════════════════════════════════════════╝" -ForegroundColor Cyan

# Check components
$components = @(
    @{Name="Arc Configuration"; Path="browser_sync\arc\arc_ai_context.json"; Type="File"},
    @{Name="Comet Configuration"; Path="browser_sync\comet\comet_ai_context.json"; Type="File"},
    @{Name="Perplexity Config"; Path="browser_sync\perplexity\perplexity_voice_context.json"; Type="File"},
    @{Name="Unified Context"; Path="browser_sync\shared\unified_context.md"; Type="File"},
    @{Name="GitHub Repository"; Path=".git"; Type="Dir"},
    @{Name="GitHub Workflows"; Path=".github\workflows"; Type="Dir"},
    @{Name="API Endpoints"; Path="api\context.js"; Type="File"},
    @{Name="Checkpoint System"; Path="..\..\MCP_CrossDevice_Checkpoints"; Type="Dir"}
)

Write-Host "`n▶ COMPONENT STATUS" -ForegroundColor White
Write-Host "─────────────────────────────────────────" -ForegroundColor DarkGray

$baseDir = "C:\Users\Darrell\LifeOS\00_System\LLM_Operating_Manual"
foreach ($comp in $components) {
    $fullPath = Join-Path $baseDir $comp.Path
    $exists = Test-Path $fullPath
    
    if ($exists) {
        Write-Host "  ✓ " -NoNewline -ForegroundColor Green
    } else {
        Write-Host "  ✗ " -NoNewline -ForegroundColor Red
    }
    Write-Host "$($comp.Name)" -NoNewline
    
    if ($exists -and $comp.Type -eq "File") {
        $file = Get-Item $fullPath
        $size = "{0:N0}" -f ($file.Length / 1KB)
        Write-Host " (${size}KB)" -ForegroundColor DarkGray
    } else {
        Write-Host ""
    }
}

# Check tasks
Write-Host "`n▶ SCHEDULED TASKS" -ForegroundColor White
Write-Host "─────────────────────────────────────────" -ForegroundColor DarkGray

$tasks = @("Browser_Context_Sync", "GitHub_LLM_Sync")
foreach ($taskName in $tasks) {
    $task = Get-ScheduledTask -TaskName $taskName -ErrorAction SilentlyContinue
    if ($task) {
        Write-Host "  ✓ $taskName" -NoNewline -ForegroundColor Green
        Write-Host " ($($task.State))" -ForegroundColor DarkGray
    } else {
        Write-Host "  ⚠ $taskName" -NoNewline -ForegroundColor Yellow
        Write-Host " (Not configured)" -ForegroundColor DarkGray
    }
}

# GitHub status
Write-Host "`n▶ GITHUB STATUS" -ForegroundColor White
Write-Host "─────────────────────────────────────────" -ForegroundColor DarkGray

Push-Location $baseDir
$branch = git branch --show-current 2>$null
$remoteUrl = git config --get remote.origin.url 2>$null
$lastCommit = git log -1 --format="%h %s" 2>$null
$uncommitted = (git status --porcelain 2>$null | Measure-Object).Count
Pop-Location

if ($remoteUrl) {
    Write-Host "  Repository: " -NoNewline
    Write-Host $remoteUrl -ForegroundColor Cyan
    Write-Host "  Branch: " -NoNewline
    Write-Host $branch -ForegroundColor Green
    Write-Host "  Last Commit: " -NoNewline
    Write-Host $lastCommit -ForegroundColor Gray
    if ($uncommitted -gt 0) {
        Write-Host "  Uncommitted: " -NoNewline
        Write-Host "$uncommitted changes" -ForegroundColor Yellow
    }
} else {
    Write-Host "  ⚠ No GitHub remote configured" -ForegroundColor Yellow
}

# Quick commands
Write-Host "`n▶ QUICK COMMANDS" -ForegroundColor White
Write-Host "─────────────────────────────────────────" -ForegroundColor DarkGray
Write-Host "  Browser Sync:  " -NoNewline
Write-Host ".\scripts\browser_sync.ps1" -ForegroundColor Yellow
Write-Host "  GitHub Push:   " -NoNewline
Write-Host ".\scripts\github_setup.ps1" -ForegroundColor Yellow
Write-Host "  Verify System: " -NoNewline
Write-Host ".\scripts\verify_integration.ps1" -ForegroundColor Yellow
Write-Host "  Auto-Sync:     " -NoNewline
Write-Host ".\scripts\setup_auto_sync.ps1" -ForegroundColor Yellow

# Next steps
Write-Host "`n▶ NEXT STEPS" -ForegroundColor White
Write-Host "─────────────────────────────────────────" -ForegroundColor DarkGray

$steps = @(
    "1. Push to GitHub: Run .\scripts\github_setup.ps1",
    "2. Import configs into Arc and Comet browsers",
    "3. Test with /sync (Arc) or !sync (Comet)",
    "4. Set up Vercel for mobile access (optional)"
)

foreach ($step in $steps) {
    Write-Host "  $step" -ForegroundColor Cyan
}

# Voice commands reference
Write-Host "`n▶ UNIVERSAL COMMANDS" -ForegroundColor White
Write-Host "─────────────────────────────────────────" -ForegroundColor DarkGray
Write-Host "  /dday or !dday    " -NoNewline -ForegroundColor Yellow
Write-Host "→ DDAY Professional Voice"
Write-Host "  /analyze          " -NoNewline -ForegroundColor Yellow
Write-Host "→ Second-order analysis"
Write-Host "  /mso              " -NoNewline -ForegroundColor Yellow
Write-Host "→ MSO structure"
Write-Host "  /voice            " -NoNewline -ForegroundColor Yellow
Write-Host "→ Voice mode optimization"
Write-Host "  /sync             " -NoNewline -ForegroundColor Yellow
Write-Host "→ Check sync status"

# URLs
Write-Host "`n▶ IMPORTANT URLS" -ForegroundColor White
Write-Host "─────────────────────────────────────────" -ForegroundColor DarkGray
Write-Host "  GitHub: " -NoNewline
Write-Host "https://github.com/DDayFinSci/llm-operating-manual" -ForegroundColor Cyan
Write-Host "  Actions: " -NoNewline
Write-Host "https://github.com/DDayFinSci/llm-operating-manual/actions" -ForegroundColor Cyan

Write-Host "`n" -NoNewline
Write-Host "╔════════════════════════════════════════════════════════╗" -ForegroundColor Green
Write-Host "║        SYSTEM READY FOR BROWSER IMPORT & TESTING      ║" -ForegroundColor Green
Write-Host "╚════════════════════════════════════════════════════════╝" -ForegroundColor Green
Write-Host ""