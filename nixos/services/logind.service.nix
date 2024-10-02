{
  pkgs,
  config,
  lib,
  ...
}: {
  services.logind.extraConfig = ''
    # don't shutdown in short press
    HandlePowerKey=ignore
    IdleAction=suspend

    # Milliseconds
    IdleActionSec=600
  '';
}
