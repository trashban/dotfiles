#!/bin/bash

wallpaper_dir="$HOME/Pictures/Wallpapers/"
monitor_choice=$(niri msg outputs | sed -n 's/.*(\(.*-[0-9]\)).*/\1/p' | rofi -dmenu -p "Select monitor ")
if [[ -z "$monitor_choice" ]]; then
    exit 1
fi

wallpaper_choice=$(cd "$wallpaper_dir" && find . -type f -printf '%P\n' | rofi -dmenu -p "Select a wallpaper ")

if [[ -n "$wallpaper_choice" ]]; then
    notify-send -t 3000 "Wallpaper changed to $wallpaper_choice."

    # set wallpaper
    swww img -o "$monitor_choice" "$wallpaper_dir/$wallpaper_choice"

    # create unique temp file for each monitor
    temp_file="$HOME/Pictures/temp-${monitor_choice}.jpg"

    magick "$wallpaper_dir/$wallpaper_choice" -gaussian-blur 0x5 "$temp_file"
    swww img -o "$monitor_choice" -n overlay "$temp_file"
fi
