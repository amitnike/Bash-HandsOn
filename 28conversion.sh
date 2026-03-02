#!/bin/bash
set -e  # Exit immediately if any command fails

LAB_DIR="image_lab2"
IMAGE_URL="https://images.pexels.com/photos/26551174/pexels-photo-26551174/free-photo-of-kawasaki-ninja-zx-10r-on-road.jpeg"
TEMP_JPEG="$LAB_DIR/downloaded_image.jpeg"

echo "Starting download, replication, and conversion..."

# 1) Create directory
mkdir -p "$LAB_DIR"

# 2) Install prerequisites if missing
if ! command -v curl >/dev/null 2>&1; then
    echo "curl not found. Installing curl..."
    sudo apt update -y
    sudo apt install curl -y
fi

if ! command -v convert >/dev/null 2>&1; then
    echo "ImageMagick not found. Installing ImageMagick..."
    sudo apt update -y
    sudo apt install imagemagick -y
fi

# 3) Download the image
echo "Downloading image from: $IMAGE_URL"
curl -L "$IMAGE_URL" -o "$TEMP_JPEG"

if [ ! -s "$TEMP_JPEG" ]; then
    echo "Error: Download failed or file is empty."
    exit 1
fi

# 4) Create replicas: image_1.jpeg to image_4.jpeg
echo "Creating replicas: image_1.jpeg to image_4.jpeg"
for i in 1 2 3 4; do
    cp "$TEMP_JPEG" "$LAB_DIR/image_${i}.jpeg"
done

# 5) Convert replicas to PNG
echo "Converting replicas to PNG..."
for i in 1 2 3 4; do
    convert "$LAB_DIR/image_${i}.jpeg" -strip "$LAB_DIR/image_${i}.png"
done

# 6) Show final output
echo "Completed successfully. Files created in $LAB_DIR:"
ls -lh "$LAB_DIR"
