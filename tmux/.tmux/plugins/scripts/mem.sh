#!/bin/bash

# Default interval (if not provided)
interval=1

# Parse keyword argument (--interval=N)
for arg in "$@"; do
    case $arg in
        --interval=*) interval="${arg#*=}" ;;
    esac
done

# Continuous memory usage monitoring
while true; do
    usage=$(free | awk '/^Mem:/ {printf "%.1f", $3/$2 * 100}')
    echo "M: $usage%"
    sleep "$interval"
done
