{pkgs, config, lib, ...}:
{
	options = with lib; with types; {
		myWallPaperPathString = { type = str; };
		myUserName = { type = str; };
		myDisplayName = { type = str; };
		myEmail = { type = str; };
	};
	config = rec {
		myUserName = "stvnliu";
		myWallPaperPathString = "/home/${config.myUserName}/wallpaper.png";
		myDisplayName = "Zhongheng Liu";
		myEmail = "z.liu@outlook.com.gr";
	};
}
