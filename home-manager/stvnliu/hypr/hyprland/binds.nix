{ config
, pkgs
, ...
}:
let
  terminalCmd = config.defaultApplications.terminal;
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

  "$mod, Tab, hyprexpo:expo, toggle"

  # keysyms for util functions
  # Example volume button that allows press and hold, volume limited to 150%
  "$mod, Q, killactive"
  "$mod, D, exec, ${config.defaultApplications.appLauncher}"
  "$mod, F, fullscreen"
  "$mod, E, exec, ${config.defaultApplications.fileManager}"
  # foot terminal
  "$mod, Return, exec, ${terminalCmd} ${config.myShells.defaultShell}"
  "$mod SHIFT, Return, exec, ${terminalCmd} --title=floats ${config.myShells.defaultShell}"

  # cmdline utilities
  /*
    NOTE Replaced by network manager applet
     nmtui interface is no longer needed
    TODO Fix floating window rule
    */
  # "$mod, N, exec, [float] ${terminalCmd} ${pkgs.networkmanager}/bin/nmtui"
  #"$mod, M, exec, [float] ${terminalCmd} ${pkgs.zenith}/bin/zenith"

  # vimkeys navigation
  "$mod, H, movefocus, l"
  "$mod, J, movefocus, d"
  "$mod, K, movefocus, u"
  "$mod, L, movefocus, r"
]
++ (
  if config.services.mpd.enable then [ "$mod, M, exec, ${terminalCmd} --title=ncmpc ${pkgs.ncmpcpp}/bin/ncmpcpp" ] else [ ]
)
++ (
  if config.services.swaync.enable
  then [ "$mod, N, exec, ${pkgs.swaynotificationcenter}/bin/swaync-client -t" ]
  else [ ]
)
++ (
  # workspaces
  # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
  builtins.concatLists (builtins.genList
    (x:
      let
        ws = let c = (x + 1) / 10; in builtins.toString (x + 1 - (c * 10));
      in
      [
        "$mod, ${ws}, workspace, ${toString (x + 1)}"
        "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
      ]) 10)
  # workspaces
  # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
  /*
     builtins.concatLists (builtins.genList (x:
    let ws = let c = (x + 1) / 10; in builtins.toString (x + 1 - (c * 10));
    in [
      "$mod M, ${ws}, workspace, ${toString (x + 10 + 1)}"
      "$mod SHIFT M, ${ws}, movetoworkspace, ${toString (x + 10 + 1)}"
    ]) 10)
    */
)
