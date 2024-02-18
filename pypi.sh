#!/bin/bash

# Specify the path to the file containing the list of packages
PACKAGE_LIST_FILE="package_list.txt"

# Specify the directory where you want to save the downloaded packages
TARGET_DIR="/path/to/your/directory"

# Check if the package list file exists
if [ ! -f "$PACKAGE_LIST_FILE" ]; then
    echo "Package list file '$PACKAGE_LIST_FILE' not found."
    exit 1
fi

# Loop through each line in the package list file
while IFS= read -r line; do
    # Skip empty lines and lines starting with '#'
    if [ -z "$line" ] || [ "${line:0:1}" == "#" ]; then
        continue
    fi

    # Extract package name and version from the line
    PACKAGE_INFO=($line)
    PACKAGE_NAME="${PACKAGE_INFO[0]}"
    PACKAGE_VERSION="${PACKAGE_INFO[1]}"

    # Use pip to download the specified package version
    pip download "${PACKAGE_NAME}==${PACKAGE_VERSION}" -d "${TARGET_DIR}"
done < "$PACKAGE_LIST_FILE"
