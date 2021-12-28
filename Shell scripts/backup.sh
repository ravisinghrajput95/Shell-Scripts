#!/bin/bash
  
#This script will take backup of the supplied file and will log the activity.

#Below function will send a message to syslog
function log {
  local message="${@}"
  logger -t ${0} "${message}"
}

#Below function will take the backup of the supplied file
function backup {
  echo 'Please enter the file name'
  read File
  if [[ -f "${File}" ]]
  then
    echo 'File exists, ready to take the backup'
    local backup_file="/var/tmp/$(basename ${File}).$(date +%F-%N)"
    log "Backing up ${File} to ${backup_file}."
    echo 'taking the file backup'
    cp -p ${File} ${backup_file}
    else
      return  1
  fi
}

backup

#Make the descision based on the exit status
if [[ "${?}" -eq '0' ]]
then
  log "${File} Backup completed"
  echo 'Backup completed'
else
  log "${File} Backup Failed"
  echo 'Backup failed'
  exit 1
fi
