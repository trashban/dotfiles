#!/bin/bash

wallpaper_dir=$HOME/Pictures/Wallpapers/
wallpaper_choice=$(cd $wallpaper_dir && ls | rofi -dmenu -p "Select a wallpaper")

# if an option was actually selected
if [[ "$(swww query | awk -F "Wallpapers/" '{print $2}')" == "$wallpaper_choice" ]]
then 
    notify-send -t 3000 "Same wallpaper selected."
elif [[ $wallpaper_choice != "" ]] 
then
    notify-send -t 3000 "Wallpaper changed to $wallpaper_choice."
    swww img $wallpaper_dir/$wallpaper_choice
fi

