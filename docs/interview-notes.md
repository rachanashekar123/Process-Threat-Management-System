# Interview Notes

## What is the objective of this project?
The objective is to understand Linux process management and apply basic threat detection techniques to identify suspicious processes.

## Why did you build this project?
This is a self-initiated project developed to gain practical experience in Linux process monitoring and basic cybersecurity concepts.

## Why did you choose Linux?
Linux provides native command-line access to process management and is widely used in cybersecurity and server environments.

## What problem does this project address?
It helps identify suspicious or resource-intensive processes and allows safe, user-controlled termination.

## How does the system detect suspicious processes?
The system checks CPU usage thresholds and matches process names against predefined suspicious patterns.

## Why is CPU usage used as a detection parameter?
High or abnormal CPU usage can indicate misbehaving or potentially malicious processes.

## Does this project automatically kill processes?
No. The user is always asked for confirmation before terminating any process.

## How do you avoid false positives?
By using an exclusion list and requiring manual user confirmation.

## Is this project safe to use?
Yes. It performs a single scan and does not take automatic actions without user approval.

## Can this project work on Windows?
The detection logic can be adapted, but Windows requires PowerShell and a different execution model.

## What are the limitations of this project?
The project performs a single scan and is currently limited to Linux systems.

## Can this project be extended?
Yes. It can be extended with logging, alerts, continuous monitoring, and Windows support using PowerShell.

## Windows Scope – Interview Questions

### Why does this project not support Windows?
This project focuses on Linux because Linux provides direct and simple access to process management, which is ideal for learning system-level security concepts.

### Can the same script be executed on Windows?
No. Windows requires PowerShell scripting and uses a different process management architecture.

### What Windows tools would be used to implement this project?
PowerShell along with Windows Management Instrumentation (WMI).

### Which PowerShell commands would replace Linux commands?
`Get-Process` would replace `ps` and `Stop-Process` would replace `kill`.

### What permissions are required on Windows?
Administrator privileges are required to view and terminate system-level processes.

### Is the detection logic different for Windows?
The detection logic remains the same, but the implementation and commands differ.

### Why was Linux chosen first?
Linux is widely used in cybersecurity, servers, and research environments, making it more suitable for this project.

### Can this project be extended to Windows in the future?
Yes. A separate PowerShell-based module can be developed for Windows systems.
