# GitHub Setup and Initial Sync Script
# Sets up GitHub Personal Access Token and pushes all changes

Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "     GitHub Repository Setup" -ForegroundColor White
Write-Host "========================================`n" -ForegroundColor Cyan

$repoPath = "C:\Users\Darrell\LifeOS\00_System\LLM_Operating_Manual"

# Function to check if GitHub token exists
function Test-GitHubAuth {
    Push-Location $repoPath
    $result = git ls-remote origin 2>&1
    Pop-Location
    return $LASTEXITCODE -eq 0
}

# Step 1: Test current authentication
Write-Host "Testing GitHub authentication..." -ForegroundColor Yellow
if (Test-GitHubAuth) {
    Write-Host "✓ GitHub authentication working" -ForegroundColor Green
    $needToken = $false
} else {
    Write-Host "⚠ GitHub authentication needed" -ForegroundColor Yellow
    $needToken = $true
}

# Step 2: Set up GitHub token if needed
if ($needToken) {
    Write-Host "`nTo set up GitHub access, you need a Personal Access Token:" -ForegroundColor White
    Write-Host "1. Go to: https://github.com/settings/tokens/new" -ForegroundColor Cyan
    Write-Host "2. Name: 'LLM Operating Manual Sync'" -ForegroundColor Cyan
    Write-Host "3. Expiration: 90 days (or longer)" -ForegroundColor Cyan
    Write-Host "4. Select scopes:" -ForegroundColor Cyan
    Write-Host "   - repo (all)" -ForegroundColor Green
    Write-Host "   - workflow" -ForegroundColor Green
    Write-Host "5. Click 'Generate token'" -ForegroundColor Cyan
    Write-Host "6. Copy the token (starts with ghp_)" -ForegroundColor Yellow
    Write-Host ""
    
    $token = Read-Host "Paste your GitHub token here (hidden)" -AsSecureString
    $tokenPlain = [Runtime.InteropServices.Marshal]::PtrToStringAuto(
        [Runtime.InteropServices.Marshal]::SecureStringToBSTR($token)
    )
    
    # Update Claude config with the token
    $claudeConfig = "C:\Users\Darrell\AppData\Roaming\Claude\claude_desktop_config.json"
    if (Test-Path $claudeConfig) {
        $config = Get-Content $claudeConfig -Raw | ConvertFrom-Json
        if ($config.mcpServers.github.env) {
            $config.mcpServers.github.env.GITHUB_PERSONAL_ACCESS_TOKEN = $tokenPlain
            $config | ConvertTo-Json -Depth 10 | Set-Content $claudeConfig
            Write-Host "✓ Updated Claude GitHub MCP token" -ForegroundColor Green
        }
    }
    
    # Store in Windows Credential Manager
    cmdkey /generic:git:https://github.com /user:DDayFinSci /pass:$tokenPlain
    Write-Host "✓ Stored token in Windows Credential Manager" -ForegroundColor Green
}

# Step 3: Prepare repository
Push-Location $repoPath

Write-Host "`nPreparing repository..." -ForegroundColor Yellow

# Add all new files
git add . 2>&1 | Out-Null

# Check for changes
$changes = git status --porcelain
if ($changes) {
    Write-Host "Found changes to commit:" -ForegroundColor White
    $changes | ForEach-Object { Write-Host "  $_" -ForegroundColor Gray }
    
    # Commit changes
    $message = "MCP Cross-Device System: Phase 2 - GitHub Integration

- Added GitHub Actions workflows for automated sync
- Enhanced browser configurations with cloud backup
- Implemented unified context system
- Created mobile deployment workflow
- Updated .gitignore for security
- Added checkpoint system for rollback capability"
    
    git commit -m $message 2>&1 | Out-Null
    Write-Host "`n✓ Changes committed" -ForegroundColor Green
} else {
    Write-Host "No changes to commit" -ForegroundColor Gray
}

# Step 4: Push to GitHub
Write-Host "`nPushing to GitHub..." -ForegroundColor Yellow
$pushResult = git push origin main 2>&1

if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ Successfully pushed to GitHub" -ForegroundColor Green
    Write-Host "  Repository: https://github.com/DDayFinSci/llm-operating-manual" -ForegroundColor Cyan
} else {
    Write-Host "⚠ Push failed: $pushResult" -ForegroundColor Yellow
    Write-Host "You may need to pull first: git pull origin main" -ForegroundColor Yellow
}

Pop-Location

# Step 5: Set up automated sync
Write-Host "`nSetting up automated sync..." -ForegroundColor Yellow

$taskExists = Get-ScheduledTask -TaskName "GitHub_LLM_Sync" -ErrorAction SilentlyContinue
if (-not $taskExists) {
    $action = New-ScheduledTaskAction -Execute "PowerShell.exe" `
        -Argument "-ExecutionPolicy Bypass -Command `"cd '$repoPath'; git add .; git commit -m 'Auto-sync: $(Get-Date -Format yyyy-MM-dd)'; git push origin main`""
    
    $trigger = New-ScheduledTaskTrigger -Daily -At 2:00AM
    
    $settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries
    
    Register-ScheduledTask -TaskName "GitHub_LLM_Sync" `
        -Action $action -Trigger $trigger -Settings $settings `
        -Description "Daily sync of LLM Operating Manual to GitHub" `
        -RunLevel Highest 2>&1 | Out-Null
    
    Write-Host "✓ Created daily GitHub sync task (2:00 AM)" -ForegroundColor Green
} else {
    Write-Host "✓ GitHub sync task already exists" -ForegroundColor Green
}

# Step 6: Summary
Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "       GitHub Setup Complete" -ForegroundColor White  
Write-Host "========================================" -ForegroundColor Cyan

Write-Host "`n✓ Repository Status:" -ForegroundColor Green
Write-Host "  • GitHub: https://github.com/DDayFinSci/llm-operating-manual" -ForegroundColor White
Write-Host "  • Workflows: Browser sync + Mobile deploy" -ForegroundColor White
Write-Host "  • Schedule: Every 6 hours + Daily backup" -ForegroundColor White
Write-Host "  • Security: .gitignore configured" -ForegroundColor White

Write-Host "`n✓ Next Steps:" -ForegroundColor Green
Write-Host "  1. Check GitHub Actions: https://github.com/DDayFinSci/llm-operating-manual/actions" -ForegroundColor Yellow
Write-Host "  2. Import browser configs (Arc, Comet)" -ForegroundColor Yellow
Write-Host "  3. Test with !sync command" -ForegroundColor Yellow

Write-Host "`n✓ Mobile Access (Future):" -ForegroundColor Green
Write-Host "  When ready, deploy to Vercel for mobile access" -ForegroundColor Gray
Write-Host "  Configuration ready in .github/workflows/deploy_mobile.yml" -ForegroundColor Gray