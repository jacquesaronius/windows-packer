Write-Host "Sysprepping system..."
$proc = Start-Process -FilePath "C:\Windows\System32\Sysprep\Sysprep.exe" -ArgumentList "/oobe /generalize /quit" -PassThru
$proc.WaitForExit()
Write-Host "Sysprep exited with code $($proc.ExitCode)"
Write-Host "Sysprep complete."