{
  pkgs,
  config,
  lib,
  ...
}: {
  services.seatd = {
    enable = true;
  };
}
