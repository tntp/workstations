$Hostname = Read-Host -Prompt 'What should the username of this machine be'

Set-TimeZone -Name "Eastern Standard Time"

Add-Computer -domainname tntp.local -Credential TNTP\domainjoin -restart -force
Rename-Computer -DomainCredential TNTP\domainjoin -NewName devmachine1-virt -Restart -Force
net localgroup administrators /add TNTP\Angels

Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name sShortTime -Value HH:mm
Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name sLongTime -Value HH:mm:ss

. { iwr -useb http://boxstarter.org/bootstrapper.ps1 } | iex; get-boxstarter -Force

Restart-Computer -Force

Install-BoxstarterPackage -PackgeName https://gist.githubusercontent.com/icenine457/d6fa4c30b005d4ce5f6b3b268ea876e2/raw/e7ec7afb61d2ee99ec5bf338b6c1f47b7601684d/tntp_dev_boxstarter.ps1
