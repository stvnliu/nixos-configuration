{
  pkgs,
  config,
  lib,
  ...
}: {
  services = {
    syncthing = {
      enable = true;
      user = "${config.myUserName}";
      dataDir = "/home/${config.myUserName}/.config/syncthing";
      configDir = "/home/${config.myUserName}/.config/syncthing";
    };
  };
  networking.firewall.allowedTCPPorts = [8384 22000];
  networking.firewall.allowedUDPPorts = [22000 21027];
}
