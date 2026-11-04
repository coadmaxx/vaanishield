@echo off
rem vaanishield VoIP signaling server launcher (Phase 2)
rem Launched detached via WMI (Win32_Process.Create). Do NOT run with Start-Process over SSH.
setlocal
set "PATH=C:\vaanishield\.venv\Scripts;%PATH%"
cd /d C:\vaanishield-voip\voip-signaling
C:\vaanishield\.venv\Scripts\python.exe server.py >> C:\vr-out\voip-build-logs\signaling.log 2>&1
