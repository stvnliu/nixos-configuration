{ ... }: {
  #specialisation.powersave.configuration = {
  #  services.auto-cpufreq.enable = true;
  #};
  services = {
    upower.enable = true;
    udisks2.enable = true;
    #picom.enable = true;
    #blueman.enable = true;
    #gnome.gnome-keyring.enable = true;
    #openssh.enable = true;
  };
}
