#!/bin/bash

# Set the threshold for disk usage (in percentage)
THRESHOLD=50

# Get current disk usage


DISK_USAGE=$(df -h | grep "C:"| awk '{ print $6 }' | tr '%' ' ')
#echo $DISK_USAGE


if [[ $DISK_USAGE -gt $THRESHOLD ]]; then
    # Send alert (replace with your notification method)
    echo "ALERT: Disk usage exceeded $THRESHOLD% - Current usage: $DISK_USAGE%" 
else
    echo "Disk usage is within the threshold: $DISK_USAGE%"
fi
