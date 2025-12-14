{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # c/c++
    gcc
    cmake
    clang-tools
    gnumake

    # lua
    lua
    lua-language-server

    # go
    go
    gopls

    # rust
    rustup
    rust-analyzer

    # zig
    zig
    zls

    # nix
    nil
  ];
}
