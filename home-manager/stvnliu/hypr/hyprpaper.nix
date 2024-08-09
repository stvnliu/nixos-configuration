{
  pkgs,
  config,
  ...
}: {
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      preload = [config.myWallPaperPathString];
      wallpaper = [",${config.myWallPaperPathString}"];
    };
  };
}
