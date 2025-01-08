{ pkgs, config }:
let
  term = config.defaultApplications.terminal;
  shell = config.myShells.defaultShell;
in
[
  "${term} --title=autorun ${shell}"
]
