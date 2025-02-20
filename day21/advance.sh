#!/bin/bash
LOG_DIR="/var/log"
ARCHIVE_DIR="/home/einfochips/Documents/logs"
MAX_LOG_AGE=30 
LOG_SIZE_LIMIT=10000000 
ERROR_LOG="/var/log/log_management_error.log"
INFO_LOG="/var/log/log_management.log"
mkdir -p "$ARCHIVE_DIR"
rotate_logs() {
    echo "Starting log rotation..." >> "$INFO_LOG"
    for log_file in "$LOG_DIR"/*.log; do
        if [ -f "$log_file" ]; then
            if [ $(stat -c%s "$log_file") -gt $LOG_SIZE_LIMIT ]; then
                timestamp=$(date +'%Y%m%d%H%M%S')
                mv "$log_file" "$ARCHIVE_DIR/$(basename "$log_file")-$timestamp"
                gzip "$ARCHIVE_DIR/$(basename "$log_file")-$timestamp"
                echo "Log file $(basename "$log_file") rotated and compressed." >> "$INFO_LOG"
            fi
        fi
    done
}
delete_old_logs() {
    echo "Starting deletion of old logs..." >> "$INFO_LOG"
    find "$ARCHIVE_DIR" -type f -mtime +$MAX_LOG_AGE -exec rm {} \;
    echo "Old logs deleted." >> "$INFO_LOG"
}
show_archived_logs() {
    echo "Listing archived logs:"
    ls -lh "$ARCHIVE_DIR"
}
check_directories() {
    if [ ! -d "$LOG_DIR" ]; then
        echo "Error: Log directory $LOG_DIR does not exist." >&2
        exit 1
    fi

    if [ ! -d "$ARCHIVE_DIR" ]; then
        echo "Error: Archive directory $ARCHIVE_DIR does not exist." >&2
        exit 1
    fi
}
{
    check_directories
    rotate_logs
    delete_old_logs
    show_archived_logs
} || {
    echo "An error occurred during log management." >> "$ERROR_LOG"
    exit 1
}