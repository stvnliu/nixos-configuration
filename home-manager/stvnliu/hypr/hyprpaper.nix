{ config
, ...
}: {
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      preload = [ config.myWallPaperPathString ];
      wallpaper = [ ",${config.myWallPaperPathString}" ];
      #preload = [/home/stvnliu/Downloads/mao-zedong.jpg];
      #wallpaper = [",/home/stvnliu/Downloads/mao-zedong.jpg"];
    };
  };
}
