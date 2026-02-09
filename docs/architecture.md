# Architecture

The Process Threat Management System follows a simple, linear architecture designed for safe and controlled process monitoring in a Linux environment.

---

## Architecture Flow

1. **Privilege Validation**  
   The system first checks for root privileges to ensure full visibility of all running processes.

2. **Process Collection**  
   Active processes are collected using native Linux system utilities.

3. **Detection Logic**  
   Each process is analyzed based on predefined rules such as CPU usage threshold and suspicious name patterns.

4. **User Interaction**  
   Detected processes are displayed to the user for review.

5. **Response Action**  
   Process termination is performed only after explicit user confirmation.

---

## Design Focus

The architecture emphasizes safety, simplicity, and clarity, making it suitable for learning and demonstration purposes.

