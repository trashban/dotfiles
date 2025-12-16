alias ls lsd
alias lst "lsd --tree"
alias en "nvim /etc/nixos/configuration.nix"
alias nrs "sudo nixos-rebuild switch"
alias cd z
set -x PATH "$HOME/.local/bin:$PATH"
set -x SUDO_EDITOR "nvim"
set -gx EDITOR nvim
