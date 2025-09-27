{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "luna"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  time.timeZone = "Australia/Sydney";
  i18n.defaultLocale = "en_AU.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_AU.UTF-8";
    LC_IDENTIFICATION = "en_AU.UTF-8";
    LC_MEASUREMENT = "en_AU.UTF-8";
    LC_MONETARY = "en_AU.UTF-8";
    LC_NAME = "en_AU.UTF-8";
    LC_NUMERIC = "en_AU.UTF-8";
    LC_PAPER = "en_AU.UTF-8";
    LC_TELEPHONE = "en_AU.UTF-8";
    LC_TIME = "en_AU.UTF-8";
  };

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ashin14 = {
    isNormalUser = true;
    description = "Amberveer Shinmarh";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
        shell = pkgs.fish;
  };

  nixpkgs.config.allowUnfree = true;

  # enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
     git
     vim
     wget
     bash
     firefox
     kitty
     rofi
     neovim
     stow
     gh
     pavucontrol
     starship
     fastfetch
     discord
     yazi
     zoxide
     swww
     xdg-user-dirs
     glib
     gcc
     clang-tools
     zig
     zls
     adwaita-qt
     procps
     pfetch
     lsd
     bat
     jp2a
     cliphist
     swaynotificationcenter 
     hyprshot
     zellij
     wl-clipboard
     fd
     ripgrep
     nwg-look
     papirus-icon-theme
     pipewire
  ];

  security.rtkit.enable = true;
  services.pipewire = {
     enable = true;
     alsa.enable = true;
     alsa.support32Bit = true;
     pulse.enable = true;
  };

  programs.steam = {
     enable = true;
     remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
     dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
     localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };

  programs.waybar.enable = true;

  programs.hyprland = {
     enable = true;
     xwayland.enable = true;
     # withUWSM = true;
  };

  xdg.portal = {
     enable = true;
     extraPortals = with pkgs; [ xdg-desktop-portal-hyprland ];
  };

  programs.fish.enable = true;

  # set default editor to neovim
  programs.neovim.defaultEditor = true;
  environment.variables.EDITOR = "nvim";

  fonts.packages = with pkgs; [
     noto-fonts
     noto-fonts-cjk-sans
     noto-fonts-emoji
     
     nerd-fonts.blex-mono
     nerd-fonts.fira-code
  ];


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
