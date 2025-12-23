#!/usr/bin/env bash

### trashban's wallpaper bash script

### NOTE:
### - this script is written terribly don't bother
### - setup assumes either niri or hyprland (compositor), swww (wallpaper setter) and rofi (selector)

### GLOBAL VARIABLES

# directory to search for wallpapers 
wallpaper_dir="$HOME/Pictures/Wallpapers/"

# location to keep temporary files (stuff like blurred wallpapers)
temp_dir="$HOME/Pictures/Temp/"

# checks whether hyprland or niri is running
# if pgrep -x niri >/dev/null 2>&1; then
#     compositor="niri"
# elif pgrep -x Hyprland >/dev/null 2>&1; then
#     compositor="hyprland"
# else
#     echo "neither niri nor hyprland running"
#     exit 1
# fi

# grab monitor options
get_monitor_outputs() {
    if [[ "$compositor" == "niri" ]]; then 
        niri msg outputs | sed -n 's/.*(\(.*-[0-9]\)).*/\1/p'
    else
        hyprctl monitors | awk '/^Monitor/ { print $2 }' 
    fi
}
monitor_options=$(get_monitor_outputs)

# if only one output, then skip prompting to select output
if [[ $(echo "$monitor_options" | wc -l) -eq 1 ]]; then
    monitor_choice="$monitor_options"
else
    monitor_choice=$(echo "$monitor_options" | rofi -dmenu -p "Select a monitor ")
fi

# if no output selected, then quit
if [[ -z "$monitor_choice" ]]; then
    exit 1
fi

# list and select a wallpaper from $wallpaper_dir
wallpaper_choice=$(cd "$wallpaper_dir" && find . -type f -printf '%P\n' | rofi -dmenu -p "Select a wallpaper ")

# if no wallpaper was selected then skip
if [[ -n "$wallpaper_choice" ]]; then
    # set notifcation of wallpaper change
    # notify-send -t 3000 "Wallpaper changed to $wallpaper_choice."

    # set background wallpaper
    swww img --transition-duration 1 --transition-fps 60 -f CatmullRom -o "$monitor_choice" "$wallpaper_dir/$wallpaper_choice"

    # if niri, set overview background to blurred version
    if [[ "$compositor" == "niri" ]]; then 
        # create a temp file to hold a blurred version for each monitor
        temp_file="$temp_dir/temp-${monitor_choice}.jpg"

        # blur - expensive! look into not using gaussian-blur if important
        magick "$wallpaper_dir/$wallpaper_choice" -gaussian-blur 0x5 "$temp_dir$temp_file"

        # set niri overview overlay wallpaper to the same one
        swww img -o "$monitor_choice" -n overlay "$temp_file"
    fi
fi
