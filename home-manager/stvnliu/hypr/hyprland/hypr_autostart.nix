{ config, pkgs, inputs }:
let
  term = config.defaultApplications.terminal;
  shell = config.myShells.defaultShell;
in
[
  "${term} --title=autorun ${shell}"
  "${pkgs.mpris-notifier}/bin/mpris-notifier"
  "${pkgs.mpd-discord-rpc}/bin/mpd-discord-rpc"
  "${pkgs.easyeffects}/bin/easyeffects --gapplication-service"
  "${inputs.hyprswitch.packages.x86_64-linux.default}/bin/hyprswitch init --show-title --size-factor 5.5 --workspaces-per-row 5"
]
