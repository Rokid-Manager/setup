#!/bin/bash

pkg update &>/dev/null && pkg upgrade -y &>/dev/null
echo "y" | termux-setup-storage &>/dev/null
pkg install python tsu libexpat openssl wget curl unzip -y &>/dev/null
pip install requests Flask colorama aiohttp psutil crypto pycryptodome prettytable loguru rich &>/dev/null

APK_URL_1="https://f-droid.org/repo/com.termux.boot_1000.apk"
APK_URL_2="https://media.githubusercontent.com/media/Rokid-Manager/RokidManager_DeltaX/refs/heads/main/Delta-2.652.765.apk"
APK_PATH_1="/data/data/com.termux/files/home/com.termux.boot_1000.apk"
APK_PATH_2="/data/data/com.termux/files/home/Delta-2.652.765.apk"

download_with_progress() {
  local url="$1"
  local output_path="$2"
  wget --quiet --show-progress "$url" -O "$output_path"
}

download_with_progress "$APK_URL_1" "$APK_PATH_1"
if [ $? -ne 0 ]; then exit 1; fi

download_with_progress "$APK_URL_2" "$APK_PATH_2"
if [ $? -ne 0 ]; then exit 1; fi

pm install "$APK_PATH_1" &>/dev/null
if [ $? -ne 0 ]; then exit 1; fi

pm install "$APK_PATH_2" &>/dev/null
if [ $? -ne 0 ]; then exit 1; fi

su -c "cd /sdcard/Download && export PATH=\$PATH:/data/data/com.termux/files/usr/bin && export TERM=xterm-256color && python ./Rokid-Rejoin.py" &>/dev/null
if [ $? -ne 0 ]; then exit 1; fi

echo "Setup completed successfully!"
