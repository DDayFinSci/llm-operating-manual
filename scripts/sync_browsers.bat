@echo off
echo ========================================
echo   Browser Context Synchronization
echo ========================================
echo.

powershell -ExecutionPolicy Bypass -File "%~dp0browser_sync.ps1" -Verbose

echo.
echo Press any key to close...
pause > nul