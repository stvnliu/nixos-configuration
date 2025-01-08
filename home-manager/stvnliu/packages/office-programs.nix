{ pkgs
, ...
}: {
  home.packages = with pkgs; [
    libreoffice
    kdePackages.okular
  ];
}
