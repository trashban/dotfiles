# .xintrc amby

# merge xorg resources
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# keybind manager
xbindkeys

# clipboard
greenclip daemon &

# wallpaper
feh --bg-scale /home/amby/photos/wallpapers/blue2.jpg

# bar + window manager
slstatus &
exec dwm
