interval=${1:-600}  # Takes first argument, defaults to 600 seconds (10 min)

while true; do
    LOCATION="28.6426915,77.0596662"  # Your specific coordinates
    weather=$(curl -s "wttr.in/${LOCATION}?format=%t+%w+%C")
    echo "$weather"
    sleep "$interval"
done
