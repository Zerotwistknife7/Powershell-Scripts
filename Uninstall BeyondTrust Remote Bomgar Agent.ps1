# Get the uninstall string from the registry
$UninstallString = (Get-ItemProperty HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\BeyondTrust*).UninstallString

# Remove the parameters from the uninstall string
$path = $UninstallString -replace "-pinned win32uninstall \no-spinner", ""
$path = $path -replace "uninstall.exe", ""

# Run the remove.exe program as administrator
Start-Process -FilePath "$path\remove.exe" -Verb RunAs -Wait

# Wait for 5 seconds to ensure the uninstallation process is complete
Start-Sleep -Seconds 15

# Delete the registry key
Remove-Item HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\BeyondTrust* -Recurse

# Delete the remnants of the folder
Remove-Item "$path" -Recurse
