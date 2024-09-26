{
  pkgs,
  config,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    libreoffice-fresh
    kdePackages.okular
  ];
}
