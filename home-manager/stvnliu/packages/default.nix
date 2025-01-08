{ pkgs
, config
, lib
, ...
}: {
  imports = [
    ./util-programs.nix
    ./office-programs.nix
    ./discord.nix
    ./wayland-utils.nix
    ./pentesting.nix
    ./dev.nix
    ./gaming.nix
  ];
}
