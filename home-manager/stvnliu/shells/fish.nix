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
      myShells.fish = {
        enable = mkEnableOption "Enables fish and components.";
      };
    };
    config = mkIf cfg.enable {
      programs.fish = {
        enable = true;
        shellAliases = import ./aliases {inherit pkgs;};
        plugins = [
          #{
          #	name = "z";
          #	src = pkgs.fetchFromGitHub {
          #		owner = "jethrokuan";
          #		repo = "z";
          #		rev = "ddeb28a7b6a1f0ec6dae40c636e5ca4908ad160a";
          #		sha256 = "0c5i7sdrsp0q3vbziqzdyqn4fmp235ax4mn4zslrswvn8g3fvdyh";
          #	};
          #}
        ];
      };
    };
  }
