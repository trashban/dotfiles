-- window/layer rules

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name           = "suppress-maximize-events",
    match          = { class = ".*" },
    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    -- Fix some dragging issues with XWayland
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
hl.window_rule({
    match = { class = "discord" },
    workspace = "10"
})

hl.workspace_rule({
    workspace = "10",
    on_created_empty = "discord",
    layout = "scrolling",
    monitor = "HDMI-A-1",
    default = true
})

-- confine game cursors to stop unintentional escaping
hl.window_rule({
    match = {
        class = "^(steam_app_\\d+|cyberpunk2077\\.exe|cs2|minecraft)$"
    },
    content = "game"
})

hl.window_rule({
    match = {
        content = "game",
        fullscreen = true
    },
    confine_pointer = true,
    immediate = true,
    no_blur = true
})
