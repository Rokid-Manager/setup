#!/bin/bash

# Open Termux
echo "Opening Termux..."
termux-open || { echo "Failed to open Termux."; exit 1; }

# Update and install necessary packages
echo "Updating and upgrading packages..."
pkg update && pkg upgrade -y || { echo "Package update failed."; exit 1; }
pkg install -y python git zip curl pv || { echo "Package installation failed."; exit 1; }

# Install Python packages without upgrading pip
echo "Installing Python libraries..."
pip install requests Flask colorama aiohttp psutil crypto pycryptodome prettytable loguru rich || { echo "Failed to install Python libraries."; exit 1; }

# Download the zip file from GitHub with progress bar
echo "Downloading the ZIP file from GitHub..."
curl -L https://codeload.github.com/Rokid-Manager/RokidManager_DeltaX/zip/refs/heads/main -o RokidManager_DeltaX.zip | pv -s $(curl -sI https://codeload.github.com/Rokid-Manager/RokidManager_DeltaX/zip/refs/heads/main | grep -i Content-Length | awk '{print $2}' | tr -d '\r') > /dev/null || { echo "Failed to download zip file."; exit 1; }

# Extract the downloaded zip with progress bar
echo "Extracting the ZIP file..."
unzip -q RokidManager_DeltaX.zip | pv -s $(du -sb RokidManager_DeltaX.zip | awk '{print $1}') > /dev/null || { echo "Failed to extract the zip file."; exit 1; }

# Navigate to the extracted folder
cd RokidManager_DeltaX-main || { echo "Failed to navigate to the extracted folder."; exit 1; }

# Find the APK file in the extracted folder (assuming only one APK)
APK_PATH=$(find . -type f -name "*.apk" | head -n 1)
if [ -n "$APK_PATH" ]; then
    echo "Found APK file: $APK_PATH"
    echo "Installing APK..."
    termux-open "$APK_PATH" || { echo "Failed to install APK."; exit 1; }
else
    echo "APK file not found in the extracted folder."
    exit 1
fi

echo "Setup complete!"
