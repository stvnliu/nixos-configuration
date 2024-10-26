{
  pkgs,
  config,
  ...
}: let
  globalOpacity = 0.8;
in {
  stylix = {
    enable = true;
    autoEnable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-material-dark-medium.yaml";
    image = config.myWallPaperPath;
    fonts = {
      sansSerif = {
        name = "Aileron";
        package = pkgs.aileron;
      };
      monospace = {
        name = config.desktopFontFullName;
        package = pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];};
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
