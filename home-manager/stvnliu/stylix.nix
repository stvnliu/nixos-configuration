{ pkgs
, config
, ...
}:
let
  globalOpacity = 0.75;
in
{
  stylix = {
    enable = true;
    autoEnable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/onedark-dark.yaml";
    image = config.myWallPaperPath;
    fonts = {
      /*sansSerif = {
        name = "Helvetica Neue LT Std";
        package = pkgs.helvetica-neue-lt-std;
      };*/
      monospace = {
        name = config.desktopFont.fullName;
        package = config.desktopFont.package;
      };
      sizes = {
        terminal = 16;
        applications = 12;
      };
    };
    opacity = {
      applications = globalOpacity;
      desktop = globalOpacity;
      popups = globalOpacity;
      terminal = globalOpacity;
    };
  };
}
