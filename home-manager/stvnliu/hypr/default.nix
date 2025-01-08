{ pkgs
, config
, lib
, ...
}: {
  imports = [
    ./hyprland
    ./hyprpaper.nix
    ./hypridle.nix
    ./hyprlock.nix
  ];
}
