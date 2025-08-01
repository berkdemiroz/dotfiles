#!/bin/bash

# The script takes the max value as the first argument,
# and the command to execute as the rest of the arguments.
MAX_VALUE=16
shift

# A temporary file to store the current value
STATE_FILE="/tmp/hypr-cycle.state"

# Read the current value, or default to 0 if the file doesn't exist
if [ -f "$STATE_FILE" ]; then
  current_value=$(cat "$STATE_FILE")
else
  current_value=0
fi

# Increment the value and loop back to 1 if it exceeds the max
# We use the modulo operator for a clean one-liner
next_value=$(((current_value % MAX_VALUE) + 1))

# Save the new value for the next run
echo "$next_value" >"$STATE_FILE"

CURSOR_POS=$(hyprctl cursorpos | awk -F', ' -v scale="$(hyprctl monitors | grep 'scale:' | awk '{print $2}' | head -n 1)" '{printf "%.0f,%.0f\n", $1*scale, $2*scale}') 
echo $CURSOR_POS
# Execute the command with the new value as the final parameter
WALLPAPER="${HOME}/Pictures/Wallpapers/resized-aspect-preserved/${next_value}.jpg"
swww img $WALLPAPER --invert-y --transition-type grow --transition-duration 1.5 --transition-fps 60 --transition-pos $CURSOR_POS
hyprpanel sw $WALLPAPER
