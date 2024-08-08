# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{
	inputs,
		lib,
		config,
		pkgs,
		...
}: 
{
	imports = [
		./variables.nix
		#./greetd-sway.nix
		./nvidia.nix
		./fonts.nix
		./services/nginx.service.nix
		./hardware-configuration.nix
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
	services.displayManager.sddm = {
		enable = true;
		wayland.enable = true;
	};
	#systemd.user.services.kanshi = {
	#	description = "kanshi daemon";
	#	serviceConfig = {
	#		Type = "simple";
	#		ExecStart = ''${pkgs.kanshi}/bin/kanshi -c kanshi_config_file'';
	#	};
	#};

	security.polkit.enable = true;
	services.gnome.gnome-keyring.enable = true;
	#programs.sway = {
	#	enable = true;
	#	wrapperFeatures.gtk = true;
	#};
	programs.hyprland.enable = true; # enables Hyprland DM.
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
		channel.enable = false;
		registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;
		nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
	};
	networking = {
		hostName = "${config.myHostName}";
		networkmanager.enable = true;
	};
	users.users = {
		"${config.myUserName}" = {
			initialPassword = "stevenpassword";
			isNormalUser = true;
			openssh.authorizedKeys.keys = [
			];
			packages = with pkgs; [
					nh
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
	services.automatic-timezoned.enable = true;
# https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
	system.stateVersion = "24.05";
}
