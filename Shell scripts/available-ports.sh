#!/bin/bash

# this script will show the list of the available TCPv4 and TCPv6 ports on the system.
echo "==================Below are the available TCPv4 ports on the system======================"
netstat -lntp  | grep ":" | awk '{print$4}' | awk -F ":" '{print$NF}'
