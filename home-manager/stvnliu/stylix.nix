{pkgs, ...}: {
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
    image = ./assets/gruvbox-wallpaper.png;
    fonts = {
      sansSerif = {
        name = "Aileron";
        package = pkgs.aileron;
      };
      monospace = {
        name = "BlexMono Nerd Font";
        package = pkgs.nerdfonts.override {fonts = ["IBMPlexMono"];};
      };
    };
  };
}
