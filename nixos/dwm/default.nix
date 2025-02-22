{ pkgs, }: {
  #options = {
  #dwm.enable = lib.mkEnableOption "Enables dwm.";
  #};
  environment.systemPackages = with pkgs; [ st dmenu slstatus pamixer ];
  programs.dconf.enable = true;
  services.xserver = {
    enable = true;
    windowManager = {
      dwm = {
        enable = true;
        package = pkgs.dwm.override {
          patches = [
            ./patches/config-20240325.diff
            ./patches/dwm-flextile-20210722-138b405.diff
            ./patches/dwm-systray-6.4.diff
          ];
        };
      };
    };
  };
}
