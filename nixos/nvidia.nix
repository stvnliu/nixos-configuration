{ config
, pkgs
, ...
}: {
  #specialisation = {
  #  powersave.configuration = {
  #    hardware.nvidia.prime = {
  #      offload = {
  #        enable = lib.mkForce true;
  #        enableOffloadCmd = lib.mkForce true;
  #      };
  #      sync.enable = lib.mkForce false;
  #    };
  #  };
  #};
  boot.kernelModules = [ "nvidia_uvm" ];
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      libvdpau-va-gl
    ];
  };
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    dynamicBoost.enable = true;
    prime = {
      offload.enable = false;
      sync = {
        enable = true;
      };
      amdgpuBusId = "PCI:6:0:0";
      nvidiaBusId = "PCI:1:0:0";
    };
    forceFullCompositionPipeline = true;
    powerManagement.enable = true;
    modesetting.enable = true;
    open = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.latest;
  };
}
