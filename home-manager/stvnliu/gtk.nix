{
  pkgs,
  config,
  ...
}: {
  gtk = {
    enable = true;
    cursorTheme = {
      package = pkgs.vanilla-dmz;
      name = "Vanilla-DMZ";
      size = 24;
    };
    font = {
      name = "Aileron";
      size = 10;
    };
    theme = {
      package = pkgs.gruvbox-gtk-theme;
      name = "Gruvbox-Dark-BL";
    };
    iconTheme = {
      package = pkgs.gruvbox-plus-icons;
      name = "Gruvbox-Plus-Dark";
    };
  };
  qt = {
    enable = true;
    platformTheme = "gtk";
    style = {
      package = pkgs.libsForQt5.breeze-qt5;
      name = "breeze";
    };
  };
  home.packages = with pkgs; [
    libsForQt5.breeze-qt5
  ];
}
