{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji

    font-awesome
    nerd-fonts.jetbrains-mono
    iosevka
    ibm-plex
  ];
}

