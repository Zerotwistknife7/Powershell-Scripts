function sysinfo {
    $output = ""
	$machine = "."
	$compInfo = Get-wmiobject win32_computersystem -comp $machine
	$output += "COMPUTER INFO `r`n"
	$output += "===============`r`n"
	
	$output += "Name :" + $compinfo.name + "`r`n"
	$output += "Domain :" + $compinfo.domain + "`r`n"
	$output += "Model :" + $compinfo.model + "`r`n"
	$output += "RAM :" + "{0:n2} GB" -f ($compinfo.TotalPhysicalMemory/1gb )
	$output += "`r`n"
	
	return $output
}

function biosinfo {
    $output = ""
	$machine = "."
	$output += "BIOS INFO `r`n"
	$output += "===============`r`n"
	$biosInfo = Get-wmiobject win32_bios -comp $machine
	$output += "Name :" + $biosinfo.Name + "`r`n"
	$output += "Manufacturer :" + $biosinfo.Manufacturer + "`r`n"
	$output += "Serial No. :" + $biosinfo.SerialNumber+ "`r`n"
	
	return $output
}


function osinfo {
	$output = ""
	$machine = "."
	$output += "OS INFO `r`n"
	$output += "===============`r`n"
	
	$osInfo = get-wmiobject win32_operatingsystem -comp $machine
	
	$output += "OS Name:" + $osInfo.Caption + "`r`n"
	$output += "Service Pack:" + $osInfo.ServicePackMajorVersion + "`r`n"
	$output += "Windows Serial No.:" + $osInfo.SerialNumber + "`r`n"

	return $output
}

function driveInfo{
    $output = ""
	$machine = "."
	$output += "DISK INFO `r`n"
	$output += "===============`r`n"

    $logicalDisk = Get-WmiObject Win32_LogicalDisk -Filter "DriveType=3" -ComputerName $machine
	
    foreach($disk in $logicalDisk)
    {
        $diskObj = "" | Select-Object Disk,Size,FreeSpace
        $diskObj.Disk = $disk.DeviceID
        $diskObj.Size = "{0:n0} GB" -f (($disk | Measure-Object -Property Size -Sum).sum/1gb)
        $diskObj.FreeSpace = "{0:n0} GB" -f (($disk | Measure-Object -Property FreeSpace -Sum).sum/1gb)

        $text = "{0}  {1}  Free: {2}" -f $diskObj.Disk,$diskObj.size,$diskObj.Freespace
        $output += $text + "`r`n"
    }
    return $output
}

function servicesInfo {
	$machine = "."
	$output = ""
	$output += "SERVICE LIST `r`n"
	$output += "===============`r`n"
	
	foreach($srv in (get-wmiobject win32_service -computername $machine)) {
		$output += $srv.DisplayName + " - " + $srv.State + "`r`n"
	}
		
	return $output
}

function cpuInfo {
	$machine = "."
	$output = ""
	$output += "CPU INFO LIST `r`n"
	$output += "===============`r`n"
	
	foreach($cpu in (get-wmiobject win32_processor -computername $machine)) {
		$output += "id:" + $cpu.deviceid+ ", Name:" +  $cpu.name +  ", Manufacturer:" + $cpu.manufacturer +", Address Width:" + $cpu.AddressWidth +  "`r`n"
	}
		
	return $output
}



$data1 = sysinfo
$data2 = biosInfo
$data3 = osinfo
$data4 = driveInfo
$data5 = servicesInfo
$data6 = cpuInfo

$finaloutput = $data1 + "`r`n" + $data2  + "`r`n" +  "`r`n" + $data4 +  "`r`n"  + $data5 +  "`r`n" + $data6

write-host $finaloutput

$EmailTo = "it@sageintegration.com"
$EmailFrom = "info@sageintegration.com"
$Subject = "System Info"
$Body = $finaloutput 
$SMTPServer = "smtp.office365.com" 
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$SMTPClient = New-Object Net.Mail.SmtpClient($SmtpServer, 587) 
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("info@sageintegration.com","Taw48874"); 
$SMTPClient.Send($SMTPMessage)