{ ... }:

let
  # read all entries in this directory
  files = builtins.attrNames (builtins.readDir ./.);

  # filter only .nix files, exclude default.nix itself
  nixFiles = builtins.filter (f: f != "default.nix" && builtins.match ".*\\.nix" f != null) files;
in
{
  imports = map (f: ././${f}) nixFiles;
}

