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
    style = {name = "Fusion";};
  };
  home.packages = with pkgs; [libsForQt5.breeze-qt5];
}
