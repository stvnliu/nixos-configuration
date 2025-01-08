{ pkgs, ... }: {
  home.packages = with pkgs; [ vscodium-fhs ];
  xdg.desktopEntries.codium = { };
}
