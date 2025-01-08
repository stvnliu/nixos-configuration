{ pkgs
, ...
}: {
  gtk = {
    enable = true;
    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };
  };
  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style = { name = "Fusion"; };
  };
}
