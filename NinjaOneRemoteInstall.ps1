# Set the URL and download location for the EXE file
$url = "https://resources.ninjarmm.com/development/ninjacontrol/5.11.4186/ncinstaller-x86.exe"
$downloadLocation = "$env:windir\Temp\NinjaRemote_x86.exe"

# Download the EXE file
Invoke-WebRequest -Uri $url -OutFile $downloadLocation

# Set the arguments to pass to the EXE installer
$exeArguments = "/S /v/qn"

# Start the EXE installer
Start-Process -FilePath $downloadLocation -ArgumentList $exeArguments -Wait