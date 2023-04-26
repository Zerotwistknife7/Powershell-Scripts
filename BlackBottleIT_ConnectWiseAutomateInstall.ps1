# Set the URL and download location for the MSI file
$url = "https://blackbottle.hostedrmm.com/LabTech/Deployment.aspx?InstallerToken=0fa30398a76f439d9c910704f13109c2"
$msiPath = "$env:windir\Temp\Automate_Installer.msi"

# Download the MSI file
Invoke-WebRequest -Uri $url -OutFile $msiPath

# Set the arguments to pass to the MSI installer
$msiArguments = "/quiet /norestart C:\Windows\Temp\Automate_Install.log"

# Start the MSI installer
Start-Process -FilePath "msiexec.exe" -ArgumentList "/i `"$msiPath`" $msiArguments" -Wait