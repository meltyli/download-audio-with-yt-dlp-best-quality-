#!/bin/bash

# Download location (default: download_audio.sh/yt-dlp)
base_dir=""










# Check if base_dir is empty
if [ -z "$base_dir" ]; then
    base_dir=$(dirname "$0")
fi

# Output and archive setup
output_dir="$base_dir/yt-dlp"
download_archive="$output_dir/.yt-dlp.archive"
mkdir -p "$output_dir"

# Function to process each URL
download_audio() {
    local url=$1
    yt-dlp \
        -f bestaudio \
        --extract-audio \
        --audio-format aac \
        --audio-quality 0 \
        --embed-thumbnail \
        --add-metadata \
        --download-archive "$download_archive" \
        --limit-rate 10M \
        --retries 5 \
        --output "$output_dir/%(title)s.%(ext)s" \
        "$url"
}

# Check for the '-a' option and file argument
if [ "$1" == "-a" ] && [ -f "$2" ]; then
    while IFS= read -r url; do
        download_audio "$url"
    done < "$2"
else
    # Loop through each argument as URL
    for url in "$@"; do
        download_audio "$url"
    done
fi

# Completion message
if [ $? -eq 0 ]; then
    echo -e "\\n\\nCompleted without errors. Files downloaded to: $base_dir/yt-dlp"
else
    echo -e "\\n\\nAn error occurred during the download process."
fi