{ pkgs, inputs, ... }:
{
  programs.neovim = {
    enable = true;
    package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
  };
  environment.systemPackages = with pkgs; [
    ripgrep
  ];
}
