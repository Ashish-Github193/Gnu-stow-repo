#!/bin/bash

# Default interval (if not provided)
interval=1

# Parse keyword argument (--interval=N)
for arg in "$@"; do
    case $arg in
        --interval=*) interval="${arg#*=}" ;;
    esac
done

# Continuous temperature monitoring
while true; do
    sensors | grep "Tctl" | awk '{print $2}'
    sleep "$interval"
done

