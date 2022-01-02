#!/bin/bash

# This script will give us the count of number of Failed login attempts from the IP address in a single day.

# Supply the syslog file as a positional parameter at the run time.
limit="10"
syslog="${1}"

# Check if the supplied file exists or not.
if [[ ! -e "${syslog}" ]]
  then
    echo "$syslog file doesn't exists, Supply a valid file" >&2
    exit 1
fi

# Check the number of times failed login activity was performed.
# If the number is greater than 10 then display the location.
grep "Failed" ${syslog} | awk '{print $(NF -3)}' | sort | uniq -c | sort -nr | while read count IP
do
  if [[ "${count}" -gt "${limit}" ]]
   then
    location=$(geoiplookup ${IP} | awk -F ', ' '{print $2}')
    echo "${count} ${IP} ${location}"
  fi
done
exit 0
