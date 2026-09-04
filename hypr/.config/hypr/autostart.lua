-- autostart
hl.on("hyprland.start", function ()
    -- important dameons
    hl.exec_cmd("mako")
    hl.exec_cmd("waybar")
    hl.exec_cmd("awww-daemon")
    hl.exec_cmd("wl-paste --watch cliphist store")
    hl.exec_cmd("/usr/libexec/hyprpolkitagent")
end)
