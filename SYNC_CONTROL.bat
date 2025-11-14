@echo off
echo ========================================
echo     5-Minute Auto-Sync Control
echo ========================================
echo.
echo Choose an option:
echo   1. Enable 5-minute sync
echo   2. Disable auto-sync
echo   3. Check sync status
echo   4. Run sync now
echo   5. View recent logs
echo   6. Exit
echo.
set /p choice="Enter choice (1-6): "

cd /d "C:\Users\Darrell\LifeOS\00_System\LLM_Operating_Manual\scripts"

if "%choice%"=="1" (
    echo.
    echo Enabling 5-minute auto-sync...
    powershell -ExecutionPolicy Bypass -File "toggle_sync.ps1" -Action Enable
) else if "%choice%"=="2" (
    echo.
    echo Disabling auto-sync...
    powershell -ExecutionPolicy Bypass -File "toggle_sync.ps1" -Action Disable
) else if "%choice%"=="3" (
    echo.
    powershell -ExecutionPolicy Bypass -File "toggle_sync.ps1" -Action Status
) else if "%choice%"=="4" (
    echo.
    echo Running sync now...
    powershell -ExecutionPolicy Bypass -File "browser_sync.ps1" -Force -Verbose
) else if "%choice%"=="5" (
    echo.
    echo Recent sync activity:
    echo ----------------------------------------
    powershell -Command "Get-Content '../Logs/browser_sync_$(Get-Date -Format yyyyMMdd).log' -Tail 20"
) else if "%choice%"=="6" (
    exit
) else (
    echo Invalid choice. Please run again.
)

echo.
echo Press any key to close...
pause > nul