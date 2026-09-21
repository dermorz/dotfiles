#!/bin/bash

INTERNAL="eDP-1"
EXTERNAL="DP-2"

manage_workspaces() {
    if swaymsg -t get_outputs | grep -q "$EXTERNAL"; then
        swaymsg workspace 1 output "$EXTERNAL"
        swaymsg workspace 2 output "$EXTERNAL"
        swaymsg workspace 3 output "$EXTERNAL"
        swaymsg workspace 4 output "$EXTERNAL"
    else
        swaymsg workspace 1 output "$INTERNAL"
        swaymsg workspace 2 output "$INTERNAL"
        swaymsg workspace 3 output "$INTERNAL"
        swaymsg workspace 4 output "$INTERNAL"
    fi
}

# Call the function to set workspaces
manage_workspaces
