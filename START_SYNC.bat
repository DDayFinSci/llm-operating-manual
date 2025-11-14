@echo off
title DDAY Context Sync Monitor
echo ==========================================
echo    DDAY Context Auto-Sync System v4.0
echo ==========================================
echo.
echo Initializing multi-platform synchronization...
echo Platforms: Claude, ChatGPT, Perplexity, Arc, Comet
echo.

REM Check Python installation
python --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Python not found. Please install Python 3.8+
    pause
    exit /b 1
)

REM Navigate to script directory
cd /d "C:\Users\Darrell\LifeOS\00_System\LLM_Operating_Manual"

REM Run initial sync
echo Running initial context export...
python scripts\unified_export.py
if errorlevel 1 (
    echo ERROR: Initial export failed
    pause
    exit /b 1
)

echo.
echo ✓ Initial sync complete
echo.
echo Starting file monitor...
echo Press Ctrl+C to stop monitoring
echo.

REM Start the auto-sync monitor
python scripts\auto_sync.py

pause
