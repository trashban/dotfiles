#!/bin/bash

wallpaper_dir=$HOME/Pictures/Wallpapers/

# get current niri focused output
monitor_choice=$(niri msg focused-output | sed -n 's/.*(\([^)]*\)).*/\1/p;q')
wallpaper_choice=$(cd $wallpaper_dir && find . -type f -printf '%P\n' | rofi -dmenu -p "Select a wallpaper")

# if an option was actually selected
if [[ "$(swww query | awk -F "Wallpapers/" '{print $2}')" == $wallpaper_choice ]]
then 
    notify-send -t 3000 "Same wallpaper selected."
elif [[ $wallpaper_choice != "" ]] 
then
    notify-send -t 3000 "Wallpaper changed to $wallpaper_choice."
    swww img -o $monitor_choice $wallpaper_dir/$wallpaper_choice
    magick $wallpaper_dir$wallpaper_choice -gaussian-blur 0x5 $wallpaper_dir/temp.jpg
    swww img -o $monitor_choice -n overlay $wallpaper_dir/temp.jpg
fi
