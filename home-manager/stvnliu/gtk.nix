{
  pkgs,
  config,
  ...
}: {
  gtk = {
    enable = true;
    iconTheme = {
      package = pkgs.gruvbox-plus-icons;
      name = "Gruvbox-Plus-Dark";
    };
  };
  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style = {
      package = pkgs.libsForQt5.breeze-qt5;
      name = "breeze";
    };
  };
  home.packages = with pkgs; [
    libsForQt5.breeze-qt5
  ];
}
