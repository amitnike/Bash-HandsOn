#!/bin/bash
# Description: Finds all .jpeg files in a directory and converts them to .png.
# Prerequisite: sudo apt install imagemagick

# Create a fake directory of images for our lab
mkdir -p image_lab
touch image_lab/img_01.jpeg image_lab/img_02.jpeg image_lab/family_photo.jpeg

echo "Starting batch image conversion..."

# Check if ImageMagick's 'convert' command is installed
if ! command -v convert &>/dev/null; then
    echo -e "\nImageMagick is not installed... installing"
    if sudo apt update && sudo apt install -y imagemagick; then
        echo "ImageMagick installed successfully."
    else
        echo "Failed to install ImageMagick. Please install manually:"
        echo "  sudo apt update && sudo apt install imagemagick"
        exit 1
    fi
fi

# The 'for' loop iterates over the output of the 'find' command
for IMG_FILE in $(find image_lab -name "*.jpeg"); do
    # Get the filename without the extension
    BASENAME=$(basename "$IMG_FILE" .jpeg)

    echo "  -> Converting $IMG_FILE to image_lab/${BASENAME}.png..."

    # Use the 'convert' utility from ImageMagick
    if convert "$IMG_FILE" "image_lab/${BASENAME}.png"; then
        echo "  -> Conversion successful: ${BASENAME}.png"
    else
        echo "  -> Conversion failed for $IMG_FILE"
    fi
done

echo "Conversion complete."
ls image_lab