{pkgs, ...}: {
  stylix = {
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
    stylix.image = ../home-manager/stvnliu/assets/gruvbox-wallpaper.png;
  };
}
