#!/bin/bash

# Variables
PART_DIR="./cam/"
PART_PREFIX="miuicamera-rubyx"
OUTPUT_FILE="miuicamera-rubyx.zip"
OUTPUT_DIR="../../../vendor/xiaomi/miuicamera-rubyx/proprietary/system_ext/priv-app/MiuiCamera"

# Check if all parts exist
for i in {1..4}; do
  if [ ! -f "${PART_DIR}${PART_PREFIX}.${i}.zip" ]; then
    echo "Error: ${PART_DIR}${PART_PREFIX}.${i}.zip does not exist."
    exit 1
  fi
done

# Concatenate the parts into one zip file
cat "${PART_DIR}${PART_PREFIX}".{1..3}.zip > "$OUTPUT_FILE"

# Create the output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Extract the APK file
unzip "$OUTPUT_FILE" -d "$OUTPUT_DIR"

# Clean up the concatenated zip file
rm "$OUTPUT_FILE"

echo "Extraction completed. Files are located in $OUTPUT_DIR:"
ls -l "$OUTPUT_DIR"
