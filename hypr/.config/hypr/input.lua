-- input

hl.config({
    input = {
        kb_layout  = "us",
        kb_options = "caps:escape",
        follow_mouse = 1,
        sensitivity = 0,
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})
