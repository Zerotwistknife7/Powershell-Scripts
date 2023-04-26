$url = 'https://raw.githubusercontent.com/Zerotwistknife7/Powershell-Scripts/main/RemoveSophos.ps1'
$outputPath = "$env:windir\Temp\RemoveSophos.ps1"
$argument = "-Remove YES"
$logPath = "$env:windir\TEMP\SophosRemoval.log"

# Start the transcript and write all output to the log file
Start-Transcript -Path $logPath

# Download the script and save it to a file in $env:windir\Temp\
Invoke-WebRequest -Uri $url -OutFile $outputPath

# Execute the script with the specified argument
PowerShell.exe -ExecutionPolicy Bypass -File $outputPath $argument

# Stop the transcript and close the log file
Stop-Transcript
