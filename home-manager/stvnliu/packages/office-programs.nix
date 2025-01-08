{ pkgs
, config
, lib
, ...
}: {
  home.packages = with pkgs; [
    libreoffice
    kdePackages.okular
  ];
}
