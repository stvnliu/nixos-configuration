{pkgs, lib, ...}:
{
	wayland.windowManager.sway = {
		enable = true;
		config = rec {
			modifier = "Mod4";
			terminal = "${pkgs.foot}/bin/foot -f 'BlexMono Nerd Font:size=24' zsh";
		};
	};
}
