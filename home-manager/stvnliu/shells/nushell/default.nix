{ pkgs
, config
, lib
, ...
}:
let
  cfg = config.myShells.nushell;
in
with lib; {
  options = {
    myShells.nushell = { enable = mkEnableOption "Enables nushell config"; };
  };
  config = mkIf cfg.enable {
    programs = {
      nushell = {
        enable = true;
        configFile.source = ./init/config.nu;
        shellAliases = import ../aliases/default.nix { inherit pkgs; };
      };
      carapace = {
        enable = true;
        enableNushellIntegration = true;
      };
    };
  };
}
