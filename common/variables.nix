{
  config,
  pkgs,
  lib,
  ...
}: let
  monitorMaxBrightness = "255";
  monitorMinBrightness = "32";
in {
  # Type definitions for nix variables used in this configuration
  options = with lib;
  with types; {
    myWallPaperPath = mkOption {type = path;};
    myUserName = mkOption {type = str;};
    myHostName = mkOption {type = str;};
    myWallPaperPathString = mkOption {type = str;};
    myDisplayName = mkOption {type = str;};
    myEmail = mkOption {type = str;};
    displayScale = mkOption {type = int;};
    myAutostartCommands = mkOption {type = listOf str;};
    myConfigLocation = mkOption {type = str;};
    desktopFontFullName = mkOption {type = str;};
  };

  # Default values for this configuration
  config = rec {
    myUserName = "stvnliu";
    myWallPaperPath = ../home-manager/${myUserName}/assets/road-wallpaper.jpg;
    myHostName = "nixos-msi";
    displayScale = 2;
    myWallPaperPathString = "/home/${myUserName}/wallpaper.jpg";
    myDisplayName = "Zhongheng Liu";
    myEmail = "z.liu@outlook.com.gr";
    specialisation."powersave".configuration = {
      myAutostartCommands = ["${pkgs.brightnessctl}/bin/brightnessctl s ${monitorMinBrightness}"];
    };
    myConfigLocation = "/home/${myUserName}/nix-conf";
    desktopFontFullName = "JetBrainsMono Nerd Font";
    myAutostartCommands = [
      "${pkgs.brightnessctl}/bin/brightnessctl s ${monitorMaxBrightness}"
      "fcitx5"
      # "${pkgs.foot}/bin/foot --server -f \"${desktopFontFullName}:size=12\" -o colors.alpha=0.85"
      "${pkgs.udiskie}/bin/udiskie"
      "${pkgs.pa-notify}/bin/pa-notify"
    ];
  };
}
