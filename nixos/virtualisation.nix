{ config
, ...
}: {
  virtualisation = {
    libvirtd.enable = true;
    waydroid.enable = true;
  };
  programs.virt-manager.enable = true;
  #virtualisation.vmware.host.enable = true;
  #virtualisation.virtualbox.host = {
  #  enable = true;
  #};
  users.users."${config.myUserName}".extraGroups = [ "libvirtd" ];
}
