# Get the uninstall string from the registry
$InstallLocation = (Get-ItemProperty HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Solarwinds*).InstallLocation

# Run the uninstall.exe program as administrator
Start-Process -FilePath "$InstallLocation\uninstall.exe" -ArgumentList "--mode unattended", "--debuglevel 3" -Wait -Verb RunAs

# Wait for 5 seconds to ensure the uninstallation process is complete
Start-Sleep -Seconds 15

# Delete the remnants of the folder
Remove-Item "$InstallLocation" -Recurse
