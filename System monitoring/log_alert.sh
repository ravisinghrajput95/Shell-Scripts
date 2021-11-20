#!/bin/bash
systems="ravisinghrajput005@gmail.com"

if [ -s /tmp/system-info ]
then
cat /tmp/system-info | sort | uniq | mail -s "CHECK: Syslog Errors" $systems
rm /tmp/system-info
else
fi