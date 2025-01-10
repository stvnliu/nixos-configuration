{ config, pkgs }:
let
  term = config.defaultApplications.terminal;
  shell = config.myShells.defaultShell;
in
[
  "${term} --title=autorun ${shell}"
  "${pkgs.mpris-notifier}/bin/mpris-notifier"
  "${pkgs.mpd-discord-rpc}/bin/mpd-discord-rpc"
]
