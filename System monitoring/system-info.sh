#!/bin/bash

#CPU utilization

CPU_USAGE=$(top -b -n2 -p 1 | fgrep "Cpu(s)" | tail -1 | awk -F'id,' -v prefix="$prefix" '{ split($1, vs, ","); v=vs[length(vs)]; sub("%", "", v); printf "%s%.1f%%\n", prefix, 100 - v }')
DATE=$(date "+%Y-%m-%d %H:%M:")
CPU_USAGE="$DATE CPU: $CPU_USAGE"
if [ $? = 0 ]
then
echo $CPU_USAGE>> /tmp/system-info
fi

#Memory usage

free -m | awk 'NR==2{printf "Memory Usage: %s/%sMB (%.2f%%)\n", $3,$2,$3*100/$2 }' | while read line
do echo $line
if [ $? = 0 ]
then
echo $line >> /tmp/system-info
fi
done

#Disk space status

df -h | awk '$NF=="/"{printf "Disk Usage: %d/%dGB (%s)\n", $3,$2,$5}' | while read disk
do echo $disk
if [ $? = 0 ]
then
echo $disk >> /tmp/system-info
fi
done


#Running processes

ps | while read processes
do echo $processes
if [ $? = 0 ]
then
echo $processes >> /tmp/system-info
fi
done


#Network activity Bmon slurm

sudo apt install ifstat
ifstat -tTS | while read network_activity
do echo $network_activity
if [ $? = 0 ]
then
echo $network_activity >> /tmp/system-info
fi
done