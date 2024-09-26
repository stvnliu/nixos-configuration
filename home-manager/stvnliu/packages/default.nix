{
  pkgs,
  config,
  lib,
  ...
}: {
  imports = [
    ./util-programs.nix
    ./office-programs.nix
    ./discord.nix
  ];
}
