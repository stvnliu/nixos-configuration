{
  pkgs,
  config,
  ...
}: {
  services.displayManager.ly = {
    enable = true;
  };
}
