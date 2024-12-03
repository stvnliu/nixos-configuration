{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [foot];
  wayland.windowManager.hyprland = {
    # Whether to enable Hyprland wayland compositor
    enable = true;
    # The hyprland package to use
    package = pkgs.hyprland;
    plugins = with pkgs.hyprlandPlugins; [hyprfocus];
    # Whether to enable XWayland
    xwayland.enable = true;
    settings = {
      env = ["AQ_DRM_DEVICES, /dev/dri/card1:/dev/dri/card0"];
      xwayland = {force_zero_scaling = true;};
      monitor = [
        #"eDP-1, 1920x1080@165,0x0,1"
        "desc:Xiaomi Corporation Mi 27 NFGL 3215000032603, 1920x1080@75, 2560x0, 1"
        "desc:BOE 0x0B40,preferred, auto, ${
          builtins.toString config.displayScale
        }"
        ", preferred, auto, 1" # wildcard definition
      ];
      general = {
        border_size = 1;
        gaps_in = 2.5;
        gaps_out = 5;
        allow_tearing = true;
      };
      windowrulev2 = ["immediate, class:^(cs2)$"];
      decoration = {rounding = 5;};
      input = {
        # xset rate 250 50 replacement on wayland...
        # FAST MODE LET'S GOOO
        repeat_rate = 50;
        repeat_delay = 250;
        accel_profile = "flat";
      };
      exec-once =
        config.myAutostartCommands
        ++ [
          # future hyprland-specific exec commands
          "${config.programs.firefox.package}/bin/firefox"
          "${pkgs.thunderbird}/bin/thunderbird"
        ];
      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        font_family = "monospace";
        focus_on_activate = true; # see if fixes mako daemon not focusing
      };
      "$mod" = "SUPER";
      binde = import ./xf86_binds.nix {
        inherit config;
        inherit pkgs;
      };
      bind = import ./binds.nix {
        inherit config;
        inherit pkgs;
      };
      bindm = [
        # mouse movements
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
        "$mod ALT, mouse:272, resizewindow"
      ];
    };
    # Optional
    # Whether to enable hyprland-session.target on hyprland startup
    systemd = {enable = true;};
  };
  # ...
}
