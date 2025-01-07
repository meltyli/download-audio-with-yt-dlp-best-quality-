## Usage

### Description
This script downloads audio from provided URLs using `yt-dlp`, saving the files in a specified directory with various enhancements like metadata embedding, audio format conversion, and thumbnail embedding.

### Prerequisites
- `yt-dlp` must be installed and accessible in the system's `PATH`.

### Script Invocation
```bash
./download_audio.sh [options] [URL...]
```

### Options
- `-a <file>`: Read URLs from a file. Each line in the file should contain one URL.
- `<URL>`: Provide one or more URLs directly as arguments.

### Behaviour
- If the `-a` option is used, the script reads URLs from the specified file.
- If URLs are passed directly, the script processes each URL.
- Audio is downloaded in AAC format with the best available quality.
- Metadata and thumbnails are embedded in the audio files.
- Downloads are saved in the `yt-dlp` directory within the script's directory.
- A download archive (`.yt-dlp.archive`) is used to prevent re-downloading files.

### Config
Please edit the file to change the default path for where the files are saved. The script will create a `downloads` folder inside this directory.

### Example
1. **Download from a list of URLs in a file:**
    ```bash
    ./download_audio.sh -a urls.txt
    ```

2. **Download directly from provided URLs:**
    ```bash
    ./download_audio.sh https://example.com/video1 https://example.com/video2
    ```

### Notes
- The script limits the download rate to 10 MB/s and retries up to 5 times in case of failure.
- The output files are named based on the video's title.
# download-audio-with-yt-dlp-best-quality-
Just a basic script to run yt-dlp. It downloads an audio file per url given. It can also take in the param `-a file.txt` and process each url (new url per line). It also creates a file to remember which item has been successfully downloaded so it won't download duplicate files.
