Write-Host "Preparing WinRM configuration for post-reboot activation..."

# Set WinRM service to start automatically but don't start it yet
Set-Service -Name WinRM -StartupType Automatic

# Configure firewall rule now
New-NetFirewallRule -Name "WinRM HTTP" -DisplayName "WinRM HTTP" -Enabled True -Profile Any -Direction Inbound -Action Allow -Protocol TCP -LocalPort 5985

# Schedule post-reboot WinRM activation
$script = @"
winrm delete winrm/config/Listener?Address=*+Transport=HTTP
winrm create winrm/config/Listener?Address=*+Transport=HTTP
winrm set winrm/config/service/auth '@{Basic=`"true`"}'
winrm set winrm/config/service '@{AllowUnencrypted=`"true`"}'
"@
$path = "$env:ProgramData\WinRM-PostBoot.ps1"
$script | Set-Content -Path $path

# Schedule task to run after reboot
schtasks /create /tn "EnableWinRMPostBoot" /tr "powershell -ExecutionPolicy Bypass -File `"$path`"" /sc onstart /ru SYSTEM /f

Write-Host "WinRM configuration staged. Will activate after reboot."