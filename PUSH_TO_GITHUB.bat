@echo off
echo ========================================
echo   Pushing to GitHub Repository
echo ========================================
echo.

cd /d "C:\Users\Darrell\LifeOS\00_System\LLM_Operating_Manual"

powershell -ExecutionPolicy Bypass -File "scripts\github_setup.ps1"

echo.
echo ========================================
echo   Checking System Status
echo ========================================
echo.

powershell -ExecutionPolicy Bypass -File "scripts\system_status.ps1"

echo.
echo Press any key to close...
pause > nul