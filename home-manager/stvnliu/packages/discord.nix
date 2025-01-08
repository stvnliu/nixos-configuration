{ pkgs
, ...
}: {
  home.packages = with pkgs; [ discord vesktop ];
  /*xdg.desktopEntries.discord = {
    exec = "${pkgs.vesktop}/bin/vesktop";
    terminal = false;
    mimeType = [ "x-scheme-handler/discord" ];
    name = "Discord - Vesktop";
    genericName = "Discord but substituted with Vesktop";
    type = "Application";
  };*/
}
