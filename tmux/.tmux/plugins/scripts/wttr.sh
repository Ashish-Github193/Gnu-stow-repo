#!/bin/bash

interval=${1:-600}  # Takes first argument, defaults to 600 seconds (10 min)
LOCATION="28.637994,77.062526"
MAX_LEN=60
last_good="wx: …"

# Emit placeholder immediately so the status slot isn't blank during the first fetch
echo "$last_good"

while true; do
    weather=$(curl -sf --max-time 5 "wttr.in/${LOCATION}?format=%c%t+%w" 2>/dev/null)
    # Keep only the first line so multi-line error pages can't overflow the status bar
    weather="${weather%%$'\n'*}"
    # wttr.in injects a literal space after %c — drop the first space to glue icon to temp
    weather="${weather/ /}"
    # Validate: non-empty and no HTML markup
    if [ -n "$weather" ] && ! printf '%s' "$weather" | grep -q '[<>]'; then
        # Truncate defensively in case wttr returns something unexpectedly long
        last_good="${weather:0:$MAX_LEN}"
    fi
    echo "$last_good"
    sleep "$interval"
done
