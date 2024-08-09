#!/bin/bash
LOGFILE="/home/einfochips/Documents/system_check.log"
DATE=$(date "+%Y-%m-%d %H:%M:%S")

echo "$DATE - Starting system status check..." >> $LOGFILE

# Disk Usage
echo "$DATE - Checking disk usage..." >> $LOGFILE
if df -h >> $LOGFILE 2>&1; then
    echo "$DATE - Disk usage checked successfully." >> $LOGFILE
else
    echo "$DATE - Error checking disk usage." >> $LOGFILE
fi
echo "" >> $LOGFILE

# Memory Usage
echo "$DATE - Checking memory usage..." >> $LOGFILE
if free -h >> $LOGFILE 2>&1; then
    echo "$DATE - Memory usage checked successfully." >> $LOGFILE
else
    echo "$DATE - Error checking memory usage." >> $LOGFILE
fi
echo "" >> $LOGFILE

# CPU Load
echo "$DATE - Checking CPU load..." >> $LOGFILE
if uptime >> $LOGFILE 2>&1; then
    echo "$DATE - CPU load checked successfully." >> $LOGFILE
else
    echo "$DATE - Error checking CPU load." >> $LOGFILE
fi
echo "" >> $LOGFILE
