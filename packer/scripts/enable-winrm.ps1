Write-Host "Enabling WinRM..."

Enable-PSRemoting -Force

Write-Host "Deleting existing WinRM listeners..."
winrm delete winrm/config/Listener?Address=*+Transport=HTTP

Write-Host "Creating new WinRM listener..."
winrm create winrm/config/Listener?Address=*+Transport=HTTP

Write-Host "Configuring WinRM authentication..."
winrm set winrm/config/service/auth '@{Basic="true"}'
winrm set winrm/config/service '@{AllowUnencrypted="true"}'

Write-Host "Configuring firewall rules..."
New-NetFirewallRule -Name "WinRM HTTP" -DisplayName "WinRM HTTP" -Enabled True -Profile Any -Direction Inbound -Action Allow -Protocol TCP -LocalPort 5985

Write-Host "WinRM configuration complete."