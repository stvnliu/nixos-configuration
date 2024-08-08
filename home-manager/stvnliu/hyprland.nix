{config, pkgs, ... }: 
{
	home.packages = with pkgs; [
		foot
	];
	wayland.windowManager.hyprland = {
# Whether to enable Hyprland wayland compositor
		enable = true;
# The hyprland package to use
		package = pkgs.hyprland;
		plugins = with pkgs.hyprlandPlugins; [
			hyprbars
			hyprfocus
			csgo-vulkan-fix
		];
# Whether to enable XWayland
		xwayland.enable = true;
		settings = {
			"$mod" = "SUPER";
			bind = [
				"$mod, D, exec, ${pkgs.fuzzel}/bin/fuzzel"
# firefox quickstart
					"$mod, F, exec, ${pkgs.firefox}/bin/firefox"
# foot terminal
					"$mod, Return, exec, ${pkgs.foot}/bin/foot -f 'BlexMono Nerd Font:size=16' zsh"
			] ++ (
# workspaces
# binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
					builtins.concatLists (builtins.genList (
							x: let
							ws = let
							c = (x + 1) / 10;
							in
							builtins.toString (x + 1 - (c * 10));
							in [
							"$mod, ${ws}, workspace, ${toString (x + 1)}"
							"$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
							]
							)
						10)
				   );
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
