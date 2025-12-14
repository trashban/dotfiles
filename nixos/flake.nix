{
  description = "base nixos configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs = { self, nixpkgs, ... }@inputs:
  let
    # define your library that exposes scanPaths
    mylib = import ./lib;   # or path where you keep your lib (adjust!)
  in
  {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      modules = [
        {
          _module.args = {
            inherit inputs mylib;
          };
        }

        ./configuration.nix
        ./pkgs
      ];
    };
  };
}
