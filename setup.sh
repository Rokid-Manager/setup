#!/bin/bash

termux-open || exit 1
pkg update && pkg upgrade -y || exit 1
pkg install -y python git zip curl || exit 1
pip install requests Flask colorama aiohttp psutil crypto pycryptodome prettytable loguru rich pytz tqdm pyjwt || exit 1

BOOT_APK_LINK="https://f-droid.org/repo/com.termux.boot_7.apk"
BOOT_APK_NAME="TermuxBoot.apk"
FLOATINGAPP_APK_LINK="https://download2285.mediafire.com/1u2gii0jgrhglV_EOBf55vLer4Ilxj6Mqi5D1pess_sMzaJryZ6zA8mYslCH5MoBvctKgMnrerJ1YXSghKl50CxCCNPdWs-NeVmvXZJo75TE9rAzMPsbY3AwTzllTjR599Kd4B8vsLG2VLVuR5YKe4boakVrQUChgU8iCknYzJyI/7s4z33q4cklyf3m/com-mod-floating-apps-apk-mod-4-14-premium-141402012.apk"
FLOATINGAPP_APK_NAME="FloatingApp.apk"
UGCLONER_APK_LINK="https://download2337.mediafire.com/nkhpp9xm1hmgIz6bm57HuRbSltnldQbMRRW1T-XXN5UtaqZAmCkWpGRPNLD7RLzZtEb_VGQ20UpJcJ224EhtR4Z0gUUvES3Gfy71fFajo6f5Xg3X2IsUhusTKmAdrHvDA3WCIcpgFj4lOhA461JzRmfobVvSu6yYSqrEq7xpP9H8/juhzfoeptq56if2/UG_Cloner.apk"
UGCLONER_APK_NAME="UGCloner.apk"

echo "Installing Termux:Boot..."
curl -L "$BOOT_APK_LINK" -o "$BOOT_APK_NAME" || exit 1
if [ ! -f "$BOOT_APK_NAME" ]; then
    echo "Failed to download Termux:Boot."
    exit 1
fi
termux-open "$BOOT_APK_NAME" || exit 1

echo "Installing Floating App..."
curl -L "$FLOATINGAPP_APK_LINK" -o "$FLOATINGAPP_APK_NAME" || exit 1
if [ ! -f "$FLOATINGAPP_APK_NAME" ]; then
    echo "Failed to download Floating App."
    exit 1
fi
termux-open "$FLOATINGAPP_APK_NAME" || exit 1

echo "Installing UGCloner..."
curl -L "$UGCLONER_APK_LINK" -o "$UGCLONER_APK_NAME" || exit 1
if [ ! -f "$UGCLONER_APK_NAME" ]; then
    echo "Failed to download UG Cloner."
    exit 1
fi
termux-open "$UGCLONER_APK_NAME" || exit 1

echo "What do you want to download?"
echo "1. Codex"
echo "2. DeltaX"
echo "3. ArceusX"
echo "4. Cryptic"
echo "5. Trigon"
echo "6. CodeX VNG"
echo "7. ArceusX VNG"
read -p "Enter your choice (1/2/3): " choice

case "$choice" in
    "1")
        RAW_LINK="https://download2447.mediafire.com/xkpsv870hhkghHeXcYdz7CN11jWG2v8fZ1-kVOrmL27i5zYQTVju9h78MDM4Xg-bwxQDr4mZAkSJ28Fa1CyqUPPAgUmiNArwEaHksAjGHBkJB9G_ub2D6Qxq80hKdqsQdQOAI8JgBaH67x9Z9YQtmokHmukq10W8qU4wueLoUYcb/fjvpz86fapztpwt/Codex+v2.656.677.apk"
        FILE_NAME="RokidManager_CodeX.apk"
        ;;
    "2")
        RAW_LINK="https://download2449.mediafire.com/ekt6ob8uivygg4t8oprwx96jB_2953pNntDG_eCDTYtW9EyIkWCrhhVFD2bQvuAN7t8kjqFYhFBe-6UIPpMr5rExj7J-AZxLees60PfQkLkHZOQSoY8vQGT3Xv-Dob9EfC93CMjL44DUPJ1q8sxQWhFNayADgGzX69YQnU3BZT0r/nmdbh07m6c9z6hm/Delta-656.677-03.apk"
        FILE_NAME="RokidManager_DeltaX.apk"
        ;;
    "3")
        RAW_LINK="https://download2436.mediafire.com/boen7hckvngg7bglX2TrOKkEl_xAQKG_ZgmeA5xlByvNGEnv0ybA9cr7RAjUJbb1Q4BeX48hJXDX6pE4fsws9CqWhyXsLSjReXjwqqCC9GhBvWTPA-xx6cpvQ1luvOmr7Tuxux3NBw2TudXiEnrfYd-DvSYajeJcAB3wN4tfAC_S/qblayl6hrukjc8d/Roblox+Arceus+X+NEO+1.5.1.apk"
        FILE_NAME="RokidManager_ArceusX.apk"
        ;;
    "4")
        RAW_LINK="https://download2449.mediafire.com/8glgrbp259tgL1ztfZNvPBBiW_SjXsg_ilUr6Ubb21ZMSSJb1M4d2OxO1zMAdgtRiY0rQOZf3d-fxQmTMaoeWTl0J4d9FIeqpoPR1fBaGfQHnYZb4tWZo7Tl1B-EM_UeQzLvGE535zci5CKVvktaaJf9_SLhwUFCLspJC_4Py6ng/faewv4euo5t4yse/Cryptic+2.656.677+APK.apk"
        FILE_NAME="RokidManager_Cryptic.apk"
        ;;
    "5")
        RAW_LINK="https://download2449.mediafire.com/8glgrbp259tgL1ztfZNvPBBiW_SjXsg_ilUr6Ubb21ZMSSJb1M4d2OxO1zMAdgtRiY0rQOZf3d-fxQmTMaoeWTl0J4d9FIeqpoPR1fBaGfQHnYZb4tWZo7Tl1B-EM_UeQzLvGE535zci5CKVvktaaJf9_SLhwUFCLspJC_4Py6ng/faewv4euo5t4yse/Cryptic+2.656.677+APK.apk"
        FILE_NAME="RokidManager_Cryptic.apk"
        ;;
    "6")
        RAW_LINK="https://download2432.mediafire.com/sn9btvp0kphgeoYX2cOUPfjI1jiunBpvIzqifJA5vHnuLV8RIosCgmJOa7QJ8ed0Z3jj7YIonIGscZ8JZQNqUYNKLuO7q6nDBq6X9HIKM3-3gVNeiwv7v1Sh0Fh7XXyJHP3AuvcKHB_thowykhEVJR2VqjeMLLZ5gDTP0sAuPnUb/ddimbier09tgp7g/Codex+2.655+VNG.apk"
        FILE_NAME="RokidManager_CodeXVNG.apk"
        ;;
    "7")
        RAW_LINK="https://download2431.mediafire.com/r1enqoip1vegWEuO4sJSHTLiQR9xeGM6M_SBqZSmJrjbV19ao_fkSRZ9jmN2rv4suYM_yPVp7sLPmu7pHkbA8KpuTKMfBI7tfL_rsh8emMeXt2ys_a9-mZ_FN-RleOwDYhsAFKvXfQJ6eqnDjHqi0QvYPlcYnxWCOMPTDE4W5Mrd/9uen72tzg3ce0it/Roblox+-+VNG+Arceus+X+NEO+1.5.0.apk"
        FILE_NAME="RokidManager_ArceusXVNG.apk"
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
