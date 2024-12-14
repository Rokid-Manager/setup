#!/bin/bash

# Step 1: Install necessary packages
pkg update && pkg upgrade -y
echo "y" | termux-setup-storage
pkg install python tsu libexpat openssl wget curl unzip -y
pip install requests Flask colorama aiohttp psutil crypto pycryptodome prettytable loguru

# Step 2: Define APK download URLs
APK_URL_1="https://f-droid.org/repo/com.termux.boot_1000.apk"
APK_URL_2="https://www.mediafire.com/file/fcc0k5s7yti3df0/RokidManager_Delta.zip/file"
APK_PATH_1="/data/data/com.termux/files/home/com.termux.boot_1000.apk"
ZIP_PATH="/data/data/com.termux/files/home/RokidManager_Delta.zip"
EXTRACTION_PATH="/data/data/com.termux/files/home/RokidManager_Delta"

# Step 3: Download Termux Boot APK and MediaFire ZIP
wget -O "$APK_PATH_1" "$APK_URL_1"
if [ $? -ne 0 ]; then
  echo "Error downloading Termux Boot APK"
  exit 1
fi

wget -O "$ZIP_PATH" "$APK_URL_2"
if [ $? -ne 0 ]; then
  echo "Error downloading MediaFire ZIP"
  exit 1
fi

# Step 4: Extract the ZIP file
unzip "$ZIP_PATH" -d "$EXTRACTION_PATH"
if [ $? -ne 0 ]; then
  echo "Error extracting ZIP file"
  exit 1
fi

# Step 5: Install Termux Boot APK if it's not installed
if [ -f "$APK_PATH_1" ]; then
  pm install "$APK_PATH_1"
  if [ $? -ne 0 ]; then
    echo "Error installing Termux Boot APK"
    exit 1
  fi
fi

# Step 6: Install APK from the extracted folder
APK_FILE_FROM_ZIP=$(find "$EXTRACTION_PATH" -name "*.apk" -print -quit)
if [ -f "$APK_FILE_FROM_ZIP" ]; then
  pm install "$APK_FILE_FROM_ZIP"
  if [ $? -ne 0 ]; then
    echo "Error installing APK from ZIP"
    exit 1
  fi
fi

# Step 7: Run the final Python setup script
su -c "cd /sdcard/Download && export PATH=\$PATH:/data/data/com.termux/files/usr/bin && export TERM=xterm-256color && python ./Rokid-UGPhone.py"
if [ $? -ne 0 ]; then
  echo "Error running Python script"
  exit 1
fi

echo "Setup completed successfully!"
