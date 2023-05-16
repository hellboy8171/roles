#!/bin/bash
cpuuse=$(cat /proc/loadavg | awk '{print $3}'|cut -f 1 -d ".")
if [ "$cpuuse" -ge 90 ]; then
  echo "Server CPU usage is above threshold"
  echo "$(top -bn1 | head -20)"
else
echo "Server CPU usage is in under threshold"
  fi