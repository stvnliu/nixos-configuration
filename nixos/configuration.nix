# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{
	inputs,
		lib,
		config,
		pkgs,
		...
}: 
let
myHostName = "homelab-nix";
stevenUserName = "stvnliu";
in
{
	imports = [
#inputs.hardware.nixosModules.common-cpu-amd
#inputs.hardware.nixosModules.common-ssd
		./hardware-configuration.nix
		./services/display-manager.nix
	];
	boot.loader = {
		efi.canTouchEfiVariables = true;
		grub = {
			enable = true;
			useOSProber = true;
			efiSupport = true;
			fsIdentifier = "label";
			devices = [ "nodev" ];
			extraEntries = ''
				menuentry "Reboot" {
					reboot
				}
			menuentry "Poweroff" {
				halt
			}
			'';
		};
	};
	nixpkgs = {
		overlays = [
		];
		config = {
			allowUnfree = true;
		};
	};

	nix = let
		flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
	in {
		settings = {
			experimental-features = "nix-command flakes";
			flake-registry = "";
			nix-path = config.nix.nixPath;
		};
		registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;
		nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
	};
	networking = {
		hostName = "${myHostName}";
		networkmanager.enable = true;
	};
	users.users = {
		"${stevenUserName}" = {
			initialPassword = "stevenpassword";
			isNormalUser = true;
			openssh.authorizedKeys.keys = [
			];
			packages = with pkgs; [
				nh
					neovim
					gitFull
			];
			extraGroups = ["wheel"];
		};
	};
	services.openssh = {
		enable = true;
		settings = {
			PermitRootLogin = "no";
			PasswordAuthentication = false;
		};
	};
# https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
	system.stateVersion = "24.05";
}
