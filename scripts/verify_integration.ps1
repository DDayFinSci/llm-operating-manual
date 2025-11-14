# Browser Integration Verification Script
# Tests all components of the cross-device MCP ecosystem

Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "  MCP Cross-Device System Verification" -ForegroundColor White
Write-Host "========================================`n" -ForegroundColor Cyan

$results = @()
$baseDir = "C:\Users\Darrell\LifeOS\00_System\LLM_Operating_Manual"

# Test 1: Check browser configurations
Write-Host "Testing browser configurations..." -ForegroundColor Yellow

$browserConfigs = @{
    "Arc" = "$baseDir\browser_sync\arc\arc_ai_context.json"
    "Comet" = "$baseDir\browser_sync\comet\comet_ai_context.json"
    "Perplexity" = "$baseDir\browser_sync\perplexity\perplexity_voice_context.json"
}

foreach ($browser in $browserConfigs.Keys) {
    $path = $browserConfigs[$browser]
    if (Test-Path $path) {
        try {
            $config = Get-Content $path -Raw | ConvertFrom-Json
            $results += [PSCustomObject]@{
                Component = "$browser Config"
                Status = "✓"
                Details = "Version $($config.version)"
            }
        } catch {
            $results += [PSCustomObject]@{
                Component = "$browser Config"
                Status = "✗"
                Details = "Invalid JSON"
            }
        }
    } else {
        $results += [PSCustomObject]@{
            Component = "$browser Config"
            Status = "✗"
            Details = "File not found"
        }
    }
}

# Test 2: Check unified context
Write-Host "Testing unified context..." -ForegroundColor Yellow

$unifiedPath = "$baseDir\browser_sync\shared\unified_context.md"
if (Test-Path $unifiedPath) {
    $content = Get-Content $unifiedPath -Raw
    if ($content -match "Hash: ([a-f0-9]{16})") {
        $hash = $matches[1]
        $results += [PSCustomObject]@{
            Component = "Unified Context"
            Status = "✓"
            Details = "Hash: $hash"
        }
    } else {
        $results += [PSCustomObject]@{
            Component = "Unified Context"
            Status = "⚠"
            Details = "No hash found"
        }
    }
} else {
    $results += [PSCustomObject]@{
        Component = "Unified Context"
        Status = "✗"
        Details = "File not found"
    }
}

# Test 3: Check synchronization script
Write-Host "Testing sync script..." -ForegroundColor Yellow

$syncScript = "$baseDir\scripts\browser_sync.ps1"
if (Test-Path $syncScript) {
    $results += [PSCustomObject]@{
        Component = "Sync Script"
        Status = "✓"
        Details = "Ready to run"
    }
} else {
    $results += [PSCustomObject]@{
        Component = "Sync Script"
        Status = "✗"
        Details = "Not found"
    }
}

# Test 4: Check Task Scheduler
Write-Host "Testing Task Scheduler..." -ForegroundColor Yellow

try {
    $task = Get-ScheduledTask -TaskName "Browser_Context_Sync" -ErrorAction SilentlyContinue
    if ($task) {
        $results += [PSCustomObject]@{
            Component = "Auto Sync Task"
            Status = "✓"
            Details = "Configured - $($task.State)"
        }
    } else {
        $results += [PSCustomObject]@{
            Component = "Auto Sync Task"
            Status = "⚠"
            Details = "Not configured (run setup_auto_sync.ps1)"
        }
    }
} catch {
    $results += [PSCustomObject]@{
        Component = "Auto Sync Task"
        Status = "⚠"
        Details = "Not configured"
    }
}

# Test 5: Check checkpoint system
Write-Host "Testing checkpoint system..." -ForegroundColor Yellow

$checkpointDir = "C:\Users\Darrell\LifeOS\00_System\MCP_CrossDevice_Checkpoints"
if (Test-Path $checkpointDir) {
    $checkpoints = Get-ChildItem -Path $checkpointDir -Directory | Where-Object { $_.Name -like "checkpoint_*" }
    $results += [PSCustomObject]@{
        Component = "Checkpoint System"
        Status = "✓"
        Details = "$($checkpoints.Count) checkpoint(s) found"
    }
} else {
    $results += [PSCustomObject]@{
        Component = "Checkpoint System"
        Status = "✗"
        Details = "Directory not found"
    }
}

# Display results
Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "           Verification Results" -ForegroundColor White
Write-Host "========================================`n" -ForegroundColor Cyan

foreach ($result in $results) {
    $color = switch ($result.Status) {
        "✓" { "Green" }
        "⚠" { "Yellow" }
        "✗" { "Red" }
    }
    Write-Host "$($result.Status) $($result.Component): " -NoNewline -ForegroundColor $color
    Write-Host $result.Details
}

# Summary
$passed = ($results | Where-Object { $_.Status -eq "✓" }).Count
$warnings = ($results | Where-Object { $_.Status -eq "⚠" }).Count
$failed = ($results | Where-Object { $_.Status -eq "✗" }).Count

Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "Summary: " -NoNewline
Write-Host "$passed passed" -ForegroundColor Green -NoNewline
if ($warnings -gt 0) {
    Write-Host ", $warnings warnings" -ForegroundColor Yellow -NoNewline
}
if ($failed -gt 0) {
    Write-Host ", $failed failed" -ForegroundColor Red -NoNewline
}
Write-Host ""
Write-Host "========================================`n" -ForegroundColor Cyan

# Next steps
if ($warnings -gt 0 -or $failed -gt 0) {
    Write-Host "Next Steps:" -ForegroundColor White
    if ($results | Where-Object { $_.Component -eq "Auto Sync Task" -and $_.Status -ne "✓" }) {
        Write-Host "  1. Run: .\scripts\setup_auto_sync.ps1" -ForegroundColor Yellow
    }
    Write-Host "  2. Import configs into Arc and Comet browsers" -ForegroundColor Yellow
    Write-Host "  3. Test with: !sync in any browser" -ForegroundColor Yellow
}