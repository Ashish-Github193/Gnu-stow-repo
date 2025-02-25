#!/bin/bash

# Default interval (if not provided)
interval=${1:-600}  # Takes first argument, defaults to 600 seconds (10 min)

while true; do
    LOCATION="28.642691,77.059727"  # Your specific coordinates
    weather=$(curl -s "wttr.in/${LOCATION}?format=1")

    # Extract everything after the first space and trim leading spaces
    data=$(echo "$weather" | cut -d' ' -f2- | xargs)

    echo "$data"
    sleep "$interval"
done

