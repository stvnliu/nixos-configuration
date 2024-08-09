{pkgs, config, lib, ...}:
{
	imports = [
		./hyprland.nix
		./hyprpaper.nix
		./hypridle.nix
		./hyprlock.nix
	];
}
