#!/bin/bash

# This is a bash script for backing up all csv files from source directory to destination

read -p "Enter the source directory to be backed up: " SOURCE_DIR
read -p "Enter the destination directory for backups: " BACKUP_DIR

# Check if the source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Source directory does not exist"
    exit 1
fi

# Check if the backup directory exists, if not, creates it
if [ ! -d "$BACKUP_DIR" ]; then
    mkdir -p "$BACKUP_DIR"
fi

# Backing up all text files in the source directory to the backup directory
for file in "$SOURCE_DIR"/*.csv; do
    filename=$(basename "$file")
    cp "$file" "$BACKUP_DIR/$filename"
    echo "Backed up $filename"
done

# Verifying if the backup was successful
if [ $? -eq 0 ]; then
    echo "Text file backup completed"
else
    echo "Text file backup failed"
fi

