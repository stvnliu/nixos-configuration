{pkgs, ...}:
let
	timeoutSeconds = 60;
in
{
	services.hypridle = {
		enable = true;
		settings = {
			general = {
				after_sleep_cmd = "hyprctl dispatch dpms on";
				ignore_dbus_inhibit = false;
				lock_cmd = "hyprlock";
			};
			listener = [
				{
					timeout = timeoutSeconds;
					on-timeout = "hyprlock";
				}
			];
		};
	};
}
