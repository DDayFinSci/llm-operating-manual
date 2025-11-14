@echo off
cd /d "C:\Users\Darrell\LifeOS\00_System\LLM_Operating_Manual"
powershell.exe -ExecutionPolicy Bypass -File ".\scripts\browser_sync.ps1" -Silent
exit /b %errorlevel%