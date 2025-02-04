import os
import requests #type: ignore

def download_file(url, filename):
    response = requests.get(url, stream=True)
    if response.status_code == 200:
        with open(filename, 'wb') as file:
            for chunk in response.iter_content(chunk_size=1024):
                file.write(chunk)
        return True
    return False

print("What do you want to download?")
print("1. CodeX Global")
print("2. DeltaX Global")
print("3. ArceusX Global")
choice = input("Enter your choice (1-3): ")

links = {
    "1": ("https://raw.rokidmanager.com/RokidManager/neyoshiiuem/main/RokidManager_CodeX.apk", "RokidManager_CodeX.apk"),
    "2": ("https://raw.rokidmanager.com/RokidManager/neyoshiiuem/main/RokidManager_DeltaX.apk", "RokidManager_DeltaX.apk"),
    "3": ("https://raw.rokidmanager.com/RokidManager/neyoshiiuem/main/RokidManager_ArceusX.apk", "RokidManager_ArceusX.apk"),
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
