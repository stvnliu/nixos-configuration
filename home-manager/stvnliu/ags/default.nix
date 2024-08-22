{
  pkgs,
  config,
  ...
}: {
  config = {
    home.file = {
      "${config.xdg.configHome}/ags" = {
        source = ./config;
      };
    };
    home.packages = with pkgs; [ags];
    myAutostartCommands = [
      #"${pkgs.ags}/bin/ags --init"
      "${pkgs.ags}/bin/ags"
    ];
  };
}
