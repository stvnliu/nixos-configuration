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
      ./nushell
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
        #nushell.enable = true;
        defaultShell = "${config.programs.fish.package}/bin/fish";
        prompts.starship.enable = true;
      };
    };
  }
