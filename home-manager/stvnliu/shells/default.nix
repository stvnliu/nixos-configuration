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
      ./direnv.nix
      ./starship
    ];
    options.myShells = {
      enable = mkEnableOption "Enables the shell customisation module.";
      useZsh = mkOption {
        type = types.bool;
        default = true;
      };
    };
    config = mkIf cfg.enable {
      myShells = {
        zsh.enable = cfg.useZsh;
        prompts.starship.enable = true;
      };
    };
  }
