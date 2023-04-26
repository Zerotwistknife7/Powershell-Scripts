$url = 'https://raw.githubusercontent.com/Zerotwistknife7/Powershell-Scripts/main/RemoveSophos.ps1'
$outputPath = "$env:windir\Temp\RemoveSophos.ps1"
$argument = "-Remove YES"

# Download the script and save it to a file in $env:windir\Temp\
Invoke-WebRequest -Uri $url -OutFile $outputPath

# Execute the script with the specified argument
PowerShell.exe -ExecutionPolicy Bypass -File $outputPath $argument
