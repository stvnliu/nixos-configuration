{
  pkgs,
  lib,
  config,
  ...
}: {
  wayland.windowManager.sway = {
    enable = true;
    config = rec {
      modifier = "Mod4";
      terminal = "${pkgs.foot}/bin/foot -f '${config.desktopFontFullName}:size=24' zsh";
    };
  };
}
