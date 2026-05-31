#!/usr/bin/env sh

# note: XX in inputXX is specific to keyboard
# either replace inputXX with correct number
# or juse use * which may cause multiple inputs

led=/sys/class/leds/input*::capslock/brightness

show() {
    status=$(cat "$led")

    case "$status" in
        1) printf 'capslock on!\n' ;;
        *) printf '\n' ;;
    esac
}

old=
while :; do
    new=$(cat "$led")

    if [ "$new" != "$old" ]; then
        show
        old=$new
    fi

    sleep 0.5
done
