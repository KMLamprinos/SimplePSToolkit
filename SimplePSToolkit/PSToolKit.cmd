@echo off
cd /d %~dp0
powershell.exe -WindowStyle Minimized -ep Bypass -F "main.ps1"
EXIT