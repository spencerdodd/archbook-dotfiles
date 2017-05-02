#!/usr/bin/env sh

# Terminate running bar instances
killall -q polybar

# Wait until the instances have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
polybar -c ~/.config/polybar/.polybar top &
polybar -c ~/.config/polybar/.polybar bottom &

echo "Bars launched ..."
