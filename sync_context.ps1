# DDAY Context Sync PowerShell Script
# Can be added to Task Scheduler for automatic startup

$ErrorActionPreference = "Stop"

Write-Host "=====================================" -ForegroundColor Cyan
Write-Host "  DDAY Context Sync System v4.0" -ForegroundColor Cyan  
Write-Host "=====================================" -ForegroundColor Cyan
Write-Host ""

# Set working directory
Set-Location "C:\Users\Darrell\LifeOS\00_System\LLM_Operating_Manual"

# Function to check if process is already running
function Test-SyncRunning {
    $processes = Get-Process python -ErrorAction SilentlyContinue
    foreach ($proc in $processes) {
        if ($proc.MainWindowTitle -like "*Context Sync*") {
            return $true
        }
    }
    return $false
}

# Check if already running
if (Test-SyncRunning) {
    Write-Host "Sync monitor is already running" -ForegroundColor Yellow
    exit 0
}

# Ensure git is configured
Write-Host "Checking git configuration..." -ForegroundColor Gray
git config user.name "Darrell Day" 2>$null
git config user.email "your-email@example.com" 2>$null

# Pull latest changes
Write-Host "Pulling latest from GitHub..." -ForegroundColor Gray
git pull 2>$null

# Run initial export
Write-Host "Running initial context export..." -ForegroundColor Gray
python scripts\unified_export.py

if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ Initial export successful" -ForegroundColor Green
    
    # Start monitor in background
    Write-Host "Starting background monitor..." -ForegroundColor Gray
    Start-Process python -ArgumentList "scripts\auto_sync.py" -WindowStyle Hidden
    
    Write-Host "✓ Context sync monitor started" -ForegroundColor Green
    Write-Host ""
    Write-Host "Platforms synchronized:" -ForegroundColor Cyan
    Write-Host "  • Claude (via MCP)" 
    Write-Host "  • ChatGPT (custom instructions)"
    Write-Host "  • Perplexity (profile + voice)" 
    Write-Host "  • Arc Browser (AI config)"
    Write-Host "  • Comet Browser (injection script)"
    
} else {
    Write-Host "✗ Export failed" -ForegroundColor Red
    exit 1
}

# Keep window open for 3 seconds to show status
Start-Sleep -Seconds 3
