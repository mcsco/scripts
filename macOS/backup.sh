#!/bin/zsh

SOURCE_DIRECTORIES=(
    "$HOME/Documents"
    "$HOME/Downloads"
)

# External drive mount name (e.g., "MyBackupDrive")
DEST_DRIVE_NAME="SSK Media"
DEST_MOUNT_PATH="/Volumes/$DEST_DRIVE_NAME"

# Destination backup folder on the drive
DEST_BACKUP_PATH="$DEST_MOUNT_PATH"

LOG_FILE="$HOME/backup_log.txt"
echo "$(date): Script triggered by launchd" >> "$LOG_FILE"

# Wait up to 15 seconds for drive to be available
for i in {1..15}; do
    if [ -d "$DEST_MOUNT_PATH" ]; then
        echo "$(date): Drive mounted at $DEST_MOUNT_PATH" >> "$LOG_FILE"
        break
    fi
    sleep 1
done

# If drive is still not available, exit
if [ ! -d "$DEST_MOUNT_PATH" ]; then
    echo "$(date): Drive not mounted. Backup aborted." >> "$LOG_FILE"
    exit 1
fi

mkdir -p "$DEST_BACKUP_PATH"

for SRC in "${SOURCE_DIRECTORIES[@]}"; do
    DEST_FOLDER="$DEST_BACKUP_PATH/$(basename "$SRC")"
    echo "$(date): Backing up $SRC to $DEST_FOLDER" >> "$LOG_FILE"
    rsync -avh \
        --exclude=".DS_Store" \
        --exclude="._*" \
        --exclude=".Spotlight-V100" \
        --exclude=".Trashes" \
        --exclude=".fseventsd" \
        --exclude=".localized" \
        "$SRC/" "$DEST_FOLDER/" >> "$LOG_FILE" 2>&1
done

echo "$(date): Backup complete." >> "$LOG_FILE"
