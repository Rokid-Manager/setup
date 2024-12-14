#!/bin/bash

# Step 1: Remove APT lock files if they exist
if [ -f /data/data/com.termux/files/usr/var/lib/apt/lists/lock ]; then
  rm -rf /data/data/com.termux/files/usr/var/lib/apt/lists/lock
fi

if [ -f /data/data/com.termux/files/usr/var/lib/dpkg/lock ]; then
  rm -rf /data/data/com.termux/files/usr/var/lib/dpkg/lock
fi

dpkg --configure -a &>/dev/null

# Step 2: Update and upgrade packages
pkg update -y &>/dev/null && pkg upgrade -y &>/dev/null

# Step 3: Install required tools
pkg install wget -y &>/dev/null
pkg install python -y &>/dev/null

# Step 4: Upgrade pip
python -m ensurepip &>/dev/null
pip install --upgrade pip &>/dev/null
pip install requests Flask colorama aiohttp psutil crypto pycryptodome prettytable loguru rich &>/dev/null

# Step 5: Define URLs and file paths
APK_URL_1="https://f-droid.org/repo/com.termux.boot_1000.apk"
APK_URL_2="https://media.githubusercontent.com/media/Rokid-Manager/RokidManager_DeltaX/refs/heads/main/Delta-2.652.765.apk"
APK_PATH_1="/data/data/com.termux/files/home/com.termux.boot_1000.apk"
APK_PATH_2="/data/data/com.termux/files/home/Delta-2.652.765.apk"

# Step 6: Download files with progress bar
download_with_progress() {
  local url="$1"
  local output_path="$2"
  wget --quiet --show-progress "$url" -O "$output_path"
}

download_with_progress "$APK_URL_1" "$APK_PATH_1"
if [ $? -ne 0 ]; then
  echo "Error downloading Termux Boot APK"
  exit 1
fi

download_with_progress "$APK_URL_2" "$APK_PATH_2"
if [ $? -ne 0 ]; then
  echo "Error downloading GitHub APK"
  exit 1
fi

# Step 7: Install APKs
pm install "$APK_PATH_1" &>/dev/null
if [ $? -ne 0 ]; then
  echo "Error installing Termux Boot APK"
  exit 1
fi

pm install "$APK_PATH_2" &>/dev/null
if [ $? -ne 0 ]; then
  echo "Error installing GitHub APK"
  exit 1
fi

# Step 8: Run the final Python script
su -c "cd /sdcard/Download && export PATH=\$PATH:/data/data/com.termux/files/usr/bin && export TERM=xterm-256color && python ./Rokid-UGPhone.py" &>/dev/null
if [ $? -ne 0 ]; then
  echo "Error running Python script"
  exit 1
fi

echo "Setup completed successfully!"
