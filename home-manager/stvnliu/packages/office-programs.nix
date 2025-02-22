{ pkgs
, ...
}: {
  home.packages = with pkgs; [
    libreoffice
    kdePackages.okular
    # proton mail
    protonmail-bridge
    protonmail-bridge-gui
  ];
}
