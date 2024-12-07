{
  pkgs,
  config,
  ...
}: let
  globalOpacity = 0.75;
in {
  stylix = {
    enable = true;
    autoEnable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/nord.yaml";
    image = config.myWallPaperPath;
    fonts = {
      sansSerif = {
        name = "Aileron";
        package = pkgs.aileron;
      };
      monospace = {
        name = config.desktopFontFullName;
        package = pkgs.nerd-fonts.jetbrains-mono;
      };
      sizes = {
        terminal = 24;
        applications = 16;
      };
    };
    cursor.size = 24;
    opacity = {
      applications = globalOpacity;
      desktop = globalOpacity;
      popups = globalOpacity;
      terminal = globalOpacity;
    };
  };
}
