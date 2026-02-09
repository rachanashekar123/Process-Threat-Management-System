#!/bin/bash

# Malicious Process Detector and Killer (Single Scan)

echo "===== Malicious Process Detector and Killer ====="
echo "Scanning for suspicious processes..."

# Ensure the script is run as root to see all processes
if [ "$(id -u)" -ne 0 ]; then
    echo "You need to run this script as root to see all processes."
    exit 1
fi

# Define a threshold for high CPU usage (in percentage)
CPU_THRESHOLD=100

# Define a list of suspicious process names to exclude
EXCLUDED_PROCESSES=("wireplumber")

# Define a list of suspicious process names to check
SUSPICIOUS_NAMES=("Privileged" "Isolated" "Web" "Socket" "RDD" "Utility")

# Function to check if the process name is suspicious
is_suspicious() {
    local cmd=$1
    for name in "${SUSPICIOUS_NAMES[@]}"; do
        if [[ "$cmd" == *"$name"* ]]; then
            return 0  # Found a match
        fi
    done
    return 1  # No match
}

# Function to check if the process is in the excluded list
is_excluded() {
    local cmd=$1
    for excluded in "${EXCLUDED_PROCESSES[@]}"; do
        if [[ "$cmd" == *"$excluded"* ]]; then
            return 0  # Excluded process found
        fi
    done
    return 1  # Not an excluded process
}

# Scan processes and store suspicious ones
suspicious_pids=()  # Array to store suspicious PIDs
suspicious_commands=()  # Array to store suspicious command names

# Limit to scanning only the necessary details and avoiding overhead
ps -eo pid,comm,%cpu,%mem --sort=-%cpu | while read pid comm cpu mem; do
    # Skip the header line
    if [[ "$pid" == "PID" ]]; then
        continue
    fi

    # Skip the excluded process
    if is_excluded "$comm"; then
        continue
    fi

    # Check if the process exceeds CPU threshold or matches a suspicious name
    if [[ "$cpu" > "$CPU_THRESHOLD" ]] || is_suspicious "$comm"; then
        # Add the PID and command to the list of suspicious processes
        suspicious_pids+=("$pid")
        suspicious_commands+=("$comm")
    fi
done

# Display the list of suspicious PIDs and commands
if [ ${#suspicious_pids[@]} -gt 0 ]; then
    echo "Suspicious processes found:"
    for i in "${!suspicious_pids[@]}"; do
        echo "PID: ${suspicious_pids[$i]} ${suspicious_commands[$i]}"
    done
else
    echo "No suspicious processes found."
fi

# Ask the user if they want to kill any suspect process
echo "Do you want to kill any suspect process? [y/n]: "
read -r kill_choice

if [[ "$kill_choice" == "y" ]]; then
    # Prompt the user for the PID to kill
    echo "Enter the PID to kill:"
    read -r kill_pid

    # Kill the process if it exists
    if ps -p "$kill_pid" > /dev/null 2>&1; then
        kill -9 "$kill_pid"
        echo "Process $kill_pid killed."
    else
        echo "No process found with PID $kill_pid."
    fi
else
    echo "No process killed."
fi
