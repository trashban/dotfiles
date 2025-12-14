{ pkgs, ... }:
{
  # Misc
  programs.appimage.enable = true;

  # Compositor/bars
  programs.hyprland.enable = true;
  programs.waybar.enable = true;

  # Audio
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Mpd
  services.mpd = {
    enable = true;
    musicDirectory = "/home/ashin14/Music/";
    extraConfig = ''
      audio_output {
          type "pipewire"
          name "My PipeWire Output"
      }
    '';
  };

  # OBS
  programs.obs-studio = {
    enable = true;

    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-backgroundremoval
      obs-pipewire-audio-capture
      obs-vaapi # optional AMD hardware acceleration
      obs-gstreamer
      obs-vkcapture
    ];
  };

  # Steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };
  hardware.steam-hardware.enable = true;

  environment.systemPackages = with pkgs; [
    # hyprutils
    hyprshot
    hyprlock
    hypridle
    hyprpicker
    hyprcursor
    hyprpolkitagent

    # btw
    fastfetch
    pfetch

    # browsers
    # floorp-bin
    firefox

    # cool thingos
    rofi
    pavucontrol
    discord
    swww
    foot
    catppuccin-cursors.mochaDark
    krita
    nwg-look
    feh
    mpv
    cliphist
    wl-clipboard
    papirus-icon-theme
    glib
    rmpc
    cmus
    playerctl

    # gaming
    prismlauncher
    lunar-client

    # music
    reaper
    neural-amp-modeler-lv2
    reaper-reapack-extension
  ];
}
