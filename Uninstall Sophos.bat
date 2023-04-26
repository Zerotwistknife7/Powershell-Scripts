@echo off
SETLOCAL

REM Set the installation path for Sophos Endpoint Agent
set installpath="C:\Program Files (x86)\Sophos\Sophos Endpoint Agent"

REM Stop the Sophos Endpoint Agent service
net stop "Sophos Endpoint Agent"

REM Uninstall the Sophos Endpoint Agent
msiexec /qn /x {A5CC2A09-E9D3-49E5-9D7A-4C9062ADE5F5} REMOVE=ALL

REM Delete the installation folder
RD /S /Q %installpath%

REM Remove Sophos registry keys
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Sophos" /f
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Sophos" /f

REM Restart the computer
shutdown /r /t 0
