#!/bin/sh
# https://github.com/nicomazz/i3-polybar-config/blob/master/polybar/launch.sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
MONITORS=$(xrandr --query | grep " connected" | cut -d" " -f1)

MONITORS=$MONITORS polybar example

echo "Bars launched..."
