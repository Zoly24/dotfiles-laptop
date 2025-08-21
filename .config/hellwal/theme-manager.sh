#!/bin/bash

# Script for managing themes using wallpaper

# Wallpaper directory
WALLPAPER_DIR="$HOME/Pictures/Wallpapers"
TEMPLATES_DIR="$HOME/.config/hellwal/templates/"
OUTPUT_DIR="$HOME/.config/hellwal/generated/"

# --- Functions ---

run_picker() {
    find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" -o -name "*.gif" \) |
        sed "s|^$WALLPAPER_DIR/||" |
        rofi -dmenu -i -p "Select Wallpaper" |
        xargs -r -I {} "$0" "$WALLPAPER_DIR"/{}
}

# Function to reload all applications
reload_apps() {
    hyprctl reload

    killall waybar
    waybar &

    kitty @ set-colors -a "$OUTPUT_DIR/kitty.conf" &

    killall rofi
}

# --- Main Logic ---

# Check if a wallpaper path was provided.
if [ -z "$1" ]; then
    echo "Launching Rofi..."
    run_picker
else
    WALLPAPER_PATH="$1"

    if [ ! -f "$WALLPAPER_PATH" ]; then
        echo "ERROR: $WALLPAPER_PATH not found"
        exit 1
    fi

    swww img --transition-type wipe --transition-duration 1.5 --transition-fps 240 --transition-angle 30 --transition-step 200 "$WALLPAPER_PATH"

    hellwal -i "$WALLPAPER_PATH" -f "$TEMPLATES_DIR" -o "$OUTPUT_DIR" --bright-offset 0.1 --check-contrast

    reload_apps

    echo "All themes applied."
fi
