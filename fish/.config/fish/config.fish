if status is-interactive
    zoxide init fish | source
    set fish_cursor_default underscore
    alias cat bat
    alias ls lsd
    alias lst "lsd --tree"
    function y
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        yazi $argv --cwd-file="$tmp"
        glow ~/todo.md
        if read -z cwd <"$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
            builtin cd -- "$cwd"
        end
        rm -f -- "$tmp"
    end
    pfetch
end
