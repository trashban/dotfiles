# .xintrc amby

# merge xorg resources
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# keybind manager
xbindkeys

# clipboard
greenclip daemon &

# wallpaper
feh --bg-scale /home/amby/photos/wallpapers/forest.jpg

# bar + window manager
slstatus &
exec dwm
