-- default applications
SCRIPTS_DIR = "~/.scripts/"

return {
    terminal = "foot",
    browser = "firefox",
    fileManager = "foot --app-id=yazi yazi",
    menu = "rofi -show drun",
    audio = "foot --app-id=wiremix wiremix",
    clipboard = "cliphist list | rofi -dmenu | cliphist decode | wl-copy",

    -- custom scripts
    wp = SCRIPTS_DIR .. 'wallpaper',
    screenshot = SCRIPTS_DIR .. 'screenshot',
    colourpicker = SCRIPTS_DIR .. 'colour',
    powermenu = SCRIPTS_DIR .. 'powermenu'
}
