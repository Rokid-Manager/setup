#!/bin/bash

# Function to display a progress bar
progress_bar() {
    local PROGRESS=$1
    local TOTAL=$2
    local PERCENT=$(( PROGRESS * 100 / TOTAL ))
    local FILL=$(printf "%-${PERCENT}s" "=")
    local EMPTY=$(printf "%-$((100 - PERCENT))s" " ")

    echo -ne "[${FILL}${EMPTY}] ${PERCENT}%\r"
}

# Open Termux
echo "Opening Termux..."
termux-open || { echo "Failed to open Termux."; exit 1; }

# Update and install necessary packages
echo "Updating and upgrading packages..."
pkg update && pkg upgrade -y || { echo "Package update failed."; exit 1; }
pkg install -y curl pv || { echo "Package installation failed."; exit 1; }

# Menu for choosing the APK to download
echo "What do you want to download?"
echo "1. Codex"
echo "2. DeltaX"
echo "3. ArceusX"
read -p "Enter your choice (1/2/3): " choice

# Custom raw links for each APK
case $choice in
    1)
        RAW_LINK="https://example.com/raw/codex.apk"  # Replace with the raw link for Codex APK
        ;;
    2)
        RAW_LINK="https://media.githubusercontent.com/media/Rokid-Manager/RokidManager_DeltaX/refs/heads/main/Delta-2.652.765.apk"  # Replace with the raw link for DeltaX APK
        ;;
    3)
        RAW_LINK="https://example.com/raw/arceusx.apk"  # Replace with the raw link for ArceusX APK
        ;;
    *)
        echo "Invalid choice. Exiting."
        exit 1
        ;;
esac

# Download the APK file with progress
echo "Downloading the APK file..."
curl -L "$RAW_LINK" -o selected_apk.apk | pv -s $(curl -sI "$RAW_LINK" | grep -i Content-Length | awk '{print $2}' | tr -d '\r') > /dev/null || { echo "Failed to download the APK file."; exit 1; }

# Install the APK
echo "Installing the APK..."
termux-open selected_apk.apk || { echo "Failed to install the APK."; exit 1; }

echo "Setup complete!"
