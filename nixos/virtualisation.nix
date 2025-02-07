{ config
, pkgs
, ...
}: {
  virtualisation = {
    libvirtd.enable = true;
    waydroid.enable = true;
    podman = {
      enable = true;
      dockerCompat = true;
    };
  };
  environment.systemPackages = [ pkgs.distrobox pkgs.distrobox-tui ];
  programs.virt-manager.enable = true;
  #virtualisation.vmware.host.enable = true;
  #virtualisation.virtualbox.host = {
  #  enable = true;
  #};
  users.users."${config.myUserName}".extraGroups = [ "libvirtd" ];
}
