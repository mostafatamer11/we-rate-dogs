@echo off
setlocal

REM Define possible virtual environment names
set "VENV_NAMES=venv env .venv"

REM Function to activate the virtual environment
:activate_venv
set "venv_path=%~1"
if exist "%venv_path%\Scripts\activate.bat" (
    echo Activating virtual environment at %venv_path%
    call "%venv_path%\Scripts\activate.bat"
    exit /b 0
) else (
    echo No activate script found at %venv_path%
    exit /b 1
)

REM Search for the virtual environment in the current directory
for %%v in (%VENV_NAMES%) do (
    if exist "%%v" (
        call :activate_venv "%%v"
        if not errorlevel 1 exit /b 0
    )
)

REM If no virtual environment was found
echo No virtual environment found.
exit /b 1
