{
  tmconfig,
  pkgs,
  lib,
  ...
}: {
  # Type definitions for nix variables used in this configuration
  options = with lib;
  with types; {
    myUserName = mkOption {type = str;};
    myHostName = mkOption {type = str;};
    myWallPaperPathString = mkOption {type = str;};
    myDisplayName = mkOption {type = str;};
    myEmail = mkOption {type = str;};
    displayScale = mkOption {type = int;};
  };

  # Default values for this configuration
  config = rec {
    myUserName = "stvnliu";
    myHostName = "homelab-nix";
    displayScale = 2;
    myWallPaperPathString = "/home/${myUserName}/wallpaper.png";
    myDisplayName = "Zhongheng Liu";
    myEmail = "z.liu@outlook.com.gr";
  };
}
