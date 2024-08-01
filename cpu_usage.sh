#!/bin/bash
# Script for checking the cpu usage

# Set variables
threshold=80
current_cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
# Check if CPU usage is over the threshold
if (( $(echo "$current_cpu_usage > $threshold" |bc -l) ));
then
	echo "CPU usage is over the threshold of $threshold%"
# Send email notification to sysadmin
	echo -e "Subject: High CPU usage\n\nWarning: High CPU usage on $(hostname) - $current_cpu_usage%" | mailx yourmail@gmail.com

else
	echo "CPU usage under control!"
fi
