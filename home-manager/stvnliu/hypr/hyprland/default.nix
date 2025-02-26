{ inputs, config, pkgs, lib, ... }:
let
  bgbordercolor = config.lib.stylix.colors.base01;
  fgbordercolor = config.lib.stylix.colors.base02;
in
{
  home.packages =
    [ inputs.hyprland-qtutils.packages.x86_64-linux.default pkgs.foot ];
  wayland.windowManager.hyprland = {
    # Whether to enable Hyprland wayland compositor
    enable = true;
    # The hyprland package to use
    package = pkgs.hyprland;
    plugins = with pkgs.hyprlandPlugins;
      [
        hyprbars
        # hyprexpo
        # hyprfocus
        # hycov
      ];
    # Whether to enable XWayland
    xwayland.enable = true;
    settings = {
      plugins = import ./hyprbars.nix { inherit config; };
      env = [ "AQ_DRM_DEVICES, /dev/dri/card1:/dev/dri/card0" ];
      xwayland = { force_zero_scaling = true; };
      monitor = [
        #"eDP-1, 1920x1080@165,0x0,1"
        "desc:Xiaomi Corporation Mi 27 NFGL 3215000032603, 1920x1080@75, 2560x0, 1"
        "desc:BOE 0x0B40,preferred, auto, ${
          builtins.toString config.displayScale
        }"
        ", preferred, auto, 1" # wildcard definition
      ];
      general = {
        "col.inactive_border" = lib.mkForce "rgb(${bgbordercolor})";
        "col.active_border" = lib.mkForce "rgb(${fgbordercolor})";
        border_size = 1;
        gaps_in = 2.5;
        gaps_out = 5;
        allow_tearing = true;
      };
      windowrulev2 = import ./window_rules.nix;
      decoration = { rounding = 5; };
      input = {
        # xset rate 250 50 replacement on wayland...
        # FAST MODE LET'S GOOO
        repeat_rate = 50;
        repeat_delay = 250;
        accel_profile = "flat";
      };
      exec-once = config.myAutostartCommands ++ (import ./hypr_autostart.nix {
        inherit config;
        inherit pkgs;
        inherit inputs;
      });
      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        font_family = "monospace";
        focus_on_activate = true; # see if fixes mako daemon not focusing
      };
      "$mod" = "SUPER";
      binde = import ./xf86_binds.nix { inherit pkgs; };
      bind = import ./binds.nix {
        inherit config;
        inherit pkgs;
        inherit inputs;
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
    systemd = { enable = false; }; # set to false due to UWSM
  };
  # ...
}
