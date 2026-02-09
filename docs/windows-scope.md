# Windows Scope

This project is currently implemented only for Linux systems.

Linux was selected because it provides direct command-line access to process management using tools such as `ps` and `kill`, which are commonly used in cybersecurity and server environments.

Windows process management follows a different execution model and relies on PowerShell and Windows Management Instrumentation (WMI). Due to these architectural differences, a separate Windows-specific implementation is required.

For this self-initiated project, the focus was placed on building a stable and reliable Linux version. The core detection logic is platform-independent and can be extended to Windows in the future using PowerShell commands such as `Get-Process` and `Stop-Process`.
