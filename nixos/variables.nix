{
  config,
  pkgs,
  lib,
  ...
}: {
  # Type definitions for nix variables used in this configuration
  options = with lib;
  with types; {
    myUserName = mkOption {type = str;};
    myHostName = mkOption {type = str;};
  };

  # Default values for this configuration
  config = {
    myUserName = "stvnliu";
    myHostName = "homelab-nix";
  };
}
