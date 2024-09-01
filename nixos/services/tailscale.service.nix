{
  pkgs,
  config,
  ...
}: {
  services.tailscale = {
    enable = true;
    useRoutingFeatures = "client";
  };
}
