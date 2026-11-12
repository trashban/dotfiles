-- autostart

local hostname = os.execute("uname -n")
local laptop_name = "zephyr"

hl.on("hyprland.start", function ()
    -- important dameons
    hl.exec_cmd("mako")
    hl.exec_cmd("waybar")
    hl.exec_cmd("awww-daemon")
    hl.exec_cmd("wl-paste --watch cliphist store")
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    hl.exec_cmd("hypridle")

    -- not important at all
    if hostname ~= laptop_name then
        hl.exec_cmd("gsr-ui launch-hide-announce")
        hl.exec_cmd("steam")
        hl.exec_cmd("discord", { workspace = "10 silent" })
    end
end)
