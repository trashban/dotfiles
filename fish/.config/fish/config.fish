if status is-interactive
    # source aliases
    source ~/.config/fish/alias.fish

    # vim bindings
    set -g fish_key_bindings fish_vi_key_bindings

    # let yazi perserve directory
    function y
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        yazi $argv --cwd-file="$tmp"
        if read -z cwd <"$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
            builtin cd -- "$cwd"
        end
        rm -f -- "$tmp"
    end

    pfetch

    # souce extra programs
    zoxide init fish | source
end
