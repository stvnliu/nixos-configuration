{
  lib,
  pkgs,
  config,
  ...
}: let
  cfg = config.myShells.prompts.starship;
in
  with lib; {
    options = {
      myShells.prompts.starship.enable = mkEnableOption "Enables starship prompts.";
      myShells.prompts.starship.confPath = mkOption {
        type = types.path;
        default = ./presets/default.toml;
      };
    };
    config = {
      programs.starship = {
        enable = true;
        enableZshIntegration = true;
        settings = builtins.fromTOML (builtins.readFile cfg.confPath);
      };
    };
  }
