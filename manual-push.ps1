# MCP Manual Push Script
# Execute this when you want to sync to GitHub

param(
    [string]$CommitMessage = "Manual sync: $(Get-Date -Format 'yyyy-MM-dd HH:mm')"
)

$repoPath = "C:\Users\Darrell\LifeOS\00_System\LLM_Operating_Manual"

Write-Host "=== MCP Manual Sync to GitHub ===" -ForegroundColor Cyan
Write-Host "Repository: $repoPath" -ForegroundColor Gray
Write-Host ""

# Change to repository directory
Set-Location $repoPath

# Check current status
Write-Host "Checking repository status..." -ForegroundColor Yellow
git status --short

# Count changes
$changes = (git status --porcelain | Measure-Object).Count
if ($changes -eq 0) {
    Write-Host "✓ No changes to sync" -ForegroundColor Green
    exit 0
}

Write-Host ""
Write-Host "Found $changes file(s) with changes" -ForegroundColor Cyan

# Add all changes
Write-Host "Adding changes..." -ForegroundColor Yellow
git add .

# Commit with message
Write-Host "Committing with message: $CommitMessage" -ForegroundColor Yellow
git commit -m $CommitMessage

# Push to GitHub
Write-Host "Pushing to GitHub..." -ForegroundColor Yellow
git push origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "✓ Successfully synced to GitHub!" -ForegroundColor Green
    Write-Host "Timestamp: $(Get-Date)" -ForegroundColor Gray
} else {
    Write-Host "⚠️  Push failed. Check your GitHub token and network connection." -ForegroundColor Red
}

Write-Host ""
Write-Host "Press any key to exit..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
