#!/bin/bash
source .env

THRESHOLD=80
WEBHOOK_URL=$DISCORD_WEBHOOK_URL
HOSTNAME=${hostname)

#parse the data
DISK_USAGE=$(df / | awk 'NR==2 {print $5}' | tr -d '%')
MEM_USAGE=$(free | awk '/Mem:/ {print int($3/$2 * 100)}')
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $8}' | awk -F. '{print 100 - $1}')

MESSAGE=""

#comparison Logic
if [ "$DISK_USAGE" -gt "$THRESHOLD" ]; then
	MESSAGE="${MESSAGE} ALERT: High Disk usage on $HOSTNAME: ${DISK_USAGE}% \n"
fi

if [ "$MEM_USAGE" -gt "$THRESHOLD" ]; then
	MESSAGE="${MESSAGE} ALERT: High memory usage on $HOSTNAME: ${MEM_USAGE}% \n"
fi

if [ "$CPU_USAGE" -gt "$THRESHOLD" ]; then
	MESSAGE="${MESSAGE} ALERT: High CPU usage on $HOSTNAME: ${CPU_USAGE}% \n"
fi



