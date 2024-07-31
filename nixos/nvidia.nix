{
	config,
		lib,
		...
}: {
	specialisation = {
		powersave.configuration = {
			hardware.nvidia.prime = {
				offload = {
					enable = lib.mkForce true;
					enableOffloadCmd = lib.mkForce true;
				};
				sync.enable = lib.mkForce false;
			};
		};
	};
	hardware.nvidia = {
		prime = {
			offload.enable = false;
			sync = {
				enable = true;
			};
			amdgpuBusId = "PCI:5:0:0";
			nvidiaBusId = "PCI:1:0:0";
		};
		forceFullCompositionPipeline = true;
		modesetting.enable = true;
		powerManagement.enable = false;
		powerManagement.finegrained = false;
		open = true;
		nvidiaSettings = true;
		package = config.boot.kernelPackages.nvidiaPackages.stable;
	};
}
