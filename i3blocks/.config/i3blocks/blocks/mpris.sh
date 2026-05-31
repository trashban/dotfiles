#!/usr/bin/env sh

show() {
    status=$(playerctl status 2>/dev/null) || {
        printf '\n'
        return
    }

    case "$status" in
        Playing) printf 'playing\n' ;;
        Paused)  printf 'paused\n' ;;
        *)       printf '\n' ;;
    esac
}

playerctl --follow status 2>/dev/null |
while read -r _; do
    show
done &

show

while read -r button; do
    case "$button" in
        1) playerctl play-pause ;;
        2) playerctl previous ;;
        3) playerctl next ;;
    esac

    show
done
