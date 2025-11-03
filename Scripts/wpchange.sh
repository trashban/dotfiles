#!/bin/bash

# default location to search for wallpapers
wallpaper_dir="$HOME/Pictures/Wallpapers/"

# replace niri msg outputs with your compositor
monitor_options=$(niri msg outputs | sed -n 's/.*(\(.*-[0-9]\)).*/\1/p')

# count number of monitors available
monitor_num=$(echo "$monitor_options" | wc -l)
monitor_choice=

# if only one output, then skip prompting
if [[ "$monitor_num" == 1 ]]; then
    monitor_choice="$monitor_options"
else
    monitor_choice=$(echo "$monitor_options" | rofi -dmenu -p "Select a monitor ")
fi

# if no output selected, then quit
if [[ -z "$monitor_options" ]]; then
    exit 1
fi

# list and select a wallpaper from $wallpaper_dir
wallpaper_choice=$(cd "$wallpaper_dir" && find . -type f -printf '%P\n' | rofi -dmenu -p "Select a wallpaper ")

# if no wallpaper was selected then skip
if [[ -n "$wallpaper_choice" ]]; then
    notify-send -t 3000 "Wallpaper changed to $wallpaper_choice."

    # set main niri wallpaper
    swww img --transition-duration 1 --transition-fps 60 -f CatmullRom -o "$monitor_options" "$wallpaper_dir/$wallpaper_choice"

    # create a temp file to hold a blurred version for each monitor
    temp_file="$HOME/Pictures/temp-${monitor_options}.jpg"

    # blur - expensive! look into not using gaussian-blur if important
    magick "$wallpaper_dir/$wallpaper_choice" -gaussian-blur 0x5 "$temp_file"

    # set niri overview overlay wallpaper to the same one
    swww img -o "$monitor_options" -n overlay "$temp_file"
fi
