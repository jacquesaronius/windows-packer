#Write-Host 'Installing Windows Updates...'

# Install PSWindowsUpdate module
#Install-PackageProvider -Name NuGet -Force
#Install-Module -Name PSWindowsUpdate -Force

#Import-Module PSWindowsUpdate
#Set-ExecutionPolicy RemoteSigned -Force

# Download and install all available updates
#Get-WindowsUpdate -AcceptAll -Install -AutoReboot

Write-Host 'Disabling Windows Update...'
Stop-Service wuauserv
Set-Service wuauserv -StartupType Disabled
Write-Host 'Windows Update disabled.'

Write-Host 'Restarting computer...'
Restart-Computer -Force