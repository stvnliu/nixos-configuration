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
    config = mkIf cfg.enable {
      myShells.prompts.starship.confPath = ./presets/pure-direnv.toml;
      programs.starship = {
        enable = true;
        enableZshIntegration = config.myShells.zsh.enable;
        enableFishIntegration = config.myShells.fish.enable;
        enableNushellIntegration = config.myShells.nushell.enable;
        settings = builtins.fromTOML (builtins.readFile cfg.confPath);
      };
    };
  }
