{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.shell.zsh;
in
  with lib; {
    options.myShells.zsh = {
      enable = mkEnableOption "Enables zsh and components.";
    };
    config = {
      programs.zsh = {
        enable = true;
        syntaxHighlighting.enable = true;
        shellAliases = import ./aliases {inherit pkgs;};
        dirHashes = {
          docs = "$HOME/Documents";
          dl = "$HOME/Downloads";
          dev = "$HOME/devel";
          screen = "$HOME/Pictures/Screenshots";
        };
        oh-my-zsh = {
          enable = true;
          plugins = [
            "git"
            "rsync"
            "zoxide"
          ];
          theme = "agnoster";
        };
      };
      home.packages = with pkgs; [zoxide];
    };
  }
