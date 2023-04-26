# Reg2CI (c) 2022 by Roger Zander
if((Test-Path -LiteralPath "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services\Client") -ne $true) {  New-Item "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services\Client" -force -ea SilentlyContinue };
New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services\Client' -Name 'fClientDisableUDP' -Value 1 -PropertyType DWord -Force -ea SilentlyContinue;
