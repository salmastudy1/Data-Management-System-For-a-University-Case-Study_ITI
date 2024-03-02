#!/bin/bash

# Database credentials
DB_USER="project_case_study"
DB_PASSWORD="salma"
DB_NAME="project_case_study"

TIMESTAMP=$(date '+%Y%m%d_%H%M%S')

# Create backup using expdp (Data Pump)
expdp $DB_USER/$DB_PASSWORD DIRECTORY=data_pump_dir DUMPFILE=backup_$TIMESTAMP.dmp LOGFILE=backup_$TIMESTAMP.log

# Check if backup was successful
if [ $? -eq 0 ]; then
    echo "Database backup completed successfully."
else
    echo "Error: Database backup failed."
fi