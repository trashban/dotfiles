#!/usr/bin/env sh

show() {
    out=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ 2>/dev/null) || {
        printf '\n'
        return
    }

    vol=$(printf '%s\n' "$out" | awk '{ printf "%d", $2 * 100 }')

    case "$out" in
        *"[MUTED]"*) printf 'muted\n' ;;
        *)           printf 'vol %s%%\n' "$vol" ;;
    esac
}

show

pactl subscribe 2>/dev/null |
while read -r _; do
    show
done &

while read -r button; do
    case "$button" in
        1) pavucontrol ;;  # left click
        3) wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle ;; # right click
        4) wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%+ ;;  # scroll up
        5) wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%- ;;  # scroll down
    esac

    show
done
