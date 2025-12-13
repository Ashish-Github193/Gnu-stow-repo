#!/bin/bash

# Default interval (if not provided)
interval=1

# Parse keyword argument (--interval=N)
for arg in "$@"; do
    case $arg in
        --interval=*) interval="${arg#*=}" ;;
    esac
done

# Continuous CPU usage monitoring
while true; do
    usage=$(mpstat 1 1 | awk '/all/ {usage=100 - $NF} END {print usage}')
    echo "🧠 $usage%"
    sleep "$interval"
done

