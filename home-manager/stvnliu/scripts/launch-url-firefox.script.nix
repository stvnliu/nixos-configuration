{ pkgs, }:
let
  # browserPath = lib.getExe config.programs.firefox.package;
  # dmenuPath = lib.getExe pkgs.wmenu;
in
pkgs.writeShellScriptBin "urlmenu" ''
  #!${pkgs.bash}/bin/bash
''
