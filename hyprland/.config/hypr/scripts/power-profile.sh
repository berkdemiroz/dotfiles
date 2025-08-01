#!/bin/bash

# Get the current ASUS profile (e.g., "Quiet", "Balanced")
current_profile=$(asusctl profile -p | grep -oP 'Active profile is \K\w+')

# Determine the target system profile based on the ASUS profile
case "$current_profile" in
  Quiet)
    target_profile="balanced"
    ;;
  Balanced)
    target_profile="performance"
    ;;
  Performance)
    target_profile="power-saver"
    ;;
  *)
    exit 1
    ;;
esac

# Set the system profile
powerprofilesctl set "$target_profile"
current_profile=$(asusctl profile -p | grep -oP 'Active profile is \K\w+')

# Print a confirmation message
notify-send  -t 2000 "Performance Mode: $current_profile"
