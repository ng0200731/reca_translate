@echo off
cd /d "%~dp0"

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
