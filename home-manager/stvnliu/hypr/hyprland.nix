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
    plugins = with pkgs.hyprlandPlugins; [
      hyprfocus
      csgo-vulkan-fix
    ];
    # Whether to enable XWayland
    xwayland.enable = true;
    settings = {
      xwayland = {force_zero_scaling = true;};
      monitor = [
        #"eDP-1, 1920x1080@165,0x0,1"
        ",preferred, auto, ${builtins.toString config.displayScale}"
      ];
      input = {
        # xset rate 250 50 replacement on wayland...
        # FAST MODE LET'S GOOO
        repeat_rate = 50;
        repeat_delay = 250;
      };
      exec-once =
        config.myAutostartCommands
        ++ [
          "[workspace special silent] ${pkgs.foot}/bin/foot -f 'BlexMono Nerd Font:size=12' -o colors.alpha=0.85 ${config.myShells.defaultShell}"
        ];
      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        font_family = "monospace";
      };
      "$mod" = "SUPER";
      binde = [
        ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%+"

        # Example volume button that will activate even while an input inhibitor is active
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ];
      bind = let
        terminalCmd = "${pkgs.foot}/bin/foot -f 'BlexMono Nerd Font:size=12' -o colors.alpha=0.85 ${config.myShells.defaultShell}";
        screenshotLocation = "/home/${config.myUserName}/Screenshots/$(date '+%Y-%m-%d-%H-%M-%S').png";
      in
        [
          "$mod SHIFT, L, exec, ${pkgs.hyprlock}/bin/hyprlock --immediate"

          "$mod SHIFT, Print, exec, ${pkgs.grimblast}/bin/grimblast copysave output ${screenshotLocation}"
          ", Print, exec, ${pkgs.grimblast}/bin/grimblast copysave area ${screenshotLocation}"
          "$mod, Print, exec, ${pkgs.grimblast}/bin/grimblast copy area"

          # special workspace keybinds
          "$mod, S, togglespecialworkspace"
          "$mod SHIFT, S, movetoworkspace, special"

          # keysyms for util functions
          # Example volume button that allows press and hold, volume limited to 150%
          "$mod, Q, killactive"
          "$mod, D, exec, ${pkgs.fuzzel}/bin/fuzzel"
          # firefox quickstart
          "$mod, F, exec, ${pkgs.firefox}/bin/firefox"
          "$mod, E, exec, ${pkgs.pcmanfm}/bin/pcmanfm"
          # foot terminal
          "$mod, Return, exec, ${terminalCmd}"
          "$mod SHIFT, Return, exec, [float] ${terminalCmd}"

          # vimkeys navigation
          "$mod, H, movefocus, l"
          "$mod, J, movefocus, d"
          "$mod, K, movefocus, u"
          "$mod, L, movefocus, r"
        ]
        ++ (
          # workspaces
          # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
          builtins.concatLists (builtins.genList (x: let
              ws = let c = (x + 1) / 10; in builtins.toString (x + 1 - (c * 10));
            in [
              "$mod, ${ws}, workspace, ${toString (x + 1)}"
              "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
            ])
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
    systemd = {enable = true;};
  };
  # ...
}
