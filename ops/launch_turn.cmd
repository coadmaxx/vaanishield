@echo off
set "PATH=C:\vaanishield\.venv\Scripts;%PATH%"
cd /d C:\vaanishield-voip
C:\vaanishield\.venv\Scripts\python.exe C:\vr-turn\turn_server.py --port 3478 --external-ip 10.0.2.2 >> C:\vr-out\voip-build-logs\turn.log 2>&1
