{config, pkgs, ... }: 
{
	wayland.windowManager.hyprland = {
# Whether to enable Hyprland wayland compositor
		enable = true;
# The hyprland package to use
		package = pkgs.hyprland;
# Whether to enable XWayland
		xwayland.enable = true;
		settings = {
			"$mod" = "SUPER";
			bind = [
				# foot terminal
				"$mod, ENTER, exec, ${pkgs.foot}/bin/foot -f 'BlexMono Nerd Font:size=24' zsh"
			];
			bindm = [
				# mouse movements
				"$mod, mouse:272, movewindow"
				"$mod, mouse:273, resizewindow"
				"$mod ALT, mouse:272, resizewindow"
			];
		};
# Optional
# Whether to enable hyprland-session.target on hyprland startup
		systemd.enable = true;
	};
# ...
}
