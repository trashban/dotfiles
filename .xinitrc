# .xintrc amby

# merge xorg resources
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# keybind manager
xbindkeys

# clipboard
clipmenud &

# wallpaper
feh --bg-scale /home/amby/photos/wallpapers/darkmountain.jpg

# bar + window manager
slstatus &
exec dwm
