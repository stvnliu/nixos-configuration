{ pkgs, lib, ... }:
{
	programs.sway = {
		enable = true;
		wrapperFeatures.gtk = true;
	};
	services.displayManager = {
		enable = true;
		execCmd = "${pkgs.lemurs}/bin/lemurs --no-logs";
	};
}
