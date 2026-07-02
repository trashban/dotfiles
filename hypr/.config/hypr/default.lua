-- default applications
return {
    terminal = "ghostty",
    browser = "firefox-bin",
    fileManager = "yazi",
    menu = "rofi -show drun",
    audio = "pavucontrol",
    wp = "~/.scripts/wp.sh",
    screenshot = "grim -g \"$(slurp -d)\" - | wl-copy",
    clipboard = "cliphist list | rofi -dmenu | cliphist decode | wl-copy"
}
