{
  config,
  pkgs,
}: let
  terminalCmd = "${pkgs.foot}/bin/foot -f '${config.desktopFontFullName}:size=16' -o colors.alpha=0.80";
  screenshotLocation = "/home/${config.myUserName}/Screenshots/$(date '+%Y-%m-%d-%H-%M-%S').png";
in
  [
    "$mod SHIFT, L, exec, ${pkgs.wlogout}/bin/wlogout"

    "$mod SHIFT, Print, exec, ${pkgs.grimblast}/bin/grimblast copysave output ${screenshotLocation}"
    ", Print, exec, ${pkgs.grimblast}/bin/grimblast copysave area ${screenshotLocation}"
    "$mod, Print, exec, ${pkgs.grimblast}/bin/grimblast copy area"

    # special workspace keybinds
    "$mod, S, togglespecialworkspace"
    "$mod SHIFT, S, movetoworkspace, special"

    # keysyms for util functions
    # Example volume button that allows press and hold, volume limited to 150%
    "$mod, Q, killactive"
    "$mod, D, exec, ${pkgs.rofi}/bin/rofi -show drun"
    "$mod, F, fullscreen"
    "$mod, E, exec, ${pkgs.pcmanfm}/bin/pcmanfm"
    # foot terminal
    "$mod, Return, exec, ${terminalCmd} ${config.myShells.defaultShell}"
    "$mod SHIFT, Return, exec, [float] ${terminalCmd} ${config.myShells.defaultShell}"

    # cmdline utilities
    "$mod, N, exec, [float] ${terminalCmd} ${pkgs.networkmanager}/bin/nmtui"
    "$mod, M, exec, [float] ${terminalCmd} ${pkgs.zenith}/bin/zenith"

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
  )
