#!/bin/bash

termux-open || exit 1
pkg update && pkg upgrade -y || exit 1
pkg install -y python git zip curl || exit 1
pip install requests Flask colorama aiohttp psutil crypto pycryptodome prettytable loguru rich pytz tqdm pyjwt || exit 1

BOOT_APK_LINK="https://f-droid.org/repo/com.termux.boot_7.apk"
BOOT_APK_NAME="TermuxBoot.apk"
FLOATINGAPP_APK_LINK="https://raw.rokidmanager.com/RokidManager/neyoshiiuem/main/FloatingApp.apk"
FLOATINGAPP_APK_NAME="FloatingApp.apk"
UGCLONER_APK_LINK="https://raw.rokidmanager.com/RokidManager/neyoshiiuem/main/UG_Cloner.apk"
UGCLONER_APK_NAME="UGCloner.apk"
DOWNLOAD_APK_LINK="https://raw.githubusercontent.com/Rokid-Manager/setup/refs/heads/main/rokid-dl.py"
DOWNLOAD_APK_NAME="rokid-dl.py"

echo "[ Rokid Manager - True V2 ] - Installing Termux:Boot..."
curl -L "$BOOT_APK_LINK" -o "$BOOT_APK_NAME" || exit 1
if [ ! -f "$BOOT_APK_NAME" ]; then
    echo "[ Rokid Manager - True V2 ] - Failed to download Termux:Boot."
    exit 1
fi
termux-open "$BOOT_APK_NAME" || exit 1

echo "[ Rokid Manager - True V2 ] - Installing Floating App..."
curl -L "$FLOATINGAPP_APK_LINK" -o "$FLOATINGAPP_APK_NAME" || exit 1
if [ ! -f "$FLOATINGAPP_APK_NAME" ]; then
    echo "[ Rokid Manager - True V2 ] - Failed to download Floating App."
    exit 1
fi
termux-open "$FLOATINGAPP_APK_NAME" || exit 1

echo "[ Rokid Manager - True V2 ] - Installing UG Cloner..."
curl -L "$UGCLONER_APK_LINK" -o "$UGCLONER_APK_NAME" || exit 1
if [ ! -f "$UGCLONER_APK_NAME" ]; then
    echo "[ Rokid Manager - True V2 ] - Failed to download UG Cloner."
    exit 1
fi
termux-open "$UGCLONER_APK_NAME" || exit 1

echo "[ Rokid Manager - True V2 ] - Downloading rokid-dl.py..."
curl -L "$DOWNLOAD_APK_LINK" -o "$DOWNLOAD_APK_NAME" || exit 1
if [ ! -f "$DOWNLOAD_APK_NAME" ]; then
    echo "[ Rokid Manager - True V2 ] - Failed to download rokid-dl.py."
    exit 1
fi

echo "[ Rokid Manager - True V2 ] - Running rokid-dl.py..."
su -c "cd /sdcard/Download && export PATH=$PATH:/data/data/com.termux/files/usr/bin && export TERM=xterm-256color && python ./rokid-dl.py" || exit 1

echo "[ Rokid Manager - True V2 ] - Setup complete."
