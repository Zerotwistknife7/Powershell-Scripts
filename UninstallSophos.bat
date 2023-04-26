@echo off

if exist "C:\Program Files\Sophos\Sophos Endpoint Agent\SophosUninstall.exe" (
    echo Running SophosUninstall.exe...
    "C:\Program Files\Sophos\Sophos Endpoint Agent\SophosUninstall.exe" --quiet
) else if exist "C:\Program Files\Sophos\Sophos Endpoint Agent\uninstallgui.exe" (
    echo Running uninstallgui.exe...
    "C:\Program Files\Sophos\Sophos Endpoint Agent\uninstallgui.exe" --quiet
) else (
    echo Sophos uninstaller not found.
)
