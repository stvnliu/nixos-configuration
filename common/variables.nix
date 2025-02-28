{ config
, pkgs
, lib
, ...
}:
let
  monitorMaxBrightness = "255";
  monitorMinBrightness = "32";
in
{
  # Type definitions for nix variables used in this configuration
  options = with lib;
    with types; {
      usingMusicPlayerDaemon = mkOption { type = bool; };
      defaultApplications = {
        fileManager = mkOption { type = str; };
        appLauncher = mkOption { type = str; };
        terminal = mkOption { type = str; };
      };
      myWallPaperPath = mkOption { type = path; };
      myUserName = mkOption { type = str; };
      myHostName = mkOption { type = str; };
      myWallPaperPathString = mkOption { type = str; };
      myDisplayName = mkOption { type = str; };
      myEmail = mkOption { type = str; };
      displayScale = mkOption { type = int; };
      myAutostartCommands = mkOption { type = listOf str; };
      myConfigLocation = mkOption { type = str; };
      desktopFontFullName = mkOption { type = str; };
    };

  # Default values for this configuration
  config = rec {
    myUserName = "stvnliu";
    myWallPaperPath = ../home-manager/${myUserName}/assets/od_neon.png;
    myHostName = "nixos-msi";
    displayScale = 2;
    myWallPaperPathString = "/home/${myUserName}/wallpaper.png";
    myDisplayName = "Zhongheng Liu";
    myEmail = "z.liu@outlook.com.gr";
    specialisation."powersave".configuration = {
      myAutostartCommands = [ "${pkgs.brightnessctl}/bin/brightnessctl s ${monitorMinBrightness}" ];
    };
    myConfigLocation = "/home/${myUserName}/Development/Nix/nixos-configuration";
    desktopFontFullName = "JetBrainsMono Nerd Font:style=Regular";
    myAutostartCommands = [
      "${pkgs.brightnessctl}/bin/brightnessctl s ${monitorMaxBrightness}"
      "fcitx5"
      # "${pkgs.foot}/bin/foot --server -f \"${desktopFontFullName}:size=12\" -o colors.alpha=0.85"
      "${pkgs.udiskie}/bin/udiskie"
      "${pkgs.pa-notify}/bin/pa-notify"
      "${pkgs.networkmanagerapplet}/bin/nm-applet"
    ];
    defaultApplications = {
      terminal = "${pkgs.foot}/bin/footclient";
      fileManager = "${pkgs.nemo}/bin/nemo";
      appLauncher = "${pkgs.wmenu}/bin/wmenu-run -b";
    };
    usingMusicPlayerDaemon = true;
  };
}
