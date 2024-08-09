{pkgs, config, lib, ...}:
{
	options = with lib; with types; {
		myWallPaperPathString = mkOption { type = str; };
		myUserName = mkOption { type = str; };
		myDisplayName = mkOption { type = str; };
		myEmail = mkOption { type = str; };
	};
	config = rec {
		myUserName = "stvnliu";
		myWallPaperPathString = "/home/${config.myUserName}/wallpaper.png";
		myDisplayName = "Zhongheng Liu";
		myEmail = "z.liu@outlook.com.gr";
	};
}
