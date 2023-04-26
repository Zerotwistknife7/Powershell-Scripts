$TOKEN = " eyJ1cmwiOiAiaHR0cHM6Ly91c2VhMS1jdzAyLnNlbnRpbmVsb25lLm5ldCIsICJzaXRlX2tleSI6ICJkNzQ1ZWJlOWNiNmU1ZDI5In0="
 
if (Test-Path -Path C:\ProgramData\Sentinel) {
     Write-Host "SentinelOne Present"
     exit
 }
 
Invoke-WebRequest -Uri "https://s3.amazonaws.com/update2.itsupport247.net/SentinelOne/sentinelone_latest/SentinelOneInstaller_windows_x64.exe" -OutFile "C:\SentinelOne_windows.exe"
 
C:\SentinelOne_windows.exe --dont_fail_on_config_preserving_failures -t $TOKEN
 
if (Test-Path -Path C:\ProgramData\Sentinel) {
     Remove-Item C:\SentinelOne_windows.exe
 }

