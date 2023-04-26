# Set the URL and download location for the MSI file
$url = "https://sageholdingsllc.sharepoint.com/sites/CustomerAccessibleFiles/_layouts/15/download.aspx?SourceUrl=%2Fsites%2FCustomerAccessibleFiles%2FShared%20Documents%2FDevice%20Provisioning%2Fsageinternalworkstationskentoffice7c48a8%2D5%2E3%2E6261%2Dwindows%2Dinstaller%2Emsi"
$msiPath = "$env:windir\Temp\NinjaOneAgent.msi"

# Download the MSI file
Invoke-WebRequest -Uri $url -OutFile $msiPath

# Set the arguments to pass to the MSI installer
$msiArguments = "/quiet /norestart"

# Start the MSI installer
Start-Process -FilePath "msiexec.exe" -ArgumentList "/i `"$msiPath`" $msiArguments" -Wait