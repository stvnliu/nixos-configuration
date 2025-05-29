{ pkgs
, ...
}: {
  home.packages = with pkgs; [
    libreoffice
    kdePackages.okular
    evolution
    evolution-ews
    # proton mail
    protonmail-bridge
    protonmail-bridge-gui
  ];
}
