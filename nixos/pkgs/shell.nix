{pkgs, ...}: {
    # starship
    programs.starship.enable = true;

    # weird fishes arpeggi
    programs.fish.enable = true;
    environment.systemPackages = with pkgs; [
        fishPlugins.done
        fishPlugins.fzf-fish
        fishPlugins.forgit
        fishPlugins.hydro
        fzf
        fishPlugins.grc
        grc

        # git me
        gh
        lazygit

        # good utils
        zoxide
        bat
        lsd
        tmux
        yazi
        direnv
        p7zip
        stow
        curl
    ];
    # bootstrap bash->fish
    programs.bash = {
    interactiveShellInit = ''
        if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
        then
        shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
        exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
        fi
    '';
    };
}
