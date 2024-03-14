#!/bin/bash

# Ask for the path where the zip files are located
read -p "Enter the path where the zip files are located: " zip_path

# Check if the directory exists
if [ ! -d "$zip_path" ]; then
    echo "Error: Directory '$zip_path' does not exist."
    exit 1
fi

# Change to the directory containing the zip files
cd "$zip_path" || exit

# Loop through each .zip file in the directory
for file in *.zip; do
    # Extract the filename without the extension to use as folder name
    folder="${file%.zip}"
    
    # Create a folder with the same name as the zip file
    mkdir -p "$folder"
    
    # Indicate which zip file is being decompressed
    echo "Decompressing $file into $folder..."
    
    # Unzip the file into the newly created folder
    unzip -q "$file" -d "$folder"
done
