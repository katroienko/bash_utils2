#!/bin/bash

backup_dirs=("/home/ec2-user")
backup_location="/tmp/backup_mch"

mkdir -p "$backup_location"

for dir in "${backup_dirs[@]}"; do
	backup_file="$backup_location/$(basename "$dir")_backup_$(date +%Y-%m-%d).tar.gz"
	tar -czf "$backup_file" "$dir"
done

find "$backup_location" -maxdepth 1 -type f -name "*.tar.gz" -mtime +21 -delete
