@echo off
rem vaanishield scoring backend launcher (voip worktree)
rem Launched detached via WMI (Win32_Process.Create). Do NOT run with Start-Process over SSH.
setlocal
set "PATH=C:\vaanishield\.venv\Scripts;C:\Users\singu\AppData\Local\Microsoft\WinGet\Packages\Gyan.FFmpeg_Microsoft.Winget.Source_8wekyb3d8bbwe\ffmpeg-9.0.2-full_build\bin;%PATH%"
set "VR_CM_AASIST_WEIGHTS=C:\vaanishield\data\cm_docs17_R42_Tmc3_deploy.pt"
set "VR_CM_BACKEND=aasist"
cd /d C:\vaanishield-voip\vaanishield-backend
C:\vaanishield\.venv\Scripts\python.exe run.py serve --host 0.0.0.0 --port 8000 >> C:\vr-out\voip-build-logs\backend_serve.log 2>&1
