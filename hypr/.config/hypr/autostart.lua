-- autostart
hl.on("hyprland.start", function ()
    -- important dameons
    hl.exec_cmd("mako")
    hl.exec_cmd("waybar")
    hl.exec_cmd("awww-daemon")
    hl.exec_cmd("wl-paste --watch cliphist store")
    hl.exec_cmd("wl-paste --watch cliphist store")
    hl.exec_cmd("/usr/libexec/hyprpolkitagent")

    -- not important at all
    hl.exec_cmd("gsr-ui launch-hide-announce")
    hl.exec_cmd("steam")
    hl.exec_cmd("discord")
end)
