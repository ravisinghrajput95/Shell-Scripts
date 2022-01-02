#!/bin/bash

# This script will display the Top most visited URL from the access log of a webserver.

# Provide the log file as a positional parameter at the runtime.
log_file="${1}"

# Validate if the file exists.

if [[ ! -e "${log_file}" ]]
 then
   echo "${log_file} doesn't exist, supply a valid filename" >&2
   exit 1
fi

# Top 5 most visited URLs from the access log a webserver
cut -d " " -f 7 ${log_file} | sort | uniq -c | sort -n | tail -5

