{
  pkgs,
  config,
  lib,
  ...
}: {
  programs.rofi = {
    enable = true;
  };
}
