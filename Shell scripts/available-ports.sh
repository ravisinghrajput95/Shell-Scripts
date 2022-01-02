#!/bin/bash

# This script will show the list of the available ports on the system.
echo "==================Below are the available TCP ports on the system======================"
netstat -lntp  | grep ":" | awk '{print$4}' | awk -F ":" '{print$NF}' | sort -n | uniq
