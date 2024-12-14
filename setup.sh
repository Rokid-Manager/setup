#!/bin/bash

termux-open || exit 1
pkg update && pkg upgrade -y || exit 1
pkg install -y python git zip curl || exit 1
pip install requests Flask colorama aiohttp psutil crypto pycryptodome prettytable loguru rich || exit 1

BOOT_APK_LINK="https://f-droid.org/repo/com.termux.boot_7.apk"
BOOT_APK_NAME="TermuxBoot.apk"

echo "Installing Termux:Boot..."
curl -L "$BOOT_APK_LINK" -o "$BOOT_APK_NAME" || exit 1
if [ ! -f "$BOOT_APK_NAME" ]; then
    echo "Failed to download Termux:Boot."
    exit 1
fi
termux-open "$BOOT_APK_NAME" || exit 1

echo "What do you want to download?"
echo "1. Codex"
echo "2. DeltaX"
echo "3. ArceusX"
read -p "Enter your choice (1/2/3): " choice

case "$choice" in
    "1")
        RAW_LINK="https://example.com/raw/codex.apk"
        FILE_NAME="Codex.apk"
        ;;
    "2")
        RAW_LINK="https://media.githubusercontent.com/media/Rokid-Manager/RokidManager_DeltaX/refs/heads/main/Delta-2.652.765.apk"
        FILE_NAME="DeltaX.apk"
        ;;
    "3")
        RAW_LINK="https://example.com/raw/arceusx.apk"
        FILE_NAME="ArceusX.apk"
        ;;
    *)
        echo "Invalid choice. Exiting."
        exit 1
        ;;
esac

curl -L "$RAW_LINK" -o "$FILE_NAME" || exit 1
if [ ! -f "$FILE_NAME" ]; then
    echo "Download failed or file is missing."
    exit 1
fi

termux-open "$FILE_NAME" || exit 1

echo "Setup complete."
