@echo off
REM Docker entrypoint for fcli Windows images
REM Displays welcome message for interactive sessions, then exec the command

REM Check if running in interactive mode (approximate check)
REM Windows containers don't have direct TTY detection like Linux
REM We check if powershell.exe is being launched with no extra arguments
if "%~1"=="powershell.exe" if "%~2"=="" (
    REM Interactive PowerShell session - display welcome
    type "C:\Program Files\fcli\welcome.txt"
    echo.
)

REM Execute the provided command
%*
