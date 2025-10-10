# CollectSystemInfo

## Overview

This PowerShell script is designed for comprehensive system diagnostics. It gathers a wide range of information, including system configuration, event logs, driver lists, SetupAPI logs, registry settings, update logs, services, uptime, processes, installed applications, installed KBs (knowledge base articles), network configuration, and optionally, memory dumps.

The collected data is organized into two subfolders within the time-stamped summary folder, one for log and the other for dump. and then compressed into two ZIP archives correspondingly for easy sharing and analysis.

## Usage

1. **Prerequisites:**
   - PowerShell (Windows 10/Windows Server 2016 or later)
   - Administrative privileges (for collecting event logs)
   - Ensure the script runs with an unrestricted execution policy (for Windows 10 and Windows Server 2016): 
     ```powershell   
     Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope Process -Force
     ```

2. **Running the Script:**
   - Open PowerShell as an administrator.
   - Navigate to the script's directory.
   - Execute the script:
      ```powershell
      .\CollectSystemInfo.ps1 -IncludeSensitiveData
      ```
      - `-IncludeSensitiveData`: Optional switch to include memory dumps in the collection (use with caution).
      - `-Help`: Provide basic usage of the script.

3. **Output:**
   - A folder named `SystemInfo_YYYY-MM-DD_HH-MM-SS` will be created in the script's directory.
   - This folder contains the collected data folders:
      - A foler named `Log_folder_YYYY-MM-DD_HH-MM-SS` will be created for log data.
      - A ZIP archive named `Log_folder_YYYY-MM-DD_HH-MM-SS.zip` will also be created correspondingly.
      - A foler named `Dump_folder_YYYY-MM-DD_HH-MM-SS` will be created for dump files if add param `-IncludeSensitiveData`.
      - A ZIP archive named `Dump_folder_YYYY-MM-DD_HH-MM-SS.zip` will also be created correspondingly.

## Data Collected

- `msinfo32.txt`: Detailed hardware and software configuration report.
- `system.evtx`, `security.evtx`, `application.evtx`: System, Security, and Application event logs.
- `drv_list.csv`: List of all installed drivers.
- `virtio_disk.txt`: Specific configuration details for Virtio-Win storage drivers.
- `WindowsUpdate.log`: Detailed logs of Windows Update activity.
- `Services.csv`: List of services and their status.
- `WindowsUptime.txt`: Duration since the last system boot.
- `RunningProcesses.csv`: Snapshot of active processes.
- `InstalledApplications.csv`: List of installed applications.
- `InstalledKBs.csv`: List of installed Windows updates.
- `NetworkInterfaces.txt` and `IPConfiguration.txt`: Network configuration details.
- `setupapi*.log`: Logs related to device and driver installations.
- `MEMORY.DMP` and `Minidump` folder: Full or mini memory dumps (if `-IncludeSensitiveData` is used).
- `Collecting_Status.txt`: Generated during data collection and deleted after completion. If the script is interrupted, this file indicates incomplete data collection.

## Contributing

Contributions are welcome! Feel free to open issues or submit pull requests.
