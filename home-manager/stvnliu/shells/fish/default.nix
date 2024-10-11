{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.myShells.fish;
in
  with lib; {
    options = {
      myShells.fish = {enable = mkEnableOption "Enables fish and components.";};
    };
    config = mkIf cfg.enable {
      programs.fish = {
        enable = true;
        shellInit = ''
          ${builtins.readFile ./init/zoxide.fish}
          ${builtins.readFile ./init/nh.fish}
          ${builtins.readFile ./init/tailscale.fish}
          ${builtins.readFile ./init/pass.fish}
          function fish_greeting
            ${pkgs.fortune}/bin/fortune -a
          end
          funcsave -q fish_greeting
        '';
        shellAliases = import ../aliases {inherit pkgs;};
        plugins = with pkgs.fishPlugins; [
          {
            name = "z";
            src = z.src;
          }
          {
            name = "plugin-git";
            src = plugin-git.src;
          }
          {
            name = "transient-fish";
            src = transient-fish.src;
          }
          {
            name = "done";
            src = done.src;
          }
          {
            name = "gruvbox";
            src = gruvbox.src;
          }
          {
            name = "colored-man-pages";
            src = colored-man-pages.src;
          }
          {
            name = "puffer";
            src = puffer.src;
          }
          {
            name = "pisces";
            src = pisces.src;
          }
        ];
      };
    };
  }
