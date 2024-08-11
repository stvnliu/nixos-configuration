{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.myShells;
in
  with lib; {
    imports = [
      ./zsh.nix
      ./fish
      ./zoxide.nix
      ./direnv.nix
      ./starship
    ];

    options.myShells = {
      defaultShell = with types; mkOption {type = str;};
      enable = mkEnableOption "Enables the shell customisation module.";
    };
    config = {
      myShells = {
        zsh.enable = false;
        fish.enable = true;
        defaultShell = "fish";
        prompts.starship.enable = true;
      };
    };
  }
