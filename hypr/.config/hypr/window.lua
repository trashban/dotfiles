-- window/layer rules

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name           = "suppress-maximize-events",
    match          = { class = ".*" },
    suppress_event = "maximize",
})
suppressMaximizeRule:set_enabled(true)

hl.window_rule({
    name     = "fix-xwayland-drags",
    match    = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})

hl.window_rule({
    name = "floating controls",
    match = {
        class = "(wiremix||org.pulseaudio.pavucontrol||yazi)"
    },
    float = true,
    size = { "monitor_w * 0.5", "monitor_h * 0.5" }
})

-- open and keep discord on workspace 10
hl.workspace_rule({
    workspace = "10",
    layout = "scrolling",
    monitor = "HDMI-A-1",
    default = true
})

hl.window_rule({
    match = { class = "discord" },
    workspace = "10"
})

-- make steam popups floating, main window tiling
hl.window_rule({
    match = { class = "steam" },
    center = true,
    float = true
})

hl.window_rule({
    match = {
        class = "steam",
        title = "^Steam$"
    },
    float = false
})

-- confine game cursors to stop unintentional escaping
hl.window_rule({
    match = {
        class = "^(steam_app_\\d+|cyberpunk2077\\.exe|cs2|minecraft|hl_\\d+|osu)$"
    },
    content = "game"
})

hl.window_rule({
    match = {
        content = "game",
    },
    fullscreen = true,
    monitor = "DP-2",
    confine_pointer = true,
    immediate = true,
    no_blur = true
})
function hl.setup_vkfix()
    if hl.plugin.csgo_vulkan_fix ~= nil then
        hl.plugin.csgo_vulkan_fix.vkfix_app({ app = "cs2", w = 1280, h = 960 })
        hl.config({
            plugin = {
                csgo_vulkan_fix = {
                    fix_mouse = false
                }
            }
        })
    end
end
