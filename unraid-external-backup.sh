#!/bin/bash

# Set to "yes" for a dry run backup. Change to "no" for a real backup
dry_run="yes"

# Server Shares
nextcloud_users=("michael" "brittany" "carter" "carson" "conner")
nextcloud_path="/mnt/user/nextcloud"
unraid_path="/mnt/user"
shares=("backups" "games" "michael")

# External Drive Path
external_drive="/mnt/disks/WD-WCC4E7HAKXUC"

#declare -a nextcloud_users

# Backing up Nextcloud User Data
for user in "${nextcloud_users[@]}"; do
    if [ "${dry_run}" != "yes" ]; then
        rsync -avh --delete "${nextcloud_path}/${user}/files" "${external_drive}"
    else
        rsync --dry-run -avh --delete "${nextcloud_path}/${user}/files" "${external_drive}"
    fi
done

# Backing up Additional Shares
for share in ${shares[@]}; do
    if [ "${dry_run}" != "yes" ]; then
        rsync -avh --delete "${unraid_path}/${share}" "${external_drive}"
    else
        rsync --dry-run -avh --delete "${unraid_path}/${share}" "${external_drive}"
    fi
done