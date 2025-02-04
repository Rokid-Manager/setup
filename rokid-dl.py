import os
import requests

def download_file(url, filename):
    response = requests.get(url, stream=True)
    if response.status_code == 200:
        with open(filename, 'wb') as file:
            for chunk in response.iter_content(chunk_size=1024):
                file.write(chunk)
        return True
    return False

print("What do you want to download?")
print("1. Codex")
print("2. DeltaX")
print("3. ArceusX")
print("4. Cryptic")
print("5. Trigon")
print("6. CodeX VNG")
print("7. ArceusX VNG")
choice = input("Enter your choice (1-7): ")

links = {
    "1": ("https://download2447.mediafire.com/xkpsv870hhkghHeXcYdz7CN11jWG2v8fZ1-kVOrmL27i5zYQTVju9h78MDM4Xg-bwxQDr4mZAkSJ28Fa1CyqUPPAgUmiNArwEaHksAjGHBkJB9G_ub2D6Qxq80hKdqsQdQOAI8JgBaH67x9Z9YQtmokHmukq10W8qU4wueLoUYcb/fjvpz86fapztpwt/Codex+v2.656.677.apk", "RokidManager_CodeX.apk"),
    "2": ("https://download2449.mediafire.com/ekt6ob8uivygg4t8oprwx96jB_2953pNntDG_eCDTYtW9EyIkWCrhhVFD2bQvuAN7t8kjqFYhFBe-6UIPpMr5rExj7J-AZxLees60PfQkLkHZOQSoY8vQGT3Xv-Dob9EfC93CMjL44DUPJ1q8sxQWhFNayADgGzX69YQnU3BZT0r/nmdbh07m6c9z6hm/Delta-656.677-03.apk", "RokidManager_DeltaX.apk"),
    "3": ("https://download2436.mediafire.com/boen7hckvngg7bglX2TrOKkEl_xAQKG_ZgmeA5xlByvNGEnv0ybA9cr7RAjUJbb1Q4BeX48hJXDX6pE4fsws9CqWhyXsLSjReXjwqqCC9GhBvWTPA-xx6cpvQ1luvOmr7Tuxux3NBw2TudXiEnrfYd-DvSYajeJcAB3wN4tfAC_S/qblayl6hrukjc8d/Roblox+Arceus+X+NEO+1.5.1.apk", "RokidManager_ArceusX.apk"),
    "4": ("https://download2449.mediafire.com/8glgrbp259tgL1ztfZNvPBBiW_SjXsg_ilUr6Ubb21ZMSSJb1M4d2OxO1zMAdgtRiY0rQOZf3d-fxQmTMaoeWTl0J4d9FIeqpoPR1fBaGfQHnYZb4tWZo7Tl1B-EM_UeQzLvGE535zci5CKVvktaaJf9_SLhwUFCLspJC_4Py6ng/faewv4euo5t4yse/Cryptic+2.656.677+APK.apk", "RokidManager_Cryptic.apk"),
    "5": ("https://download2449.mediafire.com/8glgrbp259tgL1ztfZNvPBBiW_SjXsg_ilUr6Ubb21ZMSSJb1M4d2OxO1zMAdgtRiY0rQOZf3d-fxQmTMaoeWTl0J4d9FIeqpoPR1fBaGfQHnYZb4tWZo7Tl1B-EM_UeQzLvGE535zci5CKVvktaaJf9_SLhwUFCLspJC_4Py6ng/faewv4euo5t4yse/Cryptic+2.656.677+APK.apk", "RokidManager_Cryptic.apk"),
    "6": ("https://download2432.mediafire.com/sn9btvp0kphgeoYX2cOUPfjI1jiunBpvIzqifJA5vHnuLV8RIosCgmJOa7QJ8ed0Z3jj7YIonIGscZ8JZQNqUYNKLuO7q6nDBq6X9HIKM3-3gVNeiwv7v1Sh0Fh7XXyJHP3AuvcKHB_thowykhEVJR2VqjeMLLZ5gDTP0sAuPnUb/ddimbier09tgp7g/Codex+2.655+VNG.apk", "RokidManager_CodeXVNG.apk"),
    "7": ("https://download2431.mediafire.com/r1enqoip1vegWEuO4sJSHTLiQR9xeGM6M_SBqZSmJrjbV19ao_fkSRZ9jmN2rv4suYM_yPVp7sLPmu7pHkbA8KpuTKMfBI7tfL_rsh8emMeXt2ys_a9-mZ_FN-RleOwDYhsAFKvXfQJ6eqnDjHqi0QvYPlcYnxWCOMPTDE4W5Mrd/9uen72tzg3ce0it/Roblox+-+VNG+Arceus+X+NEO+1.5.0.apk", "RokidManager_ArceusXVNG.apk")
}

if choice in links:
    raw_link, file_name = links[choice]
    print(f"Downloading {file_name}...")
    if download_file(raw_link, file_name):
        os.system(f"termux-open {file_name}")
    else:
        print("Download failed or file is missing.")
else:
    print("Invalid choice. Exiting.")
