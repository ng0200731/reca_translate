@echo off
cd /d "%~dp0"

REM Start LibreTranslate container
echo Starting LibreTranslate (Docker)...
docker compose up -d 2>nul
if errorlevel 1 (
    echo WARNING: Docker not running or LibreTranslate failed to start.
    echo          Translations will still work with other backends.
)

set PYTHON=%LOCALAPPDATA%\Programs\Python\Python311\python.exe
if not exist "%PYTHON%" set PYTHON=python

if not exist ".tmp\glossary.db" (
    echo Initializing glossary database...
    "%PYTHON%" tools\glossary_manager.py init
)

echo Starting Garment Translation App on http://127.0.0.1:5000
echo Press Ctrl+C to stop.
start http://127.0.0.1:5000
"%PYTHON%" app.py
