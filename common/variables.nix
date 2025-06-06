{ config, pkgs, lib, ... }:
let
  monitorMaxBrightness = "255";
  # monitorMinBrightness = "32";
  stylixBG = config.lib.stylix.colors.base00;
  stylixFG = config.lib.stylix.colors.base07;
  stylixPrimaryBG = config.lib.stylix.colors.base12;
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
      desktopFont = {
        shortName = mkOption { type = str; };
        fullName = mkOption { type = str; };
        package = mkOption { type = package; };
      };
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
    /* specialisation."powersave".configuration = {
         myAutostartCommands =
           [ "${pkgs.brightnessctl}/bin/brightnessctl s ${monitorMinBrightness}" ];
       };
    */
    myConfigLocation =
      "/home/${myUserName}/Development/Nix/nixos-configuration";
    desktopFont = {
      shortName = "0xProto Nerd Font";
      fullName = "${desktopFont.shortName}:style=Regular";
      package = pkgs.nerd-fonts._0xproto;
    };
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
      appLauncher = ''
        ${pkgs.wmenu}/bin/wmenu-run -p "Launch a program..." -N ${stylixBG} -n ${stylixFG} -S ${stylixPrimaryBG}'';
    };
    usingMusicPlayerDaemon = true;
  };
}
