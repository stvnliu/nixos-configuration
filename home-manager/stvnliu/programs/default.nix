{
  pkgs,
  config,
  lib,
  ...
}: {
  imports = [
    ./git.nix
    ./rofi.nix
    ./tmux.nix
  ];
}
