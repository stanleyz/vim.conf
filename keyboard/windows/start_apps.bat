@echo off
REM Start necessary applications

echo Starting applications...

REM Start AutoHotkey
echo Starting AutoHotkey...
start "" "C:\Program Files\AutoHotkey\v2\AutoHotkey64.exe" "C:\ProgramData\SZApps\autohotkey.nowin.lctrl.ahk"

REM Start AltAppSwitcher
echo Starting AltAppSwitcher...
start "" "C:\ProgramData\SZApps\AltAppSwitcher\AltAppSwitcher.exe"

REM Start ThreeFingersDrag
echo Starting ThreeFingersDrag...
start "" "C:\ProgramData\SZApps\ThreeFingersDrag.lnk"

echo All applications started successfully!